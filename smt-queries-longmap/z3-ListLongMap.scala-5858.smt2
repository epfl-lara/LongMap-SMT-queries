; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75660 () Bool)

(assert start!75660)

(declare-fun b!889534 () Bool)

(declare-fun b_free!15649 () Bool)

(declare-fun b_next!15649 () Bool)

(assert (=> b!889534 (= b_free!15649 (not b_next!15649))))

(declare-fun tp!54916 () Bool)

(declare-fun b_and!25863 () Bool)

(assert (=> b!889534 (= tp!54916 b_and!25863)))

(declare-fun b!889529 () Bool)

(declare-fun e!495899 () Bool)

(declare-fun e!495897 () Bool)

(declare-fun mapRes!28520 () Bool)

(assert (=> b!889529 (= e!495899 (and e!495897 mapRes!28520))))

(declare-fun condMapEmpty!28520 () Bool)

(declare-datatypes ((array!51917 0))(
  ( (array!51918 (arr!24965 (Array (_ BitVec 32) (_ BitVec 64))) (size!25411 (_ BitVec 32))) )
))
(declare-datatypes ((V!28935 0))(
  ( (V!28936 (val!9039 Int)) )
))
(declare-datatypes ((ValueCell!8507 0))(
  ( (ValueCellFull!8507 (v!11511 V!28935)) (EmptyCell!8507) )
))
(declare-datatypes ((array!51919 0))(
  ( (array!51920 (arr!24966 (Array (_ BitVec 32) ValueCell!8507)) (size!25412 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4030 0))(
  ( (LongMapFixedSize!4031 (defaultEntry!5212 Int) (mask!25662 (_ BitVec 32)) (extraKeys!4906 (_ BitVec 32)) (zeroValue!5010 V!28935) (minValue!5010 V!28935) (_size!2070 (_ BitVec 32)) (_keys!9890 array!51917) (_values!5197 array!51919) (_vacant!2070 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4030)

(declare-fun mapDefault!28520 () ValueCell!8507)

(assert (=> b!889529 (= condMapEmpty!28520 (= (arr!24966 (_values!5197 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8507)) mapDefault!28520)))))

(declare-fun mapNonEmpty!28520 () Bool)

(declare-fun tp!54917 () Bool)

(declare-fun e!495896 () Bool)

(assert (=> mapNonEmpty!28520 (= mapRes!28520 (and tp!54917 e!495896))))

(declare-fun mapRest!28520 () (Array (_ BitVec 32) ValueCell!8507))

(declare-fun mapValue!28520 () ValueCell!8507)

(declare-fun mapKey!28520 () (_ BitVec 32))

(assert (=> mapNonEmpty!28520 (= (arr!24966 (_values!5197 thiss!1181)) (store mapRest!28520 mapKey!28520 mapValue!28520))))

(declare-fun b!889530 () Bool)

(declare-fun e!495893 () Bool)

(declare-fun e!495898 () Bool)

(assert (=> b!889530 (= e!495893 e!495898)))

(declare-fun res!602858 () Bool)

(assert (=> b!889530 (=> (not res!602858) (not e!495898))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!889530 (= res!602858 (validMask!0 (mask!25662 thiss!1181)))))

(declare-datatypes ((SeekEntryResult!8782 0))(
  ( (MissingZero!8782 (index!37499 (_ BitVec 32))) (Found!8782 (index!37500 (_ BitVec 32))) (Intermediate!8782 (undefined!9594 Bool) (index!37501 (_ BitVec 32)) (x!75553 (_ BitVec 32))) (Undefined!8782) (MissingVacant!8782 (index!37502 (_ BitVec 32))) )
))
(declare-fun lt!401870 () SeekEntryResult!8782)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!51917 (_ BitVec 32)) SeekEntryResult!8782)

(assert (=> b!889530 (= lt!401870 (seekEntry!0 key!785 (_keys!9890 thiss!1181) (mask!25662 thiss!1181)))))

(declare-fun b!889531 () Bool)

(declare-fun res!602857 () Bool)

(assert (=> b!889531 (=> (not res!602857) (not e!495898))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51917 (_ BitVec 32)) Bool)

(assert (=> b!889531 (= res!602857 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9890 thiss!1181) (mask!25662 thiss!1181)))))

(declare-fun b!889532 () Bool)

(declare-fun res!602859 () Bool)

(assert (=> b!889532 (=> (not res!602859) (not e!495898))))

(assert (=> b!889532 (= res!602859 (and (= (size!25412 (_values!5197 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25662 thiss!1181))) (= (size!25411 (_keys!9890 thiss!1181)) (size!25412 (_values!5197 thiss!1181))) (bvsge (mask!25662 thiss!1181) #b00000000000000000000000000000000) (bvsge (extraKeys!4906 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!4906 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun res!602856 () Bool)

(assert (=> start!75660 (=> (not res!602856) (not e!495893))))

(declare-fun valid!1577 (LongMapFixedSize!4030) Bool)

(assert (=> start!75660 (= res!602856 (valid!1577 thiss!1181))))

(assert (=> start!75660 e!495893))

(declare-fun e!495895 () Bool)

(assert (=> start!75660 e!495895))

(assert (=> start!75660 true))

(declare-fun b!889533 () Bool)

(declare-fun tp_is_empty!17977 () Bool)

(assert (=> b!889533 (= e!495896 tp_is_empty!17977)))

(declare-fun array_inv!19682 (array!51917) Bool)

(declare-fun array_inv!19683 (array!51919) Bool)

(assert (=> b!889534 (= e!495895 (and tp!54916 tp_is_empty!17977 (array_inv!19682 (_keys!9890 thiss!1181)) (array_inv!19683 (_values!5197 thiss!1181)) e!495899))))

(declare-fun mapIsEmpty!28520 () Bool)

(assert (=> mapIsEmpty!28520 mapRes!28520))

(declare-fun b!889535 () Bool)

(declare-fun res!602855 () Bool)

(assert (=> b!889535 (=> (not res!602855) (not e!495893))))

(assert (=> b!889535 (= res!602855 (not (= key!785 (bvneg key!785))))))

(declare-fun b!889536 () Bool)

(assert (=> b!889536 (= e!495897 tp_is_empty!17977)))

(declare-fun b!889537 () Bool)

(assert (=> b!889537 (= e!495898 false)))

(declare-fun lt!401869 () Bool)

(declare-datatypes ((List!17721 0))(
  ( (Nil!17718) (Cons!17717 (h!18848 (_ BitVec 64)) (t!25011 List!17721)) )
))
(declare-fun arrayNoDuplicates!0 (array!51917 (_ BitVec 32) List!17721) Bool)

(assert (=> b!889537 (= lt!401869 (arrayNoDuplicates!0 (_keys!9890 thiss!1181) #b00000000000000000000000000000000 Nil!17718))))

(assert (= (and start!75660 res!602856) b!889535))

(assert (= (and b!889535 res!602855) b!889530))

(assert (= (and b!889530 res!602858) b!889532))

(assert (= (and b!889532 res!602859) b!889531))

(assert (= (and b!889531 res!602857) b!889537))

(assert (= (and b!889529 condMapEmpty!28520) mapIsEmpty!28520))

(assert (= (and b!889529 (not condMapEmpty!28520)) mapNonEmpty!28520))

(get-info :version)

(assert (= (and mapNonEmpty!28520 ((_ is ValueCellFull!8507) mapValue!28520)) b!889533))

(assert (= (and b!889529 ((_ is ValueCellFull!8507) mapDefault!28520)) b!889536))

(assert (= b!889534 b!889529))

(assert (= start!75660 b!889534))

(declare-fun m!827791 () Bool)

(assert (=> b!889531 m!827791))

(declare-fun m!827793 () Bool)

(assert (=> b!889534 m!827793))

(declare-fun m!827795 () Bool)

(assert (=> b!889534 m!827795))

(declare-fun m!827797 () Bool)

(assert (=> b!889537 m!827797))

(declare-fun m!827799 () Bool)

(assert (=> b!889530 m!827799))

(declare-fun m!827801 () Bool)

(assert (=> b!889530 m!827801))

(declare-fun m!827803 () Bool)

(assert (=> start!75660 m!827803))

(declare-fun m!827805 () Bool)

(assert (=> mapNonEmpty!28520 m!827805))

(check-sat (not b_next!15649) (not b!889530) (not mapNonEmpty!28520) (not start!75660) tp_is_empty!17977 (not b!889531) b_and!25863 (not b!889537) (not b!889534))
(check-sat b_and!25863 (not b_next!15649))
