; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4448 () Bool)

(assert start!4448)

(declare-fun b_free!1213 () Bool)

(declare-fun b_next!1213 () Bool)

(assert (=> start!4448 (= b_free!1213 (not b_next!1213))))

(declare-fun tp!5077 () Bool)

(declare-fun b_and!2025 () Bool)

(assert (=> start!4448 (= tp!5077 b_and!2025)))

(declare-fun b!34339 () Bool)

(declare-fun res!20833 () Bool)

(declare-fun e!21782 () Bool)

(assert (=> b!34339 (=> (not res!20833) (not e!21782))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!34339 (= res!20833 (validKeyInArray!0 k0!1304))))

(declare-fun b!34340 () Bool)

(declare-fun res!20834 () Bool)

(assert (=> b!34340 (=> (not res!20834) (not e!21782))))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((V!1915 0))(
  ( (V!1916 (val!810 Int)) )
))
(declare-datatypes ((ValueCell!584 0))(
  ( (ValueCellFull!584 (v!1905 V!1915)) (EmptyCell!584) )
))
(declare-datatypes ((array!2335 0))(
  ( (array!2336 (arr!1115 (Array (_ BitVec 32) ValueCell!584)) (size!1216 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2335)

(declare-datatypes ((array!2337 0))(
  ( (array!2338 (arr!1116 (Array (_ BitVec 32) (_ BitVec 64))) (size!1217 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2337)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1915)

(declare-fun minValue!1443 () V!1915)

(declare-datatypes ((tuple2!1296 0))(
  ( (tuple2!1297 (_1!659 (_ BitVec 64)) (_2!659 V!1915)) )
))
(declare-datatypes ((List!888 0))(
  ( (Nil!885) (Cons!884 (h!1451 tuple2!1296) (t!3587 List!888)) )
))
(declare-datatypes ((ListLongMap!867 0))(
  ( (ListLongMap!868 (toList!449 List!888)) )
))
(declare-fun contains!397 (ListLongMap!867 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!270 (array!2337 array!2335 (_ BitVec 32) (_ BitVec 32) V!1915 V!1915 (_ BitVec 32) Int) ListLongMap!867)

(assert (=> b!34340 (= res!20834 (not (contains!397 (getCurrentListMap!270 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!34341 () Bool)

(declare-fun res!20831 () Bool)

(assert (=> b!34341 (=> (not res!20831) (not e!21782))))

(declare-fun arrayContainsKey!0 (array!2337 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!34341 (= res!20831 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun b!34342 () Bool)

(declare-fun e!21779 () Bool)

(declare-fun tp_is_empty!1567 () Bool)

(assert (=> b!34342 (= e!21779 tp_is_empty!1567)))

(declare-fun b!34343 () Bool)

(declare-fun res!20832 () Bool)

(assert (=> b!34343 (=> (not res!20832) (not e!21782))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2337 (_ BitVec 32)) Bool)

(assert (=> b!34343 (= res!20832 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun mapNonEmpty!1897 () Bool)

(declare-fun mapRes!1897 () Bool)

(declare-fun tp!5076 () Bool)

(declare-fun e!21780 () Bool)

(assert (=> mapNonEmpty!1897 (= mapRes!1897 (and tp!5076 e!21780))))

(declare-fun mapValue!1897 () ValueCell!584)

(declare-fun mapRest!1897 () (Array (_ BitVec 32) ValueCell!584))

(declare-fun mapKey!1897 () (_ BitVec 32))

(assert (=> mapNonEmpty!1897 (= (arr!1115 _values!1501) (store mapRest!1897 mapKey!1897 mapValue!1897))))

(declare-fun b!34344 () Bool)

(assert (=> b!34344 (= e!21780 tp_is_empty!1567)))

(declare-fun res!20828 () Bool)

(assert (=> start!4448 (=> (not res!20828) (not e!21782))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4448 (= res!20828 (validMask!0 mask!2294))))

(assert (=> start!4448 e!21782))

(assert (=> start!4448 true))

(assert (=> start!4448 tp!5077))

(declare-fun e!21781 () Bool)

(declare-fun array_inv!763 (array!2335) Bool)

(assert (=> start!4448 (and (array_inv!763 _values!1501) e!21781)))

(declare-fun array_inv!764 (array!2337) Bool)

(assert (=> start!4448 (array_inv!764 _keys!1833)))

(assert (=> start!4448 tp_is_empty!1567))

(declare-fun mapIsEmpty!1897 () Bool)

(assert (=> mapIsEmpty!1897 mapRes!1897))

(declare-fun b!34345 () Bool)

(declare-fun res!20829 () Bool)

(assert (=> b!34345 (=> (not res!20829) (not e!21782))))

(declare-datatypes ((List!889 0))(
  ( (Nil!886) (Cons!885 (h!1452 (_ BitVec 64)) (t!3588 List!889)) )
))
(declare-fun arrayNoDuplicates!0 (array!2337 (_ BitVec 32) List!889) Bool)

(assert (=> b!34345 (= res!20829 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!886))))

(declare-fun b!34346 () Bool)

(assert (=> b!34346 (= e!21781 (and e!21779 mapRes!1897))))

(declare-fun condMapEmpty!1897 () Bool)

(declare-fun mapDefault!1897 () ValueCell!584)

(assert (=> b!34346 (= condMapEmpty!1897 (= (arr!1115 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!584)) mapDefault!1897)))))

(declare-fun b!34347 () Bool)

(assert (=> b!34347 (= e!21782 false)))

(declare-datatypes ((SeekEntryResult!135 0))(
  ( (MissingZero!135 (index!2662 (_ BitVec 32))) (Found!135 (index!2663 (_ BitVec 32))) (Intermediate!135 (undefined!947 Bool) (index!2664 (_ BitVec 32)) (x!6905 (_ BitVec 32))) (Undefined!135) (MissingVacant!135 (index!2665 (_ BitVec 32))) )
))
(declare-fun lt!12733 () SeekEntryResult!135)

(declare-fun seekEntry!0 ((_ BitVec 64) array!2337 (_ BitVec 32)) SeekEntryResult!135)

(assert (=> b!34347 (= lt!12733 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun b!34348 () Bool)

(declare-fun res!20830 () Bool)

(assert (=> b!34348 (=> (not res!20830) (not e!21782))))

(assert (=> b!34348 (= res!20830 (and (= (size!1216 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1217 _keys!1833) (size!1216 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(assert (= (and start!4448 res!20828) b!34348))

(assert (= (and b!34348 res!20830) b!34343))

(assert (= (and b!34343 res!20832) b!34345))

(assert (= (and b!34345 res!20829) b!34339))

(assert (= (and b!34339 res!20833) b!34340))

(assert (= (and b!34340 res!20834) b!34341))

(assert (= (and b!34341 res!20831) b!34347))

(assert (= (and b!34346 condMapEmpty!1897) mapIsEmpty!1897))

(assert (= (and b!34346 (not condMapEmpty!1897)) mapNonEmpty!1897))

(get-info :version)

(assert (= (and mapNonEmpty!1897 ((_ is ValueCellFull!584) mapValue!1897)) b!34344))

(assert (= (and b!34346 ((_ is ValueCellFull!584) mapDefault!1897)) b!34342))

(assert (= start!4448 b!34346))

(declare-fun m!27595 () Bool)

(assert (=> b!34340 m!27595))

(assert (=> b!34340 m!27595))

(declare-fun m!27597 () Bool)

(assert (=> b!34340 m!27597))

(declare-fun m!27599 () Bool)

(assert (=> b!34339 m!27599))

(declare-fun m!27601 () Bool)

(assert (=> b!34347 m!27601))

(declare-fun m!27603 () Bool)

(assert (=> start!4448 m!27603))

(declare-fun m!27605 () Bool)

(assert (=> start!4448 m!27605))

(declare-fun m!27607 () Bool)

(assert (=> start!4448 m!27607))

(declare-fun m!27609 () Bool)

(assert (=> b!34345 m!27609))

(declare-fun m!27611 () Bool)

(assert (=> b!34341 m!27611))

(declare-fun m!27613 () Bool)

(assert (=> mapNonEmpty!1897 m!27613))

(declare-fun m!27615 () Bool)

(assert (=> b!34343 m!27615))

(check-sat (not b!34347) (not mapNonEmpty!1897) (not b!34340) (not start!4448) tp_is_empty!1567 (not b_next!1213) (not b!34345) (not b!34343) (not b!34341) (not b!34339) b_and!2025)
(check-sat b_and!2025 (not b_next!1213))
