; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73458 () Bool)

(assert start!73458)

(declare-fun b_free!14373 () Bool)

(declare-fun b_next!14373 () Bool)

(assert (=> start!73458 (= b_free!14373 (not b_next!14373))))

(declare-fun tp!50623 () Bool)

(declare-fun b_and!23729 () Bool)

(assert (=> start!73458 (= tp!50623 b_and!23729)))

(declare-fun res!582758 () Bool)

(declare-fun e!478104 () Bool)

(assert (=> start!73458 (=> (not res!582758) (not e!478104))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!49208 0))(
  ( (array!49209 (arr!23635 (Array (_ BitVec 32) (_ BitVec 64))) (size!24075 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49208)

(assert (=> start!73458 (= res!582758 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24075 _keys!868))))))

(assert (=> start!73458 e!478104))

(declare-fun tp_is_empty!16509 () Bool)

(assert (=> start!73458 tp_is_empty!16509))

(assert (=> start!73458 true))

(assert (=> start!73458 tp!50623))

(declare-fun array_inv!18720 (array!49208) Bool)

(assert (=> start!73458 (array_inv!18720 _keys!868)))

(declare-datatypes ((V!27059 0))(
  ( (V!27060 (val!8302 Int)) )
))
(declare-datatypes ((ValueCell!7815 0))(
  ( (ValueCellFull!7815 (v!10727 V!27059)) (EmptyCell!7815) )
))
(declare-datatypes ((array!49210 0))(
  ( (array!49211 (arr!23636 (Array (_ BitVec 32) ValueCell!7815)) (size!24076 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49210)

(declare-fun e!478103 () Bool)

(declare-fun array_inv!18721 (array!49210) Bool)

(assert (=> start!73458 (and (array_inv!18721 _values!688) e!478103)))

(declare-fun b!857843 () Bool)

(declare-fun e!478108 () Bool)

(declare-fun e!478102 () Bool)

(assert (=> b!857843 (= e!478108 (not e!478102))))

(declare-fun res!582753 () Bool)

(assert (=> b!857843 (=> res!582753 e!478102)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!857843 (= res!582753 (not (validKeyInArray!0 (select (arr!23635 _keys!868) from!1053))))))

(declare-fun v!557 () V!27059)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun minValue!654 () V!27059)

(declare-fun zeroValue!654 () V!27059)

(declare-fun lt!386424 () array!49210)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!10956 0))(
  ( (tuple2!10957 (_1!5489 (_ BitVec 64)) (_2!5489 V!27059)) )
))
(declare-datatypes ((List!16763 0))(
  ( (Nil!16760) (Cons!16759 (h!17890 tuple2!10956) (t!23404 List!16763)) )
))
(declare-datatypes ((ListLongMap!9725 0))(
  ( (ListLongMap!9726 (toList!4878 List!16763)) )
))
(declare-fun getCurrentListMapNoExtraKeys!2859 (array!49208 array!49210 (_ BitVec 32) (_ BitVec 32) V!27059 V!27059 (_ BitVec 32) Int) ListLongMap!9725)

(declare-fun +!2231 (ListLongMap!9725 tuple2!10956) ListLongMap!9725)

(assert (=> b!857843 (= (getCurrentListMapNoExtraKeys!2859 _keys!868 lt!386424 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2231 (getCurrentListMapNoExtraKeys!2859 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10957 k0!854 v!557)))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!29249 0))(
  ( (Unit!29250) )
))
(declare-fun lt!386425 () Unit!29249)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!452 (array!49208 array!49210 (_ BitVec 32) (_ BitVec 32) V!27059 V!27059 (_ BitVec 32) (_ BitVec 64) V!27059 (_ BitVec 32) Int) Unit!29249)

(assert (=> b!857843 (= lt!386425 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!452 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!857844 () Bool)

(declare-fun e!478107 () Bool)

(declare-fun mapRes!26363 () Bool)

(assert (=> b!857844 (= e!478103 (and e!478107 mapRes!26363))))

(declare-fun condMapEmpty!26363 () Bool)

(declare-fun mapDefault!26363 () ValueCell!7815)

(assert (=> b!857844 (= condMapEmpty!26363 (= (arr!23636 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7815)) mapDefault!26363)))))

(declare-fun b!857845 () Bool)

(declare-fun res!582750 () Bool)

(assert (=> b!857845 (=> (not res!582750) (not e!478104))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!857845 (= res!582750 (validMask!0 mask!1196))))

(declare-fun b!857846 () Bool)

(declare-fun res!582755 () Bool)

(assert (=> b!857846 (=> (not res!582755) (not e!478104))))

(declare-datatypes ((List!16764 0))(
  ( (Nil!16761) (Cons!16760 (h!17891 (_ BitVec 64)) (t!23405 List!16764)) )
))
(declare-fun arrayNoDuplicates!0 (array!49208 (_ BitVec 32) List!16764) Bool)

(assert (=> b!857846 (= res!582755 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16761))))

(declare-fun b!857847 () Bool)

(declare-fun res!582756 () Bool)

(assert (=> b!857847 (=> (not res!582756) (not e!478104))))

(assert (=> b!857847 (= res!582756 (validKeyInArray!0 k0!854))))

(declare-fun b!857848 () Bool)

(assert (=> b!857848 (= e!478107 tp_is_empty!16509)))

(declare-fun b!857849 () Bool)

(declare-fun e!478106 () Bool)

(assert (=> b!857849 (= e!478106 tp_is_empty!16509)))

