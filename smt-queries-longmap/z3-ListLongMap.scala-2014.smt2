; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35110 () Bool)

(assert start!35110)

(declare-fun b_free!7755 () Bool)

(declare-fun b_next!7755 () Bool)

(assert (=> start!35110 (= b_free!7755 (not b_next!7755))))

(declare-fun tp!26850 () Bool)

(declare-fun b_and!14989 () Bool)

(assert (=> start!35110 (= tp!26850 b_and!14989)))

(declare-fun b!352004 () Bool)

(declare-fun e!215556 () Bool)

(declare-fun e!215559 () Bool)

(assert (=> b!352004 (= e!215556 e!215559)))

(declare-fun res!195214 () Bool)

(assert (=> b!352004 (=> (not res!195214) (not e!215559))))

(declare-datatypes ((SeekEntryResult!3465 0))(
  ( (MissingZero!3465 (index!16039 (_ BitVec 32))) (Found!3465 (index!16040 (_ BitVec 32))) (Intermediate!3465 (undefined!4277 Bool) (index!16041 (_ BitVec 32)) (x!35029 (_ BitVec 32))) (Undefined!3465) (MissingVacant!3465 (index!16042 (_ BitVec 32))) )
))
(declare-fun lt!165033 () SeekEntryResult!3465)

(get-info :version)

