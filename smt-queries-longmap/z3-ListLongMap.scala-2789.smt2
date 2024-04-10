; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40624 () Bool)

(assert start!40624)

(declare-fun b_free!10635 () Bool)

(declare-fun b_next!10635 () Bool)

(assert (=> start!40624 (= b_free!10635 (not b_next!10635))))

(declare-fun tp!37724 () Bool)

(declare-fun b_and!18643 () Bool)

(assert (=> start!40624 (= tp!37724 b_and!18643)))

(declare-fun b!448457 () Bool)

(declare-fun e!263138 () Bool)

(assert (=> b!448457 (= e!263138 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((V!17069 0))(
  ( (V!17070 (val!6031 Int)) )
))
(declare-fun minValue!515 () V!17069)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!7912 0))(
  ( (tuple2!7913 (_1!3967 (_ BitVec 64)) (_2!3967 V!17069)) )
))
(declare-datatypes ((List!7976 0))(
  ( (Nil!7973) (Cons!7972 (h!8828 tuple2!7912) (t!13738 List!7976)) )
))
(declare-datatypes ((ListLongMap!6825 0))(
  ( (ListLongMap!6826 (toList!3428 List!7976)) )
))
(declare-fun lt!204171 () ListLongMap!6825)

(declare-datatypes ((ValueCell!5643 0))(
  ( (ValueCellFull!5643 (v!8286 V!17069)) (EmptyCell!5643) )
))
(declare-datatypes ((array!27753 0))(
  ( (array!27754 (arr!13322 (Array (_ BitVec 32) ValueCell!5643)) (size!13674 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27753)

(declare-fun zeroValue!515 () V!17069)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun v!412 () V!17069)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((array!27755 0))(
  ( (array!27756 (arr!13323 (Array (_ BitVec 32) (_ BitVec 64))) (size!13675 (_ BitVec 32))) )
))
(declare-fun lt!204169 () array!27755)

(declare-fun getCurrentListMapNoExtraKeys!1614 (array!27755 array!27753 (_ BitVec 32) (_ BitVec 32) V!17069 V!17069 (_ BitVec 32) Int) ListLongMap!6825)

(assert (=> b!448457 (= lt!204171 (getCurrentListMapNoExtraKeys!1614 lt!204169 (array!27754 (store (arr!13322 _values!549) i!563 (ValueCellFull!5643 v!412)) (size!13674 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!204170 () ListLongMap!6825)

(declare-fun _keys!709 () array!27755)

(assert (=> b!448457 (= lt!204170 (getCurrentListMapNoExtraKeys!1614 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!448458 () Bool)

(declare-fun res!266549 () Bool)

(declare-fun e!263134 () Bool)

(assert (=> b!448458 (=> (not res!266549) (not e!263134))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27755 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!448458 (= res!266549 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!448459 () Bool)

(declare-fun e!263133 () Bool)

(declare-fun tp_is_empty!11973 () Bool)

(assert (=> b!448459 (= e!263133 tp_is_empty!11973)))

(declare-fun mapNonEmpty!19593 () Bool)

(declare-fun mapRes!19593 () Bool)

(declare-fun tp!37725 () Bool)

(assert (=> mapNonEmpty!19593 (= mapRes!19593 (and tp!37725 e!263133))))

(declare-fun mapKey!19593 () (_ BitVec 32))

(declare-fun mapRest!19593 () (Array (_ BitVec 32) ValueCell!5643))

(declare-fun mapValue!19593 () ValueCell!5643)

(assert (=> mapNonEmpty!19593 (= (arr!13322 _values!549) (store mapRest!19593 mapKey!19593 mapValue!19593))))

(declare-fun b!448461 () Bool)

(declare-fun res!266548 () Bool)

(assert (=> b!448461 (=> (not res!266548) (not e!263138))))

(declare-datatypes ((List!7977 0))(
  ( (Nil!7974) (Cons!7973 (h!8829 (_ BitVec 64)) (t!13739 List!7977)) )
))
(declare-fun arrayNoDuplicates!0 (array!27755 (_ BitVec 32) List!7977) Bool)

(assert (=> b!448461 (= res!266548 (arrayNoDuplicates!0 lt!204169 #b00000000000000000000000000000000 Nil!7974))))

(declare-fun b!448462 () Bool)

(declare-fun res!266552 () Bool)

(assert (=> b!448462 (=> (not res!266552) (not e!263134))))

(assert (=> b!448462 (= res!266552 (and (= (size!13674 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13675 _keys!709) (size!13674 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!448463 () Bool)

(assert (=> b!448463 (= e!263134 e!263138)))

(declare-fun res!266553 () Bool)

(assert (=> b!448463 (=> (not res!266553) (not e!263138))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27755 (_ BitVec 32)) Bool)

(assert (=> b!448463 (= res!266553 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204169 mask!1025))))

(assert (=> b!448463 (= lt!204169 (array!27756 (store (arr!13323 _keys!709) i!563 k0!794) (size!13675 _keys!709)))))

(declare-fun mapIsEmpty!19593 () Bool)

(assert (=> mapIsEmpty!19593 mapRes!19593))

(declare-fun b!448464 () Bool)

(declare-fun res!266558 () Bool)

(assert (=> b!448464 (=> (not res!266558) (not e!263134))))

(assert (=> b!448464 (= res!266558 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7974))))

(declare-fun res!266550 () Bool)

(assert (=> start!40624 (=> (not res!266550) (not e!263134))))

(assert (=> start!40624 (= res!266550 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13675 _keys!709))))))

(assert (=> start!40624 e!263134))

(assert (=> start!40624 tp_is_empty!11973))

(assert (=> start!40624 tp!37724))

(assert (=> start!40624 true))

(declare-fun e!263137 () Bool)

(declare-fun array_inv!9652 (array!27753) Bool)

(assert (=> start!40624 (and (array_inv!9652 _values!549) e!263137)))

(declare-fun array_inv!9653 (array!27755) Bool)

(assert (=> start!40624 (array_inv!9653 _keys!709)))

(declare-fun b!448460 () Bool)

(declare-fun res!266556 () Bool)

(assert (=> b!448460 (=> (not res!266556) (not e!263134))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!448460 (= res!266556 (validMask!0 mask!1025))))

(declare-fun b!448465 () Bool)

(declare-fun res!266551 () Bool)

(assert (=> b!448465 (=> (not res!266551) (not e!263134))))

(assert (=> b!448465 (= res!266551 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13675 _keys!709))))))

(declare-fun b!448466 () Bool)

(declare-fun e!263135 () Bool)

(assert (=> b!448466 (= e!263135 tp_is_empty!11973)))

(declare-fun b!448467 () Bool)

(declare-fun res!266559 () Bool)

(assert (=> b!448467 (=> (not res!266559) (not e!263138))))

(assert (=> b!448467 (= res!266559 (bvsle from!863 i!563))))

(declare-fun b!448468 () Bool)

(assert (=> b!448468 (= e!263137 (and e!263135 mapRes!19593))))

(declare-fun condMapEmpty!19593 () Bool)

(declare-fun mapDefault!19593 () ValueCell!5643)

(assert (=> b!448468 (= condMapEmpty!19593 (= (arr!13322 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5643)) mapDefault!19593)))))

(declare-fun b!448469 () Bool)

(declare-fun res!266555 () Bool)

(assert (=> b!448469 (=> (not res!266555) (not e!263134))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!448469 (= res!266555 (validKeyInArray!0 k0!794))))

(declare-fun b!448470 () Bool)

(declare-fun res!266557 () Bool)

(assert (=> b!448470 (=> (not res!266557) (not e!263134))))

(assert (=> b!448470 (= res!266557 (or (= (select (arr!13323 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13323 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!448471 () Bool)

(declare-fun res!266554 () Bool)

(assert (=> b!448471 (=> (not res!266554) (not e!263134))))

(assert (=> b!448471 (= res!266554 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(assert (= (and start!40624 res!266550) b!448460))

(assert (= (and b!448460 res!266556) b!448462))

(assert (= (and b!448462 res!266552) b!448471))

(assert (= (and b!448471 res!266554) b!448464))

(assert (= (and b!448464 res!266558) b!448465))

(assert (= (and b!448465 res!266551) b!448469))

(assert (= (and b!448469 res!266555) b!448470))

(assert (= (and b!448470 res!266557) b!448458))

(assert (= (and b!448458 res!266549) b!448463))

(assert (= (and b!448463 res!266553) b!448461))

(assert (= (and b!448461 res!266548) b!448467))

(assert (= (and b!448467 res!266559) b!448457))

(assert (= (and b!448468 condMapEmpty!19593) mapIsEmpty!19593))

(assert (= (and b!448468 (not condMapEmpty!19593)) mapNonEmpty!19593))

(get-info :version)

(assert (= (and mapNonEmpty!19593 ((_ is ValueCellFull!5643) mapValue!19593)) b!448459))

(assert (= (and b!448468 ((_ is ValueCellFull!5643) mapDefault!19593)) b!448466))

(assert (= start!40624 b!448468))

(declare-fun m!433003 () Bool)

(assert (=> b!448464 m!433003))

(declare-fun m!433005 () Bool)

(assert (=> start!40624 m!433005))

(declare-fun m!433007 () Bool)

(assert (=> start!40624 m!433007))

(declare-fun m!433009 () Bool)

(assert (=> mapNonEmpty!19593 m!433009))

(declare-fun m!433011 () Bool)

(assert (=> b!448470 m!433011))

(declare-fun m!433013 () Bool)

(assert (=> b!448469 m!433013))

(declare-fun m!433015 () Bool)

(assert (=> b!448463 m!433015))

(declare-fun m!433017 () Bool)

(assert (=> b!448463 m!433017))

(declare-fun m!433019 () Bool)

(assert (=> b!448461 m!433019))

(declare-fun m!433021 () Bool)

(assert (=> b!448471 m!433021))

(declare-fun m!433023 () Bool)

(assert (=> b!448460 m!433023))

(declare-fun m!433025 () Bool)

(assert (=> b!448458 m!433025))

(declare-fun m!433027 () Bool)

(assert (=> b!448457 m!433027))

(declare-fun m!433029 () Bool)

(assert (=> b!448457 m!433029))

(declare-fun m!433031 () Bool)

(assert (=> b!448457 m!433031))

(check-sat (not start!40624) (not b_next!10635) (not b!448464) (not b!448460) (not b!448457) tp_is_empty!11973 b_and!18643 (not b!448471) (not mapNonEmpty!19593) (not b!448469) (not b!448461) (not b!448463) (not b!448458))
(check-sat b_and!18643 (not b_next!10635))
