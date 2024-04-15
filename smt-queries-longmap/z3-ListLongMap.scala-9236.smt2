; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110764 () Bool)

(assert start!110764)

(declare-fun b_free!29599 () Bool)

(declare-fun b_next!29599 () Bool)

(assert (=> start!110764 (= b_free!29599 (not b_next!29599))))

(declare-fun tp!104119 () Bool)

(declare-fun b_and!47789 () Bool)

(assert (=> start!110764 (= tp!104119 b_and!47789)))

(declare-fun b!1310905 () Bool)

(declare-fun e!747820 () Bool)

(declare-fun tp_is_empty!35329 () Bool)

(assert (=> b!1310905 (= e!747820 tp_is_empty!35329)))

(declare-fun b!1310906 () Bool)

(declare-fun e!747823 () Bool)

(declare-fun e!747821 () Bool)

(declare-fun mapRes!54622 () Bool)

(assert (=> b!1310906 (= e!747823 (and e!747821 mapRes!54622))))

(declare-fun condMapEmpty!54622 () Bool)

(declare-datatypes ((V!52209 0))(
  ( (V!52210 (val!17739 Int)) )
))
(declare-datatypes ((ValueCell!16766 0))(
  ( (ValueCellFull!16766 (v!20365 V!52209)) (EmptyCell!16766) )
))
(declare-datatypes ((array!87559 0))(
  ( (array!87560 (arr!42260 (Array (_ BitVec 32) ValueCell!16766)) (size!42812 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87559)

(declare-fun mapDefault!54622 () ValueCell!16766)

(assert (=> b!1310906 (= condMapEmpty!54622 (= (arr!42260 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16766)) mapDefault!54622)))))

(declare-fun b!1310907 () Bool)

(declare-fun res!870296 () Bool)

(declare-fun e!747824 () Bool)

(assert (=> b!1310907 (=> (not res!870296) (not e!747824))))

(declare-datatypes ((array!87561 0))(
  ( (array!87562 (arr!42261 (Array (_ BitVec 32) (_ BitVec 64))) (size!42813 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87561)

(declare-datatypes ((List!30064 0))(
  ( (Nil!30061) (Cons!30060 (h!31269 (_ BitVec 64)) (t!43662 List!30064)) )
))
(declare-fun arrayNoDuplicates!0 (array!87561 (_ BitVec 32) List!30064) Bool)

(assert (=> b!1310907 (= res!870296 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30061))))

(declare-fun b!1310908 () Bool)

(declare-fun res!870294 () Bool)

(assert (=> b!1310908 (=> (not res!870294) (not e!747824))))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun k0!1175 () (_ BitVec 64))

(assert (=> b!1310908 (= res!870294 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42813 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1310909 () Bool)

(assert (=> b!1310909 (= e!747824 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun minValue!1296 () V!52209)

(declare-fun zeroValue!1296 () V!52209)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun lt!585231 () Bool)

(declare-datatypes ((tuple2!22940 0))(
  ( (tuple2!22941 (_1!11481 (_ BitVec 64)) (_2!11481 V!52209)) )
))
(declare-datatypes ((List!30065 0))(
  ( (Nil!30062) (Cons!30061 (h!31270 tuple2!22940) (t!43663 List!30065)) )
))
(declare-datatypes ((ListLongMap!20597 0))(
  ( (ListLongMap!20598 (toList!10314 List!30065)) )
))
(declare-fun contains!8391 (ListLongMap!20597 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5209 (array!87561 array!87559 (_ BitVec 32) (_ BitVec 32) V!52209 V!52209 (_ BitVec 32) Int) ListLongMap!20597)

(assert (=> b!1310909 (= lt!585231 (contains!8391 (getCurrentListMap!5209 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1310910 () Bool)

(declare-fun res!870297 () Bool)

(assert (=> b!1310910 (=> (not res!870297) (not e!747824))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87561 (_ BitVec 32)) Bool)

(assert (=> b!1310910 (= res!870297 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1310911 () Bool)

(assert (=> b!1310911 (= e!747821 tp_is_empty!35329)))

(declare-fun res!870295 () Bool)

(assert (=> start!110764 (=> (not res!870295) (not e!747824))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110764 (= res!870295 (validMask!0 mask!2040))))

(assert (=> start!110764 e!747824))

(assert (=> start!110764 tp!104119))

(declare-fun array_inv!32117 (array!87561) Bool)

(assert (=> start!110764 (array_inv!32117 _keys!1628)))

(assert (=> start!110764 true))

(assert (=> start!110764 tp_is_empty!35329))

(declare-fun array_inv!32118 (array!87559) Bool)

(assert (=> start!110764 (and (array_inv!32118 _values!1354) e!747823)))

(declare-fun mapIsEmpty!54622 () Bool)

(assert (=> mapIsEmpty!54622 mapRes!54622))

(declare-fun mapNonEmpty!54622 () Bool)

(declare-fun tp!104120 () Bool)

(assert (=> mapNonEmpty!54622 (= mapRes!54622 (and tp!104120 e!747820))))

(declare-fun mapValue!54622 () ValueCell!16766)

(declare-fun mapKey!54622 () (_ BitVec 32))

(declare-fun mapRest!54622 () (Array (_ BitVec 32) ValueCell!16766))

(assert (=> mapNonEmpty!54622 (= (arr!42260 _values!1354) (store mapRest!54622 mapKey!54622 mapValue!54622))))

(declare-fun b!1310912 () Bool)

(declare-fun res!870298 () Bool)

(assert (=> b!1310912 (=> (not res!870298) (not e!747824))))

(assert (=> b!1310912 (= res!870298 (and (= (size!42812 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42813 _keys!1628) (size!42812 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(assert (= (and start!110764 res!870295) b!1310912))

(assert (= (and b!1310912 res!870298) b!1310910))

(assert (= (and b!1310910 res!870297) b!1310907))

(assert (= (and b!1310907 res!870296) b!1310908))

(assert (= (and b!1310908 res!870294) b!1310909))

(assert (= (and b!1310906 condMapEmpty!54622) mapIsEmpty!54622))

(assert (= (and b!1310906 (not condMapEmpty!54622)) mapNonEmpty!54622))

(get-info :version)

(assert (= (and mapNonEmpty!54622 ((_ is ValueCellFull!16766) mapValue!54622)) b!1310905))

(assert (= (and b!1310906 ((_ is ValueCellFull!16766) mapDefault!54622)) b!1310911))

(assert (= start!110764 b!1310906))

(declare-fun m!1200081 () Bool)

(assert (=> b!1310910 m!1200081))

(declare-fun m!1200083 () Bool)

(assert (=> mapNonEmpty!54622 m!1200083))

(declare-fun m!1200085 () Bool)

(assert (=> b!1310909 m!1200085))

(assert (=> b!1310909 m!1200085))

(declare-fun m!1200087 () Bool)

(assert (=> b!1310909 m!1200087))

(declare-fun m!1200089 () Bool)

(assert (=> b!1310907 m!1200089))

(declare-fun m!1200091 () Bool)

(assert (=> start!110764 m!1200091))

(declare-fun m!1200093 () Bool)

(assert (=> start!110764 m!1200093))

(declare-fun m!1200095 () Bool)

(assert (=> start!110764 m!1200095))

(check-sat (not b!1310909) b_and!47789 (not b!1310907) (not b_next!29599) tp_is_empty!35329 (not mapNonEmpty!54622) (not start!110764) (not b!1310910))
(check-sat b_and!47789 (not b_next!29599))
