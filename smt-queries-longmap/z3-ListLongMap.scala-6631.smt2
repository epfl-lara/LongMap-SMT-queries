; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83926 () Bool)

(assert start!83926)

(declare-fun b_free!19567 () Bool)

(declare-fun b_next!19567 () Bool)

(assert (=> start!83926 (= b_free!19567 (not b_next!19567))))

(declare-fun tp!68144 () Bool)

(declare-fun b_and!31233 () Bool)

(assert (=> start!83926 (= tp!68144 b_and!31233)))

(declare-fun b!978948 () Bool)

(declare-fun e!552014 () Bool)

(assert (=> b!978948 (= e!552014 (not true))))

(declare-datatypes ((V!35065 0))(
  ( (V!35066 (val!11331 Int)) )
))
(declare-datatypes ((tuple2!14530 0))(
  ( (tuple2!14531 (_1!7276 (_ BitVec 64)) (_2!7276 V!35065)) )
))
(declare-datatypes ((List!20394 0))(
  ( (Nil!20391) (Cons!20390 (h!21558 tuple2!14530) (t!28909 List!20394)) )
))
(declare-datatypes ((ListLongMap!13229 0))(
  ( (ListLongMap!13230 (toList!6630 List!20394)) )
))
(declare-fun lt!433949 () ListLongMap!13229)

(declare-fun lt!433950 () tuple2!14530)

(declare-fun lt!433948 () tuple2!14530)

(declare-fun +!2945 (ListLongMap!13229 tuple2!14530) ListLongMap!13229)

