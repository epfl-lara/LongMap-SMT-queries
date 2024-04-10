; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80514 () Bool)

(assert start!80514)

(declare-fun b!945506 () Bool)

(declare-fun b_free!18101 () Bool)

(declare-fun b_next!18101 () Bool)

(assert (=> b!945506 (= b_free!18101 (not b_next!18101))))

(declare-fun tp!62820 () Bool)

(declare-fun b_and!29523 () Bool)

(assert (=> b!945506 (= tp!62820 b_and!29523)))

(declare-fun b!945502 () Bool)

(declare-fun e!531815 () Bool)

(declare-fun tp_is_empty!20609 () Bool)

(assert (=> b!945502 (= e!531815 tp_is_empty!20609)))

(declare-fun b!945503 () Bool)

(declare-fun res!635010 () Bool)

(declare-fun e!531813 () Bool)

(assert (=> b!945503 (=> (not res!635010) (not e!531813))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!945503 (= res!635010 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!635009 () Bool)

(assert (=> start!80514 (=> (not res!635009) (not e!531813))))

(declare-datatypes ((V!32443 0))(
  ( (V!32444 (val!10355 Int)) )
))
(declare-datatypes ((ValueCell!9823 0))(
  ( (ValueCellFull!9823 (v!12889 V!32443)) (EmptyCell!9823) )
))
(declare-datatypes ((array!57190 0))(
  ( (array!57191 (arr!27518 (Array (_ BitVec 32) ValueCell!9823)) (size!27986 (_ BitVec 32))) )
))
(declare-datatypes ((array!57192 0))(
  ( (array!57193 (arr!27519 (Array (_ BitVec 32) (_ BitVec 64))) (size!27987 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4796 0))(
  ( (LongMapFixedSize!4797 (defaultEntry!5695 Int) (mask!27363 (_ BitVec 32)) (extraKeys!5427 (_ BitVec 32)) (zeroValue!5531 V!32443) (minValue!5531 V!32443) (_size!2453 (_ BitVec 32)) (_keys!10575 array!57192) (_values!5718 array!57190) (_vacant!2453 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4796)

(declare-fun valid!1833 (LongMapFixedSize!4796) Bool)

(assert (=> start!80514 (= res!635009 (valid!1833 thiss!1141))))

(assert (=> start!80514 e!531813))

(declare-fun e!531816 () Bool)

(assert (=> start!80514 e!531816))

(assert (=> start!80514 true))

(declare-fun b!945504 () Bool)

(declare-datatypes ((SeekEntryResult!9087 0))(
  ( (MissingZero!9087 (index!38719 (_ BitVec 32))) (Found!9087 (index!38720 (_ BitVec 32))) (Intermediate!9087 (undefined!9899 Bool) (index!38721 (_ BitVec 32)) (x!81234 (_ BitVec 32))) (Undefined!9087) (MissingVacant!9087 (index!38722 (_ BitVec 32))) )
))
(declare-fun lt!426033 () SeekEntryResult!9087)

(assert (=> b!945504 (= e!531813 (and (is-Found!9087 lt!426033) (bvslt (index!38720 lt!426033) #b00000000000000000000000000000000)))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!57192 (_ BitVec 32)) SeekEntryResult!9087)

(assert (=> b!945504 (= lt!426033 (seekEntry!0 key!756 (_keys!10575 thiss!1141) (mask!27363 thiss!1141)))))

(declare-fun mapNonEmpty!32747 () Bool)

(declare-fun mapRes!32747 () Bool)

(declare-fun tp!62821 () Bool)

(declare-fun e!531818 () Bool)

(assert (=> mapNonEmpty!32747 (= mapRes!32747 (and tp!62821 e!531818))))

(declare-fun mapValue!32747 () ValueCell!9823)

(declare-fun mapKey!32747 () (_ BitVec 32))

(declare-fun mapRest!32747 () (Array (_ BitVec 32) ValueCell!9823))

(assert (=> mapNonEmpty!32747 (= (arr!27518 (_values!5718 thiss!1141)) (store mapRest!32747 mapKey!32747 mapValue!32747))))

(declare-fun mapIsEmpty!32747 () Bool)

(assert (=> mapIsEmpty!32747 mapRes!32747))

(declare-fun b!945505 () Bool)

(declare-fun e!531817 () Bool)

(assert (=> b!945505 (= e!531817 (and e!531815 mapRes!32747))))

(declare-fun condMapEmpty!32747 () Bool)

(declare-fun mapDefault!32747 () ValueCell!9823)

