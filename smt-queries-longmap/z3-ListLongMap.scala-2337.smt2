; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37486 () Bool)

(assert start!37486)

(declare-fun b_free!8613 () Bool)

(declare-fun b_next!8613 () Bool)

(assert (=> start!37486 (= b_free!8613 (not b_next!8613))))

(declare-fun tp!30555 () Bool)

(declare-fun b_and!15855 () Bool)

(assert (=> start!37486 (= tp!30555 b_and!15855)))

(declare-fun mapIsEmpty!15456 () Bool)

(declare-fun mapRes!15456 () Bool)

(assert (=> mapIsEmpty!15456 mapRes!15456))

(declare-fun b!382150 () Bool)

(declare-fun res!217301 () Bool)

(declare-fun e!232260 () Bool)

(assert (=> b!382150 (=> (not res!217301) (not e!232260))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13453 0))(
  ( (V!13454 (val!4675 Int)) )
))
(declare-datatypes ((ValueCell!4287 0))(
  ( (ValueCellFull!4287 (v!6872 V!13453)) (EmptyCell!4287) )
))
(declare-datatypes ((array!22431 0))(
  ( (array!22432 (arr!10684 (Array (_ BitVec 32) ValueCell!4287)) (size!11036 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22431)

(declare-datatypes ((array!22433 0))(
  ( (array!22434 (arr!10685 (Array (_ BitVec 32) (_ BitVec 64))) (size!11037 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22433)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!382150 (= res!217301 (and (= (size!11036 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11037 _keys!658) (size!11036 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!382151 () Bool)

(declare-fun e!232256 () Bool)

(declare-fun e!232262 () Bool)

(assert (=> b!382151 (= e!232256 (and e!232262 mapRes!15456))))

(declare-fun condMapEmpty!15456 () Bool)

(declare-fun mapDefault!15456 () ValueCell!4287)

(assert (=> b!382151 (= condMapEmpty!15456 (= (arr!10684 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4287)) mapDefault!15456)))))

(declare-fun mapNonEmpty!15456 () Bool)

(declare-fun tp!30554 () Bool)

(declare-fun e!232257 () Bool)

(assert (=> mapNonEmpty!15456 (= mapRes!15456 (and tp!30554 e!232257))))

(declare-fun mapValue!15456 () ValueCell!4287)

(declare-fun mapKey!15456 () (_ BitVec 32))

(declare-fun mapRest!15456 () (Array (_ BitVec 32) ValueCell!4287))

(assert (=> mapNonEmpty!15456 (= (arr!10684 _values!506) (store mapRest!15456 mapKey!15456 mapValue!15456))))

(declare-fun res!217300 () Bool)

(assert (=> start!37486 (=> (not res!217300) (not e!232260))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37486 (= res!217300 (validMask!0 mask!970))))

(assert (=> start!37486 e!232260))

(declare-fun array_inv!7866 (array!22431) Bool)

(assert (=> start!37486 (and (array_inv!7866 _values!506) e!232256)))

(assert (=> start!37486 tp!30555))

(assert (=> start!37486 true))

(declare-fun tp_is_empty!9261 () Bool)

(assert (=> start!37486 tp_is_empty!9261))

(declare-fun array_inv!7867 (array!22433) Bool)

(assert (=> start!37486 (array_inv!7867 _keys!658)))

(declare-fun b!382152 () Bool)

(declare-fun e!232261 () Bool)

(declare-fun e!232258 () Bool)

(assert (=> b!382152 (= e!232261 (not e!232258))))

(declare-fun res!217298 () Bool)

(assert (=> b!382152 (=> res!217298 e!232258)))

(declare-fun lt!179236 () Bool)

(assert (=> b!382152 (= res!217298 (or (and (not lt!179236) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!179236) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!179236)))))

(assert (=> b!382152 (= lt!179236 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-datatypes ((tuple2!6284 0))(
  ( (tuple2!6285 (_1!3153 (_ BitVec 64)) (_2!3153 V!13453)) )
))
(declare-datatypes ((List!6114 0))(
  ( (Nil!6111) (Cons!6110 (h!6966 tuple2!6284) (t!11264 List!6114)) )
))
(declare-datatypes ((ListLongMap!5197 0))(
  ( (ListLongMap!5198 (toList!2614 List!6114)) )
))
(declare-fun lt!179238 () ListLongMap!5197)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13453)

(declare-fun minValue!472 () V!13453)

(declare-fun getCurrentListMap!2021 (array!22433 array!22431 (_ BitVec 32) (_ BitVec 32) V!13453 V!13453 (_ BitVec 32) Int) ListLongMap!5197)

(assert (=> b!382152 (= lt!179238 (getCurrentListMap!2021 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179242 () array!22431)

(declare-fun lt!179240 () array!22433)

(declare-fun lt!179243 () ListLongMap!5197)

(assert (=> b!382152 (= lt!179243 (getCurrentListMap!2021 lt!179240 lt!179242 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179239 () ListLongMap!5197)

(declare-fun lt!179237 () ListLongMap!5197)

(assert (=> b!382152 (and (= lt!179239 lt!179237) (= lt!179237 lt!179239))))

(declare-fun v!373 () V!13453)

(declare-fun lt!179244 () ListLongMap!5197)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun +!951 (ListLongMap!5197 tuple2!6284) ListLongMap!5197)

(assert (=> b!382152 (= lt!179237 (+!951 lt!179244 (tuple2!6285 k0!778 v!373)))))

(declare-datatypes ((Unit!11796 0))(
  ( (Unit!11797) )
))
(declare-fun lt!179241 () Unit!11796)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!179 (array!22433 array!22431 (_ BitVec 32) (_ BitVec 32) V!13453 V!13453 (_ BitVec 32) (_ BitVec 64) V!13453 (_ BitVec 32) Int) Unit!11796)

(assert (=> b!382152 (= lt!179241 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!179 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!855 (array!22433 array!22431 (_ BitVec 32) (_ BitVec 32) V!13453 V!13453 (_ BitVec 32) Int) ListLongMap!5197)

(assert (=> b!382152 (= lt!179239 (getCurrentListMapNoExtraKeys!855 lt!179240 lt!179242 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!382152 (= lt!179242 (array!22432 (store (arr!10684 _values!506) i!548 (ValueCellFull!4287 v!373)) (size!11036 _values!506)))))

(assert (=> b!382152 (= lt!179244 (getCurrentListMapNoExtraKeys!855 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!382153 () Bool)

(declare-fun res!217302 () Bool)

(assert (=> b!382153 (=> (not res!217302) (not e!232261))))

(declare-datatypes ((List!6115 0))(
  ( (Nil!6112) (Cons!6111 (h!6967 (_ BitVec 64)) (t!11265 List!6115)) )
))
(declare-fun arrayNoDuplicates!0 (array!22433 (_ BitVec 32) List!6115) Bool)

(assert (=> b!382153 (= res!217302 (arrayNoDuplicates!0 lt!179240 #b00000000000000000000000000000000 Nil!6112))))

(declare-fun b!382154 () Bool)

(declare-fun res!217304 () Bool)

(assert (=> b!382154 (=> (not res!217304) (not e!232260))))

(assert (=> b!382154 (= res!217304 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11037 _keys!658))))))

(declare-fun b!382155 () Bool)

(assert (=> b!382155 (= e!232260 e!232261)))

(declare-fun res!217305 () Bool)

(assert (=> b!382155 (=> (not res!217305) (not e!232261))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22433 (_ BitVec 32)) Bool)

(assert (=> b!382155 (= res!217305 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!179240 mask!970))))

(assert (=> b!382155 (= lt!179240 (array!22434 (store (arr!10685 _keys!658) i!548 k0!778) (size!11037 _keys!658)))))

(declare-fun b!382156 () Bool)

(declare-fun res!217307 () Bool)

(assert (=> b!382156 (=> (not res!217307) (not e!232260))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!382156 (= res!217307 (validKeyInArray!0 k0!778))))

(declare-fun b!382157 () Bool)

(declare-fun res!217306 () Bool)

(assert (=> b!382157 (=> (not res!217306) (not e!232260))))

(assert (=> b!382157 (= res!217306 (or (= (select (arr!10685 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10685 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!382158 () Bool)

(assert (=> b!382158 (= e!232257 tp_is_empty!9261)))

(declare-fun b!382159 () Bool)

(declare-fun res!217299 () Bool)

(assert (=> b!382159 (=> (not res!217299) (not e!232260))))

(assert (=> b!382159 (= res!217299 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!382160 () Bool)

(assert (=> b!382160 (= e!232258 true)))

(assert (=> b!382160 (= lt!179243 lt!179239)))

(declare-fun b!382161 () Bool)

(declare-fun res!217297 () Bool)

(assert (=> b!382161 (=> (not res!217297) (not e!232260))))

(declare-fun arrayContainsKey!0 (array!22433 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!382161 (= res!217297 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!382162 () Bool)

(assert (=> b!382162 (= e!232262 tp_is_empty!9261)))

(declare-fun b!382163 () Bool)

(declare-fun res!217303 () Bool)

(assert (=> b!382163 (=> (not res!217303) (not e!232260))))

(assert (=> b!382163 (= res!217303 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6112))))

(assert (= (and start!37486 res!217300) b!382150))

(assert (= (and b!382150 res!217301) b!382159))

(assert (= (and b!382159 res!217299) b!382163))

(assert (= (and b!382163 res!217303) b!382154))

(assert (= (and b!382154 res!217304) b!382156))

(assert (= (and b!382156 res!217307) b!382157))

(assert (= (and b!382157 res!217306) b!382161))

(assert (= (and b!382161 res!217297) b!382155))

(assert (= (and b!382155 res!217305) b!382153))

(assert (= (and b!382153 res!217302) b!382152))

(assert (= (and b!382152 (not res!217298)) b!382160))

(assert (= (and b!382151 condMapEmpty!15456) mapIsEmpty!15456))

(assert (= (and b!382151 (not condMapEmpty!15456)) mapNonEmpty!15456))

(get-info :version)

(assert (= (and mapNonEmpty!15456 ((_ is ValueCellFull!4287) mapValue!15456)) b!382158))

(assert (= (and b!382151 ((_ is ValueCellFull!4287) mapDefault!15456)) b!382162))

(assert (= start!37486 b!382151))

(declare-fun m!379001 () Bool)

(assert (=> b!382153 m!379001))

(declare-fun m!379003 () Bool)

(assert (=> b!382152 m!379003))

(declare-fun m!379005 () Bool)

(assert (=> b!382152 m!379005))

(declare-fun m!379007 () Bool)

(assert (=> b!382152 m!379007))

(declare-fun m!379009 () Bool)

(assert (=> b!382152 m!379009))

(declare-fun m!379011 () Bool)

(assert (=> b!382152 m!379011))

(declare-fun m!379013 () Bool)

(assert (=> b!382152 m!379013))

(declare-fun m!379015 () Bool)

(assert (=> b!382152 m!379015))

(declare-fun m!379017 () Bool)

(assert (=> mapNonEmpty!15456 m!379017))

(declare-fun m!379019 () Bool)

(assert (=> b!382159 m!379019))

(declare-fun m!379021 () Bool)

(assert (=> start!37486 m!379021))

(declare-fun m!379023 () Bool)

(assert (=> start!37486 m!379023))

(declare-fun m!379025 () Bool)

(assert (=> start!37486 m!379025))

(declare-fun m!379027 () Bool)

(assert (=> b!382157 m!379027))

(declare-fun m!379029 () Bool)

(assert (=> b!382155 m!379029))

(declare-fun m!379031 () Bool)

(assert (=> b!382155 m!379031))

(declare-fun m!379033 () Bool)

(assert (=> b!382161 m!379033))

(declare-fun m!379035 () Bool)

(assert (=> b!382163 m!379035))

(declare-fun m!379037 () Bool)

(assert (=> b!382156 m!379037))

(check-sat (not mapNonEmpty!15456) b_and!15855 (not b!382152) (not b!382153) (not b!382163) tp_is_empty!9261 (not b!382161) (not b!382155) (not b!382156) (not b!382159) (not start!37486) (not b_next!8613))
(check-sat b_and!15855 (not b_next!8613))
