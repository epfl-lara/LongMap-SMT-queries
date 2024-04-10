; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38624 () Bool)

(assert start!38624)

(declare-fun b_free!9161 () Bool)

(declare-fun b_next!9161 () Bool)

(assert (=> start!38624 (= b_free!9161 (not b_next!9161))))

(declare-fun tp!32607 () Bool)

(declare-fun b_and!16547 () Bool)

(assert (=> start!38624 (= tp!32607 b_and!16547)))

(declare-datatypes ((V!14495 0))(
  ( (V!14496 (val!5066 Int)) )
))
(declare-fun minValue!515 () V!14495)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun bm!28144 () Bool)

(declare-datatypes ((ValueCell!4678 0))(
  ( (ValueCellFull!4678 (v!7313 V!14495)) (EmptyCell!4678) )
))
(declare-datatypes ((array!23995 0))(
  ( (array!23996 (arr!11447 (Array (_ BitVec 32) ValueCell!4678)) (size!11799 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23995)

(declare-fun zeroValue!515 () V!14495)

(declare-datatypes ((array!23997 0))(
  ( (array!23998 (arr!11448 (Array (_ BitVec 32) (_ BitVec 64))) (size!11800 (_ BitVec 32))) )
))
(declare-fun lt!187709 () array!23997)

(declare-datatypes ((tuple2!6720 0))(
  ( (tuple2!6721 (_1!3371 (_ BitVec 64)) (_2!3371 V!14495)) )
))
(declare-datatypes ((List!6642 0))(
  ( (Nil!6639) (Cons!6638 (h!7494 tuple2!6720) (t!11816 List!6642)) )
))
(declare-datatypes ((ListLongMap!5633 0))(
  ( (ListLongMap!5634 (toList!2832 List!6642)) )
))
(declare-fun call!28148 () ListLongMap!5633)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun c!54698 () Bool)

(declare-fun v!412 () V!14495)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun _keys!709 () array!23997)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1045 (array!23997 array!23995 (_ BitVec 32) (_ BitVec 32) V!14495 V!14495 (_ BitVec 32) Int) ListLongMap!5633)

(assert (=> bm!28144 (= call!28148 (getCurrentListMapNoExtraKeys!1045 (ite c!54698 lt!187709 _keys!709) (ite c!54698 (array!23996 (store (arr!11447 _values!549) i!563 (ValueCellFull!4678 v!412)) (size!11799 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!16686 () Bool)

(declare-fun mapRes!16686 () Bool)

(declare-fun tp!32606 () Bool)

(declare-fun e!241693 () Bool)

(assert (=> mapNonEmpty!16686 (= mapRes!16686 (and tp!32606 e!241693))))

(declare-fun mapKey!16686 () (_ BitVec 32))

(declare-fun mapValue!16686 () ValueCell!4678)

(declare-fun mapRest!16686 () (Array (_ BitVec 32) ValueCell!4678))

(assert (=> mapNonEmpty!16686 (= (arr!11447 _values!549) (store mapRest!16686 mapKey!16686 mapValue!16686))))

(declare-fun b!400564 () Bool)

(declare-fun res!230479 () Bool)

(declare-fun e!241696 () Bool)

(assert (=> b!400564 (=> (not res!230479) (not e!241696))))

(declare-datatypes ((List!6643 0))(
  ( (Nil!6640) (Cons!6639 (h!7495 (_ BitVec 64)) (t!11817 List!6643)) )
))
(declare-fun arrayNoDuplicates!0 (array!23997 (_ BitVec 32) List!6643) Bool)

(assert (=> b!400564 (= res!230479 (arrayNoDuplicates!0 lt!187709 #b00000000000000000000000000000000 Nil!6640))))

(declare-fun b!400565 () Bool)

(declare-fun tp_is_empty!10043 () Bool)

(assert (=> b!400565 (= e!241693 tp_is_empty!10043)))

(declare-fun b!400566 () Bool)

(declare-fun res!230475 () Bool)

(declare-fun e!241697 () Bool)

(assert (=> b!400566 (=> (not res!230475) (not e!241697))))

(assert (=> b!400566 (= res!230475 (and (= (size!11799 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11800 _keys!709) (size!11799 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!400568 () Bool)

(declare-fun res!230471 () Bool)

(assert (=> b!400568 (=> (not res!230471) (not e!241697))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23997 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!400568 (= res!230471 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!400569 () Bool)

(declare-fun res!230476 () Bool)

(assert (=> b!400569 (=> (not res!230476) (not e!241696))))

(assert (=> b!400569 (= res!230476 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11800 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!16686 () Bool)

(assert (=> mapIsEmpty!16686 mapRes!16686))

(declare-fun call!28147 () ListLongMap!5633)

(declare-fun e!241698 () Bool)

(declare-fun b!400570 () Bool)

(declare-fun +!1117 (ListLongMap!5633 tuple2!6720) ListLongMap!5633)

(assert (=> b!400570 (= e!241698 (= call!28148 (+!1117 call!28147 (tuple2!6721 k!794 v!412))))))

(declare-fun b!400571 () Bool)

(declare-fun res!230477 () Bool)

(assert (=> b!400571 (=> (not res!230477) (not e!241697))))

(assert (=> b!400571 (= res!230477 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11800 _keys!709))))))

(declare-fun b!400572 () Bool)

(assert (=> b!400572 (= e!241698 (= call!28147 call!28148))))

(declare-fun bm!28145 () Bool)

(assert (=> bm!28145 (= call!28147 (getCurrentListMapNoExtraKeys!1045 (ite c!54698 _keys!709 lt!187709) (ite c!54698 _values!549 (array!23996 (store (arr!11447 _values!549) i!563 (ValueCellFull!4678 v!412)) (size!11799 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!400573 () Bool)

(declare-fun res!230478 () Bool)

(assert (=> b!400573 (=> (not res!230478) (not e!241697))))

(assert (=> b!400573 (= res!230478 (or (= (select (arr!11448 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11448 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!400574 () Bool)

(declare-fun res!230481 () Bool)

(assert (=> b!400574 (=> (not res!230481) (not e!241697))))

(assert (=> b!400574 (= res!230481 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6640))))

(declare-fun b!400575 () Bool)

(declare-fun e!241695 () Bool)

(declare-fun e!241692 () Bool)

(assert (=> b!400575 (= e!241695 (and e!241692 mapRes!16686))))

(declare-fun condMapEmpty!16686 () Bool)

(declare-fun mapDefault!16686 () ValueCell!4678)

