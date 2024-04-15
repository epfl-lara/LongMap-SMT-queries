; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37428 () Bool)

(assert start!37428)

(declare-fun b_free!8569 () Bool)

(declare-fun b_next!8569 () Bool)

(assert (=> start!37428 (= b_free!8569 (not b_next!8569))))

(declare-fun tp!30423 () Bool)

(declare-fun b_and!15785 () Bool)

(assert (=> start!37428 (= tp!30423 b_and!15785)))

(declare-fun b!380955 () Bool)

(declare-fun res!216444 () Bool)

(declare-fun e!231621 () Bool)

(assert (=> b!380955 (=> (not res!216444) (not e!231621))))

(declare-datatypes ((array!22331 0))(
  ( (array!22332 (arr!10634 (Array (_ BitVec 32) (_ BitVec 64))) (size!10987 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22331)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!380955 (= res!216444 (or (= (select (arr!10634 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10634 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!380956 () Bool)

(declare-fun e!231625 () Bool)

(assert (=> b!380956 (= e!231621 e!231625)))

(declare-fun res!216442 () Bool)

(assert (=> b!380956 (=> (not res!216442) (not e!231625))))

(declare-fun lt!178413 () array!22331)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22331 (_ BitVec 32)) Bool)

(assert (=> b!380956 (= res!216442 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!178413 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!380956 (= lt!178413 (array!22332 (store (arr!10634 _keys!658) i!548 k0!778) (size!10987 _keys!658)))))

(declare-fun mapIsEmpty!15390 () Bool)

(declare-fun mapRes!15390 () Bool)

(assert (=> mapIsEmpty!15390 mapRes!15390))

(declare-fun b!380957 () Bool)

(declare-fun res!216447 () Bool)

(assert (=> b!380957 (=> (not res!216447) (not e!231625))))

(declare-datatypes ((List!6044 0))(
  ( (Nil!6041) (Cons!6040 (h!6896 (_ BitVec 64)) (t!11185 List!6044)) )
))
(declare-fun arrayNoDuplicates!0 (array!22331 (_ BitVec 32) List!6044) Bool)

(assert (=> b!380957 (= res!216447 (arrayNoDuplicates!0 lt!178413 #b00000000000000000000000000000000 Nil!6041))))

(declare-fun b!380959 () Bool)

(declare-fun e!231622 () Bool)

(assert (=> b!380959 (= e!231622 true)))

(declare-datatypes ((V!13395 0))(
  ( (V!13396 (val!4653 Int)) )
))
(declare-datatypes ((tuple2!6216 0))(
  ( (tuple2!6217 (_1!3119 (_ BitVec 64)) (_2!3119 V!13395)) )
))
(declare-datatypes ((List!6045 0))(
  ( (Nil!6042) (Cons!6041 (h!6897 tuple2!6216) (t!11186 List!6045)) )
))
(declare-datatypes ((ListLongMap!5119 0))(
  ( (ListLongMap!5120 (toList!2575 List!6045)) )
))
(declare-fun lt!178412 () ListLongMap!5119)

(declare-fun lt!178409 () ListLongMap!5119)

(assert (=> b!380959 (= lt!178412 lt!178409)))

(declare-fun b!380960 () Bool)

(declare-fun e!231624 () Bool)

(declare-fun e!231623 () Bool)

(assert (=> b!380960 (= e!231624 (and e!231623 mapRes!15390))))

(declare-fun condMapEmpty!15390 () Bool)

(declare-datatypes ((ValueCell!4265 0))(
  ( (ValueCellFull!4265 (v!6844 V!13395)) (EmptyCell!4265) )
))
(declare-datatypes ((array!22333 0))(
  ( (array!22334 (arr!10635 (Array (_ BitVec 32) ValueCell!4265)) (size!10988 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22333)

(declare-fun mapDefault!15390 () ValueCell!4265)

(assert (=> b!380960 (= condMapEmpty!15390 (= (arr!10635 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4265)) mapDefault!15390)))))

(declare-fun b!380961 () Bool)

(declare-fun res!216448 () Bool)

(assert (=> b!380961 (=> (not res!216448) (not e!231621))))

(assert (=> b!380961 (= res!216448 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10987 _keys!658))))))

(declare-fun b!380962 () Bool)

(declare-fun e!231620 () Bool)

(declare-fun tp_is_empty!9217 () Bool)

(assert (=> b!380962 (= e!231620 tp_is_empty!9217)))

(declare-fun b!380963 () Bool)

(assert (=> b!380963 (= e!231623 tp_is_empty!9217)))

(declare-fun mapNonEmpty!15390 () Bool)

(declare-fun tp!30422 () Bool)

(assert (=> mapNonEmpty!15390 (= mapRes!15390 (and tp!30422 e!231620))))

(declare-fun mapValue!15390 () ValueCell!4265)

(declare-fun mapKey!15390 () (_ BitVec 32))

(declare-fun mapRest!15390 () (Array (_ BitVec 32) ValueCell!4265))

(assert (=> mapNonEmpty!15390 (= (arr!10635 _values!506) (store mapRest!15390 mapKey!15390 mapValue!15390))))

(declare-fun b!380964 () Bool)

(declare-fun res!216443 () Bool)

(assert (=> b!380964 (=> (not res!216443) (not e!231621))))

(declare-fun arrayContainsKey!0 (array!22331 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!380964 (= res!216443 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!380965 () Bool)

(assert (=> b!380965 (= e!231625 (not e!231622))))

(declare-fun res!216446 () Bool)

(assert (=> b!380965 (=> res!216446 e!231622)))

(declare-fun lt!178410 () Bool)

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!380965 (= res!216446 (or (and (not lt!178410) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!178410) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!178410)))))

(assert (=> b!380965 (= lt!178410 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun lt!178408 () ListLongMap!5119)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13395)

(declare-fun minValue!472 () V!13395)

(declare-fun getCurrentListMap!1966 (array!22331 array!22333 (_ BitVec 32) (_ BitVec 32) V!13395 V!13395 (_ BitVec 32) Int) ListLongMap!5119)

(assert (=> b!380965 (= lt!178408 (getCurrentListMap!1966 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178416 () array!22333)

(assert (=> b!380965 (= lt!178412 (getCurrentListMap!1966 lt!178413 lt!178416 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178411 () ListLongMap!5119)

(assert (=> b!380965 (and (= lt!178409 lt!178411) (= lt!178411 lt!178409))))

(declare-fun v!373 () V!13395)

(declare-fun lt!178415 () ListLongMap!5119)

(declare-fun +!940 (ListLongMap!5119 tuple2!6216) ListLongMap!5119)

(assert (=> b!380965 (= lt!178411 (+!940 lt!178415 (tuple2!6217 k0!778 v!373)))))

(declare-datatypes ((Unit!11738 0))(
  ( (Unit!11739) )
))
(declare-fun lt!178414 () Unit!11738)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!159 (array!22331 array!22333 (_ BitVec 32) (_ BitVec 32) V!13395 V!13395 (_ BitVec 32) (_ BitVec 64) V!13395 (_ BitVec 32) Int) Unit!11738)

(assert (=> b!380965 (= lt!178414 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!159 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!831 (array!22331 array!22333 (_ BitVec 32) (_ BitVec 32) V!13395 V!13395 (_ BitVec 32) Int) ListLongMap!5119)

(assert (=> b!380965 (= lt!178409 (getCurrentListMapNoExtraKeys!831 lt!178413 lt!178416 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!380965 (= lt!178416 (array!22334 (store (arr!10635 _values!506) i!548 (ValueCellFull!4265 v!373)) (size!10988 _values!506)))))

(assert (=> b!380965 (= lt!178415 (getCurrentListMapNoExtraKeys!831 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!380966 () Bool)

(declare-fun res!216451 () Bool)

(assert (=> b!380966 (=> (not res!216451) (not e!231621))))

(assert (=> b!380966 (= res!216451 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6041))))

(declare-fun b!380958 () Bool)

(declare-fun res!216449 () Bool)

(assert (=> b!380958 (=> (not res!216449) (not e!231621))))

(assert (=> b!380958 (= res!216449 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun res!216450 () Bool)

(assert (=> start!37428 (=> (not res!216450) (not e!231621))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37428 (= res!216450 (validMask!0 mask!970))))

(assert (=> start!37428 e!231621))

(declare-fun array_inv!7832 (array!22333) Bool)

(assert (=> start!37428 (and (array_inv!7832 _values!506) e!231624)))

(assert (=> start!37428 tp!30423))

(assert (=> start!37428 true))

(assert (=> start!37428 tp_is_empty!9217))

(declare-fun array_inv!7833 (array!22331) Bool)

(assert (=> start!37428 (array_inv!7833 _keys!658)))

(declare-fun b!380967 () Bool)

(declare-fun res!216452 () Bool)

(assert (=> b!380967 (=> (not res!216452) (not e!231621))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!380967 (= res!216452 (validKeyInArray!0 k0!778))))

(declare-fun b!380968 () Bool)

(declare-fun res!216445 () Bool)

(assert (=> b!380968 (=> (not res!216445) (not e!231621))))

(assert (=> b!380968 (= res!216445 (and (= (size!10988 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10987 _keys!658) (size!10988 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(assert (= (and start!37428 res!216450) b!380968))

(assert (= (and b!380968 res!216445) b!380958))

(assert (= (and b!380958 res!216449) b!380966))

(assert (= (and b!380966 res!216451) b!380961))

(assert (= (and b!380961 res!216448) b!380967))

(assert (= (and b!380967 res!216452) b!380955))

(assert (= (and b!380955 res!216444) b!380964))

(assert (= (and b!380964 res!216443) b!380956))

(assert (= (and b!380956 res!216442) b!380957))

(assert (= (and b!380957 res!216447) b!380965))

(assert (= (and b!380965 (not res!216446)) b!380959))

(assert (= (and b!380960 condMapEmpty!15390) mapIsEmpty!15390))

(assert (= (and b!380960 (not condMapEmpty!15390)) mapNonEmpty!15390))

(get-info :version)

(assert (= (and mapNonEmpty!15390 ((_ is ValueCellFull!4265) mapValue!15390)) b!380962))

(assert (= (and b!380960 ((_ is ValueCellFull!4265) mapDefault!15390)) b!380963))

(assert (= start!37428 b!380960))

(declare-fun m!377441 () Bool)

(assert (=> b!380955 m!377441))

(declare-fun m!377443 () Bool)

(assert (=> mapNonEmpty!15390 m!377443))

(declare-fun m!377445 () Bool)

(assert (=> b!380964 m!377445))

(declare-fun m!377447 () Bool)

(assert (=> b!380958 m!377447))

(declare-fun m!377449 () Bool)

(assert (=> b!380967 m!377449))

(declare-fun m!377451 () Bool)

(assert (=> b!380965 m!377451))

(declare-fun m!377453 () Bool)

(assert (=> b!380965 m!377453))

(declare-fun m!377455 () Bool)

(assert (=> b!380965 m!377455))

(declare-fun m!377457 () Bool)

(assert (=> b!380965 m!377457))

(declare-fun m!377459 () Bool)

(assert (=> b!380965 m!377459))

(declare-fun m!377461 () Bool)

(assert (=> b!380965 m!377461))

(declare-fun m!377463 () Bool)

(assert (=> b!380965 m!377463))

(declare-fun m!377465 () Bool)

(assert (=> b!380956 m!377465))

(declare-fun m!377467 () Bool)

(assert (=> b!380956 m!377467))

(declare-fun m!377469 () Bool)

(assert (=> b!380966 m!377469))

(declare-fun m!377471 () Bool)

(assert (=> start!37428 m!377471))

(declare-fun m!377473 () Bool)

(assert (=> start!37428 m!377473))

(declare-fun m!377475 () Bool)

(assert (=> start!37428 m!377475))

(declare-fun m!377477 () Bool)

(assert (=> b!380957 m!377477))

(check-sat (not b!380956) (not b_next!8569) (not b!380957) tp_is_empty!9217 (not mapNonEmpty!15390) b_and!15785 (not b!380966) (not b!380967) (not b!380958) (not b!380964) (not start!37428) (not b!380965))
(check-sat b_and!15785 (not b_next!8569))
