; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79920 () Bool)

(assert start!79920)

(declare-fun b!939774 () Bool)

(declare-fun b_free!17801 () Bool)

(declare-fun b_next!17801 () Bool)

(assert (=> b!939774 (= b_free!17801 (not b_next!17801))))

(declare-fun tp!61871 () Bool)

(declare-fun b_and!29213 () Bool)

(assert (=> b!939774 (= tp!61871 b_and!29213)))

(declare-fun e!527948 () Bool)

(declare-fun tp_is_empty!20309 () Bool)

(declare-fun e!527944 () Bool)

(declare-datatypes ((V!32043 0))(
  ( (V!32044 (val!10205 Int)) )
))
(declare-datatypes ((ValueCell!9673 0))(
  ( (ValueCellFull!9673 (v!12736 V!32043)) (EmptyCell!9673) )
))
(declare-datatypes ((array!56562 0))(
  ( (array!56563 (arr!27218 (Array (_ BitVec 32) ValueCell!9673)) (size!27678 (_ BitVec 32))) )
))
(declare-datatypes ((array!56564 0))(
  ( (array!56565 (arr!27219 (Array (_ BitVec 32) (_ BitVec 64))) (size!27679 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4496 0))(
  ( (LongMapFixedSize!4497 (defaultEntry!5539 Int) (mask!27059 (_ BitVec 32)) (extraKeys!5271 (_ BitVec 32)) (zeroValue!5375 V!32043) (minValue!5375 V!32043) (_size!2303 (_ BitVec 32)) (_keys!10388 array!56564) (_values!5562 array!56562) (_vacant!2303 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4496)

(declare-fun array_inv!21168 (array!56564) Bool)

(declare-fun array_inv!21169 (array!56562) Bool)

(assert (=> b!939774 (= e!527944 (and tp!61871 tp_is_empty!20309 (array_inv!21168 (_keys!10388 thiss!1141)) (array_inv!21169 (_values!5562 thiss!1141)) e!527948))))

(declare-fun res!632024 () Bool)

(declare-fun e!527943 () Bool)

(assert (=> start!79920 (=> (not res!632024) (not e!527943))))

(declare-fun valid!1727 (LongMapFixedSize!4496) Bool)

(assert (=> start!79920 (= res!632024 (valid!1727 thiss!1141))))

(assert (=> start!79920 e!527943))

(assert (=> start!79920 e!527944))

(assert (=> start!79920 true))

(declare-fun b!939775 () Bool)

(declare-fun res!632025 () Bool)

(assert (=> b!939775 (=> (not res!632025) (not e!527943))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!939775 (= res!632025 (validMask!0 (mask!27059 thiss!1141)))))

(declare-fun b!939776 () Bool)

(declare-fun e!527947 () Bool)

(declare-fun mapRes!32247 () Bool)

(assert (=> b!939776 (= e!527948 (and e!527947 mapRes!32247))))

(declare-fun condMapEmpty!32247 () Bool)

(declare-fun mapDefault!32247 () ValueCell!9673)

