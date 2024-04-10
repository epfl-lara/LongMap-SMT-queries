; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34916 () Bool)

(assert start!34916)

(declare-fun b_free!7657 () Bool)

(declare-fun b_next!7657 () Bool)

(assert (=> start!34916 (= b_free!7657 (not b_next!7657))))

(declare-fun tp!26544 () Bool)

(declare-fun b_and!14883 () Bool)

(assert (=> start!34916 (= tp!26544 b_and!14883)))

(declare-fun b!349704 () Bool)

(declare-fun e!214210 () Bool)

(declare-fun e!214215 () Bool)

(assert (=> b!349704 (= e!214210 e!214215)))

(declare-fun res!193827 () Bool)

(assert (=> b!349704 (=> (not res!193827) (not e!214215))))

(declare-datatypes ((SeekEntryResult!3431 0))(
  ( (MissingZero!3431 (index!15903 (_ BitVec 32))) (Found!3431 (index!15904 (_ BitVec 32))) (Intermediate!3431 (undefined!4243 Bool) (index!15905 (_ BitVec 32)) (x!34827 (_ BitVec 32))) (Undefined!3431) (MissingVacant!3431 (index!15906 (_ BitVec 32))) )
))
(declare-fun lt!164275 () SeekEntryResult!3431)

(assert (=> b!349704 (= res!193827 (and (not (is-Found!3431 lt!164275)) (is-MissingZero!3431 lt!164275)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((array!18801 0))(
  ( (array!18802 (arr!8908 (Array (_ BitVec 32) (_ BitVec 64))) (size!9260 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18801)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18801 (_ BitVec 32)) SeekEntryResult!3431)

(assert (=> b!349704 (= lt!164275 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!349705 () Bool)

(declare-fun e!214216 () Bool)

(declare-fun tp_is_empty!7609 () Bool)

(assert (=> b!349705 (= e!214216 tp_is_empty!7609)))

(declare-fun b!349706 () Bool)

(declare-fun res!193821 () Bool)

(assert (=> b!349706 (=> (not res!193821) (not e!214210))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18801 (_ BitVec 32)) Bool)

(assert (=> b!349706 (= res!193821 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!349707 () Bool)

(declare-datatypes ((Unit!10827 0))(
  ( (Unit!10828) )
))
(declare-fun e!214213 () Unit!10827)

(declare-fun Unit!10829 () Unit!10827)

(assert (=> b!349707 (= e!214213 Unit!10829)))

(declare-fun res!193820 () Bool)

(assert (=> start!34916 (=> (not res!193820) (not e!214210))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34916 (= res!193820 (validMask!0 mask!2385))))

(assert (=> start!34916 e!214210))

(assert (=> start!34916 true))

(assert (=> start!34916 tp_is_empty!7609))

(assert (=> start!34916 tp!26544))

(declare-datatypes ((V!11123 0))(
  ( (V!11124 (val!3849 Int)) )
))
(declare-datatypes ((ValueCell!3461 0))(
  ( (ValueCellFull!3461 (v!6034 V!11123)) (EmptyCell!3461) )
))
(declare-datatypes ((array!18803 0))(
  ( (array!18804 (arr!8909 (Array (_ BitVec 32) ValueCell!3461)) (size!9261 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18803)

(declare-fun e!214212 () Bool)

(declare-fun array_inv!6584 (array!18803) Bool)

(assert (=> start!34916 (and (array_inv!6584 _values!1525) e!214212)))

(declare-fun array_inv!6585 (array!18801) Bool)

(assert (=> start!34916 (array_inv!6585 _keys!1895)))

(declare-fun b!349708 () Bool)

(declare-fun res!193819 () Bool)

(assert (=> b!349708 (=> (not res!193819) (not e!214210))))

(declare-fun zeroValue!1467 () V!11123)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11123)

(declare-datatypes ((tuple2!5558 0))(
  ( (tuple2!5559 (_1!2790 (_ BitVec 64)) (_2!2790 V!11123)) )
))
(declare-datatypes ((List!5179 0))(
  ( (Nil!5176) (Cons!5175 (h!6031 tuple2!5558) (t!10313 List!5179)) )
))
(declare-datatypes ((ListLongMap!4471 0))(
  ( (ListLongMap!4472 (toList!2251 List!5179)) )
))
(declare-fun contains!2318 (ListLongMap!4471 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1772 (array!18801 array!18803 (_ BitVec 32) (_ BitVec 32) V!11123 V!11123 (_ BitVec 32) Int) ListLongMap!4471)

(assert (=> b!349708 (= res!193819 (not (contains!2318 (getCurrentListMap!1772 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun mapIsEmpty!12879 () Bool)

(declare-fun mapRes!12879 () Bool)

(assert (=> mapIsEmpty!12879 mapRes!12879))

(declare-fun b!349709 () Bool)

(declare-fun res!193823 () Bool)

(assert (=> b!349709 (=> (not res!193823) (not e!214210))))

(assert (=> b!349709 (= res!193823 (and (= (size!9261 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9260 _keys!1895) (size!9261 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!349710 () Bool)

(declare-fun Unit!10830 () Unit!10827)

(assert (=> b!349710 (= e!214213 Unit!10830)))

(declare-fun lt!164274 () Unit!10827)

(declare-fun lemmaArrayContainsKeyThenInListMap!320 (array!18801 array!18803 (_ BitVec 32) (_ BitVec 32) V!11123 V!11123 (_ BitVec 64) (_ BitVec 32) Int) Unit!10827)

(declare-fun arrayScanForKey!0 (array!18801 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!349710 (= lt!164274 (lemmaArrayContainsKeyThenInListMap!320 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k!1348 (arrayScanForKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!349710 false))

(declare-fun b!349711 () Bool)

(declare-fun e!214214 () Bool)

(assert (=> b!349711 (= e!214214 tp_is_empty!7609)))

(declare-fun b!349712 () Bool)

(declare-fun res!193826 () Bool)

(assert (=> b!349712 (=> (not res!193826) (not e!214210))))

(declare-datatypes ((List!5180 0))(
  ( (Nil!5177) (Cons!5176 (h!6032 (_ BitVec 64)) (t!10314 List!5180)) )
))
(declare-fun arrayNoDuplicates!0 (array!18801 (_ BitVec 32) List!5180) Bool)

(assert (=> b!349712 (= res!193826 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5177))))

(declare-fun b!349713 () Bool)

(declare-fun res!193824 () Bool)

(assert (=> b!349713 (=> (not res!193824) (not e!214210))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!349713 (= res!193824 (validKeyInArray!0 k!1348))))

(declare-fun b!349714 () Bool)

(declare-fun res!193825 () Bool)

(declare-fun e!214211 () Bool)

(assert (=> b!349714 (=> (not res!193825) (not e!214211))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!349714 (= res!193825 (inRange!0 (index!15903 lt!164275) mask!2385))))

(declare-fun b!349715 () Bool)

(assert (=> b!349715 (= e!214212 (and e!214216 mapRes!12879))))

(declare-fun condMapEmpty!12879 () Bool)

(declare-fun mapDefault!12879 () ValueCell!3461)

