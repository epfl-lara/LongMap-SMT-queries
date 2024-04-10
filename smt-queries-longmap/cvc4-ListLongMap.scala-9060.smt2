; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109148 () Bool)

(assert start!109148)

(declare-fun b_free!28637 () Bool)

(declare-fun b_next!28637 () Bool)

(assert (=> start!109148 (= b_free!28637 (not b_next!28637))))

(declare-fun tp!101030 () Bool)

(declare-fun b_and!46727 () Bool)

(assert (=> start!109148 (= tp!101030 b_and!46727)))

(declare-fun b!1290749 () Bool)

(declare-fun res!857502 () Bool)

(declare-fun e!736874 () Bool)

(assert (=> b!1290749 (=> (not res!857502) (not e!736874))))

(declare-datatypes ((array!85592 0))(
  ( (array!85593 (arr!41297 (Array (_ BitVec 32) (_ BitVec 64))) (size!41847 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85592)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85592 (_ BitVec 32)) Bool)

(assert (=> b!1290749 (= res!857502 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1290750 () Bool)

(declare-fun e!736870 () Bool)

(assert (=> b!1290750 (= e!736874 (not e!736870))))

(declare-fun res!857507 () Bool)

(assert (=> b!1290750 (=> res!857507 e!736870)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1290750 (= res!857507 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((V!50805 0))(
  ( (V!50806 (val!17213 Int)) )
))
(declare-datatypes ((tuple2!22122 0))(
  ( (tuple2!22123 (_1!11072 (_ BitVec 64)) (_2!11072 V!50805)) )
))
(declare-datatypes ((List!29286 0))(
  ( (Nil!29283) (Cons!29282 (h!30491 tuple2!22122) (t!42850 List!29286)) )
))
(declare-datatypes ((ListLongMap!19779 0))(
  ( (ListLongMap!19780 (toList!9905 List!29286)) )
))
(declare-fun contains!8023 (ListLongMap!19779 (_ BitVec 64)) Bool)

(assert (=> b!1290750 (not (contains!8023 (ListLongMap!19780 Nil!29283) k!1205))))

(declare-datatypes ((Unit!42724 0))(
  ( (Unit!42725) )
))
(declare-fun lt!578783 () Unit!42724)

(declare-fun emptyContainsNothing!88 ((_ BitVec 64)) Unit!42724)

(assert (=> b!1290750 (= lt!578783 (emptyContainsNothing!88 k!1205))))

(declare-fun b!1290751 () Bool)

(declare-fun res!857508 () Bool)

(assert (=> b!1290751 (=> (not res!857508) (not e!736874))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1290751 (= res!857508 (not (validKeyInArray!0 (select (arr!41297 _keys!1741) from!2144))))))

(declare-fun b!1290752 () Bool)

(declare-fun res!857505 () Bool)

(assert (=> b!1290752 (=> (not res!857505) (not e!736874))))

(assert (=> b!1290752 (= res!857505 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41847 _keys!1741))))))

(declare-fun b!1290753 () Bool)

(declare-fun res!857501 () Bool)

(assert (=> b!1290753 (=> (not res!857501) (not e!736874))))

(declare-datatypes ((ValueCell!16240 0))(
  ( (ValueCellFull!16240 (v!19816 V!50805)) (EmptyCell!16240) )
))
(declare-datatypes ((array!85594 0))(
  ( (array!85595 (arr!41298 (Array (_ BitVec 32) ValueCell!16240)) (size!41848 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85594)

(assert (=> b!1290753 (= res!857501 (and (= (size!41848 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41847 _keys!1741) (size!41848 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun res!857503 () Bool)

(assert (=> start!109148 (=> (not res!857503) (not e!736874))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109148 (= res!857503 (validMask!0 mask!2175))))

(assert (=> start!109148 e!736874))

(declare-fun tp_is_empty!34277 () Bool)

(assert (=> start!109148 tp_is_empty!34277))

(assert (=> start!109148 true))

(declare-fun e!736872 () Bool)

(declare-fun array_inv!31297 (array!85594) Bool)

(assert (=> start!109148 (and (array_inv!31297 _values!1445) e!736872)))

(declare-fun array_inv!31298 (array!85592) Bool)

(assert (=> start!109148 (array_inv!31298 _keys!1741)))

(assert (=> start!109148 tp!101030))

(declare-fun mapNonEmpty!52976 () Bool)

(declare-fun mapRes!52976 () Bool)

(declare-fun tp!101029 () Bool)

(declare-fun e!736873 () Bool)

(assert (=> mapNonEmpty!52976 (= mapRes!52976 (and tp!101029 e!736873))))

(declare-fun mapValue!52976 () ValueCell!16240)

(declare-fun mapRest!52976 () (Array (_ BitVec 32) ValueCell!16240))

(declare-fun mapKey!52976 () (_ BitVec 32))

(assert (=> mapNonEmpty!52976 (= (arr!41298 _values!1445) (store mapRest!52976 mapKey!52976 mapValue!52976))))

(declare-fun b!1290754 () Bool)

(declare-fun res!857506 () Bool)

(assert (=> b!1290754 (=> (not res!857506) (not e!736874))))

(assert (=> b!1290754 (= res!857506 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41847 _keys!1741))))))

(declare-fun b!1290755 () Bool)

(assert (=> b!1290755 (= e!736873 tp_is_empty!34277)))

(declare-fun b!1290756 () Bool)

(declare-fun e!736871 () Bool)

(assert (=> b!1290756 (= e!736871 tp_is_empty!34277)))

(declare-fun b!1290757 () Bool)

(assert (=> b!1290757 (= e!736872 (and e!736871 mapRes!52976))))

(declare-fun condMapEmpty!52976 () Bool)

(declare-fun mapDefault!52976 () ValueCell!16240)

