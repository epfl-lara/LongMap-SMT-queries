; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78550 () Bool)

(assert start!78550)

(declare-fun b_free!16747 () Bool)

(declare-fun b_next!16747 () Bool)

(assert (=> start!78550 (= b_free!16747 (not b_next!16747))))

(declare-fun tp!58530 () Bool)

(declare-fun b_and!27371 () Bool)

(assert (=> start!78550 (= tp!58530 b_and!27371)))

(declare-fun b!915229 () Bool)

(declare-fun e!513499 () Bool)

(declare-fun e!513500 () Bool)

(assert (=> b!915229 (= e!513499 e!513500)))

(declare-fun res!616969 () Bool)

(assert (=> b!915229 (=> res!616969 e!513500)))

(declare-datatypes ((V!30519 0))(
  ( (V!30520 (val!9633 Int)) )
))
(declare-datatypes ((tuple2!12516 0))(
  ( (tuple2!12517 (_1!6269 (_ BitVec 64)) (_2!6269 V!30519)) )
))
(declare-datatypes ((List!18330 0))(
  ( (Nil!18327) (Cons!18326 (h!19478 tuple2!12516) (t!25929 List!18330)) )
))
(declare-datatypes ((ListLongMap!11215 0))(
  ( (ListLongMap!11216 (toList!5623 List!18330)) )
))
(declare-fun lt!411807 () ListLongMap!11215)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun contains!4682 (ListLongMap!11215 (_ BitVec 64)) Bool)

(assert (=> b!915229 (= res!616969 (not (contains!4682 lt!411807 k0!1033)))))

