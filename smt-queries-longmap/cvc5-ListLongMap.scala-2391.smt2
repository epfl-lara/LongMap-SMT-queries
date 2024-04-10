; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37830 () Bool)

(assert start!37830)

(declare-fun b_free!8911 () Bool)

(declare-fun b_next!8911 () Bool)

(assert (=> start!37830 (= b_free!8911 (not b_next!8911))))

(declare-fun tp!31488 () Bool)

(declare-fun b_and!16165 () Bool)

(assert (=> start!37830 (= tp!31488 b_and!16165)))

(declare-fun b!388683 () Bool)

(declare-fun res!222278 () Bool)

(declare-fun e!235509 () Bool)

(assert (=> b!388683 (=> (not res!222278) (not e!235509))))

(declare-datatypes ((array!23059 0))(
  ( (array!23060 (arr!10997 (Array (_ BitVec 32) (_ BitVec 64))) (size!11349 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23059)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23059 (_ BitVec 32)) Bool)

(assert (=> b!388683 (= res!222278 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapIsEmpty!15942 () Bool)

(declare-fun mapRes!15942 () Bool)

(assert (=> mapIsEmpty!15942 mapRes!15942))

(declare-fun b!388684 () Bool)

(declare-fun res!222269 () Bool)

(declare-fun e!235511 () Bool)

(assert (=> b!388684 (=> (not res!222269) (not e!235511))))

(declare-fun lt!182541 () array!23059)

(declare-datatypes ((List!6355 0))(
  ( (Nil!6352) (Cons!6351 (h!7207 (_ BitVec 64)) (t!11507 List!6355)) )
))
(declare-fun arrayNoDuplicates!0 (array!23059 (_ BitVec 32) List!6355) Bool)

(assert (=> b!388684 (= res!222269 (arrayNoDuplicates!0 lt!182541 #b00000000000000000000000000000000 Nil!6352))))

(declare-fun res!222273 () Bool)

(assert (=> start!37830 (=> (not res!222273) (not e!235509))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37830 (= res!222273 (validMask!0 mask!970))))

(assert (=> start!37830 e!235509))

(declare-datatypes ((V!13883 0))(
  ( (V!13884 (val!4836 Int)) )
))
(declare-datatypes ((ValueCell!4448 0))(
  ( (ValueCellFull!4448 (v!7037 V!13883)) (EmptyCell!4448) )
))
(declare-datatypes ((array!23061 0))(
  ( (array!23062 (arr!10998 (Array (_ BitVec 32) ValueCell!4448)) (size!11350 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23061)

(declare-fun e!235508 () Bool)

(declare-fun array_inv!8084 (array!23061) Bool)

(assert (=> start!37830 (and (array_inv!8084 _values!506) e!235508)))

(assert (=> start!37830 tp!31488))

(assert (=> start!37830 true))

(declare-fun tp_is_empty!9583 () Bool)

(assert (=> start!37830 tp_is_empty!9583))

(declare-fun array_inv!8085 (array!23059) Bool)

(assert (=> start!37830 (array_inv!8085 _keys!658)))

(declare-fun mapNonEmpty!15942 () Bool)

(declare-fun tp!31487 () Bool)

(declare-fun e!235512 () Bool)

(assert (=> mapNonEmpty!15942 (= mapRes!15942 (and tp!31487 e!235512))))

(declare-fun mapValue!15942 () ValueCell!4448)

(declare-fun mapRest!15942 () (Array (_ BitVec 32) ValueCell!4448))

(declare-fun mapKey!15942 () (_ BitVec 32))

(assert (=> mapNonEmpty!15942 (= (arr!10998 _values!506) (store mapRest!15942 mapKey!15942 mapValue!15942))))

(declare-datatypes ((tuple2!6502 0))(
  ( (tuple2!6503 (_1!3262 (_ BitVec 64)) (_2!3262 V!13883)) )
))
(declare-fun lt!182548 () tuple2!6502)

(declare-fun e!235513 () Bool)

(declare-datatypes ((List!6356 0))(
  ( (Nil!6353) (Cons!6352 (h!7208 tuple2!6502) (t!11508 List!6356)) )
))
(declare-datatypes ((ListLongMap!5415 0))(
  ( (ListLongMap!5416 (toList!2723 List!6356)) )
))
(declare-fun lt!182539 () ListLongMap!5415)

(declare-fun lt!182540 () tuple2!6502)

(declare-fun lt!182547 () ListLongMap!5415)

(declare-fun b!388685 () Bool)

(declare-fun +!1018 (ListLongMap!5415 tuple2!6502) ListLongMap!5415)

(assert (=> b!388685 (= e!235513 (= lt!182539 (+!1018 (+!1018 lt!182547 lt!182540) lt!182548)))))

(declare-fun lt!182545 () ListLongMap!5415)

(declare-fun lt!182546 () ListLongMap!5415)

(assert (=> b!388685 (= lt!182545 (+!1018 (+!1018 lt!182546 lt!182540) lt!182548))))

(declare-fun minValue!472 () V!13883)

(assert (=> b!388685 (= lt!182548 (tuple2!6503 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun zeroValue!472 () V!13883)

(assert (=> b!388685 (= lt!182540 (tuple2!6503 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!388686 () Bool)

(assert (=> b!388686 (= e!235512 tp_is_empty!9583)))

(declare-fun b!388687 () Bool)

(declare-fun res!222277 () Bool)

(assert (=> b!388687 (=> (not res!222277) (not e!235509))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!388687 (= res!222277 (validKeyInArray!0 k!778))))

(declare-fun b!388688 () Bool)

(assert (=> b!388688 (= e!235511 (not e!235513))))

(declare-fun res!222274 () Bool)

(assert (=> b!388688 (=> res!222274 e!235513)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!388688 (= res!222274 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun getCurrentListMap!2072 (array!23059 array!23061 (_ BitVec 32) (_ BitVec 32) V!13883 V!13883 (_ BitVec 32) Int) ListLongMap!5415)

(assert (=> b!388688 (= lt!182539 (getCurrentListMap!2072 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182542 () array!23061)

(assert (=> b!388688 (= lt!182545 (getCurrentListMap!2072 lt!182541 lt!182542 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182544 () ListLongMap!5415)

(assert (=> b!388688 (and (= lt!182546 lt!182544) (= lt!182544 lt!182546))))

(declare-fun v!373 () V!13883)

(assert (=> b!388688 (= lt!182544 (+!1018 lt!182547 (tuple2!6503 k!778 v!373)))))

(declare-datatypes ((Unit!11912 0))(
  ( (Unit!11913) )
))
(declare-fun lt!182543 () Unit!11912)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!236 (array!23059 array!23061 (_ BitVec 32) (_ BitVec 32) V!13883 V!13883 (_ BitVec 32) (_ BitVec 64) V!13883 (_ BitVec 32) Int) Unit!11912)

(assert (=> b!388688 (= lt!182543 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!236 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!952 (array!23059 array!23061 (_ BitVec 32) (_ BitVec 32) V!13883 V!13883 (_ BitVec 32) Int) ListLongMap!5415)

(assert (=> b!388688 (= lt!182546 (getCurrentListMapNoExtraKeys!952 lt!182541 lt!182542 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!388688 (= lt!182542 (array!23062 (store (arr!10998 _values!506) i!548 (ValueCellFull!4448 v!373)) (size!11350 _values!506)))))

(assert (=> b!388688 (= lt!182547 (getCurrentListMapNoExtraKeys!952 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!388689 () Bool)

(declare-fun res!222276 () Bool)

(assert (=> b!388689 (=> (not res!222276) (not e!235509))))

(assert (=> b!388689 (= res!222276 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6352))))

(declare-fun b!388690 () Bool)

(declare-fun res!222275 () Bool)

(assert (=> b!388690 (=> (not res!222275) (not e!235509))))

(assert (=> b!388690 (= res!222275 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11349 _keys!658))))))

(declare-fun b!388691 () Bool)

(declare-fun res!222272 () Bool)

(assert (=> b!388691 (=> (not res!222272) (not e!235509))))

(declare-fun arrayContainsKey!0 (array!23059 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!388691 (= res!222272 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!388692 () Bool)

(declare-fun res!222279 () Bool)

(assert (=> b!388692 (=> (not res!222279) (not e!235509))))

(assert (=> b!388692 (= res!222279 (and (= (size!11350 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11349 _keys!658) (size!11350 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!388693 () Bool)

(declare-fun res!222271 () Bool)

(assert (=> b!388693 (=> (not res!222271) (not e!235509))))

(assert (=> b!388693 (= res!222271 (or (= (select (arr!10997 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10997 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!388694 () Bool)

(assert (=> b!388694 (= e!235509 e!235511)))

(declare-fun res!222270 () Bool)

(assert (=> b!388694 (=> (not res!222270) (not e!235511))))

(assert (=> b!388694 (= res!222270 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!182541 mask!970))))

(assert (=> b!388694 (= lt!182541 (array!23060 (store (arr!10997 _keys!658) i!548 k!778) (size!11349 _keys!658)))))

(declare-fun b!388695 () Bool)

(declare-fun e!235507 () Bool)

(assert (=> b!388695 (= e!235508 (and e!235507 mapRes!15942))))

(declare-fun condMapEmpty!15942 () Bool)

(declare-fun mapDefault!15942 () ValueCell!4448)

