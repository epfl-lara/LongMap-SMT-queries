; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73396 () Bool)

(assert start!73396)

(declare-fun b_free!14329 () Bool)

(declare-fun b_next!14329 () Bool)

(assert (=> start!73396 (= b_free!14329 (not b_next!14329))))

(declare-fun tp!50492 () Bool)

(declare-fun b_and!23659 () Bool)

(assert (=> start!73396 (= tp!50492 b_and!23659)))

(declare-fun b!856807 () Bool)

(declare-fun res!582047 () Bool)

(declare-fun e!477555 () Bool)

(assert (=> b!856807 (=> (not res!582047) (not e!477555))))

(declare-datatypes ((array!49101 0))(
  ( (array!49102 (arr!23582 (Array (_ BitVec 32) (_ BitVec 64))) (size!24024 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49101)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49101 (_ BitVec 32)) Bool)

(assert (=> b!856807 (= res!582047 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!856808 () Bool)

(declare-fun res!582045 () Bool)

(assert (=> b!856808 (=> (not res!582045) (not e!477555))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!856808 (= res!582045 (and (= (select (arr!23582 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!856809 () Bool)

(declare-fun res!582043 () Bool)

(assert (=> b!856809 (=> (not res!582043) (not e!477555))))

(assert (=> b!856809 (= res!582043 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24024 _keys!868))))))

(declare-fun b!856810 () Bool)

(declare-fun e!477554 () Bool)

(assert (=> b!856810 (= e!477554 (not true))))

(declare-datatypes ((V!27001 0))(
  ( (V!27002 (val!8280 Int)) )
))
(declare-fun v!557 () V!27001)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7793 0))(
  ( (ValueCellFull!7793 (v!10699 V!27001)) (EmptyCell!7793) )
))
(declare-datatypes ((array!49103 0))(
  ( (array!49104 (arr!23583 (Array (_ BitVec 32) ValueCell!7793)) (size!24025 (_ BitVec 32))) )
))
(declare-fun lt!385925 () array!49103)

(declare-fun _values!688 () array!49103)

(declare-fun minValue!654 () V!27001)

(declare-fun zeroValue!654 () V!27001)

(declare-datatypes ((tuple2!10926 0))(
  ( (tuple2!10927 (_1!5474 (_ BitVec 64)) (_2!5474 V!27001)) )
))
(declare-datatypes ((List!16731 0))(
  ( (Nil!16728) (Cons!16727 (h!17858 tuple2!10926) (t!23363 List!16731)) )
))
(declare-datatypes ((ListLongMap!9685 0))(
  ( (ListLongMap!9686 (toList!4858 List!16731)) )
))
(declare-fun getCurrentListMapNoExtraKeys!2865 (array!49101 array!49103 (_ BitVec 32) (_ BitVec 32) V!27001 V!27001 (_ BitVec 32) Int) ListLongMap!9685)

(declare-fun +!2235 (ListLongMap!9685 tuple2!10926) ListLongMap!9685)

(assert (=> b!856810 (= (getCurrentListMapNoExtraKeys!2865 _keys!868 lt!385925 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2235 (getCurrentListMapNoExtraKeys!2865 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10927 k0!854 v!557)))))

(declare-datatypes ((Unit!29139 0))(
  ( (Unit!29140) )
))
(declare-fun lt!385924 () Unit!29139)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!432 (array!49101 array!49103 (_ BitVec 32) (_ BitVec 32) V!27001 V!27001 (_ BitVec 32) (_ BitVec 64) V!27001 (_ BitVec 32) Int) Unit!29139)

(assert (=> b!856810 (= lt!385924 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!432 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!26297 () Bool)

(declare-fun mapRes!26297 () Bool)

(assert (=> mapIsEmpty!26297 mapRes!26297))

(declare-fun b!856811 () Bool)

(declare-fun e!477558 () Bool)

(declare-fun e!477553 () Bool)

(assert (=> b!856811 (= e!477558 (and e!477553 mapRes!26297))))

(declare-fun condMapEmpty!26297 () Bool)

(declare-fun mapDefault!26297 () ValueCell!7793)

(assert (=> b!856811 (= condMapEmpty!26297 (= (arr!23583 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7793)) mapDefault!26297)))))

(declare-fun mapNonEmpty!26297 () Bool)

(declare-fun tp!50491 () Bool)

(declare-fun e!477557 () Bool)

(assert (=> mapNonEmpty!26297 (= mapRes!26297 (and tp!50491 e!477557))))

(declare-fun mapRest!26297 () (Array (_ BitVec 32) ValueCell!7793))

(declare-fun mapKey!26297 () (_ BitVec 32))

(declare-fun mapValue!26297 () ValueCell!7793)

(assert (=> mapNonEmpty!26297 (= (arr!23583 _values!688) (store mapRest!26297 mapKey!26297 mapValue!26297))))

(declare-fun b!856812 () Bool)

(declare-fun res!582040 () Bool)

(assert (=> b!856812 (=> (not res!582040) (not e!477555))))

(assert (=> b!856812 (= res!582040 (and (= (size!24025 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24024 _keys!868) (size!24025 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!856813 () Bool)

(declare-fun res!582042 () Bool)

(assert (=> b!856813 (=> (not res!582042) (not e!477555))))

(declare-datatypes ((List!16732 0))(
  ( (Nil!16729) (Cons!16728 (h!17859 (_ BitVec 64)) (t!23364 List!16732)) )
))
(declare-fun arrayNoDuplicates!0 (array!49101 (_ BitVec 32) List!16732) Bool)

(assert (=> b!856813 (= res!582042 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16729))))

(declare-fun res!582048 () Bool)

(assert (=> start!73396 (=> (not res!582048) (not e!477555))))

(assert (=> start!73396 (= res!582048 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24024 _keys!868))))))

(assert (=> start!73396 e!477555))

(declare-fun tp_is_empty!16465 () Bool)

(assert (=> start!73396 tp_is_empty!16465))

(assert (=> start!73396 true))

(assert (=> start!73396 tp!50492))

(declare-fun array_inv!18744 (array!49101) Bool)

(assert (=> start!73396 (array_inv!18744 _keys!868)))

(declare-fun array_inv!18745 (array!49103) Bool)

(assert (=> start!73396 (and (array_inv!18745 _values!688) e!477558)))

(declare-fun b!856814 () Bool)

(assert (=> b!856814 (= e!477557 tp_is_empty!16465)))

(declare-fun b!856815 () Bool)

(assert (=> b!856815 (= e!477553 tp_is_empty!16465)))

(declare-fun b!856816 () Bool)

(declare-fun res!582044 () Bool)

(assert (=> b!856816 (=> (not res!582044) (not e!477555))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!856816 (= res!582044 (validMask!0 mask!1196))))

(declare-fun b!856817 () Bool)

(assert (=> b!856817 (= e!477555 e!477554)))

(declare-fun res!582041 () Bool)

(assert (=> b!856817 (=> (not res!582041) (not e!477554))))

(assert (=> b!856817 (= res!582041 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!385923 () ListLongMap!9685)

(assert (=> b!856817 (= lt!385923 (getCurrentListMapNoExtraKeys!2865 _keys!868 lt!385925 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!856817 (= lt!385925 (array!49104 (store (arr!23583 _values!688) i!612 (ValueCellFull!7793 v!557)) (size!24025 _values!688)))))

(declare-fun lt!385922 () ListLongMap!9685)

(assert (=> b!856817 (= lt!385922 (getCurrentListMapNoExtraKeys!2865 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!856818 () Bool)

(declare-fun res!582046 () Bool)

(assert (=> b!856818 (=> (not res!582046) (not e!477555))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!856818 (= res!582046 (validKeyInArray!0 k0!854))))

(assert (= (and start!73396 res!582048) b!856816))

(assert (= (and b!856816 res!582044) b!856812))

(assert (= (and b!856812 res!582040) b!856807))

(assert (= (and b!856807 res!582047) b!856813))

(assert (= (and b!856813 res!582042) b!856809))

(assert (= (and b!856809 res!582043) b!856818))

(assert (= (and b!856818 res!582046) b!856808))

(assert (= (and b!856808 res!582045) b!856817))

(assert (= (and b!856817 res!582041) b!856810))

(assert (= (and b!856811 condMapEmpty!26297) mapIsEmpty!26297))

(assert (= (and b!856811 (not condMapEmpty!26297)) mapNonEmpty!26297))

(get-info :version)

(assert (= (and mapNonEmpty!26297 ((_ is ValueCellFull!7793) mapValue!26297)) b!856814))

(assert (= (and b!856811 ((_ is ValueCellFull!7793) mapDefault!26297)) b!856815))

(assert (= start!73396 b!856811))

(declare-fun m!797133 () Bool)

(assert (=> b!856813 m!797133))

(declare-fun m!797135 () Bool)

(assert (=> b!856807 m!797135))

(declare-fun m!797137 () Bool)

(assert (=> b!856817 m!797137))

(declare-fun m!797139 () Bool)

(assert (=> b!856817 m!797139))

(declare-fun m!797141 () Bool)

(assert (=> b!856817 m!797141))

(declare-fun m!797143 () Bool)

(assert (=> b!856808 m!797143))

(declare-fun m!797145 () Bool)

(assert (=> b!856818 m!797145))

(declare-fun m!797147 () Bool)

(assert (=> b!856816 m!797147))

(declare-fun m!797149 () Bool)

(assert (=> start!73396 m!797149))

(declare-fun m!797151 () Bool)

(assert (=> start!73396 m!797151))

(declare-fun m!797153 () Bool)

(assert (=> b!856810 m!797153))

(declare-fun m!797155 () Bool)

(assert (=> b!856810 m!797155))

(assert (=> b!856810 m!797155))

(declare-fun m!797157 () Bool)

(assert (=> b!856810 m!797157))

(declare-fun m!797159 () Bool)

(assert (=> b!856810 m!797159))

(declare-fun m!797161 () Bool)

(assert (=> mapNonEmpty!26297 m!797161))

(check-sat (not start!73396) b_and!23659 tp_is_empty!16465 (not mapNonEmpty!26297) (not b!856818) (not b!856810) (not b!856817) (not b_next!14329) (not b!856816) (not b!856813) (not b!856807))
(check-sat b_and!23659 (not b_next!14329))
