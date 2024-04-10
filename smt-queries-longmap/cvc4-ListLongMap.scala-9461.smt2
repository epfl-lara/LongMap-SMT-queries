; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112378 () Bool)

(assert start!112378)

(declare-fun b_free!30773 () Bool)

(declare-fun b_next!30773 () Bool)

(assert (=> start!112378 (= b_free!30773 (not b_next!30773))))

(declare-fun tp!107956 () Bool)

(declare-fun b_and!49601 () Bool)

(assert (=> start!112378 (= tp!107956 b_and!49601)))

(declare-fun b!1332249 () Bool)

(declare-fun res!884095 () Bool)

(declare-fun e!758998 () Bool)

(assert (=> b!1332249 (=> (not res!884095) (not e!758998))))

(declare-datatypes ((array!90246 0))(
  ( (array!90247 (arr!43589 (Array (_ BitVec 32) (_ BitVec 64))) (size!44139 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90246)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1332249 (= res!884095 (validKeyInArray!0 (select (arr!43589 _keys!1590) from!1980)))))

(declare-fun b!1332250 () Bool)

(declare-fun res!884099 () Bool)

(assert (=> b!1332250 (=> (not res!884099) (not e!758998))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1332250 (= res!884099 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1332251 () Bool)

(assert (=> b!1332251 (= e!758998 (not true))))

(declare-datatypes ((V!54013 0))(
  ( (V!54014 (val!18416 Int)) )
))
(declare-datatypes ((tuple2!23734 0))(
  ( (tuple2!23735 (_1!11878 (_ BitVec 64)) (_2!11878 V!54013)) )
))
(declare-datatypes ((List!30877 0))(
  ( (Nil!30874) (Cons!30873 (h!32082 tuple2!23734) (t!45063 List!30877)) )
))
(declare-datatypes ((ListLongMap!21391 0))(
  ( (ListLongMap!21392 (toList!10711 List!30877)) )
))
(declare-fun lt!591918 () ListLongMap!21391)

(declare-fun minValue!1262 () V!54013)

(declare-fun k!1153 () (_ BitVec 64))

(declare-fun contains!8875 (ListLongMap!21391 (_ BitVec 64)) Bool)

(declare-fun +!4704 (ListLongMap!21391 tuple2!23734) ListLongMap!21391)

(assert (=> b!1332251 (contains!8875 (+!4704 lt!591918 (tuple2!23735 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) k!1153)))

(declare-datatypes ((Unit!43857 0))(
  ( (Unit!43858) )
))
(declare-fun lt!591920 () Unit!43857)

(declare-fun addStillContains!1183 (ListLongMap!21391 (_ BitVec 64) V!54013 (_ BitVec 64)) Unit!43857)

(assert (=> b!1332251 (= lt!591920 (addStillContains!1183 lt!591918 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 k!1153))))

(assert (=> b!1332251 (contains!8875 lt!591918 k!1153)))

(declare-fun lt!591919 () V!54013)

(declare-fun lt!591922 () Unit!43857)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!291 ((_ BitVec 64) (_ BitVec 64) V!54013 ListLongMap!21391) Unit!43857)

(assert (=> b!1332251 (= lt!591922 (lemmaInListMapAfterAddingDiffThenInBefore!291 k!1153 (select (arr!43589 _keys!1590) from!1980) lt!591919 lt!591918))))

(declare-fun lt!591917 () ListLongMap!21391)

(assert (=> b!1332251 (contains!8875 lt!591917 k!1153)))

(declare-fun lt!591921 () Unit!43857)

(assert (=> b!1332251 (= lt!591921 (lemmaInListMapAfterAddingDiffThenInBefore!291 k!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591917))))

(assert (=> b!1332251 (= lt!591917 (+!4704 lt!591918 (tuple2!23735 (select (arr!43589 _keys!1590) from!1980) lt!591919)))))

(declare-datatypes ((ValueCell!17443 0))(
  ( (ValueCellFull!17443 (v!21053 V!54013)) (EmptyCell!17443) )
))
(declare-datatypes ((array!90248 0))(
  ( (array!90249 (arr!43590 (Array (_ BitVec 32) ValueCell!17443)) (size!44140 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90248)

(declare-fun defaultEntry!1323 () Int)

(declare-fun get!21990 (ValueCell!17443 V!54013) V!54013)

(declare-fun dynLambda!3643 (Int (_ BitVec 64)) V!54013)

(assert (=> b!1332251 (= lt!591919 (get!21990 (select (arr!43590 _values!1320) from!1980) (dynLambda!3643 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun zeroValue!1262 () V!54013)

(declare-fun getCurrentListMapNoExtraKeys!6342 (array!90246 array!90248 (_ BitVec 32) (_ BitVec 32) V!54013 V!54013 (_ BitVec 32) Int) ListLongMap!21391)

(assert (=> b!1332251 (= lt!591918 (getCurrentListMapNoExtraKeys!6342 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun b!1332252 () Bool)

(declare-fun res!884093 () Bool)

(assert (=> b!1332252 (=> (not res!884093) (not e!758998))))

(assert (=> b!1332252 (= res!884093 (and (= (size!44140 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44139 _keys!1590) (size!44140 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1332253 () Bool)

(declare-fun res!884096 () Bool)

(assert (=> b!1332253 (=> (not res!884096) (not e!758998))))

(declare-fun getCurrentListMap!5692 (array!90246 array!90248 (_ BitVec 32) (_ BitVec 32) V!54013 V!54013 (_ BitVec 32) Int) ListLongMap!21391)

(assert (=> b!1332253 (= res!884096 (contains!8875 (getCurrentListMap!5692 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun b!1332254 () Bool)

(declare-fun res!884097 () Bool)

(assert (=> b!1332254 (=> (not res!884097) (not e!758998))))

(assert (=> b!1332254 (= res!884097 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44139 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1332255 () Bool)

(declare-fun e!758999 () Bool)

(declare-fun tp_is_empty!36683 () Bool)

(assert (=> b!1332255 (= e!758999 tp_is_empty!36683)))

(declare-fun b!1332256 () Bool)

(declare-fun res!884098 () Bool)

(assert (=> b!1332256 (=> (not res!884098) (not e!758998))))

(declare-datatypes ((List!30878 0))(
  ( (Nil!30875) (Cons!30874 (h!32083 (_ BitVec 64)) (t!45064 List!30878)) )
))
(declare-fun arrayNoDuplicates!0 (array!90246 (_ BitVec 32) List!30878) Bool)

(assert (=> b!1332256 (= res!884098 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30875))))

(declare-fun b!1332257 () Bool)

(declare-fun res!884100 () Bool)

(assert (=> b!1332257 (=> (not res!884100) (not e!758998))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90246 (_ BitVec 32)) Bool)

(assert (=> b!1332257 (= res!884100 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun mapIsEmpty!56698 () Bool)

(declare-fun mapRes!56698 () Bool)

(assert (=> mapIsEmpty!56698 mapRes!56698))

(declare-fun res!884092 () Bool)

(assert (=> start!112378 (=> (not res!884092) (not e!758998))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112378 (= res!884092 (validMask!0 mask!1998))))

(assert (=> start!112378 e!758998))

(declare-fun e!759000 () Bool)

(declare-fun array_inv!32877 (array!90248) Bool)

(assert (=> start!112378 (and (array_inv!32877 _values!1320) e!759000)))

(assert (=> start!112378 true))

(declare-fun array_inv!32878 (array!90246) Bool)

(assert (=> start!112378 (array_inv!32878 _keys!1590)))

(assert (=> start!112378 tp!107956))

(assert (=> start!112378 tp_is_empty!36683))

(declare-fun b!1332258 () Bool)

(declare-fun res!884094 () Bool)

(assert (=> b!1332258 (=> (not res!884094) (not e!758998))))

(assert (=> b!1332258 (= res!884094 (not (= (select (arr!43589 _keys!1590) from!1980) k!1153)))))

(declare-fun b!1332259 () Bool)

(declare-fun e!759001 () Bool)

(assert (=> b!1332259 (= e!759001 tp_is_empty!36683)))

(declare-fun mapNonEmpty!56698 () Bool)

(declare-fun tp!107955 () Bool)

(assert (=> mapNonEmpty!56698 (= mapRes!56698 (and tp!107955 e!758999))))

(declare-fun mapKey!56698 () (_ BitVec 32))

(declare-fun mapValue!56698 () ValueCell!17443)

(declare-fun mapRest!56698 () (Array (_ BitVec 32) ValueCell!17443))

(assert (=> mapNonEmpty!56698 (= (arr!43590 _values!1320) (store mapRest!56698 mapKey!56698 mapValue!56698))))

(declare-fun b!1332260 () Bool)

(assert (=> b!1332260 (= e!759000 (and e!759001 mapRes!56698))))

(declare-fun condMapEmpty!56698 () Bool)

(declare-fun mapDefault!56698 () ValueCell!17443)

