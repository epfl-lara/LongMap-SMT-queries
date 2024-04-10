; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41176 () Bool)

(assert start!41176)

(declare-fun b_free!11045 () Bool)

(declare-fun b_next!11045 () Bool)

(assert (=> start!41176 (= b_free!11045 (not b_next!11045))))

(declare-fun tp!38971 () Bool)

(declare-fun b_and!19329 () Bool)

(assert (=> start!41176 (= tp!38971 b_and!19329)))

(declare-fun b!460185 () Bool)

(declare-fun e!268508 () Bool)

(declare-fun tp_is_empty!12383 () Bool)

(assert (=> b!460185 (= e!268508 tp_is_empty!12383)))

(declare-fun b!460186 () Bool)

(declare-fun e!268505 () Bool)

(declare-fun e!268500 () Bool)

(assert (=> b!460186 (= e!268505 e!268500)))

(declare-fun res!275108 () Bool)

(assert (=> b!460186 (=> res!275108 e!268500)))

(declare-datatypes ((array!28567 0))(
  ( (array!28568 (arr!13724 (Array (_ BitVec 32) (_ BitVec 64))) (size!14076 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28567)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!460186 (= res!275108 (= k!794 (select (arr!13724 _keys!709) from!863)))))

(assert (=> b!460186 (not (= (select (arr!13724 _keys!709) from!863) k!794))))

(declare-datatypes ((Unit!13391 0))(
  ( (Unit!13392) )
))
(declare-fun lt!208326 () Unit!13391)

(declare-fun e!268504 () Unit!13391)

(assert (=> b!460186 (= lt!208326 e!268504)))

(declare-fun c!56516 () Bool)

(assert (=> b!460186 (= c!56516 (= (select (arr!13724 _keys!709) from!863) k!794))))

(declare-datatypes ((V!17615 0))(
  ( (V!17616 (val!6236 Int)) )
))
(declare-datatypes ((tuple2!8224 0))(
  ( (tuple2!8225 (_1!4123 (_ BitVec 64)) (_2!4123 V!17615)) )
))
(declare-datatypes ((List!8296 0))(
  ( (Nil!8293) (Cons!8292 (h!9148 tuple2!8224) (t!14220 List!8296)) )
))
(declare-datatypes ((ListLongMap!7137 0))(
  ( (ListLongMap!7138 (toList!3584 List!8296)) )
))
(declare-fun lt!208321 () ListLongMap!7137)

(declare-fun lt!208328 () ListLongMap!7137)

(assert (=> b!460186 (= lt!208321 lt!208328)))

(declare-fun lt!208319 () ListLongMap!7137)

(declare-fun lt!208330 () tuple2!8224)

(declare-fun +!1620 (ListLongMap!7137 tuple2!8224) ListLongMap!7137)

(assert (=> b!460186 (= lt!208328 (+!1620 lt!208319 lt!208330))))

(declare-fun lt!208324 () V!17615)

(assert (=> b!460186 (= lt!208330 (tuple2!8225 (select (arr!13724 _keys!709) from!863) lt!208324))))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((ValueCell!5848 0))(
  ( (ValueCellFull!5848 (v!8514 V!17615)) (EmptyCell!5848) )
))
(declare-datatypes ((array!28569 0))(
  ( (array!28570 (arr!13725 (Array (_ BitVec 32) ValueCell!5848)) (size!14077 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28569)

(declare-fun get!6773 (ValueCell!5848 V!17615) V!17615)

(declare-fun dynLambda!905 (Int (_ BitVec 64)) V!17615)

(assert (=> b!460186 (= lt!208324 (get!6773 (select (arr!13725 _values!549) from!863) (dynLambda!905 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!460187 () Bool)

(declare-fun e!268501 () Bool)

(declare-fun e!268507 () Bool)

(assert (=> b!460187 (= e!268501 e!268507)))

(declare-fun res!275102 () Bool)

(assert (=> b!460187 (=> (not res!275102) (not e!268507))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!460187 (= res!275102 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!17615)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!208331 () array!28567)

(declare-fun zeroValue!515 () V!17615)

(declare-fun lt!208323 () array!28569)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1764 (array!28567 array!28569 (_ BitVec 32) (_ BitVec 32) V!17615 V!17615 (_ BitVec 32) Int) ListLongMap!7137)

(assert (=> b!460187 (= lt!208321 (getCurrentListMapNoExtraKeys!1764 lt!208331 lt!208323 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!17615)

(assert (=> b!460187 (= lt!208323 (array!28570 (store (arr!13725 _values!549) i!563 (ValueCellFull!5848 v!412)) (size!14077 _values!549)))))

(declare-fun lt!208325 () ListLongMap!7137)

(assert (=> b!460187 (= lt!208325 (getCurrentListMapNoExtraKeys!1764 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!460188 () Bool)

(declare-fun res!275111 () Bool)

(declare-fun e!268506 () Bool)

(assert (=> b!460188 (=> (not res!275111) (not e!268506))))

(assert (=> b!460188 (= res!275111 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14076 _keys!709))))))

(declare-fun b!460189 () Bool)

(assert (=> b!460189 (= e!268507 (not e!268505))))

(declare-fun res!275113 () Bool)

(assert (=> b!460189 (=> res!275113 e!268505)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!460189 (= res!275113 (not (validKeyInArray!0 (select (arr!13724 _keys!709) from!863))))))

(declare-fun lt!208318 () ListLongMap!7137)

(assert (=> b!460189 (= lt!208318 lt!208319)))

(declare-fun lt!208317 () ListLongMap!7137)

(declare-fun lt!208322 () tuple2!8224)

(assert (=> b!460189 (= lt!208319 (+!1620 lt!208317 lt!208322))))

(assert (=> b!460189 (= lt!208318 (getCurrentListMapNoExtraKeys!1764 lt!208331 lt!208323 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!460189 (= lt!208322 (tuple2!8225 k!794 v!412))))

(assert (=> b!460189 (= lt!208317 (getCurrentListMapNoExtraKeys!1764 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!208327 () Unit!13391)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!776 (array!28567 array!28569 (_ BitVec 32) (_ BitVec 32) V!17615 V!17615 (_ BitVec 32) (_ BitVec 64) V!17615 (_ BitVec 32) Int) Unit!13391)

(assert (=> b!460189 (= lt!208327 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!776 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!460190 () Bool)

(declare-fun res!275106 () Bool)

(assert (=> b!460190 (=> (not res!275106) (not e!268506))))

(assert (=> b!460190 (= res!275106 (or (= (select (arr!13724 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13724 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!460191 () Bool)

(declare-fun e!268503 () Bool)

(declare-fun e!268502 () Bool)

(declare-fun mapRes!20224 () Bool)

(assert (=> b!460191 (= e!268503 (and e!268502 mapRes!20224))))

(declare-fun condMapEmpty!20224 () Bool)

(declare-fun mapDefault!20224 () ValueCell!5848)

