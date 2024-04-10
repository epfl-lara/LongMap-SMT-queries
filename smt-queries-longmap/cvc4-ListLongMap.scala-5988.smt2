; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77758 () Bool)

(assert start!77758)

(declare-fun b_free!16343 () Bool)

(declare-fun b_next!16343 () Bool)

(assert (=> start!77758 (= b_free!16343 (not b_next!16343))))

(declare-fun tp!57291 () Bool)

(declare-fun b_and!26839 () Bool)

(assert (=> start!77758 (= tp!57291 b_and!26839)))

(declare-fun b!907542 () Bool)

(declare-fun res!612535 () Bool)

(declare-fun e!508614 () Bool)

(assert (=> b!907542 (=> res!612535 e!508614)))

(declare-datatypes ((V!29979 0))(
  ( (V!29980 (val!9431 Int)) )
))
(declare-datatypes ((tuple2!12282 0))(
  ( (tuple2!12283 (_1!6152 (_ BitVec 64)) (_2!6152 V!29979)) )
))
(declare-datatypes ((List!18082 0))(
  ( (Nil!18079) (Cons!18078 (h!19224 tuple2!12282) (t!25597 List!18082)) )
))
(declare-datatypes ((ListLongMap!10979 0))(
  ( (ListLongMap!10980 (toList!5505 List!18082)) )
))
(declare-fun lt!409325 () ListLongMap!10979)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun lt!409326 () V!29979)

(declare-fun apply!489 (ListLongMap!10979 (_ BitVec 64)) V!29979)

(assert (=> b!907542 (= res!612535 (not (= (apply!489 lt!409325 k!1033) lt!409326)))))

(declare-fun b!907543 () Bool)

(declare-fun e!508617 () Bool)

(declare-fun e!508613 () Bool)

(assert (=> b!907543 (= e!508617 e!508613)))

(declare-fun res!612536 () Bool)

(assert (=> b!907543 (=> (not res!612536) (not e!508613))))

(declare-fun lt!409324 () ListLongMap!10979)

(declare-fun contains!4549 (ListLongMap!10979 (_ BitVec 64)) Bool)

(assert (=> b!907543 (= res!612536 (contains!4549 lt!409324 k!1033))))

