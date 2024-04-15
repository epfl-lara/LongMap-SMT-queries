; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133814 () Bool)

(assert start!133814)

(declare-fun b_free!32125 () Bool)

(declare-fun b_next!32125 () Bool)

(assert (=> start!133814 (= b_free!32125 (not b_next!32125))))

(declare-fun tp!113672 () Bool)

(declare-fun b_and!51677 () Bool)

(assert (=> start!133814 (= tp!113672 b_and!51677)))

(declare-fun b!1564685 () Bool)

(declare-fun res!1069730 () Bool)

(declare-fun e!872104 () Bool)

(assert (=> b!1564685 (=> (not res!1069730) (not e!872104))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((array!104416 0))(
  ( (array!104417 (arr!50398 (Array (_ BitVec 32) (_ BitVec 64))) (size!50950 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104416)

(declare-datatypes ((V!60073 0))(
  ( (V!60074 (val!19533 Int)) )
))
(declare-datatypes ((ValueCell!18419 0))(
  ( (ValueCellFull!18419 (v!22283 V!60073)) (EmptyCell!18419) )
))
(declare-datatypes ((array!104418 0))(
  ( (array!104419 (arr!50399 (Array (_ BitVec 32) ValueCell!18419)) (size!50951 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104418)

(assert (=> b!1564685 (= res!1069730 (and (= (size!50951 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50950 _keys!637) (size!50951 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun res!1069732 () Bool)

(assert (=> start!133814 (=> (not res!1069732) (not e!872104))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133814 (= res!1069732 (validMask!0 mask!947))))

(assert (=> start!133814 e!872104))

(assert (=> start!133814 tp!113672))

(declare-fun tp_is_empty!38899 () Bool)

(assert (=> start!133814 tp_is_empty!38899))

(assert (=> start!133814 true))

(declare-fun array_inv!39367 (array!104416) Bool)

(assert (=> start!133814 (array_inv!39367 _keys!637)))

(declare-fun e!872106 () Bool)

(declare-fun array_inv!39368 (array!104418) Bool)

(assert (=> start!133814 (and (array_inv!39368 _values!487) e!872106)))

(declare-fun mapNonEmpty!59734 () Bool)

(declare-fun mapRes!59734 () Bool)

(declare-fun tp!113671 () Bool)

(declare-fun e!872105 () Bool)

(assert (=> mapNonEmpty!59734 (= mapRes!59734 (and tp!113671 e!872105))))

(declare-fun mapRest!59734 () (Array (_ BitVec 32) ValueCell!18419))

(declare-fun mapKey!59734 () (_ BitVec 32))

(declare-fun mapValue!59734 () ValueCell!18419)

(assert (=> mapNonEmpty!59734 (= (arr!50399 _values!487) (store mapRest!59734 mapKey!59734 mapValue!59734))))

(declare-fun b!1564686 () Bool)

(declare-fun res!1069727 () Bool)

(assert (=> b!1564686 (=> (not res!1069727) (not e!872104))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1564686 (= res!1069727 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50950 _keys!637)) (bvslt from!782 (size!50950 _keys!637))))))

(declare-fun b!1564687 () Bool)

(declare-fun res!1069728 () Bool)

(assert (=> b!1564687 (=> (not res!1069728) (not e!872104))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1564687 (= res!1069728 (validKeyInArray!0 (select (arr!50398 _keys!637) from!782)))))

(declare-fun b!1564688 () Bool)

(declare-fun e!872107 () Bool)

(assert (=> b!1564688 (= e!872107 tp_is_empty!38899)))

(declare-fun mapIsEmpty!59734 () Bool)

(assert (=> mapIsEmpty!59734 mapRes!59734))

(declare-fun b!1564689 () Bool)

(assert (=> b!1564689 (= e!872105 tp_is_empty!38899)))

(declare-fun b!1564690 () Bool)

(declare-fun res!1069731 () Bool)

(assert (=> b!1564690 (=> (not res!1069731) (not e!872104))))

(declare-datatypes ((List!36638 0))(
  ( (Nil!36635) (Cons!36634 (h!38081 (_ BitVec 64)) (t!51477 List!36638)) )
))
(declare-fun arrayNoDuplicates!0 (array!104416 (_ BitVec 32) List!36638) Bool)

(assert (=> b!1564690 (= res!1069731 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36635))))

(declare-fun b!1564691 () Bool)

(declare-fun res!1069729 () Bool)

(assert (=> b!1564691 (=> (not res!1069729) (not e!872104))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104416 (_ BitVec 32)) Bool)

(assert (=> b!1564691 (= res!1069729 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1564692 () Bool)

(assert (=> b!1564692 (= e!872104 (bvsge from!782 (size!50951 _values!487)))))

(declare-fun defaultEntry!495 () Int)

(declare-fun zeroValue!453 () V!60073)

(declare-datatypes ((tuple2!25280 0))(
  ( (tuple2!25281 (_1!12651 (_ BitVec 64)) (_2!12651 V!60073)) )
))
(declare-datatypes ((List!36639 0))(
  ( (Nil!36636) (Cons!36635 (h!38082 tuple2!25280) (t!51478 List!36639)) )
))
(declare-datatypes ((ListLongMap!22715 0))(
  ( (ListLongMap!22716 (toList!11373 List!36639)) )
))
(declare-fun lt!671842 () ListLongMap!22715)

(declare-fun minValue!453 () V!60073)

(declare-fun getCurrentListMapNoExtraKeys!6725 (array!104416 array!104418 (_ BitVec 32) (_ BitVec 32) V!60073 V!60073 (_ BitVec 32) Int) ListLongMap!22715)

(assert (=> b!1564692 (= lt!671842 (getCurrentListMapNoExtraKeys!6725 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1564693 () Bool)

(assert (=> b!1564693 (= e!872106 (and e!872107 mapRes!59734))))

(declare-fun condMapEmpty!59734 () Bool)

(declare-fun mapDefault!59734 () ValueCell!18419)

(assert (=> b!1564693 (= condMapEmpty!59734 (= (arr!50399 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18419)) mapDefault!59734)))))

(assert (= (and start!133814 res!1069732) b!1564685))

(assert (= (and b!1564685 res!1069730) b!1564691))

(assert (= (and b!1564691 res!1069729) b!1564690))

(assert (= (and b!1564690 res!1069731) b!1564686))

(assert (= (and b!1564686 res!1069727) b!1564687))

(assert (= (and b!1564687 res!1069728) b!1564692))

(assert (= (and b!1564693 condMapEmpty!59734) mapIsEmpty!59734))

(assert (= (and b!1564693 (not condMapEmpty!59734)) mapNonEmpty!59734))

(get-info :version)

(assert (= (and mapNonEmpty!59734 ((_ is ValueCellFull!18419) mapValue!59734)) b!1564689))

(assert (= (and b!1564693 ((_ is ValueCellFull!18419) mapDefault!59734)) b!1564688))

(assert (= start!133814 b!1564693))

(declare-fun m!1439109 () Bool)

(assert (=> start!133814 m!1439109))

(declare-fun m!1439111 () Bool)

(assert (=> start!133814 m!1439111))

(declare-fun m!1439113 () Bool)

(assert (=> start!133814 m!1439113))

(declare-fun m!1439115 () Bool)

(assert (=> b!1564691 m!1439115))

(declare-fun m!1439117 () Bool)

(assert (=> b!1564687 m!1439117))

(assert (=> b!1564687 m!1439117))

(declare-fun m!1439119 () Bool)

(assert (=> b!1564687 m!1439119))

(declare-fun m!1439121 () Bool)

(assert (=> b!1564692 m!1439121))

(declare-fun m!1439123 () Bool)

(assert (=> b!1564690 m!1439123))

(declare-fun m!1439125 () Bool)

(assert (=> mapNonEmpty!59734 m!1439125))

(check-sat (not b!1564690) (not b!1564687) (not mapNonEmpty!59734) b_and!51677 (not b_next!32125) tp_is_empty!38899 (not start!133814) (not b!1564692) (not b!1564691))
(check-sat b_and!51677 (not b_next!32125))
