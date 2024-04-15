; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104670 () Bool)

(assert start!104670)

(declare-fun b_free!26491 () Bool)

(declare-fun b_next!26491 () Bool)

(assert (=> start!104670 (= b_free!26491 (not b_next!26491))))

(declare-fun tp!92960 () Bool)

(declare-fun b_and!44237 () Bool)

(assert (=> start!104670 (= tp!92960 b_and!44237)))

(declare-fun b!1247890 () Bool)

(declare-fun res!832603 () Bool)

(declare-fun e!708047 () Bool)

(assert (=> b!1247890 (=> (not res!832603) (not e!708047))))

(declare-datatypes ((array!80401 0))(
  ( (array!80402 (arr!38769 (Array (_ BitVec 32) (_ BitVec 64))) (size!39307 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80401)

(declare-datatypes ((List!27609 0))(
  ( (Nil!27606) (Cons!27605 (h!28814 (_ BitVec 64)) (t!41069 List!27609)) )
))
(declare-fun arrayNoDuplicates!0 (array!80401 (_ BitVec 32) List!27609) Bool)

(assert (=> b!1247890 (= res!832603 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27606))))

(declare-fun b!1247891 () Bool)

(declare-fun e!708045 () Bool)

(declare-fun tp_is_empty!31393 () Bool)

(assert (=> b!1247891 (= e!708045 tp_is_empty!31393)))

(declare-fun b!1247892 () Bool)

(declare-fun res!832602 () Bool)

(assert (=> b!1247892 (=> (not res!832602) (not e!708047))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80401 (_ BitVec 32)) Bool)

(assert (=> b!1247892 (= res!832602 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapNonEmpty!48847 () Bool)

(declare-fun mapRes!48847 () Bool)

(declare-fun tp!92959 () Bool)

(declare-fun e!708046 () Bool)

(assert (=> mapNonEmpty!48847 (= mapRes!48847 (and tp!92959 e!708046))))

(declare-datatypes ((V!47223 0))(
  ( (V!47224 (val!15759 Int)) )
))
(declare-datatypes ((ValueCell!14933 0))(
  ( (ValueCellFull!14933 (v!18454 V!47223)) (EmptyCell!14933) )
))
(declare-fun mapValue!48847 () ValueCell!14933)

(declare-fun mapKey!48847 () (_ BitVec 32))

(declare-fun mapRest!48847 () (Array (_ BitVec 32) ValueCell!14933))

(declare-datatypes ((array!80403 0))(
  ( (array!80404 (arr!38770 (Array (_ BitVec 32) ValueCell!14933)) (size!39308 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80403)

(assert (=> mapNonEmpty!48847 (= (arr!38770 _values!914) (store mapRest!48847 mapKey!48847 mapValue!48847))))

(declare-fun b!1247893 () Bool)

(assert (=> b!1247893 (= e!708046 tp_is_empty!31393)))

(declare-fun b!1247894 () Bool)

(assert (=> b!1247894 (= e!708047 false)))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((tuple2!20382 0))(
  ( (tuple2!20383 (_1!10202 (_ BitVec 64)) (_2!10202 V!47223)) )
))
(declare-datatypes ((List!27610 0))(
  ( (Nil!27607) (Cons!27606 (h!28815 tuple2!20382) (t!41070 List!27610)) )
))
(declare-datatypes ((ListLongMap!18255 0))(
  ( (ListLongMap!18256 (toList!9143 List!27610)) )
))
(declare-fun lt!563162 () ListLongMap!18255)

(declare-fun zeroValue!871 () V!47223)

(declare-fun minValueBefore!43 () V!47223)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!5560 (array!80401 array!80403 (_ BitVec 32) (_ BitVec 32) V!47223 V!47223 (_ BitVec 32) Int) ListLongMap!18255)

(assert (=> b!1247894 (= lt!563162 (getCurrentListMapNoExtraKeys!5560 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!48847 () Bool)

(assert (=> mapIsEmpty!48847 mapRes!48847))

(declare-fun b!1247895 () Bool)

(declare-fun e!708048 () Bool)

(assert (=> b!1247895 (= e!708048 (and e!708045 mapRes!48847))))

(declare-fun condMapEmpty!48847 () Bool)

(declare-fun mapDefault!48847 () ValueCell!14933)

(assert (=> b!1247895 (= condMapEmpty!48847 (= (arr!38770 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14933)) mapDefault!48847)))))

(declare-fun res!832604 () Bool)

(assert (=> start!104670 (=> (not res!832604) (not e!708047))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104670 (= res!832604 (validMask!0 mask!1466))))

(assert (=> start!104670 e!708047))

(assert (=> start!104670 true))

(assert (=> start!104670 tp!92960))

(assert (=> start!104670 tp_is_empty!31393))

(declare-fun array_inv!29725 (array!80401) Bool)

(assert (=> start!104670 (array_inv!29725 _keys!1118)))

(declare-fun array_inv!29726 (array!80403) Bool)

(assert (=> start!104670 (and (array_inv!29726 _values!914) e!708048)))

(declare-fun b!1247896 () Bool)

(declare-fun res!832601 () Bool)

(assert (=> b!1247896 (=> (not res!832601) (not e!708047))))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1247896 (= res!832601 (and (= (size!39308 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39307 _keys!1118) (size!39308 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!104670 res!832604) b!1247896))

(assert (= (and b!1247896 res!832601) b!1247892))

(assert (= (and b!1247892 res!832602) b!1247890))

(assert (= (and b!1247890 res!832603) b!1247894))

(assert (= (and b!1247895 condMapEmpty!48847) mapIsEmpty!48847))

(assert (= (and b!1247895 (not condMapEmpty!48847)) mapNonEmpty!48847))

(get-info :version)

(assert (= (and mapNonEmpty!48847 ((_ is ValueCellFull!14933) mapValue!48847)) b!1247893))

(assert (= (and b!1247895 ((_ is ValueCellFull!14933) mapDefault!48847)) b!1247891))

(assert (= start!104670 b!1247895))

(declare-fun m!1148771 () Bool)

(assert (=> b!1247890 m!1148771))

(declare-fun m!1148773 () Bool)

(assert (=> b!1247894 m!1148773))

(declare-fun m!1148775 () Bool)

(assert (=> b!1247892 m!1148775))

(declare-fun m!1148777 () Bool)

(assert (=> mapNonEmpty!48847 m!1148777))

(declare-fun m!1148779 () Bool)

(assert (=> start!104670 m!1148779))

(declare-fun m!1148781 () Bool)

(assert (=> start!104670 m!1148781))

(declare-fun m!1148783 () Bool)

(assert (=> start!104670 m!1148783))

(check-sat (not b!1247892) (not mapNonEmpty!48847) (not b!1247890) b_and!44237 (not start!104670) (not b_next!26491) tp_is_empty!31393 (not b!1247894))
(check-sat b_and!44237 (not b_next!26491))
