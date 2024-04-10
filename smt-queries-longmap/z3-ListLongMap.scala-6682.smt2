; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84066 () Bool)

(assert start!84066)

(declare-fun b_free!19821 () Bool)

(declare-fun b_next!19821 () Bool)

(assert (=> start!84066 (= b_free!19821 (not b_next!19821))))

(declare-fun tp!68986 () Bool)

(declare-fun b_and!31725 () Bool)

(assert (=> start!84066 (= tp!68986 b_and!31725)))

(declare-fun mapNonEmpty!36332 () Bool)

(declare-fun mapRes!36332 () Bool)

(declare-fun tp!68985 () Bool)

(declare-fun e!554040 () Bool)

(assert (=> mapNonEmpty!36332 (= mapRes!36332 (and tp!68985 e!554040))))

(declare-fun mapKey!36332 () (_ BitVec 32))

(declare-datatypes ((V!35475 0))(
  ( (V!35476 (val!11485 Int)) )
))
(declare-datatypes ((ValueCell!10953 0))(
  ( (ValueCellFull!10953 (v!14047 V!35475)) (EmptyCell!10953) )
))
(declare-fun mapValue!36332 () ValueCell!10953)

(declare-fun mapRest!36332 () (Array (_ BitVec 32) ValueCell!10953))

