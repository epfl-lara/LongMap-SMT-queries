; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34486 () Bool)

(assert start!34486)

(declare-fun b_free!7409 () Bool)

(declare-fun b_next!7409 () Bool)

(assert (=> start!34486 (= b_free!7409 (not b_next!7409))))

(declare-fun tp!25772 () Bool)

(declare-fun b_and!14617 () Bool)

(assert (=> start!34486 (= tp!25772 b_and!14617)))

(declare-fun b!344569 () Bool)

(declare-fun res!190577 () Bool)

(declare-fun e!211224 () Bool)

(assert (=> b!344569 (=> (not res!190577) (not e!211224))))

(declare-datatypes ((array!18309 0))(
  ( (array!18310 (arr!8671 (Array (_ BitVec 32) (_ BitVec 64))) (size!9023 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18309)

(declare-datatypes ((List!5014 0))(
  ( (Nil!5011) (Cons!5010 (h!5866 (_ BitVec 64)) (t!10130 List!5014)) )
))
(declare-fun arrayNoDuplicates!0 (array!18309 (_ BitVec 32) List!5014) Bool)

(assert (=> b!344569 (= res!190577 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5011))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3343 0))(
  ( (MissingZero!3343 (index!15551 (_ BitVec 32))) (Found!3343 (index!15552 (_ BitVec 32))) (Intermediate!3343 (undefined!4155 Bool) (index!15553 (_ BitVec 32)) (x!34313 (_ BitVec 32))) (Undefined!3343) (MissingVacant!3343 (index!15554 (_ BitVec 32))) )
))
(declare-fun lt!162688 () SeekEntryResult!3343)

(declare-fun b!344570 () Bool)

(assert (=> b!344570 (= e!211224 (and (not (is-Found!3343 lt!162688)) (not (is-MissingZero!3343 lt!162688)) (not (is-MissingVacant!3343 lt!162688)) (not (is-Undefined!3343 lt!162688)) (not (= (size!9023 _keys!1895) (bvadd #b00000000000000000000000000000001 mask!2385)))))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18309 (_ BitVec 32)) SeekEntryResult!3343)

(assert (=> b!344570 (= lt!162688 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun res!190572 () Bool)

(assert (=> start!34486 (=> (not res!190572) (not e!211224))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34486 (= res!190572 (validMask!0 mask!2385))))

(assert (=> start!34486 e!211224))

(assert (=> start!34486 true))

(declare-fun tp_is_empty!7361 () Bool)

(assert (=> start!34486 tp_is_empty!7361))

(assert (=> start!34486 tp!25772))

(declare-datatypes ((V!10791 0))(
  ( (V!10792 (val!3725 Int)) )
))
(declare-datatypes ((ValueCell!3337 0))(
  ( (ValueCellFull!3337 (v!5901 V!10791)) (EmptyCell!3337) )
))
(declare-datatypes ((array!18311 0))(
  ( (array!18312 (arr!8672 (Array (_ BitVec 32) ValueCell!3337)) (size!9024 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18311)

(declare-fun e!211221 () Bool)

(declare-fun array_inv!6422 (array!18311) Bool)

(assert (=> start!34486 (and (array_inv!6422 _values!1525) e!211221)))

(declare-fun array_inv!6423 (array!18309) Bool)

(assert (=> start!34486 (array_inv!6423 _keys!1895)))

(declare-fun b!344571 () Bool)

(declare-fun res!190574 () Bool)

(assert (=> b!344571 (=> (not res!190574) (not e!211224))))

(declare-fun zeroValue!1467 () V!10791)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10791)

(declare-datatypes ((tuple2!5392 0))(
  ( (tuple2!5393 (_1!2707 (_ BitVec 64)) (_2!2707 V!10791)) )
))
(declare-datatypes ((List!5015 0))(
  ( (Nil!5012) (Cons!5011 (h!5867 tuple2!5392) (t!10131 List!5015)) )
))
(declare-datatypes ((ListLongMap!4305 0))(
  ( (ListLongMap!4306 (toList!2168 List!5015)) )
))
(declare-fun contains!2226 (ListLongMap!4305 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1689 (array!18309 array!18311 (_ BitVec 32) (_ BitVec 32) V!10791 V!10791 (_ BitVec 32) Int) ListLongMap!4305)

(assert (=> b!344571 (= res!190574 (not (contains!2226 (getCurrentListMap!1689 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!344572 () Bool)

(declare-fun res!190573 () Bool)

(assert (=> b!344572 (=> (not res!190573) (not e!211224))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!344572 (= res!190573 (validKeyInArray!0 k!1348))))

(declare-fun b!344573 () Bool)

(declare-fun res!190576 () Bool)

(assert (=> b!344573 (=> (not res!190576) (not e!211224))))

(assert (=> b!344573 (= res!190576 (and (= (size!9024 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9023 _keys!1895) (size!9024 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!344574 () Bool)

(declare-fun res!190575 () Bool)

(assert (=> b!344574 (=> (not res!190575) (not e!211224))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18309 (_ BitVec 32)) Bool)

(assert (=> b!344574 (= res!190575 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!344575 () Bool)

(declare-fun e!211222 () Bool)

(declare-fun mapRes!12480 () Bool)

(assert (=> b!344575 (= e!211221 (and e!211222 mapRes!12480))))

(declare-fun condMapEmpty!12480 () Bool)

(declare-fun mapDefault!12480 () ValueCell!3337)

