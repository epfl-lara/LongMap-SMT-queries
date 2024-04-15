; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73498 () Bool)

(assert start!73498)

(declare-fun b_free!14431 () Bool)

(declare-fun b_next!14431 () Bool)

(assert (=> start!73498 (= b_free!14431 (not b_next!14431))))

(declare-fun tp!50797 () Bool)

(declare-fun b_and!23815 () Bool)

(assert (=> start!73498 (= tp!50797 b_and!23815)))

(declare-fun b!858827 () Bool)

(declare-fun e!478607 () Bool)

(assert (=> b!858827 (= e!478607 true)))

(declare-datatypes ((array!49299 0))(
  ( (array!49300 (arr!23681 (Array (_ BitVec 32) (_ BitVec 64))) (size!24123 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49299)

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((List!16806 0))(
  ( (Nil!16803) (Cons!16802 (h!17933 (_ BitVec 64)) (t!23494 List!16806)) )
))
(declare-fun arrayNoDuplicates!0 (array!49299 (_ BitVec 32) List!16806) Bool)

(assert (=> b!858827 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16803)))

(declare-datatypes ((Unit!29213 0))(
  ( (Unit!29214) )
))
(declare-fun lt!386823 () Unit!29213)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49299 (_ BitVec 32) (_ BitVec 32)) Unit!29213)

(assert (=> b!858827 (= lt!386823 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun res!583551 () Bool)

(declare-fun e!478604 () Bool)

(assert (=> start!73498 (=> (not res!583551) (not e!478604))))

(assert (=> start!73498 (= res!583551 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24123 _keys!868))))))

(assert (=> start!73498 e!478604))

(declare-fun tp_is_empty!16567 () Bool)

(assert (=> start!73498 tp_is_empty!16567))

(assert (=> start!73498 true))

(assert (=> start!73498 tp!50797))

(declare-fun array_inv!18814 (array!49299) Bool)

(assert (=> start!73498 (array_inv!18814 _keys!868)))

