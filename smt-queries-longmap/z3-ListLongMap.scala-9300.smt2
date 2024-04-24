; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111372 () Bool)

(assert start!111372)

(declare-fun b_free!29983 () Bool)

(declare-fun b_next!29983 () Bool)

(assert (=> start!111372 (= b_free!29983 (not b_next!29983))))

(declare-fun tp!105270 () Bool)

(declare-fun b_and!48193 () Bool)

(assert (=> start!111372 (= tp!105270 b_and!48193)))

(declare-fun b!1317305 () Bool)

(declare-fun e!751578 () Bool)

(assert (=> b!1317305 (= e!751578 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!88441 0))(
  ( (array!88442 (arr!42696 (Array (_ BitVec 32) (_ BitVec 64))) (size!43247 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88441)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-datatypes ((V!52721 0))(
  ( (V!52722 (val!17931 Int)) )
))
(declare-datatypes ((ValueCell!16958 0))(
  ( (ValueCellFull!16958 (v!20553 V!52721)) (EmptyCell!16958) )
))
(declare-datatypes ((array!88443 0))(
  ( (array!88444 (arr!42697 (Array (_ BitVec 32) ValueCell!16958)) (size!43248 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88443)

(declare-fun zeroValue!1296 () V!52721)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun minValue!1296 () V!52721)

(declare-fun lt!586460 () Bool)

(declare-datatypes ((tuple2!23160 0))(
  ( (tuple2!23161 (_1!11591 (_ BitVec 64)) (_2!11591 V!52721)) )
))
(declare-datatypes ((List!30304 0))(
  ( (Nil!30301) (Cons!30300 (h!31518 tuple2!23160) (t!43902 List!30304)) )
))
(declare-datatypes ((ListLongMap!20825 0))(
  ( (ListLongMap!20826 (toList!10428 List!30304)) )
))
(declare-fun contains!8590 (ListLongMap!20825 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5432 (array!88441 array!88443 (_ BitVec 32) (_ BitVec 32) V!52721 V!52721 (_ BitVec 32) Int) ListLongMap!20825)

(assert (=> b!1317305 (= lt!586460 (contains!8590 (getCurrentListMap!5432 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun mapNonEmpty!55198 () Bool)

(declare-fun mapRes!55198 () Bool)

(declare-fun tp!105271 () Bool)

(declare-fun e!751576 () Bool)

(assert (=> mapNonEmpty!55198 (= mapRes!55198 (and tp!105271 e!751576))))

(declare-fun mapRest!55198 () (Array (_ BitVec 32) ValueCell!16958))

(declare-fun mapValue!55198 () ValueCell!16958)

(declare-fun mapKey!55198 () (_ BitVec 32))

(assert (=> mapNonEmpty!55198 (= (arr!42697 _values!1354) (store mapRest!55198 mapKey!55198 mapValue!55198))))

(declare-fun mapIsEmpty!55198 () Bool)

(assert (=> mapIsEmpty!55198 mapRes!55198))

(declare-fun b!1317306 () Bool)

(declare-fun res!874148 () Bool)

(assert (=> b!1317306 (=> (not res!874148) (not e!751578))))

(declare-datatypes ((List!30305 0))(
  ( (Nil!30302) (Cons!30301 (h!31519 (_ BitVec 64)) (t!43903 List!30305)) )
))
(declare-fun arrayNoDuplicates!0 (array!88441 (_ BitVec 32) List!30305) Bool)

(assert (=> b!1317306 (= res!874148 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30302))))

(declare-fun b!1317307 () Bool)

(declare-fun res!874147 () Bool)

(assert (=> b!1317307 (=> (not res!874147) (not e!751578))))

(assert (=> b!1317307 (= res!874147 (and (= (size!43248 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43247 _keys!1628) (size!43248 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1317308 () Bool)

(declare-fun res!874144 () Bool)

(assert (=> b!1317308 (=> (not res!874144) (not e!751578))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88441 (_ BitVec 32)) Bool)

(assert (=> b!1317308 (= res!874144 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1317309 () Bool)

(declare-fun e!751580 () Bool)

(declare-fun e!751579 () Bool)

(assert (=> b!1317309 (= e!751580 (and e!751579 mapRes!55198))))

(declare-fun condMapEmpty!55198 () Bool)

(declare-fun mapDefault!55198 () ValueCell!16958)

(assert (=> b!1317309 (= condMapEmpty!55198 (= (arr!42697 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16958)) mapDefault!55198)))))

(declare-fun b!1317310 () Bool)

(declare-fun tp_is_empty!35713 () Bool)

(assert (=> b!1317310 (= e!751576 tp_is_empty!35713)))

(declare-fun res!874145 () Bool)

(assert (=> start!111372 (=> (not res!874145) (not e!751578))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111372 (= res!874145 (validMask!0 mask!2040))))

(assert (=> start!111372 e!751578))

(assert (=> start!111372 tp!105270))

(declare-fun array_inv!32511 (array!88441) Bool)

(assert (=> start!111372 (array_inv!32511 _keys!1628)))

(assert (=> start!111372 true))

(assert (=> start!111372 tp_is_empty!35713))

(declare-fun array_inv!32512 (array!88443) Bool)

(assert (=> start!111372 (and (array_inv!32512 _values!1354) e!751580)))

(declare-fun b!1317311 () Bool)

(declare-fun res!874146 () Bool)

(assert (=> b!1317311 (=> (not res!874146) (not e!751578))))

(assert (=> b!1317311 (= res!874146 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43247 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1317312 () Bool)

(assert (=> b!1317312 (= e!751579 tp_is_empty!35713)))

(assert (= (and start!111372 res!874145) b!1317307))

(assert (= (and b!1317307 res!874147) b!1317308))

(assert (= (and b!1317308 res!874144) b!1317306))

(assert (= (and b!1317306 res!874148) b!1317311))

(assert (= (and b!1317311 res!874146) b!1317305))

(assert (= (and b!1317309 condMapEmpty!55198) mapIsEmpty!55198))

(assert (= (and b!1317309 (not condMapEmpty!55198)) mapNonEmpty!55198))

(get-info :version)

(assert (= (and mapNonEmpty!55198 ((_ is ValueCellFull!16958) mapValue!55198)) b!1317310))

(assert (= (and b!1317309 ((_ is ValueCellFull!16958) mapDefault!55198)) b!1317312))

(assert (= start!111372 b!1317309))

(declare-fun m!1205609 () Bool)

(assert (=> mapNonEmpty!55198 m!1205609))

(declare-fun m!1205611 () Bool)

(assert (=> b!1317308 m!1205611))

(declare-fun m!1205613 () Bool)

(assert (=> b!1317305 m!1205613))

(assert (=> b!1317305 m!1205613))

(declare-fun m!1205615 () Bool)

(assert (=> b!1317305 m!1205615))

(declare-fun m!1205617 () Bool)

(assert (=> b!1317306 m!1205617))

(declare-fun m!1205619 () Bool)

(assert (=> start!111372 m!1205619))

(declare-fun m!1205621 () Bool)

(assert (=> start!111372 m!1205621))

(declare-fun m!1205623 () Bool)

(assert (=> start!111372 m!1205623))

(check-sat (not b_next!29983) (not b!1317305) (not b!1317306) tp_is_empty!35713 (not b!1317308) b_and!48193 (not start!111372) (not mapNonEmpty!55198))
(check-sat b_and!48193 (not b_next!29983))
