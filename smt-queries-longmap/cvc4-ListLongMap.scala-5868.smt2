; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75742 () Bool)

(assert start!75742)

(declare-fun b!890630 () Bool)

(declare-fun b_free!15713 () Bool)

(declare-fun b_next!15713 () Bool)

(assert (=> b!890630 (= b_free!15713 (not b_next!15713))))

(declare-fun tp!55108 () Bool)

(declare-fun b_and!25953 () Bool)

(assert (=> b!890630 (= tp!55108 b_and!25953)))

(declare-datatypes ((array!52062 0))(
  ( (array!52063 (arr!25037 (Array (_ BitVec 32) (_ BitVec 64))) (size!25481 (_ BitVec 32))) )
))
(declare-datatypes ((V!29019 0))(
  ( (V!29020 (val!9071 Int)) )
))
(declare-datatypes ((ValueCell!8539 0))(
  ( (ValueCellFull!8539 (v!11549 V!29019)) (EmptyCell!8539) )
))
(declare-datatypes ((array!52064 0))(
  ( (array!52065 (arr!25038 (Array (_ BitVec 32) ValueCell!8539)) (size!25482 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4094 0))(
  ( (LongMapFixedSize!4095 (defaultEntry!5244 Int) (mask!25721 (_ BitVec 32)) (extraKeys!4938 (_ BitVec 32)) (zeroValue!5042 V!29019) (minValue!5042 V!29019) (_size!2102 (_ BitVec 32)) (_keys!9927 array!52062) (_values!5229 array!52064) (_vacant!2102 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4094)

(declare-fun e!496787 () Bool)

(declare-fun e!496785 () Bool)

(declare-fun tp_is_empty!18041 () Bool)

(declare-fun array_inv!19682 (array!52062) Bool)

(declare-fun array_inv!19683 (array!52064) Bool)

(assert (=> b!890630 (= e!496787 (and tp!55108 tp_is_empty!18041 (array_inv!19682 (_keys!9927 thiss!1181)) (array_inv!19683 (_values!5229 thiss!1181)) e!496785))))

(declare-fun b!890631 () Bool)

(declare-fun res!603447 () Bool)

(declare-fun e!496784 () Bool)

(assert (=> b!890631 (=> res!603447 e!496784)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52062 (_ BitVec 32)) Bool)

(assert (=> b!890631 (= res!603447 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9927 thiss!1181) (mask!25721 thiss!1181))))))

(declare-fun res!603449 () Bool)

(declare-fun e!496790 () Bool)

(assert (=> start!75742 (=> (not res!603449) (not e!496790))))

(declare-fun valid!1589 (LongMapFixedSize!4094) Bool)

(assert (=> start!75742 (= res!603449 (valid!1589 thiss!1181))))

(assert (=> start!75742 e!496790))

(assert (=> start!75742 e!496787))

(assert (=> start!75742 true))

(declare-fun mapIsEmpty!28616 () Bool)

(declare-fun mapRes!28616 () Bool)

(assert (=> mapIsEmpty!28616 mapRes!28616))

(declare-fun mapNonEmpty!28616 () Bool)

(declare-fun tp!55107 () Bool)

(declare-fun e!496789 () Bool)

(assert (=> mapNonEmpty!28616 (= mapRes!28616 (and tp!55107 e!496789))))

(declare-fun mapKey!28616 () (_ BitVec 32))

(declare-fun mapValue!28616 () ValueCell!8539)

(declare-fun mapRest!28616 () (Array (_ BitVec 32) ValueCell!8539))

(assert (=> mapNonEmpty!28616 (= (arr!25038 (_values!5229 thiss!1181)) (store mapRest!28616 mapKey!28616 mapValue!28616))))

(declare-fun b!890632 () Bool)

(assert (=> b!890632 (= e!496784 true)))

(declare-fun lt!402370 () Bool)

(declare-datatypes ((List!17723 0))(
  ( (Nil!17720) (Cons!17719 (h!18850 (_ BitVec 64)) (t!25022 List!17723)) )
))
(declare-fun arrayNoDuplicates!0 (array!52062 (_ BitVec 32) List!17723) Bool)

(assert (=> b!890632 (= lt!402370 (arrayNoDuplicates!0 (_keys!9927 thiss!1181) #b00000000000000000000000000000000 Nil!17720))))

(declare-fun b!890633 () Bool)

(assert (=> b!890633 (= e!496789 tp_is_empty!18041)))

(declare-fun b!890634 () Bool)

(declare-fun res!603443 () Bool)

(assert (=> b!890634 (=> res!603443 e!496784)))

(assert (=> b!890634 (= res!603443 (or (not (= (size!25482 (_values!5229 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25721 thiss!1181)))) (not (= (size!25481 (_keys!9927 thiss!1181)) (size!25482 (_values!5229 thiss!1181)))) (bvslt (mask!25721 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4938 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4938 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!890635 () Bool)

(declare-fun res!603446 () Bool)

(assert (=> b!890635 (=> (not res!603446) (not e!496790))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!890635 (= res!603446 (not (= key!785 (bvneg key!785))))))

(declare-fun b!890636 () Bool)

(declare-fun e!496783 () Bool)

(assert (=> b!890636 (= e!496783 tp_is_empty!18041)))

(declare-fun b!890637 () Bool)

(declare-fun e!496791 () Bool)

(declare-datatypes ((SeekEntryResult!8805 0))(
  ( (MissingZero!8805 (index!37591 (_ BitVec 32))) (Found!8805 (index!37592 (_ BitVec 32))) (Intermediate!8805 (undefined!9617 Bool) (index!37593 (_ BitVec 32)) (x!75661 (_ BitVec 32))) (Undefined!8805) (MissingVacant!8805 (index!37594 (_ BitVec 32))) )
))
(declare-fun lt!402368 () SeekEntryResult!8805)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!890637 (= e!496791 (inRange!0 (index!37592 lt!402368) (mask!25721 thiss!1181)))))

(declare-fun b!890638 () Bool)

(declare-fun e!496788 () Bool)

(assert (=> b!890638 (= e!496790 (not e!496788))))

(declare-fun res!603445 () Bool)

(assert (=> b!890638 (=> res!603445 e!496788)))

(assert (=> b!890638 (= res!603445 (not (is-Found!8805 lt!402368)))))

(assert (=> b!890638 e!496791))

(declare-fun res!603448 () Bool)

(assert (=> b!890638 (=> res!603448 e!496791)))

(assert (=> b!890638 (= res!603448 (not (is-Found!8805 lt!402368)))))

(declare-datatypes ((Unit!30310 0))(
  ( (Unit!30311) )
))
(declare-fun lt!402369 () Unit!30310)

(declare-fun lemmaSeekEntryGivesInRangeIndex!15 (array!52062 array!52064 (_ BitVec 32) (_ BitVec 32) V!29019 V!29019 (_ BitVec 64)) Unit!30310)

(assert (=> b!890638 (= lt!402369 (lemmaSeekEntryGivesInRangeIndex!15 (_keys!9927 thiss!1181) (_values!5229 thiss!1181) (mask!25721 thiss!1181) (extraKeys!4938 thiss!1181) (zeroValue!5042 thiss!1181) (minValue!5042 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52062 (_ BitVec 32)) SeekEntryResult!8805)

(assert (=> b!890638 (= lt!402368 (seekEntry!0 key!785 (_keys!9927 thiss!1181) (mask!25721 thiss!1181)))))

(declare-fun b!890639 () Bool)

(assert (=> b!890639 (= e!496788 e!496784)))

(declare-fun res!603444 () Bool)

(assert (=> b!890639 (=> res!603444 e!496784)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!890639 (= res!603444 (not (validMask!0 (mask!25721 thiss!1181))))))

(declare-fun arrayContainsKey!0 (array!52062 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!890639 (arrayContainsKey!0 (_keys!9927 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!402367 () Unit!30310)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52062 (_ BitVec 64) (_ BitVec 32)) Unit!30310)

(assert (=> b!890639 (= lt!402367 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9927 thiss!1181) key!785 (index!37592 lt!402368)))))

(declare-fun b!890640 () Bool)

(assert (=> b!890640 (= e!496785 (and e!496783 mapRes!28616))))

(declare-fun condMapEmpty!28616 () Bool)

(declare-fun mapDefault!28616 () ValueCell!8539)

