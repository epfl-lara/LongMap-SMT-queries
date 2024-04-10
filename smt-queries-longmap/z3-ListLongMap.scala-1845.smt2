; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33428 () Bool)

(assert start!33428)

(declare-fun mapNonEmpty!11421 () Bool)

(declare-fun mapRes!11421 () Bool)

(declare-fun tp!23796 () Bool)

(declare-fun e!203702 () Bool)

(assert (=> mapNonEmpty!11421 (= mapRes!11421 (and tp!23796 e!203702))))

(declare-fun mapKey!11421 () (_ BitVec 32))

(declare-datatypes ((V!9901 0))(
  ( (V!9902 (val!3391 Int)) )
))
(declare-datatypes ((ValueCell!3003 0))(
  ( (ValueCellFull!3003 (v!5549 V!9901)) (EmptyCell!3003) )
))
(declare-datatypes ((array!16985 0))(
  ( (array!16986 (arr!8028 (Array (_ BitVec 32) ValueCell!3003)) (size!8380 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!16985)

(declare-fun mapRest!11421 () (Array (_ BitVec 32) ValueCell!3003))

(declare-fun mapValue!11421 () ValueCell!3003)

(assert (=> mapNonEmpty!11421 (= (arr!8028 _values!1525) (store mapRest!11421 mapKey!11421 mapValue!11421))))

(declare-fun b!331901 () Bool)

(declare-fun e!203699 () Bool)

(declare-fun e!203703 () Bool)

(assert (=> b!331901 (= e!203699 (and e!203703 mapRes!11421))))

(declare-fun condMapEmpty!11421 () Bool)

(declare-fun mapDefault!11421 () ValueCell!3003)

(assert (=> b!331901 (= condMapEmpty!11421 (= (arr!8028 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3003)) mapDefault!11421)))))

(declare-fun b!331902 () Bool)

(declare-fun e!203701 () Bool)

(declare-datatypes ((List!4577 0))(
  ( (Nil!4574) (Cons!4573 (h!5429 (_ BitVec 64)) (t!9659 List!4577)) )
))
(declare-fun contains!2001 (List!4577 (_ BitVec 64)) Bool)

(assert (=> b!331902 (= e!203701 (contains!2001 Nil!4574 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!331903 () Bool)

(declare-fun res!182859 () Bool)

(declare-fun e!203704 () Bool)

(assert (=> b!331903 (=> (not res!182859) (not e!203704))))

(declare-datatypes ((array!16987 0))(
  ( (array!16988 (arr!8029 (Array (_ BitVec 32) (_ BitVec 64))) (size!8381 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!16987)

(assert (=> b!331903 (= res!182859 (and (bvsle #b00000000000000000000000000000000 (size!8381 _keys!1895)) (bvslt (size!8381 _keys!1895) #b01111111111111111111111111111111)))))

(declare-fun b!331904 () Bool)

(declare-fun res!182855 () Bool)

(assert (=> b!331904 (=> (not res!182855) (not e!203704))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16987 (_ BitVec 32)) Bool)

(assert (=> b!331904 (= res!182855 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!331905 () Bool)

(declare-fun res!182857 () Bool)

(assert (=> b!331905 (=> (not res!182857) (not e!203704))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!331905 (= res!182857 (and (= (size!8380 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8381 _keys!1895) (size!8380 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!11421 () Bool)

(assert (=> mapIsEmpty!11421 mapRes!11421))

(declare-fun b!331906 () Bool)

(declare-fun res!182854 () Bool)

(assert (=> b!331906 (=> (not res!182854) (not e!203704))))

(declare-fun noDuplicate!175 (List!4577) Bool)

(assert (=> b!331906 (= res!182854 (noDuplicate!175 Nil!4574))))

(declare-fun res!182858 () Bool)

(assert (=> start!33428 (=> (not res!182858) (not e!203704))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33428 (= res!182858 (validMask!0 mask!2385))))

(assert (=> start!33428 e!203704))

(assert (=> start!33428 true))

(declare-fun array_inv!5982 (array!16985) Bool)

(assert (=> start!33428 (and (array_inv!5982 _values!1525) e!203699)))

(declare-fun array_inv!5983 (array!16987) Bool)

(assert (=> start!33428 (array_inv!5983 _keys!1895)))

(declare-fun b!331907 () Bool)

(declare-fun tp_is_empty!6693 () Bool)

(assert (=> b!331907 (= e!203703 tp_is_empty!6693)))

(declare-fun b!331908 () Bool)

(assert (=> b!331908 (= e!203702 tp_is_empty!6693)))

(declare-fun b!331909 () Bool)

(assert (=> b!331909 (= e!203704 e!203701)))

(declare-fun res!182856 () Bool)

(assert (=> b!331909 (=> res!182856 e!203701)))

(assert (=> b!331909 (= res!182856 (contains!2001 Nil!4574 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!33428 res!182858) b!331905))

(assert (= (and b!331905 res!182857) b!331904))

(assert (= (and b!331904 res!182855) b!331903))

(assert (= (and b!331903 res!182859) b!331906))

(assert (= (and b!331906 res!182854) b!331909))

(assert (= (and b!331909 (not res!182856)) b!331902))

(assert (= (and b!331901 condMapEmpty!11421) mapIsEmpty!11421))

(assert (= (and b!331901 (not condMapEmpty!11421)) mapNonEmpty!11421))

(get-info :version)

(assert (= (and mapNonEmpty!11421 ((_ is ValueCellFull!3003) mapValue!11421)) b!331908))

(assert (= (and b!331901 ((_ is ValueCellFull!3003) mapDefault!11421)) b!331907))

(assert (= start!33428 b!331901))

(declare-fun m!336597 () Bool)

(assert (=> mapNonEmpty!11421 m!336597))

(declare-fun m!336599 () Bool)

(assert (=> b!331902 m!336599))

(declare-fun m!336601 () Bool)

(assert (=> start!33428 m!336601))

(declare-fun m!336603 () Bool)

(assert (=> start!33428 m!336603))

(declare-fun m!336605 () Bool)

(assert (=> start!33428 m!336605))

(declare-fun m!336607 () Bool)

(assert (=> b!331906 m!336607))

(declare-fun m!336609 () Bool)

(assert (=> b!331909 m!336609))

(declare-fun m!336611 () Bool)

(assert (=> b!331904 m!336611))

(check-sat (not mapNonEmpty!11421) (not start!33428) (not b!331904) (not b!331906) (not b!331902) tp_is_empty!6693 (not b!331909))
(check-sat)
(get-model)

(declare-fun d!70489 () Bool)

(declare-fun res!182882 () Bool)

(declare-fun e!203727 () Bool)

(assert (=> d!70489 (=> res!182882 e!203727)))

(assert (=> d!70489 (= res!182882 ((_ is Nil!4574) Nil!4574))))

(assert (=> d!70489 (= (noDuplicate!175 Nil!4574) e!203727)))

(declare-fun b!331941 () Bool)

(declare-fun e!203728 () Bool)

(assert (=> b!331941 (= e!203727 e!203728)))

(declare-fun res!182883 () Bool)

(assert (=> b!331941 (=> (not res!182883) (not e!203728))))

(assert (=> b!331941 (= res!182883 (not (contains!2001 (t!9659 Nil!4574) (h!5429 Nil!4574))))))

(declare-fun b!331942 () Bool)

(assert (=> b!331942 (= e!203728 (noDuplicate!175 (t!9659 Nil!4574)))))

(assert (= (and d!70489 (not res!182882)) b!331941))

(assert (= (and b!331941 res!182883) b!331942))

(declare-fun m!336629 () Bool)

(assert (=> b!331941 m!336629))

(declare-fun m!336631 () Bool)

(assert (=> b!331942 m!336631))

(assert (=> b!331906 d!70489))

(declare-fun d!70491 () Bool)

(declare-fun lt!158928 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!196 (List!4577) (InoxSet (_ BitVec 64)))

(assert (=> d!70491 (= lt!158928 (select (content!196 Nil!4574) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!203734 () Bool)

(assert (=> d!70491 (= lt!158928 e!203734)))

(declare-fun res!182889 () Bool)

(assert (=> d!70491 (=> (not res!182889) (not e!203734))))

(assert (=> d!70491 (= res!182889 ((_ is Cons!4573) Nil!4574))))

(assert (=> d!70491 (= (contains!2001 Nil!4574 #b1000000000000000000000000000000000000000000000000000000000000000) lt!158928)))

(declare-fun b!331947 () Bool)

(declare-fun e!203733 () Bool)

(assert (=> b!331947 (= e!203734 e!203733)))

(declare-fun res!182888 () Bool)

(assert (=> b!331947 (=> res!182888 e!203733)))

(assert (=> b!331947 (= res!182888 (= (h!5429 Nil!4574) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!331948 () Bool)

(assert (=> b!331948 (= e!203733 (contains!2001 (t!9659 Nil!4574) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!70491 res!182889) b!331947))

(assert (= (and b!331947 (not res!182888)) b!331948))

(declare-fun m!336633 () Bool)

(assert (=> d!70491 m!336633))

(declare-fun m!336635 () Bool)

(assert (=> d!70491 m!336635))

(declare-fun m!336637 () Bool)

(assert (=> b!331948 m!336637))

(assert (=> b!331902 d!70491))

(declare-fun d!70493 () Bool)

(assert (=> d!70493 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!33428 d!70493))

(declare-fun d!70495 () Bool)

(assert (=> d!70495 (= (array_inv!5982 _values!1525) (bvsge (size!8380 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!33428 d!70495))

(declare-fun d!70497 () Bool)

(assert (=> d!70497 (= (array_inv!5983 _keys!1895) (bvsge (size!8381 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!33428 d!70497))

(declare-fun b!331957 () Bool)

(declare-fun e!203743 () Bool)

(declare-fun call!26209 () Bool)

(assert (=> b!331957 (= e!203743 call!26209)))

(declare-fun b!331958 () Bool)

(declare-fun e!203742 () Bool)

(assert (=> b!331958 (= e!203742 call!26209)))

(declare-fun d!70499 () Bool)

(declare-fun res!182894 () Bool)

(declare-fun e!203741 () Bool)

(assert (=> d!70499 (=> res!182894 e!203741)))

(assert (=> d!70499 (= res!182894 (bvsge #b00000000000000000000000000000000 (size!8381 _keys!1895)))))

(assert (=> d!70499 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!203741)))

(declare-fun bm!26206 () Bool)

(assert (=> bm!26206 (= call!26209 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun b!331959 () Bool)

(assert (=> b!331959 (= e!203741 e!203743)))

(declare-fun c!52080 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!331959 (= c!52080 (validKeyInArray!0 (select (arr!8029 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!331960 () Bool)

(assert (=> b!331960 (= e!203743 e!203742)))

(declare-fun lt!158935 () (_ BitVec 64))

(assert (=> b!331960 (= lt!158935 (select (arr!8029 _keys!1895) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10357 0))(
  ( (Unit!10358) )
))
(declare-fun lt!158936 () Unit!10357)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16987 (_ BitVec 64) (_ BitVec 32)) Unit!10357)

(assert (=> b!331960 (= lt!158936 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!158935 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!16987 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!331960 (arrayContainsKey!0 _keys!1895 lt!158935 #b00000000000000000000000000000000)))

(declare-fun lt!158937 () Unit!10357)

(assert (=> b!331960 (= lt!158937 lt!158936)))

(declare-fun res!182895 () Bool)

(declare-datatypes ((SeekEntryResult!3131 0))(
  ( (MissingZero!3131 (index!14703 (_ BitVec 32))) (Found!3131 (index!14704 (_ BitVec 32))) (Intermediate!3131 (undefined!3943 Bool) (index!14705 (_ BitVec 32)) (x!33041 (_ BitVec 32))) (Undefined!3131) (MissingVacant!3131 (index!14706 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16987 (_ BitVec 32)) SeekEntryResult!3131)

(assert (=> b!331960 (= res!182895 (= (seekEntryOrOpen!0 (select (arr!8029 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3131 #b00000000000000000000000000000000)))))

(assert (=> b!331960 (=> (not res!182895) (not e!203742))))

(assert (= (and d!70499 (not res!182894)) b!331959))

(assert (= (and b!331959 c!52080) b!331960))

(assert (= (and b!331959 (not c!52080)) b!331957))

(assert (= (and b!331960 res!182895) b!331958))

(assert (= (or b!331958 b!331957) bm!26206))

(declare-fun m!336639 () Bool)

(assert (=> bm!26206 m!336639))

(declare-fun m!336641 () Bool)

(assert (=> b!331959 m!336641))

(assert (=> b!331959 m!336641))

(declare-fun m!336643 () Bool)

(assert (=> b!331959 m!336643))

(assert (=> b!331960 m!336641))

(declare-fun m!336645 () Bool)

(assert (=> b!331960 m!336645))

(declare-fun m!336647 () Bool)

(assert (=> b!331960 m!336647))

(assert (=> b!331960 m!336641))

(declare-fun m!336649 () Bool)

(assert (=> b!331960 m!336649))

(assert (=> b!331904 d!70499))

(declare-fun d!70501 () Bool)

(declare-fun lt!158938 () Bool)

(assert (=> d!70501 (= lt!158938 (select (content!196 Nil!4574) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!203745 () Bool)

(assert (=> d!70501 (= lt!158938 e!203745)))

(declare-fun res!182897 () Bool)

(assert (=> d!70501 (=> (not res!182897) (not e!203745))))

(assert (=> d!70501 (= res!182897 ((_ is Cons!4573) Nil!4574))))

(assert (=> d!70501 (= (contains!2001 Nil!4574 #b0000000000000000000000000000000000000000000000000000000000000000) lt!158938)))

(declare-fun b!331961 () Bool)

(declare-fun e!203744 () Bool)

(assert (=> b!331961 (= e!203745 e!203744)))

(declare-fun res!182896 () Bool)

(assert (=> b!331961 (=> res!182896 e!203744)))

(assert (=> b!331961 (= res!182896 (= (h!5429 Nil!4574) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!331962 () Bool)

(assert (=> b!331962 (= e!203744 (contains!2001 (t!9659 Nil!4574) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!70501 res!182897) b!331961))

(assert (= (and b!331961 (not res!182896)) b!331962))

(assert (=> d!70501 m!336633))

(declare-fun m!336651 () Bool)

(assert (=> d!70501 m!336651))

(declare-fun m!336653 () Bool)

(assert (=> b!331962 m!336653))

(assert (=> b!331909 d!70501))

(declare-fun condMapEmpty!11427 () Bool)

(declare-fun mapDefault!11427 () ValueCell!3003)

(assert (=> mapNonEmpty!11421 (= condMapEmpty!11427 (= mapRest!11421 ((as const (Array (_ BitVec 32) ValueCell!3003)) mapDefault!11427)))))

(declare-fun e!203751 () Bool)

(declare-fun mapRes!11427 () Bool)

(assert (=> mapNonEmpty!11421 (= tp!23796 (and e!203751 mapRes!11427))))

(declare-fun mapNonEmpty!11427 () Bool)

(declare-fun tp!23802 () Bool)

(declare-fun e!203750 () Bool)

(assert (=> mapNonEmpty!11427 (= mapRes!11427 (and tp!23802 e!203750))))

(declare-fun mapRest!11427 () (Array (_ BitVec 32) ValueCell!3003))

(declare-fun mapKey!11427 () (_ BitVec 32))

(declare-fun mapValue!11427 () ValueCell!3003)

(assert (=> mapNonEmpty!11427 (= mapRest!11421 (store mapRest!11427 mapKey!11427 mapValue!11427))))

(declare-fun b!331970 () Bool)

(assert (=> b!331970 (= e!203751 tp_is_empty!6693)))

(declare-fun mapIsEmpty!11427 () Bool)

(assert (=> mapIsEmpty!11427 mapRes!11427))

(declare-fun b!331969 () Bool)

(assert (=> b!331969 (= e!203750 tp_is_empty!6693)))

(assert (= (and mapNonEmpty!11421 condMapEmpty!11427) mapIsEmpty!11427))

(assert (= (and mapNonEmpty!11421 (not condMapEmpty!11427)) mapNonEmpty!11427))

(assert (= (and mapNonEmpty!11427 ((_ is ValueCellFull!3003) mapValue!11427)) b!331969))

(assert (= (and mapNonEmpty!11421 ((_ is ValueCellFull!3003) mapDefault!11427)) b!331970))

(declare-fun m!336655 () Bool)

(assert (=> mapNonEmpty!11427 m!336655))

(check-sat (not d!70501) (not b!331942) (not b!331959) (not mapNonEmpty!11427) (not d!70491) (not bm!26206) (not b!331941) (not b!331948) tp_is_empty!6693 (not b!331960) (not b!331962))
(check-sat)
