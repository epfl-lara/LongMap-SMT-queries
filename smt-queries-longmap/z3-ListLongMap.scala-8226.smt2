; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100500 () Bool)

(assert start!100500)

(declare-fun b!1197311 () Bool)

(declare-fun e!680409 () Bool)

(declare-fun tp_is_empty!30331 () Bool)

(assert (=> b!1197311 (= e!680409 tp_is_empty!30331)))

(declare-fun res!796417 () Bool)

(declare-fun e!680411 () Bool)

(assert (=> start!100500 (=> (not res!796417) (not e!680411))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!77483 0))(
  ( (array!77484 (arr!37382 (Array (_ BitVec 32) (_ BitVec 64))) (size!37919 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77483)

(assert (=> start!100500 (= res!796417 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37919 _keys!1208))))))

(assert (=> start!100500 e!680411))

(declare-fun array_inv!28566 (array!77483) Bool)

(assert (=> start!100500 (array_inv!28566 _keys!1208)))

(assert (=> start!100500 true))

(declare-datatypes ((V!45569 0))(
  ( (V!45570 (val!15222 Int)) )
))
(declare-datatypes ((ValueCell!14456 0))(
  ( (ValueCellFull!14456 (v!17856 V!45569)) (EmptyCell!14456) )
))
(declare-datatypes ((array!77485 0))(
  ( (array!77486 (arr!37383 (Array (_ BitVec 32) ValueCell!14456)) (size!37920 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77485)

(declare-fun e!680407 () Bool)

(declare-fun array_inv!28567 (array!77485) Bool)

(assert (=> start!100500 (and (array_inv!28567 _values!996) e!680407)))

(declare-fun b!1197312 () Bool)

(declare-fun res!796420 () Bool)

(assert (=> b!1197312 (=> (not res!796420) (not e!680411))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1197312 (= res!796420 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37919 _keys!1208))))))

(declare-fun b!1197313 () Bool)

(declare-fun e!680406 () Bool)

(declare-fun mapRes!47333 () Bool)

(assert (=> b!1197313 (= e!680407 (and e!680406 mapRes!47333))))

(declare-fun condMapEmpty!47333 () Bool)

(declare-fun mapDefault!47333 () ValueCell!14456)

(assert (=> b!1197313 (= condMapEmpty!47333 (= (arr!37383 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14456)) mapDefault!47333)))))

(declare-fun b!1197314 () Bool)

(declare-fun res!796415 () Bool)

(assert (=> b!1197314 (=> (not res!796415) (not e!680411))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1197314 (= res!796415 (= (select (arr!37382 _keys!1208) i!673) k0!934))))

(declare-fun b!1197315 () Bool)

(declare-fun res!796424 () Bool)

(assert (=> b!1197315 (=> (not res!796424) (not e!680411))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1197315 (= res!796424 (and (= (size!37920 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37919 _keys!1208) (size!37920 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1197316 () Bool)

(declare-fun res!796423 () Bool)

(assert (=> b!1197316 (=> (not res!796423) (not e!680411))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1197316 (= res!796423 (validKeyInArray!0 k0!934))))

(declare-fun b!1197317 () Bool)

(declare-fun e!680410 () Bool)

(assert (=> b!1197317 (= e!680411 e!680410)))

(declare-fun res!796416 () Bool)

(assert (=> b!1197317 (=> (not res!796416) (not e!680410))))

(declare-fun lt!543502 () array!77483)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77483 (_ BitVec 32)) Bool)

(assert (=> b!1197317 (= res!796416 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543502 mask!1564))))

(assert (=> b!1197317 (= lt!543502 (array!77484 (store (arr!37382 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37919 _keys!1208)))))

(declare-fun mapIsEmpty!47333 () Bool)

(assert (=> mapIsEmpty!47333 mapRes!47333))

(declare-fun mapNonEmpty!47333 () Bool)

(declare-fun tp!89943 () Bool)

(assert (=> mapNonEmpty!47333 (= mapRes!47333 (and tp!89943 e!680409))))

(declare-fun mapRest!47333 () (Array (_ BitVec 32) ValueCell!14456))

(declare-fun mapValue!47333 () ValueCell!14456)

(declare-fun mapKey!47333 () (_ BitVec 32))

(assert (=> mapNonEmpty!47333 (= (arr!37383 _values!996) (store mapRest!47333 mapKey!47333 mapValue!47333))))

(declare-fun b!1197318 () Bool)

(assert (=> b!1197318 (= e!680410 (not true))))

(declare-fun arrayContainsKey!0 (array!77483 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1197318 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39629 0))(
  ( (Unit!39630) )
))
(declare-fun lt!543501 () Unit!39629)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77483 (_ BitVec 64) (_ BitVec 32)) Unit!39629)

