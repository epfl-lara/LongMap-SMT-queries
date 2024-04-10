; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34774 () Bool)

(assert start!34774)

(declare-fun b_free!7559 () Bool)

(declare-fun b_next!7559 () Bool)

(assert (=> start!34774 (= b_free!7559 (not b_next!7559))))

(declare-fun tp!26243 () Bool)

(declare-fun b_and!14781 () Bool)

(assert (=> start!34774 (= tp!26243 b_and!14781)))

(declare-fun mapIsEmpty!12726 () Bool)

(declare-fun mapRes!12726 () Bool)

(assert (=> mapIsEmpty!12726 mapRes!12726))

(declare-fun b!347783 () Bool)

(declare-fun e!213099 () Bool)

(declare-fun e!213098 () Bool)

(assert (=> b!347783 (= e!213099 e!213098)))

(declare-fun res!192542 () Bool)

(assert (=> b!347783 (=> (not res!192542) (not e!213098))))

(declare-datatypes ((V!10991 0))(
  ( (V!10992 (val!3800 Int)) )
))
(declare-datatypes ((tuple2!5496 0))(
  ( (tuple2!5497 (_1!2759 (_ BitVec 64)) (_2!2759 V!10991)) )
))
(declare-datatypes ((List!5119 0))(
  ( (Nil!5116) (Cons!5115 (h!5971 tuple2!5496) (t!10249 List!5119)) )
))
(declare-datatypes ((ListLongMap!4409 0))(
  ( (ListLongMap!4410 (toList!2220 List!5119)) )
))
(declare-fun lt!163705 () ListLongMap!4409)

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun contains!2285 (ListLongMap!4409 (_ BitVec 64)) Bool)

