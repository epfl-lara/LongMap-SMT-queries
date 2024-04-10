; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112362 () Bool)

(assert start!112362)

(declare-fun b_free!30757 () Bool)

(declare-fun b_next!30757 () Bool)

(assert (=> start!112362 (= b_free!30757 (not b_next!30757))))

(declare-fun tp!107908 () Bool)

(declare-fun b_and!49569 () Bool)

(assert (=> start!112362 (= tp!107908 b_and!49569)))

(declare-fun b!1331945 () Bool)

(declare-fun res!883877 () Bool)

(declare-fun e!758879 () Bool)

(assert (=> b!1331945 (=> (not res!883877) (not e!758879))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90214 0))(
  ( (array!90215 (arr!43573 (Array (_ BitVec 32) (_ BitVec 64))) (size!44123 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90214)

(declare-fun k!1153 () (_ BitVec 64))

(assert (=> b!1331945 (= res!883877 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44123 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1331946 () Bool)

(declare-fun res!883879 () Bool)

(assert (=> b!1331946 (=> (not res!883879) (not e!758879))))

(declare-datatypes ((V!53993 0))(
  ( (V!53994 (val!18408 Int)) )
))
(declare-datatypes ((ValueCell!17435 0))(
  ( (ValueCellFull!17435 (v!21045 V!53993)) (EmptyCell!17435) )
))
(declare-datatypes ((array!90216 0))(
  ( (array!90217 (arr!43574 (Array (_ BitVec 32) ValueCell!17435)) (size!44124 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90216)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!53993)

(declare-fun zeroValue!1262 () V!53993)

(declare-datatypes ((tuple2!23718 0))(
  ( (tuple2!23719 (_1!11870 (_ BitVec 64)) (_2!11870 V!53993)) )
))
(declare-datatypes ((List!30866 0))(
  ( (Nil!30863) (Cons!30862 (h!32071 tuple2!23718) (t!45036 List!30866)) )
))
(declare-datatypes ((ListLongMap!21375 0))(
  ( (ListLongMap!21376 (toList!10703 List!30866)) )
))
(declare-fun contains!8867 (ListLongMap!21375 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5685 (array!90214 array!90216 (_ BitVec 32) (_ BitVec 32) V!53993 V!53993 (_ BitVec 32) Int) ListLongMap!21375)

(assert (=> b!1331946 (= res!883879 (contains!8867 (getCurrentListMap!5685 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun b!1331947 () Bool)

(assert (=> b!1331947 (= e!758879 (not true))))

(declare-fun lt!591775 () ListLongMap!21375)

(declare-fun +!4697 (ListLongMap!21375 tuple2!23718) ListLongMap!21375)

(assert (=> b!1331947 (contains!8867 (+!4697 lt!591775 (tuple2!23719 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) k!1153)))

(declare-datatypes ((Unit!43843 0))(
  ( (Unit!43844) )
))
(declare-fun lt!591773 () Unit!43843)

(declare-fun addStillContains!1176 (ListLongMap!21375 (_ BitVec 64) V!53993 (_ BitVec 64)) Unit!43843)

(assert (=> b!1331947 (= lt!591773 (addStillContains!1176 lt!591775 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 k!1153))))

(assert (=> b!1331947 (contains!8867 lt!591775 k!1153)))

(declare-fun lt!591774 () V!53993)

(declare-fun lt!591777 () Unit!43843)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!284 ((_ BitVec 64) (_ BitVec 64) V!53993 ListLongMap!21375) Unit!43843)

(assert (=> b!1331947 (= lt!591777 (lemmaInListMapAfterAddingDiffThenInBefore!284 k!1153 (select (arr!43573 _keys!1590) from!1980) lt!591774 lt!591775))))

(declare-fun lt!591778 () ListLongMap!21375)

(assert (=> b!1331947 (contains!8867 lt!591778 k!1153)))

(declare-fun lt!591776 () Unit!43843)

(assert (=> b!1331947 (= lt!591776 (lemmaInListMapAfterAddingDiffThenInBefore!284 k!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591778))))

(assert (=> b!1331947 (= lt!591778 (+!4697 lt!591775 (tuple2!23719 (select (arr!43573 _keys!1590) from!1980) lt!591774)))))

(declare-fun get!21979 (ValueCell!17435 V!53993) V!53993)

(declare-fun dynLambda!3636 (Int (_ BitVec 64)) V!53993)

(assert (=> b!1331947 (= lt!591774 (get!21979 (select (arr!43574 _values!1320) from!1980) (dynLambda!3636 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6335 (array!90214 array!90216 (_ BitVec 32) (_ BitVec 32) V!53993 V!53993 (_ BitVec 32) Int) ListLongMap!21375)

(assert (=> b!1331947 (= lt!591775 (getCurrentListMapNoExtraKeys!6335 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun b!1331948 () Bool)

(declare-fun res!883876 () Bool)

(assert (=> b!1331948 (=> (not res!883876) (not e!758879))))

(assert (=> b!1331948 (= res!883876 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1331949 () Bool)

(declare-fun res!883881 () Bool)

(assert (=> b!1331949 (=> (not res!883881) (not e!758879))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1331949 (= res!883881 (validKeyInArray!0 (select (arr!43573 _keys!1590) from!1980)))))

(declare-fun b!1331950 () Bool)

(declare-fun res!883878 () Bool)

(assert (=> b!1331950 (=> (not res!883878) (not e!758879))))

(assert (=> b!1331950 (= res!883878 (and (= (size!44124 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44123 _keys!1590) (size!44124 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!56674 () Bool)

(declare-fun mapRes!56674 () Bool)

(declare-fun tp!107907 () Bool)

(declare-fun e!758881 () Bool)

(assert (=> mapNonEmpty!56674 (= mapRes!56674 (and tp!107907 e!758881))))

(declare-fun mapKey!56674 () (_ BitVec 32))

(declare-fun mapRest!56674 () (Array (_ BitVec 32) ValueCell!17435))

(declare-fun mapValue!56674 () ValueCell!17435)

(assert (=> mapNonEmpty!56674 (= (arr!43574 _values!1320) (store mapRest!56674 mapKey!56674 mapValue!56674))))

(declare-fun b!1331952 () Bool)

(declare-fun e!758877 () Bool)

(declare-fun e!758880 () Bool)

(assert (=> b!1331952 (= e!758877 (and e!758880 mapRes!56674))))

(declare-fun condMapEmpty!56674 () Bool)

(declare-fun mapDefault!56674 () ValueCell!17435)

