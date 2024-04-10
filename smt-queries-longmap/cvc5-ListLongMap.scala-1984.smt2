; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34788 () Bool)

(assert start!34788)

(declare-fun b_free!7573 () Bool)

(declare-fun b_next!7573 () Bool)

(assert (=> start!34788 (= b_free!7573 (not b_next!7573))))

(declare-fun tp!26286 () Bool)

(declare-fun b_and!14795 () Bool)

(assert (=> start!34788 (= tp!26286 b_and!14795)))

(declare-fun b!348014 () Bool)

(declare-fun e!213247 () Bool)

(declare-fun tp_is_empty!7525 () Bool)

(assert (=> b!348014 (= e!213247 tp_is_empty!7525)))

(declare-fun res!192707 () Bool)

(declare-fun e!213242 () Bool)

(assert (=> start!34788 (=> (not res!192707) (not e!213242))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34788 (= res!192707 (validMask!0 mask!2385))))

(assert (=> start!34788 e!213242))

(assert (=> start!34788 true))

(assert (=> start!34788 tp_is_empty!7525))

(assert (=> start!34788 tp!26286))

(declare-datatypes ((V!11011 0))(
  ( (V!11012 (val!3807 Int)) )
))
(declare-datatypes ((ValueCell!3419 0))(
  ( (ValueCellFull!3419 (v!5990 V!11011)) (EmptyCell!3419) )
))
(declare-datatypes ((array!18637 0))(
  ( (array!18638 (arr!8828 (Array (_ BitVec 32) ValueCell!3419)) (size!9180 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18637)

(declare-fun e!213244 () Bool)

(declare-fun array_inv!6538 (array!18637) Bool)

(assert (=> start!34788 (and (array_inv!6538 _values!1525) e!213244)))

(declare-datatypes ((array!18639 0))(
  ( (array!18640 (arr!8829 (Array (_ BitVec 32) (_ BitVec 64))) (size!9181 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18639)

(declare-fun array_inv!6539 (array!18639) Bool)

(assert (=> start!34788 (array_inv!6539 _keys!1895)))

(declare-fun b!348015 () Bool)

(declare-fun e!213246 () Bool)

(assert (=> b!348015 (= e!213246 (not true))))

(declare-datatypes ((tuple2!5502 0))(
  ( (tuple2!5503 (_1!2762 (_ BitVec 64)) (_2!2762 V!11011)) )
))
(declare-datatypes ((List!5126 0))(
  ( (Nil!5123) (Cons!5122 (h!5978 tuple2!5502) (t!10256 List!5126)) )
))
(declare-datatypes ((ListLongMap!4415 0))(
  ( (ListLongMap!4416 (toList!2223 List!5126)) )
))
(declare-fun lt!163786 () ListLongMap!4415)

(declare-datatypes ((SeekEntryResult!3406 0))(
  ( (MissingZero!3406 (index!15803 (_ BitVec 32))) (Found!3406 (index!15804 (_ BitVec 32))) (Intermediate!3406 (undefined!4218 Bool) (index!15805 (_ BitVec 32)) (x!34670 (_ BitVec 32))) (Undefined!3406) (MissingVacant!3406 (index!15806 (_ BitVec 32))) )
))
(declare-fun lt!163787 () SeekEntryResult!3406)

(declare-fun contains!2288 (ListLongMap!4415 (_ BitVec 64)) Bool)

(assert (=> b!348015 (contains!2288 lt!163786 (select (arr!8829 _keys!1895) (index!15804 lt!163787)))))

(declare-fun zeroValue!1467 () V!11011)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-datatypes ((Unit!10801 0))(
  ( (Unit!10802) )
))
(declare-fun lt!163788 () Unit!10801)

(declare-fun minValue!1467 () V!11011)

(declare-fun lemmaValidKeyInArrayIsInListMap!178 (array!18639 array!18637 (_ BitVec 32) (_ BitVec 32) V!11011 V!11011 (_ BitVec 32) Int) Unit!10801)

(assert (=> b!348015 (= lt!163788 (lemmaValidKeyInArrayIsInListMap!178 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 (index!15804 lt!163787) defaultEntry!1528))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!18639 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!348015 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000)))

(declare-fun lt!163789 () Unit!10801)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18639 (_ BitVec 64) (_ BitVec 32)) Unit!10801)

(assert (=> b!348015 (= lt!163789 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k!1348 (index!15804 lt!163787)))))

(declare-fun b!348016 () Bool)

(declare-fun e!213245 () Bool)

(assert (=> b!348016 (= e!213242 e!213245)))

(declare-fun res!192709 () Bool)

(assert (=> b!348016 (=> (not res!192709) (not e!213245))))

(assert (=> b!348016 (= res!192709 (not (contains!2288 lt!163786 k!1348)))))

(declare-fun getCurrentListMap!1744 (array!18639 array!18637 (_ BitVec 32) (_ BitVec 32) V!11011 V!11011 (_ BitVec 32) Int) ListLongMap!4415)

(assert (=> b!348016 (= lt!163786 (getCurrentListMap!1744 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!348017 () Bool)

(declare-fun e!213248 () Bool)

(assert (=> b!348017 (= e!213248 tp_is_empty!7525)))

(declare-fun b!348018 () Bool)

(declare-fun res!192712 () Bool)

(assert (=> b!348018 (=> (not res!192712) (not e!213242))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18639 (_ BitVec 32)) Bool)

(assert (=> b!348018 (= res!192712 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!348019 () Bool)

(declare-fun res!192710 () Bool)

(assert (=> b!348019 (=> (not res!192710) (not e!213242))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!348019 (= res!192710 (validKeyInArray!0 k!1348))))

(declare-fun b!348020 () Bool)

(declare-fun res!192705 () Bool)

(assert (=> b!348020 (=> (not res!192705) (not e!213242))))

(assert (=> b!348020 (= res!192705 (and (= (size!9180 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9181 _keys!1895) (size!9180 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!12747 () Bool)

(declare-fun mapRes!12747 () Bool)

(declare-fun tp!26285 () Bool)

(assert (=> mapNonEmpty!12747 (= mapRes!12747 (and tp!26285 e!213248))))

(declare-fun mapValue!12747 () ValueCell!3419)

(declare-fun mapRest!12747 () (Array (_ BitVec 32) ValueCell!3419))

(declare-fun mapKey!12747 () (_ BitVec 32))

(assert (=> mapNonEmpty!12747 (= (arr!8828 _values!1525) (store mapRest!12747 mapKey!12747 mapValue!12747))))

(declare-fun mapIsEmpty!12747 () Bool)

(assert (=> mapIsEmpty!12747 mapRes!12747))

(declare-fun b!348021 () Bool)

(assert (=> b!348021 (= e!213244 (and e!213247 mapRes!12747))))

(declare-fun condMapEmpty!12747 () Bool)

(declare-fun mapDefault!12747 () ValueCell!3419)

