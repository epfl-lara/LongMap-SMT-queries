; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34890 () Bool)

(assert start!34890)

(declare-fun b_free!7645 () Bool)

(declare-fun b_next!7645 () Bool)

(assert (=> start!34890 (= b_free!7645 (not b_next!7645))))

(declare-fun tp!26508 () Bool)

(declare-fun b_and!14845 () Bool)

(assert (=> start!34890 (= tp!26508 b_and!14845)))

(declare-fun b!349216 () Bool)

(declare-fun res!193553 () Bool)

(declare-fun e!213912 () Bool)

(assert (=> b!349216 (=> (not res!193553) (not e!213912))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((V!11107 0))(
  ( (V!11108 (val!3843 Int)) )
))
(declare-fun zeroValue!1467 () V!11107)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3455 0))(
  ( (ValueCellFull!3455 (v!6022 V!11107)) (EmptyCell!3455) )
))
(declare-datatypes ((array!18759 0))(
  ( (array!18760 (arr!8887 (Array (_ BitVec 32) ValueCell!3455)) (size!9240 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18759)

(declare-datatypes ((array!18761 0))(
  ( (array!18762 (arr!8888 (Array (_ BitVec 32) (_ BitVec 64))) (size!9241 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18761)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11107)

(declare-datatypes ((tuple2!5516 0))(
  ( (tuple2!5517 (_1!2769 (_ BitVec 64)) (_2!2769 V!11107)) )
))
(declare-datatypes ((List!5130 0))(
  ( (Nil!5127) (Cons!5126 (h!5982 tuple2!5516) (t!10255 List!5130)) )
))
(declare-datatypes ((ListLongMap!4419 0))(
  ( (ListLongMap!4420 (toList!2225 List!5130)) )
))
(declare-fun contains!2303 (ListLongMap!4419 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1730 (array!18761 array!18759 (_ BitVec 32) (_ BitVec 32) V!11107 V!11107 (_ BitVec 32) Int) ListLongMap!4419)

(assert (=> b!349216 (= res!193553 (not (contains!2303 (getCurrentListMap!1730 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!349217 () Bool)

(declare-fun res!193555 () Bool)

(assert (=> b!349217 (=> (not res!193555) (not e!213912))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!349217 (= res!193555 (validKeyInArray!0 k0!1348))))

(declare-fun b!349218 () Bool)

(declare-fun res!193558 () Bool)

(declare-fun e!213915 () Bool)

(assert (=> b!349218 (=> (not res!193558) (not e!213915))))

(declare-fun arrayContainsKey!0 (array!18761 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!349218 (= res!193558 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!349220 () Bool)

(declare-fun e!213913 () Bool)

(declare-fun tp_is_empty!7597 () Bool)

(assert (=> b!349220 (= e!213913 tp_is_empty!7597)))

(declare-fun b!349221 () Bool)

(declare-fun res!193559 () Bool)

(assert (=> b!349221 (=> (not res!193559) (not e!213912))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18761 (_ BitVec 32)) Bool)

(assert (=> b!349221 (= res!193559 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!349222 () Bool)

(declare-fun e!213917 () Bool)

(assert (=> b!349222 (= e!213917 tp_is_empty!7597)))

(declare-fun mapIsEmpty!12861 () Bool)

(declare-fun mapRes!12861 () Bool)

(assert (=> mapIsEmpty!12861 mapRes!12861))

(declare-fun mapNonEmpty!12861 () Bool)

(declare-fun tp!26507 () Bool)

(assert (=> mapNonEmpty!12861 (= mapRes!12861 (and tp!26507 e!213917))))

(declare-fun mapValue!12861 () ValueCell!3455)

(declare-fun mapKey!12861 () (_ BitVec 32))

(declare-fun mapRest!12861 () (Array (_ BitVec 32) ValueCell!3455))

(assert (=> mapNonEmpty!12861 (= (arr!8887 _values!1525) (store mapRest!12861 mapKey!12861 mapValue!12861))))

(declare-fun b!349223 () Bool)

(assert (=> b!349223 (= e!213915 (not true))))

(assert (=> b!349223 false))

(declare-datatypes ((Unit!10800 0))(
  ( (Unit!10801) )
))
(declare-fun lt!163979 () Unit!10800)

(declare-fun lemmaArrayContainsKeyThenInListMap!316 (array!18761 array!18759 (_ BitVec 32) (_ BitVec 32) V!11107 V!11107 (_ BitVec 64) (_ BitVec 32) Int) Unit!10800)

(declare-fun arrayScanForKey!0 (array!18761 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!349223 (= lt!163979 (lemmaArrayContainsKeyThenInListMap!316 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(declare-fun b!349224 () Bool)

(declare-fun res!193556 () Bool)

(assert (=> b!349224 (=> (not res!193556) (not e!213912))))

(assert (=> b!349224 (= res!193556 (and (= (size!9240 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9241 _keys!1895) (size!9240 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun res!193557 () Bool)

(assert (=> start!34890 (=> (not res!193557) (not e!213912))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34890 (= res!193557 (validMask!0 mask!2385))))

(assert (=> start!34890 e!213912))

(assert (=> start!34890 true))

(assert (=> start!34890 tp_is_empty!7597))

(assert (=> start!34890 tp!26508))

(declare-fun e!213914 () Bool)

(declare-fun array_inv!6592 (array!18759) Bool)

(assert (=> start!34890 (and (array_inv!6592 _values!1525) e!213914)))

(declare-fun array_inv!6593 (array!18761) Bool)

(assert (=> start!34890 (array_inv!6593 _keys!1895)))

(declare-fun b!349219 () Bool)

(assert (=> b!349219 (= e!213912 e!213915)))

(declare-fun res!193560 () Bool)

(assert (=> b!349219 (=> (not res!193560) (not e!213915))))

(declare-datatypes ((SeekEntryResult!3425 0))(
  ( (MissingZero!3425 (index!15879 (_ BitVec 32))) (Found!3425 (index!15880 (_ BitVec 32))) (Intermediate!3425 (undefined!4237 Bool) (index!15881 (_ BitVec 32)) (x!34800 (_ BitVec 32))) (Undefined!3425) (MissingVacant!3425 (index!15882 (_ BitVec 32))) )
))
(declare-fun lt!163980 () SeekEntryResult!3425)

(get-info :version)

(assert (=> b!349219 (= res!193560 (and (not ((_ is Found!3425) lt!163980)) ((_ is MissingZero!3425) lt!163980)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18761 (_ BitVec 32)) SeekEntryResult!3425)

(assert (=> b!349219 (= lt!163980 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!349225 () Bool)

(assert (=> b!349225 (= e!213914 (and e!213913 mapRes!12861))))

(declare-fun condMapEmpty!12861 () Bool)

(declare-fun mapDefault!12861 () ValueCell!3455)

(assert (=> b!349225 (= condMapEmpty!12861 (= (arr!8887 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3455)) mapDefault!12861)))))

(declare-fun b!349226 () Bool)

(declare-fun res!193554 () Bool)

(assert (=> b!349226 (=> (not res!193554) (not e!213912))))

(declare-datatypes ((List!5131 0))(
  ( (Nil!5128) (Cons!5127 (h!5983 (_ BitVec 64)) (t!10256 List!5131)) )
))
(declare-fun arrayNoDuplicates!0 (array!18761 (_ BitVec 32) List!5131) Bool)

(assert (=> b!349226 (= res!193554 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5128))))

(assert (= (and start!34890 res!193557) b!349224))

(assert (= (and b!349224 res!193556) b!349221))

(assert (= (and b!349221 res!193559) b!349226))

(assert (= (and b!349226 res!193554) b!349217))

(assert (= (and b!349217 res!193555) b!349216))

(assert (= (and b!349216 res!193553) b!349219))

(assert (= (and b!349219 res!193560) b!349218))

(assert (= (and b!349218 res!193558) b!349223))

(assert (= (and b!349225 condMapEmpty!12861) mapIsEmpty!12861))

(assert (= (and b!349225 (not condMapEmpty!12861)) mapNonEmpty!12861))

(assert (= (and mapNonEmpty!12861 ((_ is ValueCellFull!3455) mapValue!12861)) b!349222))

(assert (= (and b!349225 ((_ is ValueCellFull!3455) mapDefault!12861)) b!349220))

(assert (= start!34890 b!349225))

(declare-fun m!349245 () Bool)

(assert (=> b!349221 m!349245))

(declare-fun m!349247 () Bool)

(assert (=> b!349216 m!349247))

(assert (=> b!349216 m!349247))

(declare-fun m!349249 () Bool)

(assert (=> b!349216 m!349249))

(declare-fun m!349251 () Bool)

(assert (=> b!349219 m!349251))

(declare-fun m!349253 () Bool)

(assert (=> b!349217 m!349253))

(declare-fun m!349255 () Bool)

(assert (=> mapNonEmpty!12861 m!349255))

(declare-fun m!349257 () Bool)

(assert (=> b!349218 m!349257))

(declare-fun m!349259 () Bool)

(assert (=> start!34890 m!349259))

(declare-fun m!349261 () Bool)

(assert (=> start!34890 m!349261))

(declare-fun m!349263 () Bool)

(assert (=> start!34890 m!349263))

(declare-fun m!349265 () Bool)

(assert (=> b!349226 m!349265))

(declare-fun m!349267 () Bool)

(assert (=> b!349223 m!349267))

(assert (=> b!349223 m!349267))

(declare-fun m!349269 () Bool)

(assert (=> b!349223 m!349269))

(check-sat (not b!349217) (not b!349219) (not b!349216) tp_is_empty!7597 (not start!34890) (not b!349223) (not mapNonEmpty!12861) b_and!14845 (not b!349218) (not b_next!7645) (not b!349221) (not b!349226))
(check-sat b_and!14845 (not b_next!7645))
