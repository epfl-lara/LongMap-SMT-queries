; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34750 () Bool)

(assert start!34750)

(declare-fun b_free!7549 () Bool)

(declare-fun b_next!7549 () Bool)

(assert (=> start!34750 (= b_free!7549 (not b_next!7549))))

(declare-fun tp!26214 () Bool)

(declare-fun b_and!14745 () Bool)

(assert (=> start!34750 (= tp!26214 b_and!14745)))

(declare-fun res!192282 () Bool)

(declare-fun e!212817 () Bool)

(assert (=> start!34750 (=> (not res!192282) (not e!212817))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34750 (= res!192282 (validMask!0 mask!2385))))

(assert (=> start!34750 e!212817))

(assert (=> start!34750 true))

(declare-fun tp_is_empty!7501 () Bool)

(assert (=> start!34750 tp_is_empty!7501))

(assert (=> start!34750 tp!26214))

(declare-datatypes ((V!10979 0))(
  ( (V!10980 (val!3795 Int)) )
))
(declare-datatypes ((ValueCell!3407 0))(
  ( (ValueCellFull!3407 (v!5972 V!10979)) (EmptyCell!3407) )
))
(declare-datatypes ((array!18579 0))(
  ( (array!18580 (arr!8799 (Array (_ BitVec 32) ValueCell!3407)) (size!9152 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18579)

(declare-fun e!212816 () Bool)

(declare-fun array_inv!6534 (array!18579) Bool)

(assert (=> start!34750 (and (array_inv!6534 _values!1525) e!212816)))

(declare-datatypes ((array!18581 0))(
  ( (array!18582 (arr!8800 (Array (_ BitVec 32) (_ BitVec 64))) (size!9153 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18581)

(declare-fun array_inv!6535 (array!18581) Bool)

(assert (=> start!34750 (array_inv!6535 _keys!1895)))

(declare-fun mapNonEmpty!12711 () Bool)

(declare-fun mapRes!12711 () Bool)

(declare-fun tp!26213 () Bool)

(declare-fun e!212814 () Bool)

(assert (=> mapNonEmpty!12711 (= mapRes!12711 (and tp!26213 e!212814))))

(declare-fun mapKey!12711 () (_ BitVec 32))

(declare-fun mapValue!12711 () ValueCell!3407)

(declare-fun mapRest!12711 () (Array (_ BitVec 32) ValueCell!3407))

(assert (=> mapNonEmpty!12711 (= (arr!8799 _values!1525) (store mapRest!12711 mapKey!12711 mapValue!12711))))

(declare-fun b!347336 () Bool)

(assert (=> b!347336 (= e!212814 tp_is_empty!7501)))

(declare-fun b!347337 () Bool)

(declare-fun res!192287 () Bool)

(assert (=> b!347337 (=> (not res!192287) (not e!212817))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!347337 (= res!192287 (validKeyInArray!0 k0!1348))))

(declare-fun b!347338 () Bool)

(declare-fun e!212818 () Bool)

(declare-fun e!212819 () Bool)

(assert (=> b!347338 (= e!212818 (not e!212819))))

(declare-fun res!192285 () Bool)

(assert (=> b!347338 (=> res!192285 e!212819)))

(declare-datatypes ((SeekEntryResult!3391 0))(
  ( (MissingZero!3391 (index!15743 (_ BitVec 32))) (Found!3391 (index!15744 (_ BitVec 32))) (Intermediate!3391 (undefined!4203 Bool) (index!15745 (_ BitVec 32)) (x!34618 (_ BitVec 32))) (Undefined!3391) (MissingVacant!3391 (index!15746 (_ BitVec 32))) )
))
(declare-fun lt!163421 () SeekEntryResult!3391)

(assert (=> b!347338 (= res!192285 (or (bvslt (index!15744 lt!163421) #b00000000000000000000000000000000) (bvsge (index!15744 lt!163421) (size!9153 _keys!1895))))))

(declare-fun arrayContainsKey!0 (array!18581 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!347338 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!10772 0))(
  ( (Unit!10773) )
))
(declare-fun lt!163422 () Unit!10772)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18581 (_ BitVec 64) (_ BitVec 32)) Unit!10772)

(assert (=> b!347338 (= lt!163422 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!15744 lt!163421)))))

(declare-fun mapIsEmpty!12711 () Bool)

(assert (=> mapIsEmpty!12711 mapRes!12711))

(declare-fun b!347339 () Bool)

(declare-fun e!212815 () Bool)

(assert (=> b!347339 (= e!212815 tp_is_empty!7501)))

(declare-fun b!347340 () Bool)

(declare-fun res!192288 () Bool)

(assert (=> b!347340 (=> (not res!192288) (not e!212817))))

(declare-datatypes ((List!5064 0))(
  ( (Nil!5061) (Cons!5060 (h!5916 (_ BitVec 64)) (t!10185 List!5064)) )
))
(declare-fun arrayNoDuplicates!0 (array!18581 (_ BitVec 32) List!5064) Bool)

(assert (=> b!347340 (= res!192288 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5061))))

(declare-fun b!347341 () Bool)

(assert (=> b!347341 (= e!212817 e!212818)))

(declare-fun res!192281 () Bool)

(assert (=> b!347341 (=> (not res!192281) (not e!212818))))

(get-info :version)

(assert (=> b!347341 (= res!192281 (and ((_ is Found!3391) lt!163421) (= (select (arr!8800 _keys!1895) (index!15744 lt!163421)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18581 (_ BitVec 32)) SeekEntryResult!3391)

(assert (=> b!347341 (= lt!163421 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!347342 () Bool)

(assert (=> b!347342 (= e!212816 (and e!212815 mapRes!12711))))

(declare-fun condMapEmpty!12711 () Bool)

(declare-fun mapDefault!12711 () ValueCell!3407)

(assert (=> b!347342 (= condMapEmpty!12711 (= (arr!8799 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3407)) mapDefault!12711)))))

(declare-fun b!347343 () Bool)

(declare-fun res!192289 () Bool)

(assert (=> b!347343 (=> (not res!192289) (not e!212817))))

(declare-fun zeroValue!1467 () V!10979)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10979)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-datatypes ((tuple2!5448 0))(
  ( (tuple2!5449 (_1!2735 (_ BitVec 64)) (_2!2735 V!10979)) )
))
(declare-datatypes ((List!5065 0))(
  ( (Nil!5062) (Cons!5061 (h!5917 tuple2!5448) (t!10186 List!5065)) )
))
(declare-datatypes ((ListLongMap!4351 0))(
  ( (ListLongMap!4352 (toList!2191 List!5065)) )
))
(declare-fun contains!2267 (ListLongMap!4351 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1697 (array!18581 array!18579 (_ BitVec 32) (_ BitVec 32) V!10979 V!10979 (_ BitVec 32) Int) ListLongMap!4351)

(assert (=> b!347343 (= res!192289 (not (contains!2267 (getCurrentListMap!1697 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!347344 () Bool)

(declare-fun res!192284 () Bool)

(assert (=> b!347344 (=> (not res!192284) (not e!212818))))

(assert (=> b!347344 (= res!192284 (arrayContainsKey!0 _keys!1895 k0!1348 (index!15744 lt!163421)))))

(declare-fun b!347345 () Bool)

(declare-fun res!192283 () Bool)

(assert (=> b!347345 (=> (not res!192283) (not e!212817))))

(assert (=> b!347345 (= res!192283 (and (= (size!9152 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9153 _keys!1895) (size!9152 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!347346 () Bool)

(assert (=> b!347346 (= e!212819 (validKeyInArray!0 (select (arr!8800 _keys!1895) (index!15744 lt!163421))))))

(declare-fun b!347347 () Bool)

(declare-fun res!192286 () Bool)

(assert (=> b!347347 (=> (not res!192286) (not e!212817))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18581 (_ BitVec 32)) Bool)

(assert (=> b!347347 (= res!192286 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(assert (= (and start!34750 res!192282) b!347345))

(assert (= (and b!347345 res!192283) b!347347))

(assert (= (and b!347347 res!192286) b!347340))

(assert (= (and b!347340 res!192288) b!347337))

(assert (= (and b!347337 res!192287) b!347343))

(assert (= (and b!347343 res!192289) b!347341))

(assert (= (and b!347341 res!192281) b!347344))

(assert (= (and b!347344 res!192284) b!347338))

(assert (= (and b!347338 (not res!192285)) b!347346))

(assert (= (and b!347342 condMapEmpty!12711) mapIsEmpty!12711))

(assert (= (and b!347342 (not condMapEmpty!12711)) mapNonEmpty!12711))

(assert (= (and mapNonEmpty!12711 ((_ is ValueCellFull!3407) mapValue!12711)) b!347336))

(assert (= (and b!347342 ((_ is ValueCellFull!3407) mapDefault!12711)) b!347339))

(assert (= start!34750 b!347342))

(declare-fun m!347769 () Bool)

(assert (=> b!347344 m!347769))

(declare-fun m!347771 () Bool)

(assert (=> b!347346 m!347771))

(assert (=> b!347346 m!347771))

(declare-fun m!347773 () Bool)

(assert (=> b!347346 m!347773))

(declare-fun m!347775 () Bool)

(assert (=> b!347347 m!347775))

(assert (=> b!347341 m!347771))

(declare-fun m!347777 () Bool)

(assert (=> b!347341 m!347777))

(declare-fun m!347779 () Bool)

(assert (=> start!34750 m!347779))

(declare-fun m!347781 () Bool)

(assert (=> start!34750 m!347781))

(declare-fun m!347783 () Bool)

(assert (=> start!34750 m!347783))

(declare-fun m!347785 () Bool)

(assert (=> mapNonEmpty!12711 m!347785))

(declare-fun m!347787 () Bool)

(assert (=> b!347337 m!347787))

(declare-fun m!347789 () Bool)

(assert (=> b!347340 m!347789))

(declare-fun m!347791 () Bool)

(assert (=> b!347338 m!347791))

(declare-fun m!347793 () Bool)

(assert (=> b!347338 m!347793))

(declare-fun m!347795 () Bool)

(assert (=> b!347343 m!347795))

(assert (=> b!347343 m!347795))

(declare-fun m!347797 () Bool)

(assert (=> b!347343 m!347797))

(check-sat (not b!347341) (not b!347347) b_and!14745 (not b!347346) (not b!347337) (not b!347344) (not b!347343) (not b_next!7549) tp_is_empty!7501 (not start!34750) (not b!347338) (not mapNonEmpty!12711) (not b!347340))
(check-sat b_and!14745 (not b_next!7549))
