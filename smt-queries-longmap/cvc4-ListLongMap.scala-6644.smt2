; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83840 () Bool)

(assert start!83840)

(declare-fun b_free!19649 () Bool)

(declare-fun b_next!19649 () Bool)

(assert (=> start!83840 (= b_free!19649 (not b_next!19649))))

(declare-fun tp!68388 () Bool)

(declare-fun b_and!31387 () Bool)

(assert (=> start!83840 (= tp!68388 b_and!31387)))

(declare-fun mapNonEmpty!35993 () Bool)

(declare-fun mapRes!35993 () Bool)

(declare-fun tp!68389 () Bool)

(declare-fun e!552092 () Bool)

(assert (=> mapNonEmpty!35993 (= mapRes!35993 (and tp!68389 e!552092))))

(declare-datatypes ((V!35173 0))(
  ( (V!35174 (val!11372 Int)) )
))
(declare-datatypes ((ValueCell!10840 0))(
  ( (ValueCellFull!10840 (v!13934 V!35173)) (EmptyCell!10840) )
))
(declare-datatypes ((array!61303 0))(
  ( (array!61304 (arr!29509 (Array (_ BitVec 32) ValueCell!10840)) (size!29988 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61303)

(declare-fun mapRest!35993 () (Array (_ BitVec 32) ValueCell!10840))

(declare-fun mapKey!35993 () (_ BitVec 32))

(declare-fun mapValue!35993 () ValueCell!10840)

(assert (=> mapNonEmpty!35993 (= (arr!29509 _values!1278) (store mapRest!35993 mapKey!35993 mapValue!35993))))

(declare-fun b!979401 () Bool)

(declare-fun res!655442 () Bool)

(declare-fun e!552091 () Bool)

(assert (=> b!979401 (=> (not res!655442) (not e!552091))))

(declare-datatypes ((array!61305 0))(
  ( (array!61306 (arr!29510 (Array (_ BitVec 32) (_ BitVec 64))) (size!29989 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61305)

(declare-datatypes ((List!20459 0))(
  ( (Nil!20456) (Cons!20455 (h!21617 (_ BitVec 64)) (t!29064 List!20459)) )
))
(declare-fun arrayNoDuplicates!0 (array!61305 (_ BitVec 32) List!20459) Bool)

(assert (=> b!979401 (= res!655442 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20456))))

(declare-fun b!979402 () Bool)

(declare-fun res!655445 () Bool)

(assert (=> b!979402 (=> (not res!655445) (not e!552091))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!979402 (= res!655445 (and (= (size!29988 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29989 _keys!1544) (size!29988 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!35993 () Bool)

(assert (=> mapIsEmpty!35993 mapRes!35993))

(declare-fun b!979403 () Bool)

(declare-fun e!552094 () Bool)

(declare-fun e!552096 () Bool)

(assert (=> b!979403 (= e!552094 (and e!552096 mapRes!35993))))

(declare-fun condMapEmpty!35993 () Bool)

(declare-fun mapDefault!35993 () ValueCell!10840)

