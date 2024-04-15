; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40614 () Bool)

(assert start!40614)

(declare-fun b_free!10639 () Bool)

(declare-fun b_next!10639 () Bool)

(assert (=> start!40614 (= b_free!10639 (not b_next!10639))))

(declare-fun tp!37737 () Bool)

(declare-fun b_and!18621 () Bool)

(assert (=> start!40614 (= tp!37737 b_and!18621)))

(declare-fun b!448276 () Bool)

(declare-fun res!266502 () Bool)

(declare-fun e!262999 () Bool)

(assert (=> b!448276 (=> (not res!266502) (not e!262999))))

(declare-datatypes ((array!27759 0))(
  ( (array!27760 (arr!13325 (Array (_ BitVec 32) (_ BitVec 64))) (size!13678 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27759)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!448276 (= res!266502 (or (= (select (arr!13325 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13325 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!266500 () Bool)

(assert (=> start!40614 (=> (not res!266500) (not e!262999))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40614 (= res!266500 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13678 _keys!709))))))

(assert (=> start!40614 e!262999))

(declare-fun tp_is_empty!11977 () Bool)

(assert (=> start!40614 tp_is_empty!11977))

(assert (=> start!40614 tp!37737))

(assert (=> start!40614 true))

(declare-datatypes ((V!17075 0))(
  ( (V!17076 (val!6033 Int)) )
))
(declare-datatypes ((ValueCell!5645 0))(
  ( (ValueCellFull!5645 (v!8282 V!17075)) (EmptyCell!5645) )
))
(declare-datatypes ((array!27761 0))(
  ( (array!27762 (arr!13326 (Array (_ BitVec 32) ValueCell!5645)) (size!13679 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27761)

(declare-fun e!262995 () Bool)

(declare-fun array_inv!9714 (array!27761) Bool)

(assert (=> start!40614 (and (array_inv!9714 _values!549) e!262995)))

(declare-fun array_inv!9715 (array!27759) Bool)

(assert (=> start!40614 (array_inv!9715 _keys!709)))

(declare-fun b!448277 () Bool)

(declare-fun res!266496 () Bool)

(assert (=> b!448277 (=> (not res!266496) (not e!262999))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27759 (_ BitVec 32)) Bool)

(assert (=> b!448277 (= res!266496 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!448278 () Bool)

(declare-fun e!262997 () Bool)

(assert (=> b!448278 (= e!262997 tp_is_empty!11977)))

(declare-fun b!448279 () Bool)

(declare-fun res!266501 () Bool)

(declare-fun e!262996 () Bool)

(assert (=> b!448279 (=> (not res!266501) (not e!262996))))

(assert (=> b!448279 (= res!266501 (bvsle from!863 i!563))))

(declare-fun b!448280 () Bool)

(declare-fun e!263000 () Bool)

(declare-fun mapRes!19599 () Bool)

(assert (=> b!448280 (= e!262995 (and e!263000 mapRes!19599))))

(declare-fun condMapEmpty!19599 () Bool)

(declare-fun mapDefault!19599 () ValueCell!5645)

(assert (=> b!448280 (= condMapEmpty!19599 (= (arr!13326 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5645)) mapDefault!19599)))))

(declare-fun b!448281 () Bool)

(declare-fun res!266492 () Bool)

(assert (=> b!448281 (=> (not res!266492) (not e!262999))))

(assert (=> b!448281 (= res!266492 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13678 _keys!709))))))

(declare-fun mapIsEmpty!19599 () Bool)

(assert (=> mapIsEmpty!19599 mapRes!19599))

(declare-fun mapNonEmpty!19599 () Bool)

(declare-fun tp!37736 () Bool)

(assert (=> mapNonEmpty!19599 (= mapRes!19599 (and tp!37736 e!262997))))

(declare-fun mapKey!19599 () (_ BitVec 32))

(declare-fun mapValue!19599 () ValueCell!5645)

(declare-fun mapRest!19599 () (Array (_ BitVec 32) ValueCell!5645))

(assert (=> mapNonEmpty!19599 (= (arr!13326 _values!549) (store mapRest!19599 mapKey!19599 mapValue!19599))))

(declare-fun b!448282 () Bool)

(declare-fun res!266494 () Bool)

(assert (=> b!448282 (=> (not res!266494) (not e!262999))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27759 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!448282 (= res!266494 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!448283 () Bool)

(declare-fun res!266495 () Bool)

(assert (=> b!448283 (=> (not res!266495) (not e!262996))))

(declare-fun lt!203954 () array!27759)

(declare-datatypes ((List!7983 0))(
  ( (Nil!7980) (Cons!7979 (h!8835 (_ BitVec 64)) (t!13736 List!7983)) )
))
(declare-fun arrayNoDuplicates!0 (array!27759 (_ BitVec 32) List!7983) Bool)

(assert (=> b!448283 (= res!266495 (arrayNoDuplicates!0 lt!203954 #b00000000000000000000000000000000 Nil!7980))))

(declare-fun b!448284 () Bool)

(assert (=> b!448284 (= e!263000 tp_is_empty!11977)))

(declare-fun b!448285 () Bool)

(declare-fun res!266499 () Bool)

(assert (=> b!448285 (=> (not res!266499) (not e!262999))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!448285 (= res!266499 (and (= (size!13679 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13678 _keys!709) (size!13679 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!448286 () Bool)

(assert (=> b!448286 (= e!262996 false)))

(declare-fun minValue!515 () V!17075)

(declare-datatypes ((tuple2!7920 0))(
  ( (tuple2!7921 (_1!3971 (_ BitVec 64)) (_2!3971 V!17075)) )
))
(declare-datatypes ((List!7984 0))(
  ( (Nil!7981) (Cons!7980 (h!8836 tuple2!7920) (t!13737 List!7984)) )
))
(declare-datatypes ((ListLongMap!6823 0))(
  ( (ListLongMap!6824 (toList!3427 List!7984)) )
))
(declare-fun lt!203953 () ListLongMap!6823)

(declare-fun zeroValue!515 () V!17075)

(declare-fun v!412 () V!17075)

(declare-fun defaultEntry!557 () Int)

(declare-fun getCurrentListMapNoExtraKeys!1625 (array!27759 array!27761 (_ BitVec 32) (_ BitVec 32) V!17075 V!17075 (_ BitVec 32) Int) ListLongMap!6823)

(assert (=> b!448286 (= lt!203953 (getCurrentListMapNoExtraKeys!1625 lt!203954 (array!27762 (store (arr!13326 _values!549) i!563 (ValueCellFull!5645 v!412)) (size!13679 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!203955 () ListLongMap!6823)

(assert (=> b!448286 (= lt!203955 (getCurrentListMapNoExtraKeys!1625 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!448287 () Bool)

(declare-fun res!266493 () Bool)

(assert (=> b!448287 (=> (not res!266493) (not e!262999))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!448287 (= res!266493 (validMask!0 mask!1025))))

(declare-fun b!448288 () Bool)

(assert (=> b!448288 (= e!262999 e!262996)))

(declare-fun res!266491 () Bool)

(assert (=> b!448288 (=> (not res!266491) (not e!262996))))

(assert (=> b!448288 (= res!266491 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203954 mask!1025))))

(assert (=> b!448288 (= lt!203954 (array!27760 (store (arr!13325 _keys!709) i!563 k0!794) (size!13678 _keys!709)))))

(declare-fun b!448289 () Bool)

(declare-fun res!266497 () Bool)

(assert (=> b!448289 (=> (not res!266497) (not e!262999))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!448289 (= res!266497 (validKeyInArray!0 k0!794))))

(declare-fun b!448290 () Bool)

(declare-fun res!266498 () Bool)

(assert (=> b!448290 (=> (not res!266498) (not e!262999))))

(assert (=> b!448290 (= res!266498 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7980))))

(assert (= (and start!40614 res!266500) b!448287))

(assert (= (and b!448287 res!266493) b!448285))

(assert (= (and b!448285 res!266499) b!448277))

(assert (= (and b!448277 res!266496) b!448290))

(assert (= (and b!448290 res!266498) b!448281))

(assert (= (and b!448281 res!266492) b!448289))

(assert (= (and b!448289 res!266497) b!448276))

(assert (= (and b!448276 res!266502) b!448282))

(assert (= (and b!448282 res!266494) b!448288))

(assert (= (and b!448288 res!266491) b!448283))

(assert (= (and b!448283 res!266495) b!448279))

(assert (= (and b!448279 res!266501) b!448286))

(assert (= (and b!448280 condMapEmpty!19599) mapIsEmpty!19599))

(assert (= (and b!448280 (not condMapEmpty!19599)) mapNonEmpty!19599))

(get-info :version)

(assert (= (and mapNonEmpty!19599 ((_ is ValueCellFull!5645) mapValue!19599)) b!448278))

(assert (= (and b!448280 ((_ is ValueCellFull!5645) mapDefault!19599)) b!448284))

(assert (= start!40614 b!448280))

(declare-fun m!432331 () Bool)

(assert (=> b!448282 m!432331))

(declare-fun m!432333 () Bool)

(assert (=> b!448286 m!432333))

(declare-fun m!432335 () Bool)

(assert (=> b!448286 m!432335))

(declare-fun m!432337 () Bool)

(assert (=> b!448286 m!432337))

(declare-fun m!432339 () Bool)

(assert (=> b!448289 m!432339))

(declare-fun m!432341 () Bool)

(assert (=> b!448283 m!432341))

(declare-fun m!432343 () Bool)

(assert (=> b!448276 m!432343))

(declare-fun m!432345 () Bool)

(assert (=> b!448277 m!432345))

(declare-fun m!432347 () Bool)

(assert (=> start!40614 m!432347))

(declare-fun m!432349 () Bool)

(assert (=> start!40614 m!432349))

(declare-fun m!432351 () Bool)

(assert (=> b!448288 m!432351))

(declare-fun m!432353 () Bool)

(assert (=> b!448288 m!432353))

(declare-fun m!432355 () Bool)

(assert (=> b!448287 m!432355))

(declare-fun m!432357 () Bool)

(assert (=> mapNonEmpty!19599 m!432357))

(declare-fun m!432359 () Bool)

(assert (=> b!448290 m!432359))

(check-sat tp_is_empty!11977 (not b!448282) (not b!448289) (not start!40614) (not b!448290) (not b!448277) (not b!448288) (not b!448283) (not mapNonEmpty!19599) (not b_next!10639) (not b!448286) b_and!18621 (not b!448287))
(check-sat b_and!18621 (not b_next!10639))
