; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76726 () Bool)

(assert start!76726)

(declare-fun b!897831 () Bool)

(declare-fun b_free!16003 () Bool)

(declare-fun b_next!16003 () Bool)

(assert (=> b!897831 (= b_free!16003 (not b_next!16003))))

(declare-fun tp!56072 () Bool)

(declare-fun b_and!26269 () Bool)

(assert (=> b!897831 (= tp!56072 b_and!26269)))

(declare-fun b!897820 () Bool)

(declare-fun e!502150 () Bool)

(declare-datatypes ((array!52679 0))(
  ( (array!52680 (arr!25319 (Array (_ BitVec 32) (_ BitVec 64))) (size!25776 (_ BitVec 32))) )
))
(declare-datatypes ((V!29407 0))(
  ( (V!29408 (val!9216 Int)) )
))
(declare-datatypes ((ValueCell!8684 0))(
  ( (ValueCellFull!8684 (v!11703 V!29407)) (EmptyCell!8684) )
))
(declare-datatypes ((array!52681 0))(
  ( (array!52682 (arr!25320 (Array (_ BitVec 32) ValueCell!8684)) (size!25777 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4384 0))(
  ( (LongMapFixedSize!4385 (defaultEntry!5404 Int) (mask!26114 (_ BitVec 32)) (extraKeys!5118 (_ BitVec 32)) (zeroValue!5222 V!29407) (minValue!5222 V!29407) (_size!2247 (_ BitVec 32)) (_keys!10169 array!52679) (_values!5409 array!52681) (_vacant!2247 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4384)

(declare-datatypes ((SeekEntryResult!8922 0))(
  ( (MissingZero!8922 (index!38059 (_ BitVec 32))) (Found!8922 (index!38060 (_ BitVec 32))) (Intermediate!8922 (undefined!9734 Bool) (index!38061 (_ BitVec 32)) (x!76530 (_ BitVec 32))) (Undefined!8922) (MissingVacant!8922 (index!38062 (_ BitVec 32))) )
))
(declare-fun lt!405159 () SeekEntryResult!8922)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!897820 (= e!502150 (validKeyInArray!0 (select (arr!25319 (_keys!10169 thiss!1181)) (index!38060 lt!405159))))))

(declare-fun b!897821 () Bool)

(declare-fun e!502149 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!897821 (= e!502149 (inRange!0 (index!38060 lt!405159) (mask!26114 thiss!1181)))))

(declare-fun b!897822 () Bool)

(declare-fun res!606853 () Bool)

(assert (=> b!897822 (=> res!606853 e!502150)))

(assert (=> b!897822 (= res!606853 (or (bvslt (index!38060 lt!405159) #b00000000000000000000000000000000) (bvsge (index!38060 lt!405159) (size!25776 (_keys!10169 thiss!1181)))))))

(declare-fun b!897823 () Bool)

(declare-fun e!502145 () Bool)

(declare-fun e!502147 () Bool)

(assert (=> b!897823 (= e!502145 (not e!502147))))

(declare-fun res!606847 () Bool)

(assert (=> b!897823 (=> res!606847 e!502147)))

(get-info :version)

(assert (=> b!897823 (= res!606847 (not ((_ is Found!8922) lt!405159)))))

(assert (=> b!897823 e!502149))

(declare-fun res!606846 () Bool)

(assert (=> b!897823 (=> res!606846 e!502149)))

(assert (=> b!897823 (= res!606846 (not ((_ is Found!8922) lt!405159)))))

(declare-datatypes ((Unit!30464 0))(
  ( (Unit!30465) )
))
(declare-fun lt!405160 () Unit!30464)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun lemmaSeekEntryGivesInRangeIndex!88 (array!52679 array!52681 (_ BitVec 32) (_ BitVec 32) V!29407 V!29407 (_ BitVec 64)) Unit!30464)

(assert (=> b!897823 (= lt!405160 (lemmaSeekEntryGivesInRangeIndex!88 (_keys!10169 thiss!1181) (_values!5409 thiss!1181) (mask!26114 thiss!1181) (extraKeys!5118 thiss!1181) (zeroValue!5222 thiss!1181) (minValue!5222 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52679 (_ BitVec 32)) SeekEntryResult!8922)

(assert (=> b!897823 (= lt!405159 (seekEntry!0 key!785 (_keys!10169 thiss!1181) (mask!26114 thiss!1181)))))

(declare-fun b!897824 () Bool)

(declare-fun res!606845 () Bool)

(assert (=> b!897824 (=> res!606845 e!502150)))

(declare-datatypes ((List!17841 0))(
  ( (Nil!17838) (Cons!17837 (h!18979 (_ BitVec 64)) (t!25171 List!17841)) )
))
(declare-fun arrayNoDuplicates!0 (array!52679 (_ BitVec 32) List!17841) Bool)

(assert (=> b!897824 (= res!606845 (not (arrayNoDuplicates!0 (_keys!10169 thiss!1181) #b00000000000000000000000000000000 Nil!17838)))))

(declare-fun b!897825 () Bool)

(declare-fun e!502143 () Bool)

(declare-fun tp_is_empty!18331 () Bool)

(assert (=> b!897825 (= e!502143 tp_is_empty!18331)))

(declare-fun b!897826 () Bool)

(assert (=> b!897826 (= e!502147 e!502150)))

(declare-fun res!606851 () Bool)

(assert (=> b!897826 (=> res!606851 e!502150)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!897826 (= res!606851 (not (validMask!0 (mask!26114 thiss!1181))))))

(declare-fun arrayContainsKey!0 (array!52679 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!897826 (arrayContainsKey!0 (_keys!10169 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!405161 () Unit!30464)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52679 (_ BitVec 64) (_ BitVec 32)) Unit!30464)

(assert (=> b!897826 (= lt!405161 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10169 thiss!1181) key!785 (index!38060 lt!405159)))))

(declare-fun b!897827 () Bool)

(declare-fun res!606849 () Bool)

(assert (=> b!897827 (=> (not res!606849) (not e!502145))))

(assert (=> b!897827 (= res!606849 (not (= key!785 (bvneg key!785))))))

(declare-fun mapIsEmpty!29145 () Bool)

(declare-fun mapRes!29145 () Bool)

(assert (=> mapIsEmpty!29145 mapRes!29145))

(declare-fun b!897828 () Bool)

(declare-fun e!502142 () Bool)

(declare-fun e!502144 () Bool)

(assert (=> b!897828 (= e!502142 (and e!502144 mapRes!29145))))

(declare-fun condMapEmpty!29145 () Bool)

(declare-fun mapDefault!29145 () ValueCell!8684)

(assert (=> b!897828 (= condMapEmpty!29145 (= (arr!25320 (_values!5409 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8684)) mapDefault!29145)))))

(declare-fun b!897829 () Bool)

(declare-fun res!606848 () Bool)

(assert (=> b!897829 (=> res!606848 e!502150)))

(assert (=> b!897829 (= res!606848 (or (not (= (size!25777 (_values!5409 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!26114 thiss!1181)))) (not (= (size!25776 (_keys!10169 thiss!1181)) (size!25777 (_values!5409 thiss!1181)))) (bvslt (mask!26114 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!5118 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!5118 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun res!606850 () Bool)

(assert (=> start!76726 (=> (not res!606850) (not e!502145))))

(declare-fun valid!1695 (LongMapFixedSize!4384) Bool)

(assert (=> start!76726 (= res!606850 (valid!1695 thiss!1181))))

(assert (=> start!76726 e!502145))

(declare-fun e!502146 () Bool)

(assert (=> start!76726 e!502146))

(assert (=> start!76726 true))

(declare-fun b!897830 () Bool)

(assert (=> b!897830 (= e!502144 tp_is_empty!18331)))

(declare-fun array_inv!19924 (array!52679) Bool)

(declare-fun array_inv!19925 (array!52681) Bool)

(assert (=> b!897831 (= e!502146 (and tp!56072 tp_is_empty!18331 (array_inv!19924 (_keys!10169 thiss!1181)) (array_inv!19925 (_values!5409 thiss!1181)) e!502142))))

(declare-fun mapNonEmpty!29145 () Bool)

(declare-fun tp!56073 () Bool)

(assert (=> mapNonEmpty!29145 (= mapRes!29145 (and tp!56073 e!502143))))

(declare-fun mapKey!29145 () (_ BitVec 32))

(declare-fun mapValue!29145 () ValueCell!8684)

(declare-fun mapRest!29145 () (Array (_ BitVec 32) ValueCell!8684))

(assert (=> mapNonEmpty!29145 (= (arr!25320 (_values!5409 thiss!1181)) (store mapRest!29145 mapKey!29145 mapValue!29145))))

(declare-fun b!897832 () Bool)

(declare-fun res!606852 () Bool)

(assert (=> b!897832 (=> res!606852 e!502150)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52679 (_ BitVec 32)) Bool)

(assert (=> b!897832 (= res!606852 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10169 thiss!1181) (mask!26114 thiss!1181))))))

(assert (= (and start!76726 res!606850) b!897827))

(assert (= (and b!897827 res!606849) b!897823))

(assert (= (and b!897823 (not res!606846)) b!897821))

(assert (= (and b!897823 (not res!606847)) b!897826))

(assert (= (and b!897826 (not res!606851)) b!897829))

(assert (= (and b!897829 (not res!606848)) b!897832))

(assert (= (and b!897832 (not res!606852)) b!897824))

(assert (= (and b!897824 (not res!606845)) b!897822))

(assert (= (and b!897822 (not res!606853)) b!897820))

(assert (= (and b!897828 condMapEmpty!29145) mapIsEmpty!29145))

(assert (= (and b!897828 (not condMapEmpty!29145)) mapNonEmpty!29145))

(assert (= (and mapNonEmpty!29145 ((_ is ValueCellFull!8684) mapValue!29145)) b!897825))

(assert (= (and b!897828 ((_ is ValueCellFull!8684) mapDefault!29145)) b!897830))

(assert (= b!897831 b!897828))

(assert (= start!76726 b!897831))

(declare-fun m!833867 () Bool)

(assert (=> b!897831 m!833867))

(declare-fun m!833869 () Bool)

(assert (=> b!897831 m!833869))

(declare-fun m!833871 () Bool)

(assert (=> start!76726 m!833871))

(declare-fun m!833873 () Bool)

(assert (=> b!897820 m!833873))

(assert (=> b!897820 m!833873))

(declare-fun m!833875 () Bool)

(assert (=> b!897820 m!833875))

(declare-fun m!833877 () Bool)

(assert (=> b!897832 m!833877))

(declare-fun m!833879 () Bool)

(assert (=> b!897824 m!833879))

(declare-fun m!833881 () Bool)

(assert (=> mapNonEmpty!29145 m!833881))

(declare-fun m!833883 () Bool)

(assert (=> b!897826 m!833883))

(declare-fun m!833885 () Bool)

(assert (=> b!897826 m!833885))

(declare-fun m!833887 () Bool)

(assert (=> b!897826 m!833887))

(declare-fun m!833889 () Bool)

(assert (=> b!897821 m!833889))

(declare-fun m!833891 () Bool)

(assert (=> b!897823 m!833891))

(declare-fun m!833893 () Bool)

(assert (=> b!897823 m!833893))

(check-sat (not b!897820) (not b!897832) b_and!26269 (not b!897831) (not b!897823) (not start!76726) (not b!897826) (not b!897824) (not b!897821) tp_is_empty!18331 (not mapNonEmpty!29145) (not b_next!16003))
(check-sat b_and!26269 (not b_next!16003))
(get-model)

(declare-fun d!110989 () Bool)

(assert (=> d!110989 (= (inRange!0 (index!38060 lt!405159) (mask!26114 thiss!1181)) (and (bvsge (index!38060 lt!405159) #b00000000000000000000000000000000) (bvslt (index!38060 lt!405159) (bvadd (mask!26114 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!897821 d!110989))

(declare-fun d!110991 () Bool)

(assert (=> d!110991 (= (array_inv!19924 (_keys!10169 thiss!1181)) (bvsge (size!25776 (_keys!10169 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!897831 d!110991))

(declare-fun d!110993 () Bool)

(assert (=> d!110993 (= (array_inv!19925 (_values!5409 thiss!1181)) (bvsge (size!25777 (_values!5409 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!897831 d!110993))

(declare-fun d!110995 () Bool)

(assert (=> d!110995 (= (validMask!0 (mask!26114 thiss!1181)) (and (or (= (mask!26114 thiss!1181) #b00000000000000000000000000000111) (= (mask!26114 thiss!1181) #b00000000000000000000000000001111) (= (mask!26114 thiss!1181) #b00000000000000000000000000011111) (= (mask!26114 thiss!1181) #b00000000000000000000000000111111) (= (mask!26114 thiss!1181) #b00000000000000000000000001111111) (= (mask!26114 thiss!1181) #b00000000000000000000000011111111) (= (mask!26114 thiss!1181) #b00000000000000000000000111111111) (= (mask!26114 thiss!1181) #b00000000000000000000001111111111) (= (mask!26114 thiss!1181) #b00000000000000000000011111111111) (= (mask!26114 thiss!1181) #b00000000000000000000111111111111) (= (mask!26114 thiss!1181) #b00000000000000000001111111111111) (= (mask!26114 thiss!1181) #b00000000000000000011111111111111) (= (mask!26114 thiss!1181) #b00000000000000000111111111111111) (= (mask!26114 thiss!1181) #b00000000000000001111111111111111) (= (mask!26114 thiss!1181) #b00000000000000011111111111111111) (= (mask!26114 thiss!1181) #b00000000000000111111111111111111) (= (mask!26114 thiss!1181) #b00000000000001111111111111111111) (= (mask!26114 thiss!1181) #b00000000000011111111111111111111) (= (mask!26114 thiss!1181) #b00000000000111111111111111111111) (= (mask!26114 thiss!1181) #b00000000001111111111111111111111) (= (mask!26114 thiss!1181) #b00000000011111111111111111111111) (= (mask!26114 thiss!1181) #b00000000111111111111111111111111) (= (mask!26114 thiss!1181) #b00000001111111111111111111111111) (= (mask!26114 thiss!1181) #b00000011111111111111111111111111) (= (mask!26114 thiss!1181) #b00000111111111111111111111111111) (= (mask!26114 thiss!1181) #b00001111111111111111111111111111) (= (mask!26114 thiss!1181) #b00011111111111111111111111111111) (= (mask!26114 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!26114 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!897826 d!110995))

(declare-fun d!110997 () Bool)

(declare-fun res!606912 () Bool)

(declare-fun e!502209 () Bool)

(assert (=> d!110997 (=> res!606912 e!502209)))

(assert (=> d!110997 (= res!606912 (= (select (arr!25319 (_keys!10169 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!110997 (= (arrayContainsKey!0 (_keys!10169 thiss!1181) key!785 #b00000000000000000000000000000000) e!502209)))

(declare-fun b!897915 () Bool)

(declare-fun e!502210 () Bool)

(assert (=> b!897915 (= e!502209 e!502210)))

(declare-fun res!606913 () Bool)

(assert (=> b!897915 (=> (not res!606913) (not e!502210))))

(assert (=> b!897915 (= res!606913 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25776 (_keys!10169 thiss!1181))))))

(declare-fun b!897916 () Bool)

(assert (=> b!897916 (= e!502210 (arrayContainsKey!0 (_keys!10169 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!110997 (not res!606912)) b!897915))

(assert (= (and b!897915 res!606913) b!897916))

(declare-fun m!833951 () Bool)

(assert (=> d!110997 m!833951))

(declare-fun m!833953 () Bool)

(assert (=> b!897916 m!833953))

(assert (=> b!897826 d!110997))

(declare-fun d!110999 () Bool)

(assert (=> d!110999 (arrayContainsKey!0 (_keys!10169 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!405182 () Unit!30464)

(declare-fun choose!13 (array!52679 (_ BitVec 64) (_ BitVec 32)) Unit!30464)

(assert (=> d!110999 (= lt!405182 (choose!13 (_keys!10169 thiss!1181) key!785 (index!38060 lt!405159)))))

(assert (=> d!110999 (bvsge (index!38060 lt!405159) #b00000000000000000000000000000000)))

(assert (=> d!110999 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10169 thiss!1181) key!785 (index!38060 lt!405159)) lt!405182)))

(declare-fun bs!25173 () Bool)

(assert (= bs!25173 d!110999))

(assert (=> bs!25173 m!833885))

(declare-fun m!833955 () Bool)

(assert (=> bs!25173 m!833955))

(assert (=> b!897826 d!110999))

(declare-fun d!111001 () Bool)

(assert (=> d!111001 (= (validKeyInArray!0 (select (arr!25319 (_keys!10169 thiss!1181)) (index!38060 lt!405159))) (and (not (= (select (arr!25319 (_keys!10169 thiss!1181)) (index!38060 lt!405159)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!25319 (_keys!10169 thiss!1181)) (index!38060 lt!405159)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!897820 d!111001))

(declare-fun b!897927 () Bool)

(declare-fun e!502219 () Bool)

(declare-fun call!39806 () Bool)

(assert (=> b!897927 (= e!502219 call!39806)))

(declare-fun b!897928 () Bool)

(declare-fun e!502220 () Bool)

(assert (=> b!897928 (= e!502220 e!502219)))

(declare-fun c!94836 () Bool)

(assert (=> b!897928 (= c!94836 (validKeyInArray!0 (select (arr!25319 (_keys!10169 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!897929 () Bool)

(declare-fun e!502221 () Bool)

(declare-fun contains!4377 (List!17841 (_ BitVec 64)) Bool)

(assert (=> b!897929 (= e!502221 (contains!4377 Nil!17838 (select (arr!25319 (_keys!10169 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!39803 () Bool)

(assert (=> bm!39803 (= call!39806 (arrayNoDuplicates!0 (_keys!10169 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!94836 (Cons!17837 (select (arr!25319 (_keys!10169 thiss!1181)) #b00000000000000000000000000000000) Nil!17838) Nil!17838)))))

(declare-fun d!111003 () Bool)

(declare-fun res!606920 () Bool)

(declare-fun e!502222 () Bool)

(assert (=> d!111003 (=> res!606920 e!502222)))

(assert (=> d!111003 (= res!606920 (bvsge #b00000000000000000000000000000000 (size!25776 (_keys!10169 thiss!1181))))))

(assert (=> d!111003 (= (arrayNoDuplicates!0 (_keys!10169 thiss!1181) #b00000000000000000000000000000000 Nil!17838) e!502222)))

(declare-fun b!897930 () Bool)

(assert (=> b!897930 (= e!502219 call!39806)))

(declare-fun b!897931 () Bool)

(assert (=> b!897931 (= e!502222 e!502220)))

(declare-fun res!606921 () Bool)

(assert (=> b!897931 (=> (not res!606921) (not e!502220))))

(assert (=> b!897931 (= res!606921 (not e!502221))))

(declare-fun res!606922 () Bool)

(assert (=> b!897931 (=> (not res!606922) (not e!502221))))

(assert (=> b!897931 (= res!606922 (validKeyInArray!0 (select (arr!25319 (_keys!10169 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (= (and d!111003 (not res!606920)) b!897931))

(assert (= (and b!897931 res!606922) b!897929))

(assert (= (and b!897931 res!606921) b!897928))

(assert (= (and b!897928 c!94836) b!897930))

(assert (= (and b!897928 (not c!94836)) b!897927))

(assert (= (or b!897930 b!897927) bm!39803))

(assert (=> b!897928 m!833951))

(assert (=> b!897928 m!833951))

(declare-fun m!833957 () Bool)

(assert (=> b!897928 m!833957))

(assert (=> b!897929 m!833951))

(assert (=> b!897929 m!833951))

(declare-fun m!833959 () Bool)

(assert (=> b!897929 m!833959))

(assert (=> bm!39803 m!833951))

(declare-fun m!833961 () Bool)

(assert (=> bm!39803 m!833961))

(assert (=> b!897931 m!833951))

(assert (=> b!897931 m!833951))

(assert (=> b!897931 m!833957))

(assert (=> b!897824 d!111003))

(declare-fun d!111005 () Bool)

(declare-fun e!502225 () Bool)

(assert (=> d!111005 e!502225))

(declare-fun res!606925 () Bool)

(assert (=> d!111005 (=> res!606925 e!502225)))

(declare-fun lt!405188 () SeekEntryResult!8922)

(assert (=> d!111005 (= res!606925 (not ((_ is Found!8922) lt!405188)))))

(assert (=> d!111005 (= lt!405188 (seekEntry!0 key!785 (_keys!10169 thiss!1181) (mask!26114 thiss!1181)))))

(declare-fun lt!405187 () Unit!30464)

(declare-fun choose!1496 (array!52679 array!52681 (_ BitVec 32) (_ BitVec 32) V!29407 V!29407 (_ BitVec 64)) Unit!30464)

(assert (=> d!111005 (= lt!405187 (choose!1496 (_keys!10169 thiss!1181) (_values!5409 thiss!1181) (mask!26114 thiss!1181) (extraKeys!5118 thiss!1181) (zeroValue!5222 thiss!1181) (minValue!5222 thiss!1181) key!785))))

(assert (=> d!111005 (validMask!0 (mask!26114 thiss!1181))))

(assert (=> d!111005 (= (lemmaSeekEntryGivesInRangeIndex!88 (_keys!10169 thiss!1181) (_values!5409 thiss!1181) (mask!26114 thiss!1181) (extraKeys!5118 thiss!1181) (zeroValue!5222 thiss!1181) (minValue!5222 thiss!1181) key!785) lt!405187)))

(declare-fun b!897934 () Bool)

(assert (=> b!897934 (= e!502225 (inRange!0 (index!38060 lt!405188) (mask!26114 thiss!1181)))))

(assert (= (and d!111005 (not res!606925)) b!897934))

(assert (=> d!111005 m!833893))

(declare-fun m!833963 () Bool)

(assert (=> d!111005 m!833963))

(assert (=> d!111005 m!833883))

(declare-fun m!833965 () Bool)

(assert (=> b!897934 m!833965))

(assert (=> b!897823 d!111005))

(declare-fun b!897947 () Bool)

(declare-fun e!502234 () SeekEntryResult!8922)

(declare-fun lt!405200 () SeekEntryResult!8922)

(assert (=> b!897947 (= e!502234 (MissingZero!8922 (index!38061 lt!405200)))))

(declare-fun b!897948 () Bool)

(declare-fun e!502232 () SeekEntryResult!8922)

(declare-fun e!502233 () SeekEntryResult!8922)

(assert (=> b!897948 (= e!502232 e!502233)))

(declare-fun lt!405197 () (_ BitVec 64))

(assert (=> b!897948 (= lt!405197 (select (arr!25319 (_keys!10169 thiss!1181)) (index!38061 lt!405200)))))

(declare-fun c!94844 () Bool)

(assert (=> b!897948 (= c!94844 (= lt!405197 key!785))))

(declare-fun b!897949 () Bool)

(assert (=> b!897949 (= e!502232 Undefined!8922)))

(declare-fun b!897951 () Bool)

(declare-fun c!94845 () Bool)

(assert (=> b!897951 (= c!94845 (= lt!405197 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!897951 (= e!502233 e!502234)))

(declare-fun b!897952 () Bool)

(declare-fun lt!405199 () SeekEntryResult!8922)

(assert (=> b!897952 (= e!502234 (ite ((_ is MissingVacant!8922) lt!405199) (MissingZero!8922 (index!38062 lt!405199)) lt!405199))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52679 (_ BitVec 32)) SeekEntryResult!8922)

(assert (=> b!897952 (= lt!405199 (seekKeyOrZeroReturnVacant!0 (x!76530 lt!405200) (index!38061 lt!405200) (index!38061 lt!405200) key!785 (_keys!10169 thiss!1181) (mask!26114 thiss!1181)))))

(declare-fun d!111007 () Bool)

(declare-fun lt!405198 () SeekEntryResult!8922)

(assert (=> d!111007 (and (or ((_ is MissingVacant!8922) lt!405198) (not ((_ is Found!8922) lt!405198)) (and (bvsge (index!38060 lt!405198) #b00000000000000000000000000000000) (bvslt (index!38060 lt!405198) (size!25776 (_keys!10169 thiss!1181))))) (not ((_ is MissingVacant!8922) lt!405198)) (or (not ((_ is Found!8922) lt!405198)) (= (select (arr!25319 (_keys!10169 thiss!1181)) (index!38060 lt!405198)) key!785)))))

(assert (=> d!111007 (= lt!405198 e!502232)))

(declare-fun c!94843 () Bool)

(assert (=> d!111007 (= c!94843 (and ((_ is Intermediate!8922) lt!405200) (undefined!9734 lt!405200)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52679 (_ BitVec 32)) SeekEntryResult!8922)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!111007 (= lt!405200 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26114 thiss!1181)) key!785 (_keys!10169 thiss!1181) (mask!26114 thiss!1181)))))

(assert (=> d!111007 (validMask!0 (mask!26114 thiss!1181))))

(assert (=> d!111007 (= (seekEntry!0 key!785 (_keys!10169 thiss!1181) (mask!26114 thiss!1181)) lt!405198)))

(declare-fun b!897950 () Bool)

(assert (=> b!897950 (= e!502233 (Found!8922 (index!38061 lt!405200)))))

(assert (= (and d!111007 c!94843) b!897949))

(assert (= (and d!111007 (not c!94843)) b!897948))

(assert (= (and b!897948 c!94844) b!897950))

(assert (= (and b!897948 (not c!94844)) b!897951))

(assert (= (and b!897951 c!94845) b!897947))

(assert (= (and b!897951 (not c!94845)) b!897952))

(declare-fun m!833967 () Bool)

(assert (=> b!897948 m!833967))

(declare-fun m!833969 () Bool)

(assert (=> b!897952 m!833969))

(declare-fun m!833971 () Bool)

(assert (=> d!111007 m!833971))

(declare-fun m!833973 () Bool)

(assert (=> d!111007 m!833973))

(assert (=> d!111007 m!833973))

(declare-fun m!833975 () Bool)

(assert (=> d!111007 m!833975))

(assert (=> d!111007 m!833883))

(assert (=> b!897823 d!111007))

(declare-fun d!111009 () Bool)

(declare-fun res!606930 () Bool)

(declare-fun e!502243 () Bool)

(assert (=> d!111009 (=> res!606930 e!502243)))

(assert (=> d!111009 (= res!606930 (bvsge #b00000000000000000000000000000000 (size!25776 (_keys!10169 thiss!1181))))))

(assert (=> d!111009 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10169 thiss!1181) (mask!26114 thiss!1181)) e!502243)))

(declare-fun b!897961 () Bool)

(declare-fun e!502242 () Bool)

(declare-fun call!39809 () Bool)

(assert (=> b!897961 (= e!502242 call!39809)))

(declare-fun b!897962 () Bool)

(declare-fun e!502241 () Bool)

(assert (=> b!897962 (= e!502241 e!502242)))

(declare-fun lt!405207 () (_ BitVec 64))

(assert (=> b!897962 (= lt!405207 (select (arr!25319 (_keys!10169 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!405209 () Unit!30464)

(assert (=> b!897962 (= lt!405209 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10169 thiss!1181) lt!405207 #b00000000000000000000000000000000))))

(assert (=> b!897962 (arrayContainsKey!0 (_keys!10169 thiss!1181) lt!405207 #b00000000000000000000000000000000)))

(declare-fun lt!405208 () Unit!30464)

(assert (=> b!897962 (= lt!405208 lt!405209)))

(declare-fun res!606931 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52679 (_ BitVec 32)) SeekEntryResult!8922)

(assert (=> b!897962 (= res!606931 (= (seekEntryOrOpen!0 (select (arr!25319 (_keys!10169 thiss!1181)) #b00000000000000000000000000000000) (_keys!10169 thiss!1181) (mask!26114 thiss!1181)) (Found!8922 #b00000000000000000000000000000000)))))

(assert (=> b!897962 (=> (not res!606931) (not e!502242))))

(declare-fun b!897963 () Bool)

(assert (=> b!897963 (= e!502241 call!39809)))

(declare-fun bm!39806 () Bool)

(assert (=> bm!39806 (= call!39809 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10169 thiss!1181) (mask!26114 thiss!1181)))))

(declare-fun b!897964 () Bool)

(assert (=> b!897964 (= e!502243 e!502241)))

(declare-fun c!94848 () Bool)

(assert (=> b!897964 (= c!94848 (validKeyInArray!0 (select (arr!25319 (_keys!10169 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (= (and d!111009 (not res!606930)) b!897964))

(assert (= (and b!897964 c!94848) b!897962))

(assert (= (and b!897964 (not c!94848)) b!897963))

(assert (= (and b!897962 res!606931) b!897961))

(assert (= (or b!897961 b!897963) bm!39806))

(assert (=> b!897962 m!833951))

(declare-fun m!833977 () Bool)

(assert (=> b!897962 m!833977))

(declare-fun m!833979 () Bool)

(assert (=> b!897962 m!833979))

(assert (=> b!897962 m!833951))

(declare-fun m!833981 () Bool)

(assert (=> b!897962 m!833981))

(declare-fun m!833983 () Bool)

(assert (=> bm!39806 m!833983))

(assert (=> b!897964 m!833951))

(assert (=> b!897964 m!833951))

(assert (=> b!897964 m!833957))

(assert (=> b!897832 d!111009))

(declare-fun d!111011 () Bool)

(declare-fun res!606938 () Bool)

(declare-fun e!502246 () Bool)

(assert (=> d!111011 (=> (not res!606938) (not e!502246))))

(declare-fun simpleValid!322 (LongMapFixedSize!4384) Bool)

(assert (=> d!111011 (= res!606938 (simpleValid!322 thiss!1181))))

(assert (=> d!111011 (= (valid!1695 thiss!1181) e!502246)))

(declare-fun b!897971 () Bool)

(declare-fun res!606939 () Bool)

(assert (=> b!897971 (=> (not res!606939) (not e!502246))))

(declare-fun arrayCountValidKeys!0 (array!52679 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!897971 (= res!606939 (= (arrayCountValidKeys!0 (_keys!10169 thiss!1181) #b00000000000000000000000000000000 (size!25776 (_keys!10169 thiss!1181))) (_size!2247 thiss!1181)))))

(declare-fun b!897972 () Bool)

(declare-fun res!606940 () Bool)

(assert (=> b!897972 (=> (not res!606940) (not e!502246))))

(assert (=> b!897972 (= res!606940 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10169 thiss!1181) (mask!26114 thiss!1181)))))

(declare-fun b!897973 () Bool)

(assert (=> b!897973 (= e!502246 (arrayNoDuplicates!0 (_keys!10169 thiss!1181) #b00000000000000000000000000000000 Nil!17838))))

(assert (= (and d!111011 res!606938) b!897971))

(assert (= (and b!897971 res!606939) b!897972))

(assert (= (and b!897972 res!606940) b!897973))

(declare-fun m!833985 () Bool)

(assert (=> d!111011 m!833985))

(declare-fun m!833987 () Bool)

(assert (=> b!897971 m!833987))

(assert (=> b!897972 m!833877))

(assert (=> b!897973 m!833879))

(assert (=> start!76726 d!111011))

(declare-fun mapIsEmpty!29154 () Bool)

(declare-fun mapRes!29154 () Bool)

(assert (=> mapIsEmpty!29154 mapRes!29154))

(declare-fun mapNonEmpty!29154 () Bool)

(declare-fun tp!56088 () Bool)

(declare-fun e!502252 () Bool)

(assert (=> mapNonEmpty!29154 (= mapRes!29154 (and tp!56088 e!502252))))

(declare-fun mapKey!29154 () (_ BitVec 32))

(declare-fun mapValue!29154 () ValueCell!8684)

(declare-fun mapRest!29154 () (Array (_ BitVec 32) ValueCell!8684))

(assert (=> mapNonEmpty!29154 (= mapRest!29145 (store mapRest!29154 mapKey!29154 mapValue!29154))))

(declare-fun condMapEmpty!29154 () Bool)

(declare-fun mapDefault!29154 () ValueCell!8684)

(assert (=> mapNonEmpty!29145 (= condMapEmpty!29154 (= mapRest!29145 ((as const (Array (_ BitVec 32) ValueCell!8684)) mapDefault!29154)))))

(declare-fun e!502251 () Bool)

(assert (=> mapNonEmpty!29145 (= tp!56073 (and e!502251 mapRes!29154))))

(declare-fun b!897981 () Bool)

(assert (=> b!897981 (= e!502251 tp_is_empty!18331)))

(declare-fun b!897980 () Bool)

(assert (=> b!897980 (= e!502252 tp_is_empty!18331)))

(assert (= (and mapNonEmpty!29145 condMapEmpty!29154) mapIsEmpty!29154))

(assert (= (and mapNonEmpty!29145 (not condMapEmpty!29154)) mapNonEmpty!29154))

(assert (= (and mapNonEmpty!29154 ((_ is ValueCellFull!8684) mapValue!29154)) b!897980))

(assert (= (and mapNonEmpty!29145 ((_ is ValueCellFull!8684) mapDefault!29154)) b!897981))

(declare-fun m!833989 () Bool)

(assert (=> mapNonEmpty!29154 m!833989))

(check-sat (not bm!39806) (not b!897916) (not bm!39803) (not mapNonEmpty!29154) (not b!897952) (not b!897962) (not b!897934) b_and!26269 (not d!111007) (not d!111011) (not b!897971) (not b!897931) (not b!897928) (not b!897964) (not d!110999) tp_is_empty!18331 (not d!111005) (not b!897973) (not b_next!16003) (not b!897972) (not b!897929))
(check-sat b_and!26269 (not b_next!16003))
