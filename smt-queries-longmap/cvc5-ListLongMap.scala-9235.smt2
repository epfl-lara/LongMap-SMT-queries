; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110758 () Bool)

(assert start!110758)

(declare-fun b_free!29593 () Bool)

(declare-fun b_next!29593 () Bool)

(assert (=> start!110758 (= b_free!29593 (not b_next!29593))))

(declare-fun tp!104100 () Bool)

(declare-fun b_and!47801 () Bool)

(assert (=> start!110758 (= tp!104100 b_and!47801)))

(declare-fun mapNonEmpty!54613 () Bool)

(declare-fun mapRes!54613 () Bool)

(declare-fun tp!104101 () Bool)

(declare-fun e!747809 () Bool)

(assert (=> mapNonEmpty!54613 (= mapRes!54613 (and tp!104101 e!747809))))

(declare-datatypes ((V!52201 0))(
  ( (V!52202 (val!17736 Int)) )
))
(declare-datatypes ((ValueCell!16763 0))(
  ( (ValueCellFull!16763 (v!20363 V!52201)) (EmptyCell!16763) )
))
(declare-fun mapValue!54613 () ValueCell!16763)

(declare-fun mapKey!54613 () (_ BitVec 32))

(declare-fun mapRest!54613 () (Array (_ BitVec 32) ValueCell!16763))

(declare-datatypes ((array!87634 0))(
  ( (array!87635 (arr!42297 (Array (_ BitVec 32) ValueCell!16763)) (size!42847 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87634)

(assert (=> mapNonEmpty!54613 (= (arr!42297 _values!1354) (store mapRest!54613 mapKey!54613 mapValue!54613))))

(declare-fun b!1310903 () Bool)

(declare-fun res!870280 () Bool)

(declare-fun e!747808 () Bool)

(assert (=> b!1310903 (=> (not res!870280) (not e!747808))))

(declare-datatypes ((array!87636 0))(
  ( (array!87637 (arr!42298 (Array (_ BitVec 32) (_ BitVec 64))) (size!42848 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87636)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87636 (_ BitVec 32)) Bool)

(assert (=> b!1310903 (= res!870280 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1310904 () Bool)

(declare-fun res!870278 () Bool)

(assert (=> b!1310904 (=> (not res!870278) (not e!747808))))

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1310904 (= res!870278 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42848 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1310905 () Bool)

(declare-fun res!870282 () Bool)

(assert (=> b!1310905 (=> (not res!870282) (not e!747808))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1310905 (= res!870282 (and (= (size!42847 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42848 _keys!1628) (size!42847 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1310906 () Bool)

(declare-fun e!747812 () Bool)

(declare-fun e!747810 () Bool)

(assert (=> b!1310906 (= e!747812 (and e!747810 mapRes!54613))))

(declare-fun condMapEmpty!54613 () Bool)

(declare-fun mapDefault!54613 () ValueCell!16763)

