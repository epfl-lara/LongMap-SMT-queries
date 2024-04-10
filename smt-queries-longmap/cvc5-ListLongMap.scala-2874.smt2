; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41364 () Bool)

(assert start!41364)

(declare-fun b!462347 () Bool)

(declare-fun e!269772 () Bool)

(declare-fun tp_is_empty!12481 () Bool)

(assert (=> b!462347 (= e!269772 tp_is_empty!12481)))

(declare-fun b!462348 () Bool)

(declare-fun res!276519 () Bool)

(declare-fun e!269769 () Bool)

(assert (=> b!462348 (=> (not res!276519) (not e!269769))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!28763 0))(
  ( (array!28764 (arr!13815 (Array (_ BitVec 32) (_ BitVec 64))) (size!14167 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28763)

(declare-datatypes ((V!17747 0))(
  ( (V!17748 (val!6285 Int)) )
))
(declare-datatypes ((ValueCell!5897 0))(
  ( (ValueCellFull!5897 (v!8572 V!17747)) (EmptyCell!5897) )
))
(declare-datatypes ((array!28765 0))(
  ( (array!28766 (arr!13816 (Array (_ BitVec 32) ValueCell!5897)) (size!14168 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28765)

(assert (=> b!462348 (= res!276519 (and (= (size!14168 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14167 _keys!1025) (size!14168 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!462349 () Bool)

(declare-fun res!276520 () Bool)

(assert (=> b!462349 (=> (not res!276520) (not e!269769))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28763 (_ BitVec 32)) Bool)

(assert (=> b!462349 (= res!276520 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!462350 () Bool)

(assert (=> b!462350 (= e!269769 false)))

(declare-fun lt!209195 () Bool)

(declare-datatypes ((List!8340 0))(
  ( (Nil!8337) (Cons!8336 (h!9192 (_ BitVec 64)) (t!14284 List!8340)) )
))
(declare-fun arrayNoDuplicates!0 (array!28763 (_ BitVec 32) List!8340) Bool)

(assert (=> b!462350 (= lt!209195 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8337))))

(declare-fun mapNonEmpty!20392 () Bool)

(declare-fun mapRes!20392 () Bool)

(declare-fun tp!39211 () Bool)

(declare-fun e!269770 () Bool)

(assert (=> mapNonEmpty!20392 (= mapRes!20392 (and tp!39211 e!269770))))

(declare-fun mapRest!20392 () (Array (_ BitVec 32) ValueCell!5897))

(declare-fun mapValue!20392 () ValueCell!5897)

(declare-fun mapKey!20392 () (_ BitVec 32))

(assert (=> mapNonEmpty!20392 (= (arr!13816 _values!833) (store mapRest!20392 mapKey!20392 mapValue!20392))))

(declare-fun res!276521 () Bool)

(assert (=> start!41364 (=> (not res!276521) (not e!269769))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41364 (= res!276521 (validMask!0 mask!1365))))

(assert (=> start!41364 e!269769))

(assert (=> start!41364 true))

(declare-fun array_inv!9990 (array!28763) Bool)

(assert (=> start!41364 (array_inv!9990 _keys!1025)))

(declare-fun e!269771 () Bool)

(declare-fun array_inv!9991 (array!28765) Bool)

(assert (=> start!41364 (and (array_inv!9991 _values!833) e!269771)))

(declare-fun b!462351 () Bool)

(assert (=> b!462351 (= e!269770 tp_is_empty!12481)))

(declare-fun mapIsEmpty!20392 () Bool)

(assert (=> mapIsEmpty!20392 mapRes!20392))

(declare-fun b!462352 () Bool)

(assert (=> b!462352 (= e!269771 (and e!269772 mapRes!20392))))

(declare-fun condMapEmpty!20392 () Bool)

(declare-fun mapDefault!20392 () ValueCell!5897)

