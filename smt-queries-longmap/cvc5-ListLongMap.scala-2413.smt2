; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38184 () Bool)

(assert start!38184)

(declare-fun b_free!9043 () Bool)

(declare-fun b_next!9043 () Bool)

(assert (=> start!38184 (= b_free!9043 (not b_next!9043))))

(declare-fun tp!31913 () Bool)

(declare-fun b_and!16417 () Bool)

(assert (=> start!38184 (= tp!31913 b_and!16417)))

(declare-fun b!393658 () Bool)

(declare-fun res!225537 () Bool)

(declare-fun e!238341 () Bool)

(assert (=> b!393658 (=> (not res!225537) (not e!238341))))

(declare-datatypes ((array!23337 0))(
  ( (array!23338 (arr!11126 (Array (_ BitVec 32) (_ BitVec 64))) (size!11478 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23337)

(declare-datatypes ((List!6469 0))(
  ( (Nil!6466) (Cons!6465 (h!7321 (_ BitVec 64)) (t!11641 List!6469)) )
))
(declare-fun arrayNoDuplicates!0 (array!23337 (_ BitVec 32) List!6469) Bool)

(assert (=> b!393658 (= res!225537 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6466))))

(declare-fun mapIsEmpty!16170 () Bool)

(declare-fun mapRes!16170 () Bool)

(assert (=> mapIsEmpty!16170 mapRes!16170))

(declare-fun b!393659 () Bool)

(declare-fun e!238343 () Bool)

(declare-fun e!238339 () Bool)

(assert (=> b!393659 (= e!238343 (not e!238339))))

(declare-fun res!225535 () Bool)

(assert (=> b!393659 (=> res!225535 e!238339)))

(declare-fun lt!186362 () Bool)

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!393659 (= res!225535 (or (and (not lt!186362) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!186362) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!186362)))))

