; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132044 () Bool)

(assert start!132044)

(declare-fun b_free!31757 () Bool)

(declare-fun b_next!31757 () Bool)

(assert (=> start!132044 (= b_free!31757 (not b_next!31757))))

(declare-fun tp!111522 () Bool)

(declare-fun b_and!51167 () Bool)

(assert (=> start!132044 (= tp!111522 b_and!51167)))

(declare-fun b!1547609 () Bool)

(declare-datatypes ((V!59153 0))(
  ( (V!59154 (val!19094 Int)) )
))
(declare-datatypes ((tuple2!24568 0))(
  ( (tuple2!24569 (_1!12295 (_ BitVec 64)) (_2!12295 V!59153)) )
))
(declare-datatypes ((List!36065 0))(
  ( (Nil!36062) (Cons!36061 (h!37506 tuple2!24568) (t!50759 List!36065)) )
))
(declare-datatypes ((ListLongMap!22177 0))(
  ( (ListLongMap!22178 (toList!11104 List!36065)) )
))
(declare-fun e!861444 () ListLongMap!22177)

(declare-fun call!69906 () ListLongMap!22177)

(declare-fun minValue!436 () V!59153)

(declare-fun +!4935 (ListLongMap!22177 tuple2!24568) ListLongMap!22177)

