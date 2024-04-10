; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18462 () Bool)

(assert start!18462)

(declare-fun b!183133 () Bool)

(declare-fun b_free!4519 () Bool)

(declare-fun b_next!4519 () Bool)

(assert (=> b!183133 (= b_free!4519 (not b_next!4519))))

(declare-fun tp!16324 () Bool)

(declare-fun b_and!11087 () Bool)

(assert (=> b!183133 (= tp!16324 b_and!11087)))

(declare-fun b!183127 () Bool)

(declare-fun e!120564 () Bool)

(declare-datatypes ((V!5369 0))(
  ( (V!5370 (val!2190 Int)) )
))
(declare-datatypes ((ValueCell!1802 0))(
  ( (ValueCellFull!1802 (v!4092 V!5369)) (EmptyCell!1802) )
))
(declare-datatypes ((array!7773 0))(
  ( (array!7774 (arr!3675 (Array (_ BitVec 32) (_ BitVec 64))) (size!3987 (_ BitVec 32))) )
))
(declare-datatypes ((array!7775 0))(
  ( (array!7776 (arr!3676 (Array (_ BitVec 32) ValueCell!1802)) (size!3988 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2512 0))(
  ( (LongMapFixedSize!2513 (defaultEntry!3745 Int) (mask!8803 (_ BitVec 32)) (extraKeys!3482 (_ BitVec 32)) (zeroValue!3586 V!5369) (minValue!3586 V!5369) (_size!1305 (_ BitVec 32)) (_keys!5662 array!7773) (_values!3728 array!7775) (_vacant!1305 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2512)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!183127 (= e!120564 (not (validMask!0 (mask!8803 thiss!1248))))))

(declare-fun b!183128 () Bool)

(declare-fun e!120566 () Bool)

(assert (=> b!183128 (= e!120566 e!120564)))

(declare-fun res!86693 () Bool)

(assert (=> b!183128 (=> (not res!86693) (not e!120564))))

(declare-datatypes ((SeekEntryResult!616 0))(
  ( (MissingZero!616 (index!4634 (_ BitVec 32))) (Found!616 (index!4635 (_ BitVec 32))) (Intermediate!616 (undefined!1428 Bool) (index!4636 (_ BitVec 32)) (x!19952 (_ BitVec 32))) (Undefined!616) (MissingVacant!616 (index!4637 (_ BitVec 32))) )
))
(declare-fun lt!90523 () SeekEntryResult!616)

(assert (=> b!183128 (= res!86693 (and (not (is-Undefined!616 lt!90523)) (not (is-MissingVacant!616 lt!90523)) (not (is-MissingZero!616 lt!90523)) (is-Found!616 lt!90523)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7773 (_ BitVec 32)) SeekEntryResult!616)

(assert (=> b!183128 (= lt!90523 (seekEntryOrOpen!0 key!828 (_keys!5662 thiss!1248) (mask!8803 thiss!1248)))))

(declare-fun b!183129 () Bool)

(declare-fun e!120565 () Bool)

(declare-fun e!120561 () Bool)

(declare-fun mapRes!7367 () Bool)

(assert (=> b!183129 (= e!120565 (and e!120561 mapRes!7367))))

(declare-fun condMapEmpty!7367 () Bool)

(declare-fun mapDefault!7367 () ValueCell!1802)

