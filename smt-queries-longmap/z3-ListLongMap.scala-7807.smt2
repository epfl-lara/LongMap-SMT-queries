; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97588 () Bool)

(assert start!97588)

(declare-fun b!1114704 () Bool)

(declare-fun e!635295 () Bool)

(declare-fun tp_is_empty!27819 () Bool)

(assert (=> b!1114704 (= e!635295 tp_is_empty!27819)))

(declare-fun b!1114705 () Bool)

(declare-fun res!744106 () Bool)

(declare-fun e!635294 () Bool)

(assert (=> b!1114705 (=> (not res!744106) (not e!635294))))

(declare-datatypes ((array!72543 0))(
  ( (array!72544 (arr!34924 (Array (_ BitVec 32) (_ BitVec 64))) (size!35460 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72543)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!42219 0))(
  ( (V!42220 (val!13966 Int)) )
))
(declare-datatypes ((ValueCell!13200 0))(
  ( (ValueCellFull!13200 (v!16599 V!42219)) (EmptyCell!13200) )
))
(declare-datatypes ((array!72545 0))(
  ( (array!72546 (arr!34925 (Array (_ BitVec 32) ValueCell!13200)) (size!35461 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72545)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1114705 (= res!744106 (and (= (size!35461 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35460 _keys!1208) (size!35461 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1114706 () Bool)

(declare-fun res!744105 () Bool)

(assert (=> b!1114706 (=> (not res!744105) (not e!635294))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1114706 (= res!744105 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!43546 () Bool)

(declare-fun mapRes!43546 () Bool)

(assert (=> mapIsEmpty!43546 mapRes!43546))

(declare-fun b!1114707 () Bool)

(declare-fun res!744109 () Bool)

(assert (=> b!1114707 (=> (not res!744109) (not e!635294))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72543 (_ BitVec 32)) Bool)

(assert (=> b!1114707 (= res!744109 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1114708 () Bool)

(declare-fun e!635293 () Bool)

(declare-fun e!635290 () Bool)

(assert (=> b!1114708 (= e!635293 (and e!635290 mapRes!43546))))

(declare-fun condMapEmpty!43546 () Bool)

(declare-fun mapDefault!43546 () ValueCell!13200)

(assert (=> b!1114708 (= condMapEmpty!43546 (= (arr!34925 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13200)) mapDefault!43546)))))

(declare-fun b!1114709 () Bool)

(declare-fun res!744111 () Bool)

(declare-fun e!635292 () Bool)

(assert (=> b!1114709 (=> (not res!744111) (not e!635292))))

(declare-fun lt!496867 () array!72543)

(declare-datatypes ((List!24334 0))(
  ( (Nil!24331) (Cons!24330 (h!25539 (_ BitVec 64)) (t!34815 List!24334)) )
))
(declare-fun arrayNoDuplicates!0 (array!72543 (_ BitVec 32) List!24334) Bool)

(assert (=> b!1114709 (= res!744111 (arrayNoDuplicates!0 lt!496867 #b00000000000000000000000000000000 Nil!24331))))

(declare-fun b!1114710 () Bool)

(assert (=> b!1114710 (= e!635294 e!635292)))

(declare-fun res!744107 () Bool)

(assert (=> b!1114710 (=> (not res!744107) (not e!635292))))

(assert (=> b!1114710 (= res!744107 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496867 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1114710 (= lt!496867 (array!72544 (store (arr!34924 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35460 _keys!1208)))))

(declare-fun b!1114711 () Bool)

(assert (=> b!1114711 (= e!635290 tp_is_empty!27819)))

(declare-fun b!1114713 () Bool)

(declare-fun res!744112 () Bool)

(assert (=> b!1114713 (=> (not res!744112) (not e!635294))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1114713 (= res!744112 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!43546 () Bool)

(declare-fun tp!82790 () Bool)

(assert (=> mapNonEmpty!43546 (= mapRes!43546 (and tp!82790 e!635295))))

(declare-fun mapKey!43546 () (_ BitVec 32))

(declare-fun mapRest!43546 () (Array (_ BitVec 32) ValueCell!13200))

(declare-fun mapValue!43546 () ValueCell!13200)

(assert (=> mapNonEmpty!43546 (= (arr!34925 _values!996) (store mapRest!43546 mapKey!43546 mapValue!43546))))

(declare-fun b!1114714 () Bool)

(declare-fun res!744103 () Bool)

(assert (=> b!1114714 (=> (not res!744103) (not e!635294))))

(assert (=> b!1114714 (= res!744103 (= (select (arr!34924 _keys!1208) i!673) k0!934))))

(declare-fun b!1114715 () Bool)

(assert (=> b!1114715 (= e!635292 (not true))))

(declare-fun arrayContainsKey!0 (array!72543 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1114715 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36584 0))(
  ( (Unit!36585) )
))
(declare-fun lt!496868 () Unit!36584)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72543 (_ BitVec 64) (_ BitVec 32)) Unit!36584)

(assert (=> b!1114715 (= lt!496868 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1114716 () Bool)

(declare-fun res!744110 () Bool)

(assert (=> b!1114716 (=> (not res!744110) (not e!635294))))

(assert (=> b!1114716 (= res!744110 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24331))))

(declare-fun res!744104 () Bool)

(assert (=> start!97588 (=> (not res!744104) (not e!635294))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97588 (= res!744104 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35460 _keys!1208))))))

(assert (=> start!97588 e!635294))

(declare-fun array_inv!26848 (array!72543) Bool)

(assert (=> start!97588 (array_inv!26848 _keys!1208)))

(assert (=> start!97588 true))

(declare-fun array_inv!26849 (array!72545) Bool)

(assert (=> start!97588 (and (array_inv!26849 _values!996) e!635293)))

(declare-fun b!1114712 () Bool)

(declare-fun res!744108 () Bool)

(assert (=> b!1114712 (=> (not res!744108) (not e!635294))))

(assert (=> b!1114712 (= res!744108 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35460 _keys!1208))))))

(assert (= (and start!97588 res!744104) b!1114706))

(assert (= (and b!1114706 res!744105) b!1114705))

(assert (= (and b!1114705 res!744106) b!1114707))

(assert (= (and b!1114707 res!744109) b!1114716))

(assert (= (and b!1114716 res!744110) b!1114712))

(assert (= (and b!1114712 res!744108) b!1114713))

(assert (= (and b!1114713 res!744112) b!1114714))

(assert (= (and b!1114714 res!744103) b!1114710))

(assert (= (and b!1114710 res!744107) b!1114709))

(assert (= (and b!1114709 res!744111) b!1114715))

(assert (= (and b!1114708 condMapEmpty!43546) mapIsEmpty!43546))

(assert (= (and b!1114708 (not condMapEmpty!43546)) mapNonEmpty!43546))

(get-info :version)

(assert (= (and mapNonEmpty!43546 ((_ is ValueCellFull!13200) mapValue!43546)) b!1114704))

(assert (= (and b!1114708 ((_ is ValueCellFull!13200) mapDefault!43546)) b!1114711))

(assert (= start!97588 b!1114708))

(declare-fun m!1031491 () Bool)

(assert (=> b!1114714 m!1031491))

(declare-fun m!1031493 () Bool)

(assert (=> b!1114707 m!1031493))

(declare-fun m!1031495 () Bool)

(assert (=> b!1114710 m!1031495))

(declare-fun m!1031497 () Bool)

(assert (=> b!1114710 m!1031497))

(declare-fun m!1031499 () Bool)

(assert (=> b!1114716 m!1031499))

(declare-fun m!1031501 () Bool)

(assert (=> b!1114706 m!1031501))

(declare-fun m!1031503 () Bool)

(assert (=> b!1114713 m!1031503))

(declare-fun m!1031505 () Bool)

(assert (=> b!1114715 m!1031505))

(declare-fun m!1031507 () Bool)

(assert (=> b!1114715 m!1031507))

(declare-fun m!1031509 () Bool)

(assert (=> b!1114709 m!1031509))

(declare-fun m!1031511 () Bool)

(assert (=> start!97588 m!1031511))

(declare-fun m!1031513 () Bool)

(assert (=> start!97588 m!1031513))

(declare-fun m!1031515 () Bool)

(assert (=> mapNonEmpty!43546 m!1031515))

(check-sat (not b!1114710) (not b!1114706) (not b!1114713) (not b!1114709) (not start!97588) (not b!1114715) (not b!1114707) (not b!1114716) tp_is_empty!27819 (not mapNonEmpty!43546))
(check-sat)
