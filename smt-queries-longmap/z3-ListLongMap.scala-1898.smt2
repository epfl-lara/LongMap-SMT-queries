; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33880 () Bool)

(assert start!33880)

(declare-fun b_free!7059 () Bool)

(declare-fun b_next!7059 () Bool)

(assert (=> start!33880 (= b_free!7059 (not b_next!7059))))

(declare-fun tp!24689 () Bool)

(declare-fun b_and!14245 () Bool)

(assert (=> start!33880 (= tp!24689 b_and!14245)))

(declare-fun b!337293 () Bool)

(declare-fun res!186291 () Bool)

(declare-fun e!206987 () Bool)

(assert (=> b!337293 (=> (not res!186291) (not e!206987))))

(declare-datatypes ((array!17617 0))(
  ( (array!17618 (arr!8336 (Array (_ BitVec 32) (_ BitVec 64))) (size!8688 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17617)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!17617 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!337293 (= res!186291 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!337294 () Bool)

(declare-fun e!206986 () Bool)

(assert (=> b!337294 (= e!206986 e!206987)))

(declare-fun res!186295 () Bool)

(assert (=> b!337294 (=> (not res!186295) (not e!206987))))

(declare-datatypes ((SeekEntryResult!3222 0))(
  ( (MissingZero!3222 (index!15067 (_ BitVec 32))) (Found!3222 (index!15068 (_ BitVec 32))) (Intermediate!3222 (undefined!4034 Bool) (index!15069 (_ BitVec 32)) (x!33618 (_ BitVec 32))) (Undefined!3222) (MissingVacant!3222 (index!15070 (_ BitVec 32))) )
))
(declare-fun lt!160407 () SeekEntryResult!3222)

(get-info :version)

(assert (=> b!337294 (= res!186295 (and (not ((_ is Found!3222) lt!160407)) ((_ is MissingZero!3222) lt!160407)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17617 (_ BitVec 32)) SeekEntryResult!3222)

(assert (=> b!337294 (= lt!160407 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!11922 () Bool)

(declare-fun mapRes!11922 () Bool)

(declare-fun tp!24690 () Bool)

(declare-fun e!206984 () Bool)

(assert (=> mapNonEmpty!11922 (= mapRes!11922 (and tp!24690 e!206984))))

(declare-datatypes ((V!10325 0))(
  ( (V!10326 (val!3550 Int)) )
))
(declare-datatypes ((ValueCell!3162 0))(
  ( (ValueCellFull!3162 (v!5715 V!10325)) (EmptyCell!3162) )
))
(declare-datatypes ((array!17619 0))(
  ( (array!17620 (arr!8337 (Array (_ BitVec 32) ValueCell!3162)) (size!8689 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17619)

(declare-fun mapRest!11922 () (Array (_ BitVec 32) ValueCell!3162))

(declare-fun mapKey!11922 () (_ BitVec 32))

(declare-fun mapValue!11922 () ValueCell!3162)

(assert (=> mapNonEmpty!11922 (= (arr!8337 _values!1525) (store mapRest!11922 mapKey!11922 mapValue!11922))))

(declare-fun b!337295 () Bool)

(declare-fun res!186293 () Bool)

(assert (=> b!337295 (=> (not res!186293) (not e!206986))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17617 (_ BitVec 32)) Bool)

(assert (=> b!337295 (= res!186293 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!337296 () Bool)

(declare-fun res!186294 () Bool)

(assert (=> b!337296 (=> (not res!186294) (not e!206986))))

(declare-datatypes ((List!4772 0))(
  ( (Nil!4769) (Cons!4768 (h!5624 (_ BitVec 64)) (t!9866 List!4772)) )
))
(declare-fun arrayNoDuplicates!0 (array!17617 (_ BitVec 32) List!4772) Bool)

(assert (=> b!337296 (= res!186294 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4769))))

(declare-fun res!186289 () Bool)

(assert (=> start!33880 (=> (not res!186289) (not e!206986))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33880 (= res!186289 (validMask!0 mask!2385))))

(assert (=> start!33880 e!206986))

(assert (=> start!33880 true))

(declare-fun tp_is_empty!7011 () Bool)

(assert (=> start!33880 tp_is_empty!7011))

(assert (=> start!33880 tp!24689))

(declare-fun e!206983 () Bool)

(declare-fun array_inv!6188 (array!17619) Bool)

(assert (=> start!33880 (and (array_inv!6188 _values!1525) e!206983)))

(declare-fun array_inv!6189 (array!17617) Bool)

(assert (=> start!33880 (array_inv!6189 _keys!1895)))

(declare-fun b!337297 () Bool)

(declare-fun res!186296 () Bool)

(assert (=> b!337297 (=> (not res!186296) (not e!206986))))

(declare-fun zeroValue!1467 () V!10325)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10325)

(declare-datatypes ((tuple2!5156 0))(
  ( (tuple2!5157 (_1!2589 (_ BitVec 64)) (_2!2589 V!10325)) )
))
(declare-datatypes ((List!4773 0))(
  ( (Nil!4770) (Cons!4769 (h!5625 tuple2!5156) (t!9867 List!4773)) )
))
(declare-datatypes ((ListLongMap!4069 0))(
  ( (ListLongMap!4070 (toList!2050 List!4773)) )
))
(declare-fun contains!2097 (ListLongMap!4069 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1571 (array!17617 array!17619 (_ BitVec 32) (_ BitVec 32) V!10325 V!10325 (_ BitVec 32) Int) ListLongMap!4069)

(assert (=> b!337297 (= res!186296 (not (contains!2097 (getCurrentListMap!1571 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!337298 () Bool)

(assert (=> b!337298 (= e!206984 tp_is_empty!7011)))

(declare-fun b!337299 () Bool)

(assert (=> b!337299 (= e!206987 false)))

(declare-fun lt!160408 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!17617 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!337299 (= lt!160408 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!11922 () Bool)

(assert (=> mapIsEmpty!11922 mapRes!11922))

(declare-fun b!337300 () Bool)

(declare-fun e!206985 () Bool)

(assert (=> b!337300 (= e!206983 (and e!206985 mapRes!11922))))

(declare-fun condMapEmpty!11922 () Bool)

(declare-fun mapDefault!11922 () ValueCell!3162)

(assert (=> b!337300 (= condMapEmpty!11922 (= (arr!8337 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3162)) mapDefault!11922)))))

(declare-fun b!337301 () Bool)

(assert (=> b!337301 (= e!206985 tp_is_empty!7011)))

(declare-fun b!337302 () Bool)

(declare-fun res!186290 () Bool)

(assert (=> b!337302 (=> (not res!186290) (not e!206986))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!337302 (= res!186290 (validKeyInArray!0 k0!1348))))

(declare-fun b!337303 () Bool)

(declare-fun res!186292 () Bool)

(assert (=> b!337303 (=> (not res!186292) (not e!206986))))

(assert (=> b!337303 (= res!186292 (and (= (size!8689 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8688 _keys!1895) (size!8689 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(assert (= (and start!33880 res!186289) b!337303))

(assert (= (and b!337303 res!186292) b!337295))

(assert (= (and b!337295 res!186293) b!337296))

(assert (= (and b!337296 res!186294) b!337302))

(assert (= (and b!337302 res!186290) b!337297))

(assert (= (and b!337297 res!186296) b!337294))

(assert (= (and b!337294 res!186295) b!337293))

(assert (= (and b!337293 res!186291) b!337299))

(assert (= (and b!337300 condMapEmpty!11922) mapIsEmpty!11922))

(assert (= (and b!337300 (not condMapEmpty!11922)) mapNonEmpty!11922))

(assert (= (and mapNonEmpty!11922 ((_ is ValueCellFull!3162) mapValue!11922)) b!337298))

(assert (= (and b!337300 ((_ is ValueCellFull!3162) mapDefault!11922)) b!337301))

(assert (= start!33880 b!337300))

(declare-fun m!340859 () Bool)

(assert (=> b!337297 m!340859))

(assert (=> b!337297 m!340859))

(declare-fun m!340861 () Bool)

(assert (=> b!337297 m!340861))

(declare-fun m!340863 () Bool)

(assert (=> b!337296 m!340863))

(declare-fun m!340865 () Bool)

(assert (=> b!337294 m!340865))

(declare-fun m!340867 () Bool)

(assert (=> mapNonEmpty!11922 m!340867))

(declare-fun m!340869 () Bool)

(assert (=> b!337293 m!340869))

(declare-fun m!340871 () Bool)

(assert (=> b!337299 m!340871))

(declare-fun m!340873 () Bool)

(assert (=> b!337295 m!340873))

(declare-fun m!340875 () Bool)

(assert (=> start!33880 m!340875))

(declare-fun m!340877 () Bool)

(assert (=> start!33880 m!340877))

(declare-fun m!340879 () Bool)

(assert (=> start!33880 m!340879))

(declare-fun m!340881 () Bool)

(assert (=> b!337302 m!340881))

(check-sat (not b!337296) (not b!337295) (not b!337293) (not b!337299) (not b_next!7059) (not b!337297) (not b!337302) (not b!337294) (not start!33880) b_and!14245 (not mapNonEmpty!11922) tp_is_empty!7011)
(check-sat b_and!14245 (not b_next!7059))
