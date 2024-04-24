; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34822 () Bool)

(assert start!34822)

(declare-fun b_free!7621 () Bool)

(declare-fun b_next!7621 () Bool)

(assert (=> start!34822 (= b_free!7621 (not b_next!7621))))

(declare-fun tp!26430 () Bool)

(declare-fun b_and!14857 () Bool)

(assert (=> start!34822 (= tp!26430 b_and!14857)))

(declare-fun b!348753 () Bool)

(declare-fun res!193285 () Bool)

(declare-fun e!213647 () Bool)

(assert (=> b!348753 (=> (not res!193285) (not e!213647))))

(declare-datatypes ((array!18716 0))(
  ( (array!18717 (arr!8867 (Array (_ BitVec 32) (_ BitVec 64))) (size!9219 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18716)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!18716 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!348753 (= res!193285 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!348754 () Bool)

(declare-fun e!213652 () Bool)

(declare-fun tp_is_empty!7573 () Bool)

(assert (=> b!348754 (= e!213652 tp_is_empty!7573)))

(declare-fun b!348755 () Bool)

(declare-fun res!193283 () Bool)

(declare-fun e!213651 () Bool)

(assert (=> b!348755 (=> (not res!193283) (not e!213651))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!348755 (= res!193283 (validKeyInArray!0 k0!1348))))

(declare-fun b!348756 () Bool)

(assert (=> b!348756 (= e!213647 false)))

(declare-fun lt!163963 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!18716 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!348756 (= lt!163963 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!348757 () Bool)

(declare-fun res!193281 () Bool)

(assert (=> b!348757 (=> (not res!193281) (not e!213651))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!11075 0))(
  ( (V!11076 (val!3831 Int)) )
))
(declare-datatypes ((ValueCell!3443 0))(
  ( (ValueCellFull!3443 (v!6015 V!11075)) (EmptyCell!3443) )
))
(declare-datatypes ((array!18718 0))(
  ( (array!18719 (arr!8868 (Array (_ BitVec 32) ValueCell!3443)) (size!9220 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18718)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!348757 (= res!193281 (and (= (size!9220 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9219 _keys!1895) (size!9220 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!12819 () Bool)

(declare-fun mapRes!12819 () Bool)

(declare-fun tp!26429 () Bool)

(declare-fun e!213649 () Bool)

(assert (=> mapNonEmpty!12819 (= mapRes!12819 (and tp!26429 e!213649))))

(declare-fun mapRest!12819 () (Array (_ BitVec 32) ValueCell!3443))

(declare-fun mapKey!12819 () (_ BitVec 32))

(declare-fun mapValue!12819 () ValueCell!3443)

(assert (=> mapNonEmpty!12819 (= (arr!8868 _values!1525) (store mapRest!12819 mapKey!12819 mapValue!12819))))

(declare-fun res!193280 () Bool)

(assert (=> start!34822 (=> (not res!193280) (not e!213651))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34822 (= res!193280 (validMask!0 mask!2385))))

(assert (=> start!34822 e!213651))

(assert (=> start!34822 true))

(assert (=> start!34822 tp_is_empty!7573))

(assert (=> start!34822 tp!26430))

(declare-fun e!213648 () Bool)

(declare-fun array_inv!6550 (array!18718) Bool)

(assert (=> start!34822 (and (array_inv!6550 _values!1525) e!213648)))

(declare-fun array_inv!6551 (array!18716) Bool)

(assert (=> start!34822 (array_inv!6551 _keys!1895)))

(declare-fun b!348758 () Bool)

(declare-fun res!193282 () Bool)

(assert (=> b!348758 (=> (not res!193282) (not e!213651))))

(declare-fun zeroValue!1467 () V!11075)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!11075)

(declare-datatypes ((tuple2!5450 0))(
  ( (tuple2!5451 (_1!2736 (_ BitVec 64)) (_2!2736 V!11075)) )
))
(declare-datatypes ((List!5057 0))(
  ( (Nil!5054) (Cons!5053 (h!5909 tuple2!5450) (t!10179 List!5057)) )
))
(declare-datatypes ((ListLongMap!4365 0))(
  ( (ListLongMap!4366 (toList!2198 List!5057)) )
))
(declare-fun contains!2282 (ListLongMap!4365 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1726 (array!18716 array!18718 (_ BitVec 32) (_ BitVec 32) V!11075 V!11075 (_ BitVec 32) Int) ListLongMap!4365)

(assert (=> b!348758 (= res!193282 (not (contains!2282 (getCurrentListMap!1726 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!348759 () Bool)

(declare-fun res!193279 () Bool)

(assert (=> b!348759 (=> (not res!193279) (not e!213651))))

(declare-datatypes ((List!5058 0))(
  ( (Nil!5055) (Cons!5054 (h!5910 (_ BitVec 64)) (t!10180 List!5058)) )
))
(declare-fun arrayNoDuplicates!0 (array!18716 (_ BitVec 32) List!5058) Bool)

(assert (=> b!348759 (= res!193279 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5055))))

(declare-fun mapIsEmpty!12819 () Bool)

(assert (=> mapIsEmpty!12819 mapRes!12819))

(declare-fun b!348760 () Bool)

(assert (=> b!348760 (= e!213648 (and e!213652 mapRes!12819))))

(declare-fun condMapEmpty!12819 () Bool)

(declare-fun mapDefault!12819 () ValueCell!3443)

(assert (=> b!348760 (= condMapEmpty!12819 (= (arr!8868 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3443)) mapDefault!12819)))))

(declare-fun b!348761 () Bool)

(assert (=> b!348761 (= e!213649 tp_is_empty!7573)))

(declare-fun b!348762 () Bool)

(assert (=> b!348762 (= e!213651 e!213647)))

(declare-fun res!193278 () Bool)

(assert (=> b!348762 (=> (not res!193278) (not e!213647))))

(declare-datatypes ((SeekEntryResult!3373 0))(
  ( (MissingZero!3373 (index!15671 (_ BitVec 32))) (Found!3373 (index!15672 (_ BitVec 32))) (Intermediate!3373 (undefined!4185 Bool) (index!15673 (_ BitVec 32)) (x!34698 (_ BitVec 32))) (Undefined!3373) (MissingVacant!3373 (index!15674 (_ BitVec 32))) )
))
(declare-fun lt!163962 () SeekEntryResult!3373)

(get-info :version)

(assert (=> b!348762 (= res!193278 (and (not ((_ is Found!3373) lt!163962)) ((_ is MissingZero!3373) lt!163962)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18716 (_ BitVec 32)) SeekEntryResult!3373)

(assert (=> b!348762 (= lt!163962 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!348763 () Bool)

(declare-fun res!193284 () Bool)

(assert (=> b!348763 (=> (not res!193284) (not e!213651))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18716 (_ BitVec 32)) Bool)

(assert (=> b!348763 (= res!193284 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(assert (= (and start!34822 res!193280) b!348757))

(assert (= (and b!348757 res!193281) b!348763))

(assert (= (and b!348763 res!193284) b!348759))

(assert (= (and b!348759 res!193279) b!348755))

(assert (= (and b!348755 res!193283) b!348758))

(assert (= (and b!348758 res!193282) b!348762))

(assert (= (and b!348762 res!193278) b!348753))

(assert (= (and b!348753 res!193285) b!348756))

(assert (= (and b!348760 condMapEmpty!12819) mapIsEmpty!12819))

(assert (= (and b!348760 (not condMapEmpty!12819)) mapNonEmpty!12819))

(assert (= (and mapNonEmpty!12819 ((_ is ValueCellFull!3443) mapValue!12819)) b!348761))

(assert (= (and b!348760 ((_ is ValueCellFull!3443) mapDefault!12819)) b!348754))

(assert (= start!34822 b!348760))

(declare-fun m!349701 () Bool)

(assert (=> b!348759 m!349701))

(declare-fun m!349703 () Bool)

(assert (=> mapNonEmpty!12819 m!349703))

(declare-fun m!349705 () Bool)

(assert (=> b!348758 m!349705))

(assert (=> b!348758 m!349705))

(declare-fun m!349707 () Bool)

(assert (=> b!348758 m!349707))

(declare-fun m!349709 () Bool)

(assert (=> b!348756 m!349709))

(declare-fun m!349711 () Bool)

(assert (=> b!348755 m!349711))

(declare-fun m!349713 () Bool)

(assert (=> b!348763 m!349713))

(declare-fun m!349715 () Bool)

(assert (=> b!348762 m!349715))

(declare-fun m!349717 () Bool)

(assert (=> start!34822 m!349717))

(declare-fun m!349719 () Bool)

(assert (=> start!34822 m!349719))

(declare-fun m!349721 () Bool)

(assert (=> start!34822 m!349721))

(declare-fun m!349723 () Bool)

(assert (=> b!348753 m!349723))

(check-sat (not b!348763) (not b!348755) (not b!348753) (not b!348756) (not b!348759) (not start!34822) tp_is_empty!7573 (not b!348762) (not b_next!7621) (not b!348758) b_and!14857 (not mapNonEmpty!12819))
(check-sat b_and!14857 (not b_next!7621))
