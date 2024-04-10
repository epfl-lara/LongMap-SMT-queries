; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111162 () Bool)

(assert start!111162)

(declare-fun b_free!29997 () Bool)

(declare-fun b_next!29997 () Bool)

(assert (=> start!111162 (= b_free!29997 (not b_next!29997))))

(declare-fun tp!105312 () Bool)

(declare-fun b_and!48205 () Bool)

(assert (=> start!111162 (= tp!105312 b_and!48205)))

(declare-fun b!1316194 () Bool)

(declare-fun res!873758 () Bool)

(declare-fun e!750839 () Bool)

(assert (=> b!1316194 (=> (not res!873758) (not e!750839))))

(declare-datatypes ((array!88412 0))(
  ( (array!88413 (arr!42686 (Array (_ BitVec 32) (_ BitVec 64))) (size!43236 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88412)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1316194 (= res!873758 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43236 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1316195 () Bool)

(declare-fun res!873759 () Bool)

(assert (=> b!1316195 (=> (not res!873759) (not e!750839))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1316195 (= res!873759 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1316196 () Bool)

(declare-fun e!750842 () Bool)

(declare-fun tp_is_empty!35727 () Bool)

(assert (=> b!1316196 (= e!750842 tp_is_empty!35727)))

(declare-fun b!1316197 () Bool)

(declare-fun res!873753 () Bool)

(assert (=> b!1316197 (=> (not res!873753) (not e!750839))))

(declare-datatypes ((List!30282 0))(
  ( (Nil!30279) (Cons!30278 (h!31487 (_ BitVec 64)) (t!43888 List!30282)) )
))
(declare-fun arrayNoDuplicates!0 (array!88412 (_ BitVec 32) List!30282) Bool)

(assert (=> b!1316197 (= res!873753 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30279))))

(declare-fun b!1316198 () Bool)

(declare-fun e!750841 () Bool)

(assert (=> b!1316198 (= e!750841 tp_is_empty!35727)))

(declare-fun b!1316199 () Bool)

(declare-fun e!750838 () Bool)

(declare-fun mapRes!55219 () Bool)

(assert (=> b!1316199 (= e!750838 (and e!750842 mapRes!55219))))

(declare-fun condMapEmpty!55219 () Bool)

(declare-datatypes ((V!52739 0))(
  ( (V!52740 (val!17938 Int)) )
))
(declare-datatypes ((ValueCell!16965 0))(
  ( (ValueCellFull!16965 (v!20565 V!52739)) (EmptyCell!16965) )
))
(declare-datatypes ((array!88414 0))(
  ( (array!88415 (arr!42687 (Array (_ BitVec 32) ValueCell!16965)) (size!43237 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88414)

(declare-fun mapDefault!55219 () ValueCell!16965)

(assert (=> b!1316199 (= condMapEmpty!55219 (= (arr!42687 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16965)) mapDefault!55219)))))

(declare-fun b!1316200 () Bool)

(declare-fun res!873757 () Bool)

(assert (=> b!1316200 (=> (not res!873757) (not e!750839))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun minValue!1296 () V!52739)

(declare-fun zeroValue!1296 () V!52739)

(declare-datatypes ((tuple2!23144 0))(
  ( (tuple2!23145 (_1!11583 (_ BitVec 64)) (_2!11583 V!52739)) )
))
(declare-datatypes ((List!30283 0))(
  ( (Nil!30280) (Cons!30279 (h!31488 tuple2!23144) (t!43889 List!30283)) )
))
(declare-datatypes ((ListLongMap!20801 0))(
  ( (ListLongMap!20802 (toList!10416 List!30283)) )
))
(declare-fun contains!8566 (ListLongMap!20801 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5429 (array!88412 array!88414 (_ BitVec 32) (_ BitVec 32) V!52739 V!52739 (_ BitVec 32) Int) ListLongMap!20801)

(assert (=> b!1316200 (= res!873757 (contains!8566 (getCurrentListMap!5429 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1316201 () Bool)

(declare-fun res!873754 () Bool)

(assert (=> b!1316201 (=> (not res!873754) (not e!750839))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88412 (_ BitVec 32)) Bool)

(assert (=> b!1316201 (= res!873754 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1316202 () Bool)

(declare-fun res!873751 () Bool)

(assert (=> b!1316202 (=> (not res!873751) (not e!750839))))

(assert (=> b!1316202 (= res!873751 (not (= (select (arr!42686 _keys!1628) from!2020) k0!1175)))))

(declare-fun mapNonEmpty!55219 () Bool)

(declare-fun tp!105313 () Bool)

(assert (=> mapNonEmpty!55219 (= mapRes!55219 (and tp!105313 e!750841))))

(declare-fun mapKey!55219 () (_ BitVec 32))

(declare-fun mapRest!55219 () (Array (_ BitVec 32) ValueCell!16965))

(declare-fun mapValue!55219 () ValueCell!16965)

(assert (=> mapNonEmpty!55219 (= (arr!42687 _values!1354) (store mapRest!55219 mapKey!55219 mapValue!55219))))

(declare-fun mapIsEmpty!55219 () Bool)

(assert (=> mapIsEmpty!55219 mapRes!55219))

(declare-fun b!1316203 () Bool)

(declare-fun res!873752 () Bool)

(assert (=> b!1316203 (=> (not res!873752) (not e!750839))))

(assert (=> b!1316203 (= res!873752 (and (= (size!43237 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43236 _keys!1628) (size!43237 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1316204 () Bool)

(declare-fun res!873755 () Bool)

(assert (=> b!1316204 (=> (not res!873755) (not e!750839))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1316204 (= res!873755 (validKeyInArray!0 (select (arr!42686 _keys!1628) from!2020)))))

(declare-fun b!1316205 () Bool)

(assert (=> b!1316205 (= e!750839 (not true))))

(assert (=> b!1316205 (contains!8566 (getCurrentListMap!5429 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43398 0))(
  ( (Unit!43399) )
))
(declare-fun lt!586005 () Unit!43398)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstXKeys!21 (array!88412 array!88414 (_ BitVec 32) (_ BitVec 32) V!52739 V!52739 (_ BitVec 64) (_ BitVec 32) Int) Unit!43398)

(assert (=> b!1316205 (= lt!586005 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstXKeys!21 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun res!873756 () Bool)

(assert (=> start!111162 (=> (not res!873756) (not e!750839))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111162 (= res!873756 (validMask!0 mask!2040))))

(assert (=> start!111162 e!750839))

(assert (=> start!111162 tp!105312))

(declare-fun array_inv!32237 (array!88412) Bool)

(assert (=> start!111162 (array_inv!32237 _keys!1628)))

(assert (=> start!111162 true))

(assert (=> start!111162 tp_is_empty!35727))

(declare-fun array_inv!32238 (array!88414) Bool)

(assert (=> start!111162 (and (array_inv!32238 _values!1354) e!750838)))

(assert (= (and start!111162 res!873756) b!1316203))

(assert (= (and b!1316203 res!873752) b!1316201))

(assert (= (and b!1316201 res!873754) b!1316197))

(assert (= (and b!1316197 res!873753) b!1316194))

(assert (= (and b!1316194 res!873758) b!1316200))

(assert (= (and b!1316200 res!873757) b!1316202))

(assert (= (and b!1316202 res!873751) b!1316204))

(assert (= (and b!1316204 res!873755) b!1316195))

(assert (= (and b!1316195 res!873759) b!1316205))

(assert (= (and b!1316199 condMapEmpty!55219) mapIsEmpty!55219))

(assert (= (and b!1316199 (not condMapEmpty!55219)) mapNonEmpty!55219))

(get-info :version)

(assert (= (and mapNonEmpty!55219 ((_ is ValueCellFull!16965) mapValue!55219)) b!1316198))

(assert (= (and b!1316199 ((_ is ValueCellFull!16965) mapDefault!55219)) b!1316196))

(assert (= start!111162 b!1316199))

(declare-fun m!1204133 () Bool)

(assert (=> b!1316205 m!1204133))

(assert (=> b!1316205 m!1204133))

(declare-fun m!1204135 () Bool)

(assert (=> b!1316205 m!1204135))

(declare-fun m!1204137 () Bool)

(assert (=> b!1316205 m!1204137))

(declare-fun m!1204139 () Bool)

(assert (=> start!111162 m!1204139))

(declare-fun m!1204141 () Bool)

(assert (=> start!111162 m!1204141))

(declare-fun m!1204143 () Bool)

(assert (=> start!111162 m!1204143))

(declare-fun m!1204145 () Bool)

(assert (=> b!1316200 m!1204145))

(assert (=> b!1316200 m!1204145))

(declare-fun m!1204147 () Bool)

(assert (=> b!1316200 m!1204147))

(declare-fun m!1204149 () Bool)

(assert (=> b!1316197 m!1204149))

(declare-fun m!1204151 () Bool)

(assert (=> b!1316202 m!1204151))

(declare-fun m!1204153 () Bool)

(assert (=> mapNonEmpty!55219 m!1204153))

(assert (=> b!1316204 m!1204151))

(assert (=> b!1316204 m!1204151))

(declare-fun m!1204155 () Bool)

(assert (=> b!1316204 m!1204155))

(declare-fun m!1204157 () Bool)

(assert (=> b!1316201 m!1204157))

(check-sat (not b!1316205) (not b!1316200) (not start!111162) (not mapNonEmpty!55219) tp_is_empty!35727 (not b_next!29997) (not b!1316204) (not b!1316197) b_and!48205 (not b!1316201))
(check-sat b_and!48205 (not b_next!29997))
