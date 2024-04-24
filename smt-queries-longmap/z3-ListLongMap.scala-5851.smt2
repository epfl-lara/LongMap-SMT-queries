; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75794 () Bool)

(assert start!75794)

(declare-fun b!890100 () Bool)

(declare-fun b_free!15607 () Bool)

(declare-fun b_next!15607 () Bool)

(assert (=> b!890100 (= b_free!15607 (not b_next!15607))))

(declare-fun tp!54787 () Bool)

(declare-fun b_and!25857 () Bool)

(assert (=> b!890100 (= tp!54787 b_and!25857)))

(declare-fun mapIsEmpty!28454 () Bool)

(declare-fun mapRes!28454 () Bool)

(assert (=> mapIsEmpty!28454 mapRes!28454))

(declare-fun b!890094 () Bool)

(declare-fun e!496184 () Bool)

(declare-fun e!496181 () Bool)

(assert (=> b!890094 (= e!496184 (and e!496181 mapRes!28454))))

(declare-fun condMapEmpty!28454 () Bool)

(declare-datatypes ((array!51887 0))(
  ( (array!51888 (arr!24946 (Array (_ BitVec 32) (_ BitVec 64))) (size!25391 (_ BitVec 32))) )
))
(declare-datatypes ((V!28879 0))(
  ( (V!28880 (val!9018 Int)) )
))
(declare-datatypes ((ValueCell!8486 0))(
  ( (ValueCellFull!8486 (v!11493 V!28879)) (EmptyCell!8486) )
))
(declare-datatypes ((array!51889 0))(
  ( (array!51890 (arr!24947 (Array (_ BitVec 32) ValueCell!8486)) (size!25392 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3988 0))(
  ( (LongMapFixedSize!3989 (defaultEntry!5191 Int) (mask!25676 (_ BitVec 32)) (extraKeys!4885 (_ BitVec 32)) (zeroValue!4989 V!28879) (minValue!4989 V!28879) (_size!2049 (_ BitVec 32)) (_keys!9902 array!51887) (_values!5176 array!51889) (_vacant!2049 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!3988)

(declare-fun mapDefault!28454 () ValueCell!8486)

(assert (=> b!890094 (= condMapEmpty!28454 (= (arr!24947 (_values!5176 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8486)) mapDefault!28454)))))

(declare-fun b!890096 () Bool)

(declare-fun res!602995 () Bool)

(declare-fun e!496180 () Bool)

(assert (=> b!890096 (=> (not res!602995) (not e!496180))))

(assert (=> b!890096 (= res!602995 (= (size!25391 (_keys!9902 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25676 thiss!1181))))))

(declare-fun b!890097 () Bool)

(declare-fun res!602994 () Bool)

(assert (=> b!890097 (=> (not res!602994) (not e!496180))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!890097 (= res!602994 (not (= key!785 (bvneg key!785))))))

(declare-fun b!890098 () Bool)

(declare-fun tp_is_empty!17935 () Bool)

(assert (=> b!890098 (= e!496181 tp_is_empty!17935)))

(declare-fun res!602993 () Bool)

(assert (=> start!75794 (=> (not res!602993) (not e!496180))))

(declare-fun valid!1564 (LongMapFixedSize!3988) Bool)

(assert (=> start!75794 (= res!602993 (valid!1564 thiss!1181))))

(assert (=> start!75794 e!496180))

(declare-fun e!496182 () Bool)

(assert (=> start!75794 e!496182))

(assert (=> start!75794 true))

(declare-fun b!890095 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!890095 (= e!496180 (not (validKeyInArray!0 key!785)))))

(declare-fun b!890099 () Bool)

(declare-fun e!496185 () Bool)

(assert (=> b!890099 (= e!496185 tp_is_empty!17935)))

(declare-fun array_inv!19666 (array!51887) Bool)

(declare-fun array_inv!19667 (array!51889) Bool)

(assert (=> b!890100 (= e!496182 (and tp!54787 tp_is_empty!17935 (array_inv!19666 (_keys!9902 thiss!1181)) (array_inv!19667 (_values!5176 thiss!1181)) e!496184))))

(declare-fun b!890101 () Bool)

(declare-fun res!602992 () Bool)

(assert (=> b!890101 (=> (not res!602992) (not e!496180))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!890101 (= res!602992 (validMask!0 (mask!25676 thiss!1181)))))

(declare-fun mapNonEmpty!28454 () Bool)

(declare-fun tp!54788 () Bool)

(assert (=> mapNonEmpty!28454 (= mapRes!28454 (and tp!54788 e!496185))))

(declare-fun mapValue!28454 () ValueCell!8486)

(declare-fun mapKey!28454 () (_ BitVec 32))

(declare-fun mapRest!28454 () (Array (_ BitVec 32) ValueCell!8486))

(assert (=> mapNonEmpty!28454 (= (arr!24947 (_values!5176 thiss!1181)) (store mapRest!28454 mapKey!28454 mapValue!28454))))

(assert (= (and start!75794 res!602993) b!890097))

(assert (= (and b!890097 res!602994) b!890101))

(assert (= (and b!890101 res!602992) b!890096))

(assert (= (and b!890096 res!602995) b!890095))

(assert (= (and b!890094 condMapEmpty!28454) mapIsEmpty!28454))

(assert (= (and b!890094 (not condMapEmpty!28454)) mapNonEmpty!28454))

(get-info :version)

(assert (= (and mapNonEmpty!28454 ((_ is ValueCellFull!8486) mapValue!28454)) b!890099))

(assert (= (and b!890094 ((_ is ValueCellFull!8486) mapDefault!28454)) b!890098))

(assert (= b!890100 b!890094))

(assert (= start!75794 b!890100))

(declare-fun m!829509 () Bool)

(assert (=> b!890100 m!829509))

(declare-fun m!829511 () Bool)

(assert (=> b!890100 m!829511))

(declare-fun m!829513 () Bool)

(assert (=> b!890095 m!829513))

(declare-fun m!829515 () Bool)

(assert (=> start!75794 m!829515))

(declare-fun m!829517 () Bool)

(assert (=> mapNonEmpty!28454 m!829517))

(declare-fun m!829519 () Bool)

(assert (=> b!890101 m!829519))

(check-sat b_and!25857 (not b!890100) (not b!890101) (not b_next!15607) (not start!75794) (not b!890095) tp_is_empty!17935 (not mapNonEmpty!28454))
(check-sat b_and!25857 (not b_next!15607))
(get-model)

(declare-fun d!110477 () Bool)

(assert (=> d!110477 (= (validMask!0 (mask!25676 thiss!1181)) (and (or (= (mask!25676 thiss!1181) #b00000000000000000000000000000111) (= (mask!25676 thiss!1181) #b00000000000000000000000000001111) (= (mask!25676 thiss!1181) #b00000000000000000000000000011111) (= (mask!25676 thiss!1181) #b00000000000000000000000000111111) (= (mask!25676 thiss!1181) #b00000000000000000000000001111111) (= (mask!25676 thiss!1181) #b00000000000000000000000011111111) (= (mask!25676 thiss!1181) #b00000000000000000000000111111111) (= (mask!25676 thiss!1181) #b00000000000000000000001111111111) (= (mask!25676 thiss!1181) #b00000000000000000000011111111111) (= (mask!25676 thiss!1181) #b00000000000000000000111111111111) (= (mask!25676 thiss!1181) #b00000000000000000001111111111111) (= (mask!25676 thiss!1181) #b00000000000000000011111111111111) (= (mask!25676 thiss!1181) #b00000000000000000111111111111111) (= (mask!25676 thiss!1181) #b00000000000000001111111111111111) (= (mask!25676 thiss!1181) #b00000000000000011111111111111111) (= (mask!25676 thiss!1181) #b00000000000000111111111111111111) (= (mask!25676 thiss!1181) #b00000000000001111111111111111111) (= (mask!25676 thiss!1181) #b00000000000011111111111111111111) (= (mask!25676 thiss!1181) #b00000000000111111111111111111111) (= (mask!25676 thiss!1181) #b00000000001111111111111111111111) (= (mask!25676 thiss!1181) #b00000000011111111111111111111111) (= (mask!25676 thiss!1181) #b00000000111111111111111111111111) (= (mask!25676 thiss!1181) #b00000001111111111111111111111111) (= (mask!25676 thiss!1181) #b00000011111111111111111111111111) (= (mask!25676 thiss!1181) #b00000111111111111111111111111111) (= (mask!25676 thiss!1181) #b00001111111111111111111111111111) (= (mask!25676 thiss!1181) #b00011111111111111111111111111111) (= (mask!25676 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!25676 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!890101 d!110477))

(declare-fun d!110479 () Bool)

(assert (=> d!110479 (= (array_inv!19666 (_keys!9902 thiss!1181)) (bvsge (size!25391 (_keys!9902 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!890100 d!110479))

(declare-fun d!110481 () Bool)

(assert (=> d!110481 (= (array_inv!19667 (_values!5176 thiss!1181)) (bvsge (size!25392 (_values!5176 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!890100 d!110481))

(declare-fun d!110483 () Bool)

(assert (=> d!110483 (= (validKeyInArray!0 key!785) (and (not (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!890095 d!110483))

(declare-fun d!110485 () Bool)

(declare-fun res!603026 () Bool)

(declare-fun e!496224 () Bool)

(assert (=> d!110485 (=> (not res!603026) (not e!496224))))

(declare-fun simpleValid!294 (LongMapFixedSize!3988) Bool)

(assert (=> d!110485 (= res!603026 (simpleValid!294 thiss!1181))))

(assert (=> d!110485 (= (valid!1564 thiss!1181) e!496224)))

(declare-fun b!890156 () Bool)

(declare-fun res!603027 () Bool)

(assert (=> b!890156 (=> (not res!603027) (not e!496224))))

(declare-fun arrayCountValidKeys!0 (array!51887 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!890156 (= res!603027 (= (arrayCountValidKeys!0 (_keys!9902 thiss!1181) #b00000000000000000000000000000000 (size!25391 (_keys!9902 thiss!1181))) (_size!2049 thiss!1181)))))

(declare-fun b!890157 () Bool)

(declare-fun res!603028 () Bool)

(assert (=> b!890157 (=> (not res!603028) (not e!496224))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51887 (_ BitVec 32)) Bool)

(assert (=> b!890157 (= res!603028 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9902 thiss!1181) (mask!25676 thiss!1181)))))

(declare-fun b!890158 () Bool)

(declare-datatypes ((List!17650 0))(
  ( (Nil!17647) (Cons!17646 (h!18783 (_ BitVec 64)) (t!24941 List!17650)) )
))
(declare-fun arrayNoDuplicates!0 (array!51887 (_ BitVec 32) List!17650) Bool)

(assert (=> b!890158 (= e!496224 (arrayNoDuplicates!0 (_keys!9902 thiss!1181) #b00000000000000000000000000000000 Nil!17647))))

(assert (= (and d!110485 res!603026) b!890156))

(assert (= (and b!890156 res!603027) b!890157))

(assert (= (and b!890157 res!603028) b!890158))

(declare-fun m!829545 () Bool)

(assert (=> d!110485 m!829545))

(declare-fun m!829547 () Bool)

(assert (=> b!890156 m!829547))

(declare-fun m!829549 () Bool)

(assert (=> b!890157 m!829549))

(declare-fun m!829551 () Bool)

(assert (=> b!890158 m!829551))

(assert (=> start!75794 d!110485))

(declare-fun condMapEmpty!28463 () Bool)

(declare-fun mapDefault!28463 () ValueCell!8486)

(assert (=> mapNonEmpty!28454 (= condMapEmpty!28463 (= mapRest!28454 ((as const (Array (_ BitVec 32) ValueCell!8486)) mapDefault!28463)))))

(declare-fun e!496229 () Bool)

(declare-fun mapRes!28463 () Bool)

(assert (=> mapNonEmpty!28454 (= tp!54788 (and e!496229 mapRes!28463))))

(declare-fun b!890165 () Bool)

(declare-fun e!496230 () Bool)

(assert (=> b!890165 (= e!496230 tp_is_empty!17935)))

(declare-fun mapIsEmpty!28463 () Bool)

(assert (=> mapIsEmpty!28463 mapRes!28463))

(declare-fun b!890166 () Bool)

(assert (=> b!890166 (= e!496229 tp_is_empty!17935)))

(declare-fun mapNonEmpty!28463 () Bool)

(declare-fun tp!54803 () Bool)

(assert (=> mapNonEmpty!28463 (= mapRes!28463 (and tp!54803 e!496230))))

(declare-fun mapValue!28463 () ValueCell!8486)

(declare-fun mapKey!28463 () (_ BitVec 32))

(declare-fun mapRest!28463 () (Array (_ BitVec 32) ValueCell!8486))

(assert (=> mapNonEmpty!28463 (= mapRest!28454 (store mapRest!28463 mapKey!28463 mapValue!28463))))

(assert (= (and mapNonEmpty!28454 condMapEmpty!28463) mapIsEmpty!28463))

(assert (= (and mapNonEmpty!28454 (not condMapEmpty!28463)) mapNonEmpty!28463))

(assert (= (and mapNonEmpty!28463 ((_ is ValueCellFull!8486) mapValue!28463)) b!890165))

(assert (= (and mapNonEmpty!28454 ((_ is ValueCellFull!8486) mapDefault!28463)) b!890166))

(declare-fun m!829553 () Bool)

(assert (=> mapNonEmpty!28463 m!829553))

(check-sat (not b!890156) (not b!890158) b_and!25857 (not mapNonEmpty!28463) (not b_next!15607) (not b!890157) tp_is_empty!17935 (not d!110485))
(check-sat b_and!25857 (not b_next!15607))
