; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108860 () Bool)

(assert start!108860)

(declare-fun b_free!28373 () Bool)

(declare-fun b_next!28373 () Bool)

(assert (=> start!108860 (= b_free!28373 (not b_next!28373))))

(declare-fun tp!100234 () Bool)

(declare-fun b_and!46439 () Bool)

(assert (=> start!108860 (= tp!100234 b_and!46439)))

(declare-fun res!854038 () Bool)

(declare-fun e!734359 () Bool)

(assert (=> start!108860 (=> (not res!854038) (not e!734359))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108860 (= res!854038 (validMask!0 mask!2175))))

(assert (=> start!108860 e!734359))

(declare-fun tp_is_empty!34013 () Bool)

(assert (=> start!108860 tp_is_empty!34013))

(assert (=> start!108860 true))

(declare-datatypes ((V!50453 0))(
  ( (V!50454 (val!17081 Int)) )
))
(declare-datatypes ((ValueCell!16108 0))(
  ( (ValueCellFull!16108 (v!19683 V!50453)) (EmptyCell!16108) )
))
(declare-datatypes ((array!85080 0))(
  ( (array!85081 (arr!41042 (Array (_ BitVec 32) ValueCell!16108)) (size!41592 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85080)

(declare-fun e!734357 () Bool)

(declare-fun array_inv!31123 (array!85080) Bool)

(assert (=> start!108860 (and (array_inv!31123 _values!1445) e!734357)))

(declare-datatypes ((array!85082 0))(
  ( (array!85083 (arr!41043 (Array (_ BitVec 32) (_ BitVec 64))) (size!41593 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85082)

(declare-fun array_inv!31124 (array!85082) Bool)

(assert (=> start!108860 (array_inv!31124 _keys!1741)))

(assert (=> start!108860 tp!100234))

(declare-fun b!1285607 () Bool)

(declare-fun e!734360 () Bool)

(declare-fun mapRes!52577 () Bool)

(assert (=> b!1285607 (= e!734357 (and e!734360 mapRes!52577))))

(declare-fun condMapEmpty!52577 () Bool)

(declare-fun mapDefault!52577 () ValueCell!16108)

