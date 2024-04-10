; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70552 () Bool)

(assert start!70552)

(declare-fun b_free!12859 () Bool)

(declare-fun b_next!12859 () Bool)

(assert (=> start!70552 (= b_free!12859 (not b_next!12859))))

(declare-fun tp!45312 () Bool)

(declare-fun b_and!21701 () Bool)

(assert (=> start!70552 (= tp!45312 b_and!21701)))

(declare-fun b!819548 () Bool)

(declare-fun e!455138 () Bool)

(declare-fun e!455139 () Bool)

(assert (=> b!819548 (= e!455138 (not e!455139))))

(declare-fun res!559232 () Bool)

(assert (=> b!819548 (=> res!559232 e!455139)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!819548 (= res!559232 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!24427 0))(
  ( (V!24428 (val!7332 Int)) )
))
(declare-datatypes ((tuple2!9648 0))(
  ( (tuple2!9649 (_1!4835 (_ BitVec 64)) (_2!4835 V!24427)) )
))
(declare-datatypes ((List!15476 0))(
  ( (Nil!15473) (Cons!15472 (h!16601 tuple2!9648) (t!21807 List!15476)) )
))
(declare-datatypes ((ListLongMap!8471 0))(
  ( (ListLongMap!8472 (toList!4251 List!15476)) )
))
(declare-fun lt!367835 () ListLongMap!8471)

(declare-fun lt!367836 () ListLongMap!8471)

(assert (=> b!819548 (= lt!367835 lt!367836)))

(declare-fun zeroValueBefore!34 () V!24427)

(declare-datatypes ((array!45336 0))(
  ( (array!45337 (arr!21721 (Array (_ BitVec 32) (_ BitVec 64))) (size!22142 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45336)

(declare-fun zeroValueAfter!34 () V!24427)

(declare-fun minValue!754 () V!24427)

(declare-datatypes ((ValueCell!6869 0))(
  ( (ValueCellFull!6869 (v!9762 V!24427)) (EmptyCell!6869) )
))
(declare-datatypes ((array!45338 0))(
  ( (array!45339 (arr!21722 (Array (_ BitVec 32) ValueCell!6869)) (size!22143 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45338)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!27981 0))(
  ( (Unit!27982) )
))
(declare-fun lt!367828 () Unit!27981)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!393 (array!45336 array!45338 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24427 V!24427 V!24427 V!24427 (_ BitVec 32) Int) Unit!27981)

(assert (=> b!819548 (= lt!367828 (lemmaNoChangeToArrayThenSameMapNoExtras!393 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2283 (array!45336 array!45338 (_ BitVec 32) (_ BitVec 32) V!24427 V!24427 (_ BitVec 32) Int) ListLongMap!8471)

(assert (=> b!819548 (= lt!367836 (getCurrentListMapNoExtraKeys!2283 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!819548 (= lt!367835 (getCurrentListMapNoExtraKeys!2283 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!819549 () Bool)

(assert (=> b!819549 (= e!455139 true)))

(declare-fun lt!367833 () ListLongMap!8471)

(declare-fun lt!367827 () tuple2!9648)

(declare-fun lt!367834 () tuple2!9648)

(declare-fun +!1847 (ListLongMap!8471 tuple2!9648) ListLongMap!8471)

(assert (=> b!819549 (= lt!367833 (+!1847 (+!1847 lt!367836 lt!367834) lt!367827))))

(declare-fun lt!367832 () ListLongMap!8471)

(assert (=> b!819549 (= (+!1847 lt!367835 lt!367827) (+!1847 lt!367832 lt!367827))))

(declare-fun lt!367829 () Unit!27981)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!186 (ListLongMap!8471 (_ BitVec 64) V!24427 V!24427) Unit!27981)

(assert (=> b!819549 (= lt!367829 (addSameAsAddTwiceSameKeyDiffValues!186 lt!367835 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!819549 (= lt!367827 (tuple2!9649 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!455136 () Bool)

(assert (=> b!819549 e!455136))

(declare-fun res!559230 () Bool)

(assert (=> b!819549 (=> (not res!559230) (not e!455136))))

(declare-fun lt!367830 () ListLongMap!8471)

(assert (=> b!819549 (= res!559230 (= lt!367830 lt!367832))))

(assert (=> b!819549 (= lt!367832 (+!1847 lt!367835 lt!367834))))

(assert (=> b!819549 (= lt!367834 (tuple2!9649 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun lt!367831 () ListLongMap!8471)

(declare-fun getCurrentListMap!2452 (array!45336 array!45338 (_ BitVec 32) (_ BitVec 32) V!24427 V!24427 (_ BitVec 32) Int) ListLongMap!8471)

(assert (=> b!819549 (= lt!367831 (getCurrentListMap!2452 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!819549 (= lt!367830 (getCurrentListMap!2452 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!559227 () Bool)

(assert (=> start!70552 (=> (not res!559227) (not e!455138))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70552 (= res!559227 (validMask!0 mask!1312))))

(assert (=> start!70552 e!455138))

(declare-fun tp_is_empty!14569 () Bool)

(assert (=> start!70552 tp_is_empty!14569))

(declare-fun array_inv!17361 (array!45336) Bool)

(assert (=> start!70552 (array_inv!17361 _keys!976)))

(assert (=> start!70552 true))

(declare-fun e!455137 () Bool)

(declare-fun array_inv!17362 (array!45338) Bool)

(assert (=> start!70552 (and (array_inv!17362 _values!788) e!455137)))

(assert (=> start!70552 tp!45312))

(declare-fun mapNonEmpty!23455 () Bool)

(declare-fun mapRes!23455 () Bool)

(declare-fun tp!45313 () Bool)

(declare-fun e!455140 () Bool)

(assert (=> mapNonEmpty!23455 (= mapRes!23455 (and tp!45313 e!455140))))

(declare-fun mapValue!23455 () ValueCell!6869)

(declare-fun mapKey!23455 () (_ BitVec 32))

(declare-fun mapRest!23455 () (Array (_ BitVec 32) ValueCell!6869))

(assert (=> mapNonEmpty!23455 (= (arr!21722 _values!788) (store mapRest!23455 mapKey!23455 mapValue!23455))))

(declare-fun b!819550 () Bool)

(assert (=> b!819550 (= e!455140 tp_is_empty!14569)))

(declare-fun b!819551 () Bool)

(declare-fun e!455142 () Bool)

(assert (=> b!819551 (= e!455142 tp_is_empty!14569)))

(declare-fun b!819552 () Bool)

(assert (=> b!819552 (= e!455137 (and e!455142 mapRes!23455))))

(declare-fun condMapEmpty!23455 () Bool)

(declare-fun mapDefault!23455 () ValueCell!6869)

