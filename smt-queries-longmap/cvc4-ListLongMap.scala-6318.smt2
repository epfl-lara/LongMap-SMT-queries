; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81180 () Bool)

(assert start!81180)

(declare-fun b!950029 () Bool)

(declare-fun b_free!18233 () Bool)

(declare-fun b_next!18233 () Bool)

(assert (=> b!950029 (= b_free!18233 (not b_next!18233))))

(declare-fun tp!63292 () Bool)

(declare-fun b_and!29687 () Bool)

(assert (=> b!950029 (= tp!63292 b_and!29687)))

(declare-fun b!950025 () Bool)

(declare-fun res!637009 () Bool)

(declare-fun e!534857 () Bool)

(assert (=> b!950025 (=> (not res!637009) (not e!534857))))

(declare-datatypes ((V!32619 0))(
  ( (V!32620 (val!10421 Int)) )
))
(declare-datatypes ((ValueCell!9889 0))(
  ( (ValueCellFull!9889 (v!12963 V!32619)) (EmptyCell!9889) )
))
(declare-datatypes ((array!57498 0))(
  ( (array!57499 (arr!27650 (Array (_ BitVec 32) ValueCell!9889)) (size!28127 (_ BitVec 32))) )
))
(declare-datatypes ((array!57500 0))(
  ( (array!57501 (arr!27651 (Array (_ BitVec 32) (_ BitVec 64))) (size!28128 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4928 0))(
  ( (LongMapFixedSize!4929 (defaultEntry!5774 Int) (mask!27567 (_ BitVec 32)) (extraKeys!5506 (_ BitVec 32)) (zeroValue!5610 V!32619) (minValue!5610 V!32619) (_size!2519 (_ BitVec 32)) (_keys!10708 array!57500) (_values!5797 array!57498) (_vacant!2519 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4928)

(assert (=> b!950025 (= res!637009 (and (= (size!28127 (_values!5797 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27567 thiss!1141))) (= (size!28128 (_keys!10708 thiss!1141)) (size!28127 (_values!5797 thiss!1141))) (bvsge (mask!27567 thiss!1141) #b00000000000000000000000000000000) (bvsge (extraKeys!5506 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5506 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!33020 () Bool)

(declare-fun mapRes!33020 () Bool)

(declare-fun tp!63291 () Bool)

(declare-fun e!534858 () Bool)

(assert (=> mapNonEmpty!33020 (= mapRes!33020 (and tp!63291 e!534858))))

(declare-fun mapValue!33020 () ValueCell!9889)

(declare-fun mapKey!33020 () (_ BitVec 32))

(declare-fun mapRest!33020 () (Array (_ BitVec 32) ValueCell!9889))

(assert (=> mapNonEmpty!33020 (= (arr!27650 (_values!5797 thiss!1141)) (store mapRest!33020 mapKey!33020 mapValue!33020))))

(declare-fun b!950026 () Bool)

(declare-fun e!534856 () Bool)

(declare-fun tp_is_empty!20741 () Bool)

(assert (=> b!950026 (= e!534856 tp_is_empty!20741)))

(declare-fun b!950027 () Bool)

(declare-fun res!637013 () Bool)

(assert (=> b!950027 (=> (not res!637013) (not e!534857))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!9137 0))(
  ( (MissingZero!9137 (index!38919 (_ BitVec 32))) (Found!9137 (index!38920 (_ BitVec 32))) (Intermediate!9137 (undefined!9949 Bool) (index!38921 (_ BitVec 32)) (x!81729 (_ BitVec 32))) (Undefined!9137) (MissingVacant!9137 (index!38922 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57500 (_ BitVec 32)) SeekEntryResult!9137)

(assert (=> b!950027 (= res!637013 (not (is-Found!9137 (seekEntry!0 key!756 (_keys!10708 thiss!1141) (mask!27567 thiss!1141)))))))

(declare-fun b!950028 () Bool)

(declare-fun res!637010 () Bool)

(assert (=> b!950028 (=> (not res!637010) (not e!534857))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57500 (_ BitVec 32)) Bool)

(assert (=> b!950028 (= res!637010 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10708 thiss!1141) (mask!27567 thiss!1141)))))

(declare-fun e!534861 () Bool)

(declare-fun e!534860 () Bool)

(declare-fun array_inv!21462 (array!57500) Bool)

(declare-fun array_inv!21463 (array!57498) Bool)

(assert (=> b!950029 (= e!534861 (and tp!63292 tp_is_empty!20741 (array_inv!21462 (_keys!10708 thiss!1141)) (array_inv!21463 (_values!5797 thiss!1141)) e!534860))))

(declare-fun b!950030 () Bool)

(assert (=> b!950030 (= e!534860 (and e!534856 mapRes!33020))))

(declare-fun condMapEmpty!33020 () Bool)

(declare-fun mapDefault!33020 () ValueCell!9889)

