; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84874 () Bool)

(assert start!84874)

(declare-fun b!991792 () Bool)

(declare-fun e!559432 () Bool)

(declare-fun e!559430 () Bool)

(assert (=> b!991792 (= e!559432 e!559430)))

(declare-fun res!662955 () Bool)

(assert (=> b!991792 (=> (not res!662955) (not e!559430))))

(declare-datatypes ((SeekEntryResult!9213 0))(
  ( (MissingZero!9213 (index!39223 (_ BitVec 32))) (Found!9213 (index!39224 (_ BitVec 32))) (Intermediate!9213 (undefined!10025 Bool) (index!39225 (_ BitVec 32)) (x!86321 (_ BitVec 32))) (Undefined!9213) (MissingVacant!9213 (index!39226 (_ BitVec 32))) )
))
(declare-fun lt!439808 () SeekEntryResult!9213)

(get-info :version)

(assert (=> b!991792 (= res!662955 ((_ is Found!9213) lt!439808))))

(declare-fun k0!1425 () (_ BitVec 64))

(declare-fun mask!2471 () (_ BitVec 32))

(declare-datatypes ((array!62646 0))(
  ( (array!62647 (arr!30168 (Array (_ BitVec 32) (_ BitVec 64))) (size!30649 (_ BitVec 32))) )
))
(declare-fun _keys!1945 () array!62646)

(declare-fun seekEntry!0 ((_ BitVec 64) array!62646 (_ BitVec 32)) SeekEntryResult!9213)

(assert (=> b!991792 (= lt!439808 (seekEntry!0 k0!1425 _keys!1945 mask!2471))))

(declare-fun mapIsEmpty!37128 () Bool)

(declare-fun mapRes!37128 () Bool)

(assert (=> mapIsEmpty!37128 mapRes!37128))

(declare-fun mapNonEmpty!37128 () Bool)

(declare-fun tp!70200 () Bool)

(declare-fun e!559428 () Bool)

(assert (=> mapNonEmpty!37128 (= mapRes!37128 (and tp!70200 e!559428))))

(declare-datatypes ((V!36145 0))(
  ( (V!36146 (val!11736 Int)) )
))
(declare-datatypes ((ValueCell!11204 0))(
  ( (ValueCellFull!11204 (v!14312 V!36145)) (EmptyCell!11204) )
))
(declare-fun mapRest!37128 () (Array (_ BitVec 32) ValueCell!11204))

(declare-fun mapValue!37128 () ValueCell!11204)

(declare-datatypes ((array!62648 0))(
  ( (array!62649 (arr!30169 (Array (_ BitVec 32) ValueCell!11204)) (size!30650 (_ BitVec 32))) )
))
(declare-fun _values!1551 () array!62648)

(declare-fun mapKey!37128 () (_ BitVec 32))

(assert (=> mapNonEmpty!37128 (= (arr!30169 _values!1551) (store mapRest!37128 mapKey!37128 mapValue!37128))))

(declare-fun b!991793 () Bool)

(declare-fun res!662952 () Bool)

(assert (=> b!991793 (=> (not res!662952) (not e!559432))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62646 (_ BitVec 32)) Bool)

(assert (=> b!991793 (= res!662952 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1945 mask!2471))))

(declare-fun res!662951 () Bool)

(assert (=> start!84874 (=> (not res!662951) (not e!559432))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84874 (= res!662951 (validMask!0 mask!2471))))

(assert (=> start!84874 e!559432))

(assert (=> start!84874 true))

(declare-fun e!559429 () Bool)

(declare-fun array_inv!23313 (array!62648) Bool)

(assert (=> start!84874 (and (array_inv!23313 _values!1551) e!559429)))

(declare-fun array_inv!23314 (array!62646) Bool)

(assert (=> start!84874 (array_inv!23314 _keys!1945)))

(declare-fun b!991794 () Bool)

(declare-fun res!662953 () Bool)

(assert (=> b!991794 (=> (not res!662953) (not e!559432))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!991794 (= res!662953 (validKeyInArray!0 k0!1425))))

