; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77896 () Bool)

(assert start!77896)

(declare-fun b_free!16455 () Bool)

(declare-fun b_next!16455 () Bool)

(assert (=> start!77896 (= b_free!16455 (not b_next!16455))))

(declare-fun tp!57630 () Bool)

(declare-fun b_and!27023 () Bool)

(assert (=> start!77896 (= tp!57630 b_and!27023)))

(declare-fun b!909538 () Bool)

(declare-fun res!613869 () Bool)

(declare-fun e!509853 () Bool)

(assert (=> b!909538 (=> (not res!613869) (not e!509853))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!53770 0))(
  ( (array!53771 (arr!25843 (Array (_ BitVec 32) (_ BitVec 64))) (size!26302 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53770)

(declare-datatypes ((V!30129 0))(
  ( (V!30130 (val!9487 Int)) )
))
(declare-datatypes ((ValueCell!8955 0))(
  ( (ValueCellFull!8955 (v!11994 V!30129)) (EmptyCell!8955) )
))
(declare-datatypes ((array!53772 0))(
  ( (array!53773 (arr!25844 (Array (_ BitVec 32) ValueCell!8955)) (size!26303 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53772)

(assert (=> b!909538 (= res!613869 (and (= (size!26303 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26302 _keys!1386) (size!26303 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!909539 () Bool)

(assert (=> b!909539 (= e!509853 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30129)

(declare-fun lt!410009 () Bool)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun minValue!1094 () V!30129)

(declare-datatypes ((tuple2!12364 0))(
  ( (tuple2!12365 (_1!6193 (_ BitVec 64)) (_2!6193 V!30129)) )
))
(declare-datatypes ((List!18155 0))(
  ( (Nil!18152) (Cons!18151 (h!19297 tuple2!12364) (t!25736 List!18155)) )
))
(declare-datatypes ((ListLongMap!11061 0))(
  ( (ListLongMap!11062 (toList!5546 List!18155)) )
))
(declare-fun contains!4588 (ListLongMap!11061 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2808 (array!53770 array!53772 (_ BitVec 32) (_ BitVec 32) V!30129 V!30129 (_ BitVec 32) Int) ListLongMap!11061)

(assert (=> b!909539 (= lt!410009 (contains!4588 (getCurrentListMap!2808 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!909540 () Bool)

(declare-fun res!613867 () Bool)

(assert (=> b!909540 (=> (not res!613867) (not e!509853))))

(declare-datatypes ((List!18156 0))(
  ( (Nil!18153) (Cons!18152 (h!19298 (_ BitVec 64)) (t!25737 List!18156)) )
))
(declare-fun arrayNoDuplicates!0 (array!53770 (_ BitVec 32) List!18156) Bool)

(assert (=> b!909540 (= res!613867 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18153))))

(declare-fun b!909541 () Bool)

(declare-fun e!509855 () Bool)

(declare-fun tp_is_empty!18873 () Bool)

(assert (=> b!909541 (= e!509855 tp_is_empty!18873)))

(declare-fun b!909542 () Bool)

(declare-fun e!509856 () Bool)

(declare-fun e!509854 () Bool)

(declare-fun mapRes!30025 () Bool)

(assert (=> b!909542 (= e!509856 (and e!509854 mapRes!30025))))

(declare-fun condMapEmpty!30025 () Bool)

(declare-fun mapDefault!30025 () ValueCell!8955)

(assert (=> b!909542 (= condMapEmpty!30025 (= (arr!25844 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8955)) mapDefault!30025)))))

(declare-fun b!909543 () Bool)

(assert (=> b!909543 (= e!509854 tp_is_empty!18873)))

(declare-fun b!909544 () Bool)

(declare-fun res!613866 () Bool)

(assert (=> b!909544 (=> (not res!613866) (not e!509853))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53770 (_ BitVec 32)) Bool)

(assert (=> b!909544 (= res!613866 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapNonEmpty!30025 () Bool)

(declare-fun tp!57629 () Bool)

(assert (=> mapNonEmpty!30025 (= mapRes!30025 (and tp!57629 e!509855))))

(declare-fun mapValue!30025 () ValueCell!8955)

(declare-fun mapKey!30025 () (_ BitVec 32))

(declare-fun mapRest!30025 () (Array (_ BitVec 32) ValueCell!8955))

(assert (=> mapNonEmpty!30025 (= (arr!25844 _values!1152) (store mapRest!30025 mapKey!30025 mapValue!30025))))

(declare-fun mapIsEmpty!30025 () Bool)

(assert (=> mapIsEmpty!30025 mapRes!30025))

(declare-fun res!613868 () Bool)

(assert (=> start!77896 (=> (not res!613868) (not e!509853))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77896 (= res!613868 (validMask!0 mask!1756))))

(assert (=> start!77896 e!509853))

(declare-fun array_inv!20216 (array!53772) Bool)

(assert (=> start!77896 (and (array_inv!20216 _values!1152) e!509856)))

(assert (=> start!77896 tp!57630))

(assert (=> start!77896 true))

(assert (=> start!77896 tp_is_empty!18873))

(declare-fun array_inv!20217 (array!53770) Bool)

(assert (=> start!77896 (array_inv!20217 _keys!1386)))

(assert (= (and start!77896 res!613868) b!909538))

(assert (= (and b!909538 res!613869) b!909544))

(assert (= (and b!909544 res!613866) b!909540))

(assert (= (and b!909540 res!613867) b!909539))

(assert (= (and b!909542 condMapEmpty!30025) mapIsEmpty!30025))

(assert (= (and b!909542 (not condMapEmpty!30025)) mapNonEmpty!30025))

(get-info :version)

(assert (= (and mapNonEmpty!30025 ((_ is ValueCellFull!8955) mapValue!30025)) b!909541))

(assert (= (and b!909542 ((_ is ValueCellFull!8955) mapDefault!30025)) b!909543))

(assert (= start!77896 b!909542))

(declare-fun m!844761 () Bool)

(assert (=> start!77896 m!844761))

(declare-fun m!844763 () Bool)

(assert (=> start!77896 m!844763))

(declare-fun m!844765 () Bool)

(assert (=> start!77896 m!844765))

(declare-fun m!844767 () Bool)

(assert (=> mapNonEmpty!30025 m!844767))

(declare-fun m!844769 () Bool)

(assert (=> b!909539 m!844769))

(assert (=> b!909539 m!844769))

(declare-fun m!844771 () Bool)

(assert (=> b!909539 m!844771))

(declare-fun m!844773 () Bool)

(assert (=> b!909540 m!844773))

(declare-fun m!844775 () Bool)

(assert (=> b!909544 m!844775))

(check-sat (not mapNonEmpty!30025) (not b!909539) b_and!27023 tp_is_empty!18873 (not start!77896) (not b_next!16455) (not b!909540) (not b!909544))
(check-sat b_and!27023 (not b_next!16455))
