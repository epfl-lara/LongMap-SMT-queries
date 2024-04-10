; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21914 () Bool)

(assert start!21914)

(declare-fun b!222603 () Bool)

(declare-fun b_free!5981 () Bool)

(declare-fun b_next!5981 () Bool)

(assert (=> b!222603 (= b_free!5981 (not b_next!5981))))

(declare-fun tp!21085 () Bool)

(declare-fun b_and!12879 () Bool)

(assert (=> b!222603 (= tp!21085 b_and!12879)))

(declare-fun b!222580 () Bool)

(declare-fun e!144654 () Bool)

(declare-datatypes ((SeekEntryResult!839 0))(
  ( (MissingZero!839 (index!5526 (_ BitVec 32))) (Found!839 (index!5527 (_ BitVec 32))) (Intermediate!839 (undefined!1651 Bool) (index!5528 (_ BitVec 32)) (x!23059 (_ BitVec 32))) (Undefined!839) (MissingVacant!839 (index!5529 (_ BitVec 32))) )
))
(declare-fun lt!112690 () SeekEntryResult!839)

(assert (=> b!222580 (= e!144654 (is-Undefined!839 lt!112690))))

(declare-fun b!222581 () Bool)

(declare-fun e!144656 () Bool)

(declare-fun call!20778 () Bool)

(assert (=> b!222581 (= e!144656 (not call!20778))))

(declare-fun b!222582 () Bool)

(declare-datatypes ((Unit!6675 0))(
  ( (Unit!6676) )
))
(declare-fun e!144650 () Unit!6675)

(declare-fun Unit!6677 () Unit!6675)

(assert (=> b!222582 (= e!144650 Unit!6677)))

(declare-fun mapIsEmpty!9934 () Bool)

(declare-fun mapRes!9934 () Bool)

(assert (=> mapIsEmpty!9934 mapRes!9934))

(declare-fun b!222583 () Bool)

(declare-fun res!109286 () Bool)

(declare-fun e!144642 () Bool)

(assert (=> b!222583 (=> (not res!109286) (not e!144642))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!222583 (= res!109286 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!222584 () Bool)

(declare-fun e!144655 () Bool)

(assert (=> b!222584 (= e!144655 (not call!20778))))

(declare-fun b!222585 () Bool)

(declare-fun e!144657 () Bool)

(assert (=> b!222585 (= e!144642 e!144657)))

(declare-fun res!109293 () Bool)

(assert (=> b!222585 (=> (not res!109293) (not e!144657))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!222585 (= res!109293 (or (= lt!112690 (MissingZero!839 index!297)) (= lt!112690 (MissingVacant!839 index!297))))))

(declare-datatypes ((V!7437 0))(
  ( (V!7438 (val!2966 Int)) )
))
(declare-datatypes ((ValueCell!2578 0))(
  ( (ValueCellFull!2578 (v!4986 V!7437)) (EmptyCell!2578) )
))
(declare-datatypes ((array!10929 0))(
  ( (array!10930 (arr!5184 (Array (_ BitVec 32) ValueCell!2578)) (size!5517 (_ BitVec 32))) )
))
(declare-datatypes ((array!10931 0))(
  ( (array!10932 (arr!5185 (Array (_ BitVec 32) (_ BitVec 64))) (size!5518 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3056 0))(
  ( (LongMapFixedSize!3057 (defaultEntry!4187 Int) (mask!10007 (_ BitVec 32)) (extraKeys!3924 (_ BitVec 32)) (zeroValue!4028 V!7437) (minValue!4028 V!7437) (_size!1577 (_ BitVec 32)) (_keys!6241 array!10931) (_values!4170 array!10929) (_vacant!1577 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3056)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10931 (_ BitVec 32)) SeekEntryResult!839)

(assert (=> b!222585 (= lt!112690 (seekEntryOrOpen!0 key!932 (_keys!6241 thiss!1504) (mask!10007 thiss!1504)))))

(declare-fun b!222586 () Bool)

(declare-fun e!144647 () Bool)

(declare-fun e!144646 () Bool)

(assert (=> b!222586 (= e!144647 (and e!144646 mapRes!9934))))

(declare-fun condMapEmpty!9934 () Bool)

(declare-fun mapDefault!9934 () ValueCell!2578)

