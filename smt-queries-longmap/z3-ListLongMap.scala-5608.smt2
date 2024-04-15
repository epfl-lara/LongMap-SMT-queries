; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73414 () Bool)

(assert start!73414)

(declare-fun b_free!14347 () Bool)

(declare-fun b_next!14347 () Bool)

(assert (=> start!73414 (= b_free!14347 (not b_next!14347))))

(declare-fun tp!50546 () Bool)

(declare-fun b_and!23677 () Bool)

(assert (=> start!73414 (= tp!50546 b_and!23677)))

(declare-fun b!857131 () Bool)

(declare-fun e!477719 () Bool)

(declare-fun tp_is_empty!16483 () Bool)

(assert (=> b!857131 (= e!477719 tp_is_empty!16483)))

(declare-fun mapIsEmpty!26324 () Bool)

(declare-fun mapRes!26324 () Bool)

(assert (=> mapIsEmpty!26324 mapRes!26324))

(declare-fun b!857132 () Bool)

(declare-fun res!582288 () Bool)

(declare-fun e!477715 () Bool)

(assert (=> b!857132 (=> (not res!582288) (not e!477715))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!857132 (= res!582288 (validKeyInArray!0 k0!854))))

(declare-fun res!582283 () Bool)

(assert (=> start!73414 (=> (not res!582283) (not e!477715))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!49135 0))(
  ( (array!49136 (arr!23599 (Array (_ BitVec 32) (_ BitVec 64))) (size!24041 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49135)

(assert (=> start!73414 (= res!582283 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24041 _keys!868))))))

(assert (=> start!73414 e!477715))

(assert (=> start!73414 tp_is_empty!16483))

(assert (=> start!73414 true))

(assert (=> start!73414 tp!50546))

(declare-fun array_inv!18754 (array!49135) Bool)

(assert (=> start!73414 (array_inv!18754 _keys!868)))

(declare-datatypes ((V!27025 0))(
  ( (V!27026 (val!8289 Int)) )
))
(declare-datatypes ((ValueCell!7802 0))(
  ( (ValueCellFull!7802 (v!10708 V!27025)) (EmptyCell!7802) )
))
(declare-datatypes ((array!49137 0))(
  ( (array!49138 (arr!23600 (Array (_ BitVec 32) ValueCell!7802)) (size!24042 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49137)

(declare-fun e!477716 () Bool)

(declare-fun array_inv!18755 (array!49137) Bool)

(assert (=> start!73414 (and (array_inv!18755 _values!688) e!477716)))

(declare-fun b!857133 () Bool)

(declare-fun e!477718 () Bool)

(assert (=> b!857133 (= e!477716 (and e!477718 mapRes!26324))))

(declare-fun condMapEmpty!26324 () Bool)

(declare-fun mapDefault!26324 () ValueCell!7802)

(assert (=> b!857133 (= condMapEmpty!26324 (= (arr!23600 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7802)) mapDefault!26324)))))

(declare-fun mapNonEmpty!26324 () Bool)

(declare-fun tp!50545 () Bool)

(assert (=> mapNonEmpty!26324 (= mapRes!26324 (and tp!50545 e!477719))))

(declare-fun mapKey!26324 () (_ BitVec 32))

(declare-fun mapRest!26324 () (Array (_ BitVec 32) ValueCell!7802))

(declare-fun mapValue!26324 () ValueCell!7802)

(assert (=> mapNonEmpty!26324 (= (arr!23600 _values!688) (store mapRest!26324 mapKey!26324 mapValue!26324))))

(declare-fun b!857134 () Bool)

(declare-fun e!477720 () Bool)

(assert (=> b!857134 (= e!477720 (not true))))

(declare-fun v!557 () V!27025)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!27025)

(declare-fun zeroValue!654 () V!27025)

(declare-fun lt!386033 () array!49137)

(declare-datatypes ((tuple2!10938 0))(
  ( (tuple2!10939 (_1!5480 (_ BitVec 64)) (_2!5480 V!27025)) )
))
(declare-datatypes ((List!16745 0))(
  ( (Nil!16742) (Cons!16741 (h!17872 tuple2!10938) (t!23377 List!16745)) )
))
(declare-datatypes ((ListLongMap!9697 0))(
  ( (ListLongMap!9698 (toList!4864 List!16745)) )
))
(declare-fun getCurrentListMapNoExtraKeys!2871 (array!49135 array!49137 (_ BitVec 32) (_ BitVec 32) V!27025 V!27025 (_ BitVec 32) Int) ListLongMap!9697)

(declare-fun +!2240 (ListLongMap!9697 tuple2!10938) ListLongMap!9697)

(assert (=> b!857134 (= (getCurrentListMapNoExtraKeys!2871 _keys!868 lt!386033 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2240 (getCurrentListMapNoExtraKeys!2871 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10939 k0!854 v!557)))))

(declare-datatypes ((Unit!29149 0))(
  ( (Unit!29150) )
))
(declare-fun lt!386032 () Unit!29149)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!437 (array!49135 array!49137 (_ BitVec 32) (_ BitVec 32) V!27025 V!27025 (_ BitVec 32) (_ BitVec 64) V!27025 (_ BitVec 32) Int) Unit!29149)

