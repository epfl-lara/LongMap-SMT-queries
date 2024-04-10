; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71686 () Bool)

(assert start!71686)

(declare-fun b_free!13519 () Bool)

(declare-fun b_next!13519 () Bool)

(assert (=> start!71686 (= b_free!13519 (not b_next!13519))))

(declare-fun tp!47354 () Bool)

(declare-fun b_and!22605 () Bool)

(assert (=> start!71686 (= tp!47354 b_and!22605)))

(declare-fun res!566880 () Bool)

(declare-fun e!465075 () Bool)

(assert (=> start!71686 (=> (not res!566880) (not e!465075))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71686 (= res!566880 (validMask!0 mask!1312))))

(assert (=> start!71686 e!465075))

(declare-fun tp_is_empty!15229 () Bool)

(assert (=> start!71686 tp_is_empty!15229))

(declare-datatypes ((array!46632 0))(
  ( (array!46633 (arr!22350 (Array (_ BitVec 32) (_ BitVec 64))) (size!22771 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46632)

(declare-fun array_inv!17803 (array!46632) Bool)

(assert (=> start!71686 (array_inv!17803 _keys!976)))

(assert (=> start!71686 true))

(declare-datatypes ((V!25307 0))(
  ( (V!25308 (val!7662 Int)) )
))
(declare-datatypes ((ValueCell!7199 0))(
  ( (ValueCellFull!7199 (v!10110 V!25307)) (EmptyCell!7199) )
))
(declare-datatypes ((array!46634 0))(
  ( (array!46635 (arr!22351 (Array (_ BitVec 32) ValueCell!7199)) (size!22772 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46634)

(declare-fun e!465076 () Bool)

(declare-fun array_inv!17804 (array!46634) Bool)

(assert (=> start!71686 (and (array_inv!17804 _values!788) e!465076)))

(assert (=> start!71686 tp!47354))

(declare-fun b!833675 () Bool)

(declare-fun e!465079 () Bool)

(assert (=> b!833675 (= e!465079 tp_is_empty!15229)))

(declare-fun b!833676 () Bool)

(declare-fun e!465080 () Bool)

(assert (=> b!833676 (= e!465075 (not e!465080))))

(declare-fun res!566876 () Bool)

(assert (=> b!833676 (=> res!566876 e!465080)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!833676 (= res!566876 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!10172 0))(
  ( (tuple2!10173 (_1!5097 (_ BitVec 64)) (_2!5097 V!25307)) )
))
(declare-datatypes ((List!15964 0))(
  ( (Nil!15961) (Cons!15960 (h!17091 tuple2!10172) (t!22335 List!15964)) )
))
(declare-datatypes ((ListLongMap!8995 0))(
  ( (ListLongMap!8996 (toList!4513 List!15964)) )
))
(declare-fun lt!378431 () ListLongMap!8995)

(declare-fun lt!378435 () ListLongMap!8995)

(assert (=> b!833676 (= lt!378431 lt!378435)))

(declare-fun zeroValueAfter!34 () V!25307)

(declare-fun minValue!754 () V!25307)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28569 0))(
  ( (Unit!28570) )
))
(declare-fun lt!378425 () Unit!28569)

(declare-fun zeroValueBefore!34 () V!25307)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!599 (array!46632 array!46634 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25307 V!25307 V!25307 V!25307 (_ BitVec 32) Int) Unit!28569)

(assert (=> b!833676 (= lt!378425 (lemmaNoChangeToArrayThenSameMapNoExtras!599 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2511 (array!46632 array!46634 (_ BitVec 32) (_ BitVec 32) V!25307 V!25307 (_ BitVec 32) Int) ListLongMap!8995)

(assert (=> b!833676 (= lt!378435 (getCurrentListMapNoExtraKeys!2511 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!833676 (= lt!378431 (getCurrentListMapNoExtraKeys!2511 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!378426 () tuple2!10172)

(declare-fun lt!378427 () ListLongMap!8995)

(declare-fun b!833677 () Bool)

(declare-fun lt!378430 () tuple2!10172)

(declare-fun +!1991 (ListLongMap!8995 tuple2!10172) ListLongMap!8995)

(assert (=> b!833677 (= e!465080 (= lt!378427 (+!1991 (+!1991 lt!378431 lt!378426) lt!378430)))))

(declare-fun lt!378432 () ListLongMap!8995)

(declare-fun lt!378428 () ListLongMap!8995)

(assert (=> b!833677 (and (= lt!378432 lt!378428) (= lt!378427 lt!378428) (= lt!378427 lt!378432))))

(declare-fun lt!378429 () ListLongMap!8995)

(assert (=> b!833677 (= lt!378428 (+!1991 lt!378429 lt!378426))))

(declare-fun lt!378424 () ListLongMap!8995)

(assert (=> b!833677 (= lt!378432 (+!1991 lt!378424 lt!378426))))

(declare-fun lt!378434 () Unit!28569)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!244 (ListLongMap!8995 (_ BitVec 64) V!25307 V!25307) Unit!28569)

(assert (=> b!833677 (= lt!378434 (addSameAsAddTwiceSameKeyDiffValues!244 lt!378424 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(declare-fun e!465074 () Bool)

(assert (=> b!833677 e!465074))

(declare-fun res!566882 () Bool)

(assert (=> b!833677 (=> (not res!566882) (not e!465074))))

(declare-fun lt!378433 () ListLongMap!8995)

(assert (=> b!833677 (= res!566882 (= lt!378433 lt!378429))))

(declare-fun lt!378436 () tuple2!10172)

(assert (=> b!833677 (= lt!378429 (+!1991 lt!378424 lt!378436))))

(assert (=> b!833677 (= lt!378424 (+!1991 lt!378431 lt!378430))))

(assert (=> b!833677 (= lt!378426 (tuple2!10173 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!465078 () Bool)

(assert (=> b!833677 e!465078))

(declare-fun res!566877 () Bool)

(assert (=> b!833677 (=> (not res!566877) (not e!465078))))

(assert (=> b!833677 (= res!566877 (= lt!378433 (+!1991 (+!1991 lt!378431 lt!378436) lt!378430)))))

(assert (=> b!833677 (= lt!378430 (tuple2!10173 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!833677 (= lt!378436 (tuple2!10173 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun getCurrentListMap!2607 (array!46632 array!46634 (_ BitVec 32) (_ BitVec 32) V!25307 V!25307 (_ BitVec 32) Int) ListLongMap!8995)

(assert (=> b!833677 (= lt!378427 (getCurrentListMap!2607 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!833677 (= lt!378433 (getCurrentListMap!2607 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!833678 () Bool)

(declare-fun e!465081 () Bool)

(assert (=> b!833678 (= e!465081 tp_is_empty!15229)))

(declare-fun mapIsEmpty!24506 () Bool)

(declare-fun mapRes!24506 () Bool)

(assert (=> mapIsEmpty!24506 mapRes!24506))

(declare-fun b!833679 () Bool)

(assert (=> b!833679 (= e!465074 (= lt!378427 (+!1991 (+!1991 lt!378435 lt!378430) lt!378426)))))

(declare-fun b!833680 () Bool)

(assert (=> b!833680 (= e!465078 (= lt!378427 (+!1991 (+!1991 lt!378435 (tuple2!10173 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!378430)))))

(declare-fun b!833681 () Bool)

(declare-fun res!566878 () Bool)

(assert (=> b!833681 (=> (not res!566878) (not e!465075))))

(assert (=> b!833681 (= res!566878 (and (= (size!22772 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22771 _keys!976) (size!22772 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!24506 () Bool)

(declare-fun tp!47353 () Bool)

(assert (=> mapNonEmpty!24506 (= mapRes!24506 (and tp!47353 e!465079))))

(declare-fun mapValue!24506 () ValueCell!7199)

(declare-fun mapRest!24506 () (Array (_ BitVec 32) ValueCell!7199))

(declare-fun mapKey!24506 () (_ BitVec 32))

(assert (=> mapNonEmpty!24506 (= (arr!22351 _values!788) (store mapRest!24506 mapKey!24506 mapValue!24506))))

(declare-fun b!833682 () Bool)

(assert (=> b!833682 (= e!465076 (and e!465081 mapRes!24506))))

(declare-fun condMapEmpty!24506 () Bool)

(declare-fun mapDefault!24506 () ValueCell!7199)

