; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34072 () Bool)

(assert start!34072)

(declare-fun b_free!7151 () Bool)

(declare-fun b_next!7151 () Bool)

(assert (=> start!34072 (= b_free!7151 (not b_next!7151))))

(declare-fun tp!24978 () Bool)

(declare-fun b_and!14345 () Bool)

(assert (=> start!34072 (= tp!24978 b_and!14345)))

(declare-fun b!339510 () Bool)

(declare-fun e!208297 () Bool)

(declare-fun tp_is_empty!7103 () Bool)

(assert (=> b!339510 (= e!208297 tp_is_empty!7103)))

(declare-fun b!339511 () Bool)

(declare-fun res!187528 () Bool)

(declare-fun e!208300 () Bool)

(assert (=> b!339511 (=> (not res!187528) (not e!208300))))

(declare-datatypes ((array!17805 0))(
  ( (array!17806 (arr!8426 (Array (_ BitVec 32) (_ BitVec 64))) (size!8778 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17805)

(declare-datatypes ((List!4840 0))(
  ( (Nil!4837) (Cons!4836 (h!5692 (_ BitVec 64)) (t!9942 List!4840)) )
))
(declare-fun arrayNoDuplicates!0 (array!17805 (_ BitVec 32) List!4840) Bool)

(assert (=> b!339511 (= res!187528 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4837))))

(declare-fun b!339512 () Bool)

(declare-fun res!187527 () Bool)

(assert (=> b!339512 (=> (not res!187527) (not e!208300))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((V!10447 0))(
  ( (V!10448 (val!3596 Int)) )
))
(declare-fun zeroValue!1467 () V!10447)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3208 0))(
  ( (ValueCellFull!3208 (v!5765 V!10447)) (EmptyCell!3208) )
))
(declare-datatypes ((array!17807 0))(
  ( (array!17808 (arr!8427 (Array (_ BitVec 32) ValueCell!3208)) (size!8779 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17807)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10447)

(declare-datatypes ((tuple2!5222 0))(
  ( (tuple2!5223 (_1!2622 (_ BitVec 64)) (_2!2622 V!10447)) )
))
(declare-datatypes ((List!4841 0))(
  ( (Nil!4838) (Cons!4837 (h!5693 tuple2!5222) (t!9943 List!4841)) )
))
(declare-datatypes ((ListLongMap!4135 0))(
  ( (ListLongMap!4136 (toList!2083 List!4841)) )
))
(declare-fun contains!2134 (ListLongMap!4135 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1604 (array!17805 array!17807 (_ BitVec 32) (_ BitVec 32) V!10447 V!10447 (_ BitVec 32) Int) ListLongMap!4135)

(assert (=> b!339512 (= res!187527 (not (contains!2134 (getCurrentListMap!1604 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!339513 () Bool)

(declare-fun res!187531 () Bool)

(assert (=> b!339513 (=> (not res!187531) (not e!208300))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17805 (_ BitVec 32)) Bool)

(assert (=> b!339513 (= res!187531 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!339514 () Bool)

(declare-fun e!208302 () Bool)

(assert (=> b!339514 (= e!208302 false)))

(declare-datatypes ((Unit!10580 0))(
  ( (Unit!10581) )
))
(declare-fun lt!161227 () Unit!10580)

(declare-fun e!208301 () Unit!10580)

(assert (=> b!339514 (= lt!161227 e!208301)))

(declare-fun c!52566 () Bool)

(declare-fun arrayContainsKey!0 (array!17805 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!339514 (= c!52566 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!339515 () Bool)

(declare-fun res!187529 () Bool)

(assert (=> b!339515 (=> (not res!187529) (not e!208300))))

(assert (=> b!339515 (= res!187529 (and (= (size!8779 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8778 _keys!1895) (size!8779 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!339516 () Bool)

(assert (=> b!339516 (= e!208300 e!208302)))

(declare-fun res!187532 () Bool)

(assert (=> b!339516 (=> (not res!187532) (not e!208302))))

(declare-datatypes ((SeekEntryResult!3255 0))(
  ( (MissingZero!3255 (index!15199 (_ BitVec 32))) (Found!3255 (index!15200 (_ BitVec 32))) (Intermediate!3255 (undefined!4067 Bool) (index!15201 (_ BitVec 32)) (x!33811 (_ BitVec 32))) (Undefined!3255) (MissingVacant!3255 (index!15202 (_ BitVec 32))) )
))
(declare-fun lt!161226 () SeekEntryResult!3255)

(assert (=> b!339516 (= res!187532 (and (not (is-Found!3255 lt!161226)) (is-MissingZero!3255 lt!161226)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17805 (_ BitVec 32)) SeekEntryResult!3255)

(assert (=> b!339516 (= lt!161226 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!12072 () Bool)

(declare-fun mapRes!12072 () Bool)

(declare-fun tp!24977 () Bool)

(assert (=> mapNonEmpty!12072 (= mapRes!12072 (and tp!24977 e!208297))))

(declare-fun mapRest!12072 () (Array (_ BitVec 32) ValueCell!3208))

(declare-fun mapKey!12072 () (_ BitVec 32))

(declare-fun mapValue!12072 () ValueCell!3208)

(assert (=> mapNonEmpty!12072 (= (arr!8427 _values!1525) (store mapRest!12072 mapKey!12072 mapValue!12072))))

(declare-fun mapIsEmpty!12072 () Bool)

(assert (=> mapIsEmpty!12072 mapRes!12072))

(declare-fun b!339517 () Bool)

(declare-fun e!208299 () Bool)

(declare-fun e!208298 () Bool)

(assert (=> b!339517 (= e!208299 (and e!208298 mapRes!12072))))

(declare-fun condMapEmpty!12072 () Bool)

(declare-fun mapDefault!12072 () ValueCell!3208)

