; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84202 () Bool)

(assert start!84202)

(declare-fun b_free!19789 () Bool)

(declare-fun b_next!19789 () Bool)

(assert (=> start!84202 (= b_free!19789 (not b_next!19789))))

(declare-fun tp!68890 () Bool)

(declare-fun b_and!31671 () Bool)

(assert (=> start!84202 (= tp!68890 b_and!31671)))

(declare-fun b!983252 () Bool)

(declare-fun res!657726 () Bool)

(declare-fun e!554332 () Bool)

(assert (=> b!983252 (=> (not res!657726) (not e!554332))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!61702 0))(
  ( (array!61703 (arr!29704 (Array (_ BitVec 32) (_ BitVec 64))) (size!30184 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61702)

(assert (=> b!983252 (= res!657726 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30184 _keys!1544))))))

(declare-fun b!983253 () Bool)

(declare-fun e!554334 () Bool)

(declare-fun tp_is_empty!22837 () Bool)

(assert (=> b!983253 (= e!554334 tp_is_empty!22837)))

(declare-fun mapNonEmpty!36284 () Bool)

(declare-fun mapRes!36284 () Bool)

(declare-fun tp!68891 () Bool)

(declare-fun e!554331 () Bool)

(assert (=> mapNonEmpty!36284 (= mapRes!36284 (and tp!68891 e!554331))))

(declare-fun mapKey!36284 () (_ BitVec 32))

(declare-datatypes ((V!35433 0))(
  ( (V!35434 (val!11469 Int)) )
))
(declare-datatypes ((ValueCell!10937 0))(
  ( (ValueCellFull!10937 (v!14028 V!35433)) (EmptyCell!10937) )
))
(declare-datatypes ((array!61704 0))(
  ( (array!61705 (arr!29705 (Array (_ BitVec 32) ValueCell!10937)) (size!30185 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61704)

(declare-fun mapValue!36284 () ValueCell!10937)

(declare-fun mapRest!36284 () (Array (_ BitVec 32) ValueCell!10937))

(assert (=> mapNonEmpty!36284 (= (arr!29705 _values!1278) (store mapRest!36284 mapKey!36284 mapValue!36284))))

(declare-fun b!983254 () Bool)

(declare-fun res!657729 () Bool)

(assert (=> b!983254 (=> (not res!657729) (not e!554332))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61702 (_ BitVec 32)) Bool)

(assert (=> b!983254 (= res!657729 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!983255 () Bool)

(declare-fun res!657724 () Bool)

(assert (=> b!983255 (=> (not res!657724) (not e!554332))))

(declare-datatypes ((List!20578 0))(
  ( (Nil!20575) (Cons!20574 (h!21742 (_ BitVec 64)) (t!29309 List!20578)) )
))
(declare-fun arrayNoDuplicates!0 (array!61702 (_ BitVec 32) List!20578) Bool)

(assert (=> b!983255 (= res!657724 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20575))))

(declare-fun mapIsEmpty!36284 () Bool)

(assert (=> mapIsEmpty!36284 mapRes!36284))

(declare-fun b!983256 () Bool)

(declare-fun res!657728 () Bool)

(assert (=> b!983256 (=> (not res!657728) (not e!554332))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!983256 (= res!657728 (validKeyInArray!0 (select (arr!29704 _keys!1544) from!1932)))))

(declare-fun b!983257 () Bool)

(declare-fun e!554330 () Bool)

(assert (=> b!983257 (= e!554330 (and e!554334 mapRes!36284))))

(declare-fun condMapEmpty!36284 () Bool)

(declare-fun mapDefault!36284 () ValueCell!10937)

(assert (=> b!983257 (= condMapEmpty!36284 (= (arr!29705 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10937)) mapDefault!36284)))))

(declare-fun b!983258 () Bool)

(declare-fun e!554333 () Bool)

(assert (=> b!983258 (= e!554332 e!554333)))

(declare-fun res!657723 () Bool)

(assert (=> b!983258 (=> (not res!657723) (not e!554333))))

(assert (=> b!983258 (= res!657723 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29704 _keys!1544) from!1932))))))

(declare-fun lt!436458 () V!35433)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15429 (ValueCell!10937 V!35433) V!35433)

(declare-fun dynLambda!1818 (Int (_ BitVec 64)) V!35433)

