; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38034 () Bool)

(assert start!38034)

(declare-fun b_free!8981 () Bool)

(declare-fun b_next!8981 () Bool)

(assert (=> start!38034 (= b_free!8981 (not b_next!8981))))

(declare-fun tp!31716 () Bool)

(declare-fun b_and!16307 () Bool)

(assert (=> start!38034 (= tp!31716 b_and!16307)))

(declare-fun b!391482 () Bool)

(declare-fun e!237111 () Bool)

(assert (=> b!391482 (= e!237111 true)))

(declare-datatypes ((V!13975 0))(
  ( (V!13976 (val!4871 Int)) )
))
(declare-datatypes ((tuple2!6562 0))(
  ( (tuple2!6563 (_1!3292 (_ BitVec 64)) (_2!3292 V!13975)) )
))
(declare-datatypes ((List!6416 0))(
  ( (Nil!6413) (Cons!6412 (h!7268 tuple2!6562) (t!11580 List!6416)) )
))
(declare-datatypes ((ListLongMap!5475 0))(
  ( (ListLongMap!5476 (toList!2753 List!6416)) )
))
(declare-fun lt!184758 () ListLongMap!5475)

(declare-fun lt!184755 () ListLongMap!5475)

(declare-fun lt!184753 () tuple2!6562)

(declare-fun +!1048 (ListLongMap!5475 tuple2!6562) ListLongMap!5475)

(assert (=> b!391482 (= lt!184758 (+!1048 lt!184755 lt!184753))))

(declare-fun lt!184747 () ListLongMap!5475)

(declare-fun v!373 () V!13975)

(declare-datatypes ((Unit!11978 0))(
  ( (Unit!11979) )
))
(declare-fun lt!184756 () Unit!11978)

(declare-fun k!778 () (_ BitVec 64))

(declare-fun zeroValue!472 () V!13975)

(declare-fun addCommutativeForDiffKeys!339 (ListLongMap!5475 (_ BitVec 64) V!13975 (_ BitVec 64) V!13975) Unit!11978)

(assert (=> b!391482 (= lt!184756 (addCommutativeForDiffKeys!339 lt!184747 k!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!391484 () Bool)

(declare-fun e!237113 () Bool)

(declare-fun tp_is_empty!9653 () Bool)

(assert (=> b!391484 (= e!237113 tp_is_empty!9653)))

(declare-fun b!391485 () Bool)

(declare-fun res!224085 () Bool)

(declare-fun e!237114 () Bool)

(assert (=> b!391485 (=> (not res!224085) (not e!237114))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!391485 (= res!224085 (validKeyInArray!0 k!778))))

(declare-fun b!391486 () Bool)

(declare-fun res!224082 () Bool)

(assert (=> b!391486 (=> (not res!224082) (not e!237114))))

(declare-datatypes ((array!23209 0))(
  ( (array!23210 (arr!11066 (Array (_ BitVec 32) (_ BitVec 64))) (size!11418 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23209)

(declare-fun arrayContainsKey!0 (array!23209 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!391486 (= res!224082 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!391487 () Bool)

(declare-fun res!224083 () Bool)

(declare-fun e!237116 () Bool)

(assert (=> b!391487 (=> (not res!224083) (not e!237116))))

(declare-fun lt!184750 () array!23209)

(declare-datatypes ((List!6417 0))(
  ( (Nil!6414) (Cons!6413 (h!7269 (_ BitVec 64)) (t!11581 List!6417)) )
))
(declare-fun arrayNoDuplicates!0 (array!23209 (_ BitVec 32) List!6417) Bool)

(assert (=> b!391487 (= res!224083 (arrayNoDuplicates!0 lt!184750 #b00000000000000000000000000000000 Nil!6414))))

(declare-fun b!391488 () Bool)

(declare-fun res!224084 () Bool)

(assert (=> b!391488 (=> (not res!224084) (not e!237114))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23209 (_ BitVec 32)) Bool)

(assert (=> b!391488 (= res!224084 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!391489 () Bool)

(declare-fun e!237112 () Bool)

(declare-fun e!237117 () Bool)

(declare-fun mapRes!16065 () Bool)

(assert (=> b!391489 (= e!237112 (and e!237117 mapRes!16065))))

(declare-fun condMapEmpty!16065 () Bool)

(declare-datatypes ((ValueCell!4483 0))(
  ( (ValueCellFull!4483 (v!7096 V!13975)) (EmptyCell!4483) )
))
(declare-datatypes ((array!23211 0))(
  ( (array!23212 (arr!11067 (Array (_ BitVec 32) ValueCell!4483)) (size!11419 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23211)

(declare-fun mapDefault!16065 () ValueCell!4483)

