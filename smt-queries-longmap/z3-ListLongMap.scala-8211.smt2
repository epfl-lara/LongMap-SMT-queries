; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100368 () Bool)

(assert start!100368)

(declare-fun b!1195419 () Bool)

(declare-fun res!795002 () Bool)

(declare-fun e!679484 () Bool)

(assert (=> b!1195419 (=> (not res!795002) (not e!679484))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1195419 (= res!795002 (validMask!0 mask!1564))))

(declare-fun b!1195420 () Bool)

(declare-fun res!795001 () Bool)

(assert (=> b!1195420 (=> (not res!795001) (not e!679484))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1195420 (= res!795001 (validKeyInArray!0 k0!934))))

(declare-fun b!1195421 () Bool)

(declare-fun res!795000 () Bool)

(assert (=> b!1195421 (=> (not res!795000) (not e!679484))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!77301 0))(
  ( (array!77302 (arr!37294 (Array (_ BitVec 32) (_ BitVec 64))) (size!37831 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77301)

(assert (=> b!1195421 (= res!795000 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37831 _keys!1208))))))

(declare-fun res!795005 () Bool)

(assert (=> start!100368 (=> (not res!795005) (not e!679484))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100368 (= res!795005 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37831 _keys!1208))))))

(assert (=> start!100368 e!679484))

(declare-fun array_inv!28500 (array!77301) Bool)

(assert (=> start!100368 (array_inv!28500 _keys!1208)))

(assert (=> start!100368 true))