(assert (=> b!983258 (= lt!436458 (get!15429 (select (arr!29705 _values!1278) from!1932) (dynLambda!1818 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1220 () V!35433)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!35433)

(declare-datatypes ((tuple2!14702 0))(
  ( (tuple2!14703 (_1!7362 (_ BitVec 64)) (_2!7362 V!35433)) )
))
(declare-datatypes ((List!20579 0))(
  ( (Nil!20576) (Cons!20575 (h!21743 tuple2!14702) (t!29310 List!20579)) )
))
(declare-datatypes ((ListLongMap!13401 0))(
  ( (ListLongMap!13402 (toList!6716 List!20579)) )
))
(declare-fun lt!436461 () ListLongMap!13401)

(declare-fun getCurrentListMapNoExtraKeys!3459 (array!61702 array!61704 (_ BitVec 32) (_ BitVec 32) V!35433 V!35433 (_ BitVec 32) Int) ListLongMap!13401)

(assert (=> b!983258 (= lt!436461 (getCurrentListMapNoExtraKeys!3459 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!983259 () Bool)

(declare-fun res!657730 () Bool)

(assert (=> b!983259 (=> (not res!657730) (not e!554332))))

(assert (=> b!983259 (= res!657730 (and (= (size!30185 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30184 _keys!1544) (size!30185 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!983260 () Bool)

(assert (=> b!983260 (= e!554331 tp_is_empty!22837)))

(declare-fun res!657725 () Bool)

(assert (=> start!84202 (=> (not res!657725) (not e!554332))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84202 (= res!657725 (validMask!0 mask!1948))))

(assert (=> start!84202 e!554332))

(assert (=> start!84202 true))

(assert (=> start!84202 tp_is_empty!22837))

(declare-fun array_inv!22989 (array!61704) Bool)

(assert (=> start!84202 (and (array_inv!22989 _values!1278) e!554330)))

(assert (=> start!84202 tp!68890))

(declare-fun array_inv!22990 (array!61702) Bool)

(assert (=> start!84202 (array_inv!22990 _keys!1544)))

(declare-fun b!983261 () Bool)

(assert (=> b!983261 (= e!554333 (not true))))

(declare-fun lt!436459 () tuple2!14702)

(declare-fun lt!436460 () tuple2!14702)

(declare-fun +!3026 (ListLongMap!13401 tuple2!14702) ListLongMap!13401)

(assert (=> b!983261 (= (+!3026 (+!3026 lt!436461 lt!436459) lt!436460) (+!3026 (+!3026 lt!436461 lt!436460) lt!436459))))

(assert (=> b!983261 (= lt!436460 (tuple2!14703 (select (arr!29704 _keys!1544) from!1932) lt!436458))))

(assert (=> b!983261 (= lt!436459 (tuple2!14703 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32632 0))(
  ( (Unit!32633) )
))
(declare-fun lt!436457 () Unit!32632)

(declare-fun addCommutativeForDiffKeys!633 (ListLongMap!13401 (_ BitVec 64) V!35433 (_ BitVec 64) V!35433) Unit!32632)

(assert (=> b!983261 (= lt!436457 (addCommutativeForDiffKeys!633 lt!436461 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29704 _keys!1544) from!1932) lt!436458))))

(declare-fun b!983262 () Bool)

(declare-fun res!657727 () Bool)

(assert (=> b!983262 (=> (not res!657727) (not e!554332))))

(assert (=> b!983262 (= res!657727 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (= (and start!84202 res!657725) b!983259))

(assert (= (and b!983259 res!657730) b!983254))

(assert (= (and b!983254 res!657729) b!983255))

(assert (= (and b!983255 res!657724) b!983252))

(assert (= (and b!983252 res!657726) b!983256))

(assert (= (and b!983256 res!657728) b!983262))

(assert (= (and b!983262 res!657727) b!983258))

(assert (= (and b!983258 res!657723) b!983261))

(assert (= (and b!983257 condMapEmpty!36284) mapIsEmpty!36284))

(assert (= (and b!983257 (not condMapEmpty!36284)) mapNonEmpty!36284))

(get-info :version)

(assert (= (and mapNonEmpty!36284 ((_ is ValueCellFull!10937) mapValue!36284)) b!983260))

(assert (= (and b!983257 ((_ is ValueCellFull!10937) mapDefault!36284)) b!983253))

(assert (= start!84202 b!983257))

(declare-fun b_lambda!14841 () Bool)

(assert (=> (not b_lambda!14841) (not b!983258)))

(declare-fun t!29308 () Bool)

(declare-fun tb!6581 () Bool)

(assert (=> (and start!84202 (= defaultEntry!1281 defaultEntry!1281) t!29308) tb!6581))

(declare-fun result!13159 () Bool)

(assert (=> tb!6581 (= result!13159 tp_is_empty!22837)))

(assert (=> b!983258 t!29308))

(declare-fun b_and!31673 () Bool)

(assert (= b_and!31671 (and (=> t!29308 result!13159) b_and!31673)))

(declare-fun m!910985 () Bool)

(assert (=> start!84202 m!910985))

(declare-fun m!910987 () Bool)

(assert (=> start!84202 m!910987))

(declare-fun m!910989 () Bool)

(assert (=> start!84202 m!910989))

(declare-fun m!910991 () Bool)

(assert (=> b!983256 m!910991))

(assert (=> b!983256 m!910991))

(declare-fun m!910993 () Bool)

(assert (=> b!983256 m!910993))

(assert (=> b!983258 m!910991))

(declare-fun m!910995 () Bool)

(assert (=> b!983258 m!910995))

(declare-fun m!910997 () Bool)

(assert (=> b!983258 m!910997))

(declare-fun m!910999 () Bool)

(assert (=> b!983258 m!910999))

(assert (=> b!983258 m!910995))

(assert (=> b!983258 m!910999))

(declare-fun m!911001 () Bool)

(assert (=> b!983258 m!911001))

(declare-fun m!911003 () Bool)

(assert (=> b!983255 m!911003))

(declare-fun m!911005 () Bool)

(assert (=> mapNonEmpty!36284 m!911005))

(declare-fun m!911007 () Bool)

(assert (=> b!983254 m!911007))

(assert (=> b!983261 m!910991))

(declare-fun m!911009 () Bool)

(assert (=> b!983261 m!911009))

(declare-fun m!911011 () Bool)

(assert (=> b!983261 m!911011))

(assert (=> b!983261 m!911009))

(declare-fun m!911013 () Bool)

(assert (=> b!983261 m!911013))

(assert (=> b!983261 m!910991))

(declare-fun m!911015 () Bool)

(assert (=> b!983261 m!911015))

(assert (=> b!983261 m!911013))

(declare-fun m!911017 () Bool)

(assert (=> b!983261 m!911017))

(check-sat (not mapNonEmpty!36284) (not b_lambda!14841) (not b!983255) (not b!983258) (not b!983261) (not b!983254) (not b_next!19789) (not start!84202) b_and!31673 tp_is_empty!22837 (not b!983256))
(check-sat b_and!31673 (not b_next!19789))
