; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35478 () Bool)

(assert start!35478)

(declare-fun b!355425 () Bool)

(declare-fun e!217710 () Bool)

(assert (=> b!355425 (= e!217710 false)))

(declare-fun lt!165598 () Bool)

(declare-datatypes ((array!19451 0))(
  ( (array!19452 (arr!9219 (Array (_ BitVec 32) (_ BitVec 64))) (size!9572 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19451)

(declare-datatypes ((List!5314 0))(
  ( (Nil!5311) (Cons!5310 (h!6166 (_ BitVec 64)) (t!10455 List!5314)) )
))
(declare-fun arrayNoDuplicates!0 (array!19451 (_ BitVec 32) List!5314) Bool)

(assert (=> b!355425 (= lt!165598 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5311))))

(declare-fun b!355426 () Bool)

(declare-fun res!197223 () Bool)

(assert (=> b!355426 (=> (not res!197223) (not e!217710))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19451 (_ BitVec 32)) Bool)

(assert (=> b!355426 (= res!197223 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun mapNonEmpty!13425 () Bool)

(declare-fun mapRes!13425 () Bool)

(declare-fun tp!27402 () Bool)

(declare-fun e!217706 () Bool)

(assert (=> mapNonEmpty!13425 (= mapRes!13425 (and tp!27402 e!217706))))

(declare-fun mapKey!13425 () (_ BitVec 32))

(declare-datatypes ((V!11571 0))(
  ( (V!11572 (val!4017 Int)) )
))
(declare-datatypes ((ValueCell!3629 0))(
  ( (ValueCellFull!3629 (v!6205 V!11571)) (EmptyCell!3629) )
))
(declare-fun mapValue!13425 () ValueCell!3629)

(declare-fun mapRest!13425 () (Array (_ BitVec 32) ValueCell!3629))

(declare-datatypes ((array!19453 0))(
  ( (array!19454 (arr!9220 (Array (_ BitVec 32) ValueCell!3629)) (size!9573 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19453)

(assert (=> mapNonEmpty!13425 (= (arr!9220 _values!1208) (store mapRest!13425 mapKey!13425 mapValue!13425))))

(declare-fun b!355428 () Bool)

(declare-fun res!197222 () Bool)

(assert (=> b!355428 (=> (not res!197222) (not e!217710))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!355428 (= res!197222 (and (= (size!9573 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9572 _keys!1456) (size!9573 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!355429 () Bool)

(declare-fun e!217708 () Bool)

(declare-fun tp_is_empty!7945 () Bool)

(assert (=> b!355429 (= e!217708 tp_is_empty!7945)))

(declare-fun mapIsEmpty!13425 () Bool)

(assert (=> mapIsEmpty!13425 mapRes!13425))

(declare-fun b!355430 () Bool)

(declare-fun e!217709 () Bool)

(assert (=> b!355430 (= e!217709 (and e!217708 mapRes!13425))))

(declare-fun condMapEmpty!13425 () Bool)

(declare-fun mapDefault!13425 () ValueCell!3629)

(assert (=> b!355430 (= condMapEmpty!13425 (= (arr!9220 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3629)) mapDefault!13425)))))

(declare-fun res!197224 () Bool)

(assert (=> start!35478 (=> (not res!197224) (not e!217710))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35478 (= res!197224 (validMask!0 mask!1842))))

(assert (=> start!35478 e!217710))

(assert (=> start!35478 true))

(declare-fun array_inv!6820 (array!19453) Bool)

(assert (=> start!35478 (and (array_inv!6820 _values!1208) e!217709)))

(declare-fun array_inv!6821 (array!19451) Bool)

(assert (=> start!35478 (array_inv!6821 _keys!1456)))

(declare-fun b!355427 () Bool)

(assert (=> b!355427 (= e!217706 tp_is_empty!7945)))

(assert (= (and start!35478 res!197224) b!355428))

(assert (= (and b!355428 res!197222) b!355426))

(assert (= (and b!355426 res!197223) b!355425))

(assert (= (and b!355430 condMapEmpty!13425) mapIsEmpty!13425))

(assert (= (and b!355430 (not condMapEmpty!13425)) mapNonEmpty!13425))

(get-info :version)

(assert (= (and mapNonEmpty!13425 ((_ is ValueCellFull!3629) mapValue!13425)) b!355427))

(assert (= (and b!355430 ((_ is ValueCellFull!3629) mapDefault!13425)) b!355429))

(assert (= start!35478 b!355430))

(declare-fun m!353619 () Bool)

(assert (=> b!355425 m!353619))

(declare-fun m!353621 () Bool)

(assert (=> b!355426 m!353621))

(declare-fun m!353623 () Bool)

(assert (=> mapNonEmpty!13425 m!353623))

(declare-fun m!353625 () Bool)

(assert (=> start!35478 m!353625))

(declare-fun m!353627 () Bool)

(assert (=> start!35478 m!353627))

(declare-fun m!353629 () Bool)

(assert (=> start!35478 m!353629))

(check-sat (not start!35478) (not b!355426) (not mapNonEmpty!13425) tp_is_empty!7945 (not b!355425))
(check-sat)
