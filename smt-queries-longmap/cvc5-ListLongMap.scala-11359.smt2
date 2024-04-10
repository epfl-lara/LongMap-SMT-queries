; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132058 () Bool)

(assert start!132058)

(declare-fun b_free!31771 () Bool)

(declare-fun b_next!31771 () Bool)

(assert (=> start!132058 (= b_free!31771 (not b_next!31771))))

(declare-fun tp!111565 () Bool)

(declare-fun b_and!51181 () Bool)

(assert (=> start!132058 (= tp!111565 b_and!51181)))

(declare-fun b!1547945 () Bool)

(declare-datatypes ((V!59173 0))(
  ( (V!59174 (val!19101 Int)) )
))
(declare-datatypes ((tuple2!24582 0))(
  ( (tuple2!24583 (_1!12302 (_ BitVec 64)) (_2!12302 V!59173)) )
))
(declare-datatypes ((List!36076 0))(
  ( (Nil!36073) (Cons!36072 (h!37517 tuple2!24582) (t!50770 List!36076)) )
))
(declare-datatypes ((ListLongMap!22191 0))(
  ( (ListLongMap!22192 (toList!11111 List!36076)) )
))
(declare-fun e!861632 () ListLongMap!22191)

(declare-fun e!861634 () ListLongMap!22191)

(assert (=> b!1547945 (= e!861632 e!861634)))

(declare-fun c!142098 () Bool)

(declare-fun lt!667036 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1547945 (= c!142098 (and (not lt!667036) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1547946 () Bool)

(declare-fun c!142099 () Bool)

(assert (=> b!1547946 (= c!142099 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!667036))))

(declare-fun e!861635 () ListLongMap!22191)

(assert (=> b!1547946 (= e!861634 e!861635)))

(declare-fun b!1547947 () Bool)

(declare-fun e!861636 () Bool)

(assert (=> b!1547947 (= e!861636 (not true))))

(declare-datatypes ((array!103294 0))(
  ( (array!103295 (arr!49849 (Array (_ BitVec 32) (_ BitVec 64))) (size!50399 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103294)

(declare-fun lt!667037 () ListLongMap!22191)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun lt!667035 () Bool)

(declare-fun contains!10067 (ListLongMap!22191 (_ BitVec 64)) Bool)

(assert (=> b!1547947 (= lt!667035 (contains!10067 lt!667037 (select (arr!49849 _keys!618) from!762)))))

(declare-fun minValue!436 () V!59173)

(declare-fun apply!1060 (ListLongMap!22191 (_ BitVec 64)) V!59173)

(declare-fun +!4942 (ListLongMap!22191 tuple2!24582) ListLongMap!22191)

(assert (=> b!1547947 (= (apply!1060 (+!4942 lt!667037 (tuple2!24583 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49849 _keys!618) from!762)) (apply!1060 lt!667037 (select (arr!49849 _keys!618) from!762)))))

(declare-datatypes ((Unit!51570 0))(
  ( (Unit!51571) )
))
(declare-fun lt!667040 () Unit!51570)

(declare-fun addApplyDifferent!602 (ListLongMap!22191 (_ BitVec 64) V!59173 (_ BitVec 64)) Unit!51570)

(assert (=> b!1547947 (= lt!667040 (addApplyDifferent!602 lt!667037 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49849 _keys!618) from!762)))))

(declare-fun zeroValue!436 () V!59173)

(assert (=> b!1547947 (contains!10067 (+!4942 lt!667037 (tuple2!24583 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49849 _keys!618) from!762))))

(declare-fun lt!667039 () Unit!51570)

(declare-fun addStillContains!1255 (ListLongMap!22191 (_ BitVec 64) V!59173 (_ BitVec 64)) Unit!51570)

(assert (=> b!1547947 (= lt!667039 (addStillContains!1255 lt!667037 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49849 _keys!618) from!762)))))

