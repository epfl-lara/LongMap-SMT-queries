; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38602 () Bool)

(assert start!38602)

(declare-fun b_free!9139 () Bool)

(declare-fun b_next!9139 () Bool)

(assert (=> start!38602 (= b_free!9139 (not b_next!9139))))

(declare-fun tp!32540 () Bool)

(declare-fun b_and!16525 () Bool)

(assert (=> start!38602 (= tp!32540 b_and!16525)))

(declare-fun b!400003 () Bool)

(declare-fun res!230074 () Bool)

(declare-fun e!241465 () Bool)

(assert (=> b!400003 (=> (not res!230074) (not e!241465))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!23953 0))(
  ( (array!23954 (arr!11426 (Array (_ BitVec 32) (_ BitVec 64))) (size!11778 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23953)

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!400003 (= res!230074 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11778 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!400004 () Bool)

(declare-fun res!230082 () Bool)

(declare-fun e!241466 () Bool)

(assert (=> b!400004 (=> (not res!230082) (not e!241466))))

(assert (=> b!400004 (= res!230082 (or (= (select (arr!11426 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11426 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((V!14467 0))(
  ( (V!14468 (val!5055 Int)) )
))
(declare-datatypes ((tuple2!6698 0))(
  ( (tuple2!6699 (_1!3360 (_ BitVec 64)) (_2!3360 V!14467)) )
))
(declare-datatypes ((List!6623 0))(
  ( (Nil!6620) (Cons!6619 (h!7475 tuple2!6698) (t!11797 List!6623)) )
))
(declare-datatypes ((ListLongMap!5611 0))(
  ( (ListLongMap!5612 (toList!2821 List!6623)) )
))
(declare-fun call!28082 () ListLongMap!5611)

(declare-fun e!241467 () Bool)

(declare-fun b!400005 () Bool)

(declare-fun call!28081 () ListLongMap!5611)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun v!412 () V!14467)

(declare-fun +!1109 (ListLongMap!5611 tuple2!6698) ListLongMap!5611)

(assert (=> b!400005 (= e!241467 (= call!28082 (+!1109 call!28081 (tuple2!6699 k!794 v!412))))))

(declare-fun b!400006 () Bool)

(declare-fun res!230085 () Bool)

(assert (=> b!400006 (=> (not res!230085) (not e!241466))))

(declare-fun arrayContainsKey!0 (array!23953 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!400006 (= res!230085 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!400007 () Bool)

(declare-fun e!241462 () Bool)

(declare-fun e!241463 () Bool)

(declare-fun mapRes!16653 () Bool)

(assert (=> b!400007 (= e!241462 (and e!241463 mapRes!16653))))

(declare-fun condMapEmpty!16653 () Bool)

(declare-datatypes ((ValueCell!4667 0))(
  ( (ValueCellFull!4667 (v!7302 V!14467)) (EmptyCell!4667) )
))
(declare-datatypes ((array!23955 0))(
  ( (array!23956 (arr!11427 (Array (_ BitVec 32) ValueCell!4667)) (size!11779 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23955)

(declare-fun mapDefault!16653 () ValueCell!4667)