(declare-datatypes ((ValueCell!9101 0))(
  ( (ValueCellFull!9101 (v!12146 V!30519)) (EmptyCell!9101) )
))
(declare-datatypes ((array!54383 0))(
  ( (array!54384 (arr!26138 (Array (_ BitVec 32) ValueCell!9101)) (size!26598 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54383)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!30519)

(declare-datatypes ((array!54385 0))(
  ( (array!54386 (arr!26139 (Array (_ BitVec 32) (_ BitVec 64))) (size!26599 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54385)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30519)

(declare-fun getCurrentListMap!2883 (array!54385 array!54383 (_ BitVec 32) (_ BitVec 32) V!30519 V!30519 (_ BitVec 32) Int) ListLongMap!11215)

(assert (=> b!915229 (= lt!411807 (getCurrentListMap!2883 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!915230 () Bool)

(declare-fun res!616970 () Bool)

(declare-fun e!513497 () Bool)

(assert (=> b!915230 (=> (not res!616970) (not e!513497))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!915230 (= res!616970 (inRange!0 i!717 mask!1756))))

(declare-fun mapNonEmpty!30486 () Bool)

(declare-fun mapRes!30486 () Bool)

(declare-fun tp!58529 () Bool)

(declare-fun e!513496 () Bool)

(assert (=> mapNonEmpty!30486 (= mapRes!30486 (and tp!58529 e!513496))))

(declare-fun mapValue!30486 () ValueCell!9101)

(declare-fun mapKey!30486 () (_ BitVec 32))

(declare-fun mapRest!30486 () (Array (_ BitVec 32) ValueCell!9101))

(assert (=> mapNonEmpty!30486 (= (arr!26138 _values!1152) (store mapRest!30486 mapKey!30486 mapValue!30486))))

(declare-fun res!616972 () Bool)

(declare-fun e!513502 () Bool)

(assert (=> start!78550 (=> (not res!616972) (not e!513502))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78550 (= res!616972 (validMask!0 mask!1756))))

(assert (=> start!78550 e!513502))

(declare-fun e!513501 () Bool)

(declare-fun array_inv!20504 (array!54383) Bool)

(assert (=> start!78550 (and (array_inv!20504 _values!1152) e!513501)))

(assert (=> start!78550 tp!58530))

(assert (=> start!78550 true))

(declare-fun tp_is_empty!19165 () Bool)

(assert (=> start!78550 tp_is_empty!19165))

(declare-fun array_inv!20505 (array!54385) Bool)

(assert (=> start!78550 (array_inv!20505 _keys!1386)))

(declare-fun b!915231 () Bool)

(assert (=> b!915231 (= e!513500 true)))

(declare-fun lt!411810 () ListLongMap!11215)

(declare-fun lt!411808 () V!30519)

(declare-fun apply!534 (ListLongMap!11215 (_ BitVec 64)) V!30519)

(assert (=> b!915231 (= (apply!534 lt!411810 k0!1033) lt!411808)))

(declare-datatypes ((Unit!30936 0))(
  ( (Unit!30937) )
))
(declare-fun lt!411811 () Unit!30936)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!66 (array!54385 array!54383 (_ BitVec 32) (_ BitVec 32) V!30519 V!30519 (_ BitVec 64) V!30519 (_ BitVec 32) Int) Unit!30936)

(assert (=> b!915231 (= lt!411811 (lemmaListMapApplyFromThenApplyFromZero!66 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!411808 i!717 defaultEntry!1160))))

(declare-fun b!915232 () Bool)

(assert (=> b!915232 (= e!513497 (not e!513499))))

(declare-fun res!616971 () Bool)

(assert (=> b!915232 (=> res!616971 e!513499)))

(assert (=> b!915232 (= res!616971 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26599 _keys!1386))))))

(declare-fun get!13737 (ValueCell!9101 V!30519) V!30519)

(declare-fun dynLambda!1414 (Int (_ BitVec 64)) V!30519)

(assert (=> b!915232 (= lt!411808 (get!13737 (select (arr!26138 _values!1152) i!717) (dynLambda!1414 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!54385 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!915232 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun lt!411809 () Unit!30936)

(declare-fun lemmaKeyInListMapIsInArray!285 (array!54385 array!54383 (_ BitVec 32) (_ BitVec 32) V!30519 V!30519 (_ BitVec 64) Int) Unit!30936)

(assert (=> b!915232 (= lt!411809 (lemmaKeyInListMapIsInArray!285 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!915233 () Bool)

(assert (=> b!915233 (= e!513502 e!513497)))

(declare-fun res!616968 () Bool)

(assert (=> b!915233 (=> (not res!616968) (not e!513497))))

(assert (=> b!915233 (= res!616968 (contains!4682 lt!411810 k0!1033))))

(assert (=> b!915233 (= lt!411810 (getCurrentListMap!2883 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!915234 () Bool)

(assert (=> b!915234 (= e!513496 tp_is_empty!19165)))

(declare-fun b!915235 () Bool)

(declare-fun e!513503 () Bool)

(assert (=> b!915235 (= e!513503 tp_is_empty!19165)))

(declare-fun b!915236 () Bool)

(declare-fun res!616974 () Bool)

(assert (=> b!915236 (=> (not res!616974) (not e!513502))))

(declare-datatypes ((List!18331 0))(
  ( (Nil!18328) (Cons!18327 (h!19479 (_ BitVec 64)) (t!25930 List!18331)) )
))
(declare-fun arrayNoDuplicates!0 (array!54385 (_ BitVec 32) List!18331) Bool)

(assert (=> b!915236 (= res!616974 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18328))))

(declare-fun mapIsEmpty!30486 () Bool)

(assert (=> mapIsEmpty!30486 mapRes!30486))

(declare-fun b!915237 () Bool)

(declare-fun res!616966 () Bool)

(assert (=> b!915237 (=> (not res!616966) (not e!513502))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54385 (_ BitVec 32)) Bool)

(assert (=> b!915237 (= res!616966 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!915238 () Bool)

(declare-fun res!616973 () Bool)

(assert (=> b!915238 (=> (not res!616973) (not e!513502))))

(assert (=> b!915238 (= res!616973 (and (= (size!26598 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26599 _keys!1386) (size!26598 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!915239 () Bool)

(declare-fun res!616975 () Bool)

(assert (=> b!915239 (=> (not res!616975) (not e!513497))))

(assert (=> b!915239 (= res!616975 (and (= (select (arr!26139 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!915240 () Bool)

(declare-fun res!616967 () Bool)

(assert (=> b!915240 (=> res!616967 e!513500)))

(assert (=> b!915240 (= res!616967 (not (= (apply!534 lt!411807 k0!1033) lt!411808)))))

(declare-fun b!915241 () Bool)

(assert (=> b!915241 (= e!513501 (and e!513503 mapRes!30486))))

(declare-fun condMapEmpty!30486 () Bool)

(declare-fun mapDefault!30486 () ValueCell!9101)

(assert (=> b!915241 (= condMapEmpty!30486 (= (arr!26138 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9101)) mapDefault!30486)))))

(assert (= (and start!78550 res!616972) b!915238))

(assert (= (and b!915238 res!616973) b!915237))

(assert (= (and b!915237 res!616966) b!915236))

(assert (= (and b!915236 res!616974) b!915233))

(assert (= (and b!915233 res!616968) b!915230))

(assert (= (and b!915230 res!616970) b!915239))

(assert (= (and b!915239 res!616975) b!915232))

(assert (= (and b!915232 (not res!616971)) b!915229))

(assert (= (and b!915229 (not res!616969)) b!915240))

(assert (= (and b!915240 (not res!616967)) b!915231))

(assert (= (and b!915241 condMapEmpty!30486) mapIsEmpty!30486))

(assert (= (and b!915241 (not condMapEmpty!30486)) mapNonEmpty!30486))

(get-info :version)

(assert (= (and mapNonEmpty!30486 ((_ is ValueCellFull!9101) mapValue!30486)) b!915234))

(assert (= (and b!915241 ((_ is ValueCellFull!9101) mapDefault!30486)) b!915235))

(assert (= start!78550 b!915241))

(declare-fun b_lambda!13391 () Bool)

(assert (=> (not b_lambda!13391) (not b!915232)))

(declare-fun t!25928 () Bool)

(declare-fun tb!5449 () Bool)

(assert (=> (and start!78550 (= defaultEntry!1160 defaultEntry!1160) t!25928) tb!5449))

(declare-fun result!10717 () Bool)

(assert (=> tb!5449 (= result!10717 tp_is_empty!19165)))

(assert (=> b!915232 t!25928))

(declare-fun b_and!27373 () Bool)

(assert (= b_and!27371 (and (=> t!25928 result!10717) b_and!27373)))

(declare-fun m!850349 () Bool)

(assert (=> mapNonEmpty!30486 m!850349))

(declare-fun m!850351 () Bool)

(assert (=> b!915230 m!850351))

(declare-fun m!850353 () Bool)

(assert (=> b!915237 m!850353))

(declare-fun m!850355 () Bool)

(assert (=> b!915236 m!850355))

(declare-fun m!850357 () Bool)

(assert (=> start!78550 m!850357))

(declare-fun m!850359 () Bool)

(assert (=> start!78550 m!850359))

(declare-fun m!850361 () Bool)

(assert (=> start!78550 m!850361))

(declare-fun m!850363 () Bool)

(assert (=> b!915229 m!850363))

(declare-fun m!850365 () Bool)

(assert (=> b!915229 m!850365))

(declare-fun m!850367 () Bool)

(assert (=> b!915231 m!850367))

(declare-fun m!850369 () Bool)

(assert (=> b!915231 m!850369))

(declare-fun m!850371 () Bool)

(assert (=> b!915240 m!850371))

(declare-fun m!850373 () Bool)

(assert (=> b!915239 m!850373))

(declare-fun m!850375 () Bool)

(assert (=> b!915233 m!850375))

(declare-fun m!850377 () Bool)

(assert (=> b!915233 m!850377))

(declare-fun m!850379 () Bool)

(assert (=> b!915232 m!850379))

(declare-fun m!850381 () Bool)

(assert (=> b!915232 m!850381))

(declare-fun m!850383 () Bool)

(assert (=> b!915232 m!850383))

(declare-fun m!850385 () Bool)

(assert (=> b!915232 m!850385))

(assert (=> b!915232 m!850379))

(assert (=> b!915232 m!850383))

(declare-fun m!850387 () Bool)

(assert (=> b!915232 m!850387))

(check-sat (not mapNonEmpty!30486) (not b_lambda!13391) (not b!915230) (not b!915240) (not b_next!16747) (not b!915237) (not start!78550) tp_is_empty!19165 (not b!915236) (not b!915232) (not b!915231) (not b!915233) (not b!915229) b_and!27373)
(check-sat b_and!27373 (not b_next!16747))
