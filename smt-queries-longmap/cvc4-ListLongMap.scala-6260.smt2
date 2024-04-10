; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80030 () Bool)

(assert start!80030)

(declare-fun b!940963 () Bool)

(declare-fun b_free!17885 () Bool)

(declare-fun b_next!17885 () Bool)

(assert (=> b!940963 (= b_free!17885 (not b_next!17885))))

(declare-fun tp!62130 () Bool)

(declare-fun b_and!29297 () Bool)

(assert (=> b!940963 (= tp!62130 b_and!29297)))

(declare-fun b!940956 () Bool)

(declare-fun res!632660 () Bool)

(declare-fun e!528916 () Bool)

(assert (=> b!940956 (=> res!632660 e!528916)))

(declare-datatypes ((V!32155 0))(
  ( (V!32156 (val!10247 Int)) )
))
(declare-datatypes ((ValueCell!9715 0))(
  ( (ValueCellFull!9715 (v!12778 V!32155)) (EmptyCell!9715) )
))
(declare-datatypes ((array!56734 0))(
  ( (array!56735 (arr!27302 (Array (_ BitVec 32) ValueCell!9715)) (size!27763 (_ BitVec 32))) )
))
(declare-datatypes ((array!56736 0))(
  ( (array!56737 (arr!27303 (Array (_ BitVec 32) (_ BitVec 64))) (size!27764 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4580 0))(
  ( (LongMapFixedSize!4581 (defaultEntry!5581 Int) (mask!27132 (_ BitVec 32)) (extraKeys!5313 (_ BitVec 32)) (zeroValue!5417 V!32155) (minValue!5417 V!32155) (_size!2345 (_ BitVec 32)) (_keys!10431 array!56736) (_values!5604 array!56734) (_vacant!2345 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4580)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56736 (_ BitVec 32)) Bool)

(assert (=> b!940956 (= res!632660 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10431 thiss!1141) (mask!27132 thiss!1141))))))

(declare-fun b!940957 () Bool)

(declare-fun res!632664 () Bool)

(declare-fun e!528910 () Bool)

(assert (=> b!940957 (=> (not res!632664) (not e!528910))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!940957 (= res!632664 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!940958 () Bool)

(declare-fun e!528915 () Bool)

(declare-fun tp_is_empty!20393 () Bool)

(assert (=> b!940958 (= e!528915 tp_is_empty!20393)))

(declare-fun b!940959 () Bool)

(declare-fun e!528909 () Bool)

(declare-fun e!528911 () Bool)

(declare-fun mapRes!32380 () Bool)

(assert (=> b!940959 (= e!528909 (and e!528911 mapRes!32380))))

(declare-fun condMapEmpty!32380 () Bool)

(declare-fun mapDefault!32380 () ValueCell!9715)

