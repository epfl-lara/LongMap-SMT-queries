; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73422 () Bool)

(assert start!73422)

(declare-fun b_free!14337 () Bool)

(declare-fun b_next!14337 () Bool)

(assert (=> start!73422 (= b_free!14337 (not b_next!14337))))

(declare-fun tp!50515 () Bool)

(declare-fun b_and!23693 () Bool)

(assert (=> start!73422 (= tp!50515 b_and!23693)))

(declare-fun b!857190 () Bool)

(declare-fun res!582261 () Bool)

(declare-fun e!477776 () Bool)

(assert (=> b!857190 (=> (not res!582261) (not e!477776))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!857190 (= res!582261 (validMask!0 mask!1196))))

(declare-fun b!857191 () Bool)

(declare-fun res!582265 () Bool)

(assert (=> b!857191 (=> (not res!582265) (not e!477776))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((array!49138 0))(
  ( (array!49139 (arr!23600 (Array (_ BitVec 32) (_ BitVec 64))) (size!24040 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49138)

(declare-datatypes ((V!27011 0))(
  ( (V!27012 (val!8284 Int)) )
))
(declare-datatypes ((ValueCell!7797 0))(
  ( (ValueCellFull!7797 (v!10709 V!27011)) (EmptyCell!7797) )
))
(declare-datatypes ((array!49140 0))(
  ( (array!49141 (arr!23601 (Array (_ BitVec 32) ValueCell!7797)) (size!24041 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49140)

(assert (=> b!857191 (= res!582265 (and (= (size!24041 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24040 _keys!868) (size!24041 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!857192 () Bool)

(declare-fun e!477773 () Bool)

(declare-fun tp_is_empty!16473 () Bool)

(assert (=> b!857192 (= e!477773 tp_is_empty!16473)))

(declare-fun b!857193 () Bool)

(declare-fun e!477774 () Bool)

(assert (=> b!857193 (= e!477776 e!477774)))

(declare-fun res!582258 () Bool)

(assert (=> b!857193 (=> (not res!582258) (not e!477774))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!857193 (= res!582258 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!386209 () array!49140)

(declare-fun minValue!654 () V!27011)

(declare-fun zeroValue!654 () V!27011)

(declare-datatypes ((tuple2!10930 0))(
  ( (tuple2!10931 (_1!5476 (_ BitVec 64)) (_2!5476 V!27011)) )
))
(declare-datatypes ((List!16737 0))(
  ( (Nil!16734) (Cons!16733 (h!17864 tuple2!10930) (t!23378 List!16737)) )
))
(declare-datatypes ((ListLongMap!9699 0))(
  ( (ListLongMap!9700 (toList!4865 List!16737)) )
))
(declare-fun lt!386207 () ListLongMap!9699)

(declare-fun getCurrentListMapNoExtraKeys!2846 (array!49138 array!49140 (_ BitVec 32) (_ BitVec 32) V!27011 V!27011 (_ BitVec 32) Int) ListLongMap!9699)

(assert (=> b!857193 (= lt!386207 (getCurrentListMapNoExtraKeys!2846 _keys!868 lt!386209 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27011)

(assert (=> b!857193 (= lt!386209 (array!49141 (store (arr!23601 _values!688) i!612 (ValueCellFull!7797 v!557)) (size!24041 _values!688)))))

(declare-fun lt!386208 () ListLongMap!9699)

(assert (=> b!857193 (= lt!386208 (getCurrentListMapNoExtraKeys!2846 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!857194 () Bool)

(declare-fun e!477775 () Bool)

(assert (=> b!857194 (= e!477775 tp_is_empty!16473)))

(declare-fun b!857195 () Bool)

(declare-fun res!582260 () Bool)

(assert (=> b!857195 (=> (not res!582260) (not e!477776))))

(declare-datatypes ((List!16738 0))(
  ( (Nil!16735) (Cons!16734 (h!17865 (_ BitVec 64)) (t!23379 List!16738)) )
))
(declare-fun arrayNoDuplicates!0 (array!49138 (_ BitVec 32) List!16738) Bool)

(assert (=> b!857195 (= res!582260 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16735))))

(declare-fun b!857196 () Bool)

(declare-fun e!477778 () Bool)

(declare-fun mapRes!26309 () Bool)

(assert (=> b!857196 (= e!477778 (and e!477773 mapRes!26309))))

(declare-fun condMapEmpty!26309 () Bool)

(declare-fun mapDefault!26309 () ValueCell!7797)

(assert (=> b!857196 (= condMapEmpty!26309 (= (arr!23601 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7797)) mapDefault!26309)))))

(declare-fun mapIsEmpty!26309 () Bool)

(assert (=> mapIsEmpty!26309 mapRes!26309))

(declare-fun mapNonEmpty!26309 () Bool)

(declare-fun tp!50514 () Bool)

(assert (=> mapNonEmpty!26309 (= mapRes!26309 (and tp!50514 e!477775))))

(declare-fun mapValue!26309 () ValueCell!7797)

(declare-fun mapRest!26309 () (Array (_ BitVec 32) ValueCell!7797))

(declare-fun mapKey!26309 () (_ BitVec 32))

(assert (=> mapNonEmpty!26309 (= (arr!23601 _values!688) (store mapRest!26309 mapKey!26309 mapValue!26309))))

(declare-fun b!857198 () Bool)

(assert (=> b!857198 (= e!477774 (not true))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun +!2219 (ListLongMap!9699 tuple2!10930) ListLongMap!9699)

(assert (=> b!857198 (= (getCurrentListMapNoExtraKeys!2846 _keys!868 lt!386209 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2219 (getCurrentListMapNoExtraKeys!2846 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10931 k0!854 v!557)))))

(declare-datatypes ((Unit!29225 0))(
  ( (Unit!29226) )
))
(declare-fun lt!386206 () Unit!29225)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!440 (array!49138 array!49140 (_ BitVec 32) (_ BitVec 32) V!27011 V!27011 (_ BitVec 32) (_ BitVec 64) V!27011 (_ BitVec 32) Int) Unit!29225)

(assert (=> b!857198 (= lt!386206 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!440 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!857199 () Bool)

(declare-fun res!582262 () Bool)

(assert (=> b!857199 (=> (not res!582262) (not e!477776))))

(assert (=> b!857199 (= res!582262 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24040 _keys!868))))))

(declare-fun b!857200 () Bool)

(declare-fun res!582259 () Bool)

(assert (=> b!857200 (=> (not res!582259) (not e!477776))))

(assert (=> b!857200 (= res!582259 (and (= (select (arr!23600 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!857201 () Bool)

(declare-fun res!582266 () Bool)

(assert (=> b!857201 (=> (not res!582266) (not e!477776))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49138 (_ BitVec 32)) Bool)

(assert (=> b!857201 (= res!582266 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!857197 () Bool)

(declare-fun res!582263 () Bool)

(assert (=> b!857197 (=> (not res!582263) (not e!477776))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!857197 (= res!582263 (validKeyInArray!0 k0!854))))

(declare-fun res!582264 () Bool)

(assert (=> start!73422 (=> (not res!582264) (not e!477776))))

(assert (=> start!73422 (= res!582264 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24040 _keys!868))))))

(assert (=> start!73422 e!477776))

(assert (=> start!73422 tp_is_empty!16473))

(assert (=> start!73422 true))

(assert (=> start!73422 tp!50515))

(declare-fun array_inv!18690 (array!49138) Bool)

(assert (=> start!73422 (array_inv!18690 _keys!868)))

(declare-fun array_inv!18691 (array!49140) Bool)

(assert (=> start!73422 (and (array_inv!18691 _values!688) e!477778)))

(assert (= (and start!73422 res!582264) b!857190))

(assert (= (and b!857190 res!582261) b!857191))

(assert (= (and b!857191 res!582265) b!857201))

(assert (= (and b!857201 res!582266) b!857195))

(assert (= (and b!857195 res!582260) b!857199))

(assert (= (and b!857199 res!582262) b!857197))

(assert (= (and b!857197 res!582263) b!857200))

(assert (= (and b!857200 res!582259) b!857193))

(assert (= (and b!857193 res!582258) b!857198))

(assert (= (and b!857196 condMapEmpty!26309) mapIsEmpty!26309))

(assert (= (and b!857196 (not condMapEmpty!26309)) mapNonEmpty!26309))

(get-info :version)

(assert (= (and mapNonEmpty!26309 ((_ is ValueCellFull!7797) mapValue!26309)) b!857194))

(assert (= (and b!857196 ((_ is ValueCellFull!7797) mapDefault!26309)) b!857192))

(assert (= start!73422 b!857196))

(declare-fun m!798011 () Bool)

(assert (=> b!857197 m!798011))

(declare-fun m!798013 () Bool)

(assert (=> b!857193 m!798013))

(declare-fun m!798015 () Bool)

(assert (=> b!857193 m!798015))

(declare-fun m!798017 () Bool)

(assert (=> b!857193 m!798017))

(declare-fun m!798019 () Bool)

(assert (=> b!857201 m!798019))

(declare-fun m!798021 () Bool)

(assert (=> mapNonEmpty!26309 m!798021))

(declare-fun m!798023 () Bool)

(assert (=> b!857200 m!798023))

(declare-fun m!798025 () Bool)

(assert (=> b!857195 m!798025))

(declare-fun m!798027 () Bool)

(assert (=> b!857198 m!798027))

(declare-fun m!798029 () Bool)

(assert (=> b!857198 m!798029))

(assert (=> b!857198 m!798029))

(declare-fun m!798031 () Bool)

(assert (=> b!857198 m!798031))

(declare-fun m!798033 () Bool)

(assert (=> b!857198 m!798033))

(declare-fun m!798035 () Bool)

(assert (=> b!857190 m!798035))

(declare-fun m!798037 () Bool)

(assert (=> start!73422 m!798037))

(declare-fun m!798039 () Bool)

(assert (=> start!73422 m!798039))

(check-sat (not b!857197) (not mapNonEmpty!26309) (not b!857201) b_and!23693 (not b!857198) (not b!857193) (not start!73422) (not b!857190) (not b!857195) tp_is_empty!16473 (not b_next!14337))
(check-sat b_and!23693 (not b_next!14337))
