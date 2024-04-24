; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20638 () Bool)

(assert start!20638)

(declare-fun b_free!5293 () Bool)

(declare-fun b_next!5293 () Bool)

(assert (=> start!20638 (= b_free!5293 (not b_next!5293))))

(declare-fun tp!18911 () Bool)

(declare-fun b_and!12053 () Bool)

(assert (=> start!20638 (= tp!18911 b_and!12053)))

(declare-fun b!205967 () Bool)

(declare-fun res!99643 () Bool)

(declare-fun e!134654 () Bool)

(assert (=> b!205967 (=> (not res!99643) (not e!134654))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!9505 0))(
  ( (array!9506 (arr!4503 (Array (_ BitVec 32) (_ BitVec 64))) (size!4828 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9505)

(assert (=> b!205967 (= res!99643 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4828 _keys!825))))))

(declare-fun b!205968 () Bool)

(declare-fun e!134649 () Bool)

(assert (=> b!205968 (= e!134654 (not e!134649))))

(declare-fun res!99639 () Bool)

(assert (=> b!205968 (=> res!99639 e!134649)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!205968 (= res!99639 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!6513 0))(
  ( (V!6514 (val!2619 Int)) )
))
(declare-datatypes ((ValueCell!2231 0))(
  ( (ValueCellFull!2231 (v!4590 V!6513)) (EmptyCell!2231) )
))
(declare-datatypes ((array!9507 0))(
  ( (array!9508 (arr!4504 (Array (_ BitVec 32) ValueCell!2231)) (size!4829 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9507)

(declare-datatypes ((tuple2!3924 0))(
  ( (tuple2!3925 (_1!1973 (_ BitVec 64)) (_2!1973 V!6513)) )
))
(declare-datatypes ((List!2815 0))(
  ( (Nil!2812) (Cons!2811 (h!3453 tuple2!3924) (t!7738 List!2815)) )
))
(declare-datatypes ((ListLongMap!2839 0))(
  ( (ListLongMap!2840 (toList!1435 List!2815)) )
))
(declare-fun lt!105122 () ListLongMap!2839)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6513)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6513)

(declare-fun getCurrentListMap!1008 (array!9505 array!9507 (_ BitVec 32) (_ BitVec 32) V!6513 V!6513 (_ BitVec 32) Int) ListLongMap!2839)

(assert (=> b!205968 (= lt!105122 (getCurrentListMap!1008 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105112 () ListLongMap!2839)

(declare-fun lt!105113 () array!9507)

(assert (=> b!205968 (= lt!105112 (getCurrentListMap!1008 _keys!825 lt!105113 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105120 () ListLongMap!2839)

(declare-fun lt!105111 () ListLongMap!2839)

(assert (=> b!205968 (and (= lt!105120 lt!105111) (= lt!105111 lt!105120))))

(declare-fun lt!105121 () ListLongMap!2839)

(declare-fun lt!105119 () tuple2!3924)

(declare-fun +!489 (ListLongMap!2839 tuple2!3924) ListLongMap!2839)

(assert (=> b!205968 (= lt!105111 (+!489 lt!105121 lt!105119))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun v!520 () V!6513)

(assert (=> b!205968 (= lt!105119 (tuple2!3925 k0!843 v!520))))

(declare-datatypes ((Unit!6256 0))(
  ( (Unit!6257) )
))
(declare-fun lt!105116 () Unit!6256)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!144 (array!9505 array!9507 (_ BitVec 32) (_ BitVec 32) V!6513 V!6513 (_ BitVec 32) (_ BitVec 64) V!6513 (_ BitVec 32) Int) Unit!6256)

(assert (=> b!205968 (= lt!105116 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!144 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!401 (array!9505 array!9507 (_ BitVec 32) (_ BitVec 32) V!6513 V!6513 (_ BitVec 32) Int) ListLongMap!2839)

(assert (=> b!205968 (= lt!105120 (getCurrentListMapNoExtraKeys!401 _keys!825 lt!105113 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!205968 (= lt!105113 (array!9508 (store (arr!4504 _values!649) i!601 (ValueCellFull!2231 v!520)) (size!4829 _values!649)))))

(assert (=> b!205968 (= lt!105121 (getCurrentListMapNoExtraKeys!401 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!205969 () Bool)

(declare-fun res!99640 () Bool)

(assert (=> b!205969 (=> (not res!99640) (not e!134654))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9505 (_ BitVec 32)) Bool)

(assert (=> b!205969 (= res!99640 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!205970 () Bool)

(declare-fun res!99641 () Bool)

(assert (=> b!205970 (=> (not res!99641) (not e!134654))))

(assert (=> b!205970 (= res!99641 (and (= (size!4829 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4828 _keys!825) (size!4829 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!205971 () Bool)

(declare-fun res!99644 () Bool)

(assert (=> b!205971 (=> (not res!99644) (not e!134654))))

(declare-datatypes ((List!2816 0))(
  ( (Nil!2813) (Cons!2812 (h!3454 (_ BitVec 64)) (t!7739 List!2816)) )
))
(declare-fun arrayNoDuplicates!0 (array!9505 (_ BitVec 32) List!2816) Bool)

(assert (=> b!205971 (= res!99644 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2813))))

(declare-fun mapNonEmpty!8792 () Bool)

(declare-fun mapRes!8792 () Bool)

(declare-fun tp!18910 () Bool)

(declare-fun e!134652 () Bool)

(assert (=> mapNonEmpty!8792 (= mapRes!8792 (and tp!18910 e!134652))))

(declare-fun mapKey!8792 () (_ BitVec 32))

(declare-fun mapValue!8792 () ValueCell!2231)

(declare-fun mapRest!8792 () (Array (_ BitVec 32) ValueCell!2231))

(assert (=> mapNonEmpty!8792 (= (arr!4504 _values!649) (store mapRest!8792 mapKey!8792 mapValue!8792))))

(declare-fun res!99646 () Bool)

(assert (=> start!20638 (=> (not res!99646) (not e!134654))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20638 (= res!99646 (validMask!0 mask!1149))))

(assert (=> start!20638 e!134654))

(declare-fun e!134650 () Bool)

(declare-fun array_inv!2951 (array!9507) Bool)

(assert (=> start!20638 (and (array_inv!2951 _values!649) e!134650)))

(assert (=> start!20638 true))

(declare-fun tp_is_empty!5149 () Bool)

(assert (=> start!20638 tp_is_empty!5149))

(declare-fun array_inv!2952 (array!9505) Bool)

(assert (=> start!20638 (array_inv!2952 _keys!825)))

(assert (=> start!20638 tp!18911))

(declare-fun b!205972 () Bool)

(declare-fun e!134648 () Bool)

(assert (=> b!205972 (= e!134648 true)))

(declare-fun lt!105115 () ListLongMap!2839)

(declare-fun lt!105117 () ListLongMap!2839)

(assert (=> b!205972 (= lt!105115 (+!489 lt!105117 lt!105119))))

(declare-fun lt!105114 () Unit!6256)

(declare-fun addCommutativeForDiffKeys!192 (ListLongMap!2839 (_ BitVec 64) V!6513 (_ BitVec 64) V!6513) Unit!6256)

(assert (=> b!205972 (= lt!105114 (addCommutativeForDiffKeys!192 lt!105121 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun mapIsEmpty!8792 () Bool)

(assert (=> mapIsEmpty!8792 mapRes!8792))

(declare-fun b!205973 () Bool)

(declare-fun e!134653 () Bool)

(assert (=> b!205973 (= e!134653 tp_is_empty!5149)))

(declare-fun b!205974 () Bool)

(assert (=> b!205974 (= e!134650 (and e!134653 mapRes!8792))))

(declare-fun condMapEmpty!8792 () Bool)

(declare-fun mapDefault!8792 () ValueCell!2231)

(assert (=> b!205974 (= condMapEmpty!8792 (= (arr!4504 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2231)) mapDefault!8792)))))

(declare-fun b!205975 () Bool)

(declare-fun res!99638 () Bool)

(assert (=> b!205975 (=> (not res!99638) (not e!134654))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!205975 (= res!99638 (validKeyInArray!0 k0!843))))

(declare-fun b!205976 () Bool)

(assert (=> b!205976 (= e!134649 e!134648)))

(declare-fun res!99645 () Bool)

(assert (=> b!205976 (=> res!99645 e!134648)))

(assert (=> b!205976 (= res!99645 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!205976 (= lt!105122 lt!105117)))

(declare-fun lt!105118 () tuple2!3924)

(assert (=> b!205976 (= lt!105117 (+!489 lt!105121 lt!105118))))

(assert (=> b!205976 (= lt!105112 lt!105115)))

(assert (=> b!205976 (= lt!105115 (+!489 lt!105111 lt!105118))))

(assert (=> b!205976 (= lt!105112 (+!489 lt!105120 lt!105118))))

(assert (=> b!205976 (= lt!105118 (tuple2!3925 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!205977 () Bool)

(assert (=> b!205977 (= e!134652 tp_is_empty!5149)))

(declare-fun b!205978 () Bool)

(declare-fun res!99642 () Bool)

(assert (=> b!205978 (=> (not res!99642) (not e!134654))))

(assert (=> b!205978 (= res!99642 (= (select (arr!4503 _keys!825) i!601) k0!843))))

(assert (= (and start!20638 res!99646) b!205970))

(assert (= (and b!205970 res!99641) b!205969))

(assert (= (and b!205969 res!99640) b!205971))

(assert (= (and b!205971 res!99644) b!205967))

(assert (= (and b!205967 res!99643) b!205975))

(assert (= (and b!205975 res!99638) b!205978))

(assert (= (and b!205978 res!99642) b!205968))

(assert (= (and b!205968 (not res!99639)) b!205976))

(assert (= (and b!205976 (not res!99645)) b!205972))

(assert (= (and b!205974 condMapEmpty!8792) mapIsEmpty!8792))

(assert (= (and b!205974 (not condMapEmpty!8792)) mapNonEmpty!8792))

(get-info :version)

(assert (= (and mapNonEmpty!8792 ((_ is ValueCellFull!2231) mapValue!8792)) b!205977))

(assert (= (and b!205974 ((_ is ValueCellFull!2231) mapDefault!8792)) b!205973))

(assert (= start!20638 b!205974))

(declare-fun m!233781 () Bool)

(assert (=> start!20638 m!233781))

(declare-fun m!233783 () Bool)

(assert (=> start!20638 m!233783))

(declare-fun m!233785 () Bool)

(assert (=> start!20638 m!233785))

(declare-fun m!233787 () Bool)

(assert (=> b!205972 m!233787))

(declare-fun m!233789 () Bool)

(assert (=> b!205972 m!233789))

(declare-fun m!233791 () Bool)

(assert (=> b!205969 m!233791))

(declare-fun m!233793 () Bool)

(assert (=> b!205976 m!233793))

(declare-fun m!233795 () Bool)

(assert (=> b!205976 m!233795))

(declare-fun m!233797 () Bool)

(assert (=> b!205976 m!233797))

(declare-fun m!233799 () Bool)

(assert (=> b!205975 m!233799))

(declare-fun m!233801 () Bool)

(assert (=> b!205978 m!233801))

(declare-fun m!233803 () Bool)

(assert (=> mapNonEmpty!8792 m!233803))

(declare-fun m!233805 () Bool)

(assert (=> b!205968 m!233805))

(declare-fun m!233807 () Bool)

(assert (=> b!205968 m!233807))

(declare-fun m!233809 () Bool)

(assert (=> b!205968 m!233809))

(declare-fun m!233811 () Bool)

(assert (=> b!205968 m!233811))

(declare-fun m!233813 () Bool)

(assert (=> b!205968 m!233813))

(declare-fun m!233815 () Bool)

(assert (=> b!205968 m!233815))

(declare-fun m!233817 () Bool)

(assert (=> b!205968 m!233817))

(declare-fun m!233819 () Bool)

(assert (=> b!205971 m!233819))

(check-sat (not b!205968) tp_is_empty!5149 (not b!205972) (not b!205969) b_and!12053 (not b!205976) (not b_next!5293) (not start!20638) (not b!205971) (not b!205975) (not mapNonEmpty!8792))
(check-sat b_and!12053 (not b_next!5293))
