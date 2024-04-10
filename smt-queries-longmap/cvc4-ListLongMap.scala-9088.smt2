; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109316 () Bool)

(assert start!109316)

(declare-fun b_free!28805 () Bool)

(declare-fun b_next!28805 () Bool)

(assert (=> start!109316 (= b_free!28805 (not b_next!28805))))

(declare-fun tp!101534 () Bool)

(declare-fun b_and!46895 () Bool)

(assert (=> start!109316 (= tp!101534 b_and!46895)))

(declare-fun b!1293692 () Bool)

(declare-fun res!859688 () Bool)

(declare-fun e!738301 () Bool)

(assert (=> b!1293692 (=> (not res!859688) (not e!738301))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!85918 0))(
  ( (array!85919 (arr!41460 (Array (_ BitVec 32) (_ BitVec 64))) (size!42010 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85918)

(assert (=> b!1293692 (= res!859688 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42010 _keys!1741))))))

(declare-fun b!1293693 () Bool)

(declare-fun e!738300 () Bool)

(declare-fun tp_is_empty!34445 () Bool)

(assert (=> b!1293693 (= e!738300 tp_is_empty!34445)))

(declare-fun mapIsEmpty!53228 () Bool)

(declare-fun mapRes!53228 () Bool)

(assert (=> mapIsEmpty!53228 mapRes!53228))

(declare-fun b!1293694 () Bool)

(declare-fun e!738303 () Bool)

(declare-fun e!738304 () Bool)

(assert (=> b!1293694 (= e!738303 (and e!738304 mapRes!53228))))

(declare-fun condMapEmpty!53228 () Bool)

(declare-datatypes ((V!51029 0))(
  ( (V!51030 (val!17297 Int)) )
))
(declare-datatypes ((ValueCell!16324 0))(
  ( (ValueCellFull!16324 (v!19900 V!51029)) (EmptyCell!16324) )
))
(declare-datatypes ((array!85920 0))(
  ( (array!85921 (arr!41461 (Array (_ BitVec 32) ValueCell!16324)) (size!42011 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85920)

(declare-fun mapDefault!53228 () ValueCell!16324)