(declare-datatypes ((V!27137 0))(
  ( (V!27138 (val!8331 Int)) )
))
(declare-datatypes ((ValueCell!7844 0))(
  ( (ValueCellFull!7844 (v!10750 V!27137)) (EmptyCell!7844) )
))
(declare-datatypes ((array!49301 0))(
  ( (array!49302 (arr!23682 (Array (_ BitVec 32) ValueCell!7844)) (size!24124 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49301)

(declare-fun e!478605 () Bool)

(declare-fun array_inv!18815 (array!49301) Bool)

(assert (=> start!73498 (and (array_inv!18815 _values!688) e!478605)))

(declare-fun b!858828 () Bool)

(declare-fun res!583556 () Bool)

(assert (=> b!858828 (=> (not res!583556) (not e!478604))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!858828 (= res!583556 (validKeyInArray!0 k0!854))))

(declare-fun mapNonEmpty!26450 () Bool)

(declare-fun mapRes!26450 () Bool)

(declare-fun tp!50798 () Bool)

(declare-fun e!478603 () Bool)

(assert (=> mapNonEmpty!26450 (= mapRes!26450 (and tp!50798 e!478603))))

(declare-fun mapValue!26450 () ValueCell!7844)

(declare-fun mapKey!26450 () (_ BitVec 32))

(declare-fun mapRest!26450 () (Array (_ BitVec 32) ValueCell!7844))

(assert (=> mapNonEmpty!26450 (= (arr!23682 _values!688) (store mapRest!26450 mapKey!26450 mapValue!26450))))

(declare-fun b!858829 () Bool)

(declare-fun e!478602 () Bool)

(assert (=> b!858829 (= e!478602 e!478607)))

(declare-fun res!583549 () Bool)

(assert (=> b!858829 (=> res!583549 e!478607)))

(assert (=> b!858829 (= res!583549 (not (= (select (arr!23681 _keys!868) from!1053) k0!854)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11004 0))(
  ( (tuple2!11005 (_1!5513 (_ BitVec 64)) (_2!5513 V!27137)) )
))
(declare-datatypes ((List!16807 0))(
  ( (Nil!16804) (Cons!16803 (h!17934 tuple2!11004) (t!23495 List!16807)) )
))
(declare-datatypes ((ListLongMap!9763 0))(
  ( (ListLongMap!9764 (toList!4897 List!16807)) )
))
(declare-fun lt!386827 () ListLongMap!9763)

(declare-fun lt!386828 () ListLongMap!9763)

(declare-fun +!2271 (ListLongMap!9763 tuple2!11004) ListLongMap!9763)

(declare-fun get!12480 (ValueCell!7844 V!27137) V!27137)

(declare-fun dynLambda!1089 (Int (_ BitVec 64)) V!27137)

(assert (=> b!858829 (= lt!386828 (+!2271 lt!386827 (tuple2!11005 (select (arr!23681 _keys!868) from!1053) (get!12480 (select (arr!23682 _values!688) from!1053) (dynLambda!1089 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!858830 () Bool)

(declare-fun e!478601 () Bool)

(assert (=> b!858830 (= e!478601 tp_is_empty!16567)))

(declare-fun b!858831 () Bool)

(assert (=> b!858831 (= e!478605 (and e!478601 mapRes!26450))))

(declare-fun condMapEmpty!26450 () Bool)

(declare-fun mapDefault!26450 () ValueCell!7844)

(assert (=> b!858831 (= condMapEmpty!26450 (= (arr!23682 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7844)) mapDefault!26450)))))

(declare-fun b!858832 () Bool)

(declare-fun res!583557 () Bool)

(assert (=> b!858832 (=> (not res!583557) (not e!478604))))

(assert (=> b!858832 (= res!583557 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16803))))

(declare-fun b!858833 () Bool)

(declare-fun res!583548 () Bool)

(assert (=> b!858833 (=> (not res!583548) (not e!478604))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!858833 (= res!583548 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24123 _keys!868))))))

(declare-fun b!858834 () Bool)

(declare-fun res!583550 () Bool)

(assert (=> b!858834 (=> (not res!583550) (not e!478604))))

(assert (=> b!858834 (= res!583550 (and (= (select (arr!23681 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!858835 () Bool)

(declare-fun e!478608 () Bool)

(assert (=> b!858835 (= e!478608 (not e!478602))))

(declare-fun res!583553 () Bool)

(assert (=> b!858835 (=> res!583553 e!478602)))

(assert (=> b!858835 (= res!583553 (not (validKeyInArray!0 (select (arr!23681 _keys!868) from!1053))))))

(declare-fun lt!386822 () ListLongMap!9763)

(assert (=> b!858835 (= lt!386822 lt!386827)))

(declare-fun v!557 () V!27137)

(declare-fun lt!386825 () ListLongMap!9763)

(assert (=> b!858835 (= lt!386827 (+!2271 lt!386825 (tuple2!11005 k0!854 v!557)))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun lt!386826 () array!49301)

(declare-fun minValue!654 () V!27137)

(declare-fun zeroValue!654 () V!27137)

(declare-fun getCurrentListMapNoExtraKeys!2902 (array!49299 array!49301 (_ BitVec 32) (_ BitVec 32) V!27137 V!27137 (_ BitVec 32) Int) ListLongMap!9763)

(assert (=> b!858835 (= lt!386822 (getCurrentListMapNoExtraKeys!2902 _keys!868 lt!386826 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!858835 (= lt!386825 (getCurrentListMapNoExtraKeys!2902 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!386824 () Unit!29213)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!464 (array!49299 array!49301 (_ BitVec 32) (_ BitVec 32) V!27137 V!27137 (_ BitVec 32) (_ BitVec 64) V!27137 (_ BitVec 32) Int) Unit!29213)

(assert (=> b!858835 (= lt!386824 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!464 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!858836 () Bool)

(declare-fun res!583547 () Bool)

(assert (=> b!858836 (=> (not res!583547) (not e!478604))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49299 (_ BitVec 32)) Bool)

(assert (=> b!858836 (= res!583547 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!26450 () Bool)

(assert (=> mapIsEmpty!26450 mapRes!26450))

(declare-fun b!858837 () Bool)

(assert (=> b!858837 (= e!478604 e!478608)))

(declare-fun res!583554 () Bool)

(assert (=> b!858837 (=> (not res!583554) (not e!478608))))

(assert (=> b!858837 (= res!583554 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!858837 (= lt!386828 (getCurrentListMapNoExtraKeys!2902 _keys!868 lt!386826 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!858837 (= lt!386826 (array!49302 (store (arr!23682 _values!688) i!612 (ValueCellFull!7844 v!557)) (size!24124 _values!688)))))

(declare-fun lt!386821 () ListLongMap!9763)

(assert (=> b!858837 (= lt!386821 (getCurrentListMapNoExtraKeys!2902 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!858838 () Bool)

(assert (=> b!858838 (= e!478603 tp_is_empty!16567)))

(declare-fun b!858839 () Bool)

(declare-fun res!583555 () Bool)

(assert (=> b!858839 (=> (not res!583555) (not e!478604))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!858839 (= res!583555 (validMask!0 mask!1196))))

(declare-fun b!858840 () Bool)

(declare-fun res!583552 () Bool)

(assert (=> b!858840 (=> (not res!583552) (not e!478604))))

(assert (=> b!858840 (= res!583552 (and (= (size!24124 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24123 _keys!868) (size!24124 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!73498 res!583551) b!858839))

(assert (= (and b!858839 res!583555) b!858840))

(assert (= (and b!858840 res!583552) b!858836))

(assert (= (and b!858836 res!583547) b!858832))

(assert (= (and b!858832 res!583557) b!858833))

(assert (= (and b!858833 res!583548) b!858828))

(assert (= (and b!858828 res!583556) b!858834))

(assert (= (and b!858834 res!583550) b!858837))

(assert (= (and b!858837 res!583554) b!858835))

(assert (= (and b!858835 (not res!583553)) b!858829))

(assert (= (and b!858829 (not res!583549)) b!858827))

(assert (= (and b!858831 condMapEmpty!26450) mapIsEmpty!26450))

(assert (= (and b!858831 (not condMapEmpty!26450)) mapNonEmpty!26450))

(get-info :version)

(assert (= (and mapNonEmpty!26450 ((_ is ValueCellFull!7844) mapValue!26450)) b!858838))

(assert (= (and b!858831 ((_ is ValueCellFull!7844) mapDefault!26450)) b!858830))

(assert (= start!73498 b!858831))

(declare-fun b_lambda!11765 () Bool)

(assert (=> (not b_lambda!11765) (not b!858829)))

(declare-fun t!23493 () Bool)

(declare-fun tb!4545 () Bool)

(assert (=> (and start!73498 (= defaultEntry!696 defaultEntry!696) t!23493) tb!4545))

(declare-fun result!8709 () Bool)

(assert (=> tb!4545 (= result!8709 tp_is_empty!16567)))

(assert (=> b!858829 t!23493))

(declare-fun b_and!23817 () Bool)

(assert (= b_and!23815 (and (=> t!23493 result!8709) b_and!23817)))

(declare-fun m!799047 () Bool)

(assert (=> b!858835 m!799047))

(declare-fun m!799049 () Bool)

(assert (=> b!858835 m!799049))

(declare-fun m!799051 () Bool)

(assert (=> b!858835 m!799051))

(declare-fun m!799053 () Bool)

(assert (=> b!858835 m!799053))

(declare-fun m!799055 () Bool)

(assert (=> b!858835 m!799055))

(declare-fun m!799057 () Bool)

(assert (=> b!858835 m!799057))

(assert (=> b!858835 m!799051))

(declare-fun m!799059 () Bool)

(assert (=> b!858837 m!799059))

(declare-fun m!799061 () Bool)

(assert (=> b!858837 m!799061))

(declare-fun m!799063 () Bool)

(assert (=> b!858837 m!799063))

(declare-fun m!799065 () Bool)

(assert (=> b!858836 m!799065))

(declare-fun m!799067 () Bool)

(assert (=> start!73498 m!799067))

(declare-fun m!799069 () Bool)

(assert (=> start!73498 m!799069))

(declare-fun m!799071 () Bool)

(assert (=> b!858834 m!799071))

(declare-fun m!799073 () Bool)

(assert (=> b!858839 m!799073))

(declare-fun m!799075 () Bool)

(assert (=> b!858832 m!799075))

(declare-fun m!799077 () Bool)

(assert (=> b!858829 m!799077))

(declare-fun m!799079 () Bool)

(assert (=> b!858829 m!799079))

(declare-fun m!799081 () Bool)

(assert (=> b!858829 m!799081))

(declare-fun m!799083 () Bool)

(assert (=> b!858829 m!799083))

(assert (=> b!858829 m!799079))

(assert (=> b!858829 m!799051))

(assert (=> b!858829 m!799081))

(declare-fun m!799085 () Bool)

(assert (=> b!858827 m!799085))

(declare-fun m!799087 () Bool)

(assert (=> b!858827 m!799087))

(declare-fun m!799089 () Bool)

(assert (=> mapNonEmpty!26450 m!799089))

(declare-fun m!799091 () Bool)

(assert (=> b!858828 m!799091))

(check-sat (not start!73498) (not b!858832) (not b!858829) (not b_lambda!11765) (not b!858828) (not b!858835) (not b!858839) (not b_next!14431) (not b!858836) (not b!858827) tp_is_empty!16567 (not mapNonEmpty!26450) b_and!23817 (not b!858837))
(check-sat b_and!23817 (not b_next!14431))
