; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37968 () Bool)

(assert start!37968)

(declare-fun b_free!8959 () Bool)

(declare-fun b_next!8959 () Bool)

(assert (=> start!37968 (= b_free!8959 (not b_next!8959))))

(declare-fun tp!31644 () Bool)

(declare-fun b_and!16261 () Bool)

(assert (=> start!37968 (= tp!31644 b_and!16261)))

(declare-fun b!390577 () Bool)

(declare-fun e!236593 () Bool)

(declare-fun e!236592 () Bool)

(assert (=> b!390577 (= e!236593 e!236592)))

(declare-fun res!223500 () Bool)

(assert (=> b!390577 (=> (not res!223500) (not e!236592))))

(declare-datatypes ((array!23161 0))(
  ( (array!23162 (arr!11044 (Array (_ BitVec 32) (_ BitVec 64))) (size!11396 (_ BitVec 32))) )
))
(declare-fun lt!184117 () array!23161)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23161 (_ BitVec 32)) Bool)

(assert (=> b!390577 (= res!223500 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!184117 mask!970))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!23161)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!390577 (= lt!184117 (array!23162 (store (arr!11044 _keys!658) i!548 k!778) (size!11396 _keys!658)))))

(declare-fun b!390578 () Bool)

(declare-fun res!223501 () Bool)

(assert (=> b!390578 (=> (not res!223501) (not e!236593))))

