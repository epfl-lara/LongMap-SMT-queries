; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35036 () Bool)

(assert start!35036)

(declare-fun b_free!7725 () Bool)

(declare-fun b_next!7725 () Bool)

(assert (=> start!35036 (= b_free!7725 (not b_next!7725))))

(declare-fun tp!26754 () Bool)

(declare-fun b_and!14955 () Bool)

(assert (=> start!35036 (= tp!26754 b_and!14955)))

(declare-fun b!351206 () Bool)

(declare-fun res!194757 () Bool)

(declare-fun e!215078 () Bool)

(assert (=> b!351206 (=> (not res!194757) (not e!215078))))

(declare-datatypes ((array!18941 0))(
  ( (array!18942 (arr!8976 (Array (_ BitVec 32) (_ BitVec 64))) (size!9328 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18941)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!18941 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!351206 (= res!194757 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!351207 () Bool)

(declare-fun res!194758 () Bool)

(declare-fun e!215080 () Bool)

(assert (=> b!351207 (=> (not res!194758) (not e!215080))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18941 (_ BitVec 32)) Bool)

(assert (=> b!351207 (= res!194758 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!351208 () Bool)

(declare-fun e!215082 () Bool)

(declare-fun e!215083 () Bool)

(declare-fun mapRes!12987 () Bool)

(assert (=> b!351208 (= e!215082 (and e!215083 mapRes!12987))))

(declare-fun condMapEmpty!12987 () Bool)

(declare-datatypes ((V!11213 0))(
  ( (V!11214 (val!3883 Int)) )
))
(declare-datatypes ((ValueCell!3495 0))(
  ( (ValueCellFull!3495 (v!6070 V!11213)) (EmptyCell!3495) )
))
(declare-datatypes ((array!18943 0))(
  ( (array!18944 (arr!8977 (Array (_ BitVec 32) ValueCell!3495)) (size!9329 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18943)

(declare-fun mapDefault!12987 () ValueCell!3495)

(assert (=> b!351208 (= condMapEmpty!12987 (= (arr!8977 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3495)) mapDefault!12987)))))

(declare-fun mapNonEmpty!12987 () Bool)

(declare-fun tp!26753 () Bool)

(declare-fun e!215079 () Bool)

(assert (=> mapNonEmpty!12987 (= mapRes!12987 (and tp!26753 e!215079))))

(declare-fun mapRest!12987 () (Array (_ BitVec 32) ValueCell!3495))

(declare-fun mapKey!12987 () (_ BitVec 32))

(declare-fun mapValue!12987 () ValueCell!3495)

(assert (=> mapNonEmpty!12987 (= (arr!8977 _values!1525) (store mapRest!12987 mapKey!12987 mapValue!12987))))

(declare-fun b!351209 () Bool)

(declare-fun tp_is_empty!7677 () Bool)

(assert (=> b!351209 (= e!215083 tp_is_empty!7677)))

(declare-fun res!194755 () Bool)

(assert (=> start!35036 (=> (not res!194755) (not e!215080))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35036 (= res!194755 (validMask!0 mask!2385))))

(assert (=> start!35036 e!215080))

(assert (=> start!35036 true))

(assert (=> start!35036 tp_is_empty!7677))

(assert (=> start!35036 tp!26754))

(declare-fun array_inv!6624 (array!18943) Bool)

(assert (=> start!35036 (and (array_inv!6624 _values!1525) e!215082)))

(declare-fun array_inv!6625 (array!18941) Bool)

(assert (=> start!35036 (array_inv!6625 _keys!1895)))

(declare-fun b!351210 () Bool)

(declare-fun res!194759 () Bool)

(assert (=> b!351210 (=> (not res!194759) (not e!215080))))

(declare-fun zeroValue!1467 () V!11213)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11213)

(declare-datatypes ((tuple2!5602 0))(
  ( (tuple2!5603 (_1!2812 (_ BitVec 64)) (_2!2812 V!11213)) )
))
(declare-datatypes ((List!5222 0))(
  ( (Nil!5219) (Cons!5218 (h!6074 tuple2!5602) (t!10360 List!5222)) )
))
(declare-datatypes ((ListLongMap!4515 0))(
  ( (ListLongMap!4516 (toList!2273 List!5222)) )
))
(declare-fun contains!2342 (ListLongMap!4515 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1794 (array!18941 array!18943 (_ BitVec 32) (_ BitVec 32) V!11213 V!11213 (_ BitVec 32) Int) ListLongMap!4515)

(assert (=> b!351210 (= res!194759 (not (contains!2342 (getCurrentListMap!1794 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!351211 () Bool)

(assert (=> b!351211 (= e!215079 tp_is_empty!7677)))

(declare-fun b!351212 () Bool)

(assert (=> b!351212 (= e!215078 false)))

(declare-fun lt!164721 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!18941 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!351212 (= lt!164721 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!351213 () Bool)

(assert (=> b!351213 (= e!215080 e!215078)))

(declare-fun res!194753 () Bool)

(assert (=> b!351213 (=> (not res!194753) (not e!215078))))

(declare-datatypes ((SeekEntryResult!3454 0))(
  ( (MissingZero!3454 (index!15995 (_ BitVec 32))) (Found!3454 (index!15996 (_ BitVec 32))) (Intermediate!3454 (undefined!4266 Bool) (index!15997 (_ BitVec 32)) (x!34958 (_ BitVec 32))) (Undefined!3454) (MissingVacant!3454 (index!15998 (_ BitVec 32))) )
))
(declare-fun lt!164722 () SeekEntryResult!3454)

(get-info :version)

(assert (=> b!351213 (= res!194753 (and (not ((_ is Found!3454) lt!164722)) (not ((_ is MissingZero!3454) lt!164722)) ((_ is MissingVacant!3454) lt!164722)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18941 (_ BitVec 32)) SeekEntryResult!3454)

(assert (=> b!351213 (= lt!164722 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!351214 () Bool)

(declare-fun res!194756 () Bool)

(assert (=> b!351214 (=> (not res!194756) (not e!215080))))

(assert (=> b!351214 (= res!194756 (and (= (size!9329 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9328 _keys!1895) (size!9329 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!351215 () Bool)

(declare-fun res!194760 () Bool)

(assert (=> b!351215 (=> (not res!194760) (not e!215080))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!351215 (= res!194760 (validKeyInArray!0 k0!1348))))

(declare-fun b!351216 () Bool)

(declare-fun res!194754 () Bool)

(assert (=> b!351216 (=> (not res!194754) (not e!215080))))

(declare-datatypes ((List!5223 0))(
  ( (Nil!5220) (Cons!5219 (h!6075 (_ BitVec 64)) (t!10361 List!5223)) )
))
(declare-fun arrayNoDuplicates!0 (array!18941 (_ BitVec 32) List!5223) Bool)

(assert (=> b!351216 (= res!194754 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5220))))

(declare-fun mapIsEmpty!12987 () Bool)

(assert (=> mapIsEmpty!12987 mapRes!12987))

(assert (= (and start!35036 res!194755) b!351214))

(assert (= (and b!351214 res!194756) b!351207))

(assert (= (and b!351207 res!194758) b!351216))

(assert (= (and b!351216 res!194754) b!351215))

(assert (= (and b!351215 res!194760) b!351210))

(assert (= (and b!351210 res!194759) b!351213))

(assert (= (and b!351213 res!194753) b!351206))

(assert (= (and b!351206 res!194757) b!351212))

(assert (= (and b!351208 condMapEmpty!12987) mapIsEmpty!12987))

(assert (= (and b!351208 (not condMapEmpty!12987)) mapNonEmpty!12987))

(assert (= (and mapNonEmpty!12987 ((_ is ValueCellFull!3495) mapValue!12987)) b!351211))

(assert (= (and b!351208 ((_ is ValueCellFull!3495) mapDefault!12987)) b!351209))

(assert (= start!35036 b!351208))

(declare-fun m!351193 () Bool)

(assert (=> b!351207 m!351193))

(declare-fun m!351195 () Bool)

(assert (=> b!351215 m!351195))

(declare-fun m!351197 () Bool)

(assert (=> start!35036 m!351197))

(declare-fun m!351199 () Bool)

(assert (=> start!35036 m!351199))

(declare-fun m!351201 () Bool)

(assert (=> start!35036 m!351201))

(declare-fun m!351203 () Bool)

(assert (=> b!351206 m!351203))

(declare-fun m!351205 () Bool)

(assert (=> mapNonEmpty!12987 m!351205))

(declare-fun m!351207 () Bool)

(assert (=> b!351212 m!351207))

(declare-fun m!351209 () Bool)

(assert (=> b!351216 m!351209))

(declare-fun m!351211 () Bool)

(assert (=> b!351213 m!351211))

(declare-fun m!351213 () Bool)

(assert (=> b!351210 m!351213))

(assert (=> b!351210 m!351213))

(declare-fun m!351215 () Bool)

(assert (=> b!351210 m!351215))

(check-sat b_and!14955 (not b!351212) (not b!351215) (not start!35036) (not mapNonEmpty!12987) (not b!351216) tp_is_empty!7677 (not b!351206) (not b!351207) (not b!351213) (not b_next!7725) (not b!351210))
(check-sat b_and!14955 (not b_next!7725))
