; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108770 () Bool)

(assert start!108770)

(declare-fun b_free!28283 () Bool)

(declare-fun b_next!28283 () Bool)

(assert (=> start!108770 (= b_free!28283 (not b_next!28283))))

(declare-fun tp!99964 () Bool)

(declare-fun b_and!46349 () Bool)

(assert (=> start!108770 (= tp!99964 b_and!46349)))

(declare-fun b!1284428 () Bool)

(declare-fun e!733682 () Bool)

(declare-fun tp_is_empty!33923 () Bool)

(assert (=> b!1284428 (= e!733682 tp_is_empty!33923)))

(declare-fun b!1284429 () Bool)

(declare-fun res!853265 () Bool)

(declare-fun e!733684 () Bool)

(assert (=> b!1284429 (=> (not res!853265) (not e!733684))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!50333 0))(
  ( (V!50334 (val!17036 Int)) )
))
(declare-datatypes ((ValueCell!16063 0))(
  ( (ValueCellFull!16063 (v!19638 V!50333)) (EmptyCell!16063) )
))
(declare-datatypes ((array!84904 0))(
  ( (array!84905 (arr!40954 (Array (_ BitVec 32) ValueCell!16063)) (size!41504 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84904)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84906 0))(
  ( (array!84907 (arr!40955 (Array (_ BitVec 32) (_ BitVec 64))) (size!41505 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84906)

(assert (=> b!1284429 (= res!853265 (and (= (size!41504 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41505 _keys!1741) (size!41504 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun res!853263 () Bool)

(assert (=> start!108770 (=> (not res!853263) (not e!733684))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108770 (= res!853263 (validMask!0 mask!2175))))

(assert (=> start!108770 e!733684))

(assert (=> start!108770 tp_is_empty!33923))

(assert (=> start!108770 true))

(declare-fun e!733683 () Bool)

(declare-fun array_inv!31061 (array!84904) Bool)

(assert (=> start!108770 (and (array_inv!31061 _values!1445) e!733683)))

(declare-fun array_inv!31062 (array!84906) Bool)

(assert (=> start!108770 (array_inv!31062 _keys!1741)))

(assert (=> start!108770 tp!99964))

(declare-fun b!1284430 () Bool)

(declare-fun e!733681 () Bool)

(declare-fun mapRes!52442 () Bool)

(assert (=> b!1284430 (= e!733683 (and e!733681 mapRes!52442))))

(declare-fun condMapEmpty!52442 () Bool)

(declare-fun mapDefault!52442 () ValueCell!16063)

