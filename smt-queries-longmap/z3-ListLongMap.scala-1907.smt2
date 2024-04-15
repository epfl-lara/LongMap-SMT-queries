; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33966 () Bool)

(assert start!33966)

(declare-fun b_free!7111 () Bool)

(declare-fun b_next!7111 () Bool)

(assert (=> start!33966 (= b_free!7111 (not b_next!7111))))

(declare-fun tp!24852 () Bool)

(declare-fun b_and!14275 () Bool)

(assert (=> start!33966 (= tp!24852 b_and!14275)))

(declare-fun b!338201 () Bool)

(declare-fun res!186842 () Bool)

(declare-fun e!207503 () Bool)

(assert (=> b!338201 (=> (not res!186842) (not e!207503))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10395 0))(
  ( (V!10396 (val!3576 Int)) )
))
(declare-datatypes ((ValueCell!3188 0))(
  ( (ValueCellFull!3188 (v!5737 V!10395)) (EmptyCell!3188) )
))
(declare-datatypes ((array!17703 0))(
  ( (array!17704 (arr!8377 (Array (_ BitVec 32) ValueCell!3188)) (size!8730 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17703)

(declare-datatypes ((array!17705 0))(
  ( (array!17706 (arr!8378 (Array (_ BitVec 32) (_ BitVec 64))) (size!8731 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17705)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!338201 (= res!186842 (and (= (size!8730 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8731 _keys!1895) (size!8730 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!338202 () Bool)

(declare-datatypes ((Unit!10491 0))(
  ( (Unit!10492) )
))
(declare-fun e!207506 () Unit!10491)

(declare-fun Unit!10493 () Unit!10491)

(assert (=> b!338202 (= e!207506 Unit!10493)))

(declare-fun b!338203 () Bool)

(declare-fun res!186845 () Bool)

(assert (=> b!338203 (=> (not res!186845) (not e!207503))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun zeroValue!1467 () V!10395)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10395)

(declare-datatypes ((tuple2!5136 0))(
  ( (tuple2!5137 (_1!2579 (_ BitVec 64)) (_2!2579 V!10395)) )
))
(declare-datatypes ((List!4766 0))(
  ( (Nil!4763) (Cons!4762 (h!5618 tuple2!5136) (t!9855 List!4766)) )
))
(declare-datatypes ((ListLongMap!4039 0))(
  ( (ListLongMap!4040 (toList!2035 List!4766)) )
))
(declare-fun contains!2095 (ListLongMap!4039 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1541 (array!17705 array!17703 (_ BitVec 32) (_ BitVec 32) V!10395 V!10395 (_ BitVec 32) Int) ListLongMap!4039)

(assert (=> b!338203 (= res!186845 (not (contains!2095 (getCurrentListMap!1541 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!338204 () Bool)

(declare-fun res!186840 () Bool)

(assert (=> b!338204 (=> (not res!186840) (not e!207503))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17705 (_ BitVec 32)) Bool)

(assert (=> b!338204 (= res!186840 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!338205 () Bool)

(declare-fun res!186844 () Bool)

(assert (=> b!338205 (=> (not res!186844) (not e!207503))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!338205 (= res!186844 (validKeyInArray!0 k0!1348))))

(declare-fun b!338206 () Bool)

(declare-fun e!207504 () Bool)

(declare-fun tp_is_empty!7063 () Bool)

(assert (=> b!338206 (= e!207504 tp_is_empty!7063)))

(declare-fun b!338207 () Bool)

(declare-fun e!207505 () Bool)

(assert (=> b!338207 (= e!207503 e!207505)))

(declare-fun res!186843 () Bool)

(assert (=> b!338207 (=> (not res!186843) (not e!207505))))

(declare-datatypes ((SeekEntryResult!3234 0))(
  ( (MissingZero!3234 (index!15115 (_ BitVec 32))) (Found!3234 (index!15116 (_ BitVec 32))) (Intermediate!3234 (undefined!4046 Bool) (index!15117 (_ BitVec 32)) (x!33717 (_ BitVec 32))) (Undefined!3234) (MissingVacant!3234 (index!15118 (_ BitVec 32))) )
))
(declare-fun lt!160584 () SeekEntryResult!3234)

(get-info :version)

(assert (=> b!338207 (= res!186843 (and (not ((_ is Found!3234) lt!160584)) ((_ is MissingZero!3234) lt!160584)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17705 (_ BitVec 32)) SeekEntryResult!3234)

(assert (=> b!338207 (= lt!160584 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!338208 () Bool)

(declare-fun Unit!10494 () Unit!10491)

(assert (=> b!338208 (= e!207506 Unit!10494)))

(declare-fun lt!160583 () Unit!10491)

(declare-fun lemmaArrayContainsKeyThenInListMap!275 (array!17705 array!17703 (_ BitVec 32) (_ BitVec 32) V!10395 V!10395 (_ BitVec 64) (_ BitVec 32) Int) Unit!10491)

(declare-fun arrayScanForKey!0 (array!17705 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!338208 (= lt!160583 (lemmaArrayContainsKeyThenInListMap!275 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!338208 false))

(declare-fun b!338209 () Bool)

(declare-fun e!207508 () Bool)

(assert (=> b!338209 (= e!207508 tp_is_empty!7063)))

(declare-fun b!338210 () Bool)

(declare-fun res!186839 () Bool)

(assert (=> b!338210 (=> (not res!186839) (not e!207503))))

(declare-datatypes ((List!4767 0))(
  ( (Nil!4764) (Cons!4763 (h!5619 (_ BitVec 64)) (t!9856 List!4767)) )
))
(declare-fun arrayNoDuplicates!0 (array!17705 (_ BitVec 32) List!4767) Bool)

(assert (=> b!338210 (= res!186839 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4764))))

(declare-fun mapNonEmpty!12006 () Bool)

(declare-fun mapRes!12006 () Bool)

(declare-fun tp!24851 () Bool)

(assert (=> mapNonEmpty!12006 (= mapRes!12006 (and tp!24851 e!207504))))

(declare-fun mapValue!12006 () ValueCell!3188)

(declare-fun mapKey!12006 () (_ BitVec 32))

(declare-fun mapRest!12006 () (Array (_ BitVec 32) ValueCell!3188))

(assert (=> mapNonEmpty!12006 (= (arr!8377 _values!1525) (store mapRest!12006 mapKey!12006 mapValue!12006))))

(declare-fun b!338211 () Bool)

(declare-fun e!207507 () Bool)

(assert (=> b!338211 (= e!207507 (and e!207508 mapRes!12006))))

(declare-fun condMapEmpty!12006 () Bool)

(declare-fun mapDefault!12006 () ValueCell!3188)

(assert (=> b!338211 (= condMapEmpty!12006 (= (arr!8377 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3188)) mapDefault!12006)))))

(declare-fun b!338212 () Bool)

(declare-fun lt!160581 () Bool)

(assert (=> b!338212 (= e!207505 (and (not lt!160581) (not (= (size!8731 _keys!1895) (bvadd #b00000000000000000000000000000001 mask!2385)))))))

(declare-fun lt!160582 () Unit!10491)

(assert (=> b!338212 (= lt!160582 e!207506)))

(declare-fun c!52355 () Bool)

(assert (=> b!338212 (= c!52355 lt!160581)))

(declare-fun arrayContainsKey!0 (array!17705 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!338212 (= lt!160581 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!12006 () Bool)

(assert (=> mapIsEmpty!12006 mapRes!12006))

(declare-fun res!186841 () Bool)

(assert (=> start!33966 (=> (not res!186841) (not e!207503))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33966 (= res!186841 (validMask!0 mask!2385))))

(assert (=> start!33966 e!207503))

(assert (=> start!33966 true))

(assert (=> start!33966 tp_is_empty!7063))

(assert (=> start!33966 tp!24852))

(declare-fun array_inv!6242 (array!17703) Bool)

(assert (=> start!33966 (and (array_inv!6242 _values!1525) e!207507)))

(declare-fun array_inv!6243 (array!17705) Bool)

(assert (=> start!33966 (array_inv!6243 _keys!1895)))

(assert (= (and start!33966 res!186841) b!338201))

(assert (= (and b!338201 res!186842) b!338204))

(assert (= (and b!338204 res!186840) b!338210))

(assert (= (and b!338210 res!186839) b!338205))

(assert (= (and b!338205 res!186844) b!338203))

(assert (= (and b!338203 res!186845) b!338207))

(assert (= (and b!338207 res!186843) b!338212))

(assert (= (and b!338212 c!52355) b!338208))

(assert (= (and b!338212 (not c!52355)) b!338202))

(assert (= (and b!338211 condMapEmpty!12006) mapIsEmpty!12006))

(assert (= (and b!338211 (not condMapEmpty!12006)) mapNonEmpty!12006))

(assert (= (and mapNonEmpty!12006 ((_ is ValueCellFull!3188) mapValue!12006)) b!338206))

(assert (= (and b!338211 ((_ is ValueCellFull!3188) mapDefault!12006)) b!338209))

(assert (= start!33966 b!338211))

(declare-fun m!340987 () Bool)

(assert (=> b!338208 m!340987))

(assert (=> b!338208 m!340987))

(declare-fun m!340989 () Bool)

(assert (=> b!338208 m!340989))

(declare-fun m!340991 () Bool)

(assert (=> b!338205 m!340991))

(declare-fun m!340993 () Bool)

(assert (=> b!338203 m!340993))

(assert (=> b!338203 m!340993))

(declare-fun m!340995 () Bool)

(assert (=> b!338203 m!340995))

(declare-fun m!340997 () Bool)

(assert (=> b!338210 m!340997))

(declare-fun m!340999 () Bool)

(assert (=> b!338204 m!340999))

(declare-fun m!341001 () Bool)

(assert (=> b!338207 m!341001))

(declare-fun m!341003 () Bool)

(assert (=> start!33966 m!341003))

(declare-fun m!341005 () Bool)

(assert (=> start!33966 m!341005))

(declare-fun m!341007 () Bool)

(assert (=> start!33966 m!341007))

(declare-fun m!341009 () Bool)

(assert (=> mapNonEmpty!12006 m!341009))

(declare-fun m!341011 () Bool)

(assert (=> b!338212 m!341011))

(check-sat (not start!33966) (not b!338207) (not b_next!7111) (not b!338205) (not b!338212) tp_is_empty!7063 (not b!338204) (not b!338208) (not b!338203) b_and!14275 (not b!338210) (not mapNonEmpty!12006))
(check-sat b_and!14275 (not b_next!7111))
