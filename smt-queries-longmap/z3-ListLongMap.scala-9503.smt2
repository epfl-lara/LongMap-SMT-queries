; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112686 () Bool)

(assert start!112686)

(declare-fun b_free!31023 () Bool)

(declare-fun b_next!31023 () Bool)

(assert (=> start!112686 (= b_free!31023 (not b_next!31023))))

(declare-fun tp!108709 () Bool)

(declare-fun b_and!49983 () Bool)

(assert (=> start!112686 (= tp!108709 b_and!49983)))

(declare-fun b!1336747 () Bool)

(declare-fun res!887131 () Bool)

(declare-fun e!761198 () Bool)

(assert (=> b!1336747 (=> (not res!887131) (not e!761198))))

(declare-datatypes ((V!54347 0))(
  ( (V!54348 (val!18541 Int)) )
))
(declare-datatypes ((ValueCell!17568 0))(
  ( (ValueCellFull!17568 (v!21181 V!54347)) (EmptyCell!17568) )
))
(declare-datatypes ((array!90724 0))(
  ( (array!90725 (arr!43827 (Array (_ BitVec 32) ValueCell!17568)) (size!44377 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90724)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90726 0))(
  ( (array!90727 (arr!43828 (Array (_ BitVec 32) (_ BitVec 64))) (size!44378 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90726)

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!54347)

(declare-fun zeroValue!1262 () V!54347)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun k0!1153 () (_ BitVec 64))

(declare-datatypes ((tuple2!23914 0))(
  ( (tuple2!23915 (_1!11968 (_ BitVec 64)) (_2!11968 V!54347)) )
))
(declare-datatypes ((List!31057 0))(
  ( (Nil!31054) (Cons!31053 (h!32262 tuple2!23914) (t!45361 List!31057)) )
))
(declare-datatypes ((ListLongMap!21571 0))(
  ( (ListLongMap!21572 (toList!10801 List!31057)) )
))
(declare-fun contains!8966 (ListLongMap!21571 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5773 (array!90726 array!90724 (_ BitVec 32) (_ BitVec 32) V!54347 V!54347 (_ BitVec 32) Int) ListLongMap!21571)

(assert (=> b!1336747 (= res!887131 (contains!8966 (getCurrentListMap!5773 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1336748 () Bool)

(declare-fun e!761197 () Bool)

(declare-fun tp_is_empty!36933 () Bool)

(assert (=> b!1336748 (= e!761197 tp_is_empty!36933)))

(declare-fun b!1336749 () Bool)

(declare-fun res!887127 () Bool)

(assert (=> b!1336749 (=> (not res!887127) (not e!761198))))

(declare-datatypes ((List!31058 0))(
  ( (Nil!31055) (Cons!31054 (h!32263 (_ BitVec 64)) (t!45362 List!31058)) )
))
(declare-fun arrayNoDuplicates!0 (array!90726 (_ BitVec 32) List!31058) Bool)

(assert (=> b!1336749 (= res!887127 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31055))))

(declare-fun b!1336750 () Bool)

(assert (=> b!1336750 (= e!761198 (not true))))

(declare-fun lt!592837 () ListLongMap!21571)

(assert (=> b!1336750 (contains!8966 lt!592837 k0!1153)))

(declare-fun lt!592839 () V!54347)

(declare-datatypes ((Unit!43932 0))(
  ( (Unit!43933) )
))
(declare-fun lt!592841 () Unit!43932)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!321 ((_ BitVec 64) (_ BitVec 64) V!54347 ListLongMap!21571) Unit!43932)

(assert (=> b!1336750 (= lt!592841 (lemmaInListMapAfterAddingDiffThenInBefore!321 k0!1153 (select (arr!43828 _keys!1590) from!1980) lt!592839 lt!592837))))

(declare-fun lt!592838 () ListLongMap!21571)

(assert (=> b!1336750 (contains!8966 lt!592838 k0!1153)))

(declare-fun lt!592840 () Unit!43932)

(assert (=> b!1336750 (= lt!592840 (lemmaInListMapAfterAddingDiffThenInBefore!321 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!592838))))

(declare-fun +!4742 (ListLongMap!21571 tuple2!23914) ListLongMap!21571)

(assert (=> b!1336750 (= lt!592838 (+!4742 lt!592837 (tuple2!23915 (select (arr!43828 _keys!1590) from!1980) lt!592839)))))

(declare-fun get!22115 (ValueCell!17568 V!54347) V!54347)

(declare-fun dynLambda!3681 (Int (_ BitVec 64)) V!54347)

(assert (=> b!1336750 (= lt!592839 (get!22115 (select (arr!43827 _values!1320) from!1980) (dynLambda!3681 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6384 (array!90726 array!90724 (_ BitVec 32) (_ BitVec 32) V!54347 V!54347 (_ BitVec 32) Int) ListLongMap!21571)

(assert (=> b!1336750 (= lt!592837 (getCurrentListMapNoExtraKeys!6384 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun b!1336751 () Bool)

(declare-fun res!887128 () Bool)

(assert (=> b!1336751 (=> (not res!887128) (not e!761198))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1336751 (= res!887128 (validKeyInArray!0 (select (arr!43828 _keys!1590) from!1980)))))

(declare-fun b!1336752 () Bool)

(declare-fun res!887130 () Bool)

(assert (=> b!1336752 (=> (not res!887130) (not e!761198))))

(assert (=> b!1336752 (= res!887130 (not (= (select (arr!43828 _keys!1590) from!1980) k0!1153)))))

(declare-fun mapNonEmpty!57077 () Bool)

(declare-fun mapRes!57077 () Bool)

(declare-fun tp!108710 () Bool)

(declare-fun e!761199 () Bool)

(assert (=> mapNonEmpty!57077 (= mapRes!57077 (and tp!108710 e!761199))))

(declare-fun mapRest!57077 () (Array (_ BitVec 32) ValueCell!17568))

(declare-fun mapValue!57077 () ValueCell!17568)

(declare-fun mapKey!57077 () (_ BitVec 32))

(assert (=> mapNonEmpty!57077 (= (arr!43827 _values!1320) (store mapRest!57077 mapKey!57077 mapValue!57077))))

(declare-fun b!1336753 () Bool)

(declare-fun res!887124 () Bool)

(assert (=> b!1336753 (=> (not res!887124) (not e!761198))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90726 (_ BitVec 32)) Bool)

(assert (=> b!1336753 (= res!887124 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun res!887132 () Bool)

(assert (=> start!112686 (=> (not res!887132) (not e!761198))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112686 (= res!887132 (validMask!0 mask!1998))))

(assert (=> start!112686 e!761198))

(declare-fun e!761200 () Bool)

(declare-fun array_inv!33053 (array!90724) Bool)

(assert (=> start!112686 (and (array_inv!33053 _values!1320) e!761200)))

(assert (=> start!112686 true))

(declare-fun array_inv!33054 (array!90726) Bool)

(assert (=> start!112686 (array_inv!33054 _keys!1590)))

(assert (=> start!112686 tp!108709))

(assert (=> start!112686 tp_is_empty!36933))

(declare-fun b!1336754 () Bool)

(declare-fun res!887126 () Bool)

(assert (=> b!1336754 (=> (not res!887126) (not e!761198))))

(assert (=> b!1336754 (= res!887126 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44378 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1336755 () Bool)

(declare-fun res!887129 () Bool)

(assert (=> b!1336755 (=> (not res!887129) (not e!761198))))

(assert (=> b!1336755 (= res!887129 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1336756 () Bool)

(assert (=> b!1336756 (= e!761200 (and e!761197 mapRes!57077))))

(declare-fun condMapEmpty!57077 () Bool)

(declare-fun mapDefault!57077 () ValueCell!17568)

(assert (=> b!1336756 (= condMapEmpty!57077 (= (arr!43827 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17568)) mapDefault!57077)))))

(declare-fun mapIsEmpty!57077 () Bool)

(assert (=> mapIsEmpty!57077 mapRes!57077))

(declare-fun b!1336757 () Bool)

(declare-fun res!887125 () Bool)

(assert (=> b!1336757 (=> (not res!887125) (not e!761198))))

(assert (=> b!1336757 (= res!887125 (and (= (size!44377 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44378 _keys!1590) (size!44377 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1336758 () Bool)

(assert (=> b!1336758 (= e!761199 tp_is_empty!36933)))

(assert (= (and start!112686 res!887132) b!1336757))

(assert (= (and b!1336757 res!887125) b!1336753))

(assert (= (and b!1336753 res!887124) b!1336749))

(assert (= (and b!1336749 res!887127) b!1336754))

(assert (= (and b!1336754 res!887126) b!1336747))

(assert (= (and b!1336747 res!887131) b!1336752))

(assert (= (and b!1336752 res!887130) b!1336751))

(assert (= (and b!1336751 res!887128) b!1336755))

(assert (= (and b!1336755 res!887129) b!1336750))

(assert (= (and b!1336756 condMapEmpty!57077) mapIsEmpty!57077))

(assert (= (and b!1336756 (not condMapEmpty!57077)) mapNonEmpty!57077))

(get-info :version)

(assert (= (and mapNonEmpty!57077 ((_ is ValueCellFull!17568) mapValue!57077)) b!1336758))

(assert (= (and b!1336756 ((_ is ValueCellFull!17568) mapDefault!57077)) b!1336748))

(assert (= start!112686 b!1336756))

(declare-fun b_lambda!24181 () Bool)

(assert (=> (not b_lambda!24181) (not b!1336750)))

(declare-fun t!45360 () Bool)

(declare-fun tb!12107 () Bool)

(assert (=> (and start!112686 (= defaultEntry!1323 defaultEntry!1323) t!45360) tb!12107))

(declare-fun result!25287 () Bool)

(assert (=> tb!12107 (= result!25287 tp_is_empty!36933)))

(assert (=> b!1336750 t!45360))

(declare-fun b_and!49985 () Bool)

(assert (= b_and!49983 (and (=> t!45360 result!25287) b_and!49985)))

(declare-fun m!1224807 () Bool)

(assert (=> mapNonEmpty!57077 m!1224807))

(declare-fun m!1224809 () Bool)

(assert (=> b!1336750 m!1224809))

(declare-fun m!1224811 () Bool)

(assert (=> b!1336750 m!1224811))

(declare-fun m!1224813 () Bool)

(assert (=> b!1336750 m!1224813))

(assert (=> b!1336750 m!1224811))

(declare-fun m!1224815 () Bool)

(assert (=> b!1336750 m!1224815))

(declare-fun m!1224817 () Bool)

(assert (=> b!1336750 m!1224817))

(declare-fun m!1224819 () Bool)

(assert (=> b!1336750 m!1224819))

(declare-fun m!1224821 () Bool)

(assert (=> b!1336750 m!1224821))

(declare-fun m!1224823 () Bool)

(assert (=> b!1336750 m!1224823))

(declare-fun m!1224825 () Bool)

(assert (=> b!1336750 m!1224825))

(assert (=> b!1336750 m!1224813))

(assert (=> b!1336750 m!1224821))

(declare-fun m!1224827 () Bool)

(assert (=> b!1336750 m!1224827))

(declare-fun m!1224829 () Bool)

(assert (=> b!1336753 m!1224829))

(assert (=> b!1336752 m!1224821))

(assert (=> b!1336751 m!1224821))

(assert (=> b!1336751 m!1224821))

(declare-fun m!1224831 () Bool)

(assert (=> b!1336751 m!1224831))

(declare-fun m!1224833 () Bool)

(assert (=> b!1336747 m!1224833))

(assert (=> b!1336747 m!1224833))

(declare-fun m!1224835 () Bool)

(assert (=> b!1336747 m!1224835))

(declare-fun m!1224837 () Bool)

(assert (=> b!1336749 m!1224837))

(declare-fun m!1224839 () Bool)

(assert (=> start!112686 m!1224839))

(declare-fun m!1224841 () Bool)

(assert (=> start!112686 m!1224841))

(declare-fun m!1224843 () Bool)

(assert (=> start!112686 m!1224843))

(check-sat b_and!49985 (not b!1336751) (not mapNonEmpty!57077) (not b_lambda!24181) (not start!112686) (not b!1336747) (not b_next!31023) (not b!1336750) (not b!1336753) tp_is_empty!36933 (not b!1336749))
(check-sat b_and!49985 (not b_next!31023))
