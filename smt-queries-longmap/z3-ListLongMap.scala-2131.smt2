; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36038 () Bool)

(assert start!36038)

(declare-fun b!361891 () Bool)

(declare-fun res!201334 () Bool)

(declare-fun e!221642 () Bool)

(assert (=> b!361891 (=> (not res!201334) (not e!221642))))

(declare-datatypes ((array!20373 0))(
  ( (array!20374 (arr!9672 (Array (_ BitVec 32) (_ BitVec 64))) (size!10024 (_ BitVec 32))) )
))
(declare-fun _keys!1541 () array!20373)

(declare-datatypes ((List!5518 0))(
  ( (Nil!5515) (Cons!5514 (h!6370 (_ BitVec 64)) (t!10668 List!5518)) )
))
(declare-fun arrayNoDuplicates!0 (array!20373 (_ BitVec 32) List!5518) Bool)

(assert (=> b!361891 (= res!201334 (arrayNoDuplicates!0 _keys!1541 #b00000000000000000000000000000000 Nil!5515))))

(declare-fun b!361892 () Bool)

(declare-fun res!201333 () Bool)

(assert (=> b!361892 (=> (not res!201333) (not e!221642))))

(declare-fun from!1924 () (_ BitVec 32))

(assert (=> b!361892 (= res!201333 (and (bvsge from!1924 #b00000000000000000000000000000000) (bvslt from!1924 (size!10024 _keys!1541))))))

(declare-fun b!361893 () Bool)

(declare-fun e!221643 () Bool)

(declare-fun tp_is_empty!8409 () Bool)

(assert (=> b!361893 (= e!221643 tp_is_empty!8409)))

(declare-fun b!361894 () Bool)

(declare-fun res!201331 () Bool)

(assert (=> b!361894 (=> (not res!201331) (not e!221642))))

(declare-fun extraKeys!1198 () (_ BitVec 32))

(declare-fun mask!1943 () (_ BitVec 32))

(declare-datatypes ((V!12189 0))(
  ( (V!12190 (val!4249 Int)) )
))
(declare-datatypes ((ValueCell!3861 0))(
  ( (ValueCellFull!3861 (v!6444 V!12189)) (EmptyCell!3861) )
))
(declare-datatypes ((array!20375 0))(
  ( (array!20376 (arr!9673 (Array (_ BitVec 32) ValueCell!3861)) (size!10025 (_ BitVec 32))) )
))
(declare-fun _values!1277 () array!20375)

(assert (=> b!361894 (= res!201331 (and (= (size!10025 _values!1277) (bvadd #b00000000000000000000000000000001 mask!1943)) (= (size!10024 _keys!1541) (size!10025 _values!1277)) (bvsge mask!1943 #b00000000000000000000000000000000) (bvsge extraKeys!1198 #b00000000000000000000000000000000) (bvsle extraKeys!1198 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!14145 () Bool)

(declare-fun mapRes!14145 () Bool)

(assert (=> mapIsEmpty!14145 mapRes!14145))

(declare-fun b!361895 () Bool)

(declare-fun e!221645 () Bool)

(assert (=> b!361895 (= e!221645 tp_is_empty!8409)))

(declare-fun mapNonEmpty!14145 () Bool)

(declare-fun tp!28221 () Bool)

(assert (=> mapNonEmpty!14145 (= mapRes!14145 (and tp!28221 e!221645))))

(declare-fun mapRest!14145 () (Array (_ BitVec 32) ValueCell!3861))

(declare-fun mapKey!14145 () (_ BitVec 32))

(declare-fun mapValue!14145 () ValueCell!3861)

(assert (=> mapNonEmpty!14145 (= (arr!9673 _values!1277) (store mapRest!14145 mapKey!14145 mapValue!14145))))

(declare-fun b!361896 () Bool)

(declare-fun e!221646 () Bool)

(assert (=> b!361896 (= e!221646 (and e!221643 mapRes!14145))))

(declare-fun condMapEmpty!14145 () Bool)

(declare-fun mapDefault!14145 () ValueCell!3861)

(assert (=> b!361896 (= condMapEmpty!14145 (= (arr!9673 _values!1277) ((as const (Array (_ BitVec 32) ValueCell!3861)) mapDefault!14145)))))

(declare-fun res!201332 () Bool)

(assert (=> start!36038 (=> (not res!201332) (not e!221642))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36038 (= res!201332 (validMask!0 mask!1943))))

(assert (=> start!36038 e!221642))

(assert (=> start!36038 true))

(declare-fun array_inv!7116 (array!20373) Bool)

(assert (=> start!36038 (array_inv!7116 _keys!1541)))

(declare-fun array_inv!7117 (array!20375) Bool)

(assert (=> start!36038 (and (array_inv!7117 _values!1277) e!221646)))

(declare-fun b!361897 () Bool)

(declare-fun res!201330 () Bool)

(assert (=> b!361897 (=> (not res!201330) (not e!221642))))

(declare-fun k0!1134 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!20373 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!361897 (= res!201330 (arrayContainsKey!0 _keys!1541 k0!1134 from!1924))))

(declare-fun b!361898 () Bool)

(assert (=> b!361898 (= e!221642 (and (not (= (select (arr!9672 _keys!1541) from!1924) k0!1134)) (bvsge (bvadd #b00000000000000000000000000000001 from!1924) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1924) (size!10024 _keys!1541)) (bvsge (size!10024 _keys!1541) #b01111111111111111111111111111111)))))

(declare-fun b!361899 () Bool)

(declare-fun res!201335 () Bool)

(assert (=> b!361899 (=> (not res!201335) (not e!221642))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20373 (_ BitVec 32)) Bool)

(assert (=> b!361899 (= res!201335 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1541 mask!1943))))

(assert (= (and start!36038 res!201332) b!361894))

(assert (= (and b!361894 res!201331) b!361899))

(assert (= (and b!361899 res!201335) b!361891))

(assert (= (and b!361891 res!201334) b!361892))

(assert (= (and b!361892 res!201333) b!361897))

(assert (= (and b!361897 res!201330) b!361898))

(assert (= (and b!361896 condMapEmpty!14145) mapIsEmpty!14145))

(assert (= (and b!361896 (not condMapEmpty!14145)) mapNonEmpty!14145))

(get-info :version)

(assert (= (and mapNonEmpty!14145 ((_ is ValueCellFull!3861) mapValue!14145)) b!361895))

(assert (= (and b!361896 ((_ is ValueCellFull!3861) mapDefault!14145)) b!361893))

(assert (= start!36038 b!361896))

(declare-fun m!358531 () Bool)

(assert (=> b!361899 m!358531))

(declare-fun m!358533 () Bool)

(assert (=> b!361891 m!358533))

(declare-fun m!358535 () Bool)

(assert (=> mapNonEmpty!14145 m!358535))

(declare-fun m!358537 () Bool)

(assert (=> b!361898 m!358537))

(declare-fun m!358539 () Bool)

(assert (=> b!361897 m!358539))

(declare-fun m!358541 () Bool)

(assert (=> start!36038 m!358541))

(declare-fun m!358543 () Bool)

(assert (=> start!36038 m!358543))

(declare-fun m!358545 () Bool)

(assert (=> start!36038 m!358545))

(check-sat (not b!361891) (not mapNonEmpty!14145) (not b!361897) (not start!36038) tp_is_empty!8409 (not b!361899))
(check-sat)
(get-model)

(declare-fun b!361937 () Bool)

(declare-fun e!221672 () Bool)

(declare-fun call!27193 () Bool)

(assert (=> b!361937 (= e!221672 call!27193)))

(declare-fun b!361938 () Bool)

(declare-fun e!221670 () Bool)

(assert (=> b!361938 (= e!221670 e!221672)))

(declare-fun c!53742 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!361938 (= c!53742 (validKeyInArray!0 (select (arr!9672 _keys!1541) #b00000000000000000000000000000000)))))

(declare-fun b!361939 () Bool)

(declare-fun e!221671 () Bool)

(assert (=> b!361939 (= e!221671 e!221670)))

(declare-fun res!201360 () Bool)

(assert (=> b!361939 (=> (not res!201360) (not e!221670))))

(declare-fun e!221673 () Bool)

(assert (=> b!361939 (= res!201360 (not e!221673))))

(declare-fun res!201361 () Bool)

(assert (=> b!361939 (=> (not res!201361) (not e!221673))))

(assert (=> b!361939 (= res!201361 (validKeyInArray!0 (select (arr!9672 _keys!1541) #b00000000000000000000000000000000)))))

(declare-fun d!71969 () Bool)

(declare-fun res!201362 () Bool)

(assert (=> d!71969 (=> res!201362 e!221671)))

(assert (=> d!71969 (= res!201362 (bvsge #b00000000000000000000000000000000 (size!10024 _keys!1541)))))

(assert (=> d!71969 (= (arrayNoDuplicates!0 _keys!1541 #b00000000000000000000000000000000 Nil!5515) e!221671)))

(declare-fun bm!27190 () Bool)

(assert (=> bm!27190 (= call!27193 (arrayNoDuplicates!0 _keys!1541 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53742 (Cons!5514 (select (arr!9672 _keys!1541) #b00000000000000000000000000000000) Nil!5515) Nil!5515)))))

(declare-fun b!361940 () Bool)

(assert (=> b!361940 (= e!221672 call!27193)))

(declare-fun b!361941 () Bool)

(declare-fun contains!2429 (List!5518 (_ BitVec 64)) Bool)

(assert (=> b!361941 (= e!221673 (contains!2429 Nil!5515 (select (arr!9672 _keys!1541) #b00000000000000000000000000000000)))))

(assert (= (and d!71969 (not res!201362)) b!361939))

(assert (= (and b!361939 res!201361) b!361941))

(assert (= (and b!361939 res!201360) b!361938))

(assert (= (and b!361938 c!53742) b!361937))

(assert (= (and b!361938 (not c!53742)) b!361940))

(assert (= (or b!361937 b!361940) bm!27190))

(declare-fun m!358563 () Bool)

(assert (=> b!361938 m!358563))

(assert (=> b!361938 m!358563))

(declare-fun m!358565 () Bool)

(assert (=> b!361938 m!358565))

(assert (=> b!361939 m!358563))

(assert (=> b!361939 m!358563))

(assert (=> b!361939 m!358565))

(assert (=> bm!27190 m!358563))

(declare-fun m!358567 () Bool)

(assert (=> bm!27190 m!358567))

(assert (=> b!361941 m!358563))

(assert (=> b!361941 m!358563))

(declare-fun m!358569 () Bool)

(assert (=> b!361941 m!358569))

(assert (=> b!361891 d!71969))

(declare-fun b!361950 () Bool)

(declare-fun e!221680 () Bool)

(declare-fun e!221682 () Bool)

(assert (=> b!361950 (= e!221680 e!221682)))

(declare-fun c!53745 () Bool)

(assert (=> b!361950 (= c!53745 (validKeyInArray!0 (select (arr!9672 _keys!1541) #b00000000000000000000000000000000)))))

(declare-fun b!361951 () Bool)

(declare-fun e!221681 () Bool)

(declare-fun call!27196 () Bool)

(assert (=> b!361951 (= e!221681 call!27196)))

(declare-fun d!71971 () Bool)

(declare-fun res!201367 () Bool)

(assert (=> d!71971 (=> res!201367 e!221680)))

(assert (=> d!71971 (= res!201367 (bvsge #b00000000000000000000000000000000 (size!10024 _keys!1541)))))

(assert (=> d!71971 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1541 mask!1943) e!221680)))

(declare-fun b!361952 () Bool)

(assert (=> b!361952 (= e!221682 e!221681)))

(declare-fun lt!166601 () (_ BitVec 64))

(assert (=> b!361952 (= lt!166601 (select (arr!9672 _keys!1541) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!11120 0))(
  ( (Unit!11121) )
))
(declare-fun lt!166600 () Unit!11120)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!20373 (_ BitVec 64) (_ BitVec 32)) Unit!11120)

(assert (=> b!361952 (= lt!166600 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1541 lt!166601 #b00000000000000000000000000000000))))

(assert (=> b!361952 (arrayContainsKey!0 _keys!1541 lt!166601 #b00000000000000000000000000000000)))

(declare-fun lt!166602 () Unit!11120)

(assert (=> b!361952 (= lt!166602 lt!166600)))

(declare-fun res!201368 () Bool)

(declare-datatypes ((SeekEntryResult!3498 0))(
  ( (MissingZero!3498 (index!16171 (_ BitVec 32))) (Found!3498 (index!16172 (_ BitVec 32))) (Intermediate!3498 (undefined!4310 Bool) (index!16173 (_ BitVec 32)) (x!36068 (_ BitVec 32))) (Undefined!3498) (MissingVacant!3498 (index!16174 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!20373 (_ BitVec 32)) SeekEntryResult!3498)

(assert (=> b!361952 (= res!201368 (= (seekEntryOrOpen!0 (select (arr!9672 _keys!1541) #b00000000000000000000000000000000) _keys!1541 mask!1943) (Found!3498 #b00000000000000000000000000000000)))))

(assert (=> b!361952 (=> (not res!201368) (not e!221681))))

(declare-fun b!361953 () Bool)

(assert (=> b!361953 (= e!221682 call!27196)))

(declare-fun bm!27193 () Bool)

(assert (=> bm!27193 (= call!27196 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1541 mask!1943))))

(assert (= (and d!71971 (not res!201367)) b!361950))

(assert (= (and b!361950 c!53745) b!361952))

(assert (= (and b!361950 (not c!53745)) b!361953))

(assert (= (and b!361952 res!201368) b!361951))

(assert (= (or b!361951 b!361953) bm!27193))

(assert (=> b!361950 m!358563))

(assert (=> b!361950 m!358563))

(assert (=> b!361950 m!358565))

(assert (=> b!361952 m!358563))

(declare-fun m!358571 () Bool)

(assert (=> b!361952 m!358571))

(declare-fun m!358573 () Bool)

(assert (=> b!361952 m!358573))

(assert (=> b!361952 m!358563))

(declare-fun m!358575 () Bool)

(assert (=> b!361952 m!358575))

(declare-fun m!358577 () Bool)

(assert (=> bm!27193 m!358577))

(assert (=> b!361899 d!71971))

(declare-fun d!71973 () Bool)

(assert (=> d!71973 (= (validMask!0 mask!1943) (and (or (= mask!1943 #b00000000000000000000000000000111) (= mask!1943 #b00000000000000000000000000001111) (= mask!1943 #b00000000000000000000000000011111) (= mask!1943 #b00000000000000000000000000111111) (= mask!1943 #b00000000000000000000000001111111) (= mask!1943 #b00000000000000000000000011111111) (= mask!1943 #b00000000000000000000000111111111) (= mask!1943 #b00000000000000000000001111111111) (= mask!1943 #b00000000000000000000011111111111) (= mask!1943 #b00000000000000000000111111111111) (= mask!1943 #b00000000000000000001111111111111) (= mask!1943 #b00000000000000000011111111111111) (= mask!1943 #b00000000000000000111111111111111) (= mask!1943 #b00000000000000001111111111111111) (= mask!1943 #b00000000000000011111111111111111) (= mask!1943 #b00000000000000111111111111111111) (= mask!1943 #b00000000000001111111111111111111) (= mask!1943 #b00000000000011111111111111111111) (= mask!1943 #b00000000000111111111111111111111) (= mask!1943 #b00000000001111111111111111111111) (= mask!1943 #b00000000011111111111111111111111) (= mask!1943 #b00000000111111111111111111111111) (= mask!1943 #b00000001111111111111111111111111) (= mask!1943 #b00000011111111111111111111111111) (= mask!1943 #b00000111111111111111111111111111) (= mask!1943 #b00001111111111111111111111111111) (= mask!1943 #b00011111111111111111111111111111) (= mask!1943 #b00111111111111111111111111111111)) (bvsle mask!1943 #b00111111111111111111111111111111)))))

(assert (=> start!36038 d!71973))

(declare-fun d!71975 () Bool)

(assert (=> d!71975 (= (array_inv!7116 _keys!1541) (bvsge (size!10024 _keys!1541) #b00000000000000000000000000000000))))

(assert (=> start!36038 d!71975))

(declare-fun d!71977 () Bool)

(assert (=> d!71977 (= (array_inv!7117 _values!1277) (bvsge (size!10025 _values!1277) #b00000000000000000000000000000000))))

(assert (=> start!36038 d!71977))

(declare-fun d!71979 () Bool)

(declare-fun res!201373 () Bool)

(declare-fun e!221687 () Bool)

(assert (=> d!71979 (=> res!201373 e!221687)))

(assert (=> d!71979 (= res!201373 (= (select (arr!9672 _keys!1541) from!1924) k0!1134))))

(assert (=> d!71979 (= (arrayContainsKey!0 _keys!1541 k0!1134 from!1924) e!221687)))

(declare-fun b!361958 () Bool)

(declare-fun e!221688 () Bool)

(assert (=> b!361958 (= e!221687 e!221688)))

(declare-fun res!201374 () Bool)

(assert (=> b!361958 (=> (not res!201374) (not e!221688))))

(assert (=> b!361958 (= res!201374 (bvslt (bvadd from!1924 #b00000000000000000000000000000001) (size!10024 _keys!1541)))))

(declare-fun b!361959 () Bool)

(assert (=> b!361959 (= e!221688 (arrayContainsKey!0 _keys!1541 k0!1134 (bvadd from!1924 #b00000000000000000000000000000001)))))

(assert (= (and d!71979 (not res!201373)) b!361958))

(assert (= (and b!361958 res!201374) b!361959))

(assert (=> d!71979 m!358537))

(declare-fun m!358579 () Bool)

(assert (=> b!361959 m!358579))

(assert (=> b!361897 d!71979))

(declare-fun b!361967 () Bool)

(declare-fun e!221694 () Bool)

(assert (=> b!361967 (= e!221694 tp_is_empty!8409)))

(declare-fun b!361966 () Bool)

(declare-fun e!221693 () Bool)

(assert (=> b!361966 (= e!221693 tp_is_empty!8409)))

(declare-fun condMapEmpty!14151 () Bool)

(declare-fun mapDefault!14151 () ValueCell!3861)

(assert (=> mapNonEmpty!14145 (= condMapEmpty!14151 (= mapRest!14145 ((as const (Array (_ BitVec 32) ValueCell!3861)) mapDefault!14151)))))

(declare-fun mapRes!14151 () Bool)

(assert (=> mapNonEmpty!14145 (= tp!28221 (and e!221694 mapRes!14151))))

(declare-fun mapIsEmpty!14151 () Bool)

(assert (=> mapIsEmpty!14151 mapRes!14151))

(declare-fun mapNonEmpty!14151 () Bool)

(declare-fun tp!28227 () Bool)

(assert (=> mapNonEmpty!14151 (= mapRes!14151 (and tp!28227 e!221693))))

(declare-fun mapKey!14151 () (_ BitVec 32))

(declare-fun mapRest!14151 () (Array (_ BitVec 32) ValueCell!3861))

(declare-fun mapValue!14151 () ValueCell!3861)

(assert (=> mapNonEmpty!14151 (= mapRest!14145 (store mapRest!14151 mapKey!14151 mapValue!14151))))

(assert (= (and mapNonEmpty!14145 condMapEmpty!14151) mapIsEmpty!14151))

(assert (= (and mapNonEmpty!14145 (not condMapEmpty!14151)) mapNonEmpty!14151))

(assert (= (and mapNonEmpty!14151 ((_ is ValueCellFull!3861) mapValue!14151)) b!361966))

(assert (= (and mapNonEmpty!14145 ((_ is ValueCellFull!3861) mapDefault!14151)) b!361967))

(declare-fun m!358581 () Bool)

(assert (=> mapNonEmpty!14151 m!358581))

(check-sat (not bm!27193) (not b!361950) (not b!361938) (not mapNonEmpty!14151) (not bm!27190) (not b!361959) (not b!361939) (not b!361941) tp_is_empty!8409 (not b!361952))
(check-sat)
