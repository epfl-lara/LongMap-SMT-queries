; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39806 () Bool)

(assert start!39806)

(declare-fun b_free!10073 () Bool)

(declare-fun b_next!10073 () Bool)

(assert (=> start!39806 (= b_free!10073 (not b_next!10073))))

(declare-fun tp!35747 () Bool)

(declare-fun b_and!17805 () Bool)

(assert (=> start!39806 (= tp!35747 b_and!17805)))

(declare-fun b!429492 () Bool)

(declare-fun e!254382 () Bool)

(declare-fun tp_is_empty!11225 () Bool)

(assert (=> b!429492 (= e!254382 tp_is_empty!11225)))

(declare-fun b!429493 () Bool)

(declare-fun res!252250 () Bool)

(declare-fun e!254387 () Bool)

(assert (=> b!429493 (=> (not res!252250) (not e!254387))))

(declare-datatypes ((array!26285 0))(
  ( (array!26286 (arr!12592 (Array (_ BitVec 32) (_ BitVec 64))) (size!12944 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26285)

(declare-datatypes ((List!7465 0))(
  ( (Nil!7462) (Cons!7461 (h!8317 (_ BitVec 64)) (t!12987 List!7465)) )
))
(declare-fun arrayNoDuplicates!0 (array!26285 (_ BitVec 32) List!7465) Bool)

(assert (=> b!429493 (= res!252250 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7462))))

(declare-fun b!429494 () Bool)

(declare-fun res!252240 () Bool)

(declare-fun e!254384 () Bool)

(assert (=> b!429494 (=> (not res!252240) (not e!254384))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!429494 (= res!252240 (bvsle from!863 i!563))))

(declare-fun b!429495 () Bool)

(declare-fun res!252247 () Bool)

(assert (=> b!429495 (=> (not res!252247) (not e!254387))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26285 (_ BitVec 32)) Bool)

(assert (=> b!429495 (= res!252247 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!429496 () Bool)

(declare-datatypes ((Unit!12620 0))(
  ( (Unit!12621) )
))
(declare-fun e!254386 () Unit!12620)

(declare-fun Unit!12622 () Unit!12620)

(assert (=> b!429496 (= e!254386 Unit!12622)))

(declare-fun lt!196289 () Unit!12620)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26285 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12620)

(assert (=> b!429496 (= lt!196289 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!429496 false))

(declare-fun b!429497 () Bool)

(declare-fun res!252242 () Bool)

(assert (=> b!429497 (=> (not res!252242) (not e!254387))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!429497 (= res!252242 (validMask!0 mask!1025))))

(declare-fun b!429498 () Bool)

(declare-fun e!254380 () Bool)

(declare-fun e!254381 () Bool)

(declare-fun mapRes!18459 () Bool)

(assert (=> b!429498 (= e!254380 (and e!254381 mapRes!18459))))

(declare-fun condMapEmpty!18459 () Bool)

(declare-datatypes ((V!16071 0))(
  ( (V!16072 (val!5657 Int)) )
))
(declare-datatypes ((ValueCell!5269 0))(
  ( (ValueCellFull!5269 (v!7904 V!16071)) (EmptyCell!5269) )
))
(declare-datatypes ((array!26287 0))(
  ( (array!26288 (arr!12593 (Array (_ BitVec 32) ValueCell!5269)) (size!12945 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26287)

(declare-fun mapDefault!18459 () ValueCell!5269)

