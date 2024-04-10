; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!91584 () Bool)

(assert start!91584)

(declare-fun b!1042928 () Bool)

(declare-fun b_free!21077 () Bool)

(declare-fun b_next!21077 () Bool)

(assert (=> b!1042928 (= b_free!21077 (not b_next!21077))))

(declare-fun tp!74463 () Bool)

(declare-fun b_and!33609 () Bool)

(assert (=> b!1042928 (= tp!74463 b_and!33609)))

(declare-fun mapIsEmpty!38810 () Bool)

(declare-fun mapRes!38810 () Bool)

(assert (=> mapIsEmpty!38810 mapRes!38810))

(declare-fun b!1042927 () Bool)

(declare-fun res!694872 () Bool)

(declare-fun e!590840 () Bool)

(assert (=> b!1042927 (=> res!694872 e!590840)))

(declare-datatypes ((V!37935 0))(
  ( (V!37936 (val!12449 Int)) )
))
(declare-datatypes ((ValueCell!11695 0))(
  ( (ValueCellFull!11695 (v!15040 V!37935)) (EmptyCell!11695) )
))
(declare-datatypes ((array!65752 0))(
  ( (array!65753 (arr!31631 (Array (_ BitVec 32) (_ BitVec 64))) (size!32166 (_ BitVec 32))) )
))
(declare-datatypes ((array!65754 0))(
  ( (array!65755 (arr!31632 (Array (_ BitVec 32) ValueCell!11695)) (size!32167 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5984 0))(
  ( (LongMapFixedSize!5985 (defaultEntry!6374 Int) (mask!30449 (_ BitVec 32)) (extraKeys!6102 (_ BitVec 32)) (zeroValue!6208 V!37935) (minValue!6208 V!37935) (_size!3047 (_ BitVec 32)) (_keys!11628 array!65752) (_values!6397 array!65754) (_vacant!3047 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5984)

(declare-datatypes ((List!21980 0))(
  ( (Nil!21977) (Cons!21976 (h!23184 (_ BitVec 64)) (t!31194 List!21980)) )
))
(declare-fun arrayNoDuplicates!0 (array!65752 (_ BitVec 32) List!21980) Bool)

(assert (=> b!1042927 (= res!694872 (not (arrayNoDuplicates!0 (_keys!11628 thiss!1427) #b00000000000000000000000000000000 Nil!21977)))))

(declare-fun e!590847 () Bool)

(declare-fun e!590843 () Bool)

(declare-fun tp_is_empty!24797 () Bool)

(declare-fun array_inv!24439 (array!65752) Bool)

(declare-fun array_inv!24440 (array!65754) Bool)

(assert (=> b!1042928 (= e!590843 (and tp!74463 tp_is_empty!24797 (array_inv!24439 (_keys!11628 thiss!1427)) (array_inv!24440 (_values!6397 thiss!1427)) e!590847))))

(declare-fun mapNonEmpty!38810 () Bool)

(declare-fun tp!74462 () Bool)

(declare-fun e!590841 () Bool)

(assert (=> mapNonEmpty!38810 (= mapRes!38810 (and tp!74462 e!590841))))

(declare-fun mapValue!38810 () ValueCell!11695)

(declare-fun mapKey!38810 () (_ BitVec 32))

(declare-fun mapRest!38810 () (Array (_ BitVec 32) ValueCell!11695))

(assert (=> mapNonEmpty!38810 (= (arr!31632 (_values!6397 thiss!1427)) (store mapRest!38810 mapKey!38810 mapValue!38810))))

(declare-fun b!1042929 () Bool)

(declare-fun res!694873 () Bool)

(assert (=> b!1042929 (=> res!694873 e!590840)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65752 (_ BitVec 32)) Bool)

(assert (=> b!1042929 (= res!694873 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11628 thiss!1427) (mask!30449 thiss!1427))))))

(declare-fun b!1042930 () Bool)

(declare-fun res!694871 () Bool)

(declare-fun e!590846 () Bool)

(assert (=> b!1042930 (=> (not res!694871) (not e!590846))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1042930 (= res!694871 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1042931 () Bool)

(declare-fun e!590842 () Bool)

(assert (=> b!1042931 (= e!590846 e!590842)))

(declare-fun res!694870 () Bool)

(assert (=> b!1042931 (=> (not res!694870) (not e!590842))))

(declare-datatypes ((SeekEntryResult!9822 0))(
  ( (MissingZero!9822 (index!41659 (_ BitVec 32))) (Found!9822 (index!41660 (_ BitVec 32))) (Intermediate!9822 (undefined!10634 Bool) (index!41661 (_ BitVec 32)) (x!93106 (_ BitVec 32))) (Undefined!9822) (MissingVacant!9822 (index!41662 (_ BitVec 32))) )
))
(declare-fun lt!459692 () SeekEntryResult!9822)

(assert (=> b!1042931 (= res!694870 (is-Found!9822 lt!459692))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65752 (_ BitVec 32)) SeekEntryResult!9822)

(assert (=> b!1042931 (= lt!459692 (seekEntry!0 key!909 (_keys!11628 thiss!1427) (mask!30449 thiss!1427)))))

(declare-fun b!1042932 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1042932 (= e!590840 (validKeyInArray!0 key!909))))

(declare-fun b!1042933 () Bool)

(declare-fun e!590845 () Bool)

(assert (=> b!1042933 (= e!590847 (and e!590845 mapRes!38810))))

(declare-fun condMapEmpty!38810 () Bool)

(declare-fun mapDefault!38810 () ValueCell!11695)

