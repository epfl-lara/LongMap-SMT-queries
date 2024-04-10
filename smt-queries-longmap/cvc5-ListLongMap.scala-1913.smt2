; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34068 () Bool)

(assert start!34068)

(declare-fun b_free!7147 () Bool)

(declare-fun b_next!7147 () Bool)

(assert (=> start!34068 (= b_free!7147 (not b_next!7147))))

(declare-fun tp!24965 () Bool)

(declare-fun b_and!14341 () Bool)

(assert (=> start!34068 (= tp!24965 b_and!14341)))

(declare-fun mapIsEmpty!12066 () Bool)

(declare-fun mapRes!12066 () Bool)

(assert (=> mapIsEmpty!12066 mapRes!12066))

(declare-fun res!187488 () Bool)

(declare-fun e!208257 () Bool)

(assert (=> start!34068 (=> (not res!187488) (not e!208257))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34068 (= res!187488 (validMask!0 mask!2385))))

(assert (=> start!34068 e!208257))

(assert (=> start!34068 true))

(declare-fun tp_is_empty!7099 () Bool)

(assert (=> start!34068 tp_is_empty!7099))

(assert (=> start!34068 tp!24965))

(declare-datatypes ((V!10443 0))(
  ( (V!10444 (val!3594 Int)) )
))
(declare-datatypes ((ValueCell!3206 0))(
  ( (ValueCellFull!3206 (v!5763 V!10443)) (EmptyCell!3206) )
))
(declare-datatypes ((array!17797 0))(
  ( (array!17798 (arr!8422 (Array (_ BitVec 32) ValueCell!3206)) (size!8774 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17797)

(declare-fun e!208259 () Bool)

(declare-fun array_inv!6244 (array!17797) Bool)

(assert (=> start!34068 (and (array_inv!6244 _values!1525) e!208259)))

(declare-datatypes ((array!17799 0))(
  ( (array!17800 (arr!8423 (Array (_ BitVec 32) (_ BitVec 64))) (size!8775 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17799)

(declare-fun array_inv!6245 (array!17799) Bool)

(assert (=> start!34068 (array_inv!6245 _keys!1895)))

(declare-fun b!339438 () Bool)

(declare-fun res!187484 () Bool)

(assert (=> b!339438 (=> (not res!187484) (not e!208257))))

(declare-datatypes ((List!4836 0))(
  ( (Nil!4833) (Cons!4832 (h!5688 (_ BitVec 64)) (t!9938 List!4836)) )
))
(declare-fun arrayNoDuplicates!0 (array!17799 (_ BitVec 32) List!4836) Bool)

(assert (=> b!339438 (= res!187484 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4833))))

(declare-fun b!339439 () Bool)

(declare-fun res!187489 () Bool)

(assert (=> b!339439 (=> (not res!187489) (not e!208257))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!339439 (= res!187489 (and (= (size!8774 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8775 _keys!1895) (size!8774 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!339440 () Bool)

(declare-fun e!208254 () Bool)

(assert (=> b!339440 (= e!208254 false)))

(declare-datatypes ((Unit!10572 0))(
  ( (Unit!10573) )
))
(declare-fun lt!161207 () Unit!10572)

(declare-fun e!208255 () Unit!10572)

(assert (=> b!339440 (= lt!161207 e!208255)))

(declare-fun c!52560 () Bool)

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!17799 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!339440 (= c!52560 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!339441 () Bool)

(declare-fun Unit!10574 () Unit!10572)

(assert (=> b!339441 (= e!208255 Unit!10574)))

(declare-fun lt!161209 () Unit!10572)

(declare-fun zeroValue!1467 () V!10443)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10443)

(declare-fun lemmaArrayContainsKeyThenInListMap!285 (array!17799 array!17797 (_ BitVec 32) (_ BitVec 32) V!10443 V!10443 (_ BitVec 64) (_ BitVec 32) Int) Unit!10572)

(declare-fun arrayScanForKey!0 (array!17799 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!339441 (= lt!161209 (lemmaArrayContainsKeyThenInListMap!285 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k!1348 (arrayScanForKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!339441 false))

(declare-fun b!339442 () Bool)

(declare-fun Unit!10575 () Unit!10572)

(assert (=> b!339442 (= e!208255 Unit!10575)))

(declare-fun b!339443 () Bool)

(declare-fun res!187486 () Bool)

(assert (=> b!339443 (=> (not res!187486) (not e!208257))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17799 (_ BitVec 32)) Bool)

(assert (=> b!339443 (= res!187486 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!12066 () Bool)

(declare-fun tp!24966 () Bool)

(declare-fun e!208256 () Bool)

(assert (=> mapNonEmpty!12066 (= mapRes!12066 (and tp!24966 e!208256))))

(declare-fun mapRest!12066 () (Array (_ BitVec 32) ValueCell!3206))

(declare-fun mapKey!12066 () (_ BitVec 32))

(declare-fun mapValue!12066 () ValueCell!3206)

(assert (=> mapNonEmpty!12066 (= (arr!8422 _values!1525) (store mapRest!12066 mapKey!12066 mapValue!12066))))

(declare-fun b!339444 () Bool)

(assert (=> b!339444 (= e!208256 tp_is_empty!7099)))

(declare-fun b!339445 () Bool)

(declare-fun res!187490 () Bool)

(assert (=> b!339445 (=> (not res!187490) (not e!208257))))

(declare-datatypes ((tuple2!5218 0))(
  ( (tuple2!5219 (_1!2620 (_ BitVec 64)) (_2!2620 V!10443)) )
))
(declare-datatypes ((List!4837 0))(
  ( (Nil!4834) (Cons!4833 (h!5689 tuple2!5218) (t!9939 List!4837)) )
))
(declare-datatypes ((ListLongMap!4131 0))(
  ( (ListLongMap!4132 (toList!2081 List!4837)) )
))
(declare-fun contains!2132 (ListLongMap!4131 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1602 (array!17799 array!17797 (_ BitVec 32) (_ BitVec 32) V!10443 V!10443 (_ BitVec 32) Int) ListLongMap!4131)

(assert (=> b!339445 (= res!187490 (not (contains!2132 (getCurrentListMap!1602 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!339446 () Bool)

(declare-fun res!187487 () Bool)

(assert (=> b!339446 (=> (not res!187487) (not e!208257))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!339446 (= res!187487 (validKeyInArray!0 k!1348))))

(declare-fun b!339447 () Bool)

(declare-fun e!208260 () Bool)

(assert (=> b!339447 (= e!208259 (and e!208260 mapRes!12066))))

(declare-fun condMapEmpty!12066 () Bool)

(declare-fun mapDefault!12066 () ValueCell!3206)

