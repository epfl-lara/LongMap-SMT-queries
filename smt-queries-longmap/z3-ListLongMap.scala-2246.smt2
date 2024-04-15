; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36924 () Bool)

(assert start!36924)

(declare-fun b_free!8065 () Bool)

(declare-fun b_next!8065 () Bool)

(assert (=> start!36924 (= b_free!8065 (not b_next!8065))))

(declare-fun tp!28910 () Bool)

(declare-fun b_and!15281 () Bool)

(assert (=> start!36924 (= tp!28910 b_and!15281)))

(declare-fun b!370036 () Bool)

(declare-fun res!207797 () Bool)

(declare-fun e!226020 () Bool)

(assert (=> b!370036 (=> (not res!207797) (not e!226020))))

(declare-datatypes ((array!21355 0))(
  ( (array!21356 (arr!10146 (Array (_ BitVec 32) (_ BitVec 64))) (size!10499 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21355)

(declare-datatypes ((List!5637 0))(
  ( (Nil!5634) (Cons!5633 (h!6489 (_ BitVec 64)) (t!10778 List!5637)) )
))
(declare-fun arrayNoDuplicates!0 (array!21355 (_ BitVec 32) List!5637) Bool)

(assert (=> b!370036 (= res!207797 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5634))))

(declare-fun mapNonEmpty!14634 () Bool)

(declare-fun mapRes!14634 () Bool)

(declare-fun tp!28911 () Bool)

(declare-fun e!226025 () Bool)

(assert (=> mapNonEmpty!14634 (= mapRes!14634 (and tp!28911 e!226025))))

(declare-fun mapKey!14634 () (_ BitVec 32))

(declare-datatypes ((V!12723 0))(
  ( (V!12724 (val!4401 Int)) )
))
(declare-datatypes ((ValueCell!4013 0))(
  ( (ValueCellFull!4013 (v!6592 V!12723)) (EmptyCell!4013) )
))
(declare-datatypes ((array!21357 0))(
  ( (array!21358 (arr!10147 (Array (_ BitVec 32) ValueCell!4013)) (size!10500 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21357)

(declare-fun mapRest!14634 () (Array (_ BitVec 32) ValueCell!4013))

(declare-fun mapValue!14634 () ValueCell!4013)

(assert (=> mapNonEmpty!14634 (= (arr!10147 _values!506) (store mapRest!14634 mapKey!14634 mapValue!14634))))

(declare-fun b!370037 () Bool)

(declare-fun res!207800 () Bool)

(assert (=> b!370037 (=> (not res!207800) (not e!226020))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21355 (_ BitVec 32)) Bool)

(assert (=> b!370037 (= res!207800 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!370038 () Bool)

(declare-fun res!207794 () Bool)

(assert (=> b!370038 (=> (not res!207794) (not e!226020))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21355 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!370038 (= res!207794 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!370039 () Bool)

(declare-fun res!207799 () Bool)

(assert (=> b!370039 (=> (not res!207799) (not e!226020))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!370039 (= res!207799 (and (= (size!10500 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10499 _keys!658) (size!10500 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!14634 () Bool)

(assert (=> mapIsEmpty!14634 mapRes!14634))

(declare-fun b!370040 () Bool)

(declare-fun e!226023 () Bool)

(assert (=> b!370040 (= e!226020 e!226023)))

(declare-fun res!207793 () Bool)

(assert (=> b!370040 (=> (not res!207793) (not e!226023))))

(declare-fun lt!169702 () array!21355)

(assert (=> b!370040 (= res!207793 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169702 mask!970))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!370040 (= lt!169702 (array!21356 (store (arr!10146 _keys!658) i!548 k0!778) (size!10499 _keys!658)))))

(declare-fun b!370041 () Bool)

(declare-fun e!226022 () Bool)

(declare-fun tp_is_empty!8713 () Bool)

(assert (=> b!370041 (= e!226022 tp_is_empty!8713)))

(declare-fun b!370042 () Bool)

(declare-fun res!207796 () Bool)

(assert (=> b!370042 (=> (not res!207796) (not e!226020))))

(assert (=> b!370042 (= res!207796 (or (= (select (arr!10146 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10146 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!370043 () Bool)

(declare-fun res!207795 () Bool)

(assert (=> b!370043 (=> (not res!207795) (not e!226020))))

(assert (=> b!370043 (= res!207795 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10499 _keys!658))))))

(declare-fun b!370044 () Bool)

(assert (=> b!370044 (= e!226023 false)))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12723)

(declare-datatypes ((tuple2!5806 0))(
  ( (tuple2!5807 (_1!2914 (_ BitVec 64)) (_2!2914 V!12723)) )
))
(declare-datatypes ((List!5638 0))(
  ( (Nil!5635) (Cons!5634 (h!6490 tuple2!5806) (t!10779 List!5638)) )
))
(declare-datatypes ((ListLongMap!4709 0))(
  ( (ListLongMap!4710 (toList!2370 List!5638)) )
))
(declare-fun lt!169703 () ListLongMap!4709)

(declare-fun v!373 () V!12723)

(declare-fun minValue!472 () V!12723)

(declare-fun getCurrentListMapNoExtraKeys!661 (array!21355 array!21357 (_ BitVec 32) (_ BitVec 32) V!12723 V!12723 (_ BitVec 32) Int) ListLongMap!4709)

(assert (=> b!370044 (= lt!169703 (getCurrentListMapNoExtraKeys!661 lt!169702 (array!21358 (store (arr!10147 _values!506) i!548 (ValueCellFull!4013 v!373)) (size!10500 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!169704 () ListLongMap!4709)

(assert (=> b!370044 (= lt!169704 (getCurrentListMapNoExtraKeys!661 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!370046 () Bool)

(declare-fun res!207792 () Bool)

(assert (=> b!370046 (=> (not res!207792) (not e!226020))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!370046 (= res!207792 (validKeyInArray!0 k0!778))))

(declare-fun b!370047 () Bool)

(declare-fun e!226021 () Bool)

(assert (=> b!370047 (= e!226021 (and e!226022 mapRes!14634))))

(declare-fun condMapEmpty!14634 () Bool)

(declare-fun mapDefault!14634 () ValueCell!4013)

(assert (=> b!370047 (= condMapEmpty!14634 (= (arr!10147 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4013)) mapDefault!14634)))))

(declare-fun b!370048 () Bool)

(assert (=> b!370048 (= e!226025 tp_is_empty!8713)))

(declare-fun b!370045 () Bool)

(declare-fun res!207791 () Bool)

(assert (=> b!370045 (=> (not res!207791) (not e!226023))))

(assert (=> b!370045 (= res!207791 (arrayNoDuplicates!0 lt!169702 #b00000000000000000000000000000000 Nil!5634))))

(declare-fun res!207798 () Bool)

(assert (=> start!36924 (=> (not res!207798) (not e!226020))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36924 (= res!207798 (validMask!0 mask!970))))

(assert (=> start!36924 e!226020))

(declare-fun array_inv!7504 (array!21357) Bool)

(assert (=> start!36924 (and (array_inv!7504 _values!506) e!226021)))

(assert (=> start!36924 tp!28910))

(assert (=> start!36924 true))

(assert (=> start!36924 tp_is_empty!8713))

(declare-fun array_inv!7505 (array!21355) Bool)

(assert (=> start!36924 (array_inv!7505 _keys!658)))

(assert (= (and start!36924 res!207798) b!370039))

(assert (= (and b!370039 res!207799) b!370037))

(assert (= (and b!370037 res!207800) b!370036))

(assert (= (and b!370036 res!207797) b!370043))

(assert (= (and b!370043 res!207795) b!370046))

(assert (= (and b!370046 res!207792) b!370042))

(assert (= (and b!370042 res!207796) b!370038))

(assert (= (and b!370038 res!207794) b!370040))

(assert (= (and b!370040 res!207793) b!370045))

(assert (= (and b!370045 res!207791) b!370044))

(assert (= (and b!370047 condMapEmpty!14634) mapIsEmpty!14634))

(assert (= (and b!370047 (not condMapEmpty!14634)) mapNonEmpty!14634))

(get-info :version)

(assert (= (and mapNonEmpty!14634 ((_ is ValueCellFull!4013) mapValue!14634)) b!370048))

(assert (= (and b!370047 ((_ is ValueCellFull!4013) mapDefault!14634)) b!370041))

(assert (= start!36924 b!370047))

(declare-fun m!365759 () Bool)

(assert (=> b!370040 m!365759))

(declare-fun m!365761 () Bool)

(assert (=> b!370040 m!365761))

(declare-fun m!365763 () Bool)

(assert (=> b!370037 m!365763))

(declare-fun m!365765 () Bool)

(assert (=> b!370046 m!365765))

(declare-fun m!365767 () Bool)

(assert (=> b!370042 m!365767))

(declare-fun m!365769 () Bool)

(assert (=> b!370038 m!365769))

(declare-fun m!365771 () Bool)

(assert (=> b!370045 m!365771))

(declare-fun m!365773 () Bool)

(assert (=> mapNonEmpty!14634 m!365773))

(declare-fun m!365775 () Bool)

(assert (=> start!36924 m!365775))

(declare-fun m!365777 () Bool)

(assert (=> start!36924 m!365777))

(declare-fun m!365779 () Bool)

(assert (=> start!36924 m!365779))

(declare-fun m!365781 () Bool)

(assert (=> b!370044 m!365781))

(declare-fun m!365783 () Bool)

(assert (=> b!370044 m!365783))

(declare-fun m!365785 () Bool)

(assert (=> b!370044 m!365785))

(declare-fun m!365787 () Bool)

(assert (=> b!370036 m!365787))

(check-sat (not b!370046) b_and!15281 (not start!36924) (not b!370037) (not b_next!8065) (not b!370040) tp_is_empty!8713 (not mapNonEmpty!14634) (not b!370036) (not b!370038) (not b!370045) (not b!370044))
(check-sat b_and!15281 (not b_next!8065))
