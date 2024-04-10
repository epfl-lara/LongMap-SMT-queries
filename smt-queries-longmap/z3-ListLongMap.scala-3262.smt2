; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45446 () Bool)

(assert start!45446)

(declare-fun b!499998 () Bool)

(declare-fun e!292970 () Bool)

(declare-fun e!292973 () Bool)

(assert (=> b!499998 (= e!292970 e!292973)))

(declare-fun res!301889 () Bool)

(assert (=> b!499998 (=> (not res!301889) (not e!292973))))

(declare-datatypes ((SeekEntryResult!3984 0))(
  ( (MissingZero!3984 (index!18118 (_ BitVec 32))) (Found!3984 (index!18119 (_ BitVec 32))) (Intermediate!3984 (undefined!4796 Bool) (index!18120 (_ BitVec 32)) (x!47157 (_ BitVec 32))) (Undefined!3984) (MissingVacant!3984 (index!18121 (_ BitVec 32))) )
))
(declare-fun lt!226825 () SeekEntryResult!3984)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!499998 (= res!301889 (or (= lt!226825 (MissingZero!3984 i!1204)) (= lt!226825 (MissingVacant!3984 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32271 0))(
  ( (array!32272 (arr!15517 (Array (_ BitVec 32) (_ BitVec 64))) (size!15881 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32271)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32271 (_ BitVec 32)) SeekEntryResult!3984)

(assert (=> b!499998 (= lt!226825 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!499999 () Bool)

(declare-datatypes ((Unit!15012 0))(
  ( (Unit!15013) )
))
(declare-fun e!292972 () Unit!15012)

(declare-fun Unit!15014 () Unit!15012)

(assert (=> b!499999 (= e!292972 Unit!15014)))

(declare-fun b!500000 () Bool)

(declare-fun res!301895 () Bool)

(assert (=> b!500000 (=> (not res!301895) (not e!292970))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!500000 (= res!301895 (validKeyInArray!0 (select (arr!15517 a!3235) j!176)))))

(declare-fun b!500001 () Bool)

(declare-fun res!301896 () Bool)

(assert (=> b!500001 (=> (not res!301896) (not e!292970))))

(assert (=> b!500001 (= res!301896 (validKeyInArray!0 k0!2280))))

(declare-fun e!292971 () Bool)

(declare-fun b!500002 () Bool)

(assert (=> b!500002 (= e!292971 (= (seekEntryOrOpen!0 (select (arr!15517 a!3235) j!176) a!3235 mask!3524) (Found!3984 j!176)))))

(declare-fun b!500003 () Bool)

(declare-fun res!301891 () Bool)

(assert (=> b!500003 (=> (not res!301891) (not e!292970))))

(declare-fun arrayContainsKey!0 (array!32271 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!500003 (= res!301891 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!500004 () Bool)

(declare-fun res!301898 () Bool)

(assert (=> b!500004 (=> (not res!301898) (not e!292970))))

(assert (=> b!500004 (= res!301898 (and (= (size!15881 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15881 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15881 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!500005 () Bool)

(declare-fun res!301893 () Bool)

(declare-fun e!292969 () Bool)

(assert (=> b!500005 (=> res!301893 e!292969)))

(declare-fun lt!226820 () SeekEntryResult!3984)

(get-info :version)

(assert (=> b!500005 (= res!301893 (or (undefined!4796 lt!226820) (not ((_ is Intermediate!3984) lt!226820))))))

(declare-fun b!500006 () Bool)

(declare-fun e!292974 () Bool)

(assert (=> b!500006 (= e!292974 true)))

(declare-fun lt!226828 () (_ BitVec 32))

(declare-fun lt!226821 () SeekEntryResult!3984)

(declare-fun lt!226819 () (_ BitVec 64))

(declare-fun lt!226823 () array!32271)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32271 (_ BitVec 32)) SeekEntryResult!3984)

(assert (=> b!500006 (= lt!226821 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226828 lt!226819 lt!226823 mask!3524))))

(declare-fun b!500007 () Bool)

(declare-fun res!301886 () Bool)

(assert (=> b!500007 (=> (not res!301886) (not e!292973))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32271 (_ BitVec 32)) Bool)

(assert (=> b!500007 (= res!301886 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!301888 () Bool)

(assert (=> start!45446 (=> (not res!301888) (not e!292970))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45446 (= res!301888 (validMask!0 mask!3524))))

(assert (=> start!45446 e!292970))

(assert (=> start!45446 true))

(declare-fun array_inv!11313 (array!32271) Bool)

(assert (=> start!45446 (array_inv!11313 a!3235)))

(declare-fun b!500008 () Bool)

(assert (=> b!500008 (= e!292973 (not e!292969))))

(declare-fun res!301897 () Bool)

(assert (=> b!500008 (=> res!301897 e!292969)))

(declare-fun lt!226826 () (_ BitVec 32))

(assert (=> b!500008 (= res!301897 (= lt!226820 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226826 lt!226819 lt!226823 mask!3524)))))

(assert (=> b!500008 (= lt!226820 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226828 (select (arr!15517 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!500008 (= lt!226826 (toIndex!0 lt!226819 mask!3524))))

(assert (=> b!500008 (= lt!226819 (select (store (arr!15517 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!500008 (= lt!226828 (toIndex!0 (select (arr!15517 a!3235) j!176) mask!3524))))

(assert (=> b!500008 (= lt!226823 (array!32272 (store (arr!15517 a!3235) i!1204 k0!2280) (size!15881 a!3235)))))

(assert (=> b!500008 e!292971))

(declare-fun res!301892 () Bool)

(assert (=> b!500008 (=> (not res!301892) (not e!292971))))

(assert (=> b!500008 (= res!301892 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!226827 () Unit!15012)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32271 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15012)

(assert (=> b!500008 (= lt!226827 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!500009 () Bool)

(declare-fun res!301890 () Bool)

(assert (=> b!500009 (=> (not res!301890) (not e!292973))))

(declare-datatypes ((List!9675 0))(
  ( (Nil!9672) (Cons!9671 (h!10545 (_ BitVec 64)) (t!15903 List!9675)) )
))
(declare-fun arrayNoDuplicates!0 (array!32271 (_ BitVec 32) List!9675) Bool)

(assert (=> b!500009 (= res!301890 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9672))))

(declare-fun b!500010 () Bool)

(declare-fun Unit!15015 () Unit!15012)

(assert (=> b!500010 (= e!292972 Unit!15015)))

(declare-fun lt!226824 () Unit!15012)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32271 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15012)

(assert (=> b!500010 (= lt!226824 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!226828 #b00000000000000000000000000000000 (index!18120 lt!226820) (x!47157 lt!226820) mask!3524))))

(declare-fun res!301894 () Bool)

(assert (=> b!500010 (= res!301894 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226828 lt!226819 lt!226823 mask!3524) (Intermediate!3984 false (index!18120 lt!226820) (x!47157 lt!226820))))))

(declare-fun e!292968 () Bool)

(assert (=> b!500010 (=> (not res!301894) (not e!292968))))

(assert (=> b!500010 e!292968))

(declare-fun b!500011 () Bool)

(assert (=> b!500011 (= e!292968 false)))

(declare-fun b!500012 () Bool)

(assert (=> b!500012 (= e!292969 e!292974)))

(declare-fun res!301887 () Bool)

(assert (=> b!500012 (=> res!301887 e!292974)))

(assert (=> b!500012 (= res!301887 (or (bvsgt #b00000000000000000000000000000000 (x!47157 lt!226820)) (bvsgt (x!47157 lt!226820) #b01111111111111111111111111111110) (bvslt lt!226828 #b00000000000000000000000000000000) (bvsge lt!226828 (size!15881 a!3235)) (bvslt (index!18120 lt!226820) #b00000000000000000000000000000000) (bvsge (index!18120 lt!226820) (size!15881 a!3235)) (not (= lt!226820 (Intermediate!3984 false (index!18120 lt!226820) (x!47157 lt!226820))))))))

(assert (=> b!500012 (and (or (= (select (arr!15517 a!3235) (index!18120 lt!226820)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15517 a!3235) (index!18120 lt!226820)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15517 a!3235) (index!18120 lt!226820)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15517 a!3235) (index!18120 lt!226820)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!226822 () Unit!15012)

(assert (=> b!500012 (= lt!226822 e!292972)))

(declare-fun c!59333 () Bool)

(assert (=> b!500012 (= c!59333 (= (select (arr!15517 a!3235) (index!18120 lt!226820)) (select (arr!15517 a!3235) j!176)))))

(assert (=> b!500012 (and (bvslt (x!47157 lt!226820) #b01111111111111111111111111111110) (or (= (select (arr!15517 a!3235) (index!18120 lt!226820)) (select (arr!15517 a!3235) j!176)) (= (select (arr!15517 a!3235) (index!18120 lt!226820)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15517 a!3235) (index!18120 lt!226820)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!45446 res!301888) b!500004))

(assert (= (and b!500004 res!301898) b!500000))

(assert (= (and b!500000 res!301895) b!500001))

(assert (= (and b!500001 res!301896) b!500003))

(assert (= (and b!500003 res!301891) b!499998))

(assert (= (and b!499998 res!301889) b!500007))

(assert (= (and b!500007 res!301886) b!500009))

(assert (= (and b!500009 res!301890) b!500008))

(assert (= (and b!500008 res!301892) b!500002))

(assert (= (and b!500008 (not res!301897)) b!500005))

(assert (= (and b!500005 (not res!301893)) b!500012))

(assert (= (and b!500012 c!59333) b!500010))

(assert (= (and b!500012 (not c!59333)) b!499999))

(assert (= (and b!500010 res!301894) b!500011))

(assert (= (and b!500012 (not res!301887)) b!500006))

(declare-fun m!481161 () Bool)

(assert (=> b!499998 m!481161))

(declare-fun m!481163 () Bool)

(assert (=> b!500007 m!481163))

(declare-fun m!481165 () Bool)

(assert (=> start!45446 m!481165))

(declare-fun m!481167 () Bool)

(assert (=> start!45446 m!481167))

(declare-fun m!481169 () Bool)

(assert (=> b!500003 m!481169))

(declare-fun m!481171 () Bool)

(assert (=> b!500009 m!481171))

(declare-fun m!481173 () Bool)

(assert (=> b!500006 m!481173))

(declare-fun m!481175 () Bool)

(assert (=> b!500010 m!481175))

(assert (=> b!500010 m!481173))

(declare-fun m!481177 () Bool)

(assert (=> b!500002 m!481177))

(assert (=> b!500002 m!481177))

(declare-fun m!481179 () Bool)

(assert (=> b!500002 m!481179))

(declare-fun m!481181 () Bool)

(assert (=> b!500012 m!481181))

(assert (=> b!500012 m!481177))

(declare-fun m!481183 () Bool)

(assert (=> b!500001 m!481183))

(declare-fun m!481185 () Bool)

(assert (=> b!500008 m!481185))

(declare-fun m!481187 () Bool)

(assert (=> b!500008 m!481187))

(declare-fun m!481189 () Bool)

(assert (=> b!500008 m!481189))

(declare-fun m!481191 () Bool)

(assert (=> b!500008 m!481191))

(assert (=> b!500008 m!481177))

(declare-fun m!481193 () Bool)

(assert (=> b!500008 m!481193))

(assert (=> b!500008 m!481177))

(declare-fun m!481195 () Bool)

(assert (=> b!500008 m!481195))

(assert (=> b!500008 m!481177))

(declare-fun m!481197 () Bool)

(assert (=> b!500008 m!481197))

(declare-fun m!481199 () Bool)

(assert (=> b!500008 m!481199))

(assert (=> b!500000 m!481177))

(assert (=> b!500000 m!481177))

(declare-fun m!481201 () Bool)

(assert (=> b!500000 m!481201))

(check-sat (not b!500010) (not b!500009) (not b!499998) (not start!45446) (not b!500007) (not b!500006) (not b!500000) (not b!500003) (not b!500002) (not b!500001) (not b!500008))
(check-sat)
