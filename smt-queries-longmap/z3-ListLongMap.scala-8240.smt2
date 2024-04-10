; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100372 () Bool)

(assert start!100372)

(declare-fun b_free!25713 () Bool)

(declare-fun b_next!25713 () Bool)

(assert (=> start!100372 (= b_free!25713 (not b_next!25713))))

(declare-fun tp!90126 () Bool)

(declare-fun b_and!42317 () Bool)

(assert (=> start!100372 (= tp!90126 b_and!42317)))

(declare-fun b!1198002 () Bool)

(declare-fun e!680533 () Bool)

(declare-fun e!680536 () Bool)

(assert (=> b!1198002 (= e!680533 e!680536)))

(declare-fun res!797301 () Bool)

(assert (=> b!1198002 (=> (not res!797301) (not e!680536))))

(declare-datatypes ((array!77611 0))(
  ( (array!77612 (arr!37451 (Array (_ BitVec 32) (_ BitVec 64))) (size!37987 (_ BitVec 32))) )
))
(declare-fun lt!543383 () array!77611)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77611 (_ BitVec 32)) Bool)

(assert (=> b!1198002 (= res!797301 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543383 mask!1564))))

(declare-fun _keys!1208 () array!77611)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1198002 (= lt!543383 (array!77612 (store (arr!37451 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37987 _keys!1208)))))

(declare-fun res!797305 () Bool)

(assert (=> start!100372 (=> (not res!797305) (not e!680533))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100372 (= res!797305 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37987 _keys!1208))))))

(assert (=> start!100372 e!680533))

(declare-fun tp_is_empty!30417 () Bool)

(assert (=> start!100372 tp_is_empty!30417))

(declare-fun array_inv!28542 (array!77611) Bool)

(assert (=> start!100372 (array_inv!28542 _keys!1208)))

(assert (=> start!100372 true))

(assert (=> start!100372 tp!90126))

(declare-datatypes ((V!45683 0))(
  ( (V!45684 (val!15265 Int)) )
))
(declare-datatypes ((ValueCell!14499 0))(
  ( (ValueCellFull!14499 (v!17903 V!45683)) (EmptyCell!14499) )
))
(declare-datatypes ((array!77613 0))(
  ( (array!77614 (arr!37452 (Array (_ BitVec 32) ValueCell!14499)) (size!37988 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77613)

(declare-fun e!680531 () Bool)

(declare-fun array_inv!28543 (array!77613) Bool)

(assert (=> start!100372 (and (array_inv!28543 _values!996) e!680531)))

(declare-fun b!1198003 () Bool)

(declare-fun res!797300 () Bool)

(assert (=> b!1198003 (=> (not res!797300) (not e!680533))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1198003 (= res!797300 (validKeyInArray!0 k0!934))))

(declare-fun b!1198004 () Bool)

(declare-fun res!797303 () Bool)

(assert (=> b!1198004 (=> (not res!797303) (not e!680533))))

(declare-datatypes ((List!26345 0))(
  ( (Nil!26342) (Cons!26341 (h!27550 (_ BitVec 64)) (t!39050 List!26345)) )
))
(declare-fun arrayNoDuplicates!0 (array!77611 (_ BitVec 32) List!26345) Bool)

(assert (=> b!1198004 (= res!797303 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26342))))

(declare-fun b!1198005 () Bool)

(declare-fun e!680534 () Bool)

(assert (=> b!1198005 (= e!680536 (not e!680534))))

(declare-fun res!797309 () Bool)

(assert (=> b!1198005 (=> res!797309 e!680534)))

(assert (=> b!1198005 (= res!797309 (or (bvsle from!1455 i!673) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!37987 _keys!1208))))))

(declare-fun arrayContainsKey!0 (array!77611 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1198005 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39722 0))(
  ( (Unit!39723) )
))
(declare-fun lt!543384 () Unit!39722)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77611 (_ BitVec 64) (_ BitVec 32)) Unit!39722)

