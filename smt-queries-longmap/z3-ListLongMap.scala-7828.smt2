; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97948 () Bool)

(assert start!97948)

(declare-fun b!1118449 () Bool)

(declare-fun res!746492 () Bool)

(declare-fun e!637263 () Bool)

(assert (=> b!1118449 (=> (not res!746492) (not e!637263))))

(declare-datatypes ((array!72823 0))(
  ( (array!72824 (arr!35058 (Array (_ BitVec 32) (_ BitVec 64))) (size!35595 (_ BitVec 32))) )
))
(declare-fun lt!497755 () array!72823)

(declare-datatypes ((List!24404 0))(
  ( (Nil!24401) (Cons!24400 (h!25618 (_ BitVec 64)) (t!34877 List!24404)) )
))
(declare-fun arrayNoDuplicates!0 (array!72823 (_ BitVec 32) List!24404) Bool)

(assert (=> b!1118449 (= res!746492 (arrayNoDuplicates!0 lt!497755 #b00000000000000000000000000000000 Nil!24401))))

(declare-fun b!1118450 () Bool)

(declare-fun e!637265 () Bool)

(declare-fun tp_is_empty!27943 () Bool)

(assert (=> b!1118450 (= e!637265 tp_is_empty!27943)))

(declare-fun b!1118451 () Bool)

(assert (=> b!1118451 (= e!637263 (not true))))

(declare-fun _keys!1208 () array!72823)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72823 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1118451 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!36639 0))(
  ( (Unit!36640) )
))
(declare-fun lt!497754 () Unit!36639)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72823 (_ BitVec 64) (_ BitVec 32)) Unit!36639)

(assert (=> b!1118451 (= lt!497754 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!746494 () Bool)

(declare-fun e!637261 () Bool)

(assert (=> start!97948 (=> (not res!746494) (not e!637261))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97948 (= res!746494 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35595 _keys!1208))))))

(assert (=> start!97948 e!637261))

(declare-fun array_inv!27006 (array!72823) Bool)

(assert (=> start!97948 (array_inv!27006 _keys!1208)))

(assert (=> start!97948 true))