(declare-datatypes ((ValueCell!8899 0))(
  ( (ValueCellFull!8899 (v!11936 V!29979)) (EmptyCell!8899) )
))
(declare-datatypes ((array!53554 0))(
  ( (array!53555 (arr!25736 (Array (_ BitVec 32) ValueCell!8899)) (size!26195 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53554)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!29979)

(declare-datatypes ((array!53556 0))(
  ( (array!53557 (arr!25737 (Array (_ BitVec 32) (_ BitVec 64))) (size!26196 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53556)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29979)

(declare-fun getCurrentListMap!2770 (array!53556 array!53554 (_ BitVec 32) (_ BitVec 32) V!29979 V!29979 (_ BitVec 32) Int) ListLongMap!10979)

(assert (=> b!907543 (= lt!409324 (getCurrentListMap!2770 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun mapNonEmpty!29854 () Bool)

(declare-fun mapRes!29854 () Bool)

(declare-fun tp!57290 () Bool)

(declare-fun e!508615 () Bool)

(assert (=> mapNonEmpty!29854 (= mapRes!29854 (and tp!57290 e!508615))))

(declare-fun mapRest!29854 () (Array (_ BitVec 32) ValueCell!8899))

(declare-fun mapKey!29854 () (_ BitVec 32))

(declare-fun mapValue!29854 () ValueCell!8899)

(assert (=> mapNonEmpty!29854 (= (arr!25736 _values!1152) (store mapRest!29854 mapKey!29854 mapValue!29854))))

(declare-fun b!907544 () Bool)

(declare-fun tp_is_empty!18761 () Bool)

(assert (=> b!907544 (= e!508615 tp_is_empty!18761)))

(declare-fun b!907545 () Bool)

(declare-fun res!612533 () Bool)

(assert (=> b!907545 (=> (not res!612533) (not e!508613))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!907545 (= res!612533 (inRange!0 i!717 mask!1756))))

(declare-fun b!907547 () Bool)

(declare-fun res!612537 () Bool)

(assert (=> b!907547 (=> (not res!612537) (not e!508617))))

(declare-datatypes ((List!18083 0))(
  ( (Nil!18080) (Cons!18079 (h!19225 (_ BitVec 64)) (t!25598 List!18083)) )
))
(declare-fun arrayNoDuplicates!0 (array!53556 (_ BitVec 32) List!18083) Bool)

(assert (=> b!907547 (= res!612537 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18080))))

(declare-fun b!907548 () Bool)

(declare-fun e!508612 () Bool)

(assert (=> b!907548 (= e!508612 tp_is_empty!18761)))

(declare-fun b!907549 () Bool)

(assert (=> b!907549 (= e!508614 (bvslt #b00000000000000000000000000000000 (size!26196 _keys!1386)))))

(assert (=> b!907549 (= (apply!489 lt!409324 k!1033) lt!409326)))

(declare-datatypes ((Unit!30800 0))(
  ( (Unit!30801) )
))
(declare-fun lt!409323 () Unit!30800)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!42 (array!53556 array!53554 (_ BitVec 32) (_ BitVec 32) V!29979 V!29979 (_ BitVec 64) V!29979 (_ BitVec 32) Int) Unit!30800)

(assert (=> b!907549 (= lt!409323 (lemmaListMapApplyFromThenApplyFromZero!42 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 lt!409326 i!717 defaultEntry!1160))))

(declare-fun b!907550 () Bool)

(declare-fun res!612539 () Bool)

(assert (=> b!907550 (=> (not res!612539) (not e!508613))))

(assert (=> b!907550 (= res!612539 (and (= (select (arr!25737 _keys!1386) i!717) k!1033) (not (= k!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!907551 () Bool)

(declare-fun res!612531 () Bool)

(assert (=> b!907551 (=> (not res!612531) (not e!508617))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53556 (_ BitVec 32)) Bool)

(assert (=> b!907551 (= res!612531 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!907552 () Bool)

(declare-fun e!508616 () Bool)

(assert (=> b!907552 (= e!508613 (not e!508616))))

(declare-fun res!612534 () Bool)

(assert (=> b!907552 (=> res!612534 e!508616)))

(assert (=> b!907552 (= res!612534 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26196 _keys!1386))))))

(declare-fun get!13539 (ValueCell!8899 V!29979) V!29979)

(declare-fun dynLambda!1365 (Int (_ BitVec 64)) V!29979)

(assert (=> b!907552 (= lt!409326 (get!13539 (select (arr!25736 _values!1152) i!717) (dynLambda!1365 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53556 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!907552 (arrayContainsKey!0 _keys!1386 k!1033 #b00000000000000000000000000000000)))

(declare-fun lt!409322 () Unit!30800)

(declare-fun lemmaKeyInListMapIsInArray!237 (array!53556 array!53554 (_ BitVec 32) (_ BitVec 32) V!29979 V!29979 (_ BitVec 64) Int) Unit!30800)

(assert (=> b!907552 (= lt!409322 (lemmaKeyInListMapIsInArray!237 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 defaultEntry!1160))))

(declare-fun mapIsEmpty!29854 () Bool)

(assert (=> mapIsEmpty!29854 mapRes!29854))

(declare-fun b!907553 () Bool)

(assert (=> b!907553 (= e!508616 e!508614)))

(declare-fun res!612532 () Bool)

(assert (=> b!907553 (=> res!612532 e!508614)))

(assert (=> b!907553 (= res!612532 (not (contains!4549 lt!409325 k!1033)))))

(assert (=> b!907553 (= lt!409325 (getCurrentListMap!2770 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!907554 () Bool)

(declare-fun e!508611 () Bool)

(assert (=> b!907554 (= e!508611 (and e!508612 mapRes!29854))))

(declare-fun condMapEmpty!29854 () Bool)

(declare-fun mapDefault!29854 () ValueCell!8899)

