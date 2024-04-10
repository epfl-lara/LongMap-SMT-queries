; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38738 () Bool)

(assert start!38738)

(declare-fun b_free!9275 () Bool)

(declare-fun b_next!9275 () Bool)

(assert (=> start!38738 (= b_free!9275 (not b_next!9275))))

(declare-fun tp!32949 () Bool)

(declare-fun b_and!16661 () Bool)

(assert (=> start!38738 (= tp!32949 b_and!16661)))

(declare-datatypes ((V!14647 0))(
  ( (V!14648 (val!5123 Int)) )
))
(declare-fun minValue!515 () V!14647)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4735 0))(
  ( (ValueCellFull!4735 (v!7370 V!14647)) (EmptyCell!4735) )
))
(declare-datatypes ((array!24213 0))(
  ( (array!24214 (arr!11556 (Array (_ BitVec 32) ValueCell!4735)) (size!11908 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24213)

(declare-fun zeroValue!515 () V!14647)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((array!24215 0))(
  ( (array!24216 (arr!11557 (Array (_ BitVec 32) (_ BitVec 64))) (size!11909 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24215)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun bm!28486 () Bool)

(declare-fun c!54869 () Bool)

(declare-datatypes ((tuple2!6808 0))(
  ( (tuple2!6809 (_1!3415 (_ BitVec 64)) (_2!3415 V!14647)) )
))
(declare-datatypes ((List!6727 0))(
  ( (Nil!6724) (Cons!6723 (h!7579 tuple2!6808) (t!11901 List!6727)) )
))
(declare-datatypes ((ListLongMap!5721 0))(
  ( (ListLongMap!5722 (toList!2876 List!6727)) )
))
(declare-fun call!28489 () ListLongMap!5721)

(declare-fun lt!188051 () array!24215)

(declare-fun v!412 () V!14647)

(declare-fun getCurrentListMapNoExtraKeys!1085 (array!24215 array!24213 (_ BitVec 32) (_ BitVec 32) V!14647 V!14647 (_ BitVec 32) Int) ListLongMap!5721)

(assert (=> bm!28486 (= call!28489 (getCurrentListMapNoExtraKeys!1085 (ite c!54869 _keys!709 lt!188051) (ite c!54869 _values!549 (array!24214 (store (arr!11556 _values!549) i!563 (ValueCellFull!4735 v!412)) (size!11908 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!28487 () Bool)

(declare-fun call!28490 () ListLongMap!5721)

(assert (=> bm!28487 (= call!28490 (getCurrentListMapNoExtraKeys!1085 (ite c!54869 lt!188051 _keys!709) (ite c!54869 (array!24214 (store (arr!11556 _values!549) i!563 (ValueCellFull!4735 v!412)) (size!11908 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!403471 () Bool)

(declare-fun res!232530 () Bool)

(declare-fun e!242892 () Bool)

(assert (=> b!403471 (=> (not res!232530) (not e!242892))))

(assert (=> b!403471 (= res!232530 (and (= (size!11908 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11909 _keys!709) (size!11908 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!403472 () Bool)

(declare-fun e!242889 () Bool)

(assert (=> b!403472 (= e!242889 (= call!28489 call!28490))))

(declare-fun b!403473 () Bool)

(declare-fun e!242890 () Bool)

(declare-fun e!242895 () Bool)

(declare-fun mapRes!16857 () Bool)

(assert (=> b!403473 (= e!242890 (and e!242895 mapRes!16857))))

(declare-fun condMapEmpty!16857 () Bool)

(declare-fun mapDefault!16857 () ValueCell!4735)

