; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3980 () Bool)

(assert start!3980)

(declare-fun b_free!889 () Bool)

(declare-fun b_next!889 () Bool)

(assert (=> start!3980 (= b_free!889 (not b_next!889))))

(declare-fun tp!4087 () Bool)

(declare-fun b_and!1689 () Bool)

(assert (=> start!3980 (= tp!4087 b_and!1689)))

(declare-fun b!28682 () Bool)

(declare-fun e!18544 () Bool)

(declare-fun e!18538 () Bool)

(assert (=> b!28682 (= e!18544 e!18538)))

(declare-fun res!17132 () Bool)

(assert (=> b!28682 (=> (not res!17132) (not e!18538))))

(declare-datatypes ((V!1483 0))(
  ( (V!1484 (val!648 Int)) )
))
(declare-datatypes ((tuple2!1072 0))(
  ( (tuple2!1073 (_1!547 (_ BitVec 64)) (_2!547 V!1483)) )
))
(declare-datatypes ((List!663 0))(
  ( (Nil!660) (Cons!659 (h!1226 tuple2!1072) (t!3350 List!663)) )
))
(declare-datatypes ((ListLongMap!643 0))(
  ( (ListLongMap!644 (toList!337 List!663)) )
))
(declare-fun lt!10878 () ListLongMap!643)

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun contains!279 (ListLongMap!643 (_ BitVec 64)) Bool)

