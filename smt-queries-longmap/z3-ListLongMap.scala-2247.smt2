; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36930 () Bool)

(assert start!36930)

(declare-fun b_free!8071 () Bool)

(declare-fun b_next!8071 () Bool)

(assert (=> start!36930 (= b_free!8071 (not b_next!8071))))

(declare-fun tp!28929 () Bool)

(declare-fun b_and!15287 () Bool)

(assert (=> start!36930 (= tp!28929 b_and!15287)))

(declare-fun b!370153 () Bool)

(declare-fun res!207882 () Bool)

(declare-fun e!226079 () Bool)

(assert (=> b!370153 (=> (not res!207882) (not e!226079))))

(declare-datatypes ((array!21367 0))(
  ( (array!21368 (arr!10152 (Array (_ BitVec 32) (_ BitVec 64))) (size!10505 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21367)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21367 (_ BitVec 32)) Bool)

(assert (=> b!370153 (= res!207882 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!370154 () Bool)

(declare-fun res!207889 () Bool)

(declare-fun e!226078 () Bool)

(assert (=> b!370154 (=> (not res!207889) (not e!226078))))

(declare-fun lt!169729 () array!21367)

(declare-datatypes ((List!5643 0))(
  ( (Nil!5640) (Cons!5639 (h!6495 (_ BitVec 64)) (t!10784 List!5643)) )
))
(declare-fun arrayNoDuplicates!0 (array!21367 (_ BitVec 32) List!5643) Bool)

(assert (=> b!370154 (= res!207889 (arrayNoDuplicates!0 lt!169729 #b00000000000000000000000000000000 Nil!5640))))

(declare-fun b!370155 () Bool)

(declare-fun res!207883 () Bool)

(assert (=> b!370155 (=> (not res!207883) (not e!226079))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21367 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!370155 (= res!207883 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!370156 () Bool)

(assert (=> b!370156 (= e!226079 e!226078)))

(declare-fun res!207886 () Bool)

(assert (=> b!370156 (=> (not res!207886) (not e!226078))))

(assert (=> b!370156 (= res!207886 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169729 mask!970))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!370156 (= lt!169729 (array!21368 (store (arr!10152 _keys!658) i!548 k0!778) (size!10505 _keys!658)))))

(declare-fun b!370158 () Bool)

(declare-fun res!207888 () Bool)

(assert (=> b!370158 (=> (not res!207888) (not e!226079))))

(assert (=> b!370158 (= res!207888 (or (= (select (arr!10152 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10152 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!370159 () Bool)

(declare-fun res!207881 () Bool)

(assert (=> b!370159 (=> (not res!207881) (not e!226079))))

(assert (=> b!370159 (= res!207881 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5640))))

(declare-fun b!370160 () Bool)

(declare-fun e!226076 () Bool)

(declare-fun tp_is_empty!8719 () Bool)

(assert (=> b!370160 (= e!226076 tp_is_empty!8719)))

(declare-fun b!370161 () Bool)

(declare-fun res!207890 () Bool)

(assert (=> b!370161 (=> (not res!207890) (not e!226079))))

(assert (=> b!370161 (= res!207890 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10505 _keys!658))))))

(declare-fun b!370162 () Bool)

(declare-fun e!226077 () Bool)

(declare-fun e!226075 () Bool)

(declare-fun mapRes!14643 () Bool)

(assert (=> b!370162 (= e!226077 (and e!226075 mapRes!14643))))

(declare-fun condMapEmpty!14643 () Bool)

(declare-datatypes ((V!12731 0))(
  ( (V!12732 (val!4404 Int)) )
))
(declare-datatypes ((ValueCell!4016 0))(
  ( (ValueCellFull!4016 (v!6595 V!12731)) (EmptyCell!4016) )
))
(declare-datatypes ((array!21369 0))(
  ( (array!21370 (arr!10153 (Array (_ BitVec 32) ValueCell!4016)) (size!10506 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21369)

(declare-fun mapDefault!14643 () ValueCell!4016)

(assert (=> b!370162 (= condMapEmpty!14643 (= (arr!10153 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4016)) mapDefault!14643)))))

(declare-fun mapIsEmpty!14643 () Bool)

(assert (=> mapIsEmpty!14643 mapRes!14643))

(declare-fun b!370157 () Bool)

(assert (=> b!370157 (= e!226078 false)))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!5812 0))(
  ( (tuple2!5813 (_1!2917 (_ BitVec 64)) (_2!2917 V!12731)) )
))
(declare-datatypes ((List!5644 0))(
  ( (Nil!5641) (Cons!5640 (h!6496 tuple2!5812) (t!10785 List!5644)) )
))
(declare-datatypes ((ListLongMap!4715 0))(
  ( (ListLongMap!4716 (toList!2373 List!5644)) )
))
(declare-fun lt!169730 () ListLongMap!4715)

(declare-fun zeroValue!472 () V!12731)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!12731)

(declare-fun minValue!472 () V!12731)

(declare-fun getCurrentListMapNoExtraKeys!664 (array!21367 array!21369 (_ BitVec 32) (_ BitVec 32) V!12731 V!12731 (_ BitVec 32) Int) ListLongMap!4715)

(assert (=> b!370157 (= lt!169730 (getCurrentListMapNoExtraKeys!664 lt!169729 (array!21370 (store (arr!10153 _values!506) i!548 (ValueCellFull!4016 v!373)) (size!10506 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!169731 () ListLongMap!4715)

(assert (=> b!370157 (= lt!169731 (getCurrentListMapNoExtraKeys!664 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun res!207887 () Bool)

(assert (=> start!36930 (=> (not res!207887) (not e!226079))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36930 (= res!207887 (validMask!0 mask!970))))

(assert (=> start!36930 e!226079))

(declare-fun array_inv!7510 (array!21369) Bool)

(assert (=> start!36930 (and (array_inv!7510 _values!506) e!226077)))

(assert (=> start!36930 tp!28929))

(assert (=> start!36930 true))

(assert (=> start!36930 tp_is_empty!8719))

(declare-fun array_inv!7511 (array!21367) Bool)

(assert (=> start!36930 (array_inv!7511 _keys!658)))

(declare-fun b!370163 () Bool)

(assert (=> b!370163 (= e!226075 tp_is_empty!8719)))

(declare-fun b!370164 () Bool)

(declare-fun res!207884 () Bool)

(assert (=> b!370164 (=> (not res!207884) (not e!226079))))

(assert (=> b!370164 (= res!207884 (and (= (size!10506 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10505 _keys!658) (size!10506 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!14643 () Bool)

(declare-fun tp!28928 () Bool)

(assert (=> mapNonEmpty!14643 (= mapRes!14643 (and tp!28928 e!226076))))

(declare-fun mapValue!14643 () ValueCell!4016)

(declare-fun mapKey!14643 () (_ BitVec 32))

(declare-fun mapRest!14643 () (Array (_ BitVec 32) ValueCell!4016))

(assert (=> mapNonEmpty!14643 (= (arr!10153 _values!506) (store mapRest!14643 mapKey!14643 mapValue!14643))))

(declare-fun b!370165 () Bool)

(declare-fun res!207885 () Bool)

(assert (=> b!370165 (=> (not res!207885) (not e!226079))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!370165 (= res!207885 (validKeyInArray!0 k0!778))))

(assert (= (and start!36930 res!207887) b!370164))

(assert (= (and b!370164 res!207884) b!370153))

(assert (= (and b!370153 res!207882) b!370159))

(assert (= (and b!370159 res!207881) b!370161))

(assert (= (and b!370161 res!207890) b!370165))

(assert (= (and b!370165 res!207885) b!370158))

(assert (= (and b!370158 res!207888) b!370155))

(assert (= (and b!370155 res!207883) b!370156))

(assert (= (and b!370156 res!207886) b!370154))

(assert (= (and b!370154 res!207889) b!370157))

(assert (= (and b!370162 condMapEmpty!14643) mapIsEmpty!14643))

(assert (= (and b!370162 (not condMapEmpty!14643)) mapNonEmpty!14643))

(get-info :version)

(assert (= (and mapNonEmpty!14643 ((_ is ValueCellFull!4016) mapValue!14643)) b!370160))

(assert (= (and b!370162 ((_ is ValueCellFull!4016) mapDefault!14643)) b!370163))

(assert (= start!36930 b!370162))

(declare-fun m!365849 () Bool)

(assert (=> start!36930 m!365849))

(declare-fun m!365851 () Bool)

(assert (=> start!36930 m!365851))

(declare-fun m!365853 () Bool)

(assert (=> start!36930 m!365853))

(declare-fun m!365855 () Bool)

(assert (=> b!370165 m!365855))

(declare-fun m!365857 () Bool)

(assert (=> b!370153 m!365857))

(declare-fun m!365859 () Bool)

(assert (=> b!370155 m!365859))

(declare-fun m!365861 () Bool)

(assert (=> b!370158 m!365861))

(declare-fun m!365863 () Bool)

(assert (=> b!370154 m!365863))

(declare-fun m!365865 () Bool)

(assert (=> b!370159 m!365865))

(declare-fun m!365867 () Bool)

(assert (=> b!370156 m!365867))

(declare-fun m!365869 () Bool)

(assert (=> b!370156 m!365869))

(declare-fun m!365871 () Bool)

(assert (=> mapNonEmpty!14643 m!365871))

(declare-fun m!365873 () Bool)

(assert (=> b!370157 m!365873))

(declare-fun m!365875 () Bool)

(assert (=> b!370157 m!365875))

(declare-fun m!365877 () Bool)

(assert (=> b!370157 m!365877))

(check-sat b_and!15287 (not start!36930) (not b!370156) (not b!370155) (not b!370157) (not b!370159) tp_is_empty!8719 (not b!370153) (not mapNonEmpty!14643) (not b!370154) (not b!370165) (not b_next!8071))
(check-sat b_and!15287 (not b_next!8071))
