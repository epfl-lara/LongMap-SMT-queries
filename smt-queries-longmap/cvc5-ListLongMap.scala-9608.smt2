; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113594 () Bool)

(assert start!113594)

(declare-fun b_free!31561 () Bool)

(declare-fun b_next!31561 () Bool)

(assert (=> start!113594 (= b_free!31561 (not b_next!31561))))

(declare-fun tp!110494 () Bool)

(declare-fun b_and!50919 () Bool)

(assert (=> start!113594 (= tp!110494 b_and!50919)))

(declare-fun b!1348484 () Bool)

(declare-fun e!767133 () Bool)

(assert (=> b!1348484 (= e!767133 false)))

(declare-datatypes ((V!55185 0))(
  ( (V!55186 (val!18855 Int)) )
))
(declare-fun minValue!1245 () V!55185)

(declare-datatypes ((array!91950 0))(
  ( (array!91951 (arr!44429 (Array (_ BitVec 32) (_ BitVec 64))) (size!44979 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91950)

(declare-fun zeroValue!1245 () V!55185)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17882 0))(
  ( (ValueCellFull!17882 (v!21507 V!55185)) (EmptyCell!17882) )
))
(declare-datatypes ((array!91952 0))(
  ( (array!91953 (arr!44430 (Array (_ BitVec 32) ValueCell!17882)) (size!44980 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91952)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k!1142 () (_ BitVec 64))

(declare-fun lt!596171 () Bool)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((tuple2!24310 0))(
  ( (tuple2!24311 (_1!12166 (_ BitVec 64)) (_2!12166 V!55185)) )
))
(declare-datatypes ((List!31462 0))(
  ( (Nil!31459) (Cons!31458 (h!32667 tuple2!24310) (t!46100 List!31462)) )
))
(declare-datatypes ((ListLongMap!21967 0))(
  ( (ListLongMap!21968 (toList!10999 List!31462)) )
))
(declare-fun contains!9179 (ListLongMap!21967 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5948 (array!91950 array!91952 (_ BitVec 32) (_ BitVec 32) V!55185 V!55185 (_ BitVec 32) Int) ListLongMap!21967)

(assert (=> b!1348484 (= lt!596171 (contains!9179 (getCurrentListMap!5948 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun b!1348485 () Bool)

(declare-fun res!894701 () Bool)

(assert (=> b!1348485 (=> (not res!894701) (not e!767133))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91950 (_ BitVec 32)) Bool)

(assert (=> b!1348485 (= res!894701 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1348486 () Bool)

(declare-fun res!894700 () Bool)

(assert (=> b!1348486 (=> (not res!894700) (not e!767133))))

(assert (=> b!1348486 (= res!894700 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44979 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1348487 () Bool)

(declare-fun e!767131 () Bool)

(declare-fun tp_is_empty!37561 () Bool)

(assert (=> b!1348487 (= e!767131 tp_is_empty!37561)))

(declare-fun b!1348488 () Bool)

(declare-fun res!894698 () Bool)

(assert (=> b!1348488 (=> (not res!894698) (not e!767133))))

(declare-datatypes ((List!31463 0))(
  ( (Nil!31460) (Cons!31459 (h!32668 (_ BitVec 64)) (t!46101 List!31463)) )
))
(declare-fun arrayNoDuplicates!0 (array!91950 (_ BitVec 32) List!31463) Bool)

(assert (=> b!1348488 (= res!894698 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31460))))

(declare-fun res!894697 () Bool)

(assert (=> start!113594 (=> (not res!894697) (not e!767133))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113594 (= res!894697 (validMask!0 mask!1977))))

(assert (=> start!113594 e!767133))

(assert (=> start!113594 tp_is_empty!37561))

(assert (=> start!113594 true))

(declare-fun array_inv!33467 (array!91950) Bool)

(assert (=> start!113594 (array_inv!33467 _keys!1571)))

(declare-fun e!767130 () Bool)

(declare-fun array_inv!33468 (array!91952) Bool)

(assert (=> start!113594 (and (array_inv!33468 _values!1303) e!767130)))

(assert (=> start!113594 tp!110494))

(declare-fun b!1348489 () Bool)

(declare-fun res!894699 () Bool)

(assert (=> b!1348489 (=> (not res!894699) (not e!767133))))

(assert (=> b!1348489 (= res!894699 (and (= (size!44980 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44979 _keys!1571) (size!44980 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!58055 () Bool)

(declare-fun mapRes!58055 () Bool)

(assert (=> mapIsEmpty!58055 mapRes!58055))

(declare-fun mapNonEmpty!58055 () Bool)

(declare-fun tp!110495 () Bool)

(declare-fun e!767129 () Bool)

(assert (=> mapNonEmpty!58055 (= mapRes!58055 (and tp!110495 e!767129))))

(declare-fun mapKey!58055 () (_ BitVec 32))

(declare-fun mapValue!58055 () ValueCell!17882)

(declare-fun mapRest!58055 () (Array (_ BitVec 32) ValueCell!17882))

(assert (=> mapNonEmpty!58055 (= (arr!44430 _values!1303) (store mapRest!58055 mapKey!58055 mapValue!58055))))

(declare-fun b!1348490 () Bool)

(assert (=> b!1348490 (= e!767129 tp_is_empty!37561)))

(declare-fun b!1348491 () Bool)

(assert (=> b!1348491 (= e!767130 (and e!767131 mapRes!58055))))

(declare-fun condMapEmpty!58055 () Bool)

(declare-fun mapDefault!58055 () ValueCell!17882)

