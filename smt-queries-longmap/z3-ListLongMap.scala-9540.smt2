; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113104 () Bool)

(assert start!113104)

(declare-fun b_free!31155 () Bool)

(declare-fun b_next!31155 () Bool)

(assert (=> start!113104 (= b_free!31155 (not b_next!31155))))

(declare-fun tp!109269 () Bool)

(declare-fun b_and!50217 () Bool)

(assert (=> start!113104 (= tp!109269 b_and!50217)))

(declare-fun b!1340839 () Bool)

(declare-fun e!763641 () Bool)

(assert (=> b!1340839 (= e!763641 (not true))))

(declare-datatypes ((V!54643 0))(
  ( (V!54644 (val!18652 Int)) )
))
(declare-datatypes ((tuple2!24012 0))(
  ( (tuple2!24013 (_1!12017 (_ BitVec 64)) (_2!12017 V!54643)) )
))
(declare-datatypes ((List!31174 0))(
  ( (Nil!31171) (Cons!31170 (h!32379 tuple2!24012) (t!45540 List!31174)) )
))
(declare-datatypes ((ListLongMap!21669 0))(
  ( (ListLongMap!21670 (toList!10850 List!31174)) )
))
(declare-fun lt!594051 () ListLongMap!21669)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun contains!9026 (ListLongMap!21669 (_ BitVec 64)) Bool)

(assert (=> b!1340839 (contains!9026 lt!594051 k0!1142)))

(declare-datatypes ((Unit!44007 0))(
  ( (Unit!44008) )
))
(declare-fun lt!594050 () Unit!44007)

(declare-fun zeroValue!1245 () V!54643)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!334 ((_ BitVec 64) (_ BitVec 64) V!54643 ListLongMap!21669) Unit!44007)

(assert (=> b!1340839 (= lt!594050 (lemmaInListMapAfterAddingDiffThenInBefore!334 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594051))))

(declare-fun minValue!1245 () V!54643)

