; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75500 () Bool)

(assert start!75500)

(declare-fun b!888424 () Bool)

(declare-fun b_free!15571 () Bool)

(declare-fun b_next!15571 () Bool)

(assert (=> b!888424 (= b_free!15571 (not b_next!15571))))

(declare-fun tp!54663 () Bool)

(declare-fun b_and!25809 () Bool)

(assert (=> b!888424 (= tp!54663 b_and!25809)))

(declare-fun b!888422 () Bool)

(declare-fun e!495034 () Bool)

(declare-datatypes ((array!51768 0))(
  ( (array!51769 (arr!24895 (Array (_ BitVec 32) (_ BitVec 64))) (size!25336 (_ BitVec 32))) )
))
(declare-datatypes ((V!28831 0))(
  ( (V!28832 (val!9000 Int)) )
))
(declare-datatypes ((ValueCell!8468 0))(
  ( (ValueCellFull!8468 (v!11473 V!28831)) (EmptyCell!8468) )
))
(declare-datatypes ((array!51770 0))(
  ( (array!51771 (arr!24896 (Array (_ BitVec 32) ValueCell!8468)) (size!25337 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3952 0))(
  ( (LongMapFixedSize!3953 (defaultEntry!5170 Int) (mask!25592 (_ BitVec 32)) (extraKeys!4864 (_ BitVec 32)) (zeroValue!4968 V!28831) (minValue!4968 V!28831) (_size!2031 (_ BitVec 32)) (_keys!9849 array!51768) (_values!5155 array!51770) (_vacant!2031 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!3952)

(declare-fun key!785 () (_ BitVec 64))

(declare-datatypes ((Option!446 0))(
  ( (Some!445 (v!11474 V!28831)) (None!444) )
))
(declare-fun isDefined!319 (Option!446) Bool)

(declare-datatypes ((tuple2!11932 0))(
  ( (tuple2!11933 (_1!5977 (_ BitVec 64)) (_2!5977 V!28831)) )
))
(declare-datatypes ((List!17689 0))(
  ( (Nil!17686) (Cons!17685 (h!18816 tuple2!11932) (t!24986 List!17689)) )
))
(declare-fun getValueByKey!440 (List!17689 (_ BitVec 64)) Option!446)

(declare-datatypes ((ListLongMap!10629 0))(
  ( (ListLongMap!10630 (toList!5330 List!17689)) )
))
(declare-fun map!12113 (LongMapFixedSize!3952) ListLongMap!10629)

(assert (=> b!888422 (= e!495034 (not (isDefined!319 (getValueByKey!440 (toList!5330 (map!12113 thiss!1181)) key!785))))))

(declare-fun b!888423 () Bool)

(declare-fun res!602372 () Bool)

(assert (=> b!888423 (=> (not res!602372) (not e!495034))))

(declare-fun contains!4323 (LongMapFixedSize!3952 (_ BitVec 64)) Bool)

(assert (=> b!888423 (= res!602372 (contains!4323 thiss!1181 key!785))))

(declare-fun tp_is_empty!17899 () Bool)

(declare-fun e!495035 () Bool)

(declare-fun e!495036 () Bool)

(declare-fun array_inv!19590 (array!51768) Bool)

(declare-fun array_inv!19591 (array!51770) Bool)

(assert (=> b!888424 (= e!495036 (and tp!54663 tp_is_empty!17899 (array_inv!19590 (_keys!9849 thiss!1181)) (array_inv!19591 (_values!5155 thiss!1181)) e!495035))))

(declare-fun mapNonEmpty!28385 () Bool)

(declare-fun mapRes!28385 () Bool)

(declare-fun tp!54664 () Bool)

(declare-fun e!495033 () Bool)

(assert (=> mapNonEmpty!28385 (= mapRes!28385 (and tp!54664 e!495033))))

(declare-fun mapKey!28385 () (_ BitVec 32))

(declare-fun mapValue!28385 () ValueCell!8468)

(declare-fun mapRest!28385 () (Array (_ BitVec 32) ValueCell!8468))

(assert (=> mapNonEmpty!28385 (= (arr!24896 (_values!5155 thiss!1181)) (store mapRest!28385 mapKey!28385 mapValue!28385))))

(declare-fun b!888425 () Bool)

(declare-fun e!495037 () Bool)

(assert (=> b!888425 (= e!495035 (and e!495037 mapRes!28385))))

(declare-fun condMapEmpty!28385 () Bool)

(declare-fun mapDefault!28385 () ValueCell!8468)

