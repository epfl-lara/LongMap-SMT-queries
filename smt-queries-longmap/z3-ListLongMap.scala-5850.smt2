; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75586 () Bool)

(assert start!75586)

(declare-fun b!888817 () Bool)

(declare-fun b_free!15601 () Bool)

(declare-fun b_next!15601 () Bool)

(assert (=> b!888817 (= b_free!15601 (not b_next!15601))))

(declare-fun tp!54766 () Bool)

(declare-fun b_and!25815 () Bool)

(assert (=> b!888817 (= tp!54766 b_and!25815)))

(declare-datatypes ((array!51817 0))(
  ( (array!51818 (arr!24917 (Array (_ BitVec 32) (_ BitVec 64))) (size!25362 (_ BitVec 32))) )
))
(declare-datatypes ((V!28871 0))(
  ( (V!28872 (val!9015 Int)) )
))
(declare-datatypes ((ValueCell!8483 0))(
  ( (ValueCellFull!8483 (v!11487 V!28871)) (EmptyCell!8483) )
))
(declare-datatypes ((array!51819 0))(
  ( (array!51820 (arr!24918 (Array (_ BitVec 32) ValueCell!8483)) (size!25363 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3982 0))(
  ( (LongMapFixedSize!3983 (defaultEntry!5188 Int) (mask!25619 (_ BitVec 32)) (extraKeys!4882 (_ BitVec 32)) (zeroValue!4986 V!28871) (minValue!4986 V!28871) (_size!2046 (_ BitVec 32)) (_keys!9865 array!51817) (_values!5173 array!51819) (_vacant!2046 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!3982)

(declare-fun e!495359 () Bool)

(declare-fun e!495356 () Bool)

(declare-fun tp_is_empty!17929 () Bool)

(declare-fun array_inv!19648 (array!51817) Bool)

(declare-fun array_inv!19649 (array!51819) Bool)

(assert (=> b!888817 (= e!495356 (and tp!54766 tp_is_empty!17929 (array_inv!19648 (_keys!9865 thiss!1181)) (array_inv!19649 (_values!5173 thiss!1181)) e!495359))))

(declare-fun b!888818 () Bool)

(declare-fun e!495355 () Bool)

(declare-fun mapRes!28441 () Bool)

(assert (=> b!888818 (= e!495359 (and e!495355 mapRes!28441))))

(declare-fun condMapEmpty!28441 () Bool)

(declare-fun mapDefault!28441 () ValueCell!8483)

(assert (=> b!888818 (= condMapEmpty!28441 (= (arr!24918 (_values!5173 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8483)) mapDefault!28441)))))

(declare-fun b!888819 () Bool)

(declare-fun e!495360 () Bool)

(assert (=> b!888819 (= e!495360 tp_is_empty!17929)))

(declare-fun b!888820 () Bool)

(declare-fun e!495357 () Bool)

(assert (=> b!888820 (= e!495357 (not (= (size!25362 (_keys!9865 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25619 thiss!1181)))))))

(declare-fun b!888821 () Bool)

(declare-fun res!602475 () Bool)

(assert (=> b!888821 (=> (not res!602475) (not e!495357))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!888821 (= res!602475 (validMask!0 (mask!25619 thiss!1181)))))

(declare-fun mapIsEmpty!28441 () Bool)

(assert (=> mapIsEmpty!28441 mapRes!28441))

(declare-fun b!888822 () Bool)

(declare-fun res!602474 () Bool)

(assert (=> b!888822 (=> (not res!602474) (not e!495357))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!888822 (= res!602474 (not (= key!785 (bvneg key!785))))))

(declare-fun res!602473 () Bool)

(assert (=> start!75586 (=> (not res!602473) (not e!495357))))

(declare-fun valid!1559 (LongMapFixedSize!3982) Bool)

(assert (=> start!75586 (= res!602473 (valid!1559 thiss!1181))))

(assert (=> start!75586 e!495357))

(assert (=> start!75586 e!495356))

(assert (=> start!75586 true))

(declare-fun mapNonEmpty!28441 () Bool)

(declare-fun tp!54765 () Bool)

(assert (=> mapNonEmpty!28441 (= mapRes!28441 (and tp!54765 e!495360))))

(declare-fun mapValue!28441 () ValueCell!8483)

(declare-fun mapKey!28441 () (_ BitVec 32))

(declare-fun mapRest!28441 () (Array (_ BitVec 32) ValueCell!8483))

(assert (=> mapNonEmpty!28441 (= (arr!24918 (_values!5173 thiss!1181)) (store mapRest!28441 mapKey!28441 mapValue!28441))))

(declare-fun b!888823 () Bool)

(assert (=> b!888823 (= e!495355 tp_is_empty!17929)))

(assert (= (and start!75586 res!602473) b!888822))

(assert (= (and b!888822 res!602474) b!888821))

(assert (= (and b!888821 res!602475) b!888820))

(assert (= (and b!888818 condMapEmpty!28441) mapIsEmpty!28441))

(assert (= (and b!888818 (not condMapEmpty!28441)) mapNonEmpty!28441))

(get-info :version)

(assert (= (and mapNonEmpty!28441 ((_ is ValueCellFull!8483) mapValue!28441)) b!888819))

(assert (= (and b!888818 ((_ is ValueCellFull!8483) mapDefault!28441)) b!888823))

(assert (= b!888817 b!888818))

(assert (= start!75586 b!888817))

(declare-fun m!827395 () Bool)

(assert (=> b!888817 m!827395))

(declare-fun m!827397 () Bool)

(assert (=> b!888817 m!827397))

(declare-fun m!827399 () Bool)

(assert (=> b!888821 m!827399))

(declare-fun m!827401 () Bool)

(assert (=> start!75586 m!827401))

(declare-fun m!827403 () Bool)

(assert (=> mapNonEmpty!28441 m!827403))

(check-sat (not b!888821) b_and!25815 (not b_next!15601) (not start!75586) tp_is_empty!17929 (not mapNonEmpty!28441) (not b!888817))
(check-sat b_and!25815 (not b_next!15601))
(get-model)

(declare-fun d!109939 () Bool)

(declare-fun res!602500 () Bool)

(declare-fun e!495399 () Bool)

(assert (=> d!109939 (=> (not res!602500) (not e!495399))))

(declare-fun simpleValid!293 (LongMapFixedSize!3982) Bool)

(assert (=> d!109939 (= res!602500 (simpleValid!293 thiss!1181))))

(assert (=> d!109939 (= (valid!1559 thiss!1181) e!495399)))

(declare-fun b!888872 () Bool)

(declare-fun res!602501 () Bool)

(assert (=> b!888872 (=> (not res!602501) (not e!495399))))

(declare-fun arrayCountValidKeys!0 (array!51817 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!888872 (= res!602501 (= (arrayCountValidKeys!0 (_keys!9865 thiss!1181) #b00000000000000000000000000000000 (size!25362 (_keys!9865 thiss!1181))) (_size!2046 thiss!1181)))))

(declare-fun b!888873 () Bool)

(declare-fun res!602502 () Bool)

(assert (=> b!888873 (=> (not res!602502) (not e!495399))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51817 (_ BitVec 32)) Bool)

(assert (=> b!888873 (= res!602502 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9865 thiss!1181) (mask!25619 thiss!1181)))))

(declare-fun b!888874 () Bool)

(declare-datatypes ((List!17706 0))(
  ( (Nil!17703) (Cons!17702 (h!18833 (_ BitVec 64)) (t!24996 List!17706)) )
))
(declare-fun arrayNoDuplicates!0 (array!51817 (_ BitVec 32) List!17706) Bool)

(assert (=> b!888874 (= e!495399 (arrayNoDuplicates!0 (_keys!9865 thiss!1181) #b00000000000000000000000000000000 Nil!17703))))

(assert (= (and d!109939 res!602500) b!888872))

(assert (= (and b!888872 res!602501) b!888873))

(assert (= (and b!888873 res!602502) b!888874))

(declare-fun m!827425 () Bool)

(assert (=> d!109939 m!827425))

(declare-fun m!827427 () Bool)

(assert (=> b!888872 m!827427))

(declare-fun m!827429 () Bool)

(assert (=> b!888873 m!827429))

(declare-fun m!827431 () Bool)

(assert (=> b!888874 m!827431))

(assert (=> start!75586 d!109939))

(declare-fun d!109941 () Bool)

(assert (=> d!109941 (= (validMask!0 (mask!25619 thiss!1181)) (and (or (= (mask!25619 thiss!1181) #b00000000000000000000000000000111) (= (mask!25619 thiss!1181) #b00000000000000000000000000001111) (= (mask!25619 thiss!1181) #b00000000000000000000000000011111) (= (mask!25619 thiss!1181) #b00000000000000000000000000111111) (= (mask!25619 thiss!1181) #b00000000000000000000000001111111) (= (mask!25619 thiss!1181) #b00000000000000000000000011111111) (= (mask!25619 thiss!1181) #b00000000000000000000000111111111) (= (mask!25619 thiss!1181) #b00000000000000000000001111111111) (= (mask!25619 thiss!1181) #b00000000000000000000011111111111) (= (mask!25619 thiss!1181) #b00000000000000000000111111111111) (= (mask!25619 thiss!1181) #b00000000000000000001111111111111) (= (mask!25619 thiss!1181) #b00000000000000000011111111111111) (= (mask!25619 thiss!1181) #b00000000000000000111111111111111) (= (mask!25619 thiss!1181) #b00000000000000001111111111111111) (= (mask!25619 thiss!1181) #b00000000000000011111111111111111) (= (mask!25619 thiss!1181) #b00000000000000111111111111111111) (= (mask!25619 thiss!1181) #b00000000000001111111111111111111) (= (mask!25619 thiss!1181) #b00000000000011111111111111111111) (= (mask!25619 thiss!1181) #b00000000000111111111111111111111) (= (mask!25619 thiss!1181) #b00000000001111111111111111111111) (= (mask!25619 thiss!1181) #b00000000011111111111111111111111) (= (mask!25619 thiss!1181) #b00000000111111111111111111111111) (= (mask!25619 thiss!1181) #b00000001111111111111111111111111) (= (mask!25619 thiss!1181) #b00000011111111111111111111111111) (= (mask!25619 thiss!1181) #b00000111111111111111111111111111) (= (mask!25619 thiss!1181) #b00001111111111111111111111111111) (= (mask!25619 thiss!1181) #b00011111111111111111111111111111) (= (mask!25619 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!25619 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!888821 d!109941))

(declare-fun d!109943 () Bool)

(assert (=> d!109943 (= (array_inv!19648 (_keys!9865 thiss!1181)) (bvsge (size!25362 (_keys!9865 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!888817 d!109943))

(declare-fun d!109945 () Bool)

(assert (=> d!109945 (= (array_inv!19649 (_values!5173 thiss!1181)) (bvsge (size!25363 (_values!5173 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!888817 d!109945))

(declare-fun mapNonEmpty!28450 () Bool)

(declare-fun mapRes!28450 () Bool)

(declare-fun tp!54781 () Bool)

(declare-fun e!495405 () Bool)

(assert (=> mapNonEmpty!28450 (= mapRes!28450 (and tp!54781 e!495405))))

(declare-fun mapValue!28450 () ValueCell!8483)

(declare-fun mapKey!28450 () (_ BitVec 32))

(declare-fun mapRest!28450 () (Array (_ BitVec 32) ValueCell!8483))

(assert (=> mapNonEmpty!28450 (= mapRest!28441 (store mapRest!28450 mapKey!28450 mapValue!28450))))

(declare-fun mapIsEmpty!28450 () Bool)

(assert (=> mapIsEmpty!28450 mapRes!28450))

(declare-fun b!888882 () Bool)

(declare-fun e!495404 () Bool)

(assert (=> b!888882 (= e!495404 tp_is_empty!17929)))

(declare-fun condMapEmpty!28450 () Bool)

(declare-fun mapDefault!28450 () ValueCell!8483)

(assert (=> mapNonEmpty!28441 (= condMapEmpty!28450 (= mapRest!28441 ((as const (Array (_ BitVec 32) ValueCell!8483)) mapDefault!28450)))))

(assert (=> mapNonEmpty!28441 (= tp!54765 (and e!495404 mapRes!28450))))

(declare-fun b!888881 () Bool)

(assert (=> b!888881 (= e!495405 tp_is_empty!17929)))

(assert (= (and mapNonEmpty!28441 condMapEmpty!28450) mapIsEmpty!28450))

(assert (= (and mapNonEmpty!28441 (not condMapEmpty!28450)) mapNonEmpty!28450))

(assert (= (and mapNonEmpty!28450 ((_ is ValueCellFull!8483) mapValue!28450)) b!888881))

(assert (= (and mapNonEmpty!28441 ((_ is ValueCellFull!8483) mapDefault!28450)) b!888882))

(declare-fun m!827433 () Bool)

(assert (=> mapNonEmpty!28450 m!827433))

(check-sat b_and!25815 (not mapNonEmpty!28450) (not b_next!15601) (not b!888874) (not b!888873) (not b!888872) (not d!109939) tp_is_empty!17929)
(check-sat b_and!25815 (not b_next!15601))
(get-model)

(declare-fun b!888891 () Bool)

(declare-fun res!602511 () Bool)

(declare-fun e!495408 () Bool)

(assert (=> b!888891 (=> (not res!602511) (not e!495408))))

(assert (=> b!888891 (= res!602511 (and (= (size!25363 (_values!5173 thiss!1181)) (bvadd (mask!25619 thiss!1181) #b00000000000000000000000000000001)) (= (size!25362 (_keys!9865 thiss!1181)) (size!25363 (_values!5173 thiss!1181))) (bvsge (_size!2046 thiss!1181) #b00000000000000000000000000000000) (bvsle (_size!2046 thiss!1181) (bvadd (mask!25619 thiss!1181) #b00000000000000000000000000000001))))))

(declare-fun b!888894 () Bool)

(assert (=> b!888894 (= e!495408 (and (bvsge (extraKeys!4882 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!4882 thiss!1181) #b00000000000000000000000000000011) (bvsge (_vacant!2046 thiss!1181) #b00000000000000000000000000000000)))))

(declare-fun d!109947 () Bool)

(declare-fun res!602512 () Bool)

(assert (=> d!109947 (=> (not res!602512) (not e!495408))))

(assert (=> d!109947 (= res!602512 (validMask!0 (mask!25619 thiss!1181)))))

(assert (=> d!109947 (= (simpleValid!293 thiss!1181) e!495408)))

(declare-fun b!888893 () Bool)

(declare-fun res!602514 () Bool)

(assert (=> b!888893 (=> (not res!602514) (not e!495408))))

(declare-fun size!25368 (LongMapFixedSize!3982) (_ BitVec 32))

(assert (=> b!888893 (= res!602514 (= (size!25368 thiss!1181) (bvadd (_size!2046 thiss!1181) (bvsdiv (bvadd (extraKeys!4882 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!888892 () Bool)

(declare-fun res!602513 () Bool)

(assert (=> b!888892 (=> (not res!602513) (not e!495408))))

(assert (=> b!888892 (= res!602513 (bvsge (size!25368 thiss!1181) (_size!2046 thiss!1181)))))

(assert (= (and d!109947 res!602512) b!888891))

(assert (= (and b!888891 res!602511) b!888892))

(assert (= (and b!888892 res!602513) b!888893))

(assert (= (and b!888893 res!602514) b!888894))

(assert (=> d!109947 m!827399))

(declare-fun m!827435 () Bool)

(assert (=> b!888893 m!827435))

(assert (=> b!888892 m!827435))

(assert (=> d!109939 d!109947))

(declare-fun d!109949 () Bool)

(declare-fun lt!401747 () (_ BitVec 32))

(assert (=> d!109949 (and (bvsge lt!401747 #b00000000000000000000000000000000) (bvsle lt!401747 (bvsub (size!25362 (_keys!9865 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun e!495413 () (_ BitVec 32))

(assert (=> d!109949 (= lt!401747 e!495413)))

(declare-fun c!93873 () Bool)

(assert (=> d!109949 (= c!93873 (bvsge #b00000000000000000000000000000000 (size!25362 (_keys!9865 thiss!1181))))))

(assert (=> d!109949 (and (bvsle #b00000000000000000000000000000000 (size!25362 (_keys!9865 thiss!1181))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!25362 (_keys!9865 thiss!1181)) (size!25362 (_keys!9865 thiss!1181))))))

(assert (=> d!109949 (= (arrayCountValidKeys!0 (_keys!9865 thiss!1181) #b00000000000000000000000000000000 (size!25362 (_keys!9865 thiss!1181))) lt!401747)))

(declare-fun b!888903 () Bool)

(declare-fun e!495414 () (_ BitVec 32))

(declare-fun call!39478 () (_ BitVec 32))

(assert (=> b!888903 (= e!495414 (bvadd #b00000000000000000000000000000001 call!39478))))

(declare-fun bm!39475 () Bool)

(assert (=> bm!39475 (= call!39478 (arrayCountValidKeys!0 (_keys!9865 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25362 (_keys!9865 thiss!1181))))))

(declare-fun b!888904 () Bool)

(assert (=> b!888904 (= e!495414 call!39478)))

(declare-fun b!888905 () Bool)

(assert (=> b!888905 (= e!495413 e!495414)))

(declare-fun c!93874 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!888905 (= c!93874 (validKeyInArray!0 (select (arr!24917 (_keys!9865 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!888906 () Bool)

(assert (=> b!888906 (= e!495413 #b00000000000000000000000000000000)))

(assert (= (and d!109949 c!93873) b!888906))

(assert (= (and d!109949 (not c!93873)) b!888905))

(assert (= (and b!888905 c!93874) b!888903))

(assert (= (and b!888905 (not c!93874)) b!888904))

(assert (= (or b!888903 b!888904) bm!39475))

(declare-fun m!827437 () Bool)

(assert (=> bm!39475 m!827437))

(declare-fun m!827439 () Bool)

(assert (=> b!888905 m!827439))

(assert (=> b!888905 m!827439))

(declare-fun m!827441 () Bool)

(assert (=> b!888905 m!827441))

(assert (=> b!888872 d!109949))

(declare-fun b!888915 () Bool)

(declare-fun e!495422 () Bool)

(declare-fun e!495421 () Bool)

(assert (=> b!888915 (= e!495422 e!495421)))

(declare-fun lt!401754 () (_ BitVec 64))

(assert (=> b!888915 (= lt!401754 (select (arr!24917 (_keys!9865 thiss!1181)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!30222 0))(
  ( (Unit!30223) )
))
(declare-fun lt!401756 () Unit!30222)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!51817 (_ BitVec 64) (_ BitVec 32)) Unit!30222)

(assert (=> b!888915 (= lt!401756 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9865 thiss!1181) lt!401754 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!51817 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!888915 (arrayContainsKey!0 (_keys!9865 thiss!1181) lt!401754 #b00000000000000000000000000000000)))

(declare-fun lt!401755 () Unit!30222)

(assert (=> b!888915 (= lt!401755 lt!401756)))

(declare-fun res!602519 () Bool)

(declare-datatypes ((SeekEntryResult!8766 0))(
  ( (MissingZero!8766 (index!37435 (_ BitVec 32))) (Found!8766 (index!37436 (_ BitVec 32))) (Intermediate!8766 (undefined!9578 Bool) (index!37437 (_ BitVec 32)) (x!75465 (_ BitVec 32))) (Undefined!8766) (MissingVacant!8766 (index!37438 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!51817 (_ BitVec 32)) SeekEntryResult!8766)

(assert (=> b!888915 (= res!602519 (= (seekEntryOrOpen!0 (select (arr!24917 (_keys!9865 thiss!1181)) #b00000000000000000000000000000000) (_keys!9865 thiss!1181) (mask!25619 thiss!1181)) (Found!8766 #b00000000000000000000000000000000)))))

(assert (=> b!888915 (=> (not res!602519) (not e!495421))))

(declare-fun b!888916 () Bool)

(declare-fun e!495423 () Bool)

(assert (=> b!888916 (= e!495423 e!495422)))

(declare-fun c!93877 () Bool)

(assert (=> b!888916 (= c!93877 (validKeyInArray!0 (select (arr!24917 (_keys!9865 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!888917 () Bool)

(declare-fun call!39481 () Bool)

(assert (=> b!888917 (= e!495422 call!39481)))

(declare-fun b!888918 () Bool)

(assert (=> b!888918 (= e!495421 call!39481)))

(declare-fun d!109951 () Bool)

(declare-fun res!602520 () Bool)

(assert (=> d!109951 (=> res!602520 e!495423)))

(assert (=> d!109951 (= res!602520 (bvsge #b00000000000000000000000000000000 (size!25362 (_keys!9865 thiss!1181))))))

(assert (=> d!109951 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9865 thiss!1181) (mask!25619 thiss!1181)) e!495423)))

(declare-fun bm!39478 () Bool)

(assert (=> bm!39478 (= call!39481 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!9865 thiss!1181) (mask!25619 thiss!1181)))))

(assert (= (and d!109951 (not res!602520)) b!888916))

(assert (= (and b!888916 c!93877) b!888915))

(assert (= (and b!888916 (not c!93877)) b!888917))

(assert (= (and b!888915 res!602519) b!888918))

(assert (= (or b!888918 b!888917) bm!39478))

(assert (=> b!888915 m!827439))

(declare-fun m!827443 () Bool)

(assert (=> b!888915 m!827443))

(declare-fun m!827445 () Bool)

(assert (=> b!888915 m!827445))

(assert (=> b!888915 m!827439))

(declare-fun m!827447 () Bool)

(assert (=> b!888915 m!827447))

(assert (=> b!888916 m!827439))

(assert (=> b!888916 m!827439))

(assert (=> b!888916 m!827441))

(declare-fun m!827449 () Bool)

(assert (=> bm!39478 m!827449))

(assert (=> b!888873 d!109951))

(declare-fun b!888929 () Bool)

(declare-fun e!495434 () Bool)

(declare-fun call!39484 () Bool)

(assert (=> b!888929 (= e!495434 call!39484)))

(declare-fun b!888930 () Bool)

(declare-fun e!495433 () Bool)

(declare-fun contains!4310 (List!17706 (_ BitVec 64)) Bool)

(assert (=> b!888930 (= e!495433 (contains!4310 Nil!17703 (select (arr!24917 (_keys!9865 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!888931 () Bool)

(assert (=> b!888931 (= e!495434 call!39484)))

(declare-fun b!888932 () Bool)

(declare-fun e!495432 () Bool)

(assert (=> b!888932 (= e!495432 e!495434)))

(declare-fun c!93880 () Bool)

(assert (=> b!888932 (= c!93880 (validKeyInArray!0 (select (arr!24917 (_keys!9865 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!39481 () Bool)

(assert (=> bm!39481 (= call!39484 (arrayNoDuplicates!0 (_keys!9865 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!93880 (Cons!17702 (select (arr!24917 (_keys!9865 thiss!1181)) #b00000000000000000000000000000000) Nil!17703) Nil!17703)))))

(declare-fun b!888933 () Bool)

(declare-fun e!495435 () Bool)

(assert (=> b!888933 (= e!495435 e!495432)))

(declare-fun res!602529 () Bool)

(assert (=> b!888933 (=> (not res!602529) (not e!495432))))

(assert (=> b!888933 (= res!602529 (not e!495433))))

(declare-fun res!602527 () Bool)

(assert (=> b!888933 (=> (not res!602527) (not e!495433))))

(assert (=> b!888933 (= res!602527 (validKeyInArray!0 (select (arr!24917 (_keys!9865 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun d!109953 () Bool)

(declare-fun res!602528 () Bool)

(assert (=> d!109953 (=> res!602528 e!495435)))

(assert (=> d!109953 (= res!602528 (bvsge #b00000000000000000000000000000000 (size!25362 (_keys!9865 thiss!1181))))))

(assert (=> d!109953 (= (arrayNoDuplicates!0 (_keys!9865 thiss!1181) #b00000000000000000000000000000000 Nil!17703) e!495435)))

(assert (= (and d!109953 (not res!602528)) b!888933))

(assert (= (and b!888933 res!602527) b!888930))

(assert (= (and b!888933 res!602529) b!888932))

(assert (= (and b!888932 c!93880) b!888929))

(assert (= (and b!888932 (not c!93880)) b!888931))

(assert (= (or b!888929 b!888931) bm!39481))

(assert (=> b!888930 m!827439))

(assert (=> b!888930 m!827439))

(declare-fun m!827451 () Bool)

(assert (=> b!888930 m!827451))

(assert (=> b!888932 m!827439))

(assert (=> b!888932 m!827439))

(assert (=> b!888932 m!827441))

(assert (=> bm!39481 m!827439))

(declare-fun m!827453 () Bool)

(assert (=> bm!39481 m!827453))

(assert (=> b!888933 m!827439))

(assert (=> b!888933 m!827439))

(assert (=> b!888933 m!827441))

(assert (=> b!888874 d!109953))

(declare-fun mapNonEmpty!28451 () Bool)

(declare-fun mapRes!28451 () Bool)

(declare-fun tp!54782 () Bool)

(declare-fun e!495437 () Bool)

(assert (=> mapNonEmpty!28451 (= mapRes!28451 (and tp!54782 e!495437))))

(declare-fun mapRest!28451 () (Array (_ BitVec 32) ValueCell!8483))

(declare-fun mapKey!28451 () (_ BitVec 32))

(declare-fun mapValue!28451 () ValueCell!8483)

(assert (=> mapNonEmpty!28451 (= mapRest!28450 (store mapRest!28451 mapKey!28451 mapValue!28451))))

(declare-fun mapIsEmpty!28451 () Bool)

(assert (=> mapIsEmpty!28451 mapRes!28451))

(declare-fun b!888935 () Bool)

(declare-fun e!495436 () Bool)

(assert (=> b!888935 (= e!495436 tp_is_empty!17929)))

(declare-fun condMapEmpty!28451 () Bool)

(declare-fun mapDefault!28451 () ValueCell!8483)

(assert (=> mapNonEmpty!28450 (= condMapEmpty!28451 (= mapRest!28450 ((as const (Array (_ BitVec 32) ValueCell!8483)) mapDefault!28451)))))

(assert (=> mapNonEmpty!28450 (= tp!54781 (and e!495436 mapRes!28451))))

(declare-fun b!888934 () Bool)

(assert (=> b!888934 (= e!495437 tp_is_empty!17929)))

(assert (= (and mapNonEmpty!28450 condMapEmpty!28451) mapIsEmpty!28451))

(assert (= (and mapNonEmpty!28450 (not condMapEmpty!28451)) mapNonEmpty!28451))

(assert (= (and mapNonEmpty!28451 ((_ is ValueCellFull!8483) mapValue!28451)) b!888934))

(assert (= (and mapNonEmpty!28450 ((_ is ValueCellFull!8483) mapDefault!28451)) b!888935))

(declare-fun m!827455 () Bool)

(assert (=> mapNonEmpty!28451 m!827455))

(check-sat b_and!25815 (not b!888916) (not b!888932) (not b!888893) (not b!888933) (not b_next!15601) (not bm!39478) (not bm!39481) (not b!888930) (not b!888892) (not mapNonEmpty!28451) (not bm!39475) (not b!888915) tp_is_empty!17929 (not b!888905) (not d!109947))
(check-sat b_and!25815 (not b_next!15601))
