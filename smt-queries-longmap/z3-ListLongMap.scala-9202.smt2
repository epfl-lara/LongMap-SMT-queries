; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110562 () Bool)

(assert start!110562)

(declare-fun b_free!29397 () Bool)

(declare-fun b_next!29397 () Bool)

(assert (=> start!110562 (= b_free!29397 (not b_next!29397))))

(declare-fun tp!103513 () Bool)

(declare-fun b_and!47605 () Bool)

(assert (=> start!110562 (= tp!103513 b_and!47605)))

(declare-fun mapIsEmpty!54319 () Bool)

(declare-fun mapRes!54319 () Bool)

(assert (=> mapIsEmpty!54319 mapRes!54319))

(declare-fun b!1307923 () Bool)

(declare-fun e!746339 () Bool)

(declare-fun tp_is_empty!35127 () Bool)

(assert (=> b!1307923 (= e!746339 tp_is_empty!35127)))

(declare-fun b!1307924 () Bool)

(declare-fun e!746338 () Bool)

(assert (=> b!1307924 (= e!746338 (not true))))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!87254 0))(
  ( (array!87255 (arr!42107 (Array (_ BitVec 32) (_ BitVec 64))) (size!42657 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87254)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-datatypes ((V!51939 0))(
  ( (V!51940 (val!17638 Int)) )
))
(declare-fun minValue!1296 () V!51939)

(declare-datatypes ((ValueCell!16665 0))(
  ( (ValueCellFull!16665 (v!20265 V!51939)) (EmptyCell!16665) )
))
(declare-datatypes ((array!87256 0))(
  ( (array!87257 (arr!42108 (Array (_ BitVec 32) ValueCell!16665)) (size!42658 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87256)

(declare-fun zeroValue!1296 () V!51939)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22708 0))(
  ( (tuple2!22709 (_1!11365 (_ BitVec 64)) (_2!11365 V!51939)) )
))
(declare-datatypes ((List!29850 0))(
  ( (Nil!29847) (Cons!29846 (h!31055 tuple2!22708) (t!43456 List!29850)) )
))
(declare-datatypes ((ListLongMap!20365 0))(
  ( (ListLongMap!20366 (toList!10198 List!29850)) )
))
(declare-fun contains!8348 (ListLongMap!20365 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5211 (array!87254 array!87256 (_ BitVec 32) (_ BitVec 32) V!51939 V!51939 (_ BitVec 32) Int) ListLongMap!20365)

(assert (=> b!1307924 (contains!8348 (getCurrentListMap!5211 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43276 0))(
  ( (Unit!43277) )
))
(declare-fun lt!585114 () Unit!43276)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXZero!2 (array!87254 array!87256 (_ BitVec 32) (_ BitVec 32) V!51939 V!51939 (_ BitVec 64) (_ BitVec 32) Int) Unit!43276)

(assert (=> b!1307924 (= lt!585114 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXZero!2 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1307925 () Bool)

(declare-fun res!868185 () Bool)

(assert (=> b!1307925 (=> (not res!868185) (not e!746338))))

(assert (=> b!1307925 (= res!868185 (contains!8348 (getCurrentListMap!5211 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1307927 () Bool)

(declare-fun res!868180 () Bool)

(assert (=> b!1307927 (=> (not res!868180) (not e!746338))))

(assert (=> b!1307927 (= res!868180 (not (= (select (arr!42107 _keys!1628) from!2020) k0!1175)))))

(declare-fun b!1307928 () Bool)

(declare-fun res!868181 () Bool)

(assert (=> b!1307928 (=> (not res!868181) (not e!746338))))

(assert (=> b!1307928 (= res!868181 (and (= (size!42658 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42657 _keys!1628) (size!42658 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!54319 () Bool)

(declare-fun tp!103512 () Bool)

(declare-fun e!746342 () Bool)

(assert (=> mapNonEmpty!54319 (= mapRes!54319 (and tp!103512 e!746342))))

(declare-fun mapValue!54319 () ValueCell!16665)

(declare-fun mapRest!54319 () (Array (_ BitVec 32) ValueCell!16665))

(declare-fun mapKey!54319 () (_ BitVec 32))

(assert (=> mapNonEmpty!54319 (= (arr!42108 _values!1354) (store mapRest!54319 mapKey!54319 mapValue!54319))))

(declare-fun b!1307929 () Bool)

(assert (=> b!1307929 (= e!746342 tp_is_empty!35127)))

(declare-fun b!1307930 () Bool)

(declare-fun res!868186 () Bool)

(assert (=> b!1307930 (=> (not res!868186) (not e!746338))))

(declare-datatypes ((List!29851 0))(
  ( (Nil!29848) (Cons!29847 (h!31056 (_ BitVec 64)) (t!43457 List!29851)) )
))
(declare-fun arrayNoDuplicates!0 (array!87254 (_ BitVec 32) List!29851) Bool)

(assert (=> b!1307930 (= res!868186 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29848))))

(declare-fun res!868188 () Bool)

(assert (=> start!110562 (=> (not res!868188) (not e!746338))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110562 (= res!868188 (validMask!0 mask!2040))))

(assert (=> start!110562 e!746338))

(assert (=> start!110562 tp!103513))

(declare-fun array_inv!31823 (array!87254) Bool)

(assert (=> start!110562 (array_inv!31823 _keys!1628)))

(assert (=> start!110562 true))

(assert (=> start!110562 tp_is_empty!35127))

(declare-fun e!746341 () Bool)

(declare-fun array_inv!31824 (array!87256) Bool)

(assert (=> start!110562 (and (array_inv!31824 _values!1354) e!746341)))

(declare-fun b!1307926 () Bool)

(declare-fun res!868182 () Bool)

(assert (=> b!1307926 (=> (not res!868182) (not e!746338))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1307926 (= res!868182 (validKeyInArray!0 (select (arr!42107 _keys!1628) from!2020)))))

(declare-fun b!1307931 () Bool)

(declare-fun res!868187 () Bool)

(assert (=> b!1307931 (=> (not res!868187) (not e!746338))))

(assert (=> b!1307931 (= res!868187 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42657 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1307932 () Bool)

(assert (=> b!1307932 (= e!746341 (and e!746339 mapRes!54319))))

(declare-fun condMapEmpty!54319 () Bool)

(declare-fun mapDefault!54319 () ValueCell!16665)

(assert (=> b!1307932 (= condMapEmpty!54319 (= (arr!42108 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16665)) mapDefault!54319)))))

(declare-fun b!1307933 () Bool)

(declare-fun res!868184 () Bool)

(assert (=> b!1307933 (=> (not res!868184) (not e!746338))))

(assert (=> b!1307933 (= res!868184 (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1307934 () Bool)

(declare-fun res!868183 () Bool)

(assert (=> b!1307934 (=> (not res!868183) (not e!746338))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87254 (_ BitVec 32)) Bool)

(assert (=> b!1307934 (= res!868183 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(assert (= (and start!110562 res!868188) b!1307928))

(assert (= (and b!1307928 res!868181) b!1307934))

(assert (= (and b!1307934 res!868183) b!1307930))

(assert (= (and b!1307930 res!868186) b!1307931))

(assert (= (and b!1307931 res!868187) b!1307925))

(assert (= (and b!1307925 res!868185) b!1307927))

(assert (= (and b!1307927 res!868180) b!1307926))

(assert (= (and b!1307926 res!868182) b!1307933))

(assert (= (and b!1307933 res!868184) b!1307924))

(assert (= (and b!1307932 condMapEmpty!54319) mapIsEmpty!54319))

(assert (= (and b!1307932 (not condMapEmpty!54319)) mapNonEmpty!54319))

(get-info :version)

(assert (= (and mapNonEmpty!54319 ((_ is ValueCellFull!16665) mapValue!54319)) b!1307929))

(assert (= (and b!1307932 ((_ is ValueCellFull!16665) mapDefault!54319)) b!1307923))

(assert (= start!110562 b!1307932))

(declare-fun m!1198451 () Bool)

(assert (=> mapNonEmpty!54319 m!1198451))

(declare-fun m!1198453 () Bool)

(assert (=> b!1307926 m!1198453))

(assert (=> b!1307926 m!1198453))

(declare-fun m!1198455 () Bool)

(assert (=> b!1307926 m!1198455))

(declare-fun m!1198457 () Bool)

(assert (=> b!1307930 m!1198457))

(assert (=> b!1307927 m!1198453))

(declare-fun m!1198459 () Bool)

(assert (=> b!1307924 m!1198459))

(assert (=> b!1307924 m!1198459))

(declare-fun m!1198461 () Bool)

(assert (=> b!1307924 m!1198461))

(declare-fun m!1198463 () Bool)

(assert (=> b!1307924 m!1198463))

(declare-fun m!1198465 () Bool)

(assert (=> start!110562 m!1198465))

(declare-fun m!1198467 () Bool)

(assert (=> start!110562 m!1198467))

(declare-fun m!1198469 () Bool)

(assert (=> start!110562 m!1198469))

(declare-fun m!1198471 () Bool)

(assert (=> b!1307925 m!1198471))

(assert (=> b!1307925 m!1198471))

(declare-fun m!1198473 () Bool)

(assert (=> b!1307925 m!1198473))

(declare-fun m!1198475 () Bool)

(assert (=> b!1307934 m!1198475))

(check-sat (not b!1307925) tp_is_empty!35127 (not b_next!29397) (not b!1307926) (not b!1307930) (not b!1307934) (not mapNonEmpty!54319) (not b!1307924) (not start!110562) b_and!47605)
(check-sat b_and!47605 (not b_next!29397))
