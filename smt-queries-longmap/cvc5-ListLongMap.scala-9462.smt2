; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112380 () Bool)

(assert start!112380)

(declare-fun b_free!30775 () Bool)

(declare-fun b_next!30775 () Bool)

(assert (=> start!112380 (= b_free!30775 (not b_next!30775))))

(declare-fun tp!107962 () Bool)

(declare-fun b_and!49605 () Bool)

(assert (=> start!112380 (= tp!107962 b_and!49605)))

(declare-fun b!1332287 () Bool)

(declare-fun e!759015 () Bool)

(declare-fun tp_is_empty!36685 () Bool)

(assert (=> b!1332287 (= e!759015 tp_is_empty!36685)))

(declare-fun mapIsEmpty!56701 () Bool)

(declare-fun mapRes!56701 () Bool)

(assert (=> mapIsEmpty!56701 mapRes!56701))

(declare-fun b!1332288 () Bool)

(declare-fun e!759016 () Bool)

(assert (=> b!1332288 (= e!759016 (not true))))

(declare-datatypes ((V!54017 0))(
  ( (V!54018 (val!18417 Int)) )
))
(declare-datatypes ((tuple2!23736 0))(
  ( (tuple2!23737 (_1!11879 (_ BitVec 64)) (_2!11879 V!54017)) )
))
(declare-datatypes ((List!30879 0))(
  ( (Nil!30876) (Cons!30875 (h!32084 tuple2!23736) (t!45067 List!30879)) )
))
(declare-datatypes ((ListLongMap!21393 0))(
  ( (ListLongMap!21394 (toList!10712 List!30879)) )
))
(declare-fun lt!591936 () ListLongMap!21393)

(declare-fun minValue!1262 () V!54017)

(declare-fun k!1153 () (_ BitVec 64))

(declare-fun contains!8876 (ListLongMap!21393 (_ BitVec 64)) Bool)

(declare-fun +!4705 (ListLongMap!21393 tuple2!23736) ListLongMap!21393)

(assert (=> b!1332288 (contains!8876 (+!4705 lt!591936 (tuple2!23737 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) k!1153)))

(declare-datatypes ((Unit!43859 0))(
  ( (Unit!43860) )
))
(declare-fun lt!591939 () Unit!43859)

(declare-fun addStillContains!1184 (ListLongMap!21393 (_ BitVec 64) V!54017 (_ BitVec 64)) Unit!43859)

(assert (=> b!1332288 (= lt!591939 (addStillContains!1184 lt!591936 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 k!1153))))

(assert (=> b!1332288 (contains!8876 lt!591936 k!1153)))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun lt!591937 () V!54017)

(declare-fun lt!591940 () Unit!43859)

