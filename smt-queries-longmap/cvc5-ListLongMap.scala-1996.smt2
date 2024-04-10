; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34904 () Bool)

(assert start!34904)

(declare-fun b_free!7645 () Bool)

(declare-fun b_next!7645 () Bool)

(assert (=> start!34904 (= b_free!7645 (not b_next!7645))))

(declare-fun tp!26508 () Bool)

(declare-fun b_and!14871 () Bool)

(assert (=> start!34904 (= tp!26508 b_and!14871)))

(declare-fun b!349491 () Bool)

(declare-fun res!193682 () Bool)

(declare-fun e!214092 () Bool)

(assert (=> b!349491 (=> (not res!193682) (not e!214092))))

(declare-datatypes ((array!18779 0))(
  ( (array!18780 (arr!8897 (Array (_ BitVec 32) (_ BitVec 64))) (size!9249 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18779)

(declare-datatypes ((List!5170 0))(
  ( (Nil!5167) (Cons!5166 (h!6022 (_ BitVec 64)) (t!10304 List!5170)) )
))
(declare-fun arrayNoDuplicates!0 (array!18779 (_ BitVec 32) List!5170) Bool)

(assert (=> b!349491 (= res!193682 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5167))))

(declare-fun b!349492 () Bool)

(declare-fun res!193689 () Bool)

(assert (=> b!349492 (=> (not res!193689) (not e!214092))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!349492 (= res!193689 (validKeyInArray!0 k!1348))))

(declare-fun b!349493 () Bool)

(declare-fun e!214091 () Bool)

(declare-fun tp_is_empty!7597 () Bool)

(assert (=> b!349493 (= e!214091 tp_is_empty!7597)))

(declare-fun mapNonEmpty!12861 () Bool)

(declare-fun mapRes!12861 () Bool)

(declare-fun tp!26507 () Bool)

(declare-fun e!214089 () Bool)

(assert (=> mapNonEmpty!12861 (= mapRes!12861 (and tp!26507 e!214089))))

(declare-fun mapKey!12861 () (_ BitVec 32))

(declare-datatypes ((V!11107 0))(
  ( (V!11108 (val!3843 Int)) )
))
(declare-datatypes ((ValueCell!3455 0))(
  ( (ValueCellFull!3455 (v!6028 V!11107)) (EmptyCell!3455) )
))
(declare-fun mapValue!12861 () ValueCell!3455)

(declare-fun mapRest!12861 () (Array (_ BitVec 32) ValueCell!3455))

(declare-datatypes ((array!18781 0))(
  ( (array!18782 (arr!8898 (Array (_ BitVec 32) ValueCell!3455)) (size!9250 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18781)

(assert (=> mapNonEmpty!12861 (= (arr!8898 _values!1525) (store mapRest!12861 mapKey!12861 mapValue!12861))))

(declare-fun b!349494 () Bool)

(assert (=> b!349494 (= e!214089 tp_is_empty!7597)))

(declare-fun mapIsEmpty!12861 () Bool)

(assert (=> mapIsEmpty!12861 mapRes!12861))

(declare-fun b!349496 () Bool)

(declare-fun res!193688 () Bool)

(assert (=> b!349496 (=> (not res!193688) (not e!214092))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun zeroValue!1467 () V!11107)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!11107)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-datatypes ((tuple2!5548 0))(
  ( (tuple2!5549 (_1!2785 (_ BitVec 64)) (_2!2785 V!11107)) )
))
(declare-datatypes ((List!5171 0))(
  ( (Nil!5168) (Cons!5167 (h!6023 tuple2!5548) (t!10305 List!5171)) )
))
(declare-datatypes ((ListLongMap!4461 0))(
  ( (ListLongMap!4462 (toList!2246 List!5171)) )
))
(declare-fun contains!2313 (ListLongMap!4461 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1767 (array!18779 array!18781 (_ BitVec 32) (_ BitVec 32) V!11107 V!11107 (_ BitVec 32) Int) ListLongMap!4461)

(assert (=> b!349496 (= res!193688 (not (contains!2313 (getCurrentListMap!1767 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!349497 () Bool)

(declare-fun res!193685 () Bool)

(declare-fun e!214093 () Bool)

(assert (=> b!349497 (=> (not res!193685) (not e!214093))))

(declare-fun arrayContainsKey!0 (array!18779 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!349497 (= res!193685 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!349498 () Bool)

(assert (=> b!349498 (= e!214092 e!214093)))

(declare-fun res!193683 () Bool)

(assert (=> b!349498 (=> (not res!193683) (not e!214093))))

(declare-datatypes ((SeekEntryResult!3427 0))(
  ( (MissingZero!3427 (index!15887 (_ BitVec 32))) (Found!3427 (index!15888 (_ BitVec 32))) (Intermediate!3427 (undefined!4239 Bool) (index!15889 (_ BitVec 32)) (x!34807 (_ BitVec 32))) (Undefined!3427) (MissingVacant!3427 (index!15890 (_ BitVec 32))) )
))
(declare-fun lt!164214 () SeekEntryResult!3427)

(assert (=> b!349498 (= res!193683 (and (not (is-Found!3427 lt!164214)) (is-MissingZero!3427 lt!164214)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18779 (_ BitVec 32)) SeekEntryResult!3427)

(assert (=> b!349498 (= lt!164214 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!349499 () Bool)

(assert (=> b!349499 (= e!214093 (not true))))

(assert (=> b!349499 false))

(declare-datatypes ((Unit!10813 0))(
  ( (Unit!10814) )
))
(declare-fun lt!164215 () Unit!10813)

(declare-fun lemmaArrayContainsKeyThenInListMap!315 (array!18779 array!18781 (_ BitVec 32) (_ BitVec 32) V!11107 V!11107 (_ BitVec 64) (_ BitVec 32) Int) Unit!10813)

(declare-fun arrayScanForKey!0 (array!18779 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!349499 (= lt!164215 (lemmaArrayContainsKeyThenInListMap!315 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k!1348 (arrayScanForKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(declare-fun b!349500 () Bool)

(declare-fun res!193684 () Bool)

(assert (=> b!349500 (=> (not res!193684) (not e!214092))))

(assert (=> b!349500 (= res!193684 (and (= (size!9250 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9249 _keys!1895) (size!9250 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!349501 () Bool)

(declare-fun e!214088 () Bool)

(assert (=> b!349501 (= e!214088 (and e!214091 mapRes!12861))))

(declare-fun condMapEmpty!12861 () Bool)

(declare-fun mapDefault!12861 () ValueCell!3455)

