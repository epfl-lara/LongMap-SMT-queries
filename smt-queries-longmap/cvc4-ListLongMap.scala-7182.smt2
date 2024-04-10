; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!91976 () Bool)

(assert start!91976)

(declare-fun b!1045918 () Bool)

(declare-fun b_free!21149 () Bool)

(declare-fun b_next!21149 () Bool)

(assert (=> b!1045918 (= b_free!21149 (not b_next!21149))))

(declare-fun tp!74708 () Bool)

(declare-fun b_and!33793 () Bool)

(assert (=> b!1045918 (= tp!74708 b_and!33793)))

(declare-fun b!1045914 () Bool)

(declare-fun res!696339 () Bool)

(declare-fun e!592939 () Bool)

(assert (=> b!1045914 (=> res!696339 e!592939)))

(declare-datatypes ((V!38031 0))(
  ( (V!38032 (val!12485 Int)) )
))
(declare-datatypes ((ValueCell!11731 0))(
  ( (ValueCellFull!11731 (v!15082 V!38031)) (EmptyCell!11731) )
))
(declare-datatypes ((Unit!34167 0))(
  ( (Unit!34168) )
))
(declare-datatypes ((array!65916 0))(
  ( (array!65917 (arr!31703 (Array (_ BitVec 32) (_ BitVec 64))) (size!32238 (_ BitVec 32))) )
))
(declare-datatypes ((array!65918 0))(
  ( (array!65919 (arr!31704 (Array (_ BitVec 32) ValueCell!11731)) (size!32239 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6056 0))(
  ( (LongMapFixedSize!6057 (defaultEntry!6426 Int) (mask!30563 (_ BitVec 32)) (extraKeys!6154 (_ BitVec 32)) (zeroValue!6260 V!38031) (minValue!6260 V!38031) (_size!3083 (_ BitVec 32)) (_keys!11700 array!65916) (_values!6449 array!65918) (_vacant!3083 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15804 0))(
  ( (tuple2!15805 (_1!7913 Unit!34167) (_2!7913 LongMapFixedSize!6056)) )
))
(declare-fun lt!461893 () tuple2!15804)

(assert (=> b!1045914 (= res!696339 (or (not (= (size!32239 (_values!6449 (_2!7913 lt!461893))) (bvadd #b00000000000000000000000000000001 (mask!30563 (_2!7913 lt!461893))))) (not (= (size!32238 (_keys!11700 (_2!7913 lt!461893))) (size!32239 (_values!6449 (_2!7913 lt!461893))))) (bvslt (mask!30563 (_2!7913 lt!461893)) #b00000000000000000000000000000000) (bvslt (extraKeys!6154 (_2!7913 lt!461893)) #b00000000000000000000000000000000) (bvsgt (extraKeys!6154 (_2!7913 lt!461893)) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!38948 () Bool)

(declare-fun mapRes!38948 () Bool)

(assert (=> mapIsEmpty!38948 mapRes!38948))

(declare-fun b!1045916 () Bool)

(declare-fun e!592936 () Bool)

(declare-fun e!592935 () Bool)

(assert (=> b!1045916 (= e!592936 (and e!592935 mapRes!38948))))

(declare-fun condMapEmpty!38948 () Bool)

(declare-fun thiss!1427 () LongMapFixedSize!6056)

(declare-fun mapDefault!38948 () ValueCell!11731)

