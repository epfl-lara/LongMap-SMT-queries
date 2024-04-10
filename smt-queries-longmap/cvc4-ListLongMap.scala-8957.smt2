; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108472 () Bool)

(assert start!108472)

(declare-fun b_free!28019 () Bool)

(declare-fun b_next!28019 () Bool)

(assert (=> start!108472 (= b_free!28019 (not b_next!28019))))

(declare-fun tp!99167 () Bool)

(declare-fun b_and!46079 () Bool)

(assert (=> start!108472 (= tp!99167 b_and!46079)))

(declare-fun b!1280241 () Bool)

(declare-fun e!731507 () Bool)

(declare-fun e!731510 () Bool)

(declare-fun mapRes!52040 () Bool)

(assert (=> b!1280241 (= e!731507 (and e!731510 mapRes!52040))))

(declare-fun condMapEmpty!52040 () Bool)

(declare-datatypes ((V!49981 0))(
  ( (V!49982 (val!16904 Int)) )
))
(declare-datatypes ((ValueCell!15931 0))(
  ( (ValueCellFull!15931 (v!19504 V!49981)) (EmptyCell!15931) )
))
(declare-datatypes ((array!84398 0))(
  ( (array!84399 (arr!40703 (Array (_ BitVec 32) ValueCell!15931)) (size!41253 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84398)

(declare-fun mapDefault!52040 () ValueCell!15931)