(declare-fun defaultEntry!1306 () Int)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91162 0))(
  ( (array!91163 (arr!44037 (Array (_ BitVec 32) (_ BitVec 64))) (size!44587 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91162)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17679 0))(
  ( (ValueCellFull!17679 (v!21300 V!54643)) (EmptyCell!17679) )
))
(declare-datatypes ((array!91164 0))(
  ( (array!91165 (arr!44038 (Array (_ BitVec 32) ValueCell!17679)) (size!44588 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91164)

(declare-fun +!4765 (ListLongMap!21669 tuple2!24012) ListLongMap!21669)

(declare-fun getCurrentListMapNoExtraKeys!6407 (array!91162 array!91164 (_ BitVec 32) (_ BitVec 32) V!54643 V!54643 (_ BitVec 32) Int) ListLongMap!21669)

(declare-fun get!22222 (ValueCell!17679 V!54643) V!54643)

(declare-fun dynLambda!3704 (Int (_ BitVec 64)) V!54643)

(assert (=> b!1340839 (= lt!594051 (+!4765 (getCurrentListMapNoExtraKeys!6407 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24013 (select (arr!44037 _keys!1571) from!1960) (get!22222 (select (arr!44038 _values!1303) from!1960) (dynLambda!3704 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1340840 () Bool)

(declare-fun res!889492 () Bool)

(assert (=> b!1340840 (=> (not res!889492) (not e!763641))))

(assert (=> b!1340840 (= res!889492 (not (= (select (arr!44037 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1340841 () Bool)

(declare-fun res!889494 () Bool)

(assert (=> b!1340841 (=> (not res!889494) (not e!763641))))

(declare-fun getCurrentListMap!5817 (array!91162 array!91164 (_ BitVec 32) (_ BitVec 32) V!54643 V!54643 (_ BitVec 32) Int) ListLongMap!21669)

(assert (=> b!1340841 (= res!889494 (contains!9026 (getCurrentListMap!5817 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun mapNonEmpty!57439 () Bool)

(declare-fun mapRes!57439 () Bool)

(declare-fun tp!109270 () Bool)

(declare-fun e!763640 () Bool)

(assert (=> mapNonEmpty!57439 (= mapRes!57439 (and tp!109270 e!763640))))

(declare-fun mapKey!57439 () (_ BitVec 32))

(declare-fun mapRest!57439 () (Array (_ BitVec 32) ValueCell!17679))

(declare-fun mapValue!57439 () ValueCell!17679)

(assert (=> mapNonEmpty!57439 (= (arr!44038 _values!1303) (store mapRest!57439 mapKey!57439 mapValue!57439))))

(declare-fun b!1340842 () Bool)

(declare-fun res!889490 () Bool)

(assert (=> b!1340842 (=> (not res!889490) (not e!763641))))

(assert (=> b!1340842 (= res!889490 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44587 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!889497 () Bool)

(assert (=> start!113104 (=> (not res!889497) (not e!763641))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113104 (= res!889497 (validMask!0 mask!1977))))

(assert (=> start!113104 e!763641))

(declare-fun tp_is_empty!37155 () Bool)

(assert (=> start!113104 tp_is_empty!37155))

(assert (=> start!113104 true))

(declare-fun array_inv!33203 (array!91162) Bool)

(assert (=> start!113104 (array_inv!33203 _keys!1571)))

(declare-fun e!763642 () Bool)

(declare-fun array_inv!33204 (array!91164) Bool)

(assert (=> start!113104 (and (array_inv!33204 _values!1303) e!763642)))

(assert (=> start!113104 tp!109269))

(declare-fun b!1340843 () Bool)

(declare-fun res!889495 () Bool)

(assert (=> b!1340843 (=> (not res!889495) (not e!763641))))

(declare-datatypes ((List!31175 0))(
  ( (Nil!31172) (Cons!31171 (h!32380 (_ BitVec 64)) (t!45541 List!31175)) )
))
(declare-fun arrayNoDuplicates!0 (array!91162 (_ BitVec 32) List!31175) Bool)

(assert (=> b!1340843 (= res!889495 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31172))))

(declare-fun b!1340844 () Bool)

(declare-fun res!889493 () Bool)

(assert (=> b!1340844 (=> (not res!889493) (not e!763641))))

(assert (=> b!1340844 (= res!889493 (and (= (size!44588 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44587 _keys!1571) (size!44588 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1340845 () Bool)

(declare-fun res!889489 () Bool)

(assert (=> b!1340845 (=> (not res!889489) (not e!763641))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1340845 (= res!889489 (validKeyInArray!0 (select (arr!44037 _keys!1571) from!1960)))))

(declare-fun b!1340846 () Bool)

(assert (=> b!1340846 (= e!763640 tp_is_empty!37155)))

(declare-fun b!1340847 () Bool)

(declare-fun e!763643 () Bool)

(assert (=> b!1340847 (= e!763643 tp_is_empty!37155)))

(declare-fun b!1340848 () Bool)

(declare-fun res!889491 () Bool)

(assert (=> b!1340848 (=> (not res!889491) (not e!763641))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91162 (_ BitVec 32)) Bool)

(assert (=> b!1340848 (= res!889491 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1340849 () Bool)

(declare-fun res!889496 () Bool)

(assert (=> b!1340849 (=> (not res!889496) (not e!763641))))

(assert (=> b!1340849 (= res!889496 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!57439 () Bool)

(assert (=> mapIsEmpty!57439 mapRes!57439))

(declare-fun b!1340850 () Bool)

(assert (=> b!1340850 (= e!763642 (and e!763643 mapRes!57439))))

(declare-fun condMapEmpty!57439 () Bool)

(declare-fun mapDefault!57439 () ValueCell!17679)

(assert (=> b!1340850 (= condMapEmpty!57439 (= (arr!44038 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17679)) mapDefault!57439)))))

(assert (= (and start!113104 res!889497) b!1340844))

(assert (= (and b!1340844 res!889493) b!1340848))

(assert (= (and b!1340848 res!889491) b!1340843))

(assert (= (and b!1340843 res!889495) b!1340842))

(assert (= (and b!1340842 res!889490) b!1340841))

(assert (= (and b!1340841 res!889494) b!1340840))

(assert (= (and b!1340840 res!889492) b!1340845))

(assert (= (and b!1340845 res!889489) b!1340849))

(assert (= (and b!1340849 res!889496) b!1340839))

(assert (= (and b!1340850 condMapEmpty!57439) mapIsEmpty!57439))

(assert (= (and b!1340850 (not condMapEmpty!57439)) mapNonEmpty!57439))

(get-info :version)

(assert (= (and mapNonEmpty!57439 ((_ is ValueCellFull!17679) mapValue!57439)) b!1340846))

(assert (= (and b!1340850 ((_ is ValueCellFull!17679) mapDefault!57439)) b!1340847))

(assert (= start!113104 b!1340850))

(declare-fun b_lambda!24331 () Bool)

(assert (=> (not b_lambda!24331) (not b!1340839)))

(declare-fun t!45539 () Bool)

(declare-fun tb!12169 () Bool)

(assert (=> (and start!113104 (= defaultEntry!1306 defaultEntry!1306) t!45539) tb!12169))

(declare-fun result!25429 () Bool)

(assert (=> tb!12169 (= result!25429 tp_is_empty!37155)))

(assert (=> b!1340839 t!45539))

(declare-fun b_and!50219 () Bool)

(assert (= b_and!50217 (and (=> t!45539 result!25429) b_and!50219)))

(declare-fun m!1228553 () Bool)

(assert (=> mapNonEmpty!57439 m!1228553))

(declare-fun m!1228555 () Bool)

(assert (=> start!113104 m!1228555))

(declare-fun m!1228557 () Bool)

(assert (=> start!113104 m!1228557))

(declare-fun m!1228559 () Bool)

(assert (=> start!113104 m!1228559))

(declare-fun m!1228561 () Bool)

(assert (=> b!1340841 m!1228561))

(assert (=> b!1340841 m!1228561))

(declare-fun m!1228563 () Bool)

(assert (=> b!1340841 m!1228563))

(declare-fun m!1228565 () Bool)

(assert (=> b!1340845 m!1228565))

(assert (=> b!1340845 m!1228565))

(declare-fun m!1228567 () Bool)

(assert (=> b!1340845 m!1228567))

(declare-fun m!1228569 () Bool)

(assert (=> b!1340839 m!1228569))

(declare-fun m!1228571 () Bool)

(assert (=> b!1340839 m!1228571))

(declare-fun m!1228573 () Bool)

(assert (=> b!1340839 m!1228573))

(declare-fun m!1228575 () Bool)

(assert (=> b!1340839 m!1228575))

(assert (=> b!1340839 m!1228569))

(declare-fun m!1228577 () Bool)

(assert (=> b!1340839 m!1228577))

(assert (=> b!1340839 m!1228571))

(assert (=> b!1340839 m!1228573))

(declare-fun m!1228579 () Bool)

(assert (=> b!1340839 m!1228579))

(assert (=> b!1340839 m!1228565))

(declare-fun m!1228581 () Bool)

(assert (=> b!1340839 m!1228581))

(assert (=> b!1340840 m!1228565))

(declare-fun m!1228583 () Bool)

(assert (=> b!1340843 m!1228583))

(declare-fun m!1228585 () Bool)

(assert (=> b!1340848 m!1228585))

(check-sat (not mapNonEmpty!57439) tp_is_empty!37155 (not start!113104) b_and!50219 (not b!1340841) (not b!1340843) (not b_lambda!24331) (not b!1340839) (not b!1340845) (not b!1340848) (not b_next!31155))
(check-sat b_and!50219 (not b_next!31155))
