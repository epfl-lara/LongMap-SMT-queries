; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73390 () Bool)

(assert start!73390)

(declare-fun b_free!14323 () Bool)

(declare-fun b_next!14323 () Bool)

(assert (=> start!73390 (= b_free!14323 (not b_next!14323))))

(declare-fun tp!50473 () Bool)

(declare-fun b_and!23653 () Bool)

(assert (=> start!73390 (= tp!50473 b_and!23653)))

(declare-fun b!856699 () Bool)

(declare-fun e!477500 () Bool)

(assert (=> b!856699 (= e!477500 (not true))))

(declare-datatypes ((V!26993 0))(
  ( (V!26994 (val!8277 Int)) )
))
(declare-datatypes ((ValueCell!7790 0))(
  ( (ValueCellFull!7790 (v!10696 V!26993)) (EmptyCell!7790) )
))
(declare-datatypes ((array!49091 0))(
  ( (array!49092 (arr!23577 (Array (_ BitVec 32) ValueCell!7790)) (size!24019 (_ BitVec 32))) )
))
(declare-fun lt!385887 () array!49091)

(declare-fun v!557 () V!26993)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!49093 0))(
  ( (array!49094 (arr!23578 (Array (_ BitVec 32) (_ BitVec 64))) (size!24020 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49093)

(declare-fun _values!688 () array!49091)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26993)

(declare-fun zeroValue!654 () V!26993)

(declare-datatypes ((tuple2!10922 0))(
  ( (tuple2!10923 (_1!5472 (_ BitVec 64)) (_2!5472 V!26993)) )
))
(declare-datatypes ((List!16727 0))(
  ( (Nil!16724) (Cons!16723 (h!17854 tuple2!10922) (t!23359 List!16727)) )
))
(declare-datatypes ((ListLongMap!9681 0))(
  ( (ListLongMap!9682 (toList!4856 List!16727)) )
))
(declare-fun getCurrentListMapNoExtraKeys!2863 (array!49093 array!49091 (_ BitVec 32) (_ BitVec 32) V!26993 V!26993 (_ BitVec 32) Int) ListLongMap!9681)

(declare-fun +!2233 (ListLongMap!9681 tuple2!10922) ListLongMap!9681)

(assert (=> b!856699 (= (getCurrentListMapNoExtraKeys!2863 _keys!868 lt!385887 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2233 (getCurrentListMapNoExtraKeys!2863 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10923 k0!854 v!557)))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!29135 0))(
  ( (Unit!29136) )
))
(declare-fun lt!385889 () Unit!29135)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!430 (array!49093 array!49091 (_ BitVec 32) (_ BitVec 32) V!26993 V!26993 (_ BitVec 32) (_ BitVec 64) V!26993 (_ BitVec 32) Int) Unit!29135)

(assert (=> b!856699 (= lt!385889 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!430 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!856700 () Bool)

(declare-fun res!581966 () Bool)

(declare-fun e!477503 () Bool)

(assert (=> b!856700 (=> (not res!581966) (not e!477503))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!856700 (= res!581966 (validMask!0 mask!1196))))

(declare-fun res!581964 () Bool)

(assert (=> start!73390 (=> (not res!581964) (not e!477503))))

(assert (=> start!73390 (= res!581964 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24020 _keys!868))))))

(assert (=> start!73390 e!477503))

(declare-fun tp_is_empty!16459 () Bool)

(assert (=> start!73390 tp_is_empty!16459))

(assert (=> start!73390 true))

(assert (=> start!73390 tp!50473))

(declare-fun array_inv!18740 (array!49093) Bool)

(assert (=> start!73390 (array_inv!18740 _keys!868)))

(declare-fun e!477504 () Bool)

(declare-fun array_inv!18741 (array!49091) Bool)

(assert (=> start!73390 (and (array_inv!18741 _values!688) e!477504)))

(declare-fun b!856701 () Bool)

(declare-fun res!581965 () Bool)

(assert (=> b!856701 (=> (not res!581965) (not e!477503))))

