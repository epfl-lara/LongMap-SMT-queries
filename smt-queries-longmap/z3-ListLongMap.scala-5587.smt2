; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73288 () Bool)

(assert start!73288)

(declare-fun b_free!14221 () Bool)

(declare-fun b_next!14221 () Bool)

(assert (=> start!73288 (= b_free!14221 (not b_next!14221))))

(declare-fun tp!50168 () Bool)

(declare-fun b_and!23551 () Bool)

(assert (=> start!73288 (= tp!50168 b_and!23551)))

(declare-fun b!854933 () Bool)

(declare-fun res!580659 () Bool)

(declare-fun e!476654 () Bool)

(assert (=> b!854933 (=> (not res!580659) (not e!476654))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!854933 (= res!580659 (validMask!0 mask!1196))))

(declare-fun res!580654 () Bool)

(assert (=> start!73288 (=> (not res!580654) (not e!476654))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!48897 0))(
  ( (array!48898 (arr!23480 (Array (_ BitVec 32) (_ BitVec 64))) (size!23922 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48897)

(assert (=> start!73288 (= res!580654 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23922 _keys!868))))))

(assert (=> start!73288 e!476654))

(declare-fun tp_is_empty!16357 () Bool)

(assert (=> start!73288 tp_is_empty!16357))

(assert (=> start!73288 true))

(assert (=> start!73288 tp!50168))

(declare-fun array_inv!18680 (array!48897) Bool)

(assert (=> start!73288 (array_inv!18680 _keys!868)))

