; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74326 () Bool)

(assert start!74326)

(declare-fun mapNonEmpty!27398 () Bool)

(declare-fun mapRes!27398 () Bool)

(declare-fun tp!52598 () Bool)

(declare-fun e!486366 () Bool)

(assert (=> mapNonEmpty!27398 (= mapRes!27398 (and tp!52598 e!486366))))

(declare-datatypes ((V!27977 0))(
  ( (V!27978 (val!8646 Int)) )
))
(declare-datatypes ((ValueCell!8159 0))(
  ( (ValueCellFull!8159 (v!11071 V!27977)) (EmptyCell!8159) )
))
(declare-fun mapRest!27398 () (Array (_ BitVec 32) ValueCell!8159))

(declare-fun mapKey!27398 () (_ BitVec 32))

(declare-fun mapValue!27398 () ValueCell!8159)

(declare-datatypes ((array!50583 0))(
  ( (array!50584 (arr!24317 (Array (_ BitVec 32) ValueCell!8159)) (size!24758 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50583)

(assert (=> mapNonEmpty!27398 (= (arr!24317 _values!688) (store mapRest!27398 mapKey!27398 mapValue!27398))))

(declare-fun mapIsEmpty!27398 () Bool)

(assert (=> mapIsEmpty!27398 mapRes!27398))

(declare-fun b!873266 () Bool)

(declare-fun res!593254 () Bool)

(declare-fun e!486363 () Bool)

(assert (=> b!873266 (=> (not res!593254) (not e!486363))))

(declare-datatypes ((array!50585 0))(
  ( (array!50586 (arr!24318 (Array (_ BitVec 32) (_ BitVec 64))) (size!24759 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50585)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50585 (_ BitVec 32)) Bool)

(assert (=> b!873266 (= res!593254 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!873267 () Bool)

(declare-fun tp_is_empty!17197 () Bool)

(assert (=> b!873267 (= e!486366 tp_is_empty!17197)))

(declare-fun b!873268 () Bool)

(declare-fun e!486364 () Bool)

(declare-fun e!486365 () Bool)

(assert (=> b!873268 (= e!486364 (and e!486365 mapRes!27398))))

(declare-fun condMapEmpty!27398 () Bool)

(declare-fun mapDefault!27398 () ValueCell!8159)

(assert (=> b!873268 (= condMapEmpty!27398 (= (arr!24317 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8159)) mapDefault!27398)))))

(declare-fun res!593257 () Bool)

(assert (=> start!74326 (=> (not res!593257) (not e!486363))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74326 (= res!593257 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24759 _keys!868))))))

(assert (=> start!74326 e!486363))

(assert (=> start!74326 true))

(declare-fun array_inv!19240 (array!50585) Bool)

(assert (=> start!74326 (array_inv!19240 _keys!868)))

(declare-fun array_inv!19241 (array!50583) Bool)

(assert (=> start!74326 (and (array_inv!19241 _values!688) e!486364)))

(declare-fun b!873265 () Bool)

(declare-fun res!593256 () Bool)

(assert (=> b!873265 (=> (not res!593256) (not e!486363))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!873265 (= res!593256 (and (= (size!24758 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24759 _keys!868) (size!24758 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!873269 () Bool)

(declare-fun res!593255 () Bool)

(assert (=> b!873269 (=> (not res!593255) (not e!486363))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!873269 (= res!593255 (validMask!0 mask!1196))))

(declare-fun b!873270 () Bool)

(assert (=> b!873270 (= e!486363 false)))

(declare-fun lt!395972 () Bool)

(declare-datatypes ((List!17213 0))(
  ( (Nil!17210) (Cons!17209 (h!18346 (_ BitVec 64)) (t!24242 List!17213)) )
))
(declare-fun arrayNoDuplicates!0 (array!50585 (_ BitVec 32) List!17213) Bool)

(assert (=> b!873270 (= lt!395972 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17210))))

(declare-fun b!873271 () Bool)

(assert (=> b!873271 (= e!486365 tp_is_empty!17197)))

(assert (= (and start!74326 res!593257) b!873269))

(assert (= (and b!873269 res!593255) b!873265))

(assert (= (and b!873265 res!593256) b!873266))

(assert (= (and b!873266 res!593254) b!873270))

(assert (= (and b!873268 condMapEmpty!27398) mapIsEmpty!27398))

(assert (= (and b!873268 (not condMapEmpty!27398)) mapNonEmpty!27398))

(get-info :version)

(assert (= (and mapNonEmpty!27398 ((_ is ValueCellFull!8159) mapValue!27398)) b!873267))

(assert (= (and b!873268 ((_ is ValueCellFull!8159) mapDefault!27398)) b!873271))

(assert (= start!74326 b!873268))

(declare-fun m!814505 () Bool)

(assert (=> b!873270 m!814505))

(declare-fun m!814507 () Bool)

(assert (=> b!873269 m!814507))

(declare-fun m!814509 () Bool)

(assert (=> start!74326 m!814509))

(declare-fun m!814511 () Bool)

(assert (=> start!74326 m!814511))

(declare-fun m!814513 () Bool)

(assert (=> mapNonEmpty!27398 m!814513))

(declare-fun m!814515 () Bool)

(assert (=> b!873266 m!814515))

(check-sat (not b!873266) tp_is_empty!17197 (not mapNonEmpty!27398) (not start!74326) (not b!873269) (not b!873270))
(check-sat)
