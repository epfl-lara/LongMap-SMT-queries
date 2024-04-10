; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83866 () Bool)

(assert start!83866)

(declare-fun b_free!19675 () Bool)

(declare-fun b_next!19675 () Bool)

(assert (=> start!83866 (= b_free!19675 (not b_next!19675))))

(declare-fun tp!68467 () Bool)

(declare-fun b_and!31439 () Bool)

(assert (=> start!83866 (= tp!68467 b_and!31439)))

(declare-fun b!979856 () Bool)

(declare-fun e!552327 () Bool)

(declare-fun e!552326 () Bool)

(declare-fun mapRes!36032 () Bool)

(assert (=> b!979856 (= e!552327 (and e!552326 mapRes!36032))))

(declare-fun condMapEmpty!36032 () Bool)

(declare-datatypes ((V!35209 0))(
  ( (V!35210 (val!11385 Int)) )
))
(declare-datatypes ((ValueCell!10853 0))(
  ( (ValueCellFull!10853 (v!13947 V!35209)) (EmptyCell!10853) )
))
(declare-datatypes ((array!61353 0))(
  ( (array!61354 (arr!29534 (Array (_ BitVec 32) ValueCell!10853)) (size!30013 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61353)

(declare-fun mapDefault!36032 () ValueCell!10853)

