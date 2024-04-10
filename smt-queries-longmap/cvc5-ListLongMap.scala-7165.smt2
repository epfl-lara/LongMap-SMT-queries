; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!91372 () Bool)

(assert start!91372)

(declare-fun b!1041629 () Bool)

(declare-fun b_free!21043 () Bool)

(declare-fun b_next!21043 () Bool)

(assert (=> b!1041629 (= b_free!21043 (not b_next!21043))))

(declare-fun tp!74344 () Bool)

(declare-fun b_and!33575 () Bool)

(assert (=> b!1041629 (= tp!74344 b_and!33575)))

(declare-fun tp_is_empty!24763 () Bool)

(declare-fun e!589925 () Bool)

(declare-fun e!589927 () Bool)

(declare-datatypes ((V!37891 0))(
  ( (V!37892 (val!12432 Int)) )
))
(declare-datatypes ((ValueCell!11678 0))(
  ( (ValueCellFull!11678 (v!15021 V!37891)) (EmptyCell!11678) )
))
(declare-datatypes ((array!65674 0))(
  ( (array!65675 (arr!31597 (Array (_ BitVec 32) (_ BitVec 64))) (size!32130 (_ BitVec 32))) )
))
(declare-datatypes ((array!65676 0))(
  ( (array!65677 (arr!31598 (Array (_ BitVec 32) ValueCell!11678)) (size!32131 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5950 0))(
  ( (LongMapFixedSize!5951 (defaultEntry!6357 Int) (mask!30392 (_ BitVec 32)) (extraKeys!6085 (_ BitVec 32)) (zeroValue!6191 V!37891) (minValue!6191 V!37891) (_size!3030 (_ BitVec 32)) (_keys!11595 array!65674) (_values!6380 array!65676) (_vacant!3030 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5950)

(declare-fun array_inv!24413 (array!65674) Bool)

(declare-fun array_inv!24414 (array!65676) Bool)

(assert (=> b!1041629 (= e!589927 (and tp!74344 tp_is_empty!24763 (array_inv!24413 (_keys!11595 thiss!1427)) (array_inv!24414 (_values!6380 thiss!1427)) e!589925))))

(declare-fun b!1041630 () Bool)

(declare-fun res!694217 () Bool)

(declare-fun e!589926 () Bool)

(assert (=> b!1041630 (=> (not res!694217) (not e!589926))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1041630 (= res!694217 (not (= key!909 (bvneg key!909))))))

(declare-fun res!694215 () Bool)

(assert (=> start!91372 (=> (not res!694215) (not e!589926))))

(declare-fun valid!2235 (LongMapFixedSize!5950) Bool)

(assert (=> start!91372 (= res!694215 (valid!2235 thiss!1427))))

(assert (=> start!91372 e!589926))

(assert (=> start!91372 e!589927))

(assert (=> start!91372 true))

(declare-fun b!1041631 () Bool)

(declare-fun e!589922 () Bool)

(assert (=> b!1041631 (= e!589926 e!589922)))

(declare-fun res!694218 () Bool)

(assert (=> b!1041631 (=> (not res!694218) (not e!589922))))

(declare-datatypes ((SeekEntryResult!9809 0))(
  ( (MissingZero!9809 (index!41607 (_ BitVec 32))) (Found!9809 (index!41608 (_ BitVec 32))) (Intermediate!9809 (undefined!10621 Bool) (index!41609 (_ BitVec 32)) (x!92995 (_ BitVec 32))) (Undefined!9809) (MissingVacant!9809 (index!41610 (_ BitVec 32))) )
))
(declare-fun lt!459104 () SeekEntryResult!9809)

(assert (=> b!1041631 (= res!694218 (is-Found!9809 lt!459104))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65674 (_ BitVec 32)) SeekEntryResult!9809)

(assert (=> b!1041631 (= lt!459104 (seekEntry!0 key!909 (_keys!11595 thiss!1427) (mask!30392 thiss!1427)))))

(declare-fun b!1041632 () Bool)

(declare-fun e!589921 () Bool)

(declare-fun mapRes!38742 () Bool)

(assert (=> b!1041632 (= e!589925 (and e!589921 mapRes!38742))))

(declare-fun condMapEmpty!38742 () Bool)

(declare-fun mapDefault!38742 () ValueCell!11678)

