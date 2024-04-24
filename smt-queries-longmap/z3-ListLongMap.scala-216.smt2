; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3974 () Bool)

(assert start!3974)

(declare-fun b_free!883 () Bool)

(declare-fun b_next!883 () Bool)

(assert (=> start!3974 (= b_free!883 (not b_next!883))))

(declare-fun tp!4068 () Bool)

(declare-fun b_and!1683 () Bool)

(assert (=> start!3974 (= tp!4068 b_and!1683)))

(declare-fun b!28583 () Bool)

(declare-fun e!18480 () Bool)

(declare-fun e!18479 () Bool)

(assert (=> b!28583 (= e!18480 e!18479)))

(declare-fun res!17059 () Bool)

(assert (=> b!28583 (=> (not res!17059) (not e!18479))))

(declare-datatypes ((V!1475 0))(
  ( (V!1476 (val!645 Int)) )
))
(declare-datatypes ((tuple2!1068 0))(
  ( (tuple2!1069 (_1!545 (_ BitVec 64)) (_2!545 V!1475)) )
))
(declare-datatypes ((List!660 0))(
  ( (Nil!657) (Cons!656 (h!1223 tuple2!1068) (t!3347 List!660)) )
))
(declare-datatypes ((ListLongMap!639 0))(
  ( (ListLongMap!640 (toList!335 List!660)) )
))
(declare-fun lt!10844 () ListLongMap!639)

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun contains!277 (ListLongMap!639 (_ BitVec 64)) Bool)

