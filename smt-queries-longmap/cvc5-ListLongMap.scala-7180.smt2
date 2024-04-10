; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!91892 () Bool)

(assert start!91892)

(declare-fun b!1045231 () Bool)

(declare-fun b_free!21133 () Bool)

(declare-fun b_next!21133 () Bool)

(assert (=> b!1045231 (= b_free!21133 (not b_next!21133))))

(declare-fun tp!74655 () Bool)

(declare-fun b_and!33745 () Bool)

(assert (=> b!1045231 (= tp!74655 b_and!33745)))

(declare-fun b!1045230 () Bool)

(declare-fun e!592461 () Bool)

(declare-datatypes ((V!38011 0))(
  ( (V!38012 (val!12477 Int)) )
))
(declare-datatypes ((ValueCell!11723 0))(
  ( (ValueCellFull!11723 (v!15072 V!38011)) (EmptyCell!11723) )
))
(declare-datatypes ((Unit!34137 0))(
  ( (Unit!34138) )
))
(declare-datatypes ((array!65880 0))(
  ( (array!65881 (arr!31687 (Array (_ BitVec 32) (_ BitVec 64))) (size!32222 (_ BitVec 32))) )
))
(declare-datatypes ((array!65882 0))(
  ( (array!65883 (arr!31688 (Array (_ BitVec 32) ValueCell!11723)) (size!32223 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6040 0))(
  ( (LongMapFixedSize!6041 (defaultEntry!6414 Int) (mask!30539 (_ BitVec 32)) (extraKeys!6142 (_ BitVec 32)) (zeroValue!6248 V!38011) (minValue!6248 V!38011) (_size!3075 (_ BitVec 32)) (_keys!11684 array!65880) (_values!6437 array!65882) (_vacant!3075 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15782 0))(
  ( (tuple2!15783 (_1!7902 Unit!34137) (_2!7902 LongMapFixedSize!6040)) )
))
(declare-fun lt!461353 () tuple2!15782)

(assert (=> b!1045230 (= e!592461 (or (not (= (size!32223 (_values!6437 (_2!7902 lt!461353))) (bvadd #b00000000000000000000000000000001 (mask!30539 (_2!7902 lt!461353))))) (not (= (size!32222 (_keys!11684 (_2!7902 lt!461353))) (size!32223 (_values!6437 (_2!7902 lt!461353))))) (bvslt (mask!30539 (_2!7902 lt!461353)) #b00000000000000000000000000000000) (bvsge (extraKeys!6142 (_2!7902 lt!461353)) #b00000000000000000000000000000000)))))

(declare-fun e!592463 () Bool)

(declare-fun thiss!1427 () LongMapFixedSize!6040)

(declare-fun e!592458 () Bool)

(declare-fun tp_is_empty!24853 () Bool)

(declare-fun array_inv!24475 (array!65880) Bool)

(declare-fun array_inv!24476 (array!65882) Bool)

(assert (=> b!1045231 (= e!592463 (and tp!74655 tp_is_empty!24853 (array_inv!24475 (_keys!11684 thiss!1427)) (array_inv!24476 (_values!6437 thiss!1427)) e!592458))))

(declare-fun b!1045232 () Bool)

(declare-fun e!592460 () Bool)

(assert (=> b!1045232 (= e!592460 tp_is_empty!24853)))

(declare-fun b!1045233 () Bool)

(declare-fun mapRes!38918 () Bool)

(assert (=> b!1045233 (= e!592458 (and e!592460 mapRes!38918))))

(declare-fun condMapEmpty!38918 () Bool)

(declare-fun mapDefault!38918 () ValueCell!11723)

