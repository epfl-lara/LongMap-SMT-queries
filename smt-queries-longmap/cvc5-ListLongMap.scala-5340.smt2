; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71366 () Bool)

(assert start!71366)

(declare-fun b_free!13447 () Bool)

(declare-fun b_next!13447 () Bool)

(assert (=> start!71366 (= b_free!13447 (not b_next!13447))))

(declare-fun tp!47115 () Bool)

(declare-fun b_and!22429 () Bool)

(assert (=> start!71366 (= tp!47115 b_and!22429)))

(declare-fun mapNonEmpty!24376 () Bool)

(declare-fun mapRes!24376 () Bool)

(declare-fun tp!47116 () Bool)

(declare-fun e!461884 () Bool)

(assert (=> mapNonEmpty!24376 (= mapRes!24376 (and tp!47116 e!461884))))

(declare-fun mapKey!24376 () (_ BitVec 32))

(declare-datatypes ((V!25211 0))(
  ( (V!25212 (val!7626 Int)) )
))
(declare-datatypes ((ValueCell!7163 0))(
  ( (ValueCellFull!7163 (v!10064 V!25211)) (EmptyCell!7163) )
))
(declare-fun mapValue!24376 () ValueCell!7163)

(declare-datatypes ((array!46480 0))(
  ( (array!46481 (arr!22280 (Array (_ BitVec 32) ValueCell!7163)) (size!22701 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46480)

(declare-fun mapRest!24376 () (Array (_ BitVec 32) ValueCell!7163))

(assert (=> mapNonEmpty!24376 (= (arr!22280 _values!788) (store mapRest!24376 mapKey!24376 mapValue!24376))))

(declare-fun b!828813 () Bool)

(declare-fun e!461890 () Bool)

(declare-fun tp_is_empty!15157 () Bool)

(assert (=> b!828813 (= e!461890 tp_is_empty!15157)))

(declare-fun b!828814 () Bool)

(declare-fun res!564688 () Bool)

(declare-fun e!461885 () Bool)

(assert (=> b!828814 (=> (not res!564688) (not e!461885))))

(declare-datatypes ((array!46482 0))(
  ( (array!46483 (arr!22281 (Array (_ BitVec 32) (_ BitVec 64))) (size!22702 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46482)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!828814 (= res!564688 (and (= (size!22701 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22702 _keys!976) (size!22701 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!828815 () Bool)

(assert (=> b!828815 (= e!461884 tp_is_empty!15157)))

(declare-fun b!828816 () Bool)

(declare-fun res!564691 () Bool)

(assert (=> b!828816 (=> (not res!564691) (not e!461885))))

(declare-datatypes ((List!15904 0))(
  ( (Nil!15901) (Cons!15900 (h!17029 (_ BitVec 64)) (t!22261 List!15904)) )
))
(declare-fun arrayNoDuplicates!0 (array!46482 (_ BitVec 32) List!15904) Bool)

(assert (=> b!828816 (= res!564691 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15901))))

(declare-fun b!828817 () Bool)

(declare-fun e!461886 () Bool)

(assert (=> b!828817 (= e!461885 (not e!461886))))

(declare-fun res!564689 () Bool)

(assert (=> b!828817 (=> res!564689 e!461886)))

(assert (=> b!828817 (= res!564689 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!10112 0))(
  ( (tuple2!10113 (_1!5067 (_ BitVec 64)) (_2!5067 V!25211)) )
))
(declare-datatypes ((List!15905 0))(
  ( (Nil!15902) (Cons!15901 (h!17030 tuple2!10112) (t!22262 List!15905)) )
))
(declare-datatypes ((ListLongMap!8935 0))(
  ( (ListLongMap!8936 (toList!4483 List!15905)) )
))
(declare-fun lt!375652 () ListLongMap!8935)

(declare-fun lt!375644 () ListLongMap!8935)

(assert (=> b!828817 (= lt!375652 lt!375644)))

(declare-fun zeroValueBefore!34 () V!25211)

(declare-fun zeroValueAfter!34 () V!25211)

(declare-fun minValue!754 () V!25211)

(declare-datatypes ((Unit!28387 0))(
  ( (Unit!28388) )
))
(declare-fun lt!375649 () Unit!28387)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!572 (array!46482 array!46480 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25211 V!25211 V!25211 V!25211 (_ BitVec 32) Int) Unit!28387)

(assert (=> b!828817 (= lt!375649 (lemmaNoChangeToArrayThenSameMapNoExtras!572 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2484 (array!46482 array!46480 (_ BitVec 32) (_ BitVec 32) V!25211 V!25211 (_ BitVec 32) Int) ListLongMap!8935)

(assert (=> b!828817 (= lt!375644 (getCurrentListMapNoExtraKeys!2484 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!828817 (= lt!375652 (getCurrentListMapNoExtraKeys!2484 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!828818 () Bool)

(declare-fun res!564690 () Bool)

(assert (=> b!828818 (=> (not res!564690) (not e!461885))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46482 (_ BitVec 32)) Bool)

(assert (=> b!828818 (= res!564690 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapIsEmpty!24376 () Bool)

(assert (=> mapIsEmpty!24376 mapRes!24376))

(declare-fun res!564687 () Bool)

(assert (=> start!71366 (=> (not res!564687) (not e!461885))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71366 (= res!564687 (validMask!0 mask!1312))))

(assert (=> start!71366 e!461885))

(assert (=> start!71366 tp_is_empty!15157))

(declare-fun array_inv!17749 (array!46482) Bool)

(assert (=> start!71366 (array_inv!17749 _keys!976)))

(assert (=> start!71366 true))

(declare-fun e!461887 () Bool)

(declare-fun array_inv!17750 (array!46480) Bool)

(assert (=> start!71366 (and (array_inv!17750 _values!788) e!461887)))

(assert (=> start!71366 tp!47115))

(declare-fun b!828812 () Bool)

(assert (=> b!828812 (= e!461887 (and e!461890 mapRes!24376))))

(declare-fun condMapEmpty!24376 () Bool)

(declare-fun mapDefault!24376 () ValueCell!7163)

