; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38918 () Bool)

(assert start!38918)

(declare-fun b!407317 () Bool)

(declare-fun e!244631 () Bool)

(assert (=> b!407317 (= e!244631 false)))

(declare-fun lt!188652 () Bool)

(declare-datatypes ((array!24580 0))(
  ( (array!24581 (arr!11739 (Array (_ BitVec 32) (_ BitVec 64))) (size!12091 (_ BitVec 32))) )
))
(declare-fun lt!188651 () array!24580)

(declare-datatypes ((List!6687 0))(
  ( (Nil!6684) (Cons!6683 (h!7539 (_ BitVec 64)) (t!11853 List!6687)) )
))
(declare-fun arrayNoDuplicates!0 (array!24580 (_ BitVec 32) List!6687) Bool)

(assert (=> b!407317 (= lt!188652 (arrayNoDuplicates!0 lt!188651 #b00000000000000000000000000000000 Nil!6684))))

(declare-fun b!407318 () Bool)

(declare-fun res!235490 () Bool)

(declare-fun e!244636 () Bool)

(assert (=> b!407318 (=> (not res!235490) (not e!244636))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!407318 (= res!235490 (validMask!0 mask!1025))))

(declare-fun res!235485 () Bool)

(assert (=> start!38918 (=> (not res!235485) (not e!244636))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun _keys!709 () array!24580)

(assert (=> start!38918 (= res!235485 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12091 _keys!709))))))

(assert (=> start!38918 e!244636))

(assert (=> start!38918 true))

(declare-datatypes ((V!14907 0))(
  ( (V!14908 (val!5220 Int)) )
))
(declare-datatypes ((ValueCell!4832 0))(
  ( (ValueCellFull!4832 (v!7468 V!14907)) (EmptyCell!4832) )
))
(declare-datatypes ((array!24582 0))(
  ( (array!24583 (arr!11740 (Array (_ BitVec 32) ValueCell!4832)) (size!12092 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24582)

(declare-fun e!244635 () Bool)

(declare-fun array_inv!8650 (array!24582) Bool)

(assert (=> start!38918 (and (array_inv!8650 _values!549) e!244635)))

(declare-fun array_inv!8651 (array!24580) Bool)

(assert (=> start!38918 (array_inv!8651 _keys!709)))

(declare-fun mapNonEmpty!17148 () Bool)

(declare-fun mapRes!17148 () Bool)

(declare-fun tp!33267 () Bool)

(declare-fun e!244633 () Bool)

(assert (=> mapNonEmpty!17148 (= mapRes!17148 (and tp!33267 e!244633))))

(declare-fun mapRest!17148 () (Array (_ BitVec 32) ValueCell!4832))

(declare-fun mapKey!17148 () (_ BitVec 32))

(declare-fun mapValue!17148 () ValueCell!4832)

(assert (=> mapNonEmpty!17148 (= (arr!11740 _values!549) (store mapRest!17148 mapKey!17148 mapValue!17148))))

(declare-fun b!407319 () Bool)

(declare-fun res!235489 () Bool)

(assert (=> b!407319 (=> (not res!235489) (not e!244636))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!407319 (= res!235489 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12091 _keys!709))))))

(declare-fun b!407320 () Bool)

(declare-fun res!235488 () Bool)

(assert (=> b!407320 (=> (not res!235488) (not e!244636))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!407320 (= res!235488 (validKeyInArray!0 k0!794))))

(declare-fun b!407321 () Bool)

(declare-fun res!235491 () Bool)

(assert (=> b!407321 (=> (not res!235491) (not e!244636))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24580 (_ BitVec 32)) Bool)

(assert (=> b!407321 (= res!235491 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!407322 () Bool)

(declare-fun e!244634 () Bool)

(assert (=> b!407322 (= e!244635 (and e!244634 mapRes!17148))))

(declare-fun condMapEmpty!17148 () Bool)

(declare-fun mapDefault!17148 () ValueCell!4832)

(assert (=> b!407322 (= condMapEmpty!17148 (= (arr!11740 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4832)) mapDefault!17148)))))

(declare-fun b!407323 () Bool)

(declare-fun tp_is_empty!10351 () Bool)

(assert (=> b!407323 (= e!244633 tp_is_empty!10351)))

(declare-fun b!407324 () Bool)

(declare-fun res!235487 () Bool)

(assert (=> b!407324 (=> (not res!235487) (not e!244636))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!407324 (= res!235487 (and (= (size!12092 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12091 _keys!709) (size!12092 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!407325 () Bool)

(assert (=> b!407325 (= e!244634 tp_is_empty!10351)))

(declare-fun b!407326 () Bool)

(declare-fun res!235494 () Bool)

(assert (=> b!407326 (=> (not res!235494) (not e!244636))))

(declare-fun arrayContainsKey!0 (array!24580 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!407326 (= res!235494 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!407327 () Bool)

(assert (=> b!407327 (= e!244636 e!244631)))

(declare-fun res!235486 () Bool)

(assert (=> b!407327 (=> (not res!235486) (not e!244631))))

(assert (=> b!407327 (= res!235486 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188651 mask!1025))))

(assert (=> b!407327 (= lt!188651 (array!24581 (store (arr!11739 _keys!709) i!563 k0!794) (size!12091 _keys!709)))))

(declare-fun b!407328 () Bool)

(declare-fun res!235493 () Bool)

(assert (=> b!407328 (=> (not res!235493) (not e!244636))))

(assert (=> b!407328 (= res!235493 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6684))))

(declare-fun b!407329 () Bool)

(declare-fun res!235492 () Bool)

(assert (=> b!407329 (=> (not res!235492) (not e!244636))))

(assert (=> b!407329 (= res!235492 (or (= (select (arr!11739 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11739 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!17148 () Bool)

(assert (=> mapIsEmpty!17148 mapRes!17148))

(assert (= (and start!38918 res!235485) b!407318))

(assert (= (and b!407318 res!235490) b!407324))

(assert (= (and b!407324 res!235487) b!407321))

(assert (= (and b!407321 res!235491) b!407328))

(assert (= (and b!407328 res!235493) b!407319))

(assert (= (and b!407319 res!235489) b!407320))

(assert (= (and b!407320 res!235488) b!407329))

(assert (= (and b!407329 res!235492) b!407326))

(assert (= (and b!407326 res!235494) b!407327))

(assert (= (and b!407327 res!235486) b!407317))

(assert (= (and b!407322 condMapEmpty!17148) mapIsEmpty!17148))

(assert (= (and b!407322 (not condMapEmpty!17148)) mapNonEmpty!17148))

(get-info :version)

(assert (= (and mapNonEmpty!17148 ((_ is ValueCellFull!4832) mapValue!17148)) b!407323))

(assert (= (and b!407322 ((_ is ValueCellFull!4832) mapDefault!17148)) b!407325))

(assert (= start!38918 b!407322))

(declare-fun m!399309 () Bool)

(assert (=> b!407321 m!399309))

(declare-fun m!399311 () Bool)

(assert (=> b!407320 m!399311))

(declare-fun m!399313 () Bool)

(assert (=> start!38918 m!399313))

(declare-fun m!399315 () Bool)

(assert (=> start!38918 m!399315))

(declare-fun m!399317 () Bool)

(assert (=> b!407329 m!399317))

(declare-fun m!399319 () Bool)

(assert (=> b!407317 m!399319))

(declare-fun m!399321 () Bool)

(assert (=> b!407326 m!399321))

(declare-fun m!399323 () Bool)

(assert (=> b!407328 m!399323))

(declare-fun m!399325 () Bool)

(assert (=> mapNonEmpty!17148 m!399325))

(declare-fun m!399327 () Bool)

(assert (=> b!407318 m!399327))

(declare-fun m!399329 () Bool)

(assert (=> b!407327 m!399329))

(declare-fun m!399331 () Bool)

(assert (=> b!407327 m!399331))

(check-sat (not b!407327) (not b!407318) (not b!407317) tp_is_empty!10351 (not mapNonEmpty!17148) (not b!407321) (not start!38918) (not b!407320) (not b!407328) (not b!407326))
(check-sat)
