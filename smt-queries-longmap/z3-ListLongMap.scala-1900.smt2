; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33876 () Bool)

(assert start!33876)

(declare-fun b_free!7069 () Bool)

(declare-fun b_next!7069 () Bool)

(assert (=> start!33876 (= b_free!7069 (not b_next!7069))))

(declare-fun tp!24720 () Bool)

(declare-fun b_and!14229 () Bool)

(assert (=> start!33876 (= tp!24720 b_and!14229)))

(declare-fun mapIsEmpty!11937 () Bool)

(declare-fun mapRes!11937 () Bool)

(assert (=> mapIsEmpty!11937 mapRes!11937))

(declare-fun b!337183 () Bool)

(declare-fun res!186281 () Bool)

(declare-fun e!206898 () Bool)

(assert (=> b!337183 (=> (not res!186281) (not e!206898))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!337183 (= res!186281 (validKeyInArray!0 k0!1348))))

(declare-fun b!337184 () Bool)

(declare-fun res!186283 () Bool)

(assert (=> b!337184 (=> (not res!186283) (not e!206898))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10339 0))(
  ( (V!10340 (val!3555 Int)) )
))
(declare-datatypes ((ValueCell!3167 0))(
  ( (ValueCellFull!3167 (v!5714 V!10339)) (EmptyCell!3167) )
))
(declare-datatypes ((array!17617 0))(
  ( (array!17618 (arr!8336 (Array (_ BitVec 32) ValueCell!3167)) (size!8689 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17617)

(declare-datatypes ((array!17619 0))(
  ( (array!17620 (arr!8337 (Array (_ BitVec 32) (_ BitVec 64))) (size!8690 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17619)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!337184 (= res!186283 (and (= (size!8689 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8690 _keys!1895) (size!8689 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!337185 () Bool)

(declare-fun e!206901 () Bool)

(declare-fun e!206900 () Bool)

(assert (=> b!337185 (= e!206901 (and e!206900 mapRes!11937))))

(declare-fun condMapEmpty!11937 () Bool)

(declare-fun mapDefault!11937 () ValueCell!3167)

(assert (=> b!337185 (= condMapEmpty!11937 (= (arr!8336 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3167)) mapDefault!11937)))))

(declare-fun b!337186 () Bool)

(declare-fun res!186280 () Bool)

(assert (=> b!337186 (=> (not res!186280) (not e!206898))))

(declare-fun zeroValue!1467 () V!10339)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10339)

(declare-datatypes ((tuple2!5108 0))(
  ( (tuple2!5109 (_1!2565 (_ BitVec 64)) (_2!2565 V!10339)) )
))
(declare-datatypes ((List!4741 0))(
  ( (Nil!4738) (Cons!4737 (h!5593 tuple2!5108) (t!9826 List!4741)) )
))
(declare-datatypes ((ListLongMap!4011 0))(
  ( (ListLongMap!4012 (toList!2021 List!4741)) )
))
(declare-fun contains!2079 (ListLongMap!4011 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1527 (array!17619 array!17617 (_ BitVec 32) (_ BitVec 32) V!10339 V!10339 (_ BitVec 32) Int) ListLongMap!4011)

(assert (=> b!337186 (= res!186280 (not (contains!2079 (getCurrentListMap!1527 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!337187 () Bool)

(declare-fun res!186282 () Bool)

(assert (=> b!337187 (=> (not res!186282) (not e!206898))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17619 (_ BitVec 32)) Bool)

(assert (=> b!337187 (= res!186282 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun res!186286 () Bool)

(assert (=> start!33876 (=> (not res!186286) (not e!206898))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33876 (= res!186286 (validMask!0 mask!2385))))

(assert (=> start!33876 e!206898))

(assert (=> start!33876 true))

(declare-fun tp_is_empty!7021 () Bool)

(assert (=> start!33876 tp_is_empty!7021))

(assert (=> start!33876 tp!24720))

(declare-fun array_inv!6218 (array!17617) Bool)

(assert (=> start!33876 (and (array_inv!6218 _values!1525) e!206901)))

(declare-fun array_inv!6219 (array!17619) Bool)

(assert (=> start!33876 (array_inv!6219 _keys!1895)))

(declare-fun b!337188 () Bool)

(assert (=> b!337188 (= e!206900 tp_is_empty!7021)))

(declare-fun b!337189 () Bool)

(declare-fun e!206899 () Bool)

(assert (=> b!337189 (= e!206899 tp_is_empty!7021)))

(declare-fun b!337190 () Bool)

(declare-fun e!206902 () Bool)

(assert (=> b!337190 (= e!206898 e!206902)))

(declare-fun res!186284 () Bool)

(assert (=> b!337190 (=> (not res!186284) (not e!206902))))

(declare-datatypes ((SeekEntryResult!3222 0))(
  ( (MissingZero!3222 (index!15067 (_ BitVec 32))) (Found!3222 (index!15068 (_ BitVec 32))) (Intermediate!3222 (undefined!4034 Bool) (index!15069 (_ BitVec 32)) (x!33629 (_ BitVec 32))) (Undefined!3222) (MissingVacant!3222 (index!15070 (_ BitVec 32))) )
))
(declare-fun lt!160202 () SeekEntryResult!3222)

(get-info :version)

(assert (=> b!337190 (= res!186284 (and (not ((_ is Found!3222) lt!160202)) ((_ is MissingZero!3222) lt!160202)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17619 (_ BitVec 32)) SeekEntryResult!3222)

(assert (=> b!337190 (= lt!160202 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!337191 () Bool)

(assert (=> b!337191 (= e!206902 false)))

(declare-fun lt!160203 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!17619 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!337191 (= lt!160203 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!11937 () Bool)

(declare-fun tp!24719 () Bool)

(assert (=> mapNonEmpty!11937 (= mapRes!11937 (and tp!24719 e!206899))))

(declare-fun mapValue!11937 () ValueCell!3167)

(declare-fun mapKey!11937 () (_ BitVec 32))

(declare-fun mapRest!11937 () (Array (_ BitVec 32) ValueCell!3167))

(assert (=> mapNonEmpty!11937 (= (arr!8336 _values!1525) (store mapRest!11937 mapKey!11937 mapValue!11937))))

(declare-fun b!337192 () Bool)

(declare-fun res!186285 () Bool)

(assert (=> b!337192 (=> (not res!186285) (not e!206898))))

(declare-datatypes ((List!4742 0))(
  ( (Nil!4739) (Cons!4738 (h!5594 (_ BitVec 64)) (t!9827 List!4742)) )
))
(declare-fun arrayNoDuplicates!0 (array!17619 (_ BitVec 32) List!4742) Bool)

(assert (=> b!337192 (= res!186285 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4739))))

(declare-fun b!337193 () Bool)

(declare-fun res!186287 () Bool)

(assert (=> b!337193 (=> (not res!186287) (not e!206902))))

(declare-fun arrayContainsKey!0 (array!17619 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!337193 (= res!186287 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(assert (= (and start!33876 res!186286) b!337184))

(assert (= (and b!337184 res!186283) b!337187))

(assert (= (and b!337187 res!186282) b!337192))

(assert (= (and b!337192 res!186285) b!337183))

(assert (= (and b!337183 res!186281) b!337186))

(assert (= (and b!337186 res!186280) b!337190))

(assert (= (and b!337190 res!186284) b!337193))

(assert (= (and b!337193 res!186287) b!337191))

(assert (= (and b!337185 condMapEmpty!11937) mapIsEmpty!11937))

(assert (= (and b!337185 (not condMapEmpty!11937)) mapNonEmpty!11937))

(assert (= (and mapNonEmpty!11937 ((_ is ValueCellFull!3167) mapValue!11937)) b!337189))

(assert (= (and b!337185 ((_ is ValueCellFull!3167) mapDefault!11937)) b!337188))

(assert (= start!33876 b!337185))

(declare-fun m!340249 () Bool)

(assert (=> b!337191 m!340249))

(declare-fun m!340251 () Bool)

(assert (=> b!337186 m!340251))

(assert (=> b!337186 m!340251))

(declare-fun m!340253 () Bool)

(assert (=> b!337186 m!340253))

(declare-fun m!340255 () Bool)

(assert (=> b!337193 m!340255))

(declare-fun m!340257 () Bool)

(assert (=> b!337192 m!340257))

(declare-fun m!340259 () Bool)

(assert (=> b!337187 m!340259))

(declare-fun m!340261 () Bool)

(assert (=> b!337190 m!340261))

(declare-fun m!340263 () Bool)

(assert (=> start!33876 m!340263))

(declare-fun m!340265 () Bool)

(assert (=> start!33876 m!340265))

(declare-fun m!340267 () Bool)

(assert (=> start!33876 m!340267))

(declare-fun m!340269 () Bool)

(assert (=> mapNonEmpty!11937 m!340269))

(declare-fun m!340271 () Bool)

(assert (=> b!337183 m!340271))

(check-sat b_and!14229 (not mapNonEmpty!11937) (not b!337193) (not b!337190) (not b_next!7069) (not b!337183) (not b!337191) (not b!337187) tp_is_empty!7021 (not b!337186) (not start!33876) (not b!337192))
(check-sat b_and!14229 (not b_next!7069))
