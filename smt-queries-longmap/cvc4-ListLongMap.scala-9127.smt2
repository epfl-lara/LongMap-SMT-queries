; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109550 () Bool)

(assert start!109550)

(declare-fun b_free!29039 () Bool)

(declare-fun b_next!29039 () Bool)

(assert (=> start!109550 (= b_free!29039 (not b_next!29039))))

(declare-fun tp!102235 () Bool)

(declare-fun b_and!47129 () Bool)

(assert (=> start!109550 (= tp!102235 b_and!47129)))

(declare-fun b!1297503 () Bool)

(declare-fun res!862283 () Bool)

(declare-fun e!740264 () Bool)

(assert (=> b!1297503 (=> (not res!862283) (not e!740264))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!86368 0))(
  ( (array!86369 (arr!41685 (Array (_ BitVec 32) (_ BitVec 64))) (size!42235 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86368)

(assert (=> b!1297503 (= res!862283 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42235 _keys!1741))))))

(declare-fun res!862285 () Bool)

(assert (=> start!109550 (=> (not res!862285) (not e!740264))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109550 (= res!862285 (validMask!0 mask!2175))))

(assert (=> start!109550 e!740264))

(declare-fun tp_is_empty!34679 () Bool)

(assert (=> start!109550 tp_is_empty!34679))

(assert (=> start!109550 true))

(declare-datatypes ((V!51341 0))(
  ( (V!51342 (val!17414 Int)) )
))
(declare-datatypes ((ValueCell!16441 0))(
  ( (ValueCellFull!16441 (v!20017 V!51341)) (EmptyCell!16441) )
))
(declare-datatypes ((array!86370 0))(
  ( (array!86371 (arr!41686 (Array (_ BitVec 32) ValueCell!16441)) (size!42236 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86370)

(declare-fun e!740263 () Bool)

(declare-fun array_inv!31549 (array!86370) Bool)

(assert (=> start!109550 (and (array_inv!31549 _values!1445) e!740263)))

(declare-fun array_inv!31550 (array!86368) Bool)

(assert (=> start!109550 (array_inv!31550 _keys!1741)))

(assert (=> start!109550 tp!102235))

(declare-fun b!1297504 () Bool)

(declare-fun e!740267 () Bool)

(declare-fun mapRes!53579 () Bool)

(assert (=> b!1297504 (= e!740263 (and e!740267 mapRes!53579))))

(declare-fun condMapEmpty!53579 () Bool)

(declare-fun mapDefault!53579 () ValueCell!16441)

