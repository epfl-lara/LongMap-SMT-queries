; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39340 () Bool)

(assert start!39340)

(declare-fun b_free!9607 () Bool)

(declare-fun b_next!9607 () Bool)

(assert (=> start!39340 (= b_free!9607 (not b_next!9607))))

(declare-fun tp!34349 () Bool)

(declare-fun b_and!17089 () Bool)

(assert (=> start!39340 (= tp!34349 b_and!17089)))

(declare-fun b!417194 () Bool)

(declare-fun e!248950 () Bool)

(declare-datatypes ((V!15451 0))(
  ( (V!15452 (val!5424 Int)) )
))
(declare-datatypes ((tuple2!7080 0))(
  ( (tuple2!7081 (_1!3551 (_ BitVec 64)) (_2!3551 V!15451)) )
))
(declare-datatypes ((List!7098 0))(
  ( (Nil!7095) (Cons!7094 (h!7950 tuple2!7080) (t!12370 List!7098)) )
))
(declare-datatypes ((ListLongMap!5993 0))(
  ( (ListLongMap!5994 (toList!3012 List!7098)) )
))
(declare-fun call!29000 () ListLongMap!5993)

(declare-fun call!28999 () ListLongMap!5993)

(assert (=> b!417194 (= e!248950 (= call!29000 call!28999))))

(declare-fun mapIsEmpty!17760 () Bool)

(declare-fun mapRes!17760 () Bool)

(assert (=> mapIsEmpty!17760 mapRes!17760))

(declare-fun b!417195 () Bool)

(declare-fun res!242934 () Bool)

(declare-fun e!248948 () Bool)

(assert (=> b!417195 (=> (not res!242934) (not e!248948))))

