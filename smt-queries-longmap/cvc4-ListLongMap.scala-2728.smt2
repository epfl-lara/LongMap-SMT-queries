; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40190 () Bool)

(assert start!40190)

(declare-fun b_free!10457 () Bool)

(declare-fun b_next!10457 () Bool)

(assert (=> start!40190 (= b_free!10457 (not b_next!10457))))

(declare-fun tp!36899 () Bool)

(declare-fun b_and!18425 () Bool)

(assert (=> start!40190 (= tp!36899 b_and!18425)))

(declare-fun b!440324 () Bool)

(declare-fun res!260412 () Bool)

(declare-fun e!259442 () Bool)

(assert (=> b!440324 (=> (not res!260412) (not e!259442))))

(declare-datatypes ((array!27031 0))(
  ( (array!27032 (arr!12965 (Array (_ BitVec 32) (_ BitVec 64))) (size!13317 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27031)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16583 0))(
  ( (V!16584 (val!5849 Int)) )
))
(declare-datatypes ((ValueCell!5461 0))(
  ( (ValueCellFull!5461 (v!8096 V!16583)) (EmptyCell!5461) )
))
(declare-datatypes ((array!27033 0))(
  ( (array!27034 (arr!12966 (Array (_ BitVec 32) ValueCell!5461)) (size!13318 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27033)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!440324 (= res!260412 (and (= (size!13318 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13317 _keys!709) (size!13318 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!440325 () Bool)

(declare-fun res!260407 () Bool)

(assert (=> b!440325 (=> (not res!260407) (not e!259442))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!440325 (= res!260407 (validMask!0 mask!1025))))

(declare-fun b!440326 () Bool)

(declare-fun e!259444 () Bool)

(assert (=> b!440326 (= e!259442 e!259444)))

(declare-fun res!260409 () Bool)

(assert (=> b!440326 (=> (not res!260409) (not e!259444))))

(declare-fun lt!202547 () array!27031)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27031 (_ BitVec 32)) Bool)

(assert (=> b!440326 (= res!260409 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202547 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!440326 (= lt!202547 (array!27032 (store (arr!12965 _keys!709) i!563 k!794) (size!13317 _keys!709)))))

(declare-fun b!440327 () Bool)

(declare-fun res!260411 () Bool)

(assert (=> b!440327 (=> (not res!260411) (not e!259442))))

(assert (=> b!440327 (= res!260411 (or (= (select (arr!12965 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12965 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!440328 () Bool)

(declare-fun e!259445 () Bool)

(assert (=> b!440328 (= e!259444 e!259445)))

(declare-fun res!260413 () Bool)

(assert (=> b!440328 (=> (not res!260413) (not e!259445))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!440328 (= res!260413 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16583)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!16583)

(declare-fun lt!202548 () array!27033)

(declare-datatypes ((tuple2!7772 0))(
  ( (tuple2!7773 (_1!3897 (_ BitVec 64)) (_2!3897 V!16583)) )
))
(declare-datatypes ((List!7770 0))(
  ( (Nil!7767) (Cons!7766 (h!8622 tuple2!7772) (t!13526 List!7770)) )
))
(declare-datatypes ((ListLongMap!6685 0))(
  ( (ListLongMap!6686 (toList!3358 List!7770)) )
))
(declare-fun lt!202550 () ListLongMap!6685)

(declare-fun getCurrentListMapNoExtraKeys!1547 (array!27031 array!27033 (_ BitVec 32) (_ BitVec 32) V!16583 V!16583 (_ BitVec 32) Int) ListLongMap!6685)

(assert (=> b!440328 (= lt!202550 (getCurrentListMapNoExtraKeys!1547 lt!202547 lt!202548 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16583)

(assert (=> b!440328 (= lt!202548 (array!27034 (store (arr!12966 _values!549) i!563 (ValueCellFull!5461 v!412)) (size!13318 _values!549)))))

(declare-fun lt!202549 () ListLongMap!6685)

(assert (=> b!440328 (= lt!202549 (getCurrentListMapNoExtraKeys!1547 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!440329 () Bool)

(declare-fun res!260405 () Bool)

(assert (=> b!440329 (=> (not res!260405) (not e!259442))))

(assert (=> b!440329 (= res!260405 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13317 _keys!709))))))

(declare-fun b!440330 () Bool)

(declare-fun res!260404 () Bool)

(assert (=> b!440330 (=> (not res!260404) (not e!259442))))

(declare-fun arrayContainsKey!0 (array!27031 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!440330 (= res!260404 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!440331 () Bool)

(declare-fun res!260414 () Bool)

(assert (=> b!440331 (=> (not res!260414) (not e!259442))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!440331 (= res!260414 (validKeyInArray!0 k!794))))

(declare-fun b!440333 () Bool)

(declare-fun e!259441 () Bool)

(declare-fun tp_is_empty!11609 () Bool)

(assert (=> b!440333 (= e!259441 tp_is_empty!11609)))

(declare-fun b!440334 () Bool)

(declare-fun e!259443 () Bool)

(declare-fun mapRes!19035 () Bool)

(assert (=> b!440334 (= e!259443 (and e!259441 mapRes!19035))))

(declare-fun condMapEmpty!19035 () Bool)

(declare-fun mapDefault!19035 () ValueCell!5461)

