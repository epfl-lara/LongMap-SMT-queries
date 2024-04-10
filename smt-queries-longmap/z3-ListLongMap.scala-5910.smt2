; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76514 () Bool)

(assert start!76514)

(declare-fun b!896779 () Bool)

(declare-fun b_free!15963 () Bool)

(declare-fun b_next!15963 () Bool)

(assert (=> b!896779 (= b_free!15963 (not b_next!15963))))

(declare-fun tp!55927 () Bool)

(declare-fun b_and!26255 () Bool)

(assert (=> b!896779 (= tp!55927 b_and!26255)))

(declare-fun b!896774 () Bool)

(declare-fun e!501333 () Bool)

(declare-fun e!501328 () Bool)

(assert (=> b!896774 (= e!501333 e!501328)))

(declare-fun res!606309 () Bool)

(assert (=> b!896774 (=> res!606309 e!501328)))

(declare-datatypes ((array!52602 0))(
  ( (array!52603 (arr!25287 (Array (_ BitVec 32) (_ BitVec 64))) (size!25739 (_ BitVec 32))) )
))
(declare-datatypes ((V!29353 0))(
  ( (V!29354 (val!9196 Int)) )
))
(declare-datatypes ((ValueCell!8664 0))(
  ( (ValueCellFull!8664 (v!11686 V!29353)) (EmptyCell!8664) )
))
(declare-datatypes ((array!52604 0))(
  ( (array!52605 (arr!25288 (Array (_ BitVec 32) ValueCell!8664)) (size!25740 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4344 0))(
  ( (LongMapFixedSize!4345 (defaultEntry!5384 Int) (mask!26041 (_ BitVec 32)) (extraKeys!5088 (_ BitVec 32)) (zeroValue!5192 V!29353) (minValue!5192 V!29353) (_size!2227 (_ BitVec 32)) (_keys!10125 array!52602) (_values!5379 array!52604) (_vacant!2227 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4344)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!896774 (= res!606309 (not (validMask!0 (mask!26041 thiss!1181))))))

(declare-fun key!785 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!52602 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!896774 (arrayContainsKey!0 (_keys!10125 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-datatypes ((SeekEntryResult!8902 0))(
  ( (MissingZero!8902 (index!37979 (_ BitVec 32))) (Found!8902 (index!37980 (_ BitVec 32))) (Intermediate!8902 (undefined!9714 Bool) (index!37981 (_ BitVec 32)) (x!76376 (_ BitVec 32))) (Undefined!8902) (MissingVacant!8902 (index!37982 (_ BitVec 32))) )
))
(declare-fun lt!404944 () SeekEntryResult!8902)

(declare-datatypes ((Unit!30494 0))(
  ( (Unit!30495) )
))
(declare-fun lt!404943 () Unit!30494)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52602 (_ BitVec 64) (_ BitVec 32)) Unit!30494)

(assert (=> b!896774 (= lt!404943 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10125 thiss!1181) key!785 (index!37980 lt!404944)))))

(declare-fun mapIsEmpty!29061 () Bool)

(declare-fun mapRes!29061 () Bool)

(assert (=> mapIsEmpty!29061 mapRes!29061))

(declare-fun mapNonEmpty!29061 () Bool)

(declare-fun tp!55928 () Bool)

(declare-fun e!501335 () Bool)

(assert (=> mapNonEmpty!29061 (= mapRes!29061 (and tp!55928 e!501335))))

(declare-fun mapRest!29061 () (Array (_ BitVec 32) ValueCell!8664))

(declare-fun mapValue!29061 () ValueCell!8664)

(declare-fun mapKey!29061 () (_ BitVec 32))

(assert (=> mapNonEmpty!29061 (= (arr!25288 (_values!5379 thiss!1181)) (store mapRest!29061 mapKey!29061 mapValue!29061))))

(declare-fun b!896776 () Bool)

(declare-fun e!501331 () Bool)

(declare-fun e!501330 () Bool)

(assert (=> b!896776 (= e!501331 (and e!501330 mapRes!29061))))

(declare-fun condMapEmpty!29061 () Bool)

(declare-fun mapDefault!29061 () ValueCell!8664)

(assert (=> b!896776 (= condMapEmpty!29061 (= (arr!25288 (_values!5379 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8664)) mapDefault!29061)))))

(declare-fun b!896777 () Bool)

(declare-fun e!501334 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!896777 (= e!501334 (inRange!0 (index!37980 lt!404944) (mask!26041 thiss!1181)))))

(declare-fun b!896778 () Bool)

(assert (=> b!896778 (= e!501328 (or (not (= (size!25740 (_values!5379 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!26041 thiss!1181)))) (= (size!25739 (_keys!10125 thiss!1181)) (size!25740 (_values!5379 thiss!1181)))))))

(declare-fun b!896775 () Bool)

(declare-fun tp_is_empty!18291 () Bool)

(assert (=> b!896775 (= e!501335 tp_is_empty!18291)))

(declare-fun res!606306 () Bool)

(declare-fun e!501329 () Bool)

(assert (=> start!76514 (=> (not res!606306) (not e!501329))))

(declare-fun valid!1676 (LongMapFixedSize!4344) Bool)

(assert (=> start!76514 (= res!606306 (valid!1676 thiss!1181))))

(assert (=> start!76514 e!501329))

(declare-fun e!501327 () Bool)

(assert (=> start!76514 e!501327))

(assert (=> start!76514 true))

(declare-fun array_inv!19848 (array!52602) Bool)

(declare-fun array_inv!19849 (array!52604) Bool)

(assert (=> b!896779 (= e!501327 (and tp!55927 tp_is_empty!18291 (array_inv!19848 (_keys!10125 thiss!1181)) (array_inv!19849 (_values!5379 thiss!1181)) e!501331))))

(declare-fun b!896780 () Bool)

(assert (=> b!896780 (= e!501330 tp_is_empty!18291)))

(declare-fun b!896781 () Bool)

(declare-fun res!606305 () Bool)

(assert (=> b!896781 (=> (not res!606305) (not e!501329))))

(assert (=> b!896781 (= res!606305 (not (= key!785 (bvneg key!785))))))

(declare-fun b!896782 () Bool)

(assert (=> b!896782 (= e!501329 (not e!501333))))

(declare-fun res!606307 () Bool)

(assert (=> b!896782 (=> res!606307 e!501333)))

(get-info :version)

(assert (=> b!896782 (= res!606307 (not ((_ is Found!8902) lt!404944)))))

(assert (=> b!896782 e!501334))

(declare-fun res!606308 () Bool)

(assert (=> b!896782 (=> res!606308 e!501334)))

(assert (=> b!896782 (= res!606308 (not ((_ is Found!8902) lt!404944)))))

(declare-fun lt!404942 () Unit!30494)

