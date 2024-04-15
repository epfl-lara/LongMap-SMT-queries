; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45450 () Bool)

(assert start!45450)

(declare-fun b!500087 () Bool)

(declare-fun res!302075 () Bool)

(declare-fun e!292985 () Bool)

(assert (=> b!500087 (=> (not res!302075) (not e!292985))))

(declare-datatypes ((array!32285 0))(
  ( (array!32286 (arr!15524 (Array (_ BitVec 32) (_ BitVec 64))) (size!15889 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32285)

(declare-datatypes ((List!9721 0))(
  ( (Nil!9718) (Cons!9717 (h!10591 (_ BitVec 64)) (t!15940 List!9721)) )
))
(declare-fun arrayNoDuplicates!0 (array!32285 (_ BitVec 32) List!9721) Bool)

(assert (=> b!500087 (= res!302075 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9718))))

(declare-fun b!500088 () Bool)

(declare-fun e!292992 () Bool)

(assert (=> b!500088 (= e!292992 true)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!226832 () (_ BitVec 64))

(declare-fun lt!226833 () array!32285)

(declare-fun lt!226825 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3988 0))(
  ( (MissingZero!3988 (index!18134 (_ BitVec 32))) (Found!3988 (index!18135 (_ BitVec 32))) (Intermediate!3988 (undefined!4800 Bool) (index!18136 (_ BitVec 32)) (x!47180 (_ BitVec 32))) (Undefined!3988) (MissingVacant!3988 (index!18137 (_ BitVec 32))) )
))
(declare-fun lt!226829 () SeekEntryResult!3988)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32285 (_ BitVec 32)) SeekEntryResult!3988)

(assert (=> b!500088 (= lt!226829 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226825 lt!226832 lt!226833 mask!3524))))

(declare-fun b!500089 () Bool)

(declare-fun res!302077 () Bool)

(declare-fun e!292989 () Bool)

(assert (=> b!500089 (=> (not res!302077) (not e!292989))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!500089 (= res!302077 (validKeyInArray!0 k0!2280))))

(declare-fun b!500090 () Bool)

(declare-fun res!302079 () Bool)

(assert (=> b!500090 (=> (not res!302079) (not e!292985))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32285 (_ BitVec 32)) Bool)

(assert (=> b!500090 (= res!302079 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!500091 () Bool)

(declare-datatypes ((Unit!15022 0))(
  ( (Unit!15023) )
))
(declare-fun e!292987 () Unit!15022)

(declare-fun Unit!15024 () Unit!15022)

(assert (=> b!500091 (= e!292987 Unit!15024)))

(declare-fun b!500092 () Bool)

(declare-fun res!302074 () Bool)

(assert (=> b!500092 (=> (not res!302074) (not e!292989))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!500092 (= res!302074 (validKeyInArray!0 (select (arr!15524 a!3235) j!176)))))

(declare-fun b!500093 () Bool)

(declare-fun res!302072 () Bool)

(declare-fun e!292991 () Bool)

(assert (=> b!500093 (=> res!302072 e!292991)))

(declare-fun lt!226826 () SeekEntryResult!3988)

(get-info :version)

(assert (=> b!500093 (= res!302072 (or (undefined!4800 lt!226826) (not ((_ is Intermediate!3988) lt!226826))))))

(declare-fun b!500094 () Bool)

(declare-fun e!292990 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32285 (_ BitVec 32)) SeekEntryResult!3988)

(assert (=> b!500094 (= e!292990 (= (seekEntryOrOpen!0 (select (arr!15524 a!3235) j!176) a!3235 mask!3524) (Found!3988 j!176)))))

(declare-fun b!500095 () Bool)

(declare-fun e!292988 () Bool)

(assert (=> b!500095 (= e!292988 false)))

(declare-fun b!500096 () Bool)

(declare-fun Unit!15025 () Unit!15022)

(assert (=> b!500096 (= e!292987 Unit!15025)))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!226830 () Unit!15022)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32285 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15022)

