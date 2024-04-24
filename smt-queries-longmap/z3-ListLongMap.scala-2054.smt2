; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35478 () Bool)

(assert start!35478)

(declare-fun mapIsEmpty!13425 () Bool)

(declare-fun mapRes!13425 () Bool)

(assert (=> mapIsEmpty!13425 mapRes!13425))

(declare-fun b!355647 () Bool)

(declare-fun e!217848 () Bool)

(declare-fun tp_is_empty!7945 () Bool)

(assert (=> b!355647 (= e!217848 tp_is_empty!7945)))

(declare-fun b!355648 () Bool)

(declare-fun e!217850 () Bool)

(assert (=> b!355648 (= e!217850 (and e!217848 mapRes!13425))))

(declare-fun condMapEmpty!13425 () Bool)

(declare-datatypes ((V!11571 0))(
  ( (V!11572 (val!4017 Int)) )
))
(declare-datatypes ((ValueCell!3629 0))(
  ( (ValueCellFull!3629 (v!6212 V!11571)) (EmptyCell!3629) )
))
(declare-datatypes ((array!19458 0))(
  ( (array!19459 (arr!9222 (Array (_ BitVec 32) ValueCell!3629)) (size!9574 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19458)

(declare-fun mapDefault!13425 () ValueCell!3629)

(assert (=> b!355648 (= condMapEmpty!13425 (= (arr!9222 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3629)) mapDefault!13425)))))

(declare-fun b!355649 () Bool)

(declare-fun res!197349 () Bool)

(declare-fun e!217852 () Bool)

(assert (=> b!355649 (=> (not res!197349) (not e!217852))))

(declare-datatypes ((array!19460 0))(
  ( (array!19461 (arr!9223 (Array (_ BitVec 32) (_ BitVec 64))) (size!9575 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19460)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19460 (_ BitVec 32)) Bool)

(assert (=> b!355649 (= res!197349 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun res!197348 () Bool)

(assert (=> start!35478 (=> (not res!197348) (not e!217852))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35478 (= res!197348 (validMask!0 mask!1842))))

(assert (=> start!35478 e!217852))

(assert (=> start!35478 true))

(declare-fun array_inv!6818 (array!19458) Bool)

(assert (=> start!35478 (and (array_inv!6818 _values!1208) e!217850)))

(declare-fun array_inv!6819 (array!19460) Bool)

(assert (=> start!35478 (array_inv!6819 _keys!1456)))

(declare-fun b!355650 () Bool)

(declare-fun res!197350 () Bool)

(assert (=> b!355650 (=> (not res!197350) (not e!217852))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!355650 (= res!197350 (and (= (size!9574 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9575 _keys!1456) (size!9574 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!355651 () Bool)

(assert (=> b!355651 (= e!217852 false)))

(declare-fun lt!165851 () Bool)

(declare-datatypes ((List!5253 0))(
  ( (Nil!5250) (Cons!5249 (h!6105 (_ BitVec 64)) (t!10395 List!5253)) )
))
(declare-fun arrayNoDuplicates!0 (array!19460 (_ BitVec 32) List!5253) Bool)

(assert (=> b!355651 (= lt!165851 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5250))))

(declare-fun mapNonEmpty!13425 () Bool)

(declare-fun tp!27402 () Bool)

(declare-fun e!217849 () Bool)

(assert (=> mapNonEmpty!13425 (= mapRes!13425 (and tp!27402 e!217849))))

(declare-fun mapValue!13425 () ValueCell!3629)

(declare-fun mapRest!13425 () (Array (_ BitVec 32) ValueCell!3629))

(declare-fun mapKey!13425 () (_ BitVec 32))

(assert (=> mapNonEmpty!13425 (= (arr!9222 _values!1208) (store mapRest!13425 mapKey!13425 mapValue!13425))))

(declare-fun b!355652 () Bool)

(assert (=> b!355652 (= e!217849 tp_is_empty!7945)))

(assert (= (and start!35478 res!197348) b!355650))

(assert (= (and b!355650 res!197350) b!355649))

(assert (= (and b!355649 res!197349) b!355651))

(assert (= (and b!355648 condMapEmpty!13425) mapIsEmpty!13425))

(assert (= (and b!355648 (not condMapEmpty!13425)) mapNonEmpty!13425))

(get-info :version)

(assert (= (and mapNonEmpty!13425 ((_ is ValueCellFull!3629) mapValue!13425)) b!355652))

(assert (= (and b!355648 ((_ is ValueCellFull!3629) mapDefault!13425)) b!355647))

(assert (= start!35478 b!355648))

(declare-fun m!354573 () Bool)

(assert (=> b!355649 m!354573))

(declare-fun m!354575 () Bool)

(assert (=> start!35478 m!354575))

(declare-fun m!354577 () Bool)

(assert (=> start!35478 m!354577))

(declare-fun m!354579 () Bool)

(assert (=> start!35478 m!354579))

(declare-fun m!354581 () Bool)

(assert (=> b!355651 m!354581))

(declare-fun m!354583 () Bool)

(assert (=> mapNonEmpty!13425 m!354583))

(check-sat tp_is_empty!7945 (not b!355649) (not start!35478) (not b!355651) (not mapNonEmpty!13425))
(check-sat)