(declare-fun lemmaSeekEntryGivesInRangeIndex!73 (array!52602 array!52604 (_ BitVec 32) (_ BitVec 32) V!29353 V!29353 (_ BitVec 64)) Unit!30494)

(assert (=> b!896782 (= lt!404942 (lemmaSeekEntryGivesInRangeIndex!73 (_keys!10125 thiss!1181) (_values!5379 thiss!1181) (mask!26041 thiss!1181) (extraKeys!5088 thiss!1181) (zeroValue!5192 thiss!1181) (minValue!5192 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52602 (_ BitVec 32)) SeekEntryResult!8902)

(assert (=> b!896782 (= lt!404944 (seekEntry!0 key!785 (_keys!10125 thiss!1181) (mask!26041 thiss!1181)))))

(assert (= (and start!76514 res!606306) b!896781))

(assert (= (and b!896781 res!606305) b!896782))

(assert (= (and b!896782 (not res!606308)) b!896777))

(assert (= (and b!896782 (not res!606307)) b!896774))

(assert (= (and b!896774 (not res!606309)) b!896778))

(assert (= (and b!896776 condMapEmpty!29061) mapIsEmpty!29061))

(assert (= (and b!896776 (not condMapEmpty!29061)) mapNonEmpty!29061))

(assert (= (and mapNonEmpty!29061 ((_ is ValueCellFull!8664) mapValue!29061)) b!896775))

(assert (= (and b!896776 ((_ is ValueCellFull!8664) mapDefault!29061)) b!896780))

(assert (= b!896779 b!896776))

(assert (= start!76514 b!896779))

(declare-fun m!833831 () Bool)

(assert (=> mapNonEmpty!29061 m!833831))

(declare-fun m!833833 () Bool)

(assert (=> b!896782 m!833833))

(declare-fun m!833835 () Bool)

(assert (=> b!896782 m!833835))

(declare-fun m!833837 () Bool)

(assert (=> b!896777 m!833837))

(declare-fun m!833839 () Bool)

(assert (=> b!896779 m!833839))

(declare-fun m!833841 () Bool)

(assert (=> b!896779 m!833841))

(declare-fun m!833843 () Bool)

(assert (=> start!76514 m!833843))

(declare-fun m!833845 () Bool)

(assert (=> b!896774 m!833845))

(declare-fun m!833847 () Bool)

(assert (=> b!896774 m!833847))

(declare-fun m!833849 () Bool)

(assert (=> b!896774 m!833849))

(check-sat b_and!26255 (not mapNonEmpty!29061) (not b_next!15963) (not b!896779) tp_is_empty!18291 (not b!896774) (not b!896782) (not start!76514) (not b!896777))
(check-sat b_and!26255 (not b_next!15963))
(get-model)

(declare-fun d!110971 () Bool)

(declare-fun res!606331 () Bool)

(declare-fun e!501365 () Bool)

(assert (=> d!110971 (=> (not res!606331) (not e!501365))))

(declare-fun simpleValid!315 (LongMapFixedSize!4344) Bool)

(assert (=> d!110971 (= res!606331 (simpleValid!315 thiss!1181))))

(assert (=> d!110971 (= (valid!1676 thiss!1181) e!501365)))

(declare-fun b!896816 () Bool)

(declare-fun res!606332 () Bool)

(assert (=> b!896816 (=> (not res!606332) (not e!501365))))

(declare-fun arrayCountValidKeys!0 (array!52602 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!896816 (= res!606332 (= (arrayCountValidKeys!0 (_keys!10125 thiss!1181) #b00000000000000000000000000000000 (size!25739 (_keys!10125 thiss!1181))) (_size!2227 thiss!1181)))))

(declare-fun b!896817 () Bool)

(declare-fun res!606333 () Bool)

(assert (=> b!896817 (=> (not res!606333) (not e!501365))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52602 (_ BitVec 32)) Bool)

(assert (=> b!896817 (= res!606333 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10125 thiss!1181) (mask!26041 thiss!1181)))))

(declare-fun b!896818 () Bool)

(declare-datatypes ((List!17825 0))(
  ( (Nil!17822) (Cons!17821 (h!18960 (_ BitVec 64)) (t!25164 List!17825)) )
))
(declare-fun arrayNoDuplicates!0 (array!52602 (_ BitVec 32) List!17825) Bool)

(assert (=> b!896818 (= e!501365 (arrayNoDuplicates!0 (_keys!10125 thiss!1181) #b00000000000000000000000000000000 Nil!17822))))

(assert (= (and d!110971 res!606331) b!896816))

(assert (= (and b!896816 res!606332) b!896817))

(assert (= (and b!896817 res!606333) b!896818))

(declare-fun m!833871 () Bool)

(assert (=> d!110971 m!833871))

(declare-fun m!833873 () Bool)

(assert (=> b!896816 m!833873))

(declare-fun m!833875 () Bool)

(assert (=> b!896817 m!833875))

(declare-fun m!833877 () Bool)

(assert (=> b!896818 m!833877))

(assert (=> start!76514 d!110971))

(declare-fun d!110973 () Bool)

(assert (=> d!110973 (= (array_inv!19848 (_keys!10125 thiss!1181)) (bvsge (size!25739 (_keys!10125 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!896779 d!110973))

(declare-fun d!110975 () Bool)

(assert (=> d!110975 (= (array_inv!19849 (_values!5379 thiss!1181)) (bvsge (size!25740 (_values!5379 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!896779 d!110975))

(declare-fun d!110977 () Bool)

(declare-fun e!501368 () Bool)

(assert (=> d!110977 e!501368))

(declare-fun res!606336 () Bool)

(assert (=> d!110977 (=> res!606336 e!501368)))

(declare-fun lt!404959 () SeekEntryResult!8902)

(assert (=> d!110977 (= res!606336 (not ((_ is Found!8902) lt!404959)))))

(assert (=> d!110977 (= lt!404959 (seekEntry!0 key!785 (_keys!10125 thiss!1181) (mask!26041 thiss!1181)))))

(declare-fun lt!404958 () Unit!30494)

(declare-fun choose!1480 (array!52602 array!52604 (_ BitVec 32) (_ BitVec 32) V!29353 V!29353 (_ BitVec 64)) Unit!30494)

(assert (=> d!110977 (= lt!404958 (choose!1480 (_keys!10125 thiss!1181) (_values!5379 thiss!1181) (mask!26041 thiss!1181) (extraKeys!5088 thiss!1181) (zeroValue!5192 thiss!1181) (minValue!5192 thiss!1181) key!785))))

(assert (=> d!110977 (validMask!0 (mask!26041 thiss!1181))))

(assert (=> d!110977 (= (lemmaSeekEntryGivesInRangeIndex!73 (_keys!10125 thiss!1181) (_values!5379 thiss!1181) (mask!26041 thiss!1181) (extraKeys!5088 thiss!1181) (zeroValue!5192 thiss!1181) (minValue!5192 thiss!1181) key!785) lt!404958)))

(declare-fun b!896821 () Bool)

(assert (=> b!896821 (= e!501368 (inRange!0 (index!37980 lt!404959) (mask!26041 thiss!1181)))))

(assert (= (and d!110977 (not res!606336)) b!896821))

(assert (=> d!110977 m!833835))

(declare-fun m!833879 () Bool)

(assert (=> d!110977 m!833879))

(assert (=> d!110977 m!833845))

(declare-fun m!833881 () Bool)

(assert (=> b!896821 m!833881))

(assert (=> b!896782 d!110977))

(declare-fun b!896834 () Bool)

(declare-fun e!501375 () SeekEntryResult!8902)

(assert (=> b!896834 (= e!501375 Undefined!8902)))

(declare-fun b!896835 () Bool)

(declare-fun c!94739 () Bool)

(declare-fun lt!404970 () (_ BitVec 64))

(assert (=> b!896835 (= c!94739 (= lt!404970 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!501376 () SeekEntryResult!8902)

(declare-fun e!501377 () SeekEntryResult!8902)

(assert (=> b!896835 (= e!501376 e!501377)))

(declare-fun b!896836 () Bool)

(declare-fun lt!404969 () SeekEntryResult!8902)

(assert (=> b!896836 (= e!501376 (Found!8902 (index!37981 lt!404969)))))

(declare-fun b!896837 () Bool)

(declare-fun lt!404968 () SeekEntryResult!8902)

(assert (=> b!896837 (= e!501377 (ite ((_ is MissingVacant!8902) lt!404968) (MissingZero!8902 (index!37982 lt!404968)) lt!404968))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52602 (_ BitVec 32)) SeekEntryResult!8902)

(assert (=> b!896837 (= lt!404968 (seekKeyOrZeroReturnVacant!0 (x!76376 lt!404969) (index!37981 lt!404969) (index!37981 lt!404969) key!785 (_keys!10125 thiss!1181) (mask!26041 thiss!1181)))))

(declare-fun d!110979 () Bool)

(declare-fun lt!404971 () SeekEntryResult!8902)

(assert (=> d!110979 (and (or ((_ is MissingVacant!8902) lt!404971) (not ((_ is Found!8902) lt!404971)) (and (bvsge (index!37980 lt!404971) #b00000000000000000000000000000000) (bvslt (index!37980 lt!404971) (size!25739 (_keys!10125 thiss!1181))))) (not ((_ is MissingVacant!8902) lt!404971)) (or (not ((_ is Found!8902) lt!404971)) (= (select (arr!25287 (_keys!10125 thiss!1181)) (index!37980 lt!404971)) key!785)))))

(assert (=> d!110979 (= lt!404971 e!501375)))

(declare-fun c!94737 () Bool)

(assert (=> d!110979 (= c!94737 (and ((_ is Intermediate!8902) lt!404969) (undefined!9714 lt!404969)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52602 (_ BitVec 32)) SeekEntryResult!8902)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!110979 (= lt!404969 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26041 thiss!1181)) key!785 (_keys!10125 thiss!1181) (mask!26041 thiss!1181)))))

(assert (=> d!110979 (validMask!0 (mask!26041 thiss!1181))))

(assert (=> d!110979 (= (seekEntry!0 key!785 (_keys!10125 thiss!1181) (mask!26041 thiss!1181)) lt!404971)))

(declare-fun b!896838 () Bool)

(assert (=> b!896838 (= e!501377 (MissingZero!8902 (index!37981 lt!404969)))))

(declare-fun b!896839 () Bool)

(assert (=> b!896839 (= e!501375 e!501376)))

(assert (=> b!896839 (= lt!404970 (select (arr!25287 (_keys!10125 thiss!1181)) (index!37981 lt!404969)))))

(declare-fun c!94738 () Bool)

(assert (=> b!896839 (= c!94738 (= lt!404970 key!785))))

(assert (= (and d!110979 c!94737) b!896834))

(assert (= (and d!110979 (not c!94737)) b!896839))

(assert (= (and b!896839 c!94738) b!896836))

(assert (= (and b!896839 (not c!94738)) b!896835))

(assert (= (and b!896835 c!94739) b!896838))

(assert (= (and b!896835 (not c!94739)) b!896837))

(declare-fun m!833883 () Bool)

(assert (=> b!896837 m!833883))

(declare-fun m!833885 () Bool)

(assert (=> d!110979 m!833885))

(declare-fun m!833887 () Bool)

(assert (=> d!110979 m!833887))

(assert (=> d!110979 m!833887))

(declare-fun m!833889 () Bool)

(assert (=> d!110979 m!833889))

(assert (=> d!110979 m!833845))

(declare-fun m!833891 () Bool)

(assert (=> b!896839 m!833891))

(assert (=> b!896782 d!110979))

(declare-fun d!110981 () Bool)

(assert (=> d!110981 (= (inRange!0 (index!37980 lt!404944) (mask!26041 thiss!1181)) (and (bvsge (index!37980 lt!404944) #b00000000000000000000000000000000) (bvslt (index!37980 lt!404944) (bvadd (mask!26041 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!896777 d!110981))

(declare-fun d!110983 () Bool)

(assert (=> d!110983 (= (validMask!0 (mask!26041 thiss!1181)) (and (or (= (mask!26041 thiss!1181) #b00000000000000000000000000000111) (= (mask!26041 thiss!1181) #b00000000000000000000000000001111) (= (mask!26041 thiss!1181) #b00000000000000000000000000011111) (= (mask!26041 thiss!1181) #b00000000000000000000000000111111) (= (mask!26041 thiss!1181) #b00000000000000000000000001111111) (= (mask!26041 thiss!1181) #b00000000000000000000000011111111) (= (mask!26041 thiss!1181) #b00000000000000000000000111111111) (= (mask!26041 thiss!1181) #b00000000000000000000001111111111) (= (mask!26041 thiss!1181) #b00000000000000000000011111111111) (= (mask!26041 thiss!1181) #b00000000000000000000111111111111) (= (mask!26041 thiss!1181) #b00000000000000000001111111111111) (= (mask!26041 thiss!1181) #b00000000000000000011111111111111) (= (mask!26041 thiss!1181) #b00000000000000000111111111111111) (= (mask!26041 thiss!1181) #b00000000000000001111111111111111) (= (mask!26041 thiss!1181) #b00000000000000011111111111111111) (= (mask!26041 thiss!1181) #b00000000000000111111111111111111) (= (mask!26041 thiss!1181) #b00000000000001111111111111111111) (= (mask!26041 thiss!1181) #b00000000000011111111111111111111) (= (mask!26041 thiss!1181) #b00000000000111111111111111111111) (= (mask!26041 thiss!1181) #b00000000001111111111111111111111) (= (mask!26041 thiss!1181) #b00000000011111111111111111111111) (= (mask!26041 thiss!1181) #b00000000111111111111111111111111) (= (mask!26041 thiss!1181) #b00000001111111111111111111111111) (= (mask!26041 thiss!1181) #b00000011111111111111111111111111) (= (mask!26041 thiss!1181) #b00000111111111111111111111111111) (= (mask!26041 thiss!1181) #b00001111111111111111111111111111) (= (mask!26041 thiss!1181) #b00011111111111111111111111111111) (= (mask!26041 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!26041 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!896774 d!110983))

(declare-fun d!110985 () Bool)

(declare-fun res!606341 () Bool)

(declare-fun e!501382 () Bool)

(assert (=> d!110985 (=> res!606341 e!501382)))

(assert (=> d!110985 (= res!606341 (= (select (arr!25287 (_keys!10125 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!110985 (= (arrayContainsKey!0 (_keys!10125 thiss!1181) key!785 #b00000000000000000000000000000000) e!501382)))

(declare-fun b!896844 () Bool)

(declare-fun e!501383 () Bool)

(assert (=> b!896844 (= e!501382 e!501383)))

(declare-fun res!606342 () Bool)

(assert (=> b!896844 (=> (not res!606342) (not e!501383))))

(assert (=> b!896844 (= res!606342 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25739 (_keys!10125 thiss!1181))))))

(declare-fun b!896845 () Bool)

(assert (=> b!896845 (= e!501383 (arrayContainsKey!0 (_keys!10125 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!110985 (not res!606341)) b!896844))

(assert (= (and b!896844 res!606342) b!896845))

(declare-fun m!833893 () Bool)

(assert (=> d!110985 m!833893))

(declare-fun m!833895 () Bool)

(assert (=> b!896845 m!833895))

(assert (=> b!896774 d!110985))

(declare-fun d!110987 () Bool)

(assert (=> d!110987 (arrayContainsKey!0 (_keys!10125 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!404974 () Unit!30494)

(declare-fun choose!13 (array!52602 (_ BitVec 64) (_ BitVec 32)) Unit!30494)

(assert (=> d!110987 (= lt!404974 (choose!13 (_keys!10125 thiss!1181) key!785 (index!37980 lt!404944)))))

(assert (=> d!110987 (bvsge (index!37980 lt!404944) #b00000000000000000000000000000000)))

(assert (=> d!110987 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10125 thiss!1181) key!785 (index!37980 lt!404944)) lt!404974)))

(declare-fun bs!25175 () Bool)

(assert (= bs!25175 d!110987))

(assert (=> bs!25175 m!833847))

(declare-fun m!833897 () Bool)

(assert (=> bs!25175 m!833897))

(assert (=> b!896774 d!110987))

(declare-fun mapNonEmpty!29067 () Bool)

(declare-fun mapRes!29067 () Bool)

(declare-fun tp!55937 () Bool)

(declare-fun e!501389 () Bool)

(assert (=> mapNonEmpty!29067 (= mapRes!29067 (and tp!55937 e!501389))))

(declare-fun mapKey!29067 () (_ BitVec 32))

(declare-fun mapRest!29067 () (Array (_ BitVec 32) ValueCell!8664))

(declare-fun mapValue!29067 () ValueCell!8664)

(assert (=> mapNonEmpty!29067 (= mapRest!29061 (store mapRest!29067 mapKey!29067 mapValue!29067))))

(declare-fun b!896852 () Bool)

(assert (=> b!896852 (= e!501389 tp_is_empty!18291)))

(declare-fun condMapEmpty!29067 () Bool)

(declare-fun mapDefault!29067 () ValueCell!8664)

(assert (=> mapNonEmpty!29061 (= condMapEmpty!29067 (= mapRest!29061 ((as const (Array (_ BitVec 32) ValueCell!8664)) mapDefault!29067)))))

(declare-fun e!501388 () Bool)

(assert (=> mapNonEmpty!29061 (= tp!55928 (and e!501388 mapRes!29067))))

(declare-fun b!896853 () Bool)

(assert (=> b!896853 (= e!501388 tp_is_empty!18291)))

(declare-fun mapIsEmpty!29067 () Bool)

(assert (=> mapIsEmpty!29067 mapRes!29067))

(assert (= (and mapNonEmpty!29061 condMapEmpty!29067) mapIsEmpty!29067))

(assert (= (and mapNonEmpty!29061 (not condMapEmpty!29067)) mapNonEmpty!29067))

(assert (= (and mapNonEmpty!29067 ((_ is ValueCellFull!8664) mapValue!29067)) b!896852))

(assert (= (and mapNonEmpty!29061 ((_ is ValueCellFull!8664) mapDefault!29067)) b!896853))

(declare-fun m!833899 () Bool)

(assert (=> mapNonEmpty!29067 m!833899))

(check-sat b_and!26255 (not b!896845) (not d!110971) (not b!896817) (not d!110979) tp_is_empty!18291 (not d!110977) (not b!896816) (not d!110987) (not b!896818) (not mapNonEmpty!29067) (not b!896837) (not b!896821) (not b_next!15963))
(check-sat b_and!26255 (not b_next!15963))
(get-model)

(assert (=> d!110987 d!110985))

(declare-fun d!110989 () Bool)

(assert (=> d!110989 (arrayContainsKey!0 (_keys!10125 thiss!1181) key!785 #b00000000000000000000000000000000)))

(assert (=> d!110989 true))

(declare-fun _$60!409 () Unit!30494)

(assert (=> d!110989 (= (choose!13 (_keys!10125 thiss!1181) key!785 (index!37980 lt!404944)) _$60!409)))

(declare-fun bs!25176 () Bool)

(assert (= bs!25176 d!110989))

(assert (=> bs!25176 m!833847))

(assert (=> d!110987 d!110989))

(declare-fun d!110991 () Bool)

(assert (=> d!110991 (= (inRange!0 (index!37980 lt!404959) (mask!26041 thiss!1181)) (and (bvsge (index!37980 lt!404959) #b00000000000000000000000000000000) (bvslt (index!37980 lt!404959) (bvadd (mask!26041 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!896821 d!110991))

(declare-fun d!110993 () Bool)

(declare-fun res!606343 () Bool)

(declare-fun e!501390 () Bool)

(assert (=> d!110993 (=> res!606343 e!501390)))

(assert (=> d!110993 (= res!606343 (= (select (arr!25287 (_keys!10125 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!785))))

(assert (=> d!110993 (= (arrayContainsKey!0 (_keys!10125 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!501390)))

(declare-fun b!896854 () Bool)

(declare-fun e!501391 () Bool)

(assert (=> b!896854 (= e!501390 e!501391)))

(declare-fun res!606344 () Bool)

(assert (=> b!896854 (=> (not res!606344) (not e!501391))))

(assert (=> b!896854 (= res!606344 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!25739 (_keys!10125 thiss!1181))))))

(declare-fun b!896855 () Bool)

(assert (=> b!896855 (= e!501391 (arrayContainsKey!0 (_keys!10125 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!110993 (not res!606343)) b!896854))

(assert (= (and b!896854 res!606344) b!896855))

(declare-fun m!833901 () Bool)

(assert (=> d!110993 m!833901))

(declare-fun m!833903 () Bool)

(assert (=> b!896855 m!833903))

(assert (=> b!896845 d!110993))

(declare-fun lt!404980 () SeekEntryResult!8902)

(declare-fun d!110995 () Bool)

(assert (=> d!110995 (and (or ((_ is Undefined!8902) lt!404980) (not ((_ is Found!8902) lt!404980)) (and (bvsge (index!37980 lt!404980) #b00000000000000000000000000000000) (bvslt (index!37980 lt!404980) (size!25739 (_keys!10125 thiss!1181))))) (or ((_ is Undefined!8902) lt!404980) ((_ is Found!8902) lt!404980) (not ((_ is MissingVacant!8902) lt!404980)) (not (= (index!37982 lt!404980) (index!37981 lt!404969))) (and (bvsge (index!37982 lt!404980) #b00000000000000000000000000000000) (bvslt (index!37982 lt!404980) (size!25739 (_keys!10125 thiss!1181))))) (or ((_ is Undefined!8902) lt!404980) (ite ((_ is Found!8902) lt!404980) (= (select (arr!25287 (_keys!10125 thiss!1181)) (index!37980 lt!404980)) key!785) (and ((_ is MissingVacant!8902) lt!404980) (= (index!37982 lt!404980) (index!37981 lt!404969)) (= (select (arr!25287 (_keys!10125 thiss!1181)) (index!37982 lt!404980)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!501398 () SeekEntryResult!8902)

(assert (=> d!110995 (= lt!404980 e!501398)))

(declare-fun c!94748 () Bool)

(assert (=> d!110995 (= c!94748 (bvsge (x!76376 lt!404969) #b01111111111111111111111111111110))))

(declare-fun lt!404979 () (_ BitVec 64))

(assert (=> d!110995 (= lt!404979 (select (arr!25287 (_keys!10125 thiss!1181)) (index!37981 lt!404969)))))

(assert (=> d!110995 (validMask!0 (mask!26041 thiss!1181))))

(assert (=> d!110995 (= (seekKeyOrZeroReturnVacant!0 (x!76376 lt!404969) (index!37981 lt!404969) (index!37981 lt!404969) key!785 (_keys!10125 thiss!1181) (mask!26041 thiss!1181)) lt!404980)))

(declare-fun b!896868 () Bool)

(declare-fun e!501400 () SeekEntryResult!8902)

(assert (=> b!896868 (= e!501400 (MissingVacant!8902 (index!37981 lt!404969)))))

(declare-fun b!896869 () Bool)

(declare-fun c!94747 () Bool)

(assert (=> b!896869 (= c!94747 (= lt!404979 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!501399 () SeekEntryResult!8902)

(assert (=> b!896869 (= e!501399 e!501400)))

(declare-fun b!896870 () Bool)

(assert (=> b!896870 (= e!501398 e!501399)))

(declare-fun c!94746 () Bool)

(assert (=> b!896870 (= c!94746 (= lt!404979 key!785))))

(declare-fun b!896871 () Bool)

(assert (=> b!896871 (= e!501398 Undefined!8902)))

(declare-fun b!896872 () Bool)

(assert (=> b!896872 (= e!501399 (Found!8902 (index!37981 lt!404969)))))

(declare-fun b!896873 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!896873 (= e!501400 (seekKeyOrZeroReturnVacant!0 (bvadd (x!76376 lt!404969) #b00000000000000000000000000000001) (nextIndex!0 (index!37981 lt!404969) (x!76376 lt!404969) (mask!26041 thiss!1181)) (index!37981 lt!404969) key!785 (_keys!10125 thiss!1181) (mask!26041 thiss!1181)))))

(assert (= (and d!110995 c!94748) b!896871))

(assert (= (and d!110995 (not c!94748)) b!896870))

(assert (= (and b!896870 c!94746) b!896872))

(assert (= (and b!896870 (not c!94746)) b!896869))

(assert (= (and b!896869 c!94747) b!896868))

(assert (= (and b!896869 (not c!94747)) b!896873))

(declare-fun m!833905 () Bool)

(assert (=> d!110995 m!833905))

(declare-fun m!833907 () Bool)

(assert (=> d!110995 m!833907))

(assert (=> d!110995 m!833891))

(assert (=> d!110995 m!833845))

(declare-fun m!833909 () Bool)

(assert (=> b!896873 m!833909))

(assert (=> b!896873 m!833909))

(declare-fun m!833911 () Bool)

(assert (=> b!896873 m!833911))

(assert (=> b!896837 d!110995))

(declare-fun b!896883 () Bool)

(declare-fun res!606355 () Bool)

(declare-fun e!501403 () Bool)

(assert (=> b!896883 (=> (not res!606355) (not e!501403))))

(declare-fun size!25743 (LongMapFixedSize!4344) (_ BitVec 32))

(assert (=> b!896883 (= res!606355 (bvsge (size!25743 thiss!1181) (_size!2227 thiss!1181)))))

(declare-fun b!896882 () Bool)

(declare-fun res!606354 () Bool)

(assert (=> b!896882 (=> (not res!606354) (not e!501403))))

(assert (=> b!896882 (= res!606354 (and (= (size!25740 (_values!5379 thiss!1181)) (bvadd (mask!26041 thiss!1181) #b00000000000000000000000000000001)) (= (size!25739 (_keys!10125 thiss!1181)) (size!25740 (_values!5379 thiss!1181))) (bvsge (_size!2227 thiss!1181) #b00000000000000000000000000000000) (bvsle (_size!2227 thiss!1181) (bvadd (mask!26041 thiss!1181) #b00000000000000000000000000000001))))))

(declare-fun b!896885 () Bool)

(assert (=> b!896885 (= e!501403 (and (bvsge (extraKeys!5088 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!5088 thiss!1181) #b00000000000000000000000000000011) (bvsge (_vacant!2227 thiss!1181) #b00000000000000000000000000000000)))))

(declare-fun d!110997 () Bool)

(declare-fun res!606353 () Bool)

(assert (=> d!110997 (=> (not res!606353) (not e!501403))))

(assert (=> d!110997 (= res!606353 (validMask!0 (mask!26041 thiss!1181)))))

(assert (=> d!110997 (= (simpleValid!315 thiss!1181) e!501403)))

(declare-fun b!896884 () Bool)

(declare-fun res!606356 () Bool)

(assert (=> b!896884 (=> (not res!606356) (not e!501403))))

(assert (=> b!896884 (= res!606356 (= (size!25743 thiss!1181) (bvadd (_size!2227 thiss!1181) (bvsdiv (bvadd (extraKeys!5088 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!110997 res!606353) b!896882))

(assert (= (and b!896882 res!606354) b!896883))

(assert (= (and b!896883 res!606355) b!896884))

(assert (= (and b!896884 res!606356) b!896885))

(declare-fun m!833913 () Bool)

(assert (=> b!896883 m!833913))

(assert (=> d!110997 m!833845))

(assert (=> b!896884 m!833913))

(assert (=> d!110971 d!110997))

(declare-fun b!896904 () Bool)

(declare-fun e!501414 () SeekEntryResult!8902)

(assert (=> b!896904 (= e!501414 (Intermediate!8902 false (toIndex!0 key!785 (mask!26041 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun b!896905 () Bool)

(declare-fun lt!404985 () SeekEntryResult!8902)

(assert (=> b!896905 (and (bvsge (index!37981 lt!404985) #b00000000000000000000000000000000) (bvslt (index!37981 lt!404985) (size!25739 (_keys!10125 thiss!1181))))))

(declare-fun e!501415 () Bool)

(assert (=> b!896905 (= e!501415 (= (select (arr!25287 (_keys!10125 thiss!1181)) (index!37981 lt!404985)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!896906 () Bool)

(declare-fun e!501416 () SeekEntryResult!8902)

(assert (=> b!896906 (= e!501416 (Intermediate!8902 true (toIndex!0 key!785 (mask!26041 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun b!896907 () Bool)

(declare-fun e!501418 () Bool)

(declare-fun e!501417 () Bool)

(assert (=> b!896907 (= e!501418 e!501417)))

(declare-fun res!606364 () Bool)

(assert (=> b!896907 (= res!606364 (and ((_ is Intermediate!8902) lt!404985) (not (undefined!9714 lt!404985)) (bvslt (x!76376 lt!404985) #b01111111111111111111111111111110) (bvsge (x!76376 lt!404985) #b00000000000000000000000000000000) (bvsge (x!76376 lt!404985) #b00000000000000000000000000000000)))))

(assert (=> b!896907 (=> (not res!606364) (not e!501417))))

(declare-fun b!896908 () Bool)

(assert (=> b!896908 (= e!501416 e!501414)))

(declare-fun c!94756 () Bool)

(declare-fun lt!404986 () (_ BitVec 64))

(assert (=> b!896908 (= c!94756 (or (= lt!404986 key!785) (= (bvadd lt!404986 lt!404986) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!896909 () Bool)

(assert (=> b!896909 (= e!501418 (bvsge (x!76376 lt!404985) #b01111111111111111111111111111110))))

(declare-fun b!896910 () Bool)

(assert (=> b!896910 (= e!501414 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!785 (mask!26041 thiss!1181)) #b00000000000000000000000000000000 (mask!26041 thiss!1181)) key!785 (_keys!10125 thiss!1181) (mask!26041 thiss!1181)))))

(declare-fun d!110999 () Bool)

(assert (=> d!110999 e!501418))

(declare-fun c!94757 () Bool)

(assert (=> d!110999 (= c!94757 (and ((_ is Intermediate!8902) lt!404985) (undefined!9714 lt!404985)))))

(assert (=> d!110999 (= lt!404985 e!501416)))

(declare-fun c!94755 () Bool)

(assert (=> d!110999 (= c!94755 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!110999 (= lt!404986 (select (arr!25287 (_keys!10125 thiss!1181)) (toIndex!0 key!785 (mask!26041 thiss!1181))))))

(assert (=> d!110999 (validMask!0 (mask!26041 thiss!1181))))

(assert (=> d!110999 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26041 thiss!1181)) key!785 (_keys!10125 thiss!1181) (mask!26041 thiss!1181)) lt!404985)))

(declare-fun b!896911 () Bool)

(assert (=> b!896911 (and (bvsge (index!37981 lt!404985) #b00000000000000000000000000000000) (bvslt (index!37981 lt!404985) (size!25739 (_keys!10125 thiss!1181))))))

(declare-fun res!606365 () Bool)

(assert (=> b!896911 (= res!606365 (= (select (arr!25287 (_keys!10125 thiss!1181)) (index!37981 lt!404985)) key!785))))

(assert (=> b!896911 (=> res!606365 e!501415)))

(assert (=> b!896911 (= e!501417 e!501415)))

(declare-fun b!896912 () Bool)

(assert (=> b!896912 (and (bvsge (index!37981 lt!404985) #b00000000000000000000000000000000) (bvslt (index!37981 lt!404985) (size!25739 (_keys!10125 thiss!1181))))))

(declare-fun res!606363 () Bool)

(assert (=> b!896912 (= res!606363 (= (select (arr!25287 (_keys!10125 thiss!1181)) (index!37981 lt!404985)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!896912 (=> res!606363 e!501415)))

(assert (= (and d!110999 c!94755) b!896906))

(assert (= (and d!110999 (not c!94755)) b!896908))

(assert (= (and b!896908 c!94756) b!896904))

(assert (= (and b!896908 (not c!94756)) b!896910))

(assert (= (and d!110999 c!94757) b!896909))

(assert (= (and d!110999 (not c!94757)) b!896907))

(assert (= (and b!896907 res!606364) b!896911))

(assert (= (and b!896911 (not res!606365)) b!896912))

(assert (= (and b!896912 (not res!606363)) b!896905))

(declare-fun m!833915 () Bool)

(assert (=> b!896905 m!833915))

(assert (=> d!110999 m!833887))

(declare-fun m!833917 () Bool)

(assert (=> d!110999 m!833917))

(assert (=> d!110999 m!833845))

(assert (=> b!896912 m!833915))

(assert (=> b!896910 m!833887))

(declare-fun m!833919 () Bool)

(assert (=> b!896910 m!833919))

(assert (=> b!896910 m!833919))

(declare-fun m!833921 () Bool)

(assert (=> b!896910 m!833921))

(assert (=> b!896911 m!833915))

(assert (=> d!110979 d!110999))

(declare-fun d!111001 () Bool)

(declare-fun lt!404992 () (_ BitVec 32))

(declare-fun lt!404991 () (_ BitVec 32))

(assert (=> d!111001 (= lt!404992 (bvmul (bvxor lt!404991 (bvlshr lt!404991 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!111001 (= lt!404991 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!111001 (and (bvsge (mask!26041 thiss!1181) #b00000000000000000000000000000000) (let ((res!606366 (let ((h!18961 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!76393 (bvmul (bvxor h!18961 (bvlshr h!18961 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!76393 (bvlshr x!76393 #b00000000000000000000000000001101)) (mask!26041 thiss!1181)))))) (and (bvslt res!606366 (bvadd (mask!26041 thiss!1181) #b00000000000000000000000000000001)) (bvsge res!606366 #b00000000000000000000000000000000))))))

(assert (=> d!111001 (= (toIndex!0 key!785 (mask!26041 thiss!1181)) (bvand (bvxor lt!404992 (bvlshr lt!404992 #b00000000000000000000000000001101)) (mask!26041 thiss!1181)))))

(assert (=> d!110979 d!111001))

(assert (=> d!110979 d!110983))

(assert (=> d!110977 d!110979))

(declare-fun d!111003 () Bool)

(declare-fun e!501421 () Bool)

(assert (=> d!111003 e!501421))

(declare-fun res!606369 () Bool)

(assert (=> d!111003 (=> res!606369 e!501421)))

(declare-fun lt!404995 () SeekEntryResult!8902)

(assert (=> d!111003 (= res!606369 (not ((_ is Found!8902) lt!404995)))))

(assert (=> d!111003 (= lt!404995 (seekEntry!0 key!785 (_keys!10125 thiss!1181) (mask!26041 thiss!1181)))))

(assert (=> d!111003 true))

(declare-fun _$36!357 () Unit!30494)

(assert (=> d!111003 (= (choose!1480 (_keys!10125 thiss!1181) (_values!5379 thiss!1181) (mask!26041 thiss!1181) (extraKeys!5088 thiss!1181) (zeroValue!5192 thiss!1181) (minValue!5192 thiss!1181) key!785) _$36!357)))

(declare-fun b!896915 () Bool)

(assert (=> b!896915 (= e!501421 (inRange!0 (index!37980 lt!404995) (mask!26041 thiss!1181)))))

(assert (= (and d!111003 (not res!606369)) b!896915))

(assert (=> d!111003 m!833835))

(declare-fun m!833923 () Bool)

(assert (=> b!896915 m!833923))

(assert (=> d!110977 d!111003))

(assert (=> d!110977 d!110983))

(declare-fun b!896924 () Bool)

(declare-fun e!501427 () (_ BitVec 32))

(assert (=> b!896924 (= e!501427 #b00000000000000000000000000000000)))

(declare-fun bm!39787 () Bool)

(declare-fun call!39790 () (_ BitVec 32))

(assert (=> bm!39787 (= call!39790 (arrayCountValidKeys!0 (_keys!10125 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25739 (_keys!10125 thiss!1181))))))

(declare-fun b!896925 () Bool)

(declare-fun e!501426 () (_ BitVec 32))

(assert (=> b!896925 (= e!501426 call!39790)))

(declare-fun b!896926 () Bool)

(assert (=> b!896926 (= e!501426 (bvadd #b00000000000000000000000000000001 call!39790))))

(declare-fun b!896927 () Bool)

(assert (=> b!896927 (= e!501427 e!501426)))

(declare-fun c!94762 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!896927 (= c!94762 (validKeyInArray!0 (select (arr!25287 (_keys!10125 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun d!111005 () Bool)

(declare-fun lt!404998 () (_ BitVec 32))

(assert (=> d!111005 (and (bvsge lt!404998 #b00000000000000000000000000000000) (bvsle lt!404998 (bvsub (size!25739 (_keys!10125 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> d!111005 (= lt!404998 e!501427)))

(declare-fun c!94763 () Bool)

(assert (=> d!111005 (= c!94763 (bvsge #b00000000000000000000000000000000 (size!25739 (_keys!10125 thiss!1181))))))

(assert (=> d!111005 (and (bvsle #b00000000000000000000000000000000 (size!25739 (_keys!10125 thiss!1181))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!25739 (_keys!10125 thiss!1181)) (size!25739 (_keys!10125 thiss!1181))))))

(assert (=> d!111005 (= (arrayCountValidKeys!0 (_keys!10125 thiss!1181) #b00000000000000000000000000000000 (size!25739 (_keys!10125 thiss!1181))) lt!404998)))

(assert (= (and d!111005 c!94763) b!896924))

(assert (= (and d!111005 (not c!94763)) b!896927))

(assert (= (and b!896927 c!94762) b!896926))

(assert (= (and b!896927 (not c!94762)) b!896925))

(assert (= (or b!896926 b!896925) bm!39787))

(declare-fun m!833925 () Bool)

(assert (=> bm!39787 m!833925))

(assert (=> b!896927 m!833893))

(assert (=> b!896927 m!833893))

(declare-fun m!833927 () Bool)

(assert (=> b!896927 m!833927))

(assert (=> b!896816 d!111005))

(declare-fun b!896938 () Bool)

(declare-fun e!501438 () Bool)

(declare-fun call!39793 () Bool)

(assert (=> b!896938 (= e!501438 call!39793)))

(declare-fun b!896939 () Bool)

(assert (=> b!896939 (= e!501438 call!39793)))

(declare-fun b!896940 () Bool)

(declare-fun e!501439 () Bool)

(declare-fun contains!4402 (List!17825 (_ BitVec 64)) Bool)

(assert (=> b!896940 (= e!501439 (contains!4402 Nil!17822 (select (arr!25287 (_keys!10125 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!896942 () Bool)

(declare-fun e!501436 () Bool)

(assert (=> b!896942 (= e!501436 e!501438)))

(declare-fun c!94766 () Bool)

(assert (=> b!896942 (= c!94766 (validKeyInArray!0 (select (arr!25287 (_keys!10125 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!39790 () Bool)

(assert (=> bm!39790 (= call!39793 (arrayNoDuplicates!0 (_keys!10125 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!94766 (Cons!17821 (select (arr!25287 (_keys!10125 thiss!1181)) #b00000000000000000000000000000000) Nil!17822) Nil!17822)))))

(declare-fun b!896941 () Bool)

(declare-fun e!501437 () Bool)

(assert (=> b!896941 (= e!501437 e!501436)))

(declare-fun res!606378 () Bool)

(assert (=> b!896941 (=> (not res!606378) (not e!501436))))

(assert (=> b!896941 (= res!606378 (not e!501439))))

(declare-fun res!606376 () Bool)

(assert (=> b!896941 (=> (not res!606376) (not e!501439))))

(assert (=> b!896941 (= res!606376 (validKeyInArray!0 (select (arr!25287 (_keys!10125 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun d!111007 () Bool)

(declare-fun res!606377 () Bool)

(assert (=> d!111007 (=> res!606377 e!501437)))

(assert (=> d!111007 (= res!606377 (bvsge #b00000000000000000000000000000000 (size!25739 (_keys!10125 thiss!1181))))))

(assert (=> d!111007 (= (arrayNoDuplicates!0 (_keys!10125 thiss!1181) #b00000000000000000000000000000000 Nil!17822) e!501437)))

(assert (= (and d!111007 (not res!606377)) b!896941))

(assert (= (and b!896941 res!606376) b!896940))

(assert (= (and b!896941 res!606378) b!896942))

(assert (= (and b!896942 c!94766) b!896939))

(assert (= (and b!896942 (not c!94766)) b!896938))

(assert (= (or b!896939 b!896938) bm!39790))

(assert (=> b!896940 m!833893))

(assert (=> b!896940 m!833893))

(declare-fun m!833929 () Bool)

(assert (=> b!896940 m!833929))

(assert (=> b!896942 m!833893))

(assert (=> b!896942 m!833893))

(assert (=> b!896942 m!833927))

(assert (=> bm!39790 m!833893))

(declare-fun m!833931 () Bool)

(assert (=> bm!39790 m!833931))

(assert (=> b!896941 m!833893))

(assert (=> b!896941 m!833893))

(assert (=> b!896941 m!833927))

(assert (=> b!896818 d!111007))

(declare-fun bm!39793 () Bool)

(declare-fun call!39796 () Bool)

(assert (=> bm!39793 (= call!39796 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10125 thiss!1181) (mask!26041 thiss!1181)))))

(declare-fun b!896951 () Bool)

(declare-fun e!501447 () Bool)

(assert (=> b!896951 (= e!501447 call!39796)))

(declare-fun b!896952 () Bool)

(declare-fun e!501446 () Bool)

(assert (=> b!896952 (= e!501446 call!39796)))

(declare-fun b!896953 () Bool)

(assert (=> b!896953 (= e!501446 e!501447)))

(declare-fun lt!405007 () (_ BitVec 64))

(assert (=> b!896953 (= lt!405007 (select (arr!25287 (_keys!10125 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!405005 () Unit!30494)

(assert (=> b!896953 (= lt!405005 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10125 thiss!1181) lt!405007 #b00000000000000000000000000000000))))

(assert (=> b!896953 (arrayContainsKey!0 (_keys!10125 thiss!1181) lt!405007 #b00000000000000000000000000000000)))

(declare-fun lt!405006 () Unit!30494)

(assert (=> b!896953 (= lt!405006 lt!405005)))

(declare-fun res!606383 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52602 (_ BitVec 32)) SeekEntryResult!8902)

(assert (=> b!896953 (= res!606383 (= (seekEntryOrOpen!0 (select (arr!25287 (_keys!10125 thiss!1181)) #b00000000000000000000000000000000) (_keys!10125 thiss!1181) (mask!26041 thiss!1181)) (Found!8902 #b00000000000000000000000000000000)))))

(assert (=> b!896953 (=> (not res!606383) (not e!501447))))

(declare-fun d!111009 () Bool)

(declare-fun res!606384 () Bool)

(declare-fun e!501448 () Bool)

(assert (=> d!111009 (=> res!606384 e!501448)))

(assert (=> d!111009 (= res!606384 (bvsge #b00000000000000000000000000000000 (size!25739 (_keys!10125 thiss!1181))))))

(assert (=> d!111009 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10125 thiss!1181) (mask!26041 thiss!1181)) e!501448)))

(declare-fun b!896954 () Bool)

(assert (=> b!896954 (= e!501448 e!501446)))

(declare-fun c!94769 () Bool)

(assert (=> b!896954 (= c!94769 (validKeyInArray!0 (select (arr!25287 (_keys!10125 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (= (and d!111009 (not res!606384)) b!896954))

(assert (= (and b!896954 c!94769) b!896953))

(assert (= (and b!896954 (not c!94769)) b!896952))

(assert (= (and b!896953 res!606383) b!896951))

(assert (= (or b!896951 b!896952) bm!39793))

(declare-fun m!833933 () Bool)

(assert (=> bm!39793 m!833933))

(assert (=> b!896953 m!833893))

(declare-fun m!833935 () Bool)

(assert (=> b!896953 m!833935))

(declare-fun m!833937 () Bool)

(assert (=> b!896953 m!833937))

(assert (=> b!896953 m!833893))

(declare-fun m!833939 () Bool)

(assert (=> b!896953 m!833939))

(assert (=> b!896954 m!833893))

(assert (=> b!896954 m!833893))

(assert (=> b!896954 m!833927))

(assert (=> b!896817 d!111009))

(declare-fun mapNonEmpty!29068 () Bool)

(declare-fun mapRes!29068 () Bool)

(declare-fun tp!55938 () Bool)

(declare-fun e!501450 () Bool)

(assert (=> mapNonEmpty!29068 (= mapRes!29068 (and tp!55938 e!501450))))

(declare-fun mapKey!29068 () (_ BitVec 32))

(declare-fun mapRest!29068 () (Array (_ BitVec 32) ValueCell!8664))

(declare-fun mapValue!29068 () ValueCell!8664)

(assert (=> mapNonEmpty!29068 (= mapRest!29067 (store mapRest!29068 mapKey!29068 mapValue!29068))))

(declare-fun b!896955 () Bool)

(assert (=> b!896955 (= e!501450 tp_is_empty!18291)))

(declare-fun condMapEmpty!29068 () Bool)

(declare-fun mapDefault!29068 () ValueCell!8664)

(assert (=> mapNonEmpty!29067 (= condMapEmpty!29068 (= mapRest!29067 ((as const (Array (_ BitVec 32) ValueCell!8664)) mapDefault!29068)))))

(declare-fun e!501449 () Bool)

(assert (=> mapNonEmpty!29067 (= tp!55937 (and e!501449 mapRes!29068))))

(declare-fun b!896956 () Bool)

(assert (=> b!896956 (= e!501449 tp_is_empty!18291)))

(declare-fun mapIsEmpty!29068 () Bool)

(assert (=> mapIsEmpty!29068 mapRes!29068))

(assert (= (and mapNonEmpty!29067 condMapEmpty!29068) mapIsEmpty!29068))

(assert (= (and mapNonEmpty!29067 (not condMapEmpty!29068)) mapNonEmpty!29068))

(assert (= (and mapNonEmpty!29068 ((_ is ValueCellFull!8664) mapValue!29068)) b!896955))

(assert (= (and mapNonEmpty!29067 ((_ is ValueCellFull!8664) mapDefault!29068)) b!896956))

(declare-fun m!833941 () Bool)

(assert (=> mapNonEmpty!29068 m!833941))

(check-sat b_and!26255 (not b!896927) (not b!896940) (not b!896884) (not b!896910) (not d!110995) (not d!110997) (not b!896873) (not b!896941) (not bm!39790) (not b!896855) (not mapNonEmpty!29068) (not b_next!15963) (not bm!39793) (not b!896915) tp_is_empty!18291 (not d!110999) (not d!111003) (not d!110989) (not b!896883) (not b!896942) (not b!896953) (not b!896954) (not bm!39787))
(check-sat b_and!26255 (not b_next!15963))