(declare-datatypes ((V!26857 0))(
  ( (V!26858 (val!8226 Int)) )
))
(declare-datatypes ((ValueCell!7739 0))(
  ( (ValueCellFull!7739 (v!10645 V!26857)) (EmptyCell!7739) )
))
(declare-datatypes ((array!48899 0))(
  ( (array!48900 (arr!23481 (Array (_ BitVec 32) ValueCell!7739)) (size!23923 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48899)

(declare-fun e!476653 () Bool)

(declare-fun array_inv!18681 (array!48899) Bool)

(assert (=> start!73288 (and (array_inv!18681 _values!688) e!476653)))

(declare-fun mapIsEmpty!26135 () Bool)

(declare-fun mapRes!26135 () Bool)

(assert (=> mapIsEmpty!26135 mapRes!26135))

(declare-fun mapNonEmpty!26135 () Bool)

(declare-fun tp!50167 () Bool)

(declare-fun e!476652 () Bool)

(assert (=> mapNonEmpty!26135 (= mapRes!26135 (and tp!50167 e!476652))))

(declare-fun mapRest!26135 () (Array (_ BitVec 32) ValueCell!7739))

(declare-fun mapKey!26135 () (_ BitVec 32))

(declare-fun mapValue!26135 () ValueCell!7739)

(assert (=> mapNonEmpty!26135 (= (arr!23481 _values!688) (store mapRest!26135 mapKey!26135 mapValue!26135))))

(declare-fun b!854934 () Bool)

(declare-fun res!580653 () Bool)

(assert (=> b!854934 (=> (not res!580653) (not e!476654))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!854934 (= res!580653 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23922 _keys!868))))))

(declare-fun b!854935 () Bool)

(declare-fun res!580655 () Bool)

(assert (=> b!854935 (=> (not res!580655) (not e!476654))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!854935 (= res!580655 (and (= (size!23923 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23922 _keys!868) (size!23923 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!854936 () Bool)

(assert (=> b!854936 (= e!476652 tp_is_empty!16357)))

(declare-fun b!854937 () Bool)

(declare-fun res!580658 () Bool)

(assert (=> b!854937 (=> (not res!580658) (not e!476654))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48897 (_ BitVec 32)) Bool)

(assert (=> b!854937 (= res!580658 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!854938 () Bool)

(declare-fun e!476651 () Bool)

(assert (=> b!854938 (= e!476651 tp_is_empty!16357)))

(declare-fun b!854939 () Bool)

(assert (=> b!854939 (= e!476653 (and e!476651 mapRes!26135))))

(declare-fun condMapEmpty!26135 () Bool)

(declare-fun mapDefault!26135 () ValueCell!7739)

(assert (=> b!854939 (= condMapEmpty!26135 (= (arr!23481 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7739)) mapDefault!26135)))))

(declare-fun b!854940 () Bool)

(declare-fun res!580656 () Bool)

(assert (=> b!854940 (=> (not res!580656) (not e!476654))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!854940 (= res!580656 (validKeyInArray!0 k0!854))))

(declare-fun b!854941 () Bool)

(declare-fun res!580657 () Bool)

(assert (=> b!854941 (=> (not res!580657) (not e!476654))))

(assert (=> b!854941 (= res!580657 (and (= (select (arr!23480 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!854942 () Bool)

(assert (=> b!854942 (= e!476654 false)))

(declare-datatypes ((tuple2!10850 0))(
  ( (tuple2!10851 (_1!5436 (_ BitVec 64)) (_2!5436 V!26857)) )
))
(declare-datatypes ((List!16660 0))(
  ( (Nil!16657) (Cons!16656 (h!17787 tuple2!10850) (t!23292 List!16660)) )
))
(declare-datatypes ((ListLongMap!9609 0))(
  ( (ListLongMap!9610 (toList!4820 List!16660)) )
))
(declare-fun lt!385415 () ListLongMap!9609)

(declare-fun v!557 () V!26857)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!26857)

(declare-fun zeroValue!654 () V!26857)

(declare-fun getCurrentListMapNoExtraKeys!2827 (array!48897 array!48899 (_ BitVec 32) (_ BitVec 32) V!26857 V!26857 (_ BitVec 32) Int) ListLongMap!9609)

(assert (=> b!854942 (= lt!385415 (getCurrentListMapNoExtraKeys!2827 _keys!868 (array!48900 (store (arr!23481 _values!688) i!612 (ValueCellFull!7739 v!557)) (size!23923 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!385414 () ListLongMap!9609)

(assert (=> b!854942 (= lt!385414 (getCurrentListMapNoExtraKeys!2827 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!854943 () Bool)

(declare-fun res!580652 () Bool)

(assert (=> b!854943 (=> (not res!580652) (not e!476654))))

(declare-datatypes ((List!16661 0))(
  ( (Nil!16658) (Cons!16657 (h!17788 (_ BitVec 64)) (t!23293 List!16661)) )
))
(declare-fun arrayNoDuplicates!0 (array!48897 (_ BitVec 32) List!16661) Bool)

(assert (=> b!854943 (= res!580652 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16658))))

(assert (= (and start!73288 res!580654) b!854933))

(assert (= (and b!854933 res!580659) b!854935))

(assert (= (and b!854935 res!580655) b!854937))

(assert (= (and b!854937 res!580658) b!854943))

(assert (= (and b!854943 res!580652) b!854934))

(assert (= (and b!854934 res!580653) b!854940))

(assert (= (and b!854940 res!580656) b!854941))

(assert (= (and b!854941 res!580657) b!854942))

(assert (= (and b!854939 condMapEmpty!26135) mapIsEmpty!26135))

(assert (= (and b!854939 (not condMapEmpty!26135)) mapNonEmpty!26135))

(get-info :version)

(assert (= (and mapNonEmpty!26135 ((_ is ValueCellFull!7739) mapValue!26135)) b!854936))

(assert (= (and b!854939 ((_ is ValueCellFull!7739) mapDefault!26135)) b!854938))

(assert (= start!73288 b!854939))

(declare-fun m!795705 () Bool)

(assert (=> b!854941 m!795705))

(declare-fun m!795707 () Bool)

(assert (=> b!854933 m!795707))

(declare-fun m!795709 () Bool)

(assert (=> b!854937 m!795709))

(declare-fun m!795711 () Bool)

(assert (=> b!854940 m!795711))

(declare-fun m!795713 () Bool)

(assert (=> mapNonEmpty!26135 m!795713))

(declare-fun m!795715 () Bool)

(assert (=> b!854943 m!795715))

(declare-fun m!795717 () Bool)

(assert (=> start!73288 m!795717))

(declare-fun m!795719 () Bool)

(assert (=> start!73288 m!795719))

(declare-fun m!795721 () Bool)

(assert (=> b!854942 m!795721))

(declare-fun m!795723 () Bool)

(assert (=> b!854942 m!795723))

(declare-fun m!795725 () Bool)

(assert (=> b!854942 m!795725))

(check-sat (not mapNonEmpty!26135) (not b!854940) (not b!854933) (not start!73288) (not b!854942) b_and!23551 (not b_next!14221) (not b!854943) tp_is_empty!16357 (not b!854937))
(check-sat b_and!23551 (not b_next!14221))
