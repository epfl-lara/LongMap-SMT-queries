; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!76298 () Bool)

(assert start!76298)

(declare-fun b!895520 () Bool)

(declare-fun b_free!15911 () Bool)

(declare-fun b_next!15911 () Bool)

(assert (=> b!895520 (= b_free!15911 (not b_next!15911))))

(declare-fun tp!55742 () Bool)

(declare-fun b_and!26203 () Bool)

(assert (=> b!895520 (= tp!55742 b_and!26203)))

(declare-fun b!895515 () Bool)

(declare-fun res!605744 () Bool)

(declare-fun e!500368 () Bool)

(assert (=> b!895515 (=> (not res!605744) (not e!500368))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!895515 (= res!605744 (not (= key!785 (bvneg key!785))))))

(declare-fun b!895516 () Bool)

(declare-fun e!500369 () Bool)

(declare-datatypes ((array!52480 0))(
  ( (array!52481 (arr!25235 (Array (_ BitVec 32) (_ BitVec 64))) (size!25685 (_ BitVec 32))) )
))
(declare-datatypes ((V!29283 0))(
  ( (V!29284 (val!9170 Int)) )
))
(declare-datatypes ((ValueCell!8638 0))(
  ( (ValueCellFull!8638 (v!11660 V!29283)) (EmptyCell!8638) )
))
(declare-datatypes ((array!52482 0))(
  ( (array!52483 (arr!25236 (Array (_ BitVec 32) ValueCell!8638)) (size!25686 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4292 0))(
  ( (LongMapFixedSize!4293 (defaultEntry!5358 Int) (mask!25957 (_ BitVec 32)) (extraKeys!5054 (_ BitVec 32)) (zeroValue!5158 V!29283) (minValue!5158 V!29283) (_size!2201 (_ BitVec 32)) (_keys!10073 array!52480) (_values!5345 array!52482) (_vacant!2201 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4292)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52480 (_ BitVec 32)) Bool)

(assert (=> b!895516 (= e!500369 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10073 thiss!1181) (mask!25957 thiss!1181))))))

(declare-fun b!895517 () Bool)

(declare-fun e!500367 () Bool)

(declare-fun tp_is_empty!18239 () Bool)

(assert (=> b!895517 (= e!500367 tp_is_empty!18239)))

(declare-fun b!895518 () Bool)

(assert (=> b!895518 (= e!500368 e!500369)))

(declare-fun res!605745 () Bool)

(assert (=> b!895518 (=> (not res!605745) (not e!500369))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!895518 (= res!605745 (validMask!0 (mask!25957 thiss!1181)))))

(declare-datatypes ((SeekEntryResult!8882 0))(
  ( (MissingZero!8882 (index!37899 (_ BitVec 32))) (Found!8882 (index!37900 (_ BitVec 32))) (Intermediate!8882 (undefined!9694 Bool) (index!37901 (_ BitVec 32)) (x!76194 (_ BitVec 32))) (Undefined!8882) (MissingVacant!8882 (index!37902 (_ BitVec 32))) )
))
(declare-fun lt!404539 () SeekEntryResult!8882)

(declare-fun seekEntry!0 ((_ BitVec 64) array!52480 (_ BitVec 32)) SeekEntryResult!8882)

(assert (=> b!895518 (= lt!404539 (seekEntry!0 key!785 (_keys!10073 thiss!1181) (mask!25957 thiss!1181)))))

(declare-fun mapIsEmpty!28954 () Bool)

(declare-fun mapRes!28954 () Bool)

(assert (=> mapIsEmpty!28954 mapRes!28954))

(declare-fun b!895519 () Bool)

(declare-fun res!605746 () Bool)

(assert (=> b!895519 (=> (not res!605746) (not e!500369))))

(assert (=> b!895519 (= res!605746 (and (= (size!25686 (_values!5345 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25957 thiss!1181))) (= (size!25685 (_keys!10073 thiss!1181)) (size!25686 (_values!5345 thiss!1181))) (bvsge (mask!25957 thiss!1181) #b00000000000000000000000000000000) (bvsge (extraKeys!5054 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!5054 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun e!500372 () Bool)

(declare-fun e!500371 () Bool)

(declare-fun array_inv!19814 (array!52480) Bool)

(declare-fun array_inv!19815 (array!52482) Bool)

(assert (=> b!895520 (= e!500371 (and tp!55742 tp_is_empty!18239 (array_inv!19814 (_keys!10073 thiss!1181)) (array_inv!19815 (_values!5345 thiss!1181)) e!500372))))

(declare-fun mapNonEmpty!28954 () Bool)

(declare-fun tp!55743 () Bool)

(assert (=> mapNonEmpty!28954 (= mapRes!28954 (and tp!55743 e!500367))))

(declare-fun mapKey!28954 () (_ BitVec 32))

(declare-fun mapRest!28954 () (Array (_ BitVec 32) ValueCell!8638))

(declare-fun mapValue!28954 () ValueCell!8638)

(assert (=> mapNonEmpty!28954 (= (arr!25236 (_values!5345 thiss!1181)) (store mapRest!28954 mapKey!28954 mapValue!28954))))

(declare-fun b!895522 () Bool)

(declare-fun e!500366 () Bool)

(assert (=> b!895522 (= e!500372 (and e!500366 mapRes!28954))))

(declare-fun condMapEmpty!28954 () Bool)

(declare-fun mapDefault!28954 () ValueCell!8638)

