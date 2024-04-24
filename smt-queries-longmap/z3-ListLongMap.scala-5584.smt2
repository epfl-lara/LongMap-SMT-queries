; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73456 () Bool)

(assert start!73456)

(declare-fun b_free!14203 () Bool)

(declare-fun b_next!14203 () Bool)

(assert (=> start!73456 (= b_free!14203 (not b_next!14203))))

(declare-fun tp!50114 () Bool)

(declare-fun b_and!23569 () Bool)

(assert (=> start!73456 (= tp!50114 b_and!23569)))

(declare-fun b!855778 () Bool)

(declare-fun e!477250 () Bool)

(declare-fun tp_is_empty!16339 () Bool)

(assert (=> b!855778 (= e!477250 tp_is_empty!16339)))

(declare-fun b!855780 () Bool)

(declare-fun res!580895 () Bool)

(declare-fun e!477247 () Bool)

(assert (=> b!855780 (=> (not res!580895) (not e!477247))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48923 0))(
  ( (array!48924 (arr!23488 (Array (_ BitVec 32) (_ BitVec 64))) (size!23929 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48923)

(declare-datatypes ((V!26833 0))(
  ( (V!26834 (val!8217 Int)) )
))
(declare-datatypes ((ValueCell!7730 0))(
  ( (ValueCellFull!7730 (v!10642 V!26833)) (EmptyCell!7730) )
))
(declare-datatypes ((array!48925 0))(
  ( (array!48926 (arr!23489 (Array (_ BitVec 32) ValueCell!7730)) (size!23930 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48925)

(assert (=> b!855780 (= res!580895 (and (= (size!23930 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23929 _keys!868) (size!23930 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!855781 () Bool)

(declare-fun res!580891 () Bool)

(assert (=> b!855781 (=> (not res!580891) (not e!477247))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!855781 (= res!580891 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23929 _keys!868))))))

(declare-fun b!855782 () Bool)

(declare-fun res!580890 () Bool)

(assert (=> b!855782 (=> (not res!580890) (not e!477247))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48923 (_ BitVec 32)) Bool)

(assert (=> b!855782 (= res!580890 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!855783 () Bool)

(assert (=> b!855783 (= e!477247 false)))

(declare-fun v!557 () V!26833)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!10748 0))(
  ( (tuple2!10749 (_1!5385 (_ BitVec 64)) (_2!5385 V!26833)) )
))
(declare-datatypes ((List!16593 0))(
  ( (Nil!16590) (Cons!16589 (h!17726 tuple2!10748) (t!23226 List!16593)) )
))
(declare-datatypes ((ListLongMap!9519 0))(
  ( (ListLongMap!9520 (toList!4775 List!16593)) )
))
(declare-fun lt!385958 () ListLongMap!9519)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26833)

(declare-fun zeroValue!654 () V!26833)

(declare-fun getCurrentListMapNoExtraKeys!2831 (array!48923 array!48925 (_ BitVec 32) (_ BitVec 32) V!26833 V!26833 (_ BitVec 32) Int) ListLongMap!9519)

(assert (=> b!855783 (= lt!385958 (getCurrentListMapNoExtraKeys!2831 _keys!868 (array!48926 (store (arr!23489 _values!688) i!612 (ValueCellFull!7730 v!557)) (size!23930 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!385957 () ListLongMap!9519)

(assert (=> b!855783 (= lt!385957 (getCurrentListMapNoExtraKeys!2831 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!855784 () Bool)

(declare-fun res!580897 () Bool)

(assert (=> b!855784 (=> (not res!580897) (not e!477247))))

(declare-datatypes ((List!16594 0))(
  ( (Nil!16591) (Cons!16590 (h!17727 (_ BitVec 64)) (t!23227 List!16594)) )
))
(declare-fun arrayNoDuplicates!0 (array!48923 (_ BitVec 32) List!16594) Bool)

(assert (=> b!855784 (= res!580897 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16591))))

(declare-fun b!855785 () Bool)

(declare-fun res!580894 () Bool)

(assert (=> b!855785 (=> (not res!580894) (not e!477247))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!855785 (= res!580894 (validKeyInArray!0 k0!854))))

(declare-fun b!855786 () Bool)

(declare-fun res!580893 () Bool)

(assert (=> b!855786 (=> (not res!580893) (not e!477247))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!855786 (= res!580893 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!26108 () Bool)

(declare-fun mapRes!26108 () Bool)

(assert (=> mapIsEmpty!26108 mapRes!26108))

(declare-fun b!855787 () Bool)

(declare-fun e!477246 () Bool)

(assert (=> b!855787 (= e!477246 tp_is_empty!16339)))

(declare-fun res!580896 () Bool)

(assert (=> start!73456 (=> (not res!580896) (not e!477247))))

(assert (=> start!73456 (= res!580896 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23929 _keys!868))))))

(assert (=> start!73456 e!477247))

(assert (=> start!73456 tp_is_empty!16339))

(assert (=> start!73456 true))

(assert (=> start!73456 tp!50114))

(declare-fun array_inv!18666 (array!48923) Bool)

(assert (=> start!73456 (array_inv!18666 _keys!868)))

(declare-fun e!477249 () Bool)

(declare-fun array_inv!18667 (array!48925) Bool)

(assert (=> start!73456 (and (array_inv!18667 _values!688) e!477249)))

(declare-fun b!855779 () Bool)

(declare-fun res!580892 () Bool)

(assert (=> b!855779 (=> (not res!580892) (not e!477247))))

(assert (=> b!855779 (= res!580892 (and (= (select (arr!23488 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!855788 () Bool)

(assert (=> b!855788 (= e!477249 (and e!477250 mapRes!26108))))

(declare-fun condMapEmpty!26108 () Bool)

(declare-fun mapDefault!26108 () ValueCell!7730)

(assert (=> b!855788 (= condMapEmpty!26108 (= (arr!23489 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7730)) mapDefault!26108)))))

(declare-fun mapNonEmpty!26108 () Bool)

(declare-fun tp!50113 () Bool)

(assert (=> mapNonEmpty!26108 (= mapRes!26108 (and tp!50113 e!477246))))

(declare-fun mapKey!26108 () (_ BitVec 32))

(declare-fun mapRest!26108 () (Array (_ BitVec 32) ValueCell!7730))

(declare-fun mapValue!26108 () ValueCell!7730)

(assert (=> mapNonEmpty!26108 (= (arr!23489 _values!688) (store mapRest!26108 mapKey!26108 mapValue!26108))))

(assert (= (and start!73456 res!580896) b!855786))

(assert (= (and b!855786 res!580893) b!855780))

(assert (= (and b!855780 res!580895) b!855782))

(assert (= (and b!855782 res!580890) b!855784))

(assert (= (and b!855784 res!580897) b!855781))

(assert (= (and b!855781 res!580891) b!855785))

(assert (= (and b!855785 res!580894) b!855779))

(assert (= (and b!855779 res!580892) b!855783))

(assert (= (and b!855788 condMapEmpty!26108) mapIsEmpty!26108))

(assert (= (and b!855788 (not condMapEmpty!26108)) mapNonEmpty!26108))

(get-info :version)

(assert (= (and mapNonEmpty!26108 ((_ is ValueCellFull!7730) mapValue!26108)) b!855787))

(assert (= (and b!855788 ((_ is ValueCellFull!7730) mapDefault!26108)) b!855778))

(assert (= start!73456 b!855788))

(declare-fun m!797555 () Bool)

(assert (=> b!855784 m!797555))

(declare-fun m!797557 () Bool)

(assert (=> start!73456 m!797557))

(declare-fun m!797559 () Bool)

(assert (=> start!73456 m!797559))

(declare-fun m!797561 () Bool)

(assert (=> b!855786 m!797561))

(declare-fun m!797563 () Bool)

(assert (=> mapNonEmpty!26108 m!797563))

(declare-fun m!797565 () Bool)

(assert (=> b!855779 m!797565))

(declare-fun m!797567 () Bool)

(assert (=> b!855785 m!797567))

(declare-fun m!797569 () Bool)

(assert (=> b!855783 m!797569))

(declare-fun m!797571 () Bool)

(assert (=> b!855783 m!797571))

(declare-fun m!797573 () Bool)

(assert (=> b!855783 m!797573))

(declare-fun m!797575 () Bool)

(assert (=> b!855782 m!797575))

(check-sat (not b!855784) (not b!855785) (not mapNonEmpty!26108) (not b!855786) (not b_next!14203) (not b!855783) tp_is_empty!16339 (not start!73456) (not b!855782) b_and!23569)
(check-sat b_and!23569 (not b_next!14203))
