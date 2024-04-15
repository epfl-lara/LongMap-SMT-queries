; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34516 () Bool)

(assert start!34516)

(declare-fun b_free!7453 () Bool)

(declare-fun b_next!7453 () Bool)

(assert (=> start!34516 (= b_free!7453 (not b_next!7453))))

(declare-fun tp!25905 () Bool)

(declare-fun b_and!14635 () Bool)

(assert (=> start!34516 (= tp!25905 b_and!14635)))

(declare-fun b!344888 () Bool)

(declare-fun res!190839 () Bool)

(declare-fun e!211374 () Bool)

(assert (=> b!344888 (=> (not res!190839) (not e!211374))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((array!18379 0))(
  ( (array!18380 (arr!8706 (Array (_ BitVec 32) (_ BitVec 64))) (size!9059 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18379)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-datatypes ((V!10851 0))(
  ( (V!10852 (val!3747 Int)) )
))
(declare-datatypes ((ValueCell!3359 0))(
  ( (ValueCellFull!3359 (v!5917 V!10851)) (EmptyCell!3359) )
))
(declare-datatypes ((array!18381 0))(
  ( (array!18382 (arr!8707 (Array (_ BitVec 32) ValueCell!3359)) (size!9060 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18381)

(assert (=> b!344888 (= res!190839 (and (= (size!9060 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9059 _keys!1895) (size!9060 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!344889 () Bool)

(declare-fun e!211377 () Bool)

(declare-fun tp_is_empty!7405 () Bool)

(assert (=> b!344889 (= e!211377 tp_is_empty!7405)))

(declare-fun b!344890 () Bool)

(declare-fun res!190843 () Bool)

(assert (=> b!344890 (=> (not res!190843) (not e!211374))))

(declare-fun zeroValue!1467 () V!10851)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10851)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((tuple2!5382 0))(
  ( (tuple2!5383 (_1!2702 (_ BitVec 64)) (_2!2702 V!10851)) )
))
(declare-datatypes ((List!5000 0))(
  ( (Nil!4997) (Cons!4996 (h!5852 tuple2!5382) (t!10107 List!5000)) )
))
(declare-datatypes ((ListLongMap!4285 0))(
  ( (ListLongMap!4286 (toList!2158 List!5000)) )
))
(declare-fun contains!2227 (ListLongMap!4285 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1664 (array!18379 array!18381 (_ BitVec 32) (_ BitVec 32) V!10851 V!10851 (_ BitVec 32) Int) ListLongMap!4285)

(assert (=> b!344890 (= res!190843 (not (contains!2227 (getCurrentListMap!1664 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-datatypes ((SeekEntryResult!3353 0))(
  ( (MissingZero!3353 (index!15591 (_ BitVec 32))) (Found!3353 (index!15592 (_ BitVec 32))) (Intermediate!3353 (undefined!4165 Bool) (index!15593 (_ BitVec 32)) (x!34382 (_ BitVec 32))) (Undefined!3353) (MissingVacant!3353 (index!15594 (_ BitVec 32))) )
))
(declare-fun lt!162519 () SeekEntryResult!3353)

(declare-fun b!344891 () Bool)

(get-info :version)

(assert (=> b!344891 (= e!211374 (and ((_ is Found!3353) lt!162519) (not (= (select (arr!8706 _keys!1895) (index!15592 lt!162519)) k0!1348))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18379 (_ BitVec 32)) SeekEntryResult!3353)

(assert (=> b!344891 (= lt!162519 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!12546 () Bool)

(declare-fun mapRes!12546 () Bool)

(assert (=> mapIsEmpty!12546 mapRes!12546))

(declare-fun b!344892 () Bool)

(declare-fun res!190841 () Bool)

(assert (=> b!344892 (=> (not res!190841) (not e!211374))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18379 (_ BitVec 32)) Bool)

(assert (=> b!344892 (= res!190841 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!344893 () Bool)

(declare-fun e!211376 () Bool)

(assert (=> b!344893 (= e!211376 (and e!211377 mapRes!12546))))

(declare-fun condMapEmpty!12546 () Bool)

(declare-fun mapDefault!12546 () ValueCell!3359)

(assert (=> b!344893 (= condMapEmpty!12546 (= (arr!8707 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3359)) mapDefault!12546)))))

(declare-fun b!344894 () Bool)

(declare-fun res!190840 () Bool)

(assert (=> b!344894 (=> (not res!190840) (not e!211374))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!344894 (= res!190840 (validKeyInArray!0 k0!1348))))

(declare-fun b!344895 () Bool)

(declare-fun res!190842 () Bool)

(assert (=> b!344895 (=> (not res!190842) (not e!211374))))

(declare-datatypes ((List!5001 0))(
  ( (Nil!4998) (Cons!4997 (h!5853 (_ BitVec 64)) (t!10108 List!5001)) )
))
(declare-fun arrayNoDuplicates!0 (array!18379 (_ BitVec 32) List!5001) Bool)

(assert (=> b!344895 (= res!190842 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4998))))

(declare-fun b!344896 () Bool)

(declare-fun e!211375 () Bool)

(assert (=> b!344896 (= e!211375 tp_is_empty!7405)))

(declare-fun mapNonEmpty!12546 () Bool)

(declare-fun tp!25904 () Bool)

(assert (=> mapNonEmpty!12546 (= mapRes!12546 (and tp!25904 e!211375))))

(declare-fun mapRest!12546 () (Array (_ BitVec 32) ValueCell!3359))

(declare-fun mapValue!12546 () ValueCell!3359)

(declare-fun mapKey!12546 () (_ BitVec 32))

(assert (=> mapNonEmpty!12546 (= (arr!8707 _values!1525) (store mapRest!12546 mapKey!12546 mapValue!12546))))

(declare-fun res!190844 () Bool)

(assert (=> start!34516 (=> (not res!190844) (not e!211374))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34516 (= res!190844 (validMask!0 mask!2385))))

(assert (=> start!34516 e!211374))

(assert (=> start!34516 true))

(assert (=> start!34516 tp_is_empty!7405))

(assert (=> start!34516 tp!25905))

(declare-fun array_inv!6474 (array!18381) Bool)

(assert (=> start!34516 (and (array_inv!6474 _values!1525) e!211376)))

(declare-fun array_inv!6475 (array!18379) Bool)

(assert (=> start!34516 (array_inv!6475 _keys!1895)))

(assert (= (and start!34516 res!190844) b!344888))

(assert (= (and b!344888 res!190839) b!344892))

(assert (= (and b!344892 res!190841) b!344895))

(assert (= (and b!344895 res!190842) b!344894))

(assert (= (and b!344894 res!190840) b!344890))

(assert (= (and b!344890 res!190843) b!344891))

(assert (= (and b!344893 condMapEmpty!12546) mapIsEmpty!12546))

(assert (= (and b!344893 (not condMapEmpty!12546)) mapNonEmpty!12546))

(assert (= (and mapNonEmpty!12546 ((_ is ValueCellFull!3359) mapValue!12546)) b!344896))

(assert (= (and b!344893 ((_ is ValueCellFull!3359) mapDefault!12546)) b!344889))

(assert (= start!34516 b!344893))

(declare-fun m!345867 () Bool)

(assert (=> b!344894 m!345867))

(declare-fun m!345869 () Bool)

(assert (=> b!344892 m!345869))

(declare-fun m!345871 () Bool)

(assert (=> b!344895 m!345871))

(declare-fun m!345873 () Bool)

(assert (=> b!344891 m!345873))

(declare-fun m!345875 () Bool)

(assert (=> b!344891 m!345875))

(declare-fun m!345877 () Bool)

(assert (=> b!344890 m!345877))

(assert (=> b!344890 m!345877))

(declare-fun m!345879 () Bool)

(assert (=> b!344890 m!345879))

(declare-fun m!345881 () Bool)

(assert (=> start!34516 m!345881))

(declare-fun m!345883 () Bool)

(assert (=> start!34516 m!345883))

(declare-fun m!345885 () Bool)

(assert (=> start!34516 m!345885))

(declare-fun m!345887 () Bool)

(assert (=> mapNonEmpty!12546 m!345887))

(check-sat (not b!344891) (not b!344894) (not mapNonEmpty!12546) b_and!14635 (not b_next!7453) tp_is_empty!7405 (not b!344890) (not b!344895) (not b!344892) (not start!34516))
(check-sat b_and!14635 (not b_next!7453))
(get-model)

(declare-fun b!344963 () Bool)

(declare-fun e!211416 () SeekEntryResult!3353)

(declare-fun lt!162533 () SeekEntryResult!3353)

(assert (=> b!344963 (= e!211416 (MissingZero!3353 (index!15593 lt!162533)))))

(declare-fun b!344964 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18379 (_ BitVec 32)) SeekEntryResult!3353)

(assert (=> b!344964 (= e!211416 (seekKeyOrZeroReturnVacant!0 (x!34382 lt!162533) (index!15593 lt!162533) (index!15593 lt!162533) k0!1348 _keys!1895 mask!2385))))

(declare-fun b!344965 () Bool)

(declare-fun c!52891 () Bool)

(declare-fun lt!162532 () (_ BitVec 64))

(assert (=> b!344965 (= c!52891 (= lt!162532 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!211415 () SeekEntryResult!3353)

(assert (=> b!344965 (= e!211415 e!211416)))

(declare-fun d!70913 () Bool)

(declare-fun lt!162534 () SeekEntryResult!3353)

(assert (=> d!70913 (and (or ((_ is Undefined!3353) lt!162534) (not ((_ is Found!3353) lt!162534)) (and (bvsge (index!15592 lt!162534) #b00000000000000000000000000000000) (bvslt (index!15592 lt!162534) (size!9059 _keys!1895)))) (or ((_ is Undefined!3353) lt!162534) ((_ is Found!3353) lt!162534) (not ((_ is MissingZero!3353) lt!162534)) (and (bvsge (index!15591 lt!162534) #b00000000000000000000000000000000) (bvslt (index!15591 lt!162534) (size!9059 _keys!1895)))) (or ((_ is Undefined!3353) lt!162534) ((_ is Found!3353) lt!162534) ((_ is MissingZero!3353) lt!162534) (not ((_ is MissingVacant!3353) lt!162534)) (and (bvsge (index!15594 lt!162534) #b00000000000000000000000000000000) (bvslt (index!15594 lt!162534) (size!9059 _keys!1895)))) (or ((_ is Undefined!3353) lt!162534) (ite ((_ is Found!3353) lt!162534) (= (select (arr!8706 _keys!1895) (index!15592 lt!162534)) k0!1348) (ite ((_ is MissingZero!3353) lt!162534) (= (select (arr!8706 _keys!1895) (index!15591 lt!162534)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3353) lt!162534) (= (select (arr!8706 _keys!1895) (index!15594 lt!162534)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!211417 () SeekEntryResult!3353)

(assert (=> d!70913 (= lt!162534 e!211417)))

(declare-fun c!52892 () Bool)

(assert (=> d!70913 (= c!52892 (and ((_ is Intermediate!3353) lt!162533) (undefined!4165 lt!162533)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18379 (_ BitVec 32)) SeekEntryResult!3353)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!70913 (= lt!162533 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!70913 (validMask!0 mask!2385)))

(assert (=> d!70913 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!162534)))

(declare-fun b!344966 () Bool)

(assert (=> b!344966 (= e!211415 (Found!3353 (index!15593 lt!162533)))))

(declare-fun b!344967 () Bool)

(assert (=> b!344967 (= e!211417 e!211415)))

(assert (=> b!344967 (= lt!162532 (select (arr!8706 _keys!1895) (index!15593 lt!162533)))))

(declare-fun c!52890 () Bool)

(assert (=> b!344967 (= c!52890 (= lt!162532 k0!1348))))

(declare-fun b!344968 () Bool)

(assert (=> b!344968 (= e!211417 Undefined!3353)))

(assert (= (and d!70913 c!52892) b!344968))

(assert (= (and d!70913 (not c!52892)) b!344967))

(assert (= (and b!344967 c!52890) b!344966))

(assert (= (and b!344967 (not c!52890)) b!344965))

(assert (= (and b!344965 c!52891) b!344963))

(assert (= (and b!344965 (not c!52891)) b!344964))

(declare-fun m!345933 () Bool)

(assert (=> b!344964 m!345933))

(declare-fun m!345935 () Bool)

(assert (=> d!70913 m!345935))

(declare-fun m!345937 () Bool)

(assert (=> d!70913 m!345937))

(declare-fun m!345939 () Bool)

(assert (=> d!70913 m!345939))

(assert (=> d!70913 m!345939))

(declare-fun m!345941 () Bool)

(assert (=> d!70913 m!345941))

(declare-fun m!345943 () Bool)

(assert (=> d!70913 m!345943))

(assert (=> d!70913 m!345881))

(declare-fun m!345945 () Bool)

(assert (=> b!344967 m!345945))

(assert (=> b!344891 d!70913))

(declare-fun d!70915 () Bool)

(declare-fun res!190887 () Bool)

(declare-fun e!211427 () Bool)

(assert (=> d!70915 (=> res!190887 e!211427)))

(assert (=> d!70915 (= res!190887 (bvsge #b00000000000000000000000000000000 (size!9059 _keys!1895)))))

(assert (=> d!70915 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4998) e!211427)))

(declare-fun bm!26648 () Bool)

(declare-fun call!26651 () Bool)

(declare-fun c!52895 () Bool)

(assert (=> bm!26648 (= call!26651 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!52895 (Cons!4997 (select (arr!8706 _keys!1895) #b00000000000000000000000000000000) Nil!4998) Nil!4998)))))

(declare-fun b!344979 () Bool)

(declare-fun e!211428 () Bool)

(declare-fun e!211429 () Bool)

(assert (=> b!344979 (= e!211428 e!211429)))

(assert (=> b!344979 (= c!52895 (validKeyInArray!0 (select (arr!8706 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!344980 () Bool)

(declare-fun e!211426 () Bool)

(declare-fun contains!2229 (List!5001 (_ BitVec 64)) Bool)

(assert (=> b!344980 (= e!211426 (contains!2229 Nil!4998 (select (arr!8706 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!344981 () Bool)

(assert (=> b!344981 (= e!211429 call!26651)))

(declare-fun b!344982 () Bool)

(assert (=> b!344982 (= e!211429 call!26651)))

(declare-fun b!344983 () Bool)

(assert (=> b!344983 (= e!211427 e!211428)))

(declare-fun res!190889 () Bool)

(assert (=> b!344983 (=> (not res!190889) (not e!211428))))

(assert (=> b!344983 (= res!190889 (not e!211426))))

(declare-fun res!190888 () Bool)

(assert (=> b!344983 (=> (not res!190888) (not e!211426))))

(assert (=> b!344983 (= res!190888 (validKeyInArray!0 (select (arr!8706 _keys!1895) #b00000000000000000000000000000000)))))

(assert (= (and d!70915 (not res!190887)) b!344983))

(assert (= (and b!344983 res!190888) b!344980))

(assert (= (and b!344983 res!190889) b!344979))

(assert (= (and b!344979 c!52895) b!344981))

(assert (= (and b!344979 (not c!52895)) b!344982))

(assert (= (or b!344981 b!344982) bm!26648))

(declare-fun m!345947 () Bool)

(assert (=> bm!26648 m!345947))

(declare-fun m!345949 () Bool)

(assert (=> bm!26648 m!345949))

(assert (=> b!344979 m!345947))

(assert (=> b!344979 m!345947))

(declare-fun m!345951 () Bool)

(assert (=> b!344979 m!345951))

(assert (=> b!344980 m!345947))

(assert (=> b!344980 m!345947))

(declare-fun m!345953 () Bool)

(assert (=> b!344980 m!345953))

(assert (=> b!344983 m!345947))

(assert (=> b!344983 m!345947))

(assert (=> b!344983 m!345951))

(assert (=> b!344895 d!70915))

(declare-fun d!70917 () Bool)

(declare-fun e!211434 () Bool)

(assert (=> d!70917 e!211434))

(declare-fun res!190892 () Bool)

(assert (=> d!70917 (=> res!190892 e!211434)))

(declare-fun lt!162545 () Bool)

(assert (=> d!70917 (= res!190892 (not lt!162545))))

(declare-fun lt!162544 () Bool)

(assert (=> d!70917 (= lt!162545 lt!162544)))

(declare-datatypes ((Unit!10706 0))(
  ( (Unit!10707) )
))
(declare-fun lt!162546 () Unit!10706)

(declare-fun e!211435 () Unit!10706)

(assert (=> d!70917 (= lt!162546 e!211435)))

(declare-fun c!52898 () Bool)

(assert (=> d!70917 (= c!52898 lt!162544)))

(declare-fun containsKey!328 (List!5000 (_ BitVec 64)) Bool)

(assert (=> d!70917 (= lt!162544 (containsKey!328 (toList!2158 (getCurrentListMap!1664 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!70917 (= (contains!2227 (getCurrentListMap!1664 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!162545)))

(declare-fun b!344990 () Bool)

(declare-fun lt!162543 () Unit!10706)

(assert (=> b!344990 (= e!211435 lt!162543)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!277 (List!5000 (_ BitVec 64)) Unit!10706)

(assert (=> b!344990 (= lt!162543 (lemmaContainsKeyImpliesGetValueByKeyDefined!277 (toList!2158 (getCurrentListMap!1664 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!342 0))(
  ( (Some!341 (v!5920 V!10851)) (None!340) )
))
(declare-fun isDefined!278 (Option!342) Bool)

(declare-fun getValueByKey!336 (List!5000 (_ BitVec 64)) Option!342)

(assert (=> b!344990 (isDefined!278 (getValueByKey!336 (toList!2158 (getCurrentListMap!1664 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!344991 () Bool)

(declare-fun Unit!10708 () Unit!10706)

(assert (=> b!344991 (= e!211435 Unit!10708)))

(declare-fun b!344992 () Bool)

(assert (=> b!344992 (= e!211434 (isDefined!278 (getValueByKey!336 (toList!2158 (getCurrentListMap!1664 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!70917 c!52898) b!344990))

(assert (= (and d!70917 (not c!52898)) b!344991))

(assert (= (and d!70917 (not res!190892)) b!344992))

(declare-fun m!345955 () Bool)

(assert (=> d!70917 m!345955))

(declare-fun m!345957 () Bool)

(assert (=> b!344990 m!345957))

(declare-fun m!345959 () Bool)

(assert (=> b!344990 m!345959))

(assert (=> b!344990 m!345959))

(declare-fun m!345961 () Bool)

(assert (=> b!344990 m!345961))

(assert (=> b!344992 m!345959))

(assert (=> b!344992 m!345959))

(assert (=> b!344992 m!345961))

(assert (=> b!344890 d!70917))

(declare-fun b!345035 () Bool)

(declare-fun e!211468 () Bool)

(declare-fun e!211474 () Bool)

(assert (=> b!345035 (= e!211468 e!211474)))

(declare-fun c!52915 () Bool)

(assert (=> b!345035 (= c!52915 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!345036 () Bool)

(declare-fun e!211465 () Bool)

(assert (=> b!345036 (= e!211474 e!211465)))

(declare-fun res!190916 () Bool)

(declare-fun call!26672 () Bool)

(assert (=> b!345036 (= res!190916 call!26672)))

(assert (=> b!345036 (=> (not res!190916) (not e!211465))))

(declare-fun b!345037 () Bool)

(declare-fun e!211466 () Bool)

(declare-fun e!211463 () Bool)

(assert (=> b!345037 (= e!211466 e!211463)))

(declare-fun res!190913 () Bool)

(assert (=> b!345037 (=> (not res!190913) (not e!211463))))

(declare-fun lt!162594 () ListLongMap!4285)

(assert (=> b!345037 (= res!190913 (contains!2227 lt!162594 (select (arr!8706 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!345037 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9059 _keys!1895)))))

(declare-fun bm!26663 () Bool)

(declare-fun call!26666 () ListLongMap!4285)

(declare-fun call!26668 () ListLongMap!4285)

(assert (=> bm!26663 (= call!26666 call!26668)))

(declare-fun bm!26664 () Bool)

(declare-fun call!26671 () Bool)

(assert (=> bm!26664 (= call!26671 (contains!2227 lt!162594 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!345038 () Bool)

(declare-fun e!211467 () Bool)

(declare-fun e!211470 () Bool)

(assert (=> b!345038 (= e!211467 e!211470)))

(declare-fun res!190919 () Bool)

(assert (=> b!345038 (= res!190919 call!26671)))

(assert (=> b!345038 (=> (not res!190919) (not e!211470))))

(declare-fun b!345039 () Bool)

(declare-fun e!211473 () Bool)

(assert (=> b!345039 (= e!211473 (validKeyInArray!0 (select (arr!8706 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!345040 () Bool)

(declare-fun apply!280 (ListLongMap!4285 (_ BitVec 64)) V!10851)

(declare-fun get!4688 (ValueCell!3359 V!10851) V!10851)

(declare-fun dynLambda!614 (Int (_ BitVec 64)) V!10851)

(assert (=> b!345040 (= e!211463 (= (apply!280 lt!162594 (select (arr!8706 _keys!1895) #b00000000000000000000000000000000)) (get!4688 (select (arr!8707 _values!1525) #b00000000000000000000000000000000) (dynLambda!614 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!345040 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9060 _values!1525)))))

(assert (=> b!345040 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9059 _keys!1895)))))

(declare-fun bm!26665 () Bool)

(declare-fun call!26670 () ListLongMap!4285)

(assert (=> bm!26665 (= call!26670 call!26666)))

(declare-fun bm!26667 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!596 (array!18379 array!18381 (_ BitVec 32) (_ BitVec 32) V!10851 V!10851 (_ BitVec 32) Int) ListLongMap!4285)

(assert (=> bm!26667 (= call!26668 (getCurrentListMapNoExtraKeys!596 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!345041 () Bool)

(declare-fun e!211462 () ListLongMap!4285)

(declare-fun e!211464 () ListLongMap!4285)

(assert (=> b!345041 (= e!211462 e!211464)))

(declare-fun c!52913 () Bool)

(assert (=> b!345041 (= c!52913 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!345042 () Bool)

(declare-fun res!190918 () Bool)

(assert (=> b!345042 (=> (not res!190918) (not e!211468))))

(assert (=> b!345042 (= res!190918 e!211466)))

(declare-fun res!190911 () Bool)

(assert (=> b!345042 (=> res!190911 e!211466)))

(declare-fun e!211471 () Bool)

(assert (=> b!345042 (= res!190911 (not e!211471))))

(declare-fun res!190914 () Bool)

(assert (=> b!345042 (=> (not res!190914) (not e!211471))))

(assert (=> b!345042 (= res!190914 (bvslt #b00000000000000000000000000000000 (size!9059 _keys!1895)))))

(declare-fun b!345043 () Bool)

(declare-fun e!211469 () Unit!10706)

(declare-fun lt!162598 () Unit!10706)

(assert (=> b!345043 (= e!211469 lt!162598)))

(declare-fun lt!162605 () ListLongMap!4285)

(assert (=> b!345043 (= lt!162605 (getCurrentListMapNoExtraKeys!596 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!162597 () (_ BitVec 64))

(assert (=> b!345043 (= lt!162597 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!162607 () (_ BitVec 64))

(assert (=> b!345043 (= lt!162607 (select (arr!8706 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!162603 () Unit!10706)

(declare-fun addStillContains!256 (ListLongMap!4285 (_ BitVec 64) V!10851 (_ BitVec 64)) Unit!10706)

(assert (=> b!345043 (= lt!162603 (addStillContains!256 lt!162605 lt!162597 zeroValue!1467 lt!162607))))

(declare-fun +!733 (ListLongMap!4285 tuple2!5382) ListLongMap!4285)

(assert (=> b!345043 (contains!2227 (+!733 lt!162605 (tuple2!5383 lt!162597 zeroValue!1467)) lt!162607)))

(declare-fun lt!162600 () Unit!10706)

(assert (=> b!345043 (= lt!162600 lt!162603)))

(declare-fun lt!162602 () ListLongMap!4285)

(assert (=> b!345043 (= lt!162602 (getCurrentListMapNoExtraKeys!596 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!162609 () (_ BitVec 64))

(assert (=> b!345043 (= lt!162609 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!162608 () (_ BitVec 64))

(assert (=> b!345043 (= lt!162608 (select (arr!8706 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!162611 () Unit!10706)

(declare-fun addApplyDifferent!256 (ListLongMap!4285 (_ BitVec 64) V!10851 (_ BitVec 64)) Unit!10706)

(assert (=> b!345043 (= lt!162611 (addApplyDifferent!256 lt!162602 lt!162609 minValue!1467 lt!162608))))

(assert (=> b!345043 (= (apply!280 (+!733 lt!162602 (tuple2!5383 lt!162609 minValue!1467)) lt!162608) (apply!280 lt!162602 lt!162608))))

(declare-fun lt!162604 () Unit!10706)

(assert (=> b!345043 (= lt!162604 lt!162611)))

(declare-fun lt!162591 () ListLongMap!4285)

(assert (=> b!345043 (= lt!162591 (getCurrentListMapNoExtraKeys!596 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!162606 () (_ BitVec 64))

(assert (=> b!345043 (= lt!162606 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!162593 () (_ BitVec 64))

(assert (=> b!345043 (= lt!162593 (select (arr!8706 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!162610 () Unit!10706)

(assert (=> b!345043 (= lt!162610 (addApplyDifferent!256 lt!162591 lt!162606 zeroValue!1467 lt!162593))))

(assert (=> b!345043 (= (apply!280 (+!733 lt!162591 (tuple2!5383 lt!162606 zeroValue!1467)) lt!162593) (apply!280 lt!162591 lt!162593))))

(declare-fun lt!162601 () Unit!10706)

(assert (=> b!345043 (= lt!162601 lt!162610)))

(declare-fun lt!162595 () ListLongMap!4285)

(assert (=> b!345043 (= lt!162595 (getCurrentListMapNoExtraKeys!596 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!162612 () (_ BitVec 64))

(assert (=> b!345043 (= lt!162612 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!162596 () (_ BitVec 64))

(assert (=> b!345043 (= lt!162596 (select (arr!8706 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!345043 (= lt!162598 (addApplyDifferent!256 lt!162595 lt!162612 minValue!1467 lt!162596))))

(assert (=> b!345043 (= (apply!280 (+!733 lt!162595 (tuple2!5383 lt!162612 minValue!1467)) lt!162596) (apply!280 lt!162595 lt!162596))))

(declare-fun b!345044 () Bool)

(assert (=> b!345044 (= e!211471 (validKeyInArray!0 (select (arr!8706 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!345045 () Bool)

(declare-fun res!190912 () Bool)

(assert (=> b!345045 (=> (not res!190912) (not e!211468))))

(assert (=> b!345045 (= res!190912 e!211467)))

(declare-fun c!52914 () Bool)

(assert (=> b!345045 (= c!52914 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!345046 () Bool)

(assert (=> b!345046 (= e!211470 (= (apply!280 lt!162594 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun b!345047 () Bool)

(declare-fun e!211472 () ListLongMap!4285)

(declare-fun call!26669 () ListLongMap!4285)

(assert (=> b!345047 (= e!211472 call!26669)))

(declare-fun b!345048 () Bool)

(assert (=> b!345048 (= e!211465 (= (apply!280 lt!162594 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun b!345049 () Bool)

(declare-fun Unit!10709 () Unit!10706)

(assert (=> b!345049 (= e!211469 Unit!10709)))

(declare-fun b!345050 () Bool)

(assert (=> b!345050 (= e!211472 call!26670)))

(declare-fun bm!26666 () Bool)

(declare-fun c!52916 () Bool)

(declare-fun call!26667 () ListLongMap!4285)

(assert (=> bm!26666 (= call!26667 (+!733 (ite c!52916 call!26668 (ite c!52913 call!26666 call!26670)) (ite (or c!52916 c!52913) (tuple2!5383 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun d!70919 () Bool)

(assert (=> d!70919 e!211468))

(declare-fun res!190917 () Bool)

(assert (=> d!70919 (=> (not res!190917) (not e!211468))))

(assert (=> d!70919 (= res!190917 (or (bvsge #b00000000000000000000000000000000 (size!9059 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9059 _keys!1895)))))))

(declare-fun lt!162599 () ListLongMap!4285)

(assert (=> d!70919 (= lt!162594 lt!162599)))

(declare-fun lt!162592 () Unit!10706)

(assert (=> d!70919 (= lt!162592 e!211469)))

(declare-fun c!52911 () Bool)

(assert (=> d!70919 (= c!52911 e!211473)))

(declare-fun res!190915 () Bool)

(assert (=> d!70919 (=> (not res!190915) (not e!211473))))

(assert (=> d!70919 (= res!190915 (bvslt #b00000000000000000000000000000000 (size!9059 _keys!1895)))))

(assert (=> d!70919 (= lt!162599 e!211462)))

(assert (=> d!70919 (= c!52916 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!70919 (validMask!0 mask!2385)))

(assert (=> d!70919 (= (getCurrentListMap!1664 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!162594)))

(declare-fun b!345051 () Bool)

(assert (=> b!345051 (= e!211462 (+!733 call!26667 (tuple2!5383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun b!345052 () Bool)

(assert (=> b!345052 (= e!211464 call!26669)))

(declare-fun b!345053 () Bool)

(declare-fun c!52912 () Bool)

(assert (=> b!345053 (= c!52912 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!345053 (= e!211464 e!211472)))

(declare-fun bm!26668 () Bool)

(assert (=> bm!26668 (= call!26669 call!26667)))

(declare-fun bm!26669 () Bool)

(assert (=> bm!26669 (= call!26672 (contains!2227 lt!162594 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!345054 () Bool)

(assert (=> b!345054 (= e!211474 (not call!26672))))

(declare-fun b!345055 () Bool)

(assert (=> b!345055 (= e!211467 (not call!26671))))

(assert (= (and d!70919 c!52916) b!345051))

(assert (= (and d!70919 (not c!52916)) b!345041))

(assert (= (and b!345041 c!52913) b!345052))

(assert (= (and b!345041 (not c!52913)) b!345053))

(assert (= (and b!345053 c!52912) b!345047))

(assert (= (and b!345053 (not c!52912)) b!345050))

(assert (= (or b!345047 b!345050) bm!26665))

(assert (= (or b!345052 bm!26665) bm!26663))

(assert (= (or b!345052 b!345047) bm!26668))

(assert (= (or b!345051 bm!26663) bm!26667))

(assert (= (or b!345051 bm!26668) bm!26666))

(assert (= (and d!70919 res!190915) b!345039))

(assert (= (and d!70919 c!52911) b!345043))

(assert (= (and d!70919 (not c!52911)) b!345049))

(assert (= (and d!70919 res!190917) b!345042))

(assert (= (and b!345042 res!190914) b!345044))

(assert (= (and b!345042 (not res!190911)) b!345037))

(assert (= (and b!345037 res!190913) b!345040))

(assert (= (and b!345042 res!190918) b!345045))

(assert (= (and b!345045 c!52914) b!345038))

(assert (= (and b!345045 (not c!52914)) b!345055))

(assert (= (and b!345038 res!190919) b!345046))

(assert (= (or b!345038 b!345055) bm!26664))

(assert (= (and b!345045 res!190912) b!345035))

(assert (= (and b!345035 c!52915) b!345036))

(assert (= (and b!345035 (not c!52915)) b!345054))

(assert (= (and b!345036 res!190916) b!345048))

(assert (= (or b!345036 b!345054) bm!26669))

(declare-fun b_lambda!8441 () Bool)

(assert (=> (not b_lambda!8441) (not b!345040)))

(declare-fun t!10111 () Bool)

(declare-fun tb!3067 () Bool)

(assert (=> (and start!34516 (= defaultEntry!1528 defaultEntry!1528) t!10111) tb!3067))

(declare-fun result!5547 () Bool)

(assert (=> tb!3067 (= result!5547 tp_is_empty!7405)))

(assert (=> b!345040 t!10111))

(declare-fun b_and!14641 () Bool)

(assert (= b_and!14635 (and (=> t!10111 result!5547) b_and!14641)))

(assert (=> b!345039 m!345947))

(assert (=> b!345039 m!345947))

(assert (=> b!345039 m!345951))

(declare-fun m!345963 () Bool)

(assert (=> b!345046 m!345963))

(declare-fun m!345965 () Bool)

(assert (=> bm!26667 m!345965))

(assert (=> b!345037 m!345947))

(assert (=> b!345037 m!345947))

(declare-fun m!345967 () Bool)

(assert (=> b!345037 m!345967))

(declare-fun m!345969 () Bool)

(assert (=> b!345051 m!345969))

(declare-fun m!345971 () Bool)

(assert (=> b!345048 m!345971))

(declare-fun m!345973 () Bool)

(assert (=> bm!26664 m!345973))

(declare-fun m!345975 () Bool)

(assert (=> bm!26669 m!345975))

(declare-fun m!345977 () Bool)

(assert (=> bm!26666 m!345977))

(assert (=> b!345040 m!345947))

(assert (=> b!345040 m!345947))

(declare-fun m!345979 () Bool)

(assert (=> b!345040 m!345979))

(declare-fun m!345981 () Bool)

(assert (=> b!345040 m!345981))

(declare-fun m!345983 () Bool)

(assert (=> b!345040 m!345983))

(declare-fun m!345985 () Bool)

(assert (=> b!345040 m!345985))

(assert (=> b!345040 m!345983))

(assert (=> b!345040 m!345981))

(declare-fun m!345987 () Bool)

(assert (=> b!345043 m!345987))

(assert (=> b!345043 m!345947))

(declare-fun m!345989 () Bool)

(assert (=> b!345043 m!345989))

(assert (=> b!345043 m!345965))

(declare-fun m!345991 () Bool)

(assert (=> b!345043 m!345991))

(declare-fun m!345993 () Bool)

(assert (=> b!345043 m!345993))

(declare-fun m!345995 () Bool)

(assert (=> b!345043 m!345995))

(declare-fun m!345997 () Bool)

(assert (=> b!345043 m!345997))

(assert (=> b!345043 m!345997))

(declare-fun m!345999 () Bool)

(assert (=> b!345043 m!345999))

(declare-fun m!346001 () Bool)

(assert (=> b!345043 m!346001))

(assert (=> b!345043 m!345995))

(declare-fun m!346003 () Bool)

(assert (=> b!345043 m!346003))

(declare-fun m!346005 () Bool)

(assert (=> b!345043 m!346005))

(declare-fun m!346007 () Bool)

(assert (=> b!345043 m!346007))

(declare-fun m!346009 () Bool)

(assert (=> b!345043 m!346009))

(assert (=> b!345043 m!346009))

(declare-fun m!346011 () Bool)

(assert (=> b!345043 m!346011))

(declare-fun m!346013 () Bool)

(assert (=> b!345043 m!346013))

(assert (=> b!345043 m!346001))

(declare-fun m!346015 () Bool)

(assert (=> b!345043 m!346015))

(assert (=> b!345044 m!345947))

(assert (=> b!345044 m!345947))

(assert (=> b!345044 m!345951))

(assert (=> d!70919 m!345881))

(assert (=> b!344890 d!70919))

(declare-fun d!70921 () Bool)

(assert (=> d!70921 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!344894 d!70921))

(declare-fun d!70923 () Bool)

(declare-fun res!190924 () Bool)

(declare-fun e!211481 () Bool)

(assert (=> d!70923 (=> res!190924 e!211481)))

(assert (=> d!70923 (= res!190924 (bvsge #b00000000000000000000000000000000 (size!9059 _keys!1895)))))

(assert (=> d!70923 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!211481)))

(declare-fun b!345066 () Bool)

(declare-fun e!211483 () Bool)

(declare-fun call!26675 () Bool)

(assert (=> b!345066 (= e!211483 call!26675)))

(declare-fun b!345067 () Bool)

(declare-fun e!211482 () Bool)

(assert (=> b!345067 (= e!211482 call!26675)))

(declare-fun bm!26672 () Bool)

(assert (=> bm!26672 (= call!26675 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun b!345068 () Bool)

(assert (=> b!345068 (= e!211482 e!211483)))

(declare-fun lt!162621 () (_ BitVec 64))

(assert (=> b!345068 (= lt!162621 (select (arr!8706 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!162620 () Unit!10706)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18379 (_ BitVec 64) (_ BitVec 32)) Unit!10706)

(assert (=> b!345068 (= lt!162620 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!162621 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!18379 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!345068 (arrayContainsKey!0 _keys!1895 lt!162621 #b00000000000000000000000000000000)))

(declare-fun lt!162619 () Unit!10706)

(assert (=> b!345068 (= lt!162619 lt!162620)))

(declare-fun res!190925 () Bool)

(assert (=> b!345068 (= res!190925 (= (seekEntryOrOpen!0 (select (arr!8706 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3353 #b00000000000000000000000000000000)))))

(assert (=> b!345068 (=> (not res!190925) (not e!211483))))

(declare-fun b!345069 () Bool)

(assert (=> b!345069 (= e!211481 e!211482)))

(declare-fun c!52919 () Bool)

(assert (=> b!345069 (= c!52919 (validKeyInArray!0 (select (arr!8706 _keys!1895) #b00000000000000000000000000000000)))))

(assert (= (and d!70923 (not res!190924)) b!345069))

(assert (= (and b!345069 c!52919) b!345068))

(assert (= (and b!345069 (not c!52919)) b!345067))

(assert (= (and b!345068 res!190925) b!345066))

(assert (= (or b!345066 b!345067) bm!26672))

(declare-fun m!346017 () Bool)

(assert (=> bm!26672 m!346017))

(assert (=> b!345068 m!345947))

(declare-fun m!346019 () Bool)

(assert (=> b!345068 m!346019))

(declare-fun m!346021 () Bool)

(assert (=> b!345068 m!346021))

(assert (=> b!345068 m!345947))

(declare-fun m!346023 () Bool)

(assert (=> b!345068 m!346023))

(assert (=> b!345069 m!345947))

(assert (=> b!345069 m!345947))

(assert (=> b!345069 m!345951))

(assert (=> b!344892 d!70923))

(declare-fun d!70925 () Bool)

(assert (=> d!70925 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!34516 d!70925))

(declare-fun d!70927 () Bool)

(assert (=> d!70927 (= (array_inv!6474 _values!1525) (bvsge (size!9060 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!34516 d!70927))

(declare-fun d!70929 () Bool)

(assert (=> d!70929 (= (array_inv!6475 _keys!1895) (bvsge (size!9059 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!34516 d!70929))

(declare-fun condMapEmpty!12555 () Bool)

(declare-fun mapDefault!12555 () ValueCell!3359)

(assert (=> mapNonEmpty!12546 (= condMapEmpty!12555 (= mapRest!12546 ((as const (Array (_ BitVec 32) ValueCell!3359)) mapDefault!12555)))))

(declare-fun e!211488 () Bool)

(declare-fun mapRes!12555 () Bool)

(assert (=> mapNonEmpty!12546 (= tp!25904 (and e!211488 mapRes!12555))))

(declare-fun b!345076 () Bool)

(declare-fun e!211489 () Bool)

(assert (=> b!345076 (= e!211489 tp_is_empty!7405)))

(declare-fun mapIsEmpty!12555 () Bool)

(assert (=> mapIsEmpty!12555 mapRes!12555))

(declare-fun mapNonEmpty!12555 () Bool)

(declare-fun tp!25920 () Bool)

(assert (=> mapNonEmpty!12555 (= mapRes!12555 (and tp!25920 e!211489))))

(declare-fun mapRest!12555 () (Array (_ BitVec 32) ValueCell!3359))

(declare-fun mapValue!12555 () ValueCell!3359)

(declare-fun mapKey!12555 () (_ BitVec 32))

(assert (=> mapNonEmpty!12555 (= mapRest!12546 (store mapRest!12555 mapKey!12555 mapValue!12555))))

(declare-fun b!345077 () Bool)

(assert (=> b!345077 (= e!211488 tp_is_empty!7405)))

(assert (= (and mapNonEmpty!12546 condMapEmpty!12555) mapIsEmpty!12555))

(assert (= (and mapNonEmpty!12546 (not condMapEmpty!12555)) mapNonEmpty!12555))

(assert (= (and mapNonEmpty!12555 ((_ is ValueCellFull!3359) mapValue!12555)) b!345076))

(assert (= (and mapNonEmpty!12546 ((_ is ValueCellFull!3359) mapDefault!12555)) b!345077))

(declare-fun m!346025 () Bool)

(assert (=> mapNonEmpty!12555 m!346025))

(declare-fun b_lambda!8443 () Bool)

(assert (= b_lambda!8441 (or (and start!34516 b_free!7453) b_lambda!8443)))

(check-sat (not b!345048) (not b!345069) (not bm!26669) (not b!344990) (not b!345051) (not bm!26664) (not b!345037) (not d!70919) (not b!345044) (not bm!26667) (not b!345040) (not bm!26666) (not bm!26648) (not b!345068) (not b!344979) (not d!70913) (not d!70917) (not b!344983) (not b!345046) (not mapNonEmpty!12555) (not bm!26672) b_and!14641 (not b_lambda!8443) (not b!344964) (not b!344992) (not b_next!7453) (not b!345039) (not b!345043) tp_is_empty!7405 (not b!344980))
(check-sat b_and!14641 (not b_next!7453))
