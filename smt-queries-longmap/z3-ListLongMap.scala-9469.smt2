; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112422 () Bool)

(assert start!112422)

(declare-fun b_free!30817 () Bool)

(declare-fun b_next!30817 () Bool)

(assert (=> start!112422 (= b_free!30817 (not b_next!30817))))

(declare-fun tp!108088 () Bool)

(declare-fun b_and!49641 () Bool)

(assert (=> start!112422 (= tp!108088 b_and!49641)))

(declare-fun mapNonEmpty!56764 () Bool)

(declare-fun mapRes!56764 () Bool)

(declare-fun tp!108089 () Bool)

(declare-fun e!759298 () Bool)

(assert (=> mapNonEmpty!56764 (= mapRes!56764 (and tp!108089 e!759298))))

(declare-datatypes ((V!54073 0))(
  ( (V!54074 (val!18438 Int)) )
))
(declare-datatypes ((ValueCell!17465 0))(
  ( (ValueCellFull!17465 (v!21074 V!54073)) (EmptyCell!17465) )
))
(declare-datatypes ((array!90271 0))(
  ( (array!90272 (arr!43602 (Array (_ BitVec 32) ValueCell!17465)) (size!44154 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90271)

(declare-fun mapRest!56764 () (Array (_ BitVec 32) ValueCell!17465))

(declare-fun mapValue!56764 () ValueCell!17465)

(declare-fun mapKey!56764 () (_ BitVec 32))

(assert (=> mapNonEmpty!56764 (= (arr!43602 _values!1320) (store mapRest!56764 mapKey!56764 mapValue!56764))))

(declare-fun b!1332797 () Bool)

(declare-fun res!884472 () Bool)

(declare-fun e!759295 () Bool)

(assert (=> b!1332797 (=> (not res!884472) (not e!759295))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun k0!1153 () (_ BitVec 64))

(declare-datatypes ((array!90273 0))(
  ( (array!90274 (arr!43603 (Array (_ BitVec 32) (_ BitVec 64))) (size!44155 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90273)

(assert (=> b!1332797 (= res!884472 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44155 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1332798 () Bool)

(assert (=> b!1332798 (= e!759295 false)))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun minValue!1262 () V!54073)

(declare-fun zeroValue!1262 () V!54073)

(declare-fun lt!591892 () Bool)

(declare-fun defaultEntry!1323 () Int)

(declare-datatypes ((tuple2!23830 0))(
  ( (tuple2!23831 (_1!11926 (_ BitVec 64)) (_2!11926 V!54073)) )
))
(declare-datatypes ((List!30967 0))(
  ( (Nil!30964) (Cons!30963 (h!32172 tuple2!23830) (t!45157 List!30967)) )
))
(declare-datatypes ((ListLongMap!21487 0))(
  ( (ListLongMap!21488 (toList!10759 List!30967)) )
))
(declare-fun contains!8851 (ListLongMap!21487 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5619 (array!90273 array!90271 (_ BitVec 32) (_ BitVec 32) V!54073 V!54073 (_ BitVec 32) Int) ListLongMap!21487)

(assert (=> b!1332798 (= lt!591892 (contains!8851 (getCurrentListMap!5619 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1332799 () Bool)

(declare-fun tp_is_empty!36727 () Bool)

(assert (=> b!1332799 (= e!759298 tp_is_empty!36727)))

(declare-fun res!884470 () Bool)

(assert (=> start!112422 (=> (not res!884470) (not e!759295))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112422 (= res!884470 (validMask!0 mask!1998))))

(assert (=> start!112422 e!759295))

(declare-fun e!759297 () Bool)

(declare-fun array_inv!33079 (array!90271) Bool)

(assert (=> start!112422 (and (array_inv!33079 _values!1320) e!759297)))

(assert (=> start!112422 true))

(declare-fun array_inv!33080 (array!90273) Bool)

(assert (=> start!112422 (array_inv!33080 _keys!1590)))

(assert (=> start!112422 tp!108088))

(assert (=> start!112422 tp_is_empty!36727))

(declare-fun b!1332800 () Bool)

(declare-fun res!884471 () Bool)

(assert (=> b!1332800 (=> (not res!884471) (not e!759295))))

(declare-datatypes ((List!30968 0))(
  ( (Nil!30965) (Cons!30964 (h!32173 (_ BitVec 64)) (t!45158 List!30968)) )
))
(declare-fun arrayNoDuplicates!0 (array!90273 (_ BitVec 32) List!30968) Bool)

(assert (=> b!1332800 (= res!884471 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30965))))

(declare-fun b!1332801 () Bool)

(declare-fun e!759296 () Bool)

(assert (=> b!1332801 (= e!759297 (and e!759296 mapRes!56764))))

(declare-fun condMapEmpty!56764 () Bool)

(declare-fun mapDefault!56764 () ValueCell!17465)

(assert (=> b!1332801 (= condMapEmpty!56764 (= (arr!43602 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17465)) mapDefault!56764)))))

(declare-fun b!1332802 () Bool)

(declare-fun res!884469 () Bool)

(assert (=> b!1332802 (=> (not res!884469) (not e!759295))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90273 (_ BitVec 32)) Bool)

(assert (=> b!1332802 (= res!884469 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1332803 () Bool)

(declare-fun res!884473 () Bool)

(assert (=> b!1332803 (=> (not res!884473) (not e!759295))))

(assert (=> b!1332803 (= res!884473 (and (= (size!44154 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44155 _keys!1590) (size!44154 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!56764 () Bool)

(assert (=> mapIsEmpty!56764 mapRes!56764))

(declare-fun b!1332804 () Bool)

(assert (=> b!1332804 (= e!759296 tp_is_empty!36727)))

(assert (= (and start!112422 res!884470) b!1332803))

(assert (= (and b!1332803 res!884473) b!1332802))

(assert (= (and b!1332802 res!884469) b!1332800))

(assert (= (and b!1332800 res!884471) b!1332797))

(assert (= (and b!1332797 res!884472) b!1332798))

(assert (= (and b!1332801 condMapEmpty!56764) mapIsEmpty!56764))

(assert (= (and b!1332801 (not condMapEmpty!56764)) mapNonEmpty!56764))

(get-info :version)

(assert (= (and mapNonEmpty!56764 ((_ is ValueCellFull!17465) mapValue!56764)) b!1332799))

(assert (= (and b!1332801 ((_ is ValueCellFull!17465) mapDefault!56764)) b!1332804))

(assert (= start!112422 b!1332801))

(declare-fun m!1221063 () Bool)

(assert (=> mapNonEmpty!56764 m!1221063))

(declare-fun m!1221065 () Bool)

(assert (=> b!1332802 m!1221065))

(declare-fun m!1221067 () Bool)

(assert (=> start!112422 m!1221067))

(declare-fun m!1221069 () Bool)

(assert (=> start!112422 m!1221069))

(declare-fun m!1221071 () Bool)

(assert (=> start!112422 m!1221071))

(declare-fun m!1221073 () Bool)

(assert (=> b!1332800 m!1221073))

(declare-fun m!1221075 () Bool)

(assert (=> b!1332798 m!1221075))

(assert (=> b!1332798 m!1221075))

(declare-fun m!1221077 () Bool)

(assert (=> b!1332798 m!1221077))

(check-sat (not b!1332802) (not b!1332800) (not b!1332798) (not b_next!30817) (not mapNonEmpty!56764) tp_is_empty!36727 b_and!49641 (not start!112422))
(check-sat b_and!49641 (not b_next!30817))