(assert (=> b!857134 (= lt!386032 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!437 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!857135 () Bool)

(declare-fun res!582289 () Bool)

(assert (=> b!857135 (=> (not res!582289) (not e!477715))))

(assert (=> b!857135 (= res!582289 (and (= (size!24042 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24041 _keys!868) (size!24042 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!857136 () Bool)

(declare-fun res!582284 () Bool)

(assert (=> b!857136 (=> (not res!582284) (not e!477715))))

(assert (=> b!857136 (= res!582284 (and (= (select (arr!23599 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!857137 () Bool)

(declare-fun res!582285 () Bool)

(assert (=> b!857137 (=> (not res!582285) (not e!477715))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49135 (_ BitVec 32)) Bool)

(assert (=> b!857137 (= res!582285 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!857138 () Bool)

(declare-fun res!582286 () Bool)

(assert (=> b!857138 (=> (not res!582286) (not e!477715))))

(declare-datatypes ((List!16746 0))(
  ( (Nil!16743) (Cons!16742 (h!17873 (_ BitVec 64)) (t!23378 List!16746)) )
))
(declare-fun arrayNoDuplicates!0 (array!49135 (_ BitVec 32) List!16746) Bool)

(assert (=> b!857138 (= res!582286 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16743))))

(declare-fun b!857139 () Bool)

(assert (=> b!857139 (= e!477715 e!477720)))

(declare-fun res!582290 () Bool)

(assert (=> b!857139 (=> (not res!582290) (not e!477720))))

(assert (=> b!857139 (= res!582290 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!386030 () ListLongMap!9697)

(assert (=> b!857139 (= lt!386030 (getCurrentListMapNoExtraKeys!2871 _keys!868 lt!386033 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!857139 (= lt!386033 (array!49138 (store (arr!23600 _values!688) i!612 (ValueCellFull!7802 v!557)) (size!24042 _values!688)))))

(declare-fun lt!386031 () ListLongMap!9697)

(assert (=> b!857139 (= lt!386031 (getCurrentListMapNoExtraKeys!2871 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!857140 () Bool)

(declare-fun res!582287 () Bool)

(assert (=> b!857140 (=> (not res!582287) (not e!477715))))

(assert (=> b!857140 (= res!582287 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24041 _keys!868))))))

(declare-fun b!857141 () Bool)

(declare-fun res!582291 () Bool)

(assert (=> b!857141 (=> (not res!582291) (not e!477715))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!857141 (= res!582291 (validMask!0 mask!1196))))

(declare-fun b!857142 () Bool)

(assert (=> b!857142 (= e!477718 tp_is_empty!16483)))

(assert (= (and start!73414 res!582283) b!857141))

(assert (= (and b!857141 res!582291) b!857135))

(assert (= (and b!857135 res!582289) b!857137))

(assert (= (and b!857137 res!582285) b!857138))

(assert (= (and b!857138 res!582286) b!857140))

(assert (= (and b!857140 res!582287) b!857132))

(assert (= (and b!857132 res!582288) b!857136))

(assert (= (and b!857136 res!582284) b!857139))

(assert (= (and b!857139 res!582290) b!857134))

(assert (= (and b!857133 condMapEmpty!26324) mapIsEmpty!26324))

(assert (= (and b!857133 (not condMapEmpty!26324)) mapNonEmpty!26324))

(get-info :version)

(assert (= (and mapNonEmpty!26324 ((_ is ValueCellFull!7802) mapValue!26324)) b!857131))

(assert (= (and b!857133 ((_ is ValueCellFull!7802) mapDefault!26324)) b!857142))

(assert (= start!73414 b!857133))

(declare-fun m!797403 () Bool)

(assert (=> b!857132 m!797403))

(declare-fun m!797405 () Bool)

(assert (=> b!857134 m!797405))

(declare-fun m!797407 () Bool)

(assert (=> b!857134 m!797407))

(assert (=> b!857134 m!797407))

(declare-fun m!797409 () Bool)

(assert (=> b!857134 m!797409))

(declare-fun m!797411 () Bool)

(assert (=> b!857134 m!797411))

(declare-fun m!797413 () Bool)

(assert (=> start!73414 m!797413))

(declare-fun m!797415 () Bool)

(assert (=> start!73414 m!797415))

(declare-fun m!797417 () Bool)

(assert (=> b!857139 m!797417))

(declare-fun m!797419 () Bool)

(assert (=> b!857139 m!797419))

(declare-fun m!797421 () Bool)

(assert (=> b!857139 m!797421))

(declare-fun m!797423 () Bool)

(assert (=> b!857138 m!797423))

(declare-fun m!797425 () Bool)

(assert (=> mapNonEmpty!26324 m!797425))

(declare-fun m!797427 () Bool)

(assert (=> b!857137 m!797427))

(declare-fun m!797429 () Bool)

(assert (=> b!857141 m!797429))

(declare-fun m!797431 () Bool)

(assert (=> b!857136 m!797431))

(check-sat (not mapNonEmpty!26324) (not b!857132) (not start!73414) tp_is_empty!16483 (not b!857139) (not b!857141) (not b!857138) b_and!23677 (not b!857137) (not b!857134) (not b_next!14347))
(check-sat b_and!23677 (not b_next!14347))
