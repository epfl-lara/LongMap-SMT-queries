; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4482 () Bool)

(assert start!4482)

(declare-fun b_free!1243 () Bool)

(declare-fun b_next!1243 () Bool)

(assert (=> start!4482 (= b_free!1243 (not b_next!1243))))

(declare-fun tp!5166 () Bool)

(declare-fun b_and!2065 () Bool)

(assert (=> start!4482 (= tp!5166 b_and!2065)))

(declare-fun b!34861 () Bool)

(declare-fun res!21189 () Bool)

(declare-fun e!22056 () Bool)

(assert (=> b!34861 (=> (not res!21189) (not e!22056))))

(declare-datatypes ((array!2407 0))(
  ( (array!2408 (arr!1151 (Array (_ BitVec 32) (_ BitVec 64))) (size!1252 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2407)

(declare-datatypes ((List!925 0))(
  ( (Nil!922) (Cons!921 (h!1488 (_ BitVec 64)) (t!3630 List!925)) )
))
(declare-fun arrayNoDuplicates!0 (array!2407 (_ BitVec 32) List!925) Bool)

(assert (=> b!34861 (= res!21189 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!922))))

(declare-fun b!34862 () Bool)

(declare-fun res!21184 () Bool)

(assert (=> b!34862 (=> (not res!21184) (not e!22056))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2407 (_ BitVec 32)) Bool)

(assert (=> b!34862 (= res!21184 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun res!21185 () Bool)

(assert (=> start!4482 (=> (not res!21185) (not e!22056))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4482 (= res!21185 (validMask!0 mask!2294))))

(assert (=> start!4482 e!22056))

(assert (=> start!4482 true))

(assert (=> start!4482 tp!5166))

(declare-datatypes ((V!1955 0))(
  ( (V!1956 (val!825 Int)) )
))
(declare-datatypes ((ValueCell!599 0))(
  ( (ValueCellFull!599 (v!1920 V!1955)) (EmptyCell!599) )
))
(declare-datatypes ((array!2409 0))(
  ( (array!2410 (arr!1152 (Array (_ BitVec 32) ValueCell!599)) (size!1253 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2409)

(declare-fun e!22059 () Bool)

(declare-fun array_inv!815 (array!2409) Bool)

(assert (=> start!4482 (and (array_inv!815 _values!1501) e!22059)))

(declare-fun array_inv!816 (array!2407) Bool)

(assert (=> start!4482 (array_inv!816 _keys!1833)))

(declare-fun tp_is_empty!1597 () Bool)

(assert (=> start!4482 tp_is_empty!1597))

(declare-fun mapNonEmpty!1942 () Bool)

(declare-fun mapRes!1942 () Bool)

(declare-fun tp!5167 () Bool)

(declare-fun e!22060 () Bool)

(assert (=> mapNonEmpty!1942 (= mapRes!1942 (and tp!5167 e!22060))))

(declare-fun mapValue!1942 () ValueCell!599)

(declare-fun mapRest!1942 () (Array (_ BitVec 32) ValueCell!599))

(declare-fun mapKey!1942 () (_ BitVec 32))

(assert (=> mapNonEmpty!1942 (= (arr!1152 _values!1501) (store mapRest!1942 mapKey!1942 mapValue!1942))))

(declare-fun mapIsEmpty!1942 () Bool)

(assert (=> mapIsEmpty!1942 mapRes!1942))

(declare-fun b!34863 () Bool)

(declare-fun e!22057 () Bool)

(assert (=> b!34863 (= e!22059 (and e!22057 mapRes!1942))))

(declare-fun condMapEmpty!1942 () Bool)

(declare-fun mapDefault!1942 () ValueCell!599)

