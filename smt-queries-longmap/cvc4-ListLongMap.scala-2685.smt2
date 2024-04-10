; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39932 () Bool)

(assert start!39932)

(declare-fun b_free!10199 () Bool)

(declare-fun b_next!10199 () Bool)

(assert (=> start!39932 (= b_free!10199 (not b_next!10199))))

(declare-fun tp!36126 () Bool)

(declare-fun b_and!18057 () Bool)

(assert (=> start!39932 (= tp!36126 b_and!18057)))

(declare-fun b!433370 () Bool)

(declare-fun res!255047 () Bool)

(declare-fun e!256251 () Bool)

(assert (=> b!433370 (=> (not res!255047) (not e!256251))))

(declare-datatypes ((array!26535 0))(
  ( (array!26536 (arr!12717 (Array (_ BitVec 32) (_ BitVec 64))) (size!13069 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26535)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!433370 (= res!255047 (or (= (select (arr!12717 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12717 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!433371 () Bool)

(declare-fun res!255051 () Bool)

(assert (=> b!433371 (=> (not res!255051) (not e!256251))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!433371 (= res!255051 (validMask!0 mask!1025))))

(declare-fun b!433372 () Bool)

(declare-fun e!256245 () Bool)

(assert (=> b!433372 (= e!256245 true)))

(declare-datatypes ((V!16239 0))(
  ( (V!16240 (val!5720 Int)) )
))
(declare-datatypes ((tuple2!7558 0))(
  ( (tuple2!7559 (_1!3790 (_ BitVec 64)) (_2!3790 V!16239)) )
))
(declare-datatypes ((List!7567 0))(
  ( (Nil!7564) (Cons!7563 (h!8419 tuple2!7558) (t!13215 List!7567)) )
))
(declare-datatypes ((ListLongMap!6471 0))(
  ( (ListLongMap!6472 (toList!3251 List!7567)) )
))
(declare-fun lt!198992 () ListLongMap!6471)

(declare-fun lt!198991 () tuple2!7558)

(declare-fun lt!198982 () tuple2!7558)

(declare-fun lt!198985 () ListLongMap!6471)

(declare-fun +!1399 (ListLongMap!6471 tuple2!7558) ListLongMap!6471)

(assert (=> b!433372 (= lt!198992 (+!1399 (+!1399 lt!198985 lt!198991) lt!198982))))

(declare-datatypes ((Unit!12824 0))(
  ( (Unit!12825) )
))
(declare-fun lt!198986 () Unit!12824)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun lt!198990 () V!16239)

(declare-fun v!412 () V!16239)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun addCommutativeForDiffKeys!388 (ListLongMap!6471 (_ BitVec 64) V!16239 (_ BitVec 64) V!16239) Unit!12824)

(assert (=> b!433372 (= lt!198986 (addCommutativeForDiffKeys!388 lt!198985 k!794 v!412 (select (arr!12717 _keys!709) from!863) lt!198990))))

(declare-fun res!255048 () Bool)

(assert (=> start!39932 (=> (not res!255048) (not e!256251))))

(assert (=> start!39932 (= res!255048 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13069 _keys!709))))))

(assert (=> start!39932 e!256251))

(declare-fun tp_is_empty!11351 () Bool)

(assert (=> start!39932 tp_is_empty!11351))

(assert (=> start!39932 tp!36126))

(assert (=> start!39932 true))

(declare-datatypes ((ValueCell!5332 0))(
  ( (ValueCellFull!5332 (v!7967 V!16239)) (EmptyCell!5332) )
))
(declare-datatypes ((array!26537 0))(
  ( (array!26538 (arr!12718 (Array (_ BitVec 32) ValueCell!5332)) (size!13070 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26537)

(declare-fun e!256242 () Bool)

(declare-fun array_inv!9254 (array!26537) Bool)

(assert (=> start!39932 (and (array_inv!9254 _values!549) e!256242)))

(declare-fun array_inv!9255 (array!26535) Bool)

(assert (=> start!39932 (array_inv!9255 _keys!709)))

(declare-fun b!433373 () Bool)

(declare-fun res!255055 () Bool)

(assert (=> b!433373 (=> (not res!255055) (not e!256251))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!433373 (= res!255055 (and (= (size!13070 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13069 _keys!709) (size!13070 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!433374 () Bool)

(declare-fun e!256247 () Unit!12824)

(declare-fun Unit!12826 () Unit!12824)

(assert (=> b!433374 (= e!256247 Unit!12826)))

(declare-fun lt!198987 () Unit!12824)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26535 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12824)

(assert (=> b!433374 (= lt!198987 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!433374 false))

(declare-fun b!433375 () Bool)

(declare-fun e!256244 () Bool)

(assert (=> b!433375 (= e!256244 e!256245)))

(declare-fun res!255046 () Bool)

(assert (=> b!433375 (=> res!255046 e!256245)))

(assert (=> b!433375 (= res!255046 (= k!794 (select (arr!12717 _keys!709) from!863)))))

(assert (=> b!433375 (not (= (select (arr!12717 _keys!709) from!863) k!794))))

(declare-fun lt!198993 () Unit!12824)

(assert (=> b!433375 (= lt!198993 e!256247)))

(declare-fun c!55634 () Bool)

(assert (=> b!433375 (= c!55634 (= (select (arr!12717 _keys!709) from!863) k!794))))

(declare-fun lt!198989 () ListLongMap!6471)

(assert (=> b!433375 (= lt!198989 lt!198992)))

(declare-fun lt!198995 () ListLongMap!6471)

(assert (=> b!433375 (= lt!198992 (+!1399 lt!198995 lt!198991))))

(assert (=> b!433375 (= lt!198991 (tuple2!7559 (select (arr!12717 _keys!709) from!863) lt!198990))))

(declare-fun defaultEntry!557 () Int)

(declare-fun get!6325 (ValueCell!5332 V!16239) V!16239)

(declare-fun dynLambda!812 (Int (_ BitVec 64)) V!16239)

(assert (=> b!433375 (= lt!198990 (get!6325 (select (arr!12718 _values!549) from!863) (dynLambda!812 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!433376 () Bool)

(declare-fun res!255060 () Bool)

(declare-fun e!256246 () Bool)

(assert (=> b!433376 (=> (not res!255060) (not e!256246))))

(assert (=> b!433376 (= res!255060 (bvsle from!863 i!563))))

(declare-fun mapNonEmpty!18648 () Bool)

(declare-fun mapRes!18648 () Bool)

(declare-fun tp!36125 () Bool)

(declare-fun e!256248 () Bool)

(assert (=> mapNonEmpty!18648 (= mapRes!18648 (and tp!36125 e!256248))))

(declare-fun mapKey!18648 () (_ BitVec 32))

(declare-fun mapRest!18648 () (Array (_ BitVec 32) ValueCell!5332))

(declare-fun mapValue!18648 () ValueCell!5332)

(assert (=> mapNonEmpty!18648 (= (arr!12718 _values!549) (store mapRest!18648 mapKey!18648 mapValue!18648))))

(declare-fun b!433377 () Bool)

(declare-fun res!255053 () Bool)

(assert (=> b!433377 (=> (not res!255053) (not e!256251))))

(declare-fun arrayContainsKey!0 (array!26535 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!433377 (= res!255053 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!433378 () Bool)

(declare-fun res!255052 () Bool)

(assert (=> b!433378 (=> (not res!255052) (not e!256246))))

(declare-fun lt!198988 () array!26535)

(declare-datatypes ((List!7568 0))(
  ( (Nil!7565) (Cons!7564 (h!8420 (_ BitVec 64)) (t!13216 List!7568)) )
))
(declare-fun arrayNoDuplicates!0 (array!26535 (_ BitVec 32) List!7568) Bool)

(assert (=> b!433378 (= res!255052 (arrayNoDuplicates!0 lt!198988 #b00000000000000000000000000000000 Nil!7565))))

(declare-fun b!433379 () Bool)

(declare-fun e!256250 () Bool)

(assert (=> b!433379 (= e!256250 (not e!256244))))

(declare-fun res!255058 () Bool)

(assert (=> b!433379 (=> res!255058 e!256244)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!433379 (= res!255058 (not (validKeyInArray!0 (select (arr!12717 _keys!709) from!863))))))

(declare-fun lt!198983 () ListLongMap!6471)

(assert (=> b!433379 (= lt!198983 lt!198995)))

(assert (=> b!433379 (= lt!198995 (+!1399 lt!198985 lt!198982))))

(declare-fun minValue!515 () V!16239)

(declare-fun zeroValue!515 () V!16239)

(declare-fun lt!198994 () array!26537)

(declare-fun getCurrentListMapNoExtraKeys!1447 (array!26535 array!26537 (_ BitVec 32) (_ BitVec 32) V!16239 V!16239 (_ BitVec 32) Int) ListLongMap!6471)

(assert (=> b!433379 (= lt!198983 (getCurrentListMapNoExtraKeys!1447 lt!198988 lt!198994 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!433379 (= lt!198982 (tuple2!7559 k!794 v!412))))

(assert (=> b!433379 (= lt!198985 (getCurrentListMapNoExtraKeys!1447 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!198984 () Unit!12824)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!580 (array!26535 array!26537 (_ BitVec 32) (_ BitVec 32) V!16239 V!16239 (_ BitVec 32) (_ BitVec 64) V!16239 (_ BitVec 32) Int) Unit!12824)

(assert (=> b!433379 (= lt!198984 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!580 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!18648 () Bool)

(assert (=> mapIsEmpty!18648 mapRes!18648))

(declare-fun b!433380 () Bool)

(assert (=> b!433380 (= e!256248 tp_is_empty!11351)))

(declare-fun b!433381 () Bool)

(declare-fun Unit!12827 () Unit!12824)

(assert (=> b!433381 (= e!256247 Unit!12827)))

(declare-fun b!433382 () Bool)

(declare-fun e!256243 () Bool)

(assert (=> b!433382 (= e!256243 tp_is_empty!11351)))

(declare-fun b!433383 () Bool)

(declare-fun res!255056 () Bool)

(assert (=> b!433383 (=> (not res!255056) (not e!256251))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26535 (_ BitVec 32)) Bool)

(assert (=> b!433383 (= res!255056 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!433384 () Bool)

(declare-fun res!255054 () Bool)

(assert (=> b!433384 (=> (not res!255054) (not e!256251))))

(assert (=> b!433384 (= res!255054 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7565))))

(declare-fun b!433385 () Bool)

(declare-fun res!255050 () Bool)

(assert (=> b!433385 (=> (not res!255050) (not e!256251))))

(assert (=> b!433385 (= res!255050 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13069 _keys!709))))))

(declare-fun b!433386 () Bool)

(assert (=> b!433386 (= e!256242 (and e!256243 mapRes!18648))))

(declare-fun condMapEmpty!18648 () Bool)

(declare-fun mapDefault!18648 () ValueCell!5332)

