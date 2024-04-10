; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39854 () Bool)

(assert start!39854)

(declare-fun b_free!10121 () Bool)

(declare-fun b_next!10121 () Bool)

(assert (=> start!39854 (= b_free!10121 (not b_next!10121))))

(declare-fun tp!35891 () Bool)

(declare-fun b_and!17901 () Bool)

(assert (=> start!39854 (= tp!35891 b_and!17901)))

(declare-fun res!253305 () Bool)

(declare-fun e!255079 () Bool)

(assert (=> start!39854 (=> (not res!253305) (not e!255079))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!26381 0))(
  ( (array!26382 (arr!12640 (Array (_ BitVec 32) (_ BitVec 64))) (size!12992 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26381)

(assert (=> start!39854 (= res!253305 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12992 _keys!709))))))

(assert (=> start!39854 e!255079))

(declare-fun tp_is_empty!11273 () Bool)

(assert (=> start!39854 tp_is_empty!11273))

(assert (=> start!39854 tp!35891))

(assert (=> start!39854 true))

(declare-datatypes ((V!16135 0))(
  ( (V!16136 (val!5681 Int)) )
))
(declare-datatypes ((ValueCell!5293 0))(
  ( (ValueCellFull!5293 (v!7928 V!16135)) (EmptyCell!5293) )
))
(declare-datatypes ((array!26383 0))(
  ( (array!26384 (arr!12641 (Array (_ BitVec 32) ValueCell!5293)) (size!12993 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26383)

(declare-fun e!255080 () Bool)

(declare-fun array_inv!9202 (array!26383) Bool)

(assert (=> start!39854 (and (array_inv!9202 _values!549) e!255080)))

(declare-fun array_inv!9203 (array!26381) Bool)

(assert (=> start!39854 (array_inv!9203 _keys!709)))

(declare-fun b!430952 () Bool)

(declare-fun e!255073 () Bool)

(declare-fun e!255078 () Bool)

(assert (=> b!430952 (= e!255073 e!255078)))

(declare-fun res!253296 () Bool)

(assert (=> b!430952 (=> res!253296 e!255078)))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!430952 (= res!253296 (= k!794 (select (arr!12640 _keys!709) from!863)))))

(assert (=> b!430952 (not (= (select (arr!12640 _keys!709) from!863) k!794))))

(declare-datatypes ((Unit!12694 0))(
  ( (Unit!12695) )
))
(declare-fun lt!197231 () Unit!12694)

(declare-fun e!255076 () Unit!12694)

(assert (=> b!430952 (= lt!197231 e!255076)))

(declare-fun c!55517 () Bool)

(assert (=> b!430952 (= c!55517 (= (select (arr!12640 _keys!709) from!863) k!794))))

(declare-datatypes ((tuple2!7486 0))(
  ( (tuple2!7487 (_1!3754 (_ BitVec 64)) (_2!3754 V!16135)) )
))
(declare-datatypes ((List!7503 0))(
  ( (Nil!7500) (Cons!7499 (h!8355 tuple2!7486) (t!13073 List!7503)) )
))
(declare-datatypes ((ListLongMap!6399 0))(
  ( (ListLongMap!6400 (toList!3215 List!7503)) )
))
(declare-fun lt!197229 () ListLongMap!6399)

(declare-fun lt!197237 () ListLongMap!6399)

(assert (=> b!430952 (= lt!197229 lt!197237)))

(declare-fun lt!197234 () ListLongMap!6399)

(declare-fun lt!197227 () tuple2!7486)

(declare-fun +!1364 (ListLongMap!6399 tuple2!7486) ListLongMap!6399)

(assert (=> b!430952 (= lt!197237 (+!1364 lt!197234 lt!197227))))

(declare-fun lt!197233 () V!16135)

(assert (=> b!430952 (= lt!197227 (tuple2!7487 (select (arr!12640 _keys!709) from!863) lt!197233))))

(declare-fun defaultEntry!557 () Int)

(declare-fun get!6274 (ValueCell!5293 V!16135) V!16135)

(declare-fun dynLambda!787 (Int (_ BitVec 64)) V!16135)

(assert (=> b!430952 (= lt!197233 (get!6274 (select (arr!12641 _values!549) from!863) (dynLambda!787 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!430953 () Bool)

(declare-fun e!255075 () Bool)

(declare-fun e!255072 () Bool)

(assert (=> b!430953 (= e!255075 e!255072)))

(declare-fun res!253303 () Bool)

(assert (=> b!430953 (=> (not res!253303) (not e!255072))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!430953 (= res!253303 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16135)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16135)

(declare-fun lt!197238 () array!26381)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lt!197232 () array!26383)

(declare-fun getCurrentListMapNoExtraKeys!1416 (array!26381 array!26383 (_ BitVec 32) (_ BitVec 32) V!16135 V!16135 (_ BitVec 32) Int) ListLongMap!6399)

(assert (=> b!430953 (= lt!197229 (getCurrentListMapNoExtraKeys!1416 lt!197238 lt!197232 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16135)

(assert (=> b!430953 (= lt!197232 (array!26384 (store (arr!12641 _values!549) i!563 (ValueCellFull!5293 v!412)) (size!12993 _values!549)))))

(declare-fun lt!197228 () ListLongMap!6399)

(assert (=> b!430953 (= lt!197228 (getCurrentListMapNoExtraKeys!1416 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!430954 () Bool)

(declare-fun e!255074 () Bool)

(assert (=> b!430954 (= e!255074 tp_is_empty!11273)))

(declare-fun mapNonEmpty!18531 () Bool)

(declare-fun mapRes!18531 () Bool)

(declare-fun tp!35892 () Bool)

(declare-fun e!255077 () Bool)

(assert (=> mapNonEmpty!18531 (= mapRes!18531 (and tp!35892 e!255077))))

(declare-fun mapKey!18531 () (_ BitVec 32))

(declare-fun mapValue!18531 () ValueCell!5293)

(declare-fun mapRest!18531 () (Array (_ BitVec 32) ValueCell!5293))

(assert (=> mapNonEmpty!18531 (= (arr!12641 _values!549) (store mapRest!18531 mapKey!18531 mapValue!18531))))

(declare-fun b!430955 () Bool)

(declare-fun res!253293 () Bool)

(assert (=> b!430955 (=> (not res!253293) (not e!255079))))

(declare-fun arrayContainsKey!0 (array!26381 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!430955 (= res!253293 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!430956 () Bool)

(assert (=> b!430956 (= e!255072 (not e!255073))))

(declare-fun res!253300 () Bool)

(assert (=> b!430956 (=> res!253300 e!255073)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!430956 (= res!253300 (not (validKeyInArray!0 (select (arr!12640 _keys!709) from!863))))))

(declare-fun lt!197226 () ListLongMap!6399)

(assert (=> b!430956 (= lt!197226 lt!197234)))

(declare-fun lt!197230 () ListLongMap!6399)

(declare-fun lt!197239 () tuple2!7486)

(assert (=> b!430956 (= lt!197234 (+!1364 lt!197230 lt!197239))))

(assert (=> b!430956 (= lt!197226 (getCurrentListMapNoExtraKeys!1416 lt!197238 lt!197232 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!430956 (= lt!197239 (tuple2!7487 k!794 v!412))))

(assert (=> b!430956 (= lt!197230 (getCurrentListMapNoExtraKeys!1416 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!197235 () Unit!12694)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!552 (array!26381 array!26383 (_ BitVec 32) (_ BitVec 32) V!16135 V!16135 (_ BitVec 32) (_ BitVec 64) V!16135 (_ BitVec 32) Int) Unit!12694)

(assert (=> b!430956 (= lt!197235 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!552 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!430957 () Bool)

(declare-fun res!253292 () Bool)

(assert (=> b!430957 (=> (not res!253292) (not e!255079))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!430957 (= res!253292 (validMask!0 mask!1025))))

(declare-fun b!430958 () Bool)

(declare-fun res!253301 () Bool)

(assert (=> b!430958 (=> (not res!253301) (not e!255079))))

(assert (=> b!430958 (= res!253301 (or (= (select (arr!12640 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12640 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!430959 () Bool)

(declare-fun res!253297 () Bool)

(assert (=> b!430959 (=> (not res!253297) (not e!255075))))

(assert (=> b!430959 (= res!253297 (bvsle from!863 i!563))))

(declare-fun b!430960 () Bool)

(assert (=> b!430960 (= e!255079 e!255075)))

(declare-fun res!253295 () Bool)

(assert (=> b!430960 (=> (not res!253295) (not e!255075))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26381 (_ BitVec 32)) Bool)

(assert (=> b!430960 (= res!253295 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!197238 mask!1025))))

(assert (=> b!430960 (= lt!197238 (array!26382 (store (arr!12640 _keys!709) i!563 k!794) (size!12992 _keys!709)))))

(declare-fun mapIsEmpty!18531 () Bool)

(assert (=> mapIsEmpty!18531 mapRes!18531))

(declare-fun b!430961 () Bool)

(assert (=> b!430961 (= e!255078 true)))

(assert (=> b!430961 (= lt!197237 (+!1364 (+!1364 lt!197230 lt!197227) lt!197239))))

(declare-fun lt!197236 () Unit!12694)

(declare-fun addCommutativeForDiffKeys!359 (ListLongMap!6399 (_ BitVec 64) V!16135 (_ BitVec 64) V!16135) Unit!12694)

(assert (=> b!430961 (= lt!197236 (addCommutativeForDiffKeys!359 lt!197230 k!794 v!412 (select (arr!12640 _keys!709) from!863) lt!197233))))

(declare-fun b!430962 () Bool)

(assert (=> b!430962 (= e!255077 tp_is_empty!11273)))

(declare-fun b!430963 () Bool)

(declare-fun res!253298 () Bool)

(assert (=> b!430963 (=> (not res!253298) (not e!255079))))

(assert (=> b!430963 (= res!253298 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!430964 () Bool)

(declare-fun res!253304 () Bool)

(assert (=> b!430964 (=> (not res!253304) (not e!255079))))

(assert (=> b!430964 (= res!253304 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12992 _keys!709))))))

(declare-fun b!430965 () Bool)

(assert (=> b!430965 (= e!255080 (and e!255074 mapRes!18531))))

(declare-fun condMapEmpty!18531 () Bool)

(declare-fun mapDefault!18531 () ValueCell!5293)

