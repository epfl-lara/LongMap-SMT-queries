; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74140 () Bool)

(assert start!74140)

(declare-fun b!872123 () Bool)

(declare-fun res!592803 () Bool)

(declare-fun e!485637 () Bool)

(assert (=> b!872123 (=> (not res!592803) (not e!485637))))

(declare-datatypes ((array!50517 0))(
  ( (array!50518 (arr!24289 (Array (_ BitVec 32) (_ BitVec 64))) (size!24731 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50517)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50517 (_ BitVec 32)) Bool)

(assert (=> b!872123 (= res!592803 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!592802 () Bool)

(assert (=> start!74140 (=> (not res!592802) (not e!485637))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74140 (= res!592802 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24731 _keys!868))))))

(assert (=> start!74140 e!485637))

(assert (=> start!74140 true))

(declare-fun array_inv!19238 (array!50517) Bool)

(assert (=> start!74140 (array_inv!19238 _keys!868)))

(declare-datatypes ((V!27977 0))(
  ( (V!27978 (val!8646 Int)) )
))
(declare-datatypes ((ValueCell!8159 0))(
  ( (ValueCellFull!8159 (v!11065 V!27977)) (EmptyCell!8159) )
))
(declare-datatypes ((array!50519 0))(
  ( (array!50520 (arr!24290 (Array (_ BitVec 32) ValueCell!8159)) (size!24732 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50519)

(declare-fun e!485635 () Bool)

(declare-fun array_inv!19239 (array!50519) Bool)

(assert (=> start!74140 (and (array_inv!19239 _values!688) e!485635)))

(declare-fun mapNonEmpty!27398 () Bool)

(declare-fun mapRes!27398 () Bool)

(declare-fun tp!52598 () Bool)

(declare-fun e!485634 () Bool)

(assert (=> mapNonEmpty!27398 (= mapRes!27398 (and tp!52598 e!485634))))

(declare-fun mapValue!27398 () ValueCell!8159)

(declare-fun mapRest!27398 () (Array (_ BitVec 32) ValueCell!8159))

(declare-fun mapKey!27398 () (_ BitVec 32))

(assert (=> mapNonEmpty!27398 (= (arr!24290 _values!688) (store mapRest!27398 mapKey!27398 mapValue!27398))))

(declare-fun b!872124 () Bool)

(declare-fun e!485636 () Bool)

(declare-fun tp_is_empty!17197 () Bool)

(assert (=> b!872124 (= e!485636 tp_is_empty!17197)))

(declare-fun b!872125 () Bool)

(assert (=> b!872125 (= e!485635 (and e!485636 mapRes!27398))))

(declare-fun condMapEmpty!27398 () Bool)

(declare-fun mapDefault!27398 () ValueCell!8159)

(assert (=> b!872125 (= condMapEmpty!27398 (= (arr!24290 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8159)) mapDefault!27398)))))

(declare-fun mapIsEmpty!27398 () Bool)

(assert (=> mapIsEmpty!27398 mapRes!27398))

(declare-fun b!872126 () Bool)

(assert (=> b!872126 (= e!485637 false)))

(declare-fun lt!395375 () Bool)

(declare-datatypes ((List!17266 0))(
  ( (Nil!17263) (Cons!17262 (h!18393 (_ BitVec 64)) (t!24294 List!17266)) )
))
(declare-fun arrayNoDuplicates!0 (array!50517 (_ BitVec 32) List!17266) Bool)

(assert (=> b!872126 (= lt!395375 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17263))))

(declare-fun b!872127 () Bool)

(declare-fun res!592801 () Bool)

(assert (=> b!872127 (=> (not res!592801) (not e!485637))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!872127 (= res!592801 (validMask!0 mask!1196))))

(declare-fun b!872128 () Bool)

(declare-fun res!592800 () Bool)

(assert (=> b!872128 (=> (not res!592800) (not e!485637))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!872128 (= res!592800 (and (= (size!24732 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24731 _keys!868) (size!24732 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!872129 () Bool)

(assert (=> b!872129 (= e!485634 tp_is_empty!17197)))

(assert (= (and start!74140 res!592802) b!872127))

(assert (= (and b!872127 res!592801) b!872128))

(assert (= (and b!872128 res!592800) b!872123))

(assert (= (and b!872123 res!592803) b!872126))

(assert (= (and b!872125 condMapEmpty!27398) mapIsEmpty!27398))

(assert (= (and b!872125 (not condMapEmpty!27398)) mapNonEmpty!27398))

(get-info :version)

(assert (= (and mapNonEmpty!27398 ((_ is ValueCellFull!8159) mapValue!27398)) b!872129))

(assert (= (and b!872125 ((_ is ValueCellFull!8159) mapDefault!27398)) b!872124))

(assert (= start!74140 b!872125))

(declare-fun m!812457 () Bool)

(assert (=> start!74140 m!812457))

(declare-fun m!812459 () Bool)

(assert (=> start!74140 m!812459))

(declare-fun m!812461 () Bool)

(assert (=> b!872126 m!812461))

(declare-fun m!812463 () Bool)

(assert (=> b!872123 m!812463))

(declare-fun m!812465 () Bool)

(assert (=> b!872127 m!812465))

(declare-fun m!812467 () Bool)

(assert (=> mapNonEmpty!27398 m!812467))

(check-sat (not b!872123) (not mapNonEmpty!27398) (not b!872127) (not start!74140) (not b!872126) tp_is_empty!17197)
(check-sat)
