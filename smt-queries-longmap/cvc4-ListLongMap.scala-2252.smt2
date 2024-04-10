; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36978 () Bool)

(assert start!36978)

(declare-fun b_free!8105 () Bool)

(declare-fun b_next!8105 () Bool)

(assert (=> start!36978 (= b_free!8105 (not b_next!8105))))

(declare-fun tp!29031 () Bool)

(declare-fun b_and!15347 () Bool)

(assert (=> start!36978 (= tp!29031 b_and!15347)))

(declare-fun b!371087 () Bool)

(declare-fun res!208529 () Bool)

(declare-fun e!226558 () Bool)

(assert (=> b!371087 (=> (not res!208529) (not e!226558))))

(declare-datatypes ((array!21449 0))(
  ( (array!21450 (arr!10193 (Array (_ BitVec 32) (_ BitVec 64))) (size!10545 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21449)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21449 (_ BitVec 32)) Bool)

(assert (=> b!371087 (= res!208529 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapNonEmpty!14694 () Bool)

(declare-fun mapRes!14694 () Bool)

(declare-fun tp!29030 () Bool)

(declare-fun e!226557 () Bool)

(assert (=> mapNonEmpty!14694 (= mapRes!14694 (and tp!29030 e!226557))))

(declare-datatypes ((V!12775 0))(
  ( (V!12776 (val!4421 Int)) )
))
(declare-datatypes ((ValueCell!4033 0))(
  ( (ValueCellFull!4033 (v!6618 V!12775)) (EmptyCell!4033) )
))
(declare-datatypes ((array!21451 0))(
  ( (array!21452 (arr!10194 (Array (_ BitVec 32) ValueCell!4033)) (size!10546 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21451)

(declare-fun mapRest!14694 () (Array (_ BitVec 32) ValueCell!4033))

(declare-fun mapValue!14694 () ValueCell!4033)

(declare-fun mapKey!14694 () (_ BitVec 32))

(assert (=> mapNonEmpty!14694 (= (arr!10194 _values!506) (store mapRest!14694 mapKey!14694 mapValue!14694))))

(declare-fun b!371088 () Bool)

(declare-fun res!208520 () Bool)

(assert (=> b!371088 (=> (not res!208520) (not e!226558))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!371088 (= res!208520 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10545 _keys!658))))))

(declare-fun b!371089 () Bool)

(declare-fun res!208521 () Bool)

(assert (=> b!371089 (=> (not res!208521) (not e!226558))))

(declare-datatypes ((List!5703 0))(
  ( (Nil!5700) (Cons!5699 (h!6555 (_ BitVec 64)) (t!10853 List!5703)) )
))
(declare-fun arrayNoDuplicates!0 (array!21449 (_ BitVec 32) List!5703) Bool)

(assert (=> b!371089 (= res!208521 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5700))))

(declare-fun b!371090 () Bool)

(declare-fun res!208523 () Bool)

(assert (=> b!371090 (=> (not res!208523) (not e!226558))))

(assert (=> b!371090 (= res!208523 (or (= (select (arr!10193 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10193 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!371091 () Bool)

(declare-fun e!226554 () Bool)

(declare-fun tp_is_empty!8753 () Bool)

(assert (=> b!371091 (= e!226554 tp_is_empty!8753)))

(declare-fun b!371092 () Bool)

(declare-fun res!208525 () Bool)

(assert (=> b!371092 (=> (not res!208525) (not e!226558))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!371092 (= res!208525 (validKeyInArray!0 k!778))))

(declare-fun b!371093 () Bool)

(declare-fun res!208527 () Bool)

(assert (=> b!371093 (=> (not res!208527) (not e!226558))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!371093 (= res!208527 (and (= (size!10546 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10545 _keys!658) (size!10546 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!371094 () Bool)

(declare-fun e!226556 () Bool)

(assert (=> b!371094 (= e!226558 e!226556)))

(declare-fun res!208528 () Bool)

(assert (=> b!371094 (=> (not res!208528) (not e!226556))))

(declare-fun lt!170150 () array!21449)

(assert (=> b!371094 (= res!208528 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!170150 mask!970))))

(assert (=> b!371094 (= lt!170150 (array!21450 (store (arr!10193 _keys!658) i!548 k!778) (size!10545 _keys!658)))))

(declare-fun b!371095 () Bool)

(assert (=> b!371095 (= e!226556 (not true))))

(declare-datatypes ((tuple2!5864 0))(
  ( (tuple2!5865 (_1!2943 (_ BitVec 64)) (_2!2943 V!12775)) )
))
(declare-datatypes ((List!5704 0))(
  ( (Nil!5701) (Cons!5700 (h!6556 tuple2!5864) (t!10854 List!5704)) )
))
(declare-datatypes ((ListLongMap!4777 0))(
  ( (ListLongMap!4778 (toList!2404 List!5704)) )
))
(declare-fun lt!170152 () ListLongMap!4777)

(declare-fun lt!170151 () ListLongMap!4777)

(assert (=> b!371095 (and (= lt!170152 lt!170151) (= lt!170151 lt!170152))))

(declare-fun v!373 () V!12775)

(declare-fun lt!170153 () ListLongMap!4777)

(declare-fun +!750 (ListLongMap!4777 tuple2!5864) ListLongMap!4777)

(assert (=> b!371095 (= lt!170151 (+!750 lt!170153 (tuple2!5865 k!778 v!373)))))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((Unit!11406 0))(
  ( (Unit!11407) )
))
(declare-fun lt!170154 () Unit!11406)

(declare-fun zeroValue!472 () V!12775)

(declare-fun minValue!472 () V!12775)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!5 (array!21449 array!21451 (_ BitVec 32) (_ BitVec 32) V!12775 V!12775 (_ BitVec 32) (_ BitVec 64) V!12775 (_ BitVec 32) Int) Unit!11406)

(assert (=> b!371095 (= lt!170154 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!5 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!681 (array!21449 array!21451 (_ BitVec 32) (_ BitVec 32) V!12775 V!12775 (_ BitVec 32) Int) ListLongMap!4777)

(assert (=> b!371095 (= lt!170152 (getCurrentListMapNoExtraKeys!681 lt!170150 (array!21452 (store (arr!10194 _values!506) i!548 (ValueCellFull!4033 v!373)) (size!10546 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!371095 (= lt!170153 (getCurrentListMapNoExtraKeys!681 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!371096 () Bool)

(assert (=> b!371096 (= e!226557 tp_is_empty!8753)))

(declare-fun b!371097 () Bool)

(declare-fun res!208522 () Bool)

(assert (=> b!371097 (=> (not res!208522) (not e!226556))))

(assert (=> b!371097 (= res!208522 (arrayNoDuplicates!0 lt!170150 #b00000000000000000000000000000000 Nil!5700))))

(declare-fun b!371098 () Bool)

(declare-fun res!208526 () Bool)

(assert (=> b!371098 (=> (not res!208526) (not e!226558))))

(declare-fun arrayContainsKey!0 (array!21449 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!371098 (= res!208526 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!14694 () Bool)

(assert (=> mapIsEmpty!14694 mapRes!14694))

(declare-fun res!208524 () Bool)

(assert (=> start!36978 (=> (not res!208524) (not e!226558))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36978 (= res!208524 (validMask!0 mask!970))))

(assert (=> start!36978 e!226558))

(declare-fun e!226555 () Bool)

(declare-fun array_inv!7528 (array!21451) Bool)

(assert (=> start!36978 (and (array_inv!7528 _values!506) e!226555)))

(assert (=> start!36978 tp!29031))

(assert (=> start!36978 true))

(assert (=> start!36978 tp_is_empty!8753))

(declare-fun array_inv!7529 (array!21449) Bool)

(assert (=> start!36978 (array_inv!7529 _keys!658)))

(declare-fun b!371099 () Bool)

(assert (=> b!371099 (= e!226555 (and e!226554 mapRes!14694))))

(declare-fun condMapEmpty!14694 () Bool)

(declare-fun mapDefault!14694 () ValueCell!4033)

