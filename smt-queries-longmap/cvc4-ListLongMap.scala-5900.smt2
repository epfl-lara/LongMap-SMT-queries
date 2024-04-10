; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!76268 () Bool)

(assert start!76268)

(declare-fun b!895311 () Bool)

(declare-fun b_free!15905 () Bool)

(declare-fun b_next!15905 () Bool)

(assert (=> b!895311 (= b_free!15905 (not b_next!15905))))

(declare-fun tp!55720 () Bool)

(declare-fun b_and!26197 () Bool)

(assert (=> b!895311 (= tp!55720 b_and!26197)))

(declare-fun tp_is_empty!18233 () Bool)

(declare-fun e!500235 () Bool)

(declare-datatypes ((array!52466 0))(
  ( (array!52467 (arr!25229 (Array (_ BitVec 32) (_ BitVec 64))) (size!25678 (_ BitVec 32))) )
))
(declare-datatypes ((V!29275 0))(
  ( (V!29276 (val!9167 Int)) )
))
(declare-datatypes ((ValueCell!8635 0))(
  ( (ValueCellFull!8635 (v!11657 V!29275)) (EmptyCell!8635) )
))
(declare-datatypes ((array!52468 0))(
  ( (array!52469 (arr!25230 (Array (_ BitVec 32) ValueCell!8635)) (size!25679 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4286 0))(
  ( (LongMapFixedSize!4287 (defaultEntry!5355 Int) (mask!25946 (_ BitVec 32)) (extraKeys!5051 (_ BitVec 32)) (zeroValue!5155 V!29275) (minValue!5155 V!29275) (_size!2198 (_ BitVec 32)) (_keys!10066 array!52466) (_values!5342 array!52468) (_vacant!2198 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4286)

(declare-fun e!500233 () Bool)

(declare-fun array_inv!19808 (array!52466) Bool)

(declare-fun array_inv!19809 (array!52468) Bool)

(assert (=> b!895311 (= e!500235 (and tp!55720 tp_is_empty!18233 (array_inv!19808 (_keys!10066 thiss!1181)) (array_inv!19809 (_values!5342 thiss!1181)) e!500233))))

(declare-fun mapIsEmpty!28941 () Bool)

(declare-fun mapRes!28941 () Bool)

(assert (=> mapIsEmpty!28941 mapRes!28941))

(declare-fun b!895312 () Bool)

(declare-fun e!500232 () Bool)

(assert (=> b!895312 (= e!500232 (and (= (size!25679 (_values!5342 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25946 thiss!1181))) (= (size!25678 (_keys!10066 thiss!1181)) (size!25679 (_values!5342 thiss!1181))) (bvsge (mask!25946 thiss!1181) #b00000000000000000000000000000000) (bvsge (extraKeys!5051 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!5051 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!895313 () Bool)

(declare-fun e!500231 () Bool)

(assert (=> b!895313 (= e!500231 e!500232)))

(declare-fun res!605665 () Bool)

(assert (=> b!895313 (=> (not res!605665) (not e!500232))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!895313 (= res!605665 (validMask!0 (mask!25946 thiss!1181)))))

(declare-datatypes ((SeekEntryResult!8879 0))(
  ( (MissingZero!8879 (index!37887 (_ BitVec 32))) (Found!8879 (index!37888 (_ BitVec 32))) (Intermediate!8879 (undefined!9691 Bool) (index!37889 (_ BitVec 32)) (x!76166 (_ BitVec 32))) (Undefined!8879) (MissingVacant!8879 (index!37890 (_ BitVec 32))) )
))
(declare-fun lt!404488 () SeekEntryResult!8879)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52466 (_ BitVec 32)) SeekEntryResult!8879)

(assert (=> b!895313 (= lt!404488 (seekEntry!0 key!785 (_keys!10066 thiss!1181) (mask!25946 thiss!1181)))))

(declare-fun b!895314 () Bool)

(declare-fun e!500234 () Bool)

(assert (=> b!895314 (= e!500234 tp_is_empty!18233)))

(declare-fun res!605664 () Bool)

(assert (=> start!76268 (=> (not res!605664) (not e!500231))))

(declare-fun valid!1654 (LongMapFixedSize!4286) Bool)

(assert (=> start!76268 (= res!605664 (valid!1654 thiss!1181))))

(assert (=> start!76268 e!500231))

(assert (=> start!76268 e!500235))

(assert (=> start!76268 true))

(declare-fun mapNonEmpty!28941 () Bool)

(declare-fun tp!55721 () Bool)

(assert (=> mapNonEmpty!28941 (= mapRes!28941 (and tp!55721 e!500234))))

(declare-fun mapRest!28941 () (Array (_ BitVec 32) ValueCell!8635))

(declare-fun mapValue!28941 () ValueCell!8635)

(declare-fun mapKey!28941 () (_ BitVec 32))

(assert (=> mapNonEmpty!28941 (= (arr!25230 (_values!5342 thiss!1181)) (store mapRest!28941 mapKey!28941 mapValue!28941))))

(declare-fun b!895315 () Bool)

(declare-fun e!500229 () Bool)

(assert (=> b!895315 (= e!500229 tp_is_empty!18233)))

(declare-fun b!895316 () Bool)

(declare-fun res!605663 () Bool)

(assert (=> b!895316 (=> (not res!605663) (not e!500231))))

(assert (=> b!895316 (= res!605663 (not (= key!785 (bvneg key!785))))))

(declare-fun b!895317 () Bool)

(assert (=> b!895317 (= e!500233 (and e!500229 mapRes!28941))))

(declare-fun condMapEmpty!28941 () Bool)

(declare-fun mapDefault!28941 () ValueCell!8635)

