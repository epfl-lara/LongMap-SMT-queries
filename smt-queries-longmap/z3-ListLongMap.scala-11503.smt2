; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134276 () Bool)

(assert start!134276)

(declare-fun b_free!32125 () Bool)

(declare-fun b_next!32125 () Bool)

(assert (=> start!134276 (= b_free!32125 (not b_next!32125))))

(declare-fun tp!113670 () Bool)

(declare-fun b_and!51697 () Bool)

(assert (=> start!134276 (= tp!113670 b_and!51697)))

(declare-fun b!1567434 () Bool)

(declare-fun res!1070720 () Bool)

(declare-fun e!873811 () Bool)

(assert (=> b!1567434 (=> (not res!1070720) (not e!873811))))

(declare-fun from!782 () (_ BitVec 32))

(declare-datatypes ((array!104610 0))(
  ( (array!104611 (arr!50487 (Array (_ BitVec 32) (_ BitVec 64))) (size!51038 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104610)

(assert (=> b!1567434 (= res!1070720 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!51038 _keys!637)) (bvslt from!782 (size!51038 _keys!637))))))

(declare-fun b!1567435 () Bool)

(declare-fun res!1070718 () Bool)

(assert (=> b!1567435 (=> (not res!1070718) (not e!873811))))

(declare-datatypes ((List!36620 0))(
  ( (Nil!36617) (Cons!36616 (h!38080 (_ BitVec 64)) (t!51459 List!36620)) )
))
(declare-fun arrayNoDuplicates!0 (array!104610 (_ BitVec 32) List!36620) Bool)

(assert (=> b!1567435 (= res!1070718 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36617))))

(declare-fun b!1567436 () Bool)

(declare-fun e!873814 () Bool)

(declare-fun tp_is_empty!38899 () Bool)

(assert (=> b!1567436 (= e!873814 tp_is_empty!38899)))

(declare-fun b!1567437 () Bool)

(declare-fun res!1070716 () Bool)

