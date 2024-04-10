; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90038 () Bool)

(assert start!90038)

(declare-fun b!1031140 () Bool)

(declare-fun b_free!20645 () Bool)

(declare-fun b_next!20645 () Bool)

(assert (=> b!1031140 (= b_free!20645 (not b_next!20645))))

(declare-fun tp!73006 () Bool)

(declare-fun b_and!33057 () Bool)

(assert (=> b!1031140 (= tp!73006 b_and!33057)))

(declare-fun b!1031132 () Bool)

(declare-fun res!689464 () Bool)

(declare-fun e!582351 () Bool)

(assert (=> b!1031132 (=> res!689464 e!582351)))

(declare-datatypes ((V!37359 0))(
  ( (V!37360 (val!12233 Int)) )
))
(declare-datatypes ((ValueCell!11479 0))(
  ( (ValueCellFull!11479 (v!14810 V!37359)) (EmptyCell!11479) )
))
(declare-datatypes ((Unit!33705 0))(
  ( (Unit!33706) )
))
(declare-datatypes ((array!64794 0))(
  ( (array!64795 (arr!31199 (Array (_ BitVec 32) (_ BitVec 64))) (size!31716 (_ BitVec 32))) )
))
(declare-datatypes ((array!64796 0))(
  ( (array!64797 (arr!31200 (Array (_ BitVec 32) ValueCell!11479)) (size!31717 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5552 0))(
  ( (LongMapFixedSize!5553 (defaultEntry!6150 Int) (mask!29940 (_ BitVec 32)) (extraKeys!5882 (_ BitVec 32)) (zeroValue!5986 V!37359) (minValue!5986 V!37359) (_size!2831 (_ BitVec 32)) (_keys!11323 array!64794) (_values!6173 array!64796) (_vacant!2831 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15632 0))(
  ( (tuple2!15633 (_1!7827 Unit!33705) (_2!7827 LongMapFixedSize!5552)) )
))
(declare-fun lt!455111 () tuple2!15632)

(assert (=> b!1031132 (= res!689464 (or (not (= (size!31717 (_values!6173 (_2!7827 lt!455111))) (bvadd #b00000000000000000000000000000001 (mask!29940 (_2!7827 lt!455111))))) (not (= (size!31716 (_keys!11323 (_2!7827 lt!455111))) (size!31717 (_values!6173 (_2!7827 lt!455111))))) (bvslt (mask!29940 (_2!7827 lt!455111)) #b00000000000000000000000000000000) (bvslt (extraKeys!5882 (_2!7827 lt!455111)) #b00000000000000000000000000000000) (bvsgt (extraKeys!5882 (_2!7827 lt!455111)) #b00000000000000000000000000000011)))))

(declare-fun res!689462 () Bool)

(declare-fun e!582356 () Bool)

(assert (=> start!90038 (=> (not res!689462) (not e!582356))))

(declare-fun thiss!1427 () LongMapFixedSize!5552)

(declare-fun valid!2103 (LongMapFixedSize!5552) Bool)

(assert (=> start!90038 (= res!689462 (valid!2103 thiss!1427))))

(assert (=> start!90038 e!582356))

(declare-fun e!582352 () Bool)

(assert (=> start!90038 e!582352))

(assert (=> start!90038 true))

(declare-fun b!1031133 () Bool)

(declare-fun res!689467 () Bool)

(assert (=> b!1031133 (=> res!689467 e!582351)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64794 (_ BitVec 32)) Bool)

(assert (=> b!1031133 (= res!689467 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11323 (_2!7827 lt!455111)) (mask!29940 (_2!7827 lt!455111)))))))

(declare-fun b!1031134 () Bool)

(assert (=> b!1031134 (= e!582351 true)))

(declare-fun lt!455104 () Bool)

(declare-datatypes ((List!21856 0))(
  ( (Nil!21853) (Cons!21852 (h!23054 (_ BitVec 64)) (t!30996 List!21856)) )
))
(declare-fun arrayNoDuplicates!0 (array!64794 (_ BitVec 32) List!21856) Bool)

(assert (=> b!1031134 (= lt!455104 (arrayNoDuplicates!0 (_keys!11323 (_2!7827 lt!455111)) #b00000000000000000000000000000000 Nil!21853))))

(declare-fun b!1031135 () Bool)

(declare-fun e!582355 () Bool)

(declare-fun e!582350 () Bool)

(declare-fun mapRes!38001 () Bool)

(assert (=> b!1031135 (= e!582355 (and e!582350 mapRes!38001))))

(declare-fun condMapEmpty!38001 () Bool)

(declare-fun mapDefault!38001 () ValueCell!11479)

