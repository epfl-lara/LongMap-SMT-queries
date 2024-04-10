; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74076 () Bool)

(assert start!74076)

(declare-fun b!871467 () Bool)

(declare-fun res!592369 () Bool)

(declare-fun e!485211 () Bool)

(assert (=> b!871467 (=> (not res!592369) (not e!485211))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!871467 (= res!592369 (validMask!0 mask!1196))))

(declare-fun b!871468 () Bool)

(declare-fun e!485214 () Bool)

(declare-fun tp_is_empty!17127 () Bool)

(assert (=> b!871468 (= e!485214 tp_is_empty!17127)))

(declare-fun mapIsEmpty!27290 () Bool)

(declare-fun mapRes!27290 () Bool)

(assert (=> mapIsEmpty!27290 mapRes!27290))

(declare-fun b!871469 () Bool)

(declare-fun e!485212 () Bool)

(declare-fun e!485213 () Bool)

(assert (=> b!871469 (= e!485212 (and e!485213 mapRes!27290))))

(declare-fun condMapEmpty!27290 () Bool)

(declare-datatypes ((V!27883 0))(
  ( (V!27884 (val!8611 Int)) )
))
(declare-datatypes ((ValueCell!8124 0))(
  ( (ValueCellFull!8124 (v!11036 V!27883)) (EmptyCell!8124) )
))
(declare-datatypes ((array!50392 0))(
  ( (array!50393 (arr!24227 (Array (_ BitVec 32) ValueCell!8124)) (size!24667 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50392)

(declare-fun mapDefault!27290 () ValueCell!8124)

(assert (=> b!871469 (= condMapEmpty!27290 (= (arr!24227 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8124)) mapDefault!27290)))))

(declare-fun b!871470 () Bool)

(assert (=> b!871470 (= e!485213 tp_is_empty!17127)))

(declare-fun b!871471 () Bool)

(declare-fun res!592367 () Bool)

(assert (=> b!871471 (=> (not res!592367) (not e!485211))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((array!50394 0))(
  ( (array!50395 (arr!24228 (Array (_ BitVec 32) (_ BitVec 64))) (size!24668 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50394)

(assert (=> b!871471 (= res!592367 (and (= (size!24667 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24668 _keys!868) (size!24667 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!871472 () Bool)

(assert (=> b!871472 (= e!485211 false)))

(declare-fun lt!395470 () Bool)

(declare-datatypes ((List!17229 0))(
  ( (Nil!17226) (Cons!17225 (h!18356 (_ BitVec 64)) (t!24266 List!17229)) )
))
(declare-fun arrayNoDuplicates!0 (array!50394 (_ BitVec 32) List!17229) Bool)

(assert (=> b!871472 (= lt!395470 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17226))))

(declare-fun mapNonEmpty!27290 () Bool)

(declare-fun tp!52471 () Bool)

(assert (=> mapNonEmpty!27290 (= mapRes!27290 (and tp!52471 e!485214))))

(declare-fun mapRest!27290 () (Array (_ BitVec 32) ValueCell!8124))

(declare-fun mapKey!27290 () (_ BitVec 32))

(declare-fun mapValue!27290 () ValueCell!8124)

(assert (=> mapNonEmpty!27290 (= (arr!24227 _values!688) (store mapRest!27290 mapKey!27290 mapValue!27290))))

(declare-fun res!592368 () Bool)

(assert (=> start!74076 (=> (not res!592368) (not e!485211))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74076 (= res!592368 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24668 _keys!868))))))

(assert (=> start!74076 e!485211))

(assert (=> start!74076 true))

(declare-fun array_inv!19130 (array!50394) Bool)

(assert (=> start!74076 (array_inv!19130 _keys!868)))

(declare-fun array_inv!19131 (array!50392) Bool)

(assert (=> start!74076 (and (array_inv!19131 _values!688) e!485212)))

(declare-fun b!871466 () Bool)

(declare-fun res!592370 () Bool)

(assert (=> b!871466 (=> (not res!592370) (not e!485211))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50394 (_ BitVec 32)) Bool)

(assert (=> b!871466 (= res!592370 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!74076 res!592368) b!871467))

(assert (= (and b!871467 res!592369) b!871471))

(assert (= (and b!871471 res!592367) b!871466))

(assert (= (and b!871466 res!592370) b!871472))

(assert (= (and b!871469 condMapEmpty!27290) mapIsEmpty!27290))

(assert (= (and b!871469 (not condMapEmpty!27290)) mapNonEmpty!27290))

(get-info :version)

(assert (= (and mapNonEmpty!27290 ((_ is ValueCellFull!8124) mapValue!27290)) b!871468))

(assert (= (and b!871469 ((_ is ValueCellFull!8124) mapDefault!27290)) b!871470))

(assert (= start!74076 b!871469))

(declare-fun m!812669 () Bool)

(assert (=> start!74076 m!812669))

(declare-fun m!812671 () Bool)

(assert (=> start!74076 m!812671))

(declare-fun m!812673 () Bool)

(assert (=> b!871466 m!812673))

(declare-fun m!812675 () Bool)

(assert (=> b!871467 m!812675))

(declare-fun m!812677 () Bool)

(assert (=> mapNonEmpty!27290 m!812677))

(declare-fun m!812679 () Bool)

(assert (=> b!871472 m!812679))

(check-sat (not b!871472) (not b!871467) (not mapNonEmpty!27290) (not start!74076) tp_is_empty!17127 (not b!871466))
(check-sat)
