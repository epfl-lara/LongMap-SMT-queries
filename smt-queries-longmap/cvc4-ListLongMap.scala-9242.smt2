; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110804 () Bool)

(assert start!110804)

(declare-fun b_free!29639 () Bool)

(declare-fun b_next!29639 () Bool)

(assert (=> start!110804 (= b_free!29639 (not b_next!29639))))

(declare-fun tp!104239 () Bool)

(declare-fun b_and!47847 () Bool)

(assert (=> start!110804 (= tp!104239 b_and!47847)))

(declare-fun b!1311455 () Bool)

(declare-fun res!870623 () Bool)

(declare-fun e!748155 () Bool)

(assert (=> b!1311455 (=> (not res!870623) (not e!748155))))

(declare-datatypes ((array!87726 0))(
  ( (array!87727 (arr!42343 (Array (_ BitVec 32) (_ BitVec 64))) (size!42893 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87726)

(declare-datatypes ((List!30028 0))(
  ( (Nil!30025) (Cons!30024 (h!31233 (_ BitVec 64)) (t!43634 List!30028)) )
))
(declare-fun arrayNoDuplicates!0 (array!87726 (_ BitVec 32) List!30028) Bool)

(assert (=> b!1311455 (= res!870623 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30025))))

(declare-fun res!870625 () Bool)

(assert (=> start!110804 (=> (not res!870625) (not e!748155))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110804 (= res!870625 (validMask!0 mask!2040))))

(assert (=> start!110804 e!748155))

(assert (=> start!110804 tp!104239))

(declare-fun array_inv!31997 (array!87726) Bool)

(assert (=> start!110804 (array_inv!31997 _keys!1628)))

(assert (=> start!110804 true))

(declare-fun tp_is_empty!35369 () Bool)

(assert (=> start!110804 tp_is_empty!35369))

(declare-datatypes ((V!52261 0))(
  ( (V!52262 (val!17759 Int)) )
))
(declare-datatypes ((ValueCell!16786 0))(
  ( (ValueCellFull!16786 (v!20386 V!52261)) (EmptyCell!16786) )
))
(declare-datatypes ((array!87728 0))(
  ( (array!87729 (arr!42344 (Array (_ BitVec 32) ValueCell!16786)) (size!42894 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87728)

(declare-fun e!748153 () Bool)

(declare-fun array_inv!31998 (array!87728) Bool)

(assert (=> start!110804 (and (array_inv!31998 _values!1354) e!748153)))

(declare-fun b!1311456 () Bool)

(declare-fun e!748154 () Bool)

(assert (=> b!1311456 (= e!748154 tp_is_empty!35369)))

(declare-fun b!1311457 () Bool)

(declare-fun mapRes!54682 () Bool)

(assert (=> b!1311457 (= e!748153 (and e!748154 mapRes!54682))))

(declare-fun condMapEmpty!54682 () Bool)

(declare-fun mapDefault!54682 () ValueCell!16786)

