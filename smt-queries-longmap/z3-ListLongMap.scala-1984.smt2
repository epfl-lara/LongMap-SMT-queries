; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34790 () Bool)

(assert start!34790)

(declare-fun b_free!7575 () Bool)

(declare-fun b_next!7575 () Bool)

(assert (=> start!34790 (= b_free!7575 (not b_next!7575))))

(declare-fun tp!26291 () Bool)

(declare-fun b_and!14797 () Bool)

(assert (=> start!34790 (= tp!26291 b_and!14797)))

(declare-fun b!348047 () Bool)

(declare-fun res!192732 () Bool)

(declare-fun e!213267 () Bool)

(assert (=> b!348047 (=> (not res!192732) (not e!213267))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!348047 (= res!192732 (validKeyInArray!0 k0!1348))))

(declare-fun mapNonEmpty!12750 () Bool)

(declare-fun mapRes!12750 () Bool)

(declare-fun tp!26292 () Bool)

(declare-fun e!213268 () Bool)

(assert (=> mapNonEmpty!12750 (= mapRes!12750 (and tp!26292 e!213268))))

(declare-datatypes ((V!11013 0))(
  ( (V!11014 (val!3808 Int)) )
))
(declare-datatypes ((ValueCell!3420 0))(
  ( (ValueCellFull!3420 (v!5991 V!11013)) (EmptyCell!3420) )
))
(declare-fun mapValue!12750 () ValueCell!3420)

