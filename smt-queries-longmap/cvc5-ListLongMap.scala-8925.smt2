; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108232 () Bool)

(assert start!108232)

(declare-fun b_free!27913 () Bool)

(declare-fun b_next!27913 () Bool)

(assert (=> start!108232 (= b_free!27913 (not b_next!27913))))

(declare-fun tp!98699 () Bool)

(declare-fun b_and!45973 () Bool)

(assert (=> start!108232 (= tp!98699 b_and!45973)))

(declare-fun b!1278012 () Bool)

(declare-fun res!849143 () Bool)

(declare-fun e!729934 () Bool)

(assert (=> b!1278012 (=> (not res!849143) (not e!729934))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-datatypes ((V!49721 0))(
  ( (V!49722 (val!16806 Int)) )
))
(declare-datatypes ((ValueCell!15833 0))(
  ( (ValueCellFull!15833 (v!19405 V!49721)) (EmptyCell!15833) )
))
(declare-datatypes ((array!84014 0))(
  ( (array!84015 (arr!40516 (Array (_ BitVec 32) ValueCell!15833)) (size!41066 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!84014)

(declare-datatypes ((array!84016 0))(
  ( (array!84017 (arr!40517 (Array (_ BitVec 32) (_ BitVec 64))) (size!41067 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!84016)

(assert (=> b!1278012 (= res!849143 (and (= (size!41066 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!41067 _keys!1427) (size!41066 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1278013 () Bool)

(assert (=> b!1278013 (= e!729934 (not true))))

(declare-fun e!729937 () Bool)

(assert (=> b!1278013 e!729937))

(declare-fun c!124020 () Bool)

(declare-fun k!1053 () (_ BitVec 64))

(assert (=> b!1278013 (= c!124020 (and (not (= k!1053 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1053 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun minValue!1129 () V!49721)

(declare-fun zeroValue!1129 () V!49721)

(declare-fun defaultEntry!1195 () Int)

(declare-datatypes ((Unit!42379 0))(
  ( (Unit!42380) )
))
(declare-fun lt!575839 () Unit!42379)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!629 (array!84016 array!84014 (_ BitVec 32) (_ BitVec 32) V!49721 V!49721 (_ BitVec 64) (_ BitVec 32) Int) Unit!42379)

(assert (=> b!1278013 (= lt!575839 (lemmaListMapContainsThenArrayContainsFrom!629 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 k!1053 #b00000000000000000000000000000000 defaultEntry!1195))))

(declare-fun b!1278014 () Bool)

(declare-fun e!729936 () Bool)

(declare-fun tp_is_empty!33463 () Bool)

(assert (=> b!1278014 (= e!729936 tp_is_empty!33463)))

(declare-fun b!1278015 () Bool)

(declare-fun e!729935 () Bool)

(declare-fun mapRes!51731 () Bool)

(assert (=> b!1278015 (= e!729935 (and e!729936 mapRes!51731))))

(declare-fun condMapEmpty!51731 () Bool)

(declare-fun mapDefault!51731 () ValueCell!15833)