(declare-fun b!991795 () Bool)

(declare-fun res!662956 () Bool)

(assert (=> b!991795 (=> (not res!662956) (not e!559432))))

(declare-datatypes ((List!20904 0))(
  ( (Nil!20901) (Cons!20900 (h!22062 (_ BitVec 64)) (t!29878 List!20904)) )
))
(declare-fun arrayNoDuplicates!0 (array!62646 (_ BitVec 32) List!20904) Bool)

(assert (=> b!991795 (= res!662956 (arrayNoDuplicates!0 _keys!1945 #b00000000000000000000000000000000 Nil!20901))))

(declare-fun b!991796 () Bool)

(declare-fun res!662954 () Bool)

(assert (=> b!991796 (=> (not res!662954) (not e!559432))))

(declare-fun extraKeys!1472 () (_ BitVec 32))

(assert (=> b!991796 (= res!662954 (and (= (size!30650 _values!1551) (bvadd #b00000000000000000000000000000001 mask!2471)) (= (size!30649 _keys!1945) (size!30650 _values!1551)) (bvsge mask!2471 #b00000000000000000000000000000000) (bvsge extraKeys!1472 #b00000000000000000000000000000000) (bvsle extraKeys!1472 #b00000000000000000000000000000011)))))

(declare-fun b!991797 () Bool)

(declare-fun tp_is_empty!23371 () Bool)

(assert (=> b!991797 (= e!559428 tp_is_empty!23371)))

(declare-fun b!991798 () Bool)

(declare-fun e!559431 () Bool)

(assert (=> b!991798 (= e!559429 (and e!559431 mapRes!37128))))

(declare-fun condMapEmpty!37128 () Bool)

(declare-fun mapDefault!37128 () ValueCell!11204)

(assert (=> b!991798 (= condMapEmpty!37128 (= (arr!30169 _values!1551) ((as const (Array (_ BitVec 32) ValueCell!11204)) mapDefault!37128)))))

(declare-fun b!991799 () Bool)

(assert (=> b!991799 (= e!559431 tp_is_empty!23371)))

(declare-fun b!991800 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!991800 (= e!559430 (not (inRange!0 (index!39224 lt!439808) mask!2471)))))

(assert (= (and start!84874 res!662951) b!991796))

(assert (= (and b!991796 res!662954) b!991793))

(assert (= (and b!991793 res!662952) b!991795))

(assert (= (and b!991795 res!662956) b!991794))

(assert (= (and b!991794 res!662953) b!991792))

(assert (= (and b!991792 res!662955) b!991800))

(assert (= (and b!991798 condMapEmpty!37128) mapIsEmpty!37128))

(assert (= (and b!991798 (not condMapEmpty!37128)) mapNonEmpty!37128))

(assert (= (and mapNonEmpty!37128 ((_ is ValueCellFull!11204) mapValue!37128)) b!991797))

(assert (= (and b!991798 ((_ is ValueCellFull!11204) mapDefault!37128)) b!991799))

(assert (= start!84874 b!991798))

(declare-fun m!918997 () Bool)

(assert (=> mapNonEmpty!37128 m!918997))

(declare-fun m!918999 () Bool)

(assert (=> b!991792 m!918999))

(declare-fun m!919001 () Bool)

(assert (=> b!991793 m!919001))

(declare-fun m!919003 () Bool)

(assert (=> start!84874 m!919003))

(declare-fun m!919005 () Bool)

(assert (=> start!84874 m!919005))

(declare-fun m!919007 () Bool)

(assert (=> start!84874 m!919007))

(declare-fun m!919009 () Bool)

(assert (=> b!991795 m!919009))

(declare-fun m!919011 () Bool)

(assert (=> b!991800 m!919011))

(declare-fun m!919013 () Bool)

(assert (=> b!991794 m!919013))

(check-sat (not b!991800) (not b!991793) tp_is_empty!23371 (not b!991792) (not mapNonEmpty!37128) (not b!991795) (not start!84874) (not b!991794))
(check-sat)
(get-model)

(declare-fun d!117803 () Bool)

(assert (=> d!117803 (= (inRange!0 (index!39224 lt!439808) mask!2471) (and (bvsge (index!39224 lt!439808) #b00000000000000000000000000000000) (bvslt (index!39224 lt!439808) (bvadd mask!2471 #b00000000000000000000000000000001))))))

(assert (=> b!991800 d!117803))

(declare-fun b!991865 () Bool)

(declare-fun e!559479 () Bool)

(declare-fun e!559481 () Bool)

(assert (=> b!991865 (= e!559479 e!559481)))

(declare-fun res!663000 () Bool)

(assert (=> b!991865 (=> (not res!663000) (not e!559481))))

(declare-fun e!559480 () Bool)

(assert (=> b!991865 (= res!663000 (not e!559480))))

(declare-fun res!662999 () Bool)

(assert (=> b!991865 (=> (not res!662999) (not e!559480))))

(assert (=> b!991865 (= res!662999 (validKeyInArray!0 (select (arr!30168 _keys!1945) #b00000000000000000000000000000000)))))

(declare-fun bm!42059 () Bool)

(declare-fun call!42062 () Bool)

(declare-fun c!100574 () Bool)

(assert (=> bm!42059 (= call!42062 (arrayNoDuplicates!0 _keys!1945 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!100574 (Cons!20900 (select (arr!30168 _keys!1945) #b00000000000000000000000000000000) Nil!20901) Nil!20901)))))

(declare-fun b!991866 () Bool)

(declare-fun e!559478 () Bool)

(assert (=> b!991866 (= e!559478 call!42062)))

(declare-fun b!991867 () Bool)

(assert (=> b!991867 (= e!559478 call!42062)))

(declare-fun d!117805 () Bool)

(declare-fun res!663001 () Bool)

(assert (=> d!117805 (=> res!663001 e!559479)))

(assert (=> d!117805 (= res!663001 (bvsge #b00000000000000000000000000000000 (size!30649 _keys!1945)))))

(assert (=> d!117805 (= (arrayNoDuplicates!0 _keys!1945 #b00000000000000000000000000000000 Nil!20901) e!559479)))

(declare-fun b!991868 () Bool)

(declare-fun contains!5705 (List!20904 (_ BitVec 64)) Bool)

(assert (=> b!991868 (= e!559480 (contains!5705 Nil!20901 (select (arr!30168 _keys!1945) #b00000000000000000000000000000000)))))

(declare-fun b!991869 () Bool)

(assert (=> b!991869 (= e!559481 e!559478)))

(assert (=> b!991869 (= c!100574 (validKeyInArray!0 (select (arr!30168 _keys!1945) #b00000000000000000000000000000000)))))

(assert (= (and d!117805 (not res!663001)) b!991865))

(assert (= (and b!991865 res!662999) b!991868))

(assert (= (and b!991865 res!663000) b!991869))

(assert (= (and b!991869 c!100574) b!991867))

(assert (= (and b!991869 (not c!100574)) b!991866))

(assert (= (or b!991867 b!991866) bm!42059))

(declare-fun m!919051 () Bool)

(assert (=> b!991865 m!919051))

(assert (=> b!991865 m!919051))

(declare-fun m!919053 () Bool)

(assert (=> b!991865 m!919053))

(assert (=> bm!42059 m!919051))

(declare-fun m!919055 () Bool)

(assert (=> bm!42059 m!919055))

(assert (=> b!991868 m!919051))

(assert (=> b!991868 m!919051))

(declare-fun m!919057 () Bool)

(assert (=> b!991868 m!919057))

(assert (=> b!991869 m!919051))

(assert (=> b!991869 m!919051))

(assert (=> b!991869 m!919053))

(assert (=> b!991795 d!117805))

(declare-fun b!991882 () Bool)

(declare-fun e!559488 () SeekEntryResult!9213)

(declare-fun lt!439823 () SeekEntryResult!9213)

(assert (=> b!991882 (= e!559488 (ite ((_ is MissingVacant!9213) lt!439823) (MissingZero!9213 (index!39226 lt!439823)) lt!439823))))

(declare-fun lt!439825 () SeekEntryResult!9213)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!62646 (_ BitVec 32)) SeekEntryResult!9213)

(assert (=> b!991882 (= lt!439823 (seekKeyOrZeroReturnVacant!0 (x!86321 lt!439825) (index!39225 lt!439825) (index!39225 lt!439825) k0!1425 _keys!1945 mask!2471))))

(declare-fun d!117807 () Bool)

(declare-fun lt!439826 () SeekEntryResult!9213)

(assert (=> d!117807 (and (or ((_ is MissingVacant!9213) lt!439826) (not ((_ is Found!9213) lt!439826)) (and (bvsge (index!39224 lt!439826) #b00000000000000000000000000000000) (bvslt (index!39224 lt!439826) (size!30649 _keys!1945)))) (not ((_ is MissingVacant!9213) lt!439826)) (or (not ((_ is Found!9213) lt!439826)) (= (select (arr!30168 _keys!1945) (index!39224 lt!439826)) k0!1425)))))

(declare-fun e!559490 () SeekEntryResult!9213)

(assert (=> d!117807 (= lt!439826 e!559490)))

(declare-fun c!100582 () Bool)

(assert (=> d!117807 (= c!100582 (and ((_ is Intermediate!9213) lt!439825) (undefined!10025 lt!439825)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!62646 (_ BitVec 32)) SeekEntryResult!9213)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!117807 (= lt!439825 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1425 mask!2471) k0!1425 _keys!1945 mask!2471))))

(assert (=> d!117807 (validMask!0 mask!2471)))

(assert (=> d!117807 (= (seekEntry!0 k0!1425 _keys!1945 mask!2471) lt!439826)))

(declare-fun b!991883 () Bool)

(declare-fun c!100583 () Bool)

(declare-fun lt!439824 () (_ BitVec 64))

(assert (=> b!991883 (= c!100583 (= lt!439824 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!559489 () SeekEntryResult!9213)

(assert (=> b!991883 (= e!559489 e!559488)))

(declare-fun b!991884 () Bool)

(assert (=> b!991884 (= e!559489 (Found!9213 (index!39225 lt!439825)))))

(declare-fun b!991885 () Bool)

(assert (=> b!991885 (= e!559490 e!559489)))

(assert (=> b!991885 (= lt!439824 (select (arr!30168 _keys!1945) (index!39225 lt!439825)))))

(declare-fun c!100581 () Bool)

(assert (=> b!991885 (= c!100581 (= lt!439824 k0!1425))))

(declare-fun b!991886 () Bool)

(assert (=> b!991886 (= e!559490 Undefined!9213)))

(declare-fun b!991887 () Bool)

(assert (=> b!991887 (= e!559488 (MissingZero!9213 (index!39225 lt!439825)))))

(assert (= (and d!117807 c!100582) b!991886))

(assert (= (and d!117807 (not c!100582)) b!991885))

(assert (= (and b!991885 c!100581) b!991884))

(assert (= (and b!991885 (not c!100581)) b!991883))

(assert (= (and b!991883 c!100583) b!991887))

(assert (= (and b!991883 (not c!100583)) b!991882))

(declare-fun m!919059 () Bool)

(assert (=> b!991882 m!919059))

(declare-fun m!919061 () Bool)

(assert (=> d!117807 m!919061))

(declare-fun m!919063 () Bool)

(assert (=> d!117807 m!919063))

(assert (=> d!117807 m!919063))

(declare-fun m!919065 () Bool)

(assert (=> d!117807 m!919065))

(assert (=> d!117807 m!919003))

(declare-fun m!919067 () Bool)

(assert (=> b!991885 m!919067))

(assert (=> b!991792 d!117807))

(declare-fun d!117809 () Bool)

(assert (=> d!117809 (= (validMask!0 mask!2471) (and (or (= mask!2471 #b00000000000000000000000000000111) (= mask!2471 #b00000000000000000000000000001111) (= mask!2471 #b00000000000000000000000000011111) (= mask!2471 #b00000000000000000000000000111111) (= mask!2471 #b00000000000000000000000001111111) (= mask!2471 #b00000000000000000000000011111111) (= mask!2471 #b00000000000000000000000111111111) (= mask!2471 #b00000000000000000000001111111111) (= mask!2471 #b00000000000000000000011111111111) (= mask!2471 #b00000000000000000000111111111111) (= mask!2471 #b00000000000000000001111111111111) (= mask!2471 #b00000000000000000011111111111111) (= mask!2471 #b00000000000000000111111111111111) (= mask!2471 #b00000000000000001111111111111111) (= mask!2471 #b00000000000000011111111111111111) (= mask!2471 #b00000000000000111111111111111111) (= mask!2471 #b00000000000001111111111111111111) (= mask!2471 #b00000000000011111111111111111111) (= mask!2471 #b00000000000111111111111111111111) (= mask!2471 #b00000000001111111111111111111111) (= mask!2471 #b00000000011111111111111111111111) (= mask!2471 #b00000000111111111111111111111111) (= mask!2471 #b00000001111111111111111111111111) (= mask!2471 #b00000011111111111111111111111111) (= mask!2471 #b00000111111111111111111111111111) (= mask!2471 #b00001111111111111111111111111111) (= mask!2471 #b00011111111111111111111111111111) (= mask!2471 #b00111111111111111111111111111111)) (bvsle mask!2471 #b00111111111111111111111111111111)))))

(assert (=> start!84874 d!117809))

(declare-fun d!117811 () Bool)

(assert (=> d!117811 (= (array_inv!23313 _values!1551) (bvsge (size!30650 _values!1551) #b00000000000000000000000000000000))))

(assert (=> start!84874 d!117811))

(declare-fun d!117813 () Bool)

(assert (=> d!117813 (= (array_inv!23314 _keys!1945) (bvsge (size!30649 _keys!1945) #b00000000000000000000000000000000))))

(assert (=> start!84874 d!117813))

(declare-fun b!991896 () Bool)

(declare-fun e!559498 () Bool)

(declare-fun e!559497 () Bool)

(assert (=> b!991896 (= e!559498 e!559497)))

(declare-fun c!100586 () Bool)

(assert (=> b!991896 (= c!100586 (validKeyInArray!0 (select (arr!30168 _keys!1945) #b00000000000000000000000000000000)))))

(declare-fun b!991897 () Bool)

(declare-fun e!559499 () Bool)

(declare-fun call!42065 () Bool)

(assert (=> b!991897 (= e!559499 call!42065)))

(declare-fun bm!42062 () Bool)

(assert (=> bm!42062 (= call!42065 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1945 mask!2471))))

(declare-fun b!991898 () Bool)

(assert (=> b!991898 (= e!559497 e!559499)))

(declare-fun lt!439835 () (_ BitVec 64))

(assert (=> b!991898 (= lt!439835 (select (arr!30168 _keys!1945) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32775 0))(
  ( (Unit!32776) )
))
(declare-fun lt!439834 () Unit!32775)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!62646 (_ BitVec 64) (_ BitVec 32)) Unit!32775)

(assert (=> b!991898 (= lt!439834 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1945 lt!439835 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!62646 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!991898 (arrayContainsKey!0 _keys!1945 lt!439835 #b00000000000000000000000000000000)))

(declare-fun lt!439833 () Unit!32775)

(assert (=> b!991898 (= lt!439833 lt!439834)))

(declare-fun res!663007 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62646 (_ BitVec 32)) SeekEntryResult!9213)

(assert (=> b!991898 (= res!663007 (= (seekEntryOrOpen!0 (select (arr!30168 _keys!1945) #b00000000000000000000000000000000) _keys!1945 mask!2471) (Found!9213 #b00000000000000000000000000000000)))))

(assert (=> b!991898 (=> (not res!663007) (not e!559499))))

(declare-fun b!991899 () Bool)

(assert (=> b!991899 (= e!559497 call!42065)))

(declare-fun d!117815 () Bool)

(declare-fun res!663006 () Bool)

(assert (=> d!117815 (=> res!663006 e!559498)))

(assert (=> d!117815 (= res!663006 (bvsge #b00000000000000000000000000000000 (size!30649 _keys!1945)))))

(assert (=> d!117815 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1945 mask!2471) e!559498)))

(assert (= (and d!117815 (not res!663006)) b!991896))

(assert (= (and b!991896 c!100586) b!991898))

(assert (= (and b!991896 (not c!100586)) b!991899))

(assert (= (and b!991898 res!663007) b!991897))

(assert (= (or b!991897 b!991899) bm!42062))

(assert (=> b!991896 m!919051))

(assert (=> b!991896 m!919051))

(assert (=> b!991896 m!919053))

(declare-fun m!919069 () Bool)

(assert (=> bm!42062 m!919069))

(assert (=> b!991898 m!919051))

(declare-fun m!919071 () Bool)

(assert (=> b!991898 m!919071))

(declare-fun m!919073 () Bool)

(assert (=> b!991898 m!919073))

(assert (=> b!991898 m!919051))

(declare-fun m!919075 () Bool)

(assert (=> b!991898 m!919075))

(assert (=> b!991793 d!117815))

(declare-fun d!117817 () Bool)

(assert (=> d!117817 (= (validKeyInArray!0 k0!1425) (and (not (= k0!1425 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1425 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!991794 d!117817))

(declare-fun mapIsEmpty!37137 () Bool)

(declare-fun mapRes!37137 () Bool)

(assert (=> mapIsEmpty!37137 mapRes!37137))

(declare-fun mapNonEmpty!37137 () Bool)

(declare-fun tp!70209 () Bool)

(declare-fun e!559505 () Bool)

(assert (=> mapNonEmpty!37137 (= mapRes!37137 (and tp!70209 e!559505))))

(declare-fun mapValue!37137 () ValueCell!11204)

(declare-fun mapRest!37137 () (Array (_ BitVec 32) ValueCell!11204))

(declare-fun mapKey!37137 () (_ BitVec 32))

(assert (=> mapNonEmpty!37137 (= mapRest!37128 (store mapRest!37137 mapKey!37137 mapValue!37137))))

(declare-fun condMapEmpty!37137 () Bool)

(declare-fun mapDefault!37137 () ValueCell!11204)

(assert (=> mapNonEmpty!37128 (= condMapEmpty!37137 (= mapRest!37128 ((as const (Array (_ BitVec 32) ValueCell!11204)) mapDefault!37137)))))

(declare-fun e!559504 () Bool)

(assert (=> mapNonEmpty!37128 (= tp!70200 (and e!559504 mapRes!37137))))

(declare-fun b!991907 () Bool)

(assert (=> b!991907 (= e!559504 tp_is_empty!23371)))

(declare-fun b!991906 () Bool)

(assert (=> b!991906 (= e!559505 tp_is_empty!23371)))

(assert (= (and mapNonEmpty!37128 condMapEmpty!37137) mapIsEmpty!37137))

(assert (= (and mapNonEmpty!37128 (not condMapEmpty!37137)) mapNonEmpty!37137))

(assert (= (and mapNonEmpty!37137 ((_ is ValueCellFull!11204) mapValue!37137)) b!991906))

(assert (= (and mapNonEmpty!37128 ((_ is ValueCellFull!11204) mapDefault!37137)) b!991907))

(declare-fun m!919077 () Bool)

(assert (=> mapNonEmpty!37137 m!919077))

(check-sat (not bm!42059) (not bm!42062) (not mapNonEmpty!37137) (not b!991882) (not b!991868) (not b!991898) (not d!117807) tp_is_empty!23371 (not b!991869) (not b!991896) (not b!991865))
(check-sat)
