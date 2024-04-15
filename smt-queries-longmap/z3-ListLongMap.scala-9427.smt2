; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112170 () Bool)

(assert start!112170)

(declare-fun b_free!30565 () Bool)

(declare-fun b_next!30565 () Bool)

(assert (=> start!112170 (= b_free!30565 (not b_next!30565))))

(declare-fun tp!107332 () Bool)

(declare-fun b_and!49197 () Bool)

(assert (=> start!112170 (= tp!107332 b_and!49197)))

(declare-fun mapNonEmpty!56386 () Bool)

(declare-fun mapRes!56386 () Bool)

(declare-fun tp!107333 () Bool)

(declare-fun e!757406 () Bool)

(assert (=> mapNonEmpty!56386 (= mapRes!56386 (and tp!107333 e!757406))))

(declare-fun mapKey!56386 () (_ BitVec 32))

(declare-datatypes ((V!53737 0))(
  ( (V!53738 (val!18312 Int)) )
))
(declare-datatypes ((ValueCell!17339 0))(
  ( (ValueCellFull!17339 (v!20948 V!53737)) (EmptyCell!17339) )
))
(declare-datatypes ((array!89779 0))(
  ( (array!89780 (arr!43356 (Array (_ BitVec 32) ValueCell!17339)) (size!43908 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89779)

(declare-fun mapRest!56386 () (Array (_ BitVec 32) ValueCell!17339))

(declare-fun mapValue!56386 () ValueCell!17339)

(assert (=> mapNonEmpty!56386 (= (arr!43356 _values!1320) (store mapRest!56386 mapKey!56386 mapValue!56386))))

(declare-fun b!1328402 () Bool)

(declare-fun e!757407 () Bool)

(assert (=> b!1328402 (= e!757407 false)))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!89781 0))(
  ( (array!89782 (arr!43357 (Array (_ BitVec 32) (_ BitVec 64))) (size!43909 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89781)

(declare-fun defaultEntry!1323 () Int)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun lt!590659 () Bool)

(declare-fun minValue!1262 () V!53737)

(declare-fun zeroValue!1262 () V!53737)

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((tuple2!23630 0))(
  ( (tuple2!23631 (_1!11826 (_ BitVec 64)) (_2!11826 V!53737)) )
))
(declare-datatypes ((List!30779 0))(
  ( (Nil!30776) (Cons!30775 (h!31984 tuple2!23630) (t!44777 List!30779)) )
))
(declare-datatypes ((ListLongMap!21287 0))(
  ( (ListLongMap!21288 (toList!10659 List!30779)) )
))
(declare-fun contains!8751 (ListLongMap!21287 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5531 (array!89781 array!89779 (_ BitVec 32) (_ BitVec 32) V!53737 V!53737 (_ BitVec 32) Int) ListLongMap!21287)

(assert (=> b!1328402 (= lt!590659 (contains!8751 (getCurrentListMap!5531 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1328403 () Bool)

(declare-fun tp_is_empty!36475 () Bool)

(assert (=> b!1328403 (= e!757406 tp_is_empty!36475)))

(declare-fun b!1328404 () Bool)

(declare-fun res!881404 () Bool)

(assert (=> b!1328404 (=> (not res!881404) (not e!757407))))

(assert (=> b!1328404 (= res!881404 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!43909 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1328405 () Bool)

(declare-fun res!881403 () Bool)

(assert (=> b!1328405 (=> (not res!881403) (not e!757407))))

(declare-datatypes ((List!30780 0))(
  ( (Nil!30777) (Cons!30776 (h!31985 (_ BitVec 64)) (t!44778 List!30780)) )
))
(declare-fun arrayNoDuplicates!0 (array!89781 (_ BitVec 32) List!30780) Bool)

(assert (=> b!1328405 (= res!881403 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30777))))

(declare-fun b!1328406 () Bool)

(declare-fun res!881401 () Bool)

(assert (=> b!1328406 (=> (not res!881401) (not e!757407))))

(assert (=> b!1328406 (= res!881401 (and (= (size!43908 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43909 _keys!1590) (size!43908 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1328407 () Bool)

(declare-fun e!757404 () Bool)

(assert (=> b!1328407 (= e!757404 tp_is_empty!36475)))

(declare-fun b!1328408 () Bool)

(declare-fun res!881402 () Bool)

(assert (=> b!1328408 (=> (not res!881402) (not e!757407))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89781 (_ BitVec 32)) Bool)

(assert (=> b!1328408 (= res!881402 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun res!881400 () Bool)

(assert (=> start!112170 (=> (not res!881400) (not e!757407))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112170 (= res!881400 (validMask!0 mask!1998))))

(assert (=> start!112170 e!757407))

(declare-fun e!757408 () Bool)

(declare-fun array_inv!32885 (array!89779) Bool)

(assert (=> start!112170 (and (array_inv!32885 _values!1320) e!757408)))

(assert (=> start!112170 true))

(declare-fun array_inv!32886 (array!89781) Bool)

(assert (=> start!112170 (array_inv!32886 _keys!1590)))

(assert (=> start!112170 tp!107332))

(assert (=> start!112170 tp_is_empty!36475))

(declare-fun mapIsEmpty!56386 () Bool)

(assert (=> mapIsEmpty!56386 mapRes!56386))

(declare-fun b!1328409 () Bool)

(assert (=> b!1328409 (= e!757408 (and e!757404 mapRes!56386))))

(declare-fun condMapEmpty!56386 () Bool)

(declare-fun mapDefault!56386 () ValueCell!17339)

(assert (=> b!1328409 (= condMapEmpty!56386 (= (arr!43356 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17339)) mapDefault!56386)))))

(assert (= (and start!112170 res!881400) b!1328406))

(assert (= (and b!1328406 res!881401) b!1328408))

(assert (= (and b!1328408 res!881402) b!1328405))

(assert (= (and b!1328405 res!881403) b!1328404))

(assert (= (and b!1328404 res!881404) b!1328402))

(assert (= (and b!1328409 condMapEmpty!56386) mapIsEmpty!56386))

(assert (= (and b!1328409 (not condMapEmpty!56386)) mapNonEmpty!56386))

(get-info :version)

(assert (= (and mapNonEmpty!56386 ((_ is ValueCellFull!17339) mapValue!56386)) b!1328403))

(assert (= (and b!1328409 ((_ is ValueCellFull!17339) mapDefault!56386)) b!1328407))

(assert (= start!112170 b!1328409))

(declare-fun m!1216917 () Bool)

(assert (=> mapNonEmpty!56386 m!1216917))

(declare-fun m!1216919 () Bool)

(assert (=> start!112170 m!1216919))

(declare-fun m!1216921 () Bool)

(assert (=> start!112170 m!1216921))

(declare-fun m!1216923 () Bool)

(assert (=> start!112170 m!1216923))

(declare-fun m!1216925 () Bool)

(assert (=> b!1328405 m!1216925))

(declare-fun m!1216927 () Bool)

(assert (=> b!1328402 m!1216927))

(assert (=> b!1328402 m!1216927))

(declare-fun m!1216929 () Bool)

(assert (=> b!1328402 m!1216929))

(declare-fun m!1216931 () Bool)

(assert (=> b!1328408 m!1216931))

(check-sat tp_is_empty!36475 (not b!1328408) (not start!112170) b_and!49197 (not b!1328402) (not b!1328405) (not b_next!30565) (not mapNonEmpty!56386))
(check-sat b_and!49197 (not b_next!30565))
