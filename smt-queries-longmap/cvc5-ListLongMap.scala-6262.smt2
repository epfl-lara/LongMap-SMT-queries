; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80038 () Bool)

(assert start!80038)

(declare-fun b!941076 () Bool)

(declare-fun b_free!17893 () Bool)

(declare-fun b_next!17893 () Bool)

(assert (=> b!941076 (= b_free!17893 (not b_next!17893))))

(declare-fun tp!62153 () Bool)

(declare-fun b_and!29305 () Bool)

(assert (=> b!941076 (= tp!62153 b_and!29305)))

(declare-fun b!941070 () Bool)

(declare-fun res!632726 () Bool)

(declare-fun e!529005 () Bool)

(assert (=> b!941070 (=> (not res!632726) (not e!529005))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!941070 (= res!632726 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!941071 () Bool)

(declare-fun e!529006 () Bool)

(declare-fun e!529008 () Bool)

(declare-fun mapRes!32392 () Bool)

(assert (=> b!941071 (= e!529006 (and e!529008 mapRes!32392))))

(declare-fun condMapEmpty!32392 () Bool)

(declare-datatypes ((V!32167 0))(
  ( (V!32168 (val!10251 Int)) )
))
(declare-datatypes ((ValueCell!9719 0))(
  ( (ValueCellFull!9719 (v!12782 V!32167)) (EmptyCell!9719) )
))
(declare-datatypes ((array!56750 0))(
  ( (array!56751 (arr!27310 (Array (_ BitVec 32) ValueCell!9719)) (size!27771 (_ BitVec 32))) )
))
(declare-datatypes ((array!56752 0))(
  ( (array!56753 (arr!27311 (Array (_ BitVec 32) (_ BitVec 64))) (size!27772 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4588 0))(
  ( (LongMapFixedSize!4589 (defaultEntry!5585 Int) (mask!27140 (_ BitVec 32)) (extraKeys!5317 (_ BitVec 32)) (zeroValue!5421 V!32167) (minValue!5421 V!32167) (_size!2349 (_ BitVec 32)) (_keys!10435 array!56752) (_values!5608 array!56750) (_vacant!2349 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4588)

(declare-fun mapDefault!32392 () ValueCell!9719)

