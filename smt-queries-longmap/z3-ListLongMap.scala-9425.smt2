; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112160 () Bool)

(assert start!112160)

(declare-fun b_free!30555 () Bool)

(declare-fun b_next!30555 () Bool)

(assert (=> start!112160 (= b_free!30555 (not b_next!30555))))

(declare-fun tp!107302 () Bool)

(declare-fun b_and!49205 () Bool)

(assert (=> start!112160 (= tp!107302 b_and!49205)))

(declare-fun mapIsEmpty!56371 () Bool)

(declare-fun mapRes!56371 () Bool)

(assert (=> mapIsEmpty!56371 mapRes!56371))

(declare-fun b!1328352 () Bool)

(declare-fun res!881354 () Bool)

(declare-fun e!757364 () Bool)

(assert (=> b!1328352 (=> (not res!881354) (not e!757364))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!89824 0))(
  ( (array!89825 (arr!43378 (Array (_ BitVec 32) (_ BitVec 64))) (size!43928 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89824)

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1328352 (= res!881354 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!43928 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1328354 () Bool)

(declare-fun res!881358 () Bool)

(assert (=> b!1328354 (=> (not res!881358) (not e!757364))))

(declare-datatypes ((V!53723 0))(
  ( (V!53724 (val!18307 Int)) )
))
(declare-datatypes ((ValueCell!17334 0))(
  ( (ValueCellFull!17334 (v!20944 V!53723)) (EmptyCell!17334) )
))
(declare-datatypes ((array!89826 0))(
  ( (array!89827 (arr!43379 (Array (_ BitVec 32) ValueCell!17334)) (size!43929 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89826)

(declare-fun mask!1998 () (_ BitVec 32))

(assert (=> b!1328354 (= res!881358 (and (= (size!43929 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43928 _keys!1590) (size!43929 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1328355 () Bool)

(declare-fun e!757362 () Bool)

(declare-fun e!757365 () Bool)

(assert (=> b!1328355 (= e!757362 (and e!757365 mapRes!56371))))

(declare-fun condMapEmpty!56371 () Bool)

(declare-fun mapDefault!56371 () ValueCell!17334)

(assert (=> b!1328355 (= condMapEmpty!56371 (= (arr!43379 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17334)) mapDefault!56371)))))

(declare-fun b!1328356 () Bool)

(declare-fun res!881357 () Bool)

(assert (=> b!1328356 (=> (not res!881357) (not e!757364))))

(declare-datatypes ((List!30720 0))(
  ( (Nil!30717) (Cons!30716 (h!31925 (_ BitVec 64)) (t!44726 List!30720)) )
))
(declare-fun arrayNoDuplicates!0 (array!89824 (_ BitVec 32) List!30720) Bool)

(assert (=> b!1328356 (= res!881357 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30717))))

(declare-fun b!1328357 () Bool)

(assert (=> b!1328357 (= e!757364 false)))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!53723)

(declare-fun zeroValue!1262 () V!53723)

(declare-fun lt!590830 () Bool)

(declare-datatypes ((tuple2!23564 0))(
  ( (tuple2!23565 (_1!11793 (_ BitVec 64)) (_2!11793 V!53723)) )
))
(declare-datatypes ((List!30721 0))(
  ( (Nil!30718) (Cons!30717 (h!31926 tuple2!23564) (t!44727 List!30721)) )
))
(declare-datatypes ((ListLongMap!21221 0))(
  ( (ListLongMap!21222 (toList!10626 List!30721)) )
))
(declare-fun contains!8790 (ListLongMap!21221 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5617 (array!89824 array!89826 (_ BitVec 32) (_ BitVec 32) V!53723 V!53723 (_ BitVec 32) Int) ListLongMap!21221)

(assert (=> b!1328357 (= lt!590830 (contains!8790 (getCurrentListMap!5617 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1328358 () Bool)

(declare-fun e!757363 () Bool)

(declare-fun tp_is_empty!36465 () Bool)

(assert (=> b!1328358 (= e!757363 tp_is_empty!36465)))

(declare-fun res!881355 () Bool)

(assert (=> start!112160 (=> (not res!881355) (not e!757364))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112160 (= res!881355 (validMask!0 mask!1998))))

(assert (=> start!112160 e!757364))

(declare-fun array_inv!32731 (array!89826) Bool)

(assert (=> start!112160 (and (array_inv!32731 _values!1320) e!757362)))

(assert (=> start!112160 true))

(declare-fun array_inv!32732 (array!89824) Bool)

(assert (=> start!112160 (array_inv!32732 _keys!1590)))

(assert (=> start!112160 tp!107302))

(assert (=> start!112160 tp_is_empty!36465))

(declare-fun b!1328353 () Bool)

(assert (=> b!1328353 (= e!757365 tp_is_empty!36465)))

(declare-fun mapNonEmpty!56371 () Bool)

(declare-fun tp!107301 () Bool)

(assert (=> mapNonEmpty!56371 (= mapRes!56371 (and tp!107301 e!757363))))

(declare-fun mapKey!56371 () (_ BitVec 32))

(declare-fun mapValue!56371 () ValueCell!17334)

(declare-fun mapRest!56371 () (Array (_ BitVec 32) ValueCell!17334))

(assert (=> mapNonEmpty!56371 (= (arr!43379 _values!1320) (store mapRest!56371 mapKey!56371 mapValue!56371))))

(declare-fun b!1328359 () Bool)

(declare-fun res!881356 () Bool)

(assert (=> b!1328359 (=> (not res!881356) (not e!757364))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89824 (_ BitVec 32)) Bool)

(assert (=> b!1328359 (= res!881356 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(assert (= (and start!112160 res!881355) b!1328354))

(assert (= (and b!1328354 res!881358) b!1328359))

(assert (= (and b!1328359 res!881356) b!1328356))

(assert (= (and b!1328356 res!881357) b!1328352))

(assert (= (and b!1328352 res!881354) b!1328357))

(assert (= (and b!1328355 condMapEmpty!56371) mapIsEmpty!56371))

(assert (= (and b!1328355 (not condMapEmpty!56371)) mapNonEmpty!56371))

(get-info :version)

(assert (= (and mapNonEmpty!56371 ((_ is ValueCellFull!17334) mapValue!56371)) b!1328358))

(assert (= (and b!1328355 ((_ is ValueCellFull!17334) mapDefault!56371)) b!1328353))

(assert (= start!112160 b!1328355))

(declare-fun m!1217353 () Bool)

(assert (=> b!1328357 m!1217353))

(assert (=> b!1328357 m!1217353))

(declare-fun m!1217355 () Bool)

(assert (=> b!1328357 m!1217355))

(declare-fun m!1217357 () Bool)

(assert (=> mapNonEmpty!56371 m!1217357))

(declare-fun m!1217359 () Bool)

(assert (=> b!1328356 m!1217359))

(declare-fun m!1217361 () Bool)

(assert (=> start!112160 m!1217361))

(declare-fun m!1217363 () Bool)

(assert (=> start!112160 m!1217363))

(declare-fun m!1217365 () Bool)

(assert (=> start!112160 m!1217365))

(declare-fun m!1217367 () Bool)

(assert (=> b!1328359 m!1217367))

(check-sat (not b_next!30555) b_and!49205 (not mapNonEmpty!56371) (not b!1328356) tp_is_empty!36465 (not start!112160) (not b!1328357) (not b!1328359))
(check-sat b_and!49205 (not b_next!30555))
