; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36846 () Bool)

(assert start!36846)

(declare-fun b_free!7987 () Bool)

(declare-fun b_next!7987 () Bool)

(assert (=> start!36846 (= b_free!7987 (not b_next!7987))))

(declare-fun tp!28677 () Bool)

(declare-fun b_and!15243 () Bool)

(assert (=> start!36846 (= tp!28677 b_and!15243)))

(declare-fun b!368737 () Bool)

(declare-fun res!206753 () Bool)

(declare-fun e!225465 () Bool)

(assert (=> b!368737 (=> (not res!206753) (not e!225465))))

(declare-datatypes ((array!21204 0))(
  ( (array!21205 (arr!10070 (Array (_ BitVec 32) (_ BitVec 64))) (size!10422 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21204)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21204 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!368737 (= res!206753 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!368738 () Bool)

(declare-fun e!225464 () Bool)

(declare-fun tp_is_empty!8635 () Bool)

(assert (=> b!368738 (= e!225464 tp_is_empty!8635)))

(declare-fun b!368739 () Bool)

(declare-fun res!206748 () Bool)

(assert (=> b!368739 (=> (not res!206748) (not e!225465))))

(declare-datatypes ((List!5520 0))(
  ( (Nil!5517) (Cons!5516 (h!6372 (_ BitVec 64)) (t!10662 List!5520)) )
))
(declare-fun arrayNoDuplicates!0 (array!21204 (_ BitVec 32) List!5520) Bool)

(assert (=> b!368739 (= res!206748 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5517))))

(declare-fun mapIsEmpty!14517 () Bool)

(declare-fun mapRes!14517 () Bool)

(assert (=> mapIsEmpty!14517 mapRes!14517))

(declare-fun b!368740 () Bool)

(declare-fun res!206755 () Bool)

(assert (=> b!368740 (=> (not res!206755) (not e!225465))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!368740 (= res!206755 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10422 _keys!658))))))

(declare-fun b!368741 () Bool)

(declare-fun res!206749 () Bool)

(assert (=> b!368741 (=> (not res!206749) (not e!225465))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!368741 (= res!206749 (validKeyInArray!0 k0!778))))

(declare-fun b!368742 () Bool)

(declare-fun res!206754 () Bool)

(declare-fun e!225461 () Bool)

(assert (=> b!368742 (=> (not res!206754) (not e!225461))))

(declare-fun lt!169604 () array!21204)

