; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109722 () Bool)

(assert start!109722)

(declare-fun b_free!29155 () Bool)

(declare-fun b_next!29155 () Bool)

(assert (=> start!109722 (= b_free!29155 (not b_next!29155))))

(declare-fun tp!102593 () Bool)

(declare-fun b_and!47257 () Bool)

(assert (=> start!109722 (= tp!102593 b_and!47257)))

(declare-fun b!1299636 () Bool)

(declare-fun e!741419 () Bool)

(declare-fun tp_is_empty!34795 () Bool)

(assert (=> b!1299636 (= e!741419 tp_is_empty!34795)))

(declare-fun b!1299637 () Bool)

(declare-fun res!863664 () Bool)

(declare-fun e!741417 () Bool)

(assert (=> b!1299637 (=> (not res!863664) (not e!741417))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1299637 (= res!863664 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1299638 () Bool)

(declare-fun res!863662 () Bool)

(assert (=> b!1299638 (=> (not res!863662) (not e!741417))))

(declare-datatypes ((array!86598 0))(
  ( (array!86599 (arr!41797 (Array (_ BitVec 32) (_ BitVec 64))) (size!42347 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86598)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1299638 (= res!863662 (validKeyInArray!0 (select (arr!41797 _keys!1741) from!2144)))))

(declare-fun b!1299639 () Bool)

(declare-fun res!863656 () Bool)

(assert (=> b!1299639 (=> (not res!863656) (not e!741417))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86598 (_ BitVec 32)) Bool)

(assert (=> b!1299639 (= res!863656 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun res!863658 () Bool)

(assert (=> start!109722 (=> (not res!863658) (not e!741417))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109722 (= res!863658 (validMask!0 mask!2175))))

(assert (=> start!109722 e!741417))

(assert (=> start!109722 tp_is_empty!34795))

(assert (=> start!109722 true))

(declare-datatypes ((V!51497 0))(
  ( (V!51498 (val!17472 Int)) )
))
(declare-datatypes ((ValueCell!16499 0))(
  ( (ValueCellFull!16499 (v!20078 V!51497)) (EmptyCell!16499) )
))
(declare-datatypes ((array!86600 0))(
  ( (array!86601 (arr!41798 (Array (_ BitVec 32) ValueCell!16499)) (size!42348 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86600)

(declare-fun e!741418 () Bool)

(declare-fun array_inv!31631 (array!86600) Bool)

(assert (=> start!109722 (and (array_inv!31631 _values!1445) e!741418)))

(declare-fun array_inv!31632 (array!86598) Bool)

(assert (=> start!109722 (array_inv!31632 _keys!1741)))

(assert (=> start!109722 tp!102593))

(declare-fun b!1299640 () Bool)

(declare-fun mapRes!53762 () Bool)

(assert (=> b!1299640 (= e!741418 (and e!741419 mapRes!53762))))

(declare-fun condMapEmpty!53762 () Bool)

(declare-fun mapDefault!53762 () ValueCell!16499)

