; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34272 () Bool)

(assert start!34272)

(declare-fun b_free!7271 () Bool)

(declare-fun b_next!7271 () Bool)

(assert (=> start!34272 (= b_free!7271 (not b_next!7271))))

(declare-fun tp!25350 () Bool)

(declare-fun b_and!14473 () Bool)

(assert (=> start!34272 (= tp!25350 b_and!14473)))

(declare-fun mapNonEmpty!12264 () Bool)

(declare-fun mapRes!12264 () Bool)

(declare-fun tp!25349 () Bool)

(declare-fun e!209719 () Bool)

(assert (=> mapNonEmpty!12264 (= mapRes!12264 (and tp!25349 e!209719))))

(declare-datatypes ((V!10607 0))(
  ( (V!10608 (val!3656 Int)) )
))
(declare-datatypes ((ValueCell!3268 0))(
  ( (ValueCellFull!3268 (v!5829 V!10607)) (EmptyCell!3268) )
))
(declare-fun mapValue!12264 () ValueCell!3268)

(declare-fun mapKey!12264 () (_ BitVec 32))

(declare-fun mapRest!12264 () (Array (_ BitVec 32) ValueCell!3268))

(declare-datatypes ((array!18041 0))(
  ( (array!18042 (arr!8540 (Array (_ BitVec 32) ValueCell!3268)) (size!8892 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18041)

(assert (=> mapNonEmpty!12264 (= (arr!8540 _values!1525) (store mapRest!12264 mapKey!12264 mapValue!12264))))

(declare-fun res!189055 () Bool)

(declare-fun e!209717 () Bool)

(assert (=> start!34272 (=> (not res!189055) (not e!209717))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34272 (= res!189055 (validMask!0 mask!2385))))

(assert (=> start!34272 e!209717))

(assert (=> start!34272 true))

(declare-fun tp_is_empty!7223 () Bool)

(assert (=> start!34272 tp_is_empty!7223))

(assert (=> start!34272 tp!25350))

(declare-fun e!209721 () Bool)

(declare-fun array_inv!6322 (array!18041) Bool)

(assert (=> start!34272 (and (array_inv!6322 _values!1525) e!209721)))

(declare-datatypes ((array!18043 0))(
  ( (array!18044 (arr!8541 (Array (_ BitVec 32) (_ BitVec 64))) (size!8893 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18043)

(declare-fun array_inv!6323 (array!18043) Bool)

(assert (=> start!34272 (array_inv!6323 _keys!1895)))

(declare-fun b!341980 () Bool)

(declare-fun e!209720 () Bool)

(assert (=> b!341980 (= e!209720 (and (bvslt #b00000000000000000000000000000000 (size!8893 _keys!1895)) (bvsge (size!8893 _keys!1895) #b01111111111111111111111111111111)))))

(declare-datatypes ((Unit!10628 0))(
  ( (Unit!10629) )
))
(declare-fun lt!161967 () Unit!10628)

(declare-fun e!209718 () Unit!10628)

(assert (=> b!341980 (= lt!161967 e!209718)))

(declare-fun c!52749 () Bool)

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!18043 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!341980 (= c!52749 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!341981 () Bool)

(assert (=> b!341981 (= e!209719 tp_is_empty!7223)))

(declare-fun mapIsEmpty!12264 () Bool)

(assert (=> mapIsEmpty!12264 mapRes!12264))

(declare-fun b!341982 () Bool)

(declare-fun res!189053 () Bool)

(assert (=> b!341982 (=> (not res!189053) (not e!209717))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!341982 (= res!189053 (and (= (size!8892 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8893 _keys!1895) (size!8892 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!341983 () Bool)

(declare-fun e!209715 () Bool)

(assert (=> b!341983 (= e!209715 tp_is_empty!7223)))

(declare-fun b!341984 () Bool)

(declare-fun res!189056 () Bool)

(assert (=> b!341984 (=> (not res!189056) (not e!209717))))

(declare-datatypes ((List!4915 0))(
  ( (Nil!4912) (Cons!4911 (h!5767 (_ BitVec 64)) (t!10025 List!4915)) )
))
(declare-fun arrayNoDuplicates!0 (array!18043 (_ BitVec 32) List!4915) Bool)

(assert (=> b!341984 (= res!189056 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4912))))

(declare-fun b!341985 () Bool)

(declare-fun res!189051 () Bool)

(assert (=> b!341985 (=> (not res!189051) (not e!209717))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18043 (_ BitVec 32)) Bool)

(assert (=> b!341985 (= res!189051 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!341986 () Bool)

(declare-fun res!189052 () Bool)

(assert (=> b!341986 (=> (not res!189052) (not e!209717))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!341986 (= res!189052 (validKeyInArray!0 k!1348))))

(declare-fun b!341987 () Bool)

(assert (=> b!341987 (= e!209717 e!209720)))

(declare-fun res!189054 () Bool)

(assert (=> b!341987 (=> (not res!189054) (not e!209720))))

(declare-datatypes ((SeekEntryResult!3297 0))(
  ( (MissingZero!3297 (index!15367 (_ BitVec 32))) (Found!3297 (index!15368 (_ BitVec 32))) (Intermediate!3297 (undefined!4109 Bool) (index!15369 (_ BitVec 32)) (x!34053 (_ BitVec 32))) (Undefined!3297) (MissingVacant!3297 (index!15370 (_ BitVec 32))) )
))
(declare-fun lt!161966 () SeekEntryResult!3297)

(assert (=> b!341987 (= res!189054 (and (not (is-Found!3297 lt!161966)) (not (is-MissingZero!3297 lt!161966)) (is-MissingVacant!3297 lt!161966)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18043 (_ BitVec 32)) SeekEntryResult!3297)

(assert (=> b!341987 (= lt!161966 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!341988 () Bool)

(declare-fun res!189050 () Bool)

(assert (=> b!341988 (=> (not res!189050) (not e!209717))))

(declare-fun zeroValue!1467 () V!10607)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10607)

(declare-datatypes ((tuple2!5298 0))(
  ( (tuple2!5299 (_1!2660 (_ BitVec 64)) (_2!2660 V!10607)) )
))
(declare-datatypes ((List!4916 0))(
  ( (Nil!4913) (Cons!4912 (h!5768 tuple2!5298) (t!10026 List!4916)) )
))
(declare-datatypes ((ListLongMap!4211 0))(
  ( (ListLongMap!4212 (toList!2121 List!4916)) )
))
(declare-fun contains!2176 (ListLongMap!4211 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1642 (array!18043 array!18041 (_ BitVec 32) (_ BitVec 32) V!10607 V!10607 (_ BitVec 32) Int) ListLongMap!4211)

(assert (=> b!341988 (= res!189050 (not (contains!2176 (getCurrentListMap!1642 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!341989 () Bool)

(declare-fun Unit!10630 () Unit!10628)

(assert (=> b!341989 (= e!209718 Unit!10630)))

(declare-fun b!341990 () Bool)

(declare-fun Unit!10631 () Unit!10628)

(assert (=> b!341990 (= e!209718 Unit!10631)))

(declare-fun lt!161968 () Unit!10628)

(declare-fun lemmaArrayContainsKeyThenInListMap!295 (array!18043 array!18041 (_ BitVec 32) (_ BitVec 32) V!10607 V!10607 (_ BitVec 64) (_ BitVec 32) Int) Unit!10628)

(declare-fun arrayScanForKey!0 (array!18043 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!341990 (= lt!161968 (lemmaArrayContainsKeyThenInListMap!295 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k!1348 (arrayScanForKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!341990 false))

(declare-fun b!341991 () Bool)

(assert (=> b!341991 (= e!209721 (and e!209715 mapRes!12264))))

(declare-fun condMapEmpty!12264 () Bool)

(declare-fun mapDefault!12264 () ValueCell!3268)