(declare-datatypes ((array!25371 0))(
  ( (array!25372 (arr!12135 (Array (_ BitVec 32) (_ BitVec 64))) (size!12487 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25371)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25371 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!417195 (= res!242934 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!417196 () Bool)

(declare-fun res!242933 () Bool)

(assert (=> b!417196 (=> (not res!242933) (not e!248948))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!417196 (= res!242933 (or (= (select (arr!12135 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12135 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!417197 () Bool)

(declare-fun res!242932 () Bool)

(assert (=> b!417197 (=> (not res!242932) (not e!248948))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!417197 (= res!242932 (validKeyInArray!0 k!794))))

(declare-fun b!417198 () Bool)

(declare-fun res!242940 () Bool)

(assert (=> b!417198 (=> (not res!242940) (not e!248948))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!417198 (= res!242940 (validMask!0 mask!1025))))

(declare-fun res!242938 () Bool)

(assert (=> start!39340 (=> (not res!242938) (not e!248948))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39340 (= res!242938 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12487 _keys!709))))))

(assert (=> start!39340 e!248948))

(declare-fun tp_is_empty!10759 () Bool)

(assert (=> start!39340 tp_is_empty!10759))

(assert (=> start!39340 tp!34349))

(assert (=> start!39340 true))

(declare-datatypes ((ValueCell!5036 0))(
  ( (ValueCellFull!5036 (v!7671 V!15451)) (EmptyCell!5036) )
))
(declare-datatypes ((array!25373 0))(
  ( (array!25374 (arr!12136 (Array (_ BitVec 32) ValueCell!5036)) (size!12488 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25373)

(declare-fun e!248949 () Bool)

(declare-fun array_inv!8850 (array!25373) Bool)

(assert (=> start!39340 (and (array_inv!8850 _values!549) e!248949)))

(declare-fun array_inv!8851 (array!25371) Bool)

(assert (=> start!39340 (array_inv!8851 _keys!709)))

(declare-fun b!417199 () Bool)

(declare-fun res!242939 () Bool)

(assert (=> b!417199 (=> (not res!242939) (not e!248948))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25371 (_ BitVec 32)) Bool)

(assert (=> b!417199 (= res!242939 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun minValue!515 () V!15451)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15451)

(declare-fun c!55124 () Bool)

(declare-fun lt!191098 () array!25371)

(declare-fun bm!28996 () Bool)

(declare-fun lt!191089 () array!25373)

(declare-fun getCurrentListMapNoExtraKeys!1217 (array!25371 array!25373 (_ BitVec 32) (_ BitVec 32) V!15451 V!15451 (_ BitVec 32) Int) ListLongMap!5993)

(assert (=> bm!28996 (= call!29000 (getCurrentListMapNoExtraKeys!1217 (ite c!55124 _keys!709 lt!191098) (ite c!55124 _values!549 lt!191089) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!417200 () Bool)

(declare-fun res!242936 () Bool)

(assert (=> b!417200 (=> (not res!242936) (not e!248948))))

(assert (=> b!417200 (= res!242936 (and (= (size!12488 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12487 _keys!709) (size!12488 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!17760 () Bool)

(declare-fun tp!34350 () Bool)

(declare-fun e!248946 () Bool)

(assert (=> mapNonEmpty!17760 (= mapRes!17760 (and tp!34350 e!248946))))

(declare-fun mapValue!17760 () ValueCell!5036)

(declare-fun mapRest!17760 () (Array (_ BitVec 32) ValueCell!5036))

(declare-fun mapKey!17760 () (_ BitVec 32))

(assert (=> mapNonEmpty!17760 (= (arr!12136 _values!549) (store mapRest!17760 mapKey!17760 mapValue!17760))))

(declare-fun b!417201 () Bool)

(assert (=> b!417201 (= e!248946 tp_is_empty!10759)))

(declare-fun b!417202 () Bool)

(declare-fun e!248944 () Bool)

(declare-fun e!248952 () Bool)

(assert (=> b!417202 (= e!248944 e!248952)))

(declare-fun res!242931 () Bool)

(assert (=> b!417202 (=> (not res!242931) (not e!248952))))

(assert (=> b!417202 (= res!242931 (= from!863 i!563))))

(declare-fun lt!191094 () ListLongMap!5993)

(assert (=> b!417202 (= lt!191094 (getCurrentListMapNoExtraKeys!1217 lt!191098 lt!191089 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!15451)

(assert (=> b!417202 (= lt!191089 (array!25374 (store (arr!12136 _values!549) i!563 (ValueCellFull!5036 v!412)) (size!12488 _values!549)))))

(declare-fun lt!191092 () ListLongMap!5993)

(assert (=> b!417202 (= lt!191092 (getCurrentListMapNoExtraKeys!1217 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!417203 () Bool)

(declare-fun res!242943 () Bool)

(assert (=> b!417203 (=> (not res!242943) (not e!248944))))

(declare-datatypes ((List!7099 0))(
  ( (Nil!7096) (Cons!7095 (h!7951 (_ BitVec 64)) (t!12371 List!7099)) )
))
(declare-fun arrayNoDuplicates!0 (array!25371 (_ BitVec 32) List!7099) Bool)

(assert (=> b!417203 (= res!242943 (arrayNoDuplicates!0 lt!191098 #b00000000000000000000000000000000 Nil!7096))))

(declare-fun b!417204 () Bool)

(assert (=> b!417204 (= e!248948 e!248944)))

(declare-fun res!242937 () Bool)

(assert (=> b!417204 (=> (not res!242937) (not e!248944))))

(assert (=> b!417204 (= res!242937 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!191098 mask!1025))))

(assert (=> b!417204 (= lt!191098 (array!25372 (store (arr!12135 _keys!709) i!563 k!794) (size!12487 _keys!709)))))

(declare-fun b!417205 () Bool)

(declare-fun e!248947 () Bool)

(assert (=> b!417205 (= e!248952 (not e!248947))))

(declare-fun res!242941 () Bool)

(assert (=> b!417205 (=> res!242941 e!248947)))

(assert (=> b!417205 (= res!242941 (validKeyInArray!0 (select (arr!12135 _keys!709) from!863)))))

(assert (=> b!417205 e!248950))

(assert (=> b!417205 (= c!55124 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12330 0))(
  ( (Unit!12331) )
))
(declare-fun lt!191095 () Unit!12330)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!421 (array!25371 array!25373 (_ BitVec 32) (_ BitVec 32) V!15451 V!15451 (_ BitVec 32) (_ BitVec 64) V!15451 (_ BitVec 32) Int) Unit!12330)

(assert (=> b!417205 (= lt!191095 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!421 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!417206 () Bool)

(declare-fun e!248951 () Bool)

(assert (=> b!417206 (= e!248951 tp_is_empty!10759)))

(declare-fun b!417207 () Bool)

(declare-fun +!1214 (ListLongMap!5993 tuple2!7080) ListLongMap!5993)

(assert (=> b!417207 (= e!248950 (= call!28999 (+!1214 call!29000 (tuple2!7081 k!794 v!412))))))

(declare-fun b!417208 () Bool)

(assert (=> b!417208 (= e!248949 (and e!248951 mapRes!17760))))

(declare-fun condMapEmpty!17760 () Bool)

(declare-fun mapDefault!17760 () ValueCell!5036)

