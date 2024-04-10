; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37274 () Bool)

(assert start!37274)

(declare-fun b_free!8401 () Bool)

(declare-fun b_next!8401 () Bool)

(assert (=> start!37274 (= b_free!8401 (not b_next!8401))))

(declare-fun tp!29918 () Bool)

(declare-fun b_and!15643 () Bool)

(assert (=> start!37274 (= tp!29918 b_and!15643)))

(declare-fun b!377466 () Bool)

(declare-fun res!213573 () Bool)

(declare-fun e!229811 () Bool)

(assert (=> b!377466 (=> (not res!213573) (not e!229811))))

(declare-datatypes ((array!22027 0))(
  ( (array!22028 (arr!10482 (Array (_ BitVec 32) (_ BitVec 64))) (size!10834 (_ BitVec 32))) )
))
(declare-fun lt!175518 () array!22027)

(declare-datatypes ((List!5932 0))(
  ( (Nil!5929) (Cons!5928 (h!6784 (_ BitVec 64)) (t!11082 List!5932)) )
))
(declare-fun arrayNoDuplicates!0 (array!22027 (_ BitVec 32) List!5932) Bool)

(assert (=> b!377466 (= res!213573 (arrayNoDuplicates!0 lt!175518 #b00000000000000000000000000000000 Nil!5929))))

(declare-fun b!377467 () Bool)

(declare-fun res!213572 () Bool)

(declare-fun e!229807 () Bool)

(assert (=> b!377467 (=> (not res!213572) (not e!229807))))

(declare-fun _keys!658 () array!22027)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22027 (_ BitVec 32)) Bool)

(assert (=> b!377467 (= res!213572 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!377468 () Bool)

(declare-fun res!213570 () Bool)

(assert (=> b!377468 (=> (not res!213570) (not e!229807))))

(assert (=> b!377468 (= res!213570 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5929))))

(declare-fun b!377469 () Bool)

(declare-fun res!213568 () Bool)

(assert (=> b!377469 (=> (not res!213568) (not e!229807))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13171 0))(
  ( (V!13172 (val!4569 Int)) )
))
(declare-datatypes ((ValueCell!4181 0))(
  ( (ValueCellFull!4181 (v!6766 V!13171)) (EmptyCell!4181) )
))
(declare-datatypes ((array!22029 0))(
  ( (array!22030 (arr!10483 (Array (_ BitVec 32) ValueCell!4181)) (size!10835 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22029)

(assert (=> b!377469 (= res!213568 (and (= (size!10835 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10834 _keys!658) (size!10835 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!377471 () Bool)

(assert (=> b!377471 (= e!229807 e!229811)))

(declare-fun res!213576 () Bool)

(assert (=> b!377471 (=> (not res!213576) (not e!229811))))

(assert (=> b!377471 (= res!213576 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!175518 mask!970))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!377471 (= lt!175518 (array!22028 (store (arr!10482 _keys!658) i!548 k!778) (size!10834 _keys!658)))))

(declare-fun b!377472 () Bool)

(declare-fun res!213575 () Bool)

(assert (=> b!377472 (=> (not res!213575) (not e!229807))))

(declare-fun arrayContainsKey!0 (array!22027 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!377472 (= res!213575 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!377473 () Bool)

(declare-fun res!213567 () Bool)

(assert (=> b!377473 (=> (not res!213567) (not e!229807))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!377473 (= res!213567 (validKeyInArray!0 k!778))))

(declare-fun b!377474 () Bool)

(declare-fun e!229808 () Bool)

(declare-fun e!229812 () Bool)

(assert (=> b!377474 (= e!229808 e!229812)))

(declare-fun res!213574 () Bool)

(assert (=> b!377474 (=> res!213574 e!229812)))

(assert (=> b!377474 (= res!213574 (= k!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!6092 0))(
  ( (tuple2!6093 (_1!3057 (_ BitVec 64)) (_2!3057 V!13171)) )
))
(declare-datatypes ((List!5933 0))(
  ( (Nil!5930) (Cons!5929 (h!6785 tuple2!6092) (t!11083 List!5933)) )
))
(declare-datatypes ((ListLongMap!5005 0))(
  ( (ListLongMap!5006 (toList!2518 List!5933)) )
))
(declare-fun lt!175520 () ListLongMap!5005)

(declare-fun lt!175525 () ListLongMap!5005)

(assert (=> b!377474 (= lt!175520 lt!175525)))

(declare-fun lt!175528 () ListLongMap!5005)

(declare-fun lt!175522 () tuple2!6092)

(declare-fun +!864 (ListLongMap!5005 tuple2!6092) ListLongMap!5005)

(assert (=> b!377474 (= lt!175525 (+!864 lt!175528 lt!175522))))

(declare-fun lt!175526 () ListLongMap!5005)

(declare-fun lt!175527 () ListLongMap!5005)

(assert (=> b!377474 (= lt!175526 lt!175527)))

(declare-fun lt!175529 () ListLongMap!5005)

(assert (=> b!377474 (= lt!175527 (+!864 lt!175529 lt!175522))))

(declare-fun lt!175530 () ListLongMap!5005)

(assert (=> b!377474 (= lt!175520 (+!864 lt!175530 lt!175522))))

(declare-fun zeroValue!472 () V!13171)

(assert (=> b!377474 (= lt!175522 (tuple2!6093 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun mapNonEmpty!15138 () Bool)

(declare-fun mapRes!15138 () Bool)

(declare-fun tp!29919 () Bool)

(declare-fun e!229810 () Bool)

(assert (=> mapNonEmpty!15138 (= mapRes!15138 (and tp!29919 e!229810))))

(declare-fun mapValue!15138 () ValueCell!4181)

(declare-fun mapKey!15138 () (_ BitVec 32))

(declare-fun mapRest!15138 () (Array (_ BitVec 32) ValueCell!4181))

(assert (=> mapNonEmpty!15138 (= (arr!10483 _values!506) (store mapRest!15138 mapKey!15138 mapValue!15138))))

(declare-fun b!377475 () Bool)

(declare-fun e!229814 () Bool)

(declare-fun e!229809 () Bool)

(assert (=> b!377475 (= e!229814 (and e!229809 mapRes!15138))))

(declare-fun condMapEmpty!15138 () Bool)

(declare-fun mapDefault!15138 () ValueCell!4181)

