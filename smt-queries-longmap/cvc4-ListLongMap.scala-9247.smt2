; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110834 () Bool)

(assert start!110834)

(declare-fun b_free!29669 () Bool)

(declare-fun b_next!29669 () Bool)

(assert (=> start!110834 (= b_free!29669 (not b_next!29669))))

(declare-fun tp!104328 () Bool)

(declare-fun b_and!47877 () Bool)

(assert (=> start!110834 (= tp!104328 b_and!47877)))

(declare-fun b!1311955 () Bool)

(declare-fun e!748379 () Bool)

(declare-fun tp_is_empty!35399 () Bool)

(assert (=> b!1311955 (= e!748379 tp_is_empty!35399)))

(declare-fun b!1311956 () Bool)

(declare-fun res!870993 () Bool)

(declare-fun e!748378 () Bool)

(assert (=> b!1311956 (=> (not res!870993) (not e!748378))))

(declare-datatypes ((array!87786 0))(
  ( (array!87787 (arr!42373 (Array (_ BitVec 32) (_ BitVec 64))) (size!42923 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87786)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87786 (_ BitVec 32)) Bool)

(assert (=> b!1311956 (= res!870993 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1311957 () Bool)

(declare-fun res!870991 () Bool)

(assert (=> b!1311957 (=> (not res!870991) (not e!748378))))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1311957 (= res!870991 (validKeyInArray!0 (select (arr!42373 _keys!1628) from!2020)))))

(declare-fun mapIsEmpty!54727 () Bool)

(declare-fun mapRes!54727 () Bool)

(assert (=> mapIsEmpty!54727 mapRes!54727))

(declare-fun mapNonEmpty!54727 () Bool)

(declare-fun tp!104329 () Bool)

(assert (=> mapNonEmpty!54727 (= mapRes!54727 (and tp!104329 e!748379))))

(declare-fun mapKey!54727 () (_ BitVec 32))

(declare-datatypes ((V!52301 0))(
  ( (V!52302 (val!17774 Int)) )
))
(declare-datatypes ((ValueCell!16801 0))(
  ( (ValueCellFull!16801 (v!20401 V!52301)) (EmptyCell!16801) )
))
(declare-fun mapValue!54727 () ValueCell!16801)

(declare-fun mapRest!54727 () (Array (_ BitVec 32) ValueCell!16801))

(declare-datatypes ((array!87788 0))(
  ( (array!87789 (arr!42374 (Array (_ BitVec 32) ValueCell!16801)) (size!42924 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87788)

(assert (=> mapNonEmpty!54727 (= (arr!42374 _values!1354) (store mapRest!54727 mapKey!54727 mapValue!54727))))

(declare-fun b!1311958 () Bool)

(declare-fun e!748381 () Bool)

(assert (=> b!1311958 (= e!748381 tp_is_empty!35399)))

(declare-fun b!1311959 () Bool)

(declare-fun e!748382 () Bool)

(assert (=> b!1311959 (= e!748382 (and e!748381 mapRes!54727))))

(declare-fun condMapEmpty!54727 () Bool)

(declare-fun mapDefault!54727 () ValueCell!16801)