(assert (=> b!1567437 (=> (not res!1070716) (not e!873811))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((V!60073 0))(
  ( (V!60074 (val!19533 Int)) )
))
(declare-datatypes ((ValueCell!18419 0))(
  ( (ValueCellFull!18419 (v!22279 V!60073)) (EmptyCell!18419) )
))
(declare-datatypes ((array!104612 0))(
  ( (array!104613 (arr!50488 (Array (_ BitVec 32) ValueCell!18419)) (size!51039 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104612)

(assert (=> b!1567437 (= res!1070716 (and (= (size!51039 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!51038 _keys!637) (size!51039 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!59734 () Bool)

(declare-fun mapRes!59734 () Bool)

(declare-fun tp!113671 () Bool)

(assert (=> mapNonEmpty!59734 (= mapRes!59734 (and tp!113671 e!873814))))

(declare-fun mapKey!59734 () (_ BitVec 32))

(declare-fun mapRest!59734 () (Array (_ BitVec 32) ValueCell!18419))

(declare-fun mapValue!59734 () ValueCell!18419)

(assert (=> mapNonEmpty!59734 (= (arr!50488 _values!487) (store mapRest!59734 mapKey!59734 mapValue!59734))))

(declare-fun b!1567438 () Bool)

(declare-fun e!873810 () Bool)

(declare-fun e!873813 () Bool)

(assert (=> b!1567438 (= e!873810 (and e!873813 mapRes!59734))))

(declare-fun condMapEmpty!59734 () Bool)

(declare-fun mapDefault!59734 () ValueCell!18419)

(assert (=> b!1567438 (= condMapEmpty!59734 (= (arr!50488 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18419)) mapDefault!59734)))))

(declare-fun res!1070719 () Bool)

(assert (=> start!134276 (=> (not res!1070719) (not e!873811))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134276 (= res!1070719 (validMask!0 mask!947))))

(assert (=> start!134276 e!873811))

(assert (=> start!134276 tp!113670))

(assert (=> start!134276 tp_is_empty!38899))

(assert (=> start!134276 true))

(declare-fun array_inv!39477 (array!104610) Bool)

(assert (=> start!134276 (array_inv!39477 _keys!637)))

(declare-fun array_inv!39478 (array!104612) Bool)

(assert (=> start!134276 (and (array_inv!39478 _values!487) e!873810)))

(declare-fun b!1567439 () Bool)

(assert (=> b!1567439 (= e!873813 tp_is_empty!38899)))

(declare-fun b!1567440 () Bool)

(assert (=> b!1567440 (= e!873811 (bvsge from!782 (size!51039 _values!487)))))

(declare-fun defaultEntry!495 () Int)

(declare-fun zeroValue!453 () V!60073)

(declare-fun minValue!453 () V!60073)

(declare-datatypes ((tuple2!25256 0))(
  ( (tuple2!25257 (_1!12639 (_ BitVec 64)) (_2!12639 V!60073)) )
))
(declare-datatypes ((List!36621 0))(
  ( (Nil!36618) (Cons!36617 (h!38081 tuple2!25256) (t!51460 List!36621)) )
))
(declare-datatypes ((ListLongMap!22699 0))(
  ( (ListLongMap!22700 (toList!11365 List!36621)) )
))
(declare-fun lt!673036 () ListLongMap!22699)

(declare-fun getCurrentListMapNoExtraKeys!6748 (array!104610 array!104612 (_ BitVec 32) (_ BitVec 32) V!60073 V!60073 (_ BitVec 32) Int) ListLongMap!22699)

(assert (=> b!1567440 (= lt!673036 (getCurrentListMapNoExtraKeys!6748 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun mapIsEmpty!59734 () Bool)

(assert (=> mapIsEmpty!59734 mapRes!59734))

(declare-fun b!1567441 () Bool)

(declare-fun res!1070717 () Bool)

(assert (=> b!1567441 (=> (not res!1070717) (not e!873811))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1567441 (= res!1070717 (validKeyInArray!0 (select (arr!50487 _keys!637) from!782)))))

(declare-fun b!1567442 () Bool)

(declare-fun res!1070721 () Bool)

(assert (=> b!1567442 (=> (not res!1070721) (not e!873811))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104610 (_ BitVec 32)) Bool)

(assert (=> b!1567442 (= res!1070721 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(assert (= (and start!134276 res!1070719) b!1567437))

(assert (= (and b!1567437 res!1070716) b!1567442))

(assert (= (and b!1567442 res!1070721) b!1567435))

(assert (= (and b!1567435 res!1070718) b!1567434))

(assert (= (and b!1567434 res!1070720) b!1567441))

(assert (= (and b!1567441 res!1070717) b!1567440))

(assert (= (and b!1567438 condMapEmpty!59734) mapIsEmpty!59734))

(assert (= (and b!1567438 (not condMapEmpty!59734)) mapNonEmpty!59734))

(get-info :version)

(assert (= (and mapNonEmpty!59734 ((_ is ValueCellFull!18419) mapValue!59734)) b!1567436))

(assert (= (and b!1567438 ((_ is ValueCellFull!18419) mapDefault!59734)) b!1567439))

(assert (= start!134276 b!1567438))

(declare-fun m!1442259 () Bool)

(assert (=> mapNonEmpty!59734 m!1442259))

(declare-fun m!1442261 () Bool)

(assert (=> b!1567441 m!1442261))

(assert (=> b!1567441 m!1442261))

(declare-fun m!1442263 () Bool)

(assert (=> b!1567441 m!1442263))

(declare-fun m!1442265 () Bool)

(assert (=> b!1567440 m!1442265))

(declare-fun m!1442267 () Bool)

(assert (=> start!134276 m!1442267))

(declare-fun m!1442269 () Bool)

(assert (=> start!134276 m!1442269))

(declare-fun m!1442271 () Bool)

(assert (=> start!134276 m!1442271))

(declare-fun m!1442273 () Bool)

(assert (=> b!1567435 m!1442273))

(declare-fun m!1442275 () Bool)

(assert (=> b!1567442 m!1442275))

(check-sat (not b!1567435) tp_is_empty!38899 (not b!1567442) (not b!1567441) (not start!134276) (not mapNonEmpty!59734) (not b_next!32125) (not b!1567440) b_and!51697)
(check-sat b_and!51697 (not b_next!32125))