(assert (=> b!856701 (= res!581965 (and (= (select (arr!23578 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!856702 () Bool)

(declare-fun res!581959 () Bool)

(assert (=> b!856702 (=> (not res!581959) (not e!477503))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49093 (_ BitVec 32)) Bool)

(assert (=> b!856702 (= res!581959 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!856703 () Bool)

(declare-fun res!581960 () Bool)

(assert (=> b!856703 (=> (not res!581960) (not e!477503))))

(declare-datatypes ((List!16728 0))(
  ( (Nil!16725) (Cons!16724 (h!17855 (_ BitVec 64)) (t!23360 List!16728)) )
))
(declare-fun arrayNoDuplicates!0 (array!49093 (_ BitVec 32) List!16728) Bool)

(assert (=> b!856703 (= res!581960 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16725))))

(declare-fun mapIsEmpty!26288 () Bool)

(declare-fun mapRes!26288 () Bool)

(assert (=> mapIsEmpty!26288 mapRes!26288))

(declare-fun b!856704 () Bool)

(declare-fun e!477502 () Bool)

(assert (=> b!856704 (= e!477504 (and e!477502 mapRes!26288))))

(declare-fun condMapEmpty!26288 () Bool)

(declare-fun mapDefault!26288 () ValueCell!7790)

(assert (=> b!856704 (= condMapEmpty!26288 (= (arr!23577 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7790)) mapDefault!26288)))))

(declare-fun b!856705 () Bool)

(assert (=> b!856705 (= e!477503 e!477500)))

(declare-fun res!581961 () Bool)

(assert (=> b!856705 (=> (not res!581961) (not e!477500))))

(assert (=> b!856705 (= res!581961 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!385888 () ListLongMap!9681)

(assert (=> b!856705 (= lt!385888 (getCurrentListMapNoExtraKeys!2863 _keys!868 lt!385887 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!856705 (= lt!385887 (array!49092 (store (arr!23577 _values!688) i!612 (ValueCellFull!7790 v!557)) (size!24019 _values!688)))))

(declare-fun lt!385886 () ListLongMap!9681)

(assert (=> b!856705 (= lt!385886 (getCurrentListMapNoExtraKeys!2863 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!856706 () Bool)

(declare-fun res!581967 () Bool)

(assert (=> b!856706 (=> (not res!581967) (not e!477503))))

(assert (=> b!856706 (= res!581967 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24020 _keys!868))))))

(declare-fun mapNonEmpty!26288 () Bool)

(declare-fun tp!50474 () Bool)

(declare-fun e!477501 () Bool)

(assert (=> mapNonEmpty!26288 (= mapRes!26288 (and tp!50474 e!477501))))

(declare-fun mapValue!26288 () ValueCell!7790)

(declare-fun mapRest!26288 () (Array (_ BitVec 32) ValueCell!7790))

(declare-fun mapKey!26288 () (_ BitVec 32))

(assert (=> mapNonEmpty!26288 (= (arr!23577 _values!688) (store mapRest!26288 mapKey!26288 mapValue!26288))))

(declare-fun b!856707 () Bool)

(declare-fun res!581963 () Bool)

(assert (=> b!856707 (=> (not res!581963) (not e!477503))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!856707 (= res!581963 (validKeyInArray!0 k0!854))))

(declare-fun b!856708 () Bool)

(assert (=> b!856708 (= e!477502 tp_is_empty!16459)))

(declare-fun b!856709 () Bool)

(declare-fun res!581962 () Bool)

(assert (=> b!856709 (=> (not res!581962) (not e!477503))))

(assert (=> b!856709 (= res!581962 (and (= (size!24019 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24020 _keys!868) (size!24019 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!856710 () Bool)

(assert (=> b!856710 (= e!477501 tp_is_empty!16459)))

(assert (= (and start!73390 res!581964) b!856700))

(assert (= (and b!856700 res!581966) b!856709))

(assert (= (and b!856709 res!581962) b!856702))

(assert (= (and b!856702 res!581959) b!856703))

(assert (= (and b!856703 res!581960) b!856706))

(assert (= (and b!856706 res!581967) b!856707))

(assert (= (and b!856707 res!581963) b!856701))

(assert (= (and b!856701 res!581965) b!856705))

(assert (= (and b!856705 res!581961) b!856699))

(assert (= (and b!856704 condMapEmpty!26288) mapIsEmpty!26288))

(assert (= (and b!856704 (not condMapEmpty!26288)) mapNonEmpty!26288))

(get-info :version)

(assert (= (and mapNonEmpty!26288 ((_ is ValueCellFull!7790) mapValue!26288)) b!856710))

(assert (= (and b!856704 ((_ is ValueCellFull!7790) mapDefault!26288)) b!856708))

(assert (= start!73390 b!856704))

(declare-fun m!797043 () Bool)

(assert (=> b!856707 m!797043))

(declare-fun m!797045 () Bool)

(assert (=> mapNonEmpty!26288 m!797045))

(declare-fun m!797047 () Bool)

(assert (=> b!856701 m!797047))

(declare-fun m!797049 () Bool)

(assert (=> b!856703 m!797049))

(declare-fun m!797051 () Bool)

(assert (=> start!73390 m!797051))

(declare-fun m!797053 () Bool)

(assert (=> start!73390 m!797053))

(declare-fun m!797055 () Bool)

(assert (=> b!856702 m!797055))

(declare-fun m!797057 () Bool)

(assert (=> b!856705 m!797057))

(declare-fun m!797059 () Bool)

(assert (=> b!856705 m!797059))

(declare-fun m!797061 () Bool)

(assert (=> b!856705 m!797061))

(declare-fun m!797063 () Bool)

(assert (=> b!856699 m!797063))

(declare-fun m!797065 () Bool)

(assert (=> b!856699 m!797065))

(assert (=> b!856699 m!797065))

(declare-fun m!797067 () Bool)

(assert (=> b!856699 m!797067))

(declare-fun m!797069 () Bool)

(assert (=> b!856699 m!797069))

(declare-fun m!797071 () Bool)

(assert (=> b!856700 m!797071))

(check-sat (not b_next!14323) (not b!856699) (not b!856707) (not b!856700) (not b!856702) (not b!856705) tp_is_empty!16459 (not start!73390) (not b!856703) b_and!23653 (not mapNonEmpty!26288))
(check-sat b_and!23653 (not b_next!14323))
