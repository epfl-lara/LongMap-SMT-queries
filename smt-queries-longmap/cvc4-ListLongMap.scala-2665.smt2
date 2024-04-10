; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39812 () Bool)

(assert start!39812)

(declare-fun b_free!10079 () Bool)

(declare-fun b_next!10079 () Bool)

(assert (=> start!39812 (= b_free!10079 (not b_next!10079))))

(declare-fun tp!35766 () Bool)

(declare-fun b_and!17817 () Bool)

(assert (=> start!39812 (= tp!35766 b_and!17817)))

(declare-fun b!429669 () Bool)

(declare-fun res!252375 () Bool)

(declare-fun e!254465 () Bool)

(assert (=> b!429669 (=> (not res!252375) (not e!254465))))

(declare-datatypes ((array!26297 0))(
  ( (array!26298 (arr!12598 (Array (_ BitVec 32) (_ BitVec 64))) (size!12950 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26297)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26297 (_ BitVec 32)) Bool)

(assert (=> b!429669 (= res!252375 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!429670 () Bool)

(declare-fun res!252371 () Bool)

(assert (=> b!429670 (=> (not res!252371) (not e!254465))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!429670 (= res!252371 (validMask!0 mask!1025))))

(declare-fun b!429671 () Bool)

(declare-fun e!254469 () Bool)

(assert (=> b!429671 (= e!254465 e!254469)))

(declare-fun res!252367 () Bool)

(assert (=> b!429671 (=> (not res!252367) (not e!254469))))

(declare-fun lt!196377 () array!26297)

(assert (=> b!429671 (= res!252367 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!196377 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!429671 (= lt!196377 (array!26298 (store (arr!12598 _keys!709) i!563 k!794) (size!12950 _keys!709)))))

(declare-fun b!429672 () Bool)

(declare-fun res!252369 () Bool)

(assert (=> b!429672 (=> (not res!252369) (not e!254465))))

(declare-datatypes ((List!7470 0))(
  ( (Nil!7467) (Cons!7466 (h!8322 (_ BitVec 64)) (t!12998 List!7470)) )
))
(declare-fun arrayNoDuplicates!0 (array!26297 (_ BitVec 32) List!7470) Bool)

(assert (=> b!429672 (= res!252369 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7467))))

(declare-fun b!429673 () Bool)

(declare-fun e!254463 () Bool)

(assert (=> b!429673 (= e!254463 true)))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!429673 (not (= (select (arr!12598 _keys!709) from!863) k!794))))

(declare-datatypes ((Unit!12629 0))(
  ( (Unit!12630) )
))
(declare-fun lt!196376 () Unit!12629)

(declare-fun e!254462 () Unit!12629)

(assert (=> b!429673 (= lt!196376 e!254462)))

(declare-fun c!55454 () Bool)

(assert (=> b!429673 (= c!55454 (= (select (arr!12598 _keys!709) from!863) k!794))))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((V!16079 0))(
  ( (V!16080 (val!5660 Int)) )
))
(declare-datatypes ((tuple2!7454 0))(
  ( (tuple2!7455 (_1!3738 (_ BitVec 64)) (_2!3738 V!16079)) )
))
(declare-datatypes ((List!7471 0))(
  ( (Nil!7468) (Cons!7467 (h!8323 tuple2!7454) (t!12999 List!7471)) )
))
(declare-datatypes ((ListLongMap!6367 0))(
  ( (ListLongMap!6368 (toList!3199 List!7471)) )
))
(declare-fun lt!196379 () ListLongMap!6367)

(declare-datatypes ((ValueCell!5272 0))(
  ( (ValueCellFull!5272 (v!7907 V!16079)) (EmptyCell!5272) )
))
(declare-datatypes ((array!26299 0))(
  ( (array!26300 (arr!12599 (Array (_ BitVec 32) ValueCell!5272)) (size!12951 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26299)

(declare-fun lt!196381 () ListLongMap!6367)

(declare-fun +!1348 (ListLongMap!6367 tuple2!7454) ListLongMap!6367)

(declare-fun get!6248 (ValueCell!5272 V!16079) V!16079)

(declare-fun dynLambda!775 (Int (_ BitVec 64)) V!16079)

(assert (=> b!429673 (= lt!196381 (+!1348 lt!196379 (tuple2!7455 (select (arr!12598 _keys!709) from!863) (get!6248 (select (arr!12599 _values!549) from!863) (dynLambda!775 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!429674 () Bool)

(declare-fun res!252377 () Bool)

(assert (=> b!429674 (=> (not res!252377) (not e!254465))))

(declare-fun arrayContainsKey!0 (array!26297 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!429674 (= res!252377 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!429675 () Bool)

(declare-fun res!252366 () Bool)

(assert (=> b!429675 (=> (not res!252366) (not e!254465))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!429675 (= res!252366 (validKeyInArray!0 k!794))))

(declare-fun b!429676 () Bool)

(declare-fun Unit!12631 () Unit!12629)

(assert (=> b!429676 (= e!254462 Unit!12631)))

(declare-fun lt!196378 () Unit!12629)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26297 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12629)

(assert (=> b!429676 (= lt!196378 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!429676 false))

(declare-fun mapIsEmpty!18468 () Bool)

(declare-fun mapRes!18468 () Bool)

(assert (=> mapIsEmpty!18468 mapRes!18468))

(declare-fun b!429678 () Bool)

(declare-fun res!252376 () Bool)

(assert (=> b!429678 (=> (not res!252376) (not e!254469))))

(assert (=> b!429678 (= res!252376 (bvsle from!863 i!563))))

(declare-fun b!429679 () Bool)

(declare-fun res!252374 () Bool)

(assert (=> b!429679 (=> (not res!252374) (not e!254465))))

(assert (=> b!429679 (= res!252374 (or (= (select (arr!12598 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12598 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!429680 () Bool)

(declare-fun res!252370 () Bool)

(assert (=> b!429680 (=> (not res!252370) (not e!254465))))

(assert (=> b!429680 (= res!252370 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12950 _keys!709))))))

(declare-fun b!429681 () Bool)

(declare-fun res!252373 () Bool)

(assert (=> b!429681 (=> (not res!252373) (not e!254465))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!429681 (= res!252373 (and (= (size!12951 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12950 _keys!709) (size!12951 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!429682 () Bool)

(declare-fun res!252365 () Bool)

(assert (=> b!429682 (=> (not res!252365) (not e!254469))))

(assert (=> b!429682 (= res!252365 (arrayNoDuplicates!0 lt!196377 #b00000000000000000000000000000000 Nil!7467))))

(declare-fun b!429683 () Bool)

(declare-fun e!254466 () Bool)

(assert (=> b!429683 (= e!254466 (not e!254463))))

(declare-fun res!252378 () Bool)

(assert (=> b!429683 (=> res!252378 e!254463)))

(assert (=> b!429683 (= res!252378 (not (validKeyInArray!0 (select (arr!12598 _keys!709) from!863))))))

(declare-fun lt!196385 () ListLongMap!6367)

(assert (=> b!429683 (= lt!196385 lt!196379)))

(declare-fun lt!196383 () ListLongMap!6367)

(declare-fun v!412 () V!16079)

(assert (=> b!429683 (= lt!196379 (+!1348 lt!196383 (tuple2!7455 k!794 v!412)))))

(declare-fun minValue!515 () V!16079)

(declare-fun zeroValue!515 () V!16079)

(declare-fun lt!196382 () array!26299)

(declare-fun getCurrentListMapNoExtraKeys!1401 (array!26297 array!26299 (_ BitVec 32) (_ BitVec 32) V!16079 V!16079 (_ BitVec 32) Int) ListLongMap!6367)

(assert (=> b!429683 (= lt!196385 (getCurrentListMapNoExtraKeys!1401 lt!196377 lt!196382 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!429683 (= lt!196383 (getCurrentListMapNoExtraKeys!1401 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!196380 () Unit!12629)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!537 (array!26297 array!26299 (_ BitVec 32) (_ BitVec 32) V!16079 V!16079 (_ BitVec 32) (_ BitVec 64) V!16079 (_ BitVec 32) Int) Unit!12629)

(assert (=> b!429683 (= lt!196380 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!537 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!429684 () Bool)

(declare-fun Unit!12632 () Unit!12629)

(assert (=> b!429684 (= e!254462 Unit!12632)))

(declare-fun b!429685 () Bool)

(declare-fun e!254468 () Bool)

(declare-fun tp_is_empty!11231 () Bool)

(assert (=> b!429685 (= e!254468 tp_is_empty!11231)))

(declare-fun b!429686 () Bool)

(assert (=> b!429686 (= e!254469 e!254466)))

(declare-fun res!252372 () Bool)

(assert (=> b!429686 (=> (not res!252372) (not e!254466))))

(assert (=> b!429686 (= res!252372 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!429686 (= lt!196381 (getCurrentListMapNoExtraKeys!1401 lt!196377 lt!196382 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!429686 (= lt!196382 (array!26300 (store (arr!12599 _values!549) i!563 (ValueCellFull!5272 v!412)) (size!12951 _values!549)))))

(declare-fun lt!196384 () ListLongMap!6367)

(assert (=> b!429686 (= lt!196384 (getCurrentListMapNoExtraKeys!1401 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!429677 () Bool)

(declare-fun e!254467 () Bool)

(assert (=> b!429677 (= e!254467 tp_is_empty!11231)))

(declare-fun res!252368 () Bool)

(assert (=> start!39812 (=> (not res!252368) (not e!254465))))

(assert (=> start!39812 (= res!252368 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12950 _keys!709))))))

(assert (=> start!39812 e!254465))

(assert (=> start!39812 tp_is_empty!11231))

(assert (=> start!39812 tp!35766))

(assert (=> start!39812 true))

(declare-fun e!254464 () Bool)

(declare-fun array_inv!9176 (array!26299) Bool)

(assert (=> start!39812 (and (array_inv!9176 _values!549) e!254464)))

(declare-fun array_inv!9177 (array!26297) Bool)

(assert (=> start!39812 (array_inv!9177 _keys!709)))

(declare-fun b!429687 () Bool)

(assert (=> b!429687 (= e!254464 (and e!254467 mapRes!18468))))

(declare-fun condMapEmpty!18468 () Bool)

(declare-fun mapDefault!18468 () ValueCell!5272)

