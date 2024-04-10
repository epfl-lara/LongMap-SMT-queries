; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110844 () Bool)

(assert start!110844)

(declare-fun b_free!29679 () Bool)

(declare-fun b_next!29679 () Bool)

(assert (=> start!110844 (= b_free!29679 (not b_next!29679))))

(declare-fun tp!104358 () Bool)

(declare-fun b_and!47887 () Bool)

(assert (=> start!110844 (= tp!104358 b_and!47887)))

(declare-fun b!1312135 () Bool)

(declare-fun res!871126 () Bool)

(declare-fun e!748453 () Bool)

(assert (=> b!1312135 (=> (not res!871126) (not e!748453))))

(declare-datatypes ((array!87806 0))(
  ( (array!87807 (arr!42383 (Array (_ BitVec 32) (_ BitVec 64))) (size!42933 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87806)

(declare-datatypes ((List!30054 0))(
  ( (Nil!30051) (Cons!30050 (h!31259 (_ BitVec 64)) (t!43660 List!30054)) )
))
(declare-fun arrayNoDuplicates!0 (array!87806 (_ BitVec 32) List!30054) Bool)

(assert (=> b!1312135 (= res!871126 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30051))))

(declare-fun b!1312136 () Bool)

(declare-fun res!871123 () Bool)

(assert (=> b!1312136 (=> (not res!871123) (not e!748453))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1312136 (= res!871123 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42933 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1312137 () Bool)

(assert (=> b!1312137 (= e!748453 (not true))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52315 0))(
  ( (V!52316 (val!17779 Int)) )
))
(declare-fun minValue!1296 () V!52315)

(declare-datatypes ((ValueCell!16806 0))(
  ( (ValueCellFull!16806 (v!20406 V!52315)) (EmptyCell!16806) )
))
(declare-datatypes ((array!87808 0))(
  ( (array!87809 (arr!42384 (Array (_ BitVec 32) ValueCell!16806)) (size!42934 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87808)

(declare-fun zeroValue!1296 () V!52315)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-datatypes ((tuple2!22916 0))(
  ( (tuple2!22917 (_1!11469 (_ BitVec 64)) (_2!11469 V!52315)) )
))
(declare-datatypes ((List!30055 0))(
  ( (Nil!30052) (Cons!30051 (h!31260 tuple2!22916) (t!43661 List!30055)) )
))
(declare-datatypes ((ListLongMap!20573 0))(
  ( (ListLongMap!20574 (toList!10302 List!30055)) )
))
(declare-fun contains!8452 (ListLongMap!20573 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5315 (array!87806 array!87808 (_ BitVec 32) (_ BitVec 32) V!52315 V!52315 (_ BitVec 32) Int) ListLongMap!20573)

(assert (=> b!1312137 (contains!8452 (getCurrentListMap!5315 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43370 0))(
  ( (Unit!43371) )
))
(declare-fun lt!585537 () Unit!43370)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstXKeys!12 (array!87806 array!87808 (_ BitVec 32) (_ BitVec 32) V!52315 V!52315 (_ BitVec 64) (_ BitVec 32) Int) Unit!43370)

(assert (=> b!1312137 (= lt!585537 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstXKeys!12 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun mapIsEmpty!54742 () Bool)

(declare-fun mapRes!54742 () Bool)

(assert (=> mapIsEmpty!54742 mapRes!54742))

(declare-fun b!1312138 () Bool)

(declare-fun res!871127 () Bool)

(assert (=> b!1312138 (=> (not res!871127) (not e!748453))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1312138 (= res!871127 (validKeyInArray!0 (select (arr!42383 _keys!1628) from!2020)))))

(declare-fun b!1312139 () Bool)

(declare-fun res!871124 () Bool)

(assert (=> b!1312139 (=> (not res!871124) (not e!748453))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87806 (_ BitVec 32)) Bool)

(assert (=> b!1312139 (= res!871124 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1312140 () Bool)

(declare-fun res!871128 () Bool)

(assert (=> b!1312140 (=> (not res!871128) (not e!748453))))

(assert (=> b!1312140 (= res!871128 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1312141 () Bool)

(declare-fun e!748457 () Bool)

(declare-fun tp_is_empty!35409 () Bool)

(assert (=> b!1312141 (= e!748457 tp_is_empty!35409)))

(declare-fun b!1312142 () Bool)

(declare-fun e!748455 () Bool)

(assert (=> b!1312142 (= e!748455 tp_is_empty!35409)))

(declare-fun b!1312143 () Bool)

(declare-fun res!871131 () Bool)

(assert (=> b!1312143 (=> (not res!871131) (not e!748453))))

(assert (=> b!1312143 (= res!871131 (not (= (select (arr!42383 _keys!1628) from!2020) k0!1175)))))

(declare-fun b!1312144 () Bool)

(declare-fun res!871130 () Bool)

(assert (=> b!1312144 (=> (not res!871130) (not e!748453))))

(assert (=> b!1312144 (= res!871130 (contains!8452 (getCurrentListMap!5315 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1312145 () Bool)

(declare-fun e!748456 () Bool)

(assert (=> b!1312145 (= e!748456 (and e!748457 mapRes!54742))))

(declare-fun condMapEmpty!54742 () Bool)

(declare-fun mapDefault!54742 () ValueCell!16806)

(assert (=> b!1312145 (= condMapEmpty!54742 (= (arr!42384 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16806)) mapDefault!54742)))))

(declare-fun b!1312146 () Bool)

(declare-fun res!871125 () Bool)

(assert (=> b!1312146 (=> (not res!871125) (not e!748453))))

(assert (=> b!1312146 (= res!871125 (and (= (size!42934 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42933 _keys!1628) (size!42934 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!54742 () Bool)

(declare-fun tp!104359 () Bool)

(assert (=> mapNonEmpty!54742 (= mapRes!54742 (and tp!104359 e!748455))))

(declare-fun mapKey!54742 () (_ BitVec 32))

(declare-fun mapValue!54742 () ValueCell!16806)

(declare-fun mapRest!54742 () (Array (_ BitVec 32) ValueCell!16806))

(assert (=> mapNonEmpty!54742 (= (arr!42384 _values!1354) (store mapRest!54742 mapKey!54742 mapValue!54742))))

(declare-fun res!871129 () Bool)

(assert (=> start!110844 (=> (not res!871129) (not e!748453))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110844 (= res!871129 (validMask!0 mask!2040))))

(assert (=> start!110844 e!748453))

(assert (=> start!110844 tp!104358))

(declare-fun array_inv!32027 (array!87806) Bool)

(assert (=> start!110844 (array_inv!32027 _keys!1628)))

(assert (=> start!110844 true))

(assert (=> start!110844 tp_is_empty!35409))

(declare-fun array_inv!32028 (array!87808) Bool)

(assert (=> start!110844 (and (array_inv!32028 _values!1354) e!748456)))

(assert (= (and start!110844 res!871129) b!1312146))

(assert (= (and b!1312146 res!871125) b!1312139))

(assert (= (and b!1312139 res!871124) b!1312135))

(assert (= (and b!1312135 res!871126) b!1312136))

(assert (= (and b!1312136 res!871123) b!1312144))

(assert (= (and b!1312144 res!871130) b!1312143))

(assert (= (and b!1312143 res!871131) b!1312138))

(assert (= (and b!1312138 res!871127) b!1312140))

(assert (= (and b!1312140 res!871128) b!1312137))

(assert (= (and b!1312145 condMapEmpty!54742) mapIsEmpty!54742))

(assert (= (and b!1312145 (not condMapEmpty!54742)) mapNonEmpty!54742))

(get-info :version)

(assert (= (and mapNonEmpty!54742 ((_ is ValueCellFull!16806) mapValue!54742)) b!1312142))

(assert (= (and b!1312145 ((_ is ValueCellFull!16806) mapDefault!54742)) b!1312141))

(assert (= start!110844 b!1312145))

(declare-fun m!1201397 () Bool)

(assert (=> b!1312144 m!1201397))

(assert (=> b!1312144 m!1201397))

(declare-fun m!1201399 () Bool)

(assert (=> b!1312144 m!1201399))

(declare-fun m!1201401 () Bool)

(assert (=> b!1312135 m!1201401))

(declare-fun m!1201403 () Bool)

(assert (=> mapNonEmpty!54742 m!1201403))

(declare-fun m!1201405 () Bool)

(assert (=> b!1312139 m!1201405))

(declare-fun m!1201407 () Bool)

(assert (=> b!1312137 m!1201407))

(assert (=> b!1312137 m!1201407))

(declare-fun m!1201409 () Bool)

(assert (=> b!1312137 m!1201409))

(declare-fun m!1201411 () Bool)

(assert (=> b!1312137 m!1201411))

(declare-fun m!1201413 () Bool)

(assert (=> b!1312138 m!1201413))

(assert (=> b!1312138 m!1201413))

(declare-fun m!1201415 () Bool)

(assert (=> b!1312138 m!1201415))

(assert (=> b!1312143 m!1201413))

(declare-fun m!1201417 () Bool)

(assert (=> start!110844 m!1201417))

(declare-fun m!1201419 () Bool)

(assert (=> start!110844 m!1201419))

(declare-fun m!1201421 () Bool)

(assert (=> start!110844 m!1201421))

(check-sat (not b!1312144) (not b!1312137) tp_is_empty!35409 (not b!1312135) (not b_next!29679) b_and!47887 (not start!110844) (not mapNonEmpty!54742) (not b!1312138) (not b!1312139))
(check-sat b_and!47887 (not b_next!29679))
