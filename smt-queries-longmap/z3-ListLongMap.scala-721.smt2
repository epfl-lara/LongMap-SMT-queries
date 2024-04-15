; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16850 () Bool)

(assert start!16850)

(declare-fun b!169621 () Bool)

(declare-fun b_free!4165 () Bool)

(declare-fun b_next!4165 () Bool)

(assert (=> b!169621 (= b_free!4165 (not b_next!4165))))

(declare-fun tp!15100 () Bool)

(declare-fun b_and!10553 () Bool)

(assert (=> b!169621 (= tp!15100 b_and!10553)))

(declare-fun mapIsEmpty!6673 () Bool)

(declare-fun mapRes!6673 () Bool)

(assert (=> mapIsEmpty!6673 mapRes!6673))

(declare-fun e!111867 () Bool)

(declare-fun tp_is_empty!3937 () Bool)

(declare-datatypes ((V!4897 0))(
  ( (V!4898 (val!2013 Int)) )
))
(declare-datatypes ((ValueCell!1625 0))(
  ( (ValueCellFull!1625 (v!3872 V!4897)) (EmptyCell!1625) )
))
(declare-datatypes ((array!6953 0))(
  ( (array!6954 (arr!3310 (Array (_ BitVec 32) (_ BitVec 64))) (size!3600 (_ BitVec 32))) )
))
(declare-datatypes ((array!6955 0))(
  ( (array!6956 (arr!3311 (Array (_ BitVec 32) ValueCell!1625)) (size!3601 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2158 0))(
  ( (LongMapFixedSize!2159 (defaultEntry!3521 Int) (mask!8313 (_ BitVec 32)) (extraKeys!3262 (_ BitVec 32)) (zeroValue!3364 V!4897) (minValue!3364 V!4897) (_size!1128 (_ BitVec 32)) (_keys!5346 array!6953) (_values!3504 array!6955) (_vacant!1128 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2158)

(declare-fun e!111872 () Bool)

(declare-fun array_inv!2129 (array!6953) Bool)

(declare-fun array_inv!2130 (array!6955) Bool)

(assert (=> b!169621 (= e!111872 (and tp!15100 tp_is_empty!3937 (array_inv!2129 (_keys!5346 thiss!1248)) (array_inv!2130 (_values!3504 thiss!1248)) e!111867))))

(declare-fun b!169622 () Bool)

(declare-fun e!111868 () Bool)

(assert (=> b!169622 (= e!111868 tp_is_empty!3937)))

(declare-fun b!169623 () Bool)

(assert (=> b!169623 (= e!111867 (and e!111868 mapRes!6673))))

(declare-fun condMapEmpty!6673 () Bool)

(declare-fun mapDefault!6673 () ValueCell!1625)

(assert (=> b!169623 (= condMapEmpty!6673 (= (arr!3311 (_values!3504 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1625)) mapDefault!6673)))))

(declare-fun b!169624 () Bool)

(declare-fun e!111871 () Bool)

(assert (=> b!169624 (= e!111871 tp_is_empty!3937)))

(declare-fun mapNonEmpty!6673 () Bool)

(declare-fun tp!15099 () Bool)

(assert (=> mapNonEmpty!6673 (= mapRes!6673 (and tp!15099 e!111871))))

(declare-fun mapValue!6673 () ValueCell!1625)

(declare-fun mapRest!6673 () (Array (_ BitVec 32) ValueCell!1625))

(declare-fun mapKey!6673 () (_ BitVec 32))

(assert (=> mapNonEmpty!6673 (= (arr!3311 (_values!3504 thiss!1248)) (store mapRest!6673 mapKey!6673 mapValue!6673))))

(declare-fun b!169625 () Bool)

(declare-fun res!80615 () Bool)

(declare-fun e!111870 () Bool)

(assert (=> b!169625 (=> (not res!80615) (not e!111870))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!169625 (= res!80615 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!169626 () Bool)

(assert (=> b!169626 (= e!111870 (not (= (size!3601 (_values!3504 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8313 thiss!1248)))))))

(declare-fun b!169627 () Bool)

(declare-fun res!80617 () Bool)

(assert (=> b!169627 (=> (not res!80617) (not e!111870))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!169627 (= res!80617 (validMask!0 (mask!8313 thiss!1248)))))

(declare-fun res!80616 () Bool)

(assert (=> start!16850 (=> (not res!80616) (not e!111870))))

(declare-fun valid!943 (LongMapFixedSize!2158) Bool)

(assert (=> start!16850 (= res!80616 (valid!943 thiss!1248))))

(assert (=> start!16850 e!111870))

(assert (=> start!16850 e!111872))

(assert (=> start!16850 true))

(assert (= (and start!16850 res!80616) b!169625))

(assert (= (and b!169625 res!80615) b!169627))

(assert (= (and b!169627 res!80617) b!169626))

(assert (= (and b!169623 condMapEmpty!6673) mapIsEmpty!6673))

(assert (= (and b!169623 (not condMapEmpty!6673)) mapNonEmpty!6673))

(get-info :version)

(assert (= (and mapNonEmpty!6673 ((_ is ValueCellFull!1625) mapValue!6673)) b!169624))

(assert (= (and b!169623 ((_ is ValueCellFull!1625) mapDefault!6673)) b!169622))

(assert (= b!169621 b!169623))

(assert (= start!16850 b!169621))

(declare-fun m!198015 () Bool)

(assert (=> b!169621 m!198015))

(declare-fun m!198017 () Bool)

(assert (=> b!169621 m!198017))

(declare-fun m!198019 () Bool)

(assert (=> mapNonEmpty!6673 m!198019))

(declare-fun m!198021 () Bool)

(assert (=> b!169627 m!198021))

(declare-fun m!198023 () Bool)

(assert (=> start!16850 m!198023))

(check-sat (not b!169627) b_and!10553 (not b_next!4165) (not b!169621) (not mapNonEmpty!6673) (not start!16850) tp_is_empty!3937)
(check-sat b_and!10553 (not b_next!4165))
(get-model)

(declare-fun d!51503 () Bool)

(assert (=> d!51503 (= (array_inv!2129 (_keys!5346 thiss!1248)) (bvsge (size!3600 (_keys!5346 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!169621 d!51503))

(declare-fun d!51505 () Bool)

(assert (=> d!51505 (= (array_inv!2130 (_values!3504 thiss!1248)) (bvsge (size!3601 (_values!3504 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!169621 d!51505))

(declare-fun d!51507 () Bool)

(assert (=> d!51507 (= (validMask!0 (mask!8313 thiss!1248)) (and (or (= (mask!8313 thiss!1248) #b00000000000000000000000000000111) (= (mask!8313 thiss!1248) #b00000000000000000000000000001111) (= (mask!8313 thiss!1248) #b00000000000000000000000000011111) (= (mask!8313 thiss!1248) #b00000000000000000000000000111111) (= (mask!8313 thiss!1248) #b00000000000000000000000001111111) (= (mask!8313 thiss!1248) #b00000000000000000000000011111111) (= (mask!8313 thiss!1248) #b00000000000000000000000111111111) (= (mask!8313 thiss!1248) #b00000000000000000000001111111111) (= (mask!8313 thiss!1248) #b00000000000000000000011111111111) (= (mask!8313 thiss!1248) #b00000000000000000000111111111111) (= (mask!8313 thiss!1248) #b00000000000000000001111111111111) (= (mask!8313 thiss!1248) #b00000000000000000011111111111111) (= (mask!8313 thiss!1248) #b00000000000000000111111111111111) (= (mask!8313 thiss!1248) #b00000000000000001111111111111111) (= (mask!8313 thiss!1248) #b00000000000000011111111111111111) (= (mask!8313 thiss!1248) #b00000000000000111111111111111111) (= (mask!8313 thiss!1248) #b00000000000001111111111111111111) (= (mask!8313 thiss!1248) #b00000000000011111111111111111111) (= (mask!8313 thiss!1248) #b00000000000111111111111111111111) (= (mask!8313 thiss!1248) #b00000000001111111111111111111111) (= (mask!8313 thiss!1248) #b00000000011111111111111111111111) (= (mask!8313 thiss!1248) #b00000000111111111111111111111111) (= (mask!8313 thiss!1248) #b00000001111111111111111111111111) (= (mask!8313 thiss!1248) #b00000011111111111111111111111111) (= (mask!8313 thiss!1248) #b00000111111111111111111111111111) (= (mask!8313 thiss!1248) #b00001111111111111111111111111111) (= (mask!8313 thiss!1248) #b00011111111111111111111111111111) (= (mask!8313 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8313 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!169627 d!51507))

(declare-fun d!51509 () Bool)

(declare-fun res!80642 () Bool)

(declare-fun e!111911 () Bool)

(assert (=> d!51509 (=> (not res!80642) (not e!111911))))

(declare-fun simpleValid!128 (LongMapFixedSize!2158) Bool)

(assert (=> d!51509 (= res!80642 (simpleValid!128 thiss!1248))))

(assert (=> d!51509 (= (valid!943 thiss!1248) e!111911)))

(declare-fun b!169676 () Bool)

(declare-fun res!80643 () Bool)

(assert (=> b!169676 (=> (not res!80643) (not e!111911))))

(declare-fun arrayCountValidKeys!0 (array!6953 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!169676 (= res!80643 (= (arrayCountValidKeys!0 (_keys!5346 thiss!1248) #b00000000000000000000000000000000 (size!3600 (_keys!5346 thiss!1248))) (_size!1128 thiss!1248)))))

(declare-fun b!169677 () Bool)

(declare-fun res!80644 () Bool)

(assert (=> b!169677 (=> (not res!80644) (not e!111911))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6953 (_ BitVec 32)) Bool)

(assert (=> b!169677 (= res!80644 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5346 thiss!1248) (mask!8313 thiss!1248)))))

(declare-fun b!169678 () Bool)

(declare-datatypes ((List!2195 0))(
  ( (Nil!2192) (Cons!2191 (h!2808 (_ BitVec 64)) (t!6988 List!2195)) )
))
(declare-fun arrayNoDuplicates!0 (array!6953 (_ BitVec 32) List!2195) Bool)

(assert (=> b!169678 (= e!111911 (arrayNoDuplicates!0 (_keys!5346 thiss!1248) #b00000000000000000000000000000000 Nil!2192))))

(assert (= (and d!51509 res!80642) b!169676))

(assert (= (and b!169676 res!80643) b!169677))

(assert (= (and b!169677 res!80644) b!169678))

(declare-fun m!198045 () Bool)

(assert (=> d!51509 m!198045))

(declare-fun m!198047 () Bool)

(assert (=> b!169676 m!198047))

(declare-fun m!198049 () Bool)

(assert (=> b!169677 m!198049))

(declare-fun m!198051 () Bool)

(assert (=> b!169678 m!198051))

(assert (=> start!16850 d!51509))

(declare-fun condMapEmpty!6682 () Bool)

(declare-fun mapDefault!6682 () ValueCell!1625)

(assert (=> mapNonEmpty!6673 (= condMapEmpty!6682 (= mapRest!6673 ((as const (Array (_ BitVec 32) ValueCell!1625)) mapDefault!6682)))))

(declare-fun e!111917 () Bool)

(declare-fun mapRes!6682 () Bool)

(assert (=> mapNonEmpty!6673 (= tp!15099 (and e!111917 mapRes!6682))))

(declare-fun mapNonEmpty!6682 () Bool)

(declare-fun tp!15115 () Bool)

(declare-fun e!111916 () Bool)

(assert (=> mapNonEmpty!6682 (= mapRes!6682 (and tp!15115 e!111916))))

(declare-fun mapKey!6682 () (_ BitVec 32))

(declare-fun mapValue!6682 () ValueCell!1625)

(declare-fun mapRest!6682 () (Array (_ BitVec 32) ValueCell!1625))

(assert (=> mapNonEmpty!6682 (= mapRest!6673 (store mapRest!6682 mapKey!6682 mapValue!6682))))

(declare-fun b!169686 () Bool)

(assert (=> b!169686 (= e!111917 tp_is_empty!3937)))

(declare-fun b!169685 () Bool)

(assert (=> b!169685 (= e!111916 tp_is_empty!3937)))

(declare-fun mapIsEmpty!6682 () Bool)

(assert (=> mapIsEmpty!6682 mapRes!6682))

(assert (= (and mapNonEmpty!6673 condMapEmpty!6682) mapIsEmpty!6682))

(assert (= (and mapNonEmpty!6673 (not condMapEmpty!6682)) mapNonEmpty!6682))

(assert (= (and mapNonEmpty!6682 ((_ is ValueCellFull!1625) mapValue!6682)) b!169685))

(assert (= (and mapNonEmpty!6673 ((_ is ValueCellFull!1625) mapDefault!6682)) b!169686))

(declare-fun m!198053 () Bool)

(assert (=> mapNonEmpty!6682 m!198053))

(check-sat (not b!169677) (not b!169676) (not d!51509) tp_is_empty!3937 (not b!169678) b_and!10553 (not mapNonEmpty!6682) (not b_next!4165))
(check-sat b_and!10553 (not b_next!4165))
(get-model)

(declare-fun bm!17320 () Bool)

(declare-fun call!17323 () Bool)

(assert (=> bm!17320 (= call!17323 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5346 thiss!1248) (mask!8313 thiss!1248)))))

(declare-fun b!169695 () Bool)

(declare-fun e!111924 () Bool)

(assert (=> b!169695 (= e!111924 call!17323)))

(declare-fun b!169696 () Bool)

(declare-fun e!111926 () Bool)

(assert (=> b!169696 (= e!111926 e!111924)))

(declare-fun lt!84787 () (_ BitVec 64))

(assert (=> b!169696 (= lt!84787 (select (arr!3310 (_keys!5346 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5215 0))(
  ( (Unit!5216) )
))
(declare-fun lt!84788 () Unit!5215)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!6953 (_ BitVec 64) (_ BitVec 32)) Unit!5215)

(assert (=> b!169696 (= lt!84788 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5346 thiss!1248) lt!84787 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!6953 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!169696 (arrayContainsKey!0 (_keys!5346 thiss!1248) lt!84787 #b00000000000000000000000000000000)))

(declare-fun lt!84789 () Unit!5215)

(assert (=> b!169696 (= lt!84789 lt!84788)))

(declare-fun res!80649 () Bool)

(declare-datatypes ((SeekEntryResult!539 0))(
  ( (MissingZero!539 (index!4324 (_ BitVec 32))) (Found!539 (index!4325 (_ BitVec 32))) (Intermediate!539 (undefined!1351 Bool) (index!4326 (_ BitVec 32)) (x!18786 (_ BitVec 32))) (Undefined!539) (MissingVacant!539 (index!4327 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6953 (_ BitVec 32)) SeekEntryResult!539)

(assert (=> b!169696 (= res!80649 (= (seekEntryOrOpen!0 (select (arr!3310 (_keys!5346 thiss!1248)) #b00000000000000000000000000000000) (_keys!5346 thiss!1248) (mask!8313 thiss!1248)) (Found!539 #b00000000000000000000000000000000)))))

(assert (=> b!169696 (=> (not res!80649) (not e!111924))))

(declare-fun b!169697 () Bool)

(assert (=> b!169697 (= e!111926 call!17323)))

(declare-fun d!51511 () Bool)

(declare-fun res!80650 () Bool)

(declare-fun e!111925 () Bool)

(assert (=> d!51511 (=> res!80650 e!111925)))

(assert (=> d!51511 (= res!80650 (bvsge #b00000000000000000000000000000000 (size!3600 (_keys!5346 thiss!1248))))))

(assert (=> d!51511 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5346 thiss!1248) (mask!8313 thiss!1248)) e!111925)))

(declare-fun b!169698 () Bool)

(assert (=> b!169698 (= e!111925 e!111926)))

(declare-fun c!30416 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!169698 (= c!30416 (validKeyInArray!0 (select (arr!3310 (_keys!5346 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!51511 (not res!80650)) b!169698))

(assert (= (and b!169698 c!30416) b!169696))

(assert (= (and b!169698 (not c!30416)) b!169697))

(assert (= (and b!169696 res!80649) b!169695))

(assert (= (or b!169695 b!169697) bm!17320))

(declare-fun m!198055 () Bool)

(assert (=> bm!17320 m!198055))

(declare-fun m!198057 () Bool)

(assert (=> b!169696 m!198057))

(declare-fun m!198059 () Bool)

(assert (=> b!169696 m!198059))

(declare-fun m!198061 () Bool)

(assert (=> b!169696 m!198061))

(assert (=> b!169696 m!198057))

(declare-fun m!198063 () Bool)

(assert (=> b!169696 m!198063))

(assert (=> b!169698 m!198057))

(assert (=> b!169698 m!198057))

(declare-fun m!198065 () Bool)

(assert (=> b!169698 m!198065))

(assert (=> b!169677 d!51511))

(declare-fun b!169709 () Bool)

(declare-fun e!111938 () Bool)

(declare-fun e!111936 () Bool)

(assert (=> b!169709 (= e!111938 e!111936)))

(declare-fun c!30419 () Bool)

(assert (=> b!169709 (= c!30419 (validKeyInArray!0 (select (arr!3310 (_keys!5346 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!169710 () Bool)

(declare-fun e!111935 () Bool)

(assert (=> b!169710 (= e!111935 e!111938)))

(declare-fun res!80657 () Bool)

(assert (=> b!169710 (=> (not res!80657) (not e!111938))))

(declare-fun e!111937 () Bool)

(assert (=> b!169710 (= res!80657 (not e!111937))))

(declare-fun res!80659 () Bool)

(assert (=> b!169710 (=> (not res!80659) (not e!111937))))

(assert (=> b!169710 (= res!80659 (validKeyInArray!0 (select (arr!3310 (_keys!5346 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!169711 () Bool)

(declare-fun call!17326 () Bool)

(assert (=> b!169711 (= e!111936 call!17326)))

(declare-fun d!51513 () Bool)

(declare-fun res!80658 () Bool)

(assert (=> d!51513 (=> res!80658 e!111935)))

(assert (=> d!51513 (= res!80658 (bvsge #b00000000000000000000000000000000 (size!3600 (_keys!5346 thiss!1248))))))

(assert (=> d!51513 (= (arrayNoDuplicates!0 (_keys!5346 thiss!1248) #b00000000000000000000000000000000 Nil!2192) e!111935)))

(declare-fun bm!17323 () Bool)

(assert (=> bm!17323 (= call!17326 (arrayNoDuplicates!0 (_keys!5346 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!30419 (Cons!2191 (select (arr!3310 (_keys!5346 thiss!1248)) #b00000000000000000000000000000000) Nil!2192) Nil!2192)))))

(declare-fun b!169712 () Bool)

(declare-fun contains!1137 (List!2195 (_ BitVec 64)) Bool)

(assert (=> b!169712 (= e!111937 (contains!1137 Nil!2192 (select (arr!3310 (_keys!5346 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!169713 () Bool)

(assert (=> b!169713 (= e!111936 call!17326)))

(assert (= (and d!51513 (not res!80658)) b!169710))

(assert (= (and b!169710 res!80659) b!169712))

(assert (= (and b!169710 res!80657) b!169709))

(assert (= (and b!169709 c!30419) b!169713))

(assert (= (and b!169709 (not c!30419)) b!169711))

(assert (= (or b!169713 b!169711) bm!17323))

(assert (=> b!169709 m!198057))

(assert (=> b!169709 m!198057))

(assert (=> b!169709 m!198065))

(assert (=> b!169710 m!198057))

(assert (=> b!169710 m!198057))

(assert (=> b!169710 m!198065))

(assert (=> bm!17323 m!198057))

(declare-fun m!198067 () Bool)

(assert (=> bm!17323 m!198067))

(assert (=> b!169712 m!198057))

(assert (=> b!169712 m!198057))

(declare-fun m!198069 () Bool)

(assert (=> b!169712 m!198069))

(assert (=> b!169678 d!51513))

(declare-fun b!169723 () Bool)

(declare-fun res!80669 () Bool)

(declare-fun e!111941 () Bool)

(assert (=> b!169723 (=> (not res!80669) (not e!111941))))

(declare-fun size!3606 (LongMapFixedSize!2158) (_ BitVec 32))

(assert (=> b!169723 (= res!80669 (bvsge (size!3606 thiss!1248) (_size!1128 thiss!1248)))))

(declare-fun b!169725 () Bool)

(assert (=> b!169725 (= e!111941 (and (bvsge (extraKeys!3262 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3262 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1128 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!169722 () Bool)

(declare-fun res!80670 () Bool)

(assert (=> b!169722 (=> (not res!80670) (not e!111941))))

(assert (=> b!169722 (= res!80670 (and (= (size!3601 (_values!3504 thiss!1248)) (bvadd (mask!8313 thiss!1248) #b00000000000000000000000000000001)) (= (size!3600 (_keys!5346 thiss!1248)) (size!3601 (_values!3504 thiss!1248))) (bvsge (_size!1128 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1128 thiss!1248) (bvadd (mask!8313 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun d!51515 () Bool)

(declare-fun res!80668 () Bool)

(assert (=> d!51515 (=> (not res!80668) (not e!111941))))

(assert (=> d!51515 (= res!80668 (validMask!0 (mask!8313 thiss!1248)))))

(assert (=> d!51515 (= (simpleValid!128 thiss!1248) e!111941)))

(declare-fun b!169724 () Bool)

(declare-fun res!80671 () Bool)

(assert (=> b!169724 (=> (not res!80671) (not e!111941))))

(assert (=> b!169724 (= res!80671 (= (size!3606 thiss!1248) (bvadd (_size!1128 thiss!1248) (bvsdiv (bvadd (extraKeys!3262 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!51515 res!80668) b!169722))

(assert (= (and b!169722 res!80670) b!169723))

(assert (= (and b!169723 res!80669) b!169724))

(assert (= (and b!169724 res!80671) b!169725))

(declare-fun m!198071 () Bool)

(assert (=> b!169723 m!198071))

(assert (=> d!51515 m!198021))

(assert (=> b!169724 m!198071))

(assert (=> d!51509 d!51515))

(declare-fun bm!17326 () Bool)

(declare-fun call!17329 () (_ BitVec 32))

(assert (=> bm!17326 (= call!17329 (arrayCountValidKeys!0 (_keys!5346 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3600 (_keys!5346 thiss!1248))))))

(declare-fun b!169734 () Bool)

(declare-fun e!111946 () (_ BitVec 32))

(assert (=> b!169734 (= e!111946 call!17329)))

(declare-fun d!51517 () Bool)

(declare-fun lt!84792 () (_ BitVec 32))

(assert (=> d!51517 (and (bvsge lt!84792 #b00000000000000000000000000000000) (bvsle lt!84792 (bvsub (size!3600 (_keys!5346 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!111947 () (_ BitVec 32))

(assert (=> d!51517 (= lt!84792 e!111947)))

(declare-fun c!30424 () Bool)

(assert (=> d!51517 (= c!30424 (bvsge #b00000000000000000000000000000000 (size!3600 (_keys!5346 thiss!1248))))))

(assert (=> d!51517 (and (bvsle #b00000000000000000000000000000000 (size!3600 (_keys!5346 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3600 (_keys!5346 thiss!1248)) (size!3600 (_keys!5346 thiss!1248))))))

(assert (=> d!51517 (= (arrayCountValidKeys!0 (_keys!5346 thiss!1248) #b00000000000000000000000000000000 (size!3600 (_keys!5346 thiss!1248))) lt!84792)))

(declare-fun b!169735 () Bool)

(assert (=> b!169735 (= e!111946 (bvadd #b00000000000000000000000000000001 call!17329))))

(declare-fun b!169736 () Bool)

(assert (=> b!169736 (= e!111947 #b00000000000000000000000000000000)))

(declare-fun b!169737 () Bool)

(assert (=> b!169737 (= e!111947 e!111946)))

(declare-fun c!30425 () Bool)

(assert (=> b!169737 (= c!30425 (validKeyInArray!0 (select (arr!3310 (_keys!5346 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!51517 c!30424) b!169736))

(assert (= (and d!51517 (not c!30424)) b!169737))

(assert (= (and b!169737 c!30425) b!169735))

(assert (= (and b!169737 (not c!30425)) b!169734))

(assert (= (or b!169735 b!169734) bm!17326))

(declare-fun m!198073 () Bool)

(assert (=> bm!17326 m!198073))

(assert (=> b!169737 m!198057))

(assert (=> b!169737 m!198057))

(assert (=> b!169737 m!198065))

(assert (=> b!169676 d!51517))

(declare-fun condMapEmpty!6683 () Bool)

(declare-fun mapDefault!6683 () ValueCell!1625)

(assert (=> mapNonEmpty!6682 (= condMapEmpty!6683 (= mapRest!6682 ((as const (Array (_ BitVec 32) ValueCell!1625)) mapDefault!6683)))))

(declare-fun e!111949 () Bool)

(declare-fun mapRes!6683 () Bool)

(assert (=> mapNonEmpty!6682 (= tp!15115 (and e!111949 mapRes!6683))))

(declare-fun mapNonEmpty!6683 () Bool)

(declare-fun tp!15116 () Bool)

(declare-fun e!111948 () Bool)

(assert (=> mapNonEmpty!6683 (= mapRes!6683 (and tp!15116 e!111948))))

(declare-fun mapValue!6683 () ValueCell!1625)

(declare-fun mapKey!6683 () (_ BitVec 32))

(declare-fun mapRest!6683 () (Array (_ BitVec 32) ValueCell!1625))

(assert (=> mapNonEmpty!6683 (= mapRest!6682 (store mapRest!6683 mapKey!6683 mapValue!6683))))

(declare-fun b!169739 () Bool)

(assert (=> b!169739 (= e!111949 tp_is_empty!3937)))

(declare-fun b!169738 () Bool)

(assert (=> b!169738 (= e!111948 tp_is_empty!3937)))

(declare-fun mapIsEmpty!6683 () Bool)

(assert (=> mapIsEmpty!6683 mapRes!6683))

(assert (= (and mapNonEmpty!6682 condMapEmpty!6683) mapIsEmpty!6683))

(assert (= (and mapNonEmpty!6682 (not condMapEmpty!6683)) mapNonEmpty!6683))

(assert (= (and mapNonEmpty!6683 ((_ is ValueCellFull!1625) mapValue!6683)) b!169738))

(assert (= (and mapNonEmpty!6682 ((_ is ValueCellFull!1625) mapDefault!6683)) b!169739))

(declare-fun m!198075 () Bool)

(assert (=> mapNonEmpty!6683 m!198075))

(check-sat (not b!169709) (not b!169737) tp_is_empty!3937 b_and!10553 (not b!169696) (not b!169723) (not bm!17323) (not b!169710) (not bm!17326) (not bm!17320) (not b!169712) (not b!169698) (not d!51515) (not b_next!4165) (not b!169724) (not mapNonEmpty!6683))
(check-sat b_and!10553 (not b_next!4165))