(declare-datatypes ((V!45449 0))(
  ( (V!45450 (val!15177 Int)) )
))
(declare-datatypes ((ValueCell!14411 0))(
  ( (ValueCellFull!14411 (v!17811 V!45449)) (EmptyCell!14411) )
))
(declare-datatypes ((array!77303 0))(
  ( (array!77304 (arr!37295 (Array (_ BitVec 32) ValueCell!14411)) (size!37832 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77303)

(declare-fun e!679486 () Bool)

(declare-fun array_inv!28501 (array!77303) Bool)

(assert (=> start!100368 (and (array_inv!28501 _values!996) e!679486)))

(declare-fun b!1195422 () Bool)

(declare-fun e!679485 () Bool)

(declare-fun tp_is_empty!30241 () Bool)

(assert (=> b!1195422 (= e!679485 tp_is_empty!30241)))

(declare-fun b!1195423 () Bool)

(declare-fun res!795006 () Bool)

(assert (=> b!1195423 (=> (not res!795006) (not e!679484))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77301 (_ BitVec 32)) Bool)

(assert (=> b!1195423 (= res!795006 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1195424 () Bool)

(declare-fun e!679483 () Bool)

(assert (=> b!1195424 (= e!679484 e!679483)))

(declare-fun res!795003 () Bool)

(assert (=> b!1195424 (=> (not res!795003) (not e!679483))))

(declare-fun lt!543211 () array!77301)

(assert (=> b!1195424 (= res!795003 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543211 mask!1564))))

(assert (=> b!1195424 (= lt!543211 (array!77302 (store (arr!37294 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37831 _keys!1208)))))

(declare-fun b!1195425 () Bool)

(declare-fun res!795007 () Bool)

(assert (=> b!1195425 (=> (not res!795007) (not e!679484))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1195425 (= res!795007 (and (= (size!37832 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37831 _keys!1208) (size!37832 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1195426 () Bool)

(assert (=> b!1195426 (= e!679483 false)))

(declare-fun lt!543210 () Bool)

(declare-datatypes ((List!26286 0))(
  ( (Nil!26283) (Cons!26282 (h!27500 (_ BitVec 64)) (t!38949 List!26286)) )
))
(declare-fun arrayNoDuplicates!0 (array!77301 (_ BitVec 32) List!26286) Bool)

(assert (=> b!1195426 (= lt!543210 (arrayNoDuplicates!0 lt!543211 #b00000000000000000000000000000000 Nil!26283))))

(declare-fun b!1195427 () Bool)

(declare-fun res!795008 () Bool)

(assert (=> b!1195427 (=> (not res!795008) (not e!679484))))

(assert (=> b!1195427 (= res!795008 (= (select (arr!37294 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!47189 () Bool)

(declare-fun mapRes!47189 () Bool)

(declare-fun tp!89799 () Bool)

(assert (=> mapNonEmpty!47189 (= mapRes!47189 (and tp!89799 e!679485))))

(declare-fun mapRest!47189 () (Array (_ BitVec 32) ValueCell!14411))

(declare-fun mapKey!47189 () (_ BitVec 32))

(declare-fun mapValue!47189 () ValueCell!14411)

(assert (=> mapNonEmpty!47189 (= (arr!37295 _values!996) (store mapRest!47189 mapKey!47189 mapValue!47189))))

(declare-fun mapIsEmpty!47189 () Bool)

(assert (=> mapIsEmpty!47189 mapRes!47189))

(declare-fun b!1195428 () Bool)

(declare-fun res!795004 () Bool)

(assert (=> b!1195428 (=> (not res!795004) (not e!679484))))

(assert (=> b!1195428 (= res!795004 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26283))))

(declare-fun b!1195429 () Bool)

(declare-fun e!679482 () Bool)

(assert (=> b!1195429 (= e!679486 (and e!679482 mapRes!47189))))

(declare-fun condMapEmpty!47189 () Bool)

(declare-fun mapDefault!47189 () ValueCell!14411)

(assert (=> b!1195429 (= condMapEmpty!47189 (= (arr!37295 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14411)) mapDefault!47189)))))

(declare-fun b!1195430 () Bool)

(assert (=> b!1195430 (= e!679482 tp_is_empty!30241)))

(assert (= (and start!100368 res!795005) b!1195419))

(assert (= (and b!1195419 res!795002) b!1195425))

(assert (= (and b!1195425 res!795007) b!1195423))

(assert (= (and b!1195423 res!795006) b!1195428))

(assert (= (and b!1195428 res!795004) b!1195421))

(assert (= (and b!1195421 res!795000) b!1195420))

(assert (= (and b!1195420 res!795001) b!1195427))

(assert (= (and b!1195427 res!795008) b!1195424))

(assert (= (and b!1195424 res!795003) b!1195426))

(assert (= (and b!1195429 condMapEmpty!47189) mapIsEmpty!47189))

(assert (= (and b!1195429 (not condMapEmpty!47189)) mapNonEmpty!47189))

(get-info :version)

(assert (= (and mapNonEmpty!47189 ((_ is ValueCellFull!14411) mapValue!47189)) b!1195422))

(assert (= (and b!1195429 ((_ is ValueCellFull!14411) mapDefault!47189)) b!1195430))

(assert (= start!100368 b!1195429))

(declare-fun m!1103733 () Bool)

(assert (=> b!1195427 m!1103733))

(declare-fun m!1103735 () Bool)

(assert (=> b!1195424 m!1103735))

(declare-fun m!1103737 () Bool)

(assert (=> b!1195424 m!1103737))

(declare-fun m!1103739 () Bool)

(assert (=> b!1195428 m!1103739))

(declare-fun m!1103741 () Bool)

(assert (=> b!1195426 m!1103741))

(declare-fun m!1103743 () Bool)

(assert (=> b!1195420 m!1103743))

(declare-fun m!1103745 () Bool)

(assert (=> b!1195423 m!1103745))

(declare-fun m!1103747 () Bool)

(assert (=> b!1195419 m!1103747))

(declare-fun m!1103749 () Bool)

(assert (=> start!100368 m!1103749))

(declare-fun m!1103751 () Bool)

(assert (=> start!100368 m!1103751))

(declare-fun m!1103753 () Bool)

(assert (=> mapNonEmpty!47189 m!1103753))

(check-sat (not b!1195426) tp_is_empty!30241 (not b!1195423) (not mapNonEmpty!47189) (not b!1195420) (not b!1195419) (not b!1195424) (not start!100368) (not b!1195428))
(check-sat)
