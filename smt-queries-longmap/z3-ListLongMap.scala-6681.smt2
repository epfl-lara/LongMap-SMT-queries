; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84060 () Bool)

(assert start!84060)

(declare-fun b_free!19815 () Bool)

(declare-fun b_next!19815 () Bool)

(assert (=> start!84060 (= b_free!19815 (not b_next!19815))))

(declare-fun tp!68967 () Bool)

(declare-fun b_and!31713 () Bool)

(assert (=> start!84060 (= tp!68967 b_and!31713)))

(declare-fun mapIsEmpty!36323 () Bool)

(declare-fun mapRes!36323 () Bool)

(assert (=> mapIsEmpty!36323 mapRes!36323))

(declare-fun b!982804 () Bool)

(declare-fun e!553986 () Bool)

(assert (=> b!982804 (= e!553986 (not true))))

(declare-datatypes ((V!35467 0))(
  ( (V!35468 (val!11482 Int)) )
))
(declare-datatypes ((tuple2!14710 0))(
  ( (tuple2!14711 (_1!7366 (_ BitVec 64)) (_2!7366 V!35467)) )
))
(declare-datatypes ((List!20589 0))(
  ( (Nil!20586) (Cons!20585 (h!21747 tuple2!14710) (t!29354 List!20589)) )
))
(declare-datatypes ((ListLongMap!13407 0))(
  ( (ListLongMap!13408 (toList!6719 List!20589)) )
))
(declare-fun lt!436295 () ListLongMap!13407)

(declare-fun lt!436292 () tuple2!14710)

(declare-fun lt!436293 () tuple2!14710)

(declare-fun +!3016 (ListLongMap!13407 tuple2!14710) ListLongMap!13407)

(assert (=> b!982804 (= (+!3016 (+!3016 lt!436295 lt!436292) lt!436293) (+!3016 (+!3016 lt!436295 lt!436293) lt!436292))))

