; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74122 () Bool)

(assert start!74122)

(declare-fun b!871934 () Bool)

(declare-fun res!592694 () Bool)

(declare-fun e!485499 () Bool)

(assert (=> b!871934 (=> (not res!592694) (not e!485499))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!50483 0))(
  ( (array!50484 (arr!24272 (Array (_ BitVec 32) (_ BitVec 64))) (size!24714 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50483)

(declare-datatypes ((V!27953 0))(
  ( (V!27954 (val!8637 Int)) )
))
(declare-datatypes ((ValueCell!8150 0))(
  ( (ValueCellFull!8150 (v!11056 V!27953)) (EmptyCell!8150) )
))
(declare-datatypes ((array!50485 0))(
  ( (array!50486 (arr!24273 (Array (_ BitVec 32) ValueCell!8150)) (size!24715 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50485)

(assert (=> b!871934 (= res!592694 (and (= (size!24715 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24714 _keys!868) (size!24715 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!871935 () Bool)

(declare-fun res!592693 () Bool)

(assert (=> b!871935 (=> (not res!592693) (not e!485499))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50483 (_ BitVec 32)) Bool)

(assert (=> b!871935 (= res!592693 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!871936 () Bool)

(assert (=> b!871936 (= e!485499 false)))

(declare-fun lt!395348 () Bool)

(declare-datatypes ((List!17260 0))(
  ( (Nil!17257) (Cons!17256 (h!18387 (_ BitVec 64)) (t!24288 List!17260)) )
))
(declare-fun arrayNoDuplicates!0 (array!50483 (_ BitVec 32) List!17260) Bool)

(assert (=> b!871936 (= lt!395348 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17257))))

(declare-fun b!871937 () Bool)

(declare-fun res!592695 () Bool)

(assert (=> b!871937 (=> (not res!592695) (not e!485499))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!871937 (= res!592695 (validMask!0 mask!1196))))

(declare-fun b!871938 () Bool)

(declare-fun e!485502 () Bool)

(declare-fun tp_is_empty!17179 () Bool)

(assert (=> b!871938 (= e!485502 tp_is_empty!17179)))

(declare-fun res!592692 () Bool)

(assert (=> start!74122 (=> (not res!592692) (not e!485499))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74122 (= res!592692 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24714 _keys!868))))))

(assert (=> start!74122 e!485499))

(assert (=> start!74122 true))

(declare-fun array_inv!19226 (array!50483) Bool)

(assert (=> start!74122 (array_inv!19226 _keys!868)))

(declare-fun e!485498 () Bool)

(declare-fun array_inv!19227 (array!50485) Bool)

(assert (=> start!74122 (and (array_inv!19227 _values!688) e!485498)))

(declare-fun b!871939 () Bool)

(declare-fun e!485501 () Bool)

(declare-fun mapRes!27371 () Bool)

(assert (=> b!871939 (= e!485498 (and e!485501 mapRes!27371))))

(declare-fun condMapEmpty!27371 () Bool)

(declare-fun mapDefault!27371 () ValueCell!8150)

(assert (=> b!871939 (= condMapEmpty!27371 (= (arr!24273 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8150)) mapDefault!27371)))))

(declare-fun mapNonEmpty!27371 () Bool)

(declare-fun tp!52571 () Bool)

(assert (=> mapNonEmpty!27371 (= mapRes!27371 (and tp!52571 e!485502))))

(declare-fun mapRest!27371 () (Array (_ BitVec 32) ValueCell!8150))

(declare-fun mapValue!27371 () ValueCell!8150)

(declare-fun mapKey!27371 () (_ BitVec 32))

(assert (=> mapNonEmpty!27371 (= (arr!24273 _values!688) (store mapRest!27371 mapKey!27371 mapValue!27371))))

(declare-fun b!871940 () Bool)

(assert (=> b!871940 (= e!485501 tp_is_empty!17179)))

(declare-fun mapIsEmpty!27371 () Bool)

(assert (=> mapIsEmpty!27371 mapRes!27371))

(assert (= (and start!74122 res!592692) b!871937))

(assert (= (and b!871937 res!592695) b!871934))

(assert (= (and b!871934 res!592694) b!871935))

(assert (= (and b!871935 res!592693) b!871936))

(assert (= (and b!871939 condMapEmpty!27371) mapIsEmpty!27371))

(assert (= (and b!871939 (not condMapEmpty!27371)) mapNonEmpty!27371))

(get-info :version)

(assert (= (and mapNonEmpty!27371 ((_ is ValueCellFull!8150) mapValue!27371)) b!871938))

(assert (= (and b!871939 ((_ is ValueCellFull!8150) mapDefault!27371)) b!871940))

(assert (= start!74122 b!871939))

(declare-fun m!812349 () Bool)

(assert (=> start!74122 m!812349))

(declare-fun m!812351 () Bool)

(assert (=> start!74122 m!812351))

(declare-fun m!812353 () Bool)

(assert (=> b!871937 m!812353))

(declare-fun m!812355 () Bool)

(assert (=> b!871936 m!812355))

(declare-fun m!812357 () Bool)

(assert (=> mapNonEmpty!27371 m!812357))

(declare-fun m!812359 () Bool)

(assert (=> b!871935 m!812359))

(check-sat (not b!871935) (not start!74122) (not b!871936) (not b!871937) tp_is_empty!17179 (not mapNonEmpty!27371))
(check-sat)
