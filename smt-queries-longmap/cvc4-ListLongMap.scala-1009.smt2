; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21658 () Bool)

(assert start!21658)

(declare-fun b!217331 () Bool)

(declare-fun b_free!5807 () Bool)

(declare-fun b_next!5807 () Bool)

(assert (=> b!217331 (= b_free!5807 (not b_next!5807))))

(declare-fun tp!20556 () Bool)

(declare-fun b_and!12697 () Bool)

(assert (=> b!217331 (= tp!20556 b_and!12697)))

(declare-fun b!217327 () Bool)

(declare-fun e!141382 () Bool)

(assert (=> b!217327 (= e!141382 false)))

(declare-fun lt!111326 () Bool)

(declare-datatypes ((V!7205 0))(
  ( (V!7206 (val!2879 Int)) )
))
(declare-datatypes ((ValueCell!2491 0))(
  ( (ValueCellFull!2491 (v!4897 V!7205)) (EmptyCell!2491) )
))
(declare-datatypes ((array!10577 0))(
  ( (array!10578 (arr!5010 (Array (_ BitVec 32) ValueCell!2491)) (size!5342 (_ BitVec 32))) )
))
(declare-datatypes ((array!10579 0))(
  ( (array!10580 (arr!5011 (Array (_ BitVec 32) (_ BitVec 64))) (size!5343 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2882 0))(
  ( (LongMapFixedSize!2883 (defaultEntry!4091 Int) (mask!9844 (_ BitVec 32)) (extraKeys!3828 (_ BitVec 32)) (zeroValue!3932 V!7205) (minValue!3932 V!7205) (_size!1490 (_ BitVec 32)) (_keys!6140 array!10579) (_values!4074 array!10577) (_vacant!1490 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2882)

(declare-datatypes ((List!3188 0))(
  ( (Nil!3185) (Cons!3184 (h!3831 (_ BitVec 64)) (t!8143 List!3188)) )
))
(declare-fun arrayNoDuplicates!0 (array!10579 (_ BitVec 32) List!3188) Bool)

(assert (=> b!217327 (= lt!111326 (arrayNoDuplicates!0 (_keys!6140 thiss!1504) #b00000000000000000000000000000000 Nil!3185))))

(declare-fun b!217328 () Bool)

(declare-fun res!106401 () Bool)

(assert (=> b!217328 (=> (not res!106401) (not e!141382))))

(assert (=> b!217328 (= res!106401 (and (= (size!5342 (_values!4074 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9844 thiss!1504))) (= (size!5343 (_keys!6140 thiss!1504)) (size!5342 (_values!4074 thiss!1504))) (bvsge (mask!9844 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3828 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3828 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!217329 () Bool)

(declare-fun e!141385 () Bool)

(declare-fun tp_is_empty!5669 () Bool)

(assert (=> b!217329 (= e!141385 tp_is_empty!5669)))

(declare-fun b!217330 () Bool)

(declare-fun e!141387 () Bool)

(declare-fun e!141384 () Bool)

(declare-fun mapRes!9666 () Bool)

(assert (=> b!217330 (= e!141387 (and e!141384 mapRes!9666))))

(declare-fun condMapEmpty!9666 () Bool)

(declare-fun mapDefault!9666 () ValueCell!2491)

