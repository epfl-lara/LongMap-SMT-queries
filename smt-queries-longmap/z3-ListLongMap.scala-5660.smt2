; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73746 () Bool)

(assert start!73746)

(declare-fun b_free!14661 () Bool)

(declare-fun b_next!14661 () Bool)

(assert (=> start!73746 (= b_free!14661 (not b_next!14661))))

(declare-fun tp!51486 () Bool)

(declare-fun b_and!24301 () Bool)

(assert (=> start!73746 (= tp!51486 b_and!24301)))

(declare-fun b!864775 () Bool)

(declare-fun e!481750 () Bool)

(declare-fun e!481751 () Bool)

(declare-fun mapRes!26795 () Bool)

(assert (=> b!864775 (= e!481750 (and e!481751 mapRes!26795))))

(declare-fun condMapEmpty!26795 () Bool)

(declare-datatypes ((V!27443 0))(
  ( (V!27444 (val!8446 Int)) )
))
(declare-datatypes ((ValueCell!7959 0))(
  ( (ValueCellFull!7959 (v!10871 V!27443)) (EmptyCell!7959) )
))
(declare-datatypes ((array!49754 0))(
  ( (array!49755 (arr!23908 (Array (_ BitVec 32) ValueCell!7959)) (size!24348 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49754)

(declare-fun mapDefault!26795 () ValueCell!7959)

(assert (=> b!864775 (= condMapEmpty!26795 (= (arr!23908 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7959)) mapDefault!26795)))))

(declare-fun b!864776 () Bool)

(declare-fun res!587614 () Bool)

(declare-fun e!481749 () Bool)

(assert (=> b!864776 (=> (not res!587614) (not e!481749))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!49756 0))(
  ( (array!49757 (arr!23909 (Array (_ BitVec 32) (_ BitVec 64))) (size!24349 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49756)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!864776 (= res!587614 (and (= (select (arr!23909 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!864777 () Bool)

(declare-fun res!587608 () Bool)

(assert (=> b!864777 (=> (not res!587608) (not e!481749))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!864777 (= res!587608 (validMask!0 mask!1196))))

(declare-fun b!864778 () Bool)

(declare-fun e!481753 () Bool)

(assert (=> b!864778 (= e!481749 e!481753)))

(declare-fun res!587610 () Bool)

(assert (=> b!864778 (=> (not res!587610) (not e!481753))))

(assert (=> b!864778 (= res!587610 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((tuple2!11188 0))(
  ( (tuple2!11189 (_1!5605 (_ BitVec 64)) (_2!5605 V!27443)) )
))
(declare-datatypes ((List!16991 0))(
  ( (Nil!16988) (Cons!16987 (h!18118 tuple2!11188) (t!23918 List!16991)) )
))
(declare-datatypes ((ListLongMap!9957 0))(
  ( (ListLongMap!9958 (toList!4994 List!16991)) )
))
(declare-fun lt!391515 () ListLongMap!9957)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!27443)

(declare-fun zeroValue!654 () V!27443)

(declare-fun lt!391527 () array!49754)

(declare-fun getCurrentListMapNoExtraKeys!2965 (array!49756 array!49754 (_ BitVec 32) (_ BitVec 32) V!27443 V!27443 (_ BitVec 32) Int) ListLongMap!9957)

(assert (=> b!864778 (= lt!391515 (getCurrentListMapNoExtraKeys!2965 _keys!868 lt!391527 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27443)

(assert (=> b!864778 (= lt!391527 (array!49755 (store (arr!23908 _values!688) i!612 (ValueCellFull!7959 v!557)) (size!24348 _values!688)))))

(declare-fun lt!391522 () ListLongMap!9957)

(assert (=> b!864778 (= lt!391522 (getCurrentListMapNoExtraKeys!2965 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!864779 () Bool)

(declare-fun res!587612 () Bool)

(assert (=> b!864779 (=> (not res!587612) (not e!481749))))

(declare-datatypes ((List!16992 0))(
  ( (Nil!16989) (Cons!16988 (h!18119 (_ BitVec 64)) (t!23919 List!16992)) )
))
(declare-fun arrayNoDuplicates!0 (array!49756 (_ BitVec 32) List!16992) Bool)

(assert (=> b!864779 (= res!587612 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16989))))

(declare-fun res!587607 () Bool)

(assert (=> start!73746 (=> (not res!587607) (not e!481749))))

(assert (=> start!73746 (= res!587607 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24349 _keys!868))))))

(assert (=> start!73746 e!481749))

(declare-fun tp_is_empty!16797 () Bool)

(assert (=> start!73746 tp_is_empty!16797))

(assert (=> start!73746 true))

(assert (=> start!73746 tp!51486))

(declare-fun array_inv!18902 (array!49756) Bool)

(assert (=> start!73746 (array_inv!18902 _keys!868)))

(declare-fun array_inv!18903 (array!49754) Bool)

(assert (=> start!73746 (and (array_inv!18903 _values!688) e!481750)))

(declare-fun mapNonEmpty!26795 () Bool)

(declare-fun tp!51487 () Bool)

(declare-fun e!481754 () Bool)

(assert (=> mapNonEmpty!26795 (= mapRes!26795 (and tp!51487 e!481754))))

(declare-fun mapValue!26795 () ValueCell!7959)

(declare-fun mapKey!26795 () (_ BitVec 32))

(declare-fun mapRest!26795 () (Array (_ BitVec 32) ValueCell!7959))

(assert (=> mapNonEmpty!26795 (= (arr!23908 _values!688) (store mapRest!26795 mapKey!26795 mapValue!26795))))

(declare-fun b!864780 () Bool)

(assert (=> b!864780 (= e!481751 tp_is_empty!16797)))

(declare-fun b!864781 () Bool)

(declare-fun res!587609 () Bool)

(assert (=> b!864781 (=> (not res!587609) (not e!481749))))

(assert (=> b!864781 (= res!587609 (and (= (size!24348 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24349 _keys!868) (size!24348 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!864782 () Bool)

(declare-fun e!481748 () Bool)

(assert (=> b!864782 (= e!481748 true)))

(declare-fun lt!391523 () ListLongMap!9957)

(declare-fun lt!391519 () ListLongMap!9957)

(declare-fun lt!391514 () tuple2!11188)

(declare-fun lt!391517 () tuple2!11188)

(declare-fun +!2343 (ListLongMap!9957 tuple2!11188) ListLongMap!9957)

(assert (=> b!864782 (= lt!391523 (+!2343 (+!2343 lt!391519 lt!391514) lt!391517))))

(declare-datatypes ((Unit!29595 0))(
  ( (Unit!29596) )
))
(declare-fun lt!391516 () Unit!29595)

(declare-fun lt!391526 () V!27443)

(declare-fun addCommutativeForDiffKeys!513 (ListLongMap!9957 (_ BitVec 64) V!27443 (_ BitVec 64) V!27443) Unit!29595)

(assert (=> b!864782 (= lt!391516 (addCommutativeForDiffKeys!513 lt!391519 k0!854 v!557 (select (arr!23909 _keys!868) from!1053) lt!391526))))

(declare-fun b!864783 () Bool)

(declare-fun e!481755 () Unit!29595)

(declare-fun Unit!29597 () Unit!29595)

(assert (=> b!864783 (= e!481755 Unit!29597)))

(declare-fun lt!391513 () Unit!29595)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49756 (_ BitVec 32) (_ BitVec 32)) Unit!29595)

(assert (=> b!864783 (= lt!391513 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!864783 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16989)))

(declare-fun lt!391520 () Unit!29595)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49756 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29595)

(assert (=> b!864783 (= lt!391520 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49756 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!864783 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!391528 () Unit!29595)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49756 (_ BitVec 64) (_ BitVec 32) List!16992) Unit!29595)

(assert (=> b!864783 (= lt!391528 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16989))))

(assert (=> b!864783 false))

(declare-fun b!864784 () Bool)

(declare-fun res!587611 () Bool)

(assert (=> b!864784 (=> (not res!587611) (not e!481749))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!864784 (= res!587611 (validKeyInArray!0 k0!854))))

(declare-fun b!864785 () Bool)

(declare-fun Unit!29598 () Unit!29595)

(assert (=> b!864785 (= e!481755 Unit!29598)))

(declare-fun b!864786 () Bool)

(declare-fun e!481756 () Bool)

(assert (=> b!864786 (= e!481756 e!481748)))

(declare-fun res!587613 () Bool)

(assert (=> b!864786 (=> res!587613 e!481748)))

(assert (=> b!864786 (= res!587613 (= k0!854 (select (arr!23909 _keys!868) from!1053)))))

(assert (=> b!864786 (not (= (select (arr!23909 _keys!868) from!1053) k0!854))))

(declare-fun lt!391521 () Unit!29595)

(assert (=> b!864786 (= lt!391521 e!481755)))

(declare-fun c!92212 () Bool)

(assert (=> b!864786 (= c!92212 (= (select (arr!23909 _keys!868) from!1053) k0!854))))

(assert (=> b!864786 (= lt!391515 lt!391523)))

(declare-fun lt!391518 () ListLongMap!9957)

(assert (=> b!864786 (= lt!391523 (+!2343 lt!391518 lt!391514))))

(assert (=> b!864786 (= lt!391514 (tuple2!11189 (select (arr!23909 _keys!868) from!1053) lt!391526))))

(declare-fun get!12632 (ValueCell!7959 V!27443) V!27443)

(declare-fun dynLambda!1168 (Int (_ BitVec 64)) V!27443)

(assert (=> b!864786 (= lt!391526 (get!12632 (select (arr!23908 _values!688) from!1053) (dynLambda!1168 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!864787 () Bool)

(declare-fun res!587615 () Bool)

(assert (=> b!864787 (=> (not res!587615) (not e!481749))))

(assert (=> b!864787 (= res!587615 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24349 _keys!868))))))

(declare-fun b!864788 () Bool)

(assert (=> b!864788 (= e!481754 tp_is_empty!16797)))

(declare-fun b!864789 () Bool)

(declare-fun res!587606 () Bool)

(assert (=> b!864789 (=> (not res!587606) (not e!481749))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49756 (_ BitVec 32)) Bool)

(assert (=> b!864789 (= res!587606 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!26795 () Bool)

(assert (=> mapIsEmpty!26795 mapRes!26795))

(declare-fun b!864790 () Bool)

(assert (=> b!864790 (= e!481753 (not e!481756))))

(declare-fun res!587605 () Bool)

(assert (=> b!864790 (=> res!587605 e!481756)))

(assert (=> b!864790 (= res!587605 (not (validKeyInArray!0 (select (arr!23909 _keys!868) from!1053))))))

(declare-fun lt!391525 () ListLongMap!9957)

(assert (=> b!864790 (= lt!391525 lt!391518)))

(assert (=> b!864790 (= lt!391518 (+!2343 lt!391519 lt!391517))))

(assert (=> b!864790 (= lt!391525 (getCurrentListMapNoExtraKeys!2965 _keys!868 lt!391527 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!864790 (= lt!391517 (tuple2!11189 k0!854 v!557))))

(assert (=> b!864790 (= lt!391519 (getCurrentListMapNoExtraKeys!2965 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!391524 () Unit!29595)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!545 (array!49756 array!49754 (_ BitVec 32) (_ BitVec 32) V!27443 V!27443 (_ BitVec 32) (_ BitVec 64) V!27443 (_ BitVec 32) Int) Unit!29595)

(assert (=> b!864790 (= lt!391524 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!545 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!73746 res!587607) b!864777))

(assert (= (and b!864777 res!587608) b!864781))

(assert (= (and b!864781 res!587609) b!864789))

(assert (= (and b!864789 res!587606) b!864779))

(assert (= (and b!864779 res!587612) b!864787))

(assert (= (and b!864787 res!587615) b!864784))

(assert (= (and b!864784 res!587611) b!864776))

(assert (= (and b!864776 res!587614) b!864778))

(assert (= (and b!864778 res!587610) b!864790))

(assert (= (and b!864790 (not res!587605)) b!864786))

(assert (= (and b!864786 c!92212) b!864783))

(assert (= (and b!864786 (not c!92212)) b!864785))

(assert (= (and b!864786 (not res!587613)) b!864782))

(assert (= (and b!864775 condMapEmpty!26795) mapIsEmpty!26795))

(assert (= (and b!864775 (not condMapEmpty!26795)) mapNonEmpty!26795))

(get-info :version)

(assert (= (and mapNonEmpty!26795 ((_ is ValueCellFull!7959) mapValue!26795)) b!864788))

(assert (= (and b!864775 ((_ is ValueCellFull!7959) mapDefault!26795)) b!864780))

(assert (= start!73746 b!864775))

(declare-fun b_lambda!12013 () Bool)

(assert (=> (not b_lambda!12013) (not b!864786)))

(declare-fun t!23917 () Bool)

(declare-fun tb!4783 () Bool)

(assert (=> (and start!73746 (= defaultEntry!696 defaultEntry!696) t!23917) tb!4783))

(declare-fun result!9177 () Bool)

(assert (=> tb!4783 (= result!9177 tp_is_empty!16797)))

(assert (=> b!864786 t!23917))

(declare-fun b_and!24303 () Bool)

(assert (= b_and!24301 (and (=> t!23917 result!9177) b_and!24303)))

(declare-fun m!806169 () Bool)

(assert (=> start!73746 m!806169))

(declare-fun m!806171 () Bool)

(assert (=> start!73746 m!806171))

(declare-fun m!806173 () Bool)

(assert (=> b!864786 m!806173))

(declare-fun m!806175 () Bool)

(assert (=> b!864786 m!806175))

(declare-fun m!806177 () Bool)

(assert (=> b!864786 m!806177))

(declare-fun m!806179 () Bool)

(assert (=> b!864786 m!806179))

(assert (=> b!864786 m!806175))

(declare-fun m!806181 () Bool)

(assert (=> b!864786 m!806181))

(assert (=> b!864786 m!806177))

(declare-fun m!806183 () Bool)

(assert (=> b!864790 m!806183))

(declare-fun m!806185 () Bool)

(assert (=> b!864790 m!806185))

(assert (=> b!864790 m!806181))

(declare-fun m!806187 () Bool)

(assert (=> b!864790 m!806187))

(assert (=> b!864790 m!806181))

(declare-fun m!806189 () Bool)

(assert (=> b!864790 m!806189))

(declare-fun m!806191 () Bool)

(assert (=> b!864790 m!806191))

(declare-fun m!806193 () Bool)

(assert (=> b!864782 m!806193))

(assert (=> b!864782 m!806193))

(declare-fun m!806195 () Bool)

(assert (=> b!864782 m!806195))

(assert (=> b!864782 m!806181))

(assert (=> b!864782 m!806181))

(declare-fun m!806197 () Bool)

(assert (=> b!864782 m!806197))

(declare-fun m!806199 () Bool)

(assert (=> b!864783 m!806199))

(declare-fun m!806201 () Bool)

(assert (=> b!864783 m!806201))

(declare-fun m!806203 () Bool)

(assert (=> b!864783 m!806203))

(declare-fun m!806205 () Bool)

(assert (=> b!864783 m!806205))

(declare-fun m!806207 () Bool)

(assert (=> b!864783 m!806207))

(declare-fun m!806209 () Bool)

(assert (=> b!864776 m!806209))

(declare-fun m!806211 () Bool)

(assert (=> b!864789 m!806211))

(declare-fun m!806213 () Bool)

(assert (=> mapNonEmpty!26795 m!806213))

(declare-fun m!806215 () Bool)

(assert (=> b!864784 m!806215))

(declare-fun m!806217 () Bool)

(assert (=> b!864778 m!806217))

(declare-fun m!806219 () Bool)

(assert (=> b!864778 m!806219))

(declare-fun m!806221 () Bool)

(assert (=> b!864778 m!806221))

(declare-fun m!806223 () Bool)

(assert (=> b!864779 m!806223))

(declare-fun m!806225 () Bool)

(assert (=> b!864777 m!806225))

(check-sat (not b!864779) (not b!864777) (not mapNonEmpty!26795) (not b!864790) (not b!864784) (not b!864778) tp_is_empty!16797 (not b!864789) (not b!864783) b_and!24303 (not b_lambda!12013) (not start!73746) (not b!864786) (not b_next!14661) (not b!864782))
(check-sat b_and!24303 (not b_next!14661))
