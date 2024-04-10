; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16890 () Bool)

(assert start!16890)

(declare-fun b!170039 () Bool)

(declare-fun b_free!4177 () Bool)

(declare-fun b_next!4177 () Bool)

(assert (=> b!170039 (= b_free!4177 (not b_next!4177))))

(declare-fun tp!15143 () Bool)

(declare-fun b_and!10591 () Bool)

(assert (=> b!170039 (= tp!15143 b_and!10591)))

(declare-fun res!80837 () Bool)

(declare-fun e!112159 () Bool)

(assert (=> start!16890 (=> (not res!80837) (not e!112159))))

(declare-datatypes ((V!4913 0))(
  ( (V!4914 (val!2019 Int)) )
))
(declare-datatypes ((ValueCell!1631 0))(
  ( (ValueCellFull!1631 (v!3884 V!4913)) (EmptyCell!1631) )
))
(declare-datatypes ((array!7001 0))(
  ( (array!7002 (arr!3333 (Array (_ BitVec 32) (_ BitVec 64))) (size!3624 (_ BitVec 32))) )
))
(declare-datatypes ((array!7003 0))(
  ( (array!7004 (arr!3334 (Array (_ BitVec 32) ValueCell!1631)) (size!3625 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2170 0))(
  ( (LongMapFixedSize!2171 (defaultEntry!3527 Int) (mask!8328 (_ BitVec 32)) (extraKeys!3268 (_ BitVec 32)) (zeroValue!3370 V!4913) (minValue!3370 V!4913) (_size!1134 (_ BitVec 32)) (_keys!5355 array!7001) (_values!3510 array!7003) (_vacant!1134 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2170)

(declare-fun valid!932 (LongMapFixedSize!2170) Bool)

(assert (=> start!16890 (= res!80837 (valid!932 thiss!1248))))

(assert (=> start!16890 e!112159))

(declare-fun e!112161 () Bool)

(assert (=> start!16890 e!112161))

(assert (=> start!16890 true))

(declare-fun b!170034 () Bool)

(declare-fun e!112158 () Bool)

(declare-fun tp_is_empty!3949 () Bool)

(assert (=> b!170034 (= e!112158 tp_is_empty!3949)))

(declare-fun b!170035 () Bool)

(declare-fun res!80836 () Bool)

(assert (=> b!170035 (=> (not res!80836) (not e!112159))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!170035 (= res!80836 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!6699 () Bool)

(declare-fun mapRes!6699 () Bool)

(assert (=> mapIsEmpty!6699 mapRes!6699))

(declare-fun mapNonEmpty!6699 () Bool)

(declare-fun tp!15144 () Bool)

(declare-fun e!112160 () Bool)

(assert (=> mapNonEmpty!6699 (= mapRes!6699 (and tp!15144 e!112160))))

(declare-fun mapValue!6699 () ValueCell!1631)

(declare-fun mapKey!6699 () (_ BitVec 32))

(declare-fun mapRest!6699 () (Array (_ BitVec 32) ValueCell!1631))

(assert (=> mapNonEmpty!6699 (= (arr!3334 (_values!3510 thiss!1248)) (store mapRest!6699 mapKey!6699 mapValue!6699))))

(declare-fun b!170036 () Bool)

(declare-fun e!112163 () Bool)

(assert (=> b!170036 (= e!112163 (and e!112158 mapRes!6699))))

(declare-fun condMapEmpty!6699 () Bool)

(declare-fun mapDefault!6699 () ValueCell!1631)

