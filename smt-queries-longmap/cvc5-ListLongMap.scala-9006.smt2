; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108796 () Bool)

(assert start!108796)

(declare-fun b_free!28309 () Bool)

(declare-fun b_next!28309 () Bool)

(assert (=> start!108796 (= b_free!28309 (not b_next!28309))))

(declare-fun tp!100042 () Bool)

(declare-fun b_and!46375 () Bool)

(assert (=> start!108796 (= tp!100042 b_and!46375)))

(declare-fun b!1284740 () Bool)

(declare-fun e!733878 () Bool)

(declare-fun tp_is_empty!33949 () Bool)

(assert (=> b!1284740 (= e!733878 tp_is_empty!33949)))

(declare-fun res!853461 () Bool)

(declare-fun e!733876 () Bool)

(assert (=> start!108796 (=> (not res!853461) (not e!733876))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108796 (= res!853461 (validMask!0 mask!2175))))

(assert (=> start!108796 e!733876))

(assert (=> start!108796 tp_is_empty!33949))

(assert (=> start!108796 true))

(declare-datatypes ((V!50369 0))(
  ( (V!50370 (val!17049 Int)) )
))
(declare-datatypes ((ValueCell!16076 0))(
  ( (ValueCellFull!16076 (v!19651 V!50369)) (EmptyCell!16076) )
))
(declare-datatypes ((array!84956 0))(
  ( (array!84957 (arr!40980 (Array (_ BitVec 32) ValueCell!16076)) (size!41530 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84956)

(declare-fun e!733880 () Bool)

(declare-fun array_inv!31081 (array!84956) Bool)

(assert (=> start!108796 (and (array_inv!31081 _values!1445) e!733880)))

(declare-datatypes ((array!84958 0))(
  ( (array!84959 (arr!40981 (Array (_ BitVec 32) (_ BitVec 64))) (size!41531 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84958)

(declare-fun array_inv!31082 (array!84958) Bool)

(assert (=> start!108796 (array_inv!31082 _keys!1741)))

(assert (=> start!108796 tp!100042))

(declare-fun b!1284741 () Bool)

(declare-fun mapRes!52481 () Bool)

(assert (=> b!1284741 (= e!733880 (and e!733878 mapRes!52481))))

(declare-fun condMapEmpty!52481 () Bool)

(declare-fun mapDefault!52481 () ValueCell!16076)

