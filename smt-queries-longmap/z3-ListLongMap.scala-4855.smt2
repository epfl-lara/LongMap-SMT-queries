; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66806 () Bool)

(assert start!66806)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42387 0))(
  ( (array!42388 (arr!20294 (Array (_ BitVec 32) (_ BitVec 64))) (size!20715 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42387)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun e!429204 () Bool)

(declare-datatypes ((SeekEntryResult!7891 0))(
  ( (MissingZero!7891 (index!33932 (_ BitVec 32))) (Found!7891 (index!33933 (_ BitVec 32))) (Intermediate!7891 (undefined!8703 Bool) (index!33934 (_ BitVec 32)) (x!64865 (_ BitVec 32))) (Undefined!7891) (MissingVacant!7891 (index!33935 (_ BitVec 32))) )
))
(declare-fun lt!343093 () SeekEntryResult!7891)

(declare-fun b!770986 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42387 (_ BitVec 32)) SeekEntryResult!7891)

(assert (=> b!770986 (= e!429204 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20294 a!3186) j!159) a!3186 mask!3328) lt!343093))))

(declare-fun res!521684 () Bool)

(declare-fun e!429201 () Bool)

(assert (=> start!66806 (=> (not res!521684) (not e!429201))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66806 (= res!521684 (validMask!0 mask!3328))))

(assert (=> start!66806 e!429201))

(assert (=> start!66806 true))

(declare-fun array_inv!16177 (array!42387) Bool)

(assert (=> start!66806 (array_inv!16177 a!3186)))

(declare-fun b!770987 () Bool)

(declare-fun e!429203 () Bool)

(assert (=> b!770987 (= e!429203 e!429204)))

(declare-fun res!521681 () Bool)

(assert (=> b!770987 (=> (not res!521681) (not e!429204))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42387 (_ BitVec 32)) SeekEntryResult!7891)

(assert (=> b!770987 (= res!521681 (= (seekEntryOrOpen!0 (select (arr!20294 a!3186) j!159) a!3186 mask!3328) lt!343093))))

(assert (=> b!770987 (= lt!343093 (Found!7891 j!159))))

(declare-fun b!770988 () Bool)

(declare-fun e!429197 () Bool)

(declare-fun e!429205 () Bool)

(assert (=> b!770988 (= e!429197 (not e!429205))))

(declare-fun res!521685 () Bool)

(assert (=> b!770988 (=> res!521685 e!429205)))

(declare-fun lt!343098 () SeekEntryResult!7891)

(declare-fun x!1131 () (_ BitVec 32))

(get-info :version)

(assert (=> b!770988 (= res!521685 (or (not ((_ is Intermediate!7891) lt!343098)) (bvsge x!1131 (x!64865 lt!343098))))))

(assert (=> b!770988 e!429203))

(declare-fun res!521694 () Bool)

(assert (=> b!770988 (=> (not res!521694) (not e!429203))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42387 (_ BitVec 32)) Bool)

(assert (=> b!770988 (= res!521694 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26558 0))(
  ( (Unit!26559) )
))
(declare-fun lt!343095 () Unit!26558)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42387 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26558)

(assert (=> b!770988 (= lt!343095 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!770989 () Bool)

(declare-fun res!521691 () Bool)

(assert (=> b!770989 (=> (not res!521691) (not e!429201))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!770989 (= res!521691 (validKeyInArray!0 (select (arr!20294 a!3186) j!159)))))

(declare-fun b!770990 () Bool)

(declare-fun e!429200 () Bool)

(declare-fun e!429198 () Bool)

(assert (=> b!770990 (= e!429200 e!429198)))

(declare-fun res!521680 () Bool)

(assert (=> b!770990 (=> (not res!521680) (not e!429198))))

(declare-fun lt!343101 () SeekEntryResult!7891)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42387 (_ BitVec 32)) SeekEntryResult!7891)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!770990 (= res!521680 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20294 a!3186) j!159) mask!3328) (select (arr!20294 a!3186) j!159) a!3186 mask!3328) lt!343101))))

(assert (=> b!770990 (= lt!343101 (Intermediate!7891 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!770991 () Bool)

(declare-fun res!521683 () Bool)

(assert (=> b!770991 (=> (not res!521683) (not e!429200))))

(declare-datatypes ((List!14335 0))(
  ( (Nil!14332) (Cons!14331 (h!15430 (_ BitVec 64)) (t!20641 List!14335)) )
))
(declare-fun arrayNoDuplicates!0 (array!42387 (_ BitVec 32) List!14335) Bool)

(assert (=> b!770991 (= res!521683 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14332))))

(declare-fun b!770992 () Bool)

(declare-fun res!521690 () Bool)

(assert (=> b!770992 (=> (not res!521690) (not e!429200))))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!770992 (= res!521690 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20715 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20715 a!3186))))))

(declare-fun b!770993 () Bool)

(declare-fun res!521682 () Bool)

(assert (=> b!770993 (=> (not res!521682) (not e!429198))))

(declare-fun e!429199 () Bool)

(assert (=> b!770993 (= res!521682 e!429199)))

(declare-fun c!85050 () Bool)

