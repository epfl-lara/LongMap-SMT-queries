; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!552 () Bool)

(assert start!552)

(declare-fun b!3303 () Bool)

(declare-fun e!1536 () Bool)

(declare-fun tp_is_empty!113 () Bool)

(assert (=> b!3303 (= e!1536 tp_is_empty!113)))

(declare-fun res!5113 () Bool)

(declare-fun e!1537 () Bool)

(assert (=> start!552 (=> (not res!5113) (not e!1537))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!552 (= res!5113 (validMask!0 mask!2250))))

(assert (=> start!552 e!1537))

(assert (=> start!552 true))

(declare-datatypes ((V!327 0))(
  ( (V!328 (val!62 Int)) )
))
(declare-datatypes ((ValueCell!40 0))(
  ( (ValueCellFull!40 (v!1149 V!327)) (EmptyCell!40) )
))
(declare-datatypes ((array!165 0))(
  ( (array!166 (arr!76 (Array (_ BitVec 32) ValueCell!40)) (size!138 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!165)

(declare-fun e!1534 () Bool)

(declare-fun array_inv!51 (array!165) Bool)

(assert (=> start!552 (and (array_inv!51 _values!1492) e!1534)))

(declare-datatypes ((array!167 0))(
  ( (array!168 (arr!77 (Array (_ BitVec 32) (_ BitVec 64))) (size!139 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!167)

(declare-fun array_inv!52 (array!167) Bool)

(assert (=> start!552 (array_inv!52 _keys!1806)))

(declare-fun b!3304 () Bool)

(declare-fun mapRes!125 () Bool)

(assert (=> b!3304 (= e!1534 (and e!1536 mapRes!125))))

(declare-fun condMapEmpty!125 () Bool)

(declare-fun mapDefault!125 () ValueCell!40)

