; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37242 () Bool)

(assert start!37242)

(declare-fun b_free!8383 () Bool)

(declare-fun b_next!8383 () Bool)

(assert (=> start!37242 (= b_free!8383 (not b_next!8383))))

(declare-fun tp!29865 () Bool)

(declare-fun b_and!15639 () Bool)

(assert (=> start!37242 (= tp!29865 b_and!15639)))

(declare-fun b!377012 () Bool)

(declare-fun e!229563 () Bool)

(assert (=> b!377012 (= e!229563 true)))

(declare-datatypes ((V!13147 0))(
  ( (V!13148 (val!4560 Int)) )
))
(declare-datatypes ((tuple2!5980 0))(
  ( (tuple2!5981 (_1!3001 (_ BitVec 64)) (_2!3001 V!13147)) )
))
(declare-datatypes ((List!5821 0))(
  ( (Nil!5818) (Cons!5817 (h!6673 tuple2!5980) (t!10963 List!5821)) )
))
(declare-datatypes ((ListLongMap!4895 0))(
  ( (ListLongMap!4896 (toList!2463 List!5821)) )
))
(declare-fun lt!175195 () ListLongMap!4895)

(declare-fun lt!175187 () ListLongMap!4895)

(declare-fun lt!175193 () tuple2!5980)

(declare-fun +!859 (ListLongMap!4895 tuple2!5980) ListLongMap!4895)

(assert (=> b!377012 (= lt!175195 (+!859 lt!175187 lt!175193))))

(declare-datatypes ((Unit!11605 0))(
  ( (Unit!11606) )
))
(declare-fun lt!175196 () Unit!11605)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun zeroValue!472 () V!13147)

(declare-fun lt!175188 () ListLongMap!4895)

(declare-fun v!373 () V!13147)

(declare-fun addCommutativeForDiffKeys!279 (ListLongMap!4895 (_ BitVec 64) V!13147 (_ BitVec 64) V!13147) Unit!11605)

