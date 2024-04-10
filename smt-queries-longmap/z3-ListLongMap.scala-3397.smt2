; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46916 () Bool)

(assert start!46916)

(declare-fun b!517579 () Bool)

(declare-fun res!316785 () Bool)

(declare-fun e!302030 () Bool)

(assert (=> b!517579 (=> (not res!316785) (not e!302030))))

(declare-datatypes ((array!33114 0))(
  ( (array!33115 (arr!15922 (Array (_ BitVec 32) (_ BitVec 64))) (size!16286 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33114)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33114 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!517579 (= res!316785 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!517580 () Bool)

(declare-fun e!302027 () Bool)

(declare-fun e!302031 () Bool)

(assert (=> b!517580 (= e!302027 (not e!302031))))

(declare-fun res!316781 () Bool)

(assert (=> b!517580 (=> res!316781 e!302031)))

(declare-fun lt!236929 () (_ BitVec 32))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4389 0))(
  ( (MissingZero!4389 (index!19744 (_ BitVec 32))) (Found!4389 (index!19745 (_ BitVec 32))) (Intermediate!4389 (undefined!5201 Bool) (index!19746 (_ BitVec 32)) (x!48708 (_ BitVec 32))) (Undefined!4389) (MissingVacant!4389 (index!19747 (_ BitVec 32))) )
))
(declare-fun lt!236932 () SeekEntryResult!4389)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33114 (_ BitVec 32)) SeekEntryResult!4389)

(assert (=> b!517580 (= res!316781 (= lt!236932 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236929 (select (store (arr!15922 a!3235) i!1204 k0!2280) j!176) (array!33115 (store (arr!15922 a!3235) i!1204 k0!2280) (size!16286 a!3235)) mask!3524)))))

(declare-fun lt!236931 () (_ BitVec 32))

