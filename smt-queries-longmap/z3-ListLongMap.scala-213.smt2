; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3962 () Bool)

(assert start!3962)

(declare-fun b_free!867 () Bool)

(declare-fun b_next!867 () Bool)

(assert (=> start!3962 (= b_free!867 (not b_next!867))))

(declare-fun tp!4020 () Bool)

(declare-fun b_and!1677 () Bool)

(assert (=> start!3962 (= tp!4020 b_and!1677)))

(declare-fun b!28391 () Bool)

(declare-fun e!18362 () Bool)

(assert (=> b!28391 (= e!18362 true)))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!65 0))(
  ( (MissingZero!65 (index!2382 (_ BitVec 32))) (Found!65 (index!2383 (_ BitVec 32))) (Intermediate!65 (undefined!877 Bool) (index!2384 (_ BitVec 32)) (x!6311 (_ BitVec 32))) (Undefined!65) (MissingVacant!65 (index!2385 (_ BitVec 32))) )
))
(declare-fun lt!10790 () SeekEntryResult!65)

(declare-datatypes ((array!1679 0))(
  ( (array!1680 (arr!793 (Array (_ BitVec 32) (_ BitVec 64))) (size!894 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1679)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!1679 (_ BitVec 32)) SeekEntryResult!65)

(assert (=> b!28391 (= lt!10790 (seekEntryOrOpen!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun res!16911 () Bool)

(declare-fun e!18363 () Bool)

(assert (=> start!3962 (=> (not res!16911) (not e!18363))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3962 (= res!16911 (validMask!0 mask!2294))))

(assert (=> start!3962 e!18363))

(assert (=> start!3962 true))

(assert (=> start!3962 tp!4020))

(declare-datatypes ((V!1453 0))(
  ( (V!1454 (val!637 Int)) )
))
(declare-datatypes ((ValueCell!411 0))(
  ( (ValueCellFull!411 (v!1726 V!1453)) (EmptyCell!411) )
))
(declare-datatypes ((array!1681 0))(
  ( (array!1682 (arr!794 (Array (_ BitVec 32) ValueCell!411)) (size!895 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1681)

(declare-fun e!18361 () Bool)

(declare-fun array_inv!543 (array!1681) Bool)

(assert (=> start!3962 (and (array_inv!543 _values!1501) e!18361)))

(declare-fun array_inv!544 (array!1679) Bool)

(assert (=> start!3962 (array_inv!544 _keys!1833)))

(declare-fun tp_is_empty!1221 () Bool)

(assert (=> start!3962 tp_is_empty!1221))

(declare-fun mapIsEmpty!1360 () Bool)

(declare-fun mapRes!1360 () Bool)

(assert (=> mapIsEmpty!1360 mapRes!1360))

(declare-fun b!28392 () Bool)

(declare-fun e!18365 () Bool)

(assert (=> b!28392 (= e!18365 tp_is_empty!1221)))

(declare-fun mapNonEmpty!1360 () Bool)

(declare-fun tp!4021 () Bool)

(declare-fun e!18360 () Bool)

(assert (=> mapNonEmpty!1360 (= mapRes!1360 (and tp!4021 e!18360))))

(declare-fun mapRest!1360 () (Array (_ BitVec 32) ValueCell!411))

(declare-fun mapKey!1360 () (_ BitVec 32))

(declare-fun mapValue!1360 () ValueCell!411)

(assert (=> mapNonEmpty!1360 (= (arr!794 _values!1501) (store mapRest!1360 mapKey!1360 mapValue!1360))))

(declare-fun b!28393 () Bool)

(declare-fun res!16907 () Bool)

(assert (=> b!28393 (=> (not res!16907) (not e!18363))))

(declare-datatypes ((List!660 0))(
  ( (Nil!657) (Cons!656 (h!1223 (_ BitVec 64)) (t!3353 List!660)) )
))
(declare-fun arrayNoDuplicates!0 (array!1679 (_ BitVec 32) List!660) Bool)

(assert (=> b!28393 (= res!16907 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!657))))

(declare-fun b!28394 () Bool)

(declare-fun e!18359 () Bool)

(assert (=> b!28394 (= e!18363 e!18359)))

(declare-fun res!16912 () Bool)

(assert (=> b!28394 (=> (not res!16912) (not e!18359))))

(declare-datatypes ((tuple2!1060 0))(
  ( (tuple2!1061 (_1!541 (_ BitVec 64)) (_2!541 V!1453)) )
))
(declare-datatypes ((List!661 0))(
  ( (Nil!658) (Cons!657 (h!1224 tuple2!1060) (t!3354 List!661)) )
))
(declare-datatypes ((ListLongMap!637 0))(
  ( (ListLongMap!638 (toList!334 List!661)) )
))
(declare-fun lt!10793 () ListLongMap!637)

(declare-fun contains!274 (ListLongMap!637 (_ BitVec 64)) Bool)

(assert (=> b!28394 (= res!16912 (not (contains!274 lt!10793 k0!1304)))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1453)

(declare-fun minValue!1443 () V!1453)

(declare-fun getCurrentListMap!164 (array!1679 array!1681 (_ BitVec 32) (_ BitVec 32) V!1453 V!1453 (_ BitVec 32) Int) ListLongMap!637)

(assert (=> b!28394 (= lt!10793 (getCurrentListMap!164 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!28395 () Bool)

(assert (=> b!28395 (= e!18359 (not e!18362))))

(declare-fun res!16909 () Bool)

(assert (=> b!28395 (=> res!16909 e!18362)))

(assert (=> b!28395 (= res!16909 (not (= (size!894 _keys!1833) (bvadd #b00000000000000000000000000000001 mask!2294))))))

(declare-fun lt!10792 () (_ BitVec 32))

(assert (=> b!28395 (contains!274 lt!10793 (select (arr!793 _keys!1833) lt!10792))))

(declare-datatypes ((Unit!639 0))(
  ( (Unit!640) )
))
(declare-fun lt!10791 () Unit!639)

(declare-fun lemmaValidKeyInArrayIsInListMap!13 (array!1679 array!1681 (_ BitVec 32) (_ BitVec 32) V!1453 V!1453 (_ BitVec 32) Int) Unit!639)

(assert (=> b!28395 (= lt!10791 (lemmaValidKeyInArrayIsInListMap!13 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!10792 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!1679 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!28395 (= lt!10792 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!28396 () Bool)

(declare-fun res!16908 () Bool)

(assert (=> b!28396 (=> (not res!16908) (not e!18363))))

(assert (=> b!28396 (= res!16908 (and (= (size!895 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!894 _keys!1833) (size!895 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!28397 () Bool)

(declare-fun res!16914 () Bool)

(assert (=> b!28397 (=> (not res!16914) (not e!18363))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!28397 (= res!16914 (validKeyInArray!0 k0!1304))))

(declare-fun b!28398 () Bool)

(assert (=> b!28398 (= e!18360 tp_is_empty!1221)))

(declare-fun b!28399 () Bool)

(declare-fun res!16910 () Bool)

(assert (=> b!28399 (=> (not res!16910) (not e!18363))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1679 (_ BitVec 32)) Bool)

(assert (=> b!28399 (= res!16910 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!28400 () Bool)

(assert (=> b!28400 (= e!18361 (and e!18365 mapRes!1360))))

(declare-fun condMapEmpty!1360 () Bool)

(declare-fun mapDefault!1360 () ValueCell!411)

(assert (=> b!28400 (= condMapEmpty!1360 (= (arr!794 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!411)) mapDefault!1360)))))

(declare-fun b!28401 () Bool)

(declare-fun res!16913 () Bool)

(assert (=> b!28401 (=> (not res!16913) (not e!18359))))

(declare-fun arrayContainsKey!0 (array!1679 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!28401 (= res!16913 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(assert (= (and start!3962 res!16911) b!28396))

(assert (= (and b!28396 res!16908) b!28399))

(assert (= (and b!28399 res!16910) b!28393))

(assert (= (and b!28393 res!16907) b!28397))

(assert (= (and b!28397 res!16914) b!28394))

(assert (= (and b!28394 res!16912) b!28401))

(assert (= (and b!28401 res!16913) b!28395))

(assert (= (and b!28395 (not res!16909)) b!28391))

(assert (= (and b!28400 condMapEmpty!1360) mapIsEmpty!1360))

(assert (= (and b!28400 (not condMapEmpty!1360)) mapNonEmpty!1360))

(get-info :version)

(assert (= (and mapNonEmpty!1360 ((_ is ValueCellFull!411) mapValue!1360)) b!28398))

(assert (= (and b!28400 ((_ is ValueCellFull!411) mapDefault!1360)) b!28392))

(assert (= start!3962 b!28400))

(declare-fun m!22597 () Bool)

(assert (=> b!28391 m!22597))

(declare-fun m!22599 () Bool)

(assert (=> b!28401 m!22599))

(declare-fun m!22601 () Bool)

(assert (=> b!28399 m!22601))

(declare-fun m!22603 () Bool)

(assert (=> start!3962 m!22603))

(declare-fun m!22605 () Bool)

(assert (=> start!3962 m!22605))

(declare-fun m!22607 () Bool)

(assert (=> start!3962 m!22607))

(declare-fun m!22609 () Bool)

(assert (=> b!28395 m!22609))

(assert (=> b!28395 m!22609))

(declare-fun m!22611 () Bool)

(assert (=> b!28395 m!22611))

(declare-fun m!22613 () Bool)

(assert (=> b!28395 m!22613))

(declare-fun m!22615 () Bool)

(assert (=> b!28395 m!22615))

(declare-fun m!22617 () Bool)

(assert (=> b!28394 m!22617))

(declare-fun m!22619 () Bool)

(assert (=> b!28394 m!22619))

(declare-fun m!22621 () Bool)

(assert (=> b!28397 m!22621))

(declare-fun m!22623 () Bool)

(assert (=> b!28393 m!22623))

(declare-fun m!22625 () Bool)

(assert (=> mapNonEmpty!1360 m!22625))

(check-sat (not b!28401) (not mapNonEmpty!1360) (not b!28391) (not b!28397) b_and!1677 (not b!28393) (not b!28395) tp_is_empty!1221 (not b!28399) (not b!28394) (not start!3962) (not b_next!867))
(check-sat b_and!1677 (not b_next!867))
