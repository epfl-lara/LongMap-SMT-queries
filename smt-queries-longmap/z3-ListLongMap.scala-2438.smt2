; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38432 () Bool)

(assert start!38432)

(declare-fun b!396544 () Bool)

(declare-fun res!227547 () Bool)

(declare-fun e!239936 () Bool)

(assert (=> b!396544 (=> (not res!227547) (not e!239936))))

(declare-datatypes ((array!23634 0))(
  ( (array!23635 (arr!11266 (Array (_ BitVec 32) (_ BitVec 64))) (size!11618 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23634)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!396544 (= res!227547 (or (= (select (arr!11266 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11266 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!396545 () Bool)

(declare-fun res!227553 () Bool)

(assert (=> b!396545 (=> (not res!227553) (not e!239936))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!396545 (= res!227553 (validKeyInArray!0 k0!794))))

(declare-fun b!396546 () Bool)

(declare-fun res!227548 () Bool)

(assert (=> b!396546 (=> (not res!227548) (not e!239936))))

(assert (=> b!396546 (= res!227548 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11618 _keys!709))))))

(declare-fun b!396547 () Bool)

(declare-fun e!239937 () Bool)

(assert (=> b!396547 (= e!239937 false)))

(declare-fun lt!187193 () Bool)

(declare-fun lt!187194 () array!23634)

(declare-datatypes ((List!6398 0))(
  ( (Nil!6395) (Cons!6394 (h!7250 (_ BitVec 64)) (t!11564 List!6398)) )
))
(declare-fun arrayNoDuplicates!0 (array!23634 (_ BitVec 32) List!6398) Bool)

(assert (=> b!396547 (= lt!187193 (arrayNoDuplicates!0 lt!187194 #b00000000000000000000000000000000 Nil!6395))))

(declare-fun mapNonEmpty!16419 () Bool)

(declare-fun mapRes!16419 () Bool)

(declare-fun tp!32214 () Bool)

(declare-fun e!239935 () Bool)

(assert (=> mapNonEmpty!16419 (= mapRes!16419 (and tp!32214 e!239935))))

(declare-datatypes ((V!14259 0))(
  ( (V!14260 (val!4977 Int)) )
))
(declare-datatypes ((ValueCell!4589 0))(
  ( (ValueCellFull!4589 (v!7225 V!14259)) (EmptyCell!4589) )
))
(declare-datatypes ((array!23636 0))(
  ( (array!23637 (arr!11267 (Array (_ BitVec 32) ValueCell!4589)) (size!11619 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23636)

(declare-fun mapRest!16419 () (Array (_ BitVec 32) ValueCell!4589))

(declare-fun mapKey!16419 () (_ BitVec 32))

(declare-fun mapValue!16419 () ValueCell!4589)

(assert (=> mapNonEmpty!16419 (= (arr!11267 _values!549) (store mapRest!16419 mapKey!16419 mapValue!16419))))

(declare-fun b!396548 () Bool)

(declare-fun res!227551 () Bool)

(assert (=> b!396548 (=> (not res!227551) (not e!239936))))

(declare-fun arrayContainsKey!0 (array!23634 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!396548 (= res!227551 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!396549 () Bool)

(declare-fun res!227549 () Bool)

(assert (=> b!396549 (=> (not res!227549) (not e!239936))))

(assert (=> b!396549 (= res!227549 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6395))))

(declare-fun b!396550 () Bool)

(declare-fun res!227556 () Bool)

(assert (=> b!396550 (=> (not res!227556) (not e!239936))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!396550 (= res!227556 (and (= (size!11619 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11618 _keys!709) (size!11619 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!396551 () Bool)

(declare-fun tp_is_empty!9865 () Bool)

(assert (=> b!396551 (= e!239935 tp_is_empty!9865)))

(declare-fun b!396552 () Bool)

(assert (=> b!396552 (= e!239936 e!239937)))

(declare-fun res!227555 () Bool)

(assert (=> b!396552 (=> (not res!227555) (not e!239937))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23634 (_ BitVec 32)) Bool)

(assert (=> b!396552 (= res!227555 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187194 mask!1025))))

(assert (=> b!396552 (= lt!187194 (array!23635 (store (arr!11266 _keys!709) i!563 k0!794) (size!11618 _keys!709)))))

(declare-fun mapIsEmpty!16419 () Bool)

(assert (=> mapIsEmpty!16419 mapRes!16419))

(declare-fun res!227552 () Bool)

(assert (=> start!38432 (=> (not res!227552) (not e!239936))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38432 (= res!227552 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11618 _keys!709))))))

(assert (=> start!38432 e!239936))

(assert (=> start!38432 true))

(declare-fun e!239934 () Bool)

(declare-fun array_inv!8326 (array!23636) Bool)

(assert (=> start!38432 (and (array_inv!8326 _values!549) e!239934)))

(declare-fun array_inv!8327 (array!23634) Bool)

(assert (=> start!38432 (array_inv!8327 _keys!709)))

(declare-fun b!396553 () Bool)

(declare-fun res!227550 () Bool)

(assert (=> b!396553 (=> (not res!227550) (not e!239936))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!396553 (= res!227550 (validMask!0 mask!1025))))

(declare-fun b!396554 () Bool)

(declare-fun res!227554 () Bool)

(assert (=> b!396554 (=> (not res!227554) (not e!239936))))

(assert (=> b!396554 (= res!227554 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!396555 () Bool)

(declare-fun e!239933 () Bool)

(assert (=> b!396555 (= e!239933 tp_is_empty!9865)))

(declare-fun b!396556 () Bool)

(assert (=> b!396556 (= e!239934 (and e!239933 mapRes!16419))))

(declare-fun condMapEmpty!16419 () Bool)

(declare-fun mapDefault!16419 () ValueCell!4589)

(assert (=> b!396556 (= condMapEmpty!16419 (= (arr!11267 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4589)) mapDefault!16419)))))

(assert (= (and start!38432 res!227552) b!396553))

(assert (= (and b!396553 res!227550) b!396550))

(assert (= (and b!396550 res!227556) b!396554))

(assert (= (and b!396554 res!227554) b!396549))

(assert (= (and b!396549 res!227549) b!396546))

(assert (= (and b!396546 res!227548) b!396545))

(assert (= (and b!396545 res!227553) b!396544))

(assert (= (and b!396544 res!227547) b!396548))

(assert (= (and b!396548 res!227551) b!396552))

(assert (= (and b!396552 res!227555) b!396547))

(assert (= (and b!396556 condMapEmpty!16419) mapIsEmpty!16419))

(assert (= (and b!396556 (not condMapEmpty!16419)) mapNonEmpty!16419))

(get-info :version)

(assert (= (and mapNonEmpty!16419 ((_ is ValueCellFull!4589) mapValue!16419)) b!396551))

(assert (= (and b!396556 ((_ is ValueCellFull!4589) mapDefault!16419)) b!396555))

(assert (= start!38432 b!396556))

(declare-fun m!392397 () Bool)

(assert (=> b!396553 m!392397))

(declare-fun m!392399 () Bool)

(assert (=> b!396552 m!392399))

(declare-fun m!392401 () Bool)

(assert (=> b!396552 m!392401))

(declare-fun m!392403 () Bool)

(assert (=> b!396549 m!392403))

(declare-fun m!392405 () Bool)

(assert (=> b!396545 m!392405))

(declare-fun m!392407 () Bool)

(assert (=> b!396547 m!392407))

(declare-fun m!392409 () Bool)

(assert (=> b!396554 m!392409))

(declare-fun m!392411 () Bool)

(assert (=> mapNonEmpty!16419 m!392411))

(declare-fun m!392413 () Bool)

(assert (=> b!396548 m!392413))

(declare-fun m!392415 () Bool)

(assert (=> b!396544 m!392415))

(declare-fun m!392417 () Bool)

(assert (=> start!38432 m!392417))

(declare-fun m!392419 () Bool)

(assert (=> start!38432 m!392419))

(check-sat tp_is_empty!9865 (not b!396545) (not b!396547) (not b!396549) (not b!396553) (not start!38432) (not b!396552) (not b!396554) (not mapNonEmpty!16419) (not b!396548))
(check-sat)
