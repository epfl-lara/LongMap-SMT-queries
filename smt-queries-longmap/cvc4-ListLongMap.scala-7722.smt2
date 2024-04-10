; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97022 () Bool)

(assert start!97022)

(declare-fun b!1103537 () Bool)

(declare-fun e!629957 () Bool)

(declare-fun tp_is_empty!27311 () Bool)

(assert (=> b!1103537 (= e!629957 tp_is_empty!27311)))

(declare-fun b!1103538 () Bool)

(declare-fun e!629959 () Bool)

(assert (=> b!1103538 (= e!629959 false)))

(declare-fun lt!495082 () Bool)

(declare-datatypes ((array!71545 0))(
  ( (array!71546 (arr!34429 (Array (_ BitVec 32) (_ BitVec 64))) (size!34965 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71545)

(declare-datatypes ((List!24041 0))(
  ( (Nil!24038) (Cons!24037 (h!25246 (_ BitVec 64)) (t!34306 List!24041)) )
))
(declare-fun arrayNoDuplicates!0 (array!71545 (_ BitVec 32) List!24041) Bool)

(assert (=> b!1103538 (= lt!495082 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24038))))

(declare-fun b!1103539 () Bool)

(declare-fun res!736212 () Bool)

(assert (=> b!1103539 (=> (not res!736212) (not e!629959))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71545 (_ BitVec 32)) Bool)

(assert (=> b!1103539 (= res!736212 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!42772 () Bool)

(declare-fun mapRes!42772 () Bool)

(declare-fun tp!81692 () Bool)

(assert (=> mapNonEmpty!42772 (= mapRes!42772 (and tp!81692 e!629957))))

(declare-datatypes ((V!41541 0))(
  ( (V!41542 (val!13712 Int)) )
))
(declare-datatypes ((ValueCell!12946 0))(
  ( (ValueCellFull!12946 (v!16344 V!41541)) (EmptyCell!12946) )
))
(declare-fun mapValue!42772 () ValueCell!12946)

(declare-fun mapKey!42772 () (_ BitVec 32))

(declare-datatypes ((array!71547 0))(
  ( (array!71548 (arr!34430 (Array (_ BitVec 32) ValueCell!12946)) (size!34966 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71547)

(declare-fun mapRest!42772 () (Array (_ BitVec 32) ValueCell!12946))

(assert (=> mapNonEmpty!42772 (= (arr!34430 _values!996) (store mapRest!42772 mapKey!42772 mapValue!42772))))

(declare-fun b!1103541 () Bool)

(declare-fun e!629961 () Bool)

(assert (=> b!1103541 (= e!629961 tp_is_empty!27311)))

(declare-fun b!1103542 () Bool)

(declare-fun res!736214 () Bool)

(assert (=> b!1103542 (=> (not res!736214) (not e!629959))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1103542 (= res!736214 (and (= (size!34966 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!34965 _keys!1208) (size!34966 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1103543 () Bool)

(declare-fun res!736213 () Bool)

(assert (=> b!1103543 (=> (not res!736213) (not e!629959))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1103543 (= res!736213 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!42772 () Bool)

(assert (=> mapIsEmpty!42772 mapRes!42772))

(declare-fun b!1103540 () Bool)

(declare-fun e!629958 () Bool)

(assert (=> b!1103540 (= e!629958 (and e!629961 mapRes!42772))))

(declare-fun condMapEmpty!42772 () Bool)

(declare-fun mapDefault!42772 () ValueCell!12946)

