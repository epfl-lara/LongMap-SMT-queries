; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76144 () Bool)

(assert start!76144)

(declare-fun b!894512 () Bool)

(declare-fun b_free!15873 () Bool)

(declare-fun b_next!15873 () Bool)

(assert (=> b!894512 (= b_free!15873 (not b_next!15873))))

(declare-fun tp!55607 () Bool)

(declare-fun b_and!26165 () Bool)

(assert (=> b!894512 (= tp!55607 b_and!26165)))

(declare-fun mapIsEmpty!28875 () Bool)

(declare-fun mapRes!28875 () Bool)

(assert (=> mapIsEmpty!28875 mapRes!28875))

(declare-fun mapNonEmpty!28875 () Bool)

(declare-fun tp!55606 () Bool)

(declare-fun e!499641 () Bool)

(assert (=> mapNonEmpty!28875 (= mapRes!28875 (and tp!55606 e!499641))))

(declare-fun mapKey!28875 () (_ BitVec 32))

(declare-datatypes ((V!29233 0))(
  ( (V!29234 (val!9151 Int)) )
))
(declare-datatypes ((ValueCell!8619 0))(
  ( (ValueCellFull!8619 (v!11641 V!29233)) (EmptyCell!8619) )
))
(declare-fun mapValue!28875 () ValueCell!8619)

