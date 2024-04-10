; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39988 () Bool)

(assert start!39988)

(declare-fun b_free!10255 () Bool)

(declare-fun b_next!10255 () Bool)

(assert (=> start!39988 (= b_free!10255 (not b_next!10255))))

(declare-fun tp!36294 () Bool)

(declare-fun b_and!18169 () Bool)

(assert (=> start!39988 (= tp!36294 b_and!18169)))

(declare-fun b!435106 () Bool)

(declare-datatypes ((Unit!12914 0))(
  ( (Unit!12915) )
))
(declare-fun e!257087 () Unit!12914)

(declare-fun Unit!12916 () Unit!12914)

(assert (=> b!435106 (= e!257087 Unit!12916)))

(declare-fun lt!200242 () Unit!12914)

(declare-fun k!794 () (_ BitVec 64))

(declare-datatypes ((array!26645 0))(
  ( (array!26646 (arr!12772 (Array (_ BitVec 32) (_ BitVec 64))) (size!13124 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26645)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26645 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12914)

(assert (=> b!435106 (= lt!200242 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!435106 false))

(declare-fun b!435107 () Bool)

(declare-fun e!257083 () Bool)

(assert (=> b!435107 (= e!257083 true)))

(declare-datatypes ((V!16315 0))(
  ( (V!16316 (val!5748 Int)) )
))
(declare-datatypes ((tuple2!7610 0))(
  ( (tuple2!7611 (_1!3816 (_ BitVec 64)) (_2!3816 V!16315)) )
))
(declare-fun lt!200251 () tuple2!7610)

(declare-fun lt!200245 () tuple2!7610)

(declare-datatypes ((List!7613 0))(
  ( (Nil!7610) (Cons!7609 (h!8465 tuple2!7610) (t!13317 List!7613)) )
))
(declare-datatypes ((ListLongMap!6523 0))(
  ( (ListLongMap!6524 (toList!3277 List!7613)) )
))
(declare-fun lt!200248 () ListLongMap!6523)

(declare-fun lt!200249 () ListLongMap!6523)

(declare-fun +!1425 (ListLongMap!6523 tuple2!7610) ListLongMap!6523)

(assert (=> b!435107 (= lt!200249 (+!1425 (+!1425 lt!200248 lt!200245) lt!200251))))

(declare-fun lt!200250 () Unit!12914)

(declare-fun lt!200241 () V!16315)

(declare-fun v!412 () V!16315)

(declare-fun addCommutativeForDiffKeys!409 (ListLongMap!6523 (_ BitVec 64) V!16315 (_ BitVec 64) V!16315) Unit!12914)

(assert (=> b!435107 (= lt!200250 (addCommutativeForDiffKeys!409 lt!200248 k!794 v!412 (select (arr!12772 _keys!709) from!863) lt!200241))))

(declare-fun b!435108 () Bool)

(declare-fun e!257089 () Bool)

(assert (=> b!435108 (= e!257089 e!257083)))

(declare-fun res!256306 () Bool)

(assert (=> b!435108 (=> res!256306 e!257083)))

(assert (=> b!435108 (= res!256306 (= k!794 (select (arr!12772 _keys!709) from!863)))))

(assert (=> b!435108 (not (= (select (arr!12772 _keys!709) from!863) k!794))))

(declare-fun lt!200246 () Unit!12914)

(assert (=> b!435108 (= lt!200246 e!257087)))

(declare-fun c!55718 () Bool)

(assert (=> b!435108 (= c!55718 (= (select (arr!12772 _keys!709) from!863) k!794))))

(declare-fun lt!200243 () ListLongMap!6523)

(assert (=> b!435108 (= lt!200243 lt!200249)))

(declare-fun lt!200255 () ListLongMap!6523)

(assert (=> b!435108 (= lt!200249 (+!1425 lt!200255 lt!200245))))

(assert (=> b!435108 (= lt!200245 (tuple2!7611 (select (arr!12772 _keys!709) from!863) lt!200241))))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((ValueCell!5360 0))(
  ( (ValueCellFull!5360 (v!7995 V!16315)) (EmptyCell!5360) )
))
(declare-datatypes ((array!26647 0))(
  ( (array!26648 (arr!12773 (Array (_ BitVec 32) ValueCell!5360)) (size!13125 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26647)

(declare-fun get!6365 (ValueCell!5360 V!16315) V!16315)

(declare-fun dynLambda!832 (Int (_ BitVec 64)) V!16315)

(assert (=> b!435108 (= lt!200241 (get!6365 (select (arr!12773 _values!549) from!863) (dynLambda!832 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!435109 () Bool)

(declare-fun res!256310 () Bool)

(declare-fun e!257082 () Bool)

(assert (=> b!435109 (=> (not res!256310) (not e!257082))))

(declare-fun arrayContainsKey!0 (array!26645 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!435109 (= res!256310 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!435110 () Bool)

(declare-fun res!256320 () Bool)

(assert (=> b!435110 (=> (not res!256320) (not e!257082))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!435110 (= res!256320 (validMask!0 mask!1025))))

(declare-fun b!435112 () Bool)

(declare-fun res!256308 () Bool)

(assert (=> b!435112 (=> (not res!256308) (not e!257082))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!435112 (= res!256308 (or (= (select (arr!12772 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12772 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!435113 () Bool)

(declare-fun e!257091 () Bool)

(declare-fun e!257090 () Bool)

(assert (=> b!435113 (= e!257091 e!257090)))

(declare-fun res!256318 () Bool)

(assert (=> b!435113 (=> (not res!256318) (not e!257090))))

(assert (=> b!435113 (= res!256318 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16315)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!200254 () array!26647)

(declare-fun lt!200247 () array!26645)

(declare-fun zeroValue!515 () V!16315)

(declare-fun getCurrentListMapNoExtraKeys!1468 (array!26645 array!26647 (_ BitVec 32) (_ BitVec 32) V!16315 V!16315 (_ BitVec 32) Int) ListLongMap!6523)

(assert (=> b!435113 (= lt!200243 (getCurrentListMapNoExtraKeys!1468 lt!200247 lt!200254 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!435113 (= lt!200254 (array!26648 (store (arr!12773 _values!549) i!563 (ValueCellFull!5360 v!412)) (size!13125 _values!549)))))

(declare-fun lt!200252 () ListLongMap!6523)

(assert (=> b!435113 (= lt!200252 (getCurrentListMapNoExtraKeys!1468 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapIsEmpty!18732 () Bool)

(declare-fun mapRes!18732 () Bool)

(assert (=> mapIsEmpty!18732 mapRes!18732))

(declare-fun b!435114 () Bool)

(declare-fun e!257086 () Bool)

(declare-fun tp_is_empty!11407 () Bool)

(assert (=> b!435114 (= e!257086 tp_is_empty!11407)))

(declare-fun b!435115 () Bool)

(assert (=> b!435115 (= e!257090 (not e!257089))))

(declare-fun res!256309 () Bool)

(assert (=> b!435115 (=> res!256309 e!257089)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!435115 (= res!256309 (not (validKeyInArray!0 (select (arr!12772 _keys!709) from!863))))))

(declare-fun lt!200244 () ListLongMap!6523)

(assert (=> b!435115 (= lt!200244 lt!200255)))

(assert (=> b!435115 (= lt!200255 (+!1425 lt!200248 lt!200251))))

(assert (=> b!435115 (= lt!200244 (getCurrentListMapNoExtraKeys!1468 lt!200247 lt!200254 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!435115 (= lt!200251 (tuple2!7611 k!794 v!412))))

(assert (=> b!435115 (= lt!200248 (getCurrentListMapNoExtraKeys!1468 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!200253 () Unit!12914)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!598 (array!26645 array!26647 (_ BitVec 32) (_ BitVec 32) V!16315 V!16315 (_ BitVec 32) (_ BitVec 64) V!16315 (_ BitVec 32) Int) Unit!12914)

(assert (=> b!435115 (= lt!200253 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!598 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!435116 () Bool)

(declare-fun res!256307 () Bool)

(assert (=> b!435116 (=> (not res!256307) (not e!257082))))

(assert (=> b!435116 (= res!256307 (validKeyInArray!0 k!794))))

(declare-fun b!435117 () Bool)

(declare-fun e!257085 () Bool)

(declare-fun e!257084 () Bool)

(assert (=> b!435117 (= e!257085 (and e!257084 mapRes!18732))))

(declare-fun condMapEmpty!18732 () Bool)

(declare-fun mapDefault!18732 () ValueCell!5360)

