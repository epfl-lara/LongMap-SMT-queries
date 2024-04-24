; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37428 () Bool)

(assert start!37428)

(declare-fun b_free!8569 () Bool)

(declare-fun b_next!8569 () Bool)

(assert (=> start!37428 (= b_free!8569 (not b_next!8569))))

(declare-fun tp!30422 () Bool)

(declare-fun b_and!15825 () Bool)

(assert (=> start!37428 (= tp!30422 b_and!15825)))

(declare-fun mapIsEmpty!15390 () Bool)

(declare-fun mapRes!15390 () Bool)

(assert (=> mapIsEmpty!15390 mapRes!15390))

(declare-fun b!381178 () Bool)

(declare-fun res!216578 () Bool)

(declare-fun e!231768 () Bool)

(assert (=> b!381178 (=> (not res!216578) (not e!231768))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13395 0))(
  ( (V!13396 (val!4653 Int)) )
))
(declare-datatypes ((ValueCell!4265 0))(
  ( (ValueCellFull!4265 (v!6851 V!13395)) (EmptyCell!4265) )
))
(declare-datatypes ((array!22334 0))(
  ( (array!22335 (arr!10635 (Array (_ BitVec 32) ValueCell!4265)) (size!10987 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22334)

(declare-datatypes ((array!22336 0))(
  ( (array!22337 (arr!10636 (Array (_ BitVec 32) (_ BitVec 64))) (size!10988 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22336)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!381178 (= res!216578 (and (= (size!10987 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10988 _keys!658) (size!10987 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!381179 () Bool)

(declare-fun res!216573 () Bool)

(assert (=> b!381179 (=> (not res!216573) (not e!231768))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!381179 (= res!216573 (validKeyInArray!0 k0!778))))

(declare-fun b!381180 () Bool)

(declare-fun res!216568 () Bool)

(assert (=> b!381180 (=> (not res!216568) (not e!231768))))

(declare-datatypes ((List!5960 0))(
  ( (Nil!5957) (Cons!5956 (h!6812 (_ BitVec 64)) (t!11102 List!5960)) )
))
(declare-fun arrayNoDuplicates!0 (array!22336 (_ BitVec 32) List!5960) Bool)

(assert (=> b!381180 (= res!216568 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5957))))

(declare-fun b!381181 () Bool)

(declare-fun res!216575 () Bool)

(declare-fun e!231764 () Bool)

(assert (=> b!381181 (=> (not res!216575) (not e!231764))))

(declare-fun lt!178666 () array!22336)

(assert (=> b!381181 (= res!216575 (arrayNoDuplicates!0 lt!178666 #b00000000000000000000000000000000 Nil!5957))))

(declare-fun b!381182 () Bool)

(declare-fun e!231762 () Bool)

(declare-fun e!231765 () Bool)

(assert (=> b!381182 (= e!231762 (and e!231765 mapRes!15390))))

(declare-fun condMapEmpty!15390 () Bool)

(declare-fun mapDefault!15390 () ValueCell!4265)

(assert (=> b!381182 (= condMapEmpty!15390 (= (arr!10635 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4265)) mapDefault!15390)))))

(declare-fun mapNonEmpty!15390 () Bool)

(declare-fun tp!30423 () Bool)

(declare-fun e!231763 () Bool)

(assert (=> mapNonEmpty!15390 (= mapRes!15390 (and tp!30423 e!231763))))

(declare-fun mapValue!15390 () ValueCell!4265)

(declare-fun mapKey!15390 () (_ BitVec 32))

(declare-fun mapRest!15390 () (Array (_ BitVec 32) ValueCell!4265))

(assert (=> mapNonEmpty!15390 (= (arr!10635 _values!506) (store mapRest!15390 mapKey!15390 mapValue!15390))))

(declare-fun b!381183 () Bool)

(declare-fun res!216574 () Bool)

(assert (=> b!381183 (=> (not res!216574) (not e!231768))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!381183 (= res!216574 (or (= (select (arr!10636 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10636 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!381184 () Bool)

(declare-fun e!231767 () Bool)

(assert (=> b!381184 (= e!231764 (not e!231767))))

(declare-fun res!216576 () Bool)

(assert (=> b!381184 (=> res!216576 e!231767)))

(declare-fun lt!178661 () Bool)

(assert (=> b!381184 (= res!216576 (or (and (not lt!178661) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!178661) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!178661)))))

(assert (=> b!381184 (= lt!178661 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13395)

(declare-fun minValue!472 () V!13395)

(declare-datatypes ((tuple2!6124 0))(
  ( (tuple2!6125 (_1!3073 (_ BitVec 64)) (_2!3073 V!13395)) )
))
(declare-datatypes ((List!5961 0))(
  ( (Nil!5958) (Cons!5957 (h!6813 tuple2!6124) (t!11103 List!5961)) )
))
(declare-datatypes ((ListLongMap!5039 0))(
  ( (ListLongMap!5040 (toList!2535 List!5961)) )
))
(declare-fun lt!178662 () ListLongMap!5039)

(declare-fun getCurrentListMap!1973 (array!22336 array!22334 (_ BitVec 32) (_ BitVec 32) V!13395 V!13395 (_ BitVec 32) Int) ListLongMap!5039)

(assert (=> b!381184 (= lt!178662 (getCurrentListMap!1973 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178668 () array!22334)

(declare-fun lt!178664 () ListLongMap!5039)

(assert (=> b!381184 (= lt!178664 (getCurrentListMap!1973 lt!178666 lt!178668 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178669 () ListLongMap!5039)

(declare-fun lt!178665 () ListLongMap!5039)

(assert (=> b!381184 (and (= lt!178669 lt!178665) (= lt!178665 lt!178669))))

(declare-fun v!373 () V!13395)

(declare-fun lt!178667 () ListLongMap!5039)

(declare-fun +!931 (ListLongMap!5039 tuple2!6124) ListLongMap!5039)

(assert (=> b!381184 (= lt!178665 (+!931 lt!178667 (tuple2!6125 k0!778 v!373)))))

(declare-datatypes ((Unit!11741 0))(
  ( (Unit!11742) )
))
(declare-fun lt!178663 () Unit!11741)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!160 (array!22336 array!22334 (_ BitVec 32) (_ BitVec 32) V!13395 V!13395 (_ BitVec 32) (_ BitVec 64) V!13395 (_ BitVec 32) Int) Unit!11741)

(assert (=> b!381184 (= lt!178663 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!160 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!820 (array!22336 array!22334 (_ BitVec 32) (_ BitVec 32) V!13395 V!13395 (_ BitVec 32) Int) ListLongMap!5039)

(assert (=> b!381184 (= lt!178669 (getCurrentListMapNoExtraKeys!820 lt!178666 lt!178668 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!381184 (= lt!178668 (array!22335 (store (arr!10635 _values!506) i!548 (ValueCellFull!4265 v!373)) (size!10987 _values!506)))))

(assert (=> b!381184 (= lt!178667 (getCurrentListMapNoExtraKeys!820 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!381185 () Bool)

(assert (=> b!381185 (= e!231768 e!231764)))

(declare-fun res!216572 () Bool)

(assert (=> b!381185 (=> (not res!216572) (not e!231764))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22336 (_ BitVec 32)) Bool)

(assert (=> b!381185 (= res!216572 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!178666 mask!970))))

(assert (=> b!381185 (= lt!178666 (array!22337 (store (arr!10636 _keys!658) i!548 k0!778) (size!10988 _keys!658)))))

(declare-fun b!381186 () Bool)

(declare-fun tp_is_empty!9217 () Bool)

(assert (=> b!381186 (= e!231763 tp_is_empty!9217)))

(declare-fun b!381177 () Bool)

(assert (=> b!381177 (= e!231767 true)))

(assert (=> b!381177 (= lt!178664 lt!178669)))

(declare-fun res!216577 () Bool)

(assert (=> start!37428 (=> (not res!216577) (not e!231768))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37428 (= res!216577 (validMask!0 mask!970))))

(assert (=> start!37428 e!231768))

(declare-fun array_inv!7874 (array!22334) Bool)

(assert (=> start!37428 (and (array_inv!7874 _values!506) e!231762)))

(assert (=> start!37428 tp!30422))

(assert (=> start!37428 true))

(assert (=> start!37428 tp_is_empty!9217))

(declare-fun array_inv!7875 (array!22336) Bool)

(assert (=> start!37428 (array_inv!7875 _keys!658)))

(declare-fun b!381187 () Bool)

(assert (=> b!381187 (= e!231765 tp_is_empty!9217)))

(declare-fun b!381188 () Bool)

(declare-fun res!216569 () Bool)

(assert (=> b!381188 (=> (not res!216569) (not e!231768))))

(assert (=> b!381188 (= res!216569 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!381189 () Bool)

(declare-fun res!216570 () Bool)

(assert (=> b!381189 (=> (not res!216570) (not e!231768))))

(assert (=> b!381189 (= res!216570 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10988 _keys!658))))))

(declare-fun b!381190 () Bool)

(declare-fun res!216571 () Bool)

(assert (=> b!381190 (=> (not res!216571) (not e!231768))))

(declare-fun arrayContainsKey!0 (array!22336 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!381190 (= res!216571 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(assert (= (and start!37428 res!216577) b!381178))

(assert (= (and b!381178 res!216578) b!381188))

(assert (= (and b!381188 res!216569) b!381180))

(assert (= (and b!381180 res!216568) b!381189))

(assert (= (and b!381189 res!216570) b!381179))

(assert (= (and b!381179 res!216573) b!381183))

(assert (= (and b!381183 res!216574) b!381190))

(assert (= (and b!381190 res!216571) b!381185))

(assert (= (and b!381185 res!216572) b!381181))

(assert (= (and b!381181 res!216575) b!381184))

(assert (= (and b!381184 (not res!216576)) b!381177))

(assert (= (and b!381182 condMapEmpty!15390) mapIsEmpty!15390))

(assert (= (and b!381182 (not condMapEmpty!15390)) mapNonEmpty!15390))

(get-info :version)

(assert (= (and mapNonEmpty!15390 ((_ is ValueCellFull!4265) mapValue!15390)) b!381186))

(assert (= (and b!381182 ((_ is ValueCellFull!4265) mapDefault!15390)) b!381187))

(assert (= start!37428 b!381182))

(declare-fun m!378395 () Bool)

(assert (=> b!381184 m!378395))

(declare-fun m!378397 () Bool)

(assert (=> b!381184 m!378397))

(declare-fun m!378399 () Bool)

(assert (=> b!381184 m!378399))

(declare-fun m!378401 () Bool)

(assert (=> b!381184 m!378401))

(declare-fun m!378403 () Bool)

(assert (=> b!381184 m!378403))

(declare-fun m!378405 () Bool)

(assert (=> b!381184 m!378405))

(declare-fun m!378407 () Bool)

(assert (=> b!381184 m!378407))

(declare-fun m!378409 () Bool)

(assert (=> b!381185 m!378409))

(declare-fun m!378411 () Bool)

(assert (=> b!381185 m!378411))

(declare-fun m!378413 () Bool)

(assert (=> b!381179 m!378413))

(declare-fun m!378415 () Bool)

(assert (=> b!381180 m!378415))

(declare-fun m!378417 () Bool)

(assert (=> b!381181 m!378417))

(declare-fun m!378419 () Bool)

(assert (=> b!381188 m!378419))

(declare-fun m!378421 () Bool)

(assert (=> start!37428 m!378421))

(declare-fun m!378423 () Bool)

(assert (=> start!37428 m!378423))

(declare-fun m!378425 () Bool)

(assert (=> start!37428 m!378425))

(declare-fun m!378427 () Bool)

(assert (=> mapNonEmpty!15390 m!378427))

(declare-fun m!378429 () Bool)

(assert (=> b!381190 m!378429))

(declare-fun m!378431 () Bool)

(assert (=> b!381183 m!378431))

(check-sat (not b!381179) (not b!381188) (not b_next!8569) (not b!381185) (not b!381180) (not b!381184) b_and!15825 (not mapNonEmpty!15390) (not b!381190) (not b!381181) (not start!37428) tp_is_empty!9217)
(check-sat b_and!15825 (not b_next!8569))
