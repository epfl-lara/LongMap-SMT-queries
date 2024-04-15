; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110572 () Bool)

(assert start!110572)

(declare-fun b_free!29407 () Bool)

(declare-fun b_next!29407 () Bool)

(assert (=> start!110572 (= b_free!29407 (not b_next!29407))))

(declare-fun tp!103543 () Bool)

(declare-fun b_and!47597 () Bool)

(assert (=> start!110572 (= tp!103543 b_and!47597)))

(declare-fun b!1308033 () Bool)

(declare-fun e!746380 () Bool)

(declare-fun e!746381 () Bool)

(declare-fun mapRes!54334 () Bool)

(assert (=> b!1308033 (= e!746380 (and e!746381 mapRes!54334))))

(declare-fun condMapEmpty!54334 () Bool)

(declare-datatypes ((V!51953 0))(
  ( (V!51954 (val!17643 Int)) )
))
(declare-datatypes ((ValueCell!16670 0))(
  ( (ValueCellFull!16670 (v!20269 V!51953)) (EmptyCell!16670) )
))
(declare-datatypes ((array!87189 0))(
  ( (array!87190 (arr!42075 (Array (_ BitVec 32) ValueCell!16670)) (size!42627 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87189)

(declare-fun mapDefault!54334 () ValueCell!16670)

(assert (=> b!1308033 (= condMapEmpty!54334 (= (arr!42075 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16670)) mapDefault!54334)))))

(declare-fun res!868294 () Bool)

(declare-fun e!746383 () Bool)

(assert (=> start!110572 (=> (not res!868294) (not e!746383))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110572 (= res!868294 (validMask!0 mask!2040))))

(assert (=> start!110572 e!746383))

(assert (=> start!110572 tp!103543))

(declare-datatypes ((array!87191 0))(
  ( (array!87192 (arr!42076 (Array (_ BitVec 32) (_ BitVec 64))) (size!42628 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87191)

(declare-fun array_inv!31995 (array!87191) Bool)

(assert (=> start!110572 (array_inv!31995 _keys!1628)))

(assert (=> start!110572 true))

(declare-fun tp_is_empty!35137 () Bool)

(assert (=> start!110572 tp_is_empty!35137))

(declare-fun array_inv!31996 (array!87189) Bool)

(assert (=> start!110572 (and (array_inv!31996 _values!1354) e!746380)))

(declare-fun b!1308034 () Bool)

(declare-fun res!868286 () Bool)

(assert (=> b!1308034 (=> (not res!868286) (not e!746383))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!51953)

(declare-fun zeroValue!1296 () V!51953)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22798 0))(
  ( (tuple2!22799 (_1!11410 (_ BitVec 64)) (_2!11410 V!51953)) )
))
(declare-datatypes ((List!29924 0))(
  ( (Nil!29921) (Cons!29920 (h!31129 tuple2!22798) (t!43522 List!29924)) )
))
(declare-datatypes ((ListLongMap!20455 0))(
  ( (ListLongMap!20456 (toList!10243 List!29924)) )
))
(declare-fun contains!8320 (ListLongMap!20455 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5138 (array!87191 array!87189 (_ BitVec 32) (_ BitVec 32) V!51953 V!51953 (_ BitVec 32) Int) ListLongMap!20455)

(assert (=> b!1308034 (= res!868286 (contains!8320 (getCurrentListMap!5138 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1308035 () Bool)

(declare-fun res!868288 () Bool)

(assert (=> b!1308035 (=> (not res!868288) (not e!746383))))

(assert (=> b!1308035 (= res!868288 (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1308036 () Bool)

(declare-fun res!868287 () Bool)

(assert (=> b!1308036 (=> (not res!868287) (not e!746383))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1308036 (= res!868287 (validKeyInArray!0 (select (arr!42076 _keys!1628) from!2020)))))

(declare-fun b!1308037 () Bool)

(declare-fun res!868291 () Bool)

(assert (=> b!1308037 (=> (not res!868291) (not e!746383))))

(assert (=> b!1308037 (= res!868291 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42628 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1308038 () Bool)

(declare-fun res!868289 () Bool)

(assert (=> b!1308038 (=> (not res!868289) (not e!746383))))

(assert (=> b!1308038 (= res!868289 (and (= (size!42627 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42628 _keys!1628) (size!42627 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1308039 () Bool)

(assert (=> b!1308039 (= e!746383 (not true))))

(assert (=> b!1308039 (contains!8320 (getCurrentListMap!5138 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43119 0))(
  ( (Unit!43120) )
))
(declare-fun lt!584943 () Unit!43119)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXZero!4 (array!87191 array!87189 (_ BitVec 32) (_ BitVec 32) V!51953 V!51953 (_ BitVec 64) (_ BitVec 32) Int) Unit!43119)

(assert (=> b!1308039 (= lt!584943 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXZero!4 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1308040 () Bool)

(assert (=> b!1308040 (= e!746381 tp_is_empty!35137)))

(declare-fun b!1308041 () Bool)

(declare-fun res!868292 () Bool)

(assert (=> b!1308041 (=> (not res!868292) (not e!746383))))

(declare-datatypes ((List!29925 0))(
  ( (Nil!29922) (Cons!29921 (h!31130 (_ BitVec 64)) (t!43523 List!29925)) )
))
(declare-fun arrayNoDuplicates!0 (array!87191 (_ BitVec 32) List!29925) Bool)

(assert (=> b!1308041 (= res!868292 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29922))))

(declare-fun mapNonEmpty!54334 () Bool)

(declare-fun tp!103544 () Bool)

(declare-fun e!746384 () Bool)

(assert (=> mapNonEmpty!54334 (= mapRes!54334 (and tp!103544 e!746384))))

(declare-fun mapValue!54334 () ValueCell!16670)

(declare-fun mapRest!54334 () (Array (_ BitVec 32) ValueCell!16670))

(declare-fun mapKey!54334 () (_ BitVec 32))

(assert (=> mapNonEmpty!54334 (= (arr!42075 _values!1354) (store mapRest!54334 mapKey!54334 mapValue!54334))))

(declare-fun mapIsEmpty!54334 () Bool)

(assert (=> mapIsEmpty!54334 mapRes!54334))

(declare-fun b!1308042 () Bool)

(declare-fun res!868290 () Bool)

(assert (=> b!1308042 (=> (not res!868290) (not e!746383))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87191 (_ BitVec 32)) Bool)

(assert (=> b!1308042 (= res!868290 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1308043 () Bool)

(declare-fun res!868293 () Bool)

(assert (=> b!1308043 (=> (not res!868293) (not e!746383))))

(assert (=> b!1308043 (= res!868293 (not (= (select (arr!42076 _keys!1628) from!2020) k0!1175)))))

(declare-fun b!1308044 () Bool)

(assert (=> b!1308044 (= e!746384 tp_is_empty!35137)))

(assert (= (and start!110572 res!868294) b!1308038))

(assert (= (and b!1308038 res!868289) b!1308042))

(assert (= (and b!1308042 res!868290) b!1308041))

(assert (= (and b!1308041 res!868292) b!1308037))

(assert (= (and b!1308037 res!868291) b!1308034))

(assert (= (and b!1308034 res!868286) b!1308043))

(assert (= (and b!1308043 res!868293) b!1308036))

(assert (= (and b!1308036 res!868287) b!1308035))

(assert (= (and b!1308035 res!868288) b!1308039))

(assert (= (and b!1308033 condMapEmpty!54334) mapIsEmpty!54334))

(assert (= (and b!1308033 (not condMapEmpty!54334)) mapNonEmpty!54334))

(get-info :version)

(assert (= (and mapNonEmpty!54334 ((_ is ValueCellFull!16670) mapValue!54334)) b!1308044))

(assert (= (and b!1308033 ((_ is ValueCellFull!16670) mapDefault!54334)) b!1308040))

(assert (= start!110572 b!1308033))

(declare-fun m!1198065 () Bool)

(assert (=> b!1308042 m!1198065))

(declare-fun m!1198067 () Bool)

(assert (=> b!1308043 m!1198067))

(declare-fun m!1198069 () Bool)

(assert (=> mapNonEmpty!54334 m!1198069))

(declare-fun m!1198071 () Bool)

(assert (=> start!110572 m!1198071))

(declare-fun m!1198073 () Bool)

(assert (=> start!110572 m!1198073))

(declare-fun m!1198075 () Bool)

(assert (=> start!110572 m!1198075))

(declare-fun m!1198077 () Bool)

(assert (=> b!1308041 m!1198077))

(assert (=> b!1308036 m!1198067))

(assert (=> b!1308036 m!1198067))

(declare-fun m!1198079 () Bool)

(assert (=> b!1308036 m!1198079))

(declare-fun m!1198081 () Bool)

(assert (=> b!1308034 m!1198081))

(assert (=> b!1308034 m!1198081))

(declare-fun m!1198083 () Bool)

(assert (=> b!1308034 m!1198083))

(declare-fun m!1198085 () Bool)

(assert (=> b!1308039 m!1198085))

(assert (=> b!1308039 m!1198085))

(declare-fun m!1198087 () Bool)

(assert (=> b!1308039 m!1198087))

(declare-fun m!1198089 () Bool)

(assert (=> b!1308039 m!1198089))

(check-sat (not b!1308036) tp_is_empty!35137 b_and!47597 (not start!110572) (not b!1308042) (not b!1308041) (not b!1308034) (not b_next!29407) (not mapNonEmpty!54334) (not b!1308039))
(check-sat b_and!47597 (not b_next!29407))