(assert (=> b!500096 (= lt!226830 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!226825 #b00000000000000000000000000000000 (index!18136 lt!226826) (x!47180 lt!226826) mask!3524))))

(declare-fun res!302073 () Bool)

(assert (=> b!500096 (= res!302073 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226825 lt!226832 lt!226833 mask!3524) (Intermediate!3988 false (index!18136 lt!226826) (x!47180 lt!226826))))))

(assert (=> b!500096 (=> (not res!302073) (not e!292988))))

(assert (=> b!500096 e!292988))

(declare-fun b!500097 () Bool)

(assert (=> b!500097 (= e!292985 (not e!292991))))

(declare-fun res!302080 () Bool)

(assert (=> b!500097 (=> res!302080 e!292991)))

(declare-fun lt!226834 () (_ BitVec 32))

(assert (=> b!500097 (= res!302080 (= lt!226826 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226834 lt!226832 lt!226833 mask!3524)))))

(assert (=> b!500097 (= lt!226826 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226825 (select (arr!15524 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!500097 (= lt!226834 (toIndex!0 lt!226832 mask!3524))))

(assert (=> b!500097 (= lt!226832 (select (store (arr!15524 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!500097 (= lt!226825 (toIndex!0 (select (arr!15524 a!3235) j!176) mask!3524))))

(assert (=> b!500097 (= lt!226833 (array!32286 (store (arr!15524 a!3235) i!1204 k0!2280) (size!15889 a!3235)))))

(assert (=> b!500097 e!292990))

(declare-fun res!302071 () Bool)

(assert (=> b!500097 (=> (not res!302071) (not e!292990))))

(assert (=> b!500097 (= res!302071 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!226831 () Unit!15022)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32285 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15022)

(assert (=> b!500097 (= lt!226831 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!500098 () Bool)

(declare-fun res!302070 () Bool)

(assert (=> b!500098 (=> (not res!302070) (not e!292989))))

(assert (=> b!500098 (= res!302070 (and (= (size!15889 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15889 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15889 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!500099 () Bool)

(declare-fun res!302069 () Bool)

(assert (=> b!500099 (=> (not res!302069) (not e!292989))))

(declare-fun arrayContainsKey!0 (array!32285 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!500099 (= res!302069 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!500101 () Bool)

(assert (=> b!500101 (= e!292991 e!292992)))

(declare-fun res!302081 () Bool)

(assert (=> b!500101 (=> res!302081 e!292992)))

(assert (=> b!500101 (= res!302081 (or (bvsgt #b00000000000000000000000000000000 (x!47180 lt!226826)) (bvsgt (x!47180 lt!226826) #b01111111111111111111111111111110) (bvslt lt!226825 #b00000000000000000000000000000000) (bvsge lt!226825 (size!15889 a!3235)) (bvslt (index!18136 lt!226826) #b00000000000000000000000000000000) (bvsge (index!18136 lt!226826) (size!15889 a!3235)) (not (= lt!226826 (Intermediate!3988 false (index!18136 lt!226826) (x!47180 lt!226826))))))))

(assert (=> b!500101 (and (or (= (select (arr!15524 a!3235) (index!18136 lt!226826)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15524 a!3235) (index!18136 lt!226826)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15524 a!3235) (index!18136 lt!226826)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15524 a!3235) (index!18136 lt!226826)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!226827 () Unit!15022)

(assert (=> b!500101 (= lt!226827 e!292987)))

(declare-fun c!59286 () Bool)

(assert (=> b!500101 (= c!59286 (= (select (arr!15524 a!3235) (index!18136 lt!226826)) (select (arr!15524 a!3235) j!176)))))

(assert (=> b!500101 (and (bvslt (x!47180 lt!226826) #b01111111111111111111111111111110) (or (= (select (arr!15524 a!3235) (index!18136 lt!226826)) (select (arr!15524 a!3235) j!176)) (= (select (arr!15524 a!3235) (index!18136 lt!226826)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15524 a!3235) (index!18136 lt!226826)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!302076 () Bool)

(assert (=> start!45450 (=> (not res!302076) (not e!292989))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45450 (= res!302076 (validMask!0 mask!3524))))

(assert (=> start!45450 e!292989))

(assert (=> start!45450 true))

(declare-fun array_inv!11407 (array!32285) Bool)

(assert (=> start!45450 (array_inv!11407 a!3235)))

(declare-fun b!500100 () Bool)

(assert (=> b!500100 (= e!292989 e!292985)))

(declare-fun res!302078 () Bool)

(assert (=> b!500100 (=> (not res!302078) (not e!292985))))

(declare-fun lt!226828 () SeekEntryResult!3988)

(assert (=> b!500100 (= res!302078 (or (= lt!226828 (MissingZero!3988 i!1204)) (= lt!226828 (MissingVacant!3988 i!1204))))))

(assert (=> b!500100 (= lt!226828 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!45450 res!302076) b!500098))

(assert (= (and b!500098 res!302070) b!500092))

(assert (= (and b!500092 res!302074) b!500089))

(assert (= (and b!500089 res!302077) b!500099))

(assert (= (and b!500099 res!302069) b!500100))

(assert (= (and b!500100 res!302078) b!500090))

(assert (= (and b!500090 res!302079) b!500087))

(assert (= (and b!500087 res!302075) b!500097))

(assert (= (and b!500097 res!302071) b!500094))

(assert (= (and b!500097 (not res!302080)) b!500093))

(assert (= (and b!500093 (not res!302072)) b!500101))

(assert (= (and b!500101 c!59286) b!500096))

(assert (= (and b!500101 (not c!59286)) b!500091))

(assert (= (and b!500096 res!302073) b!500095))

(assert (= (and b!500101 (not res!302081)) b!500088))

(declare-fun m!480745 () Bool)

(assert (=> b!500090 m!480745))

(declare-fun m!480747 () Bool)

(assert (=> b!500100 m!480747))

(declare-fun m!480749 () Bool)

(assert (=> b!500087 m!480749))

(declare-fun m!480751 () Bool)

(assert (=> b!500088 m!480751))

(declare-fun m!480753 () Bool)

(assert (=> start!45450 m!480753))

(declare-fun m!480755 () Bool)

(assert (=> start!45450 m!480755))

(declare-fun m!480757 () Bool)

(assert (=> b!500099 m!480757))

(declare-fun m!480759 () Bool)

(assert (=> b!500089 m!480759))

(declare-fun m!480761 () Bool)

(assert (=> b!500097 m!480761))

(declare-fun m!480763 () Bool)

(assert (=> b!500097 m!480763))

(declare-fun m!480765 () Bool)

(assert (=> b!500097 m!480765))

(declare-fun m!480767 () Bool)

(assert (=> b!500097 m!480767))

(assert (=> b!500097 m!480765))

(declare-fun m!480769 () Bool)

(assert (=> b!500097 m!480769))

(assert (=> b!500097 m!480765))

(declare-fun m!480771 () Bool)

(assert (=> b!500097 m!480771))

(declare-fun m!480773 () Bool)

(assert (=> b!500097 m!480773))

(declare-fun m!480775 () Bool)

(assert (=> b!500097 m!480775))

(declare-fun m!480777 () Bool)

(assert (=> b!500097 m!480777))

(declare-fun m!480779 () Bool)

(assert (=> b!500096 m!480779))

(assert (=> b!500096 m!480751))

(declare-fun m!480781 () Bool)

(assert (=> b!500101 m!480781))

(assert (=> b!500101 m!480765))

(assert (=> b!500092 m!480765))

(assert (=> b!500092 m!480765))

(declare-fun m!480783 () Bool)

(assert (=> b!500092 m!480783))

(assert (=> b!500094 m!480765))

(assert (=> b!500094 m!480765))

(declare-fun m!480785 () Bool)

(assert (=> b!500094 m!480785))

(check-sat (not b!500097) (not b!500088) (not b!500089) (not b!500096) (not b!500087) (not b!500090) (not b!500094) (not b!500100) (not b!500099) (not b!500092) (not start!45450))
(check-sat)
