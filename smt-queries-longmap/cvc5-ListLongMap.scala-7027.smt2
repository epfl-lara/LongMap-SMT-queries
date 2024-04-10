; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89174 () Bool)

(assert start!89174)

(declare-fun b!1022438 () Bool)

(declare-fun b_free!20215 () Bool)

(declare-fun b_next!20215 () Bool)

(assert (=> b!1022438 (= b_free!20215 (not b_next!20215))))

(declare-fun tp!71680 () Bool)

(declare-fun b_and!32413 () Bool)

(assert (=> b!1022438 (= tp!71680 b_and!32413)))

(declare-fun mapIsEmpty!37320 () Bool)

(declare-fun mapRes!37320 () Bool)

(assert (=> mapIsEmpty!37320 mapRes!37320))

(declare-fun mapNonEmpty!37320 () Bool)

(declare-fun tp!71679 () Bool)

(declare-fun e!575973 () Bool)

(assert (=> mapNonEmpty!37320 (= mapRes!37320 (and tp!71679 e!575973))))

(declare-datatypes ((V!36787 0))(
  ( (V!36788 (val!12018 Int)) )
))
(declare-datatypes ((ValueCell!11264 0))(
  ( (ValueCellFull!11264 (v!14587 V!36787)) (EmptyCell!11264) )
))
(declare-fun mapValue!37320 () ValueCell!11264)

(declare-datatypes ((array!63914 0))(
  ( (array!63915 (arr!30769 (Array (_ BitVec 32) (_ BitVec 64))) (size!31280 (_ BitVec 32))) )
))
(declare-datatypes ((array!63916 0))(
  ( (array!63917 (arr!30770 (Array (_ BitVec 32) ValueCell!11264)) (size!31281 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5122 0))(
  ( (LongMapFixedSize!5123 (defaultEntry!5913 Int) (mask!29508 (_ BitVec 32)) (extraKeys!5645 (_ BitVec 32)) (zeroValue!5749 V!36787) (minValue!5749 V!36787) (_size!2616 (_ BitVec 32)) (_keys!11058 array!63914) (_values!5936 array!63916) (_vacant!2616 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5122)

(declare-fun mapRest!37320 () (Array (_ BitVec 32) ValueCell!11264))

(declare-fun mapKey!37320 () (_ BitVec 32))

(assert (=> mapNonEmpty!37320 (= (arr!30770 (_values!5936 thiss!1427)) (store mapRest!37320 mapKey!37320 mapValue!37320))))

(declare-fun b!1022435 () Bool)

(declare-fun e!575970 () Bool)

(declare-fun e!575972 () Bool)

(assert (=> b!1022435 (= e!575970 (and e!575972 mapRes!37320))))

(declare-fun condMapEmpty!37320 () Bool)

(declare-fun mapDefault!37320 () ValueCell!11264)

