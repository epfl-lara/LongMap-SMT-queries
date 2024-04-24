; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37458 () Bool)

(assert start!37458)

(declare-fun b_free!8599 () Bool)

(declare-fun b_next!8599 () Bool)

(assert (=> start!37458 (= b_free!8599 (not b_next!8599))))

(declare-fun tp!30512 () Bool)

(declare-fun b_and!15855 () Bool)

(assert (=> start!37458 (= tp!30512 b_and!15855)))

(declare-fun b!381807 () Bool)

(declare-fun res!217069 () Bool)

(declare-fun e!232083 () Bool)

(assert (=> b!381807 (=> (not res!217069) (not e!232083))))

(declare-datatypes ((array!22392 0))(
  ( (array!22393 (arr!10664 (Array (_ BitVec 32) (_ BitVec 64))) (size!11016 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22392)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!381807 (= res!217069 (or (= (select (arr!10664 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10664 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!381808 () Bool)

(declare-fun res!217065 () Bool)

(assert (=> b!381808 (=> (not res!217065) (not e!232083))))

(assert (=> b!381808 (= res!217065 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11016 _keys!658))))))

(declare-fun b!381809 () Bool)

(declare-fun res!217066 () Bool)

(assert (=> b!381809 (=> (not res!217066) (not e!232083))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22392 (_ BitVec 32)) Bool)

(assert (=> b!381809 (= res!217066 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!381810 () Bool)

(declare-fun e!232078 () Bool)

(declare-fun tp_is_empty!9247 () Bool)

(assert (=> b!381810 (= e!232078 tp_is_empty!9247)))

(declare-fun b!381811 () Bool)

(declare-fun e!232077 () Bool)

(declare-fun e!232079 () Bool)

(assert (=> b!381811 (= e!232077 (not e!232079))))

(declare-fun res!217068 () Bool)

(assert (=> b!381811 (=> res!217068 e!232079)))

(declare-fun lt!179072 () Bool)

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!381811 (= res!217068 (or (and (not lt!179072) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!179072) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!179072)))))

(assert (=> b!381811 (= lt!179072 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-datatypes ((V!13435 0))(
  ( (V!13436 (val!4668 Int)) )
))
(declare-datatypes ((ValueCell!4280 0))(
  ( (ValueCellFull!4280 (v!6866 V!13435)) (EmptyCell!4280) )
))
(declare-datatypes ((array!22394 0))(
  ( (array!22395 (arr!10665 (Array (_ BitVec 32) ValueCell!4280)) (size!11017 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22394)

(declare-datatypes ((tuple2!6148 0))(
  ( (tuple2!6149 (_1!3085 (_ BitVec 64)) (_2!3085 V!13435)) )
))
(declare-datatypes ((List!5983 0))(
  ( (Nil!5980) (Cons!5979 (h!6835 tuple2!6148) (t!11125 List!5983)) )
))
(declare-datatypes ((ListLongMap!5063 0))(
  ( (ListLongMap!5064 (toList!2547 List!5983)) )
))
(declare-fun lt!179073 () ListLongMap!5063)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13435)

(declare-fun minValue!472 () V!13435)

(declare-fun getCurrentListMap!1984 (array!22392 array!22394 (_ BitVec 32) (_ BitVec 32) V!13435 V!13435 (_ BitVec 32) Int) ListLongMap!5063)

(assert (=> b!381811 (= lt!179073 (getCurrentListMap!1984 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179074 () array!22392)

(declare-fun lt!179070 () ListLongMap!5063)

(declare-fun lt!179068 () array!22394)

(assert (=> b!381811 (= lt!179070 (getCurrentListMap!1984 lt!179074 lt!179068 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179071 () ListLongMap!5063)

(declare-fun lt!179066 () ListLongMap!5063)

(assert (=> b!381811 (and (= lt!179071 lt!179066) (= lt!179066 lt!179071))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun v!373 () V!13435)

(declare-fun lt!179069 () ListLongMap!5063)

(declare-fun +!942 (ListLongMap!5063 tuple2!6148) ListLongMap!5063)

(assert (=> b!381811 (= lt!179066 (+!942 lt!179069 (tuple2!6149 k0!778 v!373)))))

(declare-datatypes ((Unit!11763 0))(
  ( (Unit!11764) )
))
(declare-fun lt!179067 () Unit!11763)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!171 (array!22392 array!22394 (_ BitVec 32) (_ BitVec 32) V!13435 V!13435 (_ BitVec 32) (_ BitVec 64) V!13435 (_ BitVec 32) Int) Unit!11763)

(assert (=> b!381811 (= lt!179067 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!171 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!831 (array!22392 array!22394 (_ BitVec 32) (_ BitVec 32) V!13435 V!13435 (_ BitVec 32) Int) ListLongMap!5063)

(assert (=> b!381811 (= lt!179071 (getCurrentListMapNoExtraKeys!831 lt!179074 lt!179068 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!381811 (= lt!179068 (array!22395 (store (arr!10665 _values!506) i!548 (ValueCellFull!4280 v!373)) (size!11017 _values!506)))))

(assert (=> b!381811 (= lt!179069 (getCurrentListMapNoExtraKeys!831 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!381812 () Bool)

(assert (=> b!381812 (= e!232079 (bvsle #b00000000000000000000000000000000 (size!11016 _keys!658)))))

(assert (=> b!381812 (= lt!179070 lt!179071)))

(declare-fun mapNonEmpty!15435 () Bool)

(declare-fun mapRes!15435 () Bool)

(declare-fun tp!30513 () Bool)

(assert (=> mapNonEmpty!15435 (= mapRes!15435 (and tp!30513 e!232078))))

(declare-fun mapValue!15435 () ValueCell!4280)

(declare-fun mapKey!15435 () (_ BitVec 32))

(declare-fun mapRest!15435 () (Array (_ BitVec 32) ValueCell!4280))

(assert (=> mapNonEmpty!15435 (= (arr!10665 _values!506) (store mapRest!15435 mapKey!15435 mapValue!15435))))

(declare-fun res!217070 () Bool)

(assert (=> start!37458 (=> (not res!217070) (not e!232083))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37458 (= res!217070 (validMask!0 mask!970))))

(assert (=> start!37458 e!232083))

(declare-fun e!232081 () Bool)

(declare-fun array_inv!7894 (array!22394) Bool)

(assert (=> start!37458 (and (array_inv!7894 _values!506) e!232081)))

(assert (=> start!37458 tp!30512))

(assert (=> start!37458 true))

(assert (=> start!37458 tp_is_empty!9247))

(declare-fun array_inv!7895 (array!22392) Bool)

(assert (=> start!37458 (array_inv!7895 _keys!658)))

(declare-fun mapIsEmpty!15435 () Bool)

(assert (=> mapIsEmpty!15435 mapRes!15435))

(declare-fun b!381813 () Bool)

(declare-fun res!217071 () Bool)

(assert (=> b!381813 (=> (not res!217071) (not e!232077))))

(declare-datatypes ((List!5984 0))(
  ( (Nil!5981) (Cons!5980 (h!6836 (_ BitVec 64)) (t!11126 List!5984)) )
))
(declare-fun arrayNoDuplicates!0 (array!22392 (_ BitVec 32) List!5984) Bool)

(assert (=> b!381813 (= res!217071 (arrayNoDuplicates!0 lt!179074 #b00000000000000000000000000000000 Nil!5981))))

(declare-fun b!381814 () Bool)

(declare-fun res!217063 () Bool)

(assert (=> b!381814 (=> (not res!217063) (not e!232083))))

(declare-fun arrayContainsKey!0 (array!22392 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!381814 (= res!217063 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!381815 () Bool)

(declare-fun res!217067 () Bool)

(assert (=> b!381815 (=> (not res!217067) (not e!232083))))

(assert (=> b!381815 (= res!217067 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5981))))

(declare-fun b!381816 () Bool)

(declare-fun res!217073 () Bool)

(assert (=> b!381816 (=> (not res!217073) (not e!232083))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!381816 (= res!217073 (validKeyInArray!0 k0!778))))

(declare-fun b!381817 () Bool)

(declare-fun e!232080 () Bool)

(assert (=> b!381817 (= e!232080 tp_is_empty!9247)))

(declare-fun b!381818 () Bool)

(declare-fun res!217064 () Bool)

(assert (=> b!381818 (=> (not res!217064) (not e!232083))))

(assert (=> b!381818 (= res!217064 (and (= (size!11017 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11016 _keys!658) (size!11017 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!381819 () Bool)

(assert (=> b!381819 (= e!232081 (and e!232080 mapRes!15435))))

(declare-fun condMapEmpty!15435 () Bool)

(declare-fun mapDefault!15435 () ValueCell!4280)

(assert (=> b!381819 (= condMapEmpty!15435 (= (arr!10665 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4280)) mapDefault!15435)))))

(declare-fun b!381820 () Bool)

(assert (=> b!381820 (= e!232083 e!232077)))

(declare-fun res!217072 () Bool)

(assert (=> b!381820 (=> (not res!217072) (not e!232077))))

(assert (=> b!381820 (= res!217072 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!179074 mask!970))))

(assert (=> b!381820 (= lt!179074 (array!22393 (store (arr!10664 _keys!658) i!548 k0!778) (size!11016 _keys!658)))))

(assert (= (and start!37458 res!217070) b!381818))

(assert (= (and b!381818 res!217064) b!381809))

(assert (= (and b!381809 res!217066) b!381815))

(assert (= (and b!381815 res!217067) b!381808))

(assert (= (and b!381808 res!217065) b!381816))

(assert (= (and b!381816 res!217073) b!381807))

(assert (= (and b!381807 res!217069) b!381814))

(assert (= (and b!381814 res!217063) b!381820))

(assert (= (and b!381820 res!217072) b!381813))

(assert (= (and b!381813 res!217071) b!381811))

(assert (= (and b!381811 (not res!217068)) b!381812))

(assert (= (and b!381819 condMapEmpty!15435) mapIsEmpty!15435))

(assert (= (and b!381819 (not condMapEmpty!15435)) mapNonEmpty!15435))

(get-info :version)

(assert (= (and mapNonEmpty!15435 ((_ is ValueCellFull!4280) mapValue!15435)) b!381810))

(assert (= (and b!381819 ((_ is ValueCellFull!4280) mapDefault!15435)) b!381817))

(assert (= start!37458 b!381819))

(declare-fun m!378965 () Bool)

(assert (=> b!381815 m!378965))

(declare-fun m!378967 () Bool)

(assert (=> b!381820 m!378967))

(declare-fun m!378969 () Bool)

(assert (=> b!381820 m!378969))

(declare-fun m!378971 () Bool)

(assert (=> b!381807 m!378971))

(declare-fun m!378973 () Bool)

(assert (=> b!381814 m!378973))

(declare-fun m!378975 () Bool)

(assert (=> b!381811 m!378975))

(declare-fun m!378977 () Bool)

(assert (=> b!381811 m!378977))

(declare-fun m!378979 () Bool)

(assert (=> b!381811 m!378979))

(declare-fun m!378981 () Bool)

(assert (=> b!381811 m!378981))

(declare-fun m!378983 () Bool)

(assert (=> b!381811 m!378983))

(declare-fun m!378985 () Bool)

(assert (=> b!381811 m!378985))

(declare-fun m!378987 () Bool)

(assert (=> b!381811 m!378987))

(declare-fun m!378989 () Bool)

(assert (=> b!381813 m!378989))

(declare-fun m!378991 () Bool)

(assert (=> start!37458 m!378991))

(declare-fun m!378993 () Bool)

(assert (=> start!37458 m!378993))

(declare-fun m!378995 () Bool)

(assert (=> start!37458 m!378995))

(declare-fun m!378997 () Bool)

(assert (=> mapNonEmpty!15435 m!378997))

(declare-fun m!378999 () Bool)

(assert (=> b!381816 m!378999))

(declare-fun m!379001 () Bool)

(assert (=> b!381809 m!379001))

(check-sat (not b!381813) (not b!381809) tp_is_empty!9247 (not mapNonEmpty!15435) (not b!381820) (not b!381815) (not start!37458) b_and!15855 (not b!381816) (not b!381811) (not b!381814) (not b_next!8599))
(check-sat b_and!15855 (not b_next!8599))
