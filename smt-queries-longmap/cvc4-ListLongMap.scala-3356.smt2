; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46132 () Bool)

(assert start!46132)

(declare-fun b!511080 () Bool)

(declare-fun res!311925 () Bool)

(declare-fun e!298652 () Bool)

(assert (=> b!511080 (=> (not res!311925) (not e!298652))))

(declare-datatypes ((array!32843 0))(
  ( (array!32844 (arr!15800 (Array (_ BitVec 32) (_ BitVec 64))) (size!16164 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32843)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32843 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!511080 (= res!311925 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!511081 () Bool)

(declare-fun res!311931 () Bool)

(declare-fun e!298650 () Bool)

(assert (=> b!511081 (=> (not res!311931) (not e!298650))))

(declare-datatypes ((List!9958 0))(
  ( (Nil!9955) (Cons!9954 (h!10831 (_ BitVec 64)) (t!16186 List!9958)) )
))
(declare-fun arrayNoDuplicates!0 (array!32843 (_ BitVec 32) List!9958) Bool)

(assert (=> b!511081 (= res!311931 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9955))))

(declare-fun b!511082 () Bool)

(declare-fun res!311933 () Bool)

(assert (=> b!511082 (=> (not res!311933) (not e!298652))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun mask!3524 () (_ BitVec 32))

(assert (=> b!511082 (= res!311933 (and (= (size!16164 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16164 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16164 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!511083 () Bool)

(declare-fun e!298651 () Bool)

(declare-datatypes ((SeekEntryResult!4267 0))(
  ( (MissingZero!4267 (index!19256 (_ BitVec 32))) (Found!4267 (index!19257 (_ BitVec 32))) (Intermediate!4267 (undefined!5079 Bool) (index!19258 (_ BitVec 32)) (x!48204 (_ BitVec 32))) (Undefined!4267) (MissingVacant!4267 (index!19259 (_ BitVec 32))) )
))
(declare-fun lt!233814 () SeekEntryResult!4267)

(declare-fun lt!233812 () SeekEntryResult!4267)

(assert (=> b!511083 (= e!298651 (or (not (is-Intermediate!4267 lt!233814)) (not (undefined!5079 lt!233814)) (= lt!233812 Undefined!4267)))))

(declare-fun b!511084 () Bool)

(assert (=> b!511084 (= e!298650 (not e!298651))))

(declare-fun res!311926 () Bool)

(assert (=> b!511084 (=> res!311926 e!298651)))

(declare-fun lt!233815 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32843 (_ BitVec 32)) SeekEntryResult!4267)

(assert (=> b!511084 (= res!311926 (= lt!233814 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233815 (select (store (arr!15800 a!3235) i!1204 k!2280) j!176) (array!32844 (store (arr!15800 a!3235) i!1204 k!2280) (size!16164 a!3235)) mask!3524)))))

(declare-fun lt!233813 () (_ BitVec 32))

(assert (=> b!511084 (= lt!233814 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233813 (select (arr!15800 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!511084 (= lt!233815 (toIndex!0 (select (store (arr!15800 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!511084 (= lt!233813 (toIndex!0 (select (arr!15800 a!3235) j!176) mask!3524))))

(assert (=> b!511084 (= lt!233812 (Found!4267 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32843 (_ BitVec 32)) SeekEntryResult!4267)

(assert (=> b!511084 (= lt!233812 (seekEntryOrOpen!0 (select (arr!15800 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32843 (_ BitVec 32)) Bool)

(assert (=> b!511084 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15792 0))(
  ( (Unit!15793) )
))
(declare-fun lt!233810 () Unit!15792)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32843 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15792)

(assert (=> b!511084 (= lt!233810 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!511085 () Bool)

(declare-fun res!311932 () Bool)

(assert (=> b!511085 (=> (not res!311932) (not e!298652))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!511085 (= res!311932 (validKeyInArray!0 (select (arr!15800 a!3235) j!176)))))

(declare-fun b!511086 () Bool)

(declare-fun res!311927 () Bool)

(assert (=> b!511086 (=> (not res!311927) (not e!298652))))

(assert (=> b!511086 (= res!311927 (validKeyInArray!0 k!2280))))

(declare-fun res!311928 () Bool)

(assert (=> start!46132 (=> (not res!311928) (not e!298652))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46132 (= res!311928 (validMask!0 mask!3524))))

(assert (=> start!46132 e!298652))

(assert (=> start!46132 true))

(declare-fun array_inv!11596 (array!32843) Bool)

(assert (=> start!46132 (array_inv!11596 a!3235)))

(declare-fun b!511087 () Bool)

(assert (=> b!511087 (= e!298652 e!298650)))

(declare-fun res!311929 () Bool)

(assert (=> b!511087 (=> (not res!311929) (not e!298650))))

(declare-fun lt!233811 () SeekEntryResult!4267)

(assert (=> b!511087 (= res!311929 (or (= lt!233811 (MissingZero!4267 i!1204)) (= lt!233811 (MissingVacant!4267 i!1204))))))

(assert (=> b!511087 (= lt!233811 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!511088 () Bool)

(declare-fun res!311930 () Bool)

(assert (=> b!511088 (=> (not res!311930) (not e!298650))))

(assert (=> b!511088 (= res!311930 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!46132 res!311928) b!511082))

(assert (= (and b!511082 res!311933) b!511085))

(assert (= (and b!511085 res!311932) b!511086))

(assert (= (and b!511086 res!311927) b!511080))

(assert (= (and b!511080 res!311925) b!511087))

(assert (= (and b!511087 res!311929) b!511088))

(assert (= (and b!511088 res!311930) b!511081))

(assert (= (and b!511081 res!311931) b!511084))

(assert (= (and b!511084 (not res!311926)) b!511083))

(declare-fun m!492609 () Bool)

(assert (=> b!511087 m!492609))

(declare-fun m!492611 () Bool)

(assert (=> b!511080 m!492611))

(declare-fun m!492613 () Bool)

(assert (=> b!511085 m!492613))

(assert (=> b!511085 m!492613))

(declare-fun m!492615 () Bool)

(assert (=> b!511085 m!492615))

(declare-fun m!492617 () Bool)

(assert (=> b!511088 m!492617))

(declare-fun m!492619 () Bool)

(assert (=> b!511081 m!492619))

(declare-fun m!492621 () Bool)

(assert (=> start!46132 m!492621))

(declare-fun m!492623 () Bool)

(assert (=> start!46132 m!492623))

(declare-fun m!492625 () Bool)

(assert (=> b!511086 m!492625))

(declare-fun m!492627 () Bool)

(assert (=> b!511084 m!492627))

(declare-fun m!492629 () Bool)

(assert (=> b!511084 m!492629))

(assert (=> b!511084 m!492629))

(declare-fun m!492631 () Bool)

(assert (=> b!511084 m!492631))

(assert (=> b!511084 m!492613))

(declare-fun m!492633 () Bool)

(assert (=> b!511084 m!492633))

(assert (=> b!511084 m!492613))

(declare-fun m!492635 () Bool)

(assert (=> b!511084 m!492635))

(assert (=> b!511084 m!492613))

(declare-fun m!492637 () Bool)

(assert (=> b!511084 m!492637))

(assert (=> b!511084 m!492629))

(declare-fun m!492639 () Bool)

(assert (=> b!511084 m!492639))

(declare-fun m!492641 () Bool)

(assert (=> b!511084 m!492641))

(assert (=> b!511084 m!492613))

(declare-fun m!492643 () Bool)

(assert (=> b!511084 m!492643))

(push 1)

(assert (not b!511085))

(assert (not b!511087))

(assert (not b!511088))

(assert (not b!511080))

(assert (not b!511086))

(assert (not b!511081))

(assert (not b!511084))

(assert (not start!46132))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!78873 () Bool)

(declare-fun res!311949 () Bool)

(declare-fun e!298681 () Bool)

(assert (=> d!78873 (=> res!311949 e!298681)))

(assert (=> d!78873 (= res!311949 (bvsge #b00000000000000000000000000000000 (size!16164 a!3235)))))

(assert (=> d!78873 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!298681)))

(declare-fun b!511130 () Bool)

(declare-fun e!298683 () Bool)

(assert (=> b!511130 (= e!298681 e!298683)))

(declare-fun c!59870 () Bool)

(assert (=> b!511130 (= c!59870 (validKeyInArray!0 (select (arr!15800 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31496 () Bool)

(declare-fun call!31499 () Bool)

(assert (=> bm!31496 (= call!31499 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!511131 () Bool)

(assert (=> b!511131 (= e!298683 call!31499)))

(declare-fun b!511132 () Bool)

(declare-fun e!298682 () Bool)

(assert (=> b!511132 (= e!298682 call!31499)))

(declare-fun b!511133 () Bool)

(assert (=> b!511133 (= e!298683 e!298682)))

(declare-fun lt!233832 () (_ BitVec 64))

(assert (=> b!511133 (= lt!233832 (select (arr!15800 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!233833 () Unit!15792)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!32843 (_ BitVec 64) (_ BitVec 32)) Unit!15792)

(assert (=> b!511133 (= lt!233833 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!233832 #b00000000000000000000000000000000))))

(assert (=> b!511133 (arrayContainsKey!0 a!3235 lt!233832 #b00000000000000000000000000000000)))

(declare-fun lt!233831 () Unit!15792)

(assert (=> b!511133 (= lt!233831 lt!233833)))

(declare-fun res!311948 () Bool)

(assert (=> b!511133 (= res!311948 (= (seekEntryOrOpen!0 (select (arr!15800 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4267 #b00000000000000000000000000000000)))))

(assert (=> b!511133 (=> (not res!311948) (not e!298682))))

(assert (= (and d!78873 (not res!311949)) b!511130))

(assert (= (and b!511130 c!59870) b!511133))

(assert (= (and b!511130 (not c!59870)) b!511131))

(assert (= (and b!511133 res!311948) b!511132))

(assert (= (or b!511132 b!511131) bm!31496))

(declare-fun m!492667 () Bool)

(assert (=> b!511130 m!492667))

(assert (=> b!511130 m!492667))

(declare-fun m!492669 () Bool)

(assert (=> b!511130 m!492669))

(declare-fun m!492671 () Bool)

(assert (=> bm!31496 m!492671))

(assert (=> b!511133 m!492667))

(declare-fun m!492673 () Bool)

(assert (=> b!511133 m!492673))

(declare-fun m!492675 () Bool)

(assert (=> b!511133 m!492675))

(assert (=> b!511133 m!492667))

(declare-fun m!492677 () Bool)

(assert (=> b!511133 m!492677))

(assert (=> b!511088 d!78873))

(declare-fun d!78885 () Bool)

(assert (=> d!78885 (= (validKeyInArray!0 (select (arr!15800 a!3235) j!176)) (and (not (= (select (arr!15800 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15800 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!511085 d!78885))

(declare-fun b!511186 () Bool)

(declare-fun lt!233872 () SeekEntryResult!4267)

(assert (=> b!511186 (and (bvsge (index!19258 lt!233872) #b00000000000000000000000000000000) (bvslt (index!19258 lt!233872) (size!16164 a!3235)))))

(declare-fun res!311967 () Bool)

(assert (=> b!511186 (= res!311967 (= (select (arr!15800 a!3235) (index!19258 lt!233872)) (select (arr!15800 a!3235) j!176)))))

(declare-fun e!298716 () Bool)

(assert (=> b!511186 (=> res!311967 e!298716)))

(declare-fun e!298718 () Bool)

(assert (=> b!511186 (= e!298718 e!298716)))

(declare-fun b!511187 () Bool)

(declare-fun e!298719 () SeekEntryResult!4267)

(declare-fun e!298715 () SeekEntryResult!4267)

(assert (=> b!511187 (= e!298719 e!298715)))

(declare-fun lt!233871 () (_ BitVec 64))

(declare-fun c!59891 () Bool)

(assert (=> b!511187 (= c!59891 (or (= lt!233871 (select (arr!15800 a!3235) j!176)) (= (bvadd lt!233871 lt!233871) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!511188 () Bool)

(assert (=> b!511188 (= e!298715 (Intermediate!4267 false lt!233813 #b00000000000000000000000000000000))))

(declare-fun b!511189 () Bool)

(declare-fun e!298717 () Bool)

(assert (=> b!511189 (= e!298717 e!298718)))

(declare-fun res!311966 () Bool)

(assert (=> b!511189 (= res!311966 (and (is-Intermediate!4267 lt!233872) (not (undefined!5079 lt!233872)) (bvslt (x!48204 lt!233872) #b01111111111111111111111111111110) (bvsge (x!48204 lt!233872) #b00000000000000000000000000000000) (bvsge (x!48204 lt!233872) #b00000000000000000000000000000000)))))

(assert (=> b!511189 (=> (not res!311966) (not e!298718))))

(declare-fun b!511190 () Bool)

(assert (=> b!511190 (and (bvsge (index!19258 lt!233872) #b00000000000000000000000000000000) (bvslt (index!19258 lt!233872) (size!16164 a!3235)))))

(declare-fun res!311965 () Bool)

(assert (=> b!511190 (= res!311965 (= (select (arr!15800 a!3235) (index!19258 lt!233872)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!511190 (=> res!311965 e!298716)))

(declare-fun b!511191 () Bool)

(assert (=> b!511191 (and (bvsge (index!19258 lt!233872) #b00000000000000000000000000000000) (bvslt (index!19258 lt!233872) (size!16164 a!3235)))))

(assert (=> b!511191 (= e!298716 (= (select (arr!15800 a!3235) (index!19258 lt!233872)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!511192 () Bool)

(assert (=> b!511192 (= e!298719 (Intermediate!4267 true lt!233813 #b00000000000000000000000000000000))))

(declare-fun d!78887 () Bool)

(assert (=> d!78887 e!298717))

(declare-fun c!59890 () Bool)

(assert (=> d!78887 (= c!59890 (and (is-Intermediate!4267 lt!233872) (undefined!5079 lt!233872)))))

(assert (=> d!78887 (= lt!233872 e!298719)))

(declare-fun c!59892 () Bool)

(assert (=> d!78887 (= c!59892 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!78887 (= lt!233871 (select (arr!15800 a!3235) lt!233813))))

(assert (=> d!78887 (validMask!0 mask!3524)))

(assert (=> d!78887 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233813 (select (arr!15800 a!3235) j!176) a!3235 mask!3524) lt!233872)))

(declare-fun b!511193 () Bool)

(assert (=> b!511193 (= e!298717 (bvsge (x!48204 lt!233872) #b01111111111111111111111111111110))))

(declare-fun b!511194 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!511194 (= e!298715 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!233813 #b00000000000000000000000000000000 mask!3524) (select (arr!15800 a!3235) j!176) a!3235 mask!3524))))

(assert (= (and d!78887 c!59892) b!511192))

(assert (= (and d!78887 (not c!59892)) b!511187))

(assert (= (and b!511187 c!59891) b!511188))

(assert (= (and b!511187 (not c!59891)) b!511194))

(assert (= (and d!78887 c!59890) b!511193))

(assert (= (and d!78887 (not c!59890)) b!511189))

(assert (= (and b!511189 res!311966) b!511186))

(assert (= (and b!511186 (not res!311967)) b!511190))

(assert (= (and b!511190 (not res!311965)) b!511191))

(declare-fun m!492705 () Bool)

(assert (=> d!78887 m!492705))

(assert (=> d!78887 m!492621))

(declare-fun m!492707 () Bool)

(assert (=> b!511190 m!492707))

(assert (=> b!511186 m!492707))

(assert (=> b!511191 m!492707))

(declare-fun m!492709 () Bool)

(assert (=> b!511194 m!492709))

(assert (=> b!511194 m!492709))

(assert (=> b!511194 m!492613))

(declare-fun m!492711 () Bool)

(assert (=> b!511194 m!492711))

(assert (=> b!511084 d!78887))

(declare-fun lt!233874 () SeekEntryResult!4267)

(declare-fun b!511195 () Bool)

(assert (=> b!511195 (and (bvsge (index!19258 lt!233874) #b00000000000000000000000000000000) (bvslt (index!19258 lt!233874) (size!16164 (array!32844 (store (arr!15800 a!3235) i!1204 k!2280) (size!16164 a!3235)))))))

(declare-fun res!311970 () Bool)

(assert (=> b!511195 (= res!311970 (= (select (arr!15800 (array!32844 (store (arr!15800 a!3235) i!1204 k!2280) (size!16164 a!3235))) (index!19258 lt!233874)) (select (store (arr!15800 a!3235) i!1204 k!2280) j!176)))))

(declare-fun e!298721 () Bool)

(assert (=> b!511195 (=> res!311970 e!298721)))

(declare-fun e!298723 () Bool)

(assert (=> b!511195 (= e!298723 e!298721)))

(declare-fun b!511196 () Bool)

(declare-fun e!298724 () SeekEntryResult!4267)

(declare-fun e!298720 () SeekEntryResult!4267)

(assert (=> b!511196 (= e!298724 e!298720)))

(declare-fun c!59894 () Bool)

(declare-fun lt!233873 () (_ BitVec 64))

(assert (=> b!511196 (= c!59894 (or (= lt!233873 (select (store (arr!15800 a!3235) i!1204 k!2280) j!176)) (= (bvadd lt!233873 lt!233873) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!511197 () Bool)

(assert (=> b!511197 (= e!298720 (Intermediate!4267 false lt!233815 #b00000000000000000000000000000000))))

(declare-fun b!511198 () Bool)

(declare-fun e!298722 () Bool)

(assert (=> b!511198 (= e!298722 e!298723)))

(declare-fun res!311969 () Bool)

(assert (=> b!511198 (= res!311969 (and (is-Intermediate!4267 lt!233874) (not (undefined!5079 lt!233874)) (bvslt (x!48204 lt!233874) #b01111111111111111111111111111110) (bvsge (x!48204 lt!233874) #b00000000000000000000000000000000) (bvsge (x!48204 lt!233874) #b00000000000000000000000000000000)))))

(assert (=> b!511198 (=> (not res!311969) (not e!298723))))

(declare-fun b!511199 () Bool)

(assert (=> b!511199 (and (bvsge (index!19258 lt!233874) #b00000000000000000000000000000000) (bvslt (index!19258 lt!233874) (size!16164 (array!32844 (store (arr!15800 a!3235) i!1204 k!2280) (size!16164 a!3235)))))))

(declare-fun res!311968 () Bool)

(assert (=> b!511199 (= res!311968 (= (select (arr!15800 (array!32844 (store (arr!15800 a!3235) i!1204 k!2280) (size!16164 a!3235))) (index!19258 lt!233874)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!511199 (=> res!311968 e!298721)))

(declare-fun b!511200 () Bool)

(assert (=> b!511200 (and (bvsge (index!19258 lt!233874) #b00000000000000000000000000000000) (bvslt (index!19258 lt!233874) (size!16164 (array!32844 (store (arr!15800 a!3235) i!1204 k!2280) (size!16164 a!3235)))))))

(assert (=> b!511200 (= e!298721 (= (select (arr!15800 (array!32844 (store (arr!15800 a!3235) i!1204 k!2280) (size!16164 a!3235))) (index!19258 lt!233874)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!511201 () Bool)

(assert (=> b!511201 (= e!298724 (Intermediate!4267 true lt!233815 #b00000000000000000000000000000000))))

(declare-fun d!78899 () Bool)

(assert (=> d!78899 e!298722))

(declare-fun c!59893 () Bool)

(assert (=> d!78899 (= c!59893 (and (is-Intermediate!4267 lt!233874) (undefined!5079 lt!233874)))))

(assert (=> d!78899 (= lt!233874 e!298724)))

(declare-fun c!59895 () Bool)

(assert (=> d!78899 (= c!59895 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!78899 (= lt!233873 (select (arr!15800 (array!32844 (store (arr!15800 a!3235) i!1204 k!2280) (size!16164 a!3235))) lt!233815))))

(assert (=> d!78899 (validMask!0 mask!3524)))

(assert (=> d!78899 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233815 (select (store (arr!15800 a!3235) i!1204 k!2280) j!176) (array!32844 (store (arr!15800 a!3235) i!1204 k!2280) (size!16164 a!3235)) mask!3524) lt!233874)))

(declare-fun b!511202 () Bool)

(assert (=> b!511202 (= e!298722 (bvsge (x!48204 lt!233874) #b01111111111111111111111111111110))))

(declare-fun b!511203 () Bool)

(assert (=> b!511203 (= e!298720 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!233815 #b00000000000000000000000000000000 mask!3524) (select (store (arr!15800 a!3235) i!1204 k!2280) j!176) (array!32844 (store (arr!15800 a!3235) i!1204 k!2280) (size!16164 a!3235)) mask!3524))))

(assert (= (and d!78899 c!59895) b!511201))

(assert (= (and d!78899 (not c!59895)) b!511196))

(assert (= (and b!511196 c!59894) b!511197))

(assert (= (and b!511196 (not c!59894)) b!511203))

(assert (= (and d!78899 c!59893) b!511202))

(assert (= (and d!78899 (not c!59893)) b!511198))

(assert (= (and b!511198 res!311969) b!511195))

(assert (= (and b!511195 (not res!311970)) b!511199))

(assert (= (and b!511199 (not res!311968)) b!511200))

(declare-fun m!492713 () Bool)

(assert (=> d!78899 m!492713))

(assert (=> d!78899 m!492621))

(declare-fun m!492715 () Bool)

(assert (=> b!511199 m!492715))

(assert (=> b!511195 m!492715))

(assert (=> b!511200 m!492715))

(declare-fun m!492717 () Bool)

(assert (=> b!511203 m!492717))

(assert (=> b!511203 m!492717))

(assert (=> b!511203 m!492629))

(declare-fun m!492719 () Bool)

(assert (=> b!511203 m!492719))

(assert (=> b!511084 d!78899))

(declare-fun d!78901 () Bool)

(declare-fun lt!233883 () (_ BitVec 32))

(declare-fun lt!233882 () (_ BitVec 32))

(assert (=> d!78901 (= lt!233883 (bvmul (bvxor lt!233882 (bvlshr lt!233882 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!78901 (= lt!233882 ((_ extract 31 0) (bvand (bvxor (select (arr!15800 a!3235) j!176) (bvlshr (select (arr!15800 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!78901 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!311971 (let ((h!10834 ((_ extract 31 0) (bvand (bvxor (select (arr!15800 a!3235) j!176) (bvlshr (select (arr!15800 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48208 (bvmul (bvxor h!10834 (bvlshr h!10834 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48208 (bvlshr x!48208 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!311971 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!311971 #b00000000000000000000000000000000))))))

(assert (=> d!78901 (= (toIndex!0 (select (arr!15800 a!3235) j!176) mask!3524) (bvand (bvxor lt!233883 (bvlshr lt!233883 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!511084 d!78901))

(declare-fun b!511276 () Bool)

(declare-fun e!298770 () SeekEntryResult!4267)

(declare-fun lt!233913 () SeekEntryResult!4267)

(assert (=> b!511276 (= e!298770 (Found!4267 (index!19258 lt!233913)))))

(declare-fun b!511277 () Bool)

(declare-fun e!298769 () SeekEntryResult!4267)

(assert (=> b!511277 (= e!298769 e!298770)))

(declare-fun lt!233912 () (_ BitVec 64))

(assert (=> b!511277 (= lt!233912 (select (arr!15800 a!3235) (index!19258 lt!233913)))))

(declare-fun c!59922 () Bool)

(assert (=> b!511277 (= c!59922 (= lt!233912 (select (arr!15800 a!3235) j!176)))))

(declare-fun b!511278 () Bool)

(declare-fun e!298771 () SeekEntryResult!4267)

(assert (=> b!511278 (= e!298771 (MissingZero!4267 (index!19258 lt!233913)))))

(declare-fun b!511279 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32843 (_ BitVec 32)) SeekEntryResult!4267)

(assert (=> b!511279 (= e!298771 (seekKeyOrZeroReturnVacant!0 (x!48204 lt!233913) (index!19258 lt!233913) (index!19258 lt!233913) (select (arr!15800 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!511280 () Bool)

(declare-fun c!59921 () Bool)

(assert (=> b!511280 (= c!59921 (= lt!233912 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!511280 (= e!298770 e!298771)))

(declare-fun b!511281 () Bool)

(assert (=> b!511281 (= e!298769 Undefined!4267)))

(declare-fun d!78905 () Bool)

(declare-fun lt!233914 () SeekEntryResult!4267)

(assert (=> d!78905 (and (or (is-Undefined!4267 lt!233914) (not (is-Found!4267 lt!233914)) (and (bvsge (index!19257 lt!233914) #b00000000000000000000000000000000) (bvslt (index!19257 lt!233914) (size!16164 a!3235)))) (or (is-Undefined!4267 lt!233914) (is-Found!4267 lt!233914) (not (is-MissingZero!4267 lt!233914)) (and (bvsge (index!19256 lt!233914) #b00000000000000000000000000000000) (bvslt (index!19256 lt!233914) (size!16164 a!3235)))) (or (is-Undefined!4267 lt!233914) (is-Found!4267 lt!233914) (is-MissingZero!4267 lt!233914) (not (is-MissingVacant!4267 lt!233914)) (and (bvsge (index!19259 lt!233914) #b00000000000000000000000000000000) (bvslt (index!19259 lt!233914) (size!16164 a!3235)))) (or (is-Undefined!4267 lt!233914) (ite (is-Found!4267 lt!233914) (= (select (arr!15800 a!3235) (index!19257 lt!233914)) (select (arr!15800 a!3235) j!176)) (ite (is-MissingZero!4267 lt!233914) (= (select (arr!15800 a!3235) (index!19256 lt!233914)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4267 lt!233914) (= (select (arr!15800 a!3235) (index!19259 lt!233914)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!78905 (= lt!233914 e!298769)))

(declare-fun c!59920 () Bool)

(assert (=> d!78905 (= c!59920 (and (is-Intermediate!4267 lt!233913) (undefined!5079 lt!233913)))))

(assert (=> d!78905 (= lt!233913 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15800 a!3235) j!176) mask!3524) (select (arr!15800 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!78905 (validMask!0 mask!3524)))

(assert (=> d!78905 (= (seekEntryOrOpen!0 (select (arr!15800 a!3235) j!176) a!3235 mask!3524) lt!233914)))

(assert (= (and d!78905 c!59920) b!511281))

(assert (= (and d!78905 (not c!59920)) b!511277))

(assert (= (and b!511277 c!59922) b!511276))

(assert (= (and b!511277 (not c!59922)) b!511280))

(assert (= (and b!511280 c!59921) b!511278))

(assert (= (and b!511280 (not c!59921)) b!511279))

(declare-fun m!492759 () Bool)

(assert (=> b!511277 m!492759))

(assert (=> b!511279 m!492613))

(declare-fun m!492761 () Bool)

(assert (=> b!511279 m!492761))

(assert (=> d!78905 m!492613))

(assert (=> d!78905 m!492633))

(assert (=> d!78905 m!492633))

(assert (=> d!78905 m!492613))

(declare-fun m!492763 () Bool)

(assert (=> d!78905 m!492763))

(declare-fun m!492765 () Bool)

(assert (=> d!78905 m!492765))

(declare-fun m!492767 () Bool)

(assert (=> d!78905 m!492767))

(declare-fun m!492769 () Bool)

(assert (=> d!78905 m!492769))

(assert (=> d!78905 m!492621))

(assert (=> b!511084 d!78905))

(declare-fun d!78919 () Bool)

(declare-fun res!311997 () Bool)

(declare-fun e!298776 () Bool)

(assert (=> d!78919 (=> res!311997 e!298776)))

(assert (=> d!78919 (= res!311997 (bvsge j!176 (size!16164 a!3235)))))

(assert (=> d!78919 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!298776)))

(declare-fun b!511290 () Bool)

(declare-fun e!298778 () Bool)

(assert (=> b!511290 (= e!298776 e!298778)))

(declare-fun c!59927 () Bool)

(assert (=> b!511290 (= c!59927 (validKeyInArray!0 (select (arr!15800 a!3235) j!176)))))

(declare-fun call!31507 () Bool)

(declare-fun bm!31504 () Bool)

(assert (=> bm!31504 (= call!31507 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!511291 () Bool)

(assert (=> b!511291 (= e!298778 call!31507)))

(declare-fun b!511292 () Bool)

(declare-fun e!298777 () Bool)

(assert (=> b!511292 (= e!298777 call!31507)))

(declare-fun b!511293 () Bool)

(assert (=> b!511293 (= e!298778 e!298777)))

(declare-fun lt!233920 () (_ BitVec 64))

(assert (=> b!511293 (= lt!233920 (select (arr!15800 a!3235) j!176))))

(declare-fun lt!233921 () Unit!15792)

(assert (=> b!511293 (= lt!233921 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!233920 j!176))))

(assert (=> b!511293 (arrayContainsKey!0 a!3235 lt!233920 #b00000000000000000000000000000000)))

(declare-fun lt!233919 () Unit!15792)

(assert (=> b!511293 (= lt!233919 lt!233921)))

(declare-fun res!311996 () Bool)

(assert (=> b!511293 (= res!311996 (= (seekEntryOrOpen!0 (select (arr!15800 a!3235) j!176) a!3235 mask!3524) (Found!4267 j!176)))))

(assert (=> b!511293 (=> (not res!311996) (not e!298777))))

(assert (= (and d!78919 (not res!311997)) b!511290))

(assert (= (and b!511290 c!59927) b!511293))

(assert (= (and b!511290 (not c!59927)) b!511291))

(assert (= (and b!511293 res!311996) b!511292))

(assert (= (or b!511292 b!511291) bm!31504))

(assert (=> b!511290 m!492613))

(assert (=> b!511290 m!492613))

(assert (=> b!511290 m!492615))

(declare-fun m!492771 () Bool)

(assert (=> bm!31504 m!492771))

(assert (=> b!511293 m!492613))

(declare-fun m!492773 () Bool)

(assert (=> b!511293 m!492773))

(declare-fun m!492775 () Bool)

(assert (=> b!511293 m!492775))

(assert (=> b!511293 m!492613))

(assert (=> b!511293 m!492637))

(assert (=> b!511084 d!78919))

(declare-fun d!78921 () Bool)

(assert (=> d!78921 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!233924 () Unit!15792)

(declare-fun choose!38 (array!32843 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15792)

(assert (=> d!78921 (= lt!233924 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!78921 (validMask!0 mask!3524)))

(assert (=> d!78921 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!233924)))

(declare-fun bs!16193 () Bool)

(assert (= bs!16193 d!78921))

(assert (=> bs!16193 m!492635))

(declare-fun m!492777 () Bool)

(assert (=> bs!16193 m!492777))

(assert (=> bs!16193 m!492621))

(assert (=> b!511084 d!78921))

(declare-fun d!78923 () Bool)

(declare-fun lt!233928 () (_ BitVec 32))

(declare-fun lt!233927 () (_ BitVec 32))

(assert (=> d!78923 (= lt!233928 (bvmul (bvxor lt!233927 (bvlshr lt!233927 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!78923 (= lt!233927 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15800 a!3235) i!1204 k!2280) j!176) (bvlshr (select (store (arr!15800 a!3235) i!1204 k!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!78923 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!311971 (let ((h!10834 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15800 a!3235) i!1204 k!2280) j!176) (bvlshr (select (store (arr!15800 a!3235) i!1204 k!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48208 (bvmul (bvxor h!10834 (bvlshr h!10834 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48208 (bvlshr x!48208 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!311971 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!311971 #b00000000000000000000000000000000))))))

(assert (=> d!78923 (= (toIndex!0 (select (store (arr!15800 a!3235) i!1204 k!2280) j!176) mask!3524) (bvand (bvxor lt!233928 (bvlshr lt!233928 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!511084 d!78923))

(declare-fun d!78925 () Bool)

(assert (=> d!78925 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!46132 d!78925))

(declare-fun d!78939 () Bool)

(assert (=> d!78939 (= (array_inv!11596 a!3235) (bvsge (size!16164 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!46132 d!78939))

(declare-fun d!78941 () Bool)

(assert (=> d!78941 (= (validKeyInArray!0 k!2280) (and (not (= k!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!511086 d!78941))

(declare-fun b!511344 () Bool)

(declare-fun e!298812 () Bool)

(declare-fun call!31510 () Bool)

(assert (=> b!511344 (= e!298812 call!31510)))

(declare-fun bm!31507 () Bool)

(declare-fun c!59941 () Bool)

(assert (=> bm!31507 (= call!31510 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!59941 (Cons!9954 (select (arr!15800 a!3235) #b00000000000000000000000000000000) Nil!9955) Nil!9955)))))

(declare-fun b!511345 () Bool)

(assert (=> b!511345 (= e!298812 call!31510)))

(declare-fun d!78943 () Bool)

(declare-fun res!312022 () Bool)

(declare-fun e!298815 () Bool)

(assert (=> d!78943 (=> res!312022 e!298815)))

(assert (=> d!78943 (= res!312022 (bvsge #b00000000000000000000000000000000 (size!16164 a!3235)))))

(assert (=> d!78943 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9955) e!298815)))

(declare-fun b!511346 () Bool)

(declare-fun e!298813 () Bool)

(assert (=> b!511346 (= e!298815 e!298813)))

(declare-fun res!312024 () Bool)

(assert (=> b!511346 (=> (not res!312024) (not e!298813))))

(declare-fun e!298814 () Bool)

(assert (=> b!511346 (= res!312024 (not e!298814))))

(declare-fun res!312023 () Bool)

(assert (=> b!511346 (=> (not res!312023) (not e!298814))))

(assert (=> b!511346 (= res!312023 (validKeyInArray!0 (select (arr!15800 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!511347 () Bool)

(assert (=> b!511347 (= e!298813 e!298812)))

(assert (=> b!511347 (= c!59941 (validKeyInArray!0 (select (arr!15800 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!511348 () Bool)

(declare-fun contains!2724 (List!9958 (_ BitVec 64)) Bool)

(assert (=> b!511348 (= e!298814 (contains!2724 Nil!9955 (select (arr!15800 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!78943 (not res!312022)) b!511346))

(assert (= (and b!511346 res!312023) b!511348))

(assert (= (and b!511346 res!312024) b!511347))

(assert (= (and b!511347 c!59941) b!511345))

(assert (= (and b!511347 (not c!59941)) b!511344))

(assert (= (or b!511345 b!511344) bm!31507))

(assert (=> bm!31507 m!492667))

(declare-fun m!492815 () Bool)

(assert (=> bm!31507 m!492815))

(assert (=> b!511346 m!492667))

(assert (=> b!511346 m!492667))

(assert (=> b!511346 m!492669))

(assert (=> b!511347 m!492667))

(assert (=> b!511347 m!492667))

(assert (=> b!511347 m!492669))

(assert (=> b!511348 m!492667))

(assert (=> b!511348 m!492667))

(declare-fun m!492817 () Bool)

(assert (=> b!511348 m!492817))

(assert (=> b!511081 d!78943))

(declare-fun d!78947 () Bool)

(declare-fun res!312029 () Bool)

(declare-fun e!298820 () Bool)

(assert (=> d!78947 (=> res!312029 e!298820)))

(assert (=> d!78947 (= res!312029 (= (select (arr!15800 a!3235) #b00000000000000000000000000000000) k!2280))))

(assert (=> d!78947 (= (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000) e!298820)))

(declare-fun b!511353 () Bool)

(declare-fun e!298821 () Bool)

(assert (=> b!511353 (= e!298820 e!298821)))

(declare-fun res!312030 () Bool)

(assert (=> b!511353 (=> (not res!312030) (not e!298821))))

(assert (=> b!511353 (= res!312030 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16164 a!3235)))))

(declare-fun b!511354 () Bool)

(assert (=> b!511354 (= e!298821 (arrayContainsKey!0 a!3235 k!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!78947 (not res!312029)) b!511353))

(assert (= (and b!511353 res!312030) b!511354))

(assert (=> d!78947 m!492667))

(declare-fun m!492819 () Bool)

(assert (=> b!511354 m!492819))

(assert (=> b!511080 d!78947))

(declare-fun b!511355 () Bool)

(declare-fun e!298823 () SeekEntryResult!4267)

(declare-fun lt!233940 () SeekEntryResult!4267)

(assert (=> b!511355 (= e!298823 (Found!4267 (index!19258 lt!233940)))))

(declare-fun b!511356 () Bool)

(declare-fun e!298822 () SeekEntryResult!4267)

(assert (=> b!511356 (= e!298822 e!298823)))

(declare-fun lt!233939 () (_ BitVec 64))

(assert (=> b!511356 (= lt!233939 (select (arr!15800 a!3235) (index!19258 lt!233940)))))

(declare-fun c!59944 () Bool)

(assert (=> b!511356 (= c!59944 (= lt!233939 k!2280))))

(declare-fun b!511357 () Bool)

(declare-fun e!298824 () SeekEntryResult!4267)

(assert (=> b!511357 (= e!298824 (MissingZero!4267 (index!19258 lt!233940)))))

(declare-fun b!511358 () Bool)

(assert (=> b!511358 (= e!298824 (seekKeyOrZeroReturnVacant!0 (x!48204 lt!233940) (index!19258 lt!233940) (index!19258 lt!233940) k!2280 a!3235 mask!3524))))

(declare-fun b!511359 () Bool)

(declare-fun c!59943 () Bool)

(assert (=> b!511359 (= c!59943 (= lt!233939 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!511359 (= e!298823 e!298824)))

(declare-fun b!511360 () Bool)

(assert (=> b!511360 (= e!298822 Undefined!4267)))

(declare-fun d!78951 () Bool)

(declare-fun lt!233941 () SeekEntryResult!4267)

