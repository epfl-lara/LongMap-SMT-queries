; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35178 () Bool)

(assert start!35178)

(declare-fun b_free!7771 () Bool)

(declare-fun b_next!7771 () Bool)

(assert (=> start!35178 (= b_free!7771 (not b_next!7771))))

(declare-fun tp!26904 () Bool)

(declare-fun b_and!15009 () Bool)

(assert (=> start!35178 (= tp!26904 b_and!15009)))

(declare-fun res!195518 () Bool)

(declare-fun e!215937 () Bool)

(assert (=> start!35178 (=> (not res!195518) (not e!215937))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35178 (= res!195518 (validMask!0 mask!2385))))

(assert (=> start!35178 e!215937))

(assert (=> start!35178 true))

(declare-fun tp_is_empty!7723 () Bool)

(assert (=> start!35178 tp_is_empty!7723))

(assert (=> start!35178 tp!26904))

(declare-datatypes ((V!11275 0))(
  ( (V!11276 (val!3906 Int)) )
))
(declare-datatypes ((ValueCell!3518 0))(
  ( (ValueCellFull!3518 (v!6097 V!11275)) (EmptyCell!3518) )
))
(declare-datatypes ((array!19037 0))(
  ( (array!19038 (arr!9020 (Array (_ BitVec 32) ValueCell!3518)) (size!9372 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!19037)

(declare-fun e!215933 () Bool)

(declare-fun array_inv!6648 (array!19037) Bool)

(assert (=> start!35178 (and (array_inv!6648 _values!1525) e!215933)))

(declare-datatypes ((array!19039 0))(
  ( (array!19040 (arr!9021 (Array (_ BitVec 32) (_ BitVec 64))) (size!9373 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!19039)

(declare-fun array_inv!6649 (array!19039) Bool)

(assert (=> start!35178 (array_inv!6649 _keys!1895)))

(declare-fun b!352618 () Bool)

(declare-fun res!195519 () Bool)

(assert (=> b!352618 (=> (not res!195519) (not e!215937))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!352618 (= res!195519 (validKeyInArray!0 k!1348))))

(declare-fun b!352619 () Bool)

(declare-fun res!195517 () Bool)

(assert (=> b!352619 (=> (not res!195517) (not e!215937))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!352619 (= res!195517 (and (= (size!9372 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9373 _keys!1895) (size!9372 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!352620 () Bool)

(assert (=> b!352620 (= e!215937 false)))

(declare-datatypes ((SeekEntryResult!3469 0))(
  ( (MissingZero!3469 (index!16055 (_ BitVec 32))) (Found!3469 (index!16056 (_ BitVec 32))) (Intermediate!3469 (undefined!4281 Bool) (index!16057 (_ BitVec 32)) (x!35077 (_ BitVec 32))) (Undefined!3469) (MissingVacant!3469 (index!16058 (_ BitVec 32))) )
))
(declare-fun lt!165322 () SeekEntryResult!3469)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!19039 (_ BitVec 32)) SeekEntryResult!3469)

(assert (=> b!352620 (= lt!165322 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!352621 () Bool)

(declare-fun e!215935 () Bool)

(declare-fun mapRes!13068 () Bool)

(assert (=> b!352621 (= e!215933 (and e!215935 mapRes!13068))))

(declare-fun condMapEmpty!13068 () Bool)

(declare-fun mapDefault!13068 () ValueCell!3518)