(assert (=> b!352004 (= res!195214 (and (not ((_ is Found!3465) lt!165033)) (not ((_ is MissingZero!3465) lt!165033)) ((_ is MissingVacant!3465) lt!165033)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((array!19003 0))(
  ( (array!19004 (arr!9005 (Array (_ BitVec 32) (_ BitVec 64))) (size!9357 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!19003)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!19003 (_ BitVec 32)) SeekEntryResult!3465)

(assert (=> b!352004 (= lt!165033 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!352005 () Bool)

(declare-datatypes ((Unit!10882 0))(
  ( (Unit!10883) )
))
(declare-fun e!215554 () Unit!10882)

(declare-fun Unit!10884 () Unit!10882)

(assert (=> b!352005 (= e!215554 Unit!10884)))

(declare-fun mapNonEmpty!13038 () Bool)

(declare-fun mapRes!13038 () Bool)

(declare-fun tp!26849 () Bool)

(declare-fun e!215557 () Bool)

(assert (=> mapNonEmpty!13038 (= mapRes!13038 (and tp!26849 e!215557))))

(declare-datatypes ((V!11253 0))(
  ( (V!11254 (val!3898 Int)) )
))
(declare-datatypes ((ValueCell!3510 0))(
  ( (ValueCellFull!3510 (v!6087 V!11253)) (EmptyCell!3510) )
))
(declare-datatypes ((array!19005 0))(
  ( (array!19006 (arr!9006 (Array (_ BitVec 32) ValueCell!3510)) (size!9358 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!19005)

(declare-fun mapValue!13038 () ValueCell!3510)

(declare-fun mapKey!13038 () (_ BitVec 32))

(declare-fun mapRest!13038 () (Array (_ BitVec 32) ValueCell!3510))

(assert (=> mapNonEmpty!13038 (= (arr!9006 _values!1525) (store mapRest!13038 mapKey!13038 mapValue!13038))))

(declare-fun b!352006 () Bool)

(declare-fun res!195212 () Bool)

(assert (=> b!352006 (=> (not res!195212) (not e!215556))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!352006 (= res!195212 (validKeyInArray!0 k0!1348))))

(declare-fun b!352007 () Bool)

(declare-fun res!195213 () Bool)

(assert (=> b!352007 (=> (not res!195213) (not e!215556))))

(declare-datatypes ((List!5241 0))(
  ( (Nil!5238) (Cons!5237 (h!6093 (_ BitVec 64)) (t!10383 List!5241)) )
))
(declare-fun arrayNoDuplicates!0 (array!19003 (_ BitVec 32) List!5241) Bool)

(assert (=> b!352007 (= res!195213 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5238))))

(declare-fun b!352008 () Bool)

(declare-fun e!215555 () Bool)

(declare-fun tp_is_empty!7707 () Bool)

(assert (=> b!352008 (= e!215555 tp_is_empty!7707)))

(declare-fun mapIsEmpty!13038 () Bool)

(assert (=> mapIsEmpty!13038 mapRes!13038))

(declare-fun b!352009 () Bool)

(declare-fun e!215553 () Bool)

(assert (=> b!352009 (= e!215553 (and e!215555 mapRes!13038))))

(declare-fun condMapEmpty!13038 () Bool)

(declare-fun mapDefault!13038 () ValueCell!3510)

(assert (=> b!352009 (= condMapEmpty!13038 (= (arr!9006 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3510)) mapDefault!13038)))))

(declare-fun b!352010 () Bool)

(declare-fun res!195218 () Bool)

(assert (=> b!352010 (=> (not res!195218) (not e!215556))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19003 (_ BitVec 32)) Bool)

(assert (=> b!352010 (= res!195218 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!352011 () Bool)

(assert (=> b!352011 (= e!215557 tp_is_empty!7707)))

(declare-fun b!352012 () Bool)

(declare-fun Unit!10885 () Unit!10882)

(assert (=> b!352012 (= e!215554 Unit!10885)))

(declare-fun zeroValue!1467 () V!11253)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun lt!165032 () Unit!10882)

(declare-fun minValue!1467 () V!11253)

(declare-fun lemmaArrayContainsKeyThenInListMap!331 (array!19003 array!19005 (_ BitVec 32) (_ BitVec 32) V!11253 V!11253 (_ BitVec 64) (_ BitVec 32) Int) Unit!10882)

(declare-fun arrayScanForKey!0 (array!19003 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!352012 (= lt!165032 (lemmaArrayContainsKeyThenInListMap!331 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!352012 false))

(declare-fun res!195215 () Bool)

(assert (=> start!35110 (=> (not res!195215) (not e!215556))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35110 (= res!195215 (validMask!0 mask!2385))))

(assert (=> start!35110 e!215556))

(assert (=> start!35110 true))

(assert (=> start!35110 tp_is_empty!7707))

(assert (=> start!35110 tp!26850))

(declare-fun array_inv!6640 (array!19005) Bool)

(assert (=> start!35110 (and (array_inv!6640 _values!1525) e!215553)))

(declare-fun array_inv!6641 (array!19003) Bool)

(assert (=> start!35110 (array_inv!6641 _keys!1895)))

(declare-fun b!352013 () Bool)

(declare-fun res!195216 () Bool)

(assert (=> b!352013 (=> (not res!195216) (not e!215556))))

(declare-datatypes ((tuple2!5620 0))(
  ( (tuple2!5621 (_1!2821 (_ BitVec 64)) (_2!2821 V!11253)) )
))
(declare-datatypes ((List!5242 0))(
  ( (Nil!5239) (Cons!5238 (h!6094 tuple2!5620) (t!10384 List!5242)) )
))
(declare-datatypes ((ListLongMap!4533 0))(
  ( (ListLongMap!4534 (toList!2282 List!5242)) )
))
(declare-fun contains!2353 (ListLongMap!4533 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1803 (array!19003 array!19005 (_ BitVec 32) (_ BitVec 32) V!11253 V!11253 (_ BitVec 32) Int) ListLongMap!4533)

(assert (=> b!352013 (= res!195216 (not (contains!2353 (getCurrentListMap!1803 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!352014 () Bool)

(assert (=> b!352014 (= e!215559 false)))

(declare-fun lt!165034 () Unit!10882)

(assert (=> b!352014 (= lt!165034 e!215554)))

(declare-fun c!53511 () Bool)

(declare-fun arrayContainsKey!0 (array!19003 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!352014 (= c!53511 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!352015 () Bool)

(declare-fun res!195217 () Bool)

(assert (=> b!352015 (=> (not res!195217) (not e!215556))))

(assert (=> b!352015 (= res!195217 (and (= (size!9358 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9357 _keys!1895) (size!9358 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(assert (= (and start!35110 res!195215) b!352015))

(assert (= (and b!352015 res!195217) b!352010))

(assert (= (and b!352010 res!195218) b!352007))

(assert (= (and b!352007 res!195213) b!352006))

(assert (= (and b!352006 res!195212) b!352013))

(assert (= (and b!352013 res!195216) b!352004))

(assert (= (and b!352004 res!195214) b!352014))

(assert (= (and b!352014 c!53511) b!352012))

(assert (= (and b!352014 (not c!53511)) b!352005))

(assert (= (and b!352009 condMapEmpty!13038) mapIsEmpty!13038))

(assert (= (and b!352009 (not condMapEmpty!13038)) mapNonEmpty!13038))

(assert (= (and mapNonEmpty!13038 ((_ is ValueCellFull!3510) mapValue!13038)) b!352011))

(assert (= (and b!352009 ((_ is ValueCellFull!3510) mapDefault!13038)) b!352008))

(assert (= start!35110 b!352009))

(declare-fun m!351777 () Bool)

(assert (=> b!352012 m!351777))

(assert (=> b!352012 m!351777))

(declare-fun m!351779 () Bool)

(assert (=> b!352012 m!351779))

(declare-fun m!351781 () Bool)

(assert (=> b!352004 m!351781))

(declare-fun m!351783 () Bool)

(assert (=> start!35110 m!351783))

(declare-fun m!351785 () Bool)

(assert (=> start!35110 m!351785))

(declare-fun m!351787 () Bool)

(assert (=> start!35110 m!351787))

(declare-fun m!351789 () Bool)

(assert (=> b!352013 m!351789))

(assert (=> b!352013 m!351789))

(declare-fun m!351791 () Bool)

(assert (=> b!352013 m!351791))

(declare-fun m!351793 () Bool)

(assert (=> mapNonEmpty!13038 m!351793))

(declare-fun m!351795 () Bool)

(assert (=> b!352014 m!351795))

(declare-fun m!351797 () Bool)

(assert (=> b!352007 m!351797))

(declare-fun m!351799 () Bool)

(assert (=> b!352010 m!351799))

(declare-fun m!351801 () Bool)

(assert (=> b!352006 m!351801))

(check-sat (not mapNonEmpty!13038) (not b!352006) (not b!352012) (not b_next!7755) (not b!352014) (not b!352004) (not start!35110) (not b!352010) tp_is_empty!7707 (not b!352007) (not b!352013) b_and!14989)
(check-sat b_and!14989 (not b_next!7755))
