; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39392 () Bool)

(assert start!39392)

(declare-fun b_free!9659 () Bool)

(declare-fun b_next!9659 () Bool)

(assert (=> start!39392 (= b_free!9659 (not b_next!9659))))

(declare-fun tp!34506 () Bool)

(declare-fun b_and!17193 () Bool)

(assert (=> start!39392 (= tp!34506 b_and!17193)))

(declare-fun b!418728 () Bool)

(declare-fun res!244034 () Bool)

(declare-fun e!249650 () Bool)

(assert (=> b!418728 (=> (not res!244034) (not e!249650))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!418728 (= res!244034 (validMask!0 mask!1025))))

(declare-fun b!418729 () Bool)

(declare-fun res!244025 () Bool)

(assert (=> b!418729 (=> (not res!244025) (not e!249650))))

(declare-datatypes ((array!25473 0))(
  ( (array!25474 (arr!12186 (Array (_ BitVec 32) (_ BitVec 64))) (size!12538 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25473)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25473 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!418729 (= res!244025 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!17838 () Bool)

(declare-fun mapRes!17838 () Bool)

(declare-fun tp!34505 () Bool)

(declare-fun e!249648 () Bool)

(assert (=> mapNonEmpty!17838 (= mapRes!17838 (and tp!34505 e!249648))))

(declare-datatypes ((V!15519 0))(
  ( (V!15520 (val!5450 Int)) )
))
(declare-datatypes ((ValueCell!5062 0))(
  ( (ValueCellFull!5062 (v!7697 V!15519)) (EmptyCell!5062) )
))
(declare-fun mapValue!17838 () ValueCell!5062)

(declare-fun mapKey!17838 () (_ BitVec 32))

(declare-fun mapRest!17838 () (Array (_ BitVec 32) ValueCell!5062))

(declare-datatypes ((array!25475 0))(
  ( (array!25476 (arr!12187 (Array (_ BitVec 32) ValueCell!5062)) (size!12539 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25475)

(assert (=> mapNonEmpty!17838 (= (arr!12187 _values!549) (store mapRest!17838 mapKey!17838 mapValue!17838))))

(declare-fun b!418730 () Bool)

(declare-fun e!249647 () Bool)

(declare-fun e!249654 () Bool)

(assert (=> b!418730 (= e!249647 (not e!249654))))

(declare-fun res!244024 () Bool)

(assert (=> b!418730 (=> res!244024 e!249654)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!418730 (= res!244024 (validKeyInArray!0 (select (arr!12186 _keys!709) from!863)))))

(declare-fun e!249646 () Bool)

(assert (=> b!418730 e!249646))

(declare-fun c!55202 () Bool)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!418730 (= c!55202 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun minValue!515 () V!15519)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15519)

(declare-datatypes ((Unit!12376 0))(
  ( (Unit!12377) )
))
(declare-fun lt!191947 () Unit!12376)

(declare-fun v!412 () V!15519)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!439 (array!25473 array!25475 (_ BitVec 32) (_ BitVec 32) V!15519 V!15519 (_ BitVec 32) (_ BitVec 64) V!15519 (_ BitVec 32) Int) Unit!12376)

(assert (=> b!418730 (= lt!191947 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!439 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!418732 () Bool)

(declare-fun res!244032 () Bool)

(assert (=> b!418732 (=> (not res!244032) (not e!249650))))

(assert (=> b!418732 (= res!244032 (validKeyInArray!0 k!794))))

(declare-fun b!418733 () Bool)

(declare-fun res!244029 () Bool)

(declare-fun e!249651 () Bool)

(assert (=> b!418733 (=> (not res!244029) (not e!249651))))

(assert (=> b!418733 (= res!244029 (bvsle from!863 i!563))))

(declare-fun b!418734 () Bool)

(assert (=> b!418734 (= e!249650 e!249651)))

(declare-fun res!244023 () Bool)

(assert (=> b!418734 (=> (not res!244023) (not e!249651))))

(declare-fun lt!191955 () array!25473)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25473 (_ BitVec 32)) Bool)

(assert (=> b!418734 (= res!244023 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!191955 mask!1025))))

(assert (=> b!418734 (= lt!191955 (array!25474 (store (arr!12186 _keys!709) i!563 k!794) (size!12538 _keys!709)))))

(declare-fun b!418735 () Bool)

(declare-fun res!244031 () Bool)

(assert (=> b!418735 (=> (not res!244031) (not e!249650))))

(assert (=> b!418735 (= res!244031 (or (= (select (arr!12186 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12186 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!418736 () Bool)

(declare-fun res!244026 () Bool)

(assert (=> b!418736 (=> (not res!244026) (not e!249650))))

(assert (=> b!418736 (= res!244026 (and (= (size!12539 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12538 _keys!709) (size!12539 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!418737 () Bool)

(declare-fun e!249653 () Bool)

(declare-fun e!249652 () Bool)

(assert (=> b!418737 (= e!249653 (and e!249652 mapRes!17838))))

(declare-fun condMapEmpty!17838 () Bool)

(declare-fun mapDefault!17838 () ValueCell!5062)

