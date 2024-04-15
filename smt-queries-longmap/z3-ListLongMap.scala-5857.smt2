; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75654 () Bool)

(assert start!75654)

(declare-fun b!889456 () Bool)

(declare-fun b_free!15643 () Bool)

(declare-fun b_next!15643 () Bool)

(assert (=> b!889456 (= b_free!15643 (not b_next!15643))))

(declare-fun tp!54898 () Bool)

(declare-fun b_and!25857 () Bool)

(assert (=> b!889456 (= tp!54898 b_and!25857)))

(declare-fun b!889448 () Bool)

(declare-fun e!495835 () Bool)

(declare-fun e!495836 () Bool)

(declare-fun mapRes!28511 () Bool)

(assert (=> b!889448 (= e!495835 (and e!495836 mapRes!28511))))

(declare-fun condMapEmpty!28511 () Bool)

(declare-datatypes ((array!51905 0))(
  ( (array!51906 (arr!24959 (Array (_ BitVec 32) (_ BitVec 64))) (size!25405 (_ BitVec 32))) )
))
(declare-datatypes ((V!28927 0))(
  ( (V!28928 (val!9036 Int)) )
))
(declare-datatypes ((ValueCell!8504 0))(
  ( (ValueCellFull!8504 (v!11508 V!28927)) (EmptyCell!8504) )
))
(declare-datatypes ((array!51907 0))(
  ( (array!51908 (arr!24960 (Array (_ BitVec 32) ValueCell!8504)) (size!25406 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4024 0))(
  ( (LongMapFixedSize!4025 (defaultEntry!5209 Int) (mask!25657 (_ BitVec 32)) (extraKeys!4903 (_ BitVec 32)) (zeroValue!5007 V!28927) (minValue!5007 V!28927) (_size!2067 (_ BitVec 32)) (_keys!9887 array!51905) (_values!5194 array!51907) (_vacant!2067 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4024)

(declare-fun mapDefault!28511 () ValueCell!8504)

(assert (=> b!889448 (= condMapEmpty!28511 (= (arr!24960 (_values!5194 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8504)) mapDefault!28511)))))

(declare-fun res!602810 () Bool)

(declare-fun e!495832 () Bool)

(assert (=> start!75654 (=> (not res!602810) (not e!495832))))

(declare-fun valid!1575 (LongMapFixedSize!4024) Bool)

(assert (=> start!75654 (= res!602810 (valid!1575 thiss!1181))))

(assert (=> start!75654 e!495832))

(declare-fun e!495834 () Bool)

(assert (=> start!75654 e!495834))

(assert (=> start!75654 true))

(declare-fun b!889449 () Bool)

(declare-fun res!602814 () Bool)

(declare-fun e!495830 () Bool)

(assert (=> b!889449 (=> (not res!602814) (not e!495830))))

(assert (=> b!889449 (= res!602814 (and (= (size!25406 (_values!5194 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25657 thiss!1181))) (= (size!25405 (_keys!9887 thiss!1181)) (size!25406 (_values!5194 thiss!1181))) (bvsge (mask!25657 thiss!1181) #b00000000000000000000000000000000) (bvsge (extraKeys!4903 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!4903 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!889450 () Bool)

(declare-fun res!602811 () Bool)

(assert (=> b!889450 (=> (not res!602811) (not e!495832))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!889450 (= res!602811 (not (= key!785 (bvneg key!785))))))

(declare-fun b!889451 () Bool)

(declare-fun res!602812 () Bool)

(assert (=> b!889451 (=> (not res!602812) (not e!495830))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51905 (_ BitVec 32)) Bool)

(assert (=> b!889451 (= res!602812 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9887 thiss!1181) (mask!25657 thiss!1181)))))

(declare-fun b!889452 () Bool)

(declare-fun tp_is_empty!17971 () Bool)

(assert (=> b!889452 (= e!495836 tp_is_empty!17971)))

(declare-fun b!889453 () Bool)

(assert (=> b!889453 (= e!495830 false)))

(declare-fun lt!401852 () Bool)

(declare-datatypes ((List!17719 0))(
  ( (Nil!17716) (Cons!17715 (h!18846 (_ BitVec 64)) (t!25009 List!17719)) )
))
(declare-fun arrayNoDuplicates!0 (array!51905 (_ BitVec 32) List!17719) Bool)

(assert (=> b!889453 (= lt!401852 (arrayNoDuplicates!0 (_keys!9887 thiss!1181) #b00000000000000000000000000000000 Nil!17716))))

(declare-fun b!889454 () Bool)

(declare-fun e!495831 () Bool)

(assert (=> b!889454 (= e!495831 tp_is_empty!17971)))

(declare-fun mapNonEmpty!28511 () Bool)

(declare-fun tp!54899 () Bool)

(assert (=> mapNonEmpty!28511 (= mapRes!28511 (and tp!54899 e!495831))))

(declare-fun mapValue!28511 () ValueCell!8504)

(declare-fun mapRest!28511 () (Array (_ BitVec 32) ValueCell!8504))

(declare-fun mapKey!28511 () (_ BitVec 32))

(assert (=> mapNonEmpty!28511 (= (arr!24960 (_values!5194 thiss!1181)) (store mapRest!28511 mapKey!28511 mapValue!28511))))

(declare-fun b!889455 () Bool)

(assert (=> b!889455 (= e!495832 e!495830)))

(declare-fun res!602813 () Bool)

(assert (=> b!889455 (=> (not res!602813) (not e!495830))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!889455 (= res!602813 (validMask!0 (mask!25657 thiss!1181)))))

(declare-datatypes ((SeekEntryResult!8781 0))(
  ( (MissingZero!8781 (index!37495 (_ BitVec 32))) (Found!8781 (index!37496 (_ BitVec 32))) (Intermediate!8781 (undefined!9593 Bool) (index!37497 (_ BitVec 32)) (x!75544 (_ BitVec 32))) (Undefined!8781) (MissingVacant!8781 (index!37498 (_ BitVec 32))) )
))
(declare-fun lt!401851 () SeekEntryResult!8781)

(declare-fun seekEntry!0 ((_ BitVec 64) array!51905 (_ BitVec 32)) SeekEntryResult!8781)

(assert (=> b!889455 (= lt!401851 (seekEntry!0 key!785 (_keys!9887 thiss!1181) (mask!25657 thiss!1181)))))

(declare-fun mapIsEmpty!28511 () Bool)

(assert (=> mapIsEmpty!28511 mapRes!28511))

(declare-fun array_inv!19678 (array!51905) Bool)

(declare-fun array_inv!19679 (array!51907) Bool)

(assert (=> b!889456 (= e!495834 (and tp!54898 tp_is_empty!17971 (array_inv!19678 (_keys!9887 thiss!1181)) (array_inv!19679 (_values!5194 thiss!1181)) e!495835))))

(assert (= (and start!75654 res!602810) b!889450))

(assert (= (and b!889450 res!602811) b!889455))

(assert (= (and b!889455 res!602813) b!889449))

(assert (= (and b!889449 res!602814) b!889451))

(assert (= (and b!889451 res!602812) b!889453))

(assert (= (and b!889448 condMapEmpty!28511) mapIsEmpty!28511))

(assert (= (and b!889448 (not condMapEmpty!28511)) mapNonEmpty!28511))

(get-info :version)

(assert (= (and mapNonEmpty!28511 ((_ is ValueCellFull!8504) mapValue!28511)) b!889454))

(assert (= (and b!889448 ((_ is ValueCellFull!8504) mapDefault!28511)) b!889452))

(assert (= b!889456 b!889448))

(assert (= start!75654 b!889456))

(declare-fun m!827743 () Bool)

(assert (=> b!889455 m!827743))

(declare-fun m!827745 () Bool)

(assert (=> b!889455 m!827745))

(declare-fun m!827747 () Bool)

(assert (=> start!75654 m!827747))

(declare-fun m!827749 () Bool)

(assert (=> b!889451 m!827749))

(declare-fun m!827751 () Bool)

(assert (=> mapNonEmpty!28511 m!827751))

(declare-fun m!827753 () Bool)

(assert (=> b!889456 m!827753))

(declare-fun m!827755 () Bool)

(assert (=> b!889456 m!827755))

(declare-fun m!827757 () Bool)

(assert (=> b!889453 m!827757))

(check-sat (not b!889456) (not start!75654) (not mapNonEmpty!28511) (not b!889455) tp_is_empty!17971 (not b!889451) (not b!889453) (not b_next!15643) b_and!25857)
(check-sat b_and!25857 (not b_next!15643))
