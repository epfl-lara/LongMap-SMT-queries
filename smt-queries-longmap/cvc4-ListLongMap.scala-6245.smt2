; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79898 () Bool)

(assert start!79898)

(declare-fun b!939643 () Bool)

(declare-fun b_free!17795 () Bool)

(declare-fun b_next!17795 () Bool)

(assert (=> b!939643 (= b_free!17795 (not b_next!17795))))

(declare-fun tp!61849 () Bool)

(declare-fun b_and!29207 () Bool)

(assert (=> b!939643 (= tp!61849 b_and!29207)))

(declare-fun b!939642 () Bool)

(declare-fun e!527850 () Bool)

(declare-fun tp_is_empty!20303 () Bool)

(assert (=> b!939642 (= e!527850 tp_is_empty!20303)))

(declare-fun mapNonEmpty!32234 () Bool)

(declare-fun mapRes!32234 () Bool)

(declare-fun tp!61848 () Bool)

(assert (=> mapNonEmpty!32234 (= mapRes!32234 (and tp!61848 e!527850))))

(declare-datatypes ((V!32035 0))(
  ( (V!32036 (val!10202 Int)) )
))
(declare-datatypes ((ValueCell!9670 0))(
  ( (ValueCellFull!9670 (v!12733 V!32035)) (EmptyCell!9670) )
))
(declare-fun mapValue!32234 () ValueCell!9670)

(declare-datatypes ((array!56548 0))(
  ( (array!56549 (arr!27212 (Array (_ BitVec 32) ValueCell!9670)) (size!27671 (_ BitVec 32))) )
))
(declare-datatypes ((array!56550 0))(
  ( (array!56551 (arr!27213 (Array (_ BitVec 32) (_ BitVec 64))) (size!27672 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4490 0))(
  ( (LongMapFixedSize!4491 (defaultEntry!5536 Int) (mask!27052 (_ BitVec 32)) (extraKeys!5268 (_ BitVec 32)) (zeroValue!5372 V!32035) (minValue!5372 V!32035) (_size!2300 (_ BitVec 32)) (_keys!10384 array!56550) (_values!5559 array!56548) (_vacant!2300 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4490)

(declare-fun mapRest!32234 () (Array (_ BitVec 32) ValueCell!9670))

(declare-fun mapKey!32234 () (_ BitVec 32))

(assert (=> mapNonEmpty!32234 (= (arr!27212 (_values!5559 thiss!1141)) (store mapRest!32234 mapKey!32234 mapValue!32234))))

(declare-fun e!527848 () Bool)

(declare-fun e!527852 () Bool)

(declare-fun array_inv!21164 (array!56550) Bool)

(declare-fun array_inv!21165 (array!56548) Bool)

(assert (=> b!939643 (= e!527852 (and tp!61849 tp_is_empty!20303 (array_inv!21164 (_keys!10384 thiss!1141)) (array_inv!21165 (_values!5559 thiss!1141)) e!527848))))

(declare-fun b!939644 () Bool)

(declare-fun e!527853 () Bool)

(assert (=> b!939644 (= e!527848 (and e!527853 mapRes!32234))))

(declare-fun condMapEmpty!32234 () Bool)

(declare-fun mapDefault!32234 () ValueCell!9670)

