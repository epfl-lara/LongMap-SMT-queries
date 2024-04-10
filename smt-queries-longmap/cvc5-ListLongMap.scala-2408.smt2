; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38110 () Bool)

(assert start!38110)

(declare-fun b_free!9013 () Bool)

(declare-fun b_next!9013 () Bool)

(assert (=> start!38110 (= b_free!9013 (not b_next!9013))))

(declare-fun tp!31817 () Bool)

(declare-fun b_and!16363 () Bool)

(assert (=> start!38110 (= tp!31817 b_and!16363)))

(declare-fun b!392592 () Bool)

(declare-fun e!237742 () Bool)

(declare-fun e!237741 () Bool)

(assert (=> b!392592 (= e!237742 (not e!237741))))

(declare-fun res!224834 () Bool)

(assert (=> b!392592 (=> res!224834 e!237741)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!392592 (= res!224834 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!14019 0))(
  ( (V!14020 (val!4887 Int)) )
))
(declare-datatypes ((ValueCell!4499 0))(
  ( (ValueCellFull!4499 (v!7120 V!14019)) (EmptyCell!4499) )
))
(declare-datatypes ((array!23277 0))(
  ( (array!23278 (arr!11098 (Array (_ BitVec 32) ValueCell!4499)) (size!11450 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23277)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6592 0))(
  ( (tuple2!6593 (_1!3307 (_ BitVec 64)) (_2!3307 V!14019)) )
))
(declare-datatypes ((List!6445 0))(
  ( (Nil!6442) (Cons!6441 (h!7297 tuple2!6592) (t!11613 List!6445)) )
))
(declare-datatypes ((ListLongMap!5505 0))(
  ( (ListLongMap!5506 (toList!2768 List!6445)) )
))
(declare-fun lt!185554 () ListLongMap!5505)

(declare-fun zeroValue!472 () V!14019)

(declare-datatypes ((array!23279 0))(
  ( (array!23280 (arr!11099 (Array (_ BitVec 32) (_ BitVec 64))) (size!11451 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23279)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!14019)

(declare-fun getCurrentListMap!2110 (array!23279 array!23277 (_ BitVec 32) (_ BitVec 32) V!14019 V!14019 (_ BitVec 32) Int) ListLongMap!5505)

(assert (=> b!392592 (= lt!185554 (getCurrentListMap!2110 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185549 () array!23277)

(declare-fun lt!185553 () ListLongMap!5505)

(declare-fun lt!185547 () array!23279)

(assert (=> b!392592 (= lt!185553 (getCurrentListMap!2110 lt!185547 lt!185549 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185555 () ListLongMap!5505)

(declare-fun lt!185550 () ListLongMap!5505)

(assert (=> b!392592 (and (= lt!185555 lt!185550) (= lt!185550 lt!185555))))

(declare-fun v!373 () V!14019)

(declare-fun lt!185551 () ListLongMap!5505)

(declare-fun k!778 () (_ BitVec 64))

(declare-fun +!1063 (ListLongMap!5505 tuple2!6592) ListLongMap!5505)

(assert (=> b!392592 (= lt!185550 (+!1063 lt!185551 (tuple2!6593 k!778 v!373)))))

(declare-datatypes ((Unit!12012 0))(
  ( (Unit!12013) )
))
(declare-fun lt!185548 () Unit!12012)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!274 (array!23279 array!23277 (_ BitVec 32) (_ BitVec 32) V!14019 V!14019 (_ BitVec 32) (_ BitVec 64) V!14019 (_ BitVec 32) Int) Unit!12012)

(assert (=> b!392592 (= lt!185548 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!274 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!990 (array!23279 array!23277 (_ BitVec 32) (_ BitVec 32) V!14019 V!14019 (_ BitVec 32) Int) ListLongMap!5505)

(assert (=> b!392592 (= lt!185555 (getCurrentListMapNoExtraKeys!990 lt!185547 lt!185549 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!392592 (= lt!185549 (array!23278 (store (arr!11098 _values!506) i!548 (ValueCellFull!4499 v!373)) (size!11450 _values!506)))))

(assert (=> b!392592 (= lt!185551 (getCurrentListMapNoExtraKeys!990 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapIsEmpty!16119 () Bool)

(declare-fun mapRes!16119 () Bool)

(assert (=> mapIsEmpty!16119 mapRes!16119))

(declare-fun b!392593 () Bool)

(declare-fun res!224832 () Bool)

(declare-fun e!237743 () Bool)

(assert (=> b!392593 (=> (not res!224832) (not e!237743))))

(declare-datatypes ((List!6446 0))(
  ( (Nil!6443) (Cons!6442 (h!7298 (_ BitVec 64)) (t!11614 List!6446)) )
))
(declare-fun arrayNoDuplicates!0 (array!23279 (_ BitVec 32) List!6446) Bool)

(assert (=> b!392593 (= res!224832 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6443))))

(declare-fun b!392594 () Bool)

(declare-fun res!224833 () Bool)

(assert (=> b!392594 (=> (not res!224833) (not e!237743))))

(assert (=> b!392594 (= res!224833 (and (= (size!11450 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11451 _keys!658) (size!11450 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!392595 () Bool)

(declare-fun e!237744 () Bool)

(declare-fun tp_is_empty!9685 () Bool)

(assert (=> b!392595 (= e!237744 tp_is_empty!9685)))

(declare-fun b!392596 () Bool)

(declare-fun res!224830 () Bool)

(assert (=> b!392596 (=> (not res!224830) (not e!237743))))

(assert (=> b!392596 (= res!224830 (or (= (select (arr!11099 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11099 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!392597 () Bool)

(declare-fun res!224828 () Bool)

(assert (=> b!392597 (=> (not res!224828) (not e!237743))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!392597 (= res!224828 (validKeyInArray!0 k!778))))

(declare-fun lt!185552 () tuple2!6592)

(declare-fun e!237739 () Bool)

(declare-fun b!392598 () Bool)

(assert (=> b!392598 (= e!237739 (= lt!185554 (+!1063 lt!185551 lt!185552)))))

(declare-fun b!392599 () Bool)

(declare-fun res!224823 () Bool)

(assert (=> b!392599 (=> (not res!224823) (not e!237743))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23279 (_ BitVec 32)) Bool)

(assert (=> b!392599 (= res!224823 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!392600 () Bool)

(assert (=> b!392600 (= e!237741 (not (= k!778 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!392600 e!237739))

(declare-fun res!224825 () Bool)

(assert (=> b!392600 (=> (not res!224825) (not e!237739))))

(assert (=> b!392600 (= res!224825 (= lt!185553 (+!1063 lt!185555 lt!185552)))))

(assert (=> b!392600 (= lt!185552 (tuple2!6593 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!392601 () Bool)

(declare-fun e!237745 () Bool)

(assert (=> b!392601 (= e!237745 (and e!237744 mapRes!16119))))

(declare-fun condMapEmpty!16119 () Bool)

(declare-fun mapDefault!16119 () ValueCell!4499)

