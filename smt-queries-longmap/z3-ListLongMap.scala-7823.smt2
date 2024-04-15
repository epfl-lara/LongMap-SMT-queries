; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97676 () Bool)

(assert start!97676)

(declare-fun b!1116408 () Bool)

(declare-fun res!745446 () Bool)

(declare-fun e!636060 () Bool)

(assert (=> b!1116408 (=> (not res!745446) (not e!636060))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1116408 (= res!745446 (validKeyInArray!0 k0!934))))

(declare-fun b!1116409 () Bool)

(declare-fun res!745449 () Bool)

(assert (=> b!1116409 (=> (not res!745449) (not e!636060))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!72624 0))(
  ( (array!72625 (arr!34965 (Array (_ BitVec 32) (_ BitVec 64))) (size!35503 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72624)

(assert (=> b!1116409 (= res!745449 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35503 _keys!1208))))))

(declare-fun b!1116410 () Bool)

(declare-fun e!636059 () Bool)

(assert (=> b!1116410 (= e!636059 (not true))))

(declare-fun arrayContainsKey!0 (array!72624 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1116410 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36463 0))(
  ( (Unit!36464) )
))
(declare-fun lt!496950 () Unit!36463)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72624 (_ BitVec 64) (_ BitVec 32)) Unit!36463)

