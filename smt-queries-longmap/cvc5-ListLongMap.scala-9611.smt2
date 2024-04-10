; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113670 () Bool)

(assert start!113670)

(declare-fun b_free!31579 () Bool)

(declare-fun b_next!31579 () Bool)

(assert (=> start!113670 (= b_free!31579 (not b_next!31579))))

(declare-fun tp!110553 () Bool)

(declare-fun b_and!50957 () Bool)

(assert (=> start!113670 (= tp!110553 b_and!50957)))

(declare-fun b!1349136 () Bool)

(declare-fun res!895062 () Bool)

(declare-fun e!767493 () Bool)

(assert (=> b!1349136 (=> (not res!895062) (not e!767493))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91988 0))(
  ( (array!91989 (arr!44447 (Array (_ BitVec 32) (_ BitVec 64))) (size!44997 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91988)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((V!55209 0))(
  ( (V!55210 (val!18864 Int)) )
))
(declare-datatypes ((ValueCell!17891 0))(
  ( (ValueCellFull!17891 (v!21519 V!55209)) (EmptyCell!17891) )
))
(declare-datatypes ((array!91990 0))(
  ( (array!91991 (arr!44448 (Array (_ BitVec 32) ValueCell!17891)) (size!44998 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91990)

(assert (=> b!1349136 (= res!895062 (and (= (size!44998 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44997 _keys!1571) (size!44998 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1349137 () Bool)

(declare-fun e!767492 () Bool)

(declare-fun tp_is_empty!37579 () Bool)

(assert (=> b!1349137 (= e!767492 tp_is_empty!37579)))

(declare-fun b!1349138 () Bool)

(declare-fun e!767494 () Bool)

(assert (=> b!1349138 (= e!767494 tp_is_empty!37579)))

(declare-fun res!895066 () Bool)

(assert (=> start!113670 (=> (not res!895066) (not e!767493))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113670 (= res!895066 (validMask!0 mask!1977))))

(assert (=> start!113670 e!767493))

(assert (=> start!113670 tp_is_empty!37579))

(assert (=> start!113670 true))

(declare-fun array_inv!33481 (array!91988) Bool)

(assert (=> start!113670 (array_inv!33481 _keys!1571)))

(declare-fun e!767495 () Bool)

(declare-fun array_inv!33482 (array!91990) Bool)

(assert (=> start!113670 (and (array_inv!33482 _values!1303) e!767495)))

(assert (=> start!113670 tp!110553))

(declare-fun b!1349139 () Bool)

(declare-fun res!895060 () Bool)

(assert (=> b!1349139 (=> (not res!895060) (not e!767493))))

(declare-datatypes ((List!31479 0))(
  ( (Nil!31476) (Cons!31475 (h!32684 (_ BitVec 64)) (t!46125 List!31479)) )
))
(declare-fun arrayNoDuplicates!0 (array!91988 (_ BitVec 32) List!31479) Bool)

(assert (=> b!1349139 (= res!895060 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31476))))

(declare-fun b!1349140 () Bool)

(declare-fun res!895063 () Bool)

(assert (=> b!1349140 (=> (not res!895063) (not e!767493))))

(assert (=> b!1349140 (= res!895063 (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1349141 () Bool)

(declare-fun res!895061 () Bool)

(assert (=> b!1349141 (=> (not res!895061) (not e!767493))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91988 (_ BitVec 32)) Bool)

(assert (=> b!1349141 (= res!895061 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun k!1142 () (_ BitVec 64))

(declare-fun b!1349142 () Bool)

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1349142 (= e!767493 (= k!1142 (select (arr!44447 _keys!1571) from!1960)))))

(declare-fun b!1349143 () Bool)

(declare-fun res!895059 () Bool)

(assert (=> b!1349143 (=> (not res!895059) (not e!767493))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1349143 (= res!895059 (validKeyInArray!0 (select (arr!44447 _keys!1571) from!1960)))))

(declare-fun mapIsEmpty!58086 () Bool)

(declare-fun mapRes!58086 () Bool)

(assert (=> mapIsEmpty!58086 mapRes!58086))

(declare-fun b!1349144 () Bool)

(declare-fun res!895065 () Bool)

(assert (=> b!1349144 (=> (not res!895065) (not e!767493))))

(assert (=> b!1349144 (= res!895065 (not (= (select (arr!44447 _keys!1571) from!1960) k!1142)))))

(declare-fun b!1349145 () Bool)

(declare-fun res!895064 () Bool)

(assert (=> b!1349145 (=> (not res!895064) (not e!767493))))

(declare-fun minValue!1245 () V!55209)

(declare-fun zeroValue!1245 () V!55209)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24328 0))(
  ( (tuple2!24329 (_1!12175 (_ BitVec 64)) (_2!12175 V!55209)) )
))
(declare-datatypes ((List!31480 0))(
  ( (Nil!31477) (Cons!31476 (h!32685 tuple2!24328) (t!46126 List!31480)) )
))
(declare-datatypes ((ListLongMap!21985 0))(
  ( (ListLongMap!21986 (toList!11008 List!31480)) )
))
(declare-fun contains!9190 (ListLongMap!21985 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5957 (array!91988 array!91990 (_ BitVec 32) (_ BitVec 32) V!55209 V!55209 (_ BitVec 32) Int) ListLongMap!21985)

(assert (=> b!1349145 (= res!895064 (contains!9190 (getCurrentListMap!5957 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun b!1349146 () Bool)

(declare-fun res!895058 () Bool)

(assert (=> b!1349146 (=> (not res!895058) (not e!767493))))

(assert (=> b!1349146 (= res!895058 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44997 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1349147 () Bool)

(declare-fun res!895057 () Bool)

(assert (=> b!1349147 (=> (not res!895057) (not e!767493))))

(declare-fun +!4851 (ListLongMap!21985 tuple2!24328) ListLongMap!21985)

(declare-fun getCurrentListMapNoExtraKeys!6497 (array!91988 array!91990 (_ BitVec 32) (_ BitVec 32) V!55209 V!55209 (_ BitVec 32) Int) ListLongMap!21985)

(declare-fun get!22458 (ValueCell!17891 V!55209) V!55209)

(declare-fun dynLambda!3790 (Int (_ BitVec 64)) V!55209)

(assert (=> b!1349147 (= res!895057 (contains!9190 (+!4851 (getCurrentListMapNoExtraKeys!6497 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24329 (select (arr!44447 _keys!1571) from!1960) (get!22458 (select (arr!44448 _values!1303) from!1960) (dynLambda!3790 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) k!1142))))

(declare-fun b!1349148 () Bool)

(assert (=> b!1349148 (= e!767495 (and e!767494 mapRes!58086))))

(declare-fun condMapEmpty!58086 () Bool)

(declare-fun mapDefault!58086 () ValueCell!17891)

