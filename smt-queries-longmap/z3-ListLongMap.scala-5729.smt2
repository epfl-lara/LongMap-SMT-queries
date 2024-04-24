; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74338 () Bool)

(assert start!74338)

(declare-fun b!873391 () Bool)

(declare-fun e!486454 () Bool)

(declare-fun tp_is_empty!17209 () Bool)

(assert (=> b!873391 (= e!486454 tp_is_empty!17209)))

(declare-fun mapIsEmpty!27416 () Bool)

(declare-fun mapRes!27416 () Bool)

(assert (=> mapIsEmpty!27416 mapRes!27416))

(declare-fun b!873392 () Bool)

(declare-fun e!486457 () Bool)

(declare-fun e!486455 () Bool)

(assert (=> b!873392 (= e!486457 (and e!486455 mapRes!27416))))

(declare-fun condMapEmpty!27416 () Bool)

(declare-datatypes ((V!27993 0))(
  ( (V!27994 (val!8652 Int)) )
))
(declare-datatypes ((ValueCell!8165 0))(
  ( (ValueCellFull!8165 (v!11077 V!27993)) (EmptyCell!8165) )
))
(declare-datatypes ((array!50605 0))(
  ( (array!50606 (arr!24328 (Array (_ BitVec 32) ValueCell!8165)) (size!24769 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50605)

(declare-fun mapDefault!27416 () ValueCell!8165)

(assert (=> b!873392 (= condMapEmpty!27416 (= (arr!24328 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8165)) mapDefault!27416)))))

(declare-fun mapNonEmpty!27416 () Bool)

(declare-fun tp!52616 () Bool)

(assert (=> mapNonEmpty!27416 (= mapRes!27416 (and tp!52616 e!486454))))

(declare-fun mapValue!27416 () ValueCell!8165)

(declare-fun mapKey!27416 () (_ BitVec 32))

(declare-fun mapRest!27416 () (Array (_ BitVec 32) ValueCell!8165))

(assert (=> mapNonEmpty!27416 (= (arr!24328 _values!688) (store mapRest!27416 mapKey!27416 mapValue!27416))))

(declare-fun b!873393 () Bool)

(assert (=> b!873393 (= e!486455 tp_is_empty!17209)))

(declare-fun b!873394 () Bool)

(declare-fun e!486453 () Bool)

(assert (=> b!873394 (= e!486453 false)))

(declare-fun lt!395990 () Bool)

(declare-datatypes ((array!50607 0))(
  ( (array!50608 (arr!24329 (Array (_ BitVec 32) (_ BitVec 64))) (size!24770 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50607)

(declare-datatypes ((List!17217 0))(
  ( (Nil!17214) (Cons!17213 (h!18350 (_ BitVec 64)) (t!24246 List!17217)) )
))
(declare-fun arrayNoDuplicates!0 (array!50607 (_ BitVec 32) List!17217) Bool)

(assert (=> b!873394 (= lt!395990 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17214))))

(declare-fun b!873395 () Bool)

(declare-fun res!593327 () Bool)

(assert (=> b!873395 (=> (not res!593327) (not e!486453))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!873395 (= res!593327 (validMask!0 mask!1196))))

(declare-fun b!873396 () Bool)

(declare-fun res!593328 () Bool)

(assert (=> b!873396 (=> (not res!593328) (not e!486453))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!873396 (= res!593328 (and (= (size!24769 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24770 _keys!868) (size!24769 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!873397 () Bool)

(declare-fun res!593326 () Bool)

(assert (=> b!873397 (=> (not res!593326) (not e!486453))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50607 (_ BitVec 32)) Bool)

(assert (=> b!873397 (= res!593326 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!593329 () Bool)

(assert (=> start!74338 (=> (not res!593329) (not e!486453))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74338 (= res!593329 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24770 _keys!868))))))

(assert (=> start!74338 e!486453))

(assert (=> start!74338 true))

(declare-fun array_inv!19248 (array!50607) Bool)

(assert (=> start!74338 (array_inv!19248 _keys!868)))

(declare-fun array_inv!19249 (array!50605) Bool)

(assert (=> start!74338 (and (array_inv!19249 _values!688) e!486457)))

(assert (= (and start!74338 res!593329) b!873395))

(assert (= (and b!873395 res!593327) b!873396))

(assert (= (and b!873396 res!593328) b!873397))

(assert (= (and b!873397 res!593326) b!873394))

(assert (= (and b!873392 condMapEmpty!27416) mapIsEmpty!27416))

(assert (= (and b!873392 (not condMapEmpty!27416)) mapNonEmpty!27416))

(get-info :version)

(assert (= (and mapNonEmpty!27416 ((_ is ValueCellFull!8165) mapValue!27416)) b!873391))

(assert (= (and b!873392 ((_ is ValueCellFull!8165) mapDefault!27416)) b!873393))

(assert (= start!74338 b!873392))

(declare-fun m!814577 () Bool)

(assert (=> b!873395 m!814577))

(declare-fun m!814579 () Bool)

(assert (=> mapNonEmpty!27416 m!814579))

(declare-fun m!814581 () Bool)

(assert (=> start!74338 m!814581))

(declare-fun m!814583 () Bool)

(assert (=> start!74338 m!814583))

(declare-fun m!814585 () Bool)

(assert (=> b!873397 m!814585))

(declare-fun m!814587 () Bool)

(assert (=> b!873394 m!814587))

(check-sat (not start!74338) (not b!873397) tp_is_empty!17209 (not b!873394) (not mapNonEmpty!27416) (not b!873395))
(check-sat)
