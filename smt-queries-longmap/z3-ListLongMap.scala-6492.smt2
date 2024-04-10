; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82794 () Bool)

(assert start!82794)

(declare-fun b_free!18921 () Bool)

(declare-fun b_next!18921 () Bool)

(assert (=> start!82794 (= b_free!18921 (not b_next!18921))))

(declare-fun tp!65891 () Bool)

(declare-fun b_and!30409 () Bool)

(assert (=> start!82794 (= tp!65891 b_and!30409)))

(declare-fun b!965750 () Bool)

(declare-fun res!646445 () Bool)

(declare-fun e!544417 () Bool)

(assert (=> b!965750 (=> (not res!646445) (not e!544417))))

(declare-datatypes ((array!59543 0))(
  ( (array!59544 (arr!28640 (Array (_ BitVec 32) (_ BitVec 64))) (size!29119 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59543)

(declare-datatypes ((List!19879 0))(
  ( (Nil!19876) (Cons!19875 (h!21037 (_ BitVec 64)) (t!28242 List!19879)) )
))
(declare-fun arrayNoDuplicates!0 (array!59543 (_ BitVec 32) List!19879) Bool)

(assert (=> b!965750 (= res!646445 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19876))))

(declare-fun b!965751 () Bool)

(declare-fun res!646442 () Bool)

(assert (=> b!965751 (=> (not res!646442) (not e!544417))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33955 0))(
  ( (V!33956 (val!10915 Int)) )
))
(declare-datatypes ((ValueCell!10383 0))(
  ( (ValueCellFull!10383 (v!13473 V!33955)) (EmptyCell!10383) )
))
(declare-datatypes ((array!59545 0))(
  ( (array!59546 (arr!28641 (Array (_ BitVec 32) ValueCell!10383)) (size!29120 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59545)

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!965751 (= res!646442 (and (= (size!29120 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29119 _keys!1686) (size!29120 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!34588 () Bool)

(declare-fun mapRes!34588 () Bool)

(assert (=> mapIsEmpty!34588 mapRes!34588))

(declare-fun b!965752 () Bool)

(declare-fun e!544421 () Bool)

(declare-fun tp_is_empty!21729 () Bool)

(assert (=> b!965752 (= e!544421 tp_is_empty!21729)))

(declare-fun b!965753 () Bool)

(declare-fun res!646447 () Bool)

(assert (=> b!965753 (=> (not res!646447) (not e!544417))))

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!965753 (= res!646447 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29119 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29119 _keys!1686))))))

(declare-fun b!965754 () Bool)

(declare-fun res!646444 () Bool)

(assert (=> b!965754 (=> (not res!646444) (not e!544417))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59543 (_ BitVec 32)) Bool)

(assert (=> b!965754 (= res!646444 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun res!646443 () Bool)

(assert (=> start!82794 (=> (not res!646443) (not e!544417))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82794 (= res!646443 (validMask!0 mask!2110))))

(assert (=> start!82794 e!544417))

(assert (=> start!82794 true))

(declare-fun e!544418 () Bool)

(declare-fun array_inv!22179 (array!59545) Bool)

(assert (=> start!82794 (and (array_inv!22179 _values!1400) e!544418)))

(declare-fun array_inv!22180 (array!59543) Bool)

(assert (=> start!82794 (array_inv!22180 _keys!1686)))

(assert (=> start!82794 tp!65891))

(assert (=> start!82794 tp_is_empty!21729))

(declare-fun mapNonEmpty!34588 () Bool)

(declare-fun tp!65892 () Bool)

(assert (=> mapNonEmpty!34588 (= mapRes!34588 (and tp!65892 e!544421))))

(declare-fun mapRest!34588 () (Array (_ BitVec 32) ValueCell!10383))

(declare-fun mapKey!34588 () (_ BitVec 32))

(declare-fun mapValue!34588 () ValueCell!10383)

(assert (=> mapNonEmpty!34588 (= (arr!28641 _values!1400) (store mapRest!34588 mapKey!34588 mapValue!34588))))

(declare-fun b!965755 () Bool)

(declare-fun res!646446 () Bool)

(assert (=> b!965755 (=> (not res!646446) (not e!544417))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!965755 (= res!646446 (validKeyInArray!0 (select (arr!28640 _keys!1686) i!803)))))

(declare-fun b!965756 () Bool)

(assert (=> b!965756 (= e!544417 (bvslt i!803 #b00000000000000000000000000000000))))

(declare-datatypes ((tuple2!14036 0))(
  ( (tuple2!14037 (_1!7029 (_ BitVec 64)) (_2!7029 V!33955)) )
))
(declare-datatypes ((List!19880 0))(
  ( (Nil!19877) (Cons!19876 (h!21038 tuple2!14036) (t!28243 List!19880)) )
))
(declare-datatypes ((ListLongMap!12733 0))(
  ( (ListLongMap!12734 (toList!6382 List!19880)) )
))
(declare-fun lt!431257 () ListLongMap!12733)

(declare-fun minValue!1342 () V!33955)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33955)

(declare-fun getCurrentListMap!3615 (array!59543 array!59545 (_ BitVec 32) (_ BitVec 32) V!33955 V!33955 (_ BitVec 32) Int) ListLongMap!12733)

(assert (=> b!965756 (= lt!431257 (getCurrentListMap!3615 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403))))

(declare-fun b!965757 () Bool)

(declare-fun e!544420 () Bool)

(assert (=> b!965757 (= e!544420 tp_is_empty!21729)))

(declare-fun b!965758 () Bool)

(assert (=> b!965758 (= e!544418 (and e!544420 mapRes!34588))))

(declare-fun condMapEmpty!34588 () Bool)

(declare-fun mapDefault!34588 () ValueCell!10383)

(assert (=> b!965758 (= condMapEmpty!34588 (= (arr!28641 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10383)) mapDefault!34588)))))

(assert (= (and start!82794 res!646443) b!965751))

(assert (= (and b!965751 res!646442) b!965754))

(assert (= (and b!965754 res!646444) b!965750))

(assert (= (and b!965750 res!646445) b!965753))

(assert (= (and b!965753 res!646447) b!965755))

(assert (= (and b!965755 res!646446) b!965756))

(assert (= (and b!965758 condMapEmpty!34588) mapIsEmpty!34588))

(assert (= (and b!965758 (not condMapEmpty!34588)) mapNonEmpty!34588))

(get-info :version)

(assert (= (and mapNonEmpty!34588 ((_ is ValueCellFull!10383) mapValue!34588)) b!965752))

(assert (= (and b!965758 ((_ is ValueCellFull!10383) mapDefault!34588)) b!965757))

(assert (= start!82794 b!965758))

(declare-fun m!894723 () Bool)

(assert (=> b!965756 m!894723))

(declare-fun m!894725 () Bool)

(assert (=> start!82794 m!894725))

(declare-fun m!894727 () Bool)

(assert (=> start!82794 m!894727))

(declare-fun m!894729 () Bool)

(assert (=> start!82794 m!894729))

(declare-fun m!894731 () Bool)

(assert (=> b!965750 m!894731))

(declare-fun m!894733 () Bool)

(assert (=> b!965754 m!894733))

(declare-fun m!894735 () Bool)

(assert (=> mapNonEmpty!34588 m!894735))

(declare-fun m!894737 () Bool)

(assert (=> b!965755 m!894737))

(assert (=> b!965755 m!894737))

(declare-fun m!894739 () Bool)

(assert (=> b!965755 m!894739))

(check-sat (not mapNonEmpty!34588) (not start!82794) (not b_next!18921) tp_is_empty!21729 (not b!965750) (not b!965755) (not b!965756) (not b!965754) b_and!30409)
(check-sat b_and!30409 (not b_next!18921))
