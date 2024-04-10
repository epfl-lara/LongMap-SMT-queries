; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83898 () Bool)

(assert start!83898)

(declare-fun b_free!19707 () Bool)

(declare-fun b_next!19707 () Bool)

(assert (=> start!83898 (= b_free!19707 (not b_next!19707))))

(declare-fun tp!68563 () Bool)

(declare-fun b_and!31503 () Bool)

(assert (=> start!83898 (= tp!68563 b_and!31503)))

(declare-fun b!980416 () Bool)

(declare-fun res!656141 () Bool)

(declare-fun e!552616 () Bool)

(assert (=> b!980416 (=> (not res!656141) (not e!552616))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!61409 0))(
  ( (array!61410 (arr!29562 (Array (_ BitVec 32) (_ BitVec 64))) (size!30041 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61409)

(assert (=> b!980416 (= res!656141 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30041 _keys!1544))))))

(declare-fun b!980417 () Bool)

(declare-fun res!656135 () Bool)

(assert (=> b!980417 (=> (not res!656135) (not e!552616))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61409 (_ BitVec 32)) Bool)

(assert (=> b!980417 (= res!656135 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!980418 () Bool)

(declare-fun e!552618 () Bool)

(declare-fun tp_is_empty!22701 () Bool)

(assert (=> b!980418 (= e!552618 tp_is_empty!22701)))

(declare-fun b!980419 () Bool)

(declare-fun e!552614 () Bool)

(assert (=> b!980419 (= e!552614 tp_is_empty!22701)))

(declare-fun b!980421 () Bool)

(declare-fun e!552615 () Bool)

(assert (=> b!980421 (= e!552615 true)))

(declare-datatypes ((V!35251 0))(
  ( (V!35252 (val!11401 Int)) )
))
(declare-datatypes ((tuple2!14622 0))(
  ( (tuple2!14623 (_1!7322 (_ BitVec 64)) (_2!7322 V!35251)) )
))
(declare-datatypes ((List!20489 0))(
  ( (Nil!20486) (Cons!20485 (h!21647 tuple2!14622) (t!29152 List!20489)) )
))
(declare-datatypes ((ListLongMap!13319 0))(
  ( (ListLongMap!13320 (toList!6675 List!20489)) )
))
(declare-fun lt!435298 () ListLongMap!13319)

(declare-fun lt!435293 () tuple2!14622)

(declare-fun lt!435295 () ListLongMap!13319)

(declare-fun lt!435296 () tuple2!14622)

(declare-fun +!2980 (ListLongMap!13319 tuple2!14622) ListLongMap!13319)

(assert (=> b!980421 (= lt!435295 (+!2980 (+!2980 lt!435298 lt!435296) lt!435293))))

(declare-fun lt!435297 () V!35251)

(declare-fun zeroValue!1220 () V!35251)

(declare-datatypes ((Unit!32599 0))(
  ( (Unit!32600) )
))
(declare-fun lt!435290 () Unit!32599)

(declare-fun addCommutativeForDiffKeys!608 (ListLongMap!13319 (_ BitVec 64) V!35251 (_ BitVec 64) V!35251) Unit!32599)

(assert (=> b!980421 (= lt!435290 (addCommutativeForDiffKeys!608 lt!435298 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29562 _keys!1544) from!1932) lt!435297))))

(declare-fun b!980422 () Bool)

(declare-fun e!552613 () Bool)

(declare-fun mapRes!36080 () Bool)

(assert (=> b!980422 (= e!552613 (and e!552618 mapRes!36080))))

(declare-fun condMapEmpty!36080 () Bool)

