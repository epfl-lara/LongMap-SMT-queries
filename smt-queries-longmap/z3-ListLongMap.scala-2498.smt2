; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38808 () Bool)

(assert start!38808)

(declare-fun b!404948 () Bool)

(declare-fun e!243551 () Bool)

(declare-fun e!243548 () Bool)

(declare-fun mapRes!16962 () Bool)

(assert (=> b!404948 (= e!243551 (and e!243548 mapRes!16962))))

(declare-fun condMapEmpty!16962 () Bool)

(declare-datatypes ((V!14741 0))(
  ( (V!14742 (val!5158 Int)) )
))
(declare-datatypes ((ValueCell!4770 0))(
  ( (ValueCellFull!4770 (v!7405 V!14741)) (EmptyCell!4770) )
))
(declare-datatypes ((array!24349 0))(
  ( (array!24350 (arr!11624 (Array (_ BitVec 32) ValueCell!4770)) (size!11976 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24349)

(declare-fun mapDefault!16962 () ValueCell!4770)

(assert (=> b!404948 (= condMapEmpty!16962 (= (arr!11624 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4770)) mapDefault!16962)))))

(declare-fun b!404949 () Bool)

(declare-fun res!233635 () Bool)

(declare-fun e!243550 () Bool)

(assert (=> b!404949 (=> (not res!233635) (not e!243550))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!24351 0))(
  ( (array!24352 (arr!11625 (Array (_ BitVec 32) (_ BitVec 64))) (size!11977 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24351)

(assert (=> b!404949 (= res!233635 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11977 _keys!709))))))

(declare-fun b!404950 () Bool)

(declare-fun res!233636 () Bool)

(assert (=> b!404950 (=> (not res!233636) (not e!243550))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!404950 (= res!233636 (validKeyInArray!0 k0!794))))

(declare-fun b!404951 () Bool)

(declare-fun e!243547 () Bool)

(assert (=> b!404951 (= e!243550 e!243547)))

(declare-fun res!233632 () Bool)

(assert (=> b!404951 (=> (not res!233632) (not e!243547))))

(declare-fun lt!188260 () array!24351)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24351 (_ BitVec 32)) Bool)

(assert (=> b!404951 (= res!233632 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188260 mask!1025))))

(assert (=> b!404951 (= lt!188260 (array!24352 (store (arr!11625 _keys!709) i!563 k0!794) (size!11977 _keys!709)))))

(declare-fun b!404952 () Bool)

(declare-fun res!233628 () Bool)

(assert (=> b!404952 (=> (not res!233628) (not e!243550))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!404952 (= res!233628 (validMask!0 mask!1025))))

(declare-fun b!404953 () Bool)

(declare-fun e!243549 () Bool)

(declare-fun tp_is_empty!10227 () Bool)

(assert (=> b!404953 (= e!243549 tp_is_empty!10227)))

(declare-fun b!404954 () Bool)

(declare-fun res!233633 () Bool)

(assert (=> b!404954 (=> (not res!233633) (not e!243550))))