(assert (=> b!28583 (= res!17059 (not (contains!277 lt!10844 k0!1304)))))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((ValueCell!419 0))(
  ( (ValueCellFull!419 (v!1734 V!1475)) (EmptyCell!419) )
))
(declare-datatypes ((array!1689 0))(
  ( (array!1690 (arr!798 (Array (_ BitVec 32) ValueCell!419)) (size!899 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1689)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!1691 0))(
  ( (array!1692 (arr!799 (Array (_ BitVec 32) (_ BitVec 64))) (size!900 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1691)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1475)

(declare-fun minValue!1443 () V!1475)

(declare-fun getCurrentListMap!162 (array!1691 array!1689 (_ BitVec 32) (_ BitVec 32) V!1475 V!1475 (_ BitVec 32) Int) ListLongMap!639)

(assert (=> b!28583 (= lt!10844 (getCurrentListMap!162 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!28584 () Bool)

(declare-fun res!17064 () Bool)

(assert (=> b!28584 (=> (not res!17064) (not e!18480))))

(assert (=> b!28584 (= res!17064 (and (= (size!899 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!900 _keys!1833) (size!899 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!28585 () Bool)

(declare-fun res!17062 () Bool)

(assert (=> b!28585 (=> (not res!17062) (not e!18480))))

(declare-datatypes ((List!661 0))(
  ( (Nil!658) (Cons!657 (h!1224 (_ BitVec 64)) (t!3348 List!661)) )
))
(declare-fun arrayNoDuplicates!0 (array!1691 (_ BitVec 32) List!661) Bool)

(assert (=> b!28585 (= res!17062 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!658))))

(declare-fun b!28587 () Bool)

(declare-fun e!18481 () Bool)

(assert (=> b!28587 (= e!18479 (not e!18481))))

(declare-fun res!17060 () Bool)

(assert (=> b!28587 (=> res!17060 e!18481)))

(assert (=> b!28587 (= res!17060 (not (= (size!900 _keys!1833) (bvadd #b00000000000000000000000000000001 mask!2294))))))

(declare-fun lt!10842 () (_ BitVec 32))

(assert (=> b!28587 (contains!277 lt!10844 (select (arr!799 _keys!1833) lt!10842))))

(declare-datatypes ((Unit!663 0))(
  ( (Unit!664) )
))
(declare-fun lt!10845 () Unit!663)

(declare-fun lemmaValidKeyInArrayIsInListMap!21 (array!1691 array!1689 (_ BitVec 32) (_ BitVec 32) V!1475 V!1475 (_ BitVec 32) Int) Unit!663)

(assert (=> b!28587 (= lt!10845 (lemmaValidKeyInArrayIsInListMap!21 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!10842 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!1691 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!28587 (= lt!10842 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!28588 () Bool)

(declare-fun e!18475 () Bool)

(declare-fun e!18477 () Bool)

(declare-fun mapRes!1384 () Bool)

(assert (=> b!28588 (= e!18475 (and e!18477 mapRes!1384))))

(declare-fun condMapEmpty!1384 () Bool)

(declare-fun mapDefault!1384 () ValueCell!419)

(assert (=> b!28588 (= condMapEmpty!1384 (= (arr!798 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!419)) mapDefault!1384)))))

(declare-fun b!28589 () Bool)

(assert (=> b!28589 (= e!18481 true)))

(declare-datatypes ((SeekEntryResult!71 0))(
  ( (MissingZero!71 (index!2406 (_ BitVec 32))) (Found!71 (index!2407 (_ BitVec 32))) (Intermediate!71 (undefined!883 Bool) (index!2408 (_ BitVec 32)) (x!6341 (_ BitVec 32))) (Undefined!71) (MissingVacant!71 (index!2409 (_ BitVec 32))) )
))
(declare-fun lt!10843 () SeekEntryResult!71)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!1691 (_ BitVec 32)) SeekEntryResult!71)

(assert (=> b!28589 (= lt!10843 (seekEntryOrOpen!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun b!28590 () Bool)

(declare-fun tp_is_empty!1237 () Bool)

(assert (=> b!28590 (= e!18477 tp_is_empty!1237)))

(declare-fun b!28591 () Bool)

(declare-fun res!17065 () Bool)

(assert (=> b!28591 (=> (not res!17065) (not e!18480))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!28591 (= res!17065 (validKeyInArray!0 k0!1304))))

(declare-fun mapIsEmpty!1384 () Bool)

(assert (=> mapIsEmpty!1384 mapRes!1384))

(declare-fun res!17061 () Bool)

(assert (=> start!3974 (=> (not res!17061) (not e!18480))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3974 (= res!17061 (validMask!0 mask!2294))))

(assert (=> start!3974 e!18480))

(assert (=> start!3974 true))

(assert (=> start!3974 tp!4068))

(declare-fun array_inv!553 (array!1689) Bool)

(assert (=> start!3974 (and (array_inv!553 _values!1501) e!18475)))

(declare-fun array_inv!554 (array!1691) Bool)

(assert (=> start!3974 (array_inv!554 _keys!1833)))

(assert (=> start!3974 tp_is_empty!1237))

(declare-fun b!28586 () Bool)

(declare-fun res!17063 () Bool)

(assert (=> b!28586 (=> (not res!17063) (not e!18479))))

(declare-fun arrayContainsKey!0 (array!1691 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!28586 (= res!17063 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!28592 () Bool)

(declare-fun e!18478 () Bool)

(assert (=> b!28592 (= e!18478 tp_is_empty!1237)))

(declare-fun b!28593 () Bool)

(declare-fun res!17066 () Bool)

(assert (=> b!28593 (=> (not res!17066) (not e!18480))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1691 (_ BitVec 32)) Bool)

(assert (=> b!28593 (= res!17066 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun mapNonEmpty!1384 () Bool)

(declare-fun tp!4069 () Bool)

(assert (=> mapNonEmpty!1384 (= mapRes!1384 (and tp!4069 e!18478))))

(declare-fun mapValue!1384 () ValueCell!419)

(declare-fun mapKey!1384 () (_ BitVec 32))

(declare-fun mapRest!1384 () (Array (_ BitVec 32) ValueCell!419))

(assert (=> mapNonEmpty!1384 (= (arr!798 _values!1501) (store mapRest!1384 mapKey!1384 mapValue!1384))))

(assert (= (and start!3974 res!17061) b!28584))

(assert (= (and b!28584 res!17064) b!28593))

(assert (= (and b!28593 res!17066) b!28585))

(assert (= (and b!28585 res!17062) b!28591))

(assert (= (and b!28591 res!17065) b!28583))

(assert (= (and b!28583 res!17059) b!28586))

(assert (= (and b!28586 res!17063) b!28587))

(assert (= (and b!28587 (not res!17060)) b!28589))

(assert (= (and b!28588 condMapEmpty!1384) mapIsEmpty!1384))

(assert (= (and b!28588 (not condMapEmpty!1384)) mapNonEmpty!1384))

(get-info :version)

(assert (= (and mapNonEmpty!1384 ((_ is ValueCellFull!419) mapValue!1384)) b!28592))

(assert (= (and b!28588 ((_ is ValueCellFull!419) mapDefault!1384)) b!28590))

(assert (= start!3974 b!28588))

(declare-fun m!22685 () Bool)

(assert (=> b!28585 m!22685))

(declare-fun m!22687 () Bool)

(assert (=> mapNonEmpty!1384 m!22687))

(declare-fun m!22689 () Bool)

(assert (=> b!28586 m!22689))

(declare-fun m!22691 () Bool)

(assert (=> b!28593 m!22691))

(declare-fun m!22693 () Bool)

(assert (=> b!28583 m!22693))

(declare-fun m!22695 () Bool)

(assert (=> b!28583 m!22695))

(declare-fun m!22697 () Bool)

(assert (=> start!3974 m!22697))

(declare-fun m!22699 () Bool)

(assert (=> start!3974 m!22699))

(declare-fun m!22701 () Bool)

(assert (=> start!3974 m!22701))

(declare-fun m!22703 () Bool)

(assert (=> b!28591 m!22703))

(declare-fun m!22705 () Bool)

(assert (=> b!28589 m!22705))

(declare-fun m!22707 () Bool)

(assert (=> b!28587 m!22707))

(assert (=> b!28587 m!22707))

(declare-fun m!22709 () Bool)

(assert (=> b!28587 m!22709))

(declare-fun m!22711 () Bool)

(assert (=> b!28587 m!22711))

(declare-fun m!22713 () Bool)

(assert (=> b!28587 m!22713))

(check-sat tp_is_empty!1237 (not b!28591) (not b!28593) (not b_next!883) b_and!1683 (not mapNonEmpty!1384) (not b!28589) (not b!28587) (not start!3974) (not b!28586) (not b!28583) (not b!28585))
(check-sat b_and!1683 (not b_next!883))
