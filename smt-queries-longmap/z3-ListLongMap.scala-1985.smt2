; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34780 () Bool)

(assert start!34780)

(declare-fun b_free!7579 () Bool)

(declare-fun b_next!7579 () Bool)

(assert (=> start!34780 (= b_free!7579 (not b_next!7579))))

(declare-fun tp!26303 () Bool)

(declare-fun b_and!14815 () Bool)

(assert (=> start!34780 (= tp!26303 b_and!14815)))

(declare-fun b!348060 () Bool)

(declare-fun e!213274 () Bool)

(declare-fun tp_is_empty!7531 () Bool)

(assert (=> b!348060 (= e!213274 tp_is_empty!7531)))

(declare-fun b!348061 () Bool)

(declare-fun res!192775 () Bool)

(declare-fun e!213273 () Bool)

(assert (=> b!348061 (=> (not res!192775) (not e!213273))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((V!11019 0))(
  ( (V!11020 (val!3810 Int)) )
))
(declare-fun zeroValue!1467 () V!11019)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3422 0))(
  ( (ValueCellFull!3422 (v!5994 V!11019)) (EmptyCell!3422) )
))
(declare-datatypes ((array!18644 0))(
  ( (array!18645 (arr!8831 (Array (_ BitVec 32) ValueCell!3422)) (size!9183 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18644)

(declare-datatypes ((array!18646 0))(
  ( (array!18647 (arr!8832 (Array (_ BitVec 32) (_ BitVec 64))) (size!9184 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18646)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11019)

(declare-datatypes ((tuple2!5424 0))(
  ( (tuple2!5425 (_1!2723 (_ BitVec 64)) (_2!2723 V!11019)) )
))
(declare-datatypes ((List!5032 0))(
  ( (Nil!5029) (Cons!5028 (h!5884 tuple2!5424) (t!10154 List!5032)) )
))
(declare-datatypes ((ListLongMap!4339 0))(
  ( (ListLongMap!4340 (toList!2185 List!5032)) )
))
(declare-fun contains!2269 (ListLongMap!4339 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1713 (array!18646 array!18644 (_ BitVec 32) (_ BitVec 32) V!11019 V!11019 (_ BitVec 32) Int) ListLongMap!4339)

(assert (=> b!348061 (= res!192775 (not (contains!2269 (getCurrentListMap!1713 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!348062 () Bool)

(declare-fun res!192777 () Bool)

(assert (=> b!348062 (=> (not res!192777) (not e!213273))))

(declare-datatypes ((List!5033 0))(
  ( (Nil!5030) (Cons!5029 (h!5885 (_ BitVec 64)) (t!10155 List!5033)) )
))
(declare-fun arrayNoDuplicates!0 (array!18646 (_ BitVec 32) List!5033) Bool)

(assert (=> b!348062 (= res!192777 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5030))))

(declare-fun b!348063 () Bool)

(declare-fun res!192779 () Bool)

(assert (=> b!348063 (=> (not res!192779) (not e!213273))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!348063 (= res!192779 (validKeyInArray!0 k0!1348))))

(declare-fun b!348064 () Bool)

(declare-fun e!213272 () Bool)

(declare-fun e!213271 () Bool)

(declare-fun mapRes!12756 () Bool)

(assert (=> b!348064 (= e!213272 (and e!213271 mapRes!12756))))

(declare-fun condMapEmpty!12756 () Bool)

(declare-fun mapDefault!12756 () ValueCell!3422)

(assert (=> b!348064 (= condMapEmpty!12756 (= (arr!8831 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3422)) mapDefault!12756)))))

(declare-fun b!348065 () Bool)

(declare-fun res!192776 () Bool)

(assert (=> b!348065 (=> (not res!192776) (not e!213273))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18646 (_ BitVec 32)) Bool)

(assert (=> b!348065 (= res!192776 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!12756 () Bool)

(declare-fun tp!26304 () Bool)

(assert (=> mapNonEmpty!12756 (= mapRes!12756 (and tp!26304 e!213274))))

(declare-fun mapValue!12756 () ValueCell!3422)

(declare-fun mapRest!12756 () (Array (_ BitVec 32) ValueCell!3422))

(declare-fun mapKey!12756 () (_ BitVec 32))

(assert (=> mapNonEmpty!12756 (= (arr!8831 _values!1525) (store mapRest!12756 mapKey!12756 mapValue!12756))))

(declare-fun b!348066 () Bool)

(declare-fun res!192774 () Bool)

(assert (=> b!348066 (=> (not res!192774) (not e!213273))))

(assert (=> b!348066 (= res!192774 (and (= (size!9183 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9184 _keys!1895) (size!9183 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!348067 () Bool)

(assert (=> b!348067 (= e!213271 tp_is_empty!7531)))

(declare-fun res!192778 () Bool)

(assert (=> start!34780 (=> (not res!192778) (not e!213273))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34780 (= res!192778 (validMask!0 mask!2385))))

(assert (=> start!34780 e!213273))

(assert (=> start!34780 true))

(assert (=> start!34780 tp_is_empty!7531))

(assert (=> start!34780 tp!26303))

(declare-fun array_inv!6524 (array!18644) Bool)

(assert (=> start!34780 (and (array_inv!6524 _values!1525) e!213272)))

(declare-fun array_inv!6525 (array!18646) Bool)

(assert (=> start!34780 (array_inv!6525 _keys!1895)))

(declare-fun b!348068 () Bool)

(declare-fun e!213269 () Bool)

(assert (=> b!348068 (= e!213273 e!213269)))

(declare-fun res!192780 () Bool)

(assert (=> b!348068 (=> (not res!192780) (not e!213269))))

(declare-datatypes ((SeekEntryResult!3361 0))(
  ( (MissingZero!3361 (index!15623 (_ BitVec 32))) (Found!3361 (index!15624 (_ BitVec 32))) (Intermediate!3361 (undefined!4173 Bool) (index!15625 (_ BitVec 32)) (x!34630 (_ BitVec 32))) (Undefined!3361) (MissingVacant!3361 (index!15626 (_ BitVec 32))) )
))
(declare-fun lt!163836 () SeekEntryResult!3361)

(get-info :version)

(assert (=> b!348068 (= res!192780 (and (not ((_ is Found!3361) lt!163836)) ((_ is MissingZero!3361) lt!163836)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18646 (_ BitVec 32)) SeekEntryResult!3361)

(assert (=> b!348068 (= lt!163836 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!348069 () Bool)

(assert (=> b!348069 (= e!213269 false)))

(declare-fun lt!163837 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!18646 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!348069 (= lt!163837 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!12756 () Bool)

(assert (=> mapIsEmpty!12756 mapRes!12756))

(declare-fun b!348070 () Bool)

(declare-fun res!192781 () Bool)

(assert (=> b!348070 (=> (not res!192781) (not e!213269))))

(declare-fun arrayContainsKey!0 (array!18646 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!348070 (= res!192781 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(assert (= (and start!34780 res!192778) b!348066))

(assert (= (and b!348066 res!192774) b!348065))

(assert (= (and b!348065 res!192776) b!348062))

(assert (= (and b!348062 res!192777) b!348063))

(assert (= (and b!348063 res!192779) b!348061))

(assert (= (and b!348061 res!192775) b!348068))

(assert (= (and b!348068 res!192780) b!348070))

(assert (= (and b!348070 res!192781) b!348069))

(assert (= (and b!348064 condMapEmpty!12756) mapIsEmpty!12756))

(assert (= (and b!348064 (not condMapEmpty!12756)) mapNonEmpty!12756))

(assert (= (and mapNonEmpty!12756 ((_ is ValueCellFull!3422) mapValue!12756)) b!348060))

(assert (= (and b!348064 ((_ is ValueCellFull!3422) mapDefault!12756)) b!348067))

(assert (= start!34780 b!348064))

(declare-fun m!349197 () Bool)

(assert (=> b!348065 m!349197))

(declare-fun m!349199 () Bool)

(assert (=> b!348068 m!349199))

(declare-fun m!349201 () Bool)

(assert (=> mapNonEmpty!12756 m!349201))

(declare-fun m!349203 () Bool)

(assert (=> b!348063 m!349203))

(declare-fun m!349205 () Bool)

(assert (=> start!34780 m!349205))

(declare-fun m!349207 () Bool)

(assert (=> start!34780 m!349207))

(declare-fun m!349209 () Bool)

(assert (=> start!34780 m!349209))

(declare-fun m!349211 () Bool)

(assert (=> b!348070 m!349211))

(declare-fun m!349213 () Bool)

(assert (=> b!348062 m!349213))

(declare-fun m!349215 () Bool)

(assert (=> b!348069 m!349215))

(declare-fun m!349217 () Bool)

(assert (=> b!348061 m!349217))

(assert (=> b!348061 m!349217))

(declare-fun m!349219 () Bool)

(assert (=> b!348061 m!349219))

(check-sat (not b!348061) (not mapNonEmpty!12756) (not b!348062) (not b!348065) (not b!348070) b_and!14815 (not start!34780) (not b!348069) (not b_next!7579) (not b!348063) (not b!348068) tp_is_empty!7531)
(check-sat b_and!14815 (not b_next!7579))
