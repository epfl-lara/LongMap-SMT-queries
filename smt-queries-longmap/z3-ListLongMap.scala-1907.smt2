; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33966 () Bool)

(assert start!33966)

(declare-fun b_free!7111 () Bool)

(declare-fun b_next!7111 () Bool)

(assert (=> start!33966 (= b_free!7111 (not b_next!7111))))

(declare-fun tp!24852 () Bool)

(declare-fun b_and!14315 () Bool)

(assert (=> start!33966 (= tp!24852 b_and!14315)))

(declare-fun res!186966 () Bool)

(declare-fun e!207648 () Bool)

(assert (=> start!33966 (=> (not res!186966) (not e!207648))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33966 (= res!186966 (validMask!0 mask!2385))))

(assert (=> start!33966 e!207648))

(assert (=> start!33966 true))

(declare-fun tp_is_empty!7063 () Bool)

(assert (=> start!33966 tp_is_empty!7063))

(assert (=> start!33966 tp!24852))

(declare-datatypes ((V!10395 0))(
  ( (V!10396 (val!3576 Int)) )
))
(declare-datatypes ((ValueCell!3188 0))(
  ( (ValueCellFull!3188 (v!5744 V!10395)) (EmptyCell!3188) )
))
(declare-datatypes ((array!17706 0))(
  ( (array!17707 (arr!8378 (Array (_ BitVec 32) ValueCell!3188)) (size!8730 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17706)

(declare-fun e!207650 () Bool)

(declare-fun array_inv!6220 (array!17706) Bool)

(assert (=> start!33966 (and (array_inv!6220 _values!1525) e!207650)))

(declare-datatypes ((array!17708 0))(
  ( (array!17709 (arr!8379 (Array (_ BitVec 32) (_ BitVec 64))) (size!8731 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17708)

(declare-fun array_inv!6221 (array!17708) Bool)

(assert (=> start!33966 (array_inv!6221 _keys!1895)))

(declare-fun b!338423 () Bool)

(declare-fun res!186968 () Bool)

(assert (=> b!338423 (=> (not res!186968) (not e!207648))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun zeroValue!1467 () V!10395)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10395)

(declare-datatypes ((tuple2!5106 0))(
  ( (tuple2!5107 (_1!2564 (_ BitVec 64)) (_2!2564 V!10395)) )
))
(declare-datatypes ((List!4714 0))(
  ( (Nil!4711) (Cons!4710 (h!5566 tuple2!5106) (t!9804 List!4714)) )
))
(declare-datatypes ((ListLongMap!4021 0))(
  ( (ListLongMap!4022 (toList!2026 List!4714)) )
))
(declare-fun contains!2094 (ListLongMap!4021 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1555 (array!17708 array!17706 (_ BitVec 32) (_ BitVec 32) V!10395 V!10395 (_ BitVec 32) Int) ListLongMap!4021)

(assert (=> b!338423 (= res!186968 (not (contains!2094 (getCurrentListMap!1555 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun mapIsEmpty!12006 () Bool)

(declare-fun mapRes!12006 () Bool)

(assert (=> mapIsEmpty!12006 mapRes!12006))

(declare-fun b!338424 () Bool)

(declare-fun res!186969 () Bool)

(assert (=> b!338424 (=> (not res!186969) (not e!207648))))

(assert (=> b!338424 (= res!186969 (and (= (size!8730 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8731 _keys!1895) (size!8730 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!338425 () Bool)

(declare-fun e!207649 () Bool)

(assert (=> b!338425 (= e!207650 (and e!207649 mapRes!12006))))

(declare-fun condMapEmpty!12006 () Bool)

(declare-fun mapDefault!12006 () ValueCell!3188)

(assert (=> b!338425 (= condMapEmpty!12006 (= (arr!8378 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3188)) mapDefault!12006)))))

(declare-fun b!338426 () Bool)

(declare-fun res!186967 () Bool)

(assert (=> b!338426 (=> (not res!186967) (not e!207648))))

(declare-datatypes ((List!4715 0))(
  ( (Nil!4712) (Cons!4711 (h!5567 (_ BitVec 64)) (t!9805 List!4715)) )
))
(declare-fun arrayNoDuplicates!0 (array!17708 (_ BitVec 32) List!4715) Bool)

(assert (=> b!338426 (= res!186967 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4712))))

(declare-fun b!338427 () Bool)

(declare-fun res!186965 () Bool)

(assert (=> b!338427 (=> (not res!186965) (not e!207648))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17708 (_ BitVec 32)) Bool)

(assert (=> b!338427 (= res!186965 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!338428 () Bool)

(declare-fun e!207646 () Bool)

(assert (=> b!338428 (= e!207646 tp_is_empty!7063)))

(declare-fun b!338429 () Bool)

(declare-datatypes ((Unit!10479 0))(
  ( (Unit!10480) )
))
(declare-fun e!207647 () Unit!10479)

(declare-fun Unit!10481 () Unit!10479)

(assert (=> b!338429 (= e!207647 Unit!10481)))

(declare-fun lt!160837 () Unit!10479)

(declare-fun lemmaArrayContainsKeyThenInListMap!280 (array!17708 array!17706 (_ BitVec 32) (_ BitVec 32) V!10395 V!10395 (_ BitVec 64) (_ BitVec 32) Int) Unit!10479)

(declare-fun arrayScanForKey!0 (array!17708 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!338429 (= lt!160837 (lemmaArrayContainsKeyThenInListMap!280 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!338429 false))

(declare-fun b!338430 () Bool)

(declare-fun e!207645 () Bool)

(assert (=> b!338430 (= e!207648 e!207645)))

(declare-fun res!186971 () Bool)

(assert (=> b!338430 (=> (not res!186971) (not e!207645))))

(declare-datatypes ((SeekEntryResult!3195 0))(
  ( (MissingZero!3195 (index!14959 (_ BitVec 32))) (Found!3195 (index!14960 (_ BitVec 32))) (Intermediate!3195 (undefined!4007 Bool) (index!14961 (_ BitVec 32)) (x!33680 (_ BitVec 32))) (Undefined!3195) (MissingVacant!3195 (index!14962 (_ BitVec 32))) )
))
(declare-fun lt!160836 () SeekEntryResult!3195)

(get-info :version)

(assert (=> b!338430 (= res!186971 (and (not ((_ is Found!3195) lt!160836)) ((_ is MissingZero!3195) lt!160836)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17708 (_ BitVec 32)) SeekEntryResult!3195)

(assert (=> b!338430 (= lt!160836 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!338431 () Bool)

(assert (=> b!338431 (= e!207649 tp_is_empty!7063)))

(declare-fun b!338432 () Bool)

(declare-fun res!186970 () Bool)

(assert (=> b!338432 (=> (not res!186970) (not e!207648))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!338432 (= res!186970 (validKeyInArray!0 k0!1348))))

(declare-fun mapNonEmpty!12006 () Bool)

(declare-fun tp!24851 () Bool)

(assert (=> mapNonEmpty!12006 (= mapRes!12006 (and tp!24851 e!207646))))

(declare-fun mapRest!12006 () (Array (_ BitVec 32) ValueCell!3188))

(declare-fun mapValue!12006 () ValueCell!3188)

(declare-fun mapKey!12006 () (_ BitVec 32))

(assert (=> mapNonEmpty!12006 (= (arr!8378 _values!1525) (store mapRest!12006 mapKey!12006 mapValue!12006))))

(declare-fun lt!160835 () Bool)

(declare-fun b!338433 () Bool)

(assert (=> b!338433 (= e!207645 (and (not lt!160835) (not (= (size!8731 _keys!1895) (bvadd #b00000000000000000000000000000001 mask!2385)))))))

(declare-fun lt!160834 () Unit!10479)

(assert (=> b!338433 (= lt!160834 e!207647)))

(declare-fun c!52403 () Bool)

(assert (=> b!338433 (= c!52403 lt!160835)))

(declare-fun arrayContainsKey!0 (array!17708 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!338433 (= lt!160835 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!338434 () Bool)

(declare-fun Unit!10482 () Unit!10479)

(assert (=> b!338434 (= e!207647 Unit!10482)))

(assert (= (and start!33966 res!186966) b!338424))

(assert (= (and b!338424 res!186969) b!338427))

(assert (= (and b!338427 res!186965) b!338426))

(assert (= (and b!338426 res!186967) b!338432))

(assert (= (and b!338432 res!186970) b!338423))

(assert (= (and b!338423 res!186968) b!338430))

(assert (= (and b!338430 res!186971) b!338433))

(assert (= (and b!338433 c!52403) b!338429))

(assert (= (and b!338433 (not c!52403)) b!338434))

(assert (= (and b!338425 condMapEmpty!12006) mapIsEmpty!12006))

(assert (= (and b!338425 (not condMapEmpty!12006)) mapNonEmpty!12006))

(assert (= (and mapNonEmpty!12006 ((_ is ValueCellFull!3188) mapValue!12006)) b!338428))

(assert (= (and b!338425 ((_ is ValueCellFull!3188) mapDefault!12006)) b!338431))

(assert (= start!33966 b!338425))

(declare-fun m!341941 () Bool)

(assert (=> mapNonEmpty!12006 m!341941))

(declare-fun m!341943 () Bool)

(assert (=> b!338426 m!341943))

(declare-fun m!341945 () Bool)

(assert (=> b!338433 m!341945))

(declare-fun m!341947 () Bool)

(assert (=> b!338429 m!341947))

(assert (=> b!338429 m!341947))

(declare-fun m!341949 () Bool)

(assert (=> b!338429 m!341949))

(declare-fun m!341951 () Bool)

(assert (=> b!338432 m!341951))

(declare-fun m!341953 () Bool)

(assert (=> b!338427 m!341953))

(declare-fun m!341955 () Bool)

(assert (=> b!338423 m!341955))

(assert (=> b!338423 m!341955))

(declare-fun m!341957 () Bool)

(assert (=> b!338423 m!341957))

(declare-fun m!341959 () Bool)

(assert (=> start!33966 m!341959))

(declare-fun m!341961 () Bool)

(assert (=> start!33966 m!341961))

(declare-fun m!341963 () Bool)

(assert (=> start!33966 m!341963))

(declare-fun m!341965 () Bool)

(assert (=> b!338430 m!341965))

(check-sat (not b!338426) (not b!338427) (not b!338432) (not b_next!7111) (not start!33966) tp_is_empty!7063 (not b!338423) b_and!14315 (not b!338429) (not b!338433) (not b!338430) (not mapNonEmpty!12006))
(check-sat b_and!14315 (not b_next!7111))
