; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110794 () Bool)

(assert start!110794)

(declare-fun b_free!29629 () Bool)

(declare-fun b_next!29629 () Bool)

(assert (=> start!110794 (= b_free!29629 (not b_next!29629))))

(declare-fun tp!104208 () Bool)

(declare-fun b_and!47837 () Bool)

(assert (=> start!110794 (= tp!104208 b_and!47837)))

(declare-fun res!870552 () Bool)

(declare-fun e!748079 () Bool)

(assert (=> start!110794 (=> (not res!870552) (not e!748079))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110794 (= res!870552 (validMask!0 mask!2040))))

(assert (=> start!110794 e!748079))

(assert (=> start!110794 tp!104208))

(declare-datatypes ((array!87706 0))(
  ( (array!87707 (arr!42333 (Array (_ BitVec 32) (_ BitVec 64))) (size!42883 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87706)

(declare-fun array_inv!31989 (array!87706) Bool)

(assert (=> start!110794 (array_inv!31989 _keys!1628)))

(assert (=> start!110794 true))

(declare-fun tp_is_empty!35359 () Bool)

(assert (=> start!110794 tp_is_empty!35359))

(declare-datatypes ((V!52249 0))(
  ( (V!52250 (val!17754 Int)) )
))
(declare-datatypes ((ValueCell!16781 0))(
  ( (ValueCellFull!16781 (v!20381 V!52249)) (EmptyCell!16781) )
))
(declare-datatypes ((array!87708 0))(
  ( (array!87709 (arr!42334 (Array (_ BitVec 32) ValueCell!16781)) (size!42884 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87708)

(declare-fun e!748080 () Bool)

(declare-fun array_inv!31990 (array!87708) Bool)

(assert (=> start!110794 (and (array_inv!31990 _values!1354) e!748080)))

(declare-fun mapNonEmpty!54667 () Bool)

(declare-fun mapRes!54667 () Bool)

(declare-fun tp!104209 () Bool)

(declare-fun e!748081 () Bool)

(assert (=> mapNonEmpty!54667 (= mapRes!54667 (and tp!104209 e!748081))))

(declare-fun mapValue!54667 () ValueCell!16781)

(declare-fun mapRest!54667 () (Array (_ BitVec 32) ValueCell!16781))

(declare-fun mapKey!54667 () (_ BitVec 32))

(assert (=> mapNonEmpty!54667 (= (arr!42334 _values!1354) (store mapRest!54667 mapKey!54667 mapValue!54667))))

(declare-fun b!1311335 () Bool)

(declare-fun e!748078 () Bool)

(assert (=> b!1311335 (= e!748080 (and e!748078 mapRes!54667))))

(declare-fun condMapEmpty!54667 () Bool)

(declare-fun mapDefault!54667 () ValueCell!16781)