(assert (=> b!368742 (= res!206754 (arrayNoDuplicates!0 lt!169604 #b00000000000000000000000000000000 Nil!5517))))

(declare-fun b!368743 () Bool)

(assert (=> b!368743 (= e!225465 e!225461)))

(declare-fun res!206751 () Bool)

(assert (=> b!368743 (=> (not res!206751) (not e!225461))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21204 (_ BitVec 32)) Bool)

(assert (=> b!368743 (= res!206751 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169604 mask!970))))

(assert (=> b!368743 (= lt!169604 (array!21205 (store (arr!10070 _keys!658) i!548 k0!778) (size!10422 _keys!658)))))

(declare-fun b!368744 () Bool)

(declare-fun res!206750 () Bool)

(assert (=> b!368744 (=> (not res!206750) (not e!225465))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12619 0))(
  ( (V!12620 (val!4362 Int)) )
))
(declare-datatypes ((ValueCell!3974 0))(
  ( (ValueCellFull!3974 (v!6560 V!12619)) (EmptyCell!3974) )
))
(declare-datatypes ((array!21206 0))(
  ( (array!21207 (arr!10071 (Array (_ BitVec 32) ValueCell!3974)) (size!10423 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21206)

(assert (=> b!368744 (= res!206750 (and (= (size!10423 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10422 _keys!658) (size!10423 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!368745 () Bool)

(declare-fun res!206752 () Bool)

(assert (=> b!368745 (=> (not res!206752) (not e!225465))))

(assert (=> b!368745 (= res!206752 (or (= (select (arr!10070 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10070 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!368746 () Bool)

(assert (=> b!368746 (= e!225461 false)))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!5696 0))(
  ( (tuple2!5697 (_1!2859 (_ BitVec 64)) (_2!2859 V!12619)) )
))
(declare-datatypes ((List!5521 0))(
  ( (Nil!5518) (Cons!5517 (h!6373 tuple2!5696) (t!10663 List!5521)) )
))
(declare-datatypes ((ListLongMap!4611 0))(
  ( (ListLongMap!4612 (toList!2321 List!5521)) )
))
(declare-fun lt!169605 () ListLongMap!4611)

(declare-fun zeroValue!472 () V!12619)

(declare-fun v!373 () V!12619)

(declare-fun minValue!472 () V!12619)

(declare-fun getCurrentListMapNoExtraKeys!630 (array!21204 array!21206 (_ BitVec 32) (_ BitVec 32) V!12619 V!12619 (_ BitVec 32) Int) ListLongMap!4611)

(assert (=> b!368746 (= lt!169605 (getCurrentListMapNoExtraKeys!630 lt!169604 (array!21207 (store (arr!10071 _values!506) i!548 (ValueCellFull!3974 v!373)) (size!10423 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!169606 () ListLongMap!4611)

(assert (=> b!368746 (= lt!169606 (getCurrentListMapNoExtraKeys!630 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!368747 () Bool)

(declare-fun e!225462 () Bool)

(declare-fun e!225463 () Bool)

(assert (=> b!368747 (= e!225462 (and e!225463 mapRes!14517))))

(declare-fun condMapEmpty!14517 () Bool)

(declare-fun mapDefault!14517 () ValueCell!3974)

(assert (=> b!368747 (= condMapEmpty!14517 (= (arr!10071 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3974)) mapDefault!14517)))))

(declare-fun b!368748 () Bool)

(declare-fun res!206747 () Bool)

(assert (=> b!368748 (=> (not res!206747) (not e!225465))))

(assert (=> b!368748 (= res!206747 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun res!206756 () Bool)

(assert (=> start!36846 (=> (not res!206756) (not e!225465))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36846 (= res!206756 (validMask!0 mask!970))))

(assert (=> start!36846 e!225465))

(declare-fun array_inv!7476 (array!21206) Bool)

(assert (=> start!36846 (and (array_inv!7476 _values!506) e!225462)))

(assert (=> start!36846 tp!28677))

(assert (=> start!36846 true))

(assert (=> start!36846 tp_is_empty!8635))

(declare-fun array_inv!7477 (array!21204) Bool)

(assert (=> start!36846 (array_inv!7477 _keys!658)))

(declare-fun mapNonEmpty!14517 () Bool)

(declare-fun tp!28676 () Bool)

(assert (=> mapNonEmpty!14517 (= mapRes!14517 (and tp!28676 e!225464))))

(declare-fun mapKey!14517 () (_ BitVec 32))

(declare-fun mapValue!14517 () ValueCell!3974)

(declare-fun mapRest!14517 () (Array (_ BitVec 32) ValueCell!3974))

(assert (=> mapNonEmpty!14517 (= (arr!10071 _values!506) (store mapRest!14517 mapKey!14517 mapValue!14517))))

(declare-fun b!368749 () Bool)

(assert (=> b!368749 (= e!225463 tp_is_empty!8635)))

(assert (= (and start!36846 res!206756) b!368744))

(assert (= (and b!368744 res!206750) b!368748))

(assert (= (and b!368748 res!206747) b!368739))

(assert (= (and b!368739 res!206748) b!368740))

(assert (= (and b!368740 res!206755) b!368741))

(assert (= (and b!368741 res!206749) b!368745))

(assert (= (and b!368745 res!206752) b!368737))

(assert (= (and b!368737 res!206753) b!368743))

(assert (= (and b!368743 res!206751) b!368742))

(assert (= (and b!368742 res!206754) b!368746))

(assert (= (and b!368747 condMapEmpty!14517) mapIsEmpty!14517))

(assert (= (and b!368747 (not condMapEmpty!14517)) mapNonEmpty!14517))

(get-info :version)

(assert (= (and mapNonEmpty!14517 ((_ is ValueCellFull!3974) mapValue!14517)) b!368738))

(assert (= (and b!368747 ((_ is ValueCellFull!3974) mapDefault!14517)) b!368749))

(assert (= start!36846 b!368747))

(declare-fun m!365543 () Bool)

(assert (=> b!368737 m!365543))

(declare-fun m!365545 () Bool)

(assert (=> b!368741 m!365545))

(declare-fun m!365547 () Bool)

(assert (=> b!368743 m!365547))

(declare-fun m!365549 () Bool)

(assert (=> b!368743 m!365549))

(declare-fun m!365551 () Bool)

(assert (=> b!368742 m!365551))

(declare-fun m!365553 () Bool)

(assert (=> b!368745 m!365553))

(declare-fun m!365555 () Bool)

(assert (=> b!368748 m!365555))

(declare-fun m!365557 () Bool)

(assert (=> b!368746 m!365557))

(declare-fun m!365559 () Bool)

(assert (=> b!368746 m!365559))

(declare-fun m!365561 () Bool)

(assert (=> b!368746 m!365561))

(declare-fun m!365563 () Bool)

(assert (=> mapNonEmpty!14517 m!365563))

(declare-fun m!365565 () Bool)

(assert (=> start!36846 m!365565))

(declare-fun m!365567 () Bool)

(assert (=> start!36846 m!365567))

(declare-fun m!365569 () Bool)

(assert (=> start!36846 m!365569))

(declare-fun m!365571 () Bool)

(assert (=> b!368739 m!365571))

(check-sat (not b!368748) tp_is_empty!8635 (not b!368746) (not b!368742) b_and!15243 (not b!368741) (not b!368739) (not start!36846) (not b!368737) (not mapNonEmpty!14517) (not b!368743) (not b_next!7987))
(check-sat b_and!15243 (not b_next!7987))