(declare-datatypes ((array!52392 0))(
  ( (array!52393 (arr!25197 (Array (_ BitVec 32) (_ BitVec 64))) (size!25643 (_ BitVec 32))) )
))
(declare-datatypes ((array!52394 0))(
  ( (array!52395 (arr!25198 (Array (_ BitVec 32) ValueCell!8619)) (size!25644 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4254 0))(
  ( (LongMapFixedSize!4255 (defaultEntry!5339 Int) (mask!25898 (_ BitVec 32)) (extraKeys!5035 (_ BitVec 32)) (zeroValue!5139 V!29233) (minValue!5139 V!29233) (_size!2182 (_ BitVec 32)) (_keys!10036 array!52392) (_values!5326 array!52394) (_vacant!2182 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4254)

(declare-fun mapRest!28875 () (Array (_ BitVec 32) ValueCell!8619))

(assert (=> mapNonEmpty!28875 (= (arr!25198 (_values!5326 thiss!1181)) (store mapRest!28875 mapKey!28875 mapValue!28875))))

(declare-fun b!894511 () Bool)

(declare-fun res!605368 () Bool)

(declare-fun e!499639 () Bool)

(assert (=> b!894511 (=> (not res!605368) (not e!499639))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!894511 (= res!605368 (not (= key!785 (bvneg key!785))))))

(declare-fun tp_is_empty!18201 () Bool)

(declare-fun e!499642 () Bool)

(declare-fun e!499644 () Bool)

(declare-fun array_inv!19782 (array!52392) Bool)

(declare-fun array_inv!19783 (array!52394) Bool)

(assert (=> b!894512 (= e!499642 (and tp!55607 tp_is_empty!18201 (array_inv!19782 (_keys!10036 thiss!1181)) (array_inv!19783 (_values!5326 thiss!1181)) e!499644))))

(declare-fun b!894513 () Bool)

(assert (=> b!894513 (= e!499641 tp_is_empty!18201)))

(declare-fun b!894514 () Bool)

(declare-fun e!499643 () Bool)

(assert (=> b!894514 (= e!499643 tp_is_empty!18201)))

(declare-fun b!894515 () Bool)

(assert (=> b!894515 (= e!499644 (and e!499643 mapRes!28875))))

(declare-fun condMapEmpty!28875 () Bool)

(declare-fun mapDefault!28875 () ValueCell!8619)

(assert (=> b!894515 (= condMapEmpty!28875 (= (arr!25198 (_values!5326 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8619)) mapDefault!28875)))))

(declare-fun b!894510 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!894510 (= e!499639 (not (validMask!0 (mask!25898 thiss!1181))))))

(declare-datatypes ((SeekEntryResult!8867 0))(
  ( (MissingZero!8867 (index!37839 (_ BitVec 32))) (Found!8867 (index!37840 (_ BitVec 32))) (Intermediate!8867 (undefined!9679 Bool) (index!37841 (_ BitVec 32)) (x!76047 (_ BitVec 32))) (Undefined!8867) (MissingVacant!8867 (index!37842 (_ BitVec 32))) )
))
(declare-fun lt!404290 () SeekEntryResult!8867)

(declare-fun seekEntry!0 ((_ BitVec 64) array!52392 (_ BitVec 32)) SeekEntryResult!8867)

(assert (=> b!894510 (= lt!404290 (seekEntry!0 key!785 (_keys!10036 thiss!1181) (mask!25898 thiss!1181)))))

(declare-fun res!605367 () Bool)

(assert (=> start!76144 (=> (not res!605367) (not e!499639))))

(declare-fun valid!1642 (LongMapFixedSize!4254) Bool)

(assert (=> start!76144 (= res!605367 (valid!1642 thiss!1181))))

(assert (=> start!76144 e!499639))

(assert (=> start!76144 e!499642))

(assert (=> start!76144 true))

(assert (= (and start!76144 res!605367) b!894511))

(assert (= (and b!894511 res!605368) b!894510))

(assert (= (and b!894515 condMapEmpty!28875) mapIsEmpty!28875))

(assert (= (and b!894515 (not condMapEmpty!28875)) mapNonEmpty!28875))

(get-info :version)

(assert (= (and mapNonEmpty!28875 ((_ is ValueCellFull!8619) mapValue!28875)) b!894513))

(assert (= (and b!894515 ((_ is ValueCellFull!8619) mapDefault!28875)) b!894514))

(assert (= b!894512 b!894515))

(assert (= start!76144 b!894512))

(declare-fun m!832553 () Bool)

(assert (=> mapNonEmpty!28875 m!832553))

(declare-fun m!832555 () Bool)

(assert (=> b!894512 m!832555))

(declare-fun m!832557 () Bool)

(assert (=> b!894512 m!832557))

(declare-fun m!832559 () Bool)

(assert (=> b!894510 m!832559))

(declare-fun m!832561 () Bool)

(assert (=> b!894510 m!832561))

(declare-fun m!832563 () Bool)

(assert (=> start!76144 m!832563))

(check-sat (not b!894510) tp_is_empty!18201 (not b_next!15873) (not mapNonEmpty!28875) (not start!76144) (not b!894512) b_and!26165)
(check-sat b_and!26165 (not b_next!15873))
(get-model)

(declare-fun d!110655 () Bool)

(assert (=> d!110655 (= (array_inv!19782 (_keys!10036 thiss!1181)) (bvsge (size!25643 (_keys!10036 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!894512 d!110655))

(declare-fun d!110657 () Bool)

(assert (=> d!110657 (= (array_inv!19783 (_values!5326 thiss!1181)) (bvsge (size!25644 (_values!5326 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!894512 d!110657))

(declare-fun d!110659 () Bool)

(declare-fun res!605381 () Bool)

(declare-fun e!499665 () Bool)

(assert (=> d!110659 (=> (not res!605381) (not e!499665))))

(declare-fun simpleValid!300 (LongMapFixedSize!4254) Bool)

(assert (=> d!110659 (= res!605381 (simpleValid!300 thiss!1181))))

(assert (=> d!110659 (= (valid!1642 thiss!1181) e!499665)))

(declare-fun b!894540 () Bool)

(declare-fun res!605382 () Bool)

(assert (=> b!894540 (=> (not res!605382) (not e!499665))))

(declare-fun arrayCountValidKeys!0 (array!52392 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!894540 (= res!605382 (= (arrayCountValidKeys!0 (_keys!10036 thiss!1181) #b00000000000000000000000000000000 (size!25643 (_keys!10036 thiss!1181))) (_size!2182 thiss!1181)))))

(declare-fun b!894541 () Bool)

(declare-fun res!605383 () Bool)

(assert (=> b!894541 (=> (not res!605383) (not e!499665))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52392 (_ BitVec 32)) Bool)

(assert (=> b!894541 (= res!605383 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10036 thiss!1181) (mask!25898 thiss!1181)))))

(declare-fun b!894542 () Bool)

(declare-datatypes ((List!17807 0))(
  ( (Nil!17804) (Cons!17803 (h!18936 (_ BitVec 64)) (t!25146 List!17807)) )
))
(declare-fun arrayNoDuplicates!0 (array!52392 (_ BitVec 32) List!17807) Bool)

(assert (=> b!894542 (= e!499665 (arrayNoDuplicates!0 (_keys!10036 thiss!1181) #b00000000000000000000000000000000 Nil!17804))))

(assert (= (and d!110659 res!605381) b!894540))

(assert (= (and b!894540 res!605382) b!894541))

(assert (= (and b!894541 res!605383) b!894542))

(declare-fun m!832577 () Bool)

(assert (=> d!110659 m!832577))

(declare-fun m!832579 () Bool)

(assert (=> b!894540 m!832579))

(declare-fun m!832581 () Bool)

(assert (=> b!894541 m!832581))

(declare-fun m!832583 () Bool)

(assert (=> b!894542 m!832583))

(assert (=> start!76144 d!110659))

(declare-fun d!110661 () Bool)

(assert (=> d!110661 (= (validMask!0 (mask!25898 thiss!1181)) (and (or (= (mask!25898 thiss!1181) #b00000000000000000000000000000111) (= (mask!25898 thiss!1181) #b00000000000000000000000000001111) (= (mask!25898 thiss!1181) #b00000000000000000000000000011111) (= (mask!25898 thiss!1181) #b00000000000000000000000000111111) (= (mask!25898 thiss!1181) #b00000000000000000000000001111111) (= (mask!25898 thiss!1181) #b00000000000000000000000011111111) (= (mask!25898 thiss!1181) #b00000000000000000000000111111111) (= (mask!25898 thiss!1181) #b00000000000000000000001111111111) (= (mask!25898 thiss!1181) #b00000000000000000000011111111111) (= (mask!25898 thiss!1181) #b00000000000000000000111111111111) (= (mask!25898 thiss!1181) #b00000000000000000001111111111111) (= (mask!25898 thiss!1181) #b00000000000000000011111111111111) (= (mask!25898 thiss!1181) #b00000000000000000111111111111111) (= (mask!25898 thiss!1181) #b00000000000000001111111111111111) (= (mask!25898 thiss!1181) #b00000000000000011111111111111111) (= (mask!25898 thiss!1181) #b00000000000000111111111111111111) (= (mask!25898 thiss!1181) #b00000000000001111111111111111111) (= (mask!25898 thiss!1181) #b00000000000011111111111111111111) (= (mask!25898 thiss!1181) #b00000000000111111111111111111111) (= (mask!25898 thiss!1181) #b00000000001111111111111111111111) (= (mask!25898 thiss!1181) #b00000000011111111111111111111111) (= (mask!25898 thiss!1181) #b00000000111111111111111111111111) (= (mask!25898 thiss!1181) #b00000001111111111111111111111111) (= (mask!25898 thiss!1181) #b00000011111111111111111111111111) (= (mask!25898 thiss!1181) #b00000111111111111111111111111111) (= (mask!25898 thiss!1181) #b00001111111111111111111111111111) (= (mask!25898 thiss!1181) #b00011111111111111111111111111111) (= (mask!25898 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!25898 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!894510 d!110661))

(declare-fun b!894555 () Bool)

(declare-fun e!499674 () SeekEntryResult!8867)

(declare-fun lt!404304 () SeekEntryResult!8867)

(assert (=> b!894555 (= e!499674 (Found!8867 (index!37841 lt!404304)))))

(declare-fun b!894556 () Bool)

(declare-fun e!499673 () SeekEntryResult!8867)

(assert (=> b!894556 (= e!499673 e!499674)))

(declare-fun lt!404302 () (_ BitVec 64))

(assert (=> b!894556 (= lt!404302 (select (arr!25197 (_keys!10036 thiss!1181)) (index!37841 lt!404304)))))

(declare-fun c!94408 () Bool)

(assert (=> b!894556 (= c!94408 (= lt!404302 key!785))))

(declare-fun b!894557 () Bool)

(declare-fun e!499672 () SeekEntryResult!8867)

(assert (=> b!894557 (= e!499672 (MissingZero!8867 (index!37841 lt!404304)))))

(declare-fun d!110663 () Bool)

(declare-fun lt!404305 () SeekEntryResult!8867)

(assert (=> d!110663 (and (or ((_ is MissingVacant!8867) lt!404305) (not ((_ is Found!8867) lt!404305)) (and (bvsge (index!37840 lt!404305) #b00000000000000000000000000000000) (bvslt (index!37840 lt!404305) (size!25643 (_keys!10036 thiss!1181))))) (not ((_ is MissingVacant!8867) lt!404305)) (or (not ((_ is Found!8867) lt!404305)) (= (select (arr!25197 (_keys!10036 thiss!1181)) (index!37840 lt!404305)) key!785)))))

(assert (=> d!110663 (= lt!404305 e!499673)))

(declare-fun c!94407 () Bool)

(assert (=> d!110663 (= c!94407 (and ((_ is Intermediate!8867) lt!404304) (undefined!9679 lt!404304)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52392 (_ BitVec 32)) SeekEntryResult!8867)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!110663 (= lt!404304 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!25898 thiss!1181)) key!785 (_keys!10036 thiss!1181) (mask!25898 thiss!1181)))))

(assert (=> d!110663 (validMask!0 (mask!25898 thiss!1181))))

(assert (=> d!110663 (= (seekEntry!0 key!785 (_keys!10036 thiss!1181) (mask!25898 thiss!1181)) lt!404305)))

(declare-fun b!894558 () Bool)

(declare-fun c!94409 () Bool)

(assert (=> b!894558 (= c!94409 (= lt!404302 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!894558 (= e!499674 e!499672)))

(declare-fun b!894559 () Bool)

(assert (=> b!894559 (= e!499673 Undefined!8867)))

(declare-fun b!894560 () Bool)

(declare-fun lt!404303 () SeekEntryResult!8867)

(assert (=> b!894560 (= e!499672 (ite ((_ is MissingVacant!8867) lt!404303) (MissingZero!8867 (index!37842 lt!404303)) lt!404303))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52392 (_ BitVec 32)) SeekEntryResult!8867)

(assert (=> b!894560 (= lt!404303 (seekKeyOrZeroReturnVacant!0 (x!76047 lt!404304) (index!37841 lt!404304) (index!37841 lt!404304) key!785 (_keys!10036 thiss!1181) (mask!25898 thiss!1181)))))

(assert (= (and d!110663 c!94407) b!894559))

(assert (= (and d!110663 (not c!94407)) b!894556))

(assert (= (and b!894556 c!94408) b!894555))

(assert (= (and b!894556 (not c!94408)) b!894558))

(assert (= (and b!894558 c!94409) b!894557))

(assert (= (and b!894558 (not c!94409)) b!894560))

(declare-fun m!832585 () Bool)

(assert (=> b!894556 m!832585))

(declare-fun m!832587 () Bool)

(assert (=> d!110663 m!832587))

(declare-fun m!832589 () Bool)

(assert (=> d!110663 m!832589))

(assert (=> d!110663 m!832589))

(declare-fun m!832591 () Bool)

(assert (=> d!110663 m!832591))

(assert (=> d!110663 m!832559))

(declare-fun m!832593 () Bool)

(assert (=> b!894560 m!832593))

(assert (=> b!894510 d!110663))

(declare-fun b!894567 () Bool)

(declare-fun e!499679 () Bool)

(assert (=> b!894567 (= e!499679 tp_is_empty!18201)))

(declare-fun mapNonEmpty!28881 () Bool)

(declare-fun mapRes!28881 () Bool)

(declare-fun tp!55616 () Bool)

(assert (=> mapNonEmpty!28881 (= mapRes!28881 (and tp!55616 e!499679))))

(declare-fun mapKey!28881 () (_ BitVec 32))

(declare-fun mapValue!28881 () ValueCell!8619)

(declare-fun mapRest!28881 () (Array (_ BitVec 32) ValueCell!8619))

(assert (=> mapNonEmpty!28881 (= mapRest!28875 (store mapRest!28881 mapKey!28881 mapValue!28881))))

(declare-fun mapIsEmpty!28881 () Bool)

(assert (=> mapIsEmpty!28881 mapRes!28881))

(declare-fun condMapEmpty!28881 () Bool)

(declare-fun mapDefault!28881 () ValueCell!8619)

(assert (=> mapNonEmpty!28875 (= condMapEmpty!28881 (= mapRest!28875 ((as const (Array (_ BitVec 32) ValueCell!8619)) mapDefault!28881)))))

(declare-fun e!499680 () Bool)

(assert (=> mapNonEmpty!28875 (= tp!55606 (and e!499680 mapRes!28881))))

(declare-fun b!894568 () Bool)

(assert (=> b!894568 (= e!499680 tp_is_empty!18201)))

(assert (= (and mapNonEmpty!28875 condMapEmpty!28881) mapIsEmpty!28881))

(assert (= (and mapNonEmpty!28875 (not condMapEmpty!28881)) mapNonEmpty!28881))

(assert (= (and mapNonEmpty!28881 ((_ is ValueCellFull!8619) mapValue!28881)) b!894567))

(assert (= (and mapNonEmpty!28875 ((_ is ValueCellFull!8619) mapDefault!28881)) b!894568))

(declare-fun m!832595 () Bool)

(assert (=> mapNonEmpty!28881 m!832595))

(check-sat (not mapNonEmpty!28881) tp_is_empty!18201 (not b!894560) (not b!894541) (not d!110659) (not d!110663) (not b_next!15873) (not b!894540) (not b!894542) b_and!26165)
(check-sat b_and!26165 (not b_next!15873))
