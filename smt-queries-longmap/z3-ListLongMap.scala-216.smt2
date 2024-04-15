; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3968 () Bool)

(assert start!3968)

(declare-fun b_free!883 () Bool)

(declare-fun b_next!883 () Bool)

(assert (=> start!3968 (= b_free!883 (not b_next!883))))

(declare-fun tp!4069 () Bool)

(declare-fun b_and!1687 () Bool)

(assert (=> start!3968 (= tp!4069 b_and!1687)))

(declare-fun res!17067 () Bool)

(declare-fun e!18488 () Bool)

(assert (=> start!3968 (=> (not res!17067) (not e!18488))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3968 (= res!17067 (validMask!0 mask!2294))))

(assert (=> start!3968 e!18488))

(assert (=> start!3968 true))

(assert (=> start!3968 tp!4069))

(declare-datatypes ((V!1475 0))(
  ( (V!1476 (val!645 Int)) )
))
(declare-datatypes ((ValueCell!419 0))(
  ( (ValueCellFull!419 (v!1733 V!1475)) (EmptyCell!419) )
))
(declare-datatypes ((array!1687 0))(
  ( (array!1688 (arr!797 (Array (_ BitVec 32) ValueCell!419)) (size!898 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1687)

(declare-fun e!18490 () Bool)

(declare-fun array_inv!557 (array!1687) Bool)

(assert (=> start!3968 (and (array_inv!557 _values!1501) e!18490)))

(declare-datatypes ((array!1689 0))(
  ( (array!1690 (arr!798 (Array (_ BitVec 32) (_ BitVec 64))) (size!899 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1689)

(declare-fun array_inv!558 (array!1689) Bool)

(assert (=> start!3968 (array_inv!558 _keys!1833)))

(declare-fun tp_is_empty!1237 () Bool)

(assert (=> start!3968 tp_is_empty!1237))

(declare-fun b!28601 () Bool)

(declare-fun res!17071 () Bool)

(assert (=> b!28601 (=> (not res!17071) (not e!18488))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!28601 (= res!17071 (and (= (size!898 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!899 _keys!1833) (size!898 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!28602 () Bool)

(declare-fun e!18485 () Bool)

(assert (=> b!28602 (= e!18485 tp_is_empty!1237)))

(declare-fun b!28603 () Bool)

(declare-fun res!17070 () Bool)

(declare-fun e!18487 () Bool)

(assert (=> b!28603 (=> (not res!17070) (not e!18487))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!1689 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!28603 (= res!17070 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!28604 () Bool)

(assert (=> b!28604 (= e!18488 e!18487)))

(declare-fun res!17068 () Bool)

(assert (=> b!28604 (=> (not res!17068) (not e!18487))))

(declare-datatypes ((tuple2!1084 0))(
  ( (tuple2!1085 (_1!553 (_ BitVec 64)) (_2!553 V!1475)) )
))
(declare-datatypes ((List!668 0))(
  ( (Nil!665) (Cons!664 (h!1231 tuple2!1084) (t!3354 List!668)) )
))
(declare-datatypes ((ListLongMap!649 0))(
  ( (ListLongMap!650 (toList!340 List!668)) )
))
(declare-fun lt!10882 () ListLongMap!649)

(declare-fun contains!281 (ListLongMap!649 (_ BitVec 64)) Bool)

(assert (=> b!28604 (= res!17068 (not (contains!281 lt!10882 k0!1304)))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1475)

(declare-fun minValue!1443 () V!1475)

(declare-fun getCurrentListMap!169 (array!1689 array!1687 (_ BitVec 32) (_ BitVec 32) V!1475 V!1475 (_ BitVec 32) Int) ListLongMap!649)

(assert (=> b!28604 (= lt!10882 (getCurrentListMap!169 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!28605 () Bool)

(declare-fun e!18486 () Bool)

(declare-fun mapRes!1384 () Bool)

(assert (=> b!28605 (= e!18490 (and e!18486 mapRes!1384))))

(declare-fun condMapEmpty!1384 () Bool)

(declare-fun mapDefault!1384 () ValueCell!419)

(assert (=> b!28605 (= condMapEmpty!1384 (= (arr!797 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!419)) mapDefault!1384)))))

(declare-fun mapIsEmpty!1384 () Bool)

(assert (=> mapIsEmpty!1384 mapRes!1384))

(declare-fun b!28606 () Bool)

(declare-fun e!18484 () Bool)

(assert (=> b!28606 (= e!18487 (not e!18484))))

(declare-fun res!17069 () Bool)

(assert (=> b!28606 (=> res!17069 e!18484)))

(assert (=> b!28606 (= res!17069 (not (= (size!899 _keys!1833) (bvadd #b00000000000000000000000000000001 mask!2294))))))

(declare-fun lt!10883 () (_ BitVec 32))

(assert (=> b!28606 (contains!281 lt!10882 (select (arr!798 _keys!1833) lt!10883))))

(declare-datatypes ((Unit!654 0))(
  ( (Unit!655) )
))
(declare-fun lt!10884 () Unit!654)

(declare-fun lemmaValidKeyInArrayIsInListMap!17 (array!1689 array!1687 (_ BitVec 32) (_ BitVec 32) V!1475 V!1475 (_ BitVec 32) Int) Unit!654)

(assert (=> b!28606 (= lt!10884 (lemmaValidKeyInArrayIsInListMap!17 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!10883 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!1689 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!28606 (= lt!10883 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!28607 () Bool)

(declare-fun res!17073 () Bool)

(assert (=> b!28607 (=> (not res!17073) (not e!18488))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1689 (_ BitVec 32)) Bool)

(assert (=> b!28607 (= res!17073 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!28608 () Bool)

(assert (=> b!28608 (= e!18484 true)))

(declare-datatypes ((SeekEntryResult!73 0))(
  ( (MissingZero!73 (index!2414 (_ BitVec 32))) (Found!73 (index!2415 (_ BitVec 32))) (Intermediate!73 (undefined!885 Bool) (index!2416 (_ BitVec 32)) (x!6343 (_ BitVec 32))) (Undefined!73) (MissingVacant!73 (index!2417 (_ BitVec 32))) )
))
(declare-fun lt!10885 () SeekEntryResult!73)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!1689 (_ BitVec 32)) SeekEntryResult!73)

(assert (=> b!28608 (= lt!10885 (seekEntryOrOpen!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun mapNonEmpty!1384 () Bool)

(declare-fun tp!4068 () Bool)

(assert (=> mapNonEmpty!1384 (= mapRes!1384 (and tp!4068 e!18485))))

(declare-fun mapKey!1384 () (_ BitVec 32))

(declare-fun mapRest!1384 () (Array (_ BitVec 32) ValueCell!419))

(declare-fun mapValue!1384 () ValueCell!419)

(assert (=> mapNonEmpty!1384 (= (arr!797 _values!1501) (store mapRest!1384 mapKey!1384 mapValue!1384))))

(declare-fun b!28609 () Bool)

(declare-fun res!17074 () Bool)

(assert (=> b!28609 (=> (not res!17074) (not e!18488))))

(declare-datatypes ((List!669 0))(
  ( (Nil!666) (Cons!665 (h!1232 (_ BitVec 64)) (t!3355 List!669)) )
))
(declare-fun arrayNoDuplicates!0 (array!1689 (_ BitVec 32) List!669) Bool)

(assert (=> b!28609 (= res!17074 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!666))))

(declare-fun b!28610 () Bool)

(assert (=> b!28610 (= e!18486 tp_is_empty!1237)))

(declare-fun b!28611 () Bool)

(declare-fun res!17072 () Bool)

(assert (=> b!28611 (=> (not res!17072) (not e!18488))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!28611 (= res!17072 (validKeyInArray!0 k0!1304))))

(assert (= (and start!3968 res!17067) b!28601))

(assert (= (and b!28601 res!17071) b!28607))

(assert (= (and b!28607 res!17073) b!28609))

(assert (= (and b!28609 res!17074) b!28611))

(assert (= (and b!28611 res!17072) b!28604))

(assert (= (and b!28604 res!17068) b!28603))

(assert (= (and b!28603 res!17070) b!28606))

(assert (= (and b!28606 (not res!17069)) b!28608))

(assert (= (and b!28605 condMapEmpty!1384) mapIsEmpty!1384))

(assert (= (and b!28605 (not condMapEmpty!1384)) mapNonEmpty!1384))

(get-info :version)

(assert (= (and mapNonEmpty!1384 ((_ is ValueCellFull!419) mapValue!1384)) b!28602))

(assert (= (and b!28605 ((_ is ValueCellFull!419) mapDefault!1384)) b!28610))

(assert (= start!3968 b!28605))

(declare-fun m!22767 () Bool)

(assert (=> b!28603 m!22767))

(declare-fun m!22769 () Bool)

(assert (=> b!28607 m!22769))

(declare-fun m!22771 () Bool)

(assert (=> b!28606 m!22771))

(assert (=> b!28606 m!22771))

(declare-fun m!22773 () Bool)

(assert (=> b!28606 m!22773))

(declare-fun m!22775 () Bool)

(assert (=> b!28606 m!22775))

(declare-fun m!22777 () Bool)

(assert (=> b!28606 m!22777))

(declare-fun m!22779 () Bool)

(assert (=> b!28608 m!22779))

(declare-fun m!22781 () Bool)

(assert (=> b!28609 m!22781))

(declare-fun m!22783 () Bool)

(assert (=> mapNonEmpty!1384 m!22783))

(declare-fun m!22785 () Bool)

(assert (=> start!3968 m!22785))

(declare-fun m!22787 () Bool)

(assert (=> start!3968 m!22787))

(declare-fun m!22789 () Bool)

(assert (=> start!3968 m!22789))

(declare-fun m!22791 () Bool)

(assert (=> b!28604 m!22791))

(declare-fun m!22793 () Bool)

(assert (=> b!28604 m!22793))

(declare-fun m!22795 () Bool)

(assert (=> b!28611 m!22795))

(check-sat b_and!1687 (not b_next!883) (not b!28609) tp_is_empty!1237 (not b!28608) (not b!28606) (not b!28604) (not b!28603) (not mapNonEmpty!1384) (not b!28611) (not start!3968) (not b!28607))
(check-sat b_and!1687 (not b_next!883))
