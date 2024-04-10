; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!91972 () Bool)

(assert start!91972)

(declare-fun b!1045851 () Bool)

(declare-fun b_free!21145 () Bool)

(declare-fun b_next!21145 () Bool)

(assert (=> b!1045851 (= b_free!21145 (not b_next!21145))))

(declare-fun tp!74697 () Bool)

(declare-fun b_and!33785 () Bool)

(assert (=> b!1045851 (= tp!74697 b_and!33785)))

(declare-fun b!1045850 () Bool)

(declare-fun e!592893 () Bool)

(declare-fun e!592890 () Bool)

(declare-fun mapRes!38942 () Bool)

(assert (=> b!1045850 (= e!592893 (and e!592890 mapRes!38942))))

(declare-fun condMapEmpty!38942 () Bool)

(declare-datatypes ((V!38027 0))(
  ( (V!38028 (val!12483 Int)) )
))
(declare-datatypes ((ValueCell!11729 0))(
  ( (ValueCellFull!11729 (v!15080 V!38027)) (EmptyCell!11729) )
))
(declare-datatypes ((array!65908 0))(
  ( (array!65909 (arr!31699 (Array (_ BitVec 32) (_ BitVec 64))) (size!32234 (_ BitVec 32))) )
))
(declare-datatypes ((array!65910 0))(
  ( (array!65911 (arr!31700 (Array (_ BitVec 32) ValueCell!11729)) (size!32235 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6052 0))(
  ( (LongMapFixedSize!6053 (defaultEntry!6424 Int) (mask!30561 (_ BitVec 32)) (extraKeys!6152 (_ BitVec 32)) (zeroValue!6258 V!38027) (minValue!6258 V!38027) (_size!3081 (_ BitVec 32)) (_keys!11698 array!65908) (_values!6447 array!65910) (_vacant!3081 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!6052)

(declare-fun mapDefault!38942 () ValueCell!11729)