(assert (=> b!390578 (= res!223501 (or (= (select (arr!11044 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11044 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!390579 () Bool)

(declare-fun e!236591 () Bool)

(declare-fun tp_is_empty!9631 () Bool)

(assert (=> b!390579 (= e!236591 tp_is_empty!9631)))

(declare-fun mapNonEmpty!16026 () Bool)

(declare-fun mapRes!16026 () Bool)

(declare-fun tp!31643 () Bool)

(declare-fun e!236590 () Bool)

(assert (=> mapNonEmpty!16026 (= mapRes!16026 (and tp!31643 e!236590))))

(declare-datatypes ((V!13947 0))(
  ( (V!13948 (val!4860 Int)) )
))
(declare-datatypes ((ValueCell!4472 0))(
  ( (ValueCellFull!4472 (v!7077 V!13947)) (EmptyCell!4472) )
))
(declare-fun mapValue!16026 () ValueCell!4472)

(declare-datatypes ((array!23163 0))(
  ( (array!23164 (arr!11045 (Array (_ BitVec 32) ValueCell!4472)) (size!11397 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23163)

(declare-fun mapKey!16026 () (_ BitVec 32))

(declare-fun mapRest!16026 () (Array (_ BitVec 32) ValueCell!4472))

(assert (=> mapNonEmpty!16026 (= (arr!11045 _values!506) (store mapRest!16026 mapKey!16026 mapValue!16026))))

(declare-fun b!390580 () Bool)

(declare-fun res!223508 () Bool)

(assert (=> b!390580 (=> (not res!223508) (not e!236593))))

(declare-fun arrayContainsKey!0 (array!23161 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!390580 (= res!223508 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!16026 () Bool)

(assert (=> mapIsEmpty!16026 mapRes!16026))

(declare-fun res!223502 () Bool)

(assert (=> start!37968 (=> (not res!223502) (not e!236593))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37968 (= res!223502 (validMask!0 mask!970))))

(assert (=> start!37968 e!236593))

(declare-fun e!236594 () Bool)

(declare-fun array_inv!8114 (array!23163) Bool)

(assert (=> start!37968 (and (array_inv!8114 _values!506) e!236594)))

(assert (=> start!37968 tp!31644))

(assert (=> start!37968 true))

(assert (=> start!37968 tp_is_empty!9631))

(declare-fun array_inv!8115 (array!23161) Bool)

(assert (=> start!37968 (array_inv!8115 _keys!658)))

(declare-datatypes ((tuple2!6540 0))(
  ( (tuple2!6541 (_1!3281 (_ BitVec 64)) (_2!3281 V!13947)) )
))
(declare-datatypes ((List!6395 0))(
  ( (Nil!6392) (Cons!6391 (h!7247 tuple2!6540) (t!11555 List!6395)) )
))
(declare-datatypes ((ListLongMap!5453 0))(
  ( (ListLongMap!5454 (toList!2742 List!6395)) )
))
(declare-fun lt!184113 () ListLongMap!5453)

(declare-fun e!236596 () Bool)

(declare-fun b!390581 () Bool)

(declare-fun lt!184115 () tuple2!6540)

(declare-fun lt!184118 () ListLongMap!5453)

(declare-fun +!1037 (ListLongMap!5453 tuple2!6540) ListLongMap!5453)

(assert (=> b!390581 (= e!236596 (= lt!184113 (+!1037 lt!184118 lt!184115)))))

(declare-fun lt!184111 () ListLongMap!5453)

(declare-fun lt!184119 () ListLongMap!5453)

(assert (=> b!390581 (= lt!184111 (+!1037 lt!184119 lt!184115))))

(declare-fun zeroValue!472 () V!13947)

(assert (=> b!390581 (= lt!184115 (tuple2!6541 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!390582 () Bool)

(declare-fun res!223506 () Bool)

(assert (=> b!390582 (=> (not res!223506) (not e!236592))))

(declare-datatypes ((List!6396 0))(
  ( (Nil!6393) (Cons!6392 (h!7248 (_ BitVec 64)) (t!11556 List!6396)) )
))
(declare-fun arrayNoDuplicates!0 (array!23161 (_ BitVec 32) List!6396) Bool)

(assert (=> b!390582 (= res!223506 (arrayNoDuplicates!0 lt!184117 #b00000000000000000000000000000000 Nil!6393))))

(declare-fun b!390583 () Bool)

(declare-fun res!223503 () Bool)

(assert (=> b!390583 (=> (not res!223503) (not e!236593))))

(assert (=> b!390583 (= res!223503 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!390584 () Bool)

(declare-fun res!223507 () Bool)

(assert (=> b!390584 (=> (not res!223507) (not e!236593))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!390584 (= res!223507 (validKeyInArray!0 k!778))))

(declare-fun b!390585 () Bool)

(assert (=> b!390585 (= e!236590 tp_is_empty!9631)))

(declare-fun b!390586 () Bool)

(declare-fun res!223509 () Bool)

(assert (=> b!390586 (=> (not res!223509) (not e!236593))))

(assert (=> b!390586 (= res!223509 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11396 _keys!658))))))

(declare-fun b!390587 () Bool)

(declare-fun res!223499 () Bool)

(assert (=> b!390587 (=> (not res!223499) (not e!236593))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!390587 (= res!223499 (and (= (size!11397 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11396 _keys!658) (size!11397 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!390588 () Bool)

(declare-fun res!223504 () Bool)

(assert (=> b!390588 (=> (not res!223504) (not e!236593))))

(assert (=> b!390588 (= res!223504 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6393))))

(declare-fun b!390589 () Bool)

(assert (=> b!390589 (= e!236592 (not e!236596))))

(declare-fun res!223505 () Bool)

(assert (=> b!390589 (=> res!223505 e!236596)))

(assert (=> b!390589 (= res!223505 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun minValue!472 () V!13947)

(declare-fun getCurrentListMap!2088 (array!23161 array!23163 (_ BitVec 32) (_ BitVec 32) V!13947 V!13947 (_ BitVec 32) Int) ListLongMap!5453)

(assert (=> b!390589 (= lt!184113 (getCurrentListMap!2088 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184116 () array!23163)

(assert (=> b!390589 (= lt!184111 (getCurrentListMap!2088 lt!184117 lt!184116 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184114 () ListLongMap!5453)

(assert (=> b!390589 (and (= lt!184119 lt!184114) (= lt!184114 lt!184119))))

(declare-fun v!373 () V!13947)

(assert (=> b!390589 (= lt!184114 (+!1037 lt!184118 (tuple2!6541 k!778 v!373)))))

(declare-datatypes ((Unit!11956 0))(
  ( (Unit!11957) )
))
(declare-fun lt!184112 () Unit!11956)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!252 (array!23161 array!23163 (_ BitVec 32) (_ BitVec 32) V!13947 V!13947 (_ BitVec 32) (_ BitVec 64) V!13947 (_ BitVec 32) Int) Unit!11956)

(assert (=> b!390589 (= lt!184112 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!252 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!968 (array!23161 array!23163 (_ BitVec 32) (_ BitVec 32) V!13947 V!13947 (_ BitVec 32) Int) ListLongMap!5453)

(assert (=> b!390589 (= lt!184119 (getCurrentListMapNoExtraKeys!968 lt!184117 lt!184116 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!390589 (= lt!184116 (array!23164 (store (arr!11045 _values!506) i!548 (ValueCellFull!4472 v!373)) (size!11397 _values!506)))))

(assert (=> b!390589 (= lt!184118 (getCurrentListMapNoExtraKeys!968 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!390590 () Bool)

(assert (=> b!390590 (= e!236594 (and e!236591 mapRes!16026))))

(declare-fun condMapEmpty!16026 () Bool)

(declare-fun mapDefault!16026 () ValueCell!4472)

