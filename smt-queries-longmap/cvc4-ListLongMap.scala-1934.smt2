; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34302 () Bool)

(assert start!34302)

(declare-fun b_free!7277 () Bool)

(declare-fun b_next!7277 () Bool)

(assert (=> start!34302 (= b_free!7277 (not b_next!7277))))

(declare-fun tp!25370 () Bool)

(declare-fun b_and!14481 () Bool)

(assert (=> start!34302 (= tp!25370 b_and!14481)))

(declare-fun res!189165 () Bool)

(declare-fun e!209870 () Bool)

(assert (=> start!34302 (=> (not res!189165) (not e!209870))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34302 (= res!189165 (validMask!0 mask!2385))))

(assert (=> start!34302 e!209870))

(assert (=> start!34302 true))

(declare-fun tp_is_empty!7229 () Bool)

(assert (=> start!34302 tp_is_empty!7229))

(assert (=> start!34302 tp!25370))

(declare-datatypes ((V!10615 0))(
  ( (V!10616 (val!3659 Int)) )
))
(declare-datatypes ((ValueCell!3271 0))(
  ( (ValueCellFull!3271 (v!5833 V!10615)) (EmptyCell!3271) )
))
(declare-datatypes ((array!18055 0))(
  ( (array!18056 (arr!8546 (Array (_ BitVec 32) ValueCell!3271)) (size!8898 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18055)

(declare-fun e!209874 () Bool)

(declare-fun array_inv!6328 (array!18055) Bool)

(assert (=> start!34302 (and (array_inv!6328 _values!1525) e!209874)))

(declare-datatypes ((array!18057 0))(
  ( (array!18058 (arr!8547 (Array (_ BitVec 32) (_ BitVec 64))) (size!8899 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18057)

(declare-fun array_inv!6329 (array!18057) Bool)

(assert (=> start!34302 (array_inv!6329 _keys!1895)))

(declare-fun b!342227 () Bool)

(declare-fun res!189166 () Bool)

(assert (=> b!342227 (=> (not res!189166) (not e!209870))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun zeroValue!1467 () V!10615)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10615)

(declare-datatypes ((tuple2!5304 0))(
  ( (tuple2!5305 (_1!2663 (_ BitVec 64)) (_2!2663 V!10615)) )
))
(declare-datatypes ((List!4921 0))(
  ( (Nil!4918) (Cons!4917 (h!5773 tuple2!5304) (t!10033 List!4921)) )
))
(declare-datatypes ((ListLongMap!4217 0))(
  ( (ListLongMap!4218 (toList!2124 List!4921)) )
))
(declare-fun contains!2180 (ListLongMap!4217 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1645 (array!18057 array!18055 (_ BitVec 32) (_ BitVec 32) V!10615 V!10615 (_ BitVec 32) Int) ListLongMap!4217)

(assert (=> b!342227 (= res!189166 (not (contains!2180 (getCurrentListMap!1645 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!342228 () Bool)

(declare-fun res!189169 () Bool)

(assert (=> b!342228 (=> (not res!189169) (not e!209870))))

(assert (=> b!342228 (= res!189169 (and (= (size!8898 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8899 _keys!1895) (size!8898 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!342229 () Bool)

(declare-fun e!209868 () Bool)

(assert (=> b!342229 (= e!209868 tp_is_empty!7229)))

(declare-fun mapNonEmpty!12276 () Bool)

(declare-fun mapRes!12276 () Bool)

(declare-fun tp!25371 () Bool)

(assert (=> mapNonEmpty!12276 (= mapRes!12276 (and tp!25371 e!209868))))

(declare-fun mapRest!12276 () (Array (_ BitVec 32) ValueCell!3271))

(declare-fun mapKey!12276 () (_ BitVec 32))

(declare-fun mapValue!12276 () ValueCell!3271)

(assert (=> mapNonEmpty!12276 (= (arr!8546 _values!1525) (store mapRest!12276 mapKey!12276 mapValue!12276))))

(declare-fun mapIsEmpty!12276 () Bool)

(assert (=> mapIsEmpty!12276 mapRes!12276))

(declare-fun b!342230 () Bool)

(declare-fun res!189164 () Bool)

(assert (=> b!342230 (=> (not res!189164) (not e!209870))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18057 (_ BitVec 32)) Bool)

(assert (=> b!342230 (= res!189164 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!342231 () Bool)

(declare-fun res!189167 () Bool)

(assert (=> b!342231 (=> (not res!189167) (not e!209870))))

(declare-datatypes ((List!4922 0))(
  ( (Nil!4919) (Cons!4918 (h!5774 (_ BitVec 64)) (t!10034 List!4922)) )
))
(declare-fun arrayNoDuplicates!0 (array!18057 (_ BitVec 32) List!4922) Bool)

(assert (=> b!342231 (= res!189167 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4919))))

(declare-fun b!342232 () Bool)

(declare-datatypes ((Unit!10642 0))(
  ( (Unit!10643) )
))
(declare-fun e!209869 () Unit!10642)

(declare-fun Unit!10644 () Unit!10642)

(assert (=> b!342232 (= e!209869 Unit!10644)))

(declare-fun lt!162095 () Unit!10642)

(declare-fun lemmaArrayContainsKeyThenInListMap!298 (array!18057 array!18055 (_ BitVec 32) (_ BitVec 32) V!10615 V!10615 (_ BitVec 64) (_ BitVec 32) Int) Unit!10642)

(declare-fun arrayScanForKey!0 (array!18057 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!342232 (= lt!162095 (lemmaArrayContainsKeyThenInListMap!298 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k!1348 (arrayScanForKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!342232 false))

(declare-fun b!342233 () Bool)

(declare-fun e!209871 () Bool)

(assert (=> b!342233 (= e!209871 false)))

(declare-fun lt!162097 () Unit!10642)

(assert (=> b!342233 (= lt!162097 e!209869)))

(declare-fun c!52797 () Bool)

(declare-fun arrayContainsKey!0 (array!18057 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!342233 (= c!52797 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!342234 () Bool)

(declare-fun Unit!10645 () Unit!10642)

(assert (=> b!342234 (= e!209869 Unit!10645)))

(declare-fun b!342235 () Bool)

(declare-fun e!209873 () Bool)

(assert (=> b!342235 (= e!209873 tp_is_empty!7229)))

(declare-fun b!342236 () Bool)

(assert (=> b!342236 (= e!209874 (and e!209873 mapRes!12276))))

(declare-fun condMapEmpty!12276 () Bool)

(declare-fun mapDefault!12276 () ValueCell!3271)

