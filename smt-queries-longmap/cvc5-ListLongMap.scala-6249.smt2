; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79960 () Bool)

(assert start!79960)

(declare-fun b!940011 () Bool)

(declare-fun b_free!17815 () Bool)

(declare-fun b_next!17815 () Bool)

(assert (=> b!940011 (= b_free!17815 (not b_next!17815))))

(declare-fun tp!61919 () Bool)

(declare-fun b_and!29227 () Bool)

(assert (=> b!940011 (= tp!61919 b_and!29227)))

(declare-fun b!940006 () Bool)

(declare-fun e!528119 () Bool)

(declare-fun e!528122 () Bool)

(declare-fun mapRes!32275 () Bool)

(assert (=> b!940006 (= e!528119 (and e!528122 mapRes!32275))))

(declare-fun condMapEmpty!32275 () Bool)

(declare-datatypes ((V!32063 0))(
  ( (V!32064 (val!10212 Int)) )
))
(declare-datatypes ((ValueCell!9680 0))(
  ( (ValueCellFull!9680 (v!12743 V!32063)) (EmptyCell!9680) )
))
(declare-datatypes ((array!56594 0))(
  ( (array!56595 (arr!27232 (Array (_ BitVec 32) ValueCell!9680)) (size!27693 (_ BitVec 32))) )
))
(declare-datatypes ((array!56596 0))(
  ( (array!56597 (arr!27233 (Array (_ BitVec 32) (_ BitVec 64))) (size!27694 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4510 0))(
  ( (LongMapFixedSize!4511 (defaultEntry!5546 Int) (mask!27075 (_ BitVec 32)) (extraKeys!5278 (_ BitVec 32)) (zeroValue!5382 V!32063) (minValue!5382 V!32063) (_size!2310 (_ BitVec 32)) (_keys!10396 array!56596) (_values!5569 array!56594) (_vacant!2310 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4510)

(declare-fun mapDefault!32275 () ValueCell!9680)

