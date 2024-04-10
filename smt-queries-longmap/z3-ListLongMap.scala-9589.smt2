; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113398 () Bool)

(assert start!113398)

(declare-fun b_free!31449 () Bool)

(declare-fun b_next!31449 () Bool)

(assert (=> start!113398 (= b_free!31449 (not b_next!31449))))

(declare-fun tp!110152 () Bool)

(declare-fun b_and!50737 () Bool)

(assert (=> start!113398 (= tp!110152 b_and!50737)))

(declare-fun b!1346130 () Bool)

(declare-fun res!893232 () Bool)

(declare-fun e!765926 () Bool)

(assert (=> b!1346130 (=> (not res!893232) (not e!765926))))

(declare-datatypes ((array!91736 0))(
  ( (array!91737 (arr!44324 (Array (_ BitVec 32) (_ BitVec 64))) (size!44874 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91736)

(declare-datatypes ((List!31389 0))(
  ( (Nil!31386) (Cons!31385 (h!32594 (_ BitVec 64)) (t!45979 List!31389)) )
))
(declare-fun arrayNoDuplicates!0 (array!91736 (_ BitVec 32) List!31389) Bool)

(assert (=> b!1346130 (= res!893232 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31386))))

(declare-fun mapNonEmpty!57880 () Bool)

(declare-fun mapRes!57880 () Bool)

(declare-fun tp!110151 () Bool)

(declare-fun e!765925 () Bool)

(assert (=> mapNonEmpty!57880 (= mapRes!57880 (and tp!110151 e!765925))))

(declare-datatypes ((V!55035 0))(
  ( (V!55036 (val!18799 Int)) )
))
(declare-datatypes ((ValueCell!17826 0))(
  ( (ValueCellFull!17826 (v!21447 V!55035)) (EmptyCell!17826) )
))
(declare-fun mapRest!57880 () (Array (_ BitVec 32) ValueCell!17826))

(declare-fun mapValue!57880 () ValueCell!17826)

(declare-fun mapKey!57880 () (_ BitVec 32))

(declare-datatypes ((array!91738 0))(
  ( (array!91739 (arr!44325 (Array (_ BitVec 32) ValueCell!17826)) (size!44875 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91738)

(assert (=> mapNonEmpty!57880 (= (arr!44325 _values!1303) (store mapRest!57880 mapKey!57880 mapValue!57880))))

(declare-fun b!1346131 () Bool)

(declare-fun tp_is_empty!37449 () Bool)

(assert (=> b!1346131 (= e!765925 tp_is_empty!37449)))

(declare-fun b!1346132 () Bool)

(declare-fun res!893234 () Bool)

(assert (=> b!1346132 (=> (not res!893234) (not e!765926))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1346132 (= res!893234 (and (= (size!44875 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44874 _keys!1571) (size!44875 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1346133 () Bool)

(declare-fun res!893233 () Bool)

(assert (=> b!1346133 (=> (not res!893233) (not e!765926))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1346133 (= res!893233 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44874 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!893235 () Bool)

(assert (=> start!113398 (=> (not res!893235) (not e!765926))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113398 (= res!893235 (validMask!0 mask!1977))))

(assert (=> start!113398 e!765926))

(assert (=> start!113398 tp_is_empty!37449))

(assert (=> start!113398 true))

(declare-fun array_inv!33401 (array!91736) Bool)

(assert (=> start!113398 (array_inv!33401 _keys!1571)))

(declare-fun e!765929 () Bool)

(declare-fun array_inv!33402 (array!91738) Bool)

(assert (=> start!113398 (and (array_inv!33402 _values!1303) e!765929)))

(assert (=> start!113398 tp!110152))

(declare-fun mapIsEmpty!57880 () Bool)

(assert (=> mapIsEmpty!57880 mapRes!57880))

(declare-fun b!1346134 () Bool)

(declare-fun res!893231 () Bool)

(assert (=> b!1346134 (=> (not res!893231) (not e!765926))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91736 (_ BitVec 32)) Bool)

(assert (=> b!1346134 (= res!893231 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1346135 () Bool)

(assert (=> b!1346135 (= e!765926 false)))

(declare-fun minValue!1245 () V!55035)

(declare-fun lt!595476 () Bool)

(declare-fun zeroValue!1245 () V!55035)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24234 0))(
  ( (tuple2!24235 (_1!12128 (_ BitVec 64)) (_2!12128 V!55035)) )
))
(declare-datatypes ((List!31390 0))(
  ( (Nil!31387) (Cons!31386 (h!32595 tuple2!24234) (t!45980 List!31390)) )
))
(declare-datatypes ((ListLongMap!21891 0))(
  ( (ListLongMap!21892 (toList!10961 List!31390)) )
))
(declare-fun contains!9137 (ListLongMap!21891 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5913 (array!91736 array!91738 (_ BitVec 32) (_ BitVec 32) V!55035 V!55035 (_ BitVec 32) Int) ListLongMap!21891)

(assert (=> b!1346135 (= lt!595476 (contains!9137 (getCurrentListMap!5913 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1346136 () Bool)

(declare-fun e!765928 () Bool)

(assert (=> b!1346136 (= e!765928 tp_is_empty!37449)))

(declare-fun b!1346137 () Bool)

(assert (=> b!1346137 (= e!765929 (and e!765928 mapRes!57880))))

(declare-fun condMapEmpty!57880 () Bool)

(declare-fun mapDefault!57880 () ValueCell!17826)

(assert (=> b!1346137 (= condMapEmpty!57880 (= (arr!44325 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17826)) mapDefault!57880)))))

(assert (= (and start!113398 res!893235) b!1346132))

(assert (= (and b!1346132 res!893234) b!1346134))

(assert (= (and b!1346134 res!893231) b!1346130))

(assert (= (and b!1346130 res!893232) b!1346133))

(assert (= (and b!1346133 res!893233) b!1346135))

(assert (= (and b!1346137 condMapEmpty!57880) mapIsEmpty!57880))

(assert (= (and b!1346137 (not condMapEmpty!57880)) mapNonEmpty!57880))

(get-info :version)

(assert (= (and mapNonEmpty!57880 ((_ is ValueCellFull!17826) mapValue!57880)) b!1346131))

(assert (= (and b!1346137 ((_ is ValueCellFull!17826) mapDefault!57880)) b!1346136))

(assert (= start!113398 b!1346137))

(declare-fun m!1233383 () Bool)

(assert (=> start!113398 m!1233383))

(declare-fun m!1233385 () Bool)

(assert (=> start!113398 m!1233385))

(declare-fun m!1233387 () Bool)

(assert (=> start!113398 m!1233387))

(declare-fun m!1233389 () Bool)

(assert (=> mapNonEmpty!57880 m!1233389))

(declare-fun m!1233391 () Bool)

(assert (=> b!1346135 m!1233391))

(assert (=> b!1346135 m!1233391))

(declare-fun m!1233393 () Bool)

(assert (=> b!1346135 m!1233393))

(declare-fun m!1233395 () Bool)

(assert (=> b!1346134 m!1233395))

(declare-fun m!1233397 () Bool)

(assert (=> b!1346130 m!1233397))

(check-sat b_and!50737 (not b!1346130) (not mapNonEmpty!57880) (not start!113398) (not b_next!31449) (not b!1346135) tp_is_empty!37449 (not b!1346134))
(check-sat b_and!50737 (not b_next!31449))
