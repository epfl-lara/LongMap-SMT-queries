; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33622 () Bool)

(assert start!33622)

(declare-fun b_free!6871 () Bool)

(declare-fun b_next!6871 () Bool)

(assert (=> start!33622 (= b_free!6871 (not b_next!6871))))

(declare-fun tp!24117 () Bool)

(declare-fun b_and!14065 () Bool)

(assert (=> start!33622 (= tp!24117 b_and!14065)))

(declare-fun mapNonEmpty!11631 () Bool)

(declare-fun mapRes!11631 () Bool)

(declare-fun tp!24116 () Bool)

(declare-fun e!204959 () Bool)

(assert (=> mapNonEmpty!11631 (= mapRes!11631 (and tp!24116 e!204959))))

(declare-datatypes ((V!10075 0))(
  ( (V!10076 (val!3456 Int)) )
))
(declare-datatypes ((ValueCell!3068 0))(
  ( (ValueCellFull!3068 (v!5619 V!10075)) (EmptyCell!3068) )
))
(declare-fun mapValue!11631 () ValueCell!3068)

(declare-fun mapKey!11631 () (_ BitVec 32))

(declare-datatypes ((array!17234 0))(
  ( (array!17235 (arr!8147 (Array (_ BitVec 32) ValueCell!3068)) (size!8499 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17234)

(declare-fun mapRest!11631 () (Array (_ BitVec 32) ValueCell!3068))

(assert (=> mapNonEmpty!11631 (= (arr!8147 _values!1525) (store mapRest!11631 mapKey!11631 mapValue!11631))))

(declare-fun b!333823 () Bool)

(declare-fun res!183966 () Bool)

(declare-fun e!204955 () Bool)

(assert (=> b!333823 (=> (not res!183966) (not e!204955))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((array!17236 0))(
  ( (array!17237 (arr!8148 (Array (_ BitVec 32) (_ BitVec 64))) (size!8500 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17236)

(declare-datatypes ((SeekEntryResult!3112 0))(
  ( (MissingZero!3112 (index!14627 (_ BitVec 32))) (Found!3112 (index!14628 (_ BitVec 32))) (Intermediate!3112 (undefined!3924 Bool) (index!14629 (_ BitVec 32)) (x!33227 (_ BitVec 32))) (Undefined!3112) (MissingVacant!3112 (index!14630 (_ BitVec 32))) )
))
(declare-fun lt!159439 () SeekEntryResult!3112)

(declare-fun arrayContainsKey!0 (array!17236 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!333823 (= res!183966 (arrayContainsKey!0 _keys!1895 k0!1348 (index!14628 lt!159439)))))

(declare-fun b!333824 () Bool)

(declare-fun tp_is_empty!6823 () Bool)

(assert (=> b!333824 (= e!204959 tp_is_empty!6823)))

(declare-fun b!333825 () Bool)

(declare-fun res!183967 () Bool)

(declare-fun e!204957 () Bool)

(assert (=> b!333825 (=> (not res!183967) (not e!204957))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17236 (_ BitVec 32)) Bool)

(assert (=> b!333825 (= res!183967 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!333826 () Bool)

(assert (=> b!333826 (= e!204955 (not true))))

(assert (=> b!333826 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!10353 0))(
  ( (Unit!10354) )
))
(declare-fun lt!159438 () Unit!10353)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17236 (_ BitVec 64) (_ BitVec 32)) Unit!10353)

(assert (=> b!333826 (= lt!159438 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!14628 lt!159439)))))

(declare-fun b!333827 () Bool)

(assert (=> b!333827 (= e!204957 e!204955)))

(declare-fun res!183961 () Bool)

(assert (=> b!333827 (=> (not res!183961) (not e!204955))))

(get-info :version)

(assert (=> b!333827 (= res!183961 (and ((_ is Found!3112) lt!159439) (= (select (arr!8148 _keys!1895) (index!14628 lt!159439)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17236 (_ BitVec 32)) SeekEntryResult!3112)

(assert (=> b!333827 (= lt!159439 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!333828 () Bool)

(declare-fun e!204958 () Bool)

(assert (=> b!333828 (= e!204958 tp_is_empty!6823)))

(declare-fun b!333829 () Bool)

(declare-fun res!183965 () Bool)

(assert (=> b!333829 (=> (not res!183965) (not e!204957))))

(declare-datatypes ((List!4557 0))(
  ( (Nil!4554) (Cons!4553 (h!5409 (_ BitVec 64)) (t!9637 List!4557)) )
))
(declare-fun arrayNoDuplicates!0 (array!17236 (_ BitVec 32) List!4557) Bool)

(assert (=> b!333829 (= res!183965 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4554))))

(declare-fun b!333830 () Bool)

(declare-fun res!183963 () Bool)

(assert (=> b!333830 (=> (not res!183963) (not e!204957))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!333830 (= res!183963 (and (= (size!8499 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8500 _keys!1895) (size!8499 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!333831 () Bool)

(declare-fun e!204954 () Bool)

(assert (=> b!333831 (= e!204954 (and e!204958 mapRes!11631))))

(declare-fun condMapEmpty!11631 () Bool)

(declare-fun mapDefault!11631 () ValueCell!3068)

(assert (=> b!333831 (= condMapEmpty!11631 (= (arr!8147 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3068)) mapDefault!11631)))))

(declare-fun b!333832 () Bool)

(declare-fun res!183962 () Bool)

(assert (=> b!333832 (=> (not res!183962) (not e!204957))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!333832 (= res!183962 (validKeyInArray!0 k0!1348))))

(declare-fun b!333833 () Bool)

(declare-fun res!183968 () Bool)

(assert (=> b!333833 (=> (not res!183968) (not e!204957))))

(declare-fun zeroValue!1467 () V!10075)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10075)

(declare-datatypes ((tuple2!4940 0))(
  ( (tuple2!4941 (_1!2481 (_ BitVec 64)) (_2!2481 V!10075)) )
))
(declare-datatypes ((List!4558 0))(
  ( (Nil!4555) (Cons!4554 (h!5410 tuple2!4940) (t!9638 List!4558)) )
))
(declare-datatypes ((ListLongMap!3855 0))(
  ( (ListLongMap!3856 (toList!1943 List!4558)) )
))
(declare-fun contains!2006 (ListLongMap!3855 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1475 (array!17236 array!17234 (_ BitVec 32) (_ BitVec 32) V!10075 V!10075 (_ BitVec 32) Int) ListLongMap!3855)

(assert (=> b!333833 (= res!183968 (not (contains!2006 (getCurrentListMap!1475 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun res!183964 () Bool)

(assert (=> start!33622 (=> (not res!183964) (not e!204957))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33622 (= res!183964 (validMask!0 mask!2385))))

(assert (=> start!33622 e!204957))

(assert (=> start!33622 true))

(assert (=> start!33622 tp_is_empty!6823))

(assert (=> start!33622 tp!24117))

(declare-fun array_inv!6062 (array!17234) Bool)

(assert (=> start!33622 (and (array_inv!6062 _values!1525) e!204954)))

(declare-fun array_inv!6063 (array!17236) Bool)

(assert (=> start!33622 (array_inv!6063 _keys!1895)))

(declare-fun mapIsEmpty!11631 () Bool)

(assert (=> mapIsEmpty!11631 mapRes!11631))

(assert (= (and start!33622 res!183964) b!333830))

(assert (= (and b!333830 res!183963) b!333825))

(assert (= (and b!333825 res!183967) b!333829))

(assert (= (and b!333829 res!183965) b!333832))

(assert (= (and b!333832 res!183962) b!333833))

(assert (= (and b!333833 res!183968) b!333827))

(assert (= (and b!333827 res!183961) b!333823))

(assert (= (and b!333823 res!183966) b!333826))

(assert (= (and b!333831 condMapEmpty!11631) mapIsEmpty!11631))

(assert (= (and b!333831 (not condMapEmpty!11631)) mapNonEmpty!11631))

(assert (= (and mapNonEmpty!11631 ((_ is ValueCellFull!3068) mapValue!11631)) b!333824))

(assert (= (and b!333831 ((_ is ValueCellFull!3068) mapDefault!11631)) b!333828))

(assert (= start!33622 b!333831))

(declare-fun m!338249 () Bool)

(assert (=> b!333825 m!338249))

(declare-fun m!338251 () Bool)

(assert (=> start!33622 m!338251))

(declare-fun m!338253 () Bool)

(assert (=> start!33622 m!338253))

(declare-fun m!338255 () Bool)

(assert (=> start!33622 m!338255))

(declare-fun m!338257 () Bool)

(assert (=> b!333823 m!338257))

(declare-fun m!338259 () Bool)

(assert (=> b!333832 m!338259))

(declare-fun m!338261 () Bool)

(assert (=> b!333829 m!338261))

(declare-fun m!338263 () Bool)

(assert (=> b!333827 m!338263))

(declare-fun m!338265 () Bool)

(assert (=> b!333827 m!338265))

(declare-fun m!338267 () Bool)

(assert (=> b!333833 m!338267))

(assert (=> b!333833 m!338267))

(declare-fun m!338269 () Bool)

(assert (=> b!333833 m!338269))

(declare-fun m!338271 () Bool)

(assert (=> b!333826 m!338271))

(declare-fun m!338273 () Bool)

(assert (=> b!333826 m!338273))

(declare-fun m!338275 () Bool)

(assert (=> mapNonEmpty!11631 m!338275))

(check-sat (not b!333832) (not b!333833) (not b!333829) b_and!14065 (not b!333823) (not mapNonEmpty!11631) (not b!333825) (not b!333826) (not b!333827) tp_is_empty!6823 (not b_next!6871) (not start!33622))
(check-sat b_and!14065 (not b_next!6871))
