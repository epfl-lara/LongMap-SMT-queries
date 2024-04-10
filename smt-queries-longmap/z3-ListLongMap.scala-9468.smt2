; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112418 () Bool)

(assert start!112418)

(declare-fun b_free!30813 () Bool)

(declare-fun b_next!30813 () Bool)

(assert (=> start!112418 (= b_free!30813 (not b_next!30813))))

(declare-fun tp!108076 () Bool)

(declare-fun b_and!49655 () Bool)

(assert (=> start!112418 (= tp!108076 b_and!49655)))

(declare-fun res!884469 () Bool)

(declare-fun e!759301 () Bool)

(assert (=> start!112418 (=> (not res!884469) (not e!759301))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112418 (= res!884469 (validMask!0 mask!1998))))

(assert (=> start!112418 e!759301))

(declare-datatypes ((V!54067 0))(
  ( (V!54068 (val!18436 Int)) )
))
(declare-datatypes ((ValueCell!17463 0))(
  ( (ValueCellFull!17463 (v!21073 V!54067)) (EmptyCell!17463) )
))
(declare-datatypes ((array!90322 0))(
  ( (array!90323 (arr!43627 (Array (_ BitVec 32) ValueCell!17463)) (size!44177 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90322)

(declare-fun e!759300 () Bool)

(declare-fun array_inv!32909 (array!90322) Bool)

(assert (=> start!112418 (and (array_inv!32909 _values!1320) e!759300)))

(assert (=> start!112418 true))

(declare-datatypes ((array!90324 0))(
  ( (array!90325 (arr!43628 (Array (_ BitVec 32) (_ BitVec 64))) (size!44178 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90324)

(declare-fun array_inv!32910 (array!90324) Bool)

(assert (=> start!112418 (array_inv!32910 _keys!1590)))

(assert (=> start!112418 tp!108076))

(declare-fun tp_is_empty!36723 () Bool)

(assert (=> start!112418 tp_is_empty!36723))

(declare-fun b!1332819 () Bool)

(declare-fun e!759299 () Bool)

(assert (=> b!1332819 (= e!759299 tp_is_empty!36723)))

(declare-fun mapNonEmpty!56758 () Bool)

(declare-fun mapRes!56758 () Bool)

(declare-fun tp!108075 () Bool)

(declare-fun e!759297 () Bool)

(assert (=> mapNonEmpty!56758 (= mapRes!56758 (and tp!108075 e!759297))))

(declare-fun mapValue!56758 () ValueCell!17463)

(declare-fun mapKey!56758 () (_ BitVec 32))

(declare-fun mapRest!56758 () (Array (_ BitVec 32) ValueCell!17463))

(assert (=> mapNonEmpty!56758 (= (arr!43627 _values!1320) (store mapRest!56758 mapKey!56758 mapValue!56758))))

(declare-fun b!1332820 () Bool)

(assert (=> b!1332820 (= e!759301 false)))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun lt!592072 () Bool)

(declare-fun minValue!1262 () V!54067)

(declare-fun zeroValue!1262 () V!54067)

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((tuple2!23760 0))(
  ( (tuple2!23761 (_1!11891 (_ BitVec 64)) (_2!11891 V!54067)) )
))
(declare-datatypes ((List!30904 0))(
  ( (Nil!30901) (Cons!30900 (h!32109 tuple2!23760) (t!45102 List!30904)) )
))
(declare-datatypes ((ListLongMap!21417 0))(
  ( (ListLongMap!21418 (toList!10724 List!30904)) )
))
(declare-fun contains!8888 (ListLongMap!21417 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5705 (array!90324 array!90322 (_ BitVec 32) (_ BitVec 32) V!54067 V!54067 (_ BitVec 32) Int) ListLongMap!21417)

(assert (=> b!1332820 (= lt!592072 (contains!8888 (getCurrentListMap!5705 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun mapIsEmpty!56758 () Bool)

(assert (=> mapIsEmpty!56758 mapRes!56758))

(declare-fun b!1332821 () Bool)

(assert (=> b!1332821 (= e!759297 tp_is_empty!36723)))

(declare-fun b!1332822 () Bool)

(declare-fun res!884471 () Bool)

(assert (=> b!1332822 (=> (not res!884471) (not e!759301))))

(assert (=> b!1332822 (= res!884471 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44178 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1332823 () Bool)

(declare-fun res!884472 () Bool)

(assert (=> b!1332823 (=> (not res!884472) (not e!759301))))

(assert (=> b!1332823 (= res!884472 (and (= (size!44177 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44178 _keys!1590) (size!44177 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1332824 () Bool)

(declare-fun res!884468 () Bool)

(assert (=> b!1332824 (=> (not res!884468) (not e!759301))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90324 (_ BitVec 32)) Bool)

(assert (=> b!1332824 (= res!884468 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1332825 () Bool)

(declare-fun res!884470 () Bool)

(assert (=> b!1332825 (=> (not res!884470) (not e!759301))))

(declare-datatypes ((List!30905 0))(
  ( (Nil!30902) (Cons!30901 (h!32110 (_ BitVec 64)) (t!45103 List!30905)) )
))
(declare-fun arrayNoDuplicates!0 (array!90324 (_ BitVec 32) List!30905) Bool)

(assert (=> b!1332825 (= res!884470 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30902))))

(declare-fun b!1332826 () Bool)

(assert (=> b!1332826 (= e!759300 (and e!759299 mapRes!56758))))

(declare-fun condMapEmpty!56758 () Bool)

(declare-fun mapDefault!56758 () ValueCell!17463)

(assert (=> b!1332826 (= condMapEmpty!56758 (= (arr!43627 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17463)) mapDefault!56758)))))

(assert (= (and start!112418 res!884469) b!1332823))

(assert (= (and b!1332823 res!884472) b!1332824))

(assert (= (and b!1332824 res!884468) b!1332825))

(assert (= (and b!1332825 res!884470) b!1332822))

(assert (= (and b!1332822 res!884471) b!1332820))

(assert (= (and b!1332826 condMapEmpty!56758) mapIsEmpty!56758))

(assert (= (and b!1332826 (not condMapEmpty!56758)) mapNonEmpty!56758))

(get-info :version)

(assert (= (and mapNonEmpty!56758 ((_ is ValueCellFull!17463) mapValue!56758)) b!1332821))

(assert (= (and b!1332826 ((_ is ValueCellFull!17463) mapDefault!56758)) b!1332819))

(assert (= start!112418 b!1332826))

(declare-fun m!1221547 () Bool)

(assert (=> mapNonEmpty!56758 m!1221547))

(declare-fun m!1221549 () Bool)

(assert (=> start!112418 m!1221549))

(declare-fun m!1221551 () Bool)

(assert (=> start!112418 m!1221551))

(declare-fun m!1221553 () Bool)

(assert (=> start!112418 m!1221553))

(declare-fun m!1221555 () Bool)

(assert (=> b!1332820 m!1221555))

(assert (=> b!1332820 m!1221555))

(declare-fun m!1221557 () Bool)

(assert (=> b!1332820 m!1221557))

(declare-fun m!1221559 () Bool)

(assert (=> b!1332825 m!1221559))

(declare-fun m!1221561 () Bool)

(assert (=> b!1332824 m!1221561))

(check-sat (not b!1332824) (not start!112418) (not mapNonEmpty!56758) (not b!1332825) (not b!1332820) tp_is_empty!36723 (not b_next!30813) b_and!49655)
(check-sat b_and!49655 (not b_next!30813))
