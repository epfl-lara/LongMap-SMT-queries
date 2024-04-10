; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34464 () Bool)

(assert start!34464)

(declare-fun b_free!7387 () Bool)

(declare-fun b_next!7387 () Bool)

(assert (=> start!34464 (= b_free!7387 (not b_next!7387))))

(declare-fun tp!25706 () Bool)

(declare-fun b_and!14595 () Bool)

(assert (=> start!34464 (= tp!25706 b_and!14595)))

(declare-fun b!344272 () Bool)

(declare-fun e!211057 () Bool)

(declare-fun tp_is_empty!7339 () Bool)

(assert (=> b!344272 (= e!211057 tp_is_empty!7339)))

(declare-fun b!344273 () Bool)

(declare-fun e!211058 () Bool)

(assert (=> b!344273 (= e!211058 tp_is_empty!7339)))

(declare-fun res!190374 () Bool)

(declare-fun e!211055 () Bool)

(assert (=> start!34464 (=> (not res!190374) (not e!211055))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34464 (= res!190374 (validMask!0 mask!2385))))

(assert (=> start!34464 e!211055))

(assert (=> start!34464 true))

(assert (=> start!34464 tp_is_empty!7339))

(assert (=> start!34464 tp!25706))

(declare-datatypes ((V!10763 0))(
  ( (V!10764 (val!3714 Int)) )
))
(declare-datatypes ((ValueCell!3326 0))(
  ( (ValueCellFull!3326 (v!5890 V!10763)) (EmptyCell!3326) )
))
(declare-datatypes ((array!18269 0))(
  ( (array!18270 (arr!8651 (Array (_ BitVec 32) ValueCell!3326)) (size!9003 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18269)

(declare-fun e!211056 () Bool)

(declare-fun array_inv!6406 (array!18269) Bool)

(assert (=> start!34464 (and (array_inv!6406 _values!1525) e!211056)))

(declare-datatypes ((array!18271 0))(
  ( (array!18272 (arr!8652 (Array (_ BitVec 32) (_ BitVec 64))) (size!9004 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18271)

(declare-fun array_inv!6407 (array!18271) Bool)

(assert (=> start!34464 (array_inv!6407 _keys!1895)))

(declare-fun b!344274 () Bool)

(declare-fun res!190375 () Bool)

(assert (=> b!344274 (=> (not res!190375) (not e!211055))))

(declare-datatypes ((List!4998 0))(
  ( (Nil!4995) (Cons!4994 (h!5850 (_ BitVec 64)) (t!10114 List!4998)) )
))
(declare-fun arrayNoDuplicates!0 (array!18271 (_ BitVec 32) List!4998) Bool)

(assert (=> b!344274 (= res!190375 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4995))))

(declare-fun b!344275 () Bool)

(assert (=> b!344275 (= e!211055 false)))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3337 0))(
  ( (MissingZero!3337 (index!15527 (_ BitVec 32))) (Found!3337 (index!15528 (_ BitVec 32))) (Intermediate!3337 (undefined!4149 Bool) (index!15529 (_ BitVec 32)) (x!34283 (_ BitVec 32))) (Undefined!3337) (MissingVacant!3337 (index!15530 (_ BitVec 32))) )
))
(declare-fun lt!162655 () SeekEntryResult!3337)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18271 (_ BitVec 32)) SeekEntryResult!3337)

(assert (=> b!344275 (= lt!162655 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!344276 () Bool)

(declare-fun res!190378 () Bool)

(assert (=> b!344276 (=> (not res!190378) (not e!211055))))

(declare-fun zeroValue!1467 () V!10763)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10763)

(declare-datatypes ((tuple2!5378 0))(
  ( (tuple2!5379 (_1!2700 (_ BitVec 64)) (_2!2700 V!10763)) )
))
(declare-datatypes ((List!4999 0))(
  ( (Nil!4996) (Cons!4995 (h!5851 tuple2!5378) (t!10115 List!4999)) )
))
(declare-datatypes ((ListLongMap!4291 0))(
  ( (ListLongMap!4292 (toList!2161 List!4999)) )
))
(declare-fun contains!2219 (ListLongMap!4291 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1682 (array!18271 array!18269 (_ BitVec 32) (_ BitVec 32) V!10763 V!10763 (_ BitVec 32) Int) ListLongMap!4291)

(assert (=> b!344276 (= res!190378 (not (contains!2219 (getCurrentListMap!1682 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!344277 () Bool)

(declare-fun res!190377 () Bool)

(assert (=> b!344277 (=> (not res!190377) (not e!211055))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!344277 (= res!190377 (validKeyInArray!0 k!1348))))

(declare-fun b!344278 () Bool)

(declare-fun res!190379 () Bool)

(assert (=> b!344278 (=> (not res!190379) (not e!211055))))

(assert (=> b!344278 (= res!190379 (and (= (size!9003 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9004 _keys!1895) (size!9003 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!12447 () Bool)

(declare-fun mapRes!12447 () Bool)

(declare-fun tp!25707 () Bool)

(assert (=> mapNonEmpty!12447 (= mapRes!12447 (and tp!25707 e!211058))))

(declare-fun mapValue!12447 () ValueCell!3326)

(declare-fun mapRest!12447 () (Array (_ BitVec 32) ValueCell!3326))

(declare-fun mapKey!12447 () (_ BitVec 32))

(assert (=> mapNonEmpty!12447 (= (arr!8651 _values!1525) (store mapRest!12447 mapKey!12447 mapValue!12447))))

(declare-fun b!344279 () Bool)

(assert (=> b!344279 (= e!211056 (and e!211057 mapRes!12447))))

(declare-fun condMapEmpty!12447 () Bool)

(declare-fun mapDefault!12447 () ValueCell!3326)

