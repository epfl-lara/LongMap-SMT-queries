; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109334 () Bool)

(assert start!109334)

(declare-fun b_free!28823 () Bool)

(declare-fun b_next!28823 () Bool)

(assert (=> start!109334 (= b_free!28823 (not b_next!28823))))

(declare-fun tp!101588 () Bool)

(declare-fun b_and!46913 () Bool)

(assert (=> start!109334 (= tp!101588 b_and!46913)))

(declare-fun b!1294008 () Bool)

(declare-fun e!738458 () Bool)

(declare-fun tp_is_empty!34463 () Bool)

(assert (=> b!1294008 (= e!738458 tp_is_empty!34463)))

(declare-fun b!1294009 () Bool)

(declare-fun e!738455 () Bool)

(declare-fun e!738457 () Bool)

(declare-fun mapRes!53255 () Bool)

(assert (=> b!1294009 (= e!738455 (and e!738457 mapRes!53255))))

(declare-fun condMapEmpty!53255 () Bool)

(declare-datatypes ((V!51053 0))(
  ( (V!51054 (val!17306 Int)) )
))
(declare-datatypes ((ValueCell!16333 0))(
  ( (ValueCellFull!16333 (v!19909 V!51053)) (EmptyCell!16333) )
))
(declare-datatypes ((array!85950 0))(
  ( (array!85951 (arr!41476 (Array (_ BitVec 32) ValueCell!16333)) (size!42026 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85950)

(declare-fun mapDefault!53255 () ValueCell!16333)

