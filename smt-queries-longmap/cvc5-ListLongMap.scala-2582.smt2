; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39310 () Bool)

(assert start!39310)

(declare-fun b_free!9577 () Bool)

(declare-fun b_next!9577 () Bool)

(assert (=> start!39310 (= b_free!9577 (not b_next!9577))))

(declare-fun tp!34259 () Bool)

(declare-fun b_and!17029 () Bool)

(assert (=> start!39310 (= tp!34259 b_and!17029)))

(declare-fun b!416309 () Bool)

(declare-fun e!248545 () Bool)

(declare-fun e!248542 () Bool)

(assert (=> b!416309 (= e!248545 e!248542)))

(declare-fun res!242305 () Bool)

(assert (=> b!416309 (=> (not res!242305) (not e!248542))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!416309 (= res!242305 (= from!863 i!563))))

(declare-datatypes ((V!15411 0))(
  ( (V!15412 (val!5409 Int)) )
))
(declare-datatypes ((ValueCell!5021 0))(
  ( (ValueCellFull!5021 (v!7656 V!15411)) (EmptyCell!5021) )
))
(declare-datatypes ((array!25313 0))(
  ( (array!25314 (arr!12106 (Array (_ BitVec 32) ValueCell!5021)) (size!12458 (_ BitVec 32))) )
))
(declare-fun lt!190597 () array!25313)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((array!25315 0))(
  ( (array!25316 (arr!12107 (Array (_ BitVec 32) (_ BitVec 64))) (size!12459 (_ BitVec 32))) )
))
(declare-fun lt!190603 () array!25315)

(declare-fun zeroValue!515 () V!15411)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun minValue!515 () V!15411)

(declare-datatypes ((tuple2!7052 0))(
  ( (tuple2!7053 (_1!3537 (_ BitVec 64)) (_2!3537 V!15411)) )
))
(declare-datatypes ((List!7071 0))(
  ( (Nil!7068) (Cons!7067 (h!7923 tuple2!7052) (t!12313 List!7071)) )
))
(declare-datatypes ((ListLongMap!5965 0))(
  ( (ListLongMap!5966 (toList!2998 List!7071)) )
))
(declare-fun lt!190598 () ListLongMap!5965)

(declare-fun getCurrentListMapNoExtraKeys!1203 (array!25315 array!25313 (_ BitVec 32) (_ BitVec 32) V!15411 V!15411 (_ BitVec 32) Int) ListLongMap!5965)