(assert (=> b!1198005 (= lt!543384 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1198006 () Bool)

(declare-fun res!797307 () Bool)

(assert (=> b!1198006 (=> (not res!797307) (not e!680536))))

(assert (=> b!1198006 (= res!797307 (arrayNoDuplicates!0 lt!543383 #b00000000000000000000000000000000 Nil!26342))))

(declare-fun mapIsEmpty!47465 () Bool)

(declare-fun mapRes!47465 () Bool)

(assert (=> mapIsEmpty!47465 mapRes!47465))

(declare-fun b!1198007 () Bool)

(declare-fun res!797304 () Bool)

(assert (=> b!1198007 (=> (not res!797304) (not e!680533))))

(assert (=> b!1198007 (= res!797304 (= (select (arr!37451 _keys!1208) i!673) k0!934))))

(declare-fun b!1198008 () Bool)

(declare-fun res!797310 () Bool)

(assert (=> b!1198008 (=> (not res!797310) (not e!680533))))

(assert (=> b!1198008 (= res!797310 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37987 _keys!1208))))))

(declare-fun b!1198009 () Bool)

(declare-fun e!680535 () Bool)

(assert (=> b!1198009 (= e!680535 tp_is_empty!30417)))

(declare-fun zeroValue!944 () V!45683)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun b!1198010 () Bool)

(declare-fun minValue!944 () V!45683)

(declare-datatypes ((tuple2!19528 0))(
  ( (tuple2!19529 (_1!9775 (_ BitVec 64)) (_2!9775 V!45683)) )
))
(declare-datatypes ((List!26346 0))(
  ( (Nil!26343) (Cons!26342 (h!27551 tuple2!19528) (t!39051 List!26346)) )
))
(declare-datatypes ((ListLongMap!17497 0))(
  ( (ListLongMap!17498 (toList!8764 List!26346)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5203 (array!77611 array!77613 (_ BitVec 32) (_ BitVec 32) V!45683 V!45683 (_ BitVec 32) Int) ListLongMap!17497)

(declare-fun dynLambda!3127 (Int (_ BitVec 64)) V!45683)

(assert (=> b!1198010 (= e!680534 (= (getCurrentListMapNoExtraKeys!5203 lt!543383 (array!77614 (store (arr!37452 _values!996) i!673 (ValueCellFull!14499 (dynLambda!3127 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37988 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) (getCurrentListMapNoExtraKeys!5203 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004)))))

(declare-fun b!1198011 () Bool)

(declare-fun res!797308 () Bool)

(assert (=> b!1198011 (=> (not res!797308) (not e!680533))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1198011 (= res!797308 (validMask!0 mask!1564))))

(declare-fun b!1198012 () Bool)

(declare-fun e!680532 () Bool)

(assert (=> b!1198012 (= e!680531 (and e!680532 mapRes!47465))))

(declare-fun condMapEmpty!47465 () Bool)

(declare-fun mapDefault!47465 () ValueCell!14499)

(assert (=> b!1198012 (= condMapEmpty!47465 (= (arr!37452 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14499)) mapDefault!47465)))))

(declare-fun b!1198013 () Bool)

(declare-fun res!797306 () Bool)

(assert (=> b!1198013 (=> (not res!797306) (not e!680533))))

(assert (=> b!1198013 (= res!797306 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1198014 () Bool)

(assert (=> b!1198014 (= e!680532 tp_is_empty!30417)))

(declare-fun b!1198015 () Bool)

(declare-fun res!797302 () Bool)

(assert (=> b!1198015 (=> (not res!797302) (not e!680533))))

(assert (=> b!1198015 (= res!797302 (and (= (size!37988 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37987 _keys!1208) (size!37988 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!47465 () Bool)

(declare-fun tp!90125 () Bool)

(assert (=> mapNonEmpty!47465 (= mapRes!47465 (and tp!90125 e!680535))))

(declare-fun mapRest!47465 () (Array (_ BitVec 32) ValueCell!14499))

(declare-fun mapKey!47465 () (_ BitVec 32))

(declare-fun mapValue!47465 () ValueCell!14499)

(assert (=> mapNonEmpty!47465 (= (arr!37452 _values!996) (store mapRest!47465 mapKey!47465 mapValue!47465))))

(assert (= (and start!100372 res!797305) b!1198011))

(assert (= (and b!1198011 res!797308) b!1198015))

(assert (= (and b!1198015 res!797302) b!1198013))

(assert (= (and b!1198013 res!797306) b!1198004))

(assert (= (and b!1198004 res!797303) b!1198008))

(assert (= (and b!1198008 res!797310) b!1198003))

(assert (= (and b!1198003 res!797300) b!1198007))

(assert (= (and b!1198007 res!797304) b!1198002))

(assert (= (and b!1198002 res!797301) b!1198006))

(assert (= (and b!1198006 res!797307) b!1198005))

(assert (= (and b!1198005 (not res!797309)) b!1198010))

(assert (= (and b!1198012 condMapEmpty!47465) mapIsEmpty!47465))

(assert (= (and b!1198012 (not condMapEmpty!47465)) mapNonEmpty!47465))

(get-info :version)

(assert (= (and mapNonEmpty!47465 ((_ is ValueCellFull!14499) mapValue!47465)) b!1198009))

(assert (= (and b!1198012 ((_ is ValueCellFull!14499) mapDefault!47465)) b!1198014))

(assert (= start!100372 b!1198012))

(declare-fun b_lambda!20903 () Bool)

(assert (=> (not b_lambda!20903) (not b!1198010)))

(declare-fun t!39049 () Bool)

(declare-fun tb!10525 () Bool)

(assert (=> (and start!100372 (= defaultEntry!1004 defaultEntry!1004) t!39049) tb!10525))

(declare-fun result!21625 () Bool)

(assert (=> tb!10525 (= result!21625 tp_is_empty!30417)))

(assert (=> b!1198010 t!39049))

(declare-fun b_and!42319 () Bool)

(assert (= b_and!42317 (and (=> t!39049 result!21625) b_and!42319)))

(declare-fun m!1104875 () Bool)

(assert (=> mapNonEmpty!47465 m!1104875))

(declare-fun m!1104877 () Bool)

(assert (=> b!1198010 m!1104877))

(declare-fun m!1104879 () Bool)

(assert (=> b!1198010 m!1104879))

(declare-fun m!1104881 () Bool)

(assert (=> b!1198010 m!1104881))

(declare-fun m!1104883 () Bool)

(assert (=> b!1198010 m!1104883))

(declare-fun m!1104885 () Bool)

(assert (=> b!1198007 m!1104885))

(declare-fun m!1104887 () Bool)

(assert (=> start!100372 m!1104887))

(declare-fun m!1104889 () Bool)

(assert (=> start!100372 m!1104889))

(declare-fun m!1104891 () Bool)

(assert (=> b!1198006 m!1104891))

(declare-fun m!1104893 () Bool)

(assert (=> b!1198005 m!1104893))

(declare-fun m!1104895 () Bool)

(assert (=> b!1198005 m!1104895))

(declare-fun m!1104897 () Bool)

(assert (=> b!1198002 m!1104897))

(declare-fun m!1104899 () Bool)

(assert (=> b!1198002 m!1104899))

(declare-fun m!1104901 () Bool)

(assert (=> b!1198004 m!1104901))

(declare-fun m!1104903 () Bool)

(assert (=> b!1198013 m!1104903))

(declare-fun m!1104905 () Bool)

(assert (=> b!1198003 m!1104905))

(declare-fun m!1104907 () Bool)

(assert (=> b!1198011 m!1104907))

(check-sat (not b!1198006) (not b!1198003) (not b!1198002) (not start!100372) b_and!42319 (not mapNonEmpty!47465) (not b!1198011) (not b!1198004) (not b_lambda!20903) (not b_next!25713) (not b!1198010) (not b!1198005) tp_is_empty!30417 (not b!1198013))
(check-sat b_and!42319 (not b_next!25713))
(get-model)

(declare-fun b_lambda!20907 () Bool)

(assert (= b_lambda!20903 (or (and start!100372 b_free!25713) b_lambda!20907)))

(check-sat (not b!1198006) (not b!1198003) (not b!1198002) (not start!100372) b_and!42319 (not mapNonEmpty!47465) (not b!1198011) (not b!1198004) (not b!1198010) (not b!1198005) (not b_next!25713) (not b_lambda!20907) tp_is_empty!30417 (not b!1198013))
(check-sat b_and!42319 (not b_next!25713))
(get-model)

(declare-fun d!132397 () Bool)

(assert (=> d!132397 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1198003 d!132397))

(declare-fun d!132399 () Bool)

(declare-fun res!797348 () Bool)

(declare-fun e!680567 () Bool)

(assert (=> d!132399 (=> res!797348 e!680567)))

(assert (=> d!132399 (= res!797348 (bvsge #b00000000000000000000000000000000 (size!37987 _keys!1208)))))

(assert (=> d!132399 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!680567)))

(declare-fun b!1198070 () Bool)

(declare-fun e!680565 () Bool)

(declare-fun call!57272 () Bool)

(assert (=> b!1198070 (= e!680565 call!57272)))

(declare-fun b!1198071 () Bool)

(declare-fun e!680566 () Bool)

(assert (=> b!1198071 (= e!680567 e!680566)))

(declare-fun c!117416 () Bool)

(assert (=> b!1198071 (= c!117416 (validKeyInArray!0 (select (arr!37451 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun bm!57269 () Bool)

(assert (=> bm!57269 (= call!57272 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun b!1198072 () Bool)

(assert (=> b!1198072 (= e!680566 e!680565)))

(declare-fun lt!543397 () (_ BitVec 64))

(assert (=> b!1198072 (= lt!543397 (select (arr!37451 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!543399 () Unit!39722)

(assert (=> b!1198072 (= lt!543399 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!543397 #b00000000000000000000000000000000))))

(assert (=> b!1198072 (arrayContainsKey!0 _keys!1208 lt!543397 #b00000000000000000000000000000000)))

(declare-fun lt!543398 () Unit!39722)

(assert (=> b!1198072 (= lt!543398 lt!543399)))

(declare-fun res!797349 () Bool)

(declare-datatypes ((SeekEntryResult!9932 0))(
  ( (MissingZero!9932 (index!42099 (_ BitVec 32))) (Found!9932 (index!42100 (_ BitVec 32))) (Intermediate!9932 (undefined!10744 Bool) (index!42101 (_ BitVec 32)) (x!105928 (_ BitVec 32))) (Undefined!9932) (MissingVacant!9932 (index!42102 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!77611 (_ BitVec 32)) SeekEntryResult!9932)

(assert (=> b!1198072 (= res!797349 (= (seekEntryOrOpen!0 (select (arr!37451 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9932 #b00000000000000000000000000000000)))))

(assert (=> b!1198072 (=> (not res!797349) (not e!680565))))

(declare-fun b!1198073 () Bool)

(assert (=> b!1198073 (= e!680566 call!57272)))

(assert (= (and d!132399 (not res!797348)) b!1198071))

(assert (= (and b!1198071 c!117416) b!1198072))

(assert (= (and b!1198071 (not c!117416)) b!1198073))

(assert (= (and b!1198072 res!797349) b!1198070))

(assert (= (or b!1198070 b!1198073) bm!57269))

(declare-fun m!1104943 () Bool)

(assert (=> b!1198071 m!1104943))

(assert (=> b!1198071 m!1104943))

(declare-fun m!1104945 () Bool)

(assert (=> b!1198071 m!1104945))

(declare-fun m!1104947 () Bool)

(assert (=> bm!57269 m!1104947))

(assert (=> b!1198072 m!1104943))

(declare-fun m!1104949 () Bool)

(assert (=> b!1198072 m!1104949))

(declare-fun m!1104951 () Bool)

(assert (=> b!1198072 m!1104951))

(assert (=> b!1198072 m!1104943))

(declare-fun m!1104953 () Bool)

(assert (=> b!1198072 m!1104953))

(assert (=> b!1198013 d!132399))

(declare-fun d!132401 () Bool)

(assert (=> d!132401 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1198011 d!132401))

(declare-fun d!132403 () Bool)

(declare-fun res!797350 () Bool)

(declare-fun e!680570 () Bool)

(assert (=> d!132403 (=> res!797350 e!680570)))

(assert (=> d!132403 (= res!797350 (bvsge #b00000000000000000000000000000000 (size!37987 lt!543383)))))

(assert (=> d!132403 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543383 mask!1564) e!680570)))

(declare-fun b!1198074 () Bool)

(declare-fun e!680568 () Bool)

(declare-fun call!57273 () Bool)

(assert (=> b!1198074 (= e!680568 call!57273)))

(declare-fun b!1198075 () Bool)

(declare-fun e!680569 () Bool)

(assert (=> b!1198075 (= e!680570 e!680569)))

(declare-fun c!117417 () Bool)

(assert (=> b!1198075 (= c!117417 (validKeyInArray!0 (select (arr!37451 lt!543383) #b00000000000000000000000000000000)))))

(declare-fun bm!57270 () Bool)

(assert (=> bm!57270 (= call!57273 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!543383 mask!1564))))

(declare-fun b!1198076 () Bool)

(assert (=> b!1198076 (= e!680569 e!680568)))

(declare-fun lt!543400 () (_ BitVec 64))

(assert (=> b!1198076 (= lt!543400 (select (arr!37451 lt!543383) #b00000000000000000000000000000000))))

(declare-fun lt!543402 () Unit!39722)

(assert (=> b!1198076 (= lt!543402 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!543383 lt!543400 #b00000000000000000000000000000000))))

(assert (=> b!1198076 (arrayContainsKey!0 lt!543383 lt!543400 #b00000000000000000000000000000000)))

(declare-fun lt!543401 () Unit!39722)

(assert (=> b!1198076 (= lt!543401 lt!543402)))

(declare-fun res!797351 () Bool)

(assert (=> b!1198076 (= res!797351 (= (seekEntryOrOpen!0 (select (arr!37451 lt!543383) #b00000000000000000000000000000000) lt!543383 mask!1564) (Found!9932 #b00000000000000000000000000000000)))))

(assert (=> b!1198076 (=> (not res!797351) (not e!680568))))

(declare-fun b!1198077 () Bool)

(assert (=> b!1198077 (= e!680569 call!57273)))

(assert (= (and d!132403 (not res!797350)) b!1198075))

(assert (= (and b!1198075 c!117417) b!1198076))

(assert (= (and b!1198075 (not c!117417)) b!1198077))

(assert (= (and b!1198076 res!797351) b!1198074))

(assert (= (or b!1198074 b!1198077) bm!57270))

(declare-fun m!1104955 () Bool)

(assert (=> b!1198075 m!1104955))

(assert (=> b!1198075 m!1104955))

(declare-fun m!1104957 () Bool)

(assert (=> b!1198075 m!1104957))

(declare-fun m!1104959 () Bool)

(assert (=> bm!57270 m!1104959))

(assert (=> b!1198076 m!1104955))

(declare-fun m!1104961 () Bool)

(assert (=> b!1198076 m!1104961))

(declare-fun m!1104963 () Bool)

(assert (=> b!1198076 m!1104963))

(assert (=> b!1198076 m!1104955))

(declare-fun m!1104965 () Bool)

(assert (=> b!1198076 m!1104965))

(assert (=> b!1198002 d!132403))

(declare-fun d!132405 () Bool)

(assert (=> d!132405 (= (array_inv!28542 _keys!1208) (bvsge (size!37987 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!100372 d!132405))

(declare-fun d!132407 () Bool)

(assert (=> d!132407 (= (array_inv!28543 _values!996) (bvsge (size!37988 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!100372 d!132407))

(declare-fun b!1198102 () Bool)

(declare-fun e!680589 () ListLongMap!17497)

(assert (=> b!1198102 (= e!680589 (ListLongMap!17498 Nil!26343))))

(declare-fun d!132409 () Bool)

(declare-fun e!680590 () Bool)

(assert (=> d!132409 e!680590))

(declare-fun res!797360 () Bool)

(assert (=> d!132409 (=> (not res!797360) (not e!680590))))

(declare-fun lt!543417 () ListLongMap!17497)

(declare-fun contains!6866 (ListLongMap!17497 (_ BitVec 64)) Bool)

(assert (=> d!132409 (= res!797360 (not (contains!6866 lt!543417 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!132409 (= lt!543417 e!680589)))

(declare-fun c!117429 () Bool)

(assert (=> d!132409 (= c!117429 (bvsge from!1455 (size!37987 lt!543383)))))

(assert (=> d!132409 (validMask!0 mask!1564)))

(assert (=> d!132409 (= (getCurrentListMapNoExtraKeys!5203 lt!543383 (array!77614 (store (arr!37452 _values!996) i!673 (ValueCellFull!14499 (dynLambda!3127 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37988 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!543417)))

(declare-fun b!1198103 () Bool)

(declare-fun lt!543418 () Unit!39722)

(declare-fun lt!543423 () Unit!39722)

(assert (=> b!1198103 (= lt!543418 lt!543423)))

(declare-fun lt!543419 () (_ BitVec 64))

(declare-fun lt!543420 () ListLongMap!17497)

(declare-fun lt!543421 () (_ BitVec 64))

(declare-fun lt!543422 () V!45683)

(declare-fun +!3948 (ListLongMap!17497 tuple2!19528) ListLongMap!17497)

(assert (=> b!1198103 (not (contains!6866 (+!3948 lt!543420 (tuple2!19529 lt!543421 lt!543422)) lt!543419))))

(declare-fun addStillNotContains!287 (ListLongMap!17497 (_ BitVec 64) V!45683 (_ BitVec 64)) Unit!39722)

(assert (=> b!1198103 (= lt!543423 (addStillNotContains!287 lt!543420 lt!543421 lt!543422 lt!543419))))

(assert (=> b!1198103 (= lt!543419 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!19117 (ValueCell!14499 V!45683) V!45683)

(assert (=> b!1198103 (= lt!543422 (get!19117 (select (arr!37452 (array!77614 (store (arr!37452 _values!996) i!673 (ValueCellFull!14499 (dynLambda!3127 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37988 _values!996))) from!1455) (dynLambda!3127 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1198103 (= lt!543421 (select (arr!37451 lt!543383) from!1455))))

(declare-fun call!57276 () ListLongMap!17497)

(assert (=> b!1198103 (= lt!543420 call!57276)))

(declare-fun e!680586 () ListLongMap!17497)

(assert (=> b!1198103 (= e!680586 (+!3948 call!57276 (tuple2!19529 (select (arr!37451 lt!543383) from!1455) (get!19117 (select (arr!37452 (array!77614 (store (arr!37452 _values!996) i!673 (ValueCellFull!14499 (dynLambda!3127 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37988 _values!996))) from!1455) (dynLambda!3127 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1198104 () Bool)

(declare-fun e!680585 () Bool)

(declare-fun e!680591 () Bool)

(assert (=> b!1198104 (= e!680585 e!680591)))

(declare-fun c!117428 () Bool)

(assert (=> b!1198104 (= c!117428 (bvslt from!1455 (size!37987 lt!543383)))))

(declare-fun b!1198105 () Bool)

(assert (=> b!1198105 (= e!680586 call!57276)))

(declare-fun b!1198106 () Bool)

(declare-fun e!680587 () Bool)

(assert (=> b!1198106 (= e!680587 (validKeyInArray!0 (select (arr!37451 lt!543383) from!1455)))))

(assert (=> b!1198106 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1198107 () Bool)

(assert (=> b!1198107 (= e!680590 e!680585)))

(declare-fun c!117427 () Bool)

(assert (=> b!1198107 (= c!117427 e!680587)))

(declare-fun res!797363 () Bool)

(assert (=> b!1198107 (=> (not res!797363) (not e!680587))))

(assert (=> b!1198107 (= res!797363 (bvslt from!1455 (size!37987 lt!543383)))))

(declare-fun b!1198108 () Bool)

(declare-fun isEmpty!979 (ListLongMap!17497) Bool)

(assert (=> b!1198108 (= e!680591 (isEmpty!979 lt!543417))))

(declare-fun b!1198109 () Bool)

(assert (=> b!1198109 (= e!680589 e!680586)))

(declare-fun c!117426 () Bool)

(assert (=> b!1198109 (= c!117426 (validKeyInArray!0 (select (arr!37451 lt!543383) from!1455)))))

(declare-fun b!1198110 () Bool)

(declare-fun e!680588 () Bool)

(assert (=> b!1198110 (= e!680585 e!680588)))

(assert (=> b!1198110 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!37987 lt!543383)))))

(declare-fun res!797361 () Bool)

(assert (=> b!1198110 (= res!797361 (contains!6866 lt!543417 (select (arr!37451 lt!543383) from!1455)))))

(assert (=> b!1198110 (=> (not res!797361) (not e!680588))))

(declare-fun b!1198111 () Bool)

(assert (=> b!1198111 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!37987 lt!543383)))))

(assert (=> b!1198111 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!37988 (array!77614 (store (arr!37452 _values!996) i!673 (ValueCellFull!14499 (dynLambda!3127 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37988 _values!996)))))))

(declare-fun apply!959 (ListLongMap!17497 (_ BitVec 64)) V!45683)

(assert (=> b!1198111 (= e!680588 (= (apply!959 lt!543417 (select (arr!37451 lt!543383) from!1455)) (get!19117 (select (arr!37452 (array!77614 (store (arr!37452 _values!996) i!673 (ValueCellFull!14499 (dynLambda!3127 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37988 _values!996))) from!1455) (dynLambda!3127 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!57273 () Bool)

(assert (=> bm!57273 (= call!57276 (getCurrentListMapNoExtraKeys!5203 lt!543383 (array!77614 (store (arr!37452 _values!996) i!673 (ValueCellFull!14499 (dynLambda!3127 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37988 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1198112 () Bool)

(assert (=> b!1198112 (= e!680591 (= lt!543417 (getCurrentListMapNoExtraKeys!5203 lt!543383 (array!77614 (store (arr!37452 _values!996) i!673 (ValueCellFull!14499 (dynLambda!3127 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37988 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1198113 () Bool)

(declare-fun res!797362 () Bool)

(assert (=> b!1198113 (=> (not res!797362) (not e!680590))))

(assert (=> b!1198113 (= res!797362 (not (contains!6866 lt!543417 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!132409 c!117429) b!1198102))

(assert (= (and d!132409 (not c!117429)) b!1198109))

(assert (= (and b!1198109 c!117426) b!1198103))

(assert (= (and b!1198109 (not c!117426)) b!1198105))

(assert (= (or b!1198103 b!1198105) bm!57273))

(assert (= (and d!132409 res!797360) b!1198113))

(assert (= (and b!1198113 res!797362) b!1198107))

(assert (= (and b!1198107 res!797363) b!1198106))

(assert (= (and b!1198107 c!117427) b!1198110))

(assert (= (and b!1198107 (not c!117427)) b!1198104))

(assert (= (and b!1198110 res!797361) b!1198111))

(assert (= (and b!1198104 c!117428) b!1198112))

(assert (= (and b!1198104 (not c!117428)) b!1198108))

(declare-fun b_lambda!20909 () Bool)

(assert (=> (not b_lambda!20909) (not b!1198103)))

(assert (=> b!1198103 t!39049))

(declare-fun b_and!42325 () Bool)

(assert (= b_and!42319 (and (=> t!39049 result!21625) b_and!42325)))

(declare-fun b_lambda!20911 () Bool)

(assert (=> (not b_lambda!20911) (not b!1198111)))

(assert (=> b!1198111 t!39049))

(declare-fun b_and!42327 () Bool)

(assert (= b_and!42325 (and (=> t!39049 result!21625) b_and!42327)))

(declare-fun m!1104967 () Bool)

(assert (=> b!1198108 m!1104967))

(declare-fun m!1104969 () Bool)

(assert (=> b!1198113 m!1104969))

(declare-fun m!1104971 () Bool)

(assert (=> b!1198112 m!1104971))

(declare-fun m!1104973 () Bool)

(assert (=> b!1198106 m!1104973))

(assert (=> b!1198106 m!1104973))

(declare-fun m!1104975 () Bool)

(assert (=> b!1198106 m!1104975))

(declare-fun m!1104977 () Bool)

(assert (=> b!1198111 m!1104977))

(assert (=> b!1198111 m!1104877))

(declare-fun m!1104979 () Bool)

(assert (=> b!1198111 m!1104979))

(assert (=> b!1198111 m!1104877))

(assert (=> b!1198111 m!1104977))

(assert (=> b!1198111 m!1104973))

(declare-fun m!1104981 () Bool)

(assert (=> b!1198111 m!1104981))

(assert (=> b!1198111 m!1104973))

(declare-fun m!1104983 () Bool)

(assert (=> b!1198103 m!1104983))

(assert (=> b!1198103 m!1104977))

(assert (=> b!1198103 m!1104877))

(assert (=> b!1198103 m!1104979))

(declare-fun m!1104985 () Bool)

(assert (=> b!1198103 m!1104985))

(assert (=> b!1198103 m!1104977))

(declare-fun m!1104987 () Bool)

(assert (=> b!1198103 m!1104987))

(assert (=> b!1198103 m!1104973))

(assert (=> b!1198103 m!1104877))

(assert (=> b!1198103 m!1104985))

(declare-fun m!1104989 () Bool)

(assert (=> b!1198103 m!1104989))

(assert (=> bm!57273 m!1104971))

(assert (=> b!1198109 m!1104973))

(assert (=> b!1198109 m!1104973))

(assert (=> b!1198109 m!1104975))

(declare-fun m!1104991 () Bool)

(assert (=> d!132409 m!1104991))

(assert (=> d!132409 m!1104907))

(assert (=> b!1198110 m!1104973))

(assert (=> b!1198110 m!1104973))

(declare-fun m!1104993 () Bool)

(assert (=> b!1198110 m!1104993))

(assert (=> b!1198010 d!132409))

(declare-fun b!1198114 () Bool)

(declare-fun e!680596 () ListLongMap!17497)

(assert (=> b!1198114 (= e!680596 (ListLongMap!17498 Nil!26343))))

(declare-fun d!132411 () Bool)

(declare-fun e!680597 () Bool)

(assert (=> d!132411 e!680597))

(declare-fun res!797364 () Bool)

(assert (=> d!132411 (=> (not res!797364) (not e!680597))))

(declare-fun lt!543424 () ListLongMap!17497)

(assert (=> d!132411 (= res!797364 (not (contains!6866 lt!543424 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!132411 (= lt!543424 e!680596)))

(declare-fun c!117433 () Bool)

(assert (=> d!132411 (= c!117433 (bvsge from!1455 (size!37987 _keys!1208)))))

(assert (=> d!132411 (validMask!0 mask!1564)))

(assert (=> d!132411 (= (getCurrentListMapNoExtraKeys!5203 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!543424)))

(declare-fun b!1198115 () Bool)

(declare-fun lt!543425 () Unit!39722)

(declare-fun lt!543430 () Unit!39722)

(assert (=> b!1198115 (= lt!543425 lt!543430)))

(declare-fun lt!543426 () (_ BitVec 64))

(declare-fun lt!543427 () ListLongMap!17497)

(declare-fun lt!543429 () V!45683)

(declare-fun lt!543428 () (_ BitVec 64))

(assert (=> b!1198115 (not (contains!6866 (+!3948 lt!543427 (tuple2!19529 lt!543428 lt!543429)) lt!543426))))

(assert (=> b!1198115 (= lt!543430 (addStillNotContains!287 lt!543427 lt!543428 lt!543429 lt!543426))))

(assert (=> b!1198115 (= lt!543426 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1198115 (= lt!543429 (get!19117 (select (arr!37452 _values!996) from!1455) (dynLambda!3127 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1198115 (= lt!543428 (select (arr!37451 _keys!1208) from!1455))))

(declare-fun call!57277 () ListLongMap!17497)

(assert (=> b!1198115 (= lt!543427 call!57277)))

(declare-fun e!680593 () ListLongMap!17497)

(assert (=> b!1198115 (= e!680593 (+!3948 call!57277 (tuple2!19529 (select (arr!37451 _keys!1208) from!1455) (get!19117 (select (arr!37452 _values!996) from!1455) (dynLambda!3127 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1198116 () Bool)

(declare-fun e!680592 () Bool)

(declare-fun e!680598 () Bool)

(assert (=> b!1198116 (= e!680592 e!680598)))

(declare-fun c!117432 () Bool)

(assert (=> b!1198116 (= c!117432 (bvslt from!1455 (size!37987 _keys!1208)))))

(declare-fun b!1198117 () Bool)

(assert (=> b!1198117 (= e!680593 call!57277)))

(declare-fun b!1198118 () Bool)

(declare-fun e!680594 () Bool)

(assert (=> b!1198118 (= e!680594 (validKeyInArray!0 (select (arr!37451 _keys!1208) from!1455)))))

(assert (=> b!1198118 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1198119 () Bool)

(assert (=> b!1198119 (= e!680597 e!680592)))

(declare-fun c!117431 () Bool)

(assert (=> b!1198119 (= c!117431 e!680594)))

(declare-fun res!797367 () Bool)

(assert (=> b!1198119 (=> (not res!797367) (not e!680594))))

(assert (=> b!1198119 (= res!797367 (bvslt from!1455 (size!37987 _keys!1208)))))

(declare-fun b!1198120 () Bool)

(assert (=> b!1198120 (= e!680598 (isEmpty!979 lt!543424))))

(declare-fun b!1198121 () Bool)

(assert (=> b!1198121 (= e!680596 e!680593)))

(declare-fun c!117430 () Bool)

(assert (=> b!1198121 (= c!117430 (validKeyInArray!0 (select (arr!37451 _keys!1208) from!1455)))))

(declare-fun b!1198122 () Bool)

(declare-fun e!680595 () Bool)

(assert (=> b!1198122 (= e!680592 e!680595)))

(assert (=> b!1198122 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!37987 _keys!1208)))))

(declare-fun res!797365 () Bool)

(assert (=> b!1198122 (= res!797365 (contains!6866 lt!543424 (select (arr!37451 _keys!1208) from!1455)))))

(assert (=> b!1198122 (=> (not res!797365) (not e!680595))))

(declare-fun b!1198123 () Bool)

(assert (=> b!1198123 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!37987 _keys!1208)))))

(assert (=> b!1198123 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!37988 _values!996)))))

(assert (=> b!1198123 (= e!680595 (= (apply!959 lt!543424 (select (arr!37451 _keys!1208) from!1455)) (get!19117 (select (arr!37452 _values!996) from!1455) (dynLambda!3127 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!57274 () Bool)

(assert (=> bm!57274 (= call!57277 (getCurrentListMapNoExtraKeys!5203 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1198124 () Bool)

(assert (=> b!1198124 (= e!680598 (= lt!543424 (getCurrentListMapNoExtraKeys!5203 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1198125 () Bool)

(declare-fun res!797366 () Bool)

(assert (=> b!1198125 (=> (not res!797366) (not e!680597))))

(assert (=> b!1198125 (= res!797366 (not (contains!6866 lt!543424 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!132411 c!117433) b!1198114))

(assert (= (and d!132411 (not c!117433)) b!1198121))

(assert (= (and b!1198121 c!117430) b!1198115))

(assert (= (and b!1198121 (not c!117430)) b!1198117))

(assert (= (or b!1198115 b!1198117) bm!57274))

(assert (= (and d!132411 res!797364) b!1198125))

(assert (= (and b!1198125 res!797366) b!1198119))

(assert (= (and b!1198119 res!797367) b!1198118))

(assert (= (and b!1198119 c!117431) b!1198122))

(assert (= (and b!1198119 (not c!117431)) b!1198116))

(assert (= (and b!1198122 res!797365) b!1198123))

(assert (= (and b!1198116 c!117432) b!1198124))

(assert (= (and b!1198116 (not c!117432)) b!1198120))

(declare-fun b_lambda!20913 () Bool)

(assert (=> (not b_lambda!20913) (not b!1198115)))

(assert (=> b!1198115 t!39049))

(declare-fun b_and!42329 () Bool)

(assert (= b_and!42327 (and (=> t!39049 result!21625) b_and!42329)))

(declare-fun b_lambda!20915 () Bool)

(assert (=> (not b_lambda!20915) (not b!1198123)))

(assert (=> b!1198123 t!39049))

(declare-fun b_and!42331 () Bool)

(assert (= b_and!42329 (and (=> t!39049 result!21625) b_and!42331)))

(declare-fun m!1104995 () Bool)

(assert (=> b!1198120 m!1104995))

(declare-fun m!1104997 () Bool)

(assert (=> b!1198125 m!1104997))

(declare-fun m!1104999 () Bool)

(assert (=> b!1198124 m!1104999))

(declare-fun m!1105001 () Bool)

(assert (=> b!1198118 m!1105001))

(assert (=> b!1198118 m!1105001))

(declare-fun m!1105003 () Bool)

(assert (=> b!1198118 m!1105003))

(declare-fun m!1105005 () Bool)

(assert (=> b!1198123 m!1105005))

(assert (=> b!1198123 m!1104877))

(declare-fun m!1105007 () Bool)

(assert (=> b!1198123 m!1105007))

(assert (=> b!1198123 m!1104877))

(assert (=> b!1198123 m!1105005))

(assert (=> b!1198123 m!1105001))

(declare-fun m!1105009 () Bool)

(assert (=> b!1198123 m!1105009))

(assert (=> b!1198123 m!1105001))

(declare-fun m!1105011 () Bool)

(assert (=> b!1198115 m!1105011))

(assert (=> b!1198115 m!1105005))

(assert (=> b!1198115 m!1104877))

(assert (=> b!1198115 m!1105007))

(declare-fun m!1105013 () Bool)

(assert (=> b!1198115 m!1105013))

(assert (=> b!1198115 m!1105005))

(declare-fun m!1105015 () Bool)

(assert (=> b!1198115 m!1105015))

(assert (=> b!1198115 m!1105001))

(assert (=> b!1198115 m!1104877))

(assert (=> b!1198115 m!1105013))

(declare-fun m!1105017 () Bool)

(assert (=> b!1198115 m!1105017))

(assert (=> bm!57274 m!1104999))

(assert (=> b!1198121 m!1105001))

(assert (=> b!1198121 m!1105001))

(assert (=> b!1198121 m!1105003))

(declare-fun m!1105019 () Bool)

(assert (=> d!132411 m!1105019))

(assert (=> d!132411 m!1104907))

(assert (=> b!1198122 m!1105001))

(assert (=> b!1198122 m!1105001))

(declare-fun m!1105021 () Bool)

(assert (=> b!1198122 m!1105021))

(assert (=> b!1198010 d!132411))

(declare-fun bm!57277 () Bool)

(declare-fun call!57280 () Bool)

(declare-fun c!117436 () Bool)

(assert (=> bm!57277 (= call!57280 (arrayNoDuplicates!0 lt!543383 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!117436 (Cons!26341 (select (arr!37451 lt!543383) #b00000000000000000000000000000000) Nil!26342) Nil!26342)))))

(declare-fun b!1198136 () Bool)

(declare-fun e!680610 () Bool)

(assert (=> b!1198136 (= e!680610 call!57280)))

(declare-fun d!132413 () Bool)

(declare-fun res!797374 () Bool)

(declare-fun e!680609 () Bool)

(assert (=> d!132413 (=> res!797374 e!680609)))

(assert (=> d!132413 (= res!797374 (bvsge #b00000000000000000000000000000000 (size!37987 lt!543383)))))

(assert (=> d!132413 (= (arrayNoDuplicates!0 lt!543383 #b00000000000000000000000000000000 Nil!26342) e!680609)))

(declare-fun b!1198137 () Bool)

(declare-fun e!680608 () Bool)

(assert (=> b!1198137 (= e!680609 e!680608)))

(declare-fun res!797376 () Bool)

(assert (=> b!1198137 (=> (not res!797376) (not e!680608))))

(declare-fun e!680607 () Bool)

(assert (=> b!1198137 (= res!797376 (not e!680607))))

(declare-fun res!797375 () Bool)

(assert (=> b!1198137 (=> (not res!797375) (not e!680607))))

(assert (=> b!1198137 (= res!797375 (validKeyInArray!0 (select (arr!37451 lt!543383) #b00000000000000000000000000000000)))))

(declare-fun b!1198138 () Bool)

(declare-fun contains!6867 (List!26345 (_ BitVec 64)) Bool)

(assert (=> b!1198138 (= e!680607 (contains!6867 Nil!26342 (select (arr!37451 lt!543383) #b00000000000000000000000000000000)))))

(declare-fun b!1198139 () Bool)

(assert (=> b!1198139 (= e!680608 e!680610)))

(assert (=> b!1198139 (= c!117436 (validKeyInArray!0 (select (arr!37451 lt!543383) #b00000000000000000000000000000000)))))

(declare-fun b!1198140 () Bool)

(assert (=> b!1198140 (= e!680610 call!57280)))

(assert (= (and d!132413 (not res!797374)) b!1198137))

(assert (= (and b!1198137 res!797375) b!1198138))

(assert (= (and b!1198137 res!797376) b!1198139))

(assert (= (and b!1198139 c!117436) b!1198136))

(assert (= (and b!1198139 (not c!117436)) b!1198140))

(assert (= (or b!1198136 b!1198140) bm!57277))

(assert (=> bm!57277 m!1104955))

(declare-fun m!1105023 () Bool)

(assert (=> bm!57277 m!1105023))

(assert (=> b!1198137 m!1104955))

(assert (=> b!1198137 m!1104955))

(assert (=> b!1198137 m!1104957))

(assert (=> b!1198138 m!1104955))

(assert (=> b!1198138 m!1104955))

(declare-fun m!1105025 () Bool)

(assert (=> b!1198138 m!1105025))

(assert (=> b!1198139 m!1104955))

(assert (=> b!1198139 m!1104955))

(assert (=> b!1198139 m!1104957))

(assert (=> b!1198006 d!132413))

(declare-fun bm!57278 () Bool)

(declare-fun call!57281 () Bool)

(declare-fun c!117437 () Bool)

(assert (=> bm!57278 (= call!57281 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!117437 (Cons!26341 (select (arr!37451 _keys!1208) #b00000000000000000000000000000000) Nil!26342) Nil!26342)))))

(declare-fun b!1198141 () Bool)

(declare-fun e!680614 () Bool)

(assert (=> b!1198141 (= e!680614 call!57281)))

(declare-fun d!132415 () Bool)

(declare-fun res!797377 () Bool)

(declare-fun e!680613 () Bool)

(assert (=> d!132415 (=> res!797377 e!680613)))

(assert (=> d!132415 (= res!797377 (bvsge #b00000000000000000000000000000000 (size!37987 _keys!1208)))))

(assert (=> d!132415 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26342) e!680613)))

(declare-fun b!1198142 () Bool)

(declare-fun e!680612 () Bool)

(assert (=> b!1198142 (= e!680613 e!680612)))

(declare-fun res!797379 () Bool)

(assert (=> b!1198142 (=> (not res!797379) (not e!680612))))

(declare-fun e!680611 () Bool)

(assert (=> b!1198142 (= res!797379 (not e!680611))))

(declare-fun res!797378 () Bool)

(assert (=> b!1198142 (=> (not res!797378) (not e!680611))))

(assert (=> b!1198142 (= res!797378 (validKeyInArray!0 (select (arr!37451 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1198143 () Bool)

(assert (=> b!1198143 (= e!680611 (contains!6867 Nil!26342 (select (arr!37451 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1198144 () Bool)

(assert (=> b!1198144 (= e!680612 e!680614)))

(assert (=> b!1198144 (= c!117437 (validKeyInArray!0 (select (arr!37451 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1198145 () Bool)

(assert (=> b!1198145 (= e!680614 call!57281)))

(assert (= (and d!132415 (not res!797377)) b!1198142))

(assert (= (and b!1198142 res!797378) b!1198143))

(assert (= (and b!1198142 res!797379) b!1198144))

(assert (= (and b!1198144 c!117437) b!1198141))

(assert (= (and b!1198144 (not c!117437)) b!1198145))

(assert (= (or b!1198141 b!1198145) bm!57278))

(assert (=> bm!57278 m!1104943))

(declare-fun m!1105027 () Bool)

(assert (=> bm!57278 m!1105027))

(assert (=> b!1198142 m!1104943))

(assert (=> b!1198142 m!1104943))

(assert (=> b!1198142 m!1104945))

(assert (=> b!1198143 m!1104943))

(assert (=> b!1198143 m!1104943))

(declare-fun m!1105029 () Bool)

(assert (=> b!1198143 m!1105029))

(assert (=> b!1198144 m!1104943))

(assert (=> b!1198144 m!1104943))

(assert (=> b!1198144 m!1104945))

(assert (=> b!1198004 d!132415))

(declare-fun d!132417 () Bool)

(declare-fun res!797384 () Bool)

(declare-fun e!680619 () Bool)

(assert (=> d!132417 (=> res!797384 e!680619)))

(assert (=> d!132417 (= res!797384 (= (select (arr!37451 _keys!1208) #b00000000000000000000000000000000) k0!934))))

(assert (=> d!132417 (= (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000) e!680619)))

(declare-fun b!1198150 () Bool)

(declare-fun e!680620 () Bool)

(assert (=> b!1198150 (= e!680619 e!680620)))

(declare-fun res!797385 () Bool)

(assert (=> b!1198150 (=> (not res!797385) (not e!680620))))

(assert (=> b!1198150 (= res!797385 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!37987 _keys!1208)))))

(declare-fun b!1198151 () Bool)

(assert (=> b!1198151 (= e!680620 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!132417 (not res!797384)) b!1198150))

(assert (= (and b!1198150 res!797385) b!1198151))

(assert (=> d!132417 m!1104943))

(declare-fun m!1105031 () Bool)

(assert (=> b!1198151 m!1105031))

(assert (=> b!1198005 d!132417))

(declare-fun d!132419 () Bool)

(assert (=> d!132419 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!543433 () Unit!39722)

(declare-fun choose!13 (array!77611 (_ BitVec 64) (_ BitVec 32)) Unit!39722)

(assert (=> d!132419 (= lt!543433 (choose!13 _keys!1208 k0!934 i!673))))

(assert (=> d!132419 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!132419 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673) lt!543433)))

(declare-fun bs!33964 () Bool)

(assert (= bs!33964 d!132419))

(assert (=> bs!33964 m!1104893))

(declare-fun m!1105033 () Bool)

(assert (=> bs!33964 m!1105033))

(assert (=> b!1198005 d!132419))

(declare-fun condMapEmpty!47471 () Bool)

(declare-fun mapDefault!47471 () ValueCell!14499)

(assert (=> mapNonEmpty!47465 (= condMapEmpty!47471 (= mapRest!47465 ((as const (Array (_ BitVec 32) ValueCell!14499)) mapDefault!47471)))))

(declare-fun e!680626 () Bool)

(declare-fun mapRes!47471 () Bool)

(assert (=> mapNonEmpty!47465 (= tp!90125 (and e!680626 mapRes!47471))))

(declare-fun b!1198158 () Bool)

(declare-fun e!680625 () Bool)

(assert (=> b!1198158 (= e!680625 tp_is_empty!30417)))

(declare-fun b!1198159 () Bool)

(assert (=> b!1198159 (= e!680626 tp_is_empty!30417)))

(declare-fun mapIsEmpty!47471 () Bool)

(assert (=> mapIsEmpty!47471 mapRes!47471))

(declare-fun mapNonEmpty!47471 () Bool)

(declare-fun tp!90135 () Bool)

(assert (=> mapNonEmpty!47471 (= mapRes!47471 (and tp!90135 e!680625))))

(declare-fun mapKey!47471 () (_ BitVec 32))

(declare-fun mapValue!47471 () ValueCell!14499)

(declare-fun mapRest!47471 () (Array (_ BitVec 32) ValueCell!14499))

(assert (=> mapNonEmpty!47471 (= mapRest!47465 (store mapRest!47471 mapKey!47471 mapValue!47471))))

(assert (= (and mapNonEmpty!47465 condMapEmpty!47471) mapIsEmpty!47471))

(assert (= (and mapNonEmpty!47465 (not condMapEmpty!47471)) mapNonEmpty!47471))

(assert (= (and mapNonEmpty!47471 ((_ is ValueCellFull!14499) mapValue!47471)) b!1198158))

(assert (= (and mapNonEmpty!47465 ((_ is ValueCellFull!14499) mapDefault!47471)) b!1198159))

(declare-fun m!1105035 () Bool)

(assert (=> mapNonEmpty!47471 m!1105035))

(declare-fun b_lambda!20917 () Bool)

(assert (= b_lambda!20913 (or (and start!100372 b_free!25713) b_lambda!20917)))

(declare-fun b_lambda!20919 () Bool)

(assert (= b_lambda!20911 (or (and start!100372 b_free!25713) b_lambda!20919)))

(declare-fun b_lambda!20921 () Bool)

(assert (= b_lambda!20915 (or (and start!100372 b_free!25713) b_lambda!20921)))

(declare-fun b_lambda!20923 () Bool)

(assert (= b_lambda!20909 (or (and start!100372 b_free!25713) b_lambda!20923)))

(check-sat (not bm!57269) (not b!1198111) (not b!1198142) (not b!1198118) (not b!1198124) (not b!1198143) (not b!1198151) (not b_lambda!20917) tp_is_empty!30417 (not b!1198108) (not b!1198122) (not b!1198112) (not d!132419) (not bm!57278) (not b!1198110) (not b_lambda!20921) (not b!1198103) (not d!132409) (not b!1198123) (not b!1198109) b_and!42331 (not b!1198121) (not mapNonEmpty!47471) (not b!1198138) (not d!132411) (not bm!57273) (not b!1198106) (not b!1198075) (not b!1198137) (not bm!57274) (not b!1198139) (not bm!57277) (not b!1198120) (not b!1198125) (not b!1198076) (not b!1198071) (not b!1198115) (not b_next!25713) (not b_lambda!20907) (not b_lambda!20923) (not b!1198144) (not b!1198113) (not bm!57270) (not b!1198072) (not b_lambda!20919))
(check-sat b_and!42331 (not b_next!25713))
