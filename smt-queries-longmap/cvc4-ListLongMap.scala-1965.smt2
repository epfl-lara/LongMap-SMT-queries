; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34558 () Bool)

(assert start!34558)

(declare-fun b_free!7463 () Bool)

(declare-fun b_next!7463 () Bool)

(assert (=> start!34558 (= b_free!7463 (not b_next!7463))))

(declare-fun tp!25938 () Bool)

(declare-fun b_and!14673 () Bool)

(assert (=> start!34558 (= tp!25938 b_and!14673)))

(declare-fun b!345433 () Bool)

(declare-fun res!191114 () Bool)

(declare-fun e!211716 () Bool)

(assert (=> b!345433 (=> (not res!191114) (not e!211716))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((V!10863 0))(
  ( (V!10864 (val!3752 Int)) )
))
(declare-fun zeroValue!1467 () V!10863)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3364 0))(
  ( (ValueCellFull!3364 (v!5929 V!10863)) (EmptyCell!3364) )
))
(declare-datatypes ((array!18415 0))(
  ( (array!18416 (arr!8723 (Array (_ BitVec 32) ValueCell!3364)) (size!9075 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18415)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10863)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((array!18417 0))(
  ( (array!18418 (arr!8724 (Array (_ BitVec 32) (_ BitVec 64))) (size!9076 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18417)

(declare-datatypes ((tuple2!5424 0))(
  ( (tuple2!5425 (_1!2723 (_ BitVec 64)) (_2!2723 V!10863)) )
))
(declare-datatypes ((List!5048 0))(
  ( (Nil!5045) (Cons!5044 (h!5900 tuple2!5424) (t!10166 List!5048)) )
))
(declare-datatypes ((ListLongMap!4337 0))(
  ( (ListLongMap!4338 (toList!2184 List!5048)) )
))
(declare-fun contains!2243 (ListLongMap!4337 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1705 (array!18417 array!18415 (_ BitVec 32) (_ BitVec 32) V!10863 V!10863 (_ BitVec 32) Int) ListLongMap!4337)

(assert (=> b!345433 (= res!191114 (not (contains!2243 (getCurrentListMap!1705 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!345434 () Bool)

(declare-datatypes ((SeekEntryResult!3362 0))(
  ( (MissingZero!3362 (index!15627 (_ BitVec 32))) (Found!3362 (index!15628 (_ BitVec 32))) (Intermediate!3362 (undefined!4174 Bool) (index!15629 (_ BitVec 32)) (x!34414 (_ BitVec 32))) (Undefined!3362) (MissingVacant!3362 (index!15630 (_ BitVec 32))) )
))
(declare-fun lt!162865 () SeekEntryResult!3362)

(declare-fun e!211717 () Bool)

(declare-fun arrayContainsKey!0 (array!18417 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!345434 (= e!211717 (not (arrayContainsKey!0 _keys!1895 k!1348 (index!15628 lt!162865))))))

(declare-fun b!345435 () Bool)

(declare-fun e!211719 () Bool)

(declare-fun tp_is_empty!7415 () Bool)

(assert (=> b!345435 (= e!211719 tp_is_empty!7415)))

(declare-fun b!345436 () Bool)

(declare-fun res!191117 () Bool)

(assert (=> b!345436 (=> (not res!191117) (not e!211716))))

(assert (=> b!345436 (= res!191117 (and (= (size!9075 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9076 _keys!1895) (size!9075 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!345437 () Bool)

(declare-fun res!191115 () Bool)

(assert (=> b!345437 (=> (not res!191115) (not e!211716))))

(declare-datatypes ((List!5049 0))(
  ( (Nil!5046) (Cons!5045 (h!5901 (_ BitVec 64)) (t!10167 List!5049)) )
))
(declare-fun arrayNoDuplicates!0 (array!18417 (_ BitVec 32) List!5049) Bool)

(assert (=> b!345437 (= res!191115 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5046))))

(declare-fun mapNonEmpty!12564 () Bool)

(declare-fun mapRes!12564 () Bool)

(declare-fun tp!25937 () Bool)

(assert (=> mapNonEmpty!12564 (= mapRes!12564 (and tp!25937 e!211719))))

(declare-fun mapValue!12564 () ValueCell!3364)

(declare-fun mapKey!12564 () (_ BitVec 32))

(declare-fun mapRest!12564 () (Array (_ BitVec 32) ValueCell!3364))

(assert (=> mapNonEmpty!12564 (= (arr!8723 _values!1525) (store mapRest!12564 mapKey!12564 mapValue!12564))))

(declare-fun b!345438 () Bool)

(declare-fun res!191111 () Bool)

(assert (=> b!345438 (=> (not res!191111) (not e!211716))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18417 (_ BitVec 32)) Bool)

(assert (=> b!345438 (= res!191111 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!345439 () Bool)

(declare-fun e!211714 () Bool)

(assert (=> b!345439 (= e!211714 tp_is_empty!7415)))

(declare-fun res!191113 () Bool)

(assert (=> start!34558 (=> (not res!191113) (not e!211716))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34558 (= res!191113 (validMask!0 mask!2385))))

(assert (=> start!34558 e!211716))

(assert (=> start!34558 true))

(assert (=> start!34558 tp_is_empty!7415))

(assert (=> start!34558 tp!25938))

(declare-fun e!211718 () Bool)

(declare-fun array_inv!6456 (array!18415) Bool)

(assert (=> start!34558 (and (array_inv!6456 _values!1525) e!211718)))

(declare-fun array_inv!6457 (array!18417) Bool)

(assert (=> start!34558 (array_inv!6457 _keys!1895)))

(declare-fun b!345440 () Bool)

(declare-fun res!191112 () Bool)

(assert (=> b!345440 (=> (not res!191112) (not e!211716))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!345440 (= res!191112 (validKeyInArray!0 k!1348))))

(declare-fun b!345441 () Bool)

(assert (=> b!345441 (= e!211718 (and e!211714 mapRes!12564))))

(declare-fun condMapEmpty!12564 () Bool)

(declare-fun mapDefault!12564 () ValueCell!3364)