(assert (=> b!28682 (= res!17132 (not (contains!279 lt!10878 k0!1304)))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!1701 0))(
  ( (array!1702 (arr!804 (Array (_ BitVec 32) (_ BitVec 64))) (size!905 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1701)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-datatypes ((ValueCell!422 0))(
  ( (ValueCellFull!422 (v!1737 V!1483)) (EmptyCell!422) )
))
(declare-datatypes ((array!1703 0))(
  ( (array!1704 (arr!805 (Array (_ BitVec 32) ValueCell!422)) (size!906 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1703)

(declare-fun zeroValue!1443 () V!1483)

(declare-fun minValue!1443 () V!1483)

(declare-fun getCurrentListMap!163 (array!1701 array!1703 (_ BitVec 32) (_ BitVec 32) V!1483 V!1483 (_ BitVec 32) Int) ListLongMap!643)

(assert (=> b!28682 (= lt!10878 (getCurrentListMap!163 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun res!17131 () Bool)

(assert (=> start!3980 (=> (not res!17131) (not e!18544))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3980 (= res!17131 (validMask!0 mask!2294))))

(assert (=> start!3980 e!18544))

(assert (=> start!3980 true))

(assert (=> start!3980 tp!4087))

(declare-fun e!18539 () Bool)

(declare-fun array_inv!555 (array!1703) Bool)

(assert (=> start!3980 (and (array_inv!555 _values!1501) e!18539)))

(declare-fun array_inv!556 (array!1701) Bool)

(assert (=> start!3980 (array_inv!556 _keys!1833)))

(declare-fun tp_is_empty!1243 () Bool)

(assert (=> start!3980 tp_is_empty!1243))

(declare-fun b!28683 () Bool)

(declare-fun res!17133 () Bool)

(assert (=> b!28683 (=> (not res!17133) (not e!18544))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1701 (_ BitVec 32)) Bool)

(assert (=> b!28683 (= res!17133 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!28684 () Bool)

(declare-fun e!18542 () Bool)

(assert (=> b!28684 (= e!18542 tp_is_empty!1243)))

(declare-fun b!28685 () Bool)

(declare-fun res!17134 () Bool)

(assert (=> b!28685 (=> (not res!17134) (not e!18544))))

(declare-datatypes ((List!664 0))(
  ( (Nil!661) (Cons!660 (h!1227 (_ BitVec 64)) (t!3351 List!664)) )
))
(declare-fun arrayNoDuplicates!0 (array!1701 (_ BitVec 32) List!664) Bool)

(assert (=> b!28685 (= res!17134 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!661))))

(declare-fun mapIsEmpty!1393 () Bool)

(declare-fun mapRes!1393 () Bool)

(assert (=> mapIsEmpty!1393 mapRes!1393))

(declare-fun b!28686 () Bool)

(declare-fun res!17136 () Bool)

(assert (=> b!28686 (=> (not res!17136) (not e!18544))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!28686 (= res!17136 (validKeyInArray!0 k0!1304))))

(declare-fun b!28687 () Bool)

(declare-fun e!18543 () Bool)

(assert (=> b!28687 (= e!18539 (and e!18543 mapRes!1393))))

(declare-fun condMapEmpty!1393 () Bool)

(declare-fun mapDefault!1393 () ValueCell!422)

(assert (=> b!28687 (= condMapEmpty!1393 (= (arr!805 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!422)) mapDefault!1393)))))

(declare-fun b!28688 () Bool)

(declare-fun res!17137 () Bool)

(assert (=> b!28688 (=> (not res!17137) (not e!18544))))

(assert (=> b!28688 (= res!17137 (and (= (size!906 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!905 _keys!1833) (size!906 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!28689 () Bool)

(declare-fun e!18540 () Bool)

(assert (=> b!28689 (= e!18540 true)))

(declare-datatypes ((SeekEntryResult!73 0))(
  ( (MissingZero!73 (index!2414 (_ BitVec 32))) (Found!73 (index!2415 (_ BitVec 32))) (Intermediate!73 (undefined!885 Bool) (index!2416 (_ BitVec 32)) (x!6351 (_ BitVec 32))) (Undefined!73) (MissingVacant!73 (index!2417 (_ BitVec 32))) )
))
(declare-fun lt!10879 () SeekEntryResult!73)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!1701 (_ BitVec 32)) SeekEntryResult!73)

(assert (=> b!28689 (= lt!10879 (seekEntryOrOpen!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun b!28690 () Bool)

(declare-fun res!17135 () Bool)

(assert (=> b!28690 (=> (not res!17135) (not e!18538))))

(declare-fun arrayContainsKey!0 (array!1701 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!28690 (= res!17135 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!1393 () Bool)

(declare-fun tp!4086 () Bool)

(assert (=> mapNonEmpty!1393 (= mapRes!1393 (and tp!4086 e!18542))))

(declare-fun mapKey!1393 () (_ BitVec 32))

(declare-fun mapRest!1393 () (Array (_ BitVec 32) ValueCell!422))

(declare-fun mapValue!1393 () ValueCell!422)

(assert (=> mapNonEmpty!1393 (= (arr!805 _values!1501) (store mapRest!1393 mapKey!1393 mapValue!1393))))

(declare-fun b!28691 () Bool)

(assert (=> b!28691 (= e!18543 tp_is_empty!1243)))

(declare-fun b!28692 () Bool)

(assert (=> b!28692 (= e!18538 (not e!18540))))

(declare-fun res!17138 () Bool)

(assert (=> b!28692 (=> res!17138 e!18540)))

(assert (=> b!28692 (= res!17138 (not (= (size!905 _keys!1833) (bvadd #b00000000000000000000000000000001 mask!2294))))))

(declare-fun lt!10881 () (_ BitVec 32))

(assert (=> b!28692 (contains!279 lt!10878 (select (arr!804 _keys!1833) lt!10881))))

(declare-datatypes ((Unit!667 0))(
  ( (Unit!668) )
))
(declare-fun lt!10880 () Unit!667)

(declare-fun lemmaValidKeyInArrayIsInListMap!23 (array!1701 array!1703 (_ BitVec 32) (_ BitVec 32) V!1483 V!1483 (_ BitVec 32) Int) Unit!667)

(assert (=> b!28692 (= lt!10880 (lemmaValidKeyInArrayIsInListMap!23 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!10881 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!1701 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!28692 (= lt!10881 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(assert (= (and start!3980 res!17131) b!28688))

(assert (= (and b!28688 res!17137) b!28683))

(assert (= (and b!28683 res!17133) b!28685))

(assert (= (and b!28685 res!17134) b!28686))

(assert (= (and b!28686 res!17136) b!28682))

(assert (= (and b!28682 res!17132) b!28690))

(assert (= (and b!28690 res!17135) b!28692))

(assert (= (and b!28692 (not res!17138)) b!28689))

(assert (= (and b!28687 condMapEmpty!1393) mapIsEmpty!1393))

(assert (= (and b!28687 (not condMapEmpty!1393)) mapNonEmpty!1393))

(get-info :version)

(assert (= (and mapNonEmpty!1393 ((_ is ValueCellFull!422) mapValue!1393)) b!28684))

(assert (= (and b!28687 ((_ is ValueCellFull!422) mapDefault!1393)) b!28691))

(assert (= start!3980 b!28687))

(declare-fun m!22775 () Bool)

(assert (=> b!28690 m!22775))

(declare-fun m!22777 () Bool)

(assert (=> b!28685 m!22777))

(declare-fun m!22779 () Bool)

(assert (=> b!28683 m!22779))

(declare-fun m!22781 () Bool)

(assert (=> b!28682 m!22781))

(declare-fun m!22783 () Bool)

(assert (=> b!28682 m!22783))

(declare-fun m!22785 () Bool)

(assert (=> mapNonEmpty!1393 m!22785))

(declare-fun m!22787 () Bool)

(assert (=> b!28689 m!22787))

(declare-fun m!22789 () Bool)

(assert (=> start!3980 m!22789))

(declare-fun m!22791 () Bool)

(assert (=> start!3980 m!22791))

(declare-fun m!22793 () Bool)

(assert (=> start!3980 m!22793))

(declare-fun m!22795 () Bool)

(assert (=> b!28692 m!22795))

(assert (=> b!28692 m!22795))

(declare-fun m!22797 () Bool)

(assert (=> b!28692 m!22797))

(declare-fun m!22799 () Bool)

(assert (=> b!28692 m!22799))

(declare-fun m!22801 () Bool)

(assert (=> b!28692 m!22801))

(declare-fun m!22803 () Bool)

(assert (=> b!28686 m!22803))

(check-sat (not b!28692) (not b!28686) (not b!28689) b_and!1689 (not b_next!889) (not b!28685) (not b!28690) (not mapNonEmpty!1393) (not b!28682) tp_is_empty!1243 (not start!3980) (not b!28683))
(check-sat b_and!1689 (not b_next!889))
