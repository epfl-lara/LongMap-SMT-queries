; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41400 () Bool)

(assert start!41400)

(declare-fun b!462673 () Bool)

(declare-fun e!270042 () Bool)

(declare-datatypes ((array!28833 0))(
  ( (array!28834 (arr!13850 (Array (_ BitVec 32) (_ BitVec 64))) (size!14202 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28833)

(assert (=> b!462673 (= e!270042 (bvsgt #b00000000000000000000000000000000 (size!14202 _keys!1025)))))

(declare-fun res!276685 () Bool)

(assert (=> start!41400 (=> (not res!276685) (not e!270042))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41400 (= res!276685 (validMask!0 mask!1365))))

(assert (=> start!41400 e!270042))

(assert (=> start!41400 true))

(declare-fun array_inv!10014 (array!28833) Bool)

(assert (=> start!41400 (array_inv!10014 _keys!1025)))

(declare-datatypes ((V!17795 0))(
  ( (V!17796 (val!6303 Int)) )
))
(declare-datatypes ((ValueCell!5915 0))(
  ( (ValueCellFull!5915 (v!8590 V!17795)) (EmptyCell!5915) )
))
(declare-datatypes ((array!28835 0))(
  ( (array!28836 (arr!13851 (Array (_ BitVec 32) ValueCell!5915)) (size!14203 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28835)

(declare-fun e!270038 () Bool)

(declare-fun array_inv!10015 (array!28835) Bool)

(assert (=> start!41400 (and (array_inv!10015 _values!833) e!270038)))

(declare-fun b!462674 () Bool)

(declare-fun res!276684 () Bool)

(assert (=> b!462674 (=> (not res!276684) (not e!270042))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28833 (_ BitVec 32)) Bool)

(assert (=> b!462674 (= res!276684 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapIsEmpty!20446 () Bool)

(declare-fun mapRes!20446 () Bool)

(assert (=> mapIsEmpty!20446 mapRes!20446))

(declare-fun b!462675 () Bool)

(declare-fun res!276683 () Bool)

(assert (=> b!462675 (=> (not res!276683) (not e!270042))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!462675 (= res!276683 (and (= (size!14203 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14202 _keys!1025) (size!14203 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!462676 () Bool)

(declare-fun e!270041 () Bool)

(declare-fun tp_is_empty!12517 () Bool)

(assert (=> b!462676 (= e!270041 tp_is_empty!12517)))

(declare-fun b!462677 () Bool)

(declare-fun e!270039 () Bool)

(assert (=> b!462677 (= e!270038 (and e!270039 mapRes!20446))))

(declare-fun condMapEmpty!20446 () Bool)

(declare-fun mapDefault!20446 () ValueCell!5915)

