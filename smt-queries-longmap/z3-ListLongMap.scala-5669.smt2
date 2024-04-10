; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73800 () Bool)

(assert start!73800)

(declare-fun b_free!14715 () Bool)

(declare-fun b_next!14715 () Bool)

(assert (=> start!73800 (= b_free!14715 (not b_next!14715))))

(declare-fun tp!51648 () Bool)

(declare-fun b_and!24409 () Bool)

(assert (=> start!73800 (= tp!51648 b_and!24409)))

(declare-fun b!866125 () Bool)

(declare-datatypes ((Unit!29683 0))(
  ( (Unit!29684) )
))
(declare-fun e!482485 () Unit!29683)

(declare-fun Unit!29685 () Unit!29683)

(assert (=> b!866125 (= e!482485 Unit!29685)))

(declare-fun b!866126 () Bool)

(declare-fun e!482482 () Bool)

(declare-fun e!482479 () Bool)

(assert (=> b!866126 (= e!482482 (not e!482479))))

(declare-fun res!588497 () Bool)

(assert (=> b!866126 (=> res!588497 e!482479)))

(declare-datatypes ((array!49862 0))(
  ( (array!49863 (arr!23962 (Array (_ BitVec 32) (_ BitVec 64))) (size!24402 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49862)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!866126 (= res!588497 (not (validKeyInArray!0 (select (arr!23962 _keys!868) from!1053))))))

(declare-datatypes ((V!27515 0))(
  ( (V!27516 (val!8473 Int)) )
))
(declare-datatypes ((tuple2!11234 0))(
  ( (tuple2!11235 (_1!5628 (_ BitVec 64)) (_2!5628 V!27515)) )
))
(declare-datatypes ((List!17036 0))(
  ( (Nil!17033) (Cons!17032 (h!18163 tuple2!11234) (t!24017 List!17036)) )
))
(declare-datatypes ((ListLongMap!10003 0))(
  ( (ListLongMap!10004 (toList!5017 List!17036)) )
))
(declare-fun lt!392813 () ListLongMap!10003)

(declare-fun lt!392823 () ListLongMap!10003)

(assert (=> b!866126 (= lt!392813 lt!392823)))

(declare-fun lt!392824 () ListLongMap!10003)

(declare-fun lt!392820 () tuple2!11234)

(declare-fun +!2365 (ListLongMap!10003 tuple2!11234) ListLongMap!10003)

(assert (=> b!866126 (= lt!392823 (+!2365 lt!392824 lt!392820))))

(declare-fun defaultEntry!696 () Int)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!27515)

(declare-fun zeroValue!654 () V!27515)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7986 0))(
  ( (ValueCellFull!7986 (v!10898 V!27515)) (EmptyCell!7986) )
))
(declare-datatypes ((array!49864 0))(
  ( (array!49865 (arr!23963 (Array (_ BitVec 32) ValueCell!7986)) (size!24403 (_ BitVec 32))) )
))
(declare-fun lt!392811 () array!49864)

(declare-fun getCurrentListMapNoExtraKeys!2988 (array!49862 array!49864 (_ BitVec 32) (_ BitVec 32) V!27515 V!27515 (_ BitVec 32) Int) ListLongMap!10003)

