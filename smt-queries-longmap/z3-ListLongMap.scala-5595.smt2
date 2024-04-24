; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73522 () Bool)

(assert start!73522)

(declare-fun b_free!14269 () Bool)

(declare-fun b_next!14269 () Bool)

(assert (=> start!73522 (= b_free!14269 (not b_next!14269))))

(declare-fun tp!50312 () Bool)

(declare-fun b_and!23635 () Bool)

(assert (=> start!73522 (= tp!50312 b_and!23635)))

(declare-fun b!856869 () Bool)

(declare-fun res!581689 () Bool)

(declare-fun e!477747 () Bool)

(assert (=> b!856869 (=> (not res!581689) (not e!477747))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((array!49051 0))(
  ( (array!49052 (arr!23552 (Array (_ BitVec 32) (_ BitVec 64))) (size!23993 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49051)

(declare-datatypes ((V!26921 0))(
  ( (V!26922 (val!8250 Int)) )
))
(declare-datatypes ((ValueCell!7763 0))(
  ( (ValueCellFull!7763 (v!10675 V!26921)) (EmptyCell!7763) )
))
(declare-datatypes ((array!49053 0))(
  ( (array!49054 (arr!23553 (Array (_ BitVec 32) ValueCell!7763)) (size!23994 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49053)

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!856869 (= res!581689 (and (= (size!23994 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23993 _keys!868) (size!23994 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!856870 () Bool)

(declare-fun e!477743 () Bool)

(assert (=> b!856870 (= e!477747 e!477743)))

(declare-fun res!581690 () Bool)

(assert (=> b!856870 (=> (not res!581690) (not e!477743))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!856870 (= res!581690 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!10794 0))(
  ( (tuple2!10795 (_1!5408 (_ BitVec 64)) (_2!5408 V!26921)) )
))
(declare-datatypes ((List!16639 0))(
  ( (Nil!16636) (Cons!16635 (h!17772 tuple2!10794) (t!23272 List!16639)) )
))
(declare-datatypes ((ListLongMap!9565 0))(
  ( (ListLongMap!9566 (toList!4798 List!16639)) )
))
(declare-fun lt!386161 () ListLongMap!9565)

(declare-fun lt!386159 () array!49053)

(declare-fun minValue!654 () V!26921)

(declare-fun zeroValue!654 () V!26921)

(declare-fun getCurrentListMapNoExtraKeys!2854 (array!49051 array!49053 (_ BitVec 32) (_ BitVec 32) V!26921 V!26921 (_ BitVec 32) Int) ListLongMap!9565)

(assert (=> b!856870 (= lt!386161 (getCurrentListMapNoExtraKeys!2854 _keys!868 lt!386159 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26921)

(assert (=> b!856870 (= lt!386159 (array!49054 (store (arr!23553 _values!688) i!612 (ValueCellFull!7763 v!557)) (size!23994 _values!688)))))

(declare-fun lt!386160 () ListLongMap!9565)

(assert (=> b!856870 (= lt!386160 (getCurrentListMapNoExtraKeys!2854 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapNonEmpty!26207 () Bool)

(declare-fun mapRes!26207 () Bool)

(declare-fun tp!50311 () Bool)

(declare-fun e!477745 () Bool)

(assert (=> mapNonEmpty!26207 (= mapRes!26207 (and tp!50311 e!477745))))

(declare-fun mapRest!26207 () (Array (_ BitVec 32) ValueCell!7763))

(declare-fun mapKey!26207 () (_ BitVec 32))

(declare-fun mapValue!26207 () ValueCell!7763)

(assert (=> mapNonEmpty!26207 (= (arr!23553 _values!688) (store mapRest!26207 mapKey!26207 mapValue!26207))))

(declare-fun b!856871 () Bool)

(declare-fun e!477746 () Bool)

(declare-fun e!477748 () Bool)

(assert (=> b!856871 (= e!477746 (and e!477748 mapRes!26207))))

(declare-fun condMapEmpty!26207 () Bool)

(declare-fun mapDefault!26207 () ValueCell!7763)

(assert (=> b!856871 (= condMapEmpty!26207 (= (arr!23553 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7763)) mapDefault!26207)))))

(declare-fun res!581684 () Bool)

(assert (=> start!73522 (=> (not res!581684) (not e!477747))))

(assert (=> start!73522 (= res!581684 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23993 _keys!868))))))

(assert (=> start!73522 e!477747))

(declare-fun tp_is_empty!16405 () Bool)

(assert (=> start!73522 tp_is_empty!16405))

(assert (=> start!73522 true))

(assert (=> start!73522 tp!50312))

(declare-fun array_inv!18708 (array!49051) Bool)

(assert (=> start!73522 (array_inv!18708 _keys!868)))

(declare-fun array_inv!18709 (array!49053) Bool)

(assert (=> start!73522 (and (array_inv!18709 _values!688) e!477746)))

(declare-fun b!856872 () Bool)

(declare-fun res!581686 () Bool)

(assert (=> b!856872 (=> (not res!581686) (not e!477747))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!856872 (= res!581686 (validMask!0 mask!1196))))

(declare-fun b!856873 () Bool)

(assert (=> b!856873 (= e!477748 tp_is_empty!16405)))

(declare-fun b!856874 () Bool)

(declare-fun res!581687 () Bool)

(assert (=> b!856874 (=> (not res!581687) (not e!477747))))

(assert (=> b!856874 (= res!581687 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23993 _keys!868))))))

(declare-fun b!856875 () Bool)

(declare-fun res!581685 () Bool)

(assert (=> b!856875 (=> (not res!581685) (not e!477747))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49051 (_ BitVec 32)) Bool)

(assert (=> b!856875 (= res!581685 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!856876 () Bool)

(declare-fun res!581688 () Bool)

(assert (=> b!856876 (=> (not res!581688) (not e!477747))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!856876 (= res!581688 (and (= (select (arr!23552 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!856877 () Bool)

(assert (=> b!856877 (= e!477745 tp_is_empty!16405)))

(declare-fun b!856878 () Bool)

(declare-fun res!581692 () Bool)

(assert (=> b!856878 (=> (not res!581692) (not e!477747))))

(declare-datatypes ((List!16640 0))(
  ( (Nil!16637) (Cons!16636 (h!17773 (_ BitVec 64)) (t!23273 List!16640)) )
))
(declare-fun arrayNoDuplicates!0 (array!49051 (_ BitVec 32) List!16640) Bool)

(assert (=> b!856878 (= res!581692 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16637))))

(declare-fun b!856879 () Bool)

(assert (=> b!856879 (= e!477743 (not true))))

(declare-fun +!2214 (ListLongMap!9565 tuple2!10794) ListLongMap!9565)

(assert (=> b!856879 (= (getCurrentListMapNoExtraKeys!2854 _keys!868 lt!386159 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2214 (getCurrentListMapNoExtraKeys!2854 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10795 k0!854 v!557)))))

(declare-datatypes ((Unit!29184 0))(
  ( (Unit!29185) )
))
(declare-fun lt!386162 () Unit!29184)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!412 (array!49051 array!49053 (_ BitVec 32) (_ BitVec 32) V!26921 V!26921 (_ BitVec 32) (_ BitVec 64) V!26921 (_ BitVec 32) Int) Unit!29184)

(assert (=> b!856879 (= lt!386162 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!412 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!26207 () Bool)

(assert (=> mapIsEmpty!26207 mapRes!26207))

(declare-fun b!856880 () Bool)

(declare-fun res!581691 () Bool)

(assert (=> b!856880 (=> (not res!581691) (not e!477747))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!856880 (= res!581691 (validKeyInArray!0 k0!854))))

(assert (= (and start!73522 res!581684) b!856872))

(assert (= (and b!856872 res!581686) b!856869))

(assert (= (and b!856869 res!581689) b!856875))

(assert (= (and b!856875 res!581685) b!856878))

(assert (= (and b!856878 res!581692) b!856874))

(assert (= (and b!856874 res!581687) b!856880))

(assert (= (and b!856880 res!581691) b!856876))

(assert (= (and b!856876 res!581688) b!856870))

(assert (= (and b!856870 res!581690) b!856879))

(assert (= (and b!856871 condMapEmpty!26207) mapIsEmpty!26207))

(assert (= (and b!856871 (not condMapEmpty!26207)) mapNonEmpty!26207))

(get-info :version)

(assert (= (and mapNonEmpty!26207 ((_ is ValueCellFull!7763) mapValue!26207)) b!856877))

(assert (= (and b!856871 ((_ is ValueCellFull!7763) mapDefault!26207)) b!856873))

(assert (= start!73522 b!856871))

(declare-fun m!798281 () Bool)

(assert (=> b!856880 m!798281))

(declare-fun m!798283 () Bool)

(assert (=> b!856872 m!798283))

(declare-fun m!798285 () Bool)

(assert (=> b!856879 m!798285))

(declare-fun m!798287 () Bool)

(assert (=> b!856879 m!798287))

(assert (=> b!856879 m!798287))

(declare-fun m!798289 () Bool)

(assert (=> b!856879 m!798289))

(declare-fun m!798291 () Bool)

(assert (=> b!856879 m!798291))

(declare-fun m!798293 () Bool)

(assert (=> b!856876 m!798293))

(declare-fun m!798295 () Bool)

(assert (=> b!856870 m!798295))

(declare-fun m!798297 () Bool)

(assert (=> b!856870 m!798297))

(declare-fun m!798299 () Bool)

(assert (=> b!856870 m!798299))

(declare-fun m!798301 () Bool)

(assert (=> mapNonEmpty!26207 m!798301))

(declare-fun m!798303 () Bool)

(assert (=> start!73522 m!798303))

(declare-fun m!798305 () Bool)

(assert (=> start!73522 m!798305))

(declare-fun m!798307 () Bool)

(assert (=> b!856875 m!798307))

(declare-fun m!798309 () Bool)

(assert (=> b!856878 m!798309))

(check-sat (not b!856870) (not b_next!14269) (not b!856880) (not b!856875) (not b!856878) (not b!856879) (not b!856872) (not mapNonEmpty!26207) b_and!23635 (not start!73522) tp_is_empty!16405)
(check-sat b_and!23635 (not b_next!14269))