(declare-datatypes ((array!61727 0))(
  ( (array!61728 (arr!29721 (Array (_ BitVec 32) ValueCell!10953)) (size!30200 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61727)

(assert (=> mapNonEmpty!36332 (= (arr!29721 _values!1278) (store mapRest!36332 mapKey!36332 mapValue!36332))))

(declare-fun b!982909 () Bool)

(declare-fun e!554036 () Bool)

(declare-fun tp_is_empty!22869 () Bool)

(assert (=> b!982909 (= e!554036 tp_is_empty!22869)))

(declare-fun b!982910 () Bool)

(declare-fun e!554039 () Bool)

(assert (=> b!982910 (= e!554039 (and e!554036 mapRes!36332))))

(declare-fun condMapEmpty!36332 () Bool)

(declare-fun mapDefault!36332 () ValueCell!10953)

(assert (=> b!982910 (= condMapEmpty!36332 (= (arr!29721 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10953)) mapDefault!36332)))))

(declare-fun b!982911 () Bool)

(declare-fun res!657767 () Bool)

(declare-fun e!554035 () Bool)

(assert (=> b!982911 (=> (not res!657767) (not e!554035))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!61729 0))(
  ( (array!61730 (arr!29722 (Array (_ BitVec 32) (_ BitVec 64))) (size!30201 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61729)

(assert (=> b!982911 (= res!657767 (and (= (size!30200 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30201 _keys!1544) (size!30200 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!982912 () Bool)

(declare-fun res!657766 () Bool)

(assert (=> b!982912 (=> (not res!657766) (not e!554035))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!982912 (= res!657766 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30201 _keys!1544))))))

(declare-fun b!982913 () Bool)

(declare-fun res!657770 () Bool)

(assert (=> b!982913 (=> (not res!657770) (not e!554035))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61729 (_ BitVec 32)) Bool)

(assert (=> b!982913 (= res!657770 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!982914 () Bool)

(declare-fun e!554037 () Bool)

(assert (=> b!982914 (= e!554037 (not true))))

(declare-datatypes ((tuple2!14714 0))(
  ( (tuple2!14715 (_1!7368 (_ BitVec 64)) (_2!7368 V!35475)) )
))
(declare-datatypes ((List!20592 0))(
  ( (Nil!20589) (Cons!20588 (h!21750 tuple2!14714) (t!29363 List!20592)) )
))
(declare-datatypes ((ListLongMap!13411 0))(
  ( (ListLongMap!13412 (toList!6721 List!20592)) )
))
(declare-fun lt!436338 () ListLongMap!13411)

(declare-fun lt!436340 () tuple2!14714)

(declare-fun lt!436337 () tuple2!14714)

(declare-fun +!3018 (ListLongMap!13411 tuple2!14714) ListLongMap!13411)

(assert (=> b!982914 (= (+!3018 (+!3018 lt!436338 lt!436340) lt!436337) (+!3018 (+!3018 lt!436338 lt!436337) lt!436340))))

(declare-fun lt!436339 () V!35475)

(assert (=> b!982914 (= lt!436337 (tuple2!14715 (select (arr!29722 _keys!1544) from!1932) lt!436339))))

(declare-fun zeroValue!1220 () V!35475)

(assert (=> b!982914 (= lt!436340 (tuple2!14715 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32675 0))(
  ( (Unit!32676) )
))
(declare-fun lt!436336 () Unit!32675)

(declare-fun addCommutativeForDiffKeys!646 (ListLongMap!13411 (_ BitVec 64) V!35475 (_ BitVec 64) V!35475) Unit!32675)

(assert (=> b!982914 (= lt!436336 (addCommutativeForDiffKeys!646 lt!436338 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29722 _keys!1544) from!1932) lt!436339))))

(declare-fun mapIsEmpty!36332 () Bool)

(assert (=> mapIsEmpty!36332 mapRes!36332))

(declare-fun b!982915 () Bool)

(assert (=> b!982915 (= e!554035 e!554037)))

(declare-fun res!657763 () Bool)

(assert (=> b!982915 (=> (not res!657763) (not e!554037))))

(assert (=> b!982915 (= res!657763 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29722 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15418 (ValueCell!10953 V!35475) V!35475)

(declare-fun dynLambda!1801 (Int (_ BitVec 64)) V!35475)

(assert (=> b!982915 (= lt!436339 (get!15418 (select (arr!29721 _values!1278) from!1932) (dynLambda!1801 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1220 () V!35475)

(declare-fun getCurrentListMapNoExtraKeys!3418 (array!61729 array!61727 (_ BitVec 32) (_ BitVec 32) V!35475 V!35475 (_ BitVec 32) Int) ListLongMap!13411)

(assert (=> b!982915 (= lt!436338 (getCurrentListMapNoExtraKeys!3418 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!982917 () Bool)

(assert (=> b!982917 (= e!554040 tp_is_empty!22869)))

(declare-fun b!982918 () Bool)

(declare-fun res!657765 () Bool)

(assert (=> b!982918 (=> (not res!657765) (not e!554035))))

(declare-datatypes ((List!20593 0))(
  ( (Nil!20590) (Cons!20589 (h!21751 (_ BitVec 64)) (t!29364 List!20593)) )
))
(declare-fun arrayNoDuplicates!0 (array!61729 (_ BitVec 32) List!20593) Bool)

(assert (=> b!982918 (= res!657765 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20590))))

(declare-fun b!982919 () Bool)

(declare-fun res!657768 () Bool)

(assert (=> b!982919 (=> (not res!657768) (not e!554035))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!982919 (= res!657768 (validKeyInArray!0 (select (arr!29722 _keys!1544) from!1932)))))

(declare-fun b!982916 () Bool)

(declare-fun res!657764 () Bool)

(assert (=> b!982916 (=> (not res!657764) (not e!554035))))

(assert (=> b!982916 (= res!657764 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!657769 () Bool)

(assert (=> start!84066 (=> (not res!657769) (not e!554035))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84066 (= res!657769 (validMask!0 mask!1948))))

(assert (=> start!84066 e!554035))

(assert (=> start!84066 true))

(assert (=> start!84066 tp_is_empty!22869))

(declare-fun array_inv!22983 (array!61727) Bool)

(assert (=> start!84066 (and (array_inv!22983 _values!1278) e!554039)))

(assert (=> start!84066 tp!68986))

(declare-fun array_inv!22984 (array!61729) Bool)

(assert (=> start!84066 (array_inv!22984 _keys!1544)))

(assert (= (and start!84066 res!657769) b!982911))

(assert (= (and b!982911 res!657767) b!982913))

(assert (= (and b!982913 res!657770) b!982918))

(assert (= (and b!982918 res!657765) b!982912))

(assert (= (and b!982912 res!657766) b!982919))

(assert (= (and b!982919 res!657768) b!982916))

(assert (= (and b!982916 res!657764) b!982915))

(assert (= (and b!982915 res!657763) b!982914))

(assert (= (and b!982910 condMapEmpty!36332) mapIsEmpty!36332))

(assert (= (and b!982910 (not condMapEmpty!36332)) mapNonEmpty!36332))

(get-info :version)

(assert (= (and mapNonEmpty!36332 ((_ is ValueCellFull!10953) mapValue!36332)) b!982917))

(assert (= (and b!982910 ((_ is ValueCellFull!10953) mapDefault!36332)) b!982909))

(assert (= start!84066 b!982910))

(declare-fun b_lambda!14859 () Bool)

(assert (=> (not b_lambda!14859) (not b!982915)))

(declare-fun t!29362 () Bool)

(declare-fun tb!6621 () Bool)

(assert (=> (and start!84066 (= defaultEntry!1281 defaultEntry!1281) t!29362) tb!6621))

(declare-fun result!13231 () Bool)

(assert (=> tb!6621 (= result!13231 tp_is_empty!22869)))

(assert (=> b!982915 t!29362))

(declare-fun b_and!31727 () Bool)

(assert (= b_and!31725 (and (=> t!29362 result!13231) b_and!31727)))

(declare-fun m!910235 () Bool)

(assert (=> mapNonEmpty!36332 m!910235))

(declare-fun m!910237 () Bool)

(assert (=> b!982918 m!910237))

(declare-fun m!910239 () Bool)

(assert (=> start!84066 m!910239))

(declare-fun m!910241 () Bool)

(assert (=> start!84066 m!910241))

(declare-fun m!910243 () Bool)

(assert (=> start!84066 m!910243))

(declare-fun m!910245 () Bool)

(assert (=> b!982914 m!910245))

(declare-fun m!910247 () Bool)

(assert (=> b!982914 m!910247))

(declare-fun m!910249 () Bool)

(assert (=> b!982914 m!910249))

(assert (=> b!982914 m!910249))

(declare-fun m!910251 () Bool)

(assert (=> b!982914 m!910251))

(assert (=> b!982914 m!910247))

(declare-fun m!910253 () Bool)

(assert (=> b!982914 m!910253))

(assert (=> b!982914 m!910245))

(declare-fun m!910255 () Bool)

(assert (=> b!982914 m!910255))

(assert (=> b!982919 m!910247))

(assert (=> b!982919 m!910247))

(declare-fun m!910257 () Bool)

(assert (=> b!982919 m!910257))

(declare-fun m!910259 () Bool)

(assert (=> b!982913 m!910259))

(assert (=> b!982915 m!910247))

(declare-fun m!910261 () Bool)

(assert (=> b!982915 m!910261))

(declare-fun m!910263 () Bool)

(assert (=> b!982915 m!910263))

(declare-fun m!910265 () Bool)

(assert (=> b!982915 m!910265))

(assert (=> b!982915 m!910261))

(assert (=> b!982915 m!910265))

(declare-fun m!910267 () Bool)

(assert (=> b!982915 m!910267))

(check-sat (not b!982919) (not b_next!19821) (not b!982915) b_and!31727 (not start!84066) (not b!982914) (not b_lambda!14859) (not b!982918) (not b!982913) tp_is_empty!22869 (not mapNonEmpty!36332))
(check-sat b_and!31727 (not b_next!19821))