(declare-datatypes ((ValueCell!10869 0))(
  ( (ValueCellFull!10869 (v!13963 V!35251)) (EmptyCell!10869) )
))
(declare-datatypes ((array!61411 0))(
  ( (array!61412 (arr!29563 (Array (_ BitVec 32) ValueCell!10869)) (size!30042 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61411)

(declare-fun mapDefault!36080 () ValueCell!10869)

(assert (=> b!980422 (= condMapEmpty!36080 (= (arr!29563 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10869)) mapDefault!36080)))))

(declare-fun b!980423 () Bool)

(declare-fun res!656137 () Bool)

(assert (=> b!980423 (=> (not res!656137) (not e!552616))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!980423 (= res!656137 (and (= (size!30042 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30041 _keys!1544) (size!30042 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!980424 () Bool)

(declare-fun res!656134 () Bool)

(assert (=> b!980424 (=> (not res!656134) (not e!552616))))

(assert (=> b!980424 (= res!656134 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!36080 () Bool)

(declare-fun tp!68562 () Bool)

(assert (=> mapNonEmpty!36080 (= mapRes!36080 (and tp!68562 e!552614))))

(declare-fun mapKey!36080 () (_ BitVec 32))

(declare-fun mapRest!36080 () (Array (_ BitVec 32) ValueCell!10869))

(declare-fun mapValue!36080 () ValueCell!10869)

(assert (=> mapNonEmpty!36080 (= (arr!29563 _values!1278) (store mapRest!36080 mapKey!36080 mapValue!36080))))

(declare-fun b!980420 () Bool)

(declare-fun res!656140 () Bool)

(assert (=> b!980420 (=> (not res!656140) (not e!552616))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!980420 (= res!656140 (validKeyInArray!0 (select (arr!29562 _keys!1544) from!1932)))))

(declare-fun res!656136 () Bool)

(assert (=> start!83898 (=> (not res!656136) (not e!552616))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83898 (= res!656136 (validMask!0 mask!1948))))

(assert (=> start!83898 e!552616))

(assert (=> start!83898 true))

(assert (=> start!83898 tp_is_empty!22701))

(declare-fun array_inv!22853 (array!61411) Bool)

(assert (=> start!83898 (and (array_inv!22853 _values!1278) e!552613)))

(assert (=> start!83898 tp!68563))

(declare-fun array_inv!22854 (array!61409) Bool)

(assert (=> start!83898 (array_inv!22854 _keys!1544)))

(declare-fun mapIsEmpty!36080 () Bool)

(assert (=> mapIsEmpty!36080 mapRes!36080))

(declare-fun b!980425 () Bool)

(assert (=> b!980425 (= e!552616 (not e!552615))))

(declare-fun res!656138 () Bool)

(assert (=> b!980425 (=> res!656138 e!552615)))

(assert (=> b!980425 (= res!656138 (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29562 _keys!1544) from!1932)))))

(declare-fun lt!435291 () tuple2!14622)

(declare-fun lt!435294 () ListLongMap!13319)

(assert (=> b!980425 (= (+!2980 lt!435294 lt!435296) (+!2980 lt!435295 lt!435291))))

(declare-fun lt!435292 () ListLongMap!13319)

(assert (=> b!980425 (= lt!435295 (+!2980 lt!435292 lt!435296))))

(assert (=> b!980425 (= lt!435296 (tuple2!14623 (select (arr!29562 _keys!1544) from!1932) lt!435297))))

(assert (=> b!980425 (= lt!435294 (+!2980 lt!435292 lt!435291))))

(declare-fun minValue!1220 () V!35251)

(assert (=> b!980425 (= lt!435291 (tuple2!14623 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-fun lt!435299 () Unit!32599)

(assert (=> b!980425 (= lt!435299 (addCommutativeForDiffKeys!608 lt!435292 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29562 _keys!1544) from!1932) lt!435297))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15327 (ValueCell!10869 V!35251) V!35251)

(declare-fun dynLambda!1766 (Int (_ BitVec 64)) V!35251)

(assert (=> b!980425 (= lt!435297 (get!15327 (select (arr!29563 _values!1278) from!1932) (dynLambda!1766 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!980425 (= lt!435292 (+!2980 lt!435298 lt!435293))))

(assert (=> b!980425 (= lt!435293 (tuple2!14623 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-fun getCurrentListMapNoExtraKeys!3380 (array!61409 array!61411 (_ BitVec 32) (_ BitVec 32) V!35251 V!35251 (_ BitVec 32) Int) ListLongMap!13319)

(assert (=> b!980425 (= lt!435298 (getCurrentListMapNoExtraKeys!3380 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!980426 () Bool)

(declare-fun res!656139 () Bool)

(assert (=> b!980426 (=> (not res!656139) (not e!552616))))

(declare-datatypes ((List!20490 0))(
  ( (Nil!20487) (Cons!20486 (h!21648 (_ BitVec 64)) (t!29153 List!20490)) )
))
(declare-fun arrayNoDuplicates!0 (array!61409 (_ BitVec 32) List!20490) Bool)

(assert (=> b!980426 (= res!656139 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20487))))

(assert (= (and start!83898 res!656136) b!980423))

(assert (= (and b!980423 res!656137) b!980417))

(assert (= (and b!980417 res!656135) b!980426))

(assert (= (and b!980426 res!656139) b!980416))

(assert (= (and b!980416 res!656141) b!980420))

(assert (= (and b!980420 res!656140) b!980424))

(assert (= (and b!980424 res!656134) b!980425))

(assert (= (and b!980425 (not res!656138)) b!980421))

(assert (= (and b!980422 condMapEmpty!36080) mapIsEmpty!36080))

(assert (= (and b!980422 (not condMapEmpty!36080)) mapNonEmpty!36080))

(get-info :version)

(assert (= (and mapNonEmpty!36080 ((_ is ValueCellFull!10869) mapValue!36080)) b!980419))

(assert (= (and b!980422 ((_ is ValueCellFull!10869) mapDefault!36080)) b!980418))

(assert (= start!83898 b!980422))

(declare-fun b_lambda!14751 () Bool)

(assert (=> (not b_lambda!14751) (not b!980425)))

(declare-fun t!29151 () Bool)

(declare-fun tb!6513 () Bool)

(assert (=> (and start!83898 (= defaultEntry!1281 defaultEntry!1281) t!29151) tb!6513))

(declare-fun result!13015 () Bool)

(assert (=> tb!6513 (= result!13015 tp_is_empty!22701)))

(assert (=> b!980425 t!29151))

(declare-fun b_and!31505 () Bool)

(assert (= b_and!31503 (and (=> t!29151 result!13015) b_and!31505)))

(declare-fun m!907921 () Bool)

(assert (=> b!980417 m!907921))

(declare-fun m!907923 () Bool)

(assert (=> b!980421 m!907923))

(assert (=> b!980421 m!907923))

(declare-fun m!907925 () Bool)

(assert (=> b!980421 m!907925))

(declare-fun m!907927 () Bool)

(assert (=> b!980421 m!907927))

(assert (=> b!980421 m!907927))

(declare-fun m!907929 () Bool)

(assert (=> b!980421 m!907929))

(declare-fun m!907931 () Bool)

(assert (=> start!83898 m!907931))

(declare-fun m!907933 () Bool)

(assert (=> start!83898 m!907933))

(declare-fun m!907935 () Bool)

(assert (=> start!83898 m!907935))

(declare-fun m!907937 () Bool)

(assert (=> b!980426 m!907937))

(assert (=> b!980420 m!907927))

(assert (=> b!980420 m!907927))

(declare-fun m!907939 () Bool)

(assert (=> b!980420 m!907939))

(declare-fun m!907941 () Bool)

(assert (=> mapNonEmpty!36080 m!907941))

(declare-fun m!907943 () Bool)

(assert (=> b!980425 m!907943))

(assert (=> b!980425 m!907927))

(declare-fun m!907945 () Bool)

(assert (=> b!980425 m!907945))

(declare-fun m!907947 () Bool)

(assert (=> b!980425 m!907947))

(declare-fun m!907949 () Bool)

(assert (=> b!980425 m!907949))

(declare-fun m!907951 () Bool)

(assert (=> b!980425 m!907951))

(declare-fun m!907953 () Bool)

(assert (=> b!980425 m!907953))

(declare-fun m!907955 () Bool)

(assert (=> b!980425 m!907955))

(assert (=> b!980425 m!907927))

(declare-fun m!907957 () Bool)

(assert (=> b!980425 m!907957))

(declare-fun m!907959 () Bool)

(assert (=> b!980425 m!907959))

(assert (=> b!980425 m!907945))

(assert (=> b!980425 m!907959))

(declare-fun m!907961 () Bool)

(assert (=> b!980425 m!907961))

(check-sat (not b!980420) (not b!980426) (not b_lambda!14751) (not b!980421) (not b!980425) (not mapNonEmpty!36080) b_and!31505 tp_is_empty!22701 (not b!980417) (not b_next!19707) (not start!83898))
(check-sat b_and!31505 (not b_next!19707))
