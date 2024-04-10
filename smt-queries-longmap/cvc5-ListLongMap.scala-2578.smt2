; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39286 () Bool)

(assert start!39286)

(declare-fun b_free!9553 () Bool)

(declare-fun b_next!9553 () Bool)

(assert (=> start!39286 (= b_free!9553 (not b_next!9553))))

(declare-fun tp!34188 () Bool)

(declare-fun b_and!16981 () Bool)

(assert (=> start!39286 (= tp!34188 b_and!16981)))

(declare-fun res!241808 () Bool)

(declare-fun e!248215 () Bool)

(assert (=> start!39286 (=> (not res!241808) (not e!248215))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!25267 0))(
  ( (array!25268 (arr!12083 (Array (_ BitVec 32) (_ BitVec 64))) (size!12435 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25267)

(assert (=> start!39286 (= res!241808 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12435 _keys!709))))))

(assert (=> start!39286 e!248215))

(declare-fun tp_is_empty!10705 () Bool)

(assert (=> start!39286 tp_is_empty!10705))

(assert (=> start!39286 tp!34188))

(assert (=> start!39286 true))

(declare-datatypes ((V!15379 0))(
  ( (V!15380 (val!5397 Int)) )
))
(declare-datatypes ((ValueCell!5009 0))(
  ( (ValueCellFull!5009 (v!7644 V!15379)) (EmptyCell!5009) )
))
(declare-datatypes ((array!25269 0))(
  ( (array!25270 (arr!12084 (Array (_ BitVec 32) ValueCell!5009)) (size!12436 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25269)

(declare-fun e!248216 () Bool)

(declare-fun array_inv!8812 (array!25269) Bool)

(assert (=> start!39286 (and (array_inv!8812 _values!549) e!248216)))

(declare-fun array_inv!8813 (array!25267) Bool)

(assert (=> start!39286 (array_inv!8813 _keys!709)))

(declare-fun b!415601 () Bool)

(declare-fun e!248218 () Bool)

(declare-fun e!248220 () Bool)

(assert (=> b!415601 (= e!248218 e!248220)))

(declare-fun res!241804 () Bool)

(assert (=> b!415601 (=> (not res!241804) (not e!248220))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!415601 (= res!241804 (= from!863 i!563))))

(declare-datatypes ((tuple2!7030 0))(
  ( (tuple2!7031 (_1!3526 (_ BitVec 64)) (_2!3526 V!15379)) )
))
(declare-datatypes ((List!7051 0))(
  ( (Nil!7048) (Cons!7047 (h!7903 tuple2!7030) (t!12269 List!7051)) )
))
(declare-datatypes ((ListLongMap!5943 0))(
  ( (ListLongMap!5944 (toList!2987 List!7051)) )
))
(declare-fun lt!190297 () ListLongMap!5943)

(declare-fun minValue!515 () V!15379)

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!190295 () array!25269)

(declare-fun zeroValue!515 () V!15379)

(declare-fun lt!190294 () array!25267)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1193 (array!25267 array!25269 (_ BitVec 32) (_ BitVec 32) V!15379 V!15379 (_ BitVec 32) Int) ListLongMap!5943)

(assert (=> b!415601 (= lt!190297 (getCurrentListMapNoExtraKeys!1193 lt!190294 lt!190295 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!15379)

(assert (=> b!415601 (= lt!190295 (array!25270 (store (arr!12084 _values!549) i!563 (ValueCellFull!5009 v!412)) (size!12436 _values!549)))))

(declare-fun lt!190298 () ListLongMap!5943)

(assert (=> b!415601 (= lt!190298 (getCurrentListMapNoExtraKeys!1193 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapNonEmpty!17679 () Bool)

(declare-fun mapRes!17679 () Bool)

(declare-fun tp!34187 () Bool)

(declare-fun e!248221 () Bool)

(assert (=> mapNonEmpty!17679 (= mapRes!17679 (and tp!34187 e!248221))))

(declare-fun mapKey!17679 () (_ BitVec 32))

(declare-fun mapRest!17679 () (Array (_ BitVec 32) ValueCell!5009))

(declare-fun mapValue!17679 () ValueCell!5009)

(assert (=> mapNonEmpty!17679 (= (arr!12084 _values!549) (store mapRest!17679 mapKey!17679 mapValue!17679))))

(declare-fun b!415602 () Bool)

(assert (=> b!415602 (= e!248215 e!248218)))

(declare-fun res!241805 () Bool)

(assert (=> b!415602 (=> (not res!241805) (not e!248218))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25267 (_ BitVec 32)) Bool)

(assert (=> b!415602 (= res!241805 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!190294 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!415602 (= lt!190294 (array!25268 (store (arr!12083 _keys!709) i!563 k!794) (size!12435 _keys!709)))))

(declare-fun b!415603 () Bool)

(declare-fun res!241802 () Bool)

(assert (=> b!415603 (=> (not res!241802) (not e!248215))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!415603 (= res!241802 (validMask!0 mask!1025))))

(declare-fun b!415604 () Bool)

(declare-fun e!248219 () Bool)

(declare-fun call!28837 () ListLongMap!5943)

(declare-fun call!28838 () ListLongMap!5943)

(assert (=> b!415604 (= e!248219 (= call!28837 call!28838))))

(declare-fun b!415605 () Bool)

(declare-fun res!241801 () Bool)

(assert (=> b!415605 (=> (not res!241801) (not e!248215))))

(assert (=> b!415605 (= res!241801 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!415606 () Bool)

(declare-fun e!248217 () Bool)

(assert (=> b!415606 (= e!248217 true)))

(declare-fun +!1191 (ListLongMap!5943 tuple2!7030) ListLongMap!5943)

(declare-fun get!5967 (ValueCell!5009 V!15379) V!15379)

(declare-fun dynLambda!668 (Int (_ BitVec 64)) V!15379)

(assert (=> b!415606 (= lt!190297 (+!1191 (getCurrentListMapNoExtraKeys!1193 lt!190294 lt!190295 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7031 (select (arr!12083 lt!190294) from!863) (get!5967 (select (arr!12084 lt!190295) from!863) (dynLambda!668 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!415607 () Bool)

(declare-fun res!241797 () Bool)

(assert (=> b!415607 (=> (not res!241797) (not e!248215))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!415607 (= res!241797 (validKeyInArray!0 k!794))))

(declare-fun mapIsEmpty!17679 () Bool)

(assert (=> mapIsEmpty!17679 mapRes!17679))

(declare-fun b!415608 () Bool)

(declare-fun res!241800 () Bool)

(assert (=> b!415608 (=> (not res!241800) (not e!248215))))

(assert (=> b!415608 (= res!241800 (or (= (select (arr!12083 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12083 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!415609 () Bool)

(assert (=> b!415609 (= e!248221 tp_is_empty!10705)))

(declare-fun b!415610 () Bool)

(assert (=> b!415610 (= e!248219 (= call!28838 (+!1191 call!28837 (tuple2!7031 k!794 v!412))))))

(declare-fun b!415611 () Bool)

(declare-fun res!241809 () Bool)

(assert (=> b!415611 (=> (not res!241809) (not e!248215))))

(assert (=> b!415611 (= res!241809 (and (= (size!12436 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12435 _keys!709) (size!12436 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun c!55043 () Bool)

(declare-fun bm!28834 () Bool)

(assert (=> bm!28834 (= call!28838 (getCurrentListMapNoExtraKeys!1193 (ite c!55043 lt!190294 _keys!709) (ite c!55043 lt!190295 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!415612 () Bool)

(declare-fun res!241803 () Bool)

(assert (=> b!415612 (=> (not res!241803) (not e!248218))))

(declare-datatypes ((List!7052 0))(
  ( (Nil!7049) (Cons!7048 (h!7904 (_ BitVec 64)) (t!12270 List!7052)) )
))
(declare-fun arrayNoDuplicates!0 (array!25267 (_ BitVec 32) List!7052) Bool)

(assert (=> b!415612 (= res!241803 (arrayNoDuplicates!0 lt!190294 #b00000000000000000000000000000000 Nil!7049))))

(declare-fun b!415613 () Bool)

(declare-fun res!241806 () Bool)

(assert (=> b!415613 (=> (not res!241806) (not e!248215))))

(declare-fun arrayContainsKey!0 (array!25267 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!415613 (= res!241806 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!415614 () Bool)

(declare-fun res!241807 () Bool)

(assert (=> b!415614 (=> (not res!241807) (not e!248215))))

(assert (=> b!415614 (= res!241807 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12435 _keys!709))))))

(declare-fun b!415615 () Bool)

(assert (=> b!415615 (= e!248220 (not e!248217))))

(declare-fun res!241796 () Bool)

(assert (=> b!415615 (=> res!241796 e!248217)))

(assert (=> b!415615 (= res!241796 (validKeyInArray!0 (select (arr!12083 _keys!709) from!863)))))

(assert (=> b!415615 e!248219))

(assert (=> b!415615 (= c!55043 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12286 0))(
  ( (Unit!12287) )
))
(declare-fun lt!190296 () Unit!12286)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!401 (array!25267 array!25269 (_ BitVec 32) (_ BitVec 32) V!15379 V!15379 (_ BitVec 32) (_ BitVec 64) V!15379 (_ BitVec 32) Int) Unit!12286)

(assert (=> b!415615 (= lt!190296 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!401 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!415616 () Bool)

(declare-fun res!241798 () Bool)

(assert (=> b!415616 (=> (not res!241798) (not e!248218))))

(assert (=> b!415616 (= res!241798 (bvsle from!863 i!563))))

(declare-fun b!415617 () Bool)

(declare-fun e!248223 () Bool)

(assert (=> b!415617 (= e!248223 tp_is_empty!10705)))

(declare-fun b!415618 () Bool)

(declare-fun res!241799 () Bool)

(assert (=> b!415618 (=> (not res!241799) (not e!248215))))

(assert (=> b!415618 (= res!241799 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7049))))

(declare-fun b!415619 () Bool)

(assert (=> b!415619 (= e!248216 (and e!248223 mapRes!17679))))

(declare-fun condMapEmpty!17679 () Bool)

(declare-fun mapDefault!17679 () ValueCell!5009)

