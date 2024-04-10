; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39958 () Bool)

(assert start!39958)

(declare-fun b_free!10225 () Bool)

(declare-fun b_next!10225 () Bool)

(assert (=> start!39958 (= b_free!10225 (not b_next!10225))))

(declare-fun tp!36204 () Bool)

(declare-fun b_and!18109 () Bool)

(assert (=> start!39958 (= tp!36204 b_and!18109)))

(declare-fun b!434177 () Bool)

(declare-fun res!255638 () Bool)

(declare-fun e!256634 () Bool)

(assert (=> b!434177 (=> (not res!255638) (not e!256634))))

(declare-datatypes ((array!26587 0))(
  ( (array!26588 (arr!12743 (Array (_ BitVec 32) (_ BitVec 64))) (size!13095 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26587)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16275 0))(
  ( (V!16276 (val!5733 Int)) )
))
(declare-datatypes ((ValueCell!5345 0))(
  ( (ValueCellFull!5345 (v!7980 V!16275)) (EmptyCell!5345) )
))
(declare-datatypes ((array!26589 0))(
  ( (array!26590 (arr!12744 (Array (_ BitVec 32) ValueCell!5345)) (size!13096 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26589)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!434177 (= res!255638 (and (= (size!13096 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13095 _keys!709) (size!13096 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!18687 () Bool)

(declare-fun mapRes!18687 () Bool)

(declare-fun tp!36203 () Bool)

(declare-fun e!256638 () Bool)

(assert (=> mapNonEmpty!18687 (= mapRes!18687 (and tp!36203 e!256638))))

(declare-fun mapValue!18687 () ValueCell!5345)

(declare-fun mapRest!18687 () (Array (_ BitVec 32) ValueCell!5345))

(declare-fun mapKey!18687 () (_ BitVec 32))

(assert (=> mapNonEmpty!18687 (= (arr!12744 _values!549) (store mapRest!18687 mapKey!18687 mapValue!18687))))

(declare-fun b!434178 () Bool)

(declare-datatypes ((Unit!12870 0))(
  ( (Unit!12871) )
))
(declare-fun e!256641 () Unit!12870)

(declare-fun Unit!12872 () Unit!12870)

(assert (=> b!434178 (= e!256641 Unit!12872)))

(declare-fun lt!199566 () Unit!12870)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26587 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12870)

(assert (=> b!434178 (= lt!199566 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!434178 false))

(declare-fun b!434179 () Bool)

(declare-fun e!256639 () Bool)

(declare-fun e!256632 () Bool)

(assert (=> b!434179 (= e!256639 e!256632)))

(declare-fun res!255645 () Bool)

(assert (=> b!434179 (=> res!255645 e!256632)))

(assert (=> b!434179 (= res!255645 (= k!794 (select (arr!12743 _keys!709) from!863)))))

(assert (=> b!434179 (not (= (select (arr!12743 _keys!709) from!863) k!794))))

(declare-fun lt!199576 () Unit!12870)

(assert (=> b!434179 (= lt!199576 e!256641)))

(declare-fun c!55673 () Bool)

(assert (=> b!434179 (= c!55673 (= (select (arr!12743 _keys!709) from!863) k!794))))

(declare-datatypes ((tuple2!7584 0))(
  ( (tuple2!7585 (_1!3803 (_ BitVec 64)) (_2!3803 V!16275)) )
))
(declare-datatypes ((List!7589 0))(
  ( (Nil!7586) (Cons!7585 (h!8441 tuple2!7584) (t!13263 List!7589)) )
))
(declare-datatypes ((ListLongMap!6497 0))(
  ( (ListLongMap!6498 (toList!3264 List!7589)) )
))
(declare-fun lt!199568 () ListLongMap!6497)

(declare-fun lt!199580 () ListLongMap!6497)

(assert (=> b!434179 (= lt!199568 lt!199580)))

(declare-fun lt!199574 () ListLongMap!6497)

(declare-fun lt!199577 () tuple2!7584)

(declare-fun +!1412 (ListLongMap!6497 tuple2!7584) ListLongMap!6497)

(assert (=> b!434179 (= lt!199580 (+!1412 lt!199574 lt!199577))))

(declare-fun lt!199573 () V!16275)

(assert (=> b!434179 (= lt!199577 (tuple2!7585 (select (arr!12743 _keys!709) from!863) lt!199573))))

(declare-fun defaultEntry!557 () Int)

(declare-fun get!6346 (ValueCell!5345 V!16275) V!16275)

(declare-fun dynLambda!823 (Int (_ BitVec 64)) V!16275)

(assert (=> b!434179 (= lt!199573 (get!6346 (select (arr!12744 _values!549) from!863) (dynLambda!823 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!434180 () Bool)

(declare-fun res!255643 () Bool)

(declare-fun e!256633 () Bool)

(assert (=> b!434180 (=> (not res!255643) (not e!256633))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!434180 (= res!255643 (bvsle from!863 i!563))))

(declare-fun b!434176 () Bool)

(declare-fun e!256636 () Bool)

(declare-fun e!256635 () Bool)

(assert (=> b!434176 (= e!256636 (and e!256635 mapRes!18687))))

(declare-fun condMapEmpty!18687 () Bool)

(declare-fun mapDefault!18687 () ValueCell!5345)

