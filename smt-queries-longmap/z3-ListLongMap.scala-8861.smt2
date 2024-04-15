; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107526 () Bool)

(assert start!107526)

(declare-fun b!1273184 () Bool)

(declare-fun b_free!27709 () Bool)

(declare-fun b_next!27709 () Bool)

(assert (=> b!1273184 (= b_free!27709 (not b_next!27709))))

(declare-fun tp!97668 () Bool)

(declare-fun b_and!45747 () Bool)

(assert (=> b!1273184 (= tp!97668 b_and!45747)))

(declare-fun b!1273181 () Bool)

(declare-fun res!846735 () Bool)

(declare-fun e!726360 () Bool)

(assert (=> b!1273181 (=> (not res!846735) (not e!726360))))

(declare-datatypes ((V!49299 0))(
  ( (V!49300 (val!16614 Int)) )
))
(declare-datatypes ((ValueCell!15686 0))(
  ( (ValueCellFull!15686 (v!19250 V!49299)) (EmptyCell!15686) )
))
(declare-datatypes ((array!83325 0))(
  ( (array!83326 (arr!40190 (Array (_ BitVec 32) ValueCell!15686)) (size!40733 (_ BitVec 32))) )
))
(declare-datatypes ((array!83327 0))(
  ( (array!83328 (arr!40191 (Array (_ BitVec 32) (_ BitVec 64))) (size!40734 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6136 0))(
  ( (LongMapFixedSize!6137 (defaultEntry!6714 Int) (mask!34484 (_ BitVec 32)) (extraKeys!6393 (_ BitVec 32)) (zeroValue!6499 V!49299) (minValue!6499 V!49299) (_size!3123 (_ BitVec 32)) (_keys!12123 array!83327) (_values!6737 array!83325) (_vacant!3123 (_ BitVec 32))) )
))
(declare-fun thiss!1559 () LongMapFixedSize!6136)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1273181 (= res!846735 (validMask!0 (mask!34484 thiss!1559)))))

(declare-fun b!1273182 () Bool)

(declare-fun e!726355 () Bool)

(declare-fun tp_is_empty!33079 () Bool)

(assert (=> b!1273182 (= e!726355 tp_is_empty!33079)))

(declare-fun b!1273183 () Bool)

(declare-fun res!846734 () Bool)

(assert (=> b!1273183 (=> (not res!846734) (not e!726360))))

(declare-datatypes ((List!28639 0))(
  ( (Nil!28636) (Cons!28635 (h!29844 (_ BitVec 64)) (t!42164 List!28639)) )
))
(declare-fun arrayNoDuplicates!0 (array!83327 (_ BitVec 32) List!28639) Bool)

