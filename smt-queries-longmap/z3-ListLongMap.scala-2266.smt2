; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37044 () Bool)

(assert start!37044)

(declare-fun b_free!8185 () Bool)

(declare-fun b_next!8185 () Bool)

(assert (=> start!37044 (= b_free!8185 (not b_next!8185))))

(declare-fun tp!29270 () Bool)

(declare-fun b_and!15441 () Bool)

(assert (=> start!37044 (= tp!29270 b_and!15441)))

(declare-fun b!372598 () Bool)

(declare-fun e!227245 () Bool)

(declare-fun e!227242 () Bool)

(declare-fun mapRes!14814 () Bool)

(assert (=> b!372598 (= e!227245 (and e!227242 mapRes!14814))))

(declare-fun condMapEmpty!14814 () Bool)

(declare-datatypes ((V!12883 0))(
  ( (V!12884 (val!4461 Int)) )
))
(declare-datatypes ((ValueCell!4073 0))(
  ( (ValueCellFull!4073 (v!6659 V!12883)) (EmptyCell!4073) )
))
(declare-datatypes ((array!21588 0))(
  ( (array!21589 (arr!10262 (Array (_ BitVec 32) ValueCell!4073)) (size!10614 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21588)

(declare-fun mapDefault!14814 () ValueCell!4073)

(assert (=> b!372598 (= condMapEmpty!14814 (= (arr!10262 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4073)) mapDefault!14814)))))

(declare-fun mapNonEmpty!14814 () Bool)

(declare-fun tp!29271 () Bool)

(declare-fun e!227244 () Bool)

(assert (=> mapNonEmpty!14814 (= mapRes!14814 (and tp!29271 e!227244))))

(declare-fun mapValue!14814 () ValueCell!4073)

(declare-fun mapRest!14814 () (Array (_ BitVec 32) ValueCell!4073))

(declare-fun mapKey!14814 () (_ BitVec 32))

(assert (=> mapNonEmpty!14814 (= (arr!10262 _values!506) (store mapRest!14814 mapKey!14814 mapValue!14814))))

(declare-fun b!372599 () Bool)

(declare-fun res!209726 () Bool)

(declare-fun e!227246 () Bool)

(assert (=> b!372599 (=> (not res!209726) (not e!227246))))

(declare-datatypes ((array!21590 0))(
  ( (array!21591 (arr!10263 (Array (_ BitVec 32) (_ BitVec 64))) (size!10615 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21590)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21590 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!372599 (= res!209726 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!14814 () Bool)

(assert (=> mapIsEmpty!14814 mapRes!14814))

(declare-fun b!372600 () Bool)

(declare-fun res!209720 () Bool)

(assert (=> b!372600 (=> (not res!209720) (not e!227246))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!372600 (= res!209720 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10615 _keys!658))))))

(declare-fun b!372601 () Bool)

(declare-fun tp_is_empty!8833 () Bool)

(assert (=> b!372601 (= e!227242 tp_is_empty!8833)))

(declare-fun b!372602 () Bool)

(declare-fun res!209724 () Bool)

(assert (=> b!372602 (=> (not res!209724) (not e!227246))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!372602 (= res!209724 (validKeyInArray!0 k0!778))))

(declare-fun b!372603 () Bool)

(assert (=> b!372603 (= e!227244 tp_is_empty!8833)))

(declare-fun res!209721 () Bool)

(assert (=> start!37044 (=> (not res!209721) (not e!227246))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37044 (= res!209721 (validMask!0 mask!970))))

(assert (=> start!37044 e!227246))

(declare-fun array_inv!7612 (array!21588) Bool)

(assert (=> start!37044 (and (array_inv!7612 _values!506) e!227245)))

(assert (=> start!37044 tp!29270))

(assert (=> start!37044 true))

(assert (=> start!37044 tp_is_empty!8833))

(declare-fun array_inv!7613 (array!21590) Bool)

(assert (=> start!37044 (array_inv!7613 _keys!658)))

(declare-fun b!372604 () Bool)

(declare-fun res!209722 () Bool)

(assert (=> b!372604 (=> (not res!209722) (not e!227246))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!372604 (= res!209722 (and (= (size!10614 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10615 _keys!658) (size!10614 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!372605 () Bool)

(declare-fun res!209719 () Bool)

(declare-fun e!227247 () Bool)

(assert (=> b!372605 (=> (not res!209719) (not e!227247))))

(declare-fun lt!170882 () array!21590)

(declare-datatypes ((List!5661 0))(
  ( (Nil!5658) (Cons!5657 (h!6513 (_ BitVec 64)) (t!10803 List!5661)) )
))
(declare-fun arrayNoDuplicates!0 (array!21590 (_ BitVec 32) List!5661) Bool)

(assert (=> b!372605 (= res!209719 (arrayNoDuplicates!0 lt!170882 #b00000000000000000000000000000000 Nil!5658))))

(declare-fun b!372606 () Bool)

(declare-fun res!209723 () Bool)

(assert (=> b!372606 (=> (not res!209723) (not e!227246))))

(assert (=> b!372606 (= res!209723 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5658))))

(declare-fun b!372607 () Bool)

(declare-fun res!209725 () Bool)

(assert (=> b!372607 (=> (not res!209725) (not e!227246))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21590 (_ BitVec 32)) Bool)

(assert (=> b!372607 (= res!209725 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!372608 () Bool)

(assert (=> b!372608 (= e!227246 e!227247)))

(declare-fun res!209718 () Bool)

(assert (=> b!372608 (=> (not res!209718) (not e!227247))))

(assert (=> b!372608 (= res!209718 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!170882 mask!970))))

(assert (=> b!372608 (= lt!170882 (array!21591 (store (arr!10263 _keys!658) i!548 k0!778) (size!10615 _keys!658)))))

(declare-fun b!372609 () Bool)

(assert (=> b!372609 (= e!227247 (not true))))

(declare-datatypes ((tuple2!5818 0))(
  ( (tuple2!5819 (_1!2920 (_ BitVec 64)) (_2!2920 V!12883)) )
))
(declare-datatypes ((List!5662 0))(
  ( (Nil!5659) (Cons!5658 (h!6514 tuple2!5818) (t!10804 List!5662)) )
))
(declare-datatypes ((ListLongMap!4733 0))(
  ( (ListLongMap!4734 (toList!2382 List!5662)) )
))
(declare-fun lt!170881 () ListLongMap!4733)

(declare-fun defaultEntry!514 () Int)

(declare-fun lt!170883 () array!21588)

(declare-fun zeroValue!472 () V!12883)

(declare-fun minValue!472 () V!12883)

(declare-fun getCurrentListMap!1844 (array!21590 array!21588 (_ BitVec 32) (_ BitVec 32) V!12883 V!12883 (_ BitVec 32) Int) ListLongMap!4733)

(assert (=> b!372609 (= lt!170881 (getCurrentListMap!1844 lt!170882 lt!170883 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!170885 () ListLongMap!4733)

(declare-fun lt!170884 () ListLongMap!4733)

(assert (=> b!372609 (and (= lt!170885 lt!170884) (= lt!170884 lt!170885))))

(declare-fun v!373 () V!12883)

(declare-fun lt!170887 () ListLongMap!4733)

(declare-fun +!778 (ListLongMap!4733 tuple2!5818) ListLongMap!4733)

(assert (=> b!372609 (= lt!170884 (+!778 lt!170887 (tuple2!5819 k0!778 v!373)))))

(declare-datatypes ((Unit!11447 0))(
  ( (Unit!11448) )
))
(declare-fun lt!170886 () Unit!11447)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!31 (array!21590 array!21588 (_ BitVec 32) (_ BitVec 32) V!12883 V!12883 (_ BitVec 32) (_ BitVec 64) V!12883 (_ BitVec 32) Int) Unit!11447)

(assert (=> b!372609 (= lt!170886 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!31 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!691 (array!21590 array!21588 (_ BitVec 32) (_ BitVec 32) V!12883 V!12883 (_ BitVec 32) Int) ListLongMap!4733)

(assert (=> b!372609 (= lt!170885 (getCurrentListMapNoExtraKeys!691 lt!170882 lt!170883 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!372609 (= lt!170883 (array!21589 (store (arr!10262 _values!506) i!548 (ValueCellFull!4073 v!373)) (size!10614 _values!506)))))

(assert (=> b!372609 (= lt!170887 (getCurrentListMapNoExtraKeys!691 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!372610 () Bool)

(declare-fun res!209717 () Bool)

(assert (=> b!372610 (=> (not res!209717) (not e!227246))))

(assert (=> b!372610 (= res!209717 (or (= (select (arr!10263 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10263 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!37044 res!209721) b!372604))

(assert (= (and b!372604 res!209722) b!372607))

(assert (= (and b!372607 res!209725) b!372606))

(assert (= (and b!372606 res!209723) b!372600))

(assert (= (and b!372600 res!209720) b!372602))

(assert (= (and b!372602 res!209724) b!372610))

(assert (= (and b!372610 res!209717) b!372599))

(assert (= (and b!372599 res!209726) b!372608))

(assert (= (and b!372608 res!209718) b!372605))

(assert (= (and b!372605 res!209719) b!372609))

(assert (= (and b!372598 condMapEmpty!14814) mapIsEmpty!14814))

(assert (= (and b!372598 (not condMapEmpty!14814)) mapNonEmpty!14814))

(get-info :version)

(assert (= (and mapNonEmpty!14814 ((_ is ValueCellFull!4073) mapValue!14814)) b!372603))

(assert (= (and b!372598 ((_ is ValueCellFull!4073) mapDefault!14814)) b!372601))

(assert (= start!37044 b!372598))

(declare-fun m!368729 () Bool)

(assert (=> b!372606 m!368729))

(declare-fun m!368731 () Bool)

(assert (=> b!372609 m!368731))

(declare-fun m!368733 () Bool)

(assert (=> b!372609 m!368733))

(declare-fun m!368735 () Bool)

(assert (=> b!372609 m!368735))

(declare-fun m!368737 () Bool)

(assert (=> b!372609 m!368737))

(declare-fun m!368739 () Bool)

(assert (=> b!372609 m!368739))

(declare-fun m!368741 () Bool)

(assert (=> b!372609 m!368741))

(declare-fun m!368743 () Bool)

(assert (=> b!372607 m!368743))

(declare-fun m!368745 () Bool)

(assert (=> b!372602 m!368745))

(declare-fun m!368747 () Bool)

(assert (=> b!372610 m!368747))

(declare-fun m!368749 () Bool)

(assert (=> mapNonEmpty!14814 m!368749))

(declare-fun m!368751 () Bool)

(assert (=> start!37044 m!368751))

(declare-fun m!368753 () Bool)

(assert (=> start!37044 m!368753))

(declare-fun m!368755 () Bool)

(assert (=> start!37044 m!368755))

(declare-fun m!368757 () Bool)

(assert (=> b!372605 m!368757))

(declare-fun m!368759 () Bool)

(assert (=> b!372599 m!368759))

(declare-fun m!368761 () Bool)

(assert (=> b!372608 m!368761))

(declare-fun m!368763 () Bool)

(assert (=> b!372608 m!368763))

(check-sat (not b!372605) (not start!37044) (not b!372607) (not b!372606) (not b!372609) (not b!372599) (not mapNonEmpty!14814) tp_is_empty!8833 (not b!372602) (not b_next!8185) b_and!15441 (not b!372608))
(check-sat b_and!15441 (not b_next!8185))
