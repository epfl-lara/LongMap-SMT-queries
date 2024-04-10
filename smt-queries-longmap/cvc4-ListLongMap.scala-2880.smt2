; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41404 () Bool)

(assert start!41404)

(declare-fun b!462715 () Bool)

(declare-fun e!270072 () Bool)

(declare-fun tp_is_empty!12521 () Bool)

(assert (=> b!462715 (= e!270072 tp_is_empty!12521)))

(declare-fun b!462716 () Bool)

(declare-fun res!276708 () Bool)

(declare-fun e!270069 () Bool)

(assert (=> b!462716 (=> (not res!276708) (not e!270069))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!28841 0))(
  ( (array!28842 (arr!13854 (Array (_ BitVec 32) (_ BitVec 64))) (size!14206 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28841)

(declare-datatypes ((V!17799 0))(
  ( (V!17800 (val!6305 Int)) )
))
(declare-datatypes ((ValueCell!5917 0))(
  ( (ValueCellFull!5917 (v!8592 V!17799)) (EmptyCell!5917) )
))
(declare-datatypes ((array!28843 0))(
  ( (array!28844 (arr!13855 (Array (_ BitVec 32) ValueCell!5917)) (size!14207 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28843)

(assert (=> b!462716 (= res!276708 (and (= (size!14207 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14206 _keys!1025) (size!14207 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!462717 () Bool)

(declare-fun res!276710 () Bool)

(assert (=> b!462717 (=> (not res!276710) (not e!270069))))

(declare-datatypes ((List!8352 0))(
  ( (Nil!8349) (Cons!8348 (h!9204 (_ BitVec 64)) (t!14296 List!8352)) )
))
(declare-fun arrayNoDuplicates!0 (array!28841 (_ BitVec 32) List!8352) Bool)

(assert (=> b!462717 (= res!276710 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8349))))

(declare-fun b!462718 () Bool)

(assert (=> b!462718 (= e!270069 (bvsgt #b00000000000000000000000000000000 (size!14206 _keys!1025)))))

(declare-fun res!276707 () Bool)

(assert (=> start!41404 (=> (not res!276707) (not e!270069))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41404 (= res!276707 (validMask!0 mask!1365))))

(assert (=> start!41404 e!270069))

(assert (=> start!41404 true))

(declare-fun array_inv!10018 (array!28841) Bool)

(assert (=> start!41404 (array_inv!10018 _keys!1025)))

(declare-fun e!270071 () Bool)

(declare-fun array_inv!10019 (array!28843) Bool)

(assert (=> start!41404 (and (array_inv!10019 _values!833) e!270071)))

(declare-fun mapNonEmpty!20452 () Bool)

(declare-fun mapRes!20452 () Bool)

(declare-fun tp!39271 () Bool)

(assert (=> mapNonEmpty!20452 (= mapRes!20452 (and tp!39271 e!270072))))

(declare-fun mapKey!20452 () (_ BitVec 32))

(declare-fun mapRest!20452 () (Array (_ BitVec 32) ValueCell!5917))

(declare-fun mapValue!20452 () ValueCell!5917)

(assert (=> mapNonEmpty!20452 (= (arr!13855 _values!833) (store mapRest!20452 mapKey!20452 mapValue!20452))))

(declare-fun mapIsEmpty!20452 () Bool)

(assert (=> mapIsEmpty!20452 mapRes!20452))

(declare-fun b!462719 () Bool)

(declare-fun e!270068 () Bool)

(assert (=> b!462719 (= e!270068 tp_is_empty!12521)))

(declare-fun b!462720 () Bool)

(assert (=> b!462720 (= e!270071 (and e!270068 mapRes!20452))))

(declare-fun condMapEmpty!20452 () Bool)

(declare-fun mapDefault!20452 () ValueCell!5917)

