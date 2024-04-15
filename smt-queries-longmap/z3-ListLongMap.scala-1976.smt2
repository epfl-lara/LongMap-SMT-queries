; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34704 () Bool)

(assert start!34704)

(declare-fun b_free!7525 () Bool)

(declare-fun b_next!7525 () Bool)

(assert (=> start!34704 (= b_free!7525 (not b_next!7525))))

(declare-fun tp!26138 () Bool)

(declare-fun b_and!14719 () Bool)

(assert (=> start!34704 (= tp!26138 b_and!14719)))

(declare-fun b!346803 () Bool)

(declare-fun e!212510 () Bool)

(declare-fun e!212512 () Bool)

(assert (=> b!346803 (= e!212510 e!212512)))

(declare-fun res!191944 () Bool)

(assert (=> b!346803 (=> (not res!191944) (not e!212512))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3380 0))(
  ( (MissingZero!3380 (index!15699 (_ BitVec 32))) (Found!3380 (index!15700 (_ BitVec 32))) (Intermediate!3380 (undefined!4192 Bool) (index!15701 (_ BitVec 32)) (x!34565 (_ BitVec 32))) (Undefined!3380) (MissingVacant!3380 (index!15702 (_ BitVec 32))) )
))
(declare-fun lt!163251 () SeekEntryResult!3380)

