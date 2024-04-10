; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90720 () Bool)

(assert start!90720)

(declare-fun b!1037356 () Bool)

(declare-fun b_free!20897 () Bool)

(declare-fun b_next!20897 () Bool)

(assert (=> b!1037356 (= b_free!20897 (not b_next!20897))))

(declare-fun tp!73836 () Bool)

(declare-fun b_and!33429 () Bool)

(assert (=> b!1037356 (= tp!73836 b_and!33429)))

(declare-fun b!1037354 () Bool)

(declare-fun e!586784 () Bool)

(declare-fun tp_is_empty!24617 () Bool)

(assert (=> b!1037354 (= e!586784 tp_is_empty!24617)))

(declare-fun mapIsEmpty!38454 () Bool)

(declare-fun mapRes!38454 () Bool)

(assert (=> mapIsEmpty!38454 mapRes!38454))

(declare-fun b!1037355 () Bool)

(declare-fun res!692151 () Bool)

(declare-fun e!586787 () Bool)

(assert (=> b!1037355 (=> (not res!692151) (not e!586787))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1037355 (= res!692151 (not (= key!909 (bvneg key!909))))))

(declare-fun e!586786 () Bool)

(declare-datatypes ((V!37695 0))(
  ( (V!37696 (val!12359 Int)) )
))
(declare-datatypes ((ValueCell!11605 0))(
  ( (ValueCellFull!11605 (v!14942 V!37695)) (EmptyCell!11605) )
))
(declare-datatypes ((array!65338 0))(
  ( (array!65339 (arr!31451 (Array (_ BitVec 32) (_ BitVec 64))) (size!31981 (_ BitVec 32))) )
))
(declare-datatypes ((array!65340 0))(
  ( (array!65341 (arr!31452 (Array (_ BitVec 32) ValueCell!11605)) (size!31982 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5804 0))(
  ( (LongMapFixedSize!5805 (defaultEntry!6284 Int) (mask!30201 (_ BitVec 32)) (extraKeys!6012 (_ BitVec 32)) (zeroValue!6118 V!37695) (minValue!6118 V!37695) (_size!2957 (_ BitVec 32)) (_keys!11480 array!65338) (_values!6307 array!65340) (_vacant!2957 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5804)

(declare-fun e!586783 () Bool)

(declare-fun array_inv!24327 (array!65338) Bool)

(declare-fun array_inv!24328 (array!65340) Bool)

(assert (=> b!1037356 (= e!586786 (and tp!73836 tp_is_empty!24617 (array_inv!24327 (_keys!11480 thiss!1427)) (array_inv!24328 (_values!6307 thiss!1427)) e!586783))))

(declare-fun b!1037357 () Bool)

(declare-fun e!586789 () Bool)

(assert (=> b!1037357 (= e!586787 e!586789)))

(declare-fun res!692149 () Bool)

(assert (=> b!1037357 (=> (not res!692149) (not e!586789))))

(declare-datatypes ((SeekEntryResult!9753 0))(
  ( (MissingZero!9753 (index!41383 (_ BitVec 32))) (Found!9753 (index!41384 (_ BitVec 32))) (Intermediate!9753 (undefined!10565 Bool) (index!41385 (_ BitVec 32)) (x!92536 (_ BitVec 32))) (Undefined!9753) (MissingVacant!9753 (index!41386 (_ BitVec 32))) )
))
(declare-fun lt!457469 () SeekEntryResult!9753)

(assert (=> b!1037357 (= res!692149 (is-Found!9753 lt!457469))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65338 (_ BitVec 32)) SeekEntryResult!9753)

(assert (=> b!1037357 (= lt!457469 (seekEntry!0 key!909 (_keys!11480 thiss!1427) (mask!30201 thiss!1427)))))

(declare-fun mapNonEmpty!38454 () Bool)

(declare-fun tp!73837 () Bool)

(assert (=> mapNonEmpty!38454 (= mapRes!38454 (and tp!73837 e!586784))))

(declare-fun mapRest!38454 () (Array (_ BitVec 32) ValueCell!11605))

(declare-fun mapValue!38454 () ValueCell!11605)

(declare-fun mapKey!38454 () (_ BitVec 32))

(assert (=> mapNonEmpty!38454 (= (arr!31452 (_values!6307 thiss!1427)) (store mapRest!38454 mapKey!38454 mapValue!38454))))

(declare-fun b!1037358 () Bool)

(declare-fun e!586788 () Bool)

(assert (=> b!1037358 (= e!586783 (and e!586788 mapRes!38454))))

(declare-fun condMapEmpty!38454 () Bool)

(declare-fun mapDefault!38454 () ValueCell!11605)

