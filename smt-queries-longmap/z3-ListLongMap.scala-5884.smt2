; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75816 () Bool)

(assert start!75816)

(declare-fun b!891993 () Bool)

(declare-fun b_free!15805 () Bool)

(declare-fun b_next!15805 () Bool)

(assert (=> b!891993 (= b_free!15805 (not b_next!15805))))

(declare-fun tp!55384 () Bool)

(declare-fun b_and!26019 () Bool)

(assert (=> b!891993 (= tp!55384 b_and!26019)))

(declare-fun b!891992 () Bool)

(declare-fun e!497885 () Bool)

(declare-fun tp_is_empty!18133 () Bool)

(assert (=> b!891992 (= e!497885 tp_is_empty!18133)))

(declare-fun e!497883 () Bool)

(declare-datatypes ((array!52229 0))(
  ( (array!52230 (arr!25121 (Array (_ BitVec 32) (_ BitVec 64))) (size!25567 (_ BitVec 32))) )
))
(declare-datatypes ((V!29143 0))(
  ( (V!29144 (val!9117 Int)) )
))
(declare-datatypes ((ValueCell!8585 0))(
  ( (ValueCellFull!8585 (v!11589 V!29143)) (EmptyCell!8585) )
))
(declare-datatypes ((array!52231 0))(
  ( (array!52232 (arr!25122 (Array (_ BitVec 32) ValueCell!8585)) (size!25568 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4186 0))(
  ( (LongMapFixedSize!4187 (defaultEntry!5290 Int) (mask!25792 (_ BitVec 32)) (extraKeys!4984 (_ BitVec 32)) (zeroValue!5088 V!29143) (minValue!5088 V!29143) (_size!2148 (_ BitVec 32)) (_keys!9968 array!52229) (_values!5275 array!52231) (_vacant!2148 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4186)

(declare-fun e!497879 () Bool)

(declare-fun array_inv!19794 (array!52229) Bool)

(declare-fun array_inv!19795 (array!52231) Bool)

(assert (=> b!891993 (= e!497883 (and tp!55384 tp_is_empty!18133 (array_inv!19794 (_keys!9968 thiss!1181)) (array_inv!19795 (_values!5275 thiss!1181)) e!497879))))

(declare-fun b!891994 () Bool)

(declare-fun res!604385 () Bool)

(declare-fun e!497884 () Bool)

(assert (=> b!891994 (=> res!604385 e!497884)))

(declare-datatypes ((List!17782 0))(
  ( (Nil!17779) (Cons!17778 (h!18909 (_ BitVec 64)) (t!25072 List!17782)) )
))
(declare-fun arrayNoDuplicates!0 (array!52229 (_ BitVec 32) List!17782) Bool)

(assert (=> b!891994 (= res!604385 (not (arrayNoDuplicates!0 (_keys!9968 thiss!1181) #b00000000000000000000000000000000 Nil!17779)))))

(declare-fun b!891995 () Bool)

(declare-fun res!604388 () Bool)

(assert (=> b!891995 (=> res!604388 e!497884)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52229 (_ BitVec 32)) Bool)

(assert (=> b!891995 (= res!604388 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9968 thiss!1181) (mask!25792 thiss!1181))))))

(declare-fun b!891996 () Bool)

(declare-fun e!497881 () Bool)

(declare-fun e!497880 () Bool)

(assert (=> b!891996 (= e!497881 (not e!497880))))

(declare-fun res!604382 () Bool)

(assert (=> b!891996 (=> res!604382 e!497880)))

(declare-datatypes ((SeekEntryResult!8847 0))(
  ( (MissingZero!8847 (index!37759 (_ BitVec 32))) (Found!8847 (index!37760 (_ BitVec 32))) (Intermediate!8847 (undefined!9659 Bool) (index!37761 (_ BitVec 32)) (x!75826 (_ BitVec 32))) (Undefined!8847) (MissingVacant!8847 (index!37762 (_ BitVec 32))) )
))
(declare-fun lt!402854 () SeekEntryResult!8847)

(get-info :version)

(assert (=> b!891996 (= res!604382 (not ((_ is Found!8847) lt!402854)))))

(declare-fun e!497877 () Bool)

(assert (=> b!891996 e!497877))

(declare-fun res!604384 () Bool)

(assert (=> b!891996 (=> res!604384 e!497877)))

(assert (=> b!891996 (= res!604384 (not ((_ is Found!8847) lt!402854)))))

(declare-datatypes ((Unit!30326 0))(
  ( (Unit!30327) )
))
(declare-fun lt!402850 () Unit!30326)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun lemmaSeekEntryGivesInRangeIndex!49 (array!52229 array!52231 (_ BitVec 32) (_ BitVec 32) V!29143 V!29143 (_ BitVec 64)) Unit!30326)

(assert (=> b!891996 (= lt!402850 (lemmaSeekEntryGivesInRangeIndex!49 (_keys!9968 thiss!1181) (_values!5275 thiss!1181) (mask!25792 thiss!1181) (extraKeys!4984 thiss!1181) (zeroValue!5088 thiss!1181) (minValue!5088 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52229 (_ BitVec 32)) SeekEntryResult!8847)

(assert (=> b!891996 (= lt!402854 (seekEntry!0 key!785 (_keys!9968 thiss!1181) (mask!25792 thiss!1181)))))

(declare-fun b!891997 () Bool)

(assert (=> b!891997 (= e!497880 e!497884)))

(declare-fun res!604387 () Bool)

(assert (=> b!891997 (=> res!604387 e!497884)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!891997 (= res!604387 (not (validMask!0 (mask!25792 thiss!1181))))))

(declare-datatypes ((tuple2!12002 0))(
  ( (tuple2!12003 (_1!6012 (_ BitVec 64)) (_2!6012 V!29143)) )
))
(declare-datatypes ((List!17783 0))(
  ( (Nil!17780) (Cons!17779 (h!18910 tuple2!12002) (t!25073 List!17783)) )
))
(declare-datatypes ((ListLongMap!10689 0))(
  ( (ListLongMap!10690 (toList!5360 List!17783)) )
))
(declare-fun lt!402853 () ListLongMap!10689)

(declare-fun contains!4330 (ListLongMap!10689 (_ BitVec 64)) Bool)

(assert (=> b!891997 (contains!4330 lt!402853 (select (arr!25121 (_keys!9968 thiss!1181)) (index!37760 lt!402854)))))

(declare-fun getCurrentListMap!2586 (array!52229 array!52231 (_ BitVec 32) (_ BitVec 32) V!29143 V!29143 (_ BitVec 32) Int) ListLongMap!10689)

(assert (=> b!891997 (= lt!402853 (getCurrentListMap!2586 (_keys!9968 thiss!1181) (_values!5275 thiss!1181) (mask!25792 thiss!1181) (extraKeys!4984 thiss!1181) (zeroValue!5088 thiss!1181) (minValue!5088 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5290 thiss!1181)))))

(declare-fun lt!402849 () Unit!30326)

(declare-fun lemmaValidKeyInArrayIsInListMap!222 (array!52229 array!52231 (_ BitVec 32) (_ BitVec 32) V!29143 V!29143 (_ BitVec 32) Int) Unit!30326)

(assert (=> b!891997 (= lt!402849 (lemmaValidKeyInArrayIsInListMap!222 (_keys!9968 thiss!1181) (_values!5275 thiss!1181) (mask!25792 thiss!1181) (extraKeys!4984 thiss!1181) (zeroValue!5088 thiss!1181) (minValue!5088 thiss!1181) (index!37760 lt!402854) (defaultEntry!5290 thiss!1181)))))

(declare-fun arrayContainsKey!0 (array!52229 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!891997 (arrayContainsKey!0 (_keys!9968 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!402851 () Unit!30326)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52229 (_ BitVec 64) (_ BitVec 32)) Unit!30326)

(assert (=> b!891997 (= lt!402851 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9968 thiss!1181) key!785 (index!37760 lt!402854)))))

(declare-fun b!891998 () Bool)

(declare-fun res!604386 () Bool)

(assert (=> b!891998 (=> res!604386 e!497884)))

(assert (=> b!891998 (= res!604386 (or (not (= (size!25568 (_values!5275 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25792 thiss!1181)))) (not (= (size!25567 (_keys!9968 thiss!1181)) (size!25568 (_values!5275 thiss!1181)))) (bvslt (mask!25792 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4984 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4984 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!891999 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!891999 (= e!497877 (inRange!0 (index!37760 lt!402854) (mask!25792 thiss!1181)))))

(declare-fun b!892000 () Bool)

(assert (=> b!892000 (= e!497884 true)))

(declare-fun lt!402852 () Bool)

(assert (=> b!892000 (= lt!402852 (contains!4330 lt!402853 key!785))))

(declare-fun mapIsEmpty!28754 () Bool)

(declare-fun mapRes!28754 () Bool)

(assert (=> mapIsEmpty!28754 mapRes!28754))

(declare-fun mapNonEmpty!28754 () Bool)

(declare-fun tp!55385 () Bool)

(assert (=> mapNonEmpty!28754 (= mapRes!28754 (and tp!55385 e!497885))))

(declare-fun mapValue!28754 () ValueCell!8585)

(declare-fun mapRest!28754 () (Array (_ BitVec 32) ValueCell!8585))

(declare-fun mapKey!28754 () (_ BitVec 32))

(assert (=> mapNonEmpty!28754 (= (arr!25122 (_values!5275 thiss!1181)) (store mapRest!28754 mapKey!28754 mapValue!28754))))

(declare-fun b!892002 () Bool)

(declare-fun res!604389 () Bool)

(assert (=> b!892002 (=> (not res!604389) (not e!497881))))

(assert (=> b!892002 (= res!604389 (not (= key!785 (bvneg key!785))))))

(declare-fun b!892003 () Bool)

(declare-fun e!497878 () Bool)

(assert (=> b!892003 (= e!497878 tp_is_empty!18133)))

(declare-fun res!604383 () Bool)

(assert (=> start!75816 (=> (not res!604383) (not e!497881))))

(declare-fun valid!1626 (LongMapFixedSize!4186) Bool)

(assert (=> start!75816 (= res!604383 (valid!1626 thiss!1181))))

(assert (=> start!75816 e!497881))

(assert (=> start!75816 e!497883))

(assert (=> start!75816 true))

(declare-fun b!892001 () Bool)

(assert (=> b!892001 (= e!497879 (and e!497878 mapRes!28754))))

(declare-fun condMapEmpty!28754 () Bool)

(declare-fun mapDefault!28754 () ValueCell!8585)

(assert (=> b!892001 (= condMapEmpty!28754 (= (arr!25122 (_values!5275 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8585)) mapDefault!28754)))))

(assert (= (and start!75816 res!604383) b!892002))

(assert (= (and b!892002 res!604389) b!891996))

(assert (= (and b!891996 (not res!604384)) b!891999))

(assert (= (and b!891996 (not res!604382)) b!891997))

(assert (= (and b!891997 (not res!604387)) b!891998))

(assert (= (and b!891998 (not res!604386)) b!891995))

(assert (= (and b!891995 (not res!604388)) b!891994))

(assert (= (and b!891994 (not res!604385)) b!892000))

(assert (= (and b!892001 condMapEmpty!28754) mapIsEmpty!28754))

(assert (= (and b!892001 (not condMapEmpty!28754)) mapNonEmpty!28754))

(assert (= (and mapNonEmpty!28754 ((_ is ValueCellFull!8585) mapValue!28754)) b!891992))

(assert (= (and b!892001 ((_ is ValueCellFull!8585) mapDefault!28754)) b!892003))

(assert (= b!891993 b!892001))

(assert (= start!75816 b!891993))

(declare-fun m!829741 () Bool)

(assert (=> b!891993 m!829741))

(declare-fun m!829743 () Bool)

(assert (=> b!891993 m!829743))

(declare-fun m!829745 () Bool)

(assert (=> b!892000 m!829745))

(declare-fun m!829747 () Bool)

(assert (=> b!891999 m!829747))

(declare-fun m!829749 () Bool)

(assert (=> b!891994 m!829749))

(declare-fun m!829751 () Bool)

(assert (=> b!891995 m!829751))

(declare-fun m!829753 () Bool)

(assert (=> b!891996 m!829753))

(declare-fun m!829755 () Bool)

(assert (=> b!891996 m!829755))

(declare-fun m!829757 () Bool)

(assert (=> mapNonEmpty!28754 m!829757))

(declare-fun m!829759 () Bool)

(assert (=> b!891997 m!829759))

(declare-fun m!829761 () Bool)

(assert (=> b!891997 m!829761))

(declare-fun m!829763 () Bool)

(assert (=> b!891997 m!829763))

(declare-fun m!829765 () Bool)

(assert (=> b!891997 m!829765))

(declare-fun m!829767 () Bool)

(assert (=> b!891997 m!829767))

(declare-fun m!829769 () Bool)

(assert (=> b!891997 m!829769))

(assert (=> b!891997 m!829759))

(declare-fun m!829771 () Bool)

(assert (=> b!891997 m!829771))

(declare-fun m!829773 () Bool)

(assert (=> start!75816 m!829773))

(check-sat (not b!891995) (not start!75816) (not mapNonEmpty!28754) (not b!891999) (not b_next!15805) tp_is_empty!18133 b_and!26019 (not b!891997) (not b!891994) (not b!891993) (not b!892000) (not b!891996))
(check-sat b_and!26019 (not b_next!15805))
