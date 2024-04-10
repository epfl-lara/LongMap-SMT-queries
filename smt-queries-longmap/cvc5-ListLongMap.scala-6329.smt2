; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81540 () Bool)

(assert start!81540)

(declare-fun b!952685 () Bool)

(declare-fun b_free!18295 () Bool)

(declare-fun b_next!18295 () Bool)

(assert (=> b!952685 (= b_free!18295 (not b_next!18295))))

(declare-fun tp!63510 () Bool)

(declare-fun b_and!29777 () Bool)

(assert (=> b!952685 (= tp!63510 b_and!29777)))

(declare-fun b!952681 () Bool)

(declare-fun res!638185 () Bool)

(declare-fun e!536546 () Bool)

(assert (=> b!952681 (=> (not res!638185) (not e!536546))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!952681 (= res!638185 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!952682 () Bool)

(declare-fun e!536541 () Bool)

(declare-fun tp_is_empty!20803 () Bool)

(assert (=> b!952682 (= e!536541 tp_is_empty!20803)))

(declare-fun b!952683 () Bool)

(declare-fun e!536545 () Bool)

(declare-fun mapRes!33145 () Bool)

(assert (=> b!952683 (= e!536545 (and e!536541 mapRes!33145))))

(declare-fun condMapEmpty!33145 () Bool)

(declare-datatypes ((V!32703 0))(
  ( (V!32704 (val!10452 Int)) )
))
(declare-datatypes ((ValueCell!9920 0))(
  ( (ValueCellFull!9920 (v!13004 V!32703)) (EmptyCell!9920) )
))
(declare-datatypes ((array!57642 0))(
  ( (array!57643 (arr!27712 (Array (_ BitVec 32) ValueCell!9920)) (size!28191 (_ BitVec 32))) )
))
(declare-datatypes ((array!57644 0))(
  ( (array!57645 (arr!27713 (Array (_ BitVec 32) (_ BitVec 64))) (size!28192 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4990 0))(
  ( (LongMapFixedSize!4991 (defaultEntry!5828 Int) (mask!27682 (_ BitVec 32)) (extraKeys!5560 (_ BitVec 32)) (zeroValue!5664 V!32703) (minValue!5664 V!32703) (_size!2550 (_ BitVec 32)) (_keys!10784 array!57644) (_values!5851 array!57642) (_vacant!2550 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4990)

(declare-fun mapDefault!33145 () ValueCell!9920)

