; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104742 () Bool)

(assert start!104742)

(declare-fun b_free!26547 () Bool)

(declare-fun b_next!26547 () Bool)

(assert (=> start!104742 (= b_free!26547 (not b_next!26547))))

(declare-fun tp!93130 () Bool)

(declare-fun b_and!44315 () Bool)

(assert (=> start!104742 (= tp!93130 b_and!44315)))

(declare-fun b!1248633 () Bool)

(declare-fun res!833007 () Bool)

(declare-fun e!708558 () Bool)

(assert (=> b!1248633 (=> (not res!833007) (not e!708558))))

(declare-datatypes ((array!80590 0))(
  ( (array!80591 (arr!38862 (Array (_ BitVec 32) (_ BitVec 64))) (size!39398 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80590)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80590 (_ BitVec 32)) Bool)

(assert (=> b!1248633 (= res!833007 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1248634 () Bool)

(declare-fun res!833004 () Bool)

(assert (=> b!1248634 (=> (not res!833004) (not e!708558))))

(declare-datatypes ((List!27580 0))(
  ( (Nil!27577) (Cons!27576 (h!28785 (_ BitVec 64)) (t!41051 List!27580)) )
))
(declare-fun arrayNoDuplicates!0 (array!80590 (_ BitVec 32) List!27580) Bool)

(assert (=> b!1248634 (= res!833004 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27577))))

(declare-fun b!1248635 () Bool)

(declare-fun e!708559 () Bool)

(declare-fun tp_is_empty!31449 () Bool)

(assert (=> b!1248635 (= e!708559 tp_is_empty!31449)))

(declare-fun mapNonEmpty!48934 () Bool)

(declare-fun mapRes!48934 () Bool)

(declare-fun tp!93131 () Bool)

(assert (=> mapNonEmpty!48934 (= mapRes!48934 (and tp!93131 e!708559))))

(declare-fun mapKey!48934 () (_ BitVec 32))

(declare-datatypes ((V!47297 0))(
  ( (V!47298 (val!15787 Int)) )
))
(declare-datatypes ((ValueCell!14961 0))(
  ( (ValueCellFull!14961 (v!18483 V!47297)) (EmptyCell!14961) )
))
(declare-fun mapRest!48934 () (Array (_ BitVec 32) ValueCell!14961))

(declare-datatypes ((array!80592 0))(
  ( (array!80593 (arr!38863 (Array (_ BitVec 32) ValueCell!14961)) (size!39399 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80592)

(declare-fun mapValue!48934 () ValueCell!14961)

(assert (=> mapNonEmpty!48934 (= (arr!38863 _values!914) (store mapRest!48934 mapKey!48934 mapValue!48934))))

(declare-fun res!833005 () Bool)

(assert (=> start!104742 (=> (not res!833005) (not e!708558))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104742 (= res!833005 (validMask!0 mask!1466))))

(assert (=> start!104742 e!708558))

(assert (=> start!104742 true))

(assert (=> start!104742 tp!93130))

(assert (=> start!104742 tp_is_empty!31449))

(declare-fun array_inv!29661 (array!80590) Bool)

(assert (=> start!104742 (array_inv!29661 _keys!1118)))

(declare-fun e!708560 () Bool)

(declare-fun array_inv!29662 (array!80592) Bool)

(assert (=> start!104742 (and (array_inv!29662 _values!914) e!708560)))

(declare-fun b!1248636 () Bool)

(assert (=> b!1248636 (= e!708558 false)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47297)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47297)

(declare-datatypes ((tuple2!20332 0))(
  ( (tuple2!20333 (_1!10177 (_ BitVec 64)) (_2!10177 V!47297)) )
))
(declare-datatypes ((List!27581 0))(
  ( (Nil!27578) (Cons!27577 (h!28786 tuple2!20332) (t!41052 List!27581)) )
))
(declare-datatypes ((ListLongMap!18205 0))(
  ( (ListLongMap!18206 (toList!9118 List!27581)) )
))
(declare-fun lt!563470 () ListLongMap!18205)

(declare-fun getCurrentListMapNoExtraKeys!5525 (array!80590 array!80592 (_ BitVec 32) (_ BitVec 32) V!47297 V!47297 (_ BitVec 32) Int) ListLongMap!18205)

(assert (=> b!1248636 (= lt!563470 (getCurrentListMapNoExtraKeys!5525 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!563469 () ListLongMap!18205)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun minValueBefore!43 () V!47297)

(assert (=> b!1248636 (= lt!563469 (getCurrentListMapNoExtraKeys!5525 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1248637 () Bool)

(declare-fun e!708562 () Bool)

(assert (=> b!1248637 (= e!708560 (and e!708562 mapRes!48934))))

(declare-fun condMapEmpty!48934 () Bool)

(declare-fun mapDefault!48934 () ValueCell!14961)

(assert (=> b!1248637 (= condMapEmpty!48934 (= (arr!38863 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14961)) mapDefault!48934)))))

(declare-fun b!1248638 () Bool)

(assert (=> b!1248638 (= e!708562 tp_is_empty!31449)))

(declare-fun b!1248639 () Bool)

(declare-fun res!833006 () Bool)

(assert (=> b!1248639 (=> (not res!833006) (not e!708558))))

(assert (=> b!1248639 (= res!833006 (and (= (size!39399 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39398 _keys!1118) (size!39399 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!48934 () Bool)

(assert (=> mapIsEmpty!48934 mapRes!48934))

(assert (= (and start!104742 res!833005) b!1248639))

(assert (= (and b!1248639 res!833006) b!1248633))

(assert (= (and b!1248633 res!833007) b!1248634))

(assert (= (and b!1248634 res!833004) b!1248636))

(assert (= (and b!1248637 condMapEmpty!48934) mapIsEmpty!48934))

(assert (= (and b!1248637 (not condMapEmpty!48934)) mapNonEmpty!48934))

(get-info :version)

(assert (= (and mapNonEmpty!48934 ((_ is ValueCellFull!14961) mapValue!48934)) b!1248635))

(assert (= (and b!1248637 ((_ is ValueCellFull!14961) mapDefault!48934)) b!1248638))

(assert (= start!104742 b!1248637))

(declare-fun m!1149735 () Bool)

(assert (=> mapNonEmpty!48934 m!1149735))

(declare-fun m!1149737 () Bool)

(assert (=> b!1248634 m!1149737))

(declare-fun m!1149739 () Bool)

(assert (=> b!1248636 m!1149739))

(declare-fun m!1149741 () Bool)

(assert (=> b!1248636 m!1149741))

(declare-fun m!1149743 () Bool)

(assert (=> b!1248633 m!1149743))

(declare-fun m!1149745 () Bool)

(assert (=> start!104742 m!1149745))

(declare-fun m!1149747 () Bool)

(assert (=> start!104742 m!1149747))

(declare-fun m!1149749 () Bool)

(assert (=> start!104742 m!1149749))

(check-sat (not b!1248636) (not b_next!26547) b_and!44315 tp_is_empty!31449 (not start!104742) (not b!1248633) (not b!1248634) (not mapNonEmpty!48934))
(check-sat b_and!44315 (not b_next!26547))
