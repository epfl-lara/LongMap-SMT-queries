; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20542 () Bool)

(assert start!20542)

(declare-fun b_free!5201 () Bool)

(declare-fun b_next!5201 () Bool)

(assert (=> start!20542 (= b_free!5201 (not b_next!5201))))

(declare-fun tp!18634 () Bool)

(declare-fun b_and!11947 () Bool)

(assert (=> start!20542 (= tp!18634 b_and!11947)))

(declare-fun b!204255 () Bool)

(declare-fun e!133662 () Bool)

(declare-fun e!133661 () Bool)

(assert (=> b!204255 (= e!133662 e!133661)))

(declare-fun res!98367 () Bool)

(assert (=> b!204255 (=> res!98367 e!133661)))

(declare-fun k!843 () (_ BitVec 64))

(assert (=> b!204255 (= res!98367 (= k!843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!6389 0))(
  ( (V!6390 (val!2573 Int)) )
))
(declare-datatypes ((tuple2!3904 0))(
  ( (tuple2!3905 (_1!1963 (_ BitVec 64)) (_2!1963 V!6389)) )
))
(declare-datatypes ((List!2804 0))(
  ( (Nil!2801) (Cons!2800 (h!3442 tuple2!3904) (t!7735 List!2804)) )
))
(declare-datatypes ((ListLongMap!2817 0))(
  ( (ListLongMap!2818 (toList!1424 List!2804)) )
))
(declare-fun lt!103438 () ListLongMap!2817)

(declare-fun lt!103443 () ListLongMap!2817)

(assert (=> b!204255 (= lt!103438 lt!103443)))

(declare-fun lt!103436 () ListLongMap!2817)

(declare-fun lt!103433 () tuple2!3904)

(declare-fun +!451 (ListLongMap!2817 tuple2!3904) ListLongMap!2817)

(assert (=> b!204255 (= lt!103443 (+!451 lt!103436 lt!103433))))

(declare-fun lt!103432 () ListLongMap!2817)

(declare-fun lt!103442 () ListLongMap!2817)

(assert (=> b!204255 (= lt!103432 lt!103442)))

(declare-fun lt!103434 () ListLongMap!2817)

(assert (=> b!204255 (= lt!103442 (+!451 lt!103434 lt!103433))))

(declare-fun lt!103439 () ListLongMap!2817)

(assert (=> b!204255 (= lt!103438 (+!451 lt!103439 lt!103433))))

(declare-fun zeroValue!615 () V!6389)

(assert (=> b!204255 (= lt!103433 (tuple2!3905 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!204256 () Bool)

(declare-fun e!133663 () Bool)

(declare-fun e!133659 () Bool)

(declare-fun mapRes!8654 () Bool)

(assert (=> b!204256 (= e!133663 (and e!133659 mapRes!8654))))

(declare-fun condMapEmpty!8654 () Bool)

(declare-datatypes ((ValueCell!2185 0))(
  ( (ValueCellFull!2185 (v!4543 V!6389)) (EmptyCell!2185) )
))
(declare-datatypes ((array!9333 0))(
  ( (array!9334 (arr!4417 (Array (_ BitVec 32) ValueCell!2185)) (size!4742 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9333)

(declare-fun mapDefault!8654 () ValueCell!2185)

