; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97522 () Bool)

(assert start!97522)

(declare-fun b!1113417 () Bool)

(declare-fun res!743114 () Bool)

(declare-fun e!634700 () Bool)

(assert (=> b!1113417 (=> (not res!743114) (not e!634700))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!72413 0))(
  ( (array!72414 (arr!34859 (Array (_ BitVec 32) (_ BitVec 64))) (size!35395 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72413)

(assert (=> b!1113417 (= res!743114 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35395 _keys!1208))))))

(declare-fun mapNonEmpty!43447 () Bool)

(declare-fun mapRes!43447 () Bool)

(declare-fun tp!82691 () Bool)

(declare-fun e!634698 () Bool)

(assert (=> mapNonEmpty!43447 (= mapRes!43447 (and tp!82691 e!634698))))

(declare-datatypes ((V!42131 0))(
  ( (V!42132 (val!13933 Int)) )
))
(declare-datatypes ((ValueCell!13167 0))(
  ( (ValueCellFull!13167 (v!16566 V!42131)) (EmptyCell!13167) )
))
(declare-fun mapRest!43447 () (Array (_ BitVec 32) ValueCell!13167))

(declare-fun mapKey!43447 () (_ BitVec 32))

(declare-datatypes ((array!72415 0))(
  ( (array!72416 (arr!34860 (Array (_ BitVec 32) ValueCell!13167)) (size!35396 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72415)

(declare-fun mapValue!43447 () ValueCell!13167)

(assert (=> mapNonEmpty!43447 (= (arr!34860 _values!996) (store mapRest!43447 mapKey!43447 mapValue!43447))))

(declare-fun b!1113419 () Bool)

(declare-fun res!743115 () Bool)

(assert (=> b!1113419 (=> (not res!743115) (not e!634700))))

(declare-datatypes ((List!24309 0))(
  ( (Nil!24306) (Cons!24305 (h!25514 (_ BitVec 64)) (t!34790 List!24309)) )
))
(declare-fun arrayNoDuplicates!0 (array!72413 (_ BitVec 32) List!24309) Bool)

(assert (=> b!1113419 (= res!743115 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24306))))

(declare-fun b!1113420 () Bool)

(declare-fun tp_is_empty!27753 () Bool)

(assert (=> b!1113420 (= e!634698 tp_is_empty!27753)))

(declare-fun b!1113421 () Bool)

(declare-fun res!743117 () Bool)

(assert (=> b!1113421 (=> (not res!743117) (not e!634700))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1113421 (= res!743117 (and (= (size!35396 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35395 _keys!1208) (size!35396 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1113422 () Bool)

(declare-fun e!634699 () Bool)

(assert (=> b!1113422 (= e!634700 e!634699)))

(declare-fun res!743122 () Bool)

(assert (=> b!1113422 (=> (not res!743122) (not e!634699))))

(declare-fun lt!496669 () array!72413)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72413 (_ BitVec 32)) Bool)

(assert (=> b!1113422 (= res!743122 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496669 mask!1564))))

(assert (=> b!1113422 (= lt!496669 (array!72414 (store (arr!34859 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35395 _keys!1208)))))

(declare-fun b!1113423 () Bool)

(declare-fun res!743116 () Bool)

(assert (=> b!1113423 (=> (not res!743116) (not e!634700))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1113423 (= res!743116 (validKeyInArray!0 k0!934))))

(declare-fun b!1113424 () Bool)

(declare-fun res!743120 () Bool)

(assert (=> b!1113424 (=> (not res!743120) (not e!634700))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1113424 (= res!743120 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!43447 () Bool)

(assert (=> mapIsEmpty!43447 mapRes!43447))

(declare-fun b!1113425 () Bool)

(declare-fun e!634696 () Bool)

(assert (=> b!1113425 (= e!634696 tp_is_empty!27753)))

(declare-fun b!1113418 () Bool)

(declare-fun res!743113 () Bool)

(assert (=> b!1113418 (=> (not res!743113) (not e!634700))))

(assert (=> b!1113418 (= res!743113 (= (select (arr!34859 _keys!1208) i!673) k0!934))))

(declare-fun res!743118 () Bool)

(assert (=> start!97522 (=> (not res!743118) (not e!634700))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97522 (= res!743118 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35395 _keys!1208))))))

(assert (=> start!97522 e!634700))

(declare-fun array_inv!26798 (array!72413) Bool)

(assert (=> start!97522 (array_inv!26798 _keys!1208)))

(assert (=> start!97522 true))

(declare-fun e!634701 () Bool)

(declare-fun array_inv!26799 (array!72415) Bool)

(assert (=> start!97522 (and (array_inv!26799 _values!996) e!634701)))

(declare-fun b!1113426 () Bool)

(assert (=> b!1113426 (= e!634701 (and e!634696 mapRes!43447))))

(declare-fun condMapEmpty!43447 () Bool)

(declare-fun mapDefault!43447 () ValueCell!13167)

(assert (=> b!1113426 (= condMapEmpty!43447 (= (arr!34860 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13167)) mapDefault!43447)))))

(declare-fun b!1113427 () Bool)

(declare-fun res!743121 () Bool)

(assert (=> b!1113427 (=> (not res!743121) (not e!634699))))

(assert (=> b!1113427 (= res!743121 (arrayNoDuplicates!0 lt!496669 #b00000000000000000000000000000000 Nil!24306))))

(declare-fun b!1113428 () Bool)

(declare-fun res!743119 () Bool)

(assert (=> b!1113428 (=> (not res!743119) (not e!634700))))

(assert (=> b!1113428 (= res!743119 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1113429 () Bool)

(assert (=> b!1113429 (= e!634699 (not true))))

(declare-fun arrayContainsKey!0 (array!72413 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1113429 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36536 0))(
  ( (Unit!36537) )
))
(declare-fun lt!496670 () Unit!36536)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72413 (_ BitVec 64) (_ BitVec 32)) Unit!36536)

(assert (=> b!1113429 (= lt!496670 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!97522 res!743118) b!1113424))

(assert (= (and b!1113424 res!743120) b!1113421))

(assert (= (and b!1113421 res!743117) b!1113428))

(assert (= (and b!1113428 res!743119) b!1113419))

(assert (= (and b!1113419 res!743115) b!1113417))

(assert (= (and b!1113417 res!743114) b!1113423))

(assert (= (and b!1113423 res!743116) b!1113418))

(assert (= (and b!1113418 res!743113) b!1113422))

(assert (= (and b!1113422 res!743122) b!1113427))

(assert (= (and b!1113427 res!743121) b!1113429))

(assert (= (and b!1113426 condMapEmpty!43447) mapIsEmpty!43447))

(assert (= (and b!1113426 (not condMapEmpty!43447)) mapNonEmpty!43447))

(get-info :version)

(assert (= (and mapNonEmpty!43447 ((_ is ValueCellFull!13167) mapValue!43447)) b!1113420))

(assert (= (and b!1113426 ((_ is ValueCellFull!13167) mapDefault!43447)) b!1113425))

(assert (= start!97522 b!1113426))

(declare-fun m!1030633 () Bool)

(assert (=> b!1113418 m!1030633))

(declare-fun m!1030635 () Bool)

(assert (=> b!1113422 m!1030635))

(declare-fun m!1030637 () Bool)

(assert (=> b!1113422 m!1030637))

(declare-fun m!1030639 () Bool)

(assert (=> b!1113424 m!1030639))

(declare-fun m!1030641 () Bool)

(assert (=> b!1113419 m!1030641))

(declare-fun m!1030643 () Bool)

(assert (=> b!1113428 m!1030643))

(declare-fun m!1030645 () Bool)

(assert (=> b!1113429 m!1030645))

(declare-fun m!1030647 () Bool)

(assert (=> b!1113429 m!1030647))

(declare-fun m!1030649 () Bool)

(assert (=> start!97522 m!1030649))

(declare-fun m!1030651 () Bool)

(assert (=> start!97522 m!1030651))

(declare-fun m!1030653 () Bool)

(assert (=> mapNonEmpty!43447 m!1030653))

(declare-fun m!1030655 () Bool)

(assert (=> b!1113427 m!1030655))

(declare-fun m!1030657 () Bool)

(assert (=> b!1113423 m!1030657))

(check-sat (not b!1113419) (not b!1113422) (not b!1113427) (not mapNonEmpty!43447) (not start!97522) (not b!1113424) tp_is_empty!27753 (not b!1113423) (not b!1113429) (not b!1113428))
(check-sat)