(declare-datatypes ((array!90250 0))(
  ( (array!90251 (arr!43591 (Array (_ BitVec 32) (_ BitVec 64))) (size!44141 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90250)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!292 ((_ BitVec 64) (_ BitVec 64) V!54017 ListLongMap!21393) Unit!43859)

(assert (=> b!1332288 (= lt!591940 (lemmaInListMapAfterAddingDiffThenInBefore!292 k!1153 (select (arr!43591 _keys!1590) from!1980) lt!591937 lt!591936))))

(declare-fun lt!591938 () ListLongMap!21393)

(assert (=> b!1332288 (contains!8876 lt!591938 k!1153)))

(declare-fun lt!591935 () Unit!43859)

(assert (=> b!1332288 (= lt!591935 (lemmaInListMapAfterAddingDiffThenInBefore!292 k!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591938))))

(assert (=> b!1332288 (= lt!591938 (+!4705 lt!591936 (tuple2!23737 (select (arr!43591 _keys!1590) from!1980) lt!591937)))))

(declare-datatypes ((ValueCell!17444 0))(
  ( (ValueCellFull!17444 (v!21054 V!54017)) (EmptyCell!17444) )
))
(declare-datatypes ((array!90252 0))(
  ( (array!90253 (arr!43592 (Array (_ BitVec 32) ValueCell!17444)) (size!44142 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90252)

(declare-fun defaultEntry!1323 () Int)

(declare-fun get!21993 (ValueCell!17444 V!54017) V!54017)

(declare-fun dynLambda!3644 (Int (_ BitVec 64)) V!54017)

(assert (=> b!1332288 (= lt!591937 (get!21993 (select (arr!43592 _values!1320) from!1980) (dynLambda!3644 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun zeroValue!1262 () V!54017)

(declare-fun getCurrentListMapNoExtraKeys!6343 (array!90250 array!90252 (_ BitVec 32) (_ BitVec 32) V!54017 V!54017 (_ BitVec 32) Int) ListLongMap!21393)

(assert (=> b!1332288 (= lt!591936 (getCurrentListMapNoExtraKeys!6343 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun mapNonEmpty!56701 () Bool)

(declare-fun tp!107961 () Bool)

(assert (=> mapNonEmpty!56701 (= mapRes!56701 (and tp!107961 e!759015))))

(declare-fun mapKey!56701 () (_ BitVec 32))

(declare-fun mapValue!56701 () ValueCell!17444)

(declare-fun mapRest!56701 () (Array (_ BitVec 32) ValueCell!17444))

(assert (=> mapNonEmpty!56701 (= (arr!43592 _values!1320) (store mapRest!56701 mapKey!56701 mapValue!56701))))

(declare-fun b!1332289 () Bool)

(declare-fun res!884122 () Bool)

(assert (=> b!1332289 (=> (not res!884122) (not e!759016))))

(assert (=> b!1332289 (= res!884122 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44141 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1332290 () Bool)

(declare-fun res!884126 () Bool)

(assert (=> b!1332290 (=> (not res!884126) (not e!759016))))

(declare-fun getCurrentListMap!5693 (array!90250 array!90252 (_ BitVec 32) (_ BitVec 32) V!54017 V!54017 (_ BitVec 32) Int) ListLongMap!21393)

(assert (=> b!1332290 (= res!884126 (contains!8876 (getCurrentListMap!5693 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun res!884127 () Bool)

(assert (=> start!112380 (=> (not res!884127) (not e!759016))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112380 (= res!884127 (validMask!0 mask!1998))))

(assert (=> start!112380 e!759016))

(declare-fun e!759014 () Bool)

(declare-fun array_inv!32879 (array!90252) Bool)

(assert (=> start!112380 (and (array_inv!32879 _values!1320) e!759014)))

(assert (=> start!112380 true))

(declare-fun array_inv!32880 (array!90250) Bool)

(assert (=> start!112380 (array_inv!32880 _keys!1590)))

(assert (=> start!112380 tp!107962))

(assert (=> start!112380 tp_is_empty!36685))

(declare-fun b!1332291 () Bool)

(declare-fun res!884120 () Bool)

(assert (=> b!1332291 (=> (not res!884120) (not e!759016))))

(assert (=> b!1332291 (= res!884120 (not (= (select (arr!43591 _keys!1590) from!1980) k!1153)))))

(declare-fun b!1332292 () Bool)

(declare-fun res!884119 () Bool)

(assert (=> b!1332292 (=> (not res!884119) (not e!759016))))

(assert (=> b!1332292 (= res!884119 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1332293 () Bool)

(declare-fun res!884124 () Bool)

(assert (=> b!1332293 (=> (not res!884124) (not e!759016))))

(assert (=> b!1332293 (= res!884124 (and (= (size!44142 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44141 _keys!1590) (size!44142 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1332294 () Bool)

(declare-fun res!884121 () Bool)

(assert (=> b!1332294 (=> (not res!884121) (not e!759016))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1332294 (= res!884121 (validKeyInArray!0 (select (arr!43591 _keys!1590) from!1980)))))

(declare-fun b!1332295 () Bool)

(declare-fun res!884123 () Bool)

(assert (=> b!1332295 (=> (not res!884123) (not e!759016))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90250 (_ BitVec 32)) Bool)

(assert (=> b!1332295 (= res!884123 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1332296 () Bool)

(declare-fun e!759012 () Bool)

(assert (=> b!1332296 (= e!759014 (and e!759012 mapRes!56701))))

(declare-fun condMapEmpty!56701 () Bool)

(declare-fun mapDefault!56701 () ValueCell!17444)

