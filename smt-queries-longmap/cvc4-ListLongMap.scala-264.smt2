; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4334 () Bool)

(assert start!4334)

(declare-fun b_free!1175 () Bool)

(declare-fun b_next!1175 () Bool)

(assert (=> start!4334 (= b_free!1175 (not b_next!1175))))

(declare-fun tp!4954 () Bool)

(declare-fun b_and!1991 () Bool)

(assert (=> start!4334 (= tp!4954 b_and!1991)))

(declare-fun b!33402 () Bool)

(declare-fun res!20303 () Bool)

(declare-fun e!21215 () Bool)

(assert (=> b!33402 (=> (not res!20303) (not e!21215))))

(declare-datatypes ((V!1863 0))(
  ( (V!1864 (val!791 Int)) )
))
(declare-datatypes ((ValueCell!565 0))(
  ( (ValueCellFull!565 (v!1883 V!1863)) (EmptyCell!565) )
))
(declare-datatypes ((array!2271 0))(
  ( (array!2272 (arr!1086 (Array (_ BitVec 32) ValueCell!565)) (size!1187 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2271)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!2273 0))(
  ( (array!2274 (arr!1087 (Array (_ BitVec 32) (_ BitVec 64))) (size!1188 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2273)

(declare-fun mask!2294 () (_ BitVec 32))

(assert (=> b!33402 (= res!20303 (and (= (size!1187 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1188 _keys!1833) (size!1187 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun res!20302 () Bool)

(assert (=> start!4334 (=> (not res!20302) (not e!21215))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4334 (= res!20302 (validMask!0 mask!2294))))

(assert (=> start!4334 e!21215))

(assert (=> start!4334 true))

(assert (=> start!4334 tp!4954))

(declare-fun e!21216 () Bool)

(declare-fun array_inv!765 (array!2271) Bool)

(assert (=> start!4334 (and (array_inv!765 _values!1501) e!21216)))

(declare-fun array_inv!766 (array!2273) Bool)

(assert (=> start!4334 (array_inv!766 _keys!1833)))

(declare-fun tp_is_empty!1529 () Bool)

(assert (=> start!4334 tp_is_empty!1529))

(declare-fun b!33403 () Bool)

(declare-fun e!21214 () Bool)

(assert (=> b!33403 (= e!21214 tp_is_empty!1529)))

(declare-fun b!33404 () Bool)

(declare-fun e!21217 () Bool)

(declare-fun mapRes!1831 () Bool)

(assert (=> b!33404 (= e!21216 (and e!21217 mapRes!1831))))

(declare-fun condMapEmpty!1831 () Bool)

(declare-fun mapDefault!1831 () ValueCell!565)