(assert (=> b!1547609 (= e!861444 (+!4935 call!69906 (tuple2!24569 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun bm!69902 () Bool)

(declare-fun call!69905 () ListLongMap!22177)

(declare-fun call!69907 () ListLongMap!22177)

(assert (=> bm!69902 (= call!69905 call!69907)))

(declare-fun b!1547610 () Bool)

(declare-fun res!1060758 () Bool)

(declare-fun e!861450 () Bool)

(assert (=> b!1547610 (=> (not res!1060758) (not e!861450))))

(declare-fun from!762 () (_ BitVec 32))

(declare-datatypes ((array!103266 0))(
  ( (array!103267 (arr!49835 (Array (_ BitVec 32) (_ BitVec 64))) (size!50385 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103266)

(assert (=> b!1547610 (= res!1060758 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50385 _keys!618))))))

(declare-fun b!1547611 () Bool)

(declare-fun e!861446 () ListLongMap!22177)

(declare-fun call!69908 () ListLongMap!22177)

(assert (=> b!1547611 (= e!861446 call!69908)))

(declare-fun b!1547612 () Bool)

(declare-fun e!861442 () Bool)

(assert (=> b!1547612 (= e!861442 (not true))))

(declare-fun lt!666929 () ListLongMap!22177)

(declare-fun apply!1055 (ListLongMap!22177 (_ BitVec 64)) V!59153)

(assert (=> b!1547612 (= (apply!1055 (+!4935 lt!666929 (tuple2!24569 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49835 _keys!618) from!762)) (apply!1055 lt!666929 (select (arr!49835 _keys!618) from!762)))))

(declare-datatypes ((Unit!51560 0))(
  ( (Unit!51561) )
))
(declare-fun lt!666928 () Unit!51560)

(declare-fun addApplyDifferent!597 (ListLongMap!22177 (_ BitVec 64) V!59153 (_ BitVec 64)) Unit!51560)

(assert (=> b!1547612 (= lt!666928 (addApplyDifferent!597 lt!666929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49835 _keys!618) from!762)))))

(declare-fun zeroValue!436 () V!59153)

(declare-fun contains!10062 (ListLongMap!22177 (_ BitVec 64)) Bool)

(assert (=> b!1547612 (contains!10062 (+!4935 lt!666929 (tuple2!24569 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49835 _keys!618) from!762))))

(declare-fun lt!666930 () Unit!51560)

(declare-fun addStillContains!1250 (ListLongMap!22177 (_ BitVec 64) V!59153 (_ BitVec 64)) Unit!51560)

(assert (=> b!1547612 (= lt!666930 (addStillContains!1250 lt!666929 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49835 _keys!618) from!762)))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun defaultEntry!478 () Int)

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18106 0))(
  ( (ValueCellFull!18106 (v!21895 V!59153)) (EmptyCell!18106) )
))
(declare-datatypes ((array!103268 0))(
  ( (array!103269 (arr!49836 (Array (_ BitVec 32) ValueCell!18106)) (size!50386 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103268)

(declare-fun getCurrentListMapNoExtraKeys!6563 (array!103266 array!103268 (_ BitVec 32) (_ BitVec 32) V!59153 V!59153 (_ BitVec 32) Int) ListLongMap!22177)

(assert (=> b!1547612 (= lt!666929 (getCurrentListMapNoExtraKeys!6563 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1547613 () Bool)

(declare-fun e!861448 () Bool)

(declare-fun tp_is_empty!38033 () Bool)

(assert (=> b!1547613 (= e!861448 tp_is_empty!38033)))

(declare-fun res!1060755 () Bool)

(assert (=> start!132044 (=> (not res!1060755) (not e!861450))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132044 (= res!1060755 (validMask!0 mask!926))))

(assert (=> start!132044 e!861450))

(declare-fun array_inv!38755 (array!103266) Bool)

(assert (=> start!132044 (array_inv!38755 _keys!618)))

(assert (=> start!132044 tp_is_empty!38033))

(assert (=> start!132044 true))

(assert (=> start!132044 tp!111522))

(declare-fun e!861449 () Bool)

(declare-fun array_inv!38756 (array!103268) Bool)

(assert (=> start!132044 (and (array_inv!38756 _values!470) e!861449)))

(declare-fun b!1547614 () Bool)

(declare-fun e!861443 () Bool)

(assert (=> b!1547614 (= e!861443 tp_is_empty!38033)))

(declare-fun mapNonEmpty!58753 () Bool)

(declare-fun mapRes!58753 () Bool)

(declare-fun tp!111523 () Bool)

(assert (=> mapNonEmpty!58753 (= mapRes!58753 (and tp!111523 e!861443))))

(declare-fun mapKey!58753 () (_ BitVec 32))

(declare-fun mapRest!58753 () (Array (_ BitVec 32) ValueCell!18106))

(declare-fun mapValue!58753 () ValueCell!18106)

(assert (=> mapNonEmpty!58753 (= (arr!49836 _values!470) (store mapRest!58753 mapKey!58753 mapValue!58753))))

(declare-fun b!1547615 () Bool)

(declare-fun res!1060757 () Bool)

(assert (=> b!1547615 (=> (not res!1060757) (not e!861450))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103266 (_ BitVec 32)) Bool)

(assert (=> b!1547615 (= res!1060757 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun mapIsEmpty!58753 () Bool)

(assert (=> mapIsEmpty!58753 mapRes!58753))

(declare-fun bm!69903 () Bool)

(assert (=> bm!69903 (= call!69908 call!69906)))

(declare-fun b!1547616 () Bool)

(declare-fun c!142037 () Bool)

(declare-fun lt!666931 () Bool)

(assert (=> b!1547616 (= c!142037 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!666931))))

(declare-fun e!861445 () ListLongMap!22177)

(assert (=> b!1547616 (= e!861445 e!861446)))

(declare-fun b!1547617 () Bool)

(declare-fun res!1060756 () Bool)

(assert (=> b!1547617 (=> (not res!1060756) (not e!861442))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1547617 (= res!1060756 (validKeyInArray!0 (select (arr!49835 _keys!618) from!762)))))

(declare-fun bm!69904 () Bool)

(assert (=> bm!69904 (= call!69907 (getCurrentListMapNoExtraKeys!6563 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1547618 () Bool)

(assert (=> b!1547618 (= e!861450 e!861442)))

(declare-fun res!1060760 () Bool)

(assert (=> b!1547618 (=> (not res!1060760) (not e!861442))))

(assert (=> b!1547618 (= res!1060760 (bvslt from!762 (size!50385 _keys!618)))))

(declare-fun lt!666932 () ListLongMap!22177)

(assert (=> b!1547618 (= lt!666932 e!861444)))

(declare-fun c!142036 () Bool)

(assert (=> b!1547618 (= c!142036 (and (not lt!666931) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1547618 (= lt!666931 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1547619 () Bool)

(assert (=> b!1547619 (= e!861444 e!861445)))

(declare-fun c!142035 () Bool)

(assert (=> b!1547619 (= c!142035 (and (not lt!666931) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!69905 () Bool)

(declare-fun call!69909 () ListLongMap!22177)

(assert (=> bm!69905 (= call!69909 call!69905)))

(declare-fun b!1547620 () Bool)

(assert (=> b!1547620 (= e!861446 call!69909)))

(declare-fun b!1547621 () Bool)

(assert (=> b!1547621 (= e!861449 (and e!861448 mapRes!58753))))

(declare-fun condMapEmpty!58753 () Bool)

(declare-fun mapDefault!58753 () ValueCell!18106)

