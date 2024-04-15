; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112410 () Bool)

(assert start!112410)

(declare-fun b_free!30805 () Bool)

(declare-fun b_next!30805 () Bool)

(assert (=> start!112410 (= b_free!30805 (not b_next!30805))))

(declare-fun tp!108053 () Bool)

(declare-fun b_and!49629 () Bool)

(assert (=> start!112410 (= tp!108053 b_and!49629)))

(declare-fun b!1332653 () Bool)

(declare-fun e!759204 () Bool)

(declare-fun e!759205 () Bool)

(declare-fun mapRes!56746 () Bool)

(assert (=> b!1332653 (= e!759204 (and e!759205 mapRes!56746))))

(declare-fun condMapEmpty!56746 () Bool)

(declare-datatypes ((V!54057 0))(
  ( (V!54058 (val!18432 Int)) )
))
(declare-datatypes ((ValueCell!17459 0))(
  ( (ValueCellFull!17459 (v!21068 V!54057)) (EmptyCell!17459) )
))
(declare-datatypes ((array!90247 0))(
  ( (array!90248 (arr!43590 (Array (_ BitVec 32) ValueCell!17459)) (size!44142 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90247)

(declare-fun mapDefault!56746 () ValueCell!17459)

(assert (=> b!1332653 (= condMapEmpty!56746 (= (arr!43590 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17459)) mapDefault!56746)))))

(declare-fun b!1332654 () Bool)

(declare-fun res!884381 () Bool)

(declare-fun e!759208 () Bool)

(assert (=> b!1332654 (=> (not res!884381) (not e!759208))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90249 0))(
  ( (array!90250 (arr!43591 (Array (_ BitVec 32) (_ BitVec 64))) (size!44143 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90249)

(assert (=> b!1332654 (= res!884381 (and (= (size!44142 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44143 _keys!1590) (size!44142 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1332655 () Bool)

(declare-fun res!884382 () Bool)

(assert (=> b!1332655 (=> (not res!884382) (not e!759208))))

(declare-datatypes ((List!30959 0))(
  ( (Nil!30956) (Cons!30955 (h!32164 (_ BitVec 64)) (t!45149 List!30959)) )
))
(declare-fun arrayNoDuplicates!0 (array!90249 (_ BitVec 32) List!30959) Bool)

(assert (=> b!1332655 (= res!884382 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30956))))

(declare-fun res!884383 () Bool)

(assert (=> start!112410 (=> (not res!884383) (not e!759208))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112410 (= res!884383 (validMask!0 mask!1998))))

(assert (=> start!112410 e!759208))

(declare-fun array_inv!33069 (array!90247) Bool)

(assert (=> start!112410 (and (array_inv!33069 _values!1320) e!759204)))

(assert (=> start!112410 true))

(declare-fun array_inv!33070 (array!90249) Bool)

(assert (=> start!112410 (array_inv!33070 _keys!1590)))

(assert (=> start!112410 tp!108053))

(declare-fun tp_is_empty!36715 () Bool)

(assert (=> start!112410 tp_is_empty!36715))

(declare-fun b!1332656 () Bool)

(assert (=> b!1332656 (= e!759205 tp_is_empty!36715)))

(declare-fun mapNonEmpty!56746 () Bool)

(declare-fun tp!108052 () Bool)

(declare-fun e!759206 () Bool)

(assert (=> mapNonEmpty!56746 (= mapRes!56746 (and tp!108052 e!759206))))

(declare-fun mapValue!56746 () ValueCell!17459)

(declare-fun mapKey!56746 () (_ BitVec 32))

(declare-fun mapRest!56746 () (Array (_ BitVec 32) ValueCell!17459))

(assert (=> mapNonEmpty!56746 (= (arr!43590 _values!1320) (store mapRest!56746 mapKey!56746 mapValue!56746))))

(declare-fun b!1332657 () Bool)

(assert (=> b!1332657 (= e!759208 false)))

(declare-fun defaultEntry!1323 () Int)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun lt!591874 () Bool)

(declare-fun minValue!1262 () V!54057)

(declare-fun zeroValue!1262 () V!54057)

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((tuple2!23824 0))(
  ( (tuple2!23825 (_1!11923 (_ BitVec 64)) (_2!11923 V!54057)) )
))
(declare-datatypes ((List!30960 0))(
  ( (Nil!30957) (Cons!30956 (h!32165 tuple2!23824) (t!45150 List!30960)) )
))
(declare-datatypes ((ListLongMap!21481 0))(
  ( (ListLongMap!21482 (toList!10756 List!30960)) )
))
(declare-fun contains!8848 (ListLongMap!21481 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5616 (array!90249 array!90247 (_ BitVec 32) (_ BitVec 32) V!54057 V!54057 (_ BitVec 32) Int) ListLongMap!21481)

(assert (=> b!1332657 (= lt!591874 (contains!8848 (getCurrentListMap!5616 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1332658 () Bool)

(assert (=> b!1332658 (= e!759206 tp_is_empty!36715)))

(declare-fun mapIsEmpty!56746 () Bool)

(assert (=> mapIsEmpty!56746 mapRes!56746))

(declare-fun b!1332659 () Bool)

(declare-fun res!884379 () Bool)

(assert (=> b!1332659 (=> (not res!884379) (not e!759208))))

(assert (=> b!1332659 (= res!884379 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44143 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1332660 () Bool)

(declare-fun res!884380 () Bool)

(assert (=> b!1332660 (=> (not res!884380) (not e!759208))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90249 (_ BitVec 32)) Bool)

(assert (=> b!1332660 (= res!884380 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(assert (= (and start!112410 res!884383) b!1332654))

(assert (= (and b!1332654 res!884381) b!1332660))

(assert (= (and b!1332660 res!884380) b!1332655))

(assert (= (and b!1332655 res!884382) b!1332659))

(assert (= (and b!1332659 res!884379) b!1332657))

(assert (= (and b!1332653 condMapEmpty!56746) mapIsEmpty!56746))

(assert (= (and b!1332653 (not condMapEmpty!56746)) mapNonEmpty!56746))

(get-info :version)

(assert (= (and mapNonEmpty!56746 ((_ is ValueCellFull!17459) mapValue!56746)) b!1332658))

(assert (= (and b!1332653 ((_ is ValueCellFull!17459) mapDefault!56746)) b!1332656))

(assert (= start!112410 b!1332653))

(declare-fun m!1220967 () Bool)

(assert (=> b!1332657 m!1220967))

(assert (=> b!1332657 m!1220967))

(declare-fun m!1220969 () Bool)

(assert (=> b!1332657 m!1220969))

(declare-fun m!1220971 () Bool)

(assert (=> b!1332655 m!1220971))

(declare-fun m!1220973 () Bool)

(assert (=> mapNonEmpty!56746 m!1220973))

(declare-fun m!1220975 () Bool)

(assert (=> b!1332660 m!1220975))

(declare-fun m!1220977 () Bool)

(assert (=> start!112410 m!1220977))

(declare-fun m!1220979 () Bool)

(assert (=> start!112410 m!1220979))

(declare-fun m!1220981 () Bool)

(assert (=> start!112410 m!1220981))

(check-sat (not b_next!30805) tp_is_empty!36715 (not start!112410) (not b!1332660) (not mapNonEmpty!56746) (not b!1332655) (not b!1332657) b_and!49629)
(check-sat b_and!49629 (not b_next!30805))
