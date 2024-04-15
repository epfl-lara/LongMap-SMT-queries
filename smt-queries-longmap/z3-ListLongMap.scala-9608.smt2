; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113594 () Bool)

(assert start!113594)

(declare-fun b_free!31561 () Bool)

(declare-fun b_next!31561 () Bool)

(assert (=> start!113594 (= b_free!31561 (not b_next!31561))))

(declare-fun tp!110495 () Bool)

(declare-fun b_and!50901 () Bool)

(assert (=> start!113594 (= tp!110495 b_and!50901)))

(declare-fun b!1348414 () Bool)

(declare-fun res!894669 () Bool)

(declare-fun e!767097 () Bool)

(assert (=> b!1348414 (=> (not res!894669) (not e!767097))))

(declare-datatypes ((array!91901 0))(
  ( (array!91902 (arr!44405 (Array (_ BitVec 32) (_ BitVec 64))) (size!44957 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91901)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91901 (_ BitVec 32)) Bool)

(assert (=> b!1348414 (= res!894669 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1348415 () Bool)

(declare-fun res!894672 () Bool)

(assert (=> b!1348415 (=> (not res!894672) (not e!767097))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1348415 (= res!894672 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44957 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1348416 () Bool)

(assert (=> b!1348416 (= e!767097 false)))

(declare-datatypes ((V!55185 0))(
  ( (V!55186 (val!18855 Int)) )
))
(declare-fun minValue!1245 () V!55185)

(declare-fun lt!595985 () Bool)

(declare-fun zeroValue!1245 () V!55185)

(declare-datatypes ((ValueCell!17882 0))(
  ( (ValueCellFull!17882 (v!21506 V!55185)) (EmptyCell!17882) )
))
(declare-datatypes ((array!91903 0))(
  ( (array!91904 (arr!44406 (Array (_ BitVec 32) ValueCell!17882)) (size!44958 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91903)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24386 0))(
  ( (tuple2!24387 (_1!12204 (_ BitVec 64)) (_2!12204 V!55185)) )
))
(declare-datatypes ((List!31519 0))(
  ( (Nil!31516) (Cons!31515 (h!32724 tuple2!24386) (t!46149 List!31519)) )
))
(declare-datatypes ((ListLongMap!22043 0))(
  ( (ListLongMap!22044 (toList!11037 List!31519)) )
))
(declare-fun contains!9144 (ListLongMap!22043 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5869 (array!91901 array!91903 (_ BitVec 32) (_ BitVec 32) V!55185 V!55185 (_ BitVec 32) Int) ListLongMap!22043)

(assert (=> b!1348416 (= lt!595985 (contains!9144 (getCurrentListMap!5869 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1348417 () Bool)

(declare-fun res!894668 () Bool)

(assert (=> b!1348417 (=> (not res!894668) (not e!767097))))

(declare-datatypes ((List!31520 0))(
  ( (Nil!31517) (Cons!31516 (h!32725 (_ BitVec 64)) (t!46150 List!31520)) )
))
(declare-fun arrayNoDuplicates!0 (array!91901 (_ BitVec 32) List!31520) Bool)

(assert (=> b!1348417 (= res!894668 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31517))))

(declare-fun b!1348418 () Bool)

(declare-fun e!767099 () Bool)

(declare-fun tp_is_empty!37561 () Bool)

(assert (=> b!1348418 (= e!767099 tp_is_empty!37561)))

(declare-fun mapNonEmpty!58055 () Bool)

(declare-fun mapRes!58055 () Bool)

(declare-fun tp!110496 () Bool)

(assert (=> mapNonEmpty!58055 (= mapRes!58055 (and tp!110496 e!767099))))

(declare-fun mapValue!58055 () ValueCell!17882)

(declare-fun mapKey!58055 () (_ BitVec 32))

(declare-fun mapRest!58055 () (Array (_ BitVec 32) ValueCell!17882))

(assert (=> mapNonEmpty!58055 (= (arr!44406 _values!1303) (store mapRest!58055 mapKey!58055 mapValue!58055))))

(declare-fun b!1348419 () Bool)

(declare-fun res!894670 () Bool)

(assert (=> b!1348419 (=> (not res!894670) (not e!767097))))

(assert (=> b!1348419 (= res!894670 (and (= (size!44958 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44957 _keys!1571) (size!44958 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!58055 () Bool)

(assert (=> mapIsEmpty!58055 mapRes!58055))

(declare-fun b!1348420 () Bool)

(declare-fun e!767098 () Bool)

(declare-fun e!767096 () Bool)

(assert (=> b!1348420 (= e!767098 (and e!767096 mapRes!58055))))

(declare-fun condMapEmpty!58055 () Bool)

(declare-fun mapDefault!58055 () ValueCell!17882)

(assert (=> b!1348420 (= condMapEmpty!58055 (= (arr!44406 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17882)) mapDefault!58055)))))

(declare-fun res!894671 () Bool)

(assert (=> start!113594 (=> (not res!894671) (not e!767097))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113594 (= res!894671 (validMask!0 mask!1977))))

(assert (=> start!113594 e!767097))

(assert (=> start!113594 tp_is_empty!37561))

(assert (=> start!113594 true))

(declare-fun array_inv!33649 (array!91901) Bool)

(assert (=> start!113594 (array_inv!33649 _keys!1571)))

(declare-fun array_inv!33650 (array!91903) Bool)

(assert (=> start!113594 (and (array_inv!33650 _values!1303) e!767098)))

(assert (=> start!113594 tp!110495))

(declare-fun b!1348421 () Bool)

(assert (=> b!1348421 (= e!767096 tp_is_empty!37561)))

(assert (= (and start!113594 res!894671) b!1348419))

(assert (= (and b!1348419 res!894670) b!1348414))

(assert (= (and b!1348414 res!894669) b!1348417))

(assert (= (and b!1348417 res!894668) b!1348415))

(assert (= (and b!1348415 res!894672) b!1348416))

(assert (= (and b!1348420 condMapEmpty!58055) mapIsEmpty!58055))

(assert (= (and b!1348420 (not condMapEmpty!58055)) mapNonEmpty!58055))

(get-info :version)

(assert (= (and mapNonEmpty!58055 ((_ is ValueCellFull!17882) mapValue!58055)) b!1348418))

(assert (= (and b!1348420 ((_ is ValueCellFull!17882) mapDefault!58055)) b!1348421))

(assert (= start!113594 b!1348420))

(declare-fun m!1235055 () Bool)

(assert (=> b!1348416 m!1235055))

(assert (=> b!1348416 m!1235055))

(declare-fun m!1235057 () Bool)

(assert (=> b!1348416 m!1235057))

(declare-fun m!1235059 () Bool)

(assert (=> b!1348414 m!1235059))

(declare-fun m!1235061 () Bool)

(assert (=> b!1348417 m!1235061))

(declare-fun m!1235063 () Bool)

(assert (=> start!113594 m!1235063))

(declare-fun m!1235065 () Bool)

(assert (=> start!113594 m!1235065))

(declare-fun m!1235067 () Bool)

(assert (=> start!113594 m!1235067))

(declare-fun m!1235069 () Bool)

(assert (=> mapNonEmpty!58055 m!1235069))

(check-sat b_and!50901 (not start!113594) (not b_next!31561) (not b!1348414) (not b!1348416) (not b!1348417) (not mapNonEmpty!58055) tp_is_empty!37561)
(check-sat b_and!50901 (not b_next!31561))
