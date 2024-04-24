; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77796 () Bool)

(assert start!77796)

(declare-fun b_free!16213 () Bool)

(declare-fun b_next!16213 () Bool)

(assert (=> start!77796 (= b_free!16213 (not b_next!16213))))

(declare-fun tp!56901 () Bool)

(declare-fun b_and!26589 () Bool)

(assert (=> start!77796 (= tp!56901 b_and!26589)))

(declare-fun b!905780 () Bool)

(declare-fun res!610929 () Bool)

(declare-fun e!507636 () Bool)

(assert (=> b!905780 (=> (not res!610929) (not e!507636))))

(declare-datatypes ((array!53351 0))(
  ( (array!53352 (arr!25630 (Array (_ BitVec 32) (_ BitVec 64))) (size!26090 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53351)

(declare-datatypes ((List!17953 0))(
  ( (Nil!17950) (Cons!17949 (h!19101 (_ BitVec 64)) (t!25330 List!17953)) )
))
(declare-fun arrayNoDuplicates!0 (array!53351 (_ BitVec 32) List!17953) Bool)

(assert (=> b!905780 (= res!610929 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17950))))

(declare-fun b!905781 () Bool)

(declare-fun res!610931 () Bool)

(assert (=> b!905781 (=> (not res!610931) (not e!507636))))

(declare-datatypes ((V!29807 0))(
  ( (V!29808 (val!9366 Int)) )
))
(declare-datatypes ((ValueCell!8834 0))(
  ( (ValueCellFull!8834 (v!11868 V!29807)) (EmptyCell!8834) )
))
(declare-datatypes ((array!53353 0))(
  ( (array!53354 (arr!25631 (Array (_ BitVec 32) ValueCell!8834)) (size!26091 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53353)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(assert (=> b!905781 (= res!610931 (and (= (size!26091 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26090 _keys!1386) (size!26091 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!905782 () Bool)

(declare-fun res!610932 () Bool)

(assert (=> b!905782 (=> (not res!610932) (not e!507636))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53351 (_ BitVec 32)) Bool)

(assert (=> b!905782 (= res!610932 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!905783 () Bool)

(declare-fun e!507639 () Bool)

(declare-fun tp_is_empty!18631 () Bool)

(assert (=> b!905783 (= e!507639 tp_is_empty!18631)))

(declare-fun b!905784 () Bool)

(declare-fun e!507632 () Bool)

(declare-fun e!507637 () Bool)

(assert (=> b!905784 (= e!507632 (not e!507637))))

(declare-fun res!610924 () Bool)

(assert (=> b!905784 (=> res!610924 e!507637)))

(declare-fun i!717 () (_ BitVec 32))

(assert (=> b!905784 (= res!610924 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26090 _keys!1386))))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun lt!408708 () V!29807)

(declare-fun get!13473 (ValueCell!8834 V!29807) V!29807)

(declare-fun dynLambda!1337 (Int (_ BitVec 64)) V!29807)

(assert (=> b!905784 (= lt!408708 (get!13473 (select (arr!25631 _values!1152) i!717) (dynLambda!1337 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!53351 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!905784 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun zeroValue!1094 () V!29807)

(declare-fun minValue!1094 () V!29807)

(declare-datatypes ((Unit!30698 0))(
  ( (Unit!30699) )
))
(declare-fun lt!408710 () Unit!30698)

(declare-fun lemmaKeyInListMapIsInArray!196 (array!53351 array!53353 (_ BitVec 32) (_ BitVec 32) V!29807 V!29807 (_ BitVec 64) Int) Unit!30698)

(assert (=> b!905784 (= lt!408710 (lemmaKeyInListMapIsInArray!196 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!905785 () Bool)

(declare-fun e!507633 () Bool)

(assert (=> b!905785 (= e!507633 true)))

(declare-datatypes ((tuple2!12108 0))(
  ( (tuple2!12109 (_1!6065 (_ BitVec 64)) (_2!6065 V!29807)) )
))
(declare-datatypes ((List!17954 0))(
  ( (Nil!17951) (Cons!17950 (h!19102 tuple2!12108) (t!25331 List!17954)) )
))
(declare-datatypes ((ListLongMap!10807 0))(
  ( (ListLongMap!10808 (toList!5419 List!17954)) )
))
(declare-fun lt!408712 () ListLongMap!10807)

(declare-fun apply!444 (ListLongMap!10807 (_ BitVec 64)) V!29807)

(assert (=> b!905785 (= (apply!444 lt!408712 k0!1033) lt!408708)))

(declare-fun lt!408709 () Unit!30698)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!1 (array!53351 array!53353 (_ BitVec 32) (_ BitVec 32) V!29807 V!29807 (_ BitVec 64) V!29807 (_ BitVec 32) Int) Unit!30698)

(assert (=> b!905785 (= lt!408709 (lemmaListMapApplyFromThenApplyFromZero!1 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!408708 i!717 defaultEntry!1160))))

(declare-fun b!905786 () Bool)

(assert (=> b!905786 (= e!507636 e!507632)))

(declare-fun res!610925 () Bool)

(assert (=> b!905786 (=> (not res!610925) (not e!507632))))

(declare-fun contains!4475 (ListLongMap!10807 (_ BitVec 64)) Bool)

(assert (=> b!905786 (= res!610925 (contains!4475 lt!408712 k0!1033))))

(declare-fun getCurrentListMap!2686 (array!53351 array!53353 (_ BitVec 32) (_ BitVec 32) V!29807 V!29807 (_ BitVec 32) Int) ListLongMap!10807)

(assert (=> b!905786 (= lt!408712 (getCurrentListMap!2686 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!905787 () Bool)

(declare-fun res!610927 () Bool)

(assert (=> b!905787 (=> (not res!610927) (not e!507632))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!905787 (= res!610927 (inRange!0 i!717 mask!1756))))

(declare-fun res!610933 () Bool)

(assert (=> start!77796 (=> (not res!610933) (not e!507636))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77796 (= res!610933 (validMask!0 mask!1756))))

(assert (=> start!77796 e!507636))

(declare-fun e!507634 () Bool)

(declare-fun array_inv!20140 (array!53353) Bool)

(assert (=> start!77796 (and (array_inv!20140 _values!1152) e!507634)))

(assert (=> start!77796 tp!56901))

(assert (=> start!77796 true))

(assert (=> start!77796 tp_is_empty!18631))

(declare-fun array_inv!20141 (array!53351) Bool)

(assert (=> start!77796 (array_inv!20141 _keys!1386)))

(declare-fun mapNonEmpty!29659 () Bool)

(declare-fun mapRes!29659 () Bool)

(declare-fun tp!56902 () Bool)

(declare-fun e!507638 () Bool)

(assert (=> mapNonEmpty!29659 (= mapRes!29659 (and tp!56902 e!507638))))

(declare-fun mapValue!29659 () ValueCell!8834)

(declare-fun mapRest!29659 () (Array (_ BitVec 32) ValueCell!8834))

(declare-fun mapKey!29659 () (_ BitVec 32))

(assert (=> mapNonEmpty!29659 (= (arr!25631 _values!1152) (store mapRest!29659 mapKey!29659 mapValue!29659))))

(declare-fun b!905788 () Bool)

(assert (=> b!905788 (= e!507634 (and e!507639 mapRes!29659))))

(declare-fun condMapEmpty!29659 () Bool)

(declare-fun mapDefault!29659 () ValueCell!8834)

(assert (=> b!905788 (= condMapEmpty!29659 (= (arr!25631 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8834)) mapDefault!29659)))))

(declare-fun mapIsEmpty!29659 () Bool)

(assert (=> mapIsEmpty!29659 mapRes!29659))

(declare-fun b!905789 () Bool)

(declare-fun res!610928 () Bool)

(assert (=> b!905789 (=> (not res!610928) (not e!507632))))

(assert (=> b!905789 (= res!610928 (and (= (select (arr!25630 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!905790 () Bool)

(declare-fun res!610930 () Bool)

(assert (=> b!905790 (=> res!610930 e!507633)))

(declare-fun lt!408711 () ListLongMap!10807)

(assert (=> b!905790 (= res!610930 (not (= (apply!444 lt!408711 k0!1033) lt!408708)))))

(declare-fun b!905791 () Bool)

(assert (=> b!905791 (= e!507638 tp_is_empty!18631)))

(declare-fun b!905792 () Bool)

(assert (=> b!905792 (= e!507637 e!507633)))

(declare-fun res!610926 () Bool)

(assert (=> b!905792 (=> res!610926 e!507633)))

(assert (=> b!905792 (= res!610926 (not (contains!4475 lt!408711 k0!1033)))))

(assert (=> b!905792 (= lt!408711 (getCurrentListMap!2686 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(assert (= (and start!77796 res!610933) b!905781))

(assert (= (and b!905781 res!610931) b!905782))

(assert (= (and b!905782 res!610932) b!905780))

(assert (= (and b!905780 res!610929) b!905786))

(assert (= (and b!905786 res!610925) b!905787))

(assert (= (and b!905787 res!610927) b!905789))

(assert (= (and b!905789 res!610928) b!905784))

(assert (= (and b!905784 (not res!610924)) b!905792))

(assert (= (and b!905792 (not res!610926)) b!905790))

(assert (= (and b!905790 (not res!610930)) b!905785))

(assert (= (and b!905788 condMapEmpty!29659) mapIsEmpty!29659))

(assert (= (and b!905788 (not condMapEmpty!29659)) mapNonEmpty!29659))

(get-info :version)

(assert (= (and mapNonEmpty!29659 ((_ is ValueCellFull!8834) mapValue!29659)) b!905791))

(assert (= (and b!905788 ((_ is ValueCellFull!8834) mapDefault!29659)) b!905783))

(assert (= start!77796 b!905788))

(declare-fun b_lambda!13101 () Bool)

(assert (=> (not b_lambda!13101) (not b!905784)))

(declare-fun t!25329 () Bool)

(declare-fun tb!5227 () Bool)

(assert (=> (and start!77796 (= defaultEntry!1160 defaultEntry!1160) t!25329) tb!5227))

(declare-fun result!10257 () Bool)

(assert (=> tb!5227 (= result!10257 tp_is_empty!18631)))

(assert (=> b!905784 t!25329))

(declare-fun b_and!26591 () Bool)

(assert (= b_and!26589 (and (=> t!25329 result!10257) b_and!26591)))

(declare-fun m!841589 () Bool)

(assert (=> b!905782 m!841589))

(declare-fun m!841591 () Bool)

(assert (=> b!905784 m!841591))

(declare-fun m!841593 () Bool)

(assert (=> b!905784 m!841593))

(declare-fun m!841595 () Bool)

(assert (=> b!905784 m!841595))

(declare-fun m!841597 () Bool)

(assert (=> b!905784 m!841597))

(assert (=> b!905784 m!841591))

(assert (=> b!905784 m!841595))

(declare-fun m!841599 () Bool)

(assert (=> b!905784 m!841599))

(declare-fun m!841601 () Bool)

(assert (=> b!905787 m!841601))

(declare-fun m!841603 () Bool)

(assert (=> b!905789 m!841603))

(declare-fun m!841605 () Bool)

(assert (=> start!77796 m!841605))

(declare-fun m!841607 () Bool)

(assert (=> start!77796 m!841607))

(declare-fun m!841609 () Bool)

(assert (=> start!77796 m!841609))

(declare-fun m!841611 () Bool)

(assert (=> b!905790 m!841611))

(declare-fun m!841613 () Bool)

(assert (=> b!905780 m!841613))

(declare-fun m!841615 () Bool)

(assert (=> b!905785 m!841615))

(declare-fun m!841617 () Bool)

(assert (=> b!905785 m!841617))

(declare-fun m!841619 () Bool)

(assert (=> mapNonEmpty!29659 m!841619))

(declare-fun m!841621 () Bool)

(assert (=> b!905786 m!841621))

(declare-fun m!841623 () Bool)

(assert (=> b!905786 m!841623))

(declare-fun m!841625 () Bool)

(assert (=> b!905792 m!841625))

(declare-fun m!841627 () Bool)

(assert (=> b!905792 m!841627))

(check-sat (not mapNonEmpty!29659) (not b_lambda!13101) (not b_next!16213) b_and!26591 (not b!905787) tp_is_empty!18631 (not b!905785) (not b!905792) (not b!905782) (not b!905786) (not b!905784) (not b!905790) (not start!77796) (not b!905780))
(check-sat b_and!26591 (not b_next!16213))
