; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34308 () Bool)

(assert start!34308)

(declare-fun b_free!7297 () Bool)

(declare-fun b_next!7297 () Bool)

(assert (=> start!34308 (= b_free!7297 (not b_next!7297))))

(declare-fun tp!25430 () Bool)

(declare-fun b_and!14475 () Bool)

(assert (=> start!34308 (= tp!25430 b_and!14475)))

(declare-fun b!342312 () Bool)

(declare-fun e!209908 () Bool)

(declare-fun tp_is_empty!7249 () Bool)

(assert (=> b!342312 (= e!209908 tp_is_empty!7249)))

(declare-fun mapNonEmpty!12306 () Bool)

(declare-fun mapRes!12306 () Bool)

(declare-fun tp!25431 () Bool)

(assert (=> mapNonEmpty!12306 (= mapRes!12306 (and tp!25431 e!209908))))

(declare-datatypes ((V!10643 0))(
  ( (V!10644 (val!3669 Int)) )
))
(declare-datatypes ((ValueCell!3281 0))(
  ( (ValueCellFull!3281 (v!5837 V!10643)) (EmptyCell!3281) )
))
(declare-fun mapRest!12306 () (Array (_ BitVec 32) ValueCell!3281))

(declare-datatypes ((array!18077 0))(
  ( (array!18078 (arr!8557 (Array (_ BitVec 32) ValueCell!3281)) (size!8910 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18077)

(declare-fun mapValue!12306 () ValueCell!3281)

(declare-fun mapKey!12306 () (_ BitVec 32))

(assert (=> mapNonEmpty!12306 (= (arr!8557 _values!1525) (store mapRest!12306 mapKey!12306 mapValue!12306))))

(declare-fun b!342313 () Bool)

(declare-fun res!189251 () Bool)

(declare-fun e!209903 () Bool)

(assert (=> b!342313 (=> (not res!189251) (not e!209903))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun zeroValue!1467 () V!10643)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((array!18079 0))(
  ( (array!18080 (arr!8558 (Array (_ BitVec 32) (_ BitVec 64))) (size!8911 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18079)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10643)

(declare-datatypes ((tuple2!5266 0))(
  ( (tuple2!5267 (_1!2644 (_ BitVec 64)) (_2!2644 V!10643)) )
))
(declare-datatypes ((List!4889 0))(
  ( (Nil!4886) (Cons!4885 (h!5741 tuple2!5266) (t!9992 List!4889)) )
))
(declare-datatypes ((ListLongMap!4169 0))(
  ( (ListLongMap!4170 (toList!2100 List!4889)) )
))
(declare-fun contains!2167 (ListLongMap!4169 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1606 (array!18079 array!18077 (_ BitVec 32) (_ BitVec 32) V!10643 V!10643 (_ BitVec 32) Int) ListLongMap!4169)

(assert (=> b!342313 (= res!189251 (not (contains!2167 (getCurrentListMap!1606 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!342314 () Bool)

(declare-fun e!209905 () Bool)

(assert (=> b!342314 (= e!209903 e!209905)))

(declare-fun res!189247 () Bool)

(assert (=> b!342314 (=> (not res!189247) (not e!209905))))

(declare-datatypes ((SeekEntryResult!3298 0))(
  ( (MissingZero!3298 (index!15371 (_ BitVec 32))) (Found!3298 (index!15372 (_ BitVec 32))) (Intermediate!3298 (undefined!4110 Bool) (index!15373 (_ BitVec 32)) (x!34099 (_ BitVec 32))) (Undefined!3298) (MissingVacant!3298 (index!15374 (_ BitVec 32))) )
))
(declare-fun lt!161961 () SeekEntryResult!3298)

(get-info :version)

(assert (=> b!342314 (= res!189247 (and (not ((_ is Found!3298) lt!161961)) (not ((_ is MissingZero!3298) lt!161961)) ((_ is MissingVacant!3298) lt!161961)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18079 (_ BitVec 32)) SeekEntryResult!3298)

(assert (=> b!342314 (= lt!161961 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!342315 () Bool)

(declare-fun e!209907 () Bool)

(declare-fun e!209906 () Bool)

(assert (=> b!342315 (= e!209907 (and e!209906 mapRes!12306))))

(declare-fun condMapEmpty!12306 () Bool)

(declare-fun mapDefault!12306 () ValueCell!3281)

(assert (=> b!342315 (= condMapEmpty!12306 (= (arr!8557 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3281)) mapDefault!12306)))))

(declare-fun b!342316 () Bool)

(assert (=> b!342316 (= e!209905 false)))

(declare-datatypes ((Unit!10639 0))(
  ( (Unit!10640) )
))
(declare-fun lt!161960 () Unit!10639)

(declare-fun e!209902 () Unit!10639)

(assert (=> b!342316 (= lt!161960 e!209902)))

(declare-fun c!52754 () Bool)

(declare-fun arrayContainsKey!0 (array!18079 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!342316 (= c!52754 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!342318 () Bool)

(declare-fun res!189248 () Bool)

(assert (=> b!342318 (=> (not res!189248) (not e!209903))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18079 (_ BitVec 32)) Bool)

(assert (=> b!342318 (= res!189248 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!12306 () Bool)

(assert (=> mapIsEmpty!12306 mapRes!12306))

(declare-fun b!342319 () Bool)

(assert (=> b!342319 (= e!209906 tp_is_empty!7249)))

(declare-fun b!342320 () Bool)

(declare-fun res!189245 () Bool)

(assert (=> b!342320 (=> (not res!189245) (not e!209903))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!342320 (= res!189245 (validKeyInArray!0 k0!1348))))

(declare-fun b!342321 () Bool)

(declare-fun Unit!10641 () Unit!10639)

(assert (=> b!342321 (= e!209902 Unit!10641)))

(declare-fun lt!161959 () Unit!10639)

(declare-fun lemmaArrayContainsKeyThenInListMap!302 (array!18079 array!18077 (_ BitVec 32) (_ BitVec 32) V!10643 V!10643 (_ BitVec 64) (_ BitVec 32) Int) Unit!10639)

(declare-fun arrayScanForKey!0 (array!18079 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!342321 (= lt!161959 (lemmaArrayContainsKeyThenInListMap!302 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!342321 false))

(declare-fun b!342322 () Bool)

(declare-fun res!189246 () Bool)

(assert (=> b!342322 (=> (not res!189246) (not e!209903))))

(declare-datatypes ((List!4890 0))(
  ( (Nil!4887) (Cons!4886 (h!5742 (_ BitVec 64)) (t!9993 List!4890)) )
))
(declare-fun arrayNoDuplicates!0 (array!18079 (_ BitVec 32) List!4890) Bool)

(assert (=> b!342322 (= res!189246 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4887))))

(declare-fun b!342323 () Bool)

(declare-fun res!189249 () Bool)

(assert (=> b!342323 (=> (not res!189249) (not e!209903))))

(assert (=> b!342323 (= res!189249 (and (= (size!8910 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8911 _keys!1895) (size!8910 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!342317 () Bool)

(declare-fun Unit!10642 () Unit!10639)

(assert (=> b!342317 (= e!209902 Unit!10642)))

(declare-fun res!189250 () Bool)

(assert (=> start!34308 (=> (not res!189250) (not e!209903))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34308 (= res!189250 (validMask!0 mask!2385))))

(assert (=> start!34308 e!209903))

(assert (=> start!34308 true))

(assert (=> start!34308 tp_is_empty!7249))

(assert (=> start!34308 tp!25430))

(declare-fun array_inv!6364 (array!18077) Bool)

(assert (=> start!34308 (and (array_inv!6364 _values!1525) e!209907)))

(declare-fun array_inv!6365 (array!18079) Bool)

(assert (=> start!34308 (array_inv!6365 _keys!1895)))

(assert (= (and start!34308 res!189250) b!342323))

(assert (= (and b!342323 res!189249) b!342318))

(assert (= (and b!342318 res!189248) b!342322))

(assert (= (and b!342322 res!189246) b!342320))

(assert (= (and b!342320 res!189245) b!342313))

(assert (= (and b!342313 res!189251) b!342314))

(assert (= (and b!342314 res!189247) b!342316))

(assert (= (and b!342316 c!52754) b!342321))

(assert (= (and b!342316 (not c!52754)) b!342317))

(assert (= (and b!342315 condMapEmpty!12306) mapIsEmpty!12306))

(assert (= (and b!342315 (not condMapEmpty!12306)) mapNonEmpty!12306))

(assert (= (and mapNonEmpty!12306 ((_ is ValueCellFull!3281) mapValue!12306)) b!342312))

(assert (= (and b!342315 ((_ is ValueCellFull!3281) mapDefault!12306)) b!342319))

(assert (= start!34308 b!342315))

(declare-fun m!343971 () Bool)

(assert (=> mapNonEmpty!12306 m!343971))

(declare-fun m!343973 () Bool)

(assert (=> b!342318 m!343973))

(declare-fun m!343975 () Bool)

(assert (=> b!342320 m!343975))

(declare-fun m!343977 () Bool)

(assert (=> b!342314 m!343977))

(declare-fun m!343979 () Bool)

(assert (=> b!342321 m!343979))

(assert (=> b!342321 m!343979))

(declare-fun m!343981 () Bool)

(assert (=> b!342321 m!343981))

(declare-fun m!343983 () Bool)

(assert (=> b!342313 m!343983))

(assert (=> b!342313 m!343983))

(declare-fun m!343985 () Bool)

(assert (=> b!342313 m!343985))

(declare-fun m!343987 () Bool)

(assert (=> start!34308 m!343987))

(declare-fun m!343989 () Bool)

(assert (=> start!34308 m!343989))

(declare-fun m!343991 () Bool)

(assert (=> start!34308 m!343991))

(declare-fun m!343993 () Bool)

(assert (=> b!342322 m!343993))

(declare-fun m!343995 () Bool)

(assert (=> b!342316 m!343995))

(check-sat (not b!342313) tp_is_empty!7249 (not b!342314) (not b!342318) (not b_next!7297) b_and!14475 (not start!34308) (not b!342320) (not b!342322) (not b!342321) (not b!342316) (not mapNonEmpty!12306))
(check-sat b_and!14475 (not b_next!7297))
