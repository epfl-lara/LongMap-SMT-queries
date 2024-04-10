; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16140 () Bool)

(assert start!16140)

(declare-fun b!160721 () Bool)

(declare-fun b_free!3601 () Bool)

(declare-fun b_next!3601 () Bool)

(assert (=> b!160721 (= b_free!3601 (not b_next!3601))))

(declare-fun tp!13373 () Bool)

(declare-fun b_and!10015 () Bool)

(assert (=> b!160721 (= tp!13373 b_and!10015)))

(declare-fun mapIsEmpty!5792 () Bool)

(declare-fun mapRes!5792 () Bool)

(assert (=> mapIsEmpty!5792 mapRes!5792))

(declare-fun b!160716 () Bool)

(declare-fun e!105056 () Bool)

(declare-fun tp_is_empty!3403 () Bool)

(assert (=> b!160716 (= e!105056 tp_is_empty!3403)))

(declare-fun b!160717 () Bool)

(declare-fun res!76145 () Bool)

(declare-fun e!105057 () Bool)

(assert (=> b!160717 (=> (not res!76145) (not e!105057))))

(declare-datatypes ((V!4185 0))(
  ( (V!4186 (val!1746 Int)) )
))
(declare-datatypes ((ValueCell!1358 0))(
  ( (ValueCellFull!1358 (v!3611 V!4185)) (EmptyCell!1358) )
))
(declare-datatypes ((array!5885 0))(
  ( (array!5886 (arr!2787 (Array (_ BitVec 32) (_ BitVec 64))) (size!3071 (_ BitVec 32))) )
))
(declare-datatypes ((array!5887 0))(
  ( (array!5888 (arr!2788 (Array (_ BitVec 32) ValueCell!1358)) (size!3072 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1624 0))(
  ( (LongMapFixedSize!1625 (defaultEntry!3254 Int) (mask!7830 (_ BitVec 32)) (extraKeys!2995 (_ BitVec 32)) (zeroValue!3097 V!4185) (minValue!3097 V!4185) (_size!861 (_ BitVec 32)) (_keys!5055 array!5885) (_values!3237 array!5887) (_vacant!861 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1624)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!160717 (= res!76145 (validMask!0 (mask!7830 thiss!1248)))))

(declare-fun b!160718 () Bool)

(declare-fun res!76148 () Bool)

(assert (=> b!160718 (=> (not res!76148) (not e!105057))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5885 (_ BitVec 32)) Bool)

(assert (=> b!160718 (= res!76148 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5055 thiss!1248) (mask!7830 thiss!1248)))))

(declare-fun b!160719 () Bool)

(declare-fun e!105060 () Bool)

(declare-fun e!105058 () Bool)

(assert (=> b!160719 (= e!105060 (and e!105058 mapRes!5792))))

(declare-fun condMapEmpty!5792 () Bool)

(declare-fun mapDefault!5792 () ValueCell!1358)