(assert (=> b!1116410 (= lt!496950 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1116411 () Bool)

(declare-fun res!745444 () Bool)

(assert (=> b!1116411 (=> (not res!745444) (not e!636060))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!42345 0))(
  ( (V!42346 (val!14013 Int)) )
))
(declare-datatypes ((ValueCell!13247 0))(
  ( (ValueCellFull!13247 (v!16645 V!42345)) (EmptyCell!13247) )
))
(declare-datatypes ((array!72626 0))(
  ( (array!72627 (arr!34966 (Array (_ BitVec 32) ValueCell!13247)) (size!35504 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72626)

(assert (=> b!1116411 (= res!745444 (and (= (size!35504 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35503 _keys!1208) (size!35504 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1116412 () Bool)

(declare-fun e!636056 () Bool)

(declare-fun tp_is_empty!27913 () Bool)

(assert (=> b!1116412 (= e!636056 tp_is_empty!27913)))

(declare-fun b!1116414 () Bool)

(assert (=> b!1116414 (= e!636060 e!636059)))

(declare-fun res!745452 () Bool)

(assert (=> b!1116414 (=> (not res!745452) (not e!636059))))

(declare-fun lt!496949 () array!72624)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72624 (_ BitVec 32)) Bool)

(assert (=> b!1116414 (= res!745452 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496949 mask!1564))))

(assert (=> b!1116414 (= lt!496949 (array!72625 (store (arr!34965 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35503 _keys!1208)))))

(declare-fun b!1116415 () Bool)

(declare-fun res!745448 () Bool)

(assert (=> b!1116415 (=> (not res!745448) (not e!636060))))

(assert (=> b!1116415 (= res!745448 (= (select (arr!34965 _keys!1208) i!673) k0!934))))

(declare-fun b!1116416 () Bool)

(declare-fun e!636058 () Bool)

(declare-fun mapRes!43687 () Bool)

(assert (=> b!1116416 (= e!636058 (and e!636056 mapRes!43687))))

(declare-fun condMapEmpty!43687 () Bool)

(declare-fun mapDefault!43687 () ValueCell!13247)

(assert (=> b!1116416 (= condMapEmpty!43687 (= (arr!34966 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13247)) mapDefault!43687)))))

(declare-fun b!1116417 () Bool)

(declare-fun res!745445 () Bool)

(assert (=> b!1116417 (=> (not res!745445) (not e!636060))))

(declare-datatypes ((List!24404 0))(
  ( (Nil!24401) (Cons!24400 (h!25609 (_ BitVec 64)) (t!34876 List!24404)) )
))
(declare-fun arrayNoDuplicates!0 (array!72624 (_ BitVec 32) List!24404) Bool)

(assert (=> b!1116417 (= res!745445 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24401))))

(declare-fun mapNonEmpty!43687 () Bool)

(declare-fun tp!82931 () Bool)

(declare-fun e!636055 () Bool)

(assert (=> mapNonEmpty!43687 (= mapRes!43687 (and tp!82931 e!636055))))

(declare-fun mapValue!43687 () ValueCell!13247)

(declare-fun mapKey!43687 () (_ BitVec 32))

(declare-fun mapRest!43687 () (Array (_ BitVec 32) ValueCell!13247))

(assert (=> mapNonEmpty!43687 (= (arr!34966 _values!996) (store mapRest!43687 mapKey!43687 mapValue!43687))))

(declare-fun b!1116418 () Bool)

(declare-fun res!745453 () Bool)

(assert (=> b!1116418 (=> (not res!745453) (not e!636060))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1116418 (= res!745453 (validMask!0 mask!1564))))

(declare-fun b!1116419 () Bool)

(declare-fun res!745451 () Bool)

(assert (=> b!1116419 (=> (not res!745451) (not e!636059))))

(assert (=> b!1116419 (= res!745451 (arrayNoDuplicates!0 lt!496949 #b00000000000000000000000000000000 Nil!24401))))

(declare-fun b!1116413 () Bool)

(assert (=> b!1116413 (= e!636055 tp_is_empty!27913)))

(declare-fun res!745447 () Bool)

(assert (=> start!97676 (=> (not res!745447) (not e!636060))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97676 (= res!745447 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35503 _keys!1208))))))

(assert (=> start!97676 e!636060))

(declare-fun array_inv!26942 (array!72624) Bool)

(assert (=> start!97676 (array_inv!26942 _keys!1208)))

(assert (=> start!97676 true))

(declare-fun array_inv!26943 (array!72626) Bool)

(assert (=> start!97676 (and (array_inv!26943 _values!996) e!636058)))

(declare-fun b!1116420 () Bool)

(declare-fun res!745450 () Bool)

(assert (=> b!1116420 (=> (not res!745450) (not e!636060))))

(assert (=> b!1116420 (= res!745450 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!43687 () Bool)

(assert (=> mapIsEmpty!43687 mapRes!43687))

(assert (= (and start!97676 res!745447) b!1116418))

(assert (= (and b!1116418 res!745453) b!1116411))

(assert (= (and b!1116411 res!745444) b!1116420))

(assert (= (and b!1116420 res!745450) b!1116417))

(assert (= (and b!1116417 res!745445) b!1116409))

(assert (= (and b!1116409 res!745449) b!1116408))

(assert (= (and b!1116408 res!745446) b!1116415))

(assert (= (and b!1116415 res!745448) b!1116414))

(assert (= (and b!1116414 res!745452) b!1116419))

(assert (= (and b!1116419 res!745451) b!1116410))

(assert (= (and b!1116416 condMapEmpty!43687) mapIsEmpty!43687))

(assert (= (and b!1116416 (not condMapEmpty!43687)) mapNonEmpty!43687))

(get-info :version)

(assert (= (and mapNonEmpty!43687 ((_ is ValueCellFull!13247) mapValue!43687)) b!1116413))

(assert (= (and b!1116416 ((_ is ValueCellFull!13247) mapDefault!43687)) b!1116412))

(assert (= start!97676 b!1116416))

(declare-fun m!1032087 () Bool)

(assert (=> start!97676 m!1032087))

(declare-fun m!1032089 () Bool)

(assert (=> start!97676 m!1032089))

(declare-fun m!1032091 () Bool)

(assert (=> b!1116415 m!1032091))

(declare-fun m!1032093 () Bool)

(assert (=> b!1116419 m!1032093))

(declare-fun m!1032095 () Bool)

(assert (=> b!1116410 m!1032095))

(declare-fun m!1032097 () Bool)

(assert (=> b!1116410 m!1032097))

(declare-fun m!1032099 () Bool)

(assert (=> mapNonEmpty!43687 m!1032099))

(declare-fun m!1032101 () Bool)

(assert (=> b!1116408 m!1032101))

(declare-fun m!1032103 () Bool)

(assert (=> b!1116414 m!1032103))

(declare-fun m!1032105 () Bool)

(assert (=> b!1116414 m!1032105))

(declare-fun m!1032107 () Bool)

(assert (=> b!1116420 m!1032107))

(declare-fun m!1032109 () Bool)

(assert (=> b!1116417 m!1032109))

(declare-fun m!1032111 () Bool)

(assert (=> b!1116418 m!1032111))

(check-sat (not b!1116417) (not start!97676) (not b!1116414) (not b!1116418) (not b!1116410) tp_is_empty!27913 (not b!1116419) (not b!1116420) (not b!1116408) (not mapNonEmpty!43687))
(check-sat)
