; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110566 () Bool)

(assert start!110566)

(declare-fun b_free!29401 () Bool)

(declare-fun b_next!29401 () Bool)

(assert (=> start!110566 (= b_free!29401 (not b_next!29401))))

(declare-fun tp!103525 () Bool)

(declare-fun b_and!47591 () Bool)

(assert (=> start!110566 (= tp!103525 b_and!47591)))

(declare-fun b!1307925 () Bool)

(declare-fun res!868213 () Bool)

(declare-fun e!746339 () Bool)

(assert (=> b!1307925 (=> (not res!868213) (not e!746339))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1307925 (= res!868213 (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1307926 () Bool)

(assert (=> b!1307926 (= e!746339 (not true))))

(declare-datatypes ((array!87177 0))(
  ( (array!87178 (arr!42069 (Array (_ BitVec 32) (_ BitVec 64))) (size!42621 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87177)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-datatypes ((V!51945 0))(
  ( (V!51946 (val!17640 Int)) )
))
(declare-fun minValue!1296 () V!51945)

(declare-datatypes ((ValueCell!16667 0))(
  ( (ValueCellFull!16667 (v!20266 V!51945)) (EmptyCell!16667) )
))
(declare-datatypes ((array!87179 0))(
  ( (array!87180 (arr!42070 (Array (_ BitVec 32) ValueCell!16667)) (size!42622 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87179)

(declare-fun zeroValue!1296 () V!51945)

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((tuple2!22794 0))(
  ( (tuple2!22795 (_1!11408 (_ BitVec 64)) (_2!11408 V!51945)) )
))
(declare-datatypes ((List!29920 0))(
  ( (Nil!29917) (Cons!29916 (h!31125 tuple2!22794) (t!43518 List!29920)) )
))
(declare-datatypes ((ListLongMap!20451 0))(
  ( (ListLongMap!20452 (toList!10241 List!29920)) )
))
(declare-fun contains!8318 (ListLongMap!20451 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5136 (array!87177 array!87179 (_ BitVec 32) (_ BitVec 32) V!51945 V!51945 (_ BitVec 32) Int) ListLongMap!20451)

(assert (=> b!1307926 (contains!8318 (getCurrentListMap!5136 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43115 0))(
  ( (Unit!43116) )
))
(declare-fun lt!584934 () Unit!43115)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXZero!2 (array!87177 array!87179 (_ BitVec 32) (_ BitVec 32) V!51945 V!51945 (_ BitVec 64) (_ BitVec 32) Int) Unit!43115)

(assert (=> b!1307926 (= lt!584934 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXZero!2 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1307927 () Bool)

(declare-fun res!868212 () Bool)

(assert (=> b!1307927 (=> (not res!868212) (not e!746339))))

(declare-datatypes ((List!29921 0))(
  ( (Nil!29918) (Cons!29917 (h!31126 (_ BitVec 64)) (t!43519 List!29921)) )
))
(declare-fun arrayNoDuplicates!0 (array!87177 (_ BitVec 32) List!29921) Bool)

(assert (=> b!1307927 (= res!868212 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29918))))

(declare-fun b!1307928 () Bool)

(declare-fun res!868206 () Bool)

(assert (=> b!1307928 (=> (not res!868206) (not e!746339))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87177 (_ BitVec 32)) Bool)

(assert (=> b!1307928 (= res!868206 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1307929 () Bool)

(declare-fun e!746336 () Bool)

(declare-fun e!746335 () Bool)

(declare-fun mapRes!54325 () Bool)

(assert (=> b!1307929 (= e!746336 (and e!746335 mapRes!54325))))

(declare-fun condMapEmpty!54325 () Bool)

(declare-fun mapDefault!54325 () ValueCell!16667)

(assert (=> b!1307929 (= condMapEmpty!54325 (= (arr!42070 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16667)) mapDefault!54325)))))

(declare-fun b!1307930 () Bool)

(declare-fun res!868209 () Bool)

(assert (=> b!1307930 (=> (not res!868209) (not e!746339))))

(assert (=> b!1307930 (= res!868209 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42621 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1307931 () Bool)

(declare-fun res!868205 () Bool)

(assert (=> b!1307931 (=> (not res!868205) (not e!746339))))

(assert (=> b!1307931 (= res!868205 (contains!8318 (getCurrentListMap!5136 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1307932 () Bool)

(declare-fun res!868210 () Bool)

(assert (=> b!1307932 (=> (not res!868210) (not e!746339))))

(assert (=> b!1307932 (= res!868210 (not (= (select (arr!42069 _keys!1628) from!2020) k0!1175)))))

(declare-fun res!868207 () Bool)

(assert (=> start!110566 (=> (not res!868207) (not e!746339))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110566 (= res!868207 (validMask!0 mask!2040))))

(assert (=> start!110566 e!746339))

(assert (=> start!110566 tp!103525))

(declare-fun array_inv!31991 (array!87177) Bool)

(assert (=> start!110566 (array_inv!31991 _keys!1628)))

(assert (=> start!110566 true))

(declare-fun tp_is_empty!35131 () Bool)

(assert (=> start!110566 tp_is_empty!35131))

(declare-fun array_inv!31992 (array!87179) Bool)

(assert (=> start!110566 (and (array_inv!31992 _values!1354) e!746336)))

(declare-fun b!1307933 () Bool)

(assert (=> b!1307933 (= e!746335 tp_is_empty!35131)))

(declare-fun b!1307934 () Bool)

(declare-fun res!868208 () Bool)

(assert (=> b!1307934 (=> (not res!868208) (not e!746339))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1307934 (= res!868208 (validKeyInArray!0 (select (arr!42069 _keys!1628) from!2020)))))

(declare-fun b!1307935 () Bool)

(declare-fun res!868211 () Bool)

(assert (=> b!1307935 (=> (not res!868211) (not e!746339))))

(assert (=> b!1307935 (= res!868211 (and (= (size!42622 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42621 _keys!1628) (size!42622 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1307936 () Bool)

(declare-fun e!746338 () Bool)

(assert (=> b!1307936 (= e!746338 tp_is_empty!35131)))

(declare-fun mapNonEmpty!54325 () Bool)

(declare-fun tp!103526 () Bool)

(assert (=> mapNonEmpty!54325 (= mapRes!54325 (and tp!103526 e!746338))))

(declare-fun mapRest!54325 () (Array (_ BitVec 32) ValueCell!16667))

(declare-fun mapKey!54325 () (_ BitVec 32))

(declare-fun mapValue!54325 () ValueCell!16667)

(assert (=> mapNonEmpty!54325 (= (arr!42070 _values!1354) (store mapRest!54325 mapKey!54325 mapValue!54325))))

(declare-fun mapIsEmpty!54325 () Bool)

(assert (=> mapIsEmpty!54325 mapRes!54325))

(assert (= (and start!110566 res!868207) b!1307935))

(assert (= (and b!1307935 res!868211) b!1307928))

(assert (= (and b!1307928 res!868206) b!1307927))

(assert (= (and b!1307927 res!868212) b!1307930))

(assert (= (and b!1307930 res!868209) b!1307931))

(assert (= (and b!1307931 res!868205) b!1307932))

(assert (= (and b!1307932 res!868210) b!1307934))

(assert (= (and b!1307934 res!868208) b!1307925))

(assert (= (and b!1307925 res!868213) b!1307926))

(assert (= (and b!1307929 condMapEmpty!54325) mapIsEmpty!54325))

(assert (= (and b!1307929 (not condMapEmpty!54325)) mapNonEmpty!54325))

(get-info :version)

(assert (= (and mapNonEmpty!54325 ((_ is ValueCellFull!16667) mapValue!54325)) b!1307936))

(assert (= (and b!1307929 ((_ is ValueCellFull!16667) mapDefault!54325)) b!1307933))

(assert (= start!110566 b!1307929))

(declare-fun m!1197987 () Bool)

(assert (=> start!110566 m!1197987))

(declare-fun m!1197989 () Bool)

(assert (=> start!110566 m!1197989))

(declare-fun m!1197991 () Bool)

(assert (=> start!110566 m!1197991))

(declare-fun m!1197993 () Bool)

(assert (=> b!1307927 m!1197993))

(declare-fun m!1197995 () Bool)

(assert (=> b!1307928 m!1197995))

(declare-fun m!1197997 () Bool)

(assert (=> b!1307934 m!1197997))

(assert (=> b!1307934 m!1197997))

(declare-fun m!1197999 () Bool)

(assert (=> b!1307934 m!1197999))

(declare-fun m!1198001 () Bool)

(assert (=> mapNonEmpty!54325 m!1198001))

(assert (=> b!1307932 m!1197997))

(declare-fun m!1198003 () Bool)

(assert (=> b!1307931 m!1198003))

(assert (=> b!1307931 m!1198003))

(declare-fun m!1198005 () Bool)

(assert (=> b!1307931 m!1198005))

(declare-fun m!1198007 () Bool)

(assert (=> b!1307926 m!1198007))

(assert (=> b!1307926 m!1198007))

(declare-fun m!1198009 () Bool)

(assert (=> b!1307926 m!1198009))

(declare-fun m!1198011 () Bool)

(assert (=> b!1307926 m!1198011))

(check-sat (not b!1307926) (not b!1307927) tp_is_empty!35131 (not b!1307931) (not start!110566) (not b_next!29401) (not b!1307934) (not mapNonEmpty!54325) (not b!1307928) b_and!47591)
(check-sat b_and!47591 (not b_next!29401))