(assert (=> b!866126 (= lt!392813 (getCurrentListMapNoExtraKeys!2988 _keys!868 lt!392811 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun v!557 () V!27515)

(assert (=> b!866126 (= lt!392820 (tuple2!11235 k0!854 v!557))))

(declare-fun _values!688 () array!49864)

(assert (=> b!866126 (= lt!392824 (getCurrentListMapNoExtraKeys!2988 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lt!392817 () Unit!29683)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!564 (array!49862 array!49864 (_ BitVec 32) (_ BitVec 32) V!27515 V!27515 (_ BitVec 32) (_ BitVec 64) V!27515 (_ BitVec 32) Int) Unit!29683)

(assert (=> b!866126 (= lt!392817 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!564 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!866127 () Bool)

(declare-fun res!588505 () Bool)

(declare-fun e!482484 () Bool)

(assert (=> b!866127 (=> (not res!588505) (not e!482484))))

(assert (=> b!866127 (= res!588505 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24402 _keys!868))))))

(declare-fun b!866128 () Bool)

(declare-fun res!588499 () Bool)

(assert (=> b!866128 (=> (not res!588499) (not e!482484))))

(assert (=> b!866128 (= res!588499 (validKeyInArray!0 k0!854))))

(declare-fun mapNonEmpty!26876 () Bool)

(declare-fun mapRes!26876 () Bool)

(declare-fun tp!51649 () Bool)

(declare-fun e!482483 () Bool)

(assert (=> mapNonEmpty!26876 (= mapRes!26876 (and tp!51649 e!482483))))

(declare-fun mapRest!26876 () (Array (_ BitVec 32) ValueCell!7986))

(declare-fun mapKey!26876 () (_ BitVec 32))

(declare-fun mapValue!26876 () ValueCell!7986)

(assert (=> mapNonEmpty!26876 (= (arr!23963 _values!688) (store mapRest!26876 mapKey!26876 mapValue!26876))))

(declare-fun b!866129 () Bool)

(declare-fun e!482477 () Bool)

(declare-fun tp_is_empty!16851 () Bool)

(assert (=> b!866129 (= e!482477 tp_is_empty!16851)))

(declare-fun b!866130 () Bool)

(declare-fun Unit!29686 () Unit!29683)

(assert (=> b!866130 (= e!482485 Unit!29686)))

(declare-fun lt!392816 () Unit!29683)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49862 (_ BitVec 32) (_ BitVec 32)) Unit!29683)

(assert (=> b!866130 (= lt!392816 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!17037 0))(
  ( (Nil!17034) (Cons!17033 (h!18164 (_ BitVec 64)) (t!24018 List!17037)) )
))
(declare-fun arrayNoDuplicates!0 (array!49862 (_ BitVec 32) List!17037) Bool)

(assert (=> b!866130 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17034)))

(declare-fun lt!392815 () Unit!29683)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49862 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29683)

(assert (=> b!866130 (= lt!392815 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49862 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!866130 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!392814 () Unit!29683)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49862 (_ BitVec 64) (_ BitVec 32) List!17037) Unit!29683)

(assert (=> b!866130 (= lt!392814 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!17034))))

(assert (=> b!866130 false))

(declare-fun b!866131 () Bool)

(declare-fun res!588496 () Bool)

(assert (=> b!866131 (=> (not res!588496) (not e!482484))))

