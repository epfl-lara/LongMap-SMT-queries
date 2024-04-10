; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89216 () Bool)

(assert start!89216)

(declare-fun b!1022926 () Bool)

(declare-fun b_free!20257 () Bool)

(declare-fun b_next!20257 () Bool)

(assert (=> b!1022926 (= b_free!20257 (not b_next!20257))))

(declare-fun tp!71806 () Bool)

(declare-fun b_and!32479 () Bool)

(assert (=> b!1022926 (= tp!71806 b_and!32479)))

(declare-fun b!1022924 () Bool)

(declare-fun e!576350 () Bool)

(declare-fun e!576348 () Bool)

(declare-fun mapRes!37383 () Bool)

(assert (=> b!1022924 (= e!576350 (and e!576348 mapRes!37383))))

(declare-fun condMapEmpty!37383 () Bool)

(declare-datatypes ((V!36843 0))(
  ( (V!36844 (val!12039 Int)) )
))
(declare-datatypes ((ValueCell!11285 0))(
  ( (ValueCellFull!11285 (v!14608 V!36843)) (EmptyCell!11285) )
))
(declare-datatypes ((array!63998 0))(
  ( (array!63999 (arr!30811 (Array (_ BitVec 32) (_ BitVec 64))) (size!31322 (_ BitVec 32))) )
))
(declare-datatypes ((array!64000 0))(
  ( (array!64001 (arr!30812 (Array (_ BitVec 32) ValueCell!11285)) (size!31323 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5164 0))(
  ( (LongMapFixedSize!5165 (defaultEntry!5934 Int) (mask!29543 (_ BitVec 32)) (extraKeys!5666 (_ BitVec 32)) (zeroValue!5770 V!36843) (minValue!5770 V!36843) (_size!2637 (_ BitVec 32)) (_keys!11079 array!63998) (_values!5957 array!64000) (_vacant!2637 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5164)

(declare-fun mapDefault!37383 () ValueCell!11285)

