; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16894 () Bool)

(assert start!16894)

(declare-fun b!170080 () Bool)

(declare-fun b_free!4181 () Bool)

(declare-fun b_next!4181 () Bool)

(assert (=> b!170080 (= b_free!4181 (not b_next!4181))))

(declare-fun tp!15156 () Bool)

(declare-fun b_and!10595 () Bool)

(assert (=> b!170080 (= tp!15156 b_and!10595)))

(declare-fun res!80855 () Bool)

(declare-fun e!112199 () Bool)

(assert (=> start!16894 (=> (not res!80855) (not e!112199))))

(declare-datatypes ((V!4917 0))(
  ( (V!4918 (val!2021 Int)) )
))
(declare-datatypes ((ValueCell!1633 0))(
  ( (ValueCellFull!1633 (v!3886 V!4917)) (EmptyCell!1633) )
))
(declare-datatypes ((array!7009 0))(
  ( (array!7010 (arr!3337 (Array (_ BitVec 32) (_ BitVec 64))) (size!3628 (_ BitVec 32))) )
))
(declare-datatypes ((array!7011 0))(
  ( (array!7012 (arr!3338 (Array (_ BitVec 32) ValueCell!1633)) (size!3629 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2174 0))(
  ( (LongMapFixedSize!2175 (defaultEntry!3529 Int) (mask!8330 (_ BitVec 32)) (extraKeys!3270 (_ BitVec 32)) (zeroValue!3372 V!4917) (minValue!3372 V!4917) (_size!1136 (_ BitVec 32)) (_keys!5357 array!7009) (_values!3512 array!7011) (_vacant!1136 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2174)

(declare-fun valid!934 (LongMapFixedSize!2174) Bool)

(assert (=> start!16894 (= res!80855 (valid!934 thiss!1248))))

(assert (=> start!16894 e!112199))

(declare-fun e!112194 () Bool)

(assert (=> start!16894 e!112194))

(assert (=> start!16894 true))

(declare-fun mapNonEmpty!6705 () Bool)

(declare-fun mapRes!6705 () Bool)

(declare-fun tp!15155 () Bool)

(declare-fun e!112196 () Bool)

(assert (=> mapNonEmpty!6705 (= mapRes!6705 (and tp!15155 e!112196))))

(declare-fun mapValue!6705 () ValueCell!1633)

(declare-fun mapKey!6705 () (_ BitVec 32))

(declare-fun mapRest!6705 () (Array (_ BitVec 32) ValueCell!1633))

(assert (=> mapNonEmpty!6705 (= (arr!3338 (_values!3512 thiss!1248)) (store mapRest!6705 mapKey!6705 mapValue!6705))))

(declare-fun b!170076 () Bool)

(declare-fun tp_is_empty!3953 () Bool)

(assert (=> b!170076 (= e!112196 tp_is_empty!3953)))

(declare-fun b!170077 () Bool)

(declare-fun e!112197 () Bool)

(declare-fun e!112195 () Bool)

(assert (=> b!170077 (= e!112197 (and e!112195 mapRes!6705))))

(declare-fun condMapEmpty!6705 () Bool)

(declare-fun mapDefault!6705 () ValueCell!1633)

