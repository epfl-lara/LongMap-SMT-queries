; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40132 () Bool)

(assert start!40132)

(declare-fun b_free!10399 () Bool)

(declare-fun b_next!10399 () Bool)

(assert (=> start!40132 (= b_free!10399 (not b_next!10399))))

(declare-fun tp!36725 () Bool)

(declare-fun b_and!18367 () Bool)

(assert (=> start!40132 (= tp!36725 b_and!18367)))

(declare-fun b!438932 () Bool)

(declare-fun e!258832 () Bool)

(declare-fun tp_is_empty!11551 () Bool)

(assert (=> b!438932 (= e!258832 tp_is_empty!11551)))

(declare-fun mapIsEmpty!18948 () Bool)

(declare-fun mapRes!18948 () Bool)

(assert (=> mapIsEmpty!18948 mapRes!18948))

(declare-fun b!438933 () Bool)

(declare-fun e!258831 () Bool)

(declare-fun e!258834 () Bool)

(assert (=> b!438933 (= e!258831 e!258834)))

(declare-fun res!259274 () Bool)

(assert (=> b!438933 (=> (not res!259274) (not e!258834))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!438933 (= res!259274 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((V!16507 0))(
  ( (V!16508 (val!5820 Int)) )
))
(declare-fun minValue!515 () V!16507)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16507)

(declare-datatypes ((ValueCell!5432 0))(
  ( (ValueCellFull!5432 (v!8067 V!16507)) (EmptyCell!5432) )
))
(declare-datatypes ((array!26919 0))(
  ( (array!26920 (arr!12909 (Array (_ BitVec 32) ValueCell!5432)) (size!13261 (_ BitVec 32))) )
))
(declare-fun lt!202115 () array!26919)

(declare-datatypes ((tuple2!7724 0))(
  ( (tuple2!7725 (_1!3873 (_ BitVec 64)) (_2!3873 V!16507)) )
))
(declare-datatypes ((List!7722 0))(
  ( (Nil!7719) (Cons!7718 (h!8574 tuple2!7724) (t!13478 List!7722)) )
))
(declare-datatypes ((ListLongMap!6637 0))(
  ( (ListLongMap!6638 (toList!3334 List!7722)) )
))
(declare-fun lt!202112 () ListLongMap!6637)

(declare-datatypes ((array!26921 0))(
  ( (array!26922 (arr!12910 (Array (_ BitVec 32) (_ BitVec 64))) (size!13262 (_ BitVec 32))) )
))
(declare-fun lt!202114 () array!26921)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1523 (array!26921 array!26919 (_ BitVec 32) (_ BitVec 32) V!16507 V!16507 (_ BitVec 32) Int) ListLongMap!6637)

(assert (=> b!438933 (= lt!202112 (getCurrentListMapNoExtraKeys!1523 lt!202114 lt!202115 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!26919)

(declare-fun v!412 () V!16507)

(assert (=> b!438933 (= lt!202115 (array!26920 (store (arr!12909 _values!549) i!563 (ValueCellFull!5432 v!412)) (size!13261 _values!549)))))

(declare-fun _keys!709 () array!26921)

(declare-fun lt!202111 () ListLongMap!6637)

(assert (=> b!438933 (= lt!202111 (getCurrentListMapNoExtraKeys!1523 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun res!259279 () Bool)

(declare-fun e!258837 () Bool)

(assert (=> start!40132 (=> (not res!259279) (not e!258837))))

(assert (=> start!40132 (= res!259279 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13262 _keys!709))))))

(assert (=> start!40132 e!258837))

(assert (=> start!40132 tp_is_empty!11551))

(assert (=> start!40132 tp!36725))

(assert (=> start!40132 true))

(declare-fun e!258835 () Bool)

(declare-fun array_inv!9376 (array!26919) Bool)

(assert (=> start!40132 (and (array_inv!9376 _values!549) e!258835)))

(declare-fun array_inv!9377 (array!26921) Bool)

(assert (=> start!40132 (array_inv!9377 _keys!709)))

(declare-fun b!438934 () Bool)

(declare-fun res!259276 () Bool)

(assert (=> b!438934 (=> (not res!259276) (not e!258831))))

(assert (=> b!438934 (= res!259276 (bvsle from!863 i!563))))

(declare-fun b!438935 () Bool)

(declare-fun res!259275 () Bool)

(assert (=> b!438935 (=> (not res!259275) (not e!258837))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26921 (_ BitVec 32)) Bool)

(assert (=> b!438935 (= res!259275 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!438936 () Bool)

(declare-fun res!259284 () Bool)

(assert (=> b!438936 (=> (not res!259284) (not e!258837))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!438936 (= res!259284 (validKeyInArray!0 k!794))))

(declare-fun b!438937 () Bool)

(assert (=> b!438937 (= e!258837 e!258831)))

(declare-fun res!259281 () Bool)

(assert (=> b!438937 (=> (not res!259281) (not e!258831))))

(assert (=> b!438937 (= res!259281 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202114 mask!1025))))

(assert (=> b!438937 (= lt!202114 (array!26922 (store (arr!12910 _keys!709) i!563 k!794) (size!13262 _keys!709)))))

(declare-fun b!438938 () Bool)

(declare-fun res!259272 () Bool)

(assert (=> b!438938 (=> (not res!259272) (not e!258837))))

(declare-fun arrayContainsKey!0 (array!26921 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!438938 (= res!259272 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!438939 () Bool)

(declare-fun res!259273 () Bool)

(assert (=> b!438939 (=> (not res!259273) (not e!258837))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!438939 (= res!259273 (validMask!0 mask!1025))))

(declare-fun b!438940 () Bool)

(assert (=> b!438940 (= e!258834 (not true))))

(declare-fun +!1476 (ListLongMap!6637 tuple2!7724) ListLongMap!6637)

(assert (=> b!438940 (= (getCurrentListMapNoExtraKeys!1523 lt!202114 lt!202115 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1476 (getCurrentListMapNoExtraKeys!1523 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7725 k!794 v!412)))))

(declare-datatypes ((Unit!13056 0))(
  ( (Unit!13057) )
))
(declare-fun lt!202113 () Unit!13056)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!645 (array!26921 array!26919 (_ BitVec 32) (_ BitVec 32) V!16507 V!16507 (_ BitVec 32) (_ BitVec 64) V!16507 (_ BitVec 32) Int) Unit!13056)

(assert (=> b!438940 (= lt!202113 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!645 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!438941 () Bool)

(declare-fun e!258833 () Bool)

(assert (=> b!438941 (= e!258833 tp_is_empty!11551)))

(declare-fun b!438942 () Bool)

(assert (=> b!438942 (= e!258835 (and e!258833 mapRes!18948))))

(declare-fun condMapEmpty!18948 () Bool)

(declare-fun mapDefault!18948 () ValueCell!5432)

