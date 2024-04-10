; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40144 () Bool)

(assert start!40144)

(declare-fun b_free!10411 () Bool)

(declare-fun b_next!10411 () Bool)

(assert (=> start!40144 (= b_free!10411 (not b_next!10411))))

(declare-fun tp!36762 () Bool)

(declare-fun b_and!18379 () Bool)

(assert (=> start!40144 (= tp!36762 b_and!18379)))

(declare-fun b!439220 () Bool)

(declare-fun res!259516 () Bool)

(declare-fun e!258963 () Bool)

(assert (=> b!439220 (=> (not res!259516) (not e!258963))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!439220 (= res!259516 (validMask!0 mask!1025))))

(declare-fun b!439221 () Bool)

(declare-fun res!259507 () Bool)

(assert (=> b!439221 (=> (not res!259507) (not e!258963))))

(declare-datatypes ((array!26943 0))(
  ( (array!26944 (arr!12921 (Array (_ BitVec 32) (_ BitVec 64))) (size!13273 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26943)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!439221 (= res!259507 (or (= (select (arr!12921 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12921 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!439222 () Bool)

(declare-fun e!258961 () Bool)

(assert (=> b!439222 (= e!258961 (not true))))

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!202203 () array!26943)

(declare-datatypes ((V!16523 0))(
  ( (V!16524 (val!5826 Int)) )
))
(declare-datatypes ((ValueCell!5438 0))(
  ( (ValueCellFull!5438 (v!8073 V!16523)) (EmptyCell!5438) )
))
(declare-datatypes ((array!26945 0))(
  ( (array!26946 (arr!12922 (Array (_ BitVec 32) ValueCell!5438)) (size!13274 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26945)

(declare-fun lt!202201 () array!26945)

(declare-fun zeroValue!515 () V!16523)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun v!412 () V!16523)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun minValue!515 () V!16523)

(declare-datatypes ((tuple2!7736 0))(
  ( (tuple2!7737 (_1!3879 (_ BitVec 64)) (_2!3879 V!16523)) )
))
(declare-datatypes ((List!7732 0))(
  ( (Nil!7729) (Cons!7728 (h!8584 tuple2!7736) (t!13488 List!7732)) )
))
(declare-datatypes ((ListLongMap!6649 0))(
  ( (ListLongMap!6650 (toList!3340 List!7732)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1529 (array!26943 array!26945 (_ BitVec 32) (_ BitVec 32) V!16523 V!16523 (_ BitVec 32) Int) ListLongMap!6649)

(declare-fun +!1481 (ListLongMap!6649 tuple2!7736) ListLongMap!6649)

(assert (=> b!439222 (= (getCurrentListMapNoExtraKeys!1529 lt!202203 lt!202201 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1481 (getCurrentListMapNoExtraKeys!1529 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7737 k!794 v!412)))))

(declare-datatypes ((Unit!13066 0))(
  ( (Unit!13067) )
))
(declare-fun lt!202204 () Unit!13066)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!650 (array!26943 array!26945 (_ BitVec 32) (_ BitVec 32) V!16523 V!16523 (_ BitVec 32) (_ BitVec 64) V!16523 (_ BitVec 32) Int) Unit!13066)

(assert (=> b!439222 (= lt!202204 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!650 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!439223 () Bool)

(declare-fun e!258959 () Bool)

(assert (=> b!439223 (= e!258959 e!258961)))

(declare-fun res!259509 () Bool)

(assert (=> b!439223 (=> (not res!259509) (not e!258961))))

(assert (=> b!439223 (= res!259509 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!202202 () ListLongMap!6649)

(assert (=> b!439223 (= lt!202202 (getCurrentListMapNoExtraKeys!1529 lt!202203 lt!202201 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!439223 (= lt!202201 (array!26946 (store (arr!12922 _values!549) i!563 (ValueCellFull!5438 v!412)) (size!13274 _values!549)))))

(declare-fun lt!202205 () ListLongMap!6649)

(assert (=> b!439223 (= lt!202205 (getCurrentListMapNoExtraKeys!1529 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!439224 () Bool)

(declare-fun res!259517 () Bool)

(assert (=> b!439224 (=> (not res!259517) (not e!258959))))

(assert (=> b!439224 (= res!259517 (bvsle from!863 i!563))))

(declare-fun b!439225 () Bool)

(declare-fun e!258957 () Bool)

(declare-fun tp_is_empty!11563 () Bool)

(assert (=> b!439225 (= e!258957 tp_is_empty!11563)))

(declare-fun mapIsEmpty!18966 () Bool)

(declare-fun mapRes!18966 () Bool)

(assert (=> mapIsEmpty!18966 mapRes!18966))

(declare-fun b!439226 () Bool)

(declare-fun res!259513 () Bool)

(assert (=> b!439226 (=> (not res!259513) (not e!258963))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!439226 (= res!259513 (validKeyInArray!0 k!794))))

(declare-fun b!439228 () Bool)

(declare-fun res!259515 () Bool)

(assert (=> b!439228 (=> (not res!259515) (not e!258963))))

(declare-datatypes ((List!7733 0))(
  ( (Nil!7730) (Cons!7729 (h!8585 (_ BitVec 64)) (t!13489 List!7733)) )
))
(declare-fun arrayNoDuplicates!0 (array!26943 (_ BitVec 32) List!7733) Bool)

(assert (=> b!439228 (= res!259515 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7730))))

(declare-fun b!439229 () Bool)

(declare-fun e!258962 () Bool)

(assert (=> b!439229 (= e!258962 tp_is_empty!11563)))

(declare-fun b!439230 () Bool)

(declare-fun res!259512 () Bool)

(assert (=> b!439230 (=> (not res!259512) (not e!258963))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26943 (_ BitVec 32)) Bool)

(assert (=> b!439230 (= res!259512 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!18966 () Bool)

(declare-fun tp!36761 () Bool)

(assert (=> mapNonEmpty!18966 (= mapRes!18966 (and tp!36761 e!258962))))

(declare-fun mapValue!18966 () ValueCell!5438)

(declare-fun mapKey!18966 () (_ BitVec 32))

(declare-fun mapRest!18966 () (Array (_ BitVec 32) ValueCell!5438))

(assert (=> mapNonEmpty!18966 (= (arr!12922 _values!549) (store mapRest!18966 mapKey!18966 mapValue!18966))))

(declare-fun b!439231 () Bool)

(declare-fun res!259518 () Bool)

(assert (=> b!439231 (=> (not res!259518) (not e!258959))))

(assert (=> b!439231 (= res!259518 (arrayNoDuplicates!0 lt!202203 #b00000000000000000000000000000000 Nil!7730))))

(declare-fun b!439232 () Bool)

(declare-fun res!259508 () Bool)

(assert (=> b!439232 (=> (not res!259508) (not e!258963))))

(declare-fun arrayContainsKey!0 (array!26943 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!439232 (= res!259508 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!439233 () Bool)

(declare-fun e!258958 () Bool)

(assert (=> b!439233 (= e!258958 (and e!258957 mapRes!18966))))

(declare-fun condMapEmpty!18966 () Bool)

(declare-fun mapDefault!18966 () ValueCell!5438)

