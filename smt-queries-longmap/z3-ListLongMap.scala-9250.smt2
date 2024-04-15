; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110848 () Bool)

(assert start!110848)

(declare-fun b_free!29683 () Bool)

(declare-fun b_next!29683 () Bool)

(assert (=> start!110848 (= b_free!29683 (not b_next!29683))))

(declare-fun tp!104371 () Bool)

(declare-fun b_and!47873 () Bool)

(assert (=> start!110848 (= tp!104371 b_and!47873)))

(declare-fun b!1312137 () Bool)

(declare-fun e!748451 () Bool)

(assert (=> b!1312137 (= e!748451 (not true))))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!87719 0))(
  ( (array!87720 (arr!42340 (Array (_ BitVec 32) (_ BitVec 64))) (size!42892 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87719)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-datatypes ((V!52321 0))(
  ( (V!52322 (val!17781 Int)) )
))
(declare-fun minValue!1296 () V!52321)

(declare-datatypes ((ValueCell!16808 0))(
  ( (ValueCellFull!16808 (v!20407 V!52321)) (EmptyCell!16808) )
))
(declare-datatypes ((array!87721 0))(
  ( (array!87722 (arr!42341 (Array (_ BitVec 32) ValueCell!16808)) (size!42893 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87721)

(declare-fun zeroValue!1296 () V!52321)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!23008 0))(
  ( (tuple2!23009 (_1!11515 (_ BitVec 64)) (_2!11515 V!52321)) )
))
(declare-datatypes ((List!30128 0))(
  ( (Nil!30125) (Cons!30124 (h!31333 tuple2!23008) (t!43726 List!30128)) )
))
(declare-datatypes ((ListLongMap!20665 0))(
  ( (ListLongMap!20666 (toList!10348 List!30128)) )
))
(declare-fun contains!8425 (ListLongMap!20665 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5243 (array!87719 array!87721 (_ BitVec 32) (_ BitVec 32) V!52321 V!52321 (_ BitVec 32) Int) ListLongMap!20665)

(assert (=> b!1312137 (contains!8425 (getCurrentListMap!5243 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43209 0))(
  ( (Unit!43210) )
))
(declare-fun lt!585357 () Unit!43209)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstXKeys!15 (array!87719 array!87721 (_ BitVec 32) (_ BitVec 32) V!52321 V!52321 (_ BitVec 64) (_ BitVec 32) Int) Unit!43209)

(assert (=> b!1312137 (= lt!585357 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstXKeys!15 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1312138 () Bool)

(declare-fun res!871148 () Bool)

(assert (=> b!1312138 (=> (not res!871148) (not e!748451))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87719 (_ BitVec 32)) Bool)

(assert (=> b!1312138 (= res!871148 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1312139 () Bool)

(declare-fun res!871151 () Bool)

(assert (=> b!1312139 (=> (not res!871151) (not e!748451))))

(assert (=> b!1312139 (= res!871151 (and (= (size!42893 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42892 _keys!1628) (size!42893 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1312140 () Bool)

(declare-fun e!748452 () Bool)

(declare-fun tp_is_empty!35413 () Bool)

(assert (=> b!1312140 (= e!748452 tp_is_empty!35413)))

(declare-fun b!1312141 () Bool)

(declare-fun res!871156 () Bool)

(assert (=> b!1312141 (=> (not res!871156) (not e!748451))))

(assert (=> b!1312141 (= res!871156 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42892 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1312142 () Bool)

(declare-fun e!748454 () Bool)

(assert (=> b!1312142 (= e!748454 tp_is_empty!35413)))

(declare-fun mapNonEmpty!54748 () Bool)

(declare-fun mapRes!54748 () Bool)

(declare-fun tp!104372 () Bool)

(assert (=> mapNonEmpty!54748 (= mapRes!54748 (and tp!104372 e!748452))))

(declare-fun mapRest!54748 () (Array (_ BitVec 32) ValueCell!16808))

(declare-fun mapKey!54748 () (_ BitVec 32))

(declare-fun mapValue!54748 () ValueCell!16808)

(assert (=> mapNonEmpty!54748 (= (arr!42341 _values!1354) (store mapRest!54748 mapKey!54748 mapValue!54748))))

(declare-fun res!871150 () Bool)

(assert (=> start!110848 (=> (not res!871150) (not e!748451))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110848 (= res!871150 (validMask!0 mask!2040))))

(assert (=> start!110848 e!748451))

(assert (=> start!110848 tp!104371))

(declare-fun array_inv!32179 (array!87719) Bool)

(assert (=> start!110848 (array_inv!32179 _keys!1628)))

(assert (=> start!110848 true))

(assert (=> start!110848 tp_is_empty!35413))

(declare-fun e!748453 () Bool)

(declare-fun array_inv!32180 (array!87721) Bool)

(assert (=> start!110848 (and (array_inv!32180 _values!1354) e!748453)))

(declare-fun b!1312143 () Bool)

(declare-fun res!871149 () Bool)

(assert (=> b!1312143 (=> (not res!871149) (not e!748451))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1312143 (= res!871149 (validKeyInArray!0 (select (arr!42340 _keys!1628) from!2020)))))

(declare-fun b!1312144 () Bool)

(assert (=> b!1312144 (= e!748453 (and e!748454 mapRes!54748))))

(declare-fun condMapEmpty!54748 () Bool)

(declare-fun mapDefault!54748 () ValueCell!16808)

(assert (=> b!1312144 (= condMapEmpty!54748 (= (arr!42341 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16808)) mapDefault!54748)))))

(declare-fun b!1312145 () Bool)

(declare-fun res!871153 () Bool)

(assert (=> b!1312145 (=> (not res!871153) (not e!748451))))

(declare-datatypes ((List!30129 0))(
  ( (Nil!30126) (Cons!30125 (h!31334 (_ BitVec 64)) (t!43727 List!30129)) )
))
(declare-fun arrayNoDuplicates!0 (array!87719 (_ BitVec 32) List!30129) Bool)

(assert (=> b!1312145 (= res!871153 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30126))))

(declare-fun mapIsEmpty!54748 () Bool)

(assert (=> mapIsEmpty!54748 mapRes!54748))

(declare-fun b!1312146 () Bool)

(declare-fun res!871152 () Bool)

(assert (=> b!1312146 (=> (not res!871152) (not e!748451))))

(assert (=> b!1312146 (= res!871152 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1312147 () Bool)

(declare-fun res!871155 () Bool)

(assert (=> b!1312147 (=> (not res!871155) (not e!748451))))

(assert (=> b!1312147 (= res!871155 (not (= (select (arr!42340 _keys!1628) from!2020) k0!1175)))))

(declare-fun b!1312148 () Bool)

(declare-fun res!871154 () Bool)

(assert (=> b!1312148 (=> (not res!871154) (not e!748451))))

(assert (=> b!1312148 (= res!871154 (contains!8425 (getCurrentListMap!5243 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(assert (= (and start!110848 res!871150) b!1312139))

(assert (= (and b!1312139 res!871151) b!1312138))

(assert (= (and b!1312138 res!871148) b!1312145))

(assert (= (and b!1312145 res!871153) b!1312141))

(assert (= (and b!1312141 res!871156) b!1312148))

(assert (= (and b!1312148 res!871154) b!1312147))

(assert (= (and b!1312147 res!871155) b!1312143))

(assert (= (and b!1312143 res!871149) b!1312146))

(assert (= (and b!1312146 res!871152) b!1312137))

(assert (= (and b!1312144 condMapEmpty!54748) mapIsEmpty!54748))

(assert (= (and b!1312144 (not condMapEmpty!54748)) mapNonEmpty!54748))

(get-info :version)

(assert (= (and mapNonEmpty!54748 ((_ is ValueCellFull!16808) mapValue!54748)) b!1312140))

(assert (= (and b!1312144 ((_ is ValueCellFull!16808) mapDefault!54748)) b!1312142))

(assert (= start!110848 b!1312144))

(declare-fun m!1200933 () Bool)

(assert (=> b!1312148 m!1200933))

(assert (=> b!1312148 m!1200933))

(declare-fun m!1200935 () Bool)

(assert (=> b!1312148 m!1200935))

(declare-fun m!1200937 () Bool)

(assert (=> b!1312147 m!1200937))

(assert (=> b!1312143 m!1200937))

(assert (=> b!1312143 m!1200937))

(declare-fun m!1200939 () Bool)

(assert (=> b!1312143 m!1200939))

(declare-fun m!1200941 () Bool)

(assert (=> start!110848 m!1200941))

(declare-fun m!1200943 () Bool)

(assert (=> start!110848 m!1200943))

(declare-fun m!1200945 () Bool)

(assert (=> start!110848 m!1200945))

(declare-fun m!1200947 () Bool)

(assert (=> mapNonEmpty!54748 m!1200947))

(declare-fun m!1200949 () Bool)

(assert (=> b!1312137 m!1200949))

(assert (=> b!1312137 m!1200949))

(declare-fun m!1200951 () Bool)

(assert (=> b!1312137 m!1200951))

(declare-fun m!1200953 () Bool)

(assert (=> b!1312137 m!1200953))

(declare-fun m!1200955 () Bool)

(assert (=> b!1312145 m!1200955))

(declare-fun m!1200957 () Bool)

(assert (=> b!1312138 m!1200957))

(check-sat b_and!47873 (not b!1312137) (not b!1312143) tp_is_empty!35413 (not b_next!29683) (not start!110848) (not mapNonEmpty!54748) (not b!1312138) (not b!1312145) (not b!1312148))
(check-sat b_and!47873 (not b_next!29683))
