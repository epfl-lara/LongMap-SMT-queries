; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40052 () Bool)

(assert start!40052)

(declare-fun b_free!10319 () Bool)

(declare-fun b_next!10319 () Bool)

(assert (=> start!40052 (= b_free!10319 (not b_next!10319))))

(declare-fun tp!36486 () Bool)

(declare-fun b_and!18287 () Bool)

(assert (=> start!40052 (= tp!36486 b_and!18287)))

(declare-fun b!437012 () Bool)

(declare-fun e!257994 () Bool)

(declare-fun e!257993 () Bool)

(assert (=> b!437012 (= e!257994 e!257993)))

(declare-fun res!257722 () Bool)

(assert (=> b!437012 (=> (not res!257722) (not e!257993))))

(declare-datatypes ((array!26765 0))(
  ( (array!26766 (arr!12832 (Array (_ BitVec 32) (_ BitVec 64))) (size!13184 (_ BitVec 32))) )
))
(declare-fun lt!201514 () array!26765)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26765 (_ BitVec 32)) Bool)

(assert (=> b!437012 (= res!257722 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!201514 mask!1025))))

(declare-fun _keys!709 () array!26765)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!437012 (= lt!201514 (array!26766 (store (arr!12832 _keys!709) i!563 k!794) (size!13184 _keys!709)))))

(declare-fun b!437013 () Bool)

(declare-fun res!257716 () Bool)

(assert (=> b!437013 (=> (not res!257716) (not e!257993))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!437013 (= res!257716 (bvsle from!863 i!563))))

(declare-fun b!437014 () Bool)

(declare-fun e!257991 () Bool)

(assert (=> b!437014 (= e!257993 e!257991)))

(declare-fun res!257713 () Bool)

(assert (=> b!437014 (=> (not res!257713) (not e!257991))))

(assert (=> b!437014 (= res!257713 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((V!16399 0))(
  ( (V!16400 (val!5780 Int)) )
))
(declare-fun minValue!515 () V!16399)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!7662 0))(
  ( (tuple2!7663 (_1!3842 (_ BitVec 64)) (_2!3842 V!16399)) )
))
(declare-datatypes ((List!7661 0))(
  ( (Nil!7658) (Cons!7657 (h!8513 tuple2!7662) (t!13417 List!7661)) )
))
(declare-datatypes ((ListLongMap!6575 0))(
  ( (ListLongMap!6576 (toList!3303 List!7661)) )
))
(declare-fun lt!201513 () ListLongMap!6575)

(declare-fun zeroValue!515 () V!16399)

(declare-datatypes ((ValueCell!5392 0))(
  ( (ValueCellFull!5392 (v!8027 V!16399)) (EmptyCell!5392) )
))
(declare-datatypes ((array!26767 0))(
  ( (array!26768 (arr!12833 (Array (_ BitVec 32) ValueCell!5392)) (size!13185 (_ BitVec 32))) )
))
(declare-fun lt!201511 () array!26767)

(declare-fun getCurrentListMapNoExtraKeys!1492 (array!26765 array!26767 (_ BitVec 32) (_ BitVec 32) V!16399 V!16399 (_ BitVec 32) Int) ListLongMap!6575)

(assert (=> b!437014 (= lt!201513 (getCurrentListMapNoExtraKeys!1492 lt!201514 lt!201511 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!26767)

(declare-fun v!412 () V!16399)

(assert (=> b!437014 (= lt!201511 (array!26768 (store (arr!12833 _values!549) i!563 (ValueCellFull!5392 v!412)) (size!13185 _values!549)))))

(declare-fun lt!201512 () ListLongMap!6575)

(assert (=> b!437014 (= lt!201512 (getCurrentListMapNoExtraKeys!1492 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!437015 () Bool)

(declare-fun res!257724 () Bool)

(assert (=> b!437015 (=> (not res!257724) (not e!257994))))

(assert (=> b!437015 (= res!257724 (or (= (select (arr!12832 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12832 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!437017 () Bool)

(declare-fun res!257719 () Bool)

(assert (=> b!437017 (=> (not res!257719) (not e!257994))))

(assert (=> b!437017 (= res!257719 (and (= (size!13185 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13184 _keys!709) (size!13185 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!437018 () Bool)

(declare-fun e!257992 () Bool)

(declare-fun tp_is_empty!11471 () Bool)

(assert (=> b!437018 (= e!257992 tp_is_empty!11471)))

(declare-fun b!437019 () Bool)

(declare-fun res!257718 () Bool)

(assert (=> b!437019 (=> (not res!257718) (not e!257994))))

(declare-fun arrayContainsKey!0 (array!26765 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!437019 (= res!257718 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!437020 () Bool)

(declare-fun res!257717 () Bool)

(assert (=> b!437020 (=> (not res!257717) (not e!257994))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!437020 (= res!257717 (validKeyInArray!0 k!794))))

(declare-fun mapIsEmpty!18828 () Bool)

(declare-fun mapRes!18828 () Bool)

(assert (=> mapIsEmpty!18828 mapRes!18828))

(declare-fun b!437021 () Bool)

(declare-fun e!257995 () Bool)

(assert (=> b!437021 (= e!257995 (and e!257992 mapRes!18828))))

(declare-fun condMapEmpty!18828 () Bool)

(declare-fun mapDefault!18828 () ValueCell!5392)

