; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37540 () Bool)

(assert start!37540)

(declare-fun b_free!8667 () Bool)

(declare-fun b_next!8667 () Bool)

(assert (=> start!37540 (= b_free!8667 (not b_next!8667))))

(declare-fun tp!30716 () Bool)

(declare-fun b_and!15909 () Bool)

(assert (=> start!37540 (= tp!30716 b_and!15909)))

(declare-fun mapNonEmpty!15537 () Bool)

(declare-fun mapRes!15537 () Bool)

(declare-fun tp!30717 () Bool)

(declare-fun e!232828 () Bool)

(assert (=> mapNonEmpty!15537 (= mapRes!15537 (and tp!30717 e!232828))))

(declare-datatypes ((V!13525 0))(
  ( (V!13526 (val!4702 Int)) )
))
(declare-datatypes ((ValueCell!4314 0))(
  ( (ValueCellFull!4314 (v!6899 V!13525)) (EmptyCell!4314) )
))
(declare-datatypes ((array!22537 0))(
  ( (array!22538 (arr!10737 (Array (_ BitVec 32) ValueCell!4314)) (size!11089 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22537)

(declare-fun mapKey!15537 () (_ BitVec 32))

(declare-fun mapRest!15537 () (Array (_ BitVec 32) ValueCell!4314))

(declare-fun mapValue!15537 () ValueCell!4314)

(assert (=> mapNonEmpty!15537 (= (arr!10737 _values!506) (store mapRest!15537 mapKey!15537 mapValue!15537))))

(declare-fun b!383284 () Bool)

(declare-fun tp_is_empty!9315 () Bool)

(assert (=> b!383284 (= e!232828 tp_is_empty!9315)))

(declare-fun b!383285 () Bool)

(declare-fun e!232824 () Bool)

(assert (=> b!383285 (= e!232824 true)))

(declare-datatypes ((tuple2!6324 0))(
  ( (tuple2!6325 (_1!3173 (_ BitVec 64)) (_2!3173 V!13525)) )
))
(declare-datatypes ((List!6158 0))(
  ( (Nil!6155) (Cons!6154 (h!7010 tuple2!6324) (t!11308 List!6158)) )
))
(declare-datatypes ((ListLongMap!5237 0))(
  ( (ListLongMap!5238 (toList!2634 List!6158)) )
))
(declare-fun lt!180002 () ListLongMap!5237)

(declare-fun lt!179998 () ListLongMap!5237)

(declare-fun lt!179994 () tuple2!6324)

(declare-fun +!969 (ListLongMap!5237 tuple2!6324) ListLongMap!5237)

(assert (=> b!383285 (= lt!180002 (+!969 lt!179998 lt!179994))))

(declare-fun lt!180003 () ListLongMap!5237)

(declare-fun lt!180000 () ListLongMap!5237)

(assert (=> b!383285 (= lt!180003 lt!180000)))

(declare-fun b!383286 () Bool)

(declare-fun res!218194 () Bool)

(declare-fun e!232827 () Bool)

(assert (=> b!383286 (=> (not res!218194) (not e!232827))))

(declare-datatypes ((array!22539 0))(
  ( (array!22540 (arr!10738 (Array (_ BitVec 32) (_ BitVec 64))) (size!11090 (_ BitVec 32))) )
))
(declare-fun lt!180001 () array!22539)

(declare-datatypes ((List!6159 0))(
  ( (Nil!6156) (Cons!6155 (h!7011 (_ BitVec 64)) (t!11309 List!6159)) )
))
(declare-fun arrayNoDuplicates!0 (array!22539 (_ BitVec 32) List!6159) Bool)

(assert (=> b!383286 (= res!218194 (arrayNoDuplicates!0 lt!180001 #b00000000000000000000000000000000 Nil!6156))))

(declare-fun b!383287 () Bool)

(declare-fun res!218198 () Bool)

(declare-fun e!232825 () Bool)

(assert (=> b!383287 (=> (not res!218198) (not e!232825))))

(declare-fun _keys!658 () array!22539)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22539 (_ BitVec 32)) Bool)

(assert (=> b!383287 (= res!218198 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapIsEmpty!15537 () Bool)

(assert (=> mapIsEmpty!15537 mapRes!15537))

(declare-fun b!383288 () Bool)

(declare-fun res!218196 () Bool)

(assert (=> b!383288 (=> (not res!218196) (not e!232825))))

(assert (=> b!383288 (= res!218196 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6156))))

(declare-fun b!383289 () Bool)

(assert (=> b!383289 (= e!232825 e!232827)))

(declare-fun res!218188 () Bool)

(assert (=> b!383289 (=> (not res!218188) (not e!232827))))

(assert (=> b!383289 (= res!218188 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!180001 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!383289 (= lt!180001 (array!22540 (store (arr!10738 _keys!658) i!548 k0!778) (size!11090 _keys!658)))))

(declare-fun b!383290 () Bool)

(declare-fun e!232829 () Bool)

(assert (=> b!383290 (= e!232829 tp_is_empty!9315)))

(declare-fun b!383291 () Bool)

(declare-fun res!218190 () Bool)

(assert (=> b!383291 (=> (not res!218190) (not e!232825))))

(assert (=> b!383291 (= res!218190 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11090 _keys!658))))))

(declare-fun b!383292 () Bool)

(declare-fun res!218192 () Bool)

(assert (=> b!383292 (=> (not res!218192) (not e!232825))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!383292 (= res!218192 (and (= (size!11089 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11090 _keys!658) (size!11089 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun res!218197 () Bool)

(assert (=> start!37540 (=> (not res!218197) (not e!232825))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37540 (= res!218197 (validMask!0 mask!970))))

(assert (=> start!37540 e!232825))

(declare-fun e!232823 () Bool)

(declare-fun array_inv!7904 (array!22537) Bool)

(assert (=> start!37540 (and (array_inv!7904 _values!506) e!232823)))

(assert (=> start!37540 tp!30716))

(assert (=> start!37540 true))

(assert (=> start!37540 tp_is_empty!9315))

(declare-fun array_inv!7905 (array!22539) Bool)

(assert (=> start!37540 (array_inv!7905 _keys!658)))

(declare-fun b!383293 () Bool)

(declare-fun res!218195 () Bool)

(assert (=> b!383293 (=> (not res!218195) (not e!232825))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!383293 (= res!218195 (validKeyInArray!0 k0!778))))

(declare-fun b!383294 () Bool)

(declare-fun res!218191 () Bool)

(assert (=> b!383294 (=> (not res!218191) (not e!232825))))

(assert (=> b!383294 (= res!218191 (or (= (select (arr!10738 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10738 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!383295 () Bool)

(declare-fun res!218193 () Bool)

(assert (=> b!383295 (=> (not res!218193) (not e!232825))))

(declare-fun arrayContainsKey!0 (array!22539 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!383295 (= res!218193 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!383296 () Bool)

(assert (=> b!383296 (= e!232827 (not e!232824))))

(declare-fun res!218189 () Bool)

(assert (=> b!383296 (=> res!218189 e!232824)))

(declare-fun lt!179999 () Bool)

(assert (=> b!383296 (= res!218189 (or (and (not lt!179999) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!179999) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!179999)))))

(assert (=> b!383296 (= lt!179999 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13525)

(declare-fun minValue!472 () V!13525)

(declare-fun getCurrentListMap!2039 (array!22539 array!22537 (_ BitVec 32) (_ BitVec 32) V!13525 V!13525 (_ BitVec 32) Int) ListLongMap!5237)

(assert (=> b!383296 (= lt!179998 (getCurrentListMap!2039 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179996 () array!22537)

(assert (=> b!383296 (= lt!180003 (getCurrentListMap!2039 lt!180001 lt!179996 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179993 () ListLongMap!5237)

(assert (=> b!383296 (and (= lt!180000 lt!179993) (= lt!179993 lt!180000))))

(declare-fun lt!179997 () ListLongMap!5237)

(assert (=> b!383296 (= lt!179993 (+!969 lt!179997 lt!179994))))

(declare-fun v!373 () V!13525)

(assert (=> b!383296 (= lt!179994 (tuple2!6325 k0!778 v!373))))

(declare-datatypes ((Unit!11832 0))(
  ( (Unit!11833) )
))
(declare-fun lt!179995 () Unit!11832)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!197 (array!22539 array!22537 (_ BitVec 32) (_ BitVec 32) V!13525 V!13525 (_ BitVec 32) (_ BitVec 64) V!13525 (_ BitVec 32) Int) Unit!11832)

(assert (=> b!383296 (= lt!179995 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!197 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!873 (array!22539 array!22537 (_ BitVec 32) (_ BitVec 32) V!13525 V!13525 (_ BitVec 32) Int) ListLongMap!5237)

(assert (=> b!383296 (= lt!180000 (getCurrentListMapNoExtraKeys!873 lt!180001 lt!179996 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!383296 (= lt!179996 (array!22538 (store (arr!10737 _values!506) i!548 (ValueCellFull!4314 v!373)) (size!11089 _values!506)))))

(assert (=> b!383296 (= lt!179997 (getCurrentListMapNoExtraKeys!873 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!383297 () Bool)

(assert (=> b!383297 (= e!232823 (and e!232829 mapRes!15537))))

(declare-fun condMapEmpty!15537 () Bool)

(declare-fun mapDefault!15537 () ValueCell!4314)

(assert (=> b!383297 (= condMapEmpty!15537 (= (arr!10737 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4314)) mapDefault!15537)))))

(assert (= (and start!37540 res!218197) b!383292))

(assert (= (and b!383292 res!218192) b!383287))

(assert (= (and b!383287 res!218198) b!383288))

(assert (= (and b!383288 res!218196) b!383291))

(assert (= (and b!383291 res!218190) b!383293))

(assert (= (and b!383293 res!218195) b!383294))

(assert (= (and b!383294 res!218191) b!383295))

(assert (= (and b!383295 res!218193) b!383289))

(assert (= (and b!383289 res!218188) b!383286))

(assert (= (and b!383286 res!218194) b!383296))

(assert (= (and b!383296 (not res!218189)) b!383285))

(assert (= (and b!383297 condMapEmpty!15537) mapIsEmpty!15537))

(assert (= (and b!383297 (not condMapEmpty!15537)) mapNonEmpty!15537))

(get-info :version)

(assert (= (and mapNonEmpty!15537 ((_ is ValueCellFull!4314) mapValue!15537)) b!383284))

(assert (= (and b!383297 ((_ is ValueCellFull!4314) mapDefault!15537)) b!383290))

(assert (= start!37540 b!383297))

(declare-fun m!380035 () Bool)

(assert (=> b!383288 m!380035))

(declare-fun m!380037 () Bool)

(assert (=> b!383296 m!380037))

(declare-fun m!380039 () Bool)

(assert (=> b!383296 m!380039))

(declare-fun m!380041 () Bool)

(assert (=> b!383296 m!380041))

(declare-fun m!380043 () Bool)

(assert (=> b!383296 m!380043))

(declare-fun m!380045 () Bool)

(assert (=> b!383296 m!380045))

(declare-fun m!380047 () Bool)

(assert (=> b!383296 m!380047))

(declare-fun m!380049 () Bool)

(assert (=> b!383296 m!380049))

(declare-fun m!380051 () Bool)

(assert (=> b!383289 m!380051))

(declare-fun m!380053 () Bool)

(assert (=> b!383289 m!380053))

(declare-fun m!380055 () Bool)

(assert (=> b!383287 m!380055))

(declare-fun m!380057 () Bool)

(assert (=> mapNonEmpty!15537 m!380057))

(declare-fun m!380059 () Bool)

(assert (=> b!383286 m!380059))

(declare-fun m!380061 () Bool)

(assert (=> b!383295 m!380061))

(declare-fun m!380063 () Bool)

(assert (=> b!383293 m!380063))

(declare-fun m!380065 () Bool)

(assert (=> b!383294 m!380065))

(declare-fun m!380067 () Bool)

(assert (=> start!37540 m!380067))

(declare-fun m!380069 () Bool)

(assert (=> start!37540 m!380069))

(declare-fun m!380071 () Bool)

(assert (=> start!37540 m!380071))

(declare-fun m!380073 () Bool)

(assert (=> b!383285 m!380073))

(check-sat b_and!15909 (not b!383296) (not b!383293) (not b_next!8667) (not b!383287) (not b!383295) (not b!383288) tp_is_empty!9315 (not start!37540) (not b!383286) (not b!383285) (not b!383289) (not mapNonEmpty!15537))
(check-sat b_and!15909 (not b_next!8667))
