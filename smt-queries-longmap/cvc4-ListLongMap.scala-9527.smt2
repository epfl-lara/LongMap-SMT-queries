; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113028 () Bool)

(assert start!113028)

(declare-fun b_free!31079 () Bool)

(declare-fun b_next!31079 () Bool)

(assert (=> start!113028 (= b_free!31079 (not b_next!31079))))

(declare-fun tp!109042 () Bool)

(declare-fun b_and!50109 () Bool)

(assert (=> start!113028 (= tp!109042 b_and!50109)))

(declare-fun b!1339668 () Bool)

(declare-fun e!763071 () Bool)

(assert (=> b!1339668 (= e!763071 false)))

(declare-datatypes ((V!54541 0))(
  ( (V!54542 (val!18614 Int)) )
))
(declare-fun minValue!1245 () V!54541)

(declare-fun lt!593913 () Bool)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91014 0))(
  ( (array!91015 (arr!43963 (Array (_ BitVec 32) (_ BitVec 64))) (size!44513 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91014)

(declare-fun zeroValue!1245 () V!54541)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17641 0))(
  ( (ValueCellFull!17641 (v!21262 V!54541)) (EmptyCell!17641) )
))
(declare-datatypes ((array!91016 0))(
  ( (array!91017 (arr!43964 (Array (_ BitVec 32) ValueCell!17641)) (size!44514 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91016)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!23954 0))(
  ( (tuple2!23955 (_1!11988 (_ BitVec 64)) (_2!11988 V!54541)) )
))
(declare-datatypes ((List!31120 0))(
  ( (Nil!31117) (Cons!31116 (h!32325 tuple2!23954) (t!45452 List!31120)) )
))
(declare-datatypes ((ListLongMap!21611 0))(
  ( (ListLongMap!21612 (toList!10821 List!31120)) )
))
(declare-fun contains!8997 (ListLongMap!21611 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5790 (array!91014 array!91016 (_ BitVec 32) (_ BitVec 32) V!54541 V!54541 (_ BitVec 32) Int) ListLongMap!21611)

(assert (=> b!1339668 (= lt!593913 (contains!8997 (getCurrentListMap!5790 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun mapIsEmpty!57325 () Bool)

(declare-fun mapRes!57325 () Bool)

(assert (=> mapIsEmpty!57325 mapRes!57325))

(declare-fun b!1339669 () Bool)

(declare-fun res!888695 () Bool)

(assert (=> b!1339669 (=> (not res!888695) (not e!763071))))

(assert (=> b!1339669 (= res!888695 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44513 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1339670 () Bool)

(declare-fun res!888694 () Bool)

(assert (=> b!1339670 (=> (not res!888694) (not e!763071))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91014 (_ BitVec 32)) Bool)

(assert (=> b!1339670 (= res!888694 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1339671 () Bool)

(declare-fun e!763073 () Bool)

(declare-fun tp_is_empty!37079 () Bool)

(assert (=> b!1339671 (= e!763073 tp_is_empty!37079)))

(declare-fun b!1339672 () Bool)

(declare-fun e!763070 () Bool)

(assert (=> b!1339672 (= e!763070 tp_is_empty!37079)))

(declare-fun b!1339674 () Bool)

(declare-fun e!763072 () Bool)

(assert (=> b!1339674 (= e!763072 (and e!763073 mapRes!57325))))

(declare-fun condMapEmpty!57325 () Bool)

(declare-fun mapDefault!57325 () ValueCell!17641)

