; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72268 () Bool)

(assert start!72268)

(declare-fun res!569485 () Bool)

(declare-fun e!467295 () Bool)

(assert (=> start!72268 (=> (not res!569485) (not e!467295))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!46941 0))(
  ( (array!46942 (arr!22502 (Array (_ BitVec 32) (_ BitVec 64))) (size!22944 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!46941)

(assert (=> start!72268 (= res!569485 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!22944 _keys!868))))))

(assert (=> start!72268 e!467295))

(assert (=> start!72268 true))

(declare-fun array_inv!18002 (array!46941) Bool)

(assert (=> start!72268 (array_inv!18002 _keys!868)))

(declare-datatypes ((V!25497 0))(
  ( (V!25498 (val!7716 Int)) )
))
(declare-datatypes ((ValueCell!7229 0))(
  ( (ValueCellFull!7229 (v!10135 V!25497)) (EmptyCell!7229) )
))
(declare-datatypes ((array!46943 0))(
  ( (array!46944 (arr!22503 (Array (_ BitVec 32) ValueCell!7229)) (size!22945 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!46943)

(declare-fun e!467294 () Bool)

(declare-fun array_inv!18003 (array!46943) Bool)

(assert (=> start!72268 (and (array_inv!18003 _values!688) e!467294)))

(declare-fun mapIsEmpty!24605 () Bool)

(declare-fun mapRes!24605 () Bool)

(assert (=> mapIsEmpty!24605 mapRes!24605))

(declare-fun b!837285 () Bool)

(declare-fun res!569484 () Bool)

(assert (=> b!837285 (=> (not res!569484) (not e!467295))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!837285 (= res!569484 (validMask!0 mask!1196))))

(declare-fun b!837286 () Bool)

(assert (=> b!837286 (= e!467295 false)))

(declare-fun lt!380336 () Bool)

(declare-datatypes ((List!16029 0))(
  ( (Nil!16026) (Cons!16025 (h!17156 (_ BitVec 64)) (t!22391 List!16029)) )
))
(declare-fun arrayNoDuplicates!0 (array!46941 (_ BitVec 32) List!16029) Bool)

(assert (=> b!837286 (= lt!380336 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16026))))

(declare-fun b!837287 () Bool)

(declare-fun e!467293 () Bool)

(declare-fun tp_is_empty!15337 () Bool)

(assert (=> b!837287 (= e!467293 tp_is_empty!15337)))

(declare-fun mapNonEmpty!24605 () Bool)

(declare-fun tp!47600 () Bool)

(assert (=> mapNonEmpty!24605 (= mapRes!24605 (and tp!47600 e!467293))))

(declare-fun mapValue!24605 () ValueCell!7229)

(declare-fun mapRest!24605 () (Array (_ BitVec 32) ValueCell!7229))

(declare-fun mapKey!24605 () (_ BitVec 32))

(assert (=> mapNonEmpty!24605 (= (arr!22503 _values!688) (store mapRest!24605 mapKey!24605 mapValue!24605))))

(declare-fun b!837288 () Bool)

(declare-fun e!467292 () Bool)

(assert (=> b!837288 (= e!467292 tp_is_empty!15337)))

(declare-fun b!837289 () Bool)

(declare-fun res!569487 () Bool)

(assert (=> b!837289 (=> (not res!569487) (not e!467295))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46941 (_ BitVec 32)) Bool)

(assert (=> b!837289 (= res!569487 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!837290 () Bool)

(declare-fun res!569486 () Bool)

(assert (=> b!837290 (=> (not res!569486) (not e!467295))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!837290 (= res!569486 (and (= (size!22945 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!22944 _keys!868) (size!22945 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!837291 () Bool)

(assert (=> b!837291 (= e!467294 (and e!467292 mapRes!24605))))

(declare-fun condMapEmpty!24605 () Bool)

(declare-fun mapDefault!24605 () ValueCell!7229)

(assert (=> b!837291 (= condMapEmpty!24605 (= (arr!22503 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7229)) mapDefault!24605)))))

(assert (= (and start!72268 res!569485) b!837285))

(assert (= (and b!837285 res!569484) b!837290))

(assert (= (and b!837290 res!569486) b!837289))

(assert (= (and b!837289 res!569487) b!837286))

(assert (= (and b!837291 condMapEmpty!24605) mapIsEmpty!24605))

(assert (= (and b!837291 (not condMapEmpty!24605)) mapNonEmpty!24605))

(get-info :version)

(assert (= (and mapNonEmpty!24605 ((_ is ValueCellFull!7229) mapValue!24605)) b!837287))

(assert (= (and b!837291 ((_ is ValueCellFull!7229) mapDefault!24605)) b!837288))

(assert (= start!72268 b!837291))

(declare-fun m!781583 () Bool)

(assert (=> b!837289 m!781583))

(declare-fun m!781585 () Bool)

(assert (=> b!837285 m!781585))

(declare-fun m!781587 () Bool)

(assert (=> start!72268 m!781587))

(declare-fun m!781589 () Bool)

(assert (=> start!72268 m!781589))

(declare-fun m!781591 () Bool)

(assert (=> b!837286 m!781591))

(declare-fun m!781593 () Bool)

(assert (=> mapNonEmpty!24605 m!781593))

(check-sat (not mapNonEmpty!24605) tp_is_empty!15337 (not b!837286) (not b!837285) (not b!837289) (not start!72268))
(check-sat)