(assert (=> b!404954 (= res!233633 (or (= (select (arr!11625 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11625 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!404955 () Bool)

(declare-fun res!233631 () Bool)

(assert (=> b!404955 (=> (not res!233631) (not e!243550))))

(declare-datatypes ((List!6765 0))(
  ( (Nil!6762) (Cons!6761 (h!7617 (_ BitVec 64)) (t!11939 List!6765)) )
))
(declare-fun arrayNoDuplicates!0 (array!24351 (_ BitVec 32) List!6765) Bool)

(assert (=> b!404955 (= res!233631 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6762))))

(declare-fun b!404956 () Bool)

(assert (=> b!404956 (= e!243547 false)))

(declare-fun lt!188261 () Bool)

(assert (=> b!404956 (= lt!188261 (arrayNoDuplicates!0 lt!188260 #b00000000000000000000000000000000 Nil!6762))))

(declare-fun b!404957 () Bool)

(assert (=> b!404957 (= e!243548 tp_is_empty!10227)))

(declare-fun res!233630 () Bool)

(assert (=> start!38808 (=> (not res!233630) (not e!243550))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38808 (= res!233630 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11977 _keys!709))))))

(assert (=> start!38808 e!243550))

(assert (=> start!38808 true))

(declare-fun array_inv!8500 (array!24349) Bool)

(assert (=> start!38808 (and (array_inv!8500 _values!549) e!243551)))

(declare-fun array_inv!8501 (array!24351) Bool)

(assert (=> start!38808 (array_inv!8501 _keys!709)))

(declare-fun mapIsEmpty!16962 () Bool)

(assert (=> mapIsEmpty!16962 mapRes!16962))

(declare-fun mapNonEmpty!16962 () Bool)

(declare-fun tp!33081 () Bool)

(assert (=> mapNonEmpty!16962 (= mapRes!16962 (and tp!33081 e!243549))))

(declare-fun mapKey!16962 () (_ BitVec 32))

(declare-fun mapRest!16962 () (Array (_ BitVec 32) ValueCell!4770))

(declare-fun mapValue!16962 () ValueCell!4770)

(assert (=> mapNonEmpty!16962 (= (arr!11624 _values!549) (store mapRest!16962 mapKey!16962 mapValue!16962))))

(declare-fun b!404958 () Bool)

(declare-fun res!233629 () Bool)

(assert (=> b!404958 (=> (not res!233629) (not e!243550))))

(declare-fun arrayContainsKey!0 (array!24351 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!404958 (= res!233629 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!404959 () Bool)

(declare-fun res!233634 () Bool)

(assert (=> b!404959 (=> (not res!233634) (not e!243550))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!404959 (= res!233634 (and (= (size!11976 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11977 _keys!709) (size!11976 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!404960 () Bool)

(declare-fun res!233637 () Bool)

(assert (=> b!404960 (=> (not res!233637) (not e!243550))))

(assert (=> b!404960 (= res!233637 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(assert (= (and start!38808 res!233630) b!404952))

(assert (= (and b!404952 res!233628) b!404959))

(assert (= (and b!404959 res!233634) b!404960))

(assert (= (and b!404960 res!233637) b!404955))

(assert (= (and b!404955 res!233631) b!404949))

(assert (= (and b!404949 res!233635) b!404950))

(assert (= (and b!404950 res!233636) b!404954))

(assert (= (and b!404954 res!233633) b!404958))

(assert (= (and b!404958 res!233629) b!404951))

(assert (= (and b!404951 res!233632) b!404956))

(assert (= (and b!404948 condMapEmpty!16962) mapIsEmpty!16962))

(assert (= (and b!404948 (not condMapEmpty!16962)) mapNonEmpty!16962))

(get-info :version)

(assert (= (and mapNonEmpty!16962 ((_ is ValueCellFull!4770) mapValue!16962)) b!404953))

(assert (= (and b!404948 ((_ is ValueCellFull!4770) mapDefault!16962)) b!404957))

(assert (= start!38808 b!404948))

(declare-fun m!397591 () Bool)

(assert (=> b!404954 m!397591))

(declare-fun m!397593 () Bool)

(assert (=> b!404950 m!397593))

(declare-fun m!397595 () Bool)

(assert (=> b!404958 m!397595))

(declare-fun m!397597 () Bool)

(assert (=> b!404956 m!397597))

(declare-fun m!397599 () Bool)

(assert (=> b!404955 m!397599))

(declare-fun m!397601 () Bool)

(assert (=> b!404951 m!397601))

(declare-fun m!397603 () Bool)

(assert (=> b!404951 m!397603))

(declare-fun m!397605 () Bool)

(assert (=> mapNonEmpty!16962 m!397605))

(declare-fun m!397607 () Bool)

(assert (=> start!38808 m!397607))

(declare-fun m!397609 () Bool)

(assert (=> start!38808 m!397609))

(declare-fun m!397611 () Bool)

(assert (=> b!404960 m!397611))

(declare-fun m!397613 () Bool)

(assert (=> b!404952 m!397613))

(check-sat (not b!404956) (not b!404958) tp_is_empty!10227 (not b!404951) (not b!404950) (not mapNonEmpty!16962) (not b!404955) (not b!404960) (not start!38808) (not b!404952))
(check-sat)
