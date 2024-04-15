; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40620 () Bool)

(assert start!40620)

(declare-fun b_free!10645 () Bool)

(declare-fun b_next!10645 () Bool)

(assert (=> start!40620 (= b_free!10645 (not b_next!10645))))

(declare-fun tp!37754 () Bool)

(declare-fun b_and!18627 () Bool)

(assert (=> start!40620 (= tp!37754 b_and!18627)))

(declare-fun b!448411 () Bool)

(declare-fun e!263052 () Bool)

(declare-fun e!263049 () Bool)

(assert (=> b!448411 (= e!263052 e!263049)))

(declare-fun res!266599 () Bool)

(assert (=> b!448411 (=> (not res!266599) (not e!263049))))

(declare-datatypes ((array!27771 0))(
  ( (array!27772 (arr!13331 (Array (_ BitVec 32) (_ BitVec 64))) (size!13684 (_ BitVec 32))) )
))
(declare-fun lt!203980 () array!27771)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27771 (_ BitVec 32)) Bool)

(assert (=> b!448411 (= res!266599 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203980 mask!1025))))

(declare-fun _keys!709 () array!27771)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!448411 (= lt!203980 (array!27772 (store (arr!13331 _keys!709) i!563 k0!794) (size!13684 _keys!709)))))

(declare-fun b!448412 () Bool)

(declare-fun res!266610 () Bool)

(assert (=> b!448412 (=> (not res!266610) (not e!263049))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!448412 (= res!266610 (bvsle from!863 i!563))))

(declare-fun b!448413 () Bool)

(declare-fun e!263054 () Bool)

(declare-fun e!263050 () Bool)

(declare-fun mapRes!19608 () Bool)

(assert (=> b!448413 (= e!263054 (and e!263050 mapRes!19608))))

(declare-fun condMapEmpty!19608 () Bool)