(assert (=> b!1197318 (= lt!543501 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1197319 () Bool)

(declare-fun res!796418 () Bool)

(assert (=> b!1197319 (=> (not res!796418) (not e!680411))))

(assert (=> b!1197319 (= res!796418 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1197320 () Bool)

(declare-fun res!796422 () Bool)

(assert (=> b!1197320 (=> (not res!796422) (not e!680411))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1197320 (= res!796422 (validMask!0 mask!1564))))

(declare-fun b!1197321 () Bool)

(declare-fun res!796419 () Bool)

(assert (=> b!1197321 (=> (not res!796419) (not e!680410))))

(declare-datatypes ((List!26325 0))(
  ( (Nil!26322) (Cons!26321 (h!27539 (_ BitVec 64)) (t!38988 List!26325)) )
))
(declare-fun arrayNoDuplicates!0 (array!77483 (_ BitVec 32) List!26325) Bool)

(assert (=> b!1197321 (= res!796419 (arrayNoDuplicates!0 lt!543502 #b00000000000000000000000000000000 Nil!26322))))

(declare-fun b!1197322 () Bool)

(declare-fun res!796421 () Bool)

(assert (=> b!1197322 (=> (not res!796421) (not e!680411))))

(assert (=> b!1197322 (= res!796421 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26322))))

(declare-fun b!1197323 () Bool)

(assert (=> b!1197323 (= e!680406 tp_is_empty!30331)))

(assert (= (and start!100500 res!796417) b!1197320))

(assert (= (and b!1197320 res!796422) b!1197315))

(assert (= (and b!1197315 res!796424) b!1197319))

(assert (= (and b!1197319 res!796418) b!1197322))

(assert (= (and b!1197322 res!796421) b!1197312))

(assert (= (and b!1197312 res!796420) b!1197316))

(assert (= (and b!1197316 res!796423) b!1197314))

(assert (= (and b!1197314 res!796415) b!1197317))

(assert (= (and b!1197317 res!796416) b!1197321))

(assert (= (and b!1197321 res!796419) b!1197318))

(assert (= (and b!1197313 condMapEmpty!47333) mapIsEmpty!47333))

(assert (= (and b!1197313 (not condMapEmpty!47333)) mapNonEmpty!47333))

(get-info :version)

(assert (= (and mapNonEmpty!47333 ((_ is ValueCellFull!14456) mapValue!47333)) b!1197311))

(assert (= (and b!1197313 ((_ is ValueCellFull!14456) mapDefault!47333)) b!1197323))

(assert (= start!100500 b!1197313))

(declare-fun m!1104969 () Bool)

(assert (=> b!1197321 m!1104969))

(declare-fun m!1104971 () Bool)

(assert (=> mapNonEmpty!47333 m!1104971))

(declare-fun m!1104973 () Bool)

(assert (=> b!1197322 m!1104973))

(declare-fun m!1104975 () Bool)

(assert (=> b!1197319 m!1104975))

(declare-fun m!1104977 () Bool)

(assert (=> b!1197316 m!1104977))

(declare-fun m!1104979 () Bool)

(assert (=> start!100500 m!1104979))

(declare-fun m!1104981 () Bool)

(assert (=> start!100500 m!1104981))

(declare-fun m!1104983 () Bool)

(assert (=> b!1197314 m!1104983))

(declare-fun m!1104985 () Bool)

(assert (=> b!1197317 m!1104985))

(declare-fun m!1104987 () Bool)

(assert (=> b!1197317 m!1104987))

(declare-fun m!1104989 () Bool)

(assert (=> b!1197318 m!1104989))

(declare-fun m!1104991 () Bool)

(assert (=> b!1197318 m!1104991))

(declare-fun m!1104993 () Bool)

(assert (=> b!1197320 m!1104993))

(check-sat (not b!1197317) (not b!1197320) (not b!1197316) tp_is_empty!30331 (not b!1197319) (not mapNonEmpty!47333) (not b!1197318) (not start!100500) (not b!1197322) (not b!1197321))
(check-sat)