(declare-fun b!857850 () Bool)

(declare-fun res!582757 () Bool)

(assert (=> b!857850 (=> (not res!582757) (not e!478104))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49208 (_ BitVec 32)) Bool)

(assert (=> b!857850 (= res!582757 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!857851 () Bool)

(assert (=> b!857851 (= e!478102 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!24075 _keys!868))))))

(declare-fun mapNonEmpty!26363 () Bool)

(declare-fun tp!50622 () Bool)

(assert (=> mapNonEmpty!26363 (= mapRes!26363 (and tp!50622 e!478106))))

(declare-fun mapRest!26363 () (Array (_ BitVec 32) ValueCell!7815))

(declare-fun mapKey!26363 () (_ BitVec 32))

(declare-fun mapValue!26363 () ValueCell!7815)

(assert (=> mapNonEmpty!26363 (= (arr!23636 _values!688) (store mapRest!26363 mapKey!26363 mapValue!26363))))

(declare-fun b!857852 () Bool)

(assert (=> b!857852 (= e!478104 e!478108)))

(declare-fun res!582752 () Bool)

(assert (=> b!857852 (=> (not res!582752) (not e!478108))))

(assert (=> b!857852 (= res!582752 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!386423 () ListLongMap!9725)

(assert (=> b!857852 (= lt!386423 (getCurrentListMapNoExtraKeys!2859 _keys!868 lt!386424 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!857852 (= lt!386424 (array!49211 (store (arr!23636 _values!688) i!612 (ValueCellFull!7815 v!557)) (size!24076 _values!688)))))

(declare-fun lt!386422 () ListLongMap!9725)

(assert (=> b!857852 (= lt!386422 (getCurrentListMapNoExtraKeys!2859 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!857853 () Bool)

(declare-fun res!582749 () Bool)

(assert (=> b!857853 (=> (not res!582749) (not e!478104))))

(assert (=> b!857853 (= res!582749 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24075 _keys!868))))))

(declare-fun b!857854 () Bool)

(declare-fun res!582751 () Bool)

(assert (=> b!857854 (=> (not res!582751) (not e!478104))))

(assert (=> b!857854 (= res!582751 (and (= (select (arr!23635 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!857855 () Bool)

(declare-fun res!582754 () Bool)

(assert (=> b!857855 (=> (not res!582754) (not e!478104))))

(assert (=> b!857855 (= res!582754 (and (= (size!24076 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24075 _keys!868) (size!24076 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!26363 () Bool)

(assert (=> mapIsEmpty!26363 mapRes!26363))

(assert (= (and start!73458 res!582758) b!857845))

(assert (= (and b!857845 res!582750) b!857855))

(assert (= (and b!857855 res!582754) b!857850))

(assert (= (and b!857850 res!582757) b!857846))

(assert (= (and b!857846 res!582755) b!857853))

(assert (= (and b!857853 res!582749) b!857847))

(assert (= (and b!857847 res!582756) b!857854))

(assert (= (and b!857854 res!582751) b!857852))

(assert (= (and b!857852 res!582752) b!857843))

(assert (= (and b!857843 (not res!582753)) b!857851))

(assert (= (and b!857844 condMapEmpty!26363) mapIsEmpty!26363))

(assert (= (and b!857844 (not condMapEmpty!26363)) mapNonEmpty!26363))

(get-info :version)

(assert (= (and mapNonEmpty!26363 ((_ is ValueCellFull!7815) mapValue!26363)) b!857849))

(assert (= (and b!857844 ((_ is ValueCellFull!7815) mapDefault!26363)) b!857848))

(assert (= start!73458 b!857844))

(declare-fun m!798555 () Bool)

(assert (=> b!857854 m!798555))

(declare-fun m!798557 () Bool)

(assert (=> start!73458 m!798557))

(declare-fun m!798559 () Bool)

(assert (=> start!73458 m!798559))

(declare-fun m!798561 () Bool)

(assert (=> b!857846 m!798561))

(declare-fun m!798563 () Bool)

(assert (=> b!857843 m!798563))

(declare-fun m!798565 () Bool)

(assert (=> b!857843 m!798565))

(assert (=> b!857843 m!798563))

(declare-fun m!798567 () Bool)

(assert (=> b!857843 m!798567))

(declare-fun m!798569 () Bool)

(assert (=> b!857843 m!798569))

(assert (=> b!857843 m!798567))

(declare-fun m!798571 () Bool)

(assert (=> b!857843 m!798571))

(declare-fun m!798573 () Bool)

(assert (=> b!857843 m!798573))

(declare-fun m!798575 () Bool)

(assert (=> b!857845 m!798575))

(declare-fun m!798577 () Bool)

(assert (=> b!857850 m!798577))

(declare-fun m!798579 () Bool)

(assert (=> b!857847 m!798579))

(declare-fun m!798581 () Bool)

(assert (=> mapNonEmpty!26363 m!798581))

(declare-fun m!798583 () Bool)

(assert (=> b!857852 m!798583))

(declare-fun m!798585 () Bool)

(assert (=> b!857852 m!798585))

(declare-fun m!798587 () Bool)

(assert (=> b!857852 m!798587))

(check-sat (not b!857850) b_and!23729 (not b!857843) (not b!857847) (not b!857845) (not b_next!14373) (not start!73458) (not mapNonEmpty!26363) (not b!857846) (not b!857852) tp_is_empty!16509)
(check-sat b_and!23729 (not b_next!14373))
