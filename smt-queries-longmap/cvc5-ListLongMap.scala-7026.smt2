; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89168 () Bool)

(assert start!89168)

(declare-fun b!1022363 () Bool)

(declare-fun b_free!20209 () Bool)

(declare-fun b_next!20209 () Bool)

(assert (=> b!1022363 (= b_free!20209 (not b_next!20209))))

(declare-fun tp!71662 () Bool)

(declare-fun b_and!32407 () Bool)

(assert (=> b!1022363 (= tp!71662 b_and!32407)))

(declare-fun res!684895 () Bool)

(declare-fun e!575918 () Bool)

(assert (=> start!89168 (=> (not res!684895) (not e!575918))))

(declare-datatypes ((V!36779 0))(
  ( (V!36780 (val!12015 Int)) )
))
(declare-datatypes ((ValueCell!11261 0))(
  ( (ValueCellFull!11261 (v!14584 V!36779)) (EmptyCell!11261) )
))
(declare-datatypes ((array!63902 0))(
  ( (array!63903 (arr!30763 (Array (_ BitVec 32) (_ BitVec 64))) (size!31274 (_ BitVec 32))) )
))
(declare-datatypes ((array!63904 0))(
  ( (array!63905 (arr!30764 (Array (_ BitVec 32) ValueCell!11261)) (size!31275 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5116 0))(
  ( (LongMapFixedSize!5117 (defaultEntry!5910 Int) (mask!29503 (_ BitVec 32)) (extraKeys!5642 (_ BitVec 32)) (zeroValue!5746 V!36779) (minValue!5746 V!36779) (_size!2613 (_ BitVec 32)) (_keys!11055 array!63902) (_values!5933 array!63904) (_vacant!2613 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5116)

(declare-fun valid!1948 (LongMapFixedSize!5116) Bool)

(assert (=> start!89168 (= res!684895 (valid!1948 thiss!1427))))

(assert (=> start!89168 e!575918))

(declare-fun e!575917 () Bool)

(assert (=> start!89168 e!575917))

(assert (=> start!89168 true))

(declare-fun b!1022360 () Bool)

(declare-fun e!575914 () Bool)

(declare-fun tp_is_empty!23929 () Bool)

(assert (=> b!1022360 (= e!575914 tp_is_empty!23929)))

(declare-fun b!1022361 () Bool)

(declare-fun e!575915 () Bool)

(assert (=> b!1022361 (= e!575915 tp_is_empty!23929)))

(declare-fun mapNonEmpty!37311 () Bool)

(declare-fun mapRes!37311 () Bool)

(declare-fun tp!71661 () Bool)

(assert (=> mapNonEmpty!37311 (= mapRes!37311 (and tp!71661 e!575914))))

(declare-fun mapKey!37311 () (_ BitVec 32))

(declare-fun mapRest!37311 () (Array (_ BitVec 32) ValueCell!11261))

(declare-fun mapValue!37311 () ValueCell!11261)

(assert (=> mapNonEmpty!37311 (= (arr!30764 (_values!5933 thiss!1427)) (store mapRest!37311 mapKey!37311 mapValue!37311))))

(declare-fun b!1022362 () Bool)

(declare-fun res!684892 () Bool)

(assert (=> b!1022362 (=> (not res!684892) (not e!575918))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63902 (_ BitVec 32)) Bool)

(assert (=> b!1022362 (= res!684892 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11055 thiss!1427) (mask!29503 thiss!1427)))))

(declare-fun e!575916 () Bool)

(declare-fun array_inv!23849 (array!63902) Bool)

(declare-fun array_inv!23850 (array!63904) Bool)

(assert (=> b!1022363 (= e!575917 (and tp!71662 tp_is_empty!23929 (array_inv!23849 (_keys!11055 thiss!1427)) (array_inv!23850 (_values!5933 thiss!1427)) e!575916))))

(declare-fun b!1022364 () Bool)

(declare-fun res!684893 () Bool)

(assert (=> b!1022364 (=> (not res!684893) (not e!575918))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1022364 (= res!684893 (validMask!0 (mask!29503 thiss!1427)))))

(declare-fun b!1022365 () Bool)

(assert (=> b!1022365 (= e!575916 (and e!575915 mapRes!37311))))

(declare-fun condMapEmpty!37311 () Bool)

(declare-fun mapDefault!37311 () ValueCell!11261)