(declare-datatypes ((array!18529 0))(
  ( (array!18530 (arr!8775 (Array (_ BitVec 32) (_ BitVec 64))) (size!9128 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18529)

(get-info :version)

(assert (=> b!346803 (= res!191944 (and ((_ is Found!3380) lt!163251) (= (select (arr!8775 _keys!1895) (index!15700 lt!163251)) k0!1348)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18529 (_ BitVec 32)) SeekEntryResult!3380)

(assert (=> b!346803 (= lt!163251 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!346804 () Bool)

(declare-fun res!191938 () Bool)

(assert (=> b!346804 (=> (not res!191938) (not e!212510))))

(declare-datatypes ((List!5047 0))(
  ( (Nil!5044) (Cons!5043 (h!5899 (_ BitVec 64)) (t!10166 List!5047)) )
))
(declare-fun arrayNoDuplicates!0 (array!18529 (_ BitVec 32) List!5047) Bool)

(assert (=> b!346804 (= res!191938 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5044))))

(declare-fun b!346805 () Bool)

(declare-fun e!212511 () Bool)

(declare-fun tp_is_empty!7477 () Bool)

(assert (=> b!346805 (= e!212511 tp_is_empty!7477)))

(declare-fun res!191939 () Bool)

(assert (=> start!34704 (=> (not res!191939) (not e!212510))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34704 (= res!191939 (validMask!0 mask!2385))))

(assert (=> start!34704 e!212510))

(assert (=> start!34704 true))

(assert (=> start!34704 tp_is_empty!7477))

(assert (=> start!34704 tp!26138))

(declare-datatypes ((V!10947 0))(
  ( (V!10948 (val!3783 Int)) )
))
(declare-datatypes ((ValueCell!3395 0))(
  ( (ValueCellFull!3395 (v!5959 V!10947)) (EmptyCell!3395) )
))
(declare-datatypes ((array!18531 0))(
  ( (array!18532 (arr!8776 (Array (_ BitVec 32) ValueCell!3395)) (size!9129 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18531)

(declare-fun e!212507 () Bool)

(declare-fun array_inv!6518 (array!18531) Bool)

(assert (=> start!34704 (and (array_inv!6518 _values!1525) e!212507)))

(declare-fun array_inv!6519 (array!18529) Bool)

(assert (=> start!34704 (array_inv!6519 _keys!1895)))

(declare-fun b!346806 () Bool)

(declare-fun res!191940 () Bool)

(assert (=> b!346806 (=> (not res!191940) (not e!212512))))

(declare-fun arrayContainsKey!0 (array!18529 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!346806 (= res!191940 (arrayContainsKey!0 _keys!1895 k0!1348 (index!15700 lt!163251)))))

(declare-fun b!346807 () Bool)

(declare-fun mapRes!12672 () Bool)

(assert (=> b!346807 (= e!212507 (and e!212511 mapRes!12672))))

(declare-fun condMapEmpty!12672 () Bool)

(declare-fun mapDefault!12672 () ValueCell!3395)

(assert (=> b!346807 (= condMapEmpty!12672 (= (arr!8776 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3395)) mapDefault!12672)))))

(declare-fun mapIsEmpty!12672 () Bool)

(assert (=> mapIsEmpty!12672 mapRes!12672))

(declare-fun mapNonEmpty!12672 () Bool)

(declare-fun tp!26139 () Bool)

(declare-fun e!212509 () Bool)

(assert (=> mapNonEmpty!12672 (= mapRes!12672 (and tp!26139 e!212509))))

(declare-fun mapValue!12672 () ValueCell!3395)

(declare-fun mapKey!12672 () (_ BitVec 32))

(declare-fun mapRest!12672 () (Array (_ BitVec 32) ValueCell!3395))

(assert (=> mapNonEmpty!12672 (= (arr!8776 _values!1525) (store mapRest!12672 mapKey!12672 mapValue!12672))))

(declare-fun b!346808 () Bool)

(assert (=> b!346808 (= e!212509 tp_is_empty!7477)))

(declare-fun b!346809 () Bool)

(declare-fun res!191941 () Bool)

(assert (=> b!346809 (=> (not res!191941) (not e!212510))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!346809 (= res!191941 (validKeyInArray!0 k0!1348))))

(declare-fun b!346810 () Bool)

(declare-fun res!191945 () Bool)

(assert (=> b!346810 (=> (not res!191945) (not e!212510))))

(declare-fun zeroValue!1467 () V!10947)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10947)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((tuple2!5430 0))(
  ( (tuple2!5431 (_1!2726 (_ BitVec 64)) (_2!2726 V!10947)) )
))
(declare-datatypes ((List!5048 0))(
  ( (Nil!5045) (Cons!5044 (h!5900 tuple2!5430) (t!10167 List!5048)) )
))
(declare-datatypes ((ListLongMap!4333 0))(
  ( (ListLongMap!4334 (toList!2182 List!5048)) )
))
(declare-fun contains!2257 (ListLongMap!4333 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1688 (array!18529 array!18531 (_ BitVec 32) (_ BitVec 32) V!10947 V!10947 (_ BitVec 32) Int) ListLongMap!4333)

(assert (=> b!346810 (= res!191945 (not (contains!2257 (getCurrentListMap!1688 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!346811 () Bool)

(declare-fun res!191943 () Bool)

(assert (=> b!346811 (=> (not res!191943) (not e!212510))))

(assert (=> b!346811 (= res!191943 (and (= (size!9129 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9128 _keys!1895) (size!9129 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!346812 () Bool)

(declare-fun res!191942 () Bool)

(assert (=> b!346812 (=> (not res!191942) (not e!212510))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18529 (_ BitVec 32)) Bool)

(assert (=> b!346812 (= res!191942 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!346813 () Bool)

(assert (=> b!346813 (= e!212512 (not true))))

(assert (=> b!346813 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!10748 0))(
  ( (Unit!10749) )
))
(declare-fun lt!163250 () Unit!10748)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18529 (_ BitVec 64) (_ BitVec 32)) Unit!10748)

(assert (=> b!346813 (= lt!163250 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!15700 lt!163251)))))

(assert (= (and start!34704 res!191939) b!346811))

(assert (= (and b!346811 res!191943) b!346812))

(assert (= (and b!346812 res!191942) b!346804))

(assert (= (and b!346804 res!191938) b!346809))

(assert (= (and b!346809 res!191941) b!346810))

(assert (= (and b!346810 res!191945) b!346803))

(assert (= (and b!346803 res!191944) b!346806))

(assert (= (and b!346806 res!191940) b!346813))

(assert (= (and b!346807 condMapEmpty!12672) mapIsEmpty!12672))

(assert (= (and b!346807 (not condMapEmpty!12672)) mapNonEmpty!12672))

(assert (= (and mapNonEmpty!12672 ((_ is ValueCellFull!3395) mapValue!12672)) b!346808))

(assert (= (and b!346807 ((_ is ValueCellFull!3395) mapDefault!12672)) b!346805))

(assert (= start!34704 b!346807))

(declare-fun m!347333 () Bool)

(assert (=> b!346813 m!347333))

(declare-fun m!347335 () Bool)

(assert (=> b!346813 m!347335))

(declare-fun m!347337 () Bool)

(assert (=> b!346812 m!347337))

(declare-fun m!347339 () Bool)

(assert (=> b!346810 m!347339))

(assert (=> b!346810 m!347339))

(declare-fun m!347341 () Bool)

(assert (=> b!346810 m!347341))

(declare-fun m!347343 () Bool)

(assert (=> mapNonEmpty!12672 m!347343))

(declare-fun m!347345 () Bool)

(assert (=> b!346809 m!347345))

(declare-fun m!347347 () Bool)

(assert (=> start!34704 m!347347))

(declare-fun m!347349 () Bool)

(assert (=> start!34704 m!347349))

(declare-fun m!347351 () Bool)

(assert (=> start!34704 m!347351))

(declare-fun m!347353 () Bool)

(assert (=> b!346804 m!347353))

(declare-fun m!347355 () Bool)

(assert (=> b!346803 m!347355))

(declare-fun m!347357 () Bool)

(assert (=> b!346803 m!347357))

(declare-fun m!347359 () Bool)

(assert (=> b!346806 m!347359))

(check-sat (not b!346804) (not b!346812) (not b!346809) b_and!14719 (not start!34704) (not b!346813) (not b!346806) (not b!346810) tp_is_empty!7477 (not b_next!7525) (not b!346803) (not mapNonEmpty!12672))
(check-sat b_and!14719 (not b_next!7525))