(assert (=> b!393659 (= lt!186362 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-datatypes ((V!14059 0))(
  ( (V!14060 (val!4902 Int)) )
))
(declare-datatypes ((ValueCell!4514 0))(
  ( (ValueCellFull!4514 (v!7143 V!14059)) (EmptyCell!4514) )
))
(declare-datatypes ((array!23339 0))(
  ( (array!23340 (arr!11127 (Array (_ BitVec 32) ValueCell!4514)) (size!11479 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23339)

(declare-datatypes ((tuple2!6616 0))(
  ( (tuple2!6617 (_1!3319 (_ BitVec 64)) (_2!3319 V!14059)) )
))
(declare-datatypes ((List!6470 0))(
  ( (Nil!6467) (Cons!6466 (h!7322 tuple2!6616) (t!11642 List!6470)) )
))
(declare-datatypes ((ListLongMap!5529 0))(
  ( (ListLongMap!5530 (toList!2780 List!6470)) )
))
(declare-fun lt!186359 () ListLongMap!5529)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!14059)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!14059)

(declare-fun getCurrentListMap!2121 (array!23337 array!23339 (_ BitVec 32) (_ BitVec 32) V!14059 V!14059 (_ BitVec 32) Int) ListLongMap!5529)

(assert (=> b!393659 (= lt!186359 (getCurrentListMap!2121 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186363 () array!23339)

(declare-fun lt!186361 () array!23337)

(declare-fun lt!186360 () ListLongMap!5529)

(assert (=> b!393659 (= lt!186360 (getCurrentListMap!2121 lt!186361 lt!186363 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186366 () ListLongMap!5529)

(declare-fun lt!186364 () ListLongMap!5529)

(assert (=> b!393659 (and (= lt!186366 lt!186364) (= lt!186364 lt!186366))))

(declare-fun lt!186358 () ListLongMap!5529)

(declare-fun v!373 () V!14059)

(declare-fun k!778 () (_ BitVec 64))

(declare-fun +!1075 (ListLongMap!5529 tuple2!6616) ListLongMap!5529)

(assert (=> b!393659 (= lt!186364 (+!1075 lt!186358 (tuple2!6617 k!778 v!373)))))

(declare-datatypes ((Unit!12038 0))(
  ( (Unit!12039) )
))
(declare-fun lt!186365 () Unit!12038)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!285 (array!23337 array!23339 (_ BitVec 32) (_ BitVec 32) V!14059 V!14059 (_ BitVec 32) (_ BitVec 64) V!14059 (_ BitVec 32) Int) Unit!12038)

(assert (=> b!393659 (= lt!186365 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!285 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!1001 (array!23337 array!23339 (_ BitVec 32) (_ BitVec 32) V!14059 V!14059 (_ BitVec 32) Int) ListLongMap!5529)

(assert (=> b!393659 (= lt!186366 (getCurrentListMapNoExtraKeys!1001 lt!186361 lt!186363 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!393659 (= lt!186363 (array!23340 (store (arr!11127 _values!506) i!548 (ValueCellFull!4514 v!373)) (size!11479 _values!506)))))

(assert (=> b!393659 (= lt!186358 (getCurrentListMapNoExtraKeys!1001 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!393660 () Bool)

(declare-fun res!225534 () Bool)

(assert (=> b!393660 (=> (not res!225534) (not e!238341))))

(declare-fun arrayContainsKey!0 (array!23337 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!393660 (= res!225534 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!393661 () Bool)

(declare-fun e!238344 () Bool)

(declare-fun tp_is_empty!9715 () Bool)

(assert (=> b!393661 (= e!238344 tp_is_empty!9715)))

(declare-fun res!225533 () Bool)

(assert (=> start!38184 (=> (not res!225533) (not e!238341))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!38184 (= res!225533 (validMask!0 mask!970))))

(assert (=> start!38184 e!238341))

(declare-fun e!238345 () Bool)

(declare-fun array_inv!8170 (array!23339) Bool)

(assert (=> start!38184 (and (array_inv!8170 _values!506) e!238345)))

(assert (=> start!38184 tp!31913))

(assert (=> start!38184 true))

(assert (=> start!38184 tp_is_empty!9715))

(declare-fun array_inv!8171 (array!23337) Bool)

(assert (=> start!38184 (array_inv!8171 _keys!658)))

(declare-fun b!393662 () Bool)

(declare-fun res!225540 () Bool)

(assert (=> b!393662 (=> (not res!225540) (not e!238341))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!393662 (= res!225540 (validKeyInArray!0 k!778))))

(declare-fun b!393663 () Bool)

(declare-fun res!225536 () Bool)

(assert (=> b!393663 (=> (not res!225536) (not e!238341))))

(assert (=> b!393663 (= res!225536 (and (= (size!11479 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11478 _keys!658) (size!11479 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!393664 () Bool)

(declare-fun res!225530 () Bool)

(assert (=> b!393664 (=> (not res!225530) (not e!238341))))

(assert (=> b!393664 (= res!225530 (or (= (select (arr!11126 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11126 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!16170 () Bool)

(declare-fun tp!31914 () Bool)

(assert (=> mapNonEmpty!16170 (= mapRes!16170 (and tp!31914 e!238344))))

(declare-fun mapValue!16170 () ValueCell!4514)

(declare-fun mapRest!16170 () (Array (_ BitVec 32) ValueCell!4514))

(declare-fun mapKey!16170 () (_ BitVec 32))

(assert (=> mapNonEmpty!16170 (= (arr!11127 _values!506) (store mapRest!16170 mapKey!16170 mapValue!16170))))

(declare-fun b!393665 () Bool)

(declare-fun res!225538 () Bool)

(assert (=> b!393665 (=> (not res!225538) (not e!238343))))

(assert (=> b!393665 (= res!225538 (arrayNoDuplicates!0 lt!186361 #b00000000000000000000000000000000 Nil!6466))))

(declare-fun b!393666 () Bool)

(declare-fun res!225531 () Bool)

(assert (=> b!393666 (=> (not res!225531) (not e!238341))))

(assert (=> b!393666 (= res!225531 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11478 _keys!658))))))

(declare-fun b!393667 () Bool)

(declare-fun e!238342 () Bool)

(assert (=> b!393667 (= e!238345 (and e!238342 mapRes!16170))))

(declare-fun condMapEmpty!16170 () Bool)

(declare-fun mapDefault!16170 () ValueCell!4514)

