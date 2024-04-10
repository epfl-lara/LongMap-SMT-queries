; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109504 () Bool)

(assert start!109504)

(declare-fun b_free!28993 () Bool)

(declare-fun b_next!28993 () Bool)

(assert (=> start!109504 (= b_free!28993 (not b_next!28993))))

(declare-fun tp!102097 () Bool)

(declare-fun b_and!47083 () Bool)

(assert (=> start!109504 (= tp!102097 b_and!47083)))

(declare-fun b!1296951 () Bool)

(declare-fun res!861941 () Bool)

(declare-fun e!739921 () Bool)

(assert (=> b!1296951 (=> (not res!861941) (not e!739921))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!86282 0))(
  ( (array!86283 (arr!41642 (Array (_ BitVec 32) (_ BitVec 64))) (size!42192 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86282)

(assert (=> b!1296951 (= res!861941 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42192 _keys!1741))))))

(declare-fun b!1296952 () Bool)

(declare-fun e!739922 () Bool)

(declare-fun e!739919 () Bool)

(declare-fun mapRes!53510 () Bool)

(assert (=> b!1296952 (= e!739922 (and e!739919 mapRes!53510))))

(declare-fun condMapEmpty!53510 () Bool)

(declare-datatypes ((V!51281 0))(
  ( (V!51282 (val!17391 Int)) )
))
(declare-datatypes ((ValueCell!16418 0))(
  ( (ValueCellFull!16418 (v!19994 V!51281)) (EmptyCell!16418) )
))
(declare-datatypes ((array!86284 0))(
  ( (array!86285 (arr!41643 (Array (_ BitVec 32) ValueCell!16418)) (size!42193 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86284)

(declare-fun mapDefault!53510 () ValueCell!16418)

