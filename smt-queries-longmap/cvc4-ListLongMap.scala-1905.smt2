; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33972 () Bool)

(assert start!33972)

(declare-fun b_free!7103 () Bool)

(declare-fun b_next!7103 () Bool)

(assert (=> start!33972 (= b_free!7103 (not b_next!7103))))

(declare-fun tp!24828 () Bool)

(declare-fun b_and!14293 () Bool)

(assert (=> start!33972 (= tp!24828 b_and!14293)))

(declare-fun b!338332 () Bool)

(declare-fun res!186887 () Bool)

(declare-fun e!207595 () Bool)

(assert (=> b!338332 (=> (not res!186887) (not e!207595))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!338332 (= res!186887 (validKeyInArray!0 k!1348))))

(declare-fun mapIsEmpty!11994 () Bool)

(declare-fun mapRes!11994 () Bool)

(assert (=> mapIsEmpty!11994 mapRes!11994))

(declare-fun b!338333 () Bool)

(declare-fun res!186888 () Bool)

(assert (=> b!338333 (=> (not res!186888) (not e!207595))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10383 0))(
  ( (V!10384 (val!3572 Int)) )
))
(declare-datatypes ((ValueCell!3184 0))(
  ( (ValueCellFull!3184 (v!5739 V!10383)) (EmptyCell!3184) )
))
(declare-datatypes ((array!17705 0))(
  ( (array!17706 (arr!8378 (Array (_ BitVec 32) ValueCell!3184)) (size!8730 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17705)

(declare-datatypes ((array!17707 0))(
  ( (array!17708 (arr!8379 (Array (_ BitVec 32) (_ BitVec 64))) (size!8731 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17707)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!338333 (= res!186888 (and (= (size!8730 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8731 _keys!1895) (size!8730 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!338334 () Bool)

(declare-fun res!186884 () Bool)

(assert (=> b!338334 (=> (not res!186884) (not e!207595))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17707 (_ BitVec 32)) Bool)

(assert (=> b!338334 (= res!186884 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!338335 () Bool)

(declare-fun res!186889 () Bool)

(assert (=> b!338335 (=> (not res!186889) (not e!207595))))

(declare-datatypes ((List!4804 0))(
  ( (Nil!4801) (Cons!4800 (h!5656 (_ BitVec 64)) (t!9902 List!4804)) )
))
(declare-fun arrayNoDuplicates!0 (array!17707 (_ BitVec 32) List!4804) Bool)

(assert (=> b!338335 (= res!186889 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4801))))

(declare-fun b!338336 () Bool)

(declare-datatypes ((Unit!10505 0))(
  ( (Unit!10506) )
))
(declare-fun e!207597 () Unit!10505)

(declare-fun Unit!10507 () Unit!10505)

(assert (=> b!338336 (= e!207597 Unit!10507)))

(declare-fun b!338337 () Bool)

(declare-fun e!207594 () Bool)

(assert (=> b!338337 (= e!207594 false)))

(declare-fun lt!160778 () Unit!10505)

(assert (=> b!338337 (= lt!160778 e!207597)))

(declare-fun c!52416 () Bool)

(declare-fun arrayContainsKey!0 (array!17707 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!338337 (= c!52416 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!338338 () Bool)

(declare-fun res!186886 () Bool)

(assert (=> b!338338 (=> (not res!186886) (not e!207595))))

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10383)

(declare-fun zeroValue!1467 () V!10383)

(declare-datatypes ((tuple2!5188 0))(
  ( (tuple2!5189 (_1!2605 (_ BitVec 64)) (_2!2605 V!10383)) )
))
(declare-datatypes ((List!4805 0))(
  ( (Nil!4802) (Cons!4801 (h!5657 tuple2!5188) (t!9903 List!4805)) )
))
(declare-datatypes ((ListLongMap!4101 0))(
  ( (ListLongMap!4102 (toList!2066 List!4805)) )
))
(declare-fun contains!2115 (ListLongMap!4101 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1587 (array!17707 array!17705 (_ BitVec 32) (_ BitVec 32) V!10383 V!10383 (_ BitVec 32) Int) ListLongMap!4101)

(assert (=> b!338338 (= res!186886 (not (contains!2115 (getCurrentListMap!1587 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun mapNonEmpty!11994 () Bool)

(declare-fun tp!24827 () Bool)

(declare-fun e!207599 () Bool)

(assert (=> mapNonEmpty!11994 (= mapRes!11994 (and tp!24827 e!207599))))

(declare-fun mapValue!11994 () ValueCell!3184)

(declare-fun mapRest!11994 () (Array (_ BitVec 32) ValueCell!3184))

(declare-fun mapKey!11994 () (_ BitVec 32))

(assert (=> mapNonEmpty!11994 (= (arr!8378 _values!1525) (store mapRest!11994 mapKey!11994 mapValue!11994))))

(declare-fun b!338340 () Bool)

(declare-fun e!207598 () Bool)

(declare-fun e!207596 () Bool)

(assert (=> b!338340 (= e!207598 (and e!207596 mapRes!11994))))

(declare-fun condMapEmpty!11994 () Bool)

(declare-fun mapDefault!11994 () ValueCell!3184)

