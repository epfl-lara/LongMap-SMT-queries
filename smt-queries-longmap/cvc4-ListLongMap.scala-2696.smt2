; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39998 () Bool)

(assert start!39998)

(declare-fun b_free!10265 () Bool)

(declare-fun b_next!10265 () Bool)

(assert (=> start!39998 (= b_free!10265 (not b_next!10265))))

(declare-fun tp!36323 () Bool)

(declare-fun b_and!18189 () Bool)

(assert (=> start!39998 (= tp!36323 b_and!18189)))

(declare-fun b!435416 () Bool)

(declare-fun res!256535 () Bool)

(declare-fun e!257241 () Bool)

(assert (=> b!435416 (=> (not res!256535) (not e!257241))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!435416 (= res!256535 (validKeyInArray!0 k!794))))

(declare-fun b!435417 () Bool)

(declare-datatypes ((Unit!12928 0))(
  ( (Unit!12929) )
))
(declare-fun e!257235 () Unit!12928)

(declare-fun Unit!12930 () Unit!12928)

(assert (=> b!435417 (= e!257235 Unit!12930)))

(declare-fun b!435418 () Bool)

(declare-fun res!256533 () Bool)

(assert (=> b!435418 (=> (not res!256533) (not e!257241))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!26663 0))(
  ( (array!26664 (arr!12781 (Array (_ BitVec 32) (_ BitVec 64))) (size!13133 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26663)

(assert (=> b!435418 (= res!256533 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13133 _keys!709))))))

(declare-fun b!435419 () Bool)

(declare-fun e!257239 () Bool)

(declare-fun e!257238 () Bool)

(assert (=> b!435419 (= e!257239 e!257238)))

(declare-fun res!256532 () Bool)

(assert (=> b!435419 (=> res!256532 e!257238)))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!435419 (= res!256532 (= k!794 (select (arr!12781 _keys!709) from!863)))))

(assert (=> b!435419 (not (= (select (arr!12781 _keys!709) from!863) k!794))))

(declare-fun lt!200480 () Unit!12928)

(assert (=> b!435419 (= lt!200480 e!257235)))

(declare-fun c!55733 () Bool)

(assert (=> b!435419 (= c!55733 (= (select (arr!12781 _keys!709) from!863) k!794))))

(declare-datatypes ((V!16327 0))(
  ( (V!16328 (val!5753 Int)) )
))
(declare-datatypes ((tuple2!7616 0))(
  ( (tuple2!7617 (_1!3819 (_ BitVec 64)) (_2!3819 V!16327)) )
))
(declare-datatypes ((List!7618 0))(
  ( (Nil!7615) (Cons!7614 (h!8470 tuple2!7616) (t!13332 List!7618)) )
))
(declare-datatypes ((ListLongMap!6529 0))(
  ( (ListLongMap!6530 (toList!3280 List!7618)) )
))
(declare-fun lt!200479 () ListLongMap!6529)

(declare-fun lt!200469 () ListLongMap!6529)

(assert (=> b!435419 (= lt!200479 lt!200469)))

(declare-fun lt!200477 () ListLongMap!6529)

(declare-fun lt!200476 () tuple2!7616)

(declare-fun +!1428 (ListLongMap!6529 tuple2!7616) ListLongMap!6529)

(assert (=> b!435419 (= lt!200469 (+!1428 lt!200477 lt!200476))))

(declare-fun lt!200473 () V!16327)

