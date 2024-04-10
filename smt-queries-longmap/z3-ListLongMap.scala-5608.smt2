; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73434 () Bool)

(assert start!73434)

(declare-fun b_free!14349 () Bool)

(declare-fun b_next!14349 () Bool)

(assert (=> start!73434 (= b_free!14349 (not b_next!14349))))

(declare-fun tp!50550 () Bool)

(declare-fun b_and!23705 () Bool)

(assert (=> start!73434 (= tp!50550 b_and!23705)))

(declare-fun mapIsEmpty!26327 () Bool)

(declare-fun mapRes!26327 () Bool)

(assert (=> mapIsEmpty!26327 mapRes!26327))

(declare-fun b!857406 () Bool)

(declare-fun e!477885 () Bool)

(declare-fun e!477883 () Bool)

(assert (=> b!857406 (= e!477885 e!477883)))

(declare-fun res!582426 () Bool)

(assert (=> b!857406 (=> (not res!582426) (not e!477883))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!857406 (= res!582426 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!49160 0))(
  ( (array!49161 (arr!23611 (Array (_ BitVec 32) (_ BitVec 64))) (size!24051 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49160)

(declare-datatypes ((V!27027 0))(
  ( (V!27028 (val!8290 Int)) )
))
(declare-fun minValue!654 () V!27027)

(declare-fun zeroValue!654 () V!27027)

(declare-datatypes ((tuple2!10938 0))(
  ( (tuple2!10939 (_1!5480 (_ BitVec 64)) (_2!5480 V!27027)) )
))
(declare-datatypes ((List!16745 0))(
  ( (Nil!16742) (Cons!16741 (h!17872 tuple2!10938) (t!23386 List!16745)) )
))
(declare-datatypes ((ListLongMap!9707 0))(
  ( (ListLongMap!9708 (toList!4869 List!16745)) )
))
(declare-fun lt!386281 () ListLongMap!9707)

(declare-datatypes ((ValueCell!7803 0))(
  ( (ValueCellFull!7803 (v!10715 V!27027)) (EmptyCell!7803) )
))
(declare-datatypes ((array!49162 0))(
  ( (array!49163 (arr!23612 (Array (_ BitVec 32) ValueCell!7803)) (size!24052 (_ BitVec 32))) )
))
(declare-fun lt!386279 () array!49162)

(declare-fun getCurrentListMapNoExtraKeys!2850 (array!49160 array!49162 (_ BitVec 32) (_ BitVec 32) V!27027 V!27027 (_ BitVec 32) Int) ListLongMap!9707)

(assert (=> b!857406 (= lt!386281 (getCurrentListMapNoExtraKeys!2850 _keys!868 lt!386279 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27027)

(declare-fun _values!688 () array!49162)

(assert (=> b!857406 (= lt!386279 (array!49163 (store (arr!23612 _values!688) i!612 (ValueCellFull!7803 v!557)) (size!24052 _values!688)))))

(declare-fun lt!386280 () ListLongMap!9707)

(assert (=> b!857406 (= lt!386280 (getCurrentListMapNoExtraKeys!2850 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!857407 () Bool)

(declare-fun e!477881 () Bool)

(declare-fun e!477884 () Bool)

(assert (=> b!857407 (= e!477881 (and e!477884 mapRes!26327))))

(declare-fun condMapEmpty!26327 () Bool)

(declare-fun mapDefault!26327 () ValueCell!7803)

(assert (=> b!857407 (= condMapEmpty!26327 (= (arr!23612 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7803)) mapDefault!26327)))))

(declare-fun b!857408 () Bool)

(declare-fun res!582421 () Bool)

(assert (=> b!857408 (=> (not res!582421) (not e!477885))))

(declare-datatypes ((List!16746 0))(
  ( (Nil!16743) (Cons!16742 (h!17873 (_ BitVec 64)) (t!23387 List!16746)) )
))
(declare-fun arrayNoDuplicates!0 (array!49160 (_ BitVec 32) List!16746) Bool)

(assert (=> b!857408 (= res!582421 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16743))))

(declare-fun b!857409 () Bool)

(declare-fun res!582422 () Bool)

(assert (=> b!857409 (=> (not res!582422) (not e!477885))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49160 (_ BitVec 32)) Bool)

(assert (=> b!857409 (= res!582422 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!26327 () Bool)

(declare-fun tp!50551 () Bool)

(declare-fun e!477886 () Bool)

(assert (=> mapNonEmpty!26327 (= mapRes!26327 (and tp!50551 e!477886))))

(declare-fun mapValue!26327 () ValueCell!7803)

(declare-fun mapKey!26327 () (_ BitVec 32))

(declare-fun mapRest!26327 () (Array (_ BitVec 32) ValueCell!7803))

(assert (=> mapNonEmpty!26327 (= (arr!23612 _values!688) (store mapRest!26327 mapKey!26327 mapValue!26327))))

(declare-fun b!857410 () Bool)

(declare-fun tp_is_empty!16485 () Bool)

(assert (=> b!857410 (= e!477884 tp_is_empty!16485)))

(declare-fun res!582425 () Bool)

(assert (=> start!73434 (=> (not res!582425) (not e!477885))))

(assert (=> start!73434 (= res!582425 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24051 _keys!868))))))

(assert (=> start!73434 e!477885))

(assert (=> start!73434 tp_is_empty!16485))

(assert (=> start!73434 true))

(assert (=> start!73434 tp!50550))

(declare-fun array_inv!18698 (array!49160) Bool)

(assert (=> start!73434 (array_inv!18698 _keys!868)))

(declare-fun array_inv!18699 (array!49162) Bool)

(assert (=> start!73434 (and (array_inv!18699 _values!688) e!477881)))

(declare-fun b!857411 () Bool)

(assert (=> b!857411 (= e!477886 tp_is_empty!16485)))

(declare-fun b!857412 () Bool)

(declare-fun res!582423 () Bool)

(assert (=> b!857412 (=> (not res!582423) (not e!477885))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!857412 (= res!582423 (validMask!0 mask!1196))))

(declare-fun b!857413 () Bool)

(declare-fun res!582427 () Bool)

(assert (=> b!857413 (=> (not res!582427) (not e!477885))))

(assert (=> b!857413 (= res!582427 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24051 _keys!868))))))

(declare-fun b!857414 () Bool)

(assert (=> b!857414 (= e!477883 (not true))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun +!2223 (ListLongMap!9707 tuple2!10938) ListLongMap!9707)

(assert (=> b!857414 (= (getCurrentListMapNoExtraKeys!2850 _keys!868 lt!386279 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2223 (getCurrentListMapNoExtraKeys!2850 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10939 k0!854 v!557)))))

(declare-datatypes ((Unit!29233 0))(
  ( (Unit!29234) )
))
(declare-fun lt!386278 () Unit!29233)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!444 (array!49160 array!49162 (_ BitVec 32) (_ BitVec 32) V!27027 V!27027 (_ BitVec 32) (_ BitVec 64) V!27027 (_ BitVec 32) Int) Unit!29233)

(assert (=> b!857414 (= lt!386278 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!444 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!857415 () Bool)

(declare-fun res!582424 () Bool)

(assert (=> b!857415 (=> (not res!582424) (not e!477885))))

(assert (=> b!857415 (= res!582424 (and (= (size!24052 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24051 _keys!868) (size!24052 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!857416 () Bool)

(declare-fun res!582420 () Bool)

(assert (=> b!857416 (=> (not res!582420) (not e!477885))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!857416 (= res!582420 (validKeyInArray!0 k0!854))))

(declare-fun b!857417 () Bool)

(declare-fun res!582428 () Bool)

(assert (=> b!857417 (=> (not res!582428) (not e!477885))))

(assert (=> b!857417 (= res!582428 (and (= (select (arr!23611 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(assert (= (and start!73434 res!582425) b!857412))

(assert (= (and b!857412 res!582423) b!857415))

(assert (= (and b!857415 res!582424) b!857409))

(assert (= (and b!857409 res!582422) b!857408))

(assert (= (and b!857408 res!582421) b!857413))

(assert (= (and b!857413 res!582427) b!857416))

(assert (= (and b!857416 res!582420) b!857417))

(assert (= (and b!857417 res!582428) b!857406))

(assert (= (and b!857406 res!582426) b!857414))

(assert (= (and b!857407 condMapEmpty!26327) mapIsEmpty!26327))

(assert (= (and b!857407 (not condMapEmpty!26327)) mapNonEmpty!26327))

(get-info :version)

(assert (= (and mapNonEmpty!26327 ((_ is ValueCellFull!7803) mapValue!26327)) b!857411))

(assert (= (and b!857407 ((_ is ValueCellFull!7803) mapDefault!26327)) b!857410))

(assert (= start!73434 b!857407))

(declare-fun m!798191 () Bool)

(assert (=> b!857408 m!798191))

(declare-fun m!798193 () Bool)

(assert (=> b!857417 m!798193))

(declare-fun m!798195 () Bool)

(assert (=> start!73434 m!798195))

(declare-fun m!798197 () Bool)

(assert (=> start!73434 m!798197))

(declare-fun m!798199 () Bool)

(assert (=> b!857409 m!798199))

(declare-fun m!798201 () Bool)

(assert (=> b!857416 m!798201))

(declare-fun m!798203 () Bool)

(assert (=> b!857414 m!798203))

(declare-fun m!798205 () Bool)

(assert (=> b!857414 m!798205))

(assert (=> b!857414 m!798205))

(declare-fun m!798207 () Bool)

(assert (=> b!857414 m!798207))

(declare-fun m!798209 () Bool)

(assert (=> b!857414 m!798209))

(declare-fun m!798211 () Bool)

(assert (=> b!857406 m!798211))

(declare-fun m!798213 () Bool)

(assert (=> b!857406 m!798213))

(declare-fun m!798215 () Bool)

(assert (=> b!857406 m!798215))

(declare-fun m!798217 () Bool)

(assert (=> b!857412 m!798217))

(declare-fun m!798219 () Bool)

(assert (=> mapNonEmpty!26327 m!798219))

(check-sat (not mapNonEmpty!26327) (not b!857412) tp_is_empty!16485 b_and!23705 (not start!73434) (not b!857409) (not b!857414) (not b!857416) (not b!857406) (not b_next!14349) (not b!857408))
(check-sat b_and!23705 (not b_next!14349))
