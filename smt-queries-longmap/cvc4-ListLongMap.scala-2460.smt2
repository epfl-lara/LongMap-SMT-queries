; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38582 () Bool)

(assert start!38582)

(declare-fun b_free!9119 () Bool)

(declare-fun b_next!9119 () Bool)

(assert (=> start!38582 (= b_free!9119 (not b_next!9119))))

(declare-fun tp!32480 () Bool)

(declare-fun b_and!16505 () Bool)

(assert (=> start!38582 (= tp!32480 b_and!16505)))

(declare-fun b!399493 () Bool)

(declare-fun res!229718 () Bool)

(declare-fun e!241256 () Bool)

(assert (=> b!399493 (=> (not res!229718) (not e!241256))))

(declare-datatypes ((array!23913 0))(
  ( (array!23914 (arr!11406 (Array (_ BitVec 32) (_ BitVec 64))) (size!11758 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23913)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14439 0))(
  ( (V!14440 (val!5045 Int)) )
))
(declare-datatypes ((ValueCell!4657 0))(
  ( (ValueCellFull!4657 (v!7292 V!14439)) (EmptyCell!4657) )
))
(declare-datatypes ((array!23915 0))(
  ( (array!23916 (arr!11407 (Array (_ BitVec 32) ValueCell!4657)) (size!11759 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23915)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!399493 (= res!229718 (and (= (size!11759 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11758 _keys!709) (size!11759 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-datatypes ((tuple2!6680 0))(
  ( (tuple2!6681 (_1!3351 (_ BitVec 64)) (_2!3351 V!14439)) )
))
(declare-datatypes ((List!6607 0))(
  ( (Nil!6604) (Cons!6603 (h!7459 tuple2!6680) (t!11781 List!6607)) )
))
(declare-datatypes ((ListLongMap!5593 0))(
  ( (ListLongMap!5594 (toList!2812 List!6607)) )
))
(declare-fun call!28021 () ListLongMap!5593)

(declare-fun minValue!515 () V!14439)

(declare-fun defaultEntry!557 () Int)

(declare-fun bm!28018 () Bool)

(declare-fun zeroValue!515 () V!14439)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun c!54635 () Bool)

(declare-fun v!412 () V!14439)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lt!187583 () array!23913)

(declare-fun getCurrentListMapNoExtraKeys!1029 (array!23913 array!23915 (_ BitVec 32) (_ BitVec 32) V!14439 V!14439 (_ BitVec 32) Int) ListLongMap!5593)

(assert (=> bm!28018 (= call!28021 (getCurrentListMapNoExtraKeys!1029 (ite c!54635 _keys!709 lt!187583) (ite c!54635 _values!549 (array!23916 (store (arr!11407 _values!549) i!563 (ValueCellFull!4657 v!412)) (size!11759 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!399494 () Bool)

(declare-fun e!241251 () Bool)

(declare-fun e!241254 () Bool)

(declare-fun mapRes!16623 () Bool)

(assert (=> b!399494 (= e!241251 (and e!241254 mapRes!16623))))

(declare-fun condMapEmpty!16623 () Bool)

(declare-fun mapDefault!16623 () ValueCell!4657)

