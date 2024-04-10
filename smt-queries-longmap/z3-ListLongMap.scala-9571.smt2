; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113290 () Bool)

(assert start!113290)

(declare-fun b_free!31341 () Bool)

(declare-fun b_next!31341 () Bool)

(assert (=> start!113290 (= b_free!31341 (not b_next!31341))))

(declare-fun tp!109828 () Bool)

(declare-fun b_and!50563 () Bool)

(assert (=> start!113290 (= tp!109828 b_and!50563)))

(declare-fun res!891837 () Bool)

(declare-fun e!765038 () Bool)

(assert (=> start!113290 (=> (not res!891837) (not e!765038))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113290 (= res!891837 (validMask!0 mask!1977))))

(assert (=> start!113290 e!765038))

(declare-fun tp_is_empty!37341 () Bool)

(assert (=> start!113290 tp_is_empty!37341))

(assert (=> start!113290 true))

(declare-datatypes ((array!91526 0))(
  ( (array!91527 (arr!44219 (Array (_ BitVec 32) (_ BitVec 64))) (size!44769 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91526)

(declare-fun array_inv!33325 (array!91526) Bool)

(assert (=> start!113290 (array_inv!33325 _keys!1571)))

(declare-datatypes ((V!54891 0))(
  ( (V!54892 (val!18745 Int)) )
))
(declare-datatypes ((ValueCell!17772 0))(
  ( (ValueCellFull!17772 (v!21393 V!54891)) (EmptyCell!17772) )
))
(declare-datatypes ((array!91528 0))(
  ( (array!91529 (arr!44220 (Array (_ BitVec 32) ValueCell!17772)) (size!44770 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91528)

(declare-fun e!765036 () Bool)

(declare-fun array_inv!33326 (array!91528) Bool)

(assert (=> start!113290 (and (array_inv!33326 _values!1303) e!765036)))

(assert (=> start!113290 tp!109828))

(declare-fun b!1344183 () Bool)

(declare-fun res!891839 () Bool)

(assert (=> b!1344183 (=> (not res!891839) (not e!765038))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1344183 (= res!891839 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44769 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1344184 () Bool)

(assert (=> b!1344184 (= e!765038 false)))

(declare-fun minValue!1245 () V!54891)

(declare-fun lt!595161 () Bool)

(declare-fun zeroValue!1245 () V!54891)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24156 0))(
  ( (tuple2!24157 (_1!12089 (_ BitVec 64)) (_2!12089 V!54891)) )
))
(declare-datatypes ((List!31311 0))(
  ( (Nil!31308) (Cons!31307 (h!32516 tuple2!24156) (t!45835 List!31311)) )
))
(declare-datatypes ((ListLongMap!21813 0))(
  ( (ListLongMap!21814 (toList!10922 List!31311)) )
))
(declare-fun contains!9098 (ListLongMap!21813 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5878 (array!91526 array!91528 (_ BitVec 32) (_ BitVec 32) V!54891 V!54891 (_ BitVec 32) Int) ListLongMap!21813)

(assert (=> b!1344184 (= lt!595161 (contains!9098 (getCurrentListMap!5878 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1344185 () Bool)

(declare-fun res!891838 () Bool)

(assert (=> b!1344185 (=> (not res!891838) (not e!765038))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91526 (_ BitVec 32)) Bool)

(assert (=> b!1344185 (= res!891838 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun mapIsEmpty!57718 () Bool)

(declare-fun mapRes!57718 () Bool)

(assert (=> mapIsEmpty!57718 mapRes!57718))

(declare-fun b!1344186 () Bool)

(declare-fun e!765037 () Bool)

(assert (=> b!1344186 (= e!765037 tp_is_empty!37341)))

(declare-fun b!1344187 () Bool)

(declare-fun e!765035 () Bool)

(assert (=> b!1344187 (= e!765035 tp_is_empty!37341)))

(declare-fun mapNonEmpty!57718 () Bool)

(declare-fun tp!109827 () Bool)

(assert (=> mapNonEmpty!57718 (= mapRes!57718 (and tp!109827 e!765035))))

(declare-fun mapRest!57718 () (Array (_ BitVec 32) ValueCell!17772))

(declare-fun mapKey!57718 () (_ BitVec 32))

(declare-fun mapValue!57718 () ValueCell!17772)

(assert (=> mapNonEmpty!57718 (= (arr!44220 _values!1303) (store mapRest!57718 mapKey!57718 mapValue!57718))))

(declare-fun b!1344188 () Bool)

(declare-fun res!891836 () Bool)

(assert (=> b!1344188 (=> (not res!891836) (not e!765038))))

(assert (=> b!1344188 (= res!891836 (and (= (size!44770 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44769 _keys!1571) (size!44770 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1344189 () Bool)

(assert (=> b!1344189 (= e!765036 (and e!765037 mapRes!57718))))

(declare-fun condMapEmpty!57718 () Bool)

(declare-fun mapDefault!57718 () ValueCell!17772)

(assert (=> b!1344189 (= condMapEmpty!57718 (= (arr!44220 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17772)) mapDefault!57718)))))

(declare-fun b!1344190 () Bool)

(declare-fun res!891840 () Bool)

(assert (=> b!1344190 (=> (not res!891840) (not e!765038))))

(declare-datatypes ((List!31312 0))(
  ( (Nil!31309) (Cons!31308 (h!32517 (_ BitVec 64)) (t!45836 List!31312)) )
))
(declare-fun arrayNoDuplicates!0 (array!91526 (_ BitVec 32) List!31312) Bool)

(assert (=> b!1344190 (= res!891840 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31309))))

(assert (= (and start!113290 res!891837) b!1344188))

(assert (= (and b!1344188 res!891836) b!1344185))

(assert (= (and b!1344185 res!891838) b!1344190))

(assert (= (and b!1344190 res!891840) b!1344183))

(assert (= (and b!1344183 res!891839) b!1344184))

(assert (= (and b!1344189 condMapEmpty!57718) mapIsEmpty!57718))

(assert (= (and b!1344189 (not condMapEmpty!57718)) mapNonEmpty!57718))

(get-info :version)

(assert (= (and mapNonEmpty!57718 ((_ is ValueCellFull!17772) mapValue!57718)) b!1344187))

(assert (= (and b!1344189 ((_ is ValueCellFull!17772) mapDefault!57718)) b!1344186))

(assert (= start!113290 b!1344189))

(declare-fun m!1231871 () Bool)

(assert (=> start!113290 m!1231871))

(declare-fun m!1231873 () Bool)

(assert (=> start!113290 m!1231873))

(declare-fun m!1231875 () Bool)

(assert (=> start!113290 m!1231875))

(declare-fun m!1231877 () Bool)

(assert (=> b!1344190 m!1231877))

(declare-fun m!1231879 () Bool)

(assert (=> mapNonEmpty!57718 m!1231879))

(declare-fun m!1231881 () Bool)

(assert (=> b!1344184 m!1231881))

(assert (=> b!1344184 m!1231881))

(declare-fun m!1231883 () Bool)

(assert (=> b!1344184 m!1231883))

(declare-fun m!1231885 () Bool)

(assert (=> b!1344185 m!1231885))

(check-sat (not b!1344185) (not mapNonEmpty!57718) b_and!50563 (not b_next!31341) (not b!1344184) (not b!1344190) (not start!113290) tp_is_empty!37341)
(check-sat b_and!50563 (not b_next!31341))
