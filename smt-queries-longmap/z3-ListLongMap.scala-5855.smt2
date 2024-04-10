; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75662 () Bool)

(assert start!75662)

(declare-fun b!889555 () Bool)

(declare-fun b_free!15633 () Bool)

(declare-fun b_next!15633 () Bool)

(assert (=> b!889555 (= b_free!15633 (not b_next!15633))))

(declare-fun tp!54868 () Bool)

(declare-fun b_and!25873 () Bool)

(assert (=> b!889555 (= tp!54868 b_and!25873)))

(declare-fun mapIsEmpty!28496 () Bool)

(declare-fun mapRes!28496 () Bool)

(assert (=> mapIsEmpty!28496 mapRes!28496))

(declare-fun b!889552 () Bool)

(declare-fun res!602848 () Bool)

(declare-fun e!495873 () Bool)

(assert (=> b!889552 (=> (not res!602848) (not e!495873))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!889552 (= res!602848 (not (= key!785 (bvneg key!785))))))

(declare-fun b!889553 () Bool)

(declare-fun e!495878 () Bool)

(declare-fun tp_is_empty!17961 () Bool)

(assert (=> b!889553 (= e!495878 tp_is_empty!17961)))

(declare-fun res!602847 () Bool)

(assert (=> start!75662 (=> (not res!602847) (not e!495873))))

