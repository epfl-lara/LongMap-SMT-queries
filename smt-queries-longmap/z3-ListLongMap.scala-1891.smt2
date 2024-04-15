; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33822 () Bool)

(assert start!33822)

(declare-fun b_free!7015 () Bool)

(declare-fun b_next!7015 () Bool)

(assert (=> start!33822 (= b_free!7015 (not b_next!7015))))

(declare-fun tp!24557 () Bool)

(declare-fun b_and!14175 () Bool)

(assert (=> start!33822 (= tp!24557 b_and!14175)))

(declare-fun b!336292 () Bool)

(declare-fun res!185634 () Bool)

(declare-fun e!206415 () Bool)

(assert (=> b!336292 (=> (not res!185634) (not e!206415))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10267 0))(
  ( (V!10268 (val!3528 Int)) )
))
(declare-datatypes ((ValueCell!3140 0))(
  ( (ValueCellFull!3140 (v!5687 V!10267)) (EmptyCell!3140) )
))
(declare-datatypes ((array!17513 0))(
  ( (array!17514 (arr!8284 (Array (_ BitVec 32) ValueCell!3140)) (size!8637 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17513)

(declare-datatypes ((array!17515 0))(
  ( (array!17516 (arr!8285 (Array (_ BitVec 32) (_ BitVec 64))) (size!8638 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17515)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!336292 (= res!185634 (and (= (size!8637 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8638 _keys!1895) (size!8637 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!336293 () Bool)

(declare-fun res!185639 () Bool)

(assert (=> b!336293 (=> (not res!185639) (not e!206415))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17515 (_ BitVec 32)) Bool)

(assert (=> b!336293 (= res!185639 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!336294 () Bool)

(declare-fun res!185637 () Bool)

(assert (=> b!336294 (=> (not res!185637) (not e!206415))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun zeroValue!1467 () V!10267)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10267)

(declare-datatypes ((tuple2!5074 0))(
  ( (tuple2!5075 (_1!2548 (_ BitVec 64)) (_2!2548 V!10267)) )
))
(declare-datatypes ((List!4707 0))(
  ( (Nil!4704) (Cons!4703 (h!5559 tuple2!5074) (t!9792 List!4707)) )
))
(declare-datatypes ((ListLongMap!3977 0))(
  ( (ListLongMap!3978 (toList!2004 List!4707)) )
))
(declare-fun contains!2062 (ListLongMap!3977 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1510 (array!17515 array!17513 (_ BitVec 32) (_ BitVec 32) V!10267 V!10267 (_ BitVec 32) Int) ListLongMap!3977)

(assert (=> b!336294 (= res!185637 (not (contains!2062 (getCurrentListMap!1510 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!336295 () Bool)

(declare-fun res!185636 () Bool)

(assert (=> b!336295 (=> (not res!185636) (not e!206415))))

(declare-datatypes ((List!4708 0))(
  ( (Nil!4705) (Cons!4704 (h!5560 (_ BitVec 64)) (t!9793 List!4708)) )
))
(declare-fun arrayNoDuplicates!0 (array!17515 (_ BitVec 32) List!4708) Bool)

(assert (=> b!336295 (= res!185636 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4705))))

(declare-fun mapNonEmpty!11856 () Bool)

(declare-fun mapRes!11856 () Bool)

(declare-fun tp!24558 () Bool)

(declare-fun e!206414 () Bool)

(assert (=> mapNonEmpty!11856 (= mapRes!11856 (and tp!24558 e!206414))))

(declare-fun mapValue!11856 () ValueCell!3140)

(declare-fun mapRest!11856 () (Array (_ BitVec 32) ValueCell!3140))

(declare-fun mapKey!11856 () (_ BitVec 32))

(assert (=> mapNonEmpty!11856 (= (arr!8284 _values!1525) (store mapRest!11856 mapKey!11856 mapValue!11856))))

(declare-fun res!185635 () Bool)

(assert (=> start!33822 (=> (not res!185635) (not e!206415))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33822 (= res!185635 (validMask!0 mask!2385))))

(assert (=> start!33822 e!206415))

(assert (=> start!33822 true))

(declare-fun tp_is_empty!6967 () Bool)

(assert (=> start!33822 tp_is_empty!6967))

(assert (=> start!33822 tp!24557))

(declare-fun e!206416 () Bool)

(declare-fun array_inv!6184 (array!17513) Bool)

(assert (=> start!33822 (and (array_inv!6184 _values!1525) e!206416)))

(declare-fun array_inv!6185 (array!17515) Bool)

(assert (=> start!33822 (array_inv!6185 _keys!1895)))

(declare-fun b!336296 () Bool)

(declare-fun res!185632 () Bool)

(assert (=> b!336296 (=> (not res!185632) (not e!206415))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!336296 (= res!185632 (validKeyInArray!0 k0!1348))))

(declare-fun b!336297 () Bool)

(declare-fun e!206412 () Bool)

(assert (=> b!336297 (= e!206412 tp_is_empty!6967)))

(declare-fun b!336298 () Bool)

(declare-fun res!185638 () Bool)

(declare-fun e!206411 () Bool)

(assert (=> b!336298 (=> (not res!185638) (not e!206411))))

(declare-fun arrayContainsKey!0 (array!17515 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!336298 (= res!185638 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!336299 () Bool)

(assert (=> b!336299 (= e!206411 false)))

(declare-fun lt!160041 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!17515 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!336299 (= lt!160041 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!336300 () Bool)

(assert (=> b!336300 (= e!206416 (and e!206412 mapRes!11856))))

(declare-fun condMapEmpty!11856 () Bool)

(declare-fun mapDefault!11856 () ValueCell!3140)

(assert (=> b!336300 (= condMapEmpty!11856 (= (arr!8284 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3140)) mapDefault!11856)))))

(declare-fun mapIsEmpty!11856 () Bool)

(assert (=> mapIsEmpty!11856 mapRes!11856))

(declare-fun b!336301 () Bool)

(assert (=> b!336301 (= e!206414 tp_is_empty!6967)))

(declare-fun b!336302 () Bool)

(assert (=> b!336302 (= e!206415 e!206411)))

(declare-fun res!185633 () Bool)

(assert (=> b!336302 (=> (not res!185633) (not e!206411))))

(declare-datatypes ((SeekEntryResult!3204 0))(
  ( (MissingZero!3204 (index!14995 (_ BitVec 32))) (Found!3204 (index!14996 (_ BitVec 32))) (Intermediate!3204 (undefined!4016 Bool) (index!14997 (_ BitVec 32)) (x!33539 (_ BitVec 32))) (Undefined!3204) (MissingVacant!3204 (index!14998 (_ BitVec 32))) )
))
(declare-fun lt!160040 () SeekEntryResult!3204)

(get-info :version)

(assert (=> b!336302 (= res!185633 (and (not ((_ is Found!3204) lt!160040)) ((_ is MissingZero!3204) lt!160040)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17515 (_ BitVec 32)) SeekEntryResult!3204)

(assert (=> b!336302 (= lt!160040 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(assert (= (and start!33822 res!185635) b!336292))

(assert (= (and b!336292 res!185634) b!336293))

(assert (= (and b!336293 res!185639) b!336295))

(assert (= (and b!336295 res!185636) b!336296))

(assert (= (and b!336296 res!185632) b!336294))

(assert (= (and b!336294 res!185637) b!336302))

(assert (= (and b!336302 res!185633) b!336298))

(assert (= (and b!336298 res!185638) b!336299))

(assert (= (and b!336300 condMapEmpty!11856) mapIsEmpty!11856))

(assert (= (and b!336300 (not condMapEmpty!11856)) mapNonEmpty!11856))

(assert (= (and mapNonEmpty!11856 ((_ is ValueCellFull!3140) mapValue!11856)) b!336301))

(assert (= (and b!336300 ((_ is ValueCellFull!3140) mapDefault!11856)) b!336297))

(assert (= start!33822 b!336300))

(declare-fun m!339601 () Bool)

(assert (=> b!336295 m!339601))

(declare-fun m!339603 () Bool)

(assert (=> mapNonEmpty!11856 m!339603))

(declare-fun m!339605 () Bool)

(assert (=> b!336296 m!339605))

(declare-fun m!339607 () Bool)

(assert (=> b!336299 m!339607))

(declare-fun m!339609 () Bool)

(assert (=> b!336293 m!339609))

(declare-fun m!339611 () Bool)

(assert (=> b!336294 m!339611))

(assert (=> b!336294 m!339611))

(declare-fun m!339613 () Bool)

(assert (=> b!336294 m!339613))

(declare-fun m!339615 () Bool)

(assert (=> b!336298 m!339615))

(declare-fun m!339617 () Bool)

(assert (=> b!336302 m!339617))

(declare-fun m!339619 () Bool)

(assert (=> start!33822 m!339619))

(declare-fun m!339621 () Bool)

(assert (=> start!33822 m!339621))

(declare-fun m!339623 () Bool)

(assert (=> start!33822 m!339623))

(check-sat b_and!14175 (not mapNonEmpty!11856) (not b!336296) (not b!336294) tp_is_empty!6967 (not b!336302) (not b!336295) (not b!336299) (not b!336298) (not b!336293) (not b_next!7015) (not start!33822))
(check-sat b_and!14175 (not b_next!7015))
