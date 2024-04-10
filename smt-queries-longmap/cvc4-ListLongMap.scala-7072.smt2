; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89490 () Bool)

(assert start!89490)

(declare-fun b!1026285 () Bool)

(declare-fun b_free!20489 () Bool)

(declare-fun b_next!20489 () Bool)

(assert (=> b!1026285 (= b_free!20489 (not b_next!20489))))

(declare-fun tp!72513 () Bool)

(declare-fun b_and!32735 () Bool)

(assert (=> b!1026285 (= tp!72513 b_and!32735)))

(declare-fun b!1026283 () Bool)

(declare-fun e!578921 () Bool)

(assert (=> b!1026283 (= e!578921 true)))

(declare-fun lt!451451 () Bool)

(declare-datatypes ((V!37151 0))(
  ( (V!37152 (val!12155 Int)) )
))
(declare-datatypes ((ValueCell!11401 0))(
  ( (ValueCellFull!11401 (v!14724 V!37151)) (EmptyCell!11401) )
))
(declare-datatypes ((array!64468 0))(
  ( (array!64469 (arr!31043 (Array (_ BitVec 32) (_ BitVec 64))) (size!31556 (_ BitVec 32))) )
))
(declare-datatypes ((array!64470 0))(
  ( (array!64471 (arr!31044 (Array (_ BitVec 32) ValueCell!11401)) (size!31557 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5396 0))(
  ( (LongMapFixedSize!5397 (defaultEntry!6050 Int) (mask!29740 (_ BitVec 32)) (extraKeys!5782 (_ BitVec 32)) (zeroValue!5886 V!37151) (minValue!5886 V!37151) (_size!2753 (_ BitVec 32)) (_keys!11197 array!64468) (_values!6073 array!64470) (_vacant!2753 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5396)

(declare-datatypes ((List!21776 0))(
  ( (Nil!21773) (Cons!21772 (h!22970 (_ BitVec 64)) (t!30838 List!21776)) )
))
(declare-fun arrayNoDuplicates!0 (array!64468 (_ BitVec 32) List!21776) Bool)

(assert (=> b!1026283 (= lt!451451 (arrayNoDuplicates!0 (_keys!11197 thiss!1427) #b00000000000000000000000000000000 Nil!21773))))

(declare-fun b!1026284 () Bool)

(declare-fun e!578922 () Bool)

(declare-fun e!578920 () Bool)

(declare-fun mapRes!37742 () Bool)

(assert (=> b!1026284 (= e!578922 (and e!578920 mapRes!37742))))

(declare-fun condMapEmpty!37742 () Bool)

(declare-fun mapDefault!37742 () ValueCell!11401)

