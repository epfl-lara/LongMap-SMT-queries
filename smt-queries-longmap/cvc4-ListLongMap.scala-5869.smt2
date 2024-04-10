; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75748 () Bool)

(assert start!75748)

(declare-fun b!890732 () Bool)

(declare-fun b_free!15719 () Bool)

(declare-fun b_next!15719 () Bool)

(assert (=> b!890732 (= b_free!15719 (not b_next!15719))))

(declare-fun tp!55126 () Bool)

(declare-fun b_and!25959 () Bool)

(assert (=> b!890732 (= tp!55126 b_and!25959)))

(declare-fun b!890729 () Bool)

(declare-fun e!496869 () Bool)

(declare-datatypes ((SeekEntryResult!8807 0))(
  ( (MissingZero!8807 (index!37599 (_ BitVec 32))) (Found!8807 (index!37600 (_ BitVec 32))) (Intermediate!8807 (undefined!9619 Bool) (index!37601 (_ BitVec 32)) (x!75671 (_ BitVec 32))) (Undefined!8807) (MissingVacant!8807 (index!37602 (_ BitVec 32))) )
))
(declare-fun lt!402405 () SeekEntryResult!8807)

(declare-datatypes ((array!52074 0))(
  ( (array!52075 (arr!25043 (Array (_ BitVec 32) (_ BitVec 64))) (size!25487 (_ BitVec 32))) )
))
(declare-datatypes ((V!29027 0))(
  ( (V!29028 (val!9074 Int)) )
))
(declare-datatypes ((ValueCell!8542 0))(
  ( (ValueCellFull!8542 (v!11552 V!29027)) (EmptyCell!8542) )
))
(declare-datatypes ((array!52076 0))(
  ( (array!52077 (arr!25044 (Array (_ BitVec 32) ValueCell!8542)) (size!25488 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4100 0))(
  ( (LongMapFixedSize!4101 (defaultEntry!5247 Int) (mask!25726 (_ BitVec 32)) (extraKeys!4941 (_ BitVec 32)) (zeroValue!5045 V!29027) (minValue!5045 V!29027) (_size!2105 (_ BitVec 32)) (_keys!9930 array!52074) (_values!5232 array!52076) (_vacant!2105 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4100)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!890729 (= e!496869 (inRange!0 (index!37600 lt!402405) (mask!25726 thiss!1181)))))

(declare-fun b!890730 () Bool)

(declare-fun res!603511 () Bool)

(declare-fun e!496871 () Bool)

(assert (=> b!890730 (=> (not res!603511) (not e!496871))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!890730 (= res!603511 (not (= key!785 (bvneg key!785))))))

(declare-fun b!890731 () Bool)

(declare-fun e!496864 () Bool)

(declare-fun tp_is_empty!18047 () Bool)

(assert (=> b!890731 (= e!496864 tp_is_empty!18047)))

(declare-fun b!890733 () Bool)

(declare-fun res!603512 () Bool)

(declare-fun e!496866 () Bool)

(assert (=> b!890733 (=> res!603512 e!496866)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52074 (_ BitVec 32)) Bool)

(assert (=> b!890733 (= res!603512 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9930 thiss!1181) (mask!25726 thiss!1181))))))

(declare-fun mapIsEmpty!28625 () Bool)

(declare-fun mapRes!28625 () Bool)

(assert (=> mapIsEmpty!28625 mapRes!28625))

(declare-fun b!890734 () Bool)

(declare-fun res!603508 () Bool)

(assert (=> b!890734 (=> res!603508 e!496866)))

(assert (=> b!890734 (= res!603508 (or (not (= (size!25488 (_values!5232 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25726 thiss!1181)))) (not (= (size!25487 (_keys!9930 thiss!1181)) (size!25488 (_values!5232 thiss!1181)))) (bvslt (mask!25726 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4941 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4941 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!28625 () Bool)

(declare-fun tp!55125 () Bool)

(declare-fun e!496870 () Bool)

(assert (=> mapNonEmpty!28625 (= mapRes!28625 (and tp!55125 e!496870))))

(declare-fun mapValue!28625 () ValueCell!8542)

(declare-fun mapRest!28625 () (Array (_ BitVec 32) ValueCell!8542))

(declare-fun mapKey!28625 () (_ BitVec 32))

(assert (=> mapNonEmpty!28625 (= (arr!25044 (_values!5232 thiss!1181)) (store mapRest!28625 mapKey!28625 mapValue!28625))))

(declare-fun b!890735 () Bool)

(declare-fun e!496865 () Bool)

(assert (=> b!890735 (= e!496865 (and e!496864 mapRes!28625))))

(declare-fun condMapEmpty!28625 () Bool)

(declare-fun mapDefault!28625 () ValueCell!8542)

