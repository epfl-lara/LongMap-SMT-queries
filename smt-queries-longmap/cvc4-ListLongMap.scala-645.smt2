; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16222 () Bool)

(assert start!16222)

(declare-fun b!161806 () Bool)

(declare-fun b_free!3683 () Bool)

(declare-fun b_next!3683 () Bool)

(assert (=> b!161806 (= b_free!3683 (not b_next!3683))))

(declare-fun tp!13618 () Bool)

(declare-fun b_and!10097 () Bool)

(assert (=> b!161806 (= tp!13618 b_and!10097)))

(declare-fun b!161804 () Bool)

(declare-fun res!76649 () Bool)

(declare-fun e!105843 () Bool)

(assert (=> b!161804 (=> (not res!76649) (not e!105843))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!161804 (= res!76649 (not (= key!828 (bvneg key!828))))))

(declare-fun b!161805 () Bool)

(declare-fun e!105842 () Bool)

(declare-fun tp_is_empty!3485 () Bool)

(assert (=> b!161805 (= e!105842 tp_is_empty!3485)))

(declare-fun mapIsEmpty!5915 () Bool)

(declare-fun mapRes!5915 () Bool)

(assert (=> mapIsEmpty!5915 mapRes!5915))

(declare-fun e!105839 () Bool)

(declare-fun e!105841 () Bool)

(declare-datatypes ((V!4293 0))(
  ( (V!4294 (val!1787 Int)) )
))
(declare-datatypes ((ValueCell!1399 0))(
  ( (ValueCellFull!1399 (v!3652 V!4293)) (EmptyCell!1399) )
))
(declare-datatypes ((array!6049 0))(
  ( (array!6050 (arr!2869 (Array (_ BitVec 32) (_ BitVec 64))) (size!3153 (_ BitVec 32))) )
))
(declare-datatypes ((array!6051 0))(
  ( (array!6052 (arr!2870 (Array (_ BitVec 32) ValueCell!1399)) (size!3154 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1706 0))(
  ( (LongMapFixedSize!1707 (defaultEntry!3295 Int) (mask!7897 (_ BitVec 32)) (extraKeys!3036 (_ BitVec 32)) (zeroValue!3138 V!4293) (minValue!3138 V!4293) (_size!902 (_ BitVec 32)) (_keys!5096 array!6049) (_values!3278 array!6051) (_vacant!902 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1706)

(declare-fun array_inv!1835 (array!6049) Bool)

(declare-fun array_inv!1836 (array!6051) Bool)

(assert (=> b!161806 (= e!105839 (and tp!13618 tp_is_empty!3485 (array_inv!1835 (_keys!5096 thiss!1248)) (array_inv!1836 (_values!3278 thiss!1248)) e!105841))))

(declare-fun mapNonEmpty!5915 () Bool)

(declare-fun tp!13619 () Bool)

(declare-fun e!105838 () Bool)

(assert (=> mapNonEmpty!5915 (= mapRes!5915 (and tp!13619 e!105838))))

(declare-fun mapValue!5915 () ValueCell!1399)

(declare-fun mapKey!5915 () (_ BitVec 32))

(declare-fun mapRest!5915 () (Array (_ BitVec 32) ValueCell!1399))

(assert (=> mapNonEmpty!5915 (= (arr!2870 (_values!3278 thiss!1248)) (store mapRest!5915 mapKey!5915 mapValue!5915))))

(declare-fun b!161807 () Bool)

(assert (=> b!161807 (= e!105841 (and e!105842 mapRes!5915))))

(declare-fun condMapEmpty!5915 () Bool)

(declare-fun mapDefault!5915 () ValueCell!1399)

