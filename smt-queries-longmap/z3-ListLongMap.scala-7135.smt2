; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90538 () Bool)

(assert start!90538)

(declare-fun b!1035506 () Bool)

(declare-fun b_free!20863 () Bool)

(declare-fun b_next!20863 () Bool)

(assert (=> b!1035506 (= b_free!20863 (not b_next!20863))))

(declare-fun tp!73716 () Bool)

(declare-fun b_and!33337 () Bool)

(assert (=> b!1035506 (= tp!73716 b_and!33337)))

(declare-fun mapIsEmpty!38385 () Bool)

(declare-fun mapRes!38385 () Bool)

(assert (=> mapIsEmpty!38385 mapRes!38385))

(declare-fun b!1035503 () Bool)

(declare-fun res!691386 () Bool)

(declare-fun e!585569 () Bool)

(assert (=> b!1035503 (=> (not res!691386) (not e!585569))))

(declare-datatypes ((V!37651 0))(
  ( (V!37652 (val!12342 Int)) )
))
(declare-datatypes ((ValueCell!11588 0))(
  ( (ValueCellFull!11588 (v!14921 V!37651)) (EmptyCell!11588) )
))
(declare-datatypes ((array!65199 0))(
  ( (array!65200 (arr!31386 (Array (_ BitVec 32) (_ BitVec 64))) (size!31916 (_ BitVec 32))) )
))
(declare-datatypes ((array!65201 0))(
  ( (array!65202 (arr!31387 (Array (_ BitVec 32) ValueCell!11588)) (size!31917 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5770 0))(
  ( (LongMapFixedSize!5771 (defaultEntry!6263 Int) (mask!30151 (_ BitVec 32)) (extraKeys!5993 (_ BitVec 32)) (zeroValue!6097 V!37651) (minValue!6099 V!37651) (_size!2940 (_ BitVec 32)) (_keys!11446 array!65199) (_values!6286 array!65201) (_vacant!2940 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5770)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1035503 (= res!691386 (validMask!0 (mask!30151 thiss!1427)))))

(declare-fun b!1035504 () Bool)

(declare-fun res!691384 () Bool)

(assert (=> b!1035504 (=> (not res!691384) (not e!585569))))

(assert (=> b!1035504 (= res!691384 (and (= (size!31917 (_values!6286 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30151 thiss!1427))) (= (size!31916 (_keys!11446 thiss!1427)) (size!31917 (_values!6286 thiss!1427))) (bvsge (mask!30151 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5993 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5993 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5993 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5993 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!5993 thiss!1427) #b00000000000000000000000000000001) (bvand (bvand (extraKeys!5993 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (= (bvand (bvand (extraKeys!5993 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1035505 () Bool)

(declare-fun e!585568 () Bool)

(declare-fun e!585567 () Bool)

(assert (=> b!1035505 (= e!585568 (and e!585567 mapRes!38385))))

(declare-fun condMapEmpty!38385 () Bool)

(declare-fun mapDefault!38385 () ValueCell!11588)

(assert (=> b!1035505 (= condMapEmpty!38385 (= (arr!31387 (_values!6286 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11588)) mapDefault!38385)))))

(declare-fun tp_is_empty!24583 () Bool)

(declare-fun e!585566 () Bool)

(declare-fun array_inv!24277 (array!65199) Bool)

(declare-fun array_inv!24278 (array!65201) Bool)

(assert (=> b!1035506 (= e!585566 (and tp!73716 tp_is_empty!24583 (array_inv!24277 (_keys!11446 thiss!1427)) (array_inv!24278 (_values!6286 thiss!1427)) e!585568))))

(declare-fun b!1035507 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65199 (_ BitVec 32)) Bool)

(assert (=> b!1035507 (= e!585569 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11446 thiss!1427) (mask!30151 thiss!1427))))))

(declare-fun b!1035508 () Bool)

(assert (=> b!1035508 (= e!585567 tp_is_empty!24583)))

(declare-fun b!1035509 () Bool)

(declare-fun res!691387 () Bool)

(assert (=> b!1035509 (=> (not res!691387) (not e!585569))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1035509 (= res!691387 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1035510 () Bool)

(declare-fun e!585565 () Bool)

(assert (=> b!1035510 (= e!585565 tp_is_empty!24583)))

(declare-fun res!691385 () Bool)

(assert (=> start!90538 (=> (not res!691385) (not e!585569))))

(declare-fun valid!2167 (LongMapFixedSize!5770) Bool)

(assert (=> start!90538 (= res!691385 (valid!2167 thiss!1427))))

(assert (=> start!90538 e!585569))

(assert (=> start!90538 e!585566))

(assert (=> start!90538 true))

(declare-fun mapNonEmpty!38385 () Bool)

(declare-fun tp!73717 () Bool)

(assert (=> mapNonEmpty!38385 (= mapRes!38385 (and tp!73717 e!585565))))

(declare-fun mapValue!38385 () ValueCell!11588)

(declare-fun mapRest!38385 () (Array (_ BitVec 32) ValueCell!11588))

(declare-fun mapKey!38385 () (_ BitVec 32))

(assert (=> mapNonEmpty!38385 (= (arr!31387 (_values!6286 thiss!1427)) (store mapRest!38385 mapKey!38385 mapValue!38385))))

(assert (= (and start!90538 res!691385) b!1035509))

(assert (= (and b!1035509 res!691387) b!1035503))

(assert (= (and b!1035503 res!691386) b!1035504))

(assert (= (and b!1035504 res!691384) b!1035507))

(assert (= (and b!1035505 condMapEmpty!38385) mapIsEmpty!38385))

(assert (= (and b!1035505 (not condMapEmpty!38385)) mapNonEmpty!38385))

(get-info :version)

(assert (= (and mapNonEmpty!38385 ((_ is ValueCellFull!11588) mapValue!38385)) b!1035510))

(assert (= (and b!1035505 ((_ is ValueCellFull!11588) mapDefault!38385)) b!1035508))

(assert (= b!1035506 b!1035505))

(assert (= start!90538 b!1035506))

(declare-fun m!954863 () Bool)

(assert (=> b!1035506 m!954863))

(declare-fun m!954865 () Bool)

(assert (=> b!1035506 m!954865))

(declare-fun m!954867 () Bool)

(assert (=> start!90538 m!954867))

(declare-fun m!954869 () Bool)

(assert (=> b!1035503 m!954869))

(declare-fun m!954871 () Bool)

(assert (=> mapNonEmpty!38385 m!954871))

(declare-fun m!954873 () Bool)

(assert (=> b!1035507 m!954873))

(check-sat tp_is_empty!24583 (not mapNonEmpty!38385) (not b_next!20863) b_and!33337 (not start!90538) (not b!1035503) (not b!1035506) (not b!1035507))
(check-sat b_and!33337 (not b_next!20863))
(get-model)

(declare-fun d!124383 () Bool)

(assert (=> d!124383 (= (array_inv!24277 (_keys!11446 thiss!1427)) (bvsge (size!31916 (_keys!11446 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1035506 d!124383))

(declare-fun d!124385 () Bool)

(assert (=> d!124385 (= (array_inv!24278 (_values!6286 thiss!1427)) (bvsge (size!31917 (_values!6286 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1035506 d!124385))

(declare-fun b!1035567 () Bool)

(declare-fun e!585614 () Bool)

(declare-fun e!585615 () Bool)

(assert (=> b!1035567 (= e!585614 e!585615)))

(declare-fun c!104700 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1035567 (= c!104700 (validKeyInArray!0 (select (arr!31386 (_keys!11446 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!124387 () Bool)

(declare-fun res!691416 () Bool)

(assert (=> d!124387 (=> res!691416 e!585614)))

(assert (=> d!124387 (= res!691416 (bvsge #b00000000000000000000000000000000 (size!31916 (_keys!11446 thiss!1427))))))

(assert (=> d!124387 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11446 thiss!1427) (mask!30151 thiss!1427)) e!585614)))

(declare-fun b!1035568 () Bool)

(declare-fun e!585613 () Bool)

(declare-fun call!43771 () Bool)

(assert (=> b!1035568 (= e!585613 call!43771)))

(declare-fun b!1035569 () Bool)

(assert (=> b!1035569 (= e!585615 call!43771)))

(declare-fun bm!43768 () Bool)

(assert (=> bm!43768 (= call!43771 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11446 thiss!1427) (mask!30151 thiss!1427)))))

(declare-fun b!1035570 () Bool)

(assert (=> b!1035570 (= e!585615 e!585613)))

(declare-fun lt!456565 () (_ BitVec 64))

(assert (=> b!1035570 (= lt!456565 (select (arr!31386 (_keys!11446 thiss!1427)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33770 0))(
  ( (Unit!33771) )
))
(declare-fun lt!456563 () Unit!33770)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65199 (_ BitVec 64) (_ BitVec 32)) Unit!33770)

(assert (=> b!1035570 (= lt!456563 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11446 thiss!1427) lt!456565 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!65199 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1035570 (arrayContainsKey!0 (_keys!11446 thiss!1427) lt!456565 #b00000000000000000000000000000000)))

(declare-fun lt!456564 () Unit!33770)

(assert (=> b!1035570 (= lt!456564 lt!456563)))

(declare-fun res!691417 () Bool)

(declare-datatypes ((SeekEntryResult!9735 0))(
  ( (MissingZero!9735 (index!41311 (_ BitVec 32))) (Found!9735 (index!41312 (_ BitVec 32))) (Intermediate!9735 (undefined!10547 Bool) (index!41313 (_ BitVec 32)) (x!92401 (_ BitVec 32))) (Undefined!9735) (MissingVacant!9735 (index!41314 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65199 (_ BitVec 32)) SeekEntryResult!9735)

(assert (=> b!1035570 (= res!691417 (= (seekEntryOrOpen!0 (select (arr!31386 (_keys!11446 thiss!1427)) #b00000000000000000000000000000000) (_keys!11446 thiss!1427) (mask!30151 thiss!1427)) (Found!9735 #b00000000000000000000000000000000)))))

(assert (=> b!1035570 (=> (not res!691417) (not e!585613))))

(assert (= (and d!124387 (not res!691416)) b!1035567))

(assert (= (and b!1035567 c!104700) b!1035570))

(assert (= (and b!1035567 (not c!104700)) b!1035569))

(assert (= (and b!1035570 res!691417) b!1035568))

(assert (= (or b!1035568 b!1035569) bm!43768))

(declare-fun m!954899 () Bool)

(assert (=> b!1035567 m!954899))

(assert (=> b!1035567 m!954899))

(declare-fun m!954901 () Bool)

(assert (=> b!1035567 m!954901))

(declare-fun m!954903 () Bool)

(assert (=> bm!43768 m!954903))

(assert (=> b!1035570 m!954899))

(declare-fun m!954905 () Bool)

(assert (=> b!1035570 m!954905))

(declare-fun m!954907 () Bool)

(assert (=> b!1035570 m!954907))

(assert (=> b!1035570 m!954899))

(declare-fun m!954909 () Bool)

(assert (=> b!1035570 m!954909))

(assert (=> b!1035507 d!124387))

(declare-fun d!124389 () Bool)

(assert (=> d!124389 (= (validMask!0 (mask!30151 thiss!1427)) (and (or (= (mask!30151 thiss!1427) #b00000000000000000000000000000111) (= (mask!30151 thiss!1427) #b00000000000000000000000000001111) (= (mask!30151 thiss!1427) #b00000000000000000000000000011111) (= (mask!30151 thiss!1427) #b00000000000000000000000000111111) (= (mask!30151 thiss!1427) #b00000000000000000000000001111111) (= (mask!30151 thiss!1427) #b00000000000000000000000011111111) (= (mask!30151 thiss!1427) #b00000000000000000000000111111111) (= (mask!30151 thiss!1427) #b00000000000000000000001111111111) (= (mask!30151 thiss!1427) #b00000000000000000000011111111111) (= (mask!30151 thiss!1427) #b00000000000000000000111111111111) (= (mask!30151 thiss!1427) #b00000000000000000001111111111111) (= (mask!30151 thiss!1427) #b00000000000000000011111111111111) (= (mask!30151 thiss!1427) #b00000000000000000111111111111111) (= (mask!30151 thiss!1427) #b00000000000000001111111111111111) (= (mask!30151 thiss!1427) #b00000000000000011111111111111111) (= (mask!30151 thiss!1427) #b00000000000000111111111111111111) (= (mask!30151 thiss!1427) #b00000000000001111111111111111111) (= (mask!30151 thiss!1427) #b00000000000011111111111111111111) (= (mask!30151 thiss!1427) #b00000000000111111111111111111111) (= (mask!30151 thiss!1427) #b00000000001111111111111111111111) (= (mask!30151 thiss!1427) #b00000000011111111111111111111111) (= (mask!30151 thiss!1427) #b00000000111111111111111111111111) (= (mask!30151 thiss!1427) #b00000001111111111111111111111111) (= (mask!30151 thiss!1427) #b00000011111111111111111111111111) (= (mask!30151 thiss!1427) #b00000111111111111111111111111111) (= (mask!30151 thiss!1427) #b00001111111111111111111111111111) (= (mask!30151 thiss!1427) #b00011111111111111111111111111111) (= (mask!30151 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30151 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1035503 d!124389))

(declare-fun d!124391 () Bool)

(declare-fun res!691424 () Bool)

(declare-fun e!585618 () Bool)

(assert (=> d!124391 (=> (not res!691424) (not e!585618))))

(declare-fun simpleValid!412 (LongMapFixedSize!5770) Bool)

(assert (=> d!124391 (= res!691424 (simpleValid!412 thiss!1427))))

(assert (=> d!124391 (= (valid!2167 thiss!1427) e!585618)))

(declare-fun b!1035577 () Bool)

(declare-fun res!691425 () Bool)

(assert (=> b!1035577 (=> (not res!691425) (not e!585618))))

(declare-fun arrayCountValidKeys!0 (array!65199 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1035577 (= res!691425 (= (arrayCountValidKeys!0 (_keys!11446 thiss!1427) #b00000000000000000000000000000000 (size!31916 (_keys!11446 thiss!1427))) (_size!2940 thiss!1427)))))

(declare-fun b!1035578 () Bool)

(declare-fun res!691426 () Bool)

(assert (=> b!1035578 (=> (not res!691426) (not e!585618))))

(assert (=> b!1035578 (= res!691426 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11446 thiss!1427) (mask!30151 thiss!1427)))))

(declare-fun b!1035579 () Bool)

(declare-datatypes ((List!21948 0))(
  ( (Nil!21945) (Cons!21944 (h!23146 (_ BitVec 64)) (t!31142 List!21948)) )
))
(declare-fun arrayNoDuplicates!0 (array!65199 (_ BitVec 32) List!21948) Bool)

(assert (=> b!1035579 (= e!585618 (arrayNoDuplicates!0 (_keys!11446 thiss!1427) #b00000000000000000000000000000000 Nil!21945))))

(assert (= (and d!124391 res!691424) b!1035577))

(assert (= (and b!1035577 res!691425) b!1035578))

(assert (= (and b!1035578 res!691426) b!1035579))

(declare-fun m!954911 () Bool)

(assert (=> d!124391 m!954911))

(declare-fun m!954913 () Bool)

(assert (=> b!1035577 m!954913))

(assert (=> b!1035578 m!954873))

(declare-fun m!954915 () Bool)

(assert (=> b!1035579 m!954915))

(assert (=> start!90538 d!124391))

(declare-fun condMapEmpty!38394 () Bool)

(declare-fun mapDefault!38394 () ValueCell!11588)

(assert (=> mapNonEmpty!38385 (= condMapEmpty!38394 (= mapRest!38385 ((as const (Array (_ BitVec 32) ValueCell!11588)) mapDefault!38394)))))

(declare-fun e!585623 () Bool)

(declare-fun mapRes!38394 () Bool)

(assert (=> mapNonEmpty!38385 (= tp!73717 (and e!585623 mapRes!38394))))

(declare-fun mapIsEmpty!38394 () Bool)

(assert (=> mapIsEmpty!38394 mapRes!38394))

(declare-fun b!1035587 () Bool)

(assert (=> b!1035587 (= e!585623 tp_is_empty!24583)))

(declare-fun mapNonEmpty!38394 () Bool)

(declare-fun tp!73732 () Bool)

(declare-fun e!585624 () Bool)

(assert (=> mapNonEmpty!38394 (= mapRes!38394 (and tp!73732 e!585624))))

(declare-fun mapRest!38394 () (Array (_ BitVec 32) ValueCell!11588))

(declare-fun mapValue!38394 () ValueCell!11588)

(declare-fun mapKey!38394 () (_ BitVec 32))

(assert (=> mapNonEmpty!38394 (= mapRest!38385 (store mapRest!38394 mapKey!38394 mapValue!38394))))

(declare-fun b!1035586 () Bool)

(assert (=> b!1035586 (= e!585624 tp_is_empty!24583)))

(assert (= (and mapNonEmpty!38385 condMapEmpty!38394) mapIsEmpty!38394))

(assert (= (and mapNonEmpty!38385 (not condMapEmpty!38394)) mapNonEmpty!38394))

(assert (= (and mapNonEmpty!38394 ((_ is ValueCellFull!11588) mapValue!38394)) b!1035586))

(assert (= (and mapNonEmpty!38385 ((_ is ValueCellFull!11588) mapDefault!38394)) b!1035587))

(declare-fun m!954917 () Bool)

(assert (=> mapNonEmpty!38394 m!954917))

(check-sat tp_is_empty!24583 (not b_next!20863) b_and!33337 (not d!124391) (not b!1035579) (not mapNonEmpty!38394) (not b!1035577) (not b!1035570) (not b!1035578) (not bm!43768) (not b!1035567))
(check-sat b_and!33337 (not b_next!20863))
