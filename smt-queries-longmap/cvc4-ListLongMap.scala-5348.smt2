; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71490 () Bool)

(assert start!71490)

(declare-fun b_free!13499 () Bool)

(declare-fun b_next!13499 () Bool)

(assert (=> start!71490 (= b_free!13499 (not b_next!13499))))

(declare-fun tp!47283 () Bool)

(declare-fun b_and!22529 () Bool)

(assert (=> start!71490 (= tp!47283 b_and!22529)))

(declare-datatypes ((V!25279 0))(
  ( (V!25280 (val!7652 Int)) )
))
(declare-datatypes ((tuple2!10152 0))(
  ( (tuple2!10153 (_1!5087 (_ BitVec 64)) (_2!5087 V!25279)) )
))
(declare-datatypes ((List!15946 0))(
  ( (Nil!15943) (Cons!15942 (h!17071 tuple2!10152) (t!22311 List!15946)) )
))
(declare-datatypes ((ListLongMap!8975 0))(
  ( (ListLongMap!8976 (toList!4503 List!15946)) )
))
(declare-fun lt!376704 () ListLongMap!8975)

(declare-fun e!462876 () Bool)

(declare-fun zeroValueAfter!34 () V!25279)

(declare-fun lt!376703 () ListLongMap!8975)

(declare-fun lt!376698 () tuple2!10152)

(declare-fun b!830226 () Bool)

(declare-fun +!1981 (ListLongMap!8975 tuple2!10152) ListLongMap!8975)

(assert (=> b!830226 (= e!462876 (= lt!376703 (+!1981 (+!1981 lt!376704 (tuple2!10153 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!376698)))))

(declare-fun b!830227 () Bool)

(declare-fun e!462878 () Bool)

(declare-fun tp_is_empty!15209 () Bool)

(assert (=> b!830227 (= e!462878 tp_is_empty!15209)))

(declare-fun b!830228 () Bool)

(declare-fun e!462880 () Bool)

(declare-fun e!462879 () Bool)

(assert (=> b!830228 (= e!462880 (not e!462879))))

(declare-fun res!565459 () Bool)

(assert (=> b!830228 (=> res!565459 e!462879)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!830228 (= res!565459 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!376699 () ListLongMap!8975)

(assert (=> b!830228 (= lt!376699 lt!376704)))

(declare-fun zeroValueBefore!34 () V!25279)

(declare-datatypes ((array!46588 0))(
  ( (array!46589 (arr!22330 (Array (_ BitVec 32) (_ BitVec 64))) (size!22751 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46588)

(declare-fun minValue!754 () V!25279)

(declare-datatypes ((ValueCell!7189 0))(
  ( (ValueCellFull!7189 (v!10094 V!25279)) (EmptyCell!7189) )
))
(declare-datatypes ((array!46590 0))(
  ( (array!46591 (arr!22331 (Array (_ BitVec 32) ValueCell!7189)) (size!22752 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46590)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!28431 0))(
  ( (Unit!28432) )
))
(declare-fun lt!376700 () Unit!28431)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!590 (array!46588 array!46590 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25279 V!25279 V!25279 V!25279 (_ BitVec 32) Int) Unit!28431)

(assert (=> b!830228 (= lt!376700 (lemmaNoChangeToArrayThenSameMapNoExtras!590 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2502 (array!46588 array!46590 (_ BitVec 32) (_ BitVec 32) V!25279 V!25279 (_ BitVec 32) Int) ListLongMap!8975)

(assert (=> b!830228 (= lt!376704 (getCurrentListMapNoExtraKeys!2502 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!830228 (= lt!376699 (getCurrentListMapNoExtraKeys!2502 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!830229 () Bool)

(declare-fun res!565462 () Bool)

(assert (=> b!830229 (=> (not res!565462) (not e!462880))))

(declare-datatypes ((List!15947 0))(
  ( (Nil!15944) (Cons!15943 (h!17072 (_ BitVec 64)) (t!22312 List!15947)) )
))
(declare-fun arrayNoDuplicates!0 (array!46588 (_ BitVec 32) List!15947) Bool)

(assert (=> b!830229 (= res!565462 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15944))))

(declare-fun b!830230 () Bool)

(declare-fun lt!376701 () ListLongMap!8975)

(declare-fun lt!376702 () tuple2!10152)

(assert (=> b!830230 (= e!462879 (= lt!376701 (+!1981 (+!1981 lt!376699 lt!376698) lt!376702)))))

(assert (=> b!830230 e!462876))

(declare-fun res!565464 () Bool)

(assert (=> b!830230 (=> (not res!565464) (not e!462876))))

(assert (=> b!830230 (= res!565464 (= lt!376701 (+!1981 (+!1981 lt!376699 lt!376702) lt!376698)))))

(assert (=> b!830230 (= lt!376698 (tuple2!10153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!830230 (= lt!376702 (tuple2!10153 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun getCurrentListMap!2599 (array!46588 array!46590 (_ BitVec 32) (_ BitVec 32) V!25279 V!25279 (_ BitVec 32) Int) ListLongMap!8975)

(assert (=> b!830230 (= lt!376703 (getCurrentListMap!2599 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!830230 (= lt!376701 (getCurrentListMap!2599 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!24466 () Bool)

(declare-fun mapRes!24466 () Bool)

(declare-fun tp!47284 () Bool)

(assert (=> mapNonEmpty!24466 (= mapRes!24466 (and tp!47284 e!462878))))

(declare-fun mapKey!24466 () (_ BitVec 32))

(declare-fun mapRest!24466 () (Array (_ BitVec 32) ValueCell!7189))

(declare-fun mapValue!24466 () ValueCell!7189)

(assert (=> mapNonEmpty!24466 (= (arr!22331 _values!788) (store mapRest!24466 mapKey!24466 mapValue!24466))))

(declare-fun b!830231 () Bool)

(declare-fun e!462877 () Bool)

(declare-fun e!462882 () Bool)

(assert (=> b!830231 (= e!462877 (and e!462882 mapRes!24466))))

(declare-fun condMapEmpty!24466 () Bool)

(declare-fun mapDefault!24466 () ValueCell!7189)