(assert (=> b!377012 (= lt!175196 (addCommutativeForDiffKeys!279 lt!175188 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!377013 () Bool)

(declare-fun res!213243 () Bool)

(declare-fun e!229559 () Bool)

(assert (=> b!377013 (=> (not res!213243) (not e!229559))))

(declare-datatypes ((array!21978 0))(
  ( (array!21979 (arr!10457 (Array (_ BitVec 32) (_ BitVec 64))) (size!10809 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21978)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21978 (_ BitVec 32)) Bool)

(assert (=> b!377013 (= res!213243 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!377014 () Bool)

(declare-fun e!229560 () Bool)

(assert (=> b!377014 (= e!229560 e!229563)))

(declare-fun res!213242 () Bool)

(assert (=> b!377014 (=> res!213242 e!229563)))

(assert (=> b!377014 (= res!213242 (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!175186 () ListLongMap!4895)

(assert (=> b!377014 (= lt!175186 lt!175195)))

(declare-fun lt!175198 () ListLongMap!4895)

(declare-fun lt!175197 () tuple2!5980)

(assert (=> b!377014 (= lt!175195 (+!859 lt!175198 lt!175197))))

(declare-fun lt!175190 () ListLongMap!4895)

(assert (=> b!377014 (= lt!175190 lt!175187)))

(assert (=> b!377014 (= lt!175187 (+!859 lt!175188 lt!175197))))

(declare-fun lt!175192 () ListLongMap!4895)

(assert (=> b!377014 (= lt!175186 (+!859 lt!175192 lt!175197))))

(assert (=> b!377014 (= lt!175197 (tuple2!5981 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!377015 () Bool)

(declare-fun res!213240 () Bool)

(declare-fun e!229562 () Bool)

(assert (=> b!377015 (=> (not res!213240) (not e!229562))))

(declare-fun lt!175191 () array!21978)

(declare-datatypes ((List!5822 0))(
  ( (Nil!5819) (Cons!5818 (h!6674 (_ BitVec 64)) (t!10964 List!5822)) )
))
(declare-fun arrayNoDuplicates!0 (array!21978 (_ BitVec 32) List!5822) Bool)

(assert (=> b!377015 (= res!213240 (arrayNoDuplicates!0 lt!175191 #b00000000000000000000000000000000 Nil!5819))))

(declare-fun b!377016 () Bool)

(declare-fun res!213247 () Bool)

(assert (=> b!377016 (=> (not res!213247) (not e!229559))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4172 0))(
  ( (ValueCellFull!4172 (v!6758 V!13147)) (EmptyCell!4172) )
))
(declare-datatypes ((array!21980 0))(
  ( (array!21981 (arr!10458 (Array (_ BitVec 32) ValueCell!4172)) (size!10810 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21980)

(assert (=> b!377016 (= res!213247 (and (= (size!10810 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10809 _keys!658) (size!10810 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!15111 () Bool)

(declare-fun mapRes!15111 () Bool)

(assert (=> mapIsEmpty!15111 mapRes!15111))

(declare-fun b!377017 () Bool)

(declare-fun res!213250 () Bool)

(assert (=> b!377017 (=> (not res!213250) (not e!229559))))

(declare-fun arrayContainsKey!0 (array!21978 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!377017 (= res!213250 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!377018 () Bool)

(declare-fun e!229566 () Bool)

(declare-fun tp_is_empty!9031 () Bool)

(assert (=> b!377018 (= e!229566 tp_is_empty!9031)))

(declare-fun b!377019 () Bool)

(declare-fun res!213245 () Bool)

(assert (=> b!377019 (=> (not res!213245) (not e!229559))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!377019 (= res!213245 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10809 _keys!658))))))

(declare-fun mapNonEmpty!15111 () Bool)

(declare-fun tp!29864 () Bool)

(assert (=> mapNonEmpty!15111 (= mapRes!15111 (and tp!29864 e!229566))))

(declare-fun mapKey!15111 () (_ BitVec 32))

(declare-fun mapRest!15111 () (Array (_ BitVec 32) ValueCell!4172))

(declare-fun mapValue!15111 () ValueCell!4172)

(assert (=> mapNonEmpty!15111 (= (arr!10458 _values!506) (store mapRest!15111 mapKey!15111 mapValue!15111))))

(declare-fun b!377020 () Bool)

(assert (=> b!377020 (= e!229562 (not e!229560))))

(declare-fun res!213251 () Bool)

(assert (=> b!377020 (=> res!213251 e!229560)))

(assert (=> b!377020 (= res!213251 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun minValue!472 () V!13147)

(declare-fun getCurrentListMap!1912 (array!21978 array!21980 (_ BitVec 32) (_ BitVec 32) V!13147 V!13147 (_ BitVec 32) Int) ListLongMap!4895)

(assert (=> b!377020 (= lt!175190 (getCurrentListMap!1912 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!175194 () array!21980)

(assert (=> b!377020 (= lt!175186 (getCurrentListMap!1912 lt!175191 lt!175194 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!377020 (and (= lt!175192 lt!175198) (= lt!175198 lt!175192))))

(assert (=> b!377020 (= lt!175198 (+!859 lt!175188 lt!175193))))

(assert (=> b!377020 (= lt!175193 (tuple2!5981 k0!778 v!373))))

(declare-fun lt!175189 () Unit!11605)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!99 (array!21978 array!21980 (_ BitVec 32) (_ BitVec 32) V!13147 V!13147 (_ BitVec 32) (_ BitVec 64) V!13147 (_ BitVec 32) Int) Unit!11605)

(assert (=> b!377020 (= lt!175189 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!99 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!759 (array!21978 array!21980 (_ BitVec 32) (_ BitVec 32) V!13147 V!13147 (_ BitVec 32) Int) ListLongMap!4895)

(assert (=> b!377020 (= lt!175192 (getCurrentListMapNoExtraKeys!759 lt!175191 lt!175194 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!377020 (= lt!175194 (array!21981 (store (arr!10458 _values!506) i!548 (ValueCellFull!4172 v!373)) (size!10810 _values!506)))))

(assert (=> b!377020 (= lt!175188 (getCurrentListMapNoExtraKeys!759 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!377021 () Bool)

(assert (=> b!377021 (= e!229559 e!229562)))

(declare-fun res!213246 () Bool)

(assert (=> b!377021 (=> (not res!213246) (not e!229562))))

(assert (=> b!377021 (= res!213246 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!175191 mask!970))))

(assert (=> b!377021 (= lt!175191 (array!21979 (store (arr!10457 _keys!658) i!548 k0!778) (size!10809 _keys!658)))))

(declare-fun res!213249 () Bool)

(assert (=> start!37242 (=> (not res!213249) (not e!229559))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37242 (= res!213249 (validMask!0 mask!970))))

(assert (=> start!37242 e!229559))

(declare-fun e!229564 () Bool)

(declare-fun array_inv!7760 (array!21980) Bool)

(assert (=> start!37242 (and (array_inv!7760 _values!506) e!229564)))

(assert (=> start!37242 tp!29865))

(assert (=> start!37242 true))

(assert (=> start!37242 tp_is_empty!9031))

(declare-fun array_inv!7761 (array!21978) Bool)

(assert (=> start!37242 (array_inv!7761 _keys!658)))

(declare-fun b!377022 () Bool)

(declare-fun res!213248 () Bool)

(assert (=> b!377022 (=> (not res!213248) (not e!229559))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!377022 (= res!213248 (validKeyInArray!0 k0!778))))

(declare-fun b!377023 () Bool)

(declare-fun res!213244 () Bool)

(assert (=> b!377023 (=> (not res!213244) (not e!229559))))

(assert (=> b!377023 (= res!213244 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5819))))

(declare-fun b!377024 () Bool)

(declare-fun e!229561 () Bool)

(assert (=> b!377024 (= e!229561 tp_is_empty!9031)))

(declare-fun b!377025 () Bool)

(declare-fun res!213241 () Bool)

(assert (=> b!377025 (=> (not res!213241) (not e!229559))))

(assert (=> b!377025 (= res!213241 (or (= (select (arr!10457 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10457 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!377026 () Bool)

(assert (=> b!377026 (= e!229564 (and e!229561 mapRes!15111))))

(declare-fun condMapEmpty!15111 () Bool)

(declare-fun mapDefault!15111 () ValueCell!4172)

(assert (=> b!377026 (= condMapEmpty!15111 (= (arr!10458 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4172)) mapDefault!15111)))))

(assert (= (and start!37242 res!213249) b!377016))

(assert (= (and b!377016 res!213247) b!377013))

(assert (= (and b!377013 res!213243) b!377023))

(assert (= (and b!377023 res!213244) b!377019))

(assert (= (and b!377019 res!213245) b!377022))

(assert (= (and b!377022 res!213248) b!377025))

(assert (= (and b!377025 res!213241) b!377017))

(assert (= (and b!377017 res!213250) b!377021))

(assert (= (and b!377021 res!213246) b!377015))

(assert (= (and b!377015 res!213240) b!377020))

(assert (= (and b!377020 (not res!213251)) b!377014))

(assert (= (and b!377014 (not res!213242)) b!377012))

(assert (= (and b!377026 condMapEmpty!15111) mapIsEmpty!15111))

(assert (= (and b!377026 (not condMapEmpty!15111)) mapNonEmpty!15111))

(get-info :version)

(assert (= (and mapNonEmpty!15111 ((_ is ValueCellFull!4172) mapValue!15111)) b!377018))

(assert (= (and b!377026 ((_ is ValueCellFull!4172) mapDefault!15111)) b!377024))

(assert (= start!37242 b!377026))

(declare-fun m!374033 () Bool)

(assert (=> mapNonEmpty!15111 m!374033))

(declare-fun m!374035 () Bool)

(assert (=> b!377025 m!374035))

(declare-fun m!374037 () Bool)

(assert (=> b!377015 m!374037))

(declare-fun m!374039 () Bool)

(assert (=> start!37242 m!374039))

(declare-fun m!374041 () Bool)

(assert (=> start!37242 m!374041))

(declare-fun m!374043 () Bool)

(assert (=> start!37242 m!374043))

(declare-fun m!374045 () Bool)

(assert (=> b!377017 m!374045))

(declare-fun m!374047 () Bool)

(assert (=> b!377013 m!374047))

(declare-fun m!374049 () Bool)

(assert (=> b!377020 m!374049))

(declare-fun m!374051 () Bool)

(assert (=> b!377020 m!374051))

(declare-fun m!374053 () Bool)

(assert (=> b!377020 m!374053))

(declare-fun m!374055 () Bool)

(assert (=> b!377020 m!374055))

(declare-fun m!374057 () Bool)

(assert (=> b!377020 m!374057))

(declare-fun m!374059 () Bool)

(assert (=> b!377020 m!374059))

(declare-fun m!374061 () Bool)

(assert (=> b!377020 m!374061))

(declare-fun m!374063 () Bool)

(assert (=> b!377014 m!374063))

(declare-fun m!374065 () Bool)

(assert (=> b!377014 m!374065))

(declare-fun m!374067 () Bool)

(assert (=> b!377014 m!374067))

(declare-fun m!374069 () Bool)

(assert (=> b!377022 m!374069))

(declare-fun m!374071 () Bool)

(assert (=> b!377012 m!374071))

(declare-fun m!374073 () Bool)

(assert (=> b!377012 m!374073))

(declare-fun m!374075 () Bool)

(assert (=> b!377021 m!374075))

(declare-fun m!374077 () Bool)

(assert (=> b!377021 m!374077))

(declare-fun m!374079 () Bool)

(assert (=> b!377023 m!374079))

(check-sat (not b!377014) (not b!377023) (not b!377022) tp_is_empty!9031 (not b!377017) (not b!377020) (not mapNonEmpty!15111) (not b!377015) (not start!37242) (not b!377012) b_and!15639 (not b!377021) (not b!377013) (not b_next!8383))
(check-sat b_and!15639 (not b_next!8383))
