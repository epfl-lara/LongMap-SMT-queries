; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111156 () Bool)

(assert start!111156)

(declare-fun b_free!29991 () Bool)

(declare-fun b_next!29991 () Bool)

(assert (=> start!111156 (= b_free!29991 (not b_next!29991))))

(declare-fun tp!105294 () Bool)

(declare-fun b_and!48199 () Bool)

(assert (=> start!111156 (= tp!105294 b_and!48199)))

(declare-fun b!1316102 () Bool)

(declare-fun res!873686 () Bool)

(declare-fun e!750794 () Bool)

(assert (=> b!1316102 (=> (not res!873686) (not e!750794))))

(declare-datatypes ((array!88400 0))(
  ( (array!88401 (arr!42680 (Array (_ BitVec 32) (_ BitVec 64))) (size!43230 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88400)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88400 (_ BitVec 32)) Bool)

(assert (=> b!1316102 (= res!873686 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapNonEmpty!55210 () Bool)

(declare-fun mapRes!55210 () Bool)

(declare-fun tp!105295 () Bool)

(declare-fun e!750796 () Bool)

(assert (=> mapNonEmpty!55210 (= mapRes!55210 (and tp!105295 e!750796))))

(declare-fun mapKey!55210 () (_ BitVec 32))

(declare-datatypes ((V!52731 0))(
  ( (V!52732 (val!17935 Int)) )
))
(declare-datatypes ((ValueCell!16962 0))(
  ( (ValueCellFull!16962 (v!20562 V!52731)) (EmptyCell!16962) )
))
(declare-fun mapRest!55210 () (Array (_ BitVec 32) ValueCell!16962))

(declare-datatypes ((array!88402 0))(
  ( (array!88403 (arr!42681 (Array (_ BitVec 32) ValueCell!16962)) (size!43231 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88402)

(declare-fun mapValue!55210 () ValueCell!16962)

(assert (=> mapNonEmpty!55210 (= (arr!42681 _values!1354) (store mapRest!55210 mapKey!55210 mapValue!55210))))

(declare-fun b!1316103 () Bool)

(declare-fun res!873689 () Bool)

(assert (=> b!1316103 (=> (not res!873689) (not e!750794))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1316103 (= res!873689 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43230 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1316104 () Bool)

(declare-fun res!873688 () Bool)

(assert (=> b!1316104 (=> (not res!873688) (not e!750794))))

(declare-datatypes ((List!30278 0))(
  ( (Nil!30275) (Cons!30274 (h!31483 (_ BitVec 64)) (t!43884 List!30278)) )
))
(declare-fun arrayNoDuplicates!0 (array!88400 (_ BitVec 32) List!30278) Bool)

(assert (=> b!1316104 (= res!873688 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30275))))

(declare-fun b!1316105 () Bool)

(declare-fun res!873687 () Bool)

(assert (=> b!1316105 (=> (not res!873687) (not e!750794))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1316105 (= res!873687 (and (= (size!43231 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43230 _keys!1628) (size!43231 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun res!873690 () Bool)

(assert (=> start!111156 (=> (not res!873690) (not e!750794))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111156 (= res!873690 (validMask!0 mask!2040))))

(assert (=> start!111156 e!750794))

(assert (=> start!111156 tp!105294))

(declare-fun array_inv!32233 (array!88400) Bool)

(assert (=> start!111156 (array_inv!32233 _keys!1628)))

(assert (=> start!111156 true))

(declare-fun tp_is_empty!35721 () Bool)

(assert (=> start!111156 tp_is_empty!35721))

(declare-fun e!750793 () Bool)

(declare-fun array_inv!32234 (array!88402) Bool)

(assert (=> start!111156 (and (array_inv!32234 _values!1354) e!750793)))

(declare-fun b!1316106 () Bool)

(declare-fun e!750795 () Bool)

(assert (=> b!1316106 (= e!750795 tp_is_empty!35721)))

(declare-fun b!1316107 () Bool)

(assert (=> b!1316107 (= e!750796 tp_is_empty!35721)))

(declare-fun b!1316108 () Bool)

(assert (=> b!1316108 (= e!750794 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!585996 () Bool)

(declare-fun minValue!1296 () V!52731)

(declare-fun zeroValue!1296 () V!52731)

(declare-datatypes ((tuple2!23140 0))(
  ( (tuple2!23141 (_1!11581 (_ BitVec 64)) (_2!11581 V!52731)) )
))
(declare-datatypes ((List!30279 0))(
  ( (Nil!30276) (Cons!30275 (h!31484 tuple2!23140) (t!43885 List!30279)) )
))
(declare-datatypes ((ListLongMap!20797 0))(
  ( (ListLongMap!20798 (toList!10414 List!30279)) )
))
(declare-fun contains!8564 (ListLongMap!20797 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5427 (array!88400 array!88402 (_ BitVec 32) (_ BitVec 32) V!52731 V!52731 (_ BitVec 32) Int) ListLongMap!20797)

(assert (=> b!1316108 (= lt!585996 (contains!8564 (getCurrentListMap!5427 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1316109 () Bool)

(assert (=> b!1316109 (= e!750793 (and e!750795 mapRes!55210))))

(declare-fun condMapEmpty!55210 () Bool)

(declare-fun mapDefault!55210 () ValueCell!16962)

(assert (=> b!1316109 (= condMapEmpty!55210 (= (arr!42681 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16962)) mapDefault!55210)))))

(declare-fun mapIsEmpty!55210 () Bool)

(assert (=> mapIsEmpty!55210 mapRes!55210))

(assert (= (and start!111156 res!873690) b!1316105))

(assert (= (and b!1316105 res!873687) b!1316102))

(assert (= (and b!1316102 res!873686) b!1316104))

(assert (= (and b!1316104 res!873688) b!1316103))

(assert (= (and b!1316103 res!873689) b!1316108))

(assert (= (and b!1316109 condMapEmpty!55210) mapIsEmpty!55210))

(assert (= (and b!1316109 (not condMapEmpty!55210)) mapNonEmpty!55210))

(get-info :version)

(assert (= (and mapNonEmpty!55210 ((_ is ValueCellFull!16962) mapValue!55210)) b!1316107))

(assert (= (and b!1316109 ((_ is ValueCellFull!16962) mapDefault!55210)) b!1316106))

(assert (= start!111156 b!1316109))

(declare-fun m!1204075 () Bool)

(assert (=> b!1316102 m!1204075))

(declare-fun m!1204077 () Bool)

(assert (=> b!1316108 m!1204077))

(assert (=> b!1316108 m!1204077))

(declare-fun m!1204079 () Bool)

(assert (=> b!1316108 m!1204079))

(declare-fun m!1204081 () Bool)

(assert (=> mapNonEmpty!55210 m!1204081))

(declare-fun m!1204083 () Bool)

(assert (=> start!111156 m!1204083))

(declare-fun m!1204085 () Bool)

(assert (=> start!111156 m!1204085))

(declare-fun m!1204087 () Bool)

(assert (=> start!111156 m!1204087))

(declare-fun m!1204089 () Bool)

(assert (=> b!1316104 m!1204089))

(check-sat (not b!1316102) (not start!111156) b_and!48199 (not b_next!29991) tp_is_empty!35721 (not b!1316104) (not b!1316108) (not mapNonEmpty!55210))
(check-sat b_and!48199 (not b_next!29991))
