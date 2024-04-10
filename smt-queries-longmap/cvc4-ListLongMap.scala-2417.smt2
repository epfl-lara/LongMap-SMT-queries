; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38234 () Bool)

(assert start!38234)

(declare-fun b_free!9071 () Bool)

(declare-fun b_next!9071 () Bool)

(assert (=> start!38234 (= b_free!9071 (not b_next!9071))))

(declare-fun tp!32000 () Bool)

(declare-fun b_and!16457 () Bool)

(assert (=> start!38234 (= tp!32000 b_and!16457)))

(declare-fun b!394455 () Bool)

(declare-fun res!226091 () Bool)

(declare-fun e!238777 () Bool)

(assert (=> b!394455 (=> (not res!226091) (not e!238777))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!23395 0))(
  ( (array!23396 (arr!11154 (Array (_ BitVec 32) (_ BitVec 64))) (size!11506 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23395)

(assert (=> b!394455 (= res!226091 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11506 _keys!658))))))

(declare-fun b!394456 () Bool)

(declare-fun res!226099 () Bool)

(assert (=> b!394456 (=> (not res!226099) (not e!238777))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23395 (_ BitVec 32)) Bool)

(assert (=> b!394456 (= res!226099 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!394457 () Bool)

(declare-fun res!226100 () Bool)

(assert (=> b!394457 (=> (not res!226100) (not e!238777))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!394457 (= res!226100 (validKeyInArray!0 k!778))))

(declare-fun b!394458 () Bool)

(declare-fun res!226090 () Bool)

(declare-fun e!238778 () Bool)

(assert (=> b!394458 (=> (not res!226090) (not e!238778))))

(declare-fun lt!186923 () array!23395)

(declare-datatypes ((List!6491 0))(
  ( (Nil!6488) (Cons!6487 (h!7343 (_ BitVec 64)) (t!11665 List!6491)) )
))
(declare-fun arrayNoDuplicates!0 (array!23395 (_ BitVec 32) List!6491) Bool)

(assert (=> b!394458 (= res!226090 (arrayNoDuplicates!0 lt!186923 #b00000000000000000000000000000000 Nil!6488))))

(declare-fun b!394459 () Bool)

(declare-fun e!238775 () Bool)

(declare-datatypes ((V!14095 0))(
  ( (V!14096 (val!4916 Int)) )
))
(declare-datatypes ((ValueCell!4528 0))(
  ( (ValueCellFull!4528 (v!7161 V!14095)) (EmptyCell!4528) )
))
(declare-datatypes ((array!23397 0))(
  ( (array!23398 (arr!11155 (Array (_ BitVec 32) ValueCell!4528)) (size!11507 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23397)

(assert (=> b!394459 (= e!238775 (bvslt i!548 (size!11507 _values!506)))))

(declare-fun b!394460 () Bool)

(declare-fun e!238771 () Bool)

(assert (=> b!394460 (= e!238778 (not e!238771))))

(declare-fun res!226094 () Bool)

(assert (=> b!394460 (=> res!226094 e!238771)))

(declare-fun lt!186925 () Bool)

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!394460 (= res!226094 (or (and (not lt!186925) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!186925) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!186925)))))

(assert (=> b!394460 (= lt!186925 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6638 0))(
  ( (tuple2!6639 (_1!3330 (_ BitVec 64)) (_2!3330 V!14095)) )
))
(declare-datatypes ((List!6492 0))(
  ( (Nil!6489) (Cons!6488 (h!7344 tuple2!6638) (t!11666 List!6492)) )
))
(declare-datatypes ((ListLongMap!5551 0))(
  ( (ListLongMap!5552 (toList!2791 List!6492)) )
))
(declare-fun lt!186926 () ListLongMap!5551)

(declare-fun zeroValue!472 () V!14095)

(declare-fun minValue!472 () V!14095)

(declare-fun getCurrentListMap!2130 (array!23395 array!23397 (_ BitVec 32) (_ BitVec 32) V!14095 V!14095 (_ BitVec 32) Int) ListLongMap!5551)

(assert (=> b!394460 (= lt!186926 (getCurrentListMap!2130 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186922 () array!23397)

(declare-fun lt!186927 () ListLongMap!5551)

(assert (=> b!394460 (= lt!186927 (getCurrentListMap!2130 lt!186923 lt!186922 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186919 () ListLongMap!5551)

(declare-fun lt!186918 () ListLongMap!5551)

(assert (=> b!394460 (and (= lt!186919 lt!186918) (= lt!186918 lt!186919))))

(declare-fun lt!186920 () ListLongMap!5551)

(declare-fun lt!186924 () tuple2!6638)

(declare-fun +!1084 (ListLongMap!5551 tuple2!6638) ListLongMap!5551)

(assert (=> b!394460 (= lt!186918 (+!1084 lt!186920 lt!186924))))

(declare-fun v!373 () V!14095)

(assert (=> b!394460 (= lt!186924 (tuple2!6639 k!778 v!373))))

(declare-datatypes ((Unit!12058 0))(
  ( (Unit!12059) )
))
(declare-fun lt!186921 () Unit!12058)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!294 (array!23395 array!23397 (_ BitVec 32) (_ BitVec 32) V!14095 V!14095 (_ BitVec 32) (_ BitVec 64) V!14095 (_ BitVec 32) Int) Unit!12058)

(assert (=> b!394460 (= lt!186921 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!294 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!1010 (array!23395 array!23397 (_ BitVec 32) (_ BitVec 32) V!14095 V!14095 (_ BitVec 32) Int) ListLongMap!5551)

(assert (=> b!394460 (= lt!186919 (getCurrentListMapNoExtraKeys!1010 lt!186923 lt!186922 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!394460 (= lt!186922 (array!23398 (store (arr!11155 _values!506) i!548 (ValueCellFull!4528 v!373)) (size!11507 _values!506)))))

(assert (=> b!394460 (= lt!186920 (getCurrentListMapNoExtraKeys!1010 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!394461 () Bool)

(declare-fun res!226093 () Bool)

(assert (=> b!394461 (=> (not res!226093) (not e!238777))))

(assert (=> b!394461 (= res!226093 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6488))))

(declare-fun b!394462 () Bool)

(assert (=> b!394462 (= e!238771 e!238775)))

(declare-fun res!226096 () Bool)

(assert (=> b!394462 (=> res!226096 e!238775)))

(assert (=> b!394462 (= res!226096 (not (= (+!1084 lt!186926 lt!186924) lt!186927)))))

(assert (=> b!394462 (= lt!186927 lt!186919)))

(declare-fun b!394463 () Bool)

(declare-fun res!226092 () Bool)

(assert (=> b!394463 (=> (not res!226092) (not e!238777))))

(declare-fun arrayContainsKey!0 (array!23395 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!394463 (= res!226092 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun res!226089 () Bool)

(assert (=> start!38234 (=> (not res!226089) (not e!238777))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!38234 (= res!226089 (validMask!0 mask!970))))

(assert (=> start!38234 e!238777))

(declare-fun e!238774 () Bool)

(declare-fun array_inv!8188 (array!23397) Bool)

(assert (=> start!38234 (and (array_inv!8188 _values!506) e!238774)))

(assert (=> start!38234 tp!32000))

(assert (=> start!38234 true))

(declare-fun tp_is_empty!9743 () Bool)

(assert (=> start!38234 tp_is_empty!9743))

(declare-fun array_inv!8189 (array!23395) Bool)

(assert (=> start!38234 (array_inv!8189 _keys!658)))

(declare-fun b!394464 () Bool)

(declare-fun e!238772 () Bool)

(assert (=> b!394464 (= e!238772 tp_is_empty!9743)))

(declare-fun b!394465 () Bool)

(assert (=> b!394465 (= e!238777 e!238778)))

(declare-fun res!226095 () Bool)

(assert (=> b!394465 (=> (not res!226095) (not e!238778))))

(assert (=> b!394465 (= res!226095 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!186923 mask!970))))

(assert (=> b!394465 (= lt!186923 (array!23396 (store (arr!11154 _keys!658) i!548 k!778) (size!11506 _keys!658)))))

(declare-fun b!394466 () Bool)

(declare-fun res!226098 () Bool)

(assert (=> b!394466 (=> (not res!226098) (not e!238777))))

(assert (=> b!394466 (= res!226098 (or (= (select (arr!11154 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11154 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!394467 () Bool)

(declare-fun e!238773 () Bool)

(declare-fun mapRes!16215 () Bool)

(assert (=> b!394467 (= e!238774 (and e!238773 mapRes!16215))))

(declare-fun condMapEmpty!16215 () Bool)

(declare-fun mapDefault!16215 () ValueCell!4528)