(declare-fun defaultEntry!478 () Int)

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18113 0))(
  ( (ValueCellFull!18113 (v!21902 V!59173)) (EmptyCell!18113) )
))
(declare-datatypes ((array!103296 0))(
  ( (array!103297 (arr!49850 (Array (_ BitVec 32) ValueCell!18113)) (size!50400 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103296)

(declare-fun getCurrentListMapNoExtraKeys!6568 (array!103294 array!103296 (_ BitVec 32) (_ BitVec 32) V!59173 V!59173 (_ BitVec 32) Int) ListLongMap!22191)

(assert (=> b!1547947 (= lt!667037 (getCurrentListMapNoExtraKeys!6568 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun c!142100 () Bool)

(declare-fun call!70010 () ListLongMap!22191)

(declare-fun call!70014 () ListLongMap!22191)

(declare-fun bm!70007 () Bool)

(declare-fun call!70011 () ListLongMap!22191)

(declare-fun call!70012 () ListLongMap!22191)

(assert (=> bm!70007 (= call!70014 (+!4942 (ite c!142100 call!70010 (ite c!142098 call!70011 call!70012)) (ite (or c!142100 c!142098) (tuple2!24583 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24583 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1547948 () Bool)

(assert (=> b!1547948 (= e!861635 call!70012)))

(declare-fun mapNonEmpty!58774 () Bool)

(declare-fun mapRes!58774 () Bool)

(declare-fun tp!111564 () Bool)

(declare-fun e!861631 () Bool)

(assert (=> mapNonEmpty!58774 (= mapRes!58774 (and tp!111564 e!861631))))

(declare-fun mapRest!58774 () (Array (_ BitVec 32) ValueCell!18113))

(declare-fun mapKey!58774 () (_ BitVec 32))

(declare-fun mapValue!58774 () ValueCell!18113)

(assert (=> mapNonEmpty!58774 (= (arr!49850 _values!470) (store mapRest!58774 mapKey!58774 mapValue!58774))))

(declare-fun b!1547949 () Bool)

(assert (=> b!1547949 (= e!861632 (+!4942 call!70014 (tuple2!24583 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1547950 () Bool)

(declare-fun res!1060902 () Bool)

(assert (=> b!1547950 (=> (not res!1060902) (not e!861636))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1547950 (= res!1060902 (validKeyInArray!0 (select (arr!49849 _keys!618) from!762)))))

(declare-fun mapIsEmpty!58774 () Bool)

(assert (=> mapIsEmpty!58774 mapRes!58774))

(declare-fun bm!70008 () Bool)

(assert (=> bm!70008 (= call!70010 (getCurrentListMapNoExtraKeys!6568 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1547951 () Bool)

(declare-fun res!1060906 () Bool)

(declare-fun e!861638 () Bool)

(assert (=> b!1547951 (=> (not res!1060906) (not e!861638))))

(declare-datatypes ((List!36077 0))(
  ( (Nil!36074) (Cons!36073 (h!37518 (_ BitVec 64)) (t!50771 List!36077)) )
))
(declare-fun arrayNoDuplicates!0 (array!103294 (_ BitVec 32) List!36077) Bool)

(assert (=> b!1547951 (= res!1060906 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36074))))

(declare-fun res!1060903 () Bool)

(assert (=> start!132058 (=> (not res!1060903) (not e!861638))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132058 (= res!1060903 (validMask!0 mask!926))))

(assert (=> start!132058 e!861638))

(declare-fun array_inv!38763 (array!103294) Bool)

(assert (=> start!132058 (array_inv!38763 _keys!618)))

(declare-fun tp_is_empty!38047 () Bool)

(assert (=> start!132058 tp_is_empty!38047))

(assert (=> start!132058 true))

(assert (=> start!132058 tp!111565))

(declare-fun e!861637 () Bool)

(declare-fun array_inv!38764 (array!103296) Bool)

(assert (=> start!132058 (and (array_inv!38764 _values!470) e!861637)))

(declare-fun b!1547952 () Bool)

(declare-fun res!1060907 () Bool)

(assert (=> b!1547952 (=> (not res!1060907) (not e!861638))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103294 (_ BitVec 32)) Bool)

(assert (=> b!1547952 (= res!1060907 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1547953 () Bool)

(declare-fun call!70013 () ListLongMap!22191)

(assert (=> b!1547953 (= e!861635 call!70013)))

(declare-fun b!1547954 () Bool)

(assert (=> b!1547954 (= e!861631 tp_is_empty!38047)))

(declare-fun bm!70009 () Bool)

(assert (=> bm!70009 (= call!70012 call!70011)))

(declare-fun b!1547955 () Bool)

(declare-fun res!1060904 () Bool)

(assert (=> b!1547955 (=> (not res!1060904) (not e!861638))))

(assert (=> b!1547955 (= res!1060904 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50399 _keys!618))))))

(declare-fun b!1547956 () Bool)

(declare-fun e!861633 () Bool)

(assert (=> b!1547956 (= e!861633 tp_is_empty!38047)))

(declare-fun b!1547957 () Bool)

(assert (=> b!1547957 (= e!861637 (and e!861633 mapRes!58774))))

(declare-fun condMapEmpty!58774 () Bool)

(declare-fun mapDefault!58774 () ValueCell!18113)

