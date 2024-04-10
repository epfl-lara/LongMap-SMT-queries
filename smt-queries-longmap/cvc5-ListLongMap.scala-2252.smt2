; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36974 () Bool)

(assert start!36974)

(declare-fun b_free!8101 () Bool)

(declare-fun b_next!8101 () Bool)

(assert (=> start!36974 (= b_free!8101 (not b_next!8101))))

(declare-fun tp!29019 () Bool)

(declare-fun b_and!15343 () Bool)

(assert (=> start!36974 (= tp!29019 b_and!15343)))

(declare-fun b!371009 () Bool)

(declare-fun res!208462 () Bool)

(declare-fun e!226519 () Bool)

(assert (=> b!371009 (=> (not res!208462) (not e!226519))))

(declare-datatypes ((array!21441 0))(
  ( (array!21442 (arr!10189 (Array (_ BitVec 32) (_ BitVec 64))) (size!10541 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21441)

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21441 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!371009 (= res!208462 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!371010 () Bool)

(declare-fun res!208461 () Bool)

(assert (=> b!371010 (=> (not res!208461) (not e!226519))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21441 (_ BitVec 32)) Bool)

(assert (=> b!371010 (= res!208461 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!371011 () Bool)

(declare-fun e!226520 () Bool)

(assert (=> b!371011 (= e!226520 (not true))))

(declare-datatypes ((V!12771 0))(
  ( (V!12772 (val!4419 Int)) )
))
(declare-datatypes ((tuple2!5860 0))(
  ( (tuple2!5861 (_1!2941 (_ BitVec 64)) (_2!2941 V!12771)) )
))
(declare-datatypes ((List!5700 0))(
  ( (Nil!5697) (Cons!5696 (h!6552 tuple2!5860) (t!10850 List!5700)) )
))
(declare-datatypes ((ListLongMap!4773 0))(
  ( (ListLongMap!4774 (toList!2402 List!5700)) )
))
(declare-fun lt!170122 () ListLongMap!4773)

(declare-fun lt!170123 () ListLongMap!4773)

(assert (=> b!371011 (and (= lt!170122 lt!170123) (= lt!170123 lt!170122))))

(declare-fun v!373 () V!12771)

(declare-fun lt!170120 () ListLongMap!4773)

(declare-fun +!748 (ListLongMap!4773 tuple2!5860) ListLongMap!4773)

(assert (=> b!371011 (= lt!170123 (+!748 lt!170120 (tuple2!5861 k!778 v!373)))))

(declare-datatypes ((Unit!11402 0))(
  ( (Unit!11403) )
))
(declare-fun lt!170121 () Unit!11402)

(declare-datatypes ((ValueCell!4031 0))(
  ( (ValueCellFull!4031 (v!6616 V!12771)) (EmptyCell!4031) )
))
(declare-datatypes ((array!21443 0))(
  ( (array!21444 (arr!10190 (Array (_ BitVec 32) ValueCell!4031)) (size!10542 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21443)

(declare-fun zeroValue!472 () V!12771)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun defaultEntry!514 () Int)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun minValue!472 () V!12771)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!3 (array!21441 array!21443 (_ BitVec 32) (_ BitVec 32) V!12771 V!12771 (_ BitVec 32) (_ BitVec 64) V!12771 (_ BitVec 32) Int) Unit!11402)

(assert (=> b!371011 (= lt!170121 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!3 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!170124 () array!21441)

(declare-fun getCurrentListMapNoExtraKeys!679 (array!21441 array!21443 (_ BitVec 32) (_ BitVec 32) V!12771 V!12771 (_ BitVec 32) Int) ListLongMap!4773)

(assert (=> b!371011 (= lt!170122 (getCurrentListMapNoExtraKeys!679 lt!170124 (array!21444 (store (arr!10190 _values!506) i!548 (ValueCellFull!4031 v!373)) (size!10542 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!371011 (= lt!170120 (getCurrentListMapNoExtraKeys!679 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!371012 () Bool)

(assert (=> b!371012 (= e!226519 e!226520)))

(declare-fun res!208468 () Bool)

(assert (=> b!371012 (=> (not res!208468) (not e!226520))))

(assert (=> b!371012 (= res!208468 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!170124 mask!970))))

(assert (=> b!371012 (= lt!170124 (array!21442 (store (arr!10189 _keys!658) i!548 k!778) (size!10541 _keys!658)))))

(declare-fun b!371013 () Bool)

(declare-fun res!208467 () Bool)

(assert (=> b!371013 (=> (not res!208467) (not e!226519))))

(assert (=> b!371013 (= res!208467 (or (= (select (arr!10189 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10189 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!208464 () Bool)

(assert (=> start!36974 (=> (not res!208464) (not e!226519))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36974 (= res!208464 (validMask!0 mask!970))))

(assert (=> start!36974 e!226519))

(declare-fun e!226521 () Bool)

(declare-fun array_inv!7524 (array!21443) Bool)

(assert (=> start!36974 (and (array_inv!7524 _values!506) e!226521)))

(assert (=> start!36974 tp!29019))

(assert (=> start!36974 true))

(declare-fun tp_is_empty!8749 () Bool)

(assert (=> start!36974 tp_is_empty!8749))

(declare-fun array_inv!7525 (array!21441) Bool)

(assert (=> start!36974 (array_inv!7525 _keys!658)))

(declare-fun b!371014 () Bool)

(declare-fun res!208465 () Bool)

(assert (=> b!371014 (=> (not res!208465) (not e!226519))))

(assert (=> b!371014 (= res!208465 (and (= (size!10542 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10541 _keys!658) (size!10542 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!371015 () Bool)

(declare-fun e!226518 () Bool)

(declare-fun mapRes!14688 () Bool)

(assert (=> b!371015 (= e!226521 (and e!226518 mapRes!14688))))

(declare-fun condMapEmpty!14688 () Bool)

(declare-fun mapDefault!14688 () ValueCell!4031)