(assert (=> b!416309 (= lt!190598 (getCurrentListMapNoExtraKeys!1203 lt!190603 lt!190597 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!25313)

(declare-fun v!412 () V!15411)

(assert (=> b!416309 (= lt!190597 (array!25314 (store (arr!12106 _values!549) i!563 (ValueCellFull!5021 v!412)) (size!12458 _values!549)))))

(declare-fun lt!190602 () ListLongMap!5965)

(declare-fun _keys!709 () array!25315)

(assert (=> b!416309 (= lt!190602 (getCurrentListMapNoExtraKeys!1203 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!416310 () Bool)

(declare-fun res!242311 () Bool)

(declare-fun e!248547 () Bool)

(assert (=> b!416310 (=> (not res!242311) (not e!248547))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!416310 (= res!242311 (validMask!0 mask!1025))))

(declare-fun b!416312 () Bool)

(declare-fun res!242306 () Bool)

(assert (=> b!416312 (=> (not res!242306) (not e!248547))))

(assert (=> b!416312 (= res!242306 (or (= (select (arr!12107 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12107 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!416313 () Bool)

(declare-fun res!242313 () Bool)

(assert (=> b!416313 (=> (not res!242313) (not e!248547))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25315 (_ BitVec 32)) Bool)

(assert (=> b!416313 (= res!242313 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun call!28910 () ListLongMap!5965)

(declare-fun b!416314 () Bool)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun e!248546 () Bool)

(declare-fun call!28909 () ListLongMap!5965)

(declare-fun +!1200 (ListLongMap!5965 tuple2!7052) ListLongMap!5965)

(assert (=> b!416314 (= e!248546 (= call!28910 (+!1200 call!28909 (tuple2!7053 k!794 v!412))))))

(declare-fun b!416315 () Bool)

(declare-fun res!242308 () Bool)

(assert (=> b!416315 (=> (not res!242308) (not e!248547))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!416315 (= res!242308 (validKeyInArray!0 k!794))))

(declare-fun b!416316 () Bool)

(assert (=> b!416316 (= e!248546 (= call!28909 call!28910))))

(declare-fun b!416317 () Bool)

(declare-fun res!242300 () Bool)

(assert (=> b!416317 (=> (not res!242300) (not e!248547))))

(assert (=> b!416317 (= res!242300 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12459 _keys!709))))))

(declare-fun b!416318 () Bool)

(declare-fun e!248543 () Bool)

(assert (=> b!416318 (= e!248542 (not e!248543))))

(declare-fun res!242302 () Bool)

(assert (=> b!416318 (=> res!242302 e!248543)))

(assert (=> b!416318 (= res!242302 (validKeyInArray!0 (select (arr!12107 _keys!709) from!863)))))

(assert (=> b!416318 e!248546))

(declare-fun c!55079 () Bool)

(assert (=> b!416318 (= c!55079 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12304 0))(
  ( (Unit!12305) )
))
(declare-fun lt!190600 () Unit!12304)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!408 (array!25315 array!25313 (_ BitVec 32) (_ BitVec 32) V!15411 V!15411 (_ BitVec 32) (_ BitVec 64) V!15411 (_ BitVec 32) Int) Unit!12304)

(assert (=> b!416318 (= lt!190600 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!408 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!28906 () Bool)

(assert (=> bm!28906 (= call!28909 (getCurrentListMapNoExtraKeys!1203 (ite c!55079 _keys!709 lt!190603) (ite c!55079 _values!549 lt!190597) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!17715 () Bool)

(declare-fun mapRes!17715 () Bool)

(assert (=> mapIsEmpty!17715 mapRes!17715))

(declare-fun b!416319 () Bool)

(declare-fun e!248539 () Bool)

(declare-fun tp_is_empty!10729 () Bool)

(assert (=> b!416319 (= e!248539 tp_is_empty!10729)))

(declare-fun bm!28907 () Bool)

(assert (=> bm!28907 (= call!28910 (getCurrentListMapNoExtraKeys!1203 (ite c!55079 lt!190603 _keys!709) (ite c!55079 lt!190597 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!416320 () Bool)

(declare-fun res!242307 () Bool)

(assert (=> b!416320 (=> (not res!242307) (not e!248547))))

(declare-datatypes ((List!7072 0))(
  ( (Nil!7069) (Cons!7068 (h!7924 (_ BitVec 64)) (t!12314 List!7072)) )
))
(declare-fun arrayNoDuplicates!0 (array!25315 (_ BitVec 32) List!7072) Bool)

(assert (=> b!416320 (= res!242307 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7069))))

(declare-fun b!416321 () Bool)

(declare-fun res!242303 () Bool)

(assert (=> b!416321 (=> (not res!242303) (not e!248545))))

(assert (=> b!416321 (= res!242303 (arrayNoDuplicates!0 lt!190603 #b00000000000000000000000000000000 Nil!7069))))

(declare-fun b!416322 () Bool)

(declare-fun e!248540 () Bool)

(assert (=> b!416322 (= e!248540 tp_is_empty!10729)))

(declare-fun b!416311 () Bool)

(declare-fun e!248541 () Bool)

(assert (=> b!416311 (= e!248541 (and e!248539 mapRes!17715))))

(declare-fun condMapEmpty!17715 () Bool)

(declare-fun mapDefault!17715 () ValueCell!5021)

