; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90028 () Bool)

(assert start!90028)

(declare-fun b!1030961 () Bool)

(declare-fun b_free!20635 () Bool)

(declare-fun b_next!20635 () Bool)

(assert (=> b!1030961 (= b_free!20635 (not b_next!20635))))

(declare-fun tp!72976 () Bool)

(declare-fun b_and!33037 () Bool)

(assert (=> b!1030961 (= tp!72976 b_and!33037)))

(declare-fun b!1030957 () Bool)

(declare-fun res!689359 () Bool)

(declare-fun e!582234 () Bool)

(assert (=> b!1030957 (=> res!689359 e!582234)))

(declare-datatypes ((V!37347 0))(
  ( (V!37348 (val!12228 Int)) )
))
(declare-datatypes ((ValueCell!11474 0))(
  ( (ValueCellFull!11474 (v!14805 V!37347)) (EmptyCell!11474) )
))
(declare-datatypes ((Unit!33687 0))(
  ( (Unit!33688) )
))
(declare-datatypes ((array!64774 0))(
  ( (array!64775 (arr!31189 (Array (_ BitVec 32) (_ BitVec 64))) (size!31706 (_ BitVec 32))) )
))
(declare-datatypes ((array!64776 0))(
  ( (array!64777 (arr!31190 (Array (_ BitVec 32) ValueCell!11474)) (size!31707 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5542 0))(
  ( (LongMapFixedSize!5543 (defaultEntry!6145 Int) (mask!29933 (_ BitVec 32)) (extraKeys!5877 (_ BitVec 32)) (zeroValue!5981 V!37347) (minValue!5981 V!37347) (_size!2826 (_ BitVec 32)) (_keys!11318 array!64774) (_values!6168 array!64776) (_vacant!2826 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15614 0))(
  ( (tuple2!15615 (_1!7818 Unit!33687) (_2!7818 LongMapFixedSize!5542)) )
))
(declare-fun lt!454956 () tuple2!15614)

(assert (=> b!1030957 (= res!689359 (or (not (= (size!31707 (_values!6168 (_2!7818 lt!454956))) (bvadd #b00000000000000000000000000000001 (mask!29933 (_2!7818 lt!454956))))) (not (= (size!31706 (_keys!11318 (_2!7818 lt!454956))) (size!31707 (_values!6168 (_2!7818 lt!454956))))) (bvslt (mask!29933 (_2!7818 lt!454956)) #b00000000000000000000000000000000) (bvslt (extraKeys!5877 (_2!7818 lt!454956)) #b00000000000000000000000000000000) (bvsgt (extraKeys!5877 (_2!7818 lt!454956)) #b00000000000000000000000000000011)))))

(declare-fun b!1030958 () Bool)

(declare-fun res!689358 () Bool)

(assert (=> b!1030958 (=> res!689358 e!582234)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64774 (_ BitVec 32)) Bool)

(assert (=> b!1030958 (= res!689358 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11318 (_2!7818 lt!454956)) (mask!29933 (_2!7818 lt!454956)))))))

(declare-fun b!1030959 () Bool)

(declare-fun res!689362 () Bool)

(assert (=> b!1030959 (=> res!689362 e!582234)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1030959 (= res!689362 (not (validMask!0 (mask!29933 (_2!7818 lt!454956)))))))

(declare-fun res!689357 () Bool)

(declare-fun e!582231 () Bool)

(assert (=> start!90028 (=> (not res!689357) (not e!582231))))

(declare-fun thiss!1427 () LongMapFixedSize!5542)

(declare-fun valid!2098 (LongMapFixedSize!5542) Bool)

(assert (=> start!90028 (= res!689357 (valid!2098 thiss!1427))))

(assert (=> start!90028 e!582231))

(declare-fun e!582232 () Bool)

(assert (=> start!90028 e!582232))

(assert (=> start!90028 true))

(declare-fun b!1030960 () Bool)

(declare-fun e!582235 () Bool)

(declare-fun e!582236 () Bool)

(declare-fun mapRes!37986 () Bool)

(assert (=> b!1030960 (= e!582235 (and e!582236 mapRes!37986))))

(declare-fun condMapEmpty!37986 () Bool)

(declare-fun mapDefault!37986 () ValueCell!11474)