(declare-fun lt!436294 () V!35467)

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!61715 0))(
  ( (array!61716 (arr!29715 (Array (_ BitVec 32) (_ BitVec 64))) (size!30194 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61715)

(assert (=> b!982804 (= lt!436293 (tuple2!14711 (select (arr!29715 _keys!1544) from!1932) lt!436294))))

(declare-fun zeroValue!1220 () V!35467)

(assert (=> b!982804 (= lt!436292 (tuple2!14711 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32671 0))(
  ( (Unit!32672) )
))
(declare-fun lt!436291 () Unit!32671)

(declare-fun addCommutativeForDiffKeys!644 (ListLongMap!13407 (_ BitVec 64) V!35467 (_ BitVec 64) V!35467) Unit!32671)

(assert (=> b!982804 (= lt!436291 (addCommutativeForDiffKeys!644 lt!436295 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29715 _keys!1544) from!1932) lt!436294))))

(declare-fun b!982805 () Bool)

(declare-fun res!657694 () Bool)

(declare-fun e!553983 () Bool)

(assert (=> b!982805 (=> (not res!657694) (not e!553983))))

(declare-datatypes ((List!20590 0))(
  ( (Nil!20587) (Cons!20586 (h!21748 (_ BitVec 64)) (t!29355 List!20590)) )
))
(declare-fun arrayNoDuplicates!0 (array!61715 (_ BitVec 32) List!20590) Bool)

(assert (=> b!982805 (= res!657694 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20587))))

(declare-fun b!982806 () Bool)

(declare-fun res!657692 () Bool)

(assert (=> b!982806 (=> (not res!657692) (not e!553983))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!982806 (= res!657692 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!982807 () Bool)

(declare-fun e!553981 () Bool)

(declare-fun tp_is_empty!22863 () Bool)

(assert (=> b!982807 (= e!553981 tp_is_empty!22863)))

(declare-fun res!657696 () Bool)

(assert (=> start!84060 (=> (not res!657696) (not e!553983))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84060 (= res!657696 (validMask!0 mask!1948))))

(assert (=> start!84060 e!553983))

(assert (=> start!84060 true))

(assert (=> start!84060 tp_is_empty!22863))

(declare-datatypes ((ValueCell!10950 0))(
  ( (ValueCellFull!10950 (v!14044 V!35467)) (EmptyCell!10950) )
))
(declare-datatypes ((array!61717 0))(
  ( (array!61718 (arr!29716 (Array (_ BitVec 32) ValueCell!10950)) (size!30195 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61717)

(declare-fun e!553985 () Bool)

(declare-fun array_inv!22981 (array!61717) Bool)

(assert (=> start!84060 (and (array_inv!22981 _values!1278) e!553985)))

(assert (=> start!84060 tp!68967))

(declare-fun array_inv!22982 (array!61715) Bool)

(assert (=> start!84060 (array_inv!22982 _keys!1544)))

(declare-fun b!982808 () Bool)

(declare-fun res!657695 () Bool)

(assert (=> b!982808 (=> (not res!657695) (not e!553983))))

(assert (=> b!982808 (= res!657695 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30194 _keys!1544))))))

(declare-fun b!982809 () Bool)

(declare-fun e!553982 () Bool)

(assert (=> b!982809 (= e!553982 tp_is_empty!22863)))

(declare-fun b!982810 () Bool)

(assert (=> b!982810 (= e!553983 e!553986)))

(declare-fun res!657691 () Bool)

(assert (=> b!982810 (=> (not res!657691) (not e!553986))))

(assert (=> b!982810 (= res!657691 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29715 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15415 (ValueCell!10950 V!35467) V!35467)

(declare-fun dynLambda!1800 (Int (_ BitVec 64)) V!35467)

(assert (=> b!982810 (= lt!436294 (get!15415 (select (arr!29716 _values!1278) from!1932) (dynLambda!1800 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1220 () V!35467)

(declare-fun getCurrentListMapNoExtraKeys!3417 (array!61715 array!61717 (_ BitVec 32) (_ BitVec 32) V!35467 V!35467 (_ BitVec 32) Int) ListLongMap!13407)

(assert (=> b!982810 (= lt!436295 (getCurrentListMapNoExtraKeys!3417 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!982811 () Bool)

(declare-fun res!657693 () Bool)

(assert (=> b!982811 (=> (not res!657693) (not e!553983))))

(assert (=> b!982811 (= res!657693 (and (= (size!30195 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30194 _keys!1544) (size!30195 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!982812 () Bool)

(declare-fun res!657697 () Bool)

(assert (=> b!982812 (=> (not res!657697) (not e!553983))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!982812 (= res!657697 (validKeyInArray!0 (select (arr!29715 _keys!1544) from!1932)))))

(declare-fun b!982813 () Bool)

(declare-fun res!657698 () Bool)

(assert (=> b!982813 (=> (not res!657698) (not e!553983))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61715 (_ BitVec 32)) Bool)

(assert (=> b!982813 (= res!657698 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!982814 () Bool)

(assert (=> b!982814 (= e!553985 (and e!553982 mapRes!36323))))

(declare-fun condMapEmpty!36323 () Bool)

(declare-fun mapDefault!36323 () ValueCell!10950)

(assert (=> b!982814 (= condMapEmpty!36323 (= (arr!29716 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10950)) mapDefault!36323)))))

(declare-fun mapNonEmpty!36323 () Bool)

(declare-fun tp!68968 () Bool)

(assert (=> mapNonEmpty!36323 (= mapRes!36323 (and tp!68968 e!553981))))

(declare-fun mapKey!36323 () (_ BitVec 32))

(declare-fun mapValue!36323 () ValueCell!10950)

(declare-fun mapRest!36323 () (Array (_ BitVec 32) ValueCell!10950))

(assert (=> mapNonEmpty!36323 (= (arr!29716 _values!1278) (store mapRest!36323 mapKey!36323 mapValue!36323))))

(assert (= (and start!84060 res!657696) b!982811))

(assert (= (and b!982811 res!657693) b!982813))

(assert (= (and b!982813 res!657698) b!982805))

(assert (= (and b!982805 res!657694) b!982808))

(assert (= (and b!982808 res!657695) b!982812))

(assert (= (and b!982812 res!657697) b!982806))

(assert (= (and b!982806 res!657692) b!982810))

(assert (= (and b!982810 res!657691) b!982804))

(assert (= (and b!982814 condMapEmpty!36323) mapIsEmpty!36323))

(assert (= (and b!982814 (not condMapEmpty!36323)) mapNonEmpty!36323))

(get-info :version)

(assert (= (and mapNonEmpty!36323 ((_ is ValueCellFull!10950) mapValue!36323)) b!982807))

(assert (= (and b!982814 ((_ is ValueCellFull!10950) mapDefault!36323)) b!982809))

(assert (= start!84060 b!982814))

(declare-fun b_lambda!14853 () Bool)

(assert (=> (not b_lambda!14853) (not b!982810)))

(declare-fun t!29353 () Bool)

(declare-fun tb!6615 () Bool)

(assert (=> (and start!84060 (= defaultEntry!1281 defaultEntry!1281) t!29353) tb!6615))

(declare-fun result!13219 () Bool)

(assert (=> tb!6615 (= result!13219 tp_is_empty!22863)))

(assert (=> b!982810 t!29353))

(declare-fun b_and!31715 () Bool)

(assert (= b_and!31713 (and (=> t!29353 result!13219) b_and!31715)))

(declare-fun m!910133 () Bool)

(assert (=> b!982812 m!910133))

(assert (=> b!982812 m!910133))

(declare-fun m!910135 () Bool)

(assert (=> b!982812 m!910135))

(assert (=> b!982810 m!910133))

(declare-fun m!910137 () Bool)

(assert (=> b!982810 m!910137))

(declare-fun m!910139 () Bool)

(assert (=> b!982810 m!910139))

(declare-fun m!910141 () Bool)

(assert (=> b!982810 m!910141))

(assert (=> b!982810 m!910137))

(assert (=> b!982810 m!910141))

(declare-fun m!910143 () Bool)

(assert (=> b!982810 m!910143))

(declare-fun m!910145 () Bool)

(assert (=> mapNonEmpty!36323 m!910145))

(declare-fun m!910147 () Bool)

(assert (=> b!982813 m!910147))

(declare-fun m!910149 () Bool)

(assert (=> b!982804 m!910149))

(declare-fun m!910151 () Bool)

(assert (=> b!982804 m!910151))

(assert (=> b!982804 m!910133))

(assert (=> b!982804 m!910133))

(declare-fun m!910153 () Bool)

(assert (=> b!982804 m!910153))

(declare-fun m!910155 () Bool)

(assert (=> b!982804 m!910155))

(assert (=> b!982804 m!910155))

(declare-fun m!910157 () Bool)

(assert (=> b!982804 m!910157))

(assert (=> b!982804 m!910149))

(declare-fun m!910159 () Bool)

(assert (=> start!84060 m!910159))

(declare-fun m!910161 () Bool)

(assert (=> start!84060 m!910161))

(declare-fun m!910163 () Bool)

(assert (=> start!84060 m!910163))

(declare-fun m!910165 () Bool)

(assert (=> b!982805 m!910165))

(check-sat b_and!31715 (not start!84060) (not b!982813) (not b_next!19815) (not b!982805) (not mapNonEmpty!36323) (not b!982812) (not b_lambda!14853) tp_is_empty!22863 (not b!982804) (not b!982810))
(check-sat b_and!31715 (not b_next!19815))
