; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85586 () Bool)

(assert start!85586)

(declare-fun b!994056 () Bool)

(declare-fun res!664621 () Bool)

(declare-fun e!560945 () Bool)

(assert (=> b!994056 (=> (not res!664621) (not e!560945))))

(declare-datatypes ((List!20990 0))(
  ( (Nil!20987) (Cons!20986 (h!22148 (_ BitVec 64)) (t!29991 List!20990)) )
))
(declare-fun acc!919 () List!20990)

(declare-fun noDuplicate!1449 (List!20990) Bool)

(assert (=> b!994056 (= res!664621 (noDuplicate!1449 acc!919))))

(declare-fun b!994057 () Bool)

(declare-fun res!664623 () Bool)

(assert (=> b!994057 (=> (not res!664623) (not e!560945))))

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(declare-datatypes ((array!62865 0))(
  ( (array!62866 (arr!30275 (Array (_ BitVec 32) (_ BitVec 64))) (size!30772 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62865)

(assert (=> b!994057 (= res!664623 (and (bvslt from!3778 size!36) (bvsge (bvadd #b00000000000000000000000000000001 from!3778) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3778) (size!30772 a!4424))))))

(declare-fun b!994058 () Bool)

(declare-fun res!664622 () Bool)

(assert (=> b!994058 (=> (not res!664622) (not e!560945))))

(declare-fun contains!5851 (List!20990 (_ BitVec 64)) Bool)

(assert (=> b!994058 (= res!664622 (not (contains!5851 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!994059 () Bool)

(declare-fun arrayNoDuplicates!0 (array!62865 (_ BitVec 32) List!20990) Bool)

(assert (=> b!994059 (= e!560945 (not (arrayNoDuplicates!0 a!4424 from!3778 acc!919)))))

(assert (=> b!994059 (arrayNoDuplicates!0 a!4424 (bvadd #b00000000000000000000000000000001 from!3778) acc!919)))

(declare-datatypes ((Unit!32942 0))(
  ( (Unit!32943) )
))
(declare-fun lt!440668 () Unit!32942)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!62865 (_ BitVec 32) (_ BitVec 32) List!20990) Unit!32942)

(assert (=> b!994059 (= lt!440668 (lemmaArrayNoDuplicatesInAll0Array!0 a!4424 (bvadd #b00000000000000000000000000000001 from!3778) size!36 acc!919))))

(declare-fun res!664620 () Bool)

(assert (=> start!85586 (=> (not res!664620) (not e!560945))))

(assert (=> start!85586 (= res!664620 (and (= (size!30772 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62866 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30772 a!4424))))))

(assert (=> start!85586 e!560945))

(declare-fun array_inv!23399 (array!62865) Bool)

(assert (=> start!85586 (array_inv!23399 a!4424)))

(assert (=> start!85586 true))

(declare-fun b!994060 () Bool)

(declare-fun res!664619 () Bool)

(assert (=> b!994060 (=> (not res!664619) (not e!560945))))

(assert (=> b!994060 (= res!664619 (not (contains!5851 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!85586 res!664620) b!994058))

(assert (= (and b!994058 res!664622) b!994060))

(assert (= (and b!994060 res!664619) b!994056))

(assert (= (and b!994056 res!664621) b!994057))

(assert (= (and b!994057 res!664623) b!994059))

(declare-fun m!921663 () Bool)

(assert (=> b!994058 m!921663))

(declare-fun m!921665 () Bool)

(assert (=> b!994056 m!921665))

(declare-fun m!921667 () Bool)

(assert (=> b!994059 m!921667))

(declare-fun m!921669 () Bool)

(assert (=> b!994059 m!921669))

(declare-fun m!921671 () Bool)

(assert (=> b!994059 m!921671))

(declare-fun m!921673 () Bool)

(assert (=> b!994060 m!921673))

(declare-fun m!921675 () Bool)

(assert (=> start!85586 m!921675))

(check-sat (not b!994056) (not start!85586) (not b!994059) (not b!994060) (not b!994058))
(check-sat)
(get-model)

(declare-fun d!118577 () Bool)

(declare-fun res!664643 () Bool)

(declare-fun e!560957 () Bool)

(assert (=> d!118577 (=> res!664643 e!560957)))

(get-info :version)

(assert (=> d!118577 (= res!664643 ((_ is Nil!20987) acc!919))))

(assert (=> d!118577 (= (noDuplicate!1449 acc!919) e!560957)))

(declare-fun b!994080 () Bool)

(declare-fun e!560958 () Bool)

(assert (=> b!994080 (= e!560957 e!560958)))

(declare-fun res!664644 () Bool)

(assert (=> b!994080 (=> (not res!664644) (not e!560958))))

(assert (=> b!994080 (= res!664644 (not (contains!5851 (t!29991 acc!919) (h!22148 acc!919))))))

(declare-fun b!994081 () Bool)

(assert (=> b!994081 (= e!560958 (noDuplicate!1449 (t!29991 acc!919)))))

(assert (= (and d!118577 (not res!664643)) b!994080))

(assert (= (and b!994080 res!664644) b!994081))

(declare-fun m!921691 () Bool)

(assert (=> b!994080 m!921691))

(declare-fun m!921693 () Bool)

(assert (=> b!994081 m!921693))

(assert (=> b!994056 d!118577))

(declare-fun d!118579 () Bool)

(declare-fun lt!440674 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!475 (List!20990) (InoxSet (_ BitVec 64)))

(assert (=> d!118579 (= lt!440674 (select (content!475 acc!919) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!560964 () Bool)

(assert (=> d!118579 (= lt!440674 e!560964)))

(declare-fun res!664650 () Bool)

(assert (=> d!118579 (=> (not res!664650) (not e!560964))))

(assert (=> d!118579 (= res!664650 ((_ is Cons!20986) acc!919))))

(assert (=> d!118579 (= (contains!5851 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000) lt!440674)))

(declare-fun b!994086 () Bool)

(declare-fun e!560963 () Bool)

(assert (=> b!994086 (= e!560964 e!560963)))

(declare-fun res!664649 () Bool)

(assert (=> b!994086 (=> res!664649 e!560963)))

(assert (=> b!994086 (= res!664649 (= (h!22148 acc!919) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!994087 () Bool)

(assert (=> b!994087 (= e!560963 (contains!5851 (t!29991 acc!919) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!118579 res!664650) b!994086))

(assert (= (and b!994086 (not res!664649)) b!994087))

(declare-fun m!921695 () Bool)

(assert (=> d!118579 m!921695))

(declare-fun m!921697 () Bool)

(assert (=> d!118579 m!921697))

(declare-fun m!921699 () Bool)

(assert (=> b!994087 m!921699))

(assert (=> b!994060 d!118579))

(declare-fun b!994110 () Bool)

(declare-fun e!560986 () Bool)

(declare-fun call!42154 () Bool)

(assert (=> b!994110 (= e!560986 call!42154)))

(declare-fun b!994111 () Bool)

(declare-fun e!560985 () Bool)

(assert (=> b!994111 (= e!560985 e!560986)))

(declare-fun c!100858 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!994111 (= c!100858 (validKeyInArray!0 (select (arr!30275 a!4424) from!3778)))))

(declare-fun b!994112 () Bool)

(assert (=> b!994112 (= e!560986 call!42154)))

(declare-fun e!560988 () Bool)

(declare-fun b!994113 () Bool)

(assert (=> b!994113 (= e!560988 (contains!5851 acc!919 (select (arr!30275 a!4424) from!3778)))))

(declare-fun d!118581 () Bool)

(declare-fun res!664669 () Bool)

(declare-fun e!560987 () Bool)

(assert (=> d!118581 (=> res!664669 e!560987)))

(assert (=> d!118581 (= res!664669 (bvsge from!3778 (size!30772 a!4424)))))

(assert (=> d!118581 (= (arrayNoDuplicates!0 a!4424 from!3778 acc!919) e!560987)))

(declare-fun bm!42151 () Bool)

(assert (=> bm!42151 (= call!42154 (arrayNoDuplicates!0 a!4424 (bvadd from!3778 #b00000000000000000000000000000001) (ite c!100858 (Cons!20986 (select (arr!30275 a!4424) from!3778) acc!919) acc!919)))))

(declare-fun b!994114 () Bool)

(assert (=> b!994114 (= e!560987 e!560985)))

(declare-fun res!664670 () Bool)

(assert (=> b!994114 (=> (not res!664670) (not e!560985))))

(assert (=> b!994114 (= res!664670 (not e!560988))))

(declare-fun res!664671 () Bool)

(assert (=> b!994114 (=> (not res!664671) (not e!560988))))

(assert (=> b!994114 (= res!664671 (validKeyInArray!0 (select (arr!30275 a!4424) from!3778)))))

(assert (= (and d!118581 (not res!664669)) b!994114))

(assert (= (and b!994114 res!664671) b!994113))

(assert (= (and b!994114 res!664670) b!994111))

(assert (= (and b!994111 c!100858) b!994110))

(assert (= (and b!994111 (not c!100858)) b!994112))

(assert (= (or b!994110 b!994112) bm!42151))

(declare-fun m!921711 () Bool)

(assert (=> b!994111 m!921711))

(assert (=> b!994111 m!921711))

(declare-fun m!921713 () Bool)

(assert (=> b!994111 m!921713))

(assert (=> b!994113 m!921711))

(assert (=> b!994113 m!921711))

(declare-fun m!921715 () Bool)

(assert (=> b!994113 m!921715))

(assert (=> bm!42151 m!921711))

(declare-fun m!921717 () Bool)

(assert (=> bm!42151 m!921717))

(assert (=> b!994114 m!921711))

(assert (=> b!994114 m!921711))

(assert (=> b!994114 m!921713))

(assert (=> b!994059 d!118581))

(declare-fun b!994115 () Bool)

(declare-fun e!560990 () Bool)

(declare-fun call!42155 () Bool)

(assert (=> b!994115 (= e!560990 call!42155)))

(declare-fun b!994116 () Bool)

(declare-fun e!560989 () Bool)

(assert (=> b!994116 (= e!560989 e!560990)))

(declare-fun c!100859 () Bool)

(assert (=> b!994116 (= c!100859 (validKeyInArray!0 (select (arr!30275 a!4424) (bvadd #b00000000000000000000000000000001 from!3778))))))

(declare-fun b!994117 () Bool)

(assert (=> b!994117 (= e!560990 call!42155)))

(declare-fun e!560992 () Bool)

(declare-fun b!994118 () Bool)

(assert (=> b!994118 (= e!560992 (contains!5851 acc!919 (select (arr!30275 a!4424) (bvadd #b00000000000000000000000000000001 from!3778))))))

(declare-fun d!118591 () Bool)

(declare-fun res!664672 () Bool)

(declare-fun e!560991 () Bool)

(assert (=> d!118591 (=> res!664672 e!560991)))

(assert (=> d!118591 (= res!664672 (bvsge (bvadd #b00000000000000000000000000000001 from!3778) (size!30772 a!4424)))))

(assert (=> d!118591 (= (arrayNoDuplicates!0 a!4424 (bvadd #b00000000000000000000000000000001 from!3778) acc!919) e!560991)))

(declare-fun bm!42152 () Bool)

(assert (=> bm!42152 (= call!42155 (arrayNoDuplicates!0 a!4424 (bvadd #b00000000000000000000000000000001 from!3778 #b00000000000000000000000000000001) (ite c!100859 (Cons!20986 (select (arr!30275 a!4424) (bvadd #b00000000000000000000000000000001 from!3778)) acc!919) acc!919)))))

(declare-fun b!994119 () Bool)

(assert (=> b!994119 (= e!560991 e!560989)))

(declare-fun res!664673 () Bool)

(assert (=> b!994119 (=> (not res!664673) (not e!560989))))

(assert (=> b!994119 (= res!664673 (not e!560992))))

(declare-fun res!664674 () Bool)

(assert (=> b!994119 (=> (not res!664674) (not e!560992))))

(assert (=> b!994119 (= res!664674 (validKeyInArray!0 (select (arr!30275 a!4424) (bvadd #b00000000000000000000000000000001 from!3778))))))

(assert (= (and d!118591 (not res!664672)) b!994119))

(assert (= (and b!994119 res!664674) b!994118))

(assert (= (and b!994119 res!664673) b!994116))

(assert (= (and b!994116 c!100859) b!994115))

(assert (= (and b!994116 (not c!100859)) b!994117))

(assert (= (or b!994115 b!994117) bm!42152))

(declare-fun m!921719 () Bool)

(assert (=> b!994116 m!921719))

(assert (=> b!994116 m!921719))

(declare-fun m!921721 () Bool)

(assert (=> b!994116 m!921721))

(assert (=> b!994118 m!921719))

(assert (=> b!994118 m!921719))

(declare-fun m!921723 () Bool)

(assert (=> b!994118 m!921723))

(assert (=> bm!42152 m!921719))

(declare-fun m!921725 () Bool)

(assert (=> bm!42152 m!921725))

(assert (=> b!994119 m!921719))

(assert (=> b!994119 m!921719))

(assert (=> b!994119 m!921721))

(assert (=> b!994059 d!118591))

(declare-fun d!118593 () Bool)

(assert (=> d!118593 (arrayNoDuplicates!0 a!4424 (bvadd #b00000000000000000000000000000001 from!3778) acc!919)))

(declare-fun lt!440684 () Unit!32942)

(declare-fun choose!111 (array!62865 (_ BitVec 32) (_ BitVec 32) List!20990) Unit!32942)

(assert (=> d!118593 (= lt!440684 (choose!111 a!4424 (bvadd #b00000000000000000000000000000001 from!3778) size!36 acc!919))))

(assert (=> d!118593 (= (size!30772 a!4424) size!36)))

(assert (=> d!118593 (= (lemmaArrayNoDuplicatesInAll0Array!0 a!4424 (bvadd #b00000000000000000000000000000001 from!3778) size!36 acc!919) lt!440684)))

(declare-fun bs!28342 () Bool)

(assert (= bs!28342 d!118593))

(assert (=> bs!28342 m!921669))

(declare-fun m!921737 () Bool)

(assert (=> bs!28342 m!921737))

(assert (=> b!994059 d!118593))

(declare-fun d!118599 () Bool)

(assert (=> d!118599 (= (array_inv!23399 a!4424) (bvsge (size!30772 a!4424) #b00000000000000000000000000000000))))

(assert (=> start!85586 d!118599))

(declare-fun d!118601 () Bool)

(declare-fun lt!440685 () Bool)

(assert (=> d!118601 (= lt!440685 (select (content!475 acc!919) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!561010 () Bool)

(assert (=> d!118601 (= lt!440685 e!561010)))

(declare-fun res!664690 () Bool)

(assert (=> d!118601 (=> (not res!664690) (not e!561010))))

(assert (=> d!118601 (= res!664690 ((_ is Cons!20986) acc!919))))

(assert (=> d!118601 (= (contains!5851 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000) lt!440685)))

(declare-fun b!994138 () Bool)

(declare-fun e!561009 () Bool)

(assert (=> b!994138 (= e!561010 e!561009)))

(declare-fun res!664689 () Bool)

(assert (=> b!994138 (=> res!664689 e!561009)))

(assert (=> b!994138 (= res!664689 (= (h!22148 acc!919) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!994139 () Bool)

(assert (=> b!994139 (= e!561009 (contains!5851 (t!29991 acc!919) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!118601 res!664690) b!994138))

(assert (= (and b!994138 (not res!664689)) b!994139))

(assert (=> d!118601 m!921695))

(declare-fun m!921739 () Bool)

(assert (=> d!118601 m!921739))

(declare-fun m!921741 () Bool)

(assert (=> b!994139 m!921741))

(assert (=> b!994058 d!118601))

(check-sat (not d!118593) (not b!994087) (not d!118601) (not b!994118) (not d!118579) (not b!994116) (not b!994081) (not b!994113) (not bm!42152) (not b!994080) (not b!994119) (not bm!42151) (not b!994139) (not b!994111) (not b!994114))
(check-sat)
(get-model)

(declare-fun d!118619 () Bool)

(declare-fun c!100870 () Bool)

(assert (=> d!118619 (= c!100870 ((_ is Nil!20987) acc!919))))

(declare-fun e!561045 () (InoxSet (_ BitVec 64)))

(assert (=> d!118619 (= (content!475 acc!919) e!561045)))

(declare-fun b!994182 () Bool)

(assert (=> b!994182 (= e!561045 ((as const (Array (_ BitVec 64) Bool)) false))))

(declare-fun b!994183 () Bool)

(assert (=> b!994183 (= e!561045 ((_ map or) (store ((as const (Array (_ BitVec 64) Bool)) false) (h!22148 acc!919) true) (content!475 (t!29991 acc!919))))))

(assert (= (and d!118619 c!100870) b!994182))

(assert (= (and d!118619 (not c!100870)) b!994183))

(declare-fun m!921787 () Bool)

(assert (=> b!994183 m!921787))

(declare-fun m!921789 () Bool)

(assert (=> b!994183 m!921789))

(assert (=> d!118601 d!118619))

(declare-fun d!118621 () Bool)

(declare-fun res!664717 () Bool)

(declare-fun e!561046 () Bool)

(assert (=> d!118621 (=> res!664717 e!561046)))

(assert (=> d!118621 (= res!664717 ((_ is Nil!20987) (t!29991 acc!919)))))

(assert (=> d!118621 (= (noDuplicate!1449 (t!29991 acc!919)) e!561046)))

(declare-fun b!994184 () Bool)

(declare-fun e!561047 () Bool)

(assert (=> b!994184 (= e!561046 e!561047)))

(declare-fun res!664718 () Bool)

(assert (=> b!994184 (=> (not res!664718) (not e!561047))))

(assert (=> b!994184 (= res!664718 (not (contains!5851 (t!29991 (t!29991 acc!919)) (h!22148 (t!29991 acc!919)))))))

(declare-fun b!994185 () Bool)

(assert (=> b!994185 (= e!561047 (noDuplicate!1449 (t!29991 (t!29991 acc!919))))))

(assert (= (and d!118621 (not res!664717)) b!994184))

(assert (= (and b!994184 res!664718) b!994185))

(declare-fun m!921791 () Bool)

(assert (=> b!994184 m!921791))

(declare-fun m!921793 () Bool)

(assert (=> b!994185 m!921793))

(assert (=> b!994081 d!118621))

(declare-fun d!118623 () Bool)

(declare-fun lt!440693 () Bool)

(assert (=> d!118623 (= lt!440693 (select (content!475 (t!29991 acc!919)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!561049 () Bool)

(assert (=> d!118623 (= lt!440693 e!561049)))

(declare-fun res!664720 () Bool)

(assert (=> d!118623 (=> (not res!664720) (not e!561049))))

(assert (=> d!118623 (= res!664720 ((_ is Cons!20986) (t!29991 acc!919)))))

(assert (=> d!118623 (= (contains!5851 (t!29991 acc!919) #b1000000000000000000000000000000000000000000000000000000000000000) lt!440693)))

(declare-fun b!994186 () Bool)

(declare-fun e!561048 () Bool)

(assert (=> b!994186 (= e!561049 e!561048)))

(declare-fun res!664719 () Bool)

(assert (=> b!994186 (=> res!664719 e!561048)))

(assert (=> b!994186 (= res!664719 (= (h!22148 (t!29991 acc!919)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!994187 () Bool)

(assert (=> b!994187 (= e!561048 (contains!5851 (t!29991 (t!29991 acc!919)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!118623 res!664720) b!994186))

(assert (= (and b!994186 (not res!664719)) b!994187))

(assert (=> d!118623 m!921789))

(declare-fun m!921795 () Bool)

(assert (=> d!118623 m!921795))

(declare-fun m!921797 () Bool)

(assert (=> b!994187 m!921797))

(assert (=> b!994087 d!118623))

(declare-fun d!118625 () Bool)

(declare-fun lt!440694 () Bool)

(assert (=> d!118625 (= lt!440694 (select (content!475 (t!29991 acc!919)) (h!22148 acc!919)))))

(declare-fun e!561051 () Bool)

(assert (=> d!118625 (= lt!440694 e!561051)))

(declare-fun res!664722 () Bool)

(assert (=> d!118625 (=> (not res!664722) (not e!561051))))

(assert (=> d!118625 (= res!664722 ((_ is Cons!20986) (t!29991 acc!919)))))

(assert (=> d!118625 (= (contains!5851 (t!29991 acc!919) (h!22148 acc!919)) lt!440694)))

(declare-fun b!994188 () Bool)

(declare-fun e!561050 () Bool)

(assert (=> b!994188 (= e!561051 e!561050)))

(declare-fun res!664721 () Bool)

(assert (=> b!994188 (=> res!664721 e!561050)))

(assert (=> b!994188 (= res!664721 (= (h!22148 (t!29991 acc!919)) (h!22148 acc!919)))))

(declare-fun b!994189 () Bool)

(assert (=> b!994189 (= e!561050 (contains!5851 (t!29991 (t!29991 acc!919)) (h!22148 acc!919)))))

(assert (= (and d!118625 res!664722) b!994188))

(assert (= (and b!994188 (not res!664721)) b!994189))

(assert (=> d!118625 m!921789))

(declare-fun m!921799 () Bool)

(assert (=> d!118625 m!921799))

(declare-fun m!921801 () Bool)

(assert (=> b!994189 m!921801))

(assert (=> b!994080 d!118625))

(declare-fun d!118627 () Bool)

(declare-fun lt!440695 () Bool)

(assert (=> d!118627 (= lt!440695 (select (content!475 acc!919) (select (arr!30275 a!4424) (bvadd #b00000000000000000000000000000001 from!3778))))))

(declare-fun e!561053 () Bool)

(assert (=> d!118627 (= lt!440695 e!561053)))

(declare-fun res!664724 () Bool)

(assert (=> d!118627 (=> (not res!664724) (not e!561053))))

(assert (=> d!118627 (= res!664724 ((_ is Cons!20986) acc!919))))

(assert (=> d!118627 (= (contains!5851 acc!919 (select (arr!30275 a!4424) (bvadd #b00000000000000000000000000000001 from!3778))) lt!440695)))

(declare-fun b!994190 () Bool)

(declare-fun e!561052 () Bool)

(assert (=> b!994190 (= e!561053 e!561052)))

(declare-fun res!664723 () Bool)

(assert (=> b!994190 (=> res!664723 e!561052)))

(assert (=> b!994190 (= res!664723 (= (h!22148 acc!919) (select (arr!30275 a!4424) (bvadd #b00000000000000000000000000000001 from!3778))))))

(declare-fun b!994191 () Bool)

(assert (=> b!994191 (= e!561052 (contains!5851 (t!29991 acc!919) (select (arr!30275 a!4424) (bvadd #b00000000000000000000000000000001 from!3778))))))

(assert (= (and d!118627 res!664724) b!994190))

(assert (= (and b!994190 (not res!664723)) b!994191))

(assert (=> d!118627 m!921695))

(assert (=> d!118627 m!921719))

(declare-fun m!921803 () Bool)

(assert (=> d!118627 m!921803))

(assert (=> b!994191 m!921719))

(declare-fun m!921805 () Bool)

(assert (=> b!994191 m!921805))

(assert (=> b!994118 d!118627))

(declare-fun d!118629 () Bool)

(assert (=> d!118629 (= (validKeyInArray!0 (select (arr!30275 a!4424) from!3778)) (and (not (= (select (arr!30275 a!4424) from!3778) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30275 a!4424) from!3778) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!994111 d!118629))

(declare-fun d!118631 () Bool)

(assert (=> d!118631 (= (validKeyInArray!0 (select (arr!30275 a!4424) (bvadd #b00000000000000000000000000000001 from!3778))) (and (not (= (select (arr!30275 a!4424) (bvadd #b00000000000000000000000000000001 from!3778)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30275 a!4424) (bvadd #b00000000000000000000000000000001 from!3778)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!994116 d!118631))

(assert (=> b!994114 d!118629))

(assert (=> b!994119 d!118631))

(declare-fun b!994192 () Bool)

(declare-fun e!561055 () Bool)

(declare-fun call!42164 () Bool)

(assert (=> b!994192 (= e!561055 call!42164)))

(declare-fun b!994193 () Bool)

(declare-fun e!561054 () Bool)

(assert (=> b!994193 (= e!561054 e!561055)))

(declare-fun c!100871 () Bool)

(assert (=> b!994193 (= c!100871 (validKeyInArray!0 (select (arr!30275 a!4424) (bvadd from!3778 #b00000000000000000000000000000001))))))

(declare-fun b!994194 () Bool)

(assert (=> b!994194 (= e!561055 call!42164)))

(declare-fun e!561057 () Bool)

(declare-fun b!994195 () Bool)

(assert (=> b!994195 (= e!561057 (contains!5851 (ite c!100858 (Cons!20986 (select (arr!30275 a!4424) from!3778) acc!919) acc!919) (select (arr!30275 a!4424) (bvadd from!3778 #b00000000000000000000000000000001))))))

(declare-fun d!118633 () Bool)

(declare-fun res!664725 () Bool)

(declare-fun e!561056 () Bool)

(assert (=> d!118633 (=> res!664725 e!561056)))

(assert (=> d!118633 (= res!664725 (bvsge (bvadd from!3778 #b00000000000000000000000000000001) (size!30772 a!4424)))))

(assert (=> d!118633 (= (arrayNoDuplicates!0 a!4424 (bvadd from!3778 #b00000000000000000000000000000001) (ite c!100858 (Cons!20986 (select (arr!30275 a!4424) from!3778) acc!919) acc!919)) e!561056)))

(declare-fun bm!42161 () Bool)

(assert (=> bm!42161 (= call!42164 (arrayNoDuplicates!0 a!4424 (bvadd from!3778 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!100871 (Cons!20986 (select (arr!30275 a!4424) (bvadd from!3778 #b00000000000000000000000000000001)) (ite c!100858 (Cons!20986 (select (arr!30275 a!4424) from!3778) acc!919) acc!919)) (ite c!100858 (Cons!20986 (select (arr!30275 a!4424) from!3778) acc!919) acc!919))))))

(declare-fun b!994196 () Bool)

(assert (=> b!994196 (= e!561056 e!561054)))

(declare-fun res!664726 () Bool)

(assert (=> b!994196 (=> (not res!664726) (not e!561054))))

(assert (=> b!994196 (= res!664726 (not e!561057))))

(declare-fun res!664727 () Bool)

(assert (=> b!994196 (=> (not res!664727) (not e!561057))))

(assert (=> b!994196 (= res!664727 (validKeyInArray!0 (select (arr!30275 a!4424) (bvadd from!3778 #b00000000000000000000000000000001))))))

(assert (= (and d!118633 (not res!664725)) b!994196))

(assert (= (and b!994196 res!664727) b!994195))

(assert (= (and b!994196 res!664726) b!994193))

(assert (= (and b!994193 c!100871) b!994192))

(assert (= (and b!994193 (not c!100871)) b!994194))

(assert (= (or b!994192 b!994194) bm!42161))

(declare-fun m!921807 () Bool)

(assert (=> b!994193 m!921807))

(assert (=> b!994193 m!921807))

(declare-fun m!921809 () Bool)

(assert (=> b!994193 m!921809))

(assert (=> b!994195 m!921807))

(assert (=> b!994195 m!921807))

(declare-fun m!921811 () Bool)

(assert (=> b!994195 m!921811))

(assert (=> bm!42161 m!921807))

(declare-fun m!921813 () Bool)

(assert (=> bm!42161 m!921813))

(assert (=> b!994196 m!921807))

(assert (=> b!994196 m!921807))

(assert (=> b!994196 m!921809))

(assert (=> bm!42151 d!118633))

(assert (=> d!118593 d!118591))

(declare-fun d!118635 () Bool)

(assert (=> d!118635 (arrayNoDuplicates!0 a!4424 (bvadd #b00000000000000000000000000000001 from!3778) acc!919)))

(assert (=> d!118635 true))

(declare-fun res!664730 () Unit!32942)

(assert (=> d!118635 (= (choose!111 a!4424 (bvadd #b00000000000000000000000000000001 from!3778) size!36 acc!919) res!664730)))

(declare-fun bs!28345 () Bool)

(assert (= bs!28345 d!118635))

(assert (=> bs!28345 m!921669))

(assert (=> d!118593 d!118635))

(declare-fun d!118637 () Bool)

(declare-fun lt!440696 () Bool)

(assert (=> d!118637 (= lt!440696 (select (content!475 (t!29991 acc!919)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!561059 () Bool)

(assert (=> d!118637 (= lt!440696 e!561059)))

(declare-fun res!664732 () Bool)

(assert (=> d!118637 (=> (not res!664732) (not e!561059))))

(assert (=> d!118637 (= res!664732 ((_ is Cons!20986) (t!29991 acc!919)))))

(assert (=> d!118637 (= (contains!5851 (t!29991 acc!919) #b0000000000000000000000000000000000000000000000000000000000000000) lt!440696)))

(declare-fun b!994197 () Bool)

(declare-fun e!561058 () Bool)

(assert (=> b!994197 (= e!561059 e!561058)))

(declare-fun res!664731 () Bool)

(assert (=> b!994197 (=> res!664731 e!561058)))

(assert (=> b!994197 (= res!664731 (= (h!22148 (t!29991 acc!919)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!994198 () Bool)

(assert (=> b!994198 (= e!561058 (contains!5851 (t!29991 (t!29991 acc!919)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!118637 res!664732) b!994197))

(assert (= (and b!994197 (not res!664731)) b!994198))

(assert (=> d!118637 m!921789))

(declare-fun m!921815 () Bool)

(assert (=> d!118637 m!921815))

(declare-fun m!921817 () Bool)

(assert (=> b!994198 m!921817))

(assert (=> b!994139 d!118637))

(assert (=> d!118579 d!118619))

(declare-fun b!994199 () Bool)

(declare-fun e!561061 () Bool)

(declare-fun call!42165 () Bool)

(assert (=> b!994199 (= e!561061 call!42165)))

(declare-fun b!994200 () Bool)

(declare-fun e!561060 () Bool)

(assert (=> b!994200 (= e!561060 e!561061)))

(declare-fun c!100872 () Bool)

(assert (=> b!994200 (= c!100872 (validKeyInArray!0 (select (arr!30275 a!4424) (bvadd #b00000000000000000000000000000001 from!3778 #b00000000000000000000000000000001))))))

(declare-fun b!994201 () Bool)

(assert (=> b!994201 (= e!561061 call!42165)))

(declare-fun e!561063 () Bool)

(declare-fun b!994202 () Bool)

(assert (=> b!994202 (= e!561063 (contains!5851 (ite c!100859 (Cons!20986 (select (arr!30275 a!4424) (bvadd #b00000000000000000000000000000001 from!3778)) acc!919) acc!919) (select (arr!30275 a!4424) (bvadd #b00000000000000000000000000000001 from!3778 #b00000000000000000000000000000001))))))

(declare-fun d!118639 () Bool)

(declare-fun res!664733 () Bool)

(declare-fun e!561062 () Bool)

(assert (=> d!118639 (=> res!664733 e!561062)))

(assert (=> d!118639 (= res!664733 (bvsge (bvadd #b00000000000000000000000000000001 from!3778 #b00000000000000000000000000000001) (size!30772 a!4424)))))

(assert (=> d!118639 (= (arrayNoDuplicates!0 a!4424 (bvadd #b00000000000000000000000000000001 from!3778 #b00000000000000000000000000000001) (ite c!100859 (Cons!20986 (select (arr!30275 a!4424) (bvadd #b00000000000000000000000000000001 from!3778)) acc!919) acc!919)) e!561062)))

(declare-fun bm!42162 () Bool)

(assert (=> bm!42162 (= call!42165 (arrayNoDuplicates!0 a!4424 (bvadd #b00000000000000000000000000000001 from!3778 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!100872 (Cons!20986 (select (arr!30275 a!4424) (bvadd #b00000000000000000000000000000001 from!3778 #b00000000000000000000000000000001)) (ite c!100859 (Cons!20986 (select (arr!30275 a!4424) (bvadd #b00000000000000000000000000000001 from!3778)) acc!919) acc!919)) (ite c!100859 (Cons!20986 (select (arr!30275 a!4424) (bvadd #b00000000000000000000000000000001 from!3778)) acc!919) acc!919))))))

(declare-fun b!994203 () Bool)

(assert (=> b!994203 (= e!561062 e!561060)))

(declare-fun res!664734 () Bool)

(assert (=> b!994203 (=> (not res!664734) (not e!561060))))

(assert (=> b!994203 (= res!664734 (not e!561063))))

(declare-fun res!664735 () Bool)

(assert (=> b!994203 (=> (not res!664735) (not e!561063))))

(assert (=> b!994203 (= res!664735 (validKeyInArray!0 (select (arr!30275 a!4424) (bvadd #b00000000000000000000000000000001 from!3778 #b00000000000000000000000000000001))))))

(assert (= (and d!118639 (not res!664733)) b!994203))

(assert (= (and b!994203 res!664735) b!994202))

(assert (= (and b!994203 res!664734) b!994200))

(assert (= (and b!994200 c!100872) b!994199))

(assert (= (and b!994200 (not c!100872)) b!994201))

(assert (= (or b!994199 b!994201) bm!42162))

(declare-fun m!921819 () Bool)

(assert (=> b!994200 m!921819))

(assert (=> b!994200 m!921819))

(declare-fun m!921821 () Bool)

(assert (=> b!994200 m!921821))

(assert (=> b!994202 m!921819))

(assert (=> b!994202 m!921819))

(declare-fun m!921823 () Bool)

(assert (=> b!994202 m!921823))

(assert (=> bm!42162 m!921819))

(declare-fun m!921825 () Bool)

(assert (=> bm!42162 m!921825))

(assert (=> b!994203 m!921819))

(assert (=> b!994203 m!921819))

(assert (=> b!994203 m!921821))

(assert (=> bm!42152 d!118639))

(declare-fun lt!440697 () Bool)

(declare-fun d!118641 () Bool)

(assert (=> d!118641 (= lt!440697 (select (content!475 acc!919) (select (arr!30275 a!4424) from!3778)))))

(declare-fun e!561065 () Bool)

(assert (=> d!118641 (= lt!440697 e!561065)))

(declare-fun res!664737 () Bool)

(assert (=> d!118641 (=> (not res!664737) (not e!561065))))

(assert (=> d!118641 (= res!664737 ((_ is Cons!20986) acc!919))))

(assert (=> d!118641 (= (contains!5851 acc!919 (select (arr!30275 a!4424) from!3778)) lt!440697)))

(declare-fun b!994204 () Bool)

(declare-fun e!561064 () Bool)

(assert (=> b!994204 (= e!561065 e!561064)))

(declare-fun res!664736 () Bool)

(assert (=> b!994204 (=> res!664736 e!561064)))

(assert (=> b!994204 (= res!664736 (= (h!22148 acc!919) (select (arr!30275 a!4424) from!3778)))))

(declare-fun b!994205 () Bool)

(assert (=> b!994205 (= e!561064 (contains!5851 (t!29991 acc!919) (select (arr!30275 a!4424) from!3778)))))

(assert (= (and d!118641 res!664737) b!994204))

(assert (= (and b!994204 (not res!664736)) b!994205))

(assert (=> d!118641 m!921695))

(assert (=> d!118641 m!921711))

(declare-fun m!921827 () Bool)

(assert (=> d!118641 m!921827))

(assert (=> b!994205 m!921711))

(declare-fun m!921829 () Bool)

(assert (=> b!994205 m!921829))

(assert (=> b!994113 d!118641))

(check-sat (not b!994189) (not b!994205) (not b!994196) (not d!118625) (not b!994198) (not b!994193) (not b!994195) (not b!994202) (not d!118635) (not d!118637) (not b!994191) (not b!994185) (not d!118623) (not b!994200) (not b!994184) (not d!118627) (not bm!42161) (not bm!42162) (not b!994203) (not b!994187) (not d!118641) (not b!994183))
(check-sat)
