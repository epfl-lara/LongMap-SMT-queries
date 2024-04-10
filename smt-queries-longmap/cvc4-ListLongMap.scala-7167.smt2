; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!91488 () Bool)

(assert start!91488)

(declare-fun b!1042298 () Bool)

(declare-fun b_free!21059 () Bool)

(declare-fun b_next!21059 () Bool)

(assert (=> b!1042298 (= b_free!21059 (not b_next!21059))))

(declare-fun tp!74400 () Bool)

(declare-fun b_and!33591 () Bool)

(assert (=> b!1042298 (= tp!74400 b_and!33591)))

(declare-fun b!1042296 () Bool)

(declare-fun e!590407 () Bool)

(declare-fun e!590406 () Bool)

(assert (=> b!1042296 (= e!590407 e!590406)))

(declare-fun res!694523 () Bool)

(assert (=> b!1042296 (=> (not res!694523) (not e!590406))))

(declare-datatypes ((SeekEntryResult!9815 0))(
  ( (MissingZero!9815 (index!41631 (_ BitVec 32))) (Found!9815 (index!41632 (_ BitVec 32))) (Intermediate!9815 (undefined!10627 Bool) (index!41633 (_ BitVec 32)) (x!93051 (_ BitVec 32))) (Undefined!9815) (MissingVacant!9815 (index!41634 (_ BitVec 32))) )
))
(declare-fun lt!459410 () SeekEntryResult!9815)

(assert (=> b!1042296 (= res!694523 (is-Found!9815 lt!459410))))

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((V!37911 0))(
  ( (V!37912 (val!12440 Int)) )
))
(declare-datatypes ((ValueCell!11686 0))(
  ( (ValueCellFull!11686 (v!15031 V!37911)) (EmptyCell!11686) )
))
(declare-datatypes ((array!65710 0))(
  ( (array!65711 (arr!31613 (Array (_ BitVec 32) (_ BitVec 64))) (size!32148 (_ BitVec 32))) )
))
(declare-datatypes ((array!65712 0))(
  ( (array!65713 (arr!31614 (Array (_ BitVec 32) ValueCell!11686)) (size!32149 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5966 0))(
  ( (LongMapFixedSize!5967 (defaultEntry!6365 Int) (mask!30422 (_ BitVec 32)) (extraKeys!6093 (_ BitVec 32)) (zeroValue!6199 V!37911) (minValue!6199 V!37911) (_size!3038 (_ BitVec 32)) (_keys!11613 array!65710) (_values!6388 array!65712) (_vacant!3038 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5966)

(declare-fun seekEntry!0 ((_ BitVec 64) array!65710 (_ BitVec 32)) SeekEntryResult!9815)

(assert (=> b!1042296 (= lt!459410 (seekEntry!0 key!909 (_keys!11613 thiss!1427) (mask!30422 thiss!1427)))))

(declare-fun b!1042297 () Bool)

(declare-fun res!694520 () Bool)

(declare-fun e!590410 () Bool)

(assert (=> b!1042297 (=> res!694520 e!590410)))

(assert (=> b!1042297 (= res!694520 (or (not (= (size!32149 (_values!6388 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30422 thiss!1427)))) (not (= (size!32148 (_keys!11613 thiss!1427)) (size!32149 (_values!6388 thiss!1427)))) (bvslt (mask!30422 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!6093 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!6093 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun e!590404 () Bool)

(declare-fun tp_is_empty!24779 () Bool)

(declare-fun e!590409 () Bool)

(declare-fun array_inv!24427 (array!65710) Bool)

(declare-fun array_inv!24428 (array!65712) Bool)

(assert (=> b!1042298 (= e!590404 (and tp!74400 tp_is_empty!24779 (array_inv!24427 (_keys!11613 thiss!1427)) (array_inv!24428 (_values!6388 thiss!1427)) e!590409))))

(declare-fun b!1042299 () Bool)

(declare-fun e!590403 () Bool)

(assert (=> b!1042299 (= e!590403 tp_is_empty!24779)))

(declare-fun mapNonEmpty!38774 () Bool)

(declare-fun mapRes!38774 () Bool)

(declare-fun tp!74399 () Bool)

(assert (=> mapNonEmpty!38774 (= mapRes!38774 (and tp!74399 e!590403))))

(declare-fun mapValue!38774 () ValueCell!11686)

(declare-fun mapKey!38774 () (_ BitVec 32))

(declare-fun mapRest!38774 () (Array (_ BitVec 32) ValueCell!11686))

(assert (=> mapNonEmpty!38774 (= (arr!31614 (_values!6388 thiss!1427)) (store mapRest!38774 mapKey!38774 mapValue!38774))))

(declare-fun b!1042300 () Bool)

(declare-fun e!590408 () Bool)

(assert (=> b!1042300 (= e!590409 (and e!590408 mapRes!38774))))

(declare-fun condMapEmpty!38774 () Bool)

(declare-fun mapDefault!38774 () ValueCell!11686)