(declare-datatypes ((array!18641 0))(
  ( (array!18642 (arr!8830 (Array (_ BitVec 32) ValueCell!3420)) (size!9182 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18641)

(declare-fun mapKey!12750 () (_ BitVec 32))

(declare-fun mapRest!12750 () (Array (_ BitVec 32) ValueCell!3420))

(assert (=> mapNonEmpty!12750 (= (arr!8830 _values!1525) (store mapRest!12750 mapKey!12750 mapValue!12750))))

(declare-fun b!348048 () Bool)

(declare-fun e!213269 () Bool)

(declare-fun e!213266 () Bool)

(assert (=> b!348048 (= e!213269 (and e!213266 mapRes!12750))))

(declare-fun condMapEmpty!12750 () Bool)

(declare-fun mapDefault!12750 () ValueCell!3420)

(assert (=> b!348048 (= condMapEmpty!12750 (= (arr!8830 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3420)) mapDefault!12750)))))

(declare-fun res!192736 () Bool)

(assert (=> start!34790 (=> (not res!192736) (not e!213267))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34790 (= res!192736 (validMask!0 mask!2385))))

(assert (=> start!34790 e!213267))

(assert (=> start!34790 true))

(declare-fun tp_is_empty!7527 () Bool)

(assert (=> start!34790 tp_is_empty!7527))

(assert (=> start!34790 tp!26291))

(declare-fun array_inv!6540 (array!18641) Bool)

(assert (=> start!34790 (and (array_inv!6540 _values!1525) e!213269)))

(declare-datatypes ((array!18643 0))(
  ( (array!18644 (arr!8831 (Array (_ BitVec 32) (_ BitVec 64))) (size!9183 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18643)

(declare-fun array_inv!6541 (array!18643) Bool)

(assert (=> start!34790 (array_inv!6541 _keys!1895)))

(declare-fun b!348049 () Bool)

(declare-fun e!213264 () Bool)

(declare-fun e!213265 () Bool)

(assert (=> b!348049 (= e!213264 e!213265)))

(declare-fun res!192733 () Bool)

(assert (=> b!348049 (=> (not res!192733) (not e!213265))))

(declare-datatypes ((SeekEntryResult!3407 0))(
  ( (MissingZero!3407 (index!15807 (_ BitVec 32))) (Found!3407 (index!15808 (_ BitVec 32))) (Intermediate!3407 (undefined!4219 Bool) (index!15809 (_ BitVec 32)) (x!34671 (_ BitVec 32))) (Undefined!3407) (MissingVacant!3407 (index!15810 (_ BitVec 32))) )
))
(declare-fun lt!163798 () SeekEntryResult!3407)

(get-info :version)

(assert (=> b!348049 (= res!192733 (and ((_ is Found!3407) lt!163798) (= (select (arr!8831 _keys!1895) (index!15808 lt!163798)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18643 (_ BitVec 32)) SeekEntryResult!3407)

(assert (=> b!348049 (= lt!163798 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!12750 () Bool)

(assert (=> mapIsEmpty!12750 mapRes!12750))

(declare-fun b!348050 () Bool)

(declare-fun res!192731 () Bool)

(assert (=> b!348050 (=> (not res!192731) (not e!213267))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18643 (_ BitVec 32)) Bool)

(assert (=> b!348050 (= res!192731 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!348051 () Bool)

(declare-fun res!192730 () Bool)

(assert (=> b!348051 (=> (not res!192730) (not e!213267))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!348051 (= res!192730 (and (= (size!9182 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9183 _keys!1895) (size!9182 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!348052 () Bool)

(assert (=> b!348052 (= e!213268 tp_is_empty!7527)))

(declare-fun b!348053 () Bool)

(declare-fun res!192735 () Bool)

(assert (=> b!348053 (=> (not res!192735) (not e!213267))))

(declare-datatypes ((List!5127 0))(
  ( (Nil!5124) (Cons!5123 (h!5979 (_ BitVec 64)) (t!10257 List!5127)) )
))
(declare-fun arrayNoDuplicates!0 (array!18643 (_ BitVec 32) List!5127) Bool)

(assert (=> b!348053 (= res!192735 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5124))))

(declare-fun b!348054 () Bool)

(assert (=> b!348054 (= e!213266 tp_is_empty!7527)))

(declare-fun b!348055 () Bool)

(assert (=> b!348055 (= e!213265 (not true))))

(declare-datatypes ((tuple2!5504 0))(
  ( (tuple2!5505 (_1!2763 (_ BitVec 64)) (_2!2763 V!11013)) )
))
(declare-datatypes ((List!5128 0))(
  ( (Nil!5125) (Cons!5124 (h!5980 tuple2!5504) (t!10258 List!5128)) )
))
(declare-datatypes ((ListLongMap!4417 0))(
  ( (ListLongMap!4418 (toList!2224 List!5128)) )
))
(declare-fun lt!163799 () ListLongMap!4417)

(declare-fun contains!2289 (ListLongMap!4417 (_ BitVec 64)) Bool)

(assert (=> b!348055 (contains!2289 lt!163799 (select (arr!8831 _keys!1895) (index!15808 lt!163798)))))

(declare-fun zeroValue!1467 () V!11013)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((Unit!10803 0))(
  ( (Unit!10804) )
))
(declare-fun lt!163801 () Unit!10803)

(declare-fun minValue!1467 () V!11013)

(declare-fun lemmaValidKeyInArrayIsInListMap!179 (array!18643 array!18641 (_ BitVec 32) (_ BitVec 32) V!11013 V!11013 (_ BitVec 32) Int) Unit!10803)

(assert (=> b!348055 (= lt!163801 (lemmaValidKeyInArrayIsInListMap!179 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 (index!15808 lt!163798) defaultEntry!1528))))

(declare-fun arrayContainsKey!0 (array!18643 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!348055 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-fun lt!163800 () Unit!10803)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18643 (_ BitVec 64) (_ BitVec 32)) Unit!10803)

(assert (=> b!348055 (= lt!163800 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!15808 lt!163798)))))

(declare-fun b!348056 () Bool)

(assert (=> b!348056 (= e!213267 e!213264)))

(declare-fun res!192729 () Bool)

(assert (=> b!348056 (=> (not res!192729) (not e!213264))))

(assert (=> b!348056 (= res!192729 (not (contains!2289 lt!163799 k0!1348)))))

(declare-fun getCurrentListMap!1745 (array!18643 array!18641 (_ BitVec 32) (_ BitVec 32) V!11013 V!11013 (_ BitVec 32) Int) ListLongMap!4417)

(assert (=> b!348056 (= lt!163799 (getCurrentListMap!1745 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!348057 () Bool)

(declare-fun res!192734 () Bool)

(assert (=> b!348057 (=> (not res!192734) (not e!213265))))

(assert (=> b!348057 (= res!192734 (arrayContainsKey!0 _keys!1895 k0!1348 (index!15808 lt!163798)))))

(assert (= (and start!34790 res!192736) b!348051))

(assert (= (and b!348051 res!192730) b!348050))

(assert (= (and b!348050 res!192731) b!348053))

(assert (= (and b!348053 res!192735) b!348047))

(assert (= (and b!348047 res!192732) b!348056))

(assert (= (and b!348056 res!192729) b!348049))

(assert (= (and b!348049 res!192733) b!348057))

(assert (= (and b!348057 res!192734) b!348055))

(assert (= (and b!348048 condMapEmpty!12750) mapIsEmpty!12750))

(assert (= (and b!348048 (not condMapEmpty!12750)) mapNonEmpty!12750))

(assert (= (and mapNonEmpty!12750 ((_ is ValueCellFull!3420) mapValue!12750)) b!348052))

(assert (= (and b!348048 ((_ is ValueCellFull!3420) mapDefault!12750)) b!348054))

(assert (= start!34790 b!348048))

(declare-fun m!348909 () Bool)

(assert (=> b!348057 m!348909))

(declare-fun m!348911 () Bool)

(assert (=> b!348049 m!348911))

(declare-fun m!348913 () Bool)

(assert (=> b!348049 m!348913))

(declare-fun m!348915 () Bool)

(assert (=> mapNonEmpty!12750 m!348915))

(declare-fun m!348917 () Bool)

(assert (=> b!348047 m!348917))

(assert (=> b!348055 m!348911))

(declare-fun m!348919 () Bool)

(assert (=> b!348055 m!348919))

(assert (=> b!348055 m!348911))

(declare-fun m!348921 () Bool)

(assert (=> b!348055 m!348921))

(declare-fun m!348923 () Bool)

(assert (=> b!348055 m!348923))

(declare-fun m!348925 () Bool)

(assert (=> b!348055 m!348925))

(declare-fun m!348927 () Bool)

(assert (=> start!34790 m!348927))

(declare-fun m!348929 () Bool)

(assert (=> start!34790 m!348929))

(declare-fun m!348931 () Bool)

(assert (=> start!34790 m!348931))

(declare-fun m!348933 () Bool)

(assert (=> b!348050 m!348933))

(declare-fun m!348935 () Bool)

(assert (=> b!348056 m!348935))

(declare-fun m!348937 () Bool)

(assert (=> b!348056 m!348937))

(declare-fun m!348939 () Bool)

(assert (=> b!348053 m!348939))

(check-sat (not b_next!7575) (not b!348049) tp_is_empty!7527 (not b!348047) (not b!348057) (not mapNonEmpty!12750) (not b!348056) b_and!14797 (not b!348050) (not start!34790) (not b!348055) (not b!348053))
(check-sat b_and!14797 (not b_next!7575))
