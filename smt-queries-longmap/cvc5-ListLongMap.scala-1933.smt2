; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34268 () Bool)

(assert start!34268)

(declare-fun b_free!7267 () Bool)

(declare-fun b_next!7267 () Bool)

(assert (=> start!34268 (= b_free!7267 (not b_next!7267))))

(declare-fun tp!25337 () Bool)

(declare-fun b_and!14469 () Bool)

(assert (=> start!34268 (= tp!25337 b_and!14469)))

(declare-fun b!341908 () Bool)

(declare-fun res!189013 () Bool)

(declare-fun e!209673 () Bool)

(assert (=> b!341908 (=> (not res!189013) (not e!209673))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10603 0))(
  ( (V!10604 (val!3654 Int)) )
))
(declare-datatypes ((ValueCell!3266 0))(
  ( (ValueCellFull!3266 (v!5827 V!10603)) (EmptyCell!3266) )
))
(declare-datatypes ((array!18033 0))(
  ( (array!18034 (arr!8536 (Array (_ BitVec 32) ValueCell!3266)) (size!8888 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18033)

(declare-datatypes ((array!18035 0))(
  ( (array!18036 (arr!8537 (Array (_ BitVec 32) (_ BitVec 64))) (size!8889 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18035)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!341908 (= res!189013 (and (= (size!8888 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8889 _keys!1895) (size!8888 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!341909 () Bool)

(declare-datatypes ((Unit!10621 0))(
  ( (Unit!10622) )
))
(declare-fun e!209676 () Unit!10621)

(declare-fun Unit!10623 () Unit!10621)

(assert (=> b!341909 (= e!209676 Unit!10623)))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun zeroValue!1467 () V!10603)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10603)

(declare-fun lt!161948 () Unit!10621)

(declare-fun lemmaArrayContainsKeyThenInListMap!293 (array!18035 array!18033 (_ BitVec 32) (_ BitVec 32) V!10603 V!10603 (_ BitVec 64) (_ BitVec 32) Int) Unit!10621)

(declare-fun arrayScanForKey!0 (array!18035 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!341909 (= lt!161948 (lemmaArrayContainsKeyThenInListMap!293 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k!1348 (arrayScanForKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!341909 false))

(declare-fun res!189012 () Bool)

(assert (=> start!34268 (=> (not res!189012) (not e!209673))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34268 (= res!189012 (validMask!0 mask!2385))))

(assert (=> start!34268 e!209673))

(assert (=> start!34268 true))

(declare-fun tp_is_empty!7219 () Bool)

(assert (=> start!34268 tp_is_empty!7219))

(assert (=> start!34268 tp!25337))

(declare-fun e!209678 () Bool)

(declare-fun array_inv!6318 (array!18033) Bool)

(assert (=> start!34268 (and (array_inv!6318 _values!1525) e!209678)))

(declare-fun array_inv!6319 (array!18035) Bool)

(assert (=> start!34268 (array_inv!6319 _keys!1895)))

(declare-fun b!341910 () Bool)

(declare-fun e!209679 () Bool)

(assert (=> b!341910 (= e!209679 tp_is_empty!7219)))

(declare-fun b!341911 () Bool)

(declare-fun res!189010 () Bool)

(assert (=> b!341911 (=> (not res!189010) (not e!209673))))

(declare-datatypes ((tuple2!5294 0))(
  ( (tuple2!5295 (_1!2658 (_ BitVec 64)) (_2!2658 V!10603)) )
))
(declare-datatypes ((List!4912 0))(
  ( (Nil!4909) (Cons!4908 (h!5764 tuple2!5294) (t!10022 List!4912)) )
))
(declare-datatypes ((ListLongMap!4207 0))(
  ( (ListLongMap!4208 (toList!2119 List!4912)) )
))
(declare-fun contains!2174 (ListLongMap!4207 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1640 (array!18035 array!18033 (_ BitVec 32) (_ BitVec 32) V!10603 V!10603 (_ BitVec 32) Int) ListLongMap!4207)

(assert (=> b!341911 (= res!189010 (not (contains!2174 (getCurrentListMap!1640 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun mapNonEmpty!12258 () Bool)

(declare-fun mapRes!12258 () Bool)

(declare-fun tp!25338 () Bool)

(declare-fun e!209675 () Bool)

(assert (=> mapNonEmpty!12258 (= mapRes!12258 (and tp!25338 e!209675))))

(declare-fun mapKey!12258 () (_ BitVec 32))

(declare-fun mapValue!12258 () ValueCell!3266)

(declare-fun mapRest!12258 () (Array (_ BitVec 32) ValueCell!3266))

(assert (=> mapNonEmpty!12258 (= (arr!8536 _values!1525) (store mapRest!12258 mapKey!12258 mapValue!12258))))

(declare-fun b!341912 () Bool)

(declare-fun e!209674 () Bool)

(assert (=> b!341912 (= e!209674 (and (bvslt #b00000000000000000000000000000000 (size!8889 _keys!1895)) (bvsge (size!8889 _keys!1895) #b01111111111111111111111111111111)))))

(declare-fun lt!161950 () Unit!10621)

(assert (=> b!341912 (= lt!161950 e!209676)))

(declare-fun c!52743 () Bool)

(declare-fun arrayContainsKey!0 (array!18035 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!341912 (= c!52743 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!12258 () Bool)

(assert (=> mapIsEmpty!12258 mapRes!12258))

(declare-fun b!341913 () Bool)

(assert (=> b!341913 (= e!209673 e!209674)))

(declare-fun res!189014 () Bool)

(assert (=> b!341913 (=> (not res!189014) (not e!209674))))

(declare-datatypes ((SeekEntryResult!3295 0))(
  ( (MissingZero!3295 (index!15359 (_ BitVec 32))) (Found!3295 (index!15360 (_ BitVec 32))) (Intermediate!3295 (undefined!4107 Bool) (index!15361 (_ BitVec 32)) (x!34051 (_ BitVec 32))) (Undefined!3295) (MissingVacant!3295 (index!15362 (_ BitVec 32))) )
))
(declare-fun lt!161949 () SeekEntryResult!3295)

(assert (=> b!341913 (= res!189014 (and (not (is-Found!3295 lt!161949)) (not (is-MissingZero!3295 lt!161949)) (is-MissingVacant!3295 lt!161949)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18035 (_ BitVec 32)) SeekEntryResult!3295)

(assert (=> b!341913 (= lt!161949 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!341914 () Bool)

(declare-fun res!189009 () Bool)

(assert (=> b!341914 (=> (not res!189009) (not e!209673))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!341914 (= res!189009 (validKeyInArray!0 k!1348))))

(declare-fun b!341915 () Bool)

(assert (=> b!341915 (= e!209678 (and e!209679 mapRes!12258))))

(declare-fun condMapEmpty!12258 () Bool)

(declare-fun mapDefault!12258 () ValueCell!3266)

