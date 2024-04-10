; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110586 () Bool)

(assert start!110586)

(declare-fun b_free!29421 () Bool)

(declare-fun b_next!29421 () Bool)

(assert (=> start!110586 (= b_free!29421 (not b_next!29421))))

(declare-fun tp!103585 () Bool)

(declare-fun b_and!47629 () Bool)

(assert (=> start!110586 (= tp!103585 b_and!47629)))

(declare-fun b!1308355 () Bool)

(declare-fun e!746518 () Bool)

(assert (=> b!1308355 (= e!746518 (not true))))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!87300 0))(
  ( (array!87301 (arr!42130 (Array (_ BitVec 32) (_ BitVec 64))) (size!42680 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87300)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-datatypes ((V!51971 0))(
  ( (V!51972 (val!17650 Int)) )
))
(declare-fun minValue!1296 () V!51971)

(declare-datatypes ((ValueCell!16677 0))(
  ( (ValueCellFull!16677 (v!20277 V!51971)) (EmptyCell!16677) )
))
(declare-datatypes ((array!87302 0))(
  ( (array!87303 (arr!42131 (Array (_ BitVec 32) ValueCell!16677)) (size!42681 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87302)

(declare-fun zeroValue!1296 () V!51971)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22726 0))(
  ( (tuple2!22727 (_1!11374 (_ BitVec 64)) (_2!11374 V!51971)) )
))
(declare-datatypes ((List!29867 0))(
  ( (Nil!29864) (Cons!29863 (h!31072 tuple2!22726) (t!43473 List!29867)) )
))
(declare-datatypes ((ListLongMap!20383 0))(
  ( (ListLongMap!20384 (toList!10207 List!29867)) )
))
(declare-fun contains!8357 (ListLongMap!20383 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5220 (array!87300 array!87302 (_ BitVec 32) (_ BitVec 32) V!51971 V!51971 (_ BitVec 32) Int) ListLongMap!20383)

(assert (=> b!1308355 (contains!8357 (getCurrentListMap!5220 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43292 0))(
  ( (Unit!43293) )
))
(declare-fun lt!585150 () Unit!43292)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXZero!10 (array!87300 array!87302 (_ BitVec 32) (_ BitVec 32) V!51971 V!51971 (_ BitVec 64) (_ BitVec 32) Int) Unit!43292)

(assert (=> b!1308355 (= lt!585150 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXZero!10 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1308356 () Bool)

(declare-fun res!868507 () Bool)

(assert (=> b!1308356 (=> (not res!868507) (not e!746518))))

(assert (=> b!1308356 (= res!868507 (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1308358 () Bool)

(declare-fun e!746521 () Bool)

(declare-fun e!746519 () Bool)

(declare-fun mapRes!54355 () Bool)

(assert (=> b!1308358 (= e!746521 (and e!746519 mapRes!54355))))

(declare-fun condMapEmpty!54355 () Bool)

(declare-fun mapDefault!54355 () ValueCell!16677)

(assert (=> b!1308358 (= condMapEmpty!54355 (= (arr!42131 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16677)) mapDefault!54355)))))

(declare-fun mapNonEmpty!54355 () Bool)

(declare-fun tp!103584 () Bool)

(declare-fun e!746520 () Bool)

(assert (=> mapNonEmpty!54355 (= mapRes!54355 (and tp!103584 e!746520))))

(declare-fun mapRest!54355 () (Array (_ BitVec 32) ValueCell!16677))

(declare-fun mapKey!54355 () (_ BitVec 32))

(declare-fun mapValue!54355 () ValueCell!16677)

(assert (=> mapNonEmpty!54355 (= (arr!42131 _values!1354) (store mapRest!54355 mapKey!54355 mapValue!54355))))

(declare-fun b!1308359 () Bool)

(declare-fun res!868512 () Bool)

(assert (=> b!1308359 (=> (not res!868512) (not e!746518))))

(assert (=> b!1308359 (= res!868512 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42680 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1308360 () Bool)

(declare-fun tp_is_empty!35151 () Bool)

(assert (=> b!1308360 (= e!746520 tp_is_empty!35151)))

(declare-fun b!1308361 () Bool)

(declare-fun res!868506 () Bool)

(assert (=> b!1308361 (=> (not res!868506) (not e!746518))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87300 (_ BitVec 32)) Bool)

(assert (=> b!1308361 (= res!868506 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapIsEmpty!54355 () Bool)

(assert (=> mapIsEmpty!54355 mapRes!54355))

(declare-fun b!1308362 () Bool)

(declare-fun res!868505 () Bool)

(assert (=> b!1308362 (=> (not res!868505) (not e!746518))))

(assert (=> b!1308362 (= res!868505 (contains!8357 (getCurrentListMap!5220 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1308363 () Bool)

(declare-fun res!868511 () Bool)

(assert (=> b!1308363 (=> (not res!868511) (not e!746518))))

(assert (=> b!1308363 (= res!868511 (and (= (size!42681 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42680 _keys!1628) (size!42681 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1308364 () Bool)

(declare-fun res!868508 () Bool)

(assert (=> b!1308364 (=> (not res!868508) (not e!746518))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1308364 (= res!868508 (validKeyInArray!0 (select (arr!42130 _keys!1628) from!2020)))))

(declare-fun res!868510 () Bool)

(assert (=> start!110586 (=> (not res!868510) (not e!746518))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110586 (= res!868510 (validMask!0 mask!2040))))

(assert (=> start!110586 e!746518))

(assert (=> start!110586 tp!103585))

(declare-fun array_inv!31841 (array!87300) Bool)

(assert (=> start!110586 (array_inv!31841 _keys!1628)))

(assert (=> start!110586 true))

(assert (=> start!110586 tp_is_empty!35151))

(declare-fun array_inv!31842 (array!87302) Bool)

(assert (=> start!110586 (and (array_inv!31842 _values!1354) e!746521)))

(declare-fun b!1308357 () Bool)

(declare-fun res!868504 () Bool)

(assert (=> b!1308357 (=> (not res!868504) (not e!746518))))

(declare-datatypes ((List!29868 0))(
  ( (Nil!29865) (Cons!29864 (h!31073 (_ BitVec 64)) (t!43474 List!29868)) )
))
(declare-fun arrayNoDuplicates!0 (array!87300 (_ BitVec 32) List!29868) Bool)

(assert (=> b!1308357 (= res!868504 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29865))))

(declare-fun b!1308365 () Bool)

(assert (=> b!1308365 (= e!746519 tp_is_empty!35151)))

(declare-fun b!1308366 () Bool)

(declare-fun res!868509 () Bool)

(assert (=> b!1308366 (=> (not res!868509) (not e!746518))))

(assert (=> b!1308366 (= res!868509 (not (= (select (arr!42130 _keys!1628) from!2020) k0!1175)))))

(assert (= (and start!110586 res!868510) b!1308363))

(assert (= (and b!1308363 res!868511) b!1308361))

(assert (= (and b!1308361 res!868506) b!1308357))

(assert (= (and b!1308357 res!868504) b!1308359))

(assert (= (and b!1308359 res!868512) b!1308362))

(assert (= (and b!1308362 res!868505) b!1308366))

(assert (= (and b!1308366 res!868509) b!1308364))

(assert (= (and b!1308364 res!868508) b!1308356))

(assert (= (and b!1308356 res!868507) b!1308355))

(assert (= (and b!1308358 condMapEmpty!54355) mapIsEmpty!54355))

(assert (= (and b!1308358 (not condMapEmpty!54355)) mapNonEmpty!54355))

(get-info :version)

(assert (= (and mapNonEmpty!54355 ((_ is ValueCellFull!16677) mapValue!54355)) b!1308360))

(assert (= (and b!1308358 ((_ is ValueCellFull!16677) mapDefault!54355)) b!1308365))

(assert (= start!110586 b!1308358))

(declare-fun m!1198763 () Bool)

(assert (=> b!1308366 m!1198763))

(declare-fun m!1198765 () Bool)

(assert (=> b!1308357 m!1198765))

(declare-fun m!1198767 () Bool)

(assert (=> mapNonEmpty!54355 m!1198767))

(declare-fun m!1198769 () Bool)

(assert (=> b!1308361 m!1198769))

(declare-fun m!1198771 () Bool)

(assert (=> b!1308362 m!1198771))

(assert (=> b!1308362 m!1198771))

(declare-fun m!1198773 () Bool)

(assert (=> b!1308362 m!1198773))

(assert (=> b!1308364 m!1198763))

(assert (=> b!1308364 m!1198763))

(declare-fun m!1198775 () Bool)

(assert (=> b!1308364 m!1198775))

(declare-fun m!1198777 () Bool)

(assert (=> b!1308355 m!1198777))

(assert (=> b!1308355 m!1198777))

(declare-fun m!1198779 () Bool)

(assert (=> b!1308355 m!1198779))

(declare-fun m!1198781 () Bool)

(assert (=> b!1308355 m!1198781))

(declare-fun m!1198783 () Bool)

(assert (=> start!110586 m!1198783))

(declare-fun m!1198785 () Bool)

(assert (=> start!110586 m!1198785))

(declare-fun m!1198787 () Bool)

(assert (=> start!110586 m!1198787))

(check-sat (not b!1308355) (not b!1308361) (not b_next!29421) (not b!1308357) (not b!1308362) (not start!110586) tp_is_empty!35151 (not b!1308364) b_and!47629 (not mapNonEmpty!54355))
(check-sat b_and!47629 (not b_next!29421))
