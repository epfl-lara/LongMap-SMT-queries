; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75666 () Bool)

(assert start!75666)

(declare-fun b!889614 () Bool)

(declare-fun b_free!15655 () Bool)

(declare-fun b_next!15655 () Bool)

(assert (=> b!889614 (= b_free!15655 (not b_next!15655))))

(declare-fun tp!54934 () Bool)

(declare-fun b_and!25869 () Bool)

(assert (=> b!889614 (= tp!54934 b_and!25869)))

(declare-fun mapNonEmpty!28529 () Bool)

(declare-fun mapRes!28529 () Bool)

(declare-fun tp!54935 () Bool)

(declare-fun e!495959 () Bool)

(assert (=> mapNonEmpty!28529 (= mapRes!28529 (and tp!54935 e!495959))))

(declare-datatypes ((V!28943 0))(
  ( (V!28944 (val!9042 Int)) )
))
(declare-datatypes ((ValueCell!8510 0))(
  ( (ValueCellFull!8510 (v!11514 V!28943)) (EmptyCell!8510) )
))
(declare-fun mapValue!28529 () ValueCell!8510)

(declare-datatypes ((array!51929 0))(
  ( (array!51930 (arr!24971 (Array (_ BitVec 32) (_ BitVec 64))) (size!25417 (_ BitVec 32))) )
))
(declare-datatypes ((array!51931 0))(
  ( (array!51932 (arr!24972 (Array (_ BitVec 32) ValueCell!8510)) (size!25418 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4036 0))(
  ( (LongMapFixedSize!4037 (defaultEntry!5215 Int) (mask!25667 (_ BitVec 32)) (extraKeys!4909 (_ BitVec 32)) (zeroValue!5013 V!28943) (minValue!5013 V!28943) (_size!2073 (_ BitVec 32)) (_keys!9893 array!51929) (_values!5200 array!51931) (_vacant!2073 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4036)

(declare-fun mapKey!28529 () (_ BitVec 32))

(declare-fun mapRest!28529 () (Array (_ BitVec 32) ValueCell!8510))

(assert (=> mapNonEmpty!28529 (= (arr!24972 (_values!5200 thiss!1181)) (store mapRest!28529 mapKey!28529 mapValue!28529))))

(declare-fun b!889610 () Bool)

(declare-fun res!602901 () Bool)

(declare-fun e!495958 () Bool)

(assert (=> b!889610 (=> (not res!602901) (not e!495958))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!889610 (= res!602901 (not (= key!785 (bvneg key!785))))))

(declare-fun b!889611 () Bool)

(declare-fun e!495956 () Bool)

(declare-fun tp_is_empty!17983 () Bool)

(assert (=> b!889611 (= e!495956 tp_is_empty!17983)))

(declare-fun b!889612 () Bool)

(declare-fun e!495960 () Bool)

(assert (=> b!889612 (= e!495960 false)))

(declare-fun lt!401887 () Bool)

(declare-datatypes ((List!17724 0))(
  ( (Nil!17721) (Cons!17720 (h!18851 (_ BitVec 64)) (t!25014 List!17724)) )
))
(declare-fun arrayNoDuplicates!0 (array!51929 (_ BitVec 32) List!17724) Bool)

(assert (=> b!889612 (= lt!401887 (arrayNoDuplicates!0 (_keys!9893 thiss!1181) #b00000000000000000000000000000000 Nil!17721))))

(declare-fun b!889613 () Bool)

(assert (=> b!889613 (= e!495959 tp_is_empty!17983)))

(declare-fun e!495961 () Bool)

(declare-fun e!495962 () Bool)

(declare-fun array_inv!19688 (array!51929) Bool)

(declare-fun array_inv!19689 (array!51931) Bool)

(assert (=> b!889614 (= e!495961 (and tp!54934 tp_is_empty!17983 (array_inv!19688 (_keys!9893 thiss!1181)) (array_inv!19689 (_values!5200 thiss!1181)) e!495962))))

(declare-fun b!889615 () Bool)

(assert (=> b!889615 (= e!495962 (and e!495956 mapRes!28529))))

(declare-fun condMapEmpty!28529 () Bool)

(declare-fun mapDefault!28529 () ValueCell!8510)

(assert (=> b!889615 (= condMapEmpty!28529 (= (arr!24972 (_values!5200 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8510)) mapDefault!28529)))))

(declare-fun res!602900 () Bool)

(assert (=> start!75666 (=> (not res!602900) (not e!495958))))

(declare-fun valid!1580 (LongMapFixedSize!4036) Bool)

(assert (=> start!75666 (= res!602900 (valid!1580 thiss!1181))))

(assert (=> start!75666 e!495958))

(assert (=> start!75666 e!495961))

(assert (=> start!75666 true))

(declare-fun b!889616 () Bool)

(declare-fun res!602903 () Bool)

(assert (=> b!889616 (=> (not res!602903) (not e!495960))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51929 (_ BitVec 32)) Bool)

(assert (=> b!889616 (= res!602903 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9893 thiss!1181) (mask!25667 thiss!1181)))))

(declare-fun b!889617 () Bool)

(assert (=> b!889617 (= e!495958 e!495960)))

(declare-fun res!602904 () Bool)

(assert (=> b!889617 (=> (not res!602904) (not e!495960))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!889617 (= res!602904 (validMask!0 (mask!25667 thiss!1181)))))

(declare-datatypes ((SeekEntryResult!8785 0))(
  ( (MissingZero!8785 (index!37511 (_ BitVec 32))) (Found!8785 (index!37512 (_ BitVec 32))) (Intermediate!8785 (undefined!9597 Bool) (index!37513 (_ BitVec 32)) (x!75564 (_ BitVec 32))) (Undefined!8785) (MissingVacant!8785 (index!37514 (_ BitVec 32))) )
))
(declare-fun lt!401888 () SeekEntryResult!8785)

(declare-fun seekEntry!0 ((_ BitVec 64) array!51929 (_ BitVec 32)) SeekEntryResult!8785)

(assert (=> b!889617 (= lt!401888 (seekEntry!0 key!785 (_keys!9893 thiss!1181) (mask!25667 thiss!1181)))))

(declare-fun b!889618 () Bool)

(declare-fun res!602902 () Bool)

(assert (=> b!889618 (=> (not res!602902) (not e!495960))))

(assert (=> b!889618 (= res!602902 (and (= (size!25418 (_values!5200 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25667 thiss!1181))) (= (size!25417 (_keys!9893 thiss!1181)) (size!25418 (_values!5200 thiss!1181))) (bvsge (mask!25667 thiss!1181) #b00000000000000000000000000000000) (bvsge (extraKeys!4909 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!4909 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!28529 () Bool)

(assert (=> mapIsEmpty!28529 mapRes!28529))

(assert (= (and start!75666 res!602900) b!889610))

(assert (= (and b!889610 res!602901) b!889617))

(assert (= (and b!889617 res!602904) b!889618))

(assert (= (and b!889618 res!602902) b!889616))

(assert (= (and b!889616 res!602903) b!889612))

(assert (= (and b!889615 condMapEmpty!28529) mapIsEmpty!28529))

(assert (= (and b!889615 (not condMapEmpty!28529)) mapNonEmpty!28529))

(get-info :version)

(assert (= (and mapNonEmpty!28529 ((_ is ValueCellFull!8510) mapValue!28529)) b!889613))

(assert (= (and b!889615 ((_ is ValueCellFull!8510) mapDefault!28529)) b!889611))

(assert (= b!889614 b!889615))

(assert (= start!75666 b!889614))

(declare-fun m!827839 () Bool)

(assert (=> b!889616 m!827839))

(declare-fun m!827841 () Bool)

(assert (=> mapNonEmpty!28529 m!827841))

(declare-fun m!827843 () Bool)

(assert (=> b!889617 m!827843))

(declare-fun m!827845 () Bool)

(assert (=> b!889617 m!827845))

(declare-fun m!827847 () Bool)

(assert (=> start!75666 m!827847))

(declare-fun m!827849 () Bool)

(assert (=> b!889612 m!827849))

(declare-fun m!827851 () Bool)

(assert (=> b!889614 m!827851))

(declare-fun m!827853 () Bool)

(assert (=> b!889614 m!827853))

(check-sat tp_is_empty!17983 (not mapNonEmpty!28529) (not b_next!15655) (not b!889616) (not start!75666) b_and!25869 (not b!889614) (not b!889617) (not b!889612))
(check-sat b_and!25869 (not b_next!15655))
