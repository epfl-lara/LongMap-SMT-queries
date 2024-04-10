; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33976 () Bool)

(assert start!33976)

(declare-fun b_free!7107 () Bool)

(declare-fun b_next!7107 () Bool)

(assert (=> start!33976 (= b_free!7107 (not b_next!7107))))

(declare-fun tp!24840 () Bool)

(declare-fun b_and!14297 () Bool)

(assert (=> start!33976 (= tp!24840 b_and!14297)))

(declare-fun b!338404 () Bool)

(declare-fun e!207641 () Bool)

(assert (=> b!338404 (= e!207641 false)))

(declare-datatypes ((Unit!10508 0))(
  ( (Unit!10509) )
))
(declare-fun lt!160797 () Unit!10508)

(declare-fun e!207640 () Unit!10508)

(assert (=> b!338404 (= lt!160797 e!207640)))

(declare-fun c!52422 () Bool)

(declare-datatypes ((array!17713 0))(
  ( (array!17714 (arr!8382 (Array (_ BitVec 32) (_ BitVec 64))) (size!8734 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17713)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!17713 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!338404 (= c!52422 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!12000 () Bool)

(declare-fun mapRes!12000 () Bool)

(declare-fun tp!24839 () Bool)

(declare-fun e!207638 () Bool)

(assert (=> mapNonEmpty!12000 (= mapRes!12000 (and tp!24839 e!207638))))

(declare-fun mapKey!12000 () (_ BitVec 32))

(declare-datatypes ((V!10389 0))(
  ( (V!10390 (val!3574 Int)) )
))
(declare-datatypes ((ValueCell!3186 0))(
  ( (ValueCellFull!3186 (v!5741 V!10389)) (EmptyCell!3186) )
))
(declare-datatypes ((array!17715 0))(
  ( (array!17716 (arr!8383 (Array (_ BitVec 32) ValueCell!3186)) (size!8735 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17715)

(declare-fun mapRest!12000 () (Array (_ BitVec 32) ValueCell!3186))

(declare-fun mapValue!12000 () ValueCell!3186)

(assert (=> mapNonEmpty!12000 (= (arr!8383 _values!1525) (store mapRest!12000 mapKey!12000 mapValue!12000))))

(declare-fun b!338405 () Bool)

(declare-fun Unit!10510 () Unit!10508)

(assert (=> b!338405 (= e!207640 Unit!10510)))

(declare-fun b!338406 () Bool)

(declare-fun res!186930 () Bool)

(declare-fun e!207639 () Bool)

(assert (=> b!338406 (=> (not res!186930) (not e!207639))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun zeroValue!1467 () V!10389)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10389)

(declare-datatypes ((tuple2!5192 0))(
  ( (tuple2!5193 (_1!2607 (_ BitVec 64)) (_2!2607 V!10389)) )
))
(declare-datatypes ((List!4807 0))(
  ( (Nil!4804) (Cons!4803 (h!5659 tuple2!5192) (t!9905 List!4807)) )
))
(declare-datatypes ((ListLongMap!4105 0))(
  ( (ListLongMap!4106 (toList!2068 List!4807)) )
))
(declare-fun contains!2117 (ListLongMap!4105 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1589 (array!17713 array!17715 (_ BitVec 32) (_ BitVec 32) V!10389 V!10389 (_ BitVec 32) Int) ListLongMap!4105)

(assert (=> b!338406 (= res!186930 (not (contains!2117 (getCurrentListMap!1589 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!338408 () Bool)

(declare-fun e!207637 () Bool)

(declare-fun tp_is_empty!7059 () Bool)

(assert (=> b!338408 (= e!207637 tp_is_empty!7059)))

(declare-fun b!338409 () Bool)

(declare-fun e!207642 () Bool)

(assert (=> b!338409 (= e!207642 (and e!207637 mapRes!12000))))

(declare-fun condMapEmpty!12000 () Bool)

(declare-fun mapDefault!12000 () ValueCell!3186)

(assert (=> b!338409 (= condMapEmpty!12000 (= (arr!8383 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3186)) mapDefault!12000)))))

(declare-fun b!338410 () Bool)

(declare-fun Unit!10511 () Unit!10508)

(assert (=> b!338410 (= e!207640 Unit!10511)))

(declare-fun lt!160798 () Unit!10508)

(declare-fun lemmaArrayContainsKeyThenInListMap!272 (array!17713 array!17715 (_ BitVec 32) (_ BitVec 32) V!10389 V!10389 (_ BitVec 64) (_ BitVec 32) Int) Unit!10508)

(declare-fun arrayScanForKey!0 (array!17713 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!338410 (= lt!160798 (lemmaArrayContainsKeyThenInListMap!272 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!338410 false))

(declare-fun b!338411 () Bool)

(declare-fun res!186931 () Bool)

(assert (=> b!338411 (=> (not res!186931) (not e!207639))))

(assert (=> b!338411 (= res!186931 (and (= (size!8735 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8734 _keys!1895) (size!8735 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!338412 () Bool)

(declare-fun res!186929 () Bool)

(assert (=> b!338412 (=> (not res!186929) (not e!207639))))

(declare-datatypes ((List!4808 0))(
  ( (Nil!4805) (Cons!4804 (h!5660 (_ BitVec 64)) (t!9906 List!4808)) )
))
(declare-fun arrayNoDuplicates!0 (array!17713 (_ BitVec 32) List!4808) Bool)

(assert (=> b!338412 (= res!186929 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4805))))

(declare-fun b!338413 () Bool)

(assert (=> b!338413 (= e!207638 tp_is_empty!7059)))

(declare-fun mapIsEmpty!12000 () Bool)

(assert (=> mapIsEmpty!12000 mapRes!12000))

(declare-fun b!338414 () Bool)

(declare-fun res!186927 () Bool)

(assert (=> b!338414 (=> (not res!186927) (not e!207639))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17713 (_ BitVec 32)) Bool)

(assert (=> b!338414 (= res!186927 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!338415 () Bool)

(assert (=> b!338415 (= e!207639 e!207641)))

(declare-fun res!186932 () Bool)

(assert (=> b!338415 (=> (not res!186932) (not e!207641))))

(declare-datatypes ((SeekEntryResult!3236 0))(
  ( (MissingZero!3236 (index!15123 (_ BitVec 32))) (Found!3236 (index!15124 (_ BitVec 32))) (Intermediate!3236 (undefined!4048 Bool) (index!15125 (_ BitVec 32)) (x!33716 (_ BitVec 32))) (Undefined!3236) (MissingVacant!3236 (index!15126 (_ BitVec 32))) )
))
(declare-fun lt!160796 () SeekEntryResult!3236)

(get-info :version)

(assert (=> b!338415 (= res!186932 (and (not ((_ is Found!3236) lt!160796)) ((_ is MissingZero!3236) lt!160796)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17713 (_ BitVec 32)) SeekEntryResult!3236)

(assert (=> b!338415 (= lt!160796 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun res!186928 () Bool)

(assert (=> start!33976 (=> (not res!186928) (not e!207639))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33976 (= res!186928 (validMask!0 mask!2385))))

(assert (=> start!33976 e!207639))

(assert (=> start!33976 true))

(assert (=> start!33976 tp_is_empty!7059))

(assert (=> start!33976 tp!24840))

(declare-fun array_inv!6218 (array!17715) Bool)

(assert (=> start!33976 (and (array_inv!6218 _values!1525) e!207642)))

(declare-fun array_inv!6219 (array!17713) Bool)

(assert (=> start!33976 (array_inv!6219 _keys!1895)))

(declare-fun b!338407 () Bool)

(declare-fun res!186926 () Bool)

(assert (=> b!338407 (=> (not res!186926) (not e!207639))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!338407 (= res!186926 (validKeyInArray!0 k0!1348))))

(assert (= (and start!33976 res!186928) b!338411))

(assert (= (and b!338411 res!186931) b!338414))

(assert (= (and b!338414 res!186927) b!338412))

(assert (= (and b!338412 res!186929) b!338407))

(assert (= (and b!338407 res!186926) b!338406))

(assert (= (and b!338406 res!186930) b!338415))

(assert (= (and b!338415 res!186932) b!338404))

(assert (= (and b!338404 c!52422) b!338410))

(assert (= (and b!338404 (not c!52422)) b!338405))

(assert (= (and b!338409 condMapEmpty!12000) mapIsEmpty!12000))

(assert (= (and b!338409 (not condMapEmpty!12000)) mapNonEmpty!12000))

(assert (= (and mapNonEmpty!12000 ((_ is ValueCellFull!3186) mapValue!12000)) b!338413))

(assert (= (and b!338409 ((_ is ValueCellFull!3186) mapDefault!12000)) b!338408))

(assert (= start!33976 b!338409))

(declare-fun m!341665 () Bool)

(assert (=> b!338412 m!341665))

(declare-fun m!341667 () Bool)

(assert (=> b!338410 m!341667))

(assert (=> b!338410 m!341667))

(declare-fun m!341669 () Bool)

(assert (=> b!338410 m!341669))

(declare-fun m!341671 () Bool)

(assert (=> b!338414 m!341671))

(declare-fun m!341673 () Bool)

(assert (=> start!33976 m!341673))

(declare-fun m!341675 () Bool)

(assert (=> start!33976 m!341675))

(declare-fun m!341677 () Bool)

(assert (=> start!33976 m!341677))

(declare-fun m!341679 () Bool)

(assert (=> b!338407 m!341679))

(declare-fun m!341681 () Bool)

(assert (=> b!338406 m!341681))

(assert (=> b!338406 m!341681))

(declare-fun m!341683 () Bool)

(assert (=> b!338406 m!341683))

(declare-fun m!341685 () Bool)

(assert (=> mapNonEmpty!12000 m!341685))

(declare-fun m!341687 () Bool)

(assert (=> b!338404 m!341687))

(declare-fun m!341689 () Bool)

(assert (=> b!338415 m!341689))

(check-sat (not mapNonEmpty!12000) (not b!338404) tp_is_empty!7059 (not b!338414) b_and!14297 (not b!338412) (not b!338406) (not b!338415) (not b!338410) (not b!338407) (not start!33976) (not b_next!7107))
(check-sat b_and!14297 (not b_next!7107))
