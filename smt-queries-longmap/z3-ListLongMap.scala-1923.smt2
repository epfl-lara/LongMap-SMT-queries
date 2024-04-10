; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34186 () Bool)

(assert start!34186)

(declare-fun b_free!7209 () Bool)

(declare-fun b_next!7209 () Bool)

(assert (=> start!34186 (= b_free!7209 (not b_next!7209))))

(declare-fun tp!25161 () Bool)

(declare-fun b_and!14409 () Bool)

(assert (=> start!34186 (= tp!25161 b_and!14409)))

(declare-fun res!188281 () Bool)

(declare-fun e!209043 () Bool)

(assert (=> start!34186 (=> (not res!188281) (not e!209043))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34186 (= res!188281 (validMask!0 mask!2385))))

(assert (=> start!34186 e!209043))

(assert (=> start!34186 true))

(declare-fun tp_is_empty!7161 () Bool)

(assert (=> start!34186 tp_is_empty!7161))

(assert (=> start!34186 tp!25161))

(declare-datatypes ((V!10525 0))(
  ( (V!10526 (val!3625 Int)) )
))
(declare-datatypes ((ValueCell!3237 0))(
  ( (ValueCellFull!3237 (v!5797 V!10525)) (EmptyCell!3237) )
))
(declare-datatypes ((array!17923 0))(
  ( (array!17924 (arr!8482 (Array (_ BitVec 32) ValueCell!3237)) (size!8834 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17923)

(declare-fun e!209041 () Bool)

(declare-fun array_inv!6284 (array!17923) Bool)

(assert (=> start!34186 (and (array_inv!6284 _values!1525) e!209041)))

(declare-datatypes ((array!17925 0))(
  ( (array!17926 (arr!8483 (Array (_ BitVec 32) (_ BitVec 64))) (size!8835 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17925)

(declare-fun array_inv!6285 (array!17925) Bool)

(assert (=> start!34186 (array_inv!6285 _keys!1895)))

(declare-fun b!340792 () Bool)

(declare-fun e!209045 () Bool)

(assert (=> b!340792 (= e!209045 false)))

(declare-fun lt!161653 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!17925 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!340792 (= lt!161653 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!340793 () Bool)

(assert (=> b!340793 (= e!209043 e!209045)))

(declare-fun res!188286 () Bool)

(assert (=> b!340793 (=> (not res!188286) (not e!209045))))

(declare-datatypes ((SeekEntryResult!3277 0))(
  ( (MissingZero!3277 (index!15287 (_ BitVec 32))) (Found!3277 (index!15288 (_ BitVec 32))) (Intermediate!3277 (undefined!4089 Bool) (index!15289 (_ BitVec 32)) (x!33943 (_ BitVec 32))) (Undefined!3277) (MissingVacant!3277 (index!15290 (_ BitVec 32))) )
))
(declare-fun lt!161652 () SeekEntryResult!3277)

(get-info :version)

(assert (=> b!340793 (= res!188286 (and (not ((_ is Found!3277) lt!161652)) (not ((_ is MissingZero!3277) lt!161652)) ((_ is MissingVacant!3277) lt!161652)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17925 (_ BitVec 32)) SeekEntryResult!3277)

(assert (=> b!340793 (= lt!161652 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!340794 () Bool)

(declare-fun e!209042 () Bool)

(assert (=> b!340794 (= e!209042 tp_is_empty!7161)))

(declare-fun b!340795 () Bool)

(declare-fun res!188287 () Bool)

(assert (=> b!340795 (=> (not res!188287) (not e!209043))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!340795 (= res!188287 (and (= (size!8834 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8835 _keys!1895) (size!8834 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!340796 () Bool)

(declare-fun e!209044 () Bool)

(assert (=> b!340796 (= e!209044 tp_is_empty!7161)))

(declare-fun b!340797 () Bool)

(declare-fun res!188288 () Bool)

(assert (=> b!340797 (=> (not res!188288) (not e!209043))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17925 (_ BitVec 32)) Bool)

(assert (=> b!340797 (= res!188288 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!12168 () Bool)

(declare-fun mapRes!12168 () Bool)

(declare-fun tp!25160 () Bool)

(assert (=> mapNonEmpty!12168 (= mapRes!12168 (and tp!25160 e!209044))))

(declare-fun mapValue!12168 () ValueCell!3237)

(declare-fun mapRest!12168 () (Array (_ BitVec 32) ValueCell!3237))

(declare-fun mapKey!12168 () (_ BitVec 32))

(assert (=> mapNonEmpty!12168 (= (arr!8482 _values!1525) (store mapRest!12168 mapKey!12168 mapValue!12168))))

(declare-fun b!340798 () Bool)

(declare-fun res!188283 () Bool)

(assert (=> b!340798 (=> (not res!188283) (not e!209043))))

(declare-fun zeroValue!1467 () V!10525)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10525)

(declare-datatypes ((tuple2!5260 0))(
  ( (tuple2!5261 (_1!2641 (_ BitVec 64)) (_2!2641 V!10525)) )
))
(declare-datatypes ((List!4879 0))(
  ( (Nil!4876) (Cons!4875 (h!5731 tuple2!5260) (t!9987 List!4879)) )
))
(declare-datatypes ((ListLongMap!4173 0))(
  ( (ListLongMap!4174 (toList!2102 List!4879)) )
))
(declare-fun contains!2156 (ListLongMap!4173 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1623 (array!17925 array!17923 (_ BitVec 32) (_ BitVec 32) V!10525 V!10525 (_ BitVec 32) Int) ListLongMap!4173)

(assert (=> b!340798 (= res!188283 (not (contains!2156 (getCurrentListMap!1623 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!340799 () Bool)

(declare-fun res!188284 () Bool)

(assert (=> b!340799 (=> (not res!188284) (not e!209043))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!340799 (= res!188284 (validKeyInArray!0 k0!1348))))

(declare-fun b!340800 () Bool)

(declare-fun res!188285 () Bool)

(assert (=> b!340800 (=> (not res!188285) (not e!209045))))

(declare-fun arrayContainsKey!0 (array!17925 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!340800 (= res!188285 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!340801 () Bool)

(declare-fun res!188282 () Bool)

(assert (=> b!340801 (=> (not res!188282) (not e!209043))))

(declare-datatypes ((List!4880 0))(
  ( (Nil!4877) (Cons!4876 (h!5732 (_ BitVec 64)) (t!9988 List!4880)) )
))
(declare-fun arrayNoDuplicates!0 (array!17925 (_ BitVec 32) List!4880) Bool)

(assert (=> b!340801 (= res!188282 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4877))))

(declare-fun mapIsEmpty!12168 () Bool)

(assert (=> mapIsEmpty!12168 mapRes!12168))

(declare-fun b!340802 () Bool)

(assert (=> b!340802 (= e!209041 (and e!209042 mapRes!12168))))

(declare-fun condMapEmpty!12168 () Bool)

(declare-fun mapDefault!12168 () ValueCell!3237)

(assert (=> b!340802 (= condMapEmpty!12168 (= (arr!8482 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3237)) mapDefault!12168)))))

(assert (= (and start!34186 res!188281) b!340795))

(assert (= (and b!340795 res!188287) b!340797))

(assert (= (and b!340797 res!188288) b!340801))

(assert (= (and b!340801 res!188282) b!340799))

(assert (= (and b!340799 res!188284) b!340798))

(assert (= (and b!340798 res!188283) b!340793))

(assert (= (and b!340793 res!188286) b!340800))

(assert (= (and b!340800 res!188285) b!340792))

(assert (= (and b!340802 condMapEmpty!12168) mapIsEmpty!12168))

(assert (= (and b!340802 (not condMapEmpty!12168)) mapNonEmpty!12168))

(assert (= (and mapNonEmpty!12168 ((_ is ValueCellFull!3237) mapValue!12168)) b!340796))

(assert (= (and b!340802 ((_ is ValueCellFull!3237) mapDefault!12168)) b!340794))

(assert (= start!34186 b!340802))

(declare-fun m!343399 () Bool)

(assert (=> start!34186 m!343399))

(declare-fun m!343401 () Bool)

(assert (=> start!34186 m!343401))

(declare-fun m!343403 () Bool)

(assert (=> start!34186 m!343403))

(declare-fun m!343405 () Bool)

(assert (=> b!340801 m!343405))

(declare-fun m!343407 () Bool)

(assert (=> b!340800 m!343407))

(declare-fun m!343409 () Bool)

(assert (=> b!340799 m!343409))

(declare-fun m!343411 () Bool)

(assert (=> b!340793 m!343411))

(declare-fun m!343413 () Bool)

(assert (=> mapNonEmpty!12168 m!343413))

(declare-fun m!343415 () Bool)

(assert (=> b!340792 m!343415))

(declare-fun m!343417 () Bool)

(assert (=> b!340797 m!343417))

(declare-fun m!343419 () Bool)

(assert (=> b!340798 m!343419))

(assert (=> b!340798 m!343419))

(declare-fun m!343421 () Bool)

(assert (=> b!340798 m!343421))

(check-sat b_and!14409 (not b!340798) (not start!34186) (not b!340792) (not mapNonEmpty!12168) tp_is_empty!7161 (not b!340793) (not b!340800) (not b_next!7209) (not b!340799) (not b!340797) (not b!340801))
(check-sat b_and!14409 (not b_next!7209))
