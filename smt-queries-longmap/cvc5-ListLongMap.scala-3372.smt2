; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46344 () Bool)

(assert start!46344)

(declare-fun res!313513 () Bool)

(declare-fun e!299589 () Bool)

(assert (=> start!46344 (=> (not res!313513) (not e!299589))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46344 (= res!313513 (validMask!0 mask!3524))))

(assert (=> start!46344 e!299589))

(assert (=> start!46344 true))

(declare-datatypes ((array!32941 0))(
  ( (array!32942 (arr!15846 (Array (_ BitVec 32) (_ BitVec 64))) (size!16210 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32941)

(declare-fun array_inv!11642 (array!32941) Bool)

(assert (=> start!46344 (array_inv!11642 a!3235)))

(declare-fun b!513034 () Bool)

(declare-fun res!313518 () Bool)

(declare-fun e!299587 () Bool)

(assert (=> b!513034 (=> res!313518 e!299587)))

(declare-datatypes ((SeekEntryResult!4313 0))(
  ( (MissingZero!4313 (index!19440 (_ BitVec 32))) (Found!4313 (index!19441 (_ BitVec 32))) (Intermediate!4313 (undefined!5125 Bool) (index!19442 (_ BitVec 32)) (x!48390 (_ BitVec 32))) (Undefined!4313) (MissingVacant!4313 (index!19443 (_ BitVec 32))) )
))
(declare-fun lt!234887 () SeekEntryResult!4313)

(assert (=> b!513034 (= res!313518 (or (undefined!5125 lt!234887) (not (is-Intermediate!4313 lt!234887))))))

(declare-fun b!513035 () Bool)

(declare-fun e!299588 () Bool)

(assert (=> b!513035 (= e!299589 e!299588)))

(declare-fun res!313517 () Bool)

(assert (=> b!513035 (=> (not res!313517) (not e!299588))))

(declare-fun lt!234885 () SeekEntryResult!4313)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!513035 (= res!313517 (or (= lt!234885 (MissingZero!4313 i!1204)) (= lt!234885 (MissingVacant!4313 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32941 (_ BitVec 32)) SeekEntryResult!4313)

(assert (=> b!513035 (= lt!234885 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!513036 () Bool)

(declare-fun res!313523 () Bool)

(assert (=> b!513036 (=> (not res!313523) (not e!299588))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32941 (_ BitVec 32)) Bool)

(assert (=> b!513036 (= res!313523 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!513037 () Bool)

(assert (=> b!513037 (= e!299588 (not e!299587))))

(declare-fun res!313515 () Bool)

(assert (=> b!513037 (=> res!313515 e!299587)))

(declare-fun lt!234888 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32941 (_ BitVec 32)) SeekEntryResult!4313)

(assert (=> b!513037 (= res!313515 (= lt!234887 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234888 (select (store (arr!15846 a!3235) i!1204 k!2280) j!176) (array!32942 (store (arr!15846 a!3235) i!1204 k!2280) (size!16210 a!3235)) mask!3524)))))

(declare-fun lt!234886 () (_ BitVec 32))

(assert (=> b!513037 (= lt!234887 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234886 (select (arr!15846 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!513037 (= lt!234888 (toIndex!0 (select (store (arr!15846 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!513037 (= lt!234886 (toIndex!0 (select (arr!15846 a!3235) j!176) mask!3524))))

(declare-fun e!299586 () Bool)

(assert (=> b!513037 e!299586))

(declare-fun res!313519 () Bool)

(assert (=> b!513037 (=> (not res!313519) (not e!299586))))

(assert (=> b!513037 (= res!313519 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15884 0))(
  ( (Unit!15885) )
))
(declare-fun lt!234889 () Unit!15884)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32941 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15884)

(assert (=> b!513037 (= lt!234889 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!513038 () Bool)

(declare-fun res!313522 () Bool)

(assert (=> b!513038 (=> (not res!313522) (not e!299589))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!513038 (= res!313522 (validKeyInArray!0 (select (arr!15846 a!3235) j!176)))))

(declare-fun b!513039 () Bool)

(declare-fun res!313516 () Bool)

(assert (=> b!513039 (=> (not res!313516) (not e!299588))))

(declare-datatypes ((List!10004 0))(
  ( (Nil!10001) (Cons!10000 (h!10883 (_ BitVec 64)) (t!16232 List!10004)) )
))
(declare-fun arrayNoDuplicates!0 (array!32941 (_ BitVec 32) List!10004) Bool)

(assert (=> b!513039 (= res!313516 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10001))))

(declare-fun b!513040 () Bool)

(declare-fun res!313520 () Bool)

(assert (=> b!513040 (=> (not res!313520) (not e!299589))))

(declare-fun arrayContainsKey!0 (array!32941 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!513040 (= res!313520 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!513041 () Bool)

(assert (=> b!513041 (= e!299587 (and (bvsge (index!19442 lt!234887) #b00000000000000000000000000000000) (bvslt (index!19442 lt!234887) (size!16210 a!3235))))))

(assert (=> b!513041 (bvslt (x!48390 lt!234887) #b01111111111111111111111111111110)))

(declare-fun b!513042 () Bool)

(declare-fun res!313514 () Bool)

(assert (=> b!513042 (=> (not res!313514) (not e!299589))))

(assert (=> b!513042 (= res!313514 (and (= (size!16210 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16210 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16210 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!513043 () Bool)

(assert (=> b!513043 (= e!299586 (= (seekEntryOrOpen!0 (select (arr!15846 a!3235) j!176) a!3235 mask!3524) (Found!4313 j!176)))))

(declare-fun b!513044 () Bool)

(declare-fun res!313521 () Bool)

(assert (=> b!513044 (=> (not res!313521) (not e!299589))))

(assert (=> b!513044 (= res!313521 (validKeyInArray!0 k!2280))))

(assert (= (and start!46344 res!313513) b!513042))

(assert (= (and b!513042 res!313514) b!513038))

(assert (= (and b!513038 res!313522) b!513044))

(assert (= (and b!513044 res!313521) b!513040))

(assert (= (and b!513040 res!313520) b!513035))

(assert (= (and b!513035 res!313517) b!513036))

(assert (= (and b!513036 res!313523) b!513039))

(assert (= (and b!513039 res!313516) b!513037))

(assert (= (and b!513037 res!313519) b!513043))

(assert (= (and b!513037 (not res!313515)) b!513034))

(assert (= (and b!513034 (not res!313518)) b!513041))

(declare-fun m!494673 () Bool)

(assert (=> b!513038 m!494673))

(assert (=> b!513038 m!494673))

(declare-fun m!494675 () Bool)

(assert (=> b!513038 m!494675))

(declare-fun m!494677 () Bool)

(assert (=> start!46344 m!494677))

(declare-fun m!494679 () Bool)

(assert (=> start!46344 m!494679))

(declare-fun m!494681 () Bool)

(assert (=> b!513044 m!494681))

(declare-fun m!494683 () Bool)

(assert (=> b!513040 m!494683))

(declare-fun m!494685 () Bool)

(assert (=> b!513036 m!494685))

(declare-fun m!494687 () Bool)

(assert (=> b!513037 m!494687))

(declare-fun m!494689 () Bool)

(assert (=> b!513037 m!494689))

(declare-fun m!494691 () Bool)

(assert (=> b!513037 m!494691))

(declare-fun m!494693 () Bool)

(assert (=> b!513037 m!494693))

(assert (=> b!513037 m!494689))

(assert (=> b!513037 m!494673))

(declare-fun m!494695 () Bool)

(assert (=> b!513037 m!494695))

(assert (=> b!513037 m!494673))

(declare-fun m!494697 () Bool)

(assert (=> b!513037 m!494697))

(assert (=> b!513037 m!494673))

(declare-fun m!494699 () Bool)

(assert (=> b!513037 m!494699))

(assert (=> b!513037 m!494689))

(declare-fun m!494701 () Bool)

(assert (=> b!513037 m!494701))

(assert (=> b!513043 m!494673))

(assert (=> b!513043 m!494673))

(declare-fun m!494703 () Bool)

(assert (=> b!513043 m!494703))

(declare-fun m!494705 () Bool)

(assert (=> b!513039 m!494705))

(declare-fun m!494707 () Bool)

(assert (=> b!513035 m!494707))

(push 1)

(assert (not b!513035))

(assert (not b!513043))

(assert (not b!513044))

(assert (not start!46344))

(assert (not b!513039))

(assert (not b!513038))

(assert (not b!513040))

(assert (not b!513036))

(assert (not b!513037))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!513176 () Bool)

(declare-fun c!60070 () Bool)

(declare-fun lt!234954 () (_ BitVec 64))

(assert (=> b!513176 (= c!60070 (= lt!234954 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!299661 () SeekEntryResult!4313)

(declare-fun e!299659 () SeekEntryResult!4313)

(assert (=> b!513176 (= e!299661 e!299659)))

(declare-fun lt!234955 () SeekEntryResult!4313)

(declare-fun b!513177 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32941 (_ BitVec 32)) SeekEntryResult!4313)

(assert (=> b!513177 (= e!299659 (seekKeyOrZeroReturnVacant!0 (x!48390 lt!234955) (index!19442 lt!234955) (index!19442 lt!234955) (select (arr!15846 a!3235) j!176) a!3235 mask!3524))))

(declare-fun d!79089 () Bool)

(declare-fun lt!234953 () SeekEntryResult!4313)

(assert (=> d!79089 (and (or (is-Undefined!4313 lt!234953) (not (is-Found!4313 lt!234953)) (and (bvsge (index!19441 lt!234953) #b00000000000000000000000000000000) (bvslt (index!19441 lt!234953) (size!16210 a!3235)))) (or (is-Undefined!4313 lt!234953) (is-Found!4313 lt!234953) (not (is-MissingZero!4313 lt!234953)) (and (bvsge (index!19440 lt!234953) #b00000000000000000000000000000000) (bvslt (index!19440 lt!234953) (size!16210 a!3235)))) (or (is-Undefined!4313 lt!234953) (is-Found!4313 lt!234953) (is-MissingZero!4313 lt!234953) (not (is-MissingVacant!4313 lt!234953)) (and (bvsge (index!19443 lt!234953) #b00000000000000000000000000000000) (bvslt (index!19443 lt!234953) (size!16210 a!3235)))) (or (is-Undefined!4313 lt!234953) (ite (is-Found!4313 lt!234953) (= (select (arr!15846 a!3235) (index!19441 lt!234953)) (select (arr!15846 a!3235) j!176)) (ite (is-MissingZero!4313 lt!234953) (= (select (arr!15846 a!3235) (index!19440 lt!234953)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4313 lt!234953) (= (select (arr!15846 a!3235) (index!19443 lt!234953)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!299660 () SeekEntryResult!4313)

(assert (=> d!79089 (= lt!234953 e!299660)))

(declare-fun c!60069 () Bool)

(assert (=> d!79089 (= c!60069 (and (is-Intermediate!4313 lt!234955) (undefined!5125 lt!234955)))))

(assert (=> d!79089 (= lt!234955 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15846 a!3235) j!176) mask!3524) (select (arr!15846 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!79089 (validMask!0 mask!3524)))

(assert (=> d!79089 (= (seekEntryOrOpen!0 (select (arr!15846 a!3235) j!176) a!3235 mask!3524) lt!234953)))

(declare-fun b!513178 () Bool)

(assert (=> b!513178 (= e!299660 Undefined!4313)))

(declare-fun b!513179 () Bool)

(assert (=> b!513179 (= e!299661 (Found!4313 (index!19442 lt!234955)))))

(declare-fun b!513180 () Bool)

(assert (=> b!513180 (= e!299660 e!299661)))

(assert (=> b!513180 (= lt!234954 (select (arr!15846 a!3235) (index!19442 lt!234955)))))

(declare-fun c!60068 () Bool)

(assert (=> b!513180 (= c!60068 (= lt!234954 (select (arr!15846 a!3235) j!176)))))

(declare-fun b!513181 () Bool)

(assert (=> b!513181 (= e!299659 (MissingZero!4313 (index!19442 lt!234955)))))

(assert (= (and d!79089 c!60069) b!513178))

(assert (= (and d!79089 (not c!60069)) b!513180))

(assert (= (and b!513180 c!60068) b!513179))

(assert (= (and b!513180 (not c!60068)) b!513176))

(assert (= (and b!513176 c!60070) b!513181))

(assert (= (and b!513176 (not c!60070)) b!513177))

(assert (=> b!513177 m!494673))

(declare-fun m!494801 () Bool)

(assert (=> b!513177 m!494801))

(declare-fun m!494803 () Bool)

(assert (=> d!79089 m!494803))

(declare-fun m!494805 () Bool)

(assert (=> d!79089 m!494805))

(declare-fun m!494807 () Bool)

(assert (=> d!79089 m!494807))

(assert (=> d!79089 m!494673))

(assert (=> d!79089 m!494697))

(assert (=> d!79089 m!494677))

(assert (=> d!79089 m!494697))

(assert (=> d!79089 m!494673))

(declare-fun m!494809 () Bool)

(assert (=> d!79089 m!494809))

(declare-fun m!494811 () Bool)

(assert (=> b!513180 m!494811))

(assert (=> b!513043 d!79089))

(declare-fun d!79099 () Bool)

(declare-fun lt!234967 () (_ BitVec 32))

(declare-fun lt!234966 () (_ BitVec 32))

(assert (=> d!79099 (= lt!234967 (bvmul (bvxor lt!234966 (bvlshr lt!234966 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79099 (= lt!234966 ((_ extract 31 0) (bvand (bvxor (select (arr!15846 a!3235) j!176) (bvlshr (select (arr!15846 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79099 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!313604 (let ((h!10887 ((_ extract 31 0) (bvand (bvxor (select (arr!15846 a!3235) j!176) (bvlshr (select (arr!15846 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48394 (bvmul (bvxor h!10887 (bvlshr h!10887 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48394 (bvlshr x!48394 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!313604 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!313604 #b00000000000000000000000000000000))))))

(assert (=> d!79099 (= (toIndex!0 (select (arr!15846 a!3235) j!176) mask!3524) (bvand (bvxor lt!234967 (bvlshr lt!234967 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!513037 d!79099))

(declare-fun b!513264 () Bool)

(declare-fun lt!234990 () SeekEntryResult!4313)

(assert (=> b!513264 (and (bvsge (index!19442 lt!234990) #b00000000000000000000000000000000) (bvslt (index!19442 lt!234990) (size!16210 (array!32942 (store (arr!15846 a!3235) i!1204 k!2280) (size!16210 a!3235)))))))

(declare-fun e!299717 () Bool)

(assert (=> b!513264 (= e!299717 (= (select (arr!15846 (array!32942 (store (arr!15846 a!3235) i!1204 k!2280) (size!16210 a!3235))) (index!19442 lt!234990)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!513265 () Bool)

(declare-fun e!299715 () Bool)

(assert (=> b!513265 (= e!299715 (bvsge (x!48390 lt!234990) #b01111111111111111111111111111110))))

(declare-fun b!513266 () Bool)

(assert (=> b!513266 (and (bvsge (index!19442 lt!234990) #b00000000000000000000000000000000) (bvslt (index!19442 lt!234990) (size!16210 (array!32942 (store (arr!15846 a!3235) i!1204 k!2280) (size!16210 a!3235)))))))

(declare-fun res!313639 () Bool)

(assert (=> b!513266 (= res!313639 (= (select (arr!15846 (array!32942 (store (arr!15846 a!3235) i!1204 k!2280) (size!16210 a!3235))) (index!19442 lt!234990)) (select (store (arr!15846 a!3235) i!1204 k!2280) j!176)))))

(assert (=> b!513266 (=> res!313639 e!299717)))

(declare-fun e!299713 () Bool)

(assert (=> b!513266 (= e!299713 e!299717)))

(declare-fun b!513267 () Bool)

(assert (=> b!513267 (= e!299715 e!299713)))

(declare-fun res!313638 () Bool)

(assert (=> b!513267 (= res!313638 (and (is-Intermediate!4313 lt!234990) (not (undefined!5125 lt!234990)) (bvslt (x!48390 lt!234990) #b01111111111111111111111111111110) (bvsge (x!48390 lt!234990) #b00000000000000000000000000000000) (bvsge (x!48390 lt!234990) #b00000000000000000000000000000000)))))

(assert (=> b!513267 (=> (not res!313638) (not e!299713))))

(declare-fun b!513268 () Bool)

(declare-fun e!299716 () SeekEntryResult!4313)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!513268 (= e!299716 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!234888 #b00000000000000000000000000000000 mask!3524) (select (store (arr!15846 a!3235) i!1204 k!2280) j!176) (array!32942 (store (arr!15846 a!3235) i!1204 k!2280) (size!16210 a!3235)) mask!3524))))

(declare-fun b!513269 () Bool)

(declare-fun e!299714 () SeekEntryResult!4313)

(assert (=> b!513269 (= e!299714 e!299716)))

(declare-fun c!60098 () Bool)

(declare-fun lt!234989 () (_ BitVec 64))

(assert (=> b!513269 (= c!60098 (or (= lt!234989 (select (store (arr!15846 a!3235) i!1204 k!2280) j!176)) (= (bvadd lt!234989 lt!234989) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!79105 () Bool)

(assert (=> d!79105 e!299715))

(declare-fun c!60097 () Bool)

(assert (=> d!79105 (= c!60097 (and (is-Intermediate!4313 lt!234990) (undefined!5125 lt!234990)))))

(assert (=> d!79105 (= lt!234990 e!299714)))

(declare-fun c!60096 () Bool)

(assert (=> d!79105 (= c!60096 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!79105 (= lt!234989 (select (arr!15846 (array!32942 (store (arr!15846 a!3235) i!1204 k!2280) (size!16210 a!3235))) lt!234888))))

(assert (=> d!79105 (validMask!0 mask!3524)))

(assert (=> d!79105 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234888 (select (store (arr!15846 a!3235) i!1204 k!2280) j!176) (array!32942 (store (arr!15846 a!3235) i!1204 k!2280) (size!16210 a!3235)) mask!3524) lt!234990)))

(declare-fun b!513270 () Bool)

(assert (=> b!513270 (= e!299716 (Intermediate!4313 false lt!234888 #b00000000000000000000000000000000))))

(declare-fun b!513271 () Bool)

(assert (=> b!513271 (and (bvsge (index!19442 lt!234990) #b00000000000000000000000000000000) (bvslt (index!19442 lt!234990) (size!16210 (array!32942 (store (arr!15846 a!3235) i!1204 k!2280) (size!16210 a!3235)))))))

(declare-fun res!313640 () Bool)

(assert (=> b!513271 (= res!313640 (= (select (arr!15846 (array!32942 (store (arr!15846 a!3235) i!1204 k!2280) (size!16210 a!3235))) (index!19442 lt!234990)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!513271 (=> res!313640 e!299717)))

(declare-fun b!513272 () Bool)

(assert (=> b!513272 (= e!299714 (Intermediate!4313 true lt!234888 #b00000000000000000000000000000000))))

(assert (= (and d!79105 c!60096) b!513272))

(assert (= (and d!79105 (not c!60096)) b!513269))

(assert (= (and b!513269 c!60098) b!513270))

(assert (= (and b!513269 (not c!60098)) b!513268))

(assert (= (and d!79105 c!60097) b!513265))

(assert (= (and d!79105 (not c!60097)) b!513267))

(assert (= (and b!513267 res!313638) b!513266))

(assert (= (and b!513266 (not res!313639)) b!513271))

(assert (= (and b!513271 (not res!313640)) b!513264))

(declare-fun m!494861 () Bool)

(assert (=> b!513266 m!494861))

(declare-fun m!494863 () Bool)

(assert (=> b!513268 m!494863))

(assert (=> b!513268 m!494863))

(assert (=> b!513268 m!494689))

(declare-fun m!494865 () Bool)

(assert (=> b!513268 m!494865))

(assert (=> b!513271 m!494861))

(assert (=> b!513264 m!494861))

(declare-fun m!494867 () Bool)

(assert (=> d!79105 m!494867))

(assert (=> d!79105 m!494677))

(assert (=> b!513037 d!79105))

(declare-fun b!513301 () Bool)

(declare-fun e!299740 () Bool)

(declare-fun call!31549 () Bool)

(assert (=> b!513301 (= e!299740 call!31549)))

(declare-fun b!513302 () Bool)

(declare-fun e!299739 () Bool)

(declare-fun e!299741 () Bool)

(assert (=> b!513302 (= e!299739 e!299741)))

(declare-fun c!60106 () Bool)

(assert (=> b!513302 (= c!60106 (validKeyInArray!0 (select (arr!15846 a!3235) j!176)))))

(declare-fun b!513303 () Bool)

(assert (=> b!513303 (= e!299741 e!299740)))

(declare-fun lt!235018 () (_ BitVec 64))

(assert (=> b!513303 (= lt!235018 (select (arr!15846 a!3235) j!176))))

(declare-fun lt!235017 () Unit!15884)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!32941 (_ BitVec 64) (_ BitVec 32)) Unit!15884)

(assert (=> b!513303 (= lt!235017 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!235018 j!176))))

(assert (=> b!513303 (arrayContainsKey!0 a!3235 lt!235018 #b00000000000000000000000000000000)))

(declare-fun lt!235019 () Unit!15884)

(assert (=> b!513303 (= lt!235019 lt!235017)))

(declare-fun res!313655 () Bool)

(assert (=> b!513303 (= res!313655 (= (seekEntryOrOpen!0 (select (arr!15846 a!3235) j!176) a!3235 mask!3524) (Found!4313 j!176)))))

(assert (=> b!513303 (=> (not res!313655) (not e!299740))))

(declare-fun b!513304 () Bool)

(assert (=> b!513304 (= e!299741 call!31549)))

(declare-fun bm!31546 () Bool)

(assert (=> bm!31546 (= call!31549 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun d!79123 () Bool)

(declare-fun res!313656 () Bool)

(assert (=> d!79123 (=> res!313656 e!299739)))

(assert (=> d!79123 (= res!313656 (bvsge j!176 (size!16210 a!3235)))))

(assert (=> d!79123 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!299739)))

(assert (= (and d!79123 (not res!313656)) b!513302))

(assert (= (and b!513302 c!60106) b!513303))

(assert (= (and b!513302 (not c!60106)) b!513304))

(assert (= (and b!513303 res!313655) b!513301))

(assert (= (or b!513301 b!513304) bm!31546))

(assert (=> b!513302 m!494673))

(assert (=> b!513302 m!494673))

(assert (=> b!513302 m!494675))

(assert (=> b!513303 m!494673))

(declare-fun m!494901 () Bool)

(assert (=> b!513303 m!494901))

(declare-fun m!494903 () Bool)

(assert (=> b!513303 m!494903))

(assert (=> b!513303 m!494673))

(assert (=> b!513303 m!494703))

(declare-fun m!494905 () Bool)

(assert (=> bm!31546 m!494905))

(assert (=> b!513037 d!79123))

(declare-fun b!513305 () Bool)

(declare-fun lt!235021 () SeekEntryResult!4313)

(assert (=> b!513305 (and (bvsge (index!19442 lt!235021) #b00000000000000000000000000000000) (bvslt (index!19442 lt!235021) (size!16210 a!3235)))))

(declare-fun e!299746 () Bool)

(assert (=> b!513305 (= e!299746 (= (select (arr!15846 a!3235) (index!19442 lt!235021)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!513306 () Bool)

(declare-fun e!299744 () Bool)

(assert (=> b!513306 (= e!299744 (bvsge (x!48390 lt!235021) #b01111111111111111111111111111110))))

(declare-fun b!513307 () Bool)

(assert (=> b!513307 (and (bvsge (index!19442 lt!235021) #b00000000000000000000000000000000) (bvslt (index!19442 lt!235021) (size!16210 a!3235)))))

(declare-fun res!313658 () Bool)

(assert (=> b!513307 (= res!313658 (= (select (arr!15846 a!3235) (index!19442 lt!235021)) (select (arr!15846 a!3235) j!176)))))

(assert (=> b!513307 (=> res!313658 e!299746)))

(declare-fun e!299742 () Bool)

(assert (=> b!513307 (= e!299742 e!299746)))

(declare-fun b!513308 () Bool)

(assert (=> b!513308 (= e!299744 e!299742)))

(declare-fun res!313657 () Bool)

(assert (=> b!513308 (= res!313657 (and (is-Intermediate!4313 lt!235021) (not (undefined!5125 lt!235021)) (bvslt (x!48390 lt!235021) #b01111111111111111111111111111110) (bvsge (x!48390 lt!235021) #b00000000000000000000000000000000) (bvsge (x!48390 lt!235021) #b00000000000000000000000000000000)))))

(assert (=> b!513308 (=> (not res!313657) (not e!299742))))

(declare-fun b!513309 () Bool)

(declare-fun e!299745 () SeekEntryResult!4313)

(assert (=> b!513309 (= e!299745 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!234886 #b00000000000000000000000000000000 mask!3524) (select (arr!15846 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!513310 () Bool)

(declare-fun e!299743 () SeekEntryResult!4313)

(assert (=> b!513310 (= e!299743 e!299745)))

(declare-fun lt!235020 () (_ BitVec 64))

(declare-fun c!60109 () Bool)

(assert (=> b!513310 (= c!60109 (or (= lt!235020 (select (arr!15846 a!3235) j!176)) (= (bvadd lt!235020 lt!235020) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!79139 () Bool)

(assert (=> d!79139 e!299744))

(declare-fun c!60108 () Bool)

(assert (=> d!79139 (= c!60108 (and (is-Intermediate!4313 lt!235021) (undefined!5125 lt!235021)))))

(assert (=> d!79139 (= lt!235021 e!299743)))

(declare-fun c!60107 () Bool)

(assert (=> d!79139 (= c!60107 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!79139 (= lt!235020 (select (arr!15846 a!3235) lt!234886))))

(assert (=> d!79139 (validMask!0 mask!3524)))

(assert (=> d!79139 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234886 (select (arr!15846 a!3235) j!176) a!3235 mask!3524) lt!235021)))

(declare-fun b!513311 () Bool)

(assert (=> b!513311 (= e!299745 (Intermediate!4313 false lt!234886 #b00000000000000000000000000000000))))

(declare-fun b!513312 () Bool)

(assert (=> b!513312 (and (bvsge (index!19442 lt!235021) #b00000000000000000000000000000000) (bvslt (index!19442 lt!235021) (size!16210 a!3235)))))

(declare-fun res!313659 () Bool)

(assert (=> b!513312 (= res!313659 (= (select (arr!15846 a!3235) (index!19442 lt!235021)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!513312 (=> res!313659 e!299746)))

(declare-fun b!513313 () Bool)

(assert (=> b!513313 (= e!299743 (Intermediate!4313 true lt!234886 #b00000000000000000000000000000000))))

(assert (= (and d!79139 c!60107) b!513313))

(assert (= (and d!79139 (not c!60107)) b!513310))

(assert (= (and b!513310 c!60109) b!513311))

(assert (= (and b!513310 (not c!60109)) b!513309))

(assert (= (and d!79139 c!60108) b!513306))

(assert (= (and d!79139 (not c!60108)) b!513308))

(assert (= (and b!513308 res!313657) b!513307))

(assert (= (and b!513307 (not res!313658)) b!513312))

(assert (= (and b!513312 (not res!313659)) b!513305))

(declare-fun m!494907 () Bool)

(assert (=> b!513307 m!494907))

(declare-fun m!494909 () Bool)

(assert (=> b!513309 m!494909))

(assert (=> b!513309 m!494909))

(assert (=> b!513309 m!494673))

(declare-fun m!494911 () Bool)

(assert (=> b!513309 m!494911))

(assert (=> b!513312 m!494907))

(assert (=> b!513305 m!494907))

(declare-fun m!494913 () Bool)

(assert (=> d!79139 m!494913))

(assert (=> d!79139 m!494677))

(assert (=> b!513037 d!79139))

(declare-fun d!79141 () Bool)

(assert (=> d!79141 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!235024 () Unit!15884)

(declare-fun choose!38 (array!32941 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15884)

(assert (=> d!79141 (= lt!235024 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!79141 (validMask!0 mask!3524)))

(assert (=> d!79141 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!235024)))

(declare-fun bs!16247 () Bool)

(assert (= bs!16247 d!79141))

(assert (=> bs!16247 m!494699))

(declare-fun m!494915 () Bool)

(assert (=> bs!16247 m!494915))

(assert (=> bs!16247 m!494677))

(assert (=> b!513037 d!79141))

(declare-fun d!79143 () Bool)

(declare-fun lt!235026 () (_ BitVec 32))

(declare-fun lt!235025 () (_ BitVec 32))

(assert (=> d!79143 (= lt!235026 (bvmul (bvxor lt!235025 (bvlshr lt!235025 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79143 (= lt!235025 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15846 a!3235) i!1204 k!2280) j!176) (bvlshr (select (store (arr!15846 a!3235) i!1204 k!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79143 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!313604 (let ((h!10887 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15846 a!3235) i!1204 k!2280) j!176) (bvlshr (select (store (arr!15846 a!3235) i!1204 k!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48394 (bvmul (bvxor h!10887 (bvlshr h!10887 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48394 (bvlshr x!48394 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!313604 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!313604 #b00000000000000000000000000000000))))))

(assert (=> d!79143 (= (toIndex!0 (select (store (arr!15846 a!3235) i!1204 k!2280) j!176) mask!3524) (bvand (bvxor lt!235026 (bvlshr lt!235026 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!513037 d!79143))

(declare-fun b!513314 () Bool)

(declare-fun e!299748 () Bool)

(declare-fun call!31550 () Bool)

(assert (=> b!513314 (= e!299748 call!31550)))

(declare-fun b!513315 () Bool)

(declare-fun e!299747 () Bool)

(declare-fun e!299749 () Bool)

(assert (=> b!513315 (= e!299747 e!299749)))

(declare-fun c!60110 () Bool)

(assert (=> b!513315 (= c!60110 (validKeyInArray!0 (select (arr!15846 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!513316 () Bool)

(assert (=> b!513316 (= e!299749 e!299748)))

(declare-fun lt!235028 () (_ BitVec 64))

(assert (=> b!513316 (= lt!235028 (select (arr!15846 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!235027 () Unit!15884)

(assert (=> b!513316 (= lt!235027 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!235028 #b00000000000000000000000000000000))))

(assert (=> b!513316 (arrayContainsKey!0 a!3235 lt!235028 #b00000000000000000000000000000000)))

(declare-fun lt!235029 () Unit!15884)

(assert (=> b!513316 (= lt!235029 lt!235027)))

(declare-fun res!313660 () Bool)

(assert (=> b!513316 (= res!313660 (= (seekEntryOrOpen!0 (select (arr!15846 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4313 #b00000000000000000000000000000000)))))

(assert (=> b!513316 (=> (not res!313660) (not e!299748))))

(declare-fun b!513317 () Bool)

(assert (=> b!513317 (= e!299749 call!31550)))

(declare-fun bm!31547 () Bool)

(assert (=> bm!31547 (= call!31550 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun d!79145 () Bool)

(declare-fun res!313661 () Bool)

(assert (=> d!79145 (=> res!313661 e!299747)))

(assert (=> d!79145 (= res!313661 (bvsge #b00000000000000000000000000000000 (size!16210 a!3235)))))

(assert (=> d!79145 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!299747)))

(assert (= (and d!79145 (not res!313661)) b!513315))

(assert (= (and b!513315 c!60110) b!513316))

(assert (= (and b!513315 (not c!60110)) b!513317))

(assert (= (and b!513316 res!313660) b!513314))

(assert (= (or b!513314 b!513317) bm!31547))

(declare-fun m!494917 () Bool)

(assert (=> b!513315 m!494917))

(assert (=> b!513315 m!494917))

(declare-fun m!494919 () Bool)

(assert (=> b!513315 m!494919))

(assert (=> b!513316 m!494917))

(declare-fun m!494921 () Bool)

(assert (=> b!513316 m!494921))

(declare-fun m!494923 () Bool)

(assert (=> b!513316 m!494923))

(assert (=> b!513316 m!494917))

(declare-fun m!494925 () Bool)

(assert (=> b!513316 m!494925))

(declare-fun m!494927 () Bool)

(assert (=> bm!31547 m!494927))

(assert (=> b!513036 d!79145))

(declare-fun b!513318 () Bool)

(declare-fun c!60113 () Bool)

(declare-fun lt!235031 () (_ BitVec 64))

(assert (=> b!513318 (= c!60113 (= lt!235031 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!299752 () SeekEntryResult!4313)

(declare-fun e!299750 () SeekEntryResult!4313)

(assert (=> b!513318 (= e!299752 e!299750)))

(declare-fun b!513319 () Bool)

(declare-fun lt!235032 () SeekEntryResult!4313)

(assert (=> b!513319 (= e!299750 (seekKeyOrZeroReturnVacant!0 (x!48390 lt!235032) (index!19442 lt!235032) (index!19442 lt!235032) k!2280 a!3235 mask!3524))))

(declare-fun d!79147 () Bool)

(declare-fun lt!235030 () SeekEntryResult!4313)

(assert (=> d!79147 (and (or (is-Undefined!4313 lt!235030) (not (is-Found!4313 lt!235030)) (and (bvsge (index!19441 lt!235030) #b00000000000000000000000000000000) (bvslt (index!19441 lt!235030) (size!16210 a!3235)))) (or (is-Undefined!4313 lt!235030) (is-Found!4313 lt!235030) (not (is-MissingZero!4313 lt!235030)) (and (bvsge (index!19440 lt!235030) #b00000000000000000000000000000000) (bvslt (index!19440 lt!235030) (size!16210 a!3235)))) (or (is-Undefined!4313 lt!235030) (is-Found!4313 lt!235030) (is-MissingZero!4313 lt!235030) (not (is-MissingVacant!4313 lt!235030)) (and (bvsge (index!19443 lt!235030) #b00000000000000000000000000000000) (bvslt (index!19443 lt!235030) (size!16210 a!3235)))) (or (is-Undefined!4313 lt!235030) (ite (is-Found!4313 lt!235030) (= (select (arr!15846 a!3235) (index!19441 lt!235030)) k!2280) (ite (is-MissingZero!4313 lt!235030) (= (select (arr!15846 a!3235) (index!19440 lt!235030)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4313 lt!235030) (= (select (arr!15846 a!3235) (index!19443 lt!235030)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!299751 () SeekEntryResult!4313)

(assert (=> d!79147 (= lt!235030 e!299751)))

(declare-fun c!60112 () Bool)

(assert (=> d!79147 (= c!60112 (and (is-Intermediate!4313 lt!235032) (undefined!5125 lt!235032)))))

(assert (=> d!79147 (= lt!235032 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2280 mask!3524) k!2280 a!3235 mask!3524))))

(assert (=> d!79147 (validMask!0 mask!3524)))

(assert (=> d!79147 (= (seekEntryOrOpen!0 k!2280 a!3235 mask!3524) lt!235030)))

(declare-fun b!513320 () Bool)

(assert (=> b!513320 (= e!299751 Undefined!4313)))

(declare-fun b!513321 () Bool)

(assert (=> b!513321 (= e!299752 (Found!4313 (index!19442 lt!235032)))))

(declare-fun b!513322 () Bool)

(assert (=> b!513322 (= e!299751 e!299752)))

(assert (=> b!513322 (= lt!235031 (select (arr!15846 a!3235) (index!19442 lt!235032)))))

(declare-fun c!60111 () Bool)

(assert (=> b!513322 (= c!60111 (= lt!235031 k!2280))))

(declare-fun b!513323 () Bool)

(assert (=> b!513323 (= e!299750 (MissingZero!4313 (index!19442 lt!235032)))))

(assert (= (and d!79147 c!60112) b!513320))

(assert (= (and d!79147 (not c!60112)) b!513322))

(assert (= (and b!513322 c!60111) b!513321))

(assert (= (and b!513322 (not c!60111)) b!513318))

(assert (= (and b!513318 c!60113) b!513323))

(assert (= (and b!513318 (not c!60113)) b!513319))

(declare-fun m!494929 () Bool)

(assert (=> b!513319 m!494929))

(declare-fun m!494931 () Bool)

(assert (=> d!79147 m!494931))

(declare-fun m!494933 () Bool)

(assert (=> d!79147 m!494933))

(declare-fun m!494935 () Bool)

(assert (=> d!79147 m!494935))

(declare-fun m!494937 () Bool)

(assert (=> d!79147 m!494937))

(assert (=> d!79147 m!494677))

(assert (=> d!79147 m!494937))

(declare-fun m!494939 () Bool)

(assert (=> d!79147 m!494939))

(declare-fun m!494941 () Bool)

(assert (=> b!513322 m!494941))

(assert (=> b!513035 d!79147))

(declare-fun d!79149 () Bool)

(declare-fun res!313666 () Bool)

(declare-fun e!299761 () Bool)

(assert (=> d!79149 (=> res!313666 e!299761)))

(assert (=> d!79149 (= res!313666 (= (select (arr!15846 a!3235) #b00000000000000000000000000000000) k!2280))))

(assert (=> d!79149 (= (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000) e!299761)))

(declare-fun b!513338 () Bool)

(declare-fun e!299762 () Bool)

(assert (=> b!513338 (= e!299761 e!299762)))

(declare-fun res!313667 () Bool)

(assert (=> b!513338 (=> (not res!313667) (not e!299762))))

(assert (=> b!513338 (= res!313667 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16210 a!3235)))))

(declare-fun b!513339 () Bool)

(assert (=> b!513339 (= e!299762 (arrayContainsKey!0 a!3235 k!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!79149 (not res!313666)) b!513338))

(assert (= (and b!513338 res!313667) b!513339))

(assert (=> d!79149 m!494917))

(declare-fun m!494943 () Bool)

(assert (=> b!513339 m!494943))

(assert (=> b!513040 d!79149))

(declare-fun d!79151 () Bool)

(declare-fun res!313688 () Bool)

(declare-fun e!299787 () Bool)

(assert (=> d!79151 (=> res!313688 e!299787)))

(assert (=> d!79151 (= res!313688 (bvsge #b00000000000000000000000000000000 (size!16210 a!3235)))))

(assert (=> d!79151 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10001) e!299787)))

(declare-fun b!513376 () Bool)

(declare-fun e!299790 () Bool)

(declare-fun call!31553 () Bool)

(assert (=> b!513376 (= e!299790 call!31553)))

(declare-fun b!513377 () Bool)

(declare-fun e!299788 () Bool)

(assert (=> b!513377 (= e!299788 e!299790)))

(declare-fun c!60128 () Bool)

(assert (=> b!513377 (= c!60128 (validKeyInArray!0 (select (arr!15846 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!513378 () Bool)

(declare-fun e!299789 () Bool)

(declare-fun contains!2729 (List!10004 (_ BitVec 64)) Bool)

(assert (=> b!513378 (= e!299789 (contains!2729 Nil!10001 (select (arr!15846 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31550 () Bool)

(assert (=> bm!31550 (= call!31553 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!60128 (Cons!10000 (select (arr!15846 a!3235) #b00000000000000000000000000000000) Nil!10001) Nil!10001)))))

(declare-fun b!513379 () Bool)

(assert (=> b!513379 (= e!299787 e!299788)))

(declare-fun res!313687 () Bool)

(assert (=> b!513379 (=> (not res!313687) (not e!299788))))

(assert (=> b!513379 (= res!313687 (not e!299789))))

(declare-fun res!313686 () Bool)

(assert (=> b!513379 (=> (not res!313686) (not e!299789))))

(assert (=> b!513379 (= res!313686 (validKeyInArray!0 (select (arr!15846 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!513380 () Bool)

(assert (=> b!513380 (= e!299790 call!31553)))

(assert (= (and d!79151 (not res!313688)) b!513379))

(assert (= (and b!513379 res!313686) b!513378))

(assert (= (and b!513379 res!313687) b!513377))

(assert (= (and b!513377 c!60128) b!513376))

(assert (= (and b!513377 (not c!60128)) b!513380))

(assert (= (or b!513376 b!513380) bm!31550))

(assert (=> b!513377 m!494917))

(assert (=> b!513377 m!494917))

(assert (=> b!513377 m!494919))

(assert (=> b!513378 m!494917))

(assert (=> b!513378 m!494917))

(declare-fun m!494961 () Bool)

(assert (=> b!513378 m!494961))

(assert (=> bm!31550 m!494917))

(declare-fun m!494963 () Bool)

(assert (=> bm!31550 m!494963))

(assert (=> b!513379 m!494917))

(assert (=> b!513379 m!494917))

(assert (=> b!513379 m!494919))

(assert (=> b!513039 d!79151))

(declare-fun d!79157 () Bool)

(assert (=> d!79157 (= (validKeyInArray!0 k!2280) (and (not (= k!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!513044 d!79157))

(declare-fun d!79159 () Bool)

(assert (=> d!79159 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!46344 d!79159))

(declare-fun d!79165 () Bool)

(assert (=> d!79165 (= (array_inv!11642 a!3235) (bvsge (size!16210 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!46344 d!79165))

(declare-fun d!79169 () Bool)

(assert (=> d!79169 (= (validKeyInArray!0 (select (arr!15846 a!3235) j!176)) (and (not (= (select (arr!15846 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15846 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!513038 d!79169))

(push 1)

