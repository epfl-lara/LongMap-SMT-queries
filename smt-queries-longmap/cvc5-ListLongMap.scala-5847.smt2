; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75556 () Bool)

(assert start!75556)

(declare-fun b!888755 () Bool)

(declare-fun b_free!15583 () Bool)

(declare-fun b_next!15583 () Bool)

(assert (=> b!888755 (= b_free!15583 (not b_next!15583))))

(declare-fun tp!54703 () Bool)

(declare-fun b_and!25823 () Bool)

(assert (=> b!888755 (= tp!54703 b_and!25823)))

(declare-fun mapIsEmpty!28407 () Bool)

(declare-fun mapRes!28407 () Bool)

(assert (=> mapIsEmpty!28407 mapRes!28407))

(declare-fun res!602474 () Bool)

(declare-fun e!495272 () Bool)

(assert (=> start!75556 (=> (not res!602474) (not e!495272))))

(declare-datatypes ((array!51794 0))(
  ( (array!51795 (arr!24907 (Array (_ BitVec 32) (_ BitVec 64))) (size!25349 (_ BitVec 32))) )
))
(declare-datatypes ((V!28847 0))(
  ( (V!28848 (val!9006 Int)) )
))
(declare-datatypes ((ValueCell!8474 0))(
  ( (ValueCellFull!8474 (v!11482 V!28847)) (EmptyCell!8474) )
))
(declare-datatypes ((array!51796 0))(
  ( (array!51797 (arr!24908 (Array (_ BitVec 32) ValueCell!8474)) (size!25350 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3964 0))(
  ( (LongMapFixedSize!3965 (defaultEntry!5179 Int) (mask!25609 (_ BitVec 32)) (extraKeys!4873 (_ BitVec 32)) (zeroValue!4977 V!28847) (minValue!4977 V!28847) (_size!2037 (_ BitVec 32)) (_keys!9860 array!51794) (_values!5164 array!51796) (_vacant!2037 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!3964)

(declare-fun valid!1546 (LongMapFixedSize!3964) Bool)

(assert (=> start!75556 (= res!602474 (valid!1546 thiss!1181))))

(assert (=> start!75556 e!495272))

(declare-fun e!495270 () Bool)

(assert (=> start!75556 e!495270))

(assert (=> start!75556 true))

(declare-fun b!888754 () Bool)

(assert (=> b!888754 (= e!495272 false)))

(declare-fun lt!401917 () Bool)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun contains!4328 (LongMapFixedSize!3964 (_ BitVec 64)) Bool)

(assert (=> b!888754 (= lt!401917 (contains!4328 thiss!1181 key!785))))

(declare-fun tp_is_empty!17911 () Bool)

(declare-fun e!495271 () Bool)

(declare-fun array_inv!19598 (array!51794) Bool)

(declare-fun array_inv!19599 (array!51796) Bool)

(assert (=> b!888755 (= e!495270 (and tp!54703 tp_is_empty!17911 (array_inv!19598 (_keys!9860 thiss!1181)) (array_inv!19599 (_values!5164 thiss!1181)) e!495271))))

(declare-fun b!888756 () Bool)

(declare-fun e!495273 () Bool)

(assert (=> b!888756 (= e!495273 tp_is_empty!17911)))

(declare-fun b!888757 () Bool)

(declare-fun e!495274 () Bool)

(assert (=> b!888757 (= e!495271 (and e!495274 mapRes!28407))))

(declare-fun condMapEmpty!28407 () Bool)

(declare-fun mapDefault!28407 () ValueCell!8474)

