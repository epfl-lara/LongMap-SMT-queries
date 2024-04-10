; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113224 () Bool)

(assert start!113224)

(declare-fun b_free!31275 () Bool)

(declare-fun b_next!31275 () Bool)

(assert (=> start!113224 (= b_free!31275 (not b_next!31275))))

(declare-fun tp!109630 () Bool)

(declare-fun b_and!50457 () Bool)

(assert (=> start!113224 (= tp!109630 b_and!50457)))

(declare-fun mapNonEmpty!57619 () Bool)

(declare-fun mapRes!57619 () Bool)

(declare-fun tp!109629 () Bool)

(declare-fun e!764539 () Bool)

(assert (=> mapNonEmpty!57619 (= mapRes!57619 (and tp!109629 e!764539))))

(declare-fun mapKey!57619 () (_ BitVec 32))

(declare-datatypes ((V!54803 0))(
  ( (V!54804 (val!18712 Int)) )
))
(declare-datatypes ((ValueCell!17739 0))(
  ( (ValueCellFull!17739 (v!21360 V!54803)) (EmptyCell!17739) )
))
(declare-fun mapRest!57619 () (Array (_ BitVec 32) ValueCell!17739))

(declare-fun mapValue!57619 () ValueCell!17739)

(declare-datatypes ((array!91398 0))(
  ( (array!91399 (arr!44155 (Array (_ BitVec 32) ValueCell!17739)) (size!44705 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91398)

(assert (=> mapNonEmpty!57619 (= (arr!44155 _values!1303) (store mapRest!57619 mapKey!57619 mapValue!57619))))

(declare-fun b!1343119 () Bool)

(declare-fun res!891111 () Bool)

(declare-fun e!764542 () Bool)

(assert (=> b!1343119 (=> (not res!891111) (not e!764542))))

(declare-datatypes ((array!91400 0))(
  ( (array!91401 (arr!44156 (Array (_ BitVec 32) (_ BitVec 64))) (size!44706 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91400)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun mask!1977 () (_ BitVec 32))

(assert (=> b!1343119 (= res!891111 (and (= (size!44705 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44706 _keys!1571) (size!44705 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1343120 () Bool)

(declare-fun res!891116 () Bool)

(assert (=> b!1343120 (=> (not res!891116) (not e!764542))))

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1343120 (= res!891116 (validKeyInArray!0 (select (arr!44156 _keys!1571) from!1960)))))

(declare-fun b!1343121 () Bool)

(declare-fun res!891114 () Bool)

(assert (=> b!1343121 (=> (not res!891114) (not e!764542))))

(declare-datatypes ((List!31262 0))(
  ( (Nil!31259) (Cons!31258 (h!32467 (_ BitVec 64)) (t!45748 List!31262)) )
))
(declare-fun arrayNoDuplicates!0 (array!91400 (_ BitVec 32) List!31262) Bool)

(assert (=> b!1343121 (= res!891114 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31259))))

(declare-fun b!1343122 () Bool)

(declare-fun e!764541 () Bool)

(declare-fun e!764543 () Bool)

(assert (=> b!1343122 (= e!764541 (and e!764543 mapRes!57619))))

(declare-fun condMapEmpty!57619 () Bool)

(declare-fun mapDefault!57619 () ValueCell!17739)

(assert (=> b!1343122 (= condMapEmpty!57619 (= (arr!44155 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17739)) mapDefault!57619)))))

(declare-fun mapIsEmpty!57619 () Bool)

(assert (=> mapIsEmpty!57619 mapRes!57619))

(declare-fun b!1343123 () Bool)

(declare-fun tp_is_empty!37275 () Bool)

(assert (=> b!1343123 (= e!764543 tp_is_empty!37275)))

(declare-fun b!1343124 () Bool)

(declare-fun res!891110 () Bool)

(assert (=> b!1343124 (=> (not res!891110) (not e!764542))))

(assert (=> b!1343124 (= res!891110 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1343125 () Bool)

(assert (=> b!1343125 (= e!764539 tp_is_empty!37275)))

(declare-fun res!891112 () Bool)

(assert (=> start!113224 (=> (not res!891112) (not e!764542))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113224 (= res!891112 (validMask!0 mask!1977))))

(assert (=> start!113224 e!764542))

(assert (=> start!113224 tp_is_empty!37275))

(assert (=> start!113224 true))

(declare-fun array_inv!33283 (array!91400) Bool)

(assert (=> start!113224 (array_inv!33283 _keys!1571)))

(declare-fun array_inv!33284 (array!91398) Bool)

(assert (=> start!113224 (and (array_inv!33284 _values!1303) e!764541)))

(assert (=> start!113224 tp!109630))

(declare-fun b!1343126 () Bool)

(declare-fun res!891117 () Bool)

(assert (=> b!1343126 (=> (not res!891117) (not e!764542))))

(declare-fun k0!1142 () (_ BitVec 64))

(assert (=> b!1343126 (= res!891117 (not (= (select (arr!44156 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1343127 () Bool)

(declare-fun res!891109 () Bool)

(assert (=> b!1343127 (=> (not res!891109) (not e!764542))))

(assert (=> b!1343127 (= res!891109 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44706 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1343128 () Bool)

(assert (=> b!1343128 (= e!764542 (not true))))

(declare-datatypes ((tuple2!24104 0))(
  ( (tuple2!24105 (_1!12063 (_ BitVec 64)) (_2!12063 V!54803)) )
))
(declare-datatypes ((List!31263 0))(
  ( (Nil!31260) (Cons!31259 (h!32468 tuple2!24104) (t!45749 List!31263)) )
))
(declare-datatypes ((ListLongMap!21761 0))(
  ( (ListLongMap!21762 (toList!10896 List!31263)) )
))
(declare-fun lt!594777 () ListLongMap!21761)

(declare-fun zeroValue!1245 () V!54803)

(declare-fun contains!9072 (ListLongMap!21761 (_ BitVec 64)) Bool)

(declare-fun +!4804 (ListLongMap!21761 tuple2!24104) ListLongMap!21761)

(assert (=> b!1343128 (contains!9072 (+!4804 lt!594777 (tuple2!24105 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) k0!1142)))

(declare-datatypes ((Unit!44085 0))(
  ( (Unit!44086) )
))
(declare-fun lt!594776 () Unit!44085)

(declare-fun addStillContains!1197 (ListLongMap!21761 (_ BitVec 64) V!54803 (_ BitVec 64)) Unit!44085)

(assert (=> b!1343128 (= lt!594776 (addStillContains!1197 lt!594777 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 k0!1142))))

(assert (=> b!1343128 (contains!9072 lt!594777 k0!1142)))

(declare-fun lt!594775 () V!54803)

(declare-fun lt!594772 () Unit!44085)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!373 ((_ BitVec 64) (_ BitVec 64) V!54803 ListLongMap!21761) Unit!44085)

(assert (=> b!1343128 (= lt!594772 (lemmaInListMapAfterAddingDiffThenInBefore!373 k0!1142 (select (arr!44156 _keys!1571) from!1960) lt!594775 lt!594777))))

(declare-fun lt!594774 () ListLongMap!21761)

(assert (=> b!1343128 (contains!9072 lt!594774 k0!1142)))

(declare-fun lt!594773 () Unit!44085)

(assert (=> b!1343128 (= lt!594773 (lemmaInListMapAfterAddingDiffThenInBefore!373 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594774))))

(assert (=> b!1343128 (= lt!594774 (+!4804 lt!594777 (tuple2!24105 (select (arr!44156 _keys!1571) from!1960) lt!594775)))))

(declare-fun defaultEntry!1306 () Int)

(declare-fun get!22301 (ValueCell!17739 V!54803) V!54803)

(declare-fun dynLambda!3743 (Int (_ BitVec 64)) V!54803)

(assert (=> b!1343128 (= lt!594775 (get!22301 (select (arr!44155 _values!1303) from!1960) (dynLambda!3743 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1245 () V!54803)

(declare-fun getCurrentListMapNoExtraKeys!6446 (array!91400 array!91398 (_ BitVec 32) (_ BitVec 32) V!54803 V!54803 (_ BitVec 32) Int) ListLongMap!21761)

(assert (=> b!1343128 (= lt!594777 (getCurrentListMapNoExtraKeys!6446 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun b!1343129 () Bool)

(declare-fun res!891115 () Bool)

(assert (=> b!1343129 (=> (not res!891115) (not e!764542))))

(declare-fun getCurrentListMap!5858 (array!91400 array!91398 (_ BitVec 32) (_ BitVec 32) V!54803 V!54803 (_ BitVec 32) Int) ListLongMap!21761)

(assert (=> b!1343129 (= res!891115 (contains!9072 (getCurrentListMap!5858 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1343130 () Bool)

(declare-fun res!891113 () Bool)

(assert (=> b!1343130 (=> (not res!891113) (not e!764542))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91400 (_ BitVec 32)) Bool)

(assert (=> b!1343130 (= res!891113 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(assert (= (and start!113224 res!891112) b!1343119))

(assert (= (and b!1343119 res!891111) b!1343130))

(assert (= (and b!1343130 res!891113) b!1343121))

(assert (= (and b!1343121 res!891114) b!1343127))

(assert (= (and b!1343127 res!891109) b!1343129))

(assert (= (and b!1343129 res!891115) b!1343126))

(assert (= (and b!1343126 res!891117) b!1343120))

(assert (= (and b!1343120 res!891116) b!1343124))

(assert (= (and b!1343124 res!891110) b!1343128))

(assert (= (and b!1343122 condMapEmpty!57619) mapIsEmpty!57619))

(assert (= (and b!1343122 (not condMapEmpty!57619)) mapNonEmpty!57619))

(get-info :version)

(assert (= (and mapNonEmpty!57619 ((_ is ValueCellFull!17739) mapValue!57619)) b!1343125))

(assert (= (and b!1343122 ((_ is ValueCellFull!17739) mapDefault!57619)) b!1343123))

(assert (= start!113224 b!1343122))

(declare-fun b_lambda!24451 () Bool)

(assert (=> (not b_lambda!24451) (not b!1343128)))

(declare-fun t!45747 () Bool)

(declare-fun tb!12289 () Bool)

(assert (=> (and start!113224 (= defaultEntry!1306 defaultEntry!1306) t!45747) tb!12289))

(declare-fun result!25669 () Bool)

(assert (=> tb!12289 (= result!25669 tp_is_empty!37275)))

(assert (=> b!1343128 t!45747))

(declare-fun b_and!50459 () Bool)

(assert (= b_and!50457 (and (=> t!45747 result!25669) b_and!50459)))

(declare-fun m!1230783 () Bool)

(assert (=> start!113224 m!1230783))

(declare-fun m!1230785 () Bool)

(assert (=> start!113224 m!1230785))

(declare-fun m!1230787 () Bool)

(assert (=> start!113224 m!1230787))

(declare-fun m!1230789 () Bool)

(assert (=> b!1343121 m!1230789))

(declare-fun m!1230791 () Bool)

(assert (=> b!1343126 m!1230791))

(assert (=> b!1343120 m!1230791))

(assert (=> b!1343120 m!1230791))

(declare-fun m!1230793 () Bool)

(assert (=> b!1343120 m!1230793))

(declare-fun m!1230795 () Bool)

(assert (=> mapNonEmpty!57619 m!1230795))

(declare-fun m!1230797 () Bool)

(assert (=> b!1343130 m!1230797))

(declare-fun m!1230799 () Bool)

(assert (=> b!1343129 m!1230799))

(assert (=> b!1343129 m!1230799))

(declare-fun m!1230801 () Bool)

(assert (=> b!1343129 m!1230801))

(declare-fun m!1230803 () Bool)

(assert (=> b!1343128 m!1230803))

(declare-fun m!1230805 () Bool)

(assert (=> b!1343128 m!1230805))

(declare-fun m!1230807 () Bool)

(assert (=> b!1343128 m!1230807))

(declare-fun m!1230809 () Bool)

(assert (=> b!1343128 m!1230809))

(declare-fun m!1230811 () Bool)

(assert (=> b!1343128 m!1230811))

(declare-fun m!1230813 () Bool)

(assert (=> b!1343128 m!1230813))

(assert (=> b!1343128 m!1230809))

(declare-fun m!1230815 () Bool)

(assert (=> b!1343128 m!1230815))

(assert (=> b!1343128 m!1230791))

(declare-fun m!1230817 () Bool)

(assert (=> b!1343128 m!1230817))

(declare-fun m!1230819 () Bool)

(assert (=> b!1343128 m!1230819))

(declare-fun m!1230821 () Bool)

(assert (=> b!1343128 m!1230821))

(assert (=> b!1343128 m!1230791))

(declare-fun m!1230823 () Bool)

(assert (=> b!1343128 m!1230823))

(assert (=> b!1343128 m!1230807))

(assert (=> b!1343128 m!1230805))

(declare-fun m!1230825 () Bool)

(assert (=> b!1343128 m!1230825))

(check-sat (not b!1343128) (not mapNonEmpty!57619) (not b_next!31275) tp_is_empty!37275 (not b!1343130) (not start!113224) b_and!50459 (not b_lambda!24451) (not b!1343120) (not b!1343129) (not b!1343121))
(check-sat b_and!50459 (not b_next!31275))
