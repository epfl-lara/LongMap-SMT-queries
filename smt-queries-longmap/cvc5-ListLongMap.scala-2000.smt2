; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34954 () Bool)

(assert start!34954)

(declare-fun b_free!7669 () Bool)

(declare-fun b_next!7669 () Bool)

(assert (=> start!34954 (= b_free!7669 (not b_next!7669))))

(declare-fun tp!26583 () Bool)

(declare-fun b_and!14897 () Bool)

(assert (=> start!34954 (= tp!26583 b_and!14897)))

(declare-fun b!350087 () Bool)

(declare-fun res!194018 () Bool)

(declare-fun e!214451 () Bool)

(assert (=> b!350087 (=> (not res!194018) (not e!214451))))

(declare-datatypes ((array!18827 0))(
  ( (array!18828 (arr!8920 (Array (_ BitVec 32) (_ BitVec 64))) (size!9272 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18827)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18827 (_ BitVec 32)) Bool)

(assert (=> b!350087 (= res!194018 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!350088 () Bool)

(declare-fun e!214442 () Bool)

(assert (=> b!350088 (= e!214451 e!214442)))

(declare-fun res!194019 () Bool)

(assert (=> b!350088 (=> (not res!194019) (not e!214442))))

(declare-datatypes ((SeekEntryResult!3436 0))(
  ( (MissingZero!3436 (index!15923 (_ BitVec 32))) (Found!3436 (index!15924 (_ BitVec 32))) (Intermediate!3436 (undefined!4248 Bool) (index!15925 (_ BitVec 32)) (x!34858 (_ BitVec 32))) (Undefined!3436) (MissingVacant!3436 (index!15926 (_ BitVec 32))) )
))
(declare-fun lt!164438 () SeekEntryResult!3436)

(assert (=> b!350088 (= res!194019 (and (not (is-Found!3436 lt!164438)) (is-MissingZero!3436 lt!164438)))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18827 (_ BitVec 32)) SeekEntryResult!3436)

(assert (=> b!350088 (= lt!164438 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!350089 () Bool)

(declare-fun res!194024 () Bool)

(assert (=> b!350089 (=> (not res!194024) (not e!214451))))

(declare-datatypes ((List!5188 0))(
  ( (Nil!5185) (Cons!5184 (h!6040 (_ BitVec 64)) (t!10324 List!5188)) )
))
(declare-fun arrayNoDuplicates!0 (array!18827 (_ BitVec 32) List!5188) Bool)

(assert (=> b!350089 (= res!194024 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5185))))

(declare-fun mapNonEmpty!12900 () Bool)

(declare-fun mapRes!12900 () Bool)

(declare-fun tp!26582 () Bool)

(declare-fun e!214452 () Bool)

(assert (=> mapNonEmpty!12900 (= mapRes!12900 (and tp!26582 e!214452))))

(declare-datatypes ((V!11139 0))(
  ( (V!11140 (val!3855 Int)) )
))
(declare-datatypes ((ValueCell!3467 0))(
  ( (ValueCellFull!3467 (v!6041 V!11139)) (EmptyCell!3467) )
))
(declare-fun mapValue!12900 () ValueCell!3467)

(declare-datatypes ((array!18829 0))(
  ( (array!18830 (arr!8921 (Array (_ BitVec 32) ValueCell!3467)) (size!9273 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18829)

(declare-fun mapKey!12900 () (_ BitVec 32))

(declare-fun mapRest!12900 () (Array (_ BitVec 32) ValueCell!3467))

(assert (=> mapNonEmpty!12900 (= (arr!8921 _values!1525) (store mapRest!12900 mapKey!12900 mapValue!12900))))

(declare-fun b!350090 () Bool)

(declare-datatypes ((Unit!10847 0))(
  ( (Unit!10848) )
))
(declare-fun e!214448 () Unit!10847)

(declare-fun Unit!10849 () Unit!10847)

(assert (=> b!350090 (= e!214448 Unit!10849)))

(declare-fun zeroValue!1467 () V!11139)

(declare-fun lt!164439 () Unit!10847)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11139)

(declare-fun lemmaArrayContainsKeyThenInListMap!324 (array!18827 array!18829 (_ BitVec 32) (_ BitVec 32) V!11139 V!11139 (_ BitVec 64) (_ BitVec 32) Int) Unit!10847)

(declare-fun arrayScanForKey!0 (array!18827 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!350090 (= lt!164439 (lemmaArrayContainsKeyThenInListMap!324 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k!1348 (arrayScanForKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!350090 false))

(declare-fun b!350091 () Bool)

(declare-fun e!214445 () Bool)

(declare-fun e!214447 () Bool)

(assert (=> b!350091 (= e!214445 e!214447)))

(declare-fun res!194020 () Bool)

(declare-fun call!26947 () Bool)

(assert (=> b!350091 (= res!194020 (not call!26947))))

(assert (=> b!350091 (=> res!194020 e!214447)))

(declare-fun b!350092 () Bool)

(declare-fun res!194021 () Bool)

(assert (=> b!350092 (=> (not res!194021) (not e!214451))))

(declare-datatypes ((tuple2!5568 0))(
  ( (tuple2!5569 (_1!2795 (_ BitVec 64)) (_2!2795 V!11139)) )
))
(declare-datatypes ((List!5189 0))(
  ( (Nil!5186) (Cons!5185 (h!6041 tuple2!5568) (t!10325 List!5189)) )
))
(declare-datatypes ((ListLongMap!4481 0))(
  ( (ListLongMap!4482 (toList!2256 List!5189)) )
))
(declare-fun contains!2324 (ListLongMap!4481 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1777 (array!18827 array!18829 (_ BitVec 32) (_ BitVec 32) V!11139 V!11139 (_ BitVec 32) Int) ListLongMap!4481)

(assert (=> b!350092 (= res!194021 (not (contains!2324 (getCurrentListMap!1777 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!350093 () Bool)

(declare-fun res!194023 () Bool)

(declare-fun e!214453 () Bool)

(assert (=> b!350093 (=> res!194023 e!214453)))

(assert (=> b!350093 (= res!194023 (not call!26947))))

(declare-fun e!214449 () Bool)

(assert (=> b!350093 (= e!214449 e!214453)))

(declare-fun b!350094 () Bool)

(declare-fun Unit!10850 () Unit!10847)

(assert (=> b!350094 (= e!214448 Unit!10850)))

(declare-fun mapIsEmpty!12900 () Bool)

(assert (=> mapIsEmpty!12900 mapRes!12900))

(declare-fun b!350095 () Bool)

(declare-fun e!214450 () Bool)

(assert (=> b!350095 (= e!214450 e!214445)))

(declare-fun c!53360 () Bool)

(assert (=> b!350095 (= c!53360 (is-MissingZero!3436 lt!164438))))

(declare-fun b!350096 () Bool)

(assert (=> b!350096 (= e!214447 (not (= (select (arr!8920 _keys!1895) (index!15923 lt!164438)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!350097 () Bool)

(assert (=> b!350097 (= e!214449 (not (is-Undefined!3436 lt!164438)))))

(declare-fun bm!26944 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!26944 (= call!26947 (inRange!0 (ite c!53360 (index!15923 lt!164438) (index!15926 lt!164438)) mask!2385))))

(declare-fun b!350098 () Bool)

(declare-fun tp_is_empty!7621 () Bool)

(assert (=> b!350098 (= e!214452 tp_is_empty!7621)))

(declare-fun b!350099 () Bool)

(declare-fun res!194016 () Bool)

(assert (=> b!350099 (=> (not res!194016) (not e!214451))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!350099 (= res!194016 (validKeyInArray!0 k!1348))))

(declare-fun b!350100 () Bool)

(declare-fun e!214446 () Bool)

(declare-fun e!214443 () Bool)

(assert (=> b!350100 (= e!214446 (and e!214443 mapRes!12900))))

(declare-fun condMapEmpty!12900 () Bool)

(declare-fun mapDefault!12900 () ValueCell!3467)