(assert (=> b!978948 (= (+!2945 (+!2945 lt!433949 lt!433950) lt!433948) (+!2945 (+!2945 lt!433949 lt!433948) lt!433950))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun lt!433947 () V!35065)

(declare-datatypes ((array!61176 0))(
  ( (array!61177 (arr!29441 (Array (_ BitVec 32) (_ BitVec 64))) (size!29921 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61176)

(assert (=> b!978948 (= lt!433948 (tuple2!14531 (select (arr!29441 _keys!1544) from!1932) lt!433947))))

(declare-fun minValue!1220 () V!35065)

(assert (=> b!978948 (= lt!433950 (tuple2!14531 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32470 0))(
  ( (Unit!32471) )
))
(declare-fun lt!433946 () Unit!32470)

(declare-fun addCommutativeForDiffKeys!552 (ListLongMap!13229 (_ BitVec 64) V!35065 (_ BitVec 64) V!35065) Unit!32470)

(assert (=> b!978948 (= lt!433946 (addCommutativeForDiffKeys!552 lt!433949 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29441 _keys!1544) from!1932) lt!433947))))

(declare-datatypes ((ValueCell!10799 0))(
  ( (ValueCellFull!10799 (v!13890 V!35065)) (EmptyCell!10799) )
))
(declare-datatypes ((array!61178 0))(
  ( (array!61179 (arr!29442 (Array (_ BitVec 32) ValueCell!10799)) (size!29922 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61178)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15259 (ValueCell!10799 V!35065) V!35065)

(declare-fun dynLambda!1740 (Int (_ BitVec 64)) V!35065)

(assert (=> b!978948 (= lt!433947 (get!15259 (select (arr!29442 _values!1278) from!1932) (dynLambda!1740 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!35065)

(declare-fun getCurrentListMapNoExtraKeys!3378 (array!61176 array!61178 (_ BitVec 32) (_ BitVec 32) V!35065 V!35065 (_ BitVec 32) Int) ListLongMap!13229)

(assert (=> b!978948 (= lt!433949 (+!2945 (getCurrentListMapNoExtraKeys!3378 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14531 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(declare-fun b!978949 () Bool)

(declare-fun res!654878 () Bool)

(assert (=> b!978949 (=> (not res!654878) (not e!552014))))

(assert (=> b!978949 (= res!654878 (and (= (size!29922 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29921 _keys!1544) (size!29922 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!978950 () Bool)

(declare-fun res!654882 () Bool)

(assert (=> b!978950 (=> (not res!654882) (not e!552014))))

(assert (=> b!978950 (= res!654882 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!978951 () Bool)

(declare-fun res!654877 () Bool)

(assert (=> b!978951 (=> (not res!654877) (not e!552014))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61176 (_ BitVec 32)) Bool)

(assert (=> b!978951 (= res!654877 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapNonEmpty!35870 () Bool)

(declare-fun mapRes!35870 () Bool)

(declare-fun tp!68143 () Bool)

(declare-fun e!552015 () Bool)

(assert (=> mapNonEmpty!35870 (= mapRes!35870 (and tp!68143 e!552015))))

(declare-fun mapValue!35870 () ValueCell!10799)

(declare-fun mapKey!35870 () (_ BitVec 32))

(declare-fun mapRest!35870 () (Array (_ BitVec 32) ValueCell!10799))

(assert (=> mapNonEmpty!35870 (= (arr!29442 _values!1278) (store mapRest!35870 mapKey!35870 mapValue!35870))))

(declare-fun b!978952 () Bool)

(declare-fun res!654883 () Bool)

(assert (=> b!978952 (=> (not res!654883) (not e!552014))))

(assert (=> b!978952 (= res!654883 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!29921 _keys!1544))))))

(declare-fun b!978953 () Bool)

(declare-fun res!654880 () Bool)

(assert (=> b!978953 (=> (not res!654880) (not e!552014))))

(declare-datatypes ((List!20395 0))(
  ( (Nil!20392) (Cons!20391 (h!21559 (_ BitVec 64)) (t!28910 List!20395)) )
))
(declare-fun arrayNoDuplicates!0 (array!61176 (_ BitVec 32) List!20395) Bool)

(assert (=> b!978953 (= res!654880 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20392))))

(declare-fun b!978954 () Bool)

(declare-fun e!552017 () Bool)

(declare-fun tp_is_empty!22561 () Bool)

(assert (=> b!978954 (= e!552017 tp_is_empty!22561)))

(declare-fun b!978955 () Bool)

(declare-fun e!552018 () Bool)

(assert (=> b!978955 (= e!552018 (and e!552017 mapRes!35870))))

(declare-fun condMapEmpty!35870 () Bool)

(declare-fun mapDefault!35870 () ValueCell!10799)

(assert (=> b!978955 (= condMapEmpty!35870 (= (arr!29442 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10799)) mapDefault!35870)))))

(declare-fun res!654879 () Bool)

(assert (=> start!83926 (=> (not res!654879) (not e!552014))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83926 (= res!654879 (validMask!0 mask!1948))))

(assert (=> start!83926 e!552014))

(assert (=> start!83926 true))

(assert (=> start!83926 tp_is_empty!22561))

(declare-fun array_inv!22807 (array!61178) Bool)

(assert (=> start!83926 (and (array_inv!22807 _values!1278) e!552018)))

(assert (=> start!83926 tp!68144))

(declare-fun array_inv!22808 (array!61176) Bool)

(assert (=> start!83926 (array_inv!22808 _keys!1544)))

(declare-fun b!978956 () Bool)

(assert (=> b!978956 (= e!552015 tp_is_empty!22561)))

(declare-fun mapIsEmpty!35870 () Bool)

(assert (=> mapIsEmpty!35870 mapRes!35870))

(declare-fun b!978957 () Bool)

(declare-fun res!654881 () Bool)

(assert (=> b!978957 (=> (not res!654881) (not e!552014))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!978957 (= res!654881 (validKeyInArray!0 (select (arr!29441 _keys!1544) from!1932)))))

(assert (= (and start!83926 res!654879) b!978949))

(assert (= (and b!978949 res!654878) b!978951))

(assert (= (and b!978951 res!654877) b!978953))

(assert (= (and b!978953 res!654880) b!978952))

(assert (= (and b!978952 res!654883) b!978957))

(assert (= (and b!978957 res!654881) b!978950))

(assert (= (and b!978950 res!654882) b!978948))

(assert (= (and b!978955 condMapEmpty!35870) mapIsEmpty!35870))

(assert (= (and b!978955 (not condMapEmpty!35870)) mapNonEmpty!35870))

(get-info :version)

(assert (= (and mapNonEmpty!35870 ((_ is ValueCellFull!10799) mapValue!35870)) b!978956))

(assert (= (and b!978955 ((_ is ValueCellFull!10799) mapDefault!35870)) b!978954))

(assert (= start!83926 b!978955))

(declare-fun b_lambda!14625 () Bool)

(assert (=> (not b_lambda!14625) (not b!978948)))

(declare-fun t!28908 () Bool)

(declare-fun tb!6365 () Bool)

(assert (=> (and start!83926 (= defaultEntry!1281 defaultEntry!1281) t!28908) tb!6365))

(declare-fun result!12727 () Bool)

(assert (=> tb!6365 (= result!12727 tp_is_empty!22561)))

(assert (=> b!978948 t!28908))

(declare-fun b_and!31235 () Bool)

(assert (= b_and!31233 (and (=> t!28908 result!12727) b_and!31235)))

(declare-fun m!906437 () Bool)

(assert (=> b!978953 m!906437))

(declare-fun m!906439 () Bool)

(assert (=> mapNonEmpty!35870 m!906439))

(declare-fun m!906441 () Bool)

(assert (=> b!978951 m!906441))

(declare-fun m!906443 () Bool)

(assert (=> b!978957 m!906443))

(assert (=> b!978957 m!906443))

(declare-fun m!906445 () Bool)

(assert (=> b!978957 m!906445))

(declare-fun m!906447 () Bool)

(assert (=> start!83926 m!906447))

(declare-fun m!906449 () Bool)

(assert (=> start!83926 m!906449))

(declare-fun m!906451 () Bool)

(assert (=> start!83926 m!906451))

(declare-fun m!906453 () Bool)

(assert (=> b!978948 m!906453))

(assert (=> b!978948 m!906443))

(declare-fun m!906455 () Bool)

(assert (=> b!978948 m!906455))

(declare-fun m!906457 () Bool)

(assert (=> b!978948 m!906457))

(declare-fun m!906459 () Bool)

(assert (=> b!978948 m!906459))

(assert (=> b!978948 m!906453))

(declare-fun m!906461 () Bool)

(assert (=> b!978948 m!906461))

(declare-fun m!906463 () Bool)

(assert (=> b!978948 m!906463))

(assert (=> b!978948 m!906457))

(assert (=> b!978948 m!906463))

(declare-fun m!906465 () Bool)

(assert (=> b!978948 m!906465))

(declare-fun m!906467 () Bool)

(assert (=> b!978948 m!906467))

(assert (=> b!978948 m!906455))

(assert (=> b!978948 m!906467))

(declare-fun m!906469 () Bool)

(assert (=> b!978948 m!906469))

(assert (=> b!978948 m!906443))

(declare-fun m!906471 () Bool)

(assert (=> b!978948 m!906471))

(check-sat b_and!31235 (not start!83926) (not mapNonEmpty!35870) (not b_next!19567) (not b!978948) tp_is_empty!22561 (not b!978957) (not b!978951) (not b!978953) (not b_lambda!14625))
(check-sat b_and!31235 (not b_next!19567))
