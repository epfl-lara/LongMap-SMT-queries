; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80970 () Bool)

(assert start!80970)

(declare-fun b!948451 () Bool)

(declare-fun b_free!18203 () Bool)

(declare-fun b_next!18203 () Bool)

(assert (=> b!948451 (= b_free!18203 (not b_next!18203))))

(declare-fun tp!63183 () Bool)

(declare-fun b_and!29635 () Bool)

(assert (=> b!948451 (= tp!63183 b_and!29635)))

(declare-fun mapNonEmpty!32957 () Bool)

(declare-fun mapRes!32957 () Bool)

(declare-fun tp!63184 () Bool)

(declare-fun e!533914 () Bool)

(assert (=> mapNonEmpty!32957 (= mapRes!32957 (and tp!63184 e!533914))))

(declare-fun mapKey!32957 () (_ BitVec 32))

(declare-datatypes ((V!32579 0))(
  ( (V!32580 (val!10406 Int)) )
))
(declare-datatypes ((ValueCell!9874 0))(
  ( (ValueCellFull!9874 (v!12943 V!32579)) (EmptyCell!9874) )
))
(declare-fun mapRest!32957 () (Array (_ BitVec 32) ValueCell!9874))

(declare-datatypes ((array!57428 0))(
  ( (array!57429 (arr!27620 (Array (_ BitVec 32) ValueCell!9874)) (size!28094 (_ BitVec 32))) )
))
(declare-datatypes ((array!57430 0))(
  ( (array!57431 (arr!27621 (Array (_ BitVec 32) (_ BitVec 64))) (size!28095 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4898 0))(
  ( (LongMapFixedSize!4899 (defaultEntry!5751 Int) (mask!27511 (_ BitVec 32)) (extraKeys!5483 (_ BitVec 32)) (zeroValue!5587 V!32579) (minValue!5587 V!32579) (_size!2504 (_ BitVec 32)) (_keys!10670 array!57430) (_values!5774 array!57428) (_vacant!2504 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4898)

(declare-fun mapValue!32957 () ValueCell!9874)

(assert (=> mapNonEmpty!32957 (= (arr!27620 (_values!5774 thiss!1141)) (store mapRest!32957 mapKey!32957 mapValue!32957))))

(declare-fun b!948450 () Bool)

(declare-fun e!533915 () Bool)

(assert (=> b!948450 (= e!533915 (and (= (size!28094 (_values!5774 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27511 thiss!1141))) (not (= (size!28095 (_keys!10670 thiss!1141)) (size!28094 (_values!5774 thiss!1141))))))))

(declare-fun e!533919 () Bool)

(declare-fun tp_is_empty!20711 () Bool)

(declare-fun e!533917 () Bool)

(declare-fun array_inv!21442 (array!57430) Bool)

(declare-fun array_inv!21443 (array!57428) Bool)

(assert (=> b!948451 (= e!533919 (and tp!63183 tp_is_empty!20711 (array_inv!21442 (_keys!10670 thiss!1141)) (array_inv!21443 (_values!5774 thiss!1141)) e!533917))))

(declare-fun res!636313 () Bool)

(assert (=> start!80970 (=> (not res!636313) (not e!533915))))

(declare-fun valid!1865 (LongMapFixedSize!4898) Bool)

(assert (=> start!80970 (= res!636313 (valid!1865 thiss!1141))))

(assert (=> start!80970 e!533915))

(assert (=> start!80970 e!533919))

(assert (=> start!80970 true))

(declare-fun b!948452 () Bool)

(declare-fun res!636310 () Bool)

(assert (=> b!948452 (=> (not res!636310) (not e!533915))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((tuple2!13526 0))(
  ( (tuple2!13527 (_1!6774 (_ BitVec 64)) (_2!6774 V!32579)) )
))
(declare-datatypes ((List!19319 0))(
  ( (Nil!19316) (Cons!19315 (h!20472 tuple2!13526) (t!27646 List!19319)) )
))
(declare-datatypes ((ListLongMap!12223 0))(
  ( (ListLongMap!12224 (toList!6127 List!19319)) )
))
(declare-fun contains!5211 (ListLongMap!12223 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3360 (array!57430 array!57428 (_ BitVec 32) (_ BitVec 32) V!32579 V!32579 (_ BitVec 32) Int) ListLongMap!12223)

(assert (=> b!948452 (= res!636310 (contains!5211 (getCurrentListMap!3360 (_keys!10670 thiss!1141) (_values!5774 thiss!1141) (mask!27511 thiss!1141) (extraKeys!5483 thiss!1141) (zeroValue!5587 thiss!1141) (minValue!5587 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5751 thiss!1141)) key!756))))

(declare-fun b!948453 () Bool)

(declare-fun res!636312 () Bool)

(assert (=> b!948453 (=> (not res!636312) (not e!533915))))

(declare-datatypes ((SeekEntryResult!9127 0))(
  ( (MissingZero!9127 (index!38879 (_ BitVec 32))) (Found!9127 (index!38880 (_ BitVec 32))) (Intermediate!9127 (undefined!9939 Bool) (index!38881 (_ BitVec 32)) (x!81605 (_ BitVec 32))) (Undefined!9127) (MissingVacant!9127 (index!38882 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57430 (_ BitVec 32)) SeekEntryResult!9127)

(assert (=> b!948453 (= res!636312 (not (is-Found!9127 (seekEntry!0 key!756 (_keys!10670 thiss!1141) (mask!27511 thiss!1141)))))))

(declare-fun b!948454 () Bool)

(declare-fun res!636311 () Bool)

(assert (=> b!948454 (=> (not res!636311) (not e!533915))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!948454 (= res!636311 (validMask!0 (mask!27511 thiss!1141)))))

(declare-fun b!948455 () Bool)

(declare-fun e!533918 () Bool)

(assert (=> b!948455 (= e!533918 tp_is_empty!20711)))

(declare-fun mapIsEmpty!32957 () Bool)

(assert (=> mapIsEmpty!32957 mapRes!32957))

(declare-fun b!948456 () Bool)

(declare-fun res!636309 () Bool)

(assert (=> b!948456 (=> (not res!636309) (not e!533915))))

(assert (=> b!948456 (= res!636309 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!948457 () Bool)

(assert (=> b!948457 (= e!533914 tp_is_empty!20711)))

(declare-fun b!948458 () Bool)

(assert (=> b!948458 (= e!533917 (and e!533918 mapRes!32957))))

(declare-fun condMapEmpty!32957 () Bool)

(declare-fun mapDefault!32957 () ValueCell!9874)

