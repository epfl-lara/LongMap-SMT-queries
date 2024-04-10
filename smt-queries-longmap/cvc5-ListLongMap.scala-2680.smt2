; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39898 () Bool)

(assert start!39898)

(declare-fun b_free!10165 () Bool)

(declare-fun b_next!10165 () Bool)

(assert (=> start!39898 (= b_free!10165 (not b_next!10165))))

(declare-fun tp!36024 () Bool)

(declare-fun b_and!17989 () Bool)

(assert (=> start!39898 (= tp!36024 b_and!17989)))

(declare-fun b!432317 () Bool)

(declare-fun res!254295 () Bool)

(declare-fun e!255734 () Bool)

(assert (=> b!432317 (=> (not res!254295) (not e!255734))))

(declare-datatypes ((array!26467 0))(
  ( (array!26468 (arr!12683 (Array (_ BitVec 32) (_ BitVec 64))) (size!13035 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26467)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!26467 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!432317 (= res!254295 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!432318 () Bool)

(declare-fun res!254285 () Bool)

(assert (=> b!432318 (=> (not res!254285) (not e!255734))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16195 0))(
  ( (V!16196 (val!5703 Int)) )
))
(declare-datatypes ((ValueCell!5315 0))(
  ( (ValueCellFull!5315 (v!7950 V!16195)) (EmptyCell!5315) )
))
(declare-datatypes ((array!26469 0))(
  ( (array!26470 (arr!12684 (Array (_ BitVec 32) ValueCell!5315)) (size!13036 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26469)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!432318 (= res!254285 (and (= (size!13036 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13035 _keys!709) (size!13036 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!432319 () Bool)

(declare-fun e!255735 () Bool)

(assert (=> b!432319 (= e!255735 true)))

(declare-datatypes ((tuple2!7526 0))(
  ( (tuple2!7527 (_1!3774 (_ BitVec 64)) (_2!3774 V!16195)) )
))
(declare-fun lt!198220 () tuple2!7526)

(declare-datatypes ((List!7541 0))(
  ( (Nil!7538) (Cons!7537 (h!8393 tuple2!7526) (t!13155 List!7541)) )
))
(declare-datatypes ((ListLongMap!6439 0))(
  ( (ListLongMap!6440 (toList!3235 List!7541)) )
))
(declare-fun lt!198223 () ListLongMap!6439)

(declare-fun lt!198230 () ListLongMap!6439)

(declare-fun lt!198224 () tuple2!7526)

(declare-fun +!1383 (ListLongMap!6439 tuple2!7526) ListLongMap!6439)

(assert (=> b!432319 (= lt!198223 (+!1383 (+!1383 lt!198230 lt!198224) lt!198220))))

(declare-fun lt!198222 () V!16195)

(declare-fun v!412 () V!16195)

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((Unit!12766 0))(
  ( (Unit!12767) )
))
(declare-fun lt!198225 () Unit!12766)

(declare-fun addCommutativeForDiffKeys!373 (ListLongMap!6439 (_ BitVec 64) V!16195 (_ BitVec 64) V!16195) Unit!12766)

(assert (=> b!432319 (= lt!198225 (addCommutativeForDiffKeys!373 lt!198230 k!794 v!412 (select (arr!12683 _keys!709) from!863) lt!198222))))

(declare-fun b!432320 () Bool)

(declare-fun res!254282 () Bool)

(assert (=> b!432320 (=> (not res!254282) (not e!255734))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!432320 (= res!254282 (validKeyInArray!0 k!794))))

(declare-fun b!432321 () Bool)

(declare-fun res!254288 () Bool)

(declare-fun e!255740 () Bool)

(assert (=> b!432321 (=> (not res!254288) (not e!255740))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!432321 (= res!254288 (bvsle from!863 i!563))))

(declare-fun b!432322 () Bool)

(declare-fun e!255737 () Bool)

(declare-fun e!255732 () Bool)

(assert (=> b!432322 (= e!255737 (not e!255732))))

(declare-fun res!254290 () Bool)

(assert (=> b!432322 (=> res!254290 e!255732)))

(assert (=> b!432322 (= res!254290 (not (validKeyInArray!0 (select (arr!12683 _keys!709) from!863))))))

(declare-fun lt!198221 () ListLongMap!6439)

(declare-fun lt!198228 () ListLongMap!6439)

(assert (=> b!432322 (= lt!198221 lt!198228)))

(assert (=> b!432322 (= lt!198228 (+!1383 lt!198230 lt!198220))))

(declare-fun minValue!515 () V!16195)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!16195)

(declare-fun lt!198216 () array!26467)

(declare-fun lt!198219 () array!26469)

(declare-fun getCurrentListMapNoExtraKeys!1433 (array!26467 array!26469 (_ BitVec 32) (_ BitVec 32) V!16195 V!16195 (_ BitVec 32) Int) ListLongMap!6439)

(assert (=> b!432322 (= lt!198221 (getCurrentListMapNoExtraKeys!1433 lt!198216 lt!198219 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!432322 (= lt!198220 (tuple2!7527 k!794 v!412))))

(assert (=> b!432322 (= lt!198230 (getCurrentListMapNoExtraKeys!1433 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!198229 () Unit!12766)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!567 (array!26467 array!26469 (_ BitVec 32) (_ BitVec 32) V!16195 V!16195 (_ BitVec 32) (_ BitVec 64) V!16195 (_ BitVec 32) Int) Unit!12766)

(assert (=> b!432322 (= lt!198229 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!567 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!432323 () Bool)

(declare-fun res!254287 () Bool)

(assert (=> b!432323 (=> (not res!254287) (not e!255734))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!432323 (= res!254287 (validMask!0 mask!1025))))

(declare-fun b!432324 () Bool)

(declare-fun e!255741 () Bool)

(declare-fun tp_is_empty!11317 () Bool)

(assert (=> b!432324 (= e!255741 tp_is_empty!11317)))

(declare-fun res!254283 () Bool)

(assert (=> start!39898 (=> (not res!254283) (not e!255734))))

(assert (=> start!39898 (= res!254283 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13035 _keys!709))))))

(assert (=> start!39898 e!255734))

(assert (=> start!39898 tp_is_empty!11317))

(assert (=> start!39898 tp!36024))

(assert (=> start!39898 true))

(declare-fun e!255738 () Bool)

(declare-fun array_inv!9226 (array!26469) Bool)

(assert (=> start!39898 (and (array_inv!9226 _values!549) e!255738)))

(declare-fun array_inv!9227 (array!26467) Bool)

(assert (=> start!39898 (array_inv!9227 _keys!709)))

(declare-fun b!432316 () Bool)

(declare-fun res!254289 () Bool)

(assert (=> b!432316 (=> (not res!254289) (not e!255734))))

(assert (=> b!432316 (= res!254289 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13035 _keys!709))))))

(declare-fun mapIsEmpty!18597 () Bool)

(declare-fun mapRes!18597 () Bool)

(assert (=> mapIsEmpty!18597 mapRes!18597))

(declare-fun b!432325 () Bool)

(declare-fun e!255739 () Bool)

(assert (=> b!432325 (= e!255738 (and e!255739 mapRes!18597))))

(declare-fun condMapEmpty!18597 () Bool)

(declare-fun mapDefault!18597 () ValueCell!5315)