(assert (=> b!866131 (= res!588496 (and (= (size!24403 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24402 _keys!868) (size!24403 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!866132 () Bool)

(declare-fun e!482481 () Bool)

(assert (=> b!866132 (= e!482481 (and e!482477 mapRes!26876))))

(declare-fun condMapEmpty!26876 () Bool)

(declare-fun mapDefault!26876 () ValueCell!7986)

(assert (=> b!866132 (= condMapEmpty!26876 (= (arr!23963 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7986)) mapDefault!26876)))))

(declare-fun b!866133 () Bool)

(assert (=> b!866133 (= e!482484 e!482482)))

(declare-fun res!588498 () Bool)

(assert (=> b!866133 (=> (not res!588498) (not e!482482))))

(assert (=> b!866133 (= res!588498 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!392809 () ListLongMap!10003)

(assert (=> b!866133 (= lt!392809 (getCurrentListMapNoExtraKeys!2988 _keys!868 lt!392811 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!866133 (= lt!392811 (array!49865 (store (arr!23963 _values!688) i!612 (ValueCellFull!7986 v!557)) (size!24403 _values!688)))))

(declare-fun lt!392822 () ListLongMap!10003)

(assert (=> b!866133 (= lt!392822 (getCurrentListMapNoExtraKeys!2988 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!866134 () Bool)

(assert (=> b!866134 (= e!482483 tp_is_empty!16851)))

(declare-fun mapIsEmpty!26876 () Bool)

(assert (=> mapIsEmpty!26876 mapRes!26876))

(declare-fun res!588501 () Bool)

(assert (=> start!73800 (=> (not res!588501) (not e!482484))))

(assert (=> start!73800 (= res!588501 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24402 _keys!868))))))

(assert (=> start!73800 e!482484))

(assert (=> start!73800 tp_is_empty!16851))

(assert (=> start!73800 true))

(assert (=> start!73800 tp!51648))

(declare-fun array_inv!18940 (array!49862) Bool)

(assert (=> start!73800 (array_inv!18940 _keys!868)))

(declare-fun array_inv!18941 (array!49864) Bool)

(assert (=> start!73800 (and (array_inv!18941 _values!688) e!482481)))

(declare-fun b!866135 () Bool)

(declare-fun res!588502 () Bool)

(assert (=> b!866135 (=> (not res!588502) (not e!482484))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49862 (_ BitVec 32)) Bool)

(assert (=> b!866135 (= res!588502 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!866136 () Bool)

(declare-fun e!482478 () Bool)

(assert (=> b!866136 (= e!482478 true)))

(declare-fun lt!392819 () tuple2!11234)

(declare-fun lt!392810 () ListLongMap!10003)

(assert (=> b!866136 (= lt!392810 (+!2365 (+!2365 lt!392824 lt!392819) lt!392820))))

(declare-fun lt!392821 () V!27515)

(declare-fun lt!392818 () Unit!29683)

(declare-fun addCommutativeForDiffKeys!533 (ListLongMap!10003 (_ BitVec 64) V!27515 (_ BitVec 64) V!27515) Unit!29683)

(assert (=> b!866136 (= lt!392818 (addCommutativeForDiffKeys!533 lt!392824 k0!854 v!557 (select (arr!23962 _keys!868) from!1053) lt!392821))))

(declare-fun b!866137 () Bool)

(declare-fun res!588506 () Bool)

(assert (=> b!866137 (=> (not res!588506) (not e!482484))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!866137 (= res!588506 (validMask!0 mask!1196))))

(declare-fun b!866138 () Bool)

(assert (=> b!866138 (= e!482479 e!482478)))

(declare-fun res!588500 () Bool)

(assert (=> b!866138 (=> res!588500 e!482478)))

(assert (=> b!866138 (= res!588500 (= k0!854 (select (arr!23962 _keys!868) from!1053)))))

(assert (=> b!866138 (not (= (select (arr!23962 _keys!868) from!1053) k0!854))))

(declare-fun lt!392812 () Unit!29683)

(assert (=> b!866138 (= lt!392812 e!482485)))

(declare-fun c!92293 () Bool)

(assert (=> b!866138 (= c!92293 (= (select (arr!23962 _keys!868) from!1053) k0!854))))

(assert (=> b!866138 (= lt!392809 lt!392810)))

(assert (=> b!866138 (= lt!392810 (+!2365 lt!392823 lt!392819))))

(assert (=> b!866138 (= lt!392819 (tuple2!11235 (select (arr!23962 _keys!868) from!1053) lt!392821))))

(declare-fun get!12667 (ValueCell!7986 V!27515) V!27515)

(declare-fun dynLambda!1185 (Int (_ BitVec 64)) V!27515)

(assert (=> b!866138 (= lt!392821 (get!12667 (select (arr!23963 _values!688) from!1053) (dynLambda!1185 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!866139 () Bool)

(declare-fun res!588503 () Bool)

(assert (=> b!866139 (=> (not res!588503) (not e!482484))))

(assert (=> b!866139 (= res!588503 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17034))))

(declare-fun b!866140 () Bool)

(declare-fun res!588504 () Bool)

(assert (=> b!866140 (=> (not res!588504) (not e!482484))))

(assert (=> b!866140 (= res!588504 (and (= (select (arr!23962 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(assert (= (and start!73800 res!588501) b!866137))

(assert (= (and b!866137 res!588506) b!866131))

(assert (= (and b!866131 res!588496) b!866135))

(assert (= (and b!866135 res!588502) b!866139))

(assert (= (and b!866139 res!588503) b!866127))

(assert (= (and b!866127 res!588505) b!866128))

(assert (= (and b!866128 res!588499) b!866140))

(assert (= (and b!866140 res!588504) b!866133))

(assert (= (and b!866133 res!588498) b!866126))

(assert (= (and b!866126 (not res!588497)) b!866138))

(assert (= (and b!866138 c!92293) b!866130))

(assert (= (and b!866138 (not c!92293)) b!866125))

(assert (= (and b!866138 (not res!588500)) b!866136))

(assert (= (and b!866132 condMapEmpty!26876) mapIsEmpty!26876))

(assert (= (and b!866132 (not condMapEmpty!26876)) mapNonEmpty!26876))

(get-info :version)

(assert (= (and mapNonEmpty!26876 ((_ is ValueCellFull!7986) mapValue!26876)) b!866134))

(assert (= (and b!866132 ((_ is ValueCellFull!7986) mapDefault!26876)) b!866129))

(assert (= start!73800 b!866132))

(declare-fun b_lambda!12067 () Bool)

(assert (=> (not b_lambda!12067) (not b!866138)))

(declare-fun t!24016 () Bool)

(declare-fun tb!4837 () Bool)

(assert (=> (and start!73800 (= defaultEntry!696 defaultEntry!696) t!24016) tb!4837))

(declare-fun result!9285 () Bool)

(assert (=> tb!4837 (= result!9285 tp_is_empty!16851)))

(assert (=> b!866138 t!24016))

(declare-fun b_and!24411 () Bool)

(assert (= b_and!24409 (and (=> t!24016 result!9285) b_and!24411)))

(declare-fun m!807735 () Bool)

(assert (=> b!866130 m!807735))

(declare-fun m!807737 () Bool)

(assert (=> b!866130 m!807737))

(declare-fun m!807739 () Bool)

(assert (=> b!866130 m!807739))

(declare-fun m!807741 () Bool)

(assert (=> b!866130 m!807741))

(declare-fun m!807743 () Bool)

(assert (=> b!866130 m!807743))

(declare-fun m!807745 () Bool)

(assert (=> b!866138 m!807745))

(declare-fun m!807747 () Bool)

(assert (=> b!866138 m!807747))

(declare-fun m!807749 () Bool)

(assert (=> b!866138 m!807749))

(declare-fun m!807751 () Bool)

(assert (=> b!866138 m!807751))

(assert (=> b!866138 m!807747))

(declare-fun m!807753 () Bool)

(assert (=> b!866138 m!807753))

(assert (=> b!866138 m!807749))

(declare-fun m!807755 () Bool)

(assert (=> b!866137 m!807755))

(declare-fun m!807757 () Bool)

(assert (=> b!866133 m!807757))

(declare-fun m!807759 () Bool)

(assert (=> b!866133 m!807759))

(declare-fun m!807761 () Bool)

(assert (=> b!866133 m!807761))

(declare-fun m!807763 () Bool)

(assert (=> b!866135 m!807763))

(declare-fun m!807765 () Bool)

(assert (=> b!866136 m!807765))

(assert (=> b!866136 m!807765))

(declare-fun m!807767 () Bool)

(assert (=> b!866136 m!807767))

(assert (=> b!866136 m!807753))

(assert (=> b!866136 m!807753))

(declare-fun m!807769 () Bool)

(assert (=> b!866136 m!807769))

(declare-fun m!807771 () Bool)

(assert (=> b!866128 m!807771))

(declare-fun m!807773 () Bool)

(assert (=> mapNonEmpty!26876 m!807773))

(declare-fun m!807775 () Bool)

(assert (=> b!866126 m!807775))

(assert (=> b!866126 m!807753))

(declare-fun m!807777 () Bool)

(assert (=> b!866126 m!807777))

(assert (=> b!866126 m!807753))

(declare-fun m!807779 () Bool)

(assert (=> b!866126 m!807779))

(declare-fun m!807781 () Bool)

(assert (=> b!866126 m!807781))

(declare-fun m!807783 () Bool)

(assert (=> b!866126 m!807783))

(declare-fun m!807785 () Bool)

(assert (=> start!73800 m!807785))

(declare-fun m!807787 () Bool)

(assert (=> start!73800 m!807787))

(declare-fun m!807789 () Bool)

(assert (=> b!866139 m!807789))

(declare-fun m!807791 () Bool)

(assert (=> b!866140 m!807791))

(check-sat (not b!866126) (not b_lambda!12067) (not b!866128) (not start!73800) (not b!866133) (not mapNonEmpty!26876) (not b!866135) (not b!866138) (not b!866139) b_and!24411 tp_is_empty!16851 (not b!866137) (not b!866130) (not b!866136) (not b_next!14715))
(check-sat b_and!24411 (not b_next!14715))