(assert (=> b!1273183 (= res!846734 (arrayNoDuplicates!0 (_keys!12123 thiss!1559) #b00000000000000000000000000000000 Nil!28636))))

(declare-fun mapIsEmpty!51234 () Bool)

(declare-fun mapRes!51234 () Bool)

(assert (=> mapIsEmpty!51234 mapRes!51234))

(declare-fun e!726359 () Bool)

(declare-fun e!726356 () Bool)

(declare-fun array_inv!30715 (array!83327) Bool)

(declare-fun array_inv!30716 (array!83325) Bool)

(assert (=> b!1273184 (= e!726359 (and tp!97668 tp_is_empty!33079 (array_inv!30715 (_keys!12123 thiss!1559)) (array_inv!30716 (_values!6737 thiss!1559)) e!726356))))

(declare-fun b!1273185 () Bool)

(declare-fun res!846736 () Bool)

(assert (=> b!1273185 (=> (not res!846736) (not e!726360))))

(assert (=> b!1273185 (= res!846736 (and (= (size!40733 (_values!6737 thiss!1559)) (bvadd #b00000000000000000000000000000001 (mask!34484 thiss!1559))) (= (size!40734 (_keys!12123 thiss!1559)) (size!40733 (_values!6737 thiss!1559))) (bvsge (mask!34484 thiss!1559) #b00000000000000000000000000000000) (bvsge (extraKeys!6393 thiss!1559) #b00000000000000000000000000000000) (bvsle (extraKeys!6393 thiss!1559) #b00000000000000000000000000000011)))))

(declare-fun b!1273186 () Bool)

(assert (=> b!1273186 (= e!726360 (bvsgt #b00000000000000000000000000000000 (size!40734 (_keys!12123 thiss!1559))))))

(declare-fun res!846737 () Bool)

(assert (=> start!107526 (=> (not res!846737) (not e!726360))))

(declare-fun valid!2293 (LongMapFixedSize!6136) Bool)

(assert (=> start!107526 (= res!846737 (valid!2293 thiss!1559))))

(assert (=> start!107526 e!726360))

(assert (=> start!107526 e!726359))

(declare-fun b!1273187 () Bool)

(declare-fun e!726357 () Bool)

(assert (=> b!1273187 (= e!726357 tp_is_empty!33079)))

(declare-fun b!1273188 () Bool)

(assert (=> b!1273188 (= e!726356 (and e!726357 mapRes!51234))))

(declare-fun condMapEmpty!51234 () Bool)

(declare-fun mapDefault!51234 () ValueCell!15686)

(assert (=> b!1273188 (= condMapEmpty!51234 (= (arr!40190 (_values!6737 thiss!1559)) ((as const (Array (_ BitVec 32) ValueCell!15686)) mapDefault!51234)))))

(declare-fun b!1273189 () Bool)

(declare-fun res!846738 () Bool)

(assert (=> b!1273189 (=> (not res!846738) (not e!726360))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83327 (_ BitVec 32)) Bool)

(assert (=> b!1273189 (= res!846738 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12123 thiss!1559) (mask!34484 thiss!1559)))))

(declare-fun mapNonEmpty!51234 () Bool)

(declare-fun tp!97669 () Bool)

(assert (=> mapNonEmpty!51234 (= mapRes!51234 (and tp!97669 e!726355))))

(declare-fun mapValue!51234 () ValueCell!15686)

(declare-fun mapRest!51234 () (Array (_ BitVec 32) ValueCell!15686))

(declare-fun mapKey!51234 () (_ BitVec 32))

(assert (=> mapNonEmpty!51234 (= (arr!40190 (_values!6737 thiss!1559)) (store mapRest!51234 mapKey!51234 mapValue!51234))))

(assert (= (and start!107526 res!846737) b!1273181))

(assert (= (and b!1273181 res!846735) b!1273185))

(assert (= (and b!1273185 res!846736) b!1273189))

(assert (= (and b!1273189 res!846738) b!1273183))

(assert (= (and b!1273183 res!846734) b!1273186))

(assert (= (and b!1273188 condMapEmpty!51234) mapIsEmpty!51234))

(assert (= (and b!1273188 (not condMapEmpty!51234)) mapNonEmpty!51234))

(get-info :version)

(assert (= (and mapNonEmpty!51234 ((_ is ValueCellFull!15686) mapValue!51234)) b!1273182))

(assert (= (and b!1273188 ((_ is ValueCellFull!15686) mapDefault!51234)) b!1273187))

(assert (= b!1273184 b!1273188))

(assert (= start!107526 b!1273184))

(declare-fun m!1170029 () Bool)

(assert (=> mapNonEmpty!51234 m!1170029))

(declare-fun m!1170031 () Bool)

(assert (=> b!1273183 m!1170031))

(declare-fun m!1170033 () Bool)

(assert (=> b!1273189 m!1170033))

(declare-fun m!1170035 () Bool)

(assert (=> b!1273184 m!1170035))

(declare-fun m!1170037 () Bool)

(assert (=> b!1273184 m!1170037))

(declare-fun m!1170039 () Bool)

(assert (=> b!1273181 m!1170039))

(declare-fun m!1170041 () Bool)

(assert (=> start!107526 m!1170041))

(check-sat (not b!1273183) (not start!107526) (not b!1273181) (not b!1273184) (not b_next!27709) tp_is_empty!33079 (not b!1273189) b_and!45747 (not mapNonEmpty!51234))
(check-sat b_and!45747 (not b_next!27709))
(get-model)

(declare-fun d!139859 () Bool)

(assert (=> d!139859 (= (array_inv!30715 (_keys!12123 thiss!1559)) (bvsge (size!40734 (_keys!12123 thiss!1559)) #b00000000000000000000000000000000))))

(assert (=> b!1273184 d!139859))

(declare-fun d!139861 () Bool)

(assert (=> d!139861 (= (array_inv!30716 (_values!6737 thiss!1559)) (bvsge (size!40733 (_values!6737 thiss!1559)) #b00000000000000000000000000000000))))

(assert (=> b!1273184 d!139861))

(declare-fun b!1273252 () Bool)

(declare-fun e!726405 () Bool)

(declare-fun call!62575 () Bool)

(assert (=> b!1273252 (= e!726405 call!62575)))

(declare-fun bm!62572 () Bool)

(assert (=> bm!62572 (= call!62575 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!12123 thiss!1559) (mask!34484 thiss!1559)))))

(declare-fun d!139863 () Bool)

(declare-fun res!846773 () Bool)

(declare-fun e!726403 () Bool)

(assert (=> d!139863 (=> res!846773 e!726403)))

(assert (=> d!139863 (= res!846773 (bvsge #b00000000000000000000000000000000 (size!40734 (_keys!12123 thiss!1559))))))

(assert (=> d!139863 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12123 thiss!1559) (mask!34484 thiss!1559)) e!726403)))

(declare-fun b!1273253 () Bool)

(declare-fun e!726404 () Bool)

(assert (=> b!1273253 (= e!726405 e!726404)))

(declare-fun lt!574951 () (_ BitVec 64))

(assert (=> b!1273253 (= lt!574951 (select (arr!40191 (_keys!12123 thiss!1559)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42178 0))(
  ( (Unit!42179) )
))
(declare-fun lt!574952 () Unit!42178)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!83327 (_ BitVec 64) (_ BitVec 32)) Unit!42178)

(assert (=> b!1273253 (= lt!574952 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!12123 thiss!1559) lt!574951 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!83327 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1273253 (arrayContainsKey!0 (_keys!12123 thiss!1559) lt!574951 #b00000000000000000000000000000000)))

(declare-fun lt!574953 () Unit!42178)

(assert (=> b!1273253 (= lt!574953 lt!574952)))

(declare-fun res!846774 () Bool)

(declare-datatypes ((SeekEntryResult!9995 0))(
  ( (MissingZero!9995 (index!42351 (_ BitVec 32))) (Found!9995 (index!42352 (_ BitVec 32))) (Intermediate!9995 (undefined!10807 Bool) (index!42353 (_ BitVec 32)) (x!112565 (_ BitVec 32))) (Undefined!9995) (MissingVacant!9995 (index!42354 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!83327 (_ BitVec 32)) SeekEntryResult!9995)

(assert (=> b!1273253 (= res!846774 (= (seekEntryOrOpen!0 (select (arr!40191 (_keys!12123 thiss!1559)) #b00000000000000000000000000000000) (_keys!12123 thiss!1559) (mask!34484 thiss!1559)) (Found!9995 #b00000000000000000000000000000000)))))

(assert (=> b!1273253 (=> (not res!846774) (not e!726404))))

(declare-fun b!1273254 () Bool)

(assert (=> b!1273254 (= e!726404 call!62575)))

(declare-fun b!1273255 () Bool)

(assert (=> b!1273255 (= e!726403 e!726405)))

(declare-fun c!123740 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1273255 (= c!123740 (validKeyInArray!0 (select (arr!40191 (_keys!12123 thiss!1559)) #b00000000000000000000000000000000)))))

(assert (= (and d!139863 (not res!846773)) b!1273255))

(assert (= (and b!1273255 c!123740) b!1273253))

(assert (= (and b!1273255 (not c!123740)) b!1273252))

(assert (= (and b!1273253 res!846774) b!1273254))

(assert (= (or b!1273254 b!1273252) bm!62572))

(declare-fun m!1170071 () Bool)

(assert (=> bm!62572 m!1170071))

(declare-fun m!1170073 () Bool)

(assert (=> b!1273253 m!1170073))

(declare-fun m!1170075 () Bool)

(assert (=> b!1273253 m!1170075))

(declare-fun m!1170077 () Bool)

(assert (=> b!1273253 m!1170077))

(assert (=> b!1273253 m!1170073))

(declare-fun m!1170079 () Bool)

(assert (=> b!1273253 m!1170079))

(assert (=> b!1273255 m!1170073))

(assert (=> b!1273255 m!1170073))

(declare-fun m!1170081 () Bool)

(assert (=> b!1273255 m!1170081))

(assert (=> b!1273189 d!139863))

(declare-fun d!139865 () Bool)

(declare-fun res!846781 () Bool)

(declare-fun e!726408 () Bool)

(assert (=> d!139865 (=> (not res!846781) (not e!726408))))

(declare-fun simpleValid!463 (LongMapFixedSize!6136) Bool)

(assert (=> d!139865 (= res!846781 (simpleValid!463 thiss!1559))))

(assert (=> d!139865 (= (valid!2293 thiss!1559) e!726408)))

(declare-fun b!1273262 () Bool)

(declare-fun res!846782 () Bool)

(assert (=> b!1273262 (=> (not res!846782) (not e!726408))))

(declare-fun arrayCountValidKeys!0 (array!83327 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1273262 (= res!846782 (= (arrayCountValidKeys!0 (_keys!12123 thiss!1559) #b00000000000000000000000000000000 (size!40734 (_keys!12123 thiss!1559))) (_size!3123 thiss!1559)))))

(declare-fun b!1273263 () Bool)

(declare-fun res!846783 () Bool)

(assert (=> b!1273263 (=> (not res!846783) (not e!726408))))

(assert (=> b!1273263 (= res!846783 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12123 thiss!1559) (mask!34484 thiss!1559)))))

(declare-fun b!1273264 () Bool)

(assert (=> b!1273264 (= e!726408 (arrayNoDuplicates!0 (_keys!12123 thiss!1559) #b00000000000000000000000000000000 Nil!28636))))

(assert (= (and d!139865 res!846781) b!1273262))

(assert (= (and b!1273262 res!846782) b!1273263))

(assert (= (and b!1273263 res!846783) b!1273264))

(declare-fun m!1170083 () Bool)

(assert (=> d!139865 m!1170083))

(declare-fun m!1170085 () Bool)

(assert (=> b!1273262 m!1170085))

(assert (=> b!1273263 m!1170033))

(assert (=> b!1273264 m!1170031))

(assert (=> start!107526 d!139865))

(declare-fun d!139867 () Bool)

(declare-fun res!846790 () Bool)

(declare-fun e!726419 () Bool)

(assert (=> d!139867 (=> res!846790 e!726419)))

(assert (=> d!139867 (= res!846790 (bvsge #b00000000000000000000000000000000 (size!40734 (_keys!12123 thiss!1559))))))

(assert (=> d!139867 (= (arrayNoDuplicates!0 (_keys!12123 thiss!1559) #b00000000000000000000000000000000 Nil!28636) e!726419)))

(declare-fun b!1273275 () Bool)

(declare-fun e!726420 () Bool)

(assert (=> b!1273275 (= e!726419 e!726420)))

(declare-fun res!846792 () Bool)

(assert (=> b!1273275 (=> (not res!846792) (not e!726420))))

(declare-fun e!726418 () Bool)

(assert (=> b!1273275 (= res!846792 (not e!726418))))

(declare-fun res!846791 () Bool)

(assert (=> b!1273275 (=> (not res!846791) (not e!726418))))

(assert (=> b!1273275 (= res!846791 (validKeyInArray!0 (select (arr!40191 (_keys!12123 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun b!1273276 () Bool)

(declare-fun e!726417 () Bool)

(declare-fun call!62578 () Bool)

(assert (=> b!1273276 (= e!726417 call!62578)))

(declare-fun b!1273277 () Bool)

(declare-fun contains!7643 (List!28639 (_ BitVec 64)) Bool)

(assert (=> b!1273277 (= e!726418 (contains!7643 Nil!28636 (select (arr!40191 (_keys!12123 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun b!1273278 () Bool)

(assert (=> b!1273278 (= e!726417 call!62578)))

(declare-fun b!1273279 () Bool)

(assert (=> b!1273279 (= e!726420 e!726417)))

(declare-fun c!123743 () Bool)

(assert (=> b!1273279 (= c!123743 (validKeyInArray!0 (select (arr!40191 (_keys!12123 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun bm!62575 () Bool)

(assert (=> bm!62575 (= call!62578 (arrayNoDuplicates!0 (_keys!12123 thiss!1559) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!123743 (Cons!28635 (select (arr!40191 (_keys!12123 thiss!1559)) #b00000000000000000000000000000000) Nil!28636) Nil!28636)))))

(assert (= (and d!139867 (not res!846790)) b!1273275))

(assert (= (and b!1273275 res!846791) b!1273277))

(assert (= (and b!1273275 res!846792) b!1273279))

(assert (= (and b!1273279 c!123743) b!1273276))

(assert (= (and b!1273279 (not c!123743)) b!1273278))

(assert (= (or b!1273276 b!1273278) bm!62575))

(assert (=> b!1273275 m!1170073))

(assert (=> b!1273275 m!1170073))

(assert (=> b!1273275 m!1170081))

(assert (=> b!1273277 m!1170073))

(assert (=> b!1273277 m!1170073))

(declare-fun m!1170087 () Bool)

(assert (=> b!1273277 m!1170087))

(assert (=> b!1273279 m!1170073))

(assert (=> b!1273279 m!1170073))

(assert (=> b!1273279 m!1170081))

(assert (=> bm!62575 m!1170073))

(declare-fun m!1170089 () Bool)

(assert (=> bm!62575 m!1170089))

(assert (=> b!1273183 d!139867))

(declare-fun d!139869 () Bool)

(assert (=> d!139869 (= (validMask!0 (mask!34484 thiss!1559)) (and (or (= (mask!34484 thiss!1559) #b00000000000000000000000000000111) (= (mask!34484 thiss!1559) #b00000000000000000000000000001111) (= (mask!34484 thiss!1559) #b00000000000000000000000000011111) (= (mask!34484 thiss!1559) #b00000000000000000000000000111111) (= (mask!34484 thiss!1559) #b00000000000000000000000001111111) (= (mask!34484 thiss!1559) #b00000000000000000000000011111111) (= (mask!34484 thiss!1559) #b00000000000000000000000111111111) (= (mask!34484 thiss!1559) #b00000000000000000000001111111111) (= (mask!34484 thiss!1559) #b00000000000000000000011111111111) (= (mask!34484 thiss!1559) #b00000000000000000000111111111111) (= (mask!34484 thiss!1559) #b00000000000000000001111111111111) (= (mask!34484 thiss!1559) #b00000000000000000011111111111111) (= (mask!34484 thiss!1559) #b00000000000000000111111111111111) (= (mask!34484 thiss!1559) #b00000000000000001111111111111111) (= (mask!34484 thiss!1559) #b00000000000000011111111111111111) (= (mask!34484 thiss!1559) #b00000000000000111111111111111111) (= (mask!34484 thiss!1559) #b00000000000001111111111111111111) (= (mask!34484 thiss!1559) #b00000000000011111111111111111111) (= (mask!34484 thiss!1559) #b00000000000111111111111111111111) (= (mask!34484 thiss!1559) #b00000000001111111111111111111111) (= (mask!34484 thiss!1559) #b00000000011111111111111111111111) (= (mask!34484 thiss!1559) #b00000000111111111111111111111111) (= (mask!34484 thiss!1559) #b00000001111111111111111111111111) (= (mask!34484 thiss!1559) #b00000011111111111111111111111111) (= (mask!34484 thiss!1559) #b00000111111111111111111111111111) (= (mask!34484 thiss!1559) #b00001111111111111111111111111111) (= (mask!34484 thiss!1559) #b00011111111111111111111111111111) (= (mask!34484 thiss!1559) #b00111111111111111111111111111111)) (bvsle (mask!34484 thiss!1559) #b00111111111111111111111111111111)))))

(assert (=> b!1273181 d!139869))

(declare-fun condMapEmpty!51243 () Bool)

(declare-fun mapDefault!51243 () ValueCell!15686)

(assert (=> mapNonEmpty!51234 (= condMapEmpty!51243 (= mapRest!51234 ((as const (Array (_ BitVec 32) ValueCell!15686)) mapDefault!51243)))))

(declare-fun e!726426 () Bool)

(declare-fun mapRes!51243 () Bool)

(assert (=> mapNonEmpty!51234 (= tp!97669 (and e!726426 mapRes!51243))))

(declare-fun b!1273286 () Bool)

(declare-fun e!726425 () Bool)

(assert (=> b!1273286 (= e!726425 tp_is_empty!33079)))

(declare-fun mapIsEmpty!51243 () Bool)

(assert (=> mapIsEmpty!51243 mapRes!51243))

(declare-fun b!1273287 () Bool)

(assert (=> b!1273287 (= e!726426 tp_is_empty!33079)))

(declare-fun mapNonEmpty!51243 () Bool)

(declare-fun tp!97684 () Bool)

(assert (=> mapNonEmpty!51243 (= mapRes!51243 (and tp!97684 e!726425))))

(declare-fun mapRest!51243 () (Array (_ BitVec 32) ValueCell!15686))

(declare-fun mapValue!51243 () ValueCell!15686)

(declare-fun mapKey!51243 () (_ BitVec 32))

(assert (=> mapNonEmpty!51243 (= mapRest!51234 (store mapRest!51243 mapKey!51243 mapValue!51243))))

(assert (= (and mapNonEmpty!51234 condMapEmpty!51243) mapIsEmpty!51243))

(assert (= (and mapNonEmpty!51234 (not condMapEmpty!51243)) mapNonEmpty!51243))

(assert (= (and mapNonEmpty!51243 ((_ is ValueCellFull!15686) mapValue!51243)) b!1273286))

(assert (= (and mapNonEmpty!51234 ((_ is ValueCellFull!15686) mapDefault!51243)) b!1273287))

(declare-fun m!1170091 () Bool)

(assert (=> mapNonEmpty!51243 m!1170091))

(check-sat (not bm!62572) (not b!1273279) (not b!1273275) tp_is_empty!33079 (not b!1273262) (not d!139865) (not b!1273277) (not b!1273253) (not bm!62575) (not b_next!27709) (not b!1273264) b_and!45747 (not b!1273263) (not mapNonEmpty!51243) (not b!1273255))
(check-sat b_and!45747 (not b_next!27709))
