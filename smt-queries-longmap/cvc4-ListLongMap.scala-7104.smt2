; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90074 () Bool)

(assert start!90074)

(declare-fun b!1031774 () Bool)

(declare-fun b_free!20681 () Bool)

(declare-fun b_next!20681 () Bool)

(assert (=> b!1031774 (= b_free!20681 (not b_next!20681))))

(declare-fun tp!73113 () Bool)

(declare-fun b_and!33129 () Bool)

(assert (=> b!1031774 (= tp!73113 b_and!33129)))

(declare-fun b!1031770 () Bool)

(declare-datatypes ((Unit!33763 0))(
  ( (Unit!33764) )
))
(declare-fun e!582806 () Unit!33763)

(declare-fun Unit!33765 () Unit!33763)

(assert (=> b!1031770 (= e!582806 Unit!33765)))

(declare-fun lt!455669 () Unit!33763)

(declare-datatypes ((V!37407 0))(
  ( (V!37408 (val!12251 Int)) )
))
(declare-datatypes ((ValueCell!11497 0))(
  ( (ValueCellFull!11497 (v!14828 V!37407)) (EmptyCell!11497) )
))
(declare-datatypes ((array!64866 0))(
  ( (array!64867 (arr!31235 (Array (_ BitVec 32) (_ BitVec 64))) (size!31752 (_ BitVec 32))) )
))
(declare-datatypes ((array!64868 0))(
  ( (array!64869 (arr!31236 (Array (_ BitVec 32) ValueCell!11497)) (size!31753 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5588 0))(
  ( (LongMapFixedSize!5589 (defaultEntry!6168 Int) (mask!29970 (_ BitVec 32)) (extraKeys!5900 (_ BitVec 32)) (zeroValue!6004 V!37407) (minValue!6004 V!37407) (_size!2849 (_ BitVec 32)) (_keys!11341 array!64866) (_values!6191 array!64868) (_vacant!2849 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15688 0))(
  ( (tuple2!15689 (_1!7855 Unit!33763) (_2!7855 LongMapFixedSize!5588)) )
))
(declare-fun lt!455667 () tuple2!15688)

(declare-fun key!909 () (_ BitVec 64))

(declare-fun lemmaKeyInListMapIsInArray!345 (array!64866 array!64868 (_ BitVec 32) (_ BitVec 32) V!37407 V!37407 (_ BitVec 64) Int) Unit!33763)

(assert (=> b!1031770 (= lt!455669 (lemmaKeyInListMapIsInArray!345 (_keys!11341 (_2!7855 lt!455667)) (_values!6191 (_2!7855 lt!455667)) (mask!29970 (_2!7855 lt!455667)) (extraKeys!5900 (_2!7855 lt!455667)) (zeroValue!6004 (_2!7855 lt!455667)) (minValue!6004 (_2!7855 lt!455667)) key!909 (defaultEntry!6168 (_2!7855 lt!455667))))))

(declare-fun c!104247 () Bool)

(assert (=> b!1031770 (= c!104247 (and (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!909 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!689817 () Bool)

(declare-fun e!582799 () Bool)

(assert (=> b!1031770 (= res!689817 e!582799)))

(declare-fun e!582805 () Bool)

(assert (=> b!1031770 (=> (not res!689817) (not e!582805))))

(assert (=> b!1031770 e!582805))

(declare-fun mapIsEmpty!38055 () Bool)

(declare-fun mapRes!38055 () Bool)

(assert (=> mapIsEmpty!38055 mapRes!38055))

(declare-fun b!1031771 () Bool)

(assert (=> b!1031771 (= e!582805 false)))

(declare-fun mapNonEmpty!38055 () Bool)

(declare-fun tp!73114 () Bool)

(declare-fun e!582804 () Bool)

(assert (=> mapNonEmpty!38055 (= mapRes!38055 (and tp!73114 e!582804))))

(declare-fun mapValue!38055 () ValueCell!11497)

(declare-fun mapKey!38055 () (_ BitVec 32))

(declare-fun thiss!1427 () LongMapFixedSize!5588)

(declare-fun mapRest!38055 () (Array (_ BitVec 32) ValueCell!11497))

(assert (=> mapNonEmpty!38055 (= (arr!31236 (_values!6191 thiss!1427)) (store mapRest!38055 mapKey!38055 mapValue!38055))))

(declare-fun b!1031772 () Bool)

(declare-fun e!582798 () Bool)

(declare-fun e!582800 () Bool)

(assert (=> b!1031772 (= e!582798 e!582800)))

(declare-fun res!689818 () Bool)

(assert (=> b!1031772 (=> (not res!689818) (not e!582800))))

(declare-datatypes ((SeekEntryResult!9714 0))(
  ( (MissingZero!9714 (index!41227 (_ BitVec 32))) (Found!9714 (index!41228 (_ BitVec 32))) (Intermediate!9714 (undefined!10526 Bool) (index!41229 (_ BitVec 32)) (x!91896 (_ BitVec 32))) (Undefined!9714) (MissingVacant!9714 (index!41230 (_ BitVec 32))) )
))
(declare-fun lt!455666 () SeekEntryResult!9714)

(assert (=> b!1031772 (= res!689818 (is-Found!9714 lt!455666))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64866 (_ BitVec 32)) SeekEntryResult!9714)

(assert (=> b!1031772 (= lt!455666 (seekEntry!0 key!909 (_keys!11341 thiss!1427) (mask!29970 thiss!1427)))))

(declare-fun b!1031773 () Bool)

(assert (=> b!1031773 (= e!582799 (ite (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5900 (_2!7855 lt!455667)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5900 (_2!7855 lt!455667)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun tp_is_empty!24401 () Bool)

(declare-fun e!582802 () Bool)

(declare-fun e!582807 () Bool)

(declare-fun array_inv!24177 (array!64866) Bool)

(declare-fun array_inv!24178 (array!64868) Bool)

(assert (=> b!1031774 (= e!582807 (and tp!73113 tp_is_empty!24401 (array_inv!24177 (_keys!11341 thiss!1427)) (array_inv!24178 (_values!6191 thiss!1427)) e!582802))))

(declare-fun b!1031775 () Bool)

(declare-fun e!582803 () Bool)

(assert (=> b!1031775 (= e!582802 (and e!582803 mapRes!38055))))

(declare-fun condMapEmpty!38055 () Bool)

(declare-fun mapDefault!38055 () ValueCell!11497)

