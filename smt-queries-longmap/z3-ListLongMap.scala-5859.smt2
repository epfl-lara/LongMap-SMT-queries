; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75686 () Bool)

(assert start!75686)

(declare-fun b!889879 () Bool)

(declare-fun b_free!15657 () Bool)

(declare-fun b_next!15657 () Bool)

(assert (=> b!889879 (= b_free!15657 (not b_next!15657))))

(declare-fun tp!54939 () Bool)

(declare-fun b_and!25897 () Bool)

(assert (=> b!889879 (= tp!54939 b_and!25897)))

(declare-fun b!889876 () Bool)

(declare-fun e!496127 () Bool)

(assert (=> b!889876 (= e!496127 false)))

(declare-fun lt!402130 () Bool)

(declare-datatypes ((array!51950 0))(
  ( (array!51951 (arr!24981 (Array (_ BitVec 32) (_ BitVec 64))) (size!25425 (_ BitVec 32))) )
))
(declare-datatypes ((V!28945 0))(
  ( (V!28946 (val!9043 Int)) )
))
(declare-datatypes ((ValueCell!8511 0))(
  ( (ValueCellFull!8511 (v!11521 V!28945)) (EmptyCell!8511) )
))
(declare-datatypes ((array!51952 0))(
  ( (array!51953 (arr!24982 (Array (_ BitVec 32) ValueCell!8511)) (size!25426 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4038 0))(
  ( (LongMapFixedSize!4039 (defaultEntry!5216 Int) (mask!25675 (_ BitVec 32)) (extraKeys!4910 (_ BitVec 32)) (zeroValue!5014 V!28945) (minValue!5014 V!28945) (_size!2074 (_ BitVec 32)) (_keys!9899 array!51950) (_values!5201 array!51952) (_vacant!2074 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4038)

(declare-datatypes ((List!17712 0))(
  ( (Nil!17709) (Cons!17708 (h!18839 (_ BitVec 64)) (t!25011 List!17712)) )
))
(declare-fun arrayNoDuplicates!0 (array!51950 (_ BitVec 32) List!17712) Bool)

(assert (=> b!889876 (= lt!402130 (arrayNoDuplicates!0 (_keys!9899 thiss!1181) #b00000000000000000000000000000000 Nil!17709))))

(declare-fun b!889877 () Bool)

(declare-fun e!496126 () Bool)

(declare-fun tp_is_empty!17985 () Bool)

(assert (=> b!889877 (= e!496126 tp_is_empty!17985)))

(declare-fun mapIsEmpty!28532 () Bool)

(declare-fun mapRes!28532 () Bool)

(assert (=> mapIsEmpty!28532 mapRes!28532))

(declare-fun b!889878 () Bool)

(declare-fun e!496130 () Bool)

(assert (=> b!889878 (= e!496130 e!496127)))

(declare-fun res!603028 () Bool)

(assert (=> b!889878 (=> (not res!603028) (not e!496127))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!889878 (= res!603028 (validMask!0 (mask!25675 thiss!1181)))))

(declare-datatypes ((SeekEntryResult!8785 0))(
  ( (MissingZero!8785 (index!37511 (_ BitVec 32))) (Found!8785 (index!37512 (_ BitVec 32))) (Intermediate!8785 (undefined!9597 Bool) (index!37513 (_ BitVec 32)) (x!75569 (_ BitVec 32))) (Undefined!8785) (MissingVacant!8785 (index!37514 (_ BitVec 32))) )
))
(declare-fun lt!402129 () SeekEntryResult!8785)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!51950 (_ BitVec 32)) SeekEntryResult!8785)

(assert (=> b!889878 (= lt!402129 (seekEntry!0 key!785 (_keys!9899 thiss!1181) (mask!25675 thiss!1181)))))

(declare-fun e!496125 () Bool)

(declare-fun e!496131 () Bool)

(declare-fun array_inv!19644 (array!51950) Bool)

(declare-fun array_inv!19645 (array!51952) Bool)

(assert (=> b!889879 (= e!496131 (and tp!54939 tp_is_empty!17985 (array_inv!19644 (_keys!9899 thiss!1181)) (array_inv!19645 (_values!5201 thiss!1181)) e!496125))))

(declare-fun res!603029 () Bool)

(assert (=> start!75686 (=> (not res!603029) (not e!496130))))

(declare-fun valid!1568 (LongMapFixedSize!4038) Bool)

(assert (=> start!75686 (= res!603029 (valid!1568 thiss!1181))))

(assert (=> start!75686 e!496130))

(assert (=> start!75686 e!496131))

(assert (=> start!75686 true))

(declare-fun b!889880 () Bool)

(declare-fun res!603025 () Bool)

(assert (=> b!889880 (=> (not res!603025) (not e!496130))))

(assert (=> b!889880 (= res!603025 (not (= key!785 (bvneg key!785))))))

(declare-fun b!889881 () Bool)

(declare-fun res!603026 () Bool)

(assert (=> b!889881 (=> (not res!603026) (not e!496127))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51950 (_ BitVec 32)) Bool)

(assert (=> b!889881 (= res!603026 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9899 thiss!1181) (mask!25675 thiss!1181)))))

(declare-fun b!889882 () Bool)

(declare-fun res!603027 () Bool)

(assert (=> b!889882 (=> (not res!603027) (not e!496127))))

(assert (=> b!889882 (= res!603027 (and (= (size!25426 (_values!5201 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25675 thiss!1181))) (= (size!25425 (_keys!9899 thiss!1181)) (size!25426 (_values!5201 thiss!1181))) (bvsge (mask!25675 thiss!1181) #b00000000000000000000000000000000) (bvsge (extraKeys!4910 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!4910 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!889883 () Bool)

(assert (=> b!889883 (= e!496125 (and e!496126 mapRes!28532))))

(declare-fun condMapEmpty!28532 () Bool)

(declare-fun mapDefault!28532 () ValueCell!8511)

(assert (=> b!889883 (= condMapEmpty!28532 (= (arr!24982 (_values!5201 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8511)) mapDefault!28532)))))

(declare-fun b!889884 () Bool)

(declare-fun e!496129 () Bool)

(assert (=> b!889884 (= e!496129 tp_is_empty!17985)))

(declare-fun mapNonEmpty!28532 () Bool)

(declare-fun tp!54940 () Bool)

(assert (=> mapNonEmpty!28532 (= mapRes!28532 (and tp!54940 e!496129))))

(declare-fun mapKey!28532 () (_ BitVec 32))

(declare-fun mapRest!28532 () (Array (_ BitVec 32) ValueCell!8511))

(declare-fun mapValue!28532 () ValueCell!8511)

(assert (=> mapNonEmpty!28532 (= (arr!24982 (_values!5201 thiss!1181)) (store mapRest!28532 mapKey!28532 mapValue!28532))))

(assert (= (and start!75686 res!603029) b!889880))

(assert (= (and b!889880 res!603025) b!889878))

(assert (= (and b!889878 res!603028) b!889882))

(assert (= (and b!889882 res!603027) b!889881))

(assert (= (and b!889881 res!603026) b!889876))

(assert (= (and b!889883 condMapEmpty!28532) mapIsEmpty!28532))

(assert (= (and b!889883 (not condMapEmpty!28532)) mapNonEmpty!28532))

(get-info :version)

(assert (= (and mapNonEmpty!28532 ((_ is ValueCellFull!8511) mapValue!28532)) b!889884))

(assert (= (and b!889883 ((_ is ValueCellFull!8511) mapDefault!28532)) b!889877))

(assert (= b!889879 b!889883))

(assert (= start!75686 b!889879))

(declare-fun m!828613 () Bool)

(assert (=> b!889879 m!828613))

(declare-fun m!828615 () Bool)

(assert (=> b!889879 m!828615))

(declare-fun m!828617 () Bool)

(assert (=> b!889878 m!828617))

(declare-fun m!828619 () Bool)

(assert (=> b!889878 m!828619))

(declare-fun m!828621 () Bool)

(assert (=> b!889881 m!828621))

(declare-fun m!828623 () Bool)

(assert (=> mapNonEmpty!28532 m!828623))

(declare-fun m!828625 () Bool)

(assert (=> start!75686 m!828625))

(declare-fun m!828627 () Bool)

(assert (=> b!889876 m!828627))

(check-sat (not b!889878) (not b_next!15657) (not b!889876) (not mapNonEmpty!28532) tp_is_empty!17985 b_and!25897 (not b!889879) (not start!75686) (not b!889881))
(check-sat b_and!25897 (not b_next!15657))
