; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39974 () Bool)

(assert start!39974)

(declare-fun b_free!10241 () Bool)

(declare-fun b_next!10241 () Bool)

(assert (=> start!39974 (= b_free!10241 (not b_next!10241))))

(declare-fun tp!36252 () Bool)

(declare-fun b_and!18141 () Bool)

(assert (=> start!39974 (= tp!36252 b_and!18141)))

(declare-fun b!434672 () Bool)

(declare-fun res!256000 () Bool)

(declare-fun e!256879 () Bool)

(assert (=> b!434672 (=> (not res!256000) (not e!256879))))

(declare-datatypes ((array!26617 0))(
  ( (array!26618 (arr!12758 (Array (_ BitVec 32) (_ BitVec 64))) (size!13110 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26617)

(declare-datatypes ((List!7601 0))(
  ( (Nil!7598) (Cons!7597 (h!8453 (_ BitVec 64)) (t!13291 List!7601)) )
))
(declare-fun arrayNoDuplicates!0 (array!26617 (_ BitVec 32) List!7601) Bool)

(assert (=> b!434672 (= res!256000 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7598))))

(declare-fun b!434673 () Bool)

(declare-fun res!255996 () Bool)

(assert (=> b!434673 (=> (not res!255996) (not e!256879))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!434673 (= res!255996 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13110 _keys!709))))))

(declare-fun b!434674 () Bool)

(declare-fun e!256877 () Bool)

(assert (=> b!434674 (= e!256877 true)))

(declare-datatypes ((V!16295 0))(
  ( (V!16296 (val!5741 Int)) )
))
(declare-datatypes ((tuple2!7598 0))(
  ( (tuple2!7599 (_1!3810 (_ BitVec 64)) (_2!3810 V!16295)) )
))
(declare-fun lt!199940 () tuple2!7598)

(declare-datatypes ((List!7602 0))(
  ( (Nil!7599) (Cons!7598 (h!8454 tuple2!7598) (t!13292 List!7602)) )
))
(declare-datatypes ((ListLongMap!6511 0))(
  ( (ListLongMap!6512 (toList!3271 List!7602)) )
))
(declare-fun lt!199938 () ListLongMap!6511)

(declare-fun lt!199931 () tuple2!7598)

(declare-fun lt!199929 () ListLongMap!6511)

(declare-fun +!1419 (ListLongMap!6511 tuple2!7598) ListLongMap!6511)

(assert (=> b!434674 (= lt!199929 (+!1419 (+!1419 lt!199938 lt!199931) lt!199940))))

(declare-fun lt!199926 () V!16295)

(declare-fun v!412 () V!16295)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun k!794 () (_ BitVec 64))

(declare-datatypes ((Unit!12894 0))(
  ( (Unit!12895) )
))
(declare-fun lt!199934 () Unit!12894)

(declare-fun addCommutativeForDiffKeys!403 (ListLongMap!6511 (_ BitVec 64) V!16295 (_ BitVec 64) V!16295) Unit!12894)

(assert (=> b!434674 (= lt!199934 (addCommutativeForDiffKeys!403 lt!199938 k!794 v!412 (select (arr!12758 _keys!709) from!863) lt!199926))))

(declare-fun mapIsEmpty!18711 () Bool)

(declare-fun mapRes!18711 () Bool)

(assert (=> mapIsEmpty!18711 mapRes!18711))

(declare-fun b!434675 () Bool)

(declare-fun e!256876 () Unit!12894)

(declare-fun Unit!12896 () Unit!12894)

(assert (=> b!434675 (= e!256876 Unit!12896)))

(declare-fun b!434676 () Bool)

(declare-fun res!255995 () Bool)

(assert (=> b!434676 (=> (not res!255995) (not e!256879))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!434676 (= res!255995 (validKeyInArray!0 k!794))))

(declare-fun b!434677 () Bool)

(declare-fun res!255999 () Bool)

(assert (=> b!434677 (=> (not res!255999) (not e!256879))))

(assert (=> b!434677 (= res!255999 (or (= (select (arr!12758 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12758 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!434678 () Bool)

(declare-fun e!256874 () Bool)

(declare-fun e!256880 () Bool)

(assert (=> b!434678 (= e!256874 (and e!256880 mapRes!18711))))

(declare-fun condMapEmpty!18711 () Bool)

(declare-datatypes ((ValueCell!5353 0))(
  ( (ValueCellFull!5353 (v!7988 V!16295)) (EmptyCell!5353) )
))
(declare-datatypes ((array!26619 0))(
  ( (array!26620 (arr!12759 (Array (_ BitVec 32) ValueCell!5353)) (size!13111 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26619)

(declare-fun mapDefault!18711 () ValueCell!5353)

