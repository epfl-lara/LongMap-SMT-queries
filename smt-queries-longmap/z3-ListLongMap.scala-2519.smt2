; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38918 () Bool)

(assert start!38918)

(declare-fun b!407095 () Bool)

(declare-fun res!235368 () Bool)

(declare-fun e!244493 () Bool)

(assert (=> b!407095 (=> (not res!235368) (not e!244493))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!24573 0))(
  ( (array!24574 (arr!11736 (Array (_ BitVec 32) (_ BitVec 64))) (size!12089 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24573)

(assert (=> b!407095 (= res!235368 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12089 _keys!709))))))

(declare-fun b!407096 () Bool)

(declare-fun e!244490 () Bool)

(assert (=> b!407096 (= e!244490 false)))

(declare-fun lt!188398 () Bool)

(declare-fun lt!188399 () array!24573)

(declare-datatypes ((List!6785 0))(
  ( (Nil!6782) (Cons!6781 (h!7637 (_ BitVec 64)) (t!11950 List!6785)) )
))
(declare-fun arrayNoDuplicates!0 (array!24573 (_ BitVec 32) List!6785) Bool)

(assert (=> b!407096 (= lt!188398 (arrayNoDuplicates!0 lt!188399 #b00000000000000000000000000000000 Nil!6782))))

(declare-fun b!407097 () Bool)

(declare-fun res!235361 () Bool)

(assert (=> b!407097 (=> (not res!235361) (not e!244493))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24573 (_ BitVec 32)) Bool)

(assert (=> b!407097 (= res!235361 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!407098 () Bool)

(declare-fun res!235366 () Bool)

(assert (=> b!407098 (=> (not res!235366) (not e!244493))))

(assert (=> b!407098 (= res!235366 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6782))))

(declare-fun b!407099 () Bool)

(declare-fun e!244491 () Bool)

(declare-fun e!244492 () Bool)

(declare-fun mapRes!17148 () Bool)

(assert (=> b!407099 (= e!244491 (and e!244492 mapRes!17148))))

(declare-fun condMapEmpty!17148 () Bool)

(declare-datatypes ((V!14907 0))(
  ( (V!14908 (val!5220 Int)) )
))
(declare-datatypes ((ValueCell!4832 0))(
  ( (ValueCellFull!4832 (v!7461 V!14907)) (EmptyCell!4832) )
))
(declare-datatypes ((array!24575 0))(
  ( (array!24576 (arr!11737 (Array (_ BitVec 32) ValueCell!4832)) (size!12090 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24575)

(declare-fun mapDefault!17148 () ValueCell!4832)

(assert (=> b!407099 (= condMapEmpty!17148 (= (arr!11737 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4832)) mapDefault!17148)))))

(declare-fun b!407100 () Bool)

(declare-fun res!235359 () Bool)

(assert (=> b!407100 (=> (not res!235359) (not e!244493))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24573 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!407100 (= res!235359 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!407101 () Bool)

(declare-fun res!235363 () Bool)

(assert (=> b!407101 (=> (not res!235363) (not e!244493))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!407101 (= res!235363 (and (= (size!12090 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12089 _keys!709) (size!12090 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!17148 () Bool)

(assert (=> mapIsEmpty!17148 mapRes!17148))

(declare-fun b!407103 () Bool)

(declare-fun res!235367 () Bool)

(assert (=> b!407103 (=> (not res!235367) (not e!244493))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!407103 (= res!235367 (validMask!0 mask!1025))))

(declare-fun mapNonEmpty!17148 () Bool)

(declare-fun tp!33267 () Bool)

(declare-fun e!244489 () Bool)

(assert (=> mapNonEmpty!17148 (= mapRes!17148 (and tp!33267 e!244489))))

(declare-fun mapRest!17148 () (Array (_ BitVec 32) ValueCell!4832))

(declare-fun mapValue!17148 () ValueCell!4832)

(declare-fun mapKey!17148 () (_ BitVec 32))

(assert (=> mapNonEmpty!17148 (= (arr!11737 _values!549) (store mapRest!17148 mapKey!17148 mapValue!17148))))

(declare-fun b!407104 () Bool)

(declare-fun tp_is_empty!10351 () Bool)

(assert (=> b!407104 (= e!244489 tp_is_empty!10351)))

(declare-fun b!407105 () Bool)

(assert (=> b!407105 (= e!244493 e!244490)))

(declare-fun res!235362 () Bool)

(assert (=> b!407105 (=> (not res!235362) (not e!244490))))

(assert (=> b!407105 (= res!235362 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188399 mask!1025))))

(assert (=> b!407105 (= lt!188399 (array!24574 (store (arr!11736 _keys!709) i!563 k0!794) (size!12089 _keys!709)))))

(declare-fun res!235365 () Bool)

(assert (=> start!38918 (=> (not res!235365) (not e!244493))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38918 (= res!235365 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12089 _keys!709))))))

(assert (=> start!38918 e!244493))

(assert (=> start!38918 true))

(declare-fun array_inv!8606 (array!24575) Bool)

(assert (=> start!38918 (and (array_inv!8606 _values!549) e!244491)))

(declare-fun array_inv!8607 (array!24573) Bool)

(assert (=> start!38918 (array_inv!8607 _keys!709)))

(declare-fun b!407102 () Bool)

(declare-fun res!235360 () Bool)

(assert (=> b!407102 (=> (not res!235360) (not e!244493))))

(assert (=> b!407102 (= res!235360 (or (= (select (arr!11736 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11736 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!407106 () Bool)

(assert (=> b!407106 (= e!244492 tp_is_empty!10351)))

(declare-fun b!407107 () Bool)

(declare-fun res!235364 () Bool)

(assert (=> b!407107 (=> (not res!235364) (not e!244493))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!407107 (= res!235364 (validKeyInArray!0 k0!794))))

(assert (= (and start!38918 res!235365) b!407103))

(assert (= (and b!407103 res!235367) b!407101))

(assert (= (and b!407101 res!235363) b!407097))

(assert (= (and b!407097 res!235361) b!407098))

(assert (= (and b!407098 res!235366) b!407095))

(assert (= (and b!407095 res!235368) b!407107))

(assert (= (and b!407107 res!235364) b!407102))

(assert (= (and b!407102 res!235360) b!407100))

(assert (= (and b!407100 res!235359) b!407105))

(assert (= (and b!407105 res!235362) b!407096))

(assert (= (and b!407099 condMapEmpty!17148) mapIsEmpty!17148))

(assert (= (and b!407099 (not condMapEmpty!17148)) mapNonEmpty!17148))

(get-info :version)

(assert (= (and mapNonEmpty!17148 ((_ is ValueCellFull!4832) mapValue!17148)) b!407104))

(assert (= (and b!407099 ((_ is ValueCellFull!4832) mapDefault!17148)) b!407106))

(assert (= start!38918 b!407099))

(declare-fun m!398355 () Bool)

(assert (=> b!407097 m!398355))

(declare-fun m!398357 () Bool)

(assert (=> b!407096 m!398357))

(declare-fun m!398359 () Bool)

(assert (=> b!407105 m!398359))

(declare-fun m!398361 () Bool)

(assert (=> b!407105 m!398361))

(declare-fun m!398363 () Bool)

(assert (=> start!38918 m!398363))

(declare-fun m!398365 () Bool)

(assert (=> start!38918 m!398365))

(declare-fun m!398367 () Bool)

(assert (=> b!407107 m!398367))

(declare-fun m!398369 () Bool)

(assert (=> b!407100 m!398369))

(declare-fun m!398371 () Bool)

(assert (=> b!407102 m!398371))

(declare-fun m!398373 () Bool)

(assert (=> mapNonEmpty!17148 m!398373))

(declare-fun m!398375 () Bool)

(assert (=> b!407103 m!398375))

(declare-fun m!398377 () Bool)

(assert (=> b!407098 m!398377))

(check-sat (not b!407098) (not b!407096) (not b!407097) (not b!407105) tp_is_empty!10351 (not start!38918) (not mapNonEmpty!17148) (not b!407103) (not b!407100) (not b!407107))
(check-sat)