(declare-datatypes ((V!17083 0))(
  ( (V!17084 (val!6036 Int)) )
))
(declare-datatypes ((ValueCell!5648 0))(
  ( (ValueCellFull!5648 (v!8285 V!17083)) (EmptyCell!5648) )
))
(declare-datatypes ((array!27773 0))(
  ( (array!27774 (arr!13332 (Array (_ BitVec 32) ValueCell!5648)) (size!13685 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27773)

(declare-fun mapDefault!19608 () ValueCell!5648)

(assert (=> b!448413 (= condMapEmpty!19608 (= (arr!13332 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5648)) mapDefault!19608)))))

(declare-fun b!448414 () Bool)

(declare-fun res!266604 () Bool)

(assert (=> b!448414 (=> (not res!266604) (not e!263052))))

(declare-fun arrayContainsKey!0 (array!27771 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!448414 (= res!266604 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!448415 () Bool)

(declare-fun res!266607 () Bool)

(assert (=> b!448415 (=> (not res!266607) (not e!263052))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!448415 (= res!266607 (and (= (size!13685 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13684 _keys!709) (size!13685 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!448416 () Bool)

(declare-fun e!263053 () Bool)

(declare-fun tp_is_empty!11983 () Bool)

(assert (=> b!448416 (= e!263053 tp_is_empty!11983)))

(declare-fun b!448417 () Bool)

(declare-fun res!266605 () Bool)

(assert (=> b!448417 (=> (not res!266605) (not e!263052))))

(assert (=> b!448417 (= res!266605 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13684 _keys!709))))))

(declare-fun b!448418 () Bool)

(declare-fun res!266600 () Bool)

(assert (=> b!448418 (=> (not res!266600) (not e!263052))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!448418 (= res!266600 (validMask!0 mask!1025))))

(declare-fun b!448419 () Bool)

(declare-fun res!266601 () Bool)

(assert (=> b!448419 (=> (not res!266601) (not e!263052))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!448419 (= res!266601 (validKeyInArray!0 k0!794))))

(declare-fun b!448420 () Bool)

(assert (=> b!448420 (= e!263050 tp_is_empty!11983)))

(declare-fun res!266609 () Bool)

(assert (=> start!40620 (=> (not res!266609) (not e!263052))))

(assert (=> start!40620 (= res!266609 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13684 _keys!709))))))

(assert (=> start!40620 e!263052))

(assert (=> start!40620 tp_is_empty!11983))

(assert (=> start!40620 tp!37754))

(assert (=> start!40620 true))

(declare-fun array_inv!9718 (array!27773) Bool)

(assert (=> start!40620 (and (array_inv!9718 _values!549) e!263054)))

(declare-fun array_inv!9719 (array!27771) Bool)

(assert (=> start!40620 (array_inv!9719 _keys!709)))

(declare-fun mapIsEmpty!19608 () Bool)

(assert (=> mapIsEmpty!19608 mapRes!19608))

(declare-fun b!448421 () Bool)

(declare-fun res!266606 () Bool)

(assert (=> b!448421 (=> (not res!266606) (not e!263052))))

(declare-datatypes ((List!7989 0))(
  ( (Nil!7986) (Cons!7985 (h!8841 (_ BitVec 64)) (t!13742 List!7989)) )
))
(declare-fun arrayNoDuplicates!0 (array!27771 (_ BitVec 32) List!7989) Bool)

(assert (=> b!448421 (= res!266606 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7986))))

(declare-fun mapNonEmpty!19608 () Bool)

(declare-fun tp!37755 () Bool)

(assert (=> mapNonEmpty!19608 (= mapRes!19608 (and tp!37755 e!263053))))

(declare-fun mapKey!19608 () (_ BitVec 32))

(declare-fun mapValue!19608 () ValueCell!5648)

(declare-fun mapRest!19608 () (Array (_ BitVec 32) ValueCell!5648))

(assert (=> mapNonEmpty!19608 (= (arr!13332 _values!549) (store mapRest!19608 mapKey!19608 mapValue!19608))))

(declare-fun b!448422 () Bool)

(declare-fun res!266603 () Bool)

(assert (=> b!448422 (=> (not res!266603) (not e!263052))))

(assert (=> b!448422 (= res!266603 (or (= (select (arr!13331 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13331 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!448423 () Bool)

(assert (=> b!448423 (= e!263049 false)))

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!17083)

(declare-datatypes ((tuple2!7926 0))(
  ( (tuple2!7927 (_1!3974 (_ BitVec 64)) (_2!3974 V!17083)) )
))
(declare-datatypes ((List!7990 0))(
  ( (Nil!7987) (Cons!7986 (h!8842 tuple2!7926) (t!13743 List!7990)) )
))
(declare-datatypes ((ListLongMap!6829 0))(
  ( (ListLongMap!6830 (toList!3430 List!7990)) )
))
(declare-fun lt!203982 () ListLongMap!6829)

(declare-fun v!412 () V!17083)

(declare-fun minValue!515 () V!17083)

(declare-fun getCurrentListMapNoExtraKeys!1628 (array!27771 array!27773 (_ BitVec 32) (_ BitVec 32) V!17083 V!17083 (_ BitVec 32) Int) ListLongMap!6829)

(assert (=> b!448423 (= lt!203982 (getCurrentListMapNoExtraKeys!1628 lt!203980 (array!27774 (store (arr!13332 _values!549) i!563 (ValueCellFull!5648 v!412)) (size!13685 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!203981 () ListLongMap!6829)

(assert (=> b!448423 (= lt!203981 (getCurrentListMapNoExtraKeys!1628 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!448424 () Bool)

(declare-fun res!266608 () Bool)

(assert (=> b!448424 (=> (not res!266608) (not e!263049))))

(assert (=> b!448424 (= res!266608 (arrayNoDuplicates!0 lt!203980 #b00000000000000000000000000000000 Nil!7986))))

(declare-fun b!448425 () Bool)

(declare-fun res!266602 () Bool)

(assert (=> b!448425 (=> (not res!266602) (not e!263052))))

(assert (=> b!448425 (= res!266602 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(assert (= (and start!40620 res!266609) b!448418))

(assert (= (and b!448418 res!266600) b!448415))

(assert (= (and b!448415 res!266607) b!448425))

(assert (= (and b!448425 res!266602) b!448421))

(assert (= (and b!448421 res!266606) b!448417))

(assert (= (and b!448417 res!266605) b!448419))

(assert (= (and b!448419 res!266601) b!448422))

(assert (= (and b!448422 res!266603) b!448414))

(assert (= (and b!448414 res!266604) b!448411))

(assert (= (and b!448411 res!266599) b!448424))

(assert (= (and b!448424 res!266608) b!448412))

(assert (= (and b!448412 res!266610) b!448423))

(assert (= (and b!448413 condMapEmpty!19608) mapIsEmpty!19608))

(assert (= (and b!448413 (not condMapEmpty!19608)) mapNonEmpty!19608))

(get-info :version)

(assert (= (and mapNonEmpty!19608 ((_ is ValueCellFull!5648) mapValue!19608)) b!448416))

(assert (= (and b!448413 ((_ is ValueCellFull!5648) mapDefault!19608)) b!448420))

(assert (= start!40620 b!448413))

(declare-fun m!432421 () Bool)

(assert (=> b!448414 m!432421))

(declare-fun m!432423 () Bool)

(assert (=> b!448411 m!432423))

(declare-fun m!432425 () Bool)

(assert (=> b!448411 m!432425))

(declare-fun m!432427 () Bool)

(assert (=> b!448418 m!432427))

(declare-fun m!432429 () Bool)

(assert (=> b!448423 m!432429))

(declare-fun m!432431 () Bool)

(assert (=> b!448423 m!432431))

(declare-fun m!432433 () Bool)

(assert (=> b!448423 m!432433))

(declare-fun m!432435 () Bool)

(assert (=> b!448421 m!432435))

(declare-fun m!432437 () Bool)

(assert (=> mapNonEmpty!19608 m!432437))

(declare-fun m!432439 () Bool)

(assert (=> b!448422 m!432439))

(declare-fun m!432441 () Bool)

(assert (=> b!448424 m!432441))

(declare-fun m!432443 () Bool)

(assert (=> b!448419 m!432443))

(declare-fun m!432445 () Bool)

(assert (=> b!448425 m!432445))

(declare-fun m!432447 () Bool)

(assert (=> start!40620 m!432447))

(declare-fun m!432449 () Bool)

(assert (=> start!40620 m!432449))

(check-sat (not b!448425) (not start!40620) (not b!448418) (not b!448419) (not b!448411) (not b!448421) b_and!18627 (not b!448414) tp_is_empty!11983 (not b!448423) (not b_next!10645) (not mapNonEmpty!19608) (not b!448424))
(check-sat b_and!18627 (not b_next!10645))
