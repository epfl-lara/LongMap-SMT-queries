; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38600 () Bool)

(assert start!38600)

(declare-fun b_free!9137 () Bool)

(declare-fun b_next!9137 () Bool)

(assert (=> start!38600 (= b_free!9137 (not b_next!9137))))

(declare-fun tp!32535 () Bool)

(declare-fun b_and!16523 () Bool)

(assert (=> start!38600 (= tp!32535 b_and!16523)))

(declare-fun b!399952 () Bool)

(declare-fun res!230047 () Bool)

(declare-fun e!241443 () Bool)

(assert (=> b!399952 (=> (not res!230047) (not e!241443))))

(declare-datatypes ((array!23949 0))(
  ( (array!23950 (arr!11424 (Array (_ BitVec 32) (_ BitVec 64))) (size!11776 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23949)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23949 (_ BitVec 32)) Bool)

(assert (=> b!399952 (= res!230047 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!16650 () Bool)

(declare-fun mapRes!16650 () Bool)

(assert (=> mapIsEmpty!16650 mapRes!16650))

(declare-fun b!399953 () Bool)

(declare-datatypes ((V!14463 0))(
  ( (V!14464 (val!5054 Int)) )
))
(declare-datatypes ((tuple2!6696 0))(
  ( (tuple2!6697 (_1!3359 (_ BitVec 64)) (_2!3359 V!14463)) )
))
(declare-datatypes ((List!6621 0))(
  ( (Nil!6618) (Cons!6617 (h!7473 tuple2!6696) (t!11795 List!6621)) )
))
(declare-datatypes ((ListLongMap!5609 0))(
  ( (ListLongMap!5610 (toList!2820 List!6621)) )
))
(declare-fun call!28075 () ListLongMap!5609)

(declare-fun call!28076 () ListLongMap!5609)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun e!241441 () Bool)

(declare-fun v!412 () V!14463)

(declare-fun +!1108 (ListLongMap!5609 tuple2!6696) ListLongMap!5609)

(assert (=> b!399953 (= e!241441 (= call!28076 (+!1108 call!28075 (tuple2!6697 k!794 v!412))))))

(declare-fun b!399954 () Bool)

(declare-fun res!230038 () Bool)

(assert (=> b!399954 (=> (not res!230038) (not e!241443))))

(declare-datatypes ((List!6622 0))(
  ( (Nil!6619) (Cons!6618 (h!7474 (_ BitVec 64)) (t!11796 List!6622)) )
))
(declare-fun arrayNoDuplicates!0 (array!23949 (_ BitVec 32) List!6622) Bool)

(assert (=> b!399954 (= res!230038 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6619))))

(declare-fun b!399955 () Bool)

(assert (=> b!399955 (= e!241441 (= call!28075 call!28076))))

(declare-fun minValue!515 () V!14463)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4666 0))(
  ( (ValueCellFull!4666 (v!7301 V!14463)) (EmptyCell!4666) )
))
(declare-datatypes ((array!23951 0))(
  ( (array!23952 (arr!11425 (Array (_ BitVec 32) ValueCell!4666)) (size!11777 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23951)

(declare-fun zeroValue!515 () V!14463)

(declare-fun bm!28072 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun c!54662 () Bool)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun lt!187636 () array!23949)

(declare-fun getCurrentListMapNoExtraKeys!1037 (array!23949 array!23951 (_ BitVec 32) (_ BitVec 32) V!14463 V!14463 (_ BitVec 32) Int) ListLongMap!5609)

(assert (=> bm!28072 (= call!28075 (getCurrentListMapNoExtraKeys!1037 (ite c!54662 _keys!709 lt!187636) (ite c!54662 _values!549 (array!23952 (store (arr!11425 _values!549) i!563 (ValueCellFull!4666 v!412)) (size!11777 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!399956 () Bool)

(declare-fun e!241445 () Bool)

(declare-fun e!241442 () Bool)

(assert (=> b!399956 (= e!241445 (and e!241442 mapRes!16650))))

(declare-fun condMapEmpty!16650 () Bool)

(declare-fun mapDefault!16650 () ValueCell!4666)