(assert (=> b!770993 (= c!85050 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!770994 () Bool)

(declare-fun res!521687 () Bool)

(assert (=> b!770994 (=> (not res!521687) (not e!429201))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42387 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!770994 (= res!521687 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!770995 () Bool)

(declare-fun e!429202 () Unit!26558)

(declare-fun Unit!26560 () Unit!26558)

(assert (=> b!770995 (= e!429202 Unit!26560)))

(declare-fun lt!343096 () SeekEntryResult!7891)

(assert (=> b!770995 (= lt!343096 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20294 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!343099 () (_ BitVec 32))

(assert (=> b!770995 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343099 resIntermediateIndex!5 (select (arr!20294 a!3186) j!159) a!3186 mask!3328) (Found!7891 j!159))))

(declare-fun b!770996 () Bool)

(assert (=> b!770996 (= e!429201 e!429200)))

(declare-fun res!521688 () Bool)

(assert (=> b!770996 (=> (not res!521688) (not e!429200))))

(declare-fun lt!343094 () SeekEntryResult!7891)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!770996 (= res!521688 (or (= lt!343094 (MissingZero!7891 i!1173)) (= lt!343094 (MissingVacant!7891 i!1173))))))

(assert (=> b!770996 (= lt!343094 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!770997 () Bool)

(declare-fun res!521679 () Bool)

(assert (=> b!770997 (=> (not res!521679) (not e!429201))))

(assert (=> b!770997 (= res!521679 (validKeyInArray!0 k0!2102))))

(declare-fun b!770998 () Bool)

(assert (=> b!770998 (= e!429205 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110))))

(declare-fun lt!343103 () Unit!26558)

(assert (=> b!770998 (= lt!343103 e!429202)))

(declare-fun c!85049 () Bool)

(assert (=> b!770998 (= c!85049 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!770998 (= lt!343099 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!770999 () Bool)

(declare-fun Unit!26561 () Unit!26558)

(assert (=> b!770999 (= e!429202 Unit!26561)))

(assert (=> b!770999 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343099 (select (arr!20294 a!3186) j!159) a!3186 mask!3328) lt!343101)))

(declare-fun b!771000 () Bool)

(declare-fun res!521689 () Bool)

(assert (=> b!771000 (=> (not res!521689) (not e!429201))))

(assert (=> b!771000 (= res!521689 (and (= (size!20715 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20715 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20715 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!771001 () Bool)

(assert (=> b!771001 (= e!429198 e!429197)))

(declare-fun res!521693 () Bool)

(assert (=> b!771001 (=> (not res!521693) (not e!429197))))

(declare-fun lt!343100 () SeekEntryResult!7891)

(assert (=> b!771001 (= res!521693 (= lt!343100 lt!343098))))

(declare-fun lt!343097 () array!42387)

(declare-fun lt!343102 () (_ BitVec 64))

(assert (=> b!771001 (= lt!343098 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!343102 lt!343097 mask!3328))))

(assert (=> b!771001 (= lt!343100 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!343102 mask!3328) lt!343102 lt!343097 mask!3328))))

(assert (=> b!771001 (= lt!343102 (select (store (arr!20294 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!771001 (= lt!343097 (array!42388 (store (arr!20294 a!3186) i!1173 k0!2102) (size!20715 a!3186)))))

(declare-fun b!771002 () Bool)

(assert (=> b!771002 (= e!429199 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20294 a!3186) j!159) a!3186 mask!3328) lt!343101))))

(declare-fun b!771003 () Bool)

(declare-fun res!521692 () Bool)

(assert (=> b!771003 (=> (not res!521692) (not e!429200))))

(assert (=> b!771003 (= res!521692 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!771004 () Bool)

(declare-fun res!521686 () Bool)

(assert (=> b!771004 (=> (not res!521686) (not e!429198))))

(assert (=> b!771004 (= res!521686 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20294 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!771005 () Bool)

(assert (=> b!771005 (= e!429199 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20294 a!3186) j!159) a!3186 mask!3328) (Found!7891 j!159)))))

(assert (= (and start!66806 res!521684) b!771000))

(assert (= (and b!771000 res!521689) b!770989))

(assert (= (and b!770989 res!521691) b!770997))

(assert (= (and b!770997 res!521679) b!770994))

(assert (= (and b!770994 res!521687) b!770996))

(assert (= (and b!770996 res!521688) b!771003))

(assert (= (and b!771003 res!521692) b!770991))

(assert (= (and b!770991 res!521683) b!770992))

(assert (= (and b!770992 res!521690) b!770990))

(assert (= (and b!770990 res!521680) b!771004))

(assert (= (and b!771004 res!521686) b!770993))

(assert (= (and b!770993 c!85050) b!771002))

(assert (= (and b!770993 (not c!85050)) b!771005))

(assert (= (and b!770993 res!521682) b!771001))

(assert (= (and b!771001 res!521693) b!770988))

(assert (= (and b!770988 res!521694) b!770987))

(assert (= (and b!770987 res!521681) b!770986))

(assert (= (and b!770988 (not res!521685)) b!770998))

(assert (= (and b!770998 c!85049) b!770999))

(assert (= (and b!770998 (not c!85049)) b!770995))

(declare-fun m!715653 () Bool)

(assert (=> b!771002 m!715653))

(assert (=> b!771002 m!715653))

(declare-fun m!715655 () Bool)

(assert (=> b!771002 m!715655))

(assert (=> b!770995 m!715653))

(assert (=> b!770995 m!715653))

(declare-fun m!715657 () Bool)

(assert (=> b!770995 m!715657))

(assert (=> b!770995 m!715653))

(declare-fun m!715659 () Bool)

(assert (=> b!770995 m!715659))

(assert (=> b!770989 m!715653))

(assert (=> b!770989 m!715653))

(declare-fun m!715661 () Bool)

(assert (=> b!770989 m!715661))

(assert (=> b!770990 m!715653))

(assert (=> b!770990 m!715653))

(declare-fun m!715663 () Bool)

(assert (=> b!770990 m!715663))

(assert (=> b!770990 m!715663))

(assert (=> b!770990 m!715653))

(declare-fun m!715665 () Bool)

(assert (=> b!770990 m!715665))

(declare-fun m!715667 () Bool)

(assert (=> b!771004 m!715667))

(declare-fun m!715669 () Bool)

(assert (=> b!770991 m!715669))

(declare-fun m!715671 () Bool)

(assert (=> b!770997 m!715671))

(declare-fun m!715673 () Bool)

(assert (=> b!770994 m!715673))

(assert (=> b!770987 m!715653))

(assert (=> b!770987 m!715653))

(declare-fun m!715675 () Bool)

(assert (=> b!770987 m!715675))

(assert (=> b!771005 m!715653))

(assert (=> b!771005 m!715653))

(assert (=> b!771005 m!715657))

(declare-fun m!715677 () Bool)

(assert (=> b!770996 m!715677))

(declare-fun m!715679 () Bool)

(assert (=> b!771001 m!715679))

(declare-fun m!715681 () Bool)

(assert (=> b!771001 m!715681))

(declare-fun m!715683 () Bool)

(assert (=> b!771001 m!715683))

(declare-fun m!715685 () Bool)

(assert (=> b!771001 m!715685))

(assert (=> b!771001 m!715679))

(declare-fun m!715687 () Bool)

(assert (=> b!771001 m!715687))

(declare-fun m!715689 () Bool)

(assert (=> start!66806 m!715689))

(declare-fun m!715691 () Bool)

(assert (=> start!66806 m!715691))

(declare-fun m!715693 () Bool)

(assert (=> b!770998 m!715693))

(declare-fun m!715695 () Bool)

(assert (=> b!771003 m!715695))

(assert (=> b!770986 m!715653))

(assert (=> b!770986 m!715653))

(declare-fun m!715697 () Bool)

(assert (=> b!770986 m!715697))

(declare-fun m!715699 () Bool)

(assert (=> b!770988 m!715699))

(declare-fun m!715701 () Bool)

(assert (=> b!770988 m!715701))

(assert (=> b!770999 m!715653))

(assert (=> b!770999 m!715653))

(declare-fun m!715703 () Bool)

(assert (=> b!770999 m!715703))

(check-sat (not b!771003) (not b!771002) (not start!66806) (not b!770997) (not b!770986) (not b!770995) (not b!770998) (not b!770987) (not b!770996) (not b!770999) (not b!771001) (not b!771005) (not b!770994) (not b!770989) (not b!770990) (not b!770988) (not b!770991))
(check-sat)
(get-model)

(declare-fun b!771138 () Bool)

(declare-fun e!429272 () SeekEntryResult!7891)

(assert (=> b!771138 (= e!429272 (MissingVacant!7891 resIntermediateIndex!5))))

(declare-fun d!101495 () Bool)

(declare-fun lt!343175 () SeekEntryResult!7891)

(assert (=> d!101495 (and (or ((_ is Undefined!7891) lt!343175) (not ((_ is Found!7891) lt!343175)) (and (bvsge (index!33933 lt!343175) #b00000000000000000000000000000000) (bvslt (index!33933 lt!343175) (size!20715 a!3186)))) (or ((_ is Undefined!7891) lt!343175) ((_ is Found!7891) lt!343175) (not ((_ is MissingVacant!7891) lt!343175)) (not (= (index!33935 lt!343175) resIntermediateIndex!5)) (and (bvsge (index!33935 lt!343175) #b00000000000000000000000000000000) (bvslt (index!33935 lt!343175) (size!20715 a!3186)))) (or ((_ is Undefined!7891) lt!343175) (ite ((_ is Found!7891) lt!343175) (= (select (arr!20294 a!3186) (index!33933 lt!343175)) (select (arr!20294 a!3186) j!159)) (and ((_ is MissingVacant!7891) lt!343175) (= (index!33935 lt!343175) resIntermediateIndex!5) (= (select (arr!20294 a!3186) (index!33935 lt!343175)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!429274 () SeekEntryResult!7891)

(assert (=> d!101495 (= lt!343175 e!429274)))

(declare-fun c!85069 () Bool)

(assert (=> d!101495 (= c!85069 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!343174 () (_ BitVec 64))

(assert (=> d!101495 (= lt!343174 (select (arr!20294 a!3186) index!1321))))

(assert (=> d!101495 (validMask!0 mask!3328)))

(assert (=> d!101495 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20294 a!3186) j!159) a!3186 mask!3328) lt!343175)))

(declare-fun b!771139 () Bool)

(assert (=> b!771139 (= e!429274 Undefined!7891)))

(declare-fun b!771140 () Bool)

(declare-fun c!85070 () Bool)

(assert (=> b!771140 (= c!85070 (= lt!343174 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!429273 () SeekEntryResult!7891)

(assert (=> b!771140 (= e!429273 e!429272)))

(declare-fun b!771141 () Bool)

(assert (=> b!771141 (= e!429272 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!20294 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!771142 () Bool)

(assert (=> b!771142 (= e!429274 e!429273)))

(declare-fun c!85071 () Bool)

(assert (=> b!771142 (= c!85071 (= lt!343174 (select (arr!20294 a!3186) j!159)))))

(declare-fun b!771143 () Bool)

(assert (=> b!771143 (= e!429273 (Found!7891 index!1321))))

(assert (= (and d!101495 c!85069) b!771139))

(assert (= (and d!101495 (not c!85069)) b!771142))

(assert (= (and b!771142 c!85071) b!771143))

(assert (= (and b!771142 (not c!85071)) b!771140))

(assert (= (and b!771140 c!85070) b!771138))

(assert (= (and b!771140 (not c!85070)) b!771141))

(declare-fun m!715809 () Bool)

(assert (=> d!101495 m!715809))

(declare-fun m!715811 () Bool)

(assert (=> d!101495 m!715811))

(declare-fun m!715813 () Bool)

(assert (=> d!101495 m!715813))

(assert (=> d!101495 m!715689))

(assert (=> b!771141 m!715693))

(assert (=> b!771141 m!715693))

(assert (=> b!771141 m!715653))

(declare-fun m!715815 () Bool)

(assert (=> b!771141 m!715815))

(assert (=> b!771005 d!101495))

(declare-fun d!101497 () Bool)

(declare-fun res!521795 () Bool)

(declare-fun e!429279 () Bool)

(assert (=> d!101497 (=> res!521795 e!429279)))

(assert (=> d!101497 (= res!521795 (= (select (arr!20294 a!3186) #b00000000000000000000000000000000) k0!2102))))

(assert (=> d!101497 (= (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000) e!429279)))

(declare-fun b!771148 () Bool)

(declare-fun e!429280 () Bool)

(assert (=> b!771148 (= e!429279 e!429280)))

(declare-fun res!521796 () Bool)

(assert (=> b!771148 (=> (not res!521796) (not e!429280))))

(assert (=> b!771148 (= res!521796 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20715 a!3186)))))

(declare-fun b!771149 () Bool)

(assert (=> b!771149 (= e!429280 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!101497 (not res!521795)) b!771148))

(assert (= (and b!771148 res!521796) b!771149))

(declare-fun m!715817 () Bool)

(assert (=> d!101497 m!715817))

(declare-fun m!715819 () Bool)

(assert (=> b!771149 m!715819))

(assert (=> b!770994 d!101497))

(declare-fun bm!35083 () Bool)

(declare-fun call!35086 () Bool)

(assert (=> bm!35083 (= call!35086 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!771158 () Bool)

(declare-fun e!429288 () Bool)

(assert (=> b!771158 (= e!429288 call!35086)))

(declare-fun b!771159 () Bool)

(declare-fun e!429287 () Bool)

(assert (=> b!771159 (= e!429287 e!429288)))

(declare-fun lt!343184 () (_ BitVec 64))

(assert (=> b!771159 (= lt!343184 (select (arr!20294 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!343182 () Unit!26558)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42387 (_ BitVec 64) (_ BitVec 32)) Unit!26558)

(assert (=> b!771159 (= lt!343182 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!343184 #b00000000000000000000000000000000))))

(assert (=> b!771159 (arrayContainsKey!0 a!3186 lt!343184 #b00000000000000000000000000000000)))

(declare-fun lt!343183 () Unit!26558)

(assert (=> b!771159 (= lt!343183 lt!343182)))

(declare-fun res!521801 () Bool)

(assert (=> b!771159 (= res!521801 (= (seekEntryOrOpen!0 (select (arr!20294 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7891 #b00000000000000000000000000000000)))))

(assert (=> b!771159 (=> (not res!521801) (not e!429288))))

(declare-fun b!771160 () Bool)

(declare-fun e!429289 () Bool)

(assert (=> b!771160 (= e!429289 e!429287)))

(declare-fun c!85074 () Bool)

(assert (=> b!771160 (= c!85074 (validKeyInArray!0 (select (arr!20294 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!771161 () Bool)

(assert (=> b!771161 (= e!429287 call!35086)))

(declare-fun d!101499 () Bool)

(declare-fun res!521802 () Bool)

(assert (=> d!101499 (=> res!521802 e!429289)))

(assert (=> d!101499 (= res!521802 (bvsge #b00000000000000000000000000000000 (size!20715 a!3186)))))

(assert (=> d!101499 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!429289)))

(assert (= (and d!101499 (not res!521802)) b!771160))

(assert (= (and b!771160 c!85074) b!771159))

(assert (= (and b!771160 (not c!85074)) b!771161))

(assert (= (and b!771159 res!521801) b!771158))

(assert (= (or b!771158 b!771161) bm!35083))

(declare-fun m!715821 () Bool)

(assert (=> bm!35083 m!715821))

(assert (=> b!771159 m!715817))

(declare-fun m!715823 () Bool)

(assert (=> b!771159 m!715823))

(declare-fun m!715825 () Bool)

(assert (=> b!771159 m!715825))

(assert (=> b!771159 m!715817))

(declare-fun m!715827 () Bool)

(assert (=> b!771159 m!715827))

(assert (=> b!771160 m!715817))

(assert (=> b!771160 m!715817))

(declare-fun m!715829 () Bool)

(assert (=> b!771160 m!715829))

(assert (=> b!771003 d!101499))

(declare-fun d!101501 () Bool)

(assert (=> d!101501 (= (validKeyInArray!0 k0!2102) (and (not (= k0!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!770997 d!101501))

(declare-fun b!771162 () Bool)

(declare-fun e!429290 () SeekEntryResult!7891)

(assert (=> b!771162 (= e!429290 (MissingVacant!7891 resIntermediateIndex!5))))

(declare-fun lt!343186 () SeekEntryResult!7891)

(declare-fun d!101503 () Bool)

(assert (=> d!101503 (and (or ((_ is Undefined!7891) lt!343186) (not ((_ is Found!7891) lt!343186)) (and (bvsge (index!33933 lt!343186) #b00000000000000000000000000000000) (bvslt (index!33933 lt!343186) (size!20715 a!3186)))) (or ((_ is Undefined!7891) lt!343186) ((_ is Found!7891) lt!343186) (not ((_ is MissingVacant!7891) lt!343186)) (not (= (index!33935 lt!343186) resIntermediateIndex!5)) (and (bvsge (index!33935 lt!343186) #b00000000000000000000000000000000) (bvslt (index!33935 lt!343186) (size!20715 a!3186)))) (or ((_ is Undefined!7891) lt!343186) (ite ((_ is Found!7891) lt!343186) (= (select (arr!20294 a!3186) (index!33933 lt!343186)) (select (arr!20294 a!3186) j!159)) (and ((_ is MissingVacant!7891) lt!343186) (= (index!33935 lt!343186) resIntermediateIndex!5) (= (select (arr!20294 a!3186) (index!33935 lt!343186)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!429292 () SeekEntryResult!7891)

(assert (=> d!101503 (= lt!343186 e!429292)))

(declare-fun c!85075 () Bool)

(assert (=> d!101503 (= c!85075 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(declare-fun lt!343185 () (_ BitVec 64))

(assert (=> d!101503 (= lt!343185 (select (arr!20294 a!3186) resIntermediateIndex!5))))

(assert (=> d!101503 (validMask!0 mask!3328)))

(assert (=> d!101503 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20294 a!3186) j!159) a!3186 mask!3328) lt!343186)))

(declare-fun b!771163 () Bool)

(assert (=> b!771163 (= e!429292 Undefined!7891)))

(declare-fun b!771164 () Bool)

(declare-fun c!85076 () Bool)

(assert (=> b!771164 (= c!85076 (= lt!343185 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!429291 () SeekEntryResult!7891)

(assert (=> b!771164 (= e!429291 e!429290)))

(declare-fun b!771165 () Bool)

(assert (=> b!771165 (= e!429290 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) resIntermediateIndex!5 (select (arr!20294 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!771166 () Bool)

(assert (=> b!771166 (= e!429292 e!429291)))

(declare-fun c!85077 () Bool)

(assert (=> b!771166 (= c!85077 (= lt!343185 (select (arr!20294 a!3186) j!159)))))

(declare-fun b!771167 () Bool)

(assert (=> b!771167 (= e!429291 (Found!7891 resIntermediateIndex!5))))

(assert (= (and d!101503 c!85075) b!771163))

(assert (= (and d!101503 (not c!85075)) b!771166))

(assert (= (and b!771166 c!85077) b!771167))

(assert (= (and b!771166 (not c!85077)) b!771164))

(assert (= (and b!771164 c!85076) b!771162))

(assert (= (and b!771164 (not c!85076)) b!771165))

(declare-fun m!715831 () Bool)

(assert (=> d!101503 m!715831))

(declare-fun m!715833 () Bool)

(assert (=> d!101503 m!715833))

(assert (=> d!101503 m!715667))

(assert (=> d!101503 m!715689))

(declare-fun m!715835 () Bool)

(assert (=> b!771165 m!715835))

(assert (=> b!771165 m!715835))

(assert (=> b!771165 m!715653))

(declare-fun m!715837 () Bool)

(assert (=> b!771165 m!715837))

(assert (=> b!770986 d!101503))

(declare-fun b!771180 () Bool)

(declare-fun lt!343193 () SeekEntryResult!7891)

(declare-fun e!429299 () SeekEntryResult!7891)

(assert (=> b!771180 (= e!429299 (seekKeyOrZeroReturnVacant!0 (x!64865 lt!343193) (index!33934 lt!343193) (index!33934 lt!343193) k0!2102 a!3186 mask!3328))))

(declare-fun b!771181 () Bool)

(assert (=> b!771181 (= e!429299 (MissingZero!7891 (index!33934 lt!343193)))))

(declare-fun b!771182 () Bool)

(declare-fun e!429301 () SeekEntryResult!7891)

(assert (=> b!771182 (= e!429301 Undefined!7891)))

(declare-fun b!771183 () Bool)

(declare-fun e!429300 () SeekEntryResult!7891)

(assert (=> b!771183 (= e!429301 e!429300)))

(declare-fun lt!343194 () (_ BitVec 64))

(assert (=> b!771183 (= lt!343194 (select (arr!20294 a!3186) (index!33934 lt!343193)))))

(declare-fun c!85085 () Bool)

(assert (=> b!771183 (= c!85085 (= lt!343194 k0!2102))))

(declare-fun b!771184 () Bool)

(assert (=> b!771184 (= e!429300 (Found!7891 (index!33934 lt!343193)))))

(declare-fun d!101505 () Bool)

(declare-fun lt!343195 () SeekEntryResult!7891)

(assert (=> d!101505 (and (or ((_ is Undefined!7891) lt!343195) (not ((_ is Found!7891) lt!343195)) (and (bvsge (index!33933 lt!343195) #b00000000000000000000000000000000) (bvslt (index!33933 lt!343195) (size!20715 a!3186)))) (or ((_ is Undefined!7891) lt!343195) ((_ is Found!7891) lt!343195) (not ((_ is MissingZero!7891) lt!343195)) (and (bvsge (index!33932 lt!343195) #b00000000000000000000000000000000) (bvslt (index!33932 lt!343195) (size!20715 a!3186)))) (or ((_ is Undefined!7891) lt!343195) ((_ is Found!7891) lt!343195) ((_ is MissingZero!7891) lt!343195) (not ((_ is MissingVacant!7891) lt!343195)) (and (bvsge (index!33935 lt!343195) #b00000000000000000000000000000000) (bvslt (index!33935 lt!343195) (size!20715 a!3186)))) (or ((_ is Undefined!7891) lt!343195) (ite ((_ is Found!7891) lt!343195) (= (select (arr!20294 a!3186) (index!33933 lt!343195)) k0!2102) (ite ((_ is MissingZero!7891) lt!343195) (= (select (arr!20294 a!3186) (index!33932 lt!343195)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7891) lt!343195) (= (select (arr!20294 a!3186) (index!33935 lt!343195)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!101505 (= lt!343195 e!429301)))

(declare-fun c!85086 () Bool)

(assert (=> d!101505 (= c!85086 (and ((_ is Intermediate!7891) lt!343193) (undefined!8703 lt!343193)))))

(assert (=> d!101505 (= lt!343193 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328))))

(assert (=> d!101505 (validMask!0 mask!3328)))

(assert (=> d!101505 (= (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328) lt!343195)))

(declare-fun b!771185 () Bool)

(declare-fun c!85084 () Bool)

(assert (=> b!771185 (= c!85084 (= lt!343194 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!771185 (= e!429300 e!429299)))

(assert (= (and d!101505 c!85086) b!771182))

(assert (= (and d!101505 (not c!85086)) b!771183))

(assert (= (and b!771183 c!85085) b!771184))

(assert (= (and b!771183 (not c!85085)) b!771185))

(assert (= (and b!771185 c!85084) b!771181))

(assert (= (and b!771185 (not c!85084)) b!771180))

(declare-fun m!715839 () Bool)

(assert (=> b!771180 m!715839))

(declare-fun m!715841 () Bool)

(assert (=> b!771183 m!715841))

(declare-fun m!715843 () Bool)

(assert (=> d!101505 m!715843))

(declare-fun m!715845 () Bool)

(assert (=> d!101505 m!715845))

(assert (=> d!101505 m!715843))

(declare-fun m!715847 () Bool)

(assert (=> d!101505 m!715847))

(assert (=> d!101505 m!715689))

(declare-fun m!715849 () Bool)

(assert (=> d!101505 m!715849))

(declare-fun m!715851 () Bool)

(assert (=> d!101505 m!715851))

(assert (=> b!770996 d!101505))

(assert (=> b!770995 d!101495))

(declare-fun b!771186 () Bool)

(declare-fun e!429302 () SeekEntryResult!7891)

(assert (=> b!771186 (= e!429302 (MissingVacant!7891 resIntermediateIndex!5))))

(declare-fun lt!343197 () SeekEntryResult!7891)

(declare-fun d!101511 () Bool)

(assert (=> d!101511 (and (or ((_ is Undefined!7891) lt!343197) (not ((_ is Found!7891) lt!343197)) (and (bvsge (index!33933 lt!343197) #b00000000000000000000000000000000) (bvslt (index!33933 lt!343197) (size!20715 a!3186)))) (or ((_ is Undefined!7891) lt!343197) ((_ is Found!7891) lt!343197) (not ((_ is MissingVacant!7891) lt!343197)) (not (= (index!33935 lt!343197) resIntermediateIndex!5)) (and (bvsge (index!33935 lt!343197) #b00000000000000000000000000000000) (bvslt (index!33935 lt!343197) (size!20715 a!3186)))) (or ((_ is Undefined!7891) lt!343197) (ite ((_ is Found!7891) lt!343197) (= (select (arr!20294 a!3186) (index!33933 lt!343197)) (select (arr!20294 a!3186) j!159)) (and ((_ is MissingVacant!7891) lt!343197) (= (index!33935 lt!343197) resIntermediateIndex!5) (= (select (arr!20294 a!3186) (index!33935 lt!343197)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!429304 () SeekEntryResult!7891)

(assert (=> d!101511 (= lt!343197 e!429304)))

(declare-fun c!85087 () Bool)

(assert (=> d!101511 (= c!85087 (bvsge (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110))))

(declare-fun lt!343196 () (_ BitVec 64))

(assert (=> d!101511 (= lt!343196 (select (arr!20294 a!3186) lt!343099))))

(assert (=> d!101511 (validMask!0 mask!3328)))

(assert (=> d!101511 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343099 resIntermediateIndex!5 (select (arr!20294 a!3186) j!159) a!3186 mask!3328) lt!343197)))

(declare-fun b!771187 () Bool)

(assert (=> b!771187 (= e!429304 Undefined!7891)))

(declare-fun b!771188 () Bool)

(declare-fun c!85088 () Bool)

(assert (=> b!771188 (= c!85088 (= lt!343196 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!429303 () SeekEntryResult!7891)

(assert (=> b!771188 (= e!429303 e!429302)))

(declare-fun b!771189 () Bool)

(assert (=> b!771189 (= e!429302 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131 #b00000000000000000000000000000001) (nextIndex!0 lt!343099 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328) resIntermediateIndex!5 (select (arr!20294 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!771190 () Bool)

(assert (=> b!771190 (= e!429304 e!429303)))

(declare-fun c!85089 () Bool)

(assert (=> b!771190 (= c!85089 (= lt!343196 (select (arr!20294 a!3186) j!159)))))

(declare-fun b!771191 () Bool)

(assert (=> b!771191 (= e!429303 (Found!7891 lt!343099))))

(assert (= (and d!101511 c!85087) b!771187))

(assert (= (and d!101511 (not c!85087)) b!771190))

(assert (= (and b!771190 c!85089) b!771191))

(assert (= (and b!771190 (not c!85089)) b!771188))

(assert (= (and b!771188 c!85088) b!771186))

(assert (= (and b!771188 (not c!85088)) b!771189))

(declare-fun m!715853 () Bool)

(assert (=> d!101511 m!715853))

(declare-fun m!715855 () Bool)

(assert (=> d!101511 m!715855))

(declare-fun m!715857 () Bool)

(assert (=> d!101511 m!715857))

(assert (=> d!101511 m!715689))

(declare-fun m!715859 () Bool)

(assert (=> b!771189 m!715859))

(assert (=> b!771189 m!715859))

(assert (=> b!771189 m!715653))

(declare-fun m!715861 () Bool)

(assert (=> b!771189 m!715861))

(assert (=> b!770995 d!101511))

(declare-fun d!101513 () Bool)

(assert (=> d!101513 (= (validKeyInArray!0 (select (arr!20294 a!3186) j!159)) (and (not (= (select (arr!20294 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20294 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!770989 d!101513))

(declare-fun b!771236 () Bool)

(declare-fun e!429330 () SeekEntryResult!7891)

(assert (=> b!771236 (= e!429330 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131 #b00000000000000000000000000000001) (nextIndex!0 lt!343099 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328) (select (arr!20294 a!3186) j!159) a!3186 mask!3328))))

(declare-fun d!101515 () Bool)

(declare-fun e!429333 () Bool)

(assert (=> d!101515 e!429333))

(declare-fun c!85108 () Bool)

(declare-fun lt!343218 () SeekEntryResult!7891)

(assert (=> d!101515 (= c!85108 (and ((_ is Intermediate!7891) lt!343218) (undefined!8703 lt!343218)))))

(declare-fun e!429331 () SeekEntryResult!7891)

(assert (=> d!101515 (= lt!343218 e!429331)))

(declare-fun c!85107 () Bool)

(assert (=> d!101515 (= c!85107 (bvsge (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110))))

(declare-fun lt!343217 () (_ BitVec 64))

(assert (=> d!101515 (= lt!343217 (select (arr!20294 a!3186) lt!343099))))

(assert (=> d!101515 (validMask!0 mask!3328)))

(assert (=> d!101515 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343099 (select (arr!20294 a!3186) j!159) a!3186 mask!3328) lt!343218)))

(declare-fun b!771237 () Bool)

(assert (=> b!771237 (and (bvsge (index!33934 lt!343218) #b00000000000000000000000000000000) (bvslt (index!33934 lt!343218) (size!20715 a!3186)))))

(declare-fun res!521815 () Bool)

(assert (=> b!771237 (= res!521815 (= (select (arr!20294 a!3186) (index!33934 lt!343218)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!429332 () Bool)

(assert (=> b!771237 (=> res!521815 e!429332)))

(declare-fun b!771238 () Bool)

(assert (=> b!771238 (and (bvsge (index!33934 lt!343218) #b00000000000000000000000000000000) (bvslt (index!33934 lt!343218) (size!20715 a!3186)))))

(assert (=> b!771238 (= e!429332 (= (select (arr!20294 a!3186) (index!33934 lt!343218)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!771239 () Bool)

(assert (=> b!771239 (and (bvsge (index!33934 lt!343218) #b00000000000000000000000000000000) (bvslt (index!33934 lt!343218) (size!20715 a!3186)))))

(declare-fun res!521814 () Bool)

(assert (=> b!771239 (= res!521814 (= (select (arr!20294 a!3186) (index!33934 lt!343218)) (select (arr!20294 a!3186) j!159)))))

(assert (=> b!771239 (=> res!521814 e!429332)))

(declare-fun e!429334 () Bool)

(assert (=> b!771239 (= e!429334 e!429332)))

(declare-fun b!771240 () Bool)

(assert (=> b!771240 (= e!429330 (Intermediate!7891 false lt!343099 (bvadd #b00000000000000000000000000000001 x!1131)))))

(declare-fun b!771241 () Bool)

(assert (=> b!771241 (= e!429331 (Intermediate!7891 true lt!343099 (bvadd #b00000000000000000000000000000001 x!1131)))))

(declare-fun b!771242 () Bool)

(assert (=> b!771242 (= e!429333 e!429334)))

(declare-fun res!521813 () Bool)

(assert (=> b!771242 (= res!521813 (and ((_ is Intermediate!7891) lt!343218) (not (undefined!8703 lt!343218)) (bvslt (x!64865 lt!343218) #b01111111111111111111111111111110) (bvsge (x!64865 lt!343218) #b00000000000000000000000000000000) (bvsge (x!64865 lt!343218) (bvadd #b00000000000000000000000000000001 x!1131))))))

(assert (=> b!771242 (=> (not res!521813) (not e!429334))))

(declare-fun b!771243 () Bool)

(assert (=> b!771243 (= e!429333 (bvsge (x!64865 lt!343218) #b01111111111111111111111111111110))))

(declare-fun b!771244 () Bool)

(assert (=> b!771244 (= e!429331 e!429330)))

(declare-fun c!85109 () Bool)

(assert (=> b!771244 (= c!85109 (or (= lt!343217 (select (arr!20294 a!3186) j!159)) (= (bvadd lt!343217 lt!343217) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!101515 c!85107) b!771241))

(assert (= (and d!101515 (not c!85107)) b!771244))

(assert (= (and b!771244 c!85109) b!771240))

(assert (= (and b!771244 (not c!85109)) b!771236))

(assert (= (and d!101515 c!85108) b!771243))

(assert (= (and d!101515 (not c!85108)) b!771242))

(assert (= (and b!771242 res!521813) b!771239))

(assert (= (and b!771239 (not res!521814)) b!771237))

(assert (= (and b!771237 (not res!521815)) b!771238))

(declare-fun m!715873 () Bool)

(assert (=> b!771239 m!715873))

(assert (=> b!771237 m!715873))

(assert (=> d!101515 m!715857))

(assert (=> d!101515 m!715689))

(assert (=> b!771236 m!715859))

(assert (=> b!771236 m!715859))

(assert (=> b!771236 m!715653))

(declare-fun m!715875 () Bool)

(assert (=> b!771236 m!715875))

(assert (=> b!771238 m!715873))

(assert (=> b!770999 d!101515))

(declare-fun bm!35087 () Bool)

(declare-fun call!35090 () Bool)

(assert (=> bm!35087 (= call!35090 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!771249 () Bool)

(declare-fun e!429339 () Bool)

(assert (=> b!771249 (= e!429339 call!35090)))

(declare-fun b!771250 () Bool)

(declare-fun e!429338 () Bool)

(assert (=> b!771250 (= e!429338 e!429339)))

(declare-fun lt!343224 () (_ BitVec 64))

(assert (=> b!771250 (= lt!343224 (select (arr!20294 a!3186) j!159))))

(declare-fun lt!343222 () Unit!26558)

(assert (=> b!771250 (= lt!343222 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!343224 j!159))))

(assert (=> b!771250 (arrayContainsKey!0 a!3186 lt!343224 #b00000000000000000000000000000000)))

(declare-fun lt!343223 () Unit!26558)

(assert (=> b!771250 (= lt!343223 lt!343222)))

(declare-fun res!521818 () Bool)

(assert (=> b!771250 (= res!521818 (= (seekEntryOrOpen!0 (select (arr!20294 a!3186) j!159) a!3186 mask!3328) (Found!7891 j!159)))))

(assert (=> b!771250 (=> (not res!521818) (not e!429339))))

(declare-fun b!771251 () Bool)

(declare-fun e!429340 () Bool)

(assert (=> b!771251 (= e!429340 e!429338)))

(declare-fun c!85111 () Bool)

(assert (=> b!771251 (= c!85111 (validKeyInArray!0 (select (arr!20294 a!3186) j!159)))))

(declare-fun b!771252 () Bool)

(assert (=> b!771252 (= e!429338 call!35090)))

(declare-fun d!101523 () Bool)

(declare-fun res!521819 () Bool)

(assert (=> d!101523 (=> res!521819 e!429340)))

(assert (=> d!101523 (= res!521819 (bvsge j!159 (size!20715 a!3186)))))

(assert (=> d!101523 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!429340)))

(assert (= (and d!101523 (not res!521819)) b!771251))

(assert (= (and b!771251 c!85111) b!771250))

(assert (= (and b!771251 (not c!85111)) b!771252))

(assert (= (and b!771250 res!521818) b!771249))

(assert (= (or b!771249 b!771252) bm!35087))

(declare-fun m!715877 () Bool)

(assert (=> bm!35087 m!715877))

(assert (=> b!771250 m!715653))

(declare-fun m!715883 () Bool)

(assert (=> b!771250 m!715883))

(declare-fun m!715885 () Bool)

(assert (=> b!771250 m!715885))

(assert (=> b!771250 m!715653))

(assert (=> b!771250 m!715675))

(assert (=> b!771251 m!715653))

(assert (=> b!771251 m!715653))

(assert (=> b!771251 m!715661))

(assert (=> b!770988 d!101523))

(declare-fun d!101525 () Bool)

(assert (=> d!101525 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!343231 () Unit!26558)

(declare-fun choose!38 (array!42387 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26558)

(assert (=> d!101525 (= lt!343231 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!101525 (validMask!0 mask!3328)))

(assert (=> d!101525 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!343231)))

(declare-fun bs!21559 () Bool)

(assert (= bs!21559 d!101525))

(assert (=> bs!21559 m!715699))

(declare-fun m!715895 () Bool)

(assert (=> bs!21559 m!715895))

(assert (=> bs!21559 m!715689))

(assert (=> b!770988 d!101525))

(declare-fun b!771281 () Bool)

(declare-fun lt!343232 () SeekEntryResult!7891)

(declare-fun e!429359 () SeekEntryResult!7891)

(assert (=> b!771281 (= e!429359 (seekKeyOrZeroReturnVacant!0 (x!64865 lt!343232) (index!33934 lt!343232) (index!33934 lt!343232) (select (arr!20294 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!771282 () Bool)

(assert (=> b!771282 (= e!429359 (MissingZero!7891 (index!33934 lt!343232)))))

(declare-fun b!771283 () Bool)

(declare-fun e!429361 () SeekEntryResult!7891)

(assert (=> b!771283 (= e!429361 Undefined!7891)))

(declare-fun b!771284 () Bool)

(declare-fun e!429360 () SeekEntryResult!7891)

(assert (=> b!771284 (= e!429361 e!429360)))

(declare-fun lt!343233 () (_ BitVec 64))

(assert (=> b!771284 (= lt!343233 (select (arr!20294 a!3186) (index!33934 lt!343232)))))

(declare-fun c!85121 () Bool)

(assert (=> b!771284 (= c!85121 (= lt!343233 (select (arr!20294 a!3186) j!159)))))

(declare-fun b!771285 () Bool)

(assert (=> b!771285 (= e!429360 (Found!7891 (index!33934 lt!343232)))))

(declare-fun d!101529 () Bool)

(declare-fun lt!343234 () SeekEntryResult!7891)

(assert (=> d!101529 (and (or ((_ is Undefined!7891) lt!343234) (not ((_ is Found!7891) lt!343234)) (and (bvsge (index!33933 lt!343234) #b00000000000000000000000000000000) (bvslt (index!33933 lt!343234) (size!20715 a!3186)))) (or ((_ is Undefined!7891) lt!343234) ((_ is Found!7891) lt!343234) (not ((_ is MissingZero!7891) lt!343234)) (and (bvsge (index!33932 lt!343234) #b00000000000000000000000000000000) (bvslt (index!33932 lt!343234) (size!20715 a!3186)))) (or ((_ is Undefined!7891) lt!343234) ((_ is Found!7891) lt!343234) ((_ is MissingZero!7891) lt!343234) (not ((_ is MissingVacant!7891) lt!343234)) (and (bvsge (index!33935 lt!343234) #b00000000000000000000000000000000) (bvslt (index!33935 lt!343234) (size!20715 a!3186)))) (or ((_ is Undefined!7891) lt!343234) (ite ((_ is Found!7891) lt!343234) (= (select (arr!20294 a!3186) (index!33933 lt!343234)) (select (arr!20294 a!3186) j!159)) (ite ((_ is MissingZero!7891) lt!343234) (= (select (arr!20294 a!3186) (index!33932 lt!343234)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7891) lt!343234) (= (select (arr!20294 a!3186) (index!33935 lt!343234)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!101529 (= lt!343234 e!429361)))

(declare-fun c!85122 () Bool)

(assert (=> d!101529 (= c!85122 (and ((_ is Intermediate!7891) lt!343232) (undefined!8703 lt!343232)))))

(assert (=> d!101529 (= lt!343232 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20294 a!3186) j!159) mask!3328) (select (arr!20294 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!101529 (validMask!0 mask!3328)))

(assert (=> d!101529 (= (seekEntryOrOpen!0 (select (arr!20294 a!3186) j!159) a!3186 mask!3328) lt!343234)))

(declare-fun b!771286 () Bool)

(declare-fun c!85120 () Bool)

(assert (=> b!771286 (= c!85120 (= lt!343233 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!771286 (= e!429360 e!429359)))

(assert (= (and d!101529 c!85122) b!771283))

(assert (= (and d!101529 (not c!85122)) b!771284))

(assert (= (and b!771284 c!85121) b!771285))

(assert (= (and b!771284 (not c!85121)) b!771286))

(assert (= (and b!771286 c!85120) b!771282))

(assert (= (and b!771286 (not c!85120)) b!771281))

(assert (=> b!771281 m!715653))

(declare-fun m!715897 () Bool)

(assert (=> b!771281 m!715897))

(declare-fun m!715899 () Bool)

(assert (=> b!771284 m!715899))

(assert (=> d!101529 m!715653))

(assert (=> d!101529 m!715663))

(declare-fun m!715901 () Bool)

(assert (=> d!101529 m!715901))

(assert (=> d!101529 m!715663))

(assert (=> d!101529 m!715653))

(assert (=> d!101529 m!715665))

(assert (=> d!101529 m!715689))

(declare-fun m!715903 () Bool)

(assert (=> d!101529 m!715903))

(declare-fun m!715905 () Bool)

(assert (=> d!101529 m!715905))

(assert (=> b!770987 d!101529))

(declare-fun d!101531 () Bool)

(assert (=> d!101531 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!66806 d!101531))

(declare-fun d!101541 () Bool)

(assert (=> d!101541 (= (array_inv!16177 a!3186) (bvsge (size!20715 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!66806 d!101541))

(declare-fun d!101543 () Bool)

(declare-fun lt!343245 () (_ BitVec 32))

(assert (=> d!101543 (and (bvsge lt!343245 #b00000000000000000000000000000000) (bvslt lt!343245 (bvadd mask!3328 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!101543 (= lt!343245 (choose!52 index!1321 x!1131 mask!3328))))

(assert (=> d!101543 (validMask!0 mask!3328)))

(assert (=> d!101543 (= (nextIndex!0 index!1321 x!1131 mask!3328) lt!343245)))

(declare-fun bs!21560 () Bool)

(assert (= bs!21560 d!101543))

(declare-fun m!715923 () Bool)

(assert (=> bs!21560 m!715923))

(assert (=> bs!21560 m!715689))

(assert (=> b!770998 d!101543))

(declare-fun b!771317 () Bool)

(declare-fun e!429385 () Bool)

(declare-fun call!35096 () Bool)

(assert (=> b!771317 (= e!429385 call!35096)))

(declare-fun b!771318 () Bool)

(declare-fun e!429388 () Bool)

(declare-fun e!429386 () Bool)

(assert (=> b!771318 (= e!429388 e!429386)))

(declare-fun res!521851 () Bool)

(assert (=> b!771318 (=> (not res!521851) (not e!429386))))

(declare-fun e!429387 () Bool)

(assert (=> b!771318 (= res!521851 (not e!429387))))

(declare-fun res!521853 () Bool)

(assert (=> b!771318 (=> (not res!521853) (not e!429387))))

(assert (=> b!771318 (= res!521853 (validKeyInArray!0 (select (arr!20294 a!3186) #b00000000000000000000000000000000)))))

(declare-fun bm!35093 () Bool)

(declare-fun c!85129 () Bool)

(assert (=> bm!35093 (= call!35096 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!85129 (Cons!14331 (select (arr!20294 a!3186) #b00000000000000000000000000000000) Nil!14332) Nil!14332)))))

(declare-fun b!771319 () Bool)

(assert (=> b!771319 (= e!429385 call!35096)))

(declare-fun d!101545 () Bool)

(declare-fun res!521852 () Bool)

(assert (=> d!101545 (=> res!521852 e!429388)))

(assert (=> d!101545 (= res!521852 (bvsge #b00000000000000000000000000000000 (size!20715 a!3186)))))

(assert (=> d!101545 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14332) e!429388)))

(declare-fun b!771320 () Bool)

(assert (=> b!771320 (= e!429386 e!429385)))

(assert (=> b!771320 (= c!85129 (validKeyInArray!0 (select (arr!20294 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!771321 () Bool)

(declare-fun contains!4069 (List!14335 (_ BitVec 64)) Bool)

(assert (=> b!771321 (= e!429387 (contains!4069 Nil!14332 (select (arr!20294 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!101545 (not res!521852)) b!771318))

(assert (= (and b!771318 res!521853) b!771321))

(assert (= (and b!771318 res!521851) b!771320))

(assert (= (and b!771320 c!85129) b!771317))

(assert (= (and b!771320 (not c!85129)) b!771319))

(assert (= (or b!771317 b!771319) bm!35093))

(assert (=> b!771318 m!715817))

(assert (=> b!771318 m!715817))

(assert (=> b!771318 m!715829))

(assert (=> bm!35093 m!715817))

(declare-fun m!715925 () Bool)

(assert (=> bm!35093 m!715925))

(assert (=> b!771320 m!715817))

(assert (=> b!771320 m!715817))

(assert (=> b!771320 m!715829))

(assert (=> b!771321 m!715817))

(assert (=> b!771321 m!715817))

(declare-fun m!715927 () Bool)

(assert (=> b!771321 m!715927))

(assert (=> b!770991 d!101545))

(declare-fun e!429389 () SeekEntryResult!7891)

(declare-fun b!771322 () Bool)

(assert (=> b!771322 (= e!429389 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!20294 a!3186) j!159) a!3186 mask!3328))))

(declare-fun d!101547 () Bool)

(declare-fun e!429392 () Bool)

(assert (=> d!101547 e!429392))

(declare-fun c!85131 () Bool)

(declare-fun lt!343247 () SeekEntryResult!7891)

(assert (=> d!101547 (= c!85131 (and ((_ is Intermediate!7891) lt!343247) (undefined!8703 lt!343247)))))

(declare-fun e!429390 () SeekEntryResult!7891)

(assert (=> d!101547 (= lt!343247 e!429390)))

(declare-fun c!85130 () Bool)

(assert (=> d!101547 (= c!85130 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!343246 () (_ BitVec 64))

(assert (=> d!101547 (= lt!343246 (select (arr!20294 a!3186) index!1321))))

(assert (=> d!101547 (validMask!0 mask!3328)))

(assert (=> d!101547 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20294 a!3186) j!159) a!3186 mask!3328) lt!343247)))

(declare-fun b!771323 () Bool)

(assert (=> b!771323 (and (bvsge (index!33934 lt!343247) #b00000000000000000000000000000000) (bvslt (index!33934 lt!343247) (size!20715 a!3186)))))

(declare-fun res!521856 () Bool)

(assert (=> b!771323 (= res!521856 (= (select (arr!20294 a!3186) (index!33934 lt!343247)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!429391 () Bool)

(assert (=> b!771323 (=> res!521856 e!429391)))

(declare-fun b!771324 () Bool)

(assert (=> b!771324 (and (bvsge (index!33934 lt!343247) #b00000000000000000000000000000000) (bvslt (index!33934 lt!343247) (size!20715 a!3186)))))

(assert (=> b!771324 (= e!429391 (= (select (arr!20294 a!3186) (index!33934 lt!343247)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!771325 () Bool)

(assert (=> b!771325 (and (bvsge (index!33934 lt!343247) #b00000000000000000000000000000000) (bvslt (index!33934 lt!343247) (size!20715 a!3186)))))

(declare-fun res!521855 () Bool)

(assert (=> b!771325 (= res!521855 (= (select (arr!20294 a!3186) (index!33934 lt!343247)) (select (arr!20294 a!3186) j!159)))))

(assert (=> b!771325 (=> res!521855 e!429391)))

(declare-fun e!429393 () Bool)

(assert (=> b!771325 (= e!429393 e!429391)))

(declare-fun b!771326 () Bool)

(assert (=> b!771326 (= e!429389 (Intermediate!7891 false index!1321 x!1131))))

(declare-fun b!771327 () Bool)

(assert (=> b!771327 (= e!429390 (Intermediate!7891 true index!1321 x!1131))))

(declare-fun b!771328 () Bool)

(assert (=> b!771328 (= e!429392 e!429393)))

(declare-fun res!521854 () Bool)

(assert (=> b!771328 (= res!521854 (and ((_ is Intermediate!7891) lt!343247) (not (undefined!8703 lt!343247)) (bvslt (x!64865 lt!343247) #b01111111111111111111111111111110) (bvsge (x!64865 lt!343247) #b00000000000000000000000000000000) (bvsge (x!64865 lt!343247) x!1131)))))

(assert (=> b!771328 (=> (not res!521854) (not e!429393))))

(declare-fun b!771329 () Bool)

(assert (=> b!771329 (= e!429392 (bvsge (x!64865 lt!343247) #b01111111111111111111111111111110))))

(declare-fun b!771330 () Bool)

(assert (=> b!771330 (= e!429390 e!429389)))

(declare-fun c!85132 () Bool)

(assert (=> b!771330 (= c!85132 (or (= lt!343246 (select (arr!20294 a!3186) j!159)) (= (bvadd lt!343246 lt!343246) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!101547 c!85130) b!771327))

(assert (= (and d!101547 (not c!85130)) b!771330))

(assert (= (and b!771330 c!85132) b!771326))

(assert (= (and b!771330 (not c!85132)) b!771322))

(assert (= (and d!101547 c!85131) b!771329))

(assert (= (and d!101547 (not c!85131)) b!771328))

(assert (= (and b!771328 res!521854) b!771325))

(assert (= (and b!771325 (not res!521855)) b!771323))

(assert (= (and b!771323 (not res!521856)) b!771324))

(declare-fun m!715929 () Bool)

(assert (=> b!771325 m!715929))

(assert (=> b!771323 m!715929))

(assert (=> d!101547 m!715813))

(assert (=> d!101547 m!715689))

(assert (=> b!771322 m!715693))

(assert (=> b!771322 m!715693))

(assert (=> b!771322 m!715653))

(declare-fun m!715931 () Bool)

(assert (=> b!771322 m!715931))

(assert (=> b!771324 m!715929))

(assert (=> b!771002 d!101547))

(declare-fun b!771339 () Bool)

(declare-fun e!429396 () SeekEntryResult!7891)

(assert (=> b!771339 (= e!429396 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!343102 lt!343097 mask!3328))))

(declare-fun d!101549 () Bool)

(declare-fun e!429401 () Bool)

(assert (=> d!101549 e!429401))

(declare-fun c!85136 () Bool)

(declare-fun lt!343253 () SeekEntryResult!7891)

(assert (=> d!101549 (= c!85136 (and ((_ is Intermediate!7891) lt!343253) (undefined!8703 lt!343253)))))

(declare-fun e!429397 () SeekEntryResult!7891)

(assert (=> d!101549 (= lt!343253 e!429397)))

(declare-fun c!85135 () Bool)

(assert (=> d!101549 (= c!85135 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!343252 () (_ BitVec 64))

(assert (=> d!101549 (= lt!343252 (select (arr!20294 lt!343097) index!1321))))

(assert (=> d!101549 (validMask!0 mask!3328)))

(assert (=> d!101549 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!343102 lt!343097 mask!3328) lt!343253)))

(declare-fun b!771340 () Bool)

(assert (=> b!771340 (and (bvsge (index!33934 lt!343253) #b00000000000000000000000000000000) (bvslt (index!33934 lt!343253) (size!20715 lt!343097)))))

(declare-fun res!521859 () Bool)

(assert (=> b!771340 (= res!521859 (= (select (arr!20294 lt!343097) (index!33934 lt!343253)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!429399 () Bool)

(assert (=> b!771340 (=> res!521859 e!429399)))

(declare-fun b!771341 () Bool)

(assert (=> b!771341 (and (bvsge (index!33934 lt!343253) #b00000000000000000000000000000000) (bvslt (index!33934 lt!343253) (size!20715 lt!343097)))))

(assert (=> b!771341 (= e!429399 (= (select (arr!20294 lt!343097) (index!33934 lt!343253)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!771342 () Bool)

(assert (=> b!771342 (and (bvsge (index!33934 lt!343253) #b00000000000000000000000000000000) (bvslt (index!33934 lt!343253) (size!20715 lt!343097)))))

(declare-fun res!521858 () Bool)

(assert (=> b!771342 (= res!521858 (= (select (arr!20294 lt!343097) (index!33934 lt!343253)) lt!343102))))

(assert (=> b!771342 (=> res!521858 e!429399)))

(declare-fun e!429402 () Bool)

(assert (=> b!771342 (= e!429402 e!429399)))

(declare-fun b!771343 () Bool)

(assert (=> b!771343 (= e!429396 (Intermediate!7891 false index!1321 x!1131))))

(declare-fun b!771344 () Bool)

(assert (=> b!771344 (= e!429397 (Intermediate!7891 true index!1321 x!1131))))

(declare-fun b!771345 () Bool)

(assert (=> b!771345 (= e!429401 e!429402)))

(declare-fun res!521857 () Bool)

(assert (=> b!771345 (= res!521857 (and ((_ is Intermediate!7891) lt!343253) (not (undefined!8703 lt!343253)) (bvslt (x!64865 lt!343253) #b01111111111111111111111111111110) (bvsge (x!64865 lt!343253) #b00000000000000000000000000000000) (bvsge (x!64865 lt!343253) x!1131)))))

(assert (=> b!771345 (=> (not res!521857) (not e!429402))))

(declare-fun b!771346 () Bool)

(assert (=> b!771346 (= e!429401 (bvsge (x!64865 lt!343253) #b01111111111111111111111111111110))))

(declare-fun b!771347 () Bool)

(assert (=> b!771347 (= e!429397 e!429396)))

(declare-fun c!85139 () Bool)

(assert (=> b!771347 (= c!85139 (or (= lt!343252 lt!343102) (= (bvadd lt!343252 lt!343252) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!101549 c!85135) b!771344))

(assert (= (and d!101549 (not c!85135)) b!771347))

(assert (= (and b!771347 c!85139) b!771343))

(assert (= (and b!771347 (not c!85139)) b!771339))

(assert (= (and d!101549 c!85136) b!771346))

(assert (= (and d!101549 (not c!85136)) b!771345))

(assert (= (and b!771345 res!521857) b!771342))

(assert (= (and b!771342 (not res!521858)) b!771340))

(assert (= (and b!771340 (not res!521859)) b!771341))

(declare-fun m!715933 () Bool)

(assert (=> b!771342 m!715933))

(assert (=> b!771340 m!715933))

(declare-fun m!715935 () Bool)

(assert (=> d!101549 m!715935))

(assert (=> d!101549 m!715689))

(assert (=> b!771339 m!715693))

(assert (=> b!771339 m!715693))

(declare-fun m!715937 () Bool)

(assert (=> b!771339 m!715937))

(assert (=> b!771341 m!715933))

(assert (=> b!771001 d!101549))

(declare-fun e!429403 () SeekEntryResult!7891)

(declare-fun b!771350 () Bool)

(assert (=> b!771350 (= e!429403 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!343102 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!343102 lt!343097 mask!3328))))

(declare-fun d!101551 () Bool)

(declare-fun e!429406 () Bool)

(assert (=> d!101551 e!429406))

(declare-fun c!85141 () Bool)

(declare-fun lt!343255 () SeekEntryResult!7891)

(assert (=> d!101551 (= c!85141 (and ((_ is Intermediate!7891) lt!343255) (undefined!8703 lt!343255)))))

(declare-fun e!429404 () SeekEntryResult!7891)

(assert (=> d!101551 (= lt!343255 e!429404)))

(declare-fun c!85140 () Bool)

(assert (=> d!101551 (= c!85140 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!343254 () (_ BitVec 64))

(assert (=> d!101551 (= lt!343254 (select (arr!20294 lt!343097) (toIndex!0 lt!343102 mask!3328)))))

(assert (=> d!101551 (validMask!0 mask!3328)))

(assert (=> d!101551 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!343102 mask!3328) lt!343102 lt!343097 mask!3328) lt!343255)))

(declare-fun b!771351 () Bool)

(assert (=> b!771351 (and (bvsge (index!33934 lt!343255) #b00000000000000000000000000000000) (bvslt (index!33934 lt!343255) (size!20715 lt!343097)))))

(declare-fun res!521862 () Bool)

(assert (=> b!771351 (= res!521862 (= (select (arr!20294 lt!343097) (index!33934 lt!343255)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!429405 () Bool)

(assert (=> b!771351 (=> res!521862 e!429405)))

(declare-fun b!771352 () Bool)

(assert (=> b!771352 (and (bvsge (index!33934 lt!343255) #b00000000000000000000000000000000) (bvslt (index!33934 lt!343255) (size!20715 lt!343097)))))

(assert (=> b!771352 (= e!429405 (= (select (arr!20294 lt!343097) (index!33934 lt!343255)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!771353 () Bool)

(assert (=> b!771353 (and (bvsge (index!33934 lt!343255) #b00000000000000000000000000000000) (bvslt (index!33934 lt!343255) (size!20715 lt!343097)))))

(declare-fun res!521861 () Bool)

(assert (=> b!771353 (= res!521861 (= (select (arr!20294 lt!343097) (index!33934 lt!343255)) lt!343102))))

(assert (=> b!771353 (=> res!521861 e!429405)))

(declare-fun e!429407 () Bool)

(assert (=> b!771353 (= e!429407 e!429405)))

(declare-fun b!771354 () Bool)

(assert (=> b!771354 (= e!429403 (Intermediate!7891 false (toIndex!0 lt!343102 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!771355 () Bool)

(assert (=> b!771355 (= e!429404 (Intermediate!7891 true (toIndex!0 lt!343102 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!771356 () Bool)

(assert (=> b!771356 (= e!429406 e!429407)))

(declare-fun res!521860 () Bool)

(assert (=> b!771356 (= res!521860 (and ((_ is Intermediate!7891) lt!343255) (not (undefined!8703 lt!343255)) (bvslt (x!64865 lt!343255) #b01111111111111111111111111111110) (bvsge (x!64865 lt!343255) #b00000000000000000000000000000000) (bvsge (x!64865 lt!343255) #b00000000000000000000000000000000)))))

(assert (=> b!771356 (=> (not res!521860) (not e!429407))))

(declare-fun b!771357 () Bool)

(assert (=> b!771357 (= e!429406 (bvsge (x!64865 lt!343255) #b01111111111111111111111111111110))))

(declare-fun b!771358 () Bool)

(assert (=> b!771358 (= e!429404 e!429403)))

(declare-fun c!85142 () Bool)

(assert (=> b!771358 (= c!85142 (or (= lt!343254 lt!343102) (= (bvadd lt!343254 lt!343254) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!101551 c!85140) b!771355))

(assert (= (and d!101551 (not c!85140)) b!771358))

(assert (= (and b!771358 c!85142) b!771354))

(assert (= (and b!771358 (not c!85142)) b!771350))

(assert (= (and d!101551 c!85141) b!771357))

(assert (= (and d!101551 (not c!85141)) b!771356))

(assert (= (and b!771356 res!521860) b!771353))

(assert (= (and b!771353 (not res!521861)) b!771351))

(assert (= (and b!771351 (not res!521862)) b!771352))

(declare-fun m!715939 () Bool)

(assert (=> b!771353 m!715939))

(assert (=> b!771351 m!715939))

(assert (=> d!101551 m!715679))

(declare-fun m!715941 () Bool)

(assert (=> d!101551 m!715941))

(assert (=> d!101551 m!715689))

(assert (=> b!771350 m!715679))

(declare-fun m!715943 () Bool)

(assert (=> b!771350 m!715943))

(assert (=> b!771350 m!715943))

(declare-fun m!715945 () Bool)

(assert (=> b!771350 m!715945))

(assert (=> b!771352 m!715939))

(assert (=> b!771001 d!101551))

(declare-fun d!101553 () Bool)

(declare-fun lt!343269 () (_ BitVec 32))

(declare-fun lt!343268 () (_ BitVec 32))

(assert (=> d!101553 (= lt!343269 (bvmul (bvxor lt!343268 (bvlshr lt!343268 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!101553 (= lt!343268 ((_ extract 31 0) (bvand (bvxor lt!343102 (bvlshr lt!343102 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!101553 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!521869 (let ((h!15434 ((_ extract 31 0) (bvand (bvxor lt!343102 (bvlshr lt!343102 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64876 (bvmul (bvxor h!15434 (bvlshr h!15434 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64876 (bvlshr x!64876 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!521869 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!521869 #b00000000000000000000000000000000))))))

(assert (=> d!101553 (= (toIndex!0 lt!343102 mask!3328) (bvand (bvxor lt!343269 (bvlshr lt!343269 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!771001 d!101553))

(declare-fun e!429425 () SeekEntryResult!7891)

(declare-fun b!771388 () Bool)

(assert (=> b!771388 (= e!429425 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20294 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!20294 a!3186) j!159) a!3186 mask!3328))))

(declare-fun d!101555 () Bool)

(declare-fun e!429428 () Bool)

(assert (=> d!101555 e!429428))

(declare-fun c!85155 () Bool)

(declare-fun lt!343271 () SeekEntryResult!7891)

(assert (=> d!101555 (= c!85155 (and ((_ is Intermediate!7891) lt!343271) (undefined!8703 lt!343271)))))

(declare-fun e!429426 () SeekEntryResult!7891)

(assert (=> d!101555 (= lt!343271 e!429426)))

(declare-fun c!85154 () Bool)

(assert (=> d!101555 (= c!85154 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!343270 () (_ BitVec 64))

(assert (=> d!101555 (= lt!343270 (select (arr!20294 a!3186) (toIndex!0 (select (arr!20294 a!3186) j!159) mask!3328)))))

(assert (=> d!101555 (validMask!0 mask!3328)))

(assert (=> d!101555 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20294 a!3186) j!159) mask!3328) (select (arr!20294 a!3186) j!159) a!3186 mask!3328) lt!343271)))

(declare-fun b!771389 () Bool)

(assert (=> b!771389 (and (bvsge (index!33934 lt!343271) #b00000000000000000000000000000000) (bvslt (index!33934 lt!343271) (size!20715 a!3186)))))

(declare-fun res!521875 () Bool)

(assert (=> b!771389 (= res!521875 (= (select (arr!20294 a!3186) (index!33934 lt!343271)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!429427 () Bool)

(assert (=> b!771389 (=> res!521875 e!429427)))

(declare-fun b!771390 () Bool)

(assert (=> b!771390 (and (bvsge (index!33934 lt!343271) #b00000000000000000000000000000000) (bvslt (index!33934 lt!343271) (size!20715 a!3186)))))

(assert (=> b!771390 (= e!429427 (= (select (arr!20294 a!3186) (index!33934 lt!343271)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!771391 () Bool)

(assert (=> b!771391 (and (bvsge (index!33934 lt!343271) #b00000000000000000000000000000000) (bvslt (index!33934 lt!343271) (size!20715 a!3186)))))

(declare-fun res!521874 () Bool)

(assert (=> b!771391 (= res!521874 (= (select (arr!20294 a!3186) (index!33934 lt!343271)) (select (arr!20294 a!3186) j!159)))))

(assert (=> b!771391 (=> res!521874 e!429427)))

(declare-fun e!429429 () Bool)

(assert (=> b!771391 (= e!429429 e!429427)))

(declare-fun b!771392 () Bool)

(assert (=> b!771392 (= e!429425 (Intermediate!7891 false (toIndex!0 (select (arr!20294 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!771393 () Bool)

(assert (=> b!771393 (= e!429426 (Intermediate!7891 true (toIndex!0 (select (arr!20294 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!771394 () Bool)

(assert (=> b!771394 (= e!429428 e!429429)))

(declare-fun res!521873 () Bool)

(assert (=> b!771394 (= res!521873 (and ((_ is Intermediate!7891) lt!343271) (not (undefined!8703 lt!343271)) (bvslt (x!64865 lt!343271) #b01111111111111111111111111111110) (bvsge (x!64865 lt!343271) #b00000000000000000000000000000000) (bvsge (x!64865 lt!343271) #b00000000000000000000000000000000)))))

(assert (=> b!771394 (=> (not res!521873) (not e!429429))))

(declare-fun b!771395 () Bool)

(assert (=> b!771395 (= e!429428 (bvsge (x!64865 lt!343271) #b01111111111111111111111111111110))))

(declare-fun b!771396 () Bool)

(assert (=> b!771396 (= e!429426 e!429425)))

(declare-fun c!85156 () Bool)

(assert (=> b!771396 (= c!85156 (or (= lt!343270 (select (arr!20294 a!3186) j!159)) (= (bvadd lt!343270 lt!343270) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!101555 c!85154) b!771393))

(assert (= (and d!101555 (not c!85154)) b!771396))

(assert (= (and b!771396 c!85156) b!771392))

(assert (= (and b!771396 (not c!85156)) b!771388))

(assert (= (and d!101555 c!85155) b!771395))

(assert (= (and d!101555 (not c!85155)) b!771394))

(assert (= (and b!771394 res!521873) b!771391))

(assert (= (and b!771391 (not res!521874)) b!771389))

(assert (= (and b!771389 (not res!521875)) b!771390))

(declare-fun m!715953 () Bool)

(assert (=> b!771391 m!715953))

(assert (=> b!771389 m!715953))

(assert (=> d!101555 m!715663))

(declare-fun m!715955 () Bool)

(assert (=> d!101555 m!715955))

(assert (=> d!101555 m!715689))

(assert (=> b!771388 m!715663))

(declare-fun m!715957 () Bool)

(assert (=> b!771388 m!715957))

(assert (=> b!771388 m!715957))

(assert (=> b!771388 m!715653))

(declare-fun m!715959 () Bool)

(assert (=> b!771388 m!715959))

(assert (=> b!771390 m!715953))

(assert (=> b!770990 d!101555))

(declare-fun d!101559 () Bool)

(declare-fun lt!343278 () (_ BitVec 32))

(declare-fun lt!343277 () (_ BitVec 32))

(assert (=> d!101559 (= lt!343278 (bvmul (bvxor lt!343277 (bvlshr lt!343277 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!101559 (= lt!343277 ((_ extract 31 0) (bvand (bvxor (select (arr!20294 a!3186) j!159) (bvlshr (select (arr!20294 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!101559 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!521869 (let ((h!15434 ((_ extract 31 0) (bvand (bvxor (select (arr!20294 a!3186) j!159) (bvlshr (select (arr!20294 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64876 (bvmul (bvxor h!15434 (bvlshr h!15434 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64876 (bvlshr x!64876 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!521869 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!521869 #b00000000000000000000000000000000))))))

(assert (=> d!101559 (= (toIndex!0 (select (arr!20294 a!3186) j!159) mask!3328) (bvand (bvxor lt!343278 (bvlshr lt!343278 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!770990 d!101559))

(check-sat (not b!771180) (not b!771189) (not d!101525) (not b!771251) (not b!771141) (not b!771339) (not d!101543) (not d!101505) (not b!771281) (not b!771318) (not d!101495) (not b!771322) (not b!771350) (not d!101515) (not d!101547) (not d!101551) (not b!771165) (not d!101549) (not b!771159) (not bm!35083) (not d!101503) (not b!771160) (not b!771320) (not bm!35093) (not d!101555) (not d!101529) (not b!771321) (not b!771388) (not b!771236) (not b!771149) (not d!101511) (not bm!35087) (not b!771250))
(check-sat)
