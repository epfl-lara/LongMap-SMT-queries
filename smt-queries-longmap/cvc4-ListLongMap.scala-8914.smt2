; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108138 () Bool)

(assert start!108138)

(declare-fun b_free!27851 () Bool)

(declare-fun b_next!27851 () Bool)

(assert (=> start!108138 (= b_free!27851 (not b_next!27851))))

(declare-fun tp!98507 () Bool)

(declare-fun b_and!45907 () Bool)

(assert (=> start!108138 (= tp!98507 b_and!45907)))

(declare-fun b!1277110 () Bool)

(declare-fun res!848660 () Bool)

(declare-fun e!729314 () Bool)

(assert (=> b!1277110 (=> (not res!848660) (not e!729314))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-datatypes ((array!83894 0))(
  ( (array!83895 (arr!40458 (Array (_ BitVec 32) (_ BitVec 64))) (size!41008 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83894)

(declare-datatypes ((V!49637 0))(
  ( (V!49638 (val!16775 Int)) )
))
(declare-datatypes ((ValueCell!15802 0))(
  ( (ValueCellFull!15802 (v!19372 V!49637)) (EmptyCell!15802) )
))
(declare-datatypes ((array!83896 0))(
  ( (array!83897 (arr!40459 (Array (_ BitVec 32) ValueCell!15802)) (size!41009 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83896)

(assert (=> b!1277110 (= res!848660 (and (= (size!41009 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!41008 _keys!1427) (size!41009 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1277111 () Bool)

(declare-fun lt!575577 () Bool)

(assert (=> b!1277111 (= e!729314 (not (or lt!575577 (bvslt (size!41008 _keys!1427) #b01111111111111111111111111111111))))))

(declare-fun e!729317 () Bool)

(assert (=> b!1277111 e!729317))

(declare-fun c!123960 () Bool)

(assert (=> b!1277111 (= c!123960 (not lt!575577))))

(declare-fun k!1053 () (_ BitVec 64))

(assert (=> b!1277111 (= lt!575577 (or (= k!1053 #b0000000000000000000000000000000000000000000000000000000000000000) (= k!1053 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun defaultEntry!1195 () Int)

(declare-datatypes ((Unit!42371 0))(
  ( (Unit!42372) )
))
(declare-fun lt!575578 () Unit!42371)

(declare-fun minValue!1129 () V!49637)

(declare-fun zeroValue!1129 () V!49637)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!628 (array!83894 array!83896 (_ BitVec 32) (_ BitVec 32) V!49637 V!49637 (_ BitVec 64) (_ BitVec 32) Int) Unit!42371)

(assert (=> b!1277111 (= lt!575578 (lemmaListMapContainsThenArrayContainsFrom!628 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 k!1053 #b00000000000000000000000000000000 defaultEntry!1195))))

(declare-fun b!1277112 () Bool)

(declare-fun e!729318 () Bool)

(declare-fun e!729316 () Bool)

(declare-fun mapRes!51632 () Bool)

(assert (=> b!1277112 (= e!729318 (and e!729316 mapRes!51632))))

(declare-fun condMapEmpty!51632 () Bool)

(declare-fun mapDefault!51632 () ValueCell!15802)

