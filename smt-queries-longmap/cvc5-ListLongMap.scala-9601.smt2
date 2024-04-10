; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113526 () Bool)

(assert start!113526)

(declare-fun b_free!31519 () Bool)

(declare-fun b_next!31519 () Bool)

(assert (=> start!113526 (= b_free!31519 (not b_next!31519))))

(declare-fun tp!110366 () Bool)

(declare-fun b_and!50827 () Bool)

(assert (=> start!113526 (= tp!110366 b_and!50827)))

(declare-fun b!1347503 () Bool)

(declare-fun res!894065 () Bool)

(declare-fun e!766697 () Bool)

(assert (=> b!1347503 (=> (not res!894065) (not e!766697))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91872 0))(
  ( (array!91873 (arr!44391 (Array (_ BitVec 32) (_ BitVec 64))) (size!44941 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91872)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((V!55129 0))(
  ( (V!55130 (val!18834 Int)) )
))
(declare-datatypes ((ValueCell!17861 0))(
  ( (ValueCellFull!17861 (v!21485 V!55129)) (EmptyCell!17861) )
))
(declare-datatypes ((array!91874 0))(
  ( (array!91875 (arr!44392 (Array (_ BitVec 32) ValueCell!17861)) (size!44942 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91874)

(assert (=> b!1347503 (= res!894065 (and (= (size!44942 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44941 _keys!1571) (size!44942 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1347504 () Bool)

(declare-fun res!894061 () Bool)

(assert (=> b!1347504 (=> (not res!894061) (not e!766697))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91872 (_ BitVec 32)) Bool)

(assert (=> b!1347504 (= res!894061 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1347505 () Bool)

(declare-fun res!894063 () Bool)

(assert (=> b!1347505 (=> (not res!894063) (not e!766697))))

(declare-fun minValue!1245 () V!55129)

(declare-fun zeroValue!1245 () V!55129)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun defaultEntry!1306 () Int)

(declare-fun k!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24280 0))(
  ( (tuple2!24281 (_1!12151 (_ BitVec 64)) (_2!12151 V!55129)) )
))
(declare-datatypes ((List!31435 0))(
  ( (Nil!31432) (Cons!31431 (h!32640 tuple2!24280) (t!46033 List!31435)) )
))
(declare-datatypes ((ListLongMap!21937 0))(
  ( (ListLongMap!21938 (toList!10984 List!31435)) )
))
(declare-fun contains!9162 (ListLongMap!21937 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5935 (array!91872 array!91874 (_ BitVec 32) (_ BitVec 32) V!55129 V!55129 (_ BitVec 32) Int) ListLongMap!21937)

(assert (=> b!1347505 (= res!894063 (contains!9162 (getCurrentListMap!5935 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun b!1347506 () Bool)

(declare-fun res!894060 () Bool)

(assert (=> b!1347506 (=> (not res!894060) (not e!766697))))

(assert (=> b!1347506 (= res!894060 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1347507 () Bool)

(declare-fun e!766694 () Bool)

(declare-fun tp_is_empty!37519 () Bool)

(assert (=> b!1347507 (= e!766694 tp_is_empty!37519)))

(declare-fun mapIsEmpty!57989 () Bool)

(declare-fun mapRes!57989 () Bool)

(assert (=> mapIsEmpty!57989 mapRes!57989))

(declare-fun b!1347508 () Bool)

(declare-fun res!894068 () Bool)

(assert (=> b!1347508 (=> (not res!894068) (not e!766697))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1347508 (= res!894068 (validKeyInArray!0 (select (arr!44391 _keys!1571) from!1960)))))

(declare-fun b!1347509 () Bool)

(declare-fun res!894066 () Bool)

(assert (=> b!1347509 (=> (not res!894066) (not e!766697))))

(declare-datatypes ((List!31436 0))(
  ( (Nil!31433) (Cons!31432 (h!32641 (_ BitVec 64)) (t!46034 List!31436)) )
))
(declare-fun arrayNoDuplicates!0 (array!91872 (_ BitVec 32) List!31436) Bool)

(assert (=> b!1347509 (= res!894066 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31433))))

(declare-fun b!1347510 () Bool)

(assert (=> b!1347510 (= e!766697 false)))

(declare-fun lt!595822 () Bool)

(declare-fun +!4839 (ListLongMap!21937 tuple2!24280) ListLongMap!21937)

(declare-fun getCurrentListMapNoExtraKeys!6485 (array!91872 array!91874 (_ BitVec 32) (_ BitVec 32) V!55129 V!55129 (_ BitVec 32) Int) ListLongMap!21937)

(declare-fun get!22421 (ValueCell!17861 V!55129) V!55129)

(declare-fun dynLambda!3778 (Int (_ BitVec 64)) V!55129)

(assert (=> b!1347510 (= lt!595822 (contains!9162 (+!4839 (+!4839 (getCurrentListMapNoExtraKeys!6485 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24281 (select (arr!44391 _keys!1571) from!1960) (get!22421 (select (arr!44392 _values!1303) from!1960) (dynLambda!3778 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24281 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) k!1142))))

(declare-fun b!1347511 () Bool)

(declare-fun e!766693 () Bool)

(assert (=> b!1347511 (= e!766693 tp_is_empty!37519)))

(declare-fun b!1347512 () Bool)

(declare-fun res!894064 () Bool)

(assert (=> b!1347512 (=> (not res!894064) (not e!766697))))

(assert (=> b!1347512 (= res!894064 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44941 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!894067 () Bool)

(assert (=> start!113526 (=> (not res!894067) (not e!766697))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113526 (= res!894067 (validMask!0 mask!1977))))

(assert (=> start!113526 e!766697))

(assert (=> start!113526 tp_is_empty!37519))

(assert (=> start!113526 true))

(declare-fun array_inv!33443 (array!91872) Bool)

(assert (=> start!113526 (array_inv!33443 _keys!1571)))

(declare-fun e!766696 () Bool)

(declare-fun array_inv!33444 (array!91874) Bool)

(assert (=> start!113526 (and (array_inv!33444 _values!1303) e!766696)))

(assert (=> start!113526 tp!110366))

(declare-fun b!1347513 () Bool)

(declare-fun res!894062 () Bool)

(assert (=> b!1347513 (=> (not res!894062) (not e!766697))))

(assert (=> b!1347513 (= res!894062 (not (= (select (arr!44391 _keys!1571) from!1960) k!1142)))))

(declare-fun mapNonEmpty!57989 () Bool)

(declare-fun tp!110365 () Bool)

(assert (=> mapNonEmpty!57989 (= mapRes!57989 (and tp!110365 e!766694))))

(declare-fun mapRest!57989 () (Array (_ BitVec 32) ValueCell!17861))

(declare-fun mapValue!57989 () ValueCell!17861)

(declare-fun mapKey!57989 () (_ BitVec 32))

(assert (=> mapNonEmpty!57989 (= (arr!44392 _values!1303) (store mapRest!57989 mapKey!57989 mapValue!57989))))

(declare-fun b!1347514 () Bool)

(assert (=> b!1347514 (= e!766696 (and e!766693 mapRes!57989))))

(declare-fun condMapEmpty!57989 () Bool)

(declare-fun mapDefault!57989 () ValueCell!17861)