(declare-datatypes ((V!42385 0))(
  ( (V!42386 (val!14028 Int)) )
))
(declare-datatypes ((ValueCell!13262 0))(
  ( (ValueCellFull!13262 (v!16657 V!42385)) (EmptyCell!13262) )
))
(declare-datatypes ((array!72825 0))(
  ( (array!72826 (arr!35059 (Array (_ BitVec 32) ValueCell!13262)) (size!35596 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72825)

(declare-fun e!637264 () Bool)

(declare-fun array_inv!27007 (array!72825) Bool)

(assert (=> start!97948 (and (array_inv!27007 _values!996) e!637264)))

(declare-fun b!1118452 () Bool)

(declare-fun res!746487 () Bool)

(assert (=> b!1118452 (=> (not res!746487) (not e!637261))))

(assert (=> b!1118452 (= res!746487 (= (select (arr!35058 _keys!1208) i!673) k0!934))))

(declare-fun b!1118453 () Bool)

(declare-fun res!746488 () Bool)

(assert (=> b!1118453 (=> (not res!746488) (not e!637261))))

(assert (=> b!1118453 (= res!746488 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35595 _keys!1208))))))

(declare-fun b!1118454 () Bool)

(declare-fun res!746493 () Bool)

(assert (=> b!1118454 (=> (not res!746493) (not e!637261))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1118454 (= res!746493 (and (= (size!35596 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35595 _keys!1208) (size!35596 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1118455 () Bool)

(declare-fun res!746489 () Bool)

(assert (=> b!1118455 (=> (not res!746489) (not e!637261))))

(assert (=> b!1118455 (= res!746489 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24401))))

(declare-fun mapIsEmpty!43732 () Bool)

(declare-fun mapRes!43732 () Bool)

(assert (=> mapIsEmpty!43732 mapRes!43732))

(declare-fun b!1118456 () Bool)

(declare-fun e!637266 () Bool)

(assert (=> b!1118456 (= e!637266 tp_is_empty!27943)))

(declare-fun b!1118457 () Bool)

(assert (=> b!1118457 (= e!637261 e!637263)))

(declare-fun res!746491 () Bool)

(assert (=> b!1118457 (=> (not res!746491) (not e!637263))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72823 (_ BitVec 32)) Bool)

(assert (=> b!1118457 (= res!746491 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497755 mask!1564))))

(assert (=> b!1118457 (= lt!497755 (array!72824 (store (arr!35058 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35595 _keys!1208)))))

(declare-fun b!1118458 () Bool)

(assert (=> b!1118458 (= e!637264 (and e!637265 mapRes!43732))))

(declare-fun condMapEmpty!43732 () Bool)

(declare-fun mapDefault!43732 () ValueCell!13262)

(assert (=> b!1118458 (= condMapEmpty!43732 (= (arr!35059 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13262)) mapDefault!43732)))))

(declare-fun b!1118459 () Bool)

(declare-fun res!746486 () Bool)

(assert (=> b!1118459 (=> (not res!746486) (not e!637261))))

(assert (=> b!1118459 (= res!746486 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1118460 () Bool)

(declare-fun res!746490 () Bool)

(assert (=> b!1118460 (=> (not res!746490) (not e!637261))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1118460 (= res!746490 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!43732 () Bool)

(declare-fun tp!82976 () Bool)

(assert (=> mapNonEmpty!43732 (= mapRes!43732 (and tp!82976 e!637266))))

(declare-fun mapRest!43732 () (Array (_ BitVec 32) ValueCell!13262))

(declare-fun mapKey!43732 () (_ BitVec 32))

(declare-fun mapValue!43732 () ValueCell!13262)

(assert (=> mapNonEmpty!43732 (= (arr!35059 _values!996) (store mapRest!43732 mapKey!43732 mapValue!43732))))

(declare-fun b!1118461 () Bool)

(declare-fun res!746485 () Bool)

(assert (=> b!1118461 (=> (not res!746485) (not e!637261))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1118461 (= res!746485 (validMask!0 mask!1564))))

(assert (= (and start!97948 res!746494) b!1118461))

(assert (= (and b!1118461 res!746485) b!1118454))

(assert (= (and b!1118454 res!746493) b!1118459))

(assert (= (and b!1118459 res!746486) b!1118455))

(assert (= (and b!1118455 res!746489) b!1118453))

(assert (= (and b!1118453 res!746488) b!1118460))

(assert (= (and b!1118460 res!746490) b!1118452))

(assert (= (and b!1118452 res!746487) b!1118457))

(assert (= (and b!1118457 res!746491) b!1118449))

(assert (= (and b!1118449 res!746492) b!1118451))

(assert (= (and b!1118458 condMapEmpty!43732) mapIsEmpty!43732))

(assert (= (and b!1118458 (not condMapEmpty!43732)) mapNonEmpty!43732))

(get-info :version)

(assert (= (and mapNonEmpty!43732 ((_ is ValueCellFull!13262) mapValue!43732)) b!1118456))

(assert (= (and b!1118458 ((_ is ValueCellFull!13262) mapDefault!43732)) b!1118450))

(assert (= start!97948 b!1118458))

(declare-fun m!1034775 () Bool)

(assert (=> b!1118449 m!1034775))

(declare-fun m!1034777 () Bool)

(assert (=> b!1118459 m!1034777))

(declare-fun m!1034779 () Bool)

(assert (=> b!1118461 m!1034779))

(declare-fun m!1034781 () Bool)

(assert (=> b!1118460 m!1034781))

(declare-fun m!1034783 () Bool)

(assert (=> start!97948 m!1034783))

(declare-fun m!1034785 () Bool)

(assert (=> start!97948 m!1034785))

(declare-fun m!1034787 () Bool)

(assert (=> b!1118455 m!1034787))

(declare-fun m!1034789 () Bool)

(assert (=> mapNonEmpty!43732 m!1034789))

(declare-fun m!1034791 () Bool)

(assert (=> b!1118457 m!1034791))

(declare-fun m!1034793 () Bool)

(assert (=> b!1118457 m!1034793))

(declare-fun m!1034795 () Bool)

(assert (=> b!1118451 m!1034795))

(declare-fun m!1034797 () Bool)

(assert (=> b!1118451 m!1034797))

(declare-fun m!1034799 () Bool)

(assert (=> b!1118452 m!1034799))

(check-sat (not start!97948) (not b!1118455) (not b!1118457) (not b!1118460) (not b!1118461) (not b!1118459) (not b!1118449) (not mapNonEmpty!43732) (not b!1118451) tp_is_empty!27943)
(check-sat)
