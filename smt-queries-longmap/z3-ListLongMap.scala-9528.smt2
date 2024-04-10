; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113032 () Bool)

(assert start!113032)

(declare-fun b_free!31083 () Bool)

(declare-fun b_next!31083 () Bool)

(assert (=> start!113032 (= b_free!31083 (not b_next!31083))))

(declare-fun tp!109053 () Bool)

(declare-fun b_and!50113 () Bool)

(assert (=> start!113032 (= tp!109053 b_and!50113)))

(declare-fun b!1339716 () Bool)

(declare-fun e!763101 () Bool)

(declare-fun tp_is_empty!37083 () Bool)

(assert (=> b!1339716 (= e!763101 tp_is_empty!37083)))

(declare-fun b!1339717 () Bool)

(declare-fun res!888725 () Bool)

(declare-fun e!763100 () Bool)

(assert (=> b!1339717 (=> (not res!888725) (not e!763100))))

(declare-datatypes ((array!91022 0))(
  ( (array!91023 (arr!43967 (Array (_ BitVec 32) (_ BitVec 64))) (size!44517 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91022)

(declare-datatypes ((List!31122 0))(
  ( (Nil!31119) (Cons!31118 (h!32327 (_ BitVec 64)) (t!45454 List!31122)) )
))
(declare-fun arrayNoDuplicates!0 (array!91022 (_ BitVec 32) List!31122) Bool)

(assert (=> b!1339717 (= res!888725 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31119))))

(declare-fun mapNonEmpty!57331 () Bool)

(declare-fun mapRes!57331 () Bool)

(declare-fun tp!109054 () Bool)

(declare-fun e!763102 () Bool)

(assert (=> mapNonEmpty!57331 (= mapRes!57331 (and tp!109054 e!763102))))

(declare-datatypes ((V!54547 0))(
  ( (V!54548 (val!18616 Int)) )
))
(declare-datatypes ((ValueCell!17643 0))(
  ( (ValueCellFull!17643 (v!21264 V!54547)) (EmptyCell!17643) )
))
(declare-fun mapRest!57331 () (Array (_ BitVec 32) ValueCell!17643))

(declare-fun mapValue!57331 () ValueCell!17643)

(declare-fun mapKey!57331 () (_ BitVec 32))

(declare-datatypes ((array!91024 0))(
  ( (array!91025 (arr!43968 (Array (_ BitVec 32) ValueCell!17643)) (size!44518 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91024)

(assert (=> mapNonEmpty!57331 (= (arr!43968 _values!1303) (store mapRest!57331 mapKey!57331 mapValue!57331))))

(declare-fun b!1339719 () Bool)

(declare-fun e!763099 () Bool)

(assert (=> b!1339719 (= e!763099 (and e!763101 mapRes!57331))))

(declare-fun condMapEmpty!57331 () Bool)

(declare-fun mapDefault!57331 () ValueCell!17643)

(assert (=> b!1339719 (= condMapEmpty!57331 (= (arr!43968 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17643)) mapDefault!57331)))))

(declare-fun b!1339720 () Bool)

(declare-fun res!888726 () Bool)

(assert (=> b!1339720 (=> (not res!888726) (not e!763100))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1339720 (= res!888726 (and (= (size!44518 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44517 _keys!1571) (size!44518 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1339721 () Bool)

(assert (=> b!1339721 (= e!763102 tp_is_empty!37083)))

(declare-fun b!1339722 () Bool)

(declare-fun res!888724 () Bool)

(assert (=> b!1339722 (=> (not res!888724) (not e!763100))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91022 (_ BitVec 32)) Bool)

(assert (=> b!1339722 (= res!888724 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun mapIsEmpty!57331 () Bool)

(assert (=> mapIsEmpty!57331 mapRes!57331))

(declare-fun b!1339723 () Bool)

(assert (=> b!1339723 (= e!763100 false)))

(declare-fun minValue!1245 () V!54547)

(declare-fun zeroValue!1245 () V!54547)

(declare-fun lt!593919 () Bool)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!23956 0))(
  ( (tuple2!23957 (_1!11989 (_ BitVec 64)) (_2!11989 V!54547)) )
))
(declare-datatypes ((List!31123 0))(
  ( (Nil!31120) (Cons!31119 (h!32328 tuple2!23956) (t!45455 List!31123)) )
))
(declare-datatypes ((ListLongMap!21613 0))(
  ( (ListLongMap!21614 (toList!10822 List!31123)) )
))
(declare-fun contains!8998 (ListLongMap!21613 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5791 (array!91022 array!91024 (_ BitVec 32) (_ BitVec 32) V!54547 V!54547 (_ BitVec 32) Int) ListLongMap!21613)

(assert (=> b!1339723 (= lt!593919 (contains!8998 (getCurrentListMap!5791 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1339718 () Bool)

(declare-fun res!888722 () Bool)

(assert (=> b!1339718 (=> (not res!888722) (not e!763100))))

(assert (=> b!1339718 (= res!888722 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44517 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!888723 () Bool)

(assert (=> start!113032 (=> (not res!888723) (not e!763100))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113032 (= res!888723 (validMask!0 mask!1977))))

(assert (=> start!113032 e!763100))

(assert (=> start!113032 tp_is_empty!37083))

(assert (=> start!113032 true))

(declare-fun array_inv!33153 (array!91022) Bool)

(assert (=> start!113032 (array_inv!33153 _keys!1571)))

(declare-fun array_inv!33154 (array!91024) Bool)

(assert (=> start!113032 (and (array_inv!33154 _values!1303) e!763099)))

(assert (=> start!113032 tp!109053))

(assert (= (and start!113032 res!888723) b!1339720))

(assert (= (and b!1339720 res!888726) b!1339722))

(assert (= (and b!1339722 res!888724) b!1339717))

(assert (= (and b!1339717 res!888725) b!1339718))

(assert (= (and b!1339718 res!888722) b!1339723))

(assert (= (and b!1339719 condMapEmpty!57331) mapIsEmpty!57331))

(assert (= (and b!1339719 (not condMapEmpty!57331)) mapNonEmpty!57331))

(get-info :version)

(assert (= (and mapNonEmpty!57331 ((_ is ValueCellFull!17643) mapValue!57331)) b!1339721))

(assert (= (and b!1339719 ((_ is ValueCellFull!17643) mapDefault!57331)) b!1339716))

(assert (= start!113032 b!1339719))

(declare-fun m!1227677 () Bool)

(assert (=> b!1339723 m!1227677))

(assert (=> b!1339723 m!1227677))

(declare-fun m!1227679 () Bool)

(assert (=> b!1339723 m!1227679))

(declare-fun m!1227681 () Bool)

(assert (=> b!1339722 m!1227681))

(declare-fun m!1227683 () Bool)

(assert (=> mapNonEmpty!57331 m!1227683))

(declare-fun m!1227685 () Bool)

(assert (=> start!113032 m!1227685))

(declare-fun m!1227687 () Bool)

(assert (=> start!113032 m!1227687))

(declare-fun m!1227689 () Bool)

(assert (=> start!113032 m!1227689))

(declare-fun m!1227691 () Bool)

(assert (=> b!1339717 m!1227691))

(check-sat (not b_next!31083) (not b!1339717) (not start!113032) tp_is_empty!37083 (not b!1339722) b_and!50113 (not mapNonEmpty!57331) (not b!1339723))
(check-sat b_and!50113 (not b_next!31083))
