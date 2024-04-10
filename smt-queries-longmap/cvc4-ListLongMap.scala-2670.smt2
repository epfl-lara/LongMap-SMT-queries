; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39842 () Bool)

(assert start!39842)

(declare-fun b_free!10109 () Bool)

(declare-fun b_next!10109 () Bool)

(assert (=> start!39842 (= b_free!10109 (not b_next!10109))))

(declare-fun tp!35856 () Bool)

(declare-fun b_and!17877 () Bool)

(assert (=> start!39842 (= tp!35856 b_and!17877)))

(declare-fun b!430580 () Bool)

(declare-fun e!254898 () Bool)

(declare-fun e!254899 () Bool)

(assert (=> b!430580 (= e!254898 e!254899)))

(declare-fun res!253021 () Bool)

(assert (=> b!430580 (=> (not res!253021) (not e!254899))))

(declare-datatypes ((array!26357 0))(
  ( (array!26358 (arr!12628 (Array (_ BitVec 32) (_ BitVec 64))) (size!12980 (_ BitVec 32))) )
))
(declare-fun lt!196970 () array!26357)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26357 (_ BitVec 32)) Bool)

(assert (=> b!430580 (= res!253021 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!196970 mask!1025))))

(declare-fun _keys!709 () array!26357)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!430580 (= lt!196970 (array!26358 (store (arr!12628 _keys!709) i!563 k!794) (size!12980 _keys!709)))))

(declare-fun b!430581 () Bool)

(declare-fun e!254900 () Bool)

(declare-fun e!254892 () Bool)

(assert (=> b!430581 (= e!254900 e!254892)))

(declare-fun res!253034 () Bool)

(assert (=> b!430581 (=> res!253034 e!254892)))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!430581 (= res!253034 (= k!794 (select (arr!12628 _keys!709) from!863)))))

(assert (=> b!430581 (not (= (select (arr!12628 _keys!709) from!863) k!794))))

(declare-datatypes ((Unit!12678 0))(
  ( (Unit!12679) )
))
(declare-fun lt!196965 () Unit!12678)

(declare-fun e!254901 () Unit!12678)

(assert (=> b!430581 (= lt!196965 e!254901)))

(declare-fun c!55499 () Bool)

(assert (=> b!430581 (= c!55499 (= (select (arr!12628 _keys!709) from!863) k!794))))

(declare-datatypes ((V!16119 0))(
  ( (V!16120 (val!5675 Int)) )
))
(declare-datatypes ((tuple2!7476 0))(
  ( (tuple2!7477 (_1!3749 (_ BitVec 64)) (_2!3749 V!16119)) )
))
(declare-datatypes ((List!7495 0))(
  ( (Nil!7492) (Cons!7491 (h!8347 tuple2!7476) (t!13053 List!7495)) )
))
(declare-datatypes ((ListLongMap!6389 0))(
  ( (ListLongMap!6390 (toList!3210 List!7495)) )
))
(declare-fun lt!196957 () ListLongMap!6389)

(declare-fun lt!196959 () ListLongMap!6389)

(assert (=> b!430581 (= lt!196957 lt!196959)))

(declare-fun lt!196961 () ListLongMap!6389)

(declare-fun lt!196966 () tuple2!7476)

(declare-fun +!1359 (ListLongMap!6389 tuple2!7476) ListLongMap!6389)

(assert (=> b!430581 (= lt!196959 (+!1359 lt!196961 lt!196966))))

(declare-fun lt!196962 () V!16119)

(assert (=> b!430581 (= lt!196966 (tuple2!7477 (select (arr!12628 _keys!709) from!863) lt!196962))))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((ValueCell!5287 0))(
  ( (ValueCellFull!5287 (v!7922 V!16119)) (EmptyCell!5287) )
))
(declare-datatypes ((array!26359 0))(
  ( (array!26360 (arr!12629 (Array (_ BitVec 32) ValueCell!5287)) (size!12981 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26359)

(declare-fun get!6267 (ValueCell!5287 V!16119) V!16119)

(declare-fun dynLambda!784 (Int (_ BitVec 64)) V!16119)

(assert (=> b!430581 (= lt!196962 (get!6267 (select (arr!12629 _values!549) from!863) (dynLambda!784 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!430582 () Bool)

(declare-fun e!254893 () Bool)

(declare-fun e!254896 () Bool)

(declare-fun mapRes!18513 () Bool)

(assert (=> b!430582 (= e!254893 (and e!254896 mapRes!18513))))

(declare-fun condMapEmpty!18513 () Bool)

(declare-fun mapDefault!18513 () ValueCell!5287)

