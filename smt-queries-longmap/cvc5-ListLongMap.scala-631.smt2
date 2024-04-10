; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16134 () Bool)

(assert start!16134)

(declare-fun b!160623 () Bool)

(declare-fun b_free!3595 () Bool)

(declare-fun b_next!3595 () Bool)

(assert (=> b!160623 (= b_free!3595 (not b_next!3595))))

(declare-fun tp!13354 () Bool)

(declare-fun b_and!10009 () Bool)

(assert (=> b!160623 (= tp!13354 b_and!10009)))

(declare-fun b!160617 () Bool)

(declare-fun res!76079 () Bool)

(declare-fun e!105003 () Bool)

(assert (=> b!160617 (=> (not res!76079) (not e!105003))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!160617 (= res!76079 (not (= key!828 (bvneg key!828))))))

(declare-fun res!76082 () Bool)

(assert (=> start!16134 (=> (not res!76082) (not e!105003))))

(declare-datatypes ((V!4177 0))(
  ( (V!4178 (val!1743 Int)) )
))
(declare-datatypes ((ValueCell!1355 0))(
  ( (ValueCellFull!1355 (v!3608 V!4177)) (EmptyCell!1355) )
))
(declare-datatypes ((array!5873 0))(
  ( (array!5874 (arr!2781 (Array (_ BitVec 32) (_ BitVec 64))) (size!3065 (_ BitVec 32))) )
))
(declare-datatypes ((array!5875 0))(
  ( (array!5876 (arr!2782 (Array (_ BitVec 32) ValueCell!1355)) (size!3066 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1618 0))(
  ( (LongMapFixedSize!1619 (defaultEntry!3251 Int) (mask!7825 (_ BitVec 32)) (extraKeys!2992 (_ BitVec 32)) (zeroValue!3094 V!4177) (minValue!3094 V!4177) (_size!858 (_ BitVec 32)) (_keys!5052 array!5873) (_values!3234 array!5875) (_vacant!858 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1618)

(declare-fun valid!749 (LongMapFixedSize!1618) Bool)

(assert (=> start!16134 (= res!76082 (valid!749 thiss!1248))))

(assert (=> start!16134 e!105003))

(declare-fun e!105006 () Bool)

(assert (=> start!16134 e!105006))

(assert (=> start!16134 true))

(declare-fun b!160618 () Bool)

(declare-fun res!76084 () Bool)

(assert (=> b!160618 (=> (not res!76084) (not e!105003))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5873 (_ BitVec 32)) Bool)

(assert (=> b!160618 (= res!76084 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5052 thiss!1248) (mask!7825 thiss!1248)))))

(declare-fun b!160619 () Bool)

(declare-fun e!105005 () Bool)

(declare-fun e!105001 () Bool)

(declare-fun mapRes!5783 () Bool)

(assert (=> b!160619 (= e!105005 (and e!105001 mapRes!5783))))

(declare-fun condMapEmpty!5783 () Bool)

(declare-fun mapDefault!5783 () ValueCell!1355)

