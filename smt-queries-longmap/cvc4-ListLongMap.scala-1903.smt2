; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33912 () Bool)

(assert start!33912)

(declare-fun b_free!7091 () Bool)

(declare-fun b_next!7091 () Bool)

(assert (=> start!33912 (= b_free!7091 (not b_next!7091))))

(declare-fun tp!24785 () Bool)

(declare-fun b_and!14277 () Bool)

(assert (=> start!33912 (= tp!24785 b_and!14277)))

(declare-fun b!337838 () Bool)

(declare-fun res!186662 () Bool)

(declare-fun e!207291 () Bool)

(assert (=> b!337838 (=> (not res!186662) (not e!207291))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!337838 (= res!186662 (validKeyInArray!0 k!1348))))

(declare-fun mapIsEmpty!11970 () Bool)

(declare-fun mapRes!11970 () Bool)

(assert (=> mapIsEmpty!11970 mapRes!11970))

(declare-fun b!337839 () Bool)

(declare-datatypes ((Unit!10481 0))(
  ( (Unit!10482) )
))
(declare-fun e!207289 () Unit!10481)

(declare-fun Unit!10483 () Unit!10481)

(assert (=> b!337839 (= e!207289 Unit!10483)))

(declare-fun b!337840 () Bool)

(declare-fun res!186659 () Bool)

(assert (=> b!337840 (=> (not res!186659) (not e!207291))))

(declare-datatypes ((array!17679 0))(
  ( (array!17680 (arr!8367 (Array (_ BitVec 32) (_ BitVec 64))) (size!8719 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17679)

(declare-datatypes ((List!4794 0))(
  ( (Nil!4791) (Cons!4790 (h!5646 (_ BitVec 64)) (t!9888 List!4794)) )
))
(declare-fun arrayNoDuplicates!0 (array!17679 (_ BitVec 32) List!4794) Bool)

(assert (=> b!337840 (= res!186659 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4791))))

(declare-fun b!337841 () Bool)

(declare-fun res!186656 () Bool)

(assert (=> b!337841 (=> (not res!186656) (not e!207291))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10367 0))(
  ( (V!10368 (val!3566 Int)) )
))
(declare-fun zeroValue!1467 () V!10367)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3178 0))(
  ( (ValueCellFull!3178 (v!5731 V!10367)) (EmptyCell!3178) )
))
(declare-datatypes ((array!17681 0))(
  ( (array!17682 (arr!8368 (Array (_ BitVec 32) ValueCell!3178)) (size!8720 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17681)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10367)

(declare-datatypes ((tuple2!5178 0))(
  ( (tuple2!5179 (_1!2600 (_ BitVec 64)) (_2!2600 V!10367)) )
))
(declare-datatypes ((List!4795 0))(
  ( (Nil!4792) (Cons!4791 (h!5647 tuple2!5178) (t!9889 List!4795)) )
))
(declare-datatypes ((ListLongMap!4091 0))(
  ( (ListLongMap!4092 (toList!2061 List!4795)) )
))
(declare-fun contains!2108 (ListLongMap!4091 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1582 (array!17679 array!17681 (_ BitVec 32) (_ BitVec 32) V!10367 V!10367 (_ BitVec 32) Int) ListLongMap!4091)

(assert (=> b!337841 (= res!186656 (not (contains!2108 (getCurrentListMap!1582 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!337842 () Bool)

(declare-fun e!207294 () Bool)

(assert (=> b!337842 (= e!207291 e!207294)))

(declare-fun res!186660 () Bool)

(assert (=> b!337842 (=> (not res!186660) (not e!207294))))

(declare-datatypes ((SeekEntryResult!3231 0))(
  ( (MissingZero!3231 (index!15103 (_ BitVec 32))) (Found!3231 (index!15104 (_ BitVec 32))) (Intermediate!3231 (undefined!4043 Bool) (index!15105 (_ BitVec 32)) (x!33667 (_ BitVec 32))) (Undefined!3231) (MissingVacant!3231 (index!15106 (_ BitVec 32))) )
))
(declare-fun lt!160522 () SeekEntryResult!3231)

(assert (=> b!337842 (= res!186660 (and (not (is-Found!3231 lt!160522)) (is-MissingZero!3231 lt!160522)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17679 (_ BitVec 32)) SeekEntryResult!3231)

(assert (=> b!337842 (= lt!160522 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!337843 () Bool)

(assert (=> b!337843 (= e!207294 (bvsge #b00000000000000000000000000000000 (size!8719 _keys!1895)))))

(declare-fun lt!160520 () Unit!10481)

(assert (=> b!337843 (= lt!160520 e!207289)))

(declare-fun c!52320 () Bool)

(declare-fun arrayContainsKey!0 (array!17679 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!337843 (= c!52320 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!11970 () Bool)

(declare-fun tp!24786 () Bool)

(declare-fun e!207288 () Bool)

(assert (=> mapNonEmpty!11970 (= mapRes!11970 (and tp!24786 e!207288))))

(declare-fun mapKey!11970 () (_ BitVec 32))

(declare-fun mapValue!11970 () ValueCell!3178)

(declare-fun mapRest!11970 () (Array (_ BitVec 32) ValueCell!3178))

(assert (=> mapNonEmpty!11970 (= (arr!8368 _values!1525) (store mapRest!11970 mapKey!11970 mapValue!11970))))

(declare-fun b!337844 () Bool)

(declare-fun res!186657 () Bool)

(assert (=> b!337844 (=> (not res!186657) (not e!207291))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17679 (_ BitVec 32)) Bool)

(assert (=> b!337844 (= res!186657 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!337845 () Bool)

(declare-fun tp_is_empty!7043 () Bool)

(assert (=> b!337845 (= e!207288 tp_is_empty!7043)))

(declare-fun b!337846 () Bool)

(declare-fun Unit!10484 () Unit!10481)

(assert (=> b!337846 (= e!207289 Unit!10484)))

(declare-fun lt!160521 () Unit!10481)

(declare-fun lemmaArrayContainsKeyThenInListMap!267 (array!17679 array!17681 (_ BitVec 32) (_ BitVec 32) V!10367 V!10367 (_ BitVec 64) (_ BitVec 32) Int) Unit!10481)

(declare-fun arrayScanForKey!0 (array!17679 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!337846 (= lt!160521 (lemmaArrayContainsKeyThenInListMap!267 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k!1348 (arrayScanForKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!337846 false))

(declare-fun res!186661 () Bool)

(assert (=> start!33912 (=> (not res!186661) (not e!207291))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33912 (= res!186661 (validMask!0 mask!2385))))

(assert (=> start!33912 e!207291))

(assert (=> start!33912 true))

(assert (=> start!33912 tp_is_empty!7043))

(assert (=> start!33912 tp!24785))

(declare-fun e!207292 () Bool)

(declare-fun array_inv!6210 (array!17681) Bool)

(assert (=> start!33912 (and (array_inv!6210 _values!1525) e!207292)))

(declare-fun array_inv!6211 (array!17679) Bool)

(assert (=> start!33912 (array_inv!6211 _keys!1895)))

(declare-fun b!337847 () Bool)

(declare-fun e!207290 () Bool)

(assert (=> b!337847 (= e!207290 tp_is_empty!7043)))

(declare-fun b!337848 () Bool)

(assert (=> b!337848 (= e!207292 (and e!207290 mapRes!11970))))

(declare-fun condMapEmpty!11970 () Bool)

(declare-fun mapDefault!11970 () ValueCell!3178)

