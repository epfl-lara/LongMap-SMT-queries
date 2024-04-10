; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37704 () Bool)

(assert start!37704)

(declare-fun b_free!8807 () Bool)

(declare-fun b_next!8807 () Bool)

(assert (=> start!37704 (= b_free!8807 (not b_next!8807))))

(declare-fun tp!31172 () Bool)

(declare-fun b_and!16049 () Bool)

(assert (=> start!37704 (= tp!31172 b_and!16049)))

(declare-fun mapIsEmpty!15783 () Bool)

(declare-fun mapRes!15783 () Bool)

(assert (=> mapIsEmpty!15783 mapRes!15783))

(declare-fun mapNonEmpty!15783 () Bool)

(declare-fun tp!31173 () Bool)

(declare-fun e!234434 () Bool)

(assert (=> mapNonEmpty!15783 (= mapRes!15783 (and tp!31173 e!234434))))

(declare-datatypes ((V!13743 0))(
  ( (V!13744 (val!4784 Int)) )
))
(declare-datatypes ((ValueCell!4396 0))(
  ( (ValueCellFull!4396 (v!6981 V!13743)) (EmptyCell!4396) )
))
(declare-datatypes ((array!22853 0))(
  ( (array!22854 (arr!10895 (Array (_ BitVec 32) ValueCell!4396)) (size!11247 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22853)

(declare-fun mapValue!15783 () ValueCell!4396)

(declare-fun mapKey!15783 () (_ BitVec 32))

(declare-fun mapRest!15783 () (Array (_ BitVec 32) ValueCell!4396))

(assert (=> mapNonEmpty!15783 (= (arr!10895 _values!506) (store mapRest!15783 mapKey!15783 mapValue!15783))))

(declare-fun b!386441 () Bool)

(declare-fun res!220611 () Bool)

(declare-fun e!234429 () Bool)

(assert (=> b!386441 (=> (not res!220611) (not e!234429))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!22855 0))(
  ( (array!22856 (arr!10896 (Array (_ BitVec 32) (_ BitVec 64))) (size!11248 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22855)

(assert (=> b!386441 (= res!220611 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11248 _keys!658))))))

(declare-fun b!386442 () Bool)

(declare-fun res!220615 () Bool)

(assert (=> b!386442 (=> (not res!220615) (not e!234429))))

(assert (=> b!386442 (= res!220615 (or (= (select (arr!10896 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10896 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!386443 () Bool)

(declare-fun tp_is_empty!9479 () Bool)

(assert (=> b!386443 (= e!234434 tp_is_empty!9479)))

(declare-fun b!386444 () Bool)

(declare-fun e!234433 () Bool)

(assert (=> b!386444 (= e!234433 false)))

(declare-datatypes ((tuple2!6430 0))(
  ( (tuple2!6431 (_1!3226 (_ BitVec 64)) (_2!3226 V!13743)) )
))
(declare-datatypes ((List!6277 0))(
  ( (Nil!6274) (Cons!6273 (h!7129 tuple2!6430) (t!11427 List!6277)) )
))
(declare-datatypes ((ListLongMap!5343 0))(
  ( (ListLongMap!5344 (toList!2687 List!6277)) )
))
(declare-fun lt!181809 () ListLongMap!5343)

(declare-fun lt!181808 () array!22855)

(declare-fun zeroValue!472 () V!13743)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!13743)

(declare-fun defaultEntry!514 () Int)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!13743)

(declare-fun getCurrentListMapNoExtraKeys!916 (array!22855 array!22853 (_ BitVec 32) (_ BitVec 32) V!13743 V!13743 (_ BitVec 32) Int) ListLongMap!5343)

(assert (=> b!386444 (= lt!181809 (getCurrentListMapNoExtraKeys!916 lt!181808 (array!22854 (store (arr!10895 _values!506) i!548 (ValueCellFull!4396 v!373)) (size!11247 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181807 () ListLongMap!5343)

(assert (=> b!386444 (= lt!181807 (getCurrentListMapNoExtraKeys!916 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!386445 () Bool)

(declare-fun res!220616 () Bool)

(assert (=> b!386445 (=> (not res!220616) (not e!234433))))

(declare-datatypes ((List!6278 0))(
  ( (Nil!6275) (Cons!6274 (h!7130 (_ BitVec 64)) (t!11428 List!6278)) )
))
(declare-fun arrayNoDuplicates!0 (array!22855 (_ BitVec 32) List!6278) Bool)

(assert (=> b!386445 (= res!220616 (arrayNoDuplicates!0 lt!181808 #b00000000000000000000000000000000 Nil!6275))))

(declare-fun b!386446 () Bool)

(declare-fun e!234430 () Bool)

(assert (=> b!386446 (= e!234430 tp_is_empty!9479)))

(declare-fun b!386447 () Bool)

(declare-fun e!234432 () Bool)

(assert (=> b!386447 (= e!234432 (and e!234430 mapRes!15783))))

(declare-fun condMapEmpty!15783 () Bool)

(declare-fun mapDefault!15783 () ValueCell!4396)