(assert (=> b!347783 (= res!192542 (not (contains!2285 lt!163705 k!1348)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun zeroValue!1467 () V!10991)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3412 0))(
  ( (ValueCellFull!3412 (v!5983 V!10991)) (EmptyCell!3412) )
))
(declare-datatypes ((array!18611 0))(
  ( (array!18612 (arr!8815 (Array (_ BitVec 32) ValueCell!3412)) (size!9167 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18611)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10991)

(declare-datatypes ((array!18613 0))(
  ( (array!18614 (arr!8816 (Array (_ BitVec 32) (_ BitVec 64))) (size!9168 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18613)

(declare-fun getCurrentListMap!1741 (array!18613 array!18611 (_ BitVec 32) (_ BitVec 32) V!10991 V!10991 (_ BitVec 32) Int) ListLongMap!4409)

(assert (=> b!347783 (= lt!163705 (getCurrentListMap!1741 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!347784 () Bool)

(declare-fun e!213100 () Bool)

(assert (=> b!347784 (= e!213098 e!213100)))

(declare-fun res!192540 () Bool)

(assert (=> b!347784 (=> (not res!192540) (not e!213100))))

(declare-datatypes ((SeekEntryResult!3401 0))(
  ( (MissingZero!3401 (index!15783 (_ BitVec 32))) (Found!3401 (index!15784 (_ BitVec 32))) (Intermediate!3401 (undefined!4213 Bool) (index!15785 (_ BitVec 32)) (x!34641 (_ BitVec 32))) (Undefined!3401) (MissingVacant!3401 (index!15786 (_ BitVec 32))) )
))
(declare-fun lt!163702 () SeekEntryResult!3401)

(assert (=> b!347784 (= res!192540 (and (is-Found!3401 lt!163702) (= (select (arr!8816 _keys!1895) (index!15784 lt!163702)) k!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18613 (_ BitVec 32)) SeekEntryResult!3401)

(assert (=> b!347784 (= lt!163702 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun res!192544 () Bool)

(assert (=> start!34774 (=> (not res!192544) (not e!213099))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34774 (= res!192544 (validMask!0 mask!2385))))

(assert (=> start!34774 e!213099))

(assert (=> start!34774 true))

(declare-fun tp_is_empty!7511 () Bool)

(assert (=> start!34774 tp_is_empty!7511))

(assert (=> start!34774 tp!26243))

(declare-fun e!213095 () Bool)

(declare-fun array_inv!6526 (array!18611) Bool)

(assert (=> start!34774 (and (array_inv!6526 _values!1525) e!213095)))

(declare-fun array_inv!6527 (array!18613) Bool)

(assert (=> start!34774 (array_inv!6527 _keys!1895)))

(declare-fun b!347785 () Bool)

(declare-fun e!213101 () Bool)

(assert (=> b!347785 (= e!213101 tp_is_empty!7511)))

(declare-fun mapNonEmpty!12726 () Bool)

(declare-fun tp!26244 () Bool)

(declare-fun e!213097 () Bool)

(assert (=> mapNonEmpty!12726 (= mapRes!12726 (and tp!26244 e!213097))))

(declare-fun mapRest!12726 () (Array (_ BitVec 32) ValueCell!3412))

(declare-fun mapValue!12726 () ValueCell!3412)

(declare-fun mapKey!12726 () (_ BitVec 32))

(assert (=> mapNonEmpty!12726 (= (arr!8815 _values!1525) (store mapRest!12726 mapKey!12726 mapValue!12726))))

(declare-fun b!347786 () Bool)

(assert (=> b!347786 (= e!213100 (not false))))

(assert (=> b!347786 (contains!2285 lt!163705 (select (arr!8816 _keys!1895) (index!15784 lt!163702)))))

(declare-datatypes ((Unit!10795 0))(
  ( (Unit!10796) )
))
(declare-fun lt!163703 () Unit!10795)

(declare-fun lemmaValidKeyInArrayIsInListMap!175 (array!18613 array!18611 (_ BitVec 32) (_ BitVec 32) V!10991 V!10991 (_ BitVec 32) Int) Unit!10795)

(assert (=> b!347786 (= lt!163703 (lemmaValidKeyInArrayIsInListMap!175 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 (index!15784 lt!163702) defaultEntry!1528))))

(declare-fun arrayContainsKey!0 (array!18613 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!347786 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000)))

(declare-fun lt!163704 () Unit!10795)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18613 (_ BitVec 64) (_ BitVec 32)) Unit!10795)

(assert (=> b!347786 (= lt!163704 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k!1348 (index!15784 lt!163702)))))

(declare-fun b!347787 () Bool)

(declare-fun res!192539 () Bool)

(assert (=> b!347787 (=> (not res!192539) (not e!213100))))

(assert (=> b!347787 (= res!192539 (arrayContainsKey!0 _keys!1895 k!1348 (index!15784 lt!163702)))))

(declare-fun b!347788 () Bool)

(declare-fun res!192541 () Bool)

(assert (=> b!347788 (=> (not res!192541) (not e!213099))))

(declare-datatypes ((List!5120 0))(
  ( (Nil!5117) (Cons!5116 (h!5972 (_ BitVec 64)) (t!10250 List!5120)) )
))
(declare-fun arrayNoDuplicates!0 (array!18613 (_ BitVec 32) List!5120) Bool)

(assert (=> b!347788 (= res!192541 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5117))))

(declare-fun b!347789 () Bool)

(declare-fun res!192543 () Bool)

(assert (=> b!347789 (=> (not res!192543) (not e!213099))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18613 (_ BitVec 32)) Bool)

(assert (=> b!347789 (= res!192543 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!347790 () Bool)

(declare-fun res!192538 () Bool)

(assert (=> b!347790 (=> (not res!192538) (not e!213099))))

(assert (=> b!347790 (= res!192538 (and (= (size!9167 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9168 _keys!1895) (size!9167 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!347791 () Bool)

(assert (=> b!347791 (= e!213095 (and e!213101 mapRes!12726))))

(declare-fun condMapEmpty!12726 () Bool)

(declare-fun mapDefault!12726 () ValueCell!3412)

