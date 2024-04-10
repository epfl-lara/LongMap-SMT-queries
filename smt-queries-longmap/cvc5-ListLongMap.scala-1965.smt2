; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34554 () Bool)

(assert start!34554)

(declare-fun b_free!7459 () Bool)

(declare-fun b_next!7459 () Bool)

(assert (=> start!34554 (= b_free!7459 (not b_next!7459))))

(declare-fun tp!25925 () Bool)

(declare-fun b_and!14669 () Bool)

(assert (=> start!34554 (= tp!25925 b_and!14669)))

(declare-fun b!345373 () Bool)

(declare-fun res!191075 () Bool)

(declare-fun e!211683 () Bool)

(assert (=> b!345373 (=> (not res!191075) (not e!211683))))

(declare-datatypes ((array!18407 0))(
  ( (array!18408 (arr!8719 (Array (_ BitVec 32) (_ BitVec 64))) (size!9071 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18407)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18407 (_ BitVec 32)) Bool)

(assert (=> b!345373 (= res!191075 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!12558 () Bool)

(declare-fun mapRes!12558 () Bool)

(declare-fun tp!25926 () Bool)

(declare-fun e!211679 () Bool)

(assert (=> mapNonEmpty!12558 (= mapRes!12558 (and tp!25926 e!211679))))

(declare-fun mapKey!12558 () (_ BitVec 32))

(declare-datatypes ((V!10859 0))(
  ( (V!10860 (val!3750 Int)) )
))
(declare-datatypes ((ValueCell!3362 0))(
  ( (ValueCellFull!3362 (v!5927 V!10859)) (EmptyCell!3362) )
))
(declare-fun mapRest!12558 () (Array (_ BitVec 32) ValueCell!3362))

(declare-datatypes ((array!18409 0))(
  ( (array!18410 (arr!8720 (Array (_ BitVec 32) ValueCell!3362)) (size!9072 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18409)

(declare-fun mapValue!12558 () ValueCell!3362)

(assert (=> mapNonEmpty!12558 (= (arr!8720 _values!1525) (store mapRest!12558 mapKey!12558 mapValue!12558))))

(declare-fun res!191073 () Bool)

(assert (=> start!34554 (=> (not res!191073) (not e!211683))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34554 (= res!191073 (validMask!0 mask!2385))))

(assert (=> start!34554 e!211683))

(assert (=> start!34554 true))

(declare-fun tp_is_empty!7411 () Bool)

(assert (=> start!34554 tp_is_empty!7411))

(assert (=> start!34554 tp!25925))

(declare-fun e!211681 () Bool)

(declare-fun array_inv!6452 (array!18409) Bool)

(assert (=> start!34554 (and (array_inv!6452 _values!1525) e!211681)))

(declare-fun array_inv!6453 (array!18407) Bool)

(assert (=> start!34554 (array_inv!6453 _keys!1895)))

(declare-fun b!345374 () Bool)

(declare-fun res!191074 () Bool)

(assert (=> b!345374 (=> (not res!191074) (not e!211683))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun zeroValue!1467 () V!10859)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10859)

(declare-datatypes ((tuple2!5420 0))(
  ( (tuple2!5421 (_1!2721 (_ BitVec 64)) (_2!2721 V!10859)) )
))
(declare-datatypes ((List!5044 0))(
  ( (Nil!5041) (Cons!5040 (h!5896 tuple2!5420) (t!10162 List!5044)) )
))
(declare-datatypes ((ListLongMap!4333 0))(
  ( (ListLongMap!4334 (toList!2182 List!5044)) )
))
(declare-fun contains!2241 (ListLongMap!4333 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1703 (array!18407 array!18409 (_ BitVec 32) (_ BitVec 32) V!10859 V!10859 (_ BitVec 32) Int) ListLongMap!4333)

(assert (=> b!345374 (= res!191074 (not (contains!2241 (getCurrentListMap!1703 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!345375 () Bool)

(assert (=> b!345375 (= e!211679 tp_is_empty!7411)))

(declare-fun b!345376 () Bool)

(declare-fun res!191071 () Bool)

(assert (=> b!345376 (=> (not res!191071) (not e!211683))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!345376 (= res!191071 (validKeyInArray!0 k!1348))))

(declare-fun b!345377 () Bool)

(declare-fun res!191070 () Bool)

(assert (=> b!345377 (=> (not res!191070) (not e!211683))))

(declare-datatypes ((List!5045 0))(
  ( (Nil!5042) (Cons!5041 (h!5897 (_ BitVec 64)) (t!10163 List!5045)) )
))
(declare-fun arrayNoDuplicates!0 (array!18407 (_ BitVec 32) List!5045) Bool)

(assert (=> b!345377 (= res!191070 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5042))))

(declare-fun mapIsEmpty!12558 () Bool)

(assert (=> mapIsEmpty!12558 mapRes!12558))

(declare-datatypes ((SeekEntryResult!3360 0))(
  ( (MissingZero!3360 (index!15619 (_ BitVec 32))) (Found!3360 (index!15620 (_ BitVec 32))) (Intermediate!3360 (undefined!4172 Bool) (index!15621 (_ BitVec 32)) (x!34412 (_ BitVec 32))) (Undefined!3360) (MissingVacant!3360 (index!15622 (_ BitVec 32))) )
))
(declare-fun lt!162859 () SeekEntryResult!3360)

(declare-fun e!211680 () Bool)

(declare-fun b!345378 () Bool)

(declare-fun arrayContainsKey!0 (array!18407 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!345378 (= e!211680 (not (arrayContainsKey!0 _keys!1895 k!1348 (index!15620 lt!162859))))))

(declare-fun b!345379 () Bool)

(declare-fun e!211678 () Bool)

(assert (=> b!345379 (= e!211681 (and e!211678 mapRes!12558))))

(declare-fun condMapEmpty!12558 () Bool)

(declare-fun mapDefault!12558 () ValueCell!3362)