(assert (=> b!517580 (= lt!236932 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236931 (select (arr!15922 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!517580 (= lt!236929 (toIndex!0 (select (store (arr!15922 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!517580 (= lt!236931 (toIndex!0 (select (arr!15922 a!3235) j!176) mask!3524))))

(declare-fun e!302029 () Bool)

(assert (=> b!517580 e!302029))

(declare-fun res!316787 () Bool)

(assert (=> b!517580 (=> (not res!316787) (not e!302029))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33114 (_ BitVec 32)) Bool)

(assert (=> b!517580 (= res!316787 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16036 0))(
  ( (Unit!16037) )
))
(declare-fun lt!236930 () Unit!16036)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33114 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16036)

(assert (=> b!517580 (= lt!236930 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!517581 () Bool)

(assert (=> b!517581 (= e!302030 e!302027)))

(declare-fun res!316784 () Bool)

(assert (=> b!517581 (=> (not res!316784) (not e!302027))))

(declare-fun lt!236928 () SeekEntryResult!4389)

(assert (=> b!517581 (= res!316784 (or (= lt!236928 (MissingZero!4389 i!1204)) (= lt!236928 (MissingVacant!4389 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33114 (_ BitVec 32)) SeekEntryResult!4389)

(assert (=> b!517581 (= lt!236928 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!517582 () Bool)

(declare-fun res!316780 () Bool)

(assert (=> b!517582 (=> (not res!316780) (not e!302027))))

(declare-datatypes ((List!10080 0))(
  ( (Nil!10077) (Cons!10076 (h!10980 (_ BitVec 64)) (t!16308 List!10080)) )
))
(declare-fun arrayNoDuplicates!0 (array!33114 (_ BitVec 32) List!10080) Bool)

(assert (=> b!517582 (= res!316780 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10077))))

(declare-fun res!316782 () Bool)

(assert (=> start!46916 (=> (not res!316782) (not e!302030))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46916 (= res!316782 (validMask!0 mask!3524))))

(assert (=> start!46916 e!302030))

(assert (=> start!46916 true))

(declare-fun array_inv!11718 (array!33114) Bool)

(assert (=> start!46916 (array_inv!11718 a!3235)))

(declare-fun b!517583 () Bool)

(assert (=> b!517583 (= e!302031 (or (not (= (select (arr!15922 a!3235) (index!19746 lt!236932)) (select (arr!15922 a!3235) j!176))) (bvsgt (x!48708 lt!236932) #b01111111111111111111111111111110) (bvsgt #b00000000000000000000000000000000 (x!48708 lt!236932)) (bvslt lt!236931 #b00000000000000000000000000000000) (bvsge lt!236931 (size!16286 a!3235)) (and (bvsge (index!19746 lt!236932) #b00000000000000000000000000000000) (bvslt (index!19746 lt!236932) (size!16286 a!3235)))))))

(assert (=> b!517583 (and (bvslt (x!48708 lt!236932) #b01111111111111111111111111111110) (or (= (select (arr!15922 a!3235) (index!19746 lt!236932)) (select (arr!15922 a!3235) j!176)) (= (select (arr!15922 a!3235) (index!19746 lt!236932)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15922 a!3235) (index!19746 lt!236932)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!517584 () Bool)

(declare-fun res!316783 () Bool)

(assert (=> b!517584 (=> (not res!316783) (not e!302027))))

(assert (=> b!517584 (= res!316783 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!517585 () Bool)

(declare-fun res!316778 () Bool)

(assert (=> b!517585 (=> res!316778 e!302031)))

(get-info :version)

(assert (=> b!517585 (= res!316778 (or (undefined!5201 lt!236932) (not ((_ is Intermediate!4389) lt!236932))))))

(declare-fun b!517586 () Bool)

(declare-fun res!316786 () Bool)

(assert (=> b!517586 (=> (not res!316786) (not e!302030))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!517586 (= res!316786 (validKeyInArray!0 (select (arr!15922 a!3235) j!176)))))

(declare-fun b!517587 () Bool)

(assert (=> b!517587 (= e!302029 (= (seekEntryOrOpen!0 (select (arr!15922 a!3235) j!176) a!3235 mask!3524) (Found!4389 j!176)))))

(declare-fun b!517588 () Bool)

(declare-fun res!316779 () Bool)

(assert (=> b!517588 (=> (not res!316779) (not e!302030))))

(assert (=> b!517588 (= res!316779 (and (= (size!16286 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16286 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16286 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!517589 () Bool)

(declare-fun res!316777 () Bool)

(assert (=> b!517589 (=> (not res!316777) (not e!302030))))

(assert (=> b!517589 (= res!316777 (validKeyInArray!0 k0!2280))))

(assert (= (and start!46916 res!316782) b!517588))

(assert (= (and b!517588 res!316779) b!517586))

(assert (= (and b!517586 res!316786) b!517589))

(assert (= (and b!517589 res!316777) b!517579))

(assert (= (and b!517579 res!316785) b!517581))

(assert (= (and b!517581 res!316784) b!517584))

(assert (= (and b!517584 res!316783) b!517582))

(assert (= (and b!517582 res!316780) b!517580))

(assert (= (and b!517580 res!316787) b!517587))

(assert (= (and b!517580 (not res!316781)) b!517585))

(assert (= (and b!517585 (not res!316778)) b!517583))

(declare-fun m!498977 () Bool)

(assert (=> b!517580 m!498977))

(declare-fun m!498979 () Bool)

(assert (=> b!517580 m!498979))

(declare-fun m!498981 () Bool)

(assert (=> b!517580 m!498981))

(assert (=> b!517580 m!498979))

(declare-fun m!498983 () Bool)

(assert (=> b!517580 m!498983))

(declare-fun m!498985 () Bool)

(assert (=> b!517580 m!498985))

(declare-fun m!498987 () Bool)

(assert (=> b!517580 m!498987))

(declare-fun m!498989 () Bool)

(assert (=> b!517580 m!498989))

(assert (=> b!517580 m!498979))

(declare-fun m!498991 () Bool)

(assert (=> b!517580 m!498991))

(assert (=> b!517580 m!498985))

(declare-fun m!498993 () Bool)

(assert (=> b!517580 m!498993))

(assert (=> b!517580 m!498985))

(assert (=> b!517586 m!498979))

(assert (=> b!517586 m!498979))

(declare-fun m!498995 () Bool)

(assert (=> b!517586 m!498995))

(declare-fun m!498997 () Bool)

(assert (=> b!517582 m!498997))

(declare-fun m!498999 () Bool)

(assert (=> start!46916 m!498999))

(declare-fun m!499001 () Bool)

(assert (=> start!46916 m!499001))

(assert (=> b!517587 m!498979))

(assert (=> b!517587 m!498979))

(declare-fun m!499003 () Bool)

(assert (=> b!517587 m!499003))

(declare-fun m!499005 () Bool)

(assert (=> b!517589 m!499005))

(declare-fun m!499007 () Bool)

(assert (=> b!517583 m!499007))

(assert (=> b!517583 m!498979))

(declare-fun m!499009 () Bool)

(assert (=> b!517579 m!499009))

(declare-fun m!499011 () Bool)

(assert (=> b!517584 m!499011))

(declare-fun m!499013 () Bool)

(assert (=> b!517581 m!499013))

(check-sat (not b!517586) (not b!517581) (not b!517579) (not b!517584) (not b!517580) (not b!517582) (not start!46916) (not b!517587) (not b!517589))
(check-sat)
(get-model)

(declare-fun b!517635 () Bool)

(declare-fun e!302055 () SeekEntryResult!4389)

(declare-fun lt!236956 () SeekEntryResult!4389)

(assert (=> b!517635 (= e!302055 (MissingZero!4389 (index!19746 lt!236956)))))

(declare-fun b!517636 () Bool)

(declare-fun e!302054 () SeekEntryResult!4389)

(assert (=> b!517636 (= e!302054 Undefined!4389)))

(declare-fun b!517637 () Bool)

(declare-fun e!302053 () SeekEntryResult!4389)

(assert (=> b!517637 (= e!302054 e!302053)))

(declare-fun lt!236955 () (_ BitVec 64))

(assert (=> b!517637 (= lt!236955 (select (arr!15922 a!3235) (index!19746 lt!236956)))))

(declare-fun c!60700 () Bool)

(assert (=> b!517637 (= c!60700 (= lt!236955 (select (arr!15922 a!3235) j!176)))))

(declare-fun b!517638 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33114 (_ BitVec 32)) SeekEntryResult!4389)

(assert (=> b!517638 (= e!302055 (seekKeyOrZeroReturnVacant!0 (x!48708 lt!236956) (index!19746 lt!236956) (index!19746 lt!236956) (select (arr!15922 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!517639 () Bool)

(assert (=> b!517639 (= e!302053 (Found!4389 (index!19746 lt!236956)))))

(declare-fun d!79761 () Bool)

(declare-fun lt!236954 () SeekEntryResult!4389)

(assert (=> d!79761 (and (or ((_ is Undefined!4389) lt!236954) (not ((_ is Found!4389) lt!236954)) (and (bvsge (index!19745 lt!236954) #b00000000000000000000000000000000) (bvslt (index!19745 lt!236954) (size!16286 a!3235)))) (or ((_ is Undefined!4389) lt!236954) ((_ is Found!4389) lt!236954) (not ((_ is MissingZero!4389) lt!236954)) (and (bvsge (index!19744 lt!236954) #b00000000000000000000000000000000) (bvslt (index!19744 lt!236954) (size!16286 a!3235)))) (or ((_ is Undefined!4389) lt!236954) ((_ is Found!4389) lt!236954) ((_ is MissingZero!4389) lt!236954) (not ((_ is MissingVacant!4389) lt!236954)) (and (bvsge (index!19747 lt!236954) #b00000000000000000000000000000000) (bvslt (index!19747 lt!236954) (size!16286 a!3235)))) (or ((_ is Undefined!4389) lt!236954) (ite ((_ is Found!4389) lt!236954) (= (select (arr!15922 a!3235) (index!19745 lt!236954)) (select (arr!15922 a!3235) j!176)) (ite ((_ is MissingZero!4389) lt!236954) (= (select (arr!15922 a!3235) (index!19744 lt!236954)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4389) lt!236954) (= (select (arr!15922 a!3235) (index!19747 lt!236954)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!79761 (= lt!236954 e!302054)))

(declare-fun c!60699 () Bool)

(assert (=> d!79761 (= c!60699 (and ((_ is Intermediate!4389) lt!236956) (undefined!5201 lt!236956)))))

(assert (=> d!79761 (= lt!236956 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15922 a!3235) j!176) mask!3524) (select (arr!15922 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!79761 (validMask!0 mask!3524)))

(assert (=> d!79761 (= (seekEntryOrOpen!0 (select (arr!15922 a!3235) j!176) a!3235 mask!3524) lt!236954)))

(declare-fun b!517640 () Bool)

(declare-fun c!60701 () Bool)

(assert (=> b!517640 (= c!60701 (= lt!236955 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!517640 (= e!302053 e!302055)))

(assert (= (and d!79761 c!60699) b!517636))

(assert (= (and d!79761 (not c!60699)) b!517637))

(assert (= (and b!517637 c!60700) b!517639))

(assert (= (and b!517637 (not c!60700)) b!517640))

(assert (= (and b!517640 c!60701) b!517635))

(assert (= (and b!517640 (not c!60701)) b!517638))

(declare-fun m!499053 () Bool)

(assert (=> b!517637 m!499053))

(assert (=> b!517638 m!498979))

(declare-fun m!499055 () Bool)

(assert (=> b!517638 m!499055))

(declare-fun m!499057 () Bool)

(assert (=> d!79761 m!499057))

(declare-fun m!499059 () Bool)

(assert (=> d!79761 m!499059))

(assert (=> d!79761 m!498981))

(assert (=> d!79761 m!498979))

(declare-fun m!499061 () Bool)

(assert (=> d!79761 m!499061))

(declare-fun m!499063 () Bool)

(assert (=> d!79761 m!499063))

(assert (=> d!79761 m!498999))

(assert (=> d!79761 m!498979))

(assert (=> d!79761 m!498981))

(assert (=> b!517587 d!79761))

(declare-fun bm!31682 () Bool)

(declare-fun call!31685 () Bool)

(declare-fun c!60704 () Bool)

(assert (=> bm!31682 (= call!31685 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!60704 (Cons!10076 (select (arr!15922 a!3235) #b00000000000000000000000000000000) Nil!10077) Nil!10077)))))

(declare-fun b!517652 () Bool)

(declare-fun e!302066 () Bool)

(declare-fun e!302067 () Bool)

(assert (=> b!517652 (= e!302066 e!302067)))

(declare-fun res!316827 () Bool)

(assert (=> b!517652 (=> (not res!316827) (not e!302067))))

(declare-fun e!302065 () Bool)

(assert (=> b!517652 (= res!316827 (not e!302065))))

(declare-fun res!316828 () Bool)

(assert (=> b!517652 (=> (not res!316828) (not e!302065))))

(assert (=> b!517652 (= res!316828 (validKeyInArray!0 (select (arr!15922 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!517653 () Bool)

(declare-fun e!302064 () Bool)

(assert (=> b!517653 (= e!302064 call!31685)))

(declare-fun b!517654 () Bool)

(assert (=> b!517654 (= e!302064 call!31685)))

(declare-fun b!517655 () Bool)

(assert (=> b!517655 (= e!302067 e!302064)))

(assert (=> b!517655 (= c!60704 (validKeyInArray!0 (select (arr!15922 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!517651 () Bool)

(declare-fun contains!2746 (List!10080 (_ BitVec 64)) Bool)

(assert (=> b!517651 (= e!302065 (contains!2746 Nil!10077 (select (arr!15922 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!79763 () Bool)

(declare-fun res!316829 () Bool)

(assert (=> d!79763 (=> res!316829 e!302066)))

(assert (=> d!79763 (= res!316829 (bvsge #b00000000000000000000000000000000 (size!16286 a!3235)))))

(assert (=> d!79763 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10077) e!302066)))

(assert (= (and d!79763 (not res!316829)) b!517652))

(assert (= (and b!517652 res!316828) b!517651))

(assert (= (and b!517652 res!316827) b!517655))

(assert (= (and b!517655 c!60704) b!517653))

(assert (= (and b!517655 (not c!60704)) b!517654))

(assert (= (or b!517653 b!517654) bm!31682))

(declare-fun m!499065 () Bool)

(assert (=> bm!31682 m!499065))

(declare-fun m!499067 () Bool)

(assert (=> bm!31682 m!499067))

(assert (=> b!517652 m!499065))

(assert (=> b!517652 m!499065))

(declare-fun m!499069 () Bool)

(assert (=> b!517652 m!499069))

(assert (=> b!517655 m!499065))

(assert (=> b!517655 m!499065))

(assert (=> b!517655 m!499069))

(assert (=> b!517651 m!499065))

(assert (=> b!517651 m!499065))

(declare-fun m!499071 () Bool)

(assert (=> b!517651 m!499071))

(assert (=> b!517582 d!79763))

(declare-fun d!79765 () Bool)

(assert (=> d!79765 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!517589 d!79765))

(declare-fun d!79769 () Bool)

(assert (=> d!79769 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!46916 d!79769))

(declare-fun d!79775 () Bool)

(assert (=> d!79775 (= (array_inv!11718 a!3235) (bvsge (size!16286 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!46916 d!79775))

(declare-fun b!517684 () Bool)

(declare-fun e!302089 () Bool)

(declare-fun call!31693 () Bool)

(assert (=> b!517684 (= e!302089 call!31693)))

(declare-fun bm!31690 () Bool)

(assert (=> bm!31690 (= call!31693 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!517686 () Bool)

(declare-fun e!302090 () Bool)

(declare-fun e!302091 () Bool)

(assert (=> b!517686 (= e!302090 e!302091)))

(declare-fun c!60712 () Bool)

(assert (=> b!517686 (= c!60712 (validKeyInArray!0 (select (arr!15922 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!517687 () Bool)

(assert (=> b!517687 (= e!302091 call!31693)))

(declare-fun b!517685 () Bool)

(assert (=> b!517685 (= e!302091 e!302089)))

(declare-fun lt!236979 () (_ BitVec 64))

(assert (=> b!517685 (= lt!236979 (select (arr!15922 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!236978 () Unit!16036)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33114 (_ BitVec 64) (_ BitVec 32)) Unit!16036)

(assert (=> b!517685 (= lt!236978 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!236979 #b00000000000000000000000000000000))))

(assert (=> b!517685 (arrayContainsKey!0 a!3235 lt!236979 #b00000000000000000000000000000000)))

(declare-fun lt!236980 () Unit!16036)

(assert (=> b!517685 (= lt!236980 lt!236978)))

(declare-fun res!316845 () Bool)

(assert (=> b!517685 (= res!316845 (= (seekEntryOrOpen!0 (select (arr!15922 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4389 #b00000000000000000000000000000000)))))

(assert (=> b!517685 (=> (not res!316845) (not e!302089))))

(declare-fun d!79779 () Bool)

(declare-fun res!316844 () Bool)

(assert (=> d!79779 (=> res!316844 e!302090)))

(assert (=> d!79779 (= res!316844 (bvsge #b00000000000000000000000000000000 (size!16286 a!3235)))))

(assert (=> d!79779 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!302090)))

(assert (= (and d!79779 (not res!316844)) b!517686))

(assert (= (and b!517686 c!60712) b!517685))

(assert (= (and b!517686 (not c!60712)) b!517687))

(assert (= (and b!517685 res!316845) b!517684))

(assert (= (or b!517684 b!517687) bm!31690))

(declare-fun m!499085 () Bool)

(assert (=> bm!31690 m!499085))

(assert (=> b!517686 m!499065))

(assert (=> b!517686 m!499065))

(assert (=> b!517686 m!499069))

(assert (=> b!517685 m!499065))

(declare-fun m!499087 () Bool)

(assert (=> b!517685 m!499087))

(declare-fun m!499089 () Bool)

(assert (=> b!517685 m!499089))

(assert (=> b!517685 m!499065))

(declare-fun m!499091 () Bool)

(assert (=> b!517685 m!499091))

(assert (=> b!517584 d!79779))

(declare-fun d!79785 () Bool)

(declare-fun res!316852 () Bool)

(declare-fun e!302099 () Bool)

(assert (=> d!79785 (=> res!316852 e!302099)))

(assert (=> d!79785 (= res!316852 (= (select (arr!15922 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!79785 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!302099)))

(declare-fun b!517696 () Bool)

(declare-fun e!302100 () Bool)

(assert (=> b!517696 (= e!302099 e!302100)))

(declare-fun res!316853 () Bool)

(assert (=> b!517696 (=> (not res!316853) (not e!302100))))

(assert (=> b!517696 (= res!316853 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16286 a!3235)))))

(declare-fun b!517697 () Bool)

(assert (=> b!517697 (= e!302100 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!79785 (not res!316852)) b!517696))

(assert (= (and b!517696 res!316853) b!517697))

(assert (=> d!79785 m!499065))

(declare-fun m!499105 () Bool)

(assert (=> b!517697 m!499105))

(assert (=> b!517579 d!79785))

(declare-fun d!79789 () Bool)

(declare-fun lt!236995 () (_ BitVec 32))

(declare-fun lt!236994 () (_ BitVec 32))

(assert (=> d!79789 (= lt!236995 (bvmul (bvxor lt!236994 (bvlshr lt!236994 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79789 (= lt!236994 ((_ extract 31 0) (bvand (bvxor (select (arr!15922 a!3235) j!176) (bvlshr (select (arr!15922 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79789 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!316854 (let ((h!10982 ((_ extract 31 0) (bvand (bvxor (select (arr!15922 a!3235) j!176) (bvlshr (select (arr!15922 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48710 (bvmul (bvxor h!10982 (bvlshr h!10982 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48710 (bvlshr x!48710 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!316854 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!316854 #b00000000000000000000000000000000))))))

(assert (=> d!79789 (= (toIndex!0 (select (arr!15922 a!3235) j!176) mask!3524) (bvand (bvxor lt!236995 (bvlshr lt!236995 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!517580 d!79789))

(declare-fun b!517710 () Bool)

(declare-fun e!302107 () Bool)

(declare-fun call!31695 () Bool)

(assert (=> b!517710 (= e!302107 call!31695)))

(declare-fun bm!31692 () Bool)

(assert (=> bm!31692 (= call!31695 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!517712 () Bool)

(declare-fun e!302108 () Bool)

(declare-fun e!302109 () Bool)

(assert (=> b!517712 (= e!302108 e!302109)))

(declare-fun c!60720 () Bool)

(assert (=> b!517712 (= c!60720 (validKeyInArray!0 (select (arr!15922 a!3235) j!176)))))

(declare-fun b!517713 () Bool)

(assert (=> b!517713 (= e!302109 call!31695)))

(declare-fun b!517711 () Bool)

(assert (=> b!517711 (= e!302109 e!302107)))

(declare-fun lt!236997 () (_ BitVec 64))

(assert (=> b!517711 (= lt!236997 (select (arr!15922 a!3235) j!176))))

(declare-fun lt!236996 () Unit!16036)

(assert (=> b!517711 (= lt!236996 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!236997 j!176))))

(assert (=> b!517711 (arrayContainsKey!0 a!3235 lt!236997 #b00000000000000000000000000000000)))

(declare-fun lt!236998 () Unit!16036)

(assert (=> b!517711 (= lt!236998 lt!236996)))

(declare-fun res!316856 () Bool)

(assert (=> b!517711 (= res!316856 (= (seekEntryOrOpen!0 (select (arr!15922 a!3235) j!176) a!3235 mask!3524) (Found!4389 j!176)))))

(assert (=> b!517711 (=> (not res!316856) (not e!302107))))

(declare-fun d!79791 () Bool)

(declare-fun res!316855 () Bool)

(assert (=> d!79791 (=> res!316855 e!302108)))

(assert (=> d!79791 (= res!316855 (bvsge j!176 (size!16286 a!3235)))))

(assert (=> d!79791 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!302108)))

(assert (= (and d!79791 (not res!316855)) b!517712))

(assert (= (and b!517712 c!60720) b!517711))

(assert (= (and b!517712 (not c!60720)) b!517713))

(assert (= (and b!517711 res!316856) b!517710))

(assert (= (or b!517710 b!517713) bm!31692))

(declare-fun m!499107 () Bool)

(assert (=> bm!31692 m!499107))

(assert (=> b!517712 m!498979))

(assert (=> b!517712 m!498979))

(assert (=> b!517712 m!498995))

(assert (=> b!517711 m!498979))

(declare-fun m!499109 () Bool)

(assert (=> b!517711 m!499109))

(declare-fun m!499111 () Bool)

(assert (=> b!517711 m!499111))

(assert (=> b!517711 m!498979))

(assert (=> b!517711 m!499003))

(assert (=> b!517580 d!79791))

(declare-fun d!79793 () Bool)

(declare-fun e!302142 () Bool)

(assert (=> d!79793 e!302142))

(declare-fun c!60737 () Bool)

(declare-fun lt!237022 () SeekEntryResult!4389)

(assert (=> d!79793 (= c!60737 (and ((_ is Intermediate!4389) lt!237022) (undefined!5201 lt!237022)))))

(declare-fun e!302146 () SeekEntryResult!4389)

(assert (=> d!79793 (= lt!237022 e!302146)))

(declare-fun c!60739 () Bool)

(assert (=> d!79793 (= c!60739 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!237021 () (_ BitVec 64))

(assert (=> d!79793 (= lt!237021 (select (arr!15922 (array!33115 (store (arr!15922 a!3235) i!1204 k0!2280) (size!16286 a!3235))) lt!236929))))

(assert (=> d!79793 (validMask!0 mask!3524)))

(assert (=> d!79793 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236929 (select (store (arr!15922 a!3235) i!1204 k0!2280) j!176) (array!33115 (store (arr!15922 a!3235) i!1204 k0!2280) (size!16286 a!3235)) mask!3524) lt!237022)))

(declare-fun b!517766 () Bool)

(assert (=> b!517766 (= e!302146 (Intermediate!4389 true lt!236929 #b00000000000000000000000000000000))))

(declare-fun b!517767 () Bool)

(declare-fun e!302145 () SeekEntryResult!4389)

(assert (=> b!517767 (= e!302146 e!302145)))

(declare-fun c!60738 () Bool)

(assert (=> b!517767 (= c!60738 (or (= lt!237021 (select (store (arr!15922 a!3235) i!1204 k0!2280) j!176)) (= (bvadd lt!237021 lt!237021) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!517768 () Bool)

(declare-fun e!302143 () Bool)

(assert (=> b!517768 (= e!302142 e!302143)))

(declare-fun res!316878 () Bool)

(assert (=> b!517768 (= res!316878 (and ((_ is Intermediate!4389) lt!237022) (not (undefined!5201 lt!237022)) (bvslt (x!48708 lt!237022) #b01111111111111111111111111111110) (bvsge (x!48708 lt!237022) #b00000000000000000000000000000000) (bvsge (x!48708 lt!237022) #b00000000000000000000000000000000)))))

(assert (=> b!517768 (=> (not res!316878) (not e!302143))))

(declare-fun b!517769 () Bool)

(assert (=> b!517769 (= e!302145 (Intermediate!4389 false lt!236929 #b00000000000000000000000000000000))))

(declare-fun b!517770 () Bool)

(assert (=> b!517770 (and (bvsge (index!19746 lt!237022) #b00000000000000000000000000000000) (bvslt (index!19746 lt!237022) (size!16286 (array!33115 (store (arr!15922 a!3235) i!1204 k0!2280) (size!16286 a!3235)))))))

(declare-fun res!316880 () Bool)

(assert (=> b!517770 (= res!316880 (= (select (arr!15922 (array!33115 (store (arr!15922 a!3235) i!1204 k0!2280) (size!16286 a!3235))) (index!19746 lt!237022)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!302144 () Bool)

(assert (=> b!517770 (=> res!316880 e!302144)))

(declare-fun b!517771 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!517771 (= e!302145 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!236929 #b00000000000000000000000000000000 mask!3524) (select (store (arr!15922 a!3235) i!1204 k0!2280) j!176) (array!33115 (store (arr!15922 a!3235) i!1204 k0!2280) (size!16286 a!3235)) mask!3524))))

(declare-fun b!517772 () Bool)

(assert (=> b!517772 (= e!302142 (bvsge (x!48708 lt!237022) #b01111111111111111111111111111110))))

(declare-fun b!517773 () Bool)

(assert (=> b!517773 (and (bvsge (index!19746 lt!237022) #b00000000000000000000000000000000) (bvslt (index!19746 lt!237022) (size!16286 (array!33115 (store (arr!15922 a!3235) i!1204 k0!2280) (size!16286 a!3235)))))))

(declare-fun res!316879 () Bool)

(assert (=> b!517773 (= res!316879 (= (select (arr!15922 (array!33115 (store (arr!15922 a!3235) i!1204 k0!2280) (size!16286 a!3235))) (index!19746 lt!237022)) (select (store (arr!15922 a!3235) i!1204 k0!2280) j!176)))))

(assert (=> b!517773 (=> res!316879 e!302144)))

(assert (=> b!517773 (= e!302143 e!302144)))

(declare-fun b!517774 () Bool)

(assert (=> b!517774 (and (bvsge (index!19746 lt!237022) #b00000000000000000000000000000000) (bvslt (index!19746 lt!237022) (size!16286 (array!33115 (store (arr!15922 a!3235) i!1204 k0!2280) (size!16286 a!3235)))))))

(assert (=> b!517774 (= e!302144 (= (select (arr!15922 (array!33115 (store (arr!15922 a!3235) i!1204 k0!2280) (size!16286 a!3235))) (index!19746 lt!237022)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!79793 c!60739) b!517766))

(assert (= (and d!79793 (not c!60739)) b!517767))

(assert (= (and b!517767 c!60738) b!517769))

(assert (= (and b!517767 (not c!60738)) b!517771))

(assert (= (and d!79793 c!60737) b!517772))

(assert (= (and d!79793 (not c!60737)) b!517768))

(assert (= (and b!517768 res!316878) b!517773))

(assert (= (and b!517773 (not res!316879)) b!517770))

(assert (= (and b!517770 (not res!316880)) b!517774))

(declare-fun m!499133 () Bool)

(assert (=> d!79793 m!499133))

(assert (=> d!79793 m!498999))

(declare-fun m!499135 () Bool)

(assert (=> b!517770 m!499135))

(assert (=> b!517773 m!499135))

(assert (=> b!517774 m!499135))

(declare-fun m!499137 () Bool)

(assert (=> b!517771 m!499137))

(assert (=> b!517771 m!499137))

(assert (=> b!517771 m!498985))

(declare-fun m!499139 () Bool)

(assert (=> b!517771 m!499139))

(assert (=> b!517580 d!79793))

(declare-fun d!79809 () Bool)

(assert (=> d!79809 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!237027 () Unit!16036)

(declare-fun choose!38 (array!33114 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16036)

(assert (=> d!79809 (= lt!237027 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!79809 (validMask!0 mask!3524)))

(assert (=> d!79809 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!237027)))

(declare-fun bs!16342 () Bool)

(assert (= bs!16342 d!79809))

(assert (=> bs!16342 m!498983))

(declare-fun m!499149 () Bool)

(assert (=> bs!16342 m!499149))

(assert (=> bs!16342 m!498999))

(assert (=> b!517580 d!79809))

(declare-fun d!79813 () Bool)

(declare-fun lt!237029 () (_ BitVec 32))

(declare-fun lt!237028 () (_ BitVec 32))

(assert (=> d!79813 (= lt!237029 (bvmul (bvxor lt!237028 (bvlshr lt!237028 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79813 (= lt!237028 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15922 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!15922 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79813 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!316854 (let ((h!10982 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15922 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!15922 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48710 (bvmul (bvxor h!10982 (bvlshr h!10982 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48710 (bvlshr x!48710 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!316854 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!316854 #b00000000000000000000000000000000))))))

(assert (=> d!79813 (= (toIndex!0 (select (store (arr!15922 a!3235) i!1204 k0!2280) j!176) mask!3524) (bvand (bvxor lt!237029 (bvlshr lt!237029 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!517580 d!79813))

(declare-fun d!79815 () Bool)

(declare-fun e!302154 () Bool)

(assert (=> d!79815 e!302154))

(declare-fun c!60745 () Bool)

(declare-fun lt!237035 () SeekEntryResult!4389)

(assert (=> d!79815 (= c!60745 (and ((_ is Intermediate!4389) lt!237035) (undefined!5201 lt!237035)))))

(declare-fun e!302158 () SeekEntryResult!4389)

(assert (=> d!79815 (= lt!237035 e!302158)))

(declare-fun c!60747 () Bool)

(assert (=> d!79815 (= c!60747 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!237034 () (_ BitVec 64))

(assert (=> d!79815 (= lt!237034 (select (arr!15922 a!3235) lt!236931))))

(assert (=> d!79815 (validMask!0 mask!3524)))

(assert (=> d!79815 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236931 (select (arr!15922 a!3235) j!176) a!3235 mask!3524) lt!237035)))

(declare-fun b!517788 () Bool)

(assert (=> b!517788 (= e!302158 (Intermediate!4389 true lt!236931 #b00000000000000000000000000000000))))

(declare-fun b!517789 () Bool)

(declare-fun e!302157 () SeekEntryResult!4389)

(assert (=> b!517789 (= e!302158 e!302157)))

(declare-fun c!60746 () Bool)

(assert (=> b!517789 (= c!60746 (or (= lt!237034 (select (arr!15922 a!3235) j!176)) (= (bvadd lt!237034 lt!237034) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!517790 () Bool)

(declare-fun e!302155 () Bool)

(assert (=> b!517790 (= e!302154 e!302155)))

(declare-fun res!316885 () Bool)

(assert (=> b!517790 (= res!316885 (and ((_ is Intermediate!4389) lt!237035) (not (undefined!5201 lt!237035)) (bvslt (x!48708 lt!237035) #b01111111111111111111111111111110) (bvsge (x!48708 lt!237035) #b00000000000000000000000000000000) (bvsge (x!48708 lt!237035) #b00000000000000000000000000000000)))))

(assert (=> b!517790 (=> (not res!316885) (not e!302155))))

(declare-fun b!517791 () Bool)

(assert (=> b!517791 (= e!302157 (Intermediate!4389 false lt!236931 #b00000000000000000000000000000000))))

(declare-fun b!517792 () Bool)

(assert (=> b!517792 (and (bvsge (index!19746 lt!237035) #b00000000000000000000000000000000) (bvslt (index!19746 lt!237035) (size!16286 a!3235)))))

(declare-fun res!316887 () Bool)

(assert (=> b!517792 (= res!316887 (= (select (arr!15922 a!3235) (index!19746 lt!237035)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!302156 () Bool)

(assert (=> b!517792 (=> res!316887 e!302156)))

(declare-fun b!517793 () Bool)

(assert (=> b!517793 (= e!302157 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!236931 #b00000000000000000000000000000000 mask!3524) (select (arr!15922 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!517794 () Bool)

(assert (=> b!517794 (= e!302154 (bvsge (x!48708 lt!237035) #b01111111111111111111111111111110))))

(declare-fun b!517795 () Bool)

(assert (=> b!517795 (and (bvsge (index!19746 lt!237035) #b00000000000000000000000000000000) (bvslt (index!19746 lt!237035) (size!16286 a!3235)))))

(declare-fun res!316886 () Bool)

(assert (=> b!517795 (= res!316886 (= (select (arr!15922 a!3235) (index!19746 lt!237035)) (select (arr!15922 a!3235) j!176)))))

(assert (=> b!517795 (=> res!316886 e!302156)))

(assert (=> b!517795 (= e!302155 e!302156)))

(declare-fun b!517796 () Bool)

(assert (=> b!517796 (and (bvsge (index!19746 lt!237035) #b00000000000000000000000000000000) (bvslt (index!19746 lt!237035) (size!16286 a!3235)))))

(assert (=> b!517796 (= e!302156 (= (select (arr!15922 a!3235) (index!19746 lt!237035)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!79815 c!60747) b!517788))

(assert (= (and d!79815 (not c!60747)) b!517789))

(assert (= (and b!517789 c!60746) b!517791))

(assert (= (and b!517789 (not c!60746)) b!517793))

(assert (= (and d!79815 c!60745) b!517794))

(assert (= (and d!79815 (not c!60745)) b!517790))

(assert (= (and b!517790 res!316885) b!517795))

(assert (= (and b!517795 (not res!316886)) b!517792))

(assert (= (and b!517792 (not res!316887)) b!517796))

(declare-fun m!499151 () Bool)

(assert (=> d!79815 m!499151))

(assert (=> d!79815 m!498999))

(declare-fun m!499153 () Bool)

(assert (=> b!517792 m!499153))

(assert (=> b!517795 m!499153))

(assert (=> b!517796 m!499153))

(declare-fun m!499155 () Bool)

(assert (=> b!517793 m!499155))

(assert (=> b!517793 m!499155))

(assert (=> b!517793 m!498979))

(declare-fun m!499157 () Bool)

(assert (=> b!517793 m!499157))

(assert (=> b!517580 d!79815))

(declare-fun d!79817 () Bool)

(assert (=> d!79817 (= (validKeyInArray!0 (select (arr!15922 a!3235) j!176)) (and (not (= (select (arr!15922 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15922 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!517586 d!79817))

(declare-fun b!517805 () Bool)

(declare-fun e!302165 () SeekEntryResult!4389)

(declare-fun lt!237042 () SeekEntryResult!4389)

(assert (=> b!517805 (= e!302165 (MissingZero!4389 (index!19746 lt!237042)))))

(declare-fun b!517806 () Bool)

(declare-fun e!302164 () SeekEntryResult!4389)

(assert (=> b!517806 (= e!302164 Undefined!4389)))

(declare-fun b!517807 () Bool)

(declare-fun e!302163 () SeekEntryResult!4389)

(assert (=> b!517807 (= e!302164 e!302163)))

(declare-fun lt!237041 () (_ BitVec 64))

(assert (=> b!517807 (= lt!237041 (select (arr!15922 a!3235) (index!19746 lt!237042)))))

(declare-fun c!60753 () Bool)

(assert (=> b!517807 (= c!60753 (= lt!237041 k0!2280))))

(declare-fun b!517808 () Bool)

(assert (=> b!517808 (= e!302165 (seekKeyOrZeroReturnVacant!0 (x!48708 lt!237042) (index!19746 lt!237042) (index!19746 lt!237042) k0!2280 a!3235 mask!3524))))

(declare-fun b!517809 () Bool)

(assert (=> b!517809 (= e!302163 (Found!4389 (index!19746 lt!237042)))))

(declare-fun d!79819 () Bool)

(declare-fun lt!237040 () SeekEntryResult!4389)

(assert (=> d!79819 (and (or ((_ is Undefined!4389) lt!237040) (not ((_ is Found!4389) lt!237040)) (and (bvsge (index!19745 lt!237040) #b00000000000000000000000000000000) (bvslt (index!19745 lt!237040) (size!16286 a!3235)))) (or ((_ is Undefined!4389) lt!237040) ((_ is Found!4389) lt!237040) (not ((_ is MissingZero!4389) lt!237040)) (and (bvsge (index!19744 lt!237040) #b00000000000000000000000000000000) (bvslt (index!19744 lt!237040) (size!16286 a!3235)))) (or ((_ is Undefined!4389) lt!237040) ((_ is Found!4389) lt!237040) ((_ is MissingZero!4389) lt!237040) (not ((_ is MissingVacant!4389) lt!237040)) (and (bvsge (index!19747 lt!237040) #b00000000000000000000000000000000) (bvslt (index!19747 lt!237040) (size!16286 a!3235)))) (or ((_ is Undefined!4389) lt!237040) (ite ((_ is Found!4389) lt!237040) (= (select (arr!15922 a!3235) (index!19745 lt!237040)) k0!2280) (ite ((_ is MissingZero!4389) lt!237040) (= (select (arr!15922 a!3235) (index!19744 lt!237040)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4389) lt!237040) (= (select (arr!15922 a!3235) (index!19747 lt!237040)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!79819 (= lt!237040 e!302164)))

(declare-fun c!60752 () Bool)

(assert (=> d!79819 (= c!60752 (and ((_ is Intermediate!4389) lt!237042) (undefined!5201 lt!237042)))))

(assert (=> d!79819 (= lt!237042 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!79819 (validMask!0 mask!3524)))

(assert (=> d!79819 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!237040)))

(declare-fun b!517810 () Bool)

(declare-fun c!60754 () Bool)

(assert (=> b!517810 (= c!60754 (= lt!237041 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!517810 (= e!302163 e!302165)))

(assert (= (and d!79819 c!60752) b!517806))

(assert (= (and d!79819 (not c!60752)) b!517807))

(assert (= (and b!517807 c!60753) b!517809))

(assert (= (and b!517807 (not c!60753)) b!517810))

(assert (= (and b!517810 c!60754) b!517805))

(assert (= (and b!517810 (not c!60754)) b!517808))

(declare-fun m!499159 () Bool)

(assert (=> b!517807 m!499159))

(declare-fun m!499161 () Bool)

(assert (=> b!517808 m!499161))

(declare-fun m!499163 () Bool)

(assert (=> d!79819 m!499163))

(declare-fun m!499165 () Bool)

(assert (=> d!79819 m!499165))

(declare-fun m!499167 () Bool)

(assert (=> d!79819 m!499167))

(declare-fun m!499169 () Bool)

(assert (=> d!79819 m!499169))

(declare-fun m!499171 () Bool)

(assert (=> d!79819 m!499171))

(assert (=> d!79819 m!498999))

(assert (=> d!79819 m!499167))

(assert (=> b!517581 d!79819))

(check-sat (not b!517712) (not bm!31682) (not b!517686) (not b!517638) (not b!517808) (not b!517655) (not b!517771) (not b!517697) (not d!79761) (not d!79809) (not bm!31692) (not b!517652) (not d!79815) (not d!79793) (not b!517651) (not bm!31690) (not b!517711) (not b!517685) (not b!517793) (not d!79819))
(check-sat)
