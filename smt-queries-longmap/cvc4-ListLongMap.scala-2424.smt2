; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38294 () Bool)

(assert start!38294)

(declare-fun res!226432 () Bool)

(declare-fun e!239151 () Bool)

(assert (=> start!38294 (=> (not res!226432) (not e!239151))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!23477 0))(
  ( (array!23478 (arr!11193 (Array (_ BitVec 32) (_ BitVec 64))) (size!11545 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23477)

(assert (=> start!38294 (= res!226432 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11545 _keys!709))))))

(assert (=> start!38294 e!239151))

(assert (=> start!38294 true))

(declare-datatypes ((V!14151 0))(
  ( (V!14152 (val!4937 Int)) )
))
(declare-datatypes ((ValueCell!4549 0))(
  ( (ValueCellFull!4549 (v!7182 V!14151)) (EmptyCell!4549) )
))
(declare-datatypes ((array!23479 0))(
  ( (array!23480 (arr!11194 (Array (_ BitVec 32) ValueCell!4549)) (size!11546 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23479)

(declare-fun e!239154 () Bool)

(declare-fun array_inv!8214 (array!23479) Bool)

(assert (=> start!38294 (and (array_inv!8214 _values!549) e!239154)))

(declare-fun array_inv!8215 (array!23477) Bool)

(assert (=> start!38294 (array_inv!8215 _keys!709)))

(declare-fun b!395010 () Bool)

(declare-fun res!226427 () Bool)

(assert (=> b!395010 (=> (not res!226427) (not e!239151))))

(declare-datatypes ((List!6502 0))(
  ( (Nil!6499) (Cons!6498 (h!7354 (_ BitVec 64)) (t!11676 List!6502)) )
))
(declare-fun noDuplicate!197 (List!6502) Bool)

(assert (=> b!395010 (= res!226427 (noDuplicate!197 Nil!6499))))

(declare-fun b!395011 () Bool)

(declare-fun e!239153 () Bool)

(assert (=> b!395011 (= e!239151 e!239153)))

(declare-fun res!226433 () Bool)

(assert (=> b!395011 (=> res!226433 e!239153)))

(declare-fun contains!2479 (List!6502 (_ BitVec 64)) Bool)

(assert (=> b!395011 (= res!226433 (contains!2479 Nil!6499 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!395012 () Bool)

(declare-fun res!226431 () Bool)

(assert (=> b!395012 (=> (not res!226431) (not e!239151))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23477 (_ BitVec 32)) Bool)

(assert (=> b!395012 (= res!226431 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!395013 () Bool)

(assert (=> b!395013 (= e!239153 (contains!2479 Nil!6499 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!16284 () Bool)

(declare-fun mapRes!16284 () Bool)

(assert (=> mapIsEmpty!16284 mapRes!16284))

(declare-fun b!395014 () Bool)

(declare-fun e!239155 () Bool)

(declare-fun tp_is_empty!9785 () Bool)

(assert (=> b!395014 (= e!239155 tp_is_empty!9785)))

(declare-fun b!395015 () Bool)

(declare-fun e!239156 () Bool)

(assert (=> b!395015 (= e!239154 (and e!239156 mapRes!16284))))

(declare-fun condMapEmpty!16284 () Bool)

(declare-fun mapDefault!16284 () ValueCell!4549)