(declare-datatypes ((array!51902 0))(
  ( (array!51903 (arr!24957 (Array (_ BitVec 32) (_ BitVec 64))) (size!25401 (_ BitVec 32))) )
))
(declare-datatypes ((V!28913 0))(
  ( (V!28914 (val!9031 Int)) )
))
(declare-datatypes ((ValueCell!8499 0))(
  ( (ValueCellFull!8499 (v!11509 V!28913)) (EmptyCell!8499) )
))
(declare-datatypes ((array!51904 0))(
  ( (array!51905 (arr!24958 (Array (_ BitVec 32) ValueCell!8499)) (size!25402 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4014 0))(
  ( (LongMapFixedSize!4015 (defaultEntry!5204 Int) (mask!25655 (_ BitVec 32)) (extraKeys!4898 (_ BitVec 32)) (zeroValue!5002 V!28913) (minValue!5002 V!28913) (_size!2062 (_ BitVec 32)) (_keys!9887 array!51902) (_values!5189 array!51904) (_vacant!2062 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4014)

(declare-fun valid!1561 (LongMapFixedSize!4014) Bool)

(assert (=> start!75662 (= res!602847 (valid!1561 thiss!1181))))

(assert (=> start!75662 e!495873))

(declare-fun e!495874 () Bool)

(assert (=> start!75662 e!495874))

(assert (=> start!75662 true))

(declare-fun b!889554 () Bool)

(declare-fun res!602846 () Bool)

(declare-fun e!495876 () Bool)

(assert (=> b!889554 (=> (not res!602846) (not e!495876))))

(assert (=> b!889554 (= res!602846 (and (= (size!25402 (_values!5189 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25655 thiss!1181))) (= (size!25401 (_keys!9887 thiss!1181)) (size!25402 (_values!5189 thiss!1181))) (bvsge (mask!25655 thiss!1181) #b00000000000000000000000000000000) (bvsge (extraKeys!4898 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!4898 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun e!495879 () Bool)

(declare-fun array_inv!19632 (array!51902) Bool)

(declare-fun array_inv!19633 (array!51904) Bool)

(assert (=> b!889555 (= e!495874 (and tp!54868 tp_is_empty!17961 (array_inv!19632 (_keys!9887 thiss!1181)) (array_inv!19633 (_values!5189 thiss!1181)) e!495879))))

(declare-fun b!889556 () Bool)

(assert (=> b!889556 (= e!495876 false)))

(declare-fun lt!402057 () Bool)

(declare-datatypes ((List!17704 0))(
  ( (Nil!17701) (Cons!17700 (h!18831 (_ BitVec 64)) (t!25003 List!17704)) )
))
(declare-fun arrayNoDuplicates!0 (array!51902 (_ BitVec 32) List!17704) Bool)

(assert (=> b!889556 (= lt!402057 (arrayNoDuplicates!0 (_keys!9887 thiss!1181) #b00000000000000000000000000000000 Nil!17701))))

(declare-fun b!889557 () Bool)

(assert (=> b!889557 (= e!495873 e!495876)))

(declare-fun res!602849 () Bool)

(assert (=> b!889557 (=> (not res!602849) (not e!495876))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!889557 (= res!602849 (validMask!0 (mask!25655 thiss!1181)))))

(declare-datatypes ((SeekEntryResult!8776 0))(
  ( (MissingZero!8776 (index!37475 (_ BitVec 32))) (Found!8776 (index!37476 (_ BitVec 32))) (Intermediate!8776 (undefined!9588 Bool) (index!37477 (_ BitVec 32)) (x!75528 (_ BitVec 32))) (Undefined!8776) (MissingVacant!8776 (index!37478 (_ BitVec 32))) )
))
(declare-fun lt!402058 () SeekEntryResult!8776)

(declare-fun seekEntry!0 ((_ BitVec 64) array!51902 (_ BitVec 32)) SeekEntryResult!8776)

(assert (=> b!889557 (= lt!402058 (seekEntry!0 key!785 (_keys!9887 thiss!1181) (mask!25655 thiss!1181)))))

(declare-fun b!889558 () Bool)

(declare-fun e!495875 () Bool)

(assert (=> b!889558 (= e!495875 tp_is_empty!17961)))

(declare-fun b!889559 () Bool)

(declare-fun res!602845 () Bool)

(assert (=> b!889559 (=> (not res!602845) (not e!495876))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51902 (_ BitVec 32)) Bool)

(assert (=> b!889559 (= res!602845 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9887 thiss!1181) (mask!25655 thiss!1181)))))

(declare-fun b!889560 () Bool)

(assert (=> b!889560 (= e!495879 (and e!495878 mapRes!28496))))

(declare-fun condMapEmpty!28496 () Bool)

(declare-fun mapDefault!28496 () ValueCell!8499)

(assert (=> b!889560 (= condMapEmpty!28496 (= (arr!24958 (_values!5189 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8499)) mapDefault!28496)))))

(declare-fun mapNonEmpty!28496 () Bool)

(declare-fun tp!54867 () Bool)

(assert (=> mapNonEmpty!28496 (= mapRes!28496 (and tp!54867 e!495875))))

(declare-fun mapValue!28496 () ValueCell!8499)

(declare-fun mapRest!28496 () (Array (_ BitVec 32) ValueCell!8499))

(declare-fun mapKey!28496 () (_ BitVec 32))

(assert (=> mapNonEmpty!28496 (= (arr!24958 (_values!5189 thiss!1181)) (store mapRest!28496 mapKey!28496 mapValue!28496))))

(assert (= (and start!75662 res!602847) b!889552))

(assert (= (and b!889552 res!602848) b!889557))

(assert (= (and b!889557 res!602849) b!889554))

(assert (= (and b!889554 res!602846) b!889559))

(assert (= (and b!889559 res!602845) b!889556))

(assert (= (and b!889560 condMapEmpty!28496) mapIsEmpty!28496))

(assert (= (and b!889560 (not condMapEmpty!28496)) mapNonEmpty!28496))

(get-info :version)

(assert (= (and mapNonEmpty!28496 ((_ is ValueCellFull!8499) mapValue!28496)) b!889558))

(assert (= (and b!889560 ((_ is ValueCellFull!8499) mapDefault!28496)) b!889553))

(assert (= b!889555 b!889560))

(assert (= start!75662 b!889555))

(declare-fun m!828421 () Bool)

(assert (=> b!889559 m!828421))

(declare-fun m!828423 () Bool)

(assert (=> b!889556 m!828423))

(declare-fun m!828425 () Bool)

(assert (=> mapNonEmpty!28496 m!828425))

(declare-fun m!828427 () Bool)

(assert (=> b!889557 m!828427))

(declare-fun m!828429 () Bool)

(assert (=> b!889557 m!828429))

(declare-fun m!828431 () Bool)

(assert (=> start!75662 m!828431))

(declare-fun m!828433 () Bool)

(assert (=> b!889555 m!828433))

(declare-fun m!828435 () Bool)

(assert (=> b!889555 m!828435))

(check-sat (not b!889556) (not b_next!15633) b_and!25873 (not b!889559) (not b!889555) (not b!889557) (not start!75662) tp_is_empty!17961 (not mapNonEmpty!28496))
(check-sat b_and!25873 (not b_next!15633))
