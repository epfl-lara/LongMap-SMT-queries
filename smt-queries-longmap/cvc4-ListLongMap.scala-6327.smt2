; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81482 () Bool)

(assert start!81482)

(declare-fun b!952265 () Bool)

(declare-fun b_free!18287 () Bool)

(declare-fun b_next!18287 () Bool)

(assert (=> b!952265 (= b_free!18287 (not b_next!18287))))

(declare-fun tp!63479 () Bool)

(declare-fun b_and!29765 () Bool)

(assert (=> b!952265 (= tp!63479 b_and!29765)))

(declare-fun res!637992 () Bool)

(declare-fun e!536285 () Bool)

(assert (=> start!81482 (=> (not res!637992) (not e!536285))))

(declare-datatypes ((V!32691 0))(
  ( (V!32692 (val!10448 Int)) )
))
(declare-datatypes ((ValueCell!9916 0))(
  ( (ValueCellFull!9916 (v!12998 V!32691)) (EmptyCell!9916) )
))
(declare-datatypes ((array!57622 0))(
  ( (array!57623 (arr!27704 (Array (_ BitVec 32) ValueCell!9916)) (size!28183 (_ BitVec 32))) )
))
(declare-datatypes ((array!57624 0))(
  ( (array!57625 (arr!27705 (Array (_ BitVec 32) (_ BitVec 64))) (size!28184 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4982 0))(
  ( (LongMapFixedSize!4983 (defaultEntry!5820 Int) (mask!27662 (_ BitVec 32)) (extraKeys!5552 (_ BitVec 32)) (zeroValue!5656 V!32691) (minValue!5656 V!32691) (_size!2546 (_ BitVec 32)) (_keys!10772 array!57624) (_values!5843 array!57622) (_vacant!2546 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4982)

(declare-fun valid!1896 (LongMapFixedSize!4982) Bool)

(assert (=> start!81482 (= res!637992 (valid!1896 thiss!1141))))

(assert (=> start!81482 e!536285))

(declare-fun e!536284 () Bool)

(assert (=> start!81482 e!536284))

(assert (=> start!81482 true))

(declare-fun b!952262 () Bool)

(declare-fun e!536288 () Bool)

(declare-fun tp_is_empty!20795 () Bool)

(assert (=> b!952262 (= e!536288 tp_is_empty!20795)))

(declare-fun b!952263 () Bool)

(declare-fun e!536283 () Bool)

(declare-fun mapRes!33127 () Bool)

(assert (=> b!952263 (= e!536283 (and e!536288 mapRes!33127))))

(declare-fun condMapEmpty!33127 () Bool)

(declare-fun mapDefault!33127 () ValueCell!9916)