(assert (=> b!435419 (= lt!200476 (tuple2!7617 (select (arr!12781 _keys!709) from!863) lt!200473))))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((ValueCell!5365 0))(
  ( (ValueCellFull!5365 (v!8000 V!16327)) (EmptyCell!5365) )
))
(declare-datatypes ((array!26665 0))(
  ( (array!26666 (arr!12782 (Array (_ BitVec 32) ValueCell!5365)) (size!13134 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26665)

(declare-fun get!6370 (ValueCell!5365 V!16327) V!16327)

(declare-fun dynLambda!835 (Int (_ BitVec 64)) V!16327)

(assert (=> b!435419 (= lt!200473 (get!6370 (select (arr!12782 _values!549) from!863) (dynLambda!835 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!256539 () Bool)

(assert (=> start!39998 (=> (not res!256539) (not e!257241))))

(assert (=> start!39998 (= res!256539 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13133 _keys!709))))))

(assert (=> start!39998 e!257241))

(declare-fun tp_is_empty!11417 () Bool)

(assert (=> start!39998 tp_is_empty!11417))

(assert (=> start!39998 tp!36323))

(assert (=> start!39998 true))

(declare-fun e!257234 () Bool)

(declare-fun array_inv!9292 (array!26665) Bool)

(assert (=> start!39998 (and (array_inv!9292 _values!549) e!257234)))

(declare-fun array_inv!9293 (array!26663) Bool)

(assert (=> start!39998 (array_inv!9293 _keys!709)))

(declare-fun b!435420 () Bool)

(declare-fun e!257233 () Bool)

(assert (=> b!435420 (= e!257233 tp_is_empty!11417)))

(declare-fun b!435421 () Bool)

(declare-fun res!256534 () Bool)

(assert (=> b!435421 (=> (not res!256534) (not e!257241))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!435421 (= res!256534 (and (= (size!13134 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13133 _keys!709) (size!13134 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!435422 () Bool)

(declare-fun res!256545 () Bool)

(assert (=> b!435422 (=> (not res!256545) (not e!257241))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!435422 (= res!256545 (validMask!0 mask!1025))))

(declare-fun b!435423 () Bool)

(declare-fun res!256537 () Bool)

(assert (=> b!435423 (=> (not res!256537) (not e!257241))))

(declare-datatypes ((List!7619 0))(
  ( (Nil!7616) (Cons!7615 (h!8471 (_ BitVec 64)) (t!13333 List!7619)) )
))
(declare-fun arrayNoDuplicates!0 (array!26663 (_ BitVec 32) List!7619) Bool)

(assert (=> b!435423 (= res!256537 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7616))))

(declare-fun b!435424 () Bool)

(declare-fun res!256544 () Bool)

(declare-fun e!257240 () Bool)

(assert (=> b!435424 (=> (not res!256544) (not e!257240))))

(assert (=> b!435424 (= res!256544 (bvsle from!863 i!563))))

(declare-fun b!435425 () Bool)

(declare-fun e!257237 () Bool)

(assert (=> b!435425 (= e!257240 e!257237)))

(declare-fun res!256540 () Bool)

(assert (=> b!435425 (=> (not res!256540) (not e!257237))))

(assert (=> b!435425 (= res!256540 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16327)

(declare-fun zeroValue!515 () V!16327)

(declare-fun lt!200466 () array!26663)

(declare-fun lt!200471 () array!26665)

(declare-fun getCurrentListMapNoExtraKeys!1471 (array!26663 array!26665 (_ BitVec 32) (_ BitVec 32) V!16327 V!16327 (_ BitVec 32) Int) ListLongMap!6529)

(assert (=> b!435425 (= lt!200479 (getCurrentListMapNoExtraKeys!1471 lt!200466 lt!200471 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16327)

(assert (=> b!435425 (= lt!200471 (array!26666 (store (arr!12782 _values!549) i!563 (ValueCellFull!5365 v!412)) (size!13134 _values!549)))))

(declare-fun lt!200470 () ListLongMap!6529)

(assert (=> b!435425 (= lt!200470 (getCurrentListMapNoExtraKeys!1471 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!435426 () Bool)

(declare-fun mapRes!18747 () Bool)

(assert (=> b!435426 (= e!257234 (and e!257233 mapRes!18747))))

(declare-fun condMapEmpty!18747 () Bool)

(declare-fun mapDefault!18747 () ValueCell!5365)

