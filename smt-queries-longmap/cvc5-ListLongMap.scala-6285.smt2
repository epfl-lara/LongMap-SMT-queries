; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80388 () Bool)

(assert start!80388)

(declare-fun b!944151 () Bool)

(declare-fun b_free!18031 () Bool)

(declare-fun b_next!18031 () Bool)

(assert (=> b!944151 (= b_free!18031 (not b_next!18031))))

(declare-fun tp!62602 () Bool)

(declare-fun b_and!29449 () Bool)

(assert (=> b!944151 (= tp!62602 b_and!29449)))

(declare-fun b!944145 () Bool)

(declare-fun e!530906 () Bool)

(declare-fun tp_is_empty!20539 () Bool)

(assert (=> b!944145 (= e!530906 tp_is_empty!20539)))

(declare-fun b!944146 () Bool)

(declare-fun e!530904 () Bool)

(assert (=> b!944146 (= e!530904 true)))

(declare-fun lt!425539 () Bool)

(declare-datatypes ((V!32351 0))(
  ( (V!32352 (val!10320 Int)) )
))
(declare-datatypes ((ValueCell!9788 0))(
  ( (ValueCellFull!9788 (v!12852 V!32351)) (EmptyCell!9788) )
))
(declare-datatypes ((array!57046 0))(
  ( (array!57047 (arr!27448 (Array (_ BitVec 32) ValueCell!9788)) (size!27914 (_ BitVec 32))) )
))
(declare-datatypes ((array!57048 0))(
  ( (array!57049 (arr!27449 (Array (_ BitVec 32) (_ BitVec 64))) (size!27915 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4726 0))(
  ( (LongMapFixedSize!4727 (defaultEntry!5658 Int) (mask!27302 (_ BitVec 32)) (extraKeys!5390 (_ BitVec 32)) (zeroValue!5494 V!32351) (minValue!5494 V!32351) (_size!2418 (_ BitVec 32)) (_keys!10536 array!57048) (_values!5681 array!57046) (_vacant!2418 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4726)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57048 (_ BitVec 32)) Bool)

(assert (=> b!944146 (= lt!425539 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10536 thiss!1141) (mask!27302 thiss!1141)))))

(declare-fun res!634274 () Bool)

(declare-fun e!530902 () Bool)

(assert (=> start!80388 (=> (not res!634274) (not e!530902))))

(declare-fun valid!1806 (LongMapFixedSize!4726) Bool)

(assert (=> start!80388 (= res!634274 (valid!1806 thiss!1141))))

(assert (=> start!80388 e!530902))

(declare-fun e!530905 () Bool)

(assert (=> start!80388 e!530905))

(assert (=> start!80388 true))

(declare-fun b!944147 () Bool)

(declare-fun e!530903 () Bool)

(declare-fun e!530907 () Bool)

(declare-fun mapRes!32634 () Bool)

(assert (=> b!944147 (= e!530903 (and e!530907 mapRes!32634))))

(declare-fun condMapEmpty!32634 () Bool)

(declare-fun mapDefault!32634 () ValueCell!9788)

