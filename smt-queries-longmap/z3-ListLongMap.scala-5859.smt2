; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75852 () Bool)

(assert start!75852)

(declare-fun b!890760 () Bool)

(declare-fun b_free!15655 () Bool)

(declare-fun b_next!15655 () Bool)

(assert (=> b!890760 (= b_free!15655 (not b_next!15655))))

(declare-fun tp!54935 () Bool)

(declare-fun b_and!25905 () Bool)

(assert (=> b!890760 (= tp!54935 b_and!25905)))

(declare-fun b!890753 () Bool)

(declare-fun e!496687 () Bool)

(declare-fun e!496686 () Bool)

(declare-fun mapRes!28529 () Bool)

(assert (=> b!890753 (= e!496687 (and e!496686 mapRes!28529))))

(declare-fun condMapEmpty!28529 () Bool)

(declare-datatypes ((array!51985 0))(
  ( (array!51986 (arr!24994 (Array (_ BitVec 32) (_ BitVec 64))) (size!25439 (_ BitVec 32))) )
))
(declare-datatypes ((V!28943 0))(
  ( (V!28944 (val!9042 Int)) )
))
(declare-datatypes ((ValueCell!8510 0))(
  ( (ValueCellFull!8510 (v!11517 V!28943)) (EmptyCell!8510) )
))
(declare-datatypes ((array!51987 0))(
  ( (array!51988 (arr!24995 (Array (_ BitVec 32) ValueCell!8510)) (size!25440 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4036 0))(
  ( (LongMapFixedSize!4037 (defaultEntry!5215 Int) (mask!25717 (_ BitVec 32)) (extraKeys!4909 (_ BitVec 32)) (zeroValue!5013 V!28943) (minValue!5013 V!28943) (_size!2073 (_ BitVec 32)) (_keys!9926 array!51985) (_values!5200 array!51987) (_vacant!2073 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4036)

(declare-fun mapDefault!28529 () ValueCell!8510)

(assert (=> b!890753 (= condMapEmpty!28529 (= (arr!24995 (_values!5200 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8510)) mapDefault!28529)))))

(declare-fun mapNonEmpty!28529 () Bool)

(declare-fun tp!54934 () Bool)

(declare-fun e!496691 () Bool)

(assert (=> mapNonEmpty!28529 (= mapRes!28529 (and tp!54934 e!496691))))

(declare-fun mapRest!28529 () (Array (_ BitVec 32) ValueCell!8510))

(declare-fun mapValue!28529 () ValueCell!8510)

(declare-fun mapKey!28529 () (_ BitVec 32))

(assert (=> mapNonEmpty!28529 (= (arr!24995 (_values!5200 thiss!1181)) (store mapRest!28529 mapKey!28529 mapValue!28529))))

(declare-fun b!890754 () Bool)

(declare-fun tp_is_empty!17983 () Bool)

(assert (=> b!890754 (= e!496686 tp_is_empty!17983)))

(declare-fun b!890755 () Bool)

(declare-fun e!496688 () Bool)

(assert (=> b!890755 (= e!496688 false)))

(declare-fun lt!402485 () Bool)

(declare-datatypes ((List!17666 0))(
  ( (Nil!17663) (Cons!17662 (h!18799 (_ BitVec 64)) (t!24957 List!17666)) )
))
(declare-fun arrayNoDuplicates!0 (array!51985 (_ BitVec 32) List!17666) Bool)

(assert (=> b!890755 (= lt!402485 (arrayNoDuplicates!0 (_keys!9926 thiss!1181) #b00000000000000000000000000000000 Nil!17663))))

(declare-fun mapIsEmpty!28529 () Bool)

(assert (=> mapIsEmpty!28529 mapRes!28529))

(declare-fun b!890756 () Bool)

(declare-fun res!603355 () Bool)

(assert (=> b!890756 (=> (not res!603355) (not e!496688))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51985 (_ BitVec 32)) Bool)

(assert (=> b!890756 (= res!603355 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9926 thiss!1181) (mask!25717 thiss!1181)))))

(declare-fun b!890757 () Bool)

(declare-fun res!603356 () Bool)

(assert (=> b!890757 (=> (not res!603356) (not e!496688))))

(assert (=> b!890757 (= res!603356 (and (= (size!25440 (_values!5200 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25717 thiss!1181))) (= (size!25439 (_keys!9926 thiss!1181)) (size!25440 (_values!5200 thiss!1181))) (bvsge (mask!25717 thiss!1181) #b00000000000000000000000000000000) (bvsge (extraKeys!4909 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!4909 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!890758 () Bool)

(declare-fun e!496690 () Bool)

(assert (=> b!890758 (= e!496690 e!496688)))

(declare-fun res!603354 () Bool)

(assert (=> b!890758 (=> (not res!603354) (not e!496688))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!890758 (= res!603354 (validMask!0 (mask!25717 thiss!1181)))))

(declare-datatypes ((SeekEntryResult!8738 0))(
  ( (MissingZero!8738 (index!37323 (_ BitVec 32))) (Found!8738 (index!37324 (_ BitVec 32))) (Intermediate!8738 (undefined!9550 Bool) (index!37325 (_ BitVec 32)) (x!75536 (_ BitVec 32))) (Undefined!8738) (MissingVacant!8738 (index!37326 (_ BitVec 32))) )
))
(declare-fun lt!402484 () SeekEntryResult!8738)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!51985 (_ BitVec 32)) SeekEntryResult!8738)

(assert (=> b!890758 (= lt!402484 (seekEntry!0 key!785 (_keys!9926 thiss!1181) (mask!25717 thiss!1181)))))

(declare-fun b!890759 () Bool)

(declare-fun res!603357 () Bool)

(assert (=> b!890759 (=> (not res!603357) (not e!496690))))

(assert (=> b!890759 (= res!603357 (not (= key!785 (bvneg key!785))))))

(declare-fun e!496689 () Bool)

(declare-fun array_inv!19702 (array!51985) Bool)

(declare-fun array_inv!19703 (array!51987) Bool)

(assert (=> b!890760 (= e!496689 (and tp!54935 tp_is_empty!17983 (array_inv!19702 (_keys!9926 thiss!1181)) (array_inv!19703 (_values!5200 thiss!1181)) e!496687))))

(declare-fun res!603358 () Bool)

(assert (=> start!75852 (=> (not res!603358) (not e!496690))))

(declare-fun valid!1582 (LongMapFixedSize!4036) Bool)

(assert (=> start!75852 (= res!603358 (valid!1582 thiss!1181))))

(assert (=> start!75852 e!496690))

(assert (=> start!75852 e!496689))

(assert (=> start!75852 true))

(declare-fun b!890752 () Bool)

(assert (=> b!890752 (= e!496691 tp_is_empty!17983)))

(assert (= (and start!75852 res!603358) b!890759))

(assert (= (and b!890759 res!603357) b!890758))

(assert (= (and b!890758 res!603354) b!890757))

(assert (= (and b!890757 res!603356) b!890756))

(assert (= (and b!890756 res!603355) b!890755))

(assert (= (and b!890753 condMapEmpty!28529) mapIsEmpty!28529))

(assert (= (and b!890753 (not condMapEmpty!28529)) mapNonEmpty!28529))

(get-info :version)

(assert (= (and mapNonEmpty!28529 ((_ is ValueCellFull!8510) mapValue!28529)) b!890752))

(assert (= (and b!890753 ((_ is ValueCellFull!8510) mapDefault!28529)) b!890754))

(assert (= b!890760 b!890753))

(assert (= start!75852 b!890760))

(declare-fun m!829891 () Bool)

(assert (=> b!890755 m!829891))

(declare-fun m!829893 () Bool)

(assert (=> b!890758 m!829893))

(declare-fun m!829895 () Bool)

(assert (=> b!890758 m!829895))

(declare-fun m!829897 () Bool)

(assert (=> start!75852 m!829897))

(declare-fun m!829899 () Bool)

(assert (=> b!890756 m!829899))

(declare-fun m!829901 () Bool)

(assert (=> mapNonEmpty!28529 m!829901))

(declare-fun m!829903 () Bool)

(assert (=> b!890760 m!829903))

(declare-fun m!829905 () Bool)

(assert (=> b!890760 m!829905))

(check-sat (not mapNonEmpty!28529) (not b_next!15655) (not b!890758) tp_is_empty!17983 (not b!890756) b_and!25905 (not start!75852) (not b!890760) (not b!890755))
(check-sat b_and!25905 (not b_next!15655))
