; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34330 () Bool)

(assert start!34330)

(declare-fun b_free!7305 () Bool)

(declare-fun b_next!7305 () Bool)

(assert (=> start!34330 (= b_free!7305 (not b_next!7305))))

(declare-fun tp!25455 () Bool)

(declare-fun b_and!14509 () Bool)

(assert (=> start!34330 (= tp!25455 b_and!14509)))

(declare-fun b!342731 () Bool)

(declare-fun e!210164 () Bool)

(declare-fun tp_is_empty!7257 () Bool)

(assert (=> b!342731 (= e!210164 tp_is_empty!7257)))

(declare-fun b!342732 () Bool)

(declare-fun res!189459 () Bool)

(declare-fun e!210163 () Bool)

(assert (=> b!342732 (=> (not res!189459) (not e!210163))))

(declare-datatypes ((array!18107 0))(
  ( (array!18108 (arr!8572 (Array (_ BitVec 32) (_ BitVec 64))) (size!8924 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18107)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18107 (_ BitVec 32)) Bool)

(assert (=> b!342732 (= res!189459 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!12318 () Bool)

(declare-fun mapRes!12318 () Bool)

(declare-fun tp!25454 () Bool)

(declare-fun e!210165 () Bool)

(assert (=> mapNonEmpty!12318 (= mapRes!12318 (and tp!25454 e!210165))))

(declare-fun mapKey!12318 () (_ BitVec 32))

(declare-datatypes ((V!10653 0))(
  ( (V!10654 (val!3673 Int)) )
))
(declare-datatypes ((ValueCell!3285 0))(
  ( (ValueCellFull!3285 (v!5847 V!10653)) (EmptyCell!3285) )
))
(declare-fun mapValue!12318 () ValueCell!3285)

(declare-fun mapRest!12318 () (Array (_ BitVec 32) ValueCell!3285))

(declare-datatypes ((array!18109 0))(
  ( (array!18110 (arr!8573 (Array (_ BitVec 32) ValueCell!3285)) (size!8925 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18109)

(assert (=> mapNonEmpty!12318 (= (arr!8573 _values!1525) (store mapRest!12318 mapKey!12318 mapValue!12318))))

(declare-fun b!342733 () Bool)

(declare-fun e!210162 () Bool)

(assert (=> b!342733 (= e!210162 (and e!210164 mapRes!12318))))

(declare-fun condMapEmpty!12318 () Bool)

(declare-fun mapDefault!12318 () ValueCell!3285)

(assert (=> b!342733 (= condMapEmpty!12318 (= (arr!8573 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3285)) mapDefault!12318)))))

(declare-fun b!342734 () Bool)

(declare-fun e!210166 () Bool)

(assert (=> b!342734 (= e!210163 e!210166)))

(declare-fun res!189460 () Bool)

(assert (=> b!342734 (=> (not res!189460) (not e!210166))))

(declare-datatypes ((SeekEntryResult!3307 0))(
  ( (MissingZero!3307 (index!15407 (_ BitVec 32))) (Found!3307 (index!15408 (_ BitVec 32))) (Intermediate!3307 (undefined!4119 Bool) (index!15409 (_ BitVec 32)) (x!34121 (_ BitVec 32))) (Undefined!3307) (MissingVacant!3307 (index!15410 (_ BitVec 32))) )
))
(declare-fun lt!162231 () SeekEntryResult!3307)

(get-info :version)

(assert (=> b!342734 (= res!189460 (and (not ((_ is Found!3307) lt!162231)) (not ((_ is MissingZero!3307) lt!162231)) ((_ is MissingVacant!3307) lt!162231)))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18107 (_ BitVec 32)) SeekEntryResult!3307)

(assert (=> b!342734 (= lt!162231 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!342735 () Bool)

(declare-fun res!189464 () Bool)

(assert (=> b!342735 (=> (not res!189464) (not e!210163))))

(declare-fun zeroValue!1467 () V!10653)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10653)

(declare-datatypes ((tuple2!5324 0))(
  ( (tuple2!5325 (_1!2673 (_ BitVec 64)) (_2!2673 V!10653)) )
))
(declare-datatypes ((List!4942 0))(
  ( (Nil!4939) (Cons!4938 (h!5794 tuple2!5324) (t!10054 List!4942)) )
))
(declare-datatypes ((ListLongMap!4237 0))(
  ( (ListLongMap!4238 (toList!2134 List!4942)) )
))
(declare-fun contains!2190 (ListLongMap!4237 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1655 (array!18107 array!18109 (_ BitVec 32) (_ BitVec 32) V!10653 V!10653 (_ BitVec 32) Int) ListLongMap!4237)

(assert (=> b!342735 (= res!189464 (not (contains!2190 (getCurrentListMap!1655 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!342736 () Bool)

(assert (=> b!342736 (= e!210166 false)))

(declare-datatypes ((Unit!10685 0))(
  ( (Unit!10686) )
))
(declare-fun lt!162232 () Unit!10685)

(declare-fun e!210168 () Unit!10685)

(assert (=> b!342736 (= lt!162232 e!210168)))

(declare-fun c!52839 () Bool)

(declare-fun arrayContainsKey!0 (array!18107 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!342736 (= c!52839 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!342737 () Bool)

(declare-fun res!189463 () Bool)

(assert (=> b!342737 (=> (not res!189463) (not e!210163))))

(assert (=> b!342737 (= res!189463 (and (= (size!8925 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8924 _keys!1895) (size!8925 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!342738 () Bool)

(declare-fun res!189461 () Bool)

(assert (=> b!342738 (=> (not res!189461) (not e!210163))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!342738 (= res!189461 (validKeyInArray!0 k0!1348))))

(declare-fun res!189458 () Bool)

(assert (=> start!34330 (=> (not res!189458) (not e!210163))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34330 (= res!189458 (validMask!0 mask!2385))))

(assert (=> start!34330 e!210163))

(assert (=> start!34330 true))

(assert (=> start!34330 tp_is_empty!7257))

(assert (=> start!34330 tp!25455))

(declare-fun array_inv!6348 (array!18109) Bool)

(assert (=> start!34330 (and (array_inv!6348 _values!1525) e!210162)))

(declare-fun array_inv!6349 (array!18107) Bool)

(assert (=> start!34330 (array_inv!6349 _keys!1895)))

(declare-fun b!342739 () Bool)

(declare-fun Unit!10687 () Unit!10685)

(assert (=> b!342739 (= e!210168 Unit!10687)))

(declare-fun lt!162230 () Unit!10685)

(declare-fun lemmaArrayContainsKeyThenInListMap!306 (array!18107 array!18109 (_ BitVec 32) (_ BitVec 32) V!10653 V!10653 (_ BitVec 64) (_ BitVec 32) Int) Unit!10685)

(declare-fun arrayScanForKey!0 (array!18107 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!342739 (= lt!162230 (lemmaArrayContainsKeyThenInListMap!306 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!342739 false))

(declare-fun b!342740 () Bool)

(assert (=> b!342740 (= e!210165 tp_is_empty!7257)))

(declare-fun b!342741 () Bool)

(declare-fun Unit!10688 () Unit!10685)

(assert (=> b!342741 (= e!210168 Unit!10688)))

(declare-fun mapIsEmpty!12318 () Bool)

(assert (=> mapIsEmpty!12318 mapRes!12318))

(declare-fun b!342742 () Bool)

(declare-fun res!189462 () Bool)

(assert (=> b!342742 (=> (not res!189462) (not e!210163))))

(declare-datatypes ((List!4943 0))(
  ( (Nil!4940) (Cons!4939 (h!5795 (_ BitVec 64)) (t!10055 List!4943)) )
))
(declare-fun arrayNoDuplicates!0 (array!18107 (_ BitVec 32) List!4943) Bool)

(assert (=> b!342742 (= res!189462 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4940))))

(assert (= (and start!34330 res!189458) b!342737))

(assert (= (and b!342737 res!189463) b!342732))

(assert (= (and b!342732 res!189459) b!342742))

(assert (= (and b!342742 res!189462) b!342738))

(assert (= (and b!342738 res!189461) b!342735))

(assert (= (and b!342735 res!189464) b!342734))

(assert (= (and b!342734 res!189460) b!342736))

(assert (= (and b!342736 c!52839) b!342739))

(assert (= (and b!342736 (not c!52839)) b!342741))

(assert (= (and b!342733 condMapEmpty!12318) mapIsEmpty!12318))

(assert (= (and b!342733 (not condMapEmpty!12318)) mapNonEmpty!12318))

(assert (= (and mapNonEmpty!12318 ((_ is ValueCellFull!3285) mapValue!12318)) b!342740))

(assert (= (and b!342733 ((_ is ValueCellFull!3285) mapDefault!12318)) b!342731))

(assert (= start!34330 b!342733))

(declare-fun m!344805 () Bool)

(assert (=> b!342736 m!344805))

(declare-fun m!344807 () Bool)

(assert (=> b!342742 m!344807))

(declare-fun m!344809 () Bool)

(assert (=> b!342732 m!344809))

(declare-fun m!344811 () Bool)

(assert (=> b!342734 m!344811))

(declare-fun m!344813 () Bool)

(assert (=> start!34330 m!344813))

(declare-fun m!344815 () Bool)

(assert (=> start!34330 m!344815))

(declare-fun m!344817 () Bool)

(assert (=> start!34330 m!344817))

(declare-fun m!344819 () Bool)

(assert (=> b!342735 m!344819))

(assert (=> b!342735 m!344819))

(declare-fun m!344821 () Bool)

(assert (=> b!342735 m!344821))

(declare-fun m!344823 () Bool)

(assert (=> mapNonEmpty!12318 m!344823))

(declare-fun m!344825 () Bool)

(assert (=> b!342738 m!344825))

(declare-fun m!344827 () Bool)

(assert (=> b!342739 m!344827))

(assert (=> b!342739 m!344827))

(declare-fun m!344829 () Bool)

(assert (=> b!342739 m!344829))

(check-sat (not b!342732) (not mapNonEmpty!12318) (not b_next!7305) (not start!34330) tp_is_empty!7257 (not b!342735) (not b!342736) (not b!342738) (not b!342742) (not b!342739) (not b!342734) b_and!14509)
(check-sat b_and!14509 (not b_next!7305))
