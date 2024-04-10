; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39968 () Bool)

(assert start!39968)

(declare-fun b_free!10235 () Bool)

(declare-fun b_next!10235 () Bool)

(assert (=> start!39968 (= b_free!10235 (not b_next!10235))))

(declare-fun tp!36233 () Bool)

(declare-fun b_and!18129 () Bool)

(assert (=> start!39968 (= tp!36233 b_and!18129)))

(declare-fun b!434486 () Bool)

(declare-fun res!255861 () Bool)

(declare-fun e!256789 () Bool)

(assert (=> b!434486 (=> (not res!255861) (not e!256789))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!434486 (= res!255861 (bvsle from!863 i!563))))

(declare-fun b!434487 () Bool)

(declare-fun res!255863 () Bool)

(declare-fun e!256790 () Bool)

(assert (=> b!434487 (=> (not res!255863) (not e!256790))))

(declare-datatypes ((array!26607 0))(
  ( (array!26608 (arr!12753 (Array (_ BitVec 32) (_ BitVec 64))) (size!13105 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26607)

(assert (=> b!434487 (= res!255863 (or (= (select (arr!12753 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12753 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!434489 () Bool)

(declare-fun e!256785 () Bool)

(declare-fun tp_is_empty!11387 () Bool)

(assert (=> b!434489 (= e!256785 tp_is_empty!11387)))

(declare-fun b!434490 () Bool)

(declare-fun res!255869 () Bool)

(assert (=> b!434490 (=> (not res!255869) (not e!256790))))

(assert (=> b!434490 (= res!255869 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13105 _keys!709))))))

(declare-fun b!434491 () Bool)

(declare-fun e!256783 () Bool)

(declare-fun e!256787 () Bool)

(assert (=> b!434491 (= e!256783 e!256787)))

(declare-fun res!255868 () Bool)

(assert (=> b!434491 (=> res!255868 e!256787)))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!434491 (= res!255868 (= k!794 (select (arr!12753 _keys!709) from!863)))))

(assert (=> b!434491 (not (= (select (arr!12753 _keys!709) from!863) k!794))))

(declare-datatypes ((Unit!12887 0))(
  ( (Unit!12888) )
))
(declare-fun lt!199796 () Unit!12887)

(declare-fun e!256788 () Unit!12887)

(assert (=> b!434491 (= lt!199796 e!256788)))

(declare-fun c!55688 () Bool)

(assert (=> b!434491 (= c!55688 (= (select (arr!12753 _keys!709) from!863) k!794))))

(declare-datatypes ((V!16287 0))(
  ( (V!16288 (val!5738 Int)) )
))
(declare-datatypes ((tuple2!7594 0))(
  ( (tuple2!7595 (_1!3808 (_ BitVec 64)) (_2!3808 V!16287)) )
))
(declare-datatypes ((List!7598 0))(
  ( (Nil!7595) (Cons!7594 (h!8450 tuple2!7594) (t!13282 List!7598)) )
))
(declare-datatypes ((ListLongMap!6507 0))(
  ( (ListLongMap!6508 (toList!3269 List!7598)) )
))
(declare-fun lt!199799 () ListLongMap!6507)

(declare-fun lt!199805 () ListLongMap!6507)

(assert (=> b!434491 (= lt!199799 lt!199805)))

(declare-fun lt!199791 () ListLongMap!6507)

(declare-fun lt!199794 () tuple2!7594)

(declare-fun +!1417 (ListLongMap!6507 tuple2!7594) ListLongMap!6507)

(assert (=> b!434491 (= lt!199805 (+!1417 lt!199791 lt!199794))))

(declare-fun lt!199800 () V!16287)

(assert (=> b!434491 (= lt!199794 (tuple2!7595 (select (arr!12753 _keys!709) from!863) lt!199800))))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((ValueCell!5350 0))(
  ( (ValueCellFull!5350 (v!7985 V!16287)) (EmptyCell!5350) )
))
(declare-datatypes ((array!26609 0))(
  ( (array!26610 (arr!12754 (Array (_ BitVec 32) ValueCell!5350)) (size!13106 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26609)

(declare-fun get!6352 (ValueCell!5350 V!16287) V!16287)

(declare-fun dynLambda!827 (Int (_ BitVec 64)) V!16287)

(assert (=> b!434491 (= lt!199800 (get!6352 (select (arr!12754 _values!549) from!863) (dynLambda!827 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!434492 () Bool)

(declare-fun res!255857 () Bool)

(assert (=> b!434492 (=> (not res!255857) (not e!256790))))

(declare-fun arrayContainsKey!0 (array!26607 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!434492 (= res!255857 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!434493 () Bool)

(declare-fun Unit!12889 () Unit!12887)

(assert (=> b!434493 (= e!256788 Unit!12889)))

(declare-fun b!434494 () Bool)

(declare-fun e!256784 () Bool)

(declare-fun e!256791 () Bool)

(declare-fun mapRes!18702 () Bool)

(assert (=> b!434494 (= e!256784 (and e!256791 mapRes!18702))))

(declare-fun condMapEmpty!18702 () Bool)

(declare-fun mapDefault!18702 () ValueCell!5350)

