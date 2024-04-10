; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39316 () Bool)

(assert start!39316)

(declare-fun b_free!9583 () Bool)

(declare-fun b_next!9583 () Bool)

(assert (=> start!39316 (= b_free!9583 (not b_next!9583))))

(declare-fun tp!34278 () Bool)

(declare-fun b_and!17041 () Bool)

(assert (=> start!39316 (= tp!34278 b_and!17041)))

(declare-fun b!416486 () Bool)

(declare-fun res!242428 () Bool)

(declare-fun e!248628 () Bool)

(assert (=> b!416486 (=> (not res!242428) (not e!248628))))

(declare-datatypes ((array!25325 0))(
  ( (array!25326 (arr!12112 (Array (_ BitVec 32) (_ BitVec 64))) (size!12464 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25325)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15419 0))(
  ( (V!15420 (val!5412 Int)) )
))
(declare-datatypes ((ValueCell!5024 0))(
  ( (ValueCellFull!5024 (v!7659 V!15419)) (EmptyCell!5024) )
))
(declare-datatypes ((array!25327 0))(
  ( (array!25328 (arr!12113 (Array (_ BitVec 32) ValueCell!5024)) (size!12465 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25327)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!416486 (= res!242428 (and (= (size!12465 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12464 _keys!709) (size!12465 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!416488 () Bool)

(declare-fun e!248627 () Bool)

(declare-fun e!248624 () Bool)

(assert (=> b!416488 (= e!248627 (not e!248624))))

(declare-fun res!242433 () Bool)

(assert (=> b!416488 (=> res!242433 e!248624)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!416488 (= res!242433 (validKeyInArray!0 (select (arr!12112 _keys!709) from!863)))))

(declare-fun e!248623 () Bool)

(assert (=> b!416488 e!248623))

(declare-fun c!55088 () Bool)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!416488 (= c!55088 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun minValue!515 () V!15419)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((Unit!12310 0))(
  ( (Unit!12311) )
))
(declare-fun lt!190696 () Unit!12310)

(declare-fun zeroValue!515 () V!15419)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun v!412 () V!15419)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!411 (array!25325 array!25327 (_ BitVec 32) (_ BitVec 32) V!15419 V!15419 (_ BitVec 32) (_ BitVec 64) V!15419 (_ BitVec 32) Int) Unit!12310)

(assert (=> b!416488 (= lt!190696 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!411 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!416489 () Bool)

(assert (=> b!416489 (= e!248624 true)))

(declare-fun lt!190700 () V!15419)

(declare-datatypes ((tuple2!7058 0))(
  ( (tuple2!7059 (_1!3540 (_ BitVec 64)) (_2!3540 V!15419)) )
))
(declare-fun lt!190694 () tuple2!7058)

(declare-datatypes ((List!7077 0))(
  ( (Nil!7074) (Cons!7073 (h!7929 tuple2!7058) (t!12325 List!7077)) )
))
(declare-datatypes ((ListLongMap!5971 0))(
  ( (ListLongMap!5972 (toList!3001 List!7077)) )
))
(declare-fun lt!190699 () ListLongMap!5971)

(declare-fun +!1203 (ListLongMap!5971 tuple2!7058) ListLongMap!5971)

(assert (=> b!416489 (= (+!1203 lt!190699 lt!190694) (+!1203 (+!1203 lt!190699 (tuple2!7059 k!794 lt!190700)) lt!190694))))

(declare-fun lt!190695 () V!15419)

(assert (=> b!416489 (= lt!190694 (tuple2!7059 k!794 lt!190695))))

(declare-fun lt!190698 () Unit!12310)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!7 (ListLongMap!5971 (_ BitVec 64) V!15419 V!15419) Unit!12310)

(assert (=> b!416489 (= lt!190698 (addSameAsAddTwiceSameKeyDiffValues!7 lt!190699 k!794 lt!190700 lt!190695))))

(declare-fun lt!190697 () V!15419)

(declare-fun get!5987 (ValueCell!5024 V!15419) V!15419)

(assert (=> b!416489 (= lt!190700 (get!5987 (select (arr!12113 _values!549) from!863) lt!190697))))

(declare-fun lt!190701 () ListLongMap!5971)

(declare-fun lt!190702 () array!25325)

(assert (=> b!416489 (= lt!190701 (+!1203 lt!190699 (tuple2!7059 (select (arr!12112 lt!190702) from!863) lt!190695)))))

(assert (=> b!416489 (= lt!190695 (get!5987 (select (store (arr!12113 _values!549) i!563 (ValueCellFull!5024 v!412)) from!863) lt!190697))))

(declare-fun dynLambda!678 (Int (_ BitVec 64)) V!15419)

(assert (=> b!416489 (= lt!190697 (dynLambda!678 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!190703 () array!25327)

(declare-fun getCurrentListMapNoExtraKeys!1206 (array!25325 array!25327 (_ BitVec 32) (_ BitVec 32) V!15419 V!15419 (_ BitVec 32) Int) ListLongMap!5971)

(assert (=> b!416489 (= lt!190699 (getCurrentListMapNoExtraKeys!1206 lt!190702 lt!190703 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!416490 () Bool)

(declare-fun e!248621 () Bool)

(declare-fun e!248622 () Bool)

(declare-fun mapRes!17724 () Bool)

(assert (=> b!416490 (= e!248621 (and e!248622 mapRes!17724))))

(declare-fun condMapEmpty!17724 () Bool)

(declare-fun mapDefault!17724 () ValueCell!5024)

