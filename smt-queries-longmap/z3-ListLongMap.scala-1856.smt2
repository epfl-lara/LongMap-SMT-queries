; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33502 () Bool)

(assert start!33502)

(declare-fun b_free!6805 () Bool)

(declare-fun b_next!6805 () Bool)

(assert (=> start!33502 (= b_free!6805 (not b_next!6805))))

(declare-fun tp!23909 () Bool)

(declare-fun b_and!13953 () Bool)

(assert (=> start!33502 (= tp!23909 b_and!13953)))

(declare-fun res!183104 () Bool)

(declare-fun e!204063 () Bool)

(assert (=> start!33502 (=> (not res!183104) (not e!204063))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33502 (= res!183104 (validMask!0 mask!2385))))

(assert (=> start!33502 e!204063))

(assert (=> start!33502 true))

(declare-fun tp_is_empty!6757 () Bool)

(assert (=> start!33502 tp_is_empty!6757))

(assert (=> start!33502 tp!23909))

(declare-datatypes ((V!9987 0))(
  ( (V!9988 (val!3423 Int)) )
))
(declare-datatypes ((ValueCell!3035 0))(
  ( (ValueCellFull!3035 (v!5576 V!9987)) (EmptyCell!3035) )
))
(declare-datatypes ((array!17093 0))(
  ( (array!17094 (arr!8080 (Array (_ BitVec 32) ValueCell!3035)) (size!8433 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17093)

(declare-fun e!204064 () Bool)

(declare-fun array_inv!6032 (array!17093) Bool)

(assert (=> start!33502 (and (array_inv!6032 _values!1525) e!204064)))

(declare-datatypes ((array!17095 0))(
  ( (array!17096 (arr!8081 (Array (_ BitVec 32) (_ BitVec 64))) (size!8434 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17095)

(declare-fun array_inv!6033 (array!17095) Bool)

(assert (=> start!33502 (array_inv!6033 _keys!1895)))

(declare-fun b!332323 () Bool)

(declare-fun res!183101 () Bool)

(assert (=> b!332323 (=> (not res!183101) (not e!204063))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!332323 (= res!183101 (validKeyInArray!0 k0!1348))))

(declare-fun b!332324 () Bool)

(assert (=> b!332324 (= e!204063 false)))

(declare-fun zeroValue!1467 () V!9987)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun lt!158796 () Bool)

(declare-fun minValue!1467 () V!9987)

(declare-datatypes ((tuple2!4928 0))(
  ( (tuple2!4929 (_1!2475 (_ BitVec 64)) (_2!2475 V!9987)) )
))
(declare-datatypes ((List!4566 0))(
  ( (Nil!4563) (Cons!4562 (h!5418 tuple2!4928) (t!9639 List!4566)) )
))
(declare-datatypes ((ListLongMap!3831 0))(
  ( (ListLongMap!3832 (toList!1931 List!4566)) )
))
(declare-fun contains!1983 (ListLongMap!3831 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1440 (array!17095 array!17093 (_ BitVec 32) (_ BitVec 32) V!9987 V!9987 (_ BitVec 32) Int) ListLongMap!3831)

(assert (=> b!332324 (= lt!158796 (contains!1983 (getCurrentListMap!1440 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348))))

(declare-fun b!332325 () Bool)

(declare-fun e!204065 () Bool)

(assert (=> b!332325 (= e!204065 tp_is_empty!6757)))

(declare-fun b!332326 () Bool)

(declare-fun res!183100 () Bool)

(assert (=> b!332326 (=> (not res!183100) (not e!204063))))

(declare-datatypes ((List!4567 0))(
  ( (Nil!4564) (Cons!4563 (h!5419 (_ BitVec 64)) (t!9640 List!4567)) )
))
(declare-fun arrayNoDuplicates!0 (array!17095 (_ BitVec 32) List!4567) Bool)

(assert (=> b!332326 (= res!183100 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4564))))

(declare-fun b!332327 () Bool)

(declare-fun e!204067 () Bool)

(declare-fun mapRes!11523 () Bool)

(assert (=> b!332327 (= e!204064 (and e!204067 mapRes!11523))))

(declare-fun condMapEmpty!11523 () Bool)

(declare-fun mapDefault!11523 () ValueCell!3035)

(assert (=> b!332327 (= condMapEmpty!11523 (= (arr!8080 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3035)) mapDefault!11523)))))

(declare-fun b!332328 () Bool)

(declare-fun res!183102 () Bool)

(assert (=> b!332328 (=> (not res!183102) (not e!204063))))

(assert (=> b!332328 (= res!183102 (and (= (size!8433 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8434 _keys!1895) (size!8433 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!11523 () Bool)

(assert (=> mapIsEmpty!11523 mapRes!11523))

(declare-fun b!332329 () Bool)

(declare-fun res!183103 () Bool)

(assert (=> b!332329 (=> (not res!183103) (not e!204063))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17095 (_ BitVec 32)) Bool)

(assert (=> b!332329 (= res!183103 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!11523 () Bool)

(declare-fun tp!23910 () Bool)

(assert (=> mapNonEmpty!11523 (= mapRes!11523 (and tp!23910 e!204065))))

(declare-fun mapRest!11523 () (Array (_ BitVec 32) ValueCell!3035))

(declare-fun mapKey!11523 () (_ BitVec 32))

(declare-fun mapValue!11523 () ValueCell!3035)

(assert (=> mapNonEmpty!11523 (= (arr!8080 _values!1525) (store mapRest!11523 mapKey!11523 mapValue!11523))))

(declare-fun b!332330 () Bool)

(assert (=> b!332330 (= e!204067 tp_is_empty!6757)))

(assert (= (and start!33502 res!183104) b!332328))

(assert (= (and b!332328 res!183102) b!332329))

(assert (= (and b!332329 res!183103) b!332326))

(assert (= (and b!332326 res!183100) b!332323))

(assert (= (and b!332323 res!183101) b!332324))

(assert (= (and b!332327 condMapEmpty!11523) mapIsEmpty!11523))

(assert (= (and b!332327 (not condMapEmpty!11523)) mapNonEmpty!11523))

(get-info :version)

(assert (= (and mapNonEmpty!11523 ((_ is ValueCellFull!3035) mapValue!11523)) b!332325))

(assert (= (and b!332327 ((_ is ValueCellFull!3035) mapDefault!11523)) b!332330))

(assert (= start!33502 b!332327))

(declare-fun m!336329 () Bool)

(assert (=> start!33502 m!336329))

(declare-fun m!336331 () Bool)

(assert (=> start!33502 m!336331))

(declare-fun m!336333 () Bool)

(assert (=> start!33502 m!336333))

(declare-fun m!336335 () Bool)

(assert (=> b!332324 m!336335))

(assert (=> b!332324 m!336335))

(declare-fun m!336337 () Bool)

(assert (=> b!332324 m!336337))

(declare-fun m!336339 () Bool)

(assert (=> b!332323 m!336339))

(declare-fun m!336341 () Bool)

(assert (=> mapNonEmpty!11523 m!336341))

(declare-fun m!336343 () Bool)

(assert (=> b!332329 m!336343))

(declare-fun m!336345 () Bool)

(assert (=> b!332326 m!336345))

(check-sat b_and!13953 (not b!332323) tp_is_empty!6757 (not mapNonEmpty!11523) (not b!332324) (not b!332329) (not start!33502) (not b_next!6805) (not b!332326))
(check-sat b_and!13953 (not b_next!6805))
