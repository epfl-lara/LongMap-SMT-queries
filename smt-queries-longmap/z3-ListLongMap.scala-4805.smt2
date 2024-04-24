; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66084 () Bool)

(assert start!66084)

(declare-fun b!760971 () Bool)

(declare-fun res!514699 () Bool)

(declare-fun e!424268 () Bool)

(assert (=> b!760971 (=> (not res!514699) (not e!424268))))

(declare-datatypes ((array!42064 0))(
  ( (array!42065 (arr!20140 (Array (_ BitVec 32) (_ BitVec 64))) (size!20560 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42064)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!760971 (= res!514699 (validKeyInArray!0 (select (arr!20140 a!3186) j!159)))))

(declare-fun b!760972 () Bool)

(declare-fun e!424272 () Bool)

(declare-fun e!424265 () Bool)

(assert (=> b!760972 (= e!424272 e!424265)))

(declare-fun res!514705 () Bool)

(assert (=> b!760972 (=> (not res!514705) (not e!424265))))

(declare-datatypes ((SeekEntryResult!7696 0))(
  ( (MissingZero!7696 (index!33152 (_ BitVec 32))) (Found!7696 (index!33153 (_ BitVec 32))) (Intermediate!7696 (undefined!8508 Bool) (index!33154 (_ BitVec 32)) (x!64203 (_ BitVec 32))) (Undefined!7696) (MissingVacant!7696 (index!33155 (_ BitVec 32))) )
))
(declare-fun lt!339039 () SeekEntryResult!7696)

(declare-fun lt!339034 () SeekEntryResult!7696)

(assert (=> b!760972 (= res!514705 (= lt!339039 lt!339034))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!339037 () array!42064)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun lt!339036 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42064 (_ BitVec 32)) SeekEntryResult!7696)

(assert (=> b!760972 (= lt!339034 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!339036 lt!339037 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!760972 (= lt!339039 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!339036 mask!3328) lt!339036 lt!339037 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!760972 (= lt!339036 (select (store (arr!20140 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!760972 (= lt!339037 (array!42065 (store (arr!20140 a!3186) i!1173 k0!2102) (size!20560 a!3186)))))

(declare-fun res!514700 () Bool)

(assert (=> start!66084 (=> (not res!514700) (not e!424268))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66084 (= res!514700 (validMask!0 mask!3328))))

(assert (=> start!66084 e!424268))

(assert (=> start!66084 true))

(declare-fun array_inv!15999 (array!42064) Bool)

(assert (=> start!66084 (array_inv!15999 a!3186)))

(declare-fun b!760973 () Bool)

(declare-fun res!514704 () Bool)

(assert (=> b!760973 (=> (not res!514704) (not e!424268))))

(declare-fun arrayContainsKey!0 (array!42064 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!760973 (= res!514704 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!760974 () Bool)

(declare-fun res!514703 () Bool)

(declare-fun e!424270 () Bool)

(assert (=> b!760974 (=> (not res!514703) (not e!424270))))

(declare-datatypes ((List!14049 0))(
  ( (Nil!14046) (Cons!14045 (h!15126 (_ BitVec 64)) (t!20356 List!14049)) )
))
(declare-fun arrayNoDuplicates!0 (array!42064 (_ BitVec 32) List!14049) Bool)

(assert (=> b!760974 (= res!514703 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14046))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!760975 () Bool)

(declare-fun e!424271 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42064 (_ BitVec 32)) SeekEntryResult!7696)

(assert (=> b!760975 (= e!424271 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20140 a!3186) j!159) a!3186 mask!3328) (Found!7696 j!159)))))

(declare-fun b!760976 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun e!424267 () Bool)

(declare-fun lt!339033 () SeekEntryResult!7696)

(assert (=> b!760976 (= e!424267 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20140 a!3186) j!159) a!3186 mask!3328) lt!339033))))

(declare-fun b!760977 () Bool)

(declare-fun lt!339035 () SeekEntryResult!7696)

(assert (=> b!760977 (= e!424271 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20140 a!3186) j!159) a!3186 mask!3328) lt!339035))))

(declare-fun b!760978 () Bool)

(assert (=> b!760978 (= e!424270 e!424272)))

(declare-fun res!514707 () Bool)

(assert (=> b!760978 (=> (not res!514707) (not e!424272))))

(assert (=> b!760978 (= res!514707 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20140 a!3186) j!159) mask!3328) (select (arr!20140 a!3186) j!159) a!3186 mask!3328) lt!339035))))

(assert (=> b!760978 (= lt!339035 (Intermediate!7696 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!760979 () Bool)

(declare-fun res!514701 () Bool)

(assert (=> b!760979 (=> (not res!514701) (not e!424268))))

(assert (=> b!760979 (= res!514701 (and (= (size!20560 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20560 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20560 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!760980 () Bool)

(declare-fun res!514709 () Bool)

(assert (=> b!760980 (=> (not res!514709) (not e!424272))))

(assert (=> b!760980 (= res!514709 e!424271)))

(declare-fun c!83522 () Bool)

(assert (=> b!760980 (= c!83522 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!760981 () Bool)

(declare-fun res!514698 () Bool)

(assert (=> b!760981 (=> (not res!514698) (not e!424270))))

(assert (=> b!760981 (= res!514698 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20560 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20560 a!3186))))))

(declare-fun b!760982 () Bool)

(declare-fun res!514706 () Bool)

(assert (=> b!760982 (=> (not res!514706) (not e!424272))))

(assert (=> b!760982 (= res!514706 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20140 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!760983 () Bool)

(assert (=> b!760983 (= e!424268 e!424270)))

(declare-fun res!514711 () Bool)

(assert (=> b!760983 (=> (not res!514711) (not e!424270))))

(declare-fun lt!339038 () SeekEntryResult!7696)

(assert (=> b!760983 (= res!514711 (or (= lt!339038 (MissingZero!7696 i!1173)) (= lt!339038 (MissingVacant!7696 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42064 (_ BitVec 32)) SeekEntryResult!7696)

(assert (=> b!760983 (= lt!339038 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!760984 () Bool)

(declare-fun res!514697 () Bool)

(assert (=> b!760984 (=> (not res!514697) (not e!424268))))

(assert (=> b!760984 (= res!514697 (validKeyInArray!0 k0!2102))))

(declare-fun b!760985 () Bool)

(get-info :version)

(assert (=> b!760985 (= e!424265 (not (or (not ((_ is Intermediate!7696) lt!339034)) (not (= x!1131 (x!64203 lt!339034))) (= index!1321 (index!33154 lt!339034)))))))

(declare-fun e!424269 () Bool)

(assert (=> b!760985 e!424269))

(declare-fun res!514708 () Bool)

(assert (=> b!760985 (=> (not res!514708) (not e!424269))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42064 (_ BitVec 32)) Bool)

(assert (=> b!760985 (= res!514708 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26311 0))(
  ( (Unit!26312) )
))
(declare-fun lt!339032 () Unit!26311)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42064 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26311)

(assert (=> b!760985 (= lt!339032 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!760986 () Bool)

(assert (=> b!760986 (= e!424269 e!424267)))

(declare-fun res!514710 () Bool)

(assert (=> b!760986 (=> (not res!514710) (not e!424267))))

(assert (=> b!760986 (= res!514710 (= (seekEntryOrOpen!0 (select (arr!20140 a!3186) j!159) a!3186 mask!3328) lt!339033))))

(assert (=> b!760986 (= lt!339033 (Found!7696 j!159))))

(declare-fun b!760987 () Bool)

(declare-fun res!514702 () Bool)

(assert (=> b!760987 (=> (not res!514702) (not e!424270))))

(assert (=> b!760987 (= res!514702 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!66084 res!514700) b!760979))

(assert (= (and b!760979 res!514701) b!760971))

(assert (= (and b!760971 res!514699) b!760984))

(assert (= (and b!760984 res!514697) b!760973))

(assert (= (and b!760973 res!514704) b!760983))

(assert (= (and b!760983 res!514711) b!760987))

(assert (= (and b!760987 res!514702) b!760974))

(assert (= (and b!760974 res!514703) b!760981))

(assert (= (and b!760981 res!514698) b!760978))

(assert (= (and b!760978 res!514707) b!760982))

(assert (= (and b!760982 res!514706) b!760980))

(assert (= (and b!760980 c!83522) b!760977))

(assert (= (and b!760980 (not c!83522)) b!760975))

(assert (= (and b!760980 res!514709) b!760972))

(assert (= (and b!760972 res!514705) b!760985))

(assert (= (and b!760985 res!514708) b!760986))

(assert (= (and b!760986 res!514710) b!760976))

(declare-fun m!708573 () Bool)

(assert (=> b!760972 m!708573))

(declare-fun m!708575 () Bool)

(assert (=> b!760972 m!708575))

(declare-fun m!708577 () Bool)

(assert (=> b!760972 m!708577))

(declare-fun m!708579 () Bool)

(assert (=> b!760972 m!708579))

(assert (=> b!760972 m!708579))

(declare-fun m!708581 () Bool)

(assert (=> b!760972 m!708581))

(declare-fun m!708583 () Bool)

(assert (=> b!760982 m!708583))

(declare-fun m!708585 () Bool)

(assert (=> b!760974 m!708585))

(declare-fun m!708587 () Bool)

(assert (=> b!760984 m!708587))

(declare-fun m!708589 () Bool)

(assert (=> b!760987 m!708589))

(declare-fun m!708591 () Bool)

(assert (=> b!760978 m!708591))

(assert (=> b!760978 m!708591))

(declare-fun m!708593 () Bool)

(assert (=> b!760978 m!708593))

(assert (=> b!760978 m!708593))

(assert (=> b!760978 m!708591))

(declare-fun m!708595 () Bool)

(assert (=> b!760978 m!708595))

(assert (=> b!760975 m!708591))

(assert (=> b!760975 m!708591))

(declare-fun m!708597 () Bool)

(assert (=> b!760975 m!708597))

(assert (=> b!760986 m!708591))

(assert (=> b!760986 m!708591))

(declare-fun m!708599 () Bool)

(assert (=> b!760986 m!708599))

(declare-fun m!708601 () Bool)

(assert (=> b!760983 m!708601))

(assert (=> b!760977 m!708591))

(assert (=> b!760977 m!708591))

(declare-fun m!708603 () Bool)

(assert (=> b!760977 m!708603))

(assert (=> b!760971 m!708591))

(assert (=> b!760971 m!708591))

(declare-fun m!708605 () Bool)

(assert (=> b!760971 m!708605))

(assert (=> b!760976 m!708591))

(assert (=> b!760976 m!708591))

(declare-fun m!708607 () Bool)

(assert (=> b!760976 m!708607))

(declare-fun m!708609 () Bool)

(assert (=> b!760985 m!708609))

(declare-fun m!708611 () Bool)

(assert (=> b!760985 m!708611))

(declare-fun m!708613 () Bool)

(assert (=> b!760973 m!708613))

(declare-fun m!708615 () Bool)

(assert (=> start!66084 m!708615))

(declare-fun m!708617 () Bool)

(assert (=> start!66084 m!708617))

(check-sat (not b!760978) (not start!66084) (not b!760972) (not b!760984) (not b!760977) (not b!760986) (not b!760985) (not b!760983) (not b!760975) (not b!760971) (not b!760976) (not b!760987) (not b!760973) (not b!760974))
(check-sat)
(get-model)

(declare-fun e!424334 () SeekEntryResult!7696)

(declare-fun b!761108 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!761108 (= e!424334 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20140 a!3186) j!159) mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3328) (select (arr!20140 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!761109 () Bool)

(declare-fun e!424331 () Bool)

(declare-fun e!424333 () Bool)

(assert (=> b!761109 (= e!424331 e!424333)))

(declare-fun res!514809 () Bool)

(declare-fun lt!339093 () SeekEntryResult!7696)

(assert (=> b!761109 (= res!514809 (and ((_ is Intermediate!7696) lt!339093) (not (undefined!8508 lt!339093)) (bvslt (x!64203 lt!339093) #b01111111111111111111111111111110) (bvsge (x!64203 lt!339093) #b00000000000000000000000000000000) (bvsge (x!64203 lt!339093) #b00000000000000000000000000000000)))))

(assert (=> b!761109 (=> (not res!514809) (not e!424333))))

(declare-fun b!761110 () Bool)

(declare-fun e!424335 () SeekEntryResult!7696)

(assert (=> b!761110 (= e!424335 (Intermediate!7696 true (toIndex!0 (select (arr!20140 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!761111 () Bool)

(assert (=> b!761111 (= e!424331 (bvsge (x!64203 lt!339093) #b01111111111111111111111111111110))))

(declare-fun d!100793 () Bool)

(assert (=> d!100793 e!424331))

(declare-fun c!83537 () Bool)

(assert (=> d!100793 (= c!83537 (and ((_ is Intermediate!7696) lt!339093) (undefined!8508 lt!339093)))))

(assert (=> d!100793 (= lt!339093 e!424335)))

(declare-fun c!83536 () Bool)

(assert (=> d!100793 (= c!83536 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!339092 () (_ BitVec 64))

(assert (=> d!100793 (= lt!339092 (select (arr!20140 a!3186) (toIndex!0 (select (arr!20140 a!3186) j!159) mask!3328)))))

(assert (=> d!100793 (validMask!0 mask!3328)))

(assert (=> d!100793 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20140 a!3186) j!159) mask!3328) (select (arr!20140 a!3186) j!159) a!3186 mask!3328) lt!339093)))

(declare-fun b!761112 () Bool)

(assert (=> b!761112 (= e!424334 (Intermediate!7696 false (toIndex!0 (select (arr!20140 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!761113 () Bool)

(assert (=> b!761113 (and (bvsge (index!33154 lt!339093) #b00000000000000000000000000000000) (bvslt (index!33154 lt!339093) (size!20560 a!3186)))))

(declare-fun res!514810 () Bool)

(assert (=> b!761113 (= res!514810 (= (select (arr!20140 a!3186) (index!33154 lt!339093)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!424332 () Bool)

(assert (=> b!761113 (=> res!514810 e!424332)))

(declare-fun b!761114 () Bool)

(assert (=> b!761114 (and (bvsge (index!33154 lt!339093) #b00000000000000000000000000000000) (bvslt (index!33154 lt!339093) (size!20560 a!3186)))))

(declare-fun res!514808 () Bool)

(assert (=> b!761114 (= res!514808 (= (select (arr!20140 a!3186) (index!33154 lt!339093)) (select (arr!20140 a!3186) j!159)))))

(assert (=> b!761114 (=> res!514808 e!424332)))

(assert (=> b!761114 (= e!424333 e!424332)))

(declare-fun b!761115 () Bool)

(assert (=> b!761115 (= e!424335 e!424334)))

(declare-fun c!83535 () Bool)

(assert (=> b!761115 (= c!83535 (or (= lt!339092 (select (arr!20140 a!3186) j!159)) (= (bvadd lt!339092 lt!339092) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!761116 () Bool)

(assert (=> b!761116 (and (bvsge (index!33154 lt!339093) #b00000000000000000000000000000000) (bvslt (index!33154 lt!339093) (size!20560 a!3186)))))

(assert (=> b!761116 (= e!424332 (= (select (arr!20140 a!3186) (index!33154 lt!339093)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!100793 c!83536) b!761110))

(assert (= (and d!100793 (not c!83536)) b!761115))

(assert (= (and b!761115 c!83535) b!761112))

(assert (= (and b!761115 (not c!83535)) b!761108))

(assert (= (and d!100793 c!83537) b!761111))

(assert (= (and d!100793 (not c!83537)) b!761109))

(assert (= (and b!761109 res!514809) b!761114))

(assert (= (and b!761114 (not res!514808)) b!761113))

(assert (= (and b!761113 (not res!514810)) b!761116))

(declare-fun m!708711 () Bool)

(assert (=> b!761113 m!708711))

(assert (=> b!761116 m!708711))

(assert (=> b!761108 m!708593))

(declare-fun m!708713 () Bool)

(assert (=> b!761108 m!708713))

(assert (=> b!761108 m!708713))

(assert (=> b!761108 m!708591))

(declare-fun m!708715 () Bool)

(assert (=> b!761108 m!708715))

(assert (=> b!761114 m!708711))

(assert (=> d!100793 m!708593))

(declare-fun m!708717 () Bool)

(assert (=> d!100793 m!708717))

(assert (=> d!100793 m!708615))

(assert (=> b!760978 d!100793))

(declare-fun d!100795 () Bool)

(declare-fun lt!339099 () (_ BitVec 32))

(declare-fun lt!339098 () (_ BitVec 32))

(assert (=> d!100795 (= lt!339099 (bvmul (bvxor lt!339098 (bvlshr lt!339098 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!100795 (= lt!339098 ((_ extract 31 0) (bvand (bvxor (select (arr!20140 a!3186) j!159) (bvlshr (select (arr!20140 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!100795 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!514811 (let ((h!15129 ((_ extract 31 0) (bvand (bvxor (select (arr!20140 a!3186) j!159) (bvlshr (select (arr!20140 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64207 (bvmul (bvxor h!15129 (bvlshr h!15129 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64207 (bvlshr x!64207 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!514811 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!514811 #b00000000000000000000000000000000))))))

(assert (=> d!100795 (= (toIndex!0 (select (arr!20140 a!3186) j!159) mask!3328) (bvand (bvxor lt!339099 (bvlshr lt!339099 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!760978 d!100795))

(declare-fun e!424339 () SeekEntryResult!7696)

(declare-fun b!761117 () Bool)

(assert (=> b!761117 (= e!424339 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) (select (arr!20140 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!761118 () Bool)

(declare-fun e!424336 () Bool)

(declare-fun e!424338 () Bool)

(assert (=> b!761118 (= e!424336 e!424338)))

(declare-fun res!514813 () Bool)

(declare-fun lt!339101 () SeekEntryResult!7696)

(assert (=> b!761118 (= res!514813 (and ((_ is Intermediate!7696) lt!339101) (not (undefined!8508 lt!339101)) (bvslt (x!64203 lt!339101) #b01111111111111111111111111111110) (bvsge (x!64203 lt!339101) #b00000000000000000000000000000000) (bvsge (x!64203 lt!339101) x!1131)))))

(assert (=> b!761118 (=> (not res!514813) (not e!424338))))

(declare-fun b!761119 () Bool)

(declare-fun e!424340 () SeekEntryResult!7696)

(assert (=> b!761119 (= e!424340 (Intermediate!7696 true index!1321 x!1131))))

(declare-fun b!761120 () Bool)

(assert (=> b!761120 (= e!424336 (bvsge (x!64203 lt!339101) #b01111111111111111111111111111110))))

(declare-fun d!100797 () Bool)

(assert (=> d!100797 e!424336))

(declare-fun c!83540 () Bool)

(assert (=> d!100797 (= c!83540 (and ((_ is Intermediate!7696) lt!339101) (undefined!8508 lt!339101)))))

(assert (=> d!100797 (= lt!339101 e!424340)))

(declare-fun c!83539 () Bool)

(assert (=> d!100797 (= c!83539 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!339100 () (_ BitVec 64))

(assert (=> d!100797 (= lt!339100 (select (arr!20140 a!3186) index!1321))))

(assert (=> d!100797 (validMask!0 mask!3328)))

(assert (=> d!100797 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20140 a!3186) j!159) a!3186 mask!3328) lt!339101)))

(declare-fun b!761121 () Bool)

(assert (=> b!761121 (= e!424339 (Intermediate!7696 false index!1321 x!1131))))

(declare-fun b!761122 () Bool)

(assert (=> b!761122 (and (bvsge (index!33154 lt!339101) #b00000000000000000000000000000000) (bvslt (index!33154 lt!339101) (size!20560 a!3186)))))

(declare-fun res!514814 () Bool)

(assert (=> b!761122 (= res!514814 (= (select (arr!20140 a!3186) (index!33154 lt!339101)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!424337 () Bool)

(assert (=> b!761122 (=> res!514814 e!424337)))

(declare-fun b!761123 () Bool)

(assert (=> b!761123 (and (bvsge (index!33154 lt!339101) #b00000000000000000000000000000000) (bvslt (index!33154 lt!339101) (size!20560 a!3186)))))

(declare-fun res!514812 () Bool)

(assert (=> b!761123 (= res!514812 (= (select (arr!20140 a!3186) (index!33154 lt!339101)) (select (arr!20140 a!3186) j!159)))))

(assert (=> b!761123 (=> res!514812 e!424337)))

(assert (=> b!761123 (= e!424338 e!424337)))

(declare-fun b!761124 () Bool)

(assert (=> b!761124 (= e!424340 e!424339)))

(declare-fun c!83538 () Bool)

(assert (=> b!761124 (= c!83538 (or (= lt!339100 (select (arr!20140 a!3186) j!159)) (= (bvadd lt!339100 lt!339100) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!761125 () Bool)

(assert (=> b!761125 (and (bvsge (index!33154 lt!339101) #b00000000000000000000000000000000) (bvslt (index!33154 lt!339101) (size!20560 a!3186)))))

(assert (=> b!761125 (= e!424337 (= (select (arr!20140 a!3186) (index!33154 lt!339101)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!100797 c!83539) b!761119))

(assert (= (and d!100797 (not c!83539)) b!761124))

(assert (= (and b!761124 c!83538) b!761121))

(assert (= (and b!761124 (not c!83538)) b!761117))

(assert (= (and d!100797 c!83540) b!761120))

(assert (= (and d!100797 (not c!83540)) b!761118))

(assert (= (and b!761118 res!514813) b!761123))

(assert (= (and b!761123 (not res!514812)) b!761122))

(assert (= (and b!761122 (not res!514814)) b!761125))

(declare-fun m!708719 () Bool)

(assert (=> b!761122 m!708719))

(assert (=> b!761125 m!708719))

(declare-fun m!708721 () Bool)

(assert (=> b!761117 m!708721))

(assert (=> b!761117 m!708721))

(assert (=> b!761117 m!708591))

(declare-fun m!708723 () Bool)

(assert (=> b!761117 m!708723))

(assert (=> b!761123 m!708719))

(declare-fun m!708725 () Bool)

(assert (=> d!100797 m!708725))

(assert (=> d!100797 m!708615))

(assert (=> b!760977 d!100797))

(declare-fun d!100799 () Bool)

(assert (=> d!100799 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!66084 d!100799))

(declare-fun d!100805 () Bool)

(assert (=> d!100805 (= (array_inv!15999 a!3186) (bvsge (size!20560 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!66084 d!100805))

(declare-fun d!100807 () Bool)

(assert (=> d!100807 (= (validKeyInArray!0 (select (arr!20140 a!3186) j!159)) (and (not (= (select (arr!20140 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20140 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!760971 d!100807))

(declare-fun d!100809 () Bool)

(declare-fun res!514819 () Bool)

(declare-fun e!424345 () Bool)

(assert (=> d!100809 (=> res!514819 e!424345)))

(assert (=> d!100809 (= res!514819 (= (select (arr!20140 a!3186) #b00000000000000000000000000000000) k0!2102))))

(assert (=> d!100809 (= (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000) e!424345)))

(declare-fun b!761130 () Bool)

(declare-fun e!424346 () Bool)

(assert (=> b!761130 (= e!424345 e!424346)))

(declare-fun res!514820 () Bool)

(assert (=> b!761130 (=> (not res!514820) (not e!424346))))

(assert (=> b!761130 (= res!514820 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20560 a!3186)))))

(declare-fun b!761131 () Bool)

(assert (=> b!761131 (= e!424346 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!100809 (not res!514819)) b!761130))

(assert (= (and b!761130 res!514820) b!761131))

(declare-fun m!708727 () Bool)

(assert (=> d!100809 m!708727))

(declare-fun m!708729 () Bool)

(assert (=> b!761131 m!708729))

(assert (=> b!760973 d!100809))

(declare-fun d!100811 () Bool)

(assert (=> d!100811 (= (validKeyInArray!0 k0!2102) (and (not (= k0!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!760984 d!100811))

(declare-fun e!424350 () SeekEntryResult!7696)

(declare-fun b!761132 () Bool)

(assert (=> b!761132 (= e!424350 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) lt!339036 lt!339037 mask!3328))))

(declare-fun b!761133 () Bool)

(declare-fun e!424347 () Bool)

(declare-fun e!424349 () Bool)

(assert (=> b!761133 (= e!424347 e!424349)))

(declare-fun res!514822 () Bool)

(declare-fun lt!339103 () SeekEntryResult!7696)

(assert (=> b!761133 (= res!514822 (and ((_ is Intermediate!7696) lt!339103) (not (undefined!8508 lt!339103)) (bvslt (x!64203 lt!339103) #b01111111111111111111111111111110) (bvsge (x!64203 lt!339103) #b00000000000000000000000000000000) (bvsge (x!64203 lt!339103) x!1131)))))

(assert (=> b!761133 (=> (not res!514822) (not e!424349))))

(declare-fun b!761134 () Bool)

(declare-fun e!424351 () SeekEntryResult!7696)

(assert (=> b!761134 (= e!424351 (Intermediate!7696 true index!1321 x!1131))))

(declare-fun b!761135 () Bool)

(assert (=> b!761135 (= e!424347 (bvsge (x!64203 lt!339103) #b01111111111111111111111111111110))))

(declare-fun d!100813 () Bool)

(assert (=> d!100813 e!424347))

(declare-fun c!83543 () Bool)

(assert (=> d!100813 (= c!83543 (and ((_ is Intermediate!7696) lt!339103) (undefined!8508 lt!339103)))))

(assert (=> d!100813 (= lt!339103 e!424351)))

(declare-fun c!83542 () Bool)

(assert (=> d!100813 (= c!83542 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!339102 () (_ BitVec 64))

(assert (=> d!100813 (= lt!339102 (select (arr!20140 lt!339037) index!1321))))

(assert (=> d!100813 (validMask!0 mask!3328)))

(assert (=> d!100813 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!339036 lt!339037 mask!3328) lt!339103)))

(declare-fun b!761136 () Bool)

(assert (=> b!761136 (= e!424350 (Intermediate!7696 false index!1321 x!1131))))

(declare-fun b!761137 () Bool)

(assert (=> b!761137 (and (bvsge (index!33154 lt!339103) #b00000000000000000000000000000000) (bvslt (index!33154 lt!339103) (size!20560 lt!339037)))))

(declare-fun res!514823 () Bool)

(assert (=> b!761137 (= res!514823 (= (select (arr!20140 lt!339037) (index!33154 lt!339103)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!424348 () Bool)

(assert (=> b!761137 (=> res!514823 e!424348)))

(declare-fun b!761138 () Bool)

(assert (=> b!761138 (and (bvsge (index!33154 lt!339103) #b00000000000000000000000000000000) (bvslt (index!33154 lt!339103) (size!20560 lt!339037)))))

(declare-fun res!514821 () Bool)

(assert (=> b!761138 (= res!514821 (= (select (arr!20140 lt!339037) (index!33154 lt!339103)) lt!339036))))

(assert (=> b!761138 (=> res!514821 e!424348)))

(assert (=> b!761138 (= e!424349 e!424348)))

(declare-fun b!761139 () Bool)

(assert (=> b!761139 (= e!424351 e!424350)))

(declare-fun c!83541 () Bool)

(assert (=> b!761139 (= c!83541 (or (= lt!339102 lt!339036) (= (bvadd lt!339102 lt!339102) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!761140 () Bool)

(assert (=> b!761140 (and (bvsge (index!33154 lt!339103) #b00000000000000000000000000000000) (bvslt (index!33154 lt!339103) (size!20560 lt!339037)))))

(assert (=> b!761140 (= e!424348 (= (select (arr!20140 lt!339037) (index!33154 lt!339103)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!100813 c!83542) b!761134))

(assert (= (and d!100813 (not c!83542)) b!761139))

(assert (= (and b!761139 c!83541) b!761136))

(assert (= (and b!761139 (not c!83541)) b!761132))

(assert (= (and d!100813 c!83543) b!761135))

(assert (= (and d!100813 (not c!83543)) b!761133))

(assert (= (and b!761133 res!514822) b!761138))

(assert (= (and b!761138 (not res!514821)) b!761137))

(assert (= (and b!761137 (not res!514823)) b!761140))

(declare-fun m!708731 () Bool)

(assert (=> b!761137 m!708731))

(assert (=> b!761140 m!708731))

(assert (=> b!761132 m!708721))

(assert (=> b!761132 m!708721))

(declare-fun m!708733 () Bool)

(assert (=> b!761132 m!708733))

(assert (=> b!761138 m!708731))

(declare-fun m!708735 () Bool)

(assert (=> d!100813 m!708735))

(assert (=> d!100813 m!708615))

(assert (=> b!760972 d!100813))

(declare-fun b!761147 () Bool)

(declare-fun e!424361 () SeekEntryResult!7696)

(assert (=> b!761147 (= e!424361 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!339036 mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3328) lt!339036 lt!339037 mask!3328))))

(declare-fun b!761148 () Bool)

(declare-fun e!424356 () Bool)

(declare-fun e!424360 () Bool)

(assert (=> b!761148 (= e!424356 e!424360)))

(declare-fun res!514829 () Bool)

(declare-fun lt!339111 () SeekEntryResult!7696)

(assert (=> b!761148 (= res!514829 (and ((_ is Intermediate!7696) lt!339111) (not (undefined!8508 lt!339111)) (bvslt (x!64203 lt!339111) #b01111111111111111111111111111110) (bvsge (x!64203 lt!339111) #b00000000000000000000000000000000) (bvsge (x!64203 lt!339111) #b00000000000000000000000000000000)))))

(assert (=> b!761148 (=> (not res!514829) (not e!424360))))

(declare-fun b!761149 () Bool)

(declare-fun e!424362 () SeekEntryResult!7696)

(assert (=> b!761149 (= e!424362 (Intermediate!7696 true (toIndex!0 lt!339036 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!761150 () Bool)

(assert (=> b!761150 (= e!424356 (bvsge (x!64203 lt!339111) #b01111111111111111111111111111110))))

(declare-fun d!100815 () Bool)

(assert (=> d!100815 e!424356))

(declare-fun c!83548 () Bool)

(assert (=> d!100815 (= c!83548 (and ((_ is Intermediate!7696) lt!339111) (undefined!8508 lt!339111)))))

(assert (=> d!100815 (= lt!339111 e!424362)))

(declare-fun c!83547 () Bool)

(assert (=> d!100815 (= c!83547 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!339110 () (_ BitVec 64))

(assert (=> d!100815 (= lt!339110 (select (arr!20140 lt!339037) (toIndex!0 lt!339036 mask!3328)))))

(assert (=> d!100815 (validMask!0 mask!3328)))

(assert (=> d!100815 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!339036 mask!3328) lt!339036 lt!339037 mask!3328) lt!339111)))

(declare-fun b!761151 () Bool)

(assert (=> b!761151 (= e!424361 (Intermediate!7696 false (toIndex!0 lt!339036 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!761152 () Bool)

(assert (=> b!761152 (and (bvsge (index!33154 lt!339111) #b00000000000000000000000000000000) (bvslt (index!33154 lt!339111) (size!20560 lt!339037)))))

(declare-fun res!514830 () Bool)

(assert (=> b!761152 (= res!514830 (= (select (arr!20140 lt!339037) (index!33154 lt!339111)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!424357 () Bool)

(assert (=> b!761152 (=> res!514830 e!424357)))

(declare-fun b!761153 () Bool)

(assert (=> b!761153 (and (bvsge (index!33154 lt!339111) #b00000000000000000000000000000000) (bvslt (index!33154 lt!339111) (size!20560 lt!339037)))))

(declare-fun res!514828 () Bool)

(assert (=> b!761153 (= res!514828 (= (select (arr!20140 lt!339037) (index!33154 lt!339111)) lt!339036))))

(assert (=> b!761153 (=> res!514828 e!424357)))

(assert (=> b!761153 (= e!424360 e!424357)))

(declare-fun b!761154 () Bool)

(assert (=> b!761154 (= e!424362 e!424361)))

(declare-fun c!83546 () Bool)

(assert (=> b!761154 (= c!83546 (or (= lt!339110 lt!339036) (= (bvadd lt!339110 lt!339110) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!761155 () Bool)

(assert (=> b!761155 (and (bvsge (index!33154 lt!339111) #b00000000000000000000000000000000) (bvslt (index!33154 lt!339111) (size!20560 lt!339037)))))

(assert (=> b!761155 (= e!424357 (= (select (arr!20140 lt!339037) (index!33154 lt!339111)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!100815 c!83547) b!761149))

(assert (= (and d!100815 (not c!83547)) b!761154))

(assert (= (and b!761154 c!83546) b!761151))

(assert (= (and b!761154 (not c!83546)) b!761147))

(assert (= (and d!100815 c!83548) b!761150))

(assert (= (and d!100815 (not c!83548)) b!761148))

(assert (= (and b!761148 res!514829) b!761153))

(assert (= (and b!761153 (not res!514828)) b!761152))

(assert (= (and b!761152 (not res!514830)) b!761155))

(declare-fun m!708737 () Bool)

(assert (=> b!761152 m!708737))

(assert (=> b!761155 m!708737))

(assert (=> b!761147 m!708579))

(declare-fun m!708739 () Bool)

(assert (=> b!761147 m!708739))

(assert (=> b!761147 m!708739))

(declare-fun m!708741 () Bool)

(assert (=> b!761147 m!708741))

(assert (=> b!761153 m!708737))

(assert (=> d!100815 m!708579))

(declare-fun m!708743 () Bool)

(assert (=> d!100815 m!708743))

(assert (=> d!100815 m!708615))

(assert (=> b!760972 d!100815))

(declare-fun d!100817 () Bool)

(declare-fun lt!339117 () (_ BitVec 32))

(declare-fun lt!339116 () (_ BitVec 32))

(assert (=> d!100817 (= lt!339117 (bvmul (bvxor lt!339116 (bvlshr lt!339116 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!100817 (= lt!339116 ((_ extract 31 0) (bvand (bvxor lt!339036 (bvlshr lt!339036 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!100817 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!514811 (let ((h!15129 ((_ extract 31 0) (bvand (bvxor lt!339036 (bvlshr lt!339036 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64207 (bvmul (bvxor h!15129 (bvlshr h!15129 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64207 (bvlshr x!64207 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!514811 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!514811 #b00000000000000000000000000000000))))))

(assert (=> d!100817 (= (toIndex!0 lt!339036 mask!3328) (bvand (bvxor lt!339117 (bvlshr lt!339117 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!760972 d!100817))

(declare-fun b!761234 () Bool)

(declare-fun e!424411 () SeekEntryResult!7696)

(assert (=> b!761234 (= e!424411 Undefined!7696)))

(declare-fun d!100819 () Bool)

(declare-fun lt!339141 () SeekEntryResult!7696)

(assert (=> d!100819 (and (or ((_ is Undefined!7696) lt!339141) (not ((_ is Found!7696) lt!339141)) (and (bvsge (index!33153 lt!339141) #b00000000000000000000000000000000) (bvslt (index!33153 lt!339141) (size!20560 a!3186)))) (or ((_ is Undefined!7696) lt!339141) ((_ is Found!7696) lt!339141) (not ((_ is MissingZero!7696) lt!339141)) (and (bvsge (index!33152 lt!339141) #b00000000000000000000000000000000) (bvslt (index!33152 lt!339141) (size!20560 a!3186)))) (or ((_ is Undefined!7696) lt!339141) ((_ is Found!7696) lt!339141) ((_ is MissingZero!7696) lt!339141) (not ((_ is MissingVacant!7696) lt!339141)) (and (bvsge (index!33155 lt!339141) #b00000000000000000000000000000000) (bvslt (index!33155 lt!339141) (size!20560 a!3186)))) (or ((_ is Undefined!7696) lt!339141) (ite ((_ is Found!7696) lt!339141) (= (select (arr!20140 a!3186) (index!33153 lt!339141)) k0!2102) (ite ((_ is MissingZero!7696) lt!339141) (= (select (arr!20140 a!3186) (index!33152 lt!339141)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7696) lt!339141) (= (select (arr!20140 a!3186) (index!33155 lt!339141)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!100819 (= lt!339141 e!424411)))

(declare-fun c!83575 () Bool)

(declare-fun lt!339139 () SeekEntryResult!7696)

(assert (=> d!100819 (= c!83575 (and ((_ is Intermediate!7696) lt!339139) (undefined!8508 lt!339139)))))

(assert (=> d!100819 (= lt!339139 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328))))

(assert (=> d!100819 (validMask!0 mask!3328)))

(assert (=> d!100819 (= (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328) lt!339141)))

(declare-fun b!761235 () Bool)

(declare-fun c!83576 () Bool)

(declare-fun lt!339140 () (_ BitVec 64))

(assert (=> b!761235 (= c!83576 (= lt!339140 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!424409 () SeekEntryResult!7696)

(declare-fun e!424410 () SeekEntryResult!7696)

(assert (=> b!761235 (= e!424409 e!424410)))

(declare-fun b!761236 () Bool)

(assert (=> b!761236 (= e!424411 e!424409)))

(assert (=> b!761236 (= lt!339140 (select (arr!20140 a!3186) (index!33154 lt!339139)))))

(declare-fun c!83574 () Bool)

(assert (=> b!761236 (= c!83574 (= lt!339140 k0!2102))))

(declare-fun b!761237 () Bool)

(assert (=> b!761237 (= e!424410 (seekKeyOrZeroReturnVacant!0 (x!64203 lt!339139) (index!33154 lt!339139) (index!33154 lt!339139) k0!2102 a!3186 mask!3328))))

(declare-fun b!761238 () Bool)

(assert (=> b!761238 (= e!424409 (Found!7696 (index!33154 lt!339139)))))

(declare-fun b!761239 () Bool)

(assert (=> b!761239 (= e!424410 (MissingZero!7696 (index!33154 lt!339139)))))

(assert (= (and d!100819 c!83575) b!761234))

(assert (= (and d!100819 (not c!83575)) b!761236))

(assert (= (and b!761236 c!83574) b!761238))

(assert (= (and b!761236 (not c!83574)) b!761235))

(assert (= (and b!761235 c!83576) b!761239))

(assert (= (and b!761235 (not c!83576)) b!761237))

(declare-fun m!708773 () Bool)

(assert (=> d!100819 m!708773))

(declare-fun m!708775 () Bool)

(assert (=> d!100819 m!708775))

(declare-fun m!708777 () Bool)

(assert (=> d!100819 m!708777))

(declare-fun m!708779 () Bool)

(assert (=> d!100819 m!708779))

(declare-fun m!708781 () Bool)

(assert (=> d!100819 m!708781))

(assert (=> d!100819 m!708615))

(assert (=> d!100819 m!708777))

(declare-fun m!708783 () Bool)

(assert (=> b!761236 m!708783))

(declare-fun m!708785 () Bool)

(assert (=> b!761237 m!708785))

(assert (=> b!760983 d!100819))

(declare-fun b!761240 () Bool)

(declare-fun e!424414 () SeekEntryResult!7696)

(assert (=> b!761240 (= e!424414 Undefined!7696)))

(declare-fun d!100831 () Bool)

(declare-fun lt!339144 () SeekEntryResult!7696)

(assert (=> d!100831 (and (or ((_ is Undefined!7696) lt!339144) (not ((_ is Found!7696) lt!339144)) (and (bvsge (index!33153 lt!339144) #b00000000000000000000000000000000) (bvslt (index!33153 lt!339144) (size!20560 a!3186)))) (or ((_ is Undefined!7696) lt!339144) ((_ is Found!7696) lt!339144) (not ((_ is MissingZero!7696) lt!339144)) (and (bvsge (index!33152 lt!339144) #b00000000000000000000000000000000) (bvslt (index!33152 lt!339144) (size!20560 a!3186)))) (or ((_ is Undefined!7696) lt!339144) ((_ is Found!7696) lt!339144) ((_ is MissingZero!7696) lt!339144) (not ((_ is MissingVacant!7696) lt!339144)) (and (bvsge (index!33155 lt!339144) #b00000000000000000000000000000000) (bvslt (index!33155 lt!339144) (size!20560 a!3186)))) (or ((_ is Undefined!7696) lt!339144) (ite ((_ is Found!7696) lt!339144) (= (select (arr!20140 a!3186) (index!33153 lt!339144)) (select (arr!20140 a!3186) j!159)) (ite ((_ is MissingZero!7696) lt!339144) (= (select (arr!20140 a!3186) (index!33152 lt!339144)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7696) lt!339144) (= (select (arr!20140 a!3186) (index!33155 lt!339144)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!100831 (= lt!339144 e!424414)))

(declare-fun c!83578 () Bool)

(declare-fun lt!339142 () SeekEntryResult!7696)

(assert (=> d!100831 (= c!83578 (and ((_ is Intermediate!7696) lt!339142) (undefined!8508 lt!339142)))))

(assert (=> d!100831 (= lt!339142 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20140 a!3186) j!159) mask!3328) (select (arr!20140 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!100831 (validMask!0 mask!3328)))

(assert (=> d!100831 (= (seekEntryOrOpen!0 (select (arr!20140 a!3186) j!159) a!3186 mask!3328) lt!339144)))

(declare-fun b!761241 () Bool)

(declare-fun c!83579 () Bool)

(declare-fun lt!339143 () (_ BitVec 64))

(assert (=> b!761241 (= c!83579 (= lt!339143 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!424412 () SeekEntryResult!7696)

(declare-fun e!424413 () SeekEntryResult!7696)

(assert (=> b!761241 (= e!424412 e!424413)))

(declare-fun b!761242 () Bool)

(assert (=> b!761242 (= e!424414 e!424412)))

(assert (=> b!761242 (= lt!339143 (select (arr!20140 a!3186) (index!33154 lt!339142)))))

(declare-fun c!83577 () Bool)

(assert (=> b!761242 (= c!83577 (= lt!339143 (select (arr!20140 a!3186) j!159)))))

(declare-fun b!761243 () Bool)

(assert (=> b!761243 (= e!424413 (seekKeyOrZeroReturnVacant!0 (x!64203 lt!339142) (index!33154 lt!339142) (index!33154 lt!339142) (select (arr!20140 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!761244 () Bool)

(assert (=> b!761244 (= e!424412 (Found!7696 (index!33154 lt!339142)))))

(declare-fun b!761245 () Bool)

(assert (=> b!761245 (= e!424413 (MissingZero!7696 (index!33154 lt!339142)))))

(assert (= (and d!100831 c!83578) b!761240))

(assert (= (and d!100831 (not c!83578)) b!761242))

(assert (= (and b!761242 c!83577) b!761244))

(assert (= (and b!761242 (not c!83577)) b!761241))

(assert (= (and b!761241 c!83579) b!761245))

(assert (= (and b!761241 (not c!83579)) b!761243))

(declare-fun m!708787 () Bool)

(assert (=> d!100831 m!708787))

(declare-fun m!708789 () Bool)

(assert (=> d!100831 m!708789))

(assert (=> d!100831 m!708593))

(assert (=> d!100831 m!708591))

(assert (=> d!100831 m!708595))

(declare-fun m!708791 () Bool)

(assert (=> d!100831 m!708791))

(assert (=> d!100831 m!708615))

(assert (=> d!100831 m!708591))

(assert (=> d!100831 m!708593))

(declare-fun m!708793 () Bool)

(assert (=> b!761242 m!708793))

(assert (=> b!761243 m!708591))

(declare-fun m!708795 () Bool)

(assert (=> b!761243 m!708795))

(assert (=> b!760986 d!100831))

(declare-fun b!761301 () Bool)

(declare-fun e!424451 () SeekEntryResult!7696)

(assert (=> b!761301 (= e!424451 Undefined!7696)))

(declare-fun b!761303 () Bool)

(declare-fun e!424450 () SeekEntryResult!7696)

(assert (=> b!761303 (= e!424451 e!424450)))

(declare-fun c!83597 () Bool)

(declare-fun lt!339162 () (_ BitVec 64))

(assert (=> b!761303 (= c!83597 (= lt!339162 (select (arr!20140 a!3186) j!159)))))

(declare-fun b!761304 () Bool)

(declare-fun e!424452 () SeekEntryResult!7696)

(assert (=> b!761304 (= e!424452 (MissingVacant!7696 resIntermediateIndex!5))))

(declare-fun b!761305 () Bool)

(declare-fun c!83599 () Bool)

(assert (=> b!761305 (= c!83599 (= lt!339162 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!761305 (= e!424450 e!424452)))

(declare-fun b!761306 () Bool)

(assert (=> b!761306 (= e!424452 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) mask!3328) resIntermediateIndex!5 (select (arr!20140 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!339161 () SeekEntryResult!7696)

(declare-fun d!100833 () Bool)

(assert (=> d!100833 (and (or ((_ is Undefined!7696) lt!339161) (not ((_ is Found!7696) lt!339161)) (and (bvsge (index!33153 lt!339161) #b00000000000000000000000000000000) (bvslt (index!33153 lt!339161) (size!20560 a!3186)))) (or ((_ is Undefined!7696) lt!339161) ((_ is Found!7696) lt!339161) (not ((_ is MissingVacant!7696) lt!339161)) (not (= (index!33155 lt!339161) resIntermediateIndex!5)) (and (bvsge (index!33155 lt!339161) #b00000000000000000000000000000000) (bvslt (index!33155 lt!339161) (size!20560 a!3186)))) (or ((_ is Undefined!7696) lt!339161) (ite ((_ is Found!7696) lt!339161) (= (select (arr!20140 a!3186) (index!33153 lt!339161)) (select (arr!20140 a!3186) j!159)) (and ((_ is MissingVacant!7696) lt!339161) (= (index!33155 lt!339161) resIntermediateIndex!5) (= (select (arr!20140 a!3186) (index!33155 lt!339161)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!100833 (= lt!339161 e!424451)))

(declare-fun c!83598 () Bool)

(assert (=> d!100833 (= c!83598 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(assert (=> d!100833 (= lt!339162 (select (arr!20140 a!3186) resIntermediateIndex!5))))

(assert (=> d!100833 (validMask!0 mask!3328)))

(assert (=> d!100833 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20140 a!3186) j!159) a!3186 mask!3328) lt!339161)))

(declare-fun b!761302 () Bool)

(assert (=> b!761302 (= e!424450 (Found!7696 resIntermediateIndex!5))))

(assert (= (and d!100833 c!83598) b!761301))

(assert (= (and d!100833 (not c!83598)) b!761303))

(assert (= (and b!761303 c!83597) b!761302))

(assert (= (and b!761303 (not c!83597)) b!761305))

(assert (= (and b!761305 c!83599) b!761304))

(assert (= (and b!761305 (not c!83599)) b!761306))

(declare-fun m!708823 () Bool)

(assert (=> b!761306 m!708823))

(assert (=> b!761306 m!708823))

(assert (=> b!761306 m!708591))

(declare-fun m!708827 () Bool)

(assert (=> b!761306 m!708827))

(declare-fun m!708829 () Bool)

(assert (=> d!100833 m!708829))

(declare-fun m!708833 () Bool)

(assert (=> d!100833 m!708833))

(assert (=> d!100833 m!708583))

(assert (=> d!100833 m!708615))

(assert (=> b!760976 d!100833))

(declare-fun b!761329 () Bool)

(declare-fun e!424469 () Bool)

(declare-fun call!34974 () Bool)

(assert (=> b!761329 (= e!424469 call!34974)))

(declare-fun bm!34971 () Bool)

(assert (=> bm!34971 (= call!34974 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!761331 () Bool)

(declare-fun e!424470 () Bool)

(declare-fun e!424468 () Bool)

(assert (=> b!761331 (= e!424470 e!424468)))

(declare-fun c!83606 () Bool)

(assert (=> b!761331 (= c!83606 (validKeyInArray!0 (select (arr!20140 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!761332 () Bool)

(assert (=> b!761332 (= e!424468 call!34974)))

(declare-fun b!761330 () Bool)

(assert (=> b!761330 (= e!424468 e!424469)))

(declare-fun lt!339172 () (_ BitVec 64))

(assert (=> b!761330 (= lt!339172 (select (arr!20140 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!339173 () Unit!26311)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42064 (_ BitVec 64) (_ BitVec 32)) Unit!26311)

(assert (=> b!761330 (= lt!339173 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!339172 #b00000000000000000000000000000000))))

(assert (=> b!761330 (arrayContainsKey!0 a!3186 lt!339172 #b00000000000000000000000000000000)))

(declare-fun lt!339171 () Unit!26311)

(assert (=> b!761330 (= lt!339171 lt!339173)))

(declare-fun res!514890 () Bool)

(assert (=> b!761330 (= res!514890 (= (seekEntryOrOpen!0 (select (arr!20140 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7696 #b00000000000000000000000000000000)))))

(assert (=> b!761330 (=> (not res!514890) (not e!424469))))

(declare-fun d!100851 () Bool)

(declare-fun res!514891 () Bool)

(assert (=> d!100851 (=> res!514891 e!424470)))

(assert (=> d!100851 (= res!514891 (bvsge #b00000000000000000000000000000000 (size!20560 a!3186)))))

(assert (=> d!100851 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!424470)))

(assert (= (and d!100851 (not res!514891)) b!761331))

(assert (= (and b!761331 c!83606) b!761330))

(assert (= (and b!761331 (not c!83606)) b!761332))

(assert (= (and b!761330 res!514890) b!761329))

(assert (= (or b!761329 b!761332) bm!34971))

(declare-fun m!708841 () Bool)

(assert (=> bm!34971 m!708841))

(assert (=> b!761331 m!708727))

(assert (=> b!761331 m!708727))

(declare-fun m!708843 () Bool)

(assert (=> b!761331 m!708843))

(assert (=> b!761330 m!708727))

(declare-fun m!708845 () Bool)

(assert (=> b!761330 m!708845))

(declare-fun m!708847 () Bool)

(assert (=> b!761330 m!708847))

(assert (=> b!761330 m!708727))

(declare-fun m!708849 () Bool)

(assert (=> b!761330 m!708849))

(assert (=> b!760987 d!100851))

(declare-fun b!761355 () Bool)

(declare-fun e!424488 () Bool)

(declare-fun e!424485 () Bool)

(assert (=> b!761355 (= e!424488 e!424485)))

(declare-fun c!83615 () Bool)

(assert (=> b!761355 (= c!83615 (validKeyInArray!0 (select (arr!20140 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!761356 () Bool)

(declare-fun call!34977 () Bool)

(assert (=> b!761356 (= e!424485 call!34977)))

(declare-fun b!761357 () Bool)

(assert (=> b!761357 (= e!424485 call!34977)))

(declare-fun b!761358 () Bool)

(declare-fun e!424486 () Bool)

(assert (=> b!761358 (= e!424486 e!424488)))

(declare-fun res!514898 () Bool)

(assert (=> b!761358 (=> (not res!514898) (not e!424488))))

(declare-fun e!424487 () Bool)

(assert (=> b!761358 (= res!514898 (not e!424487))))

(declare-fun res!514899 () Bool)

(assert (=> b!761358 (=> (not res!514899) (not e!424487))))

(assert (=> b!761358 (= res!514899 (validKeyInArray!0 (select (arr!20140 a!3186) #b00000000000000000000000000000000)))))

(declare-fun d!100857 () Bool)

(declare-fun res!514900 () Bool)

(assert (=> d!100857 (=> res!514900 e!424486)))

(assert (=> d!100857 (= res!514900 (bvsge #b00000000000000000000000000000000 (size!20560 a!3186)))))

(assert (=> d!100857 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14046) e!424486)))

(declare-fun bm!34974 () Bool)

(assert (=> bm!34974 (= call!34977 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!83615 (Cons!14045 (select (arr!20140 a!3186) #b00000000000000000000000000000000) Nil!14046) Nil!14046)))))

(declare-fun b!761359 () Bool)

(declare-fun contains!4047 (List!14049 (_ BitVec 64)) Bool)

(assert (=> b!761359 (= e!424487 (contains!4047 Nil!14046 (select (arr!20140 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!100857 (not res!514900)) b!761358))

(assert (= (and b!761358 res!514899) b!761359))

(assert (= (and b!761358 res!514898) b!761355))

(assert (= (and b!761355 c!83615) b!761357))

(assert (= (and b!761355 (not c!83615)) b!761356))

(assert (= (or b!761357 b!761356) bm!34974))

(assert (=> b!761355 m!708727))

(assert (=> b!761355 m!708727))

(assert (=> b!761355 m!708843))

(assert (=> b!761358 m!708727))

(assert (=> b!761358 m!708727))

(assert (=> b!761358 m!708843))

(assert (=> bm!34974 m!708727))

(declare-fun m!708851 () Bool)

(assert (=> bm!34974 m!708851))

(assert (=> b!761359 m!708727))

(assert (=> b!761359 m!708727))

(declare-fun m!708853 () Bool)

(assert (=> b!761359 m!708853))

(assert (=> b!760974 d!100857))

(declare-fun b!761370 () Bool)

(declare-fun e!424495 () Bool)

(declare-fun call!34978 () Bool)

(assert (=> b!761370 (= e!424495 call!34978)))

(declare-fun bm!34975 () Bool)

(assert (=> bm!34975 (= call!34978 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!761372 () Bool)

(declare-fun e!424496 () Bool)

(declare-fun e!424494 () Bool)

(assert (=> b!761372 (= e!424496 e!424494)))

(declare-fun c!83621 () Bool)

(assert (=> b!761372 (= c!83621 (validKeyInArray!0 (select (arr!20140 a!3186) j!159)))))

(declare-fun b!761373 () Bool)

(assert (=> b!761373 (= e!424494 call!34978)))

(declare-fun b!761371 () Bool)

(assert (=> b!761371 (= e!424494 e!424495)))

(declare-fun lt!339190 () (_ BitVec 64))

(assert (=> b!761371 (= lt!339190 (select (arr!20140 a!3186) j!159))))

(declare-fun lt!339191 () Unit!26311)

(assert (=> b!761371 (= lt!339191 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!339190 j!159))))

(assert (=> b!761371 (arrayContainsKey!0 a!3186 lt!339190 #b00000000000000000000000000000000)))

(declare-fun lt!339189 () Unit!26311)

(assert (=> b!761371 (= lt!339189 lt!339191)))

(declare-fun res!514901 () Bool)

(assert (=> b!761371 (= res!514901 (= (seekEntryOrOpen!0 (select (arr!20140 a!3186) j!159) a!3186 mask!3328) (Found!7696 j!159)))))

(assert (=> b!761371 (=> (not res!514901) (not e!424495))))

(declare-fun d!100859 () Bool)

(declare-fun res!514902 () Bool)

(assert (=> d!100859 (=> res!514902 e!424496)))

(assert (=> d!100859 (= res!514902 (bvsge j!159 (size!20560 a!3186)))))

(assert (=> d!100859 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!424496)))

(assert (= (and d!100859 (not res!514902)) b!761372))

(assert (= (and b!761372 c!83621) b!761371))

(assert (= (and b!761372 (not c!83621)) b!761373))

(assert (= (and b!761371 res!514901) b!761370))

(assert (= (or b!761370 b!761373) bm!34975))

(declare-fun m!708865 () Bool)

(assert (=> bm!34975 m!708865))

(assert (=> b!761372 m!708591))

(assert (=> b!761372 m!708591))

(assert (=> b!761372 m!708605))

(assert (=> b!761371 m!708591))

(declare-fun m!708867 () Bool)

(assert (=> b!761371 m!708867))

(declare-fun m!708869 () Bool)

(assert (=> b!761371 m!708869))

(assert (=> b!761371 m!708591))

(assert (=> b!761371 m!708599))

(assert (=> b!760985 d!100859))

(declare-fun d!100863 () Bool)

(assert (=> d!100863 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!339197 () Unit!26311)

(declare-fun choose!38 (array!42064 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26311)

(assert (=> d!100863 (= lt!339197 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!100863 (validMask!0 mask!3328)))

(assert (=> d!100863 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!339197)))

(declare-fun bs!21407 () Bool)

(assert (= bs!21407 d!100863))

(assert (=> bs!21407 m!708609))

(declare-fun m!708871 () Bool)

(assert (=> bs!21407 m!708871))

(assert (=> bs!21407 m!708615))

(assert (=> b!760985 d!100863))

(declare-fun b!761388 () Bool)

(declare-fun e!424505 () SeekEntryResult!7696)

(assert (=> b!761388 (= e!424505 Undefined!7696)))

(declare-fun b!761390 () Bool)

(declare-fun e!424504 () SeekEntryResult!7696)

(assert (=> b!761390 (= e!424505 e!424504)))

(declare-fun lt!339199 () (_ BitVec 64))

(declare-fun c!83629 () Bool)

(assert (=> b!761390 (= c!83629 (= lt!339199 (select (arr!20140 a!3186) j!159)))))

(declare-fun b!761391 () Bool)

(declare-fun e!424506 () SeekEntryResult!7696)

(assert (=> b!761391 (= e!424506 (MissingVacant!7696 resIntermediateIndex!5))))

(declare-fun b!761392 () Bool)

(declare-fun c!83631 () Bool)

(assert (=> b!761392 (= c!83631 (= lt!339199 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!761392 (= e!424504 e!424506)))

(declare-fun b!761393 () Bool)

(assert (=> b!761393 (= e!424506 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) resIntermediateIndex!5 (select (arr!20140 a!3186) j!159) a!3186 mask!3328))))

(declare-fun d!100865 () Bool)

(declare-fun lt!339198 () SeekEntryResult!7696)

(assert (=> d!100865 (and (or ((_ is Undefined!7696) lt!339198) (not ((_ is Found!7696) lt!339198)) (and (bvsge (index!33153 lt!339198) #b00000000000000000000000000000000) (bvslt (index!33153 lt!339198) (size!20560 a!3186)))) (or ((_ is Undefined!7696) lt!339198) ((_ is Found!7696) lt!339198) (not ((_ is MissingVacant!7696) lt!339198)) (not (= (index!33155 lt!339198) resIntermediateIndex!5)) (and (bvsge (index!33155 lt!339198) #b00000000000000000000000000000000) (bvslt (index!33155 lt!339198) (size!20560 a!3186)))) (or ((_ is Undefined!7696) lt!339198) (ite ((_ is Found!7696) lt!339198) (= (select (arr!20140 a!3186) (index!33153 lt!339198)) (select (arr!20140 a!3186) j!159)) (and ((_ is MissingVacant!7696) lt!339198) (= (index!33155 lt!339198) resIntermediateIndex!5) (= (select (arr!20140 a!3186) (index!33155 lt!339198)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!100865 (= lt!339198 e!424505)))

(declare-fun c!83630 () Bool)

(assert (=> d!100865 (= c!83630 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!100865 (= lt!339199 (select (arr!20140 a!3186) index!1321))))

(assert (=> d!100865 (validMask!0 mask!3328)))

(assert (=> d!100865 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20140 a!3186) j!159) a!3186 mask!3328) lt!339198)))

(declare-fun b!761389 () Bool)

(assert (=> b!761389 (= e!424504 (Found!7696 index!1321))))

(assert (= (and d!100865 c!83630) b!761388))

(assert (= (and d!100865 (not c!83630)) b!761390))

(assert (= (and b!761390 c!83629) b!761389))

(assert (= (and b!761390 (not c!83629)) b!761392))

(assert (= (and b!761392 c!83631) b!761391))

(assert (= (and b!761392 (not c!83631)) b!761393))

(assert (=> b!761393 m!708721))

(assert (=> b!761393 m!708721))

(assert (=> b!761393 m!708591))

(declare-fun m!708883 () Bool)

(assert (=> b!761393 m!708883))

(declare-fun m!708885 () Bool)

(assert (=> d!100865 m!708885))

(declare-fun m!708887 () Bool)

(assert (=> d!100865 m!708887))

(assert (=> d!100865 m!708725))

(assert (=> d!100865 m!708615))

(assert (=> b!760975 d!100865))

(check-sat (not b!761306) (not b!761243) (not b!761131) (not b!761355) (not b!761237) (not d!100797) (not d!100863) (not b!761371) (not b!761393) (not b!761372) (not bm!34971) (not d!100819) (not d!100831) (not b!761330) (not bm!34975) (not b!761117) (not b!761147) (not d!100833) (not d!100793) (not b!761132) (not d!100813) (not b!761331) (not b!761358) (not d!100865) (not d!100815) (not b!761359) (not b!761108) (not bm!34974))
(check-sat)
(get-model)

(declare-fun b!761507 () Bool)

(declare-fun e!424576 () SeekEntryResult!7696)

(assert (=> b!761507 (= e!424576 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2102 mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3328) k0!2102 a!3186 mask!3328))))

(declare-fun b!761508 () Bool)

(declare-fun e!424573 () Bool)

(declare-fun e!424575 () Bool)

(assert (=> b!761508 (= e!424573 e!424575)))

(declare-fun res!514929 () Bool)

(declare-fun lt!339254 () SeekEntryResult!7696)

(assert (=> b!761508 (= res!514929 (and ((_ is Intermediate!7696) lt!339254) (not (undefined!8508 lt!339254)) (bvslt (x!64203 lt!339254) #b01111111111111111111111111111110) (bvsge (x!64203 lt!339254) #b00000000000000000000000000000000) (bvsge (x!64203 lt!339254) #b00000000000000000000000000000000)))))

(assert (=> b!761508 (=> (not res!514929) (not e!424575))))

(declare-fun b!761509 () Bool)

(declare-fun e!424577 () SeekEntryResult!7696)

(assert (=> b!761509 (= e!424577 (Intermediate!7696 true (toIndex!0 k0!2102 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!761510 () Bool)

(assert (=> b!761510 (= e!424573 (bvsge (x!64203 lt!339254) #b01111111111111111111111111111110))))

(declare-fun d!100907 () Bool)

(assert (=> d!100907 e!424573))

(declare-fun c!83678 () Bool)

(assert (=> d!100907 (= c!83678 (and ((_ is Intermediate!7696) lt!339254) (undefined!8508 lt!339254)))))

(assert (=> d!100907 (= lt!339254 e!424577)))

(declare-fun c!83677 () Bool)

(assert (=> d!100907 (= c!83677 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!339253 () (_ BitVec 64))

(assert (=> d!100907 (= lt!339253 (select (arr!20140 a!3186) (toIndex!0 k0!2102 mask!3328)))))

(assert (=> d!100907 (validMask!0 mask!3328)))

(assert (=> d!100907 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328) lt!339254)))

(declare-fun b!761511 () Bool)

(assert (=> b!761511 (= e!424576 (Intermediate!7696 false (toIndex!0 k0!2102 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!761512 () Bool)

(assert (=> b!761512 (and (bvsge (index!33154 lt!339254) #b00000000000000000000000000000000) (bvslt (index!33154 lt!339254) (size!20560 a!3186)))))

(declare-fun res!514930 () Bool)

(assert (=> b!761512 (= res!514930 (= (select (arr!20140 a!3186) (index!33154 lt!339254)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!424574 () Bool)

(assert (=> b!761512 (=> res!514930 e!424574)))

(declare-fun b!761513 () Bool)

(assert (=> b!761513 (and (bvsge (index!33154 lt!339254) #b00000000000000000000000000000000) (bvslt (index!33154 lt!339254) (size!20560 a!3186)))))

(declare-fun res!514928 () Bool)

(assert (=> b!761513 (= res!514928 (= (select (arr!20140 a!3186) (index!33154 lt!339254)) k0!2102))))

(assert (=> b!761513 (=> res!514928 e!424574)))

(assert (=> b!761513 (= e!424575 e!424574)))

(declare-fun b!761514 () Bool)

(assert (=> b!761514 (= e!424577 e!424576)))

(declare-fun c!83676 () Bool)

(assert (=> b!761514 (= c!83676 (or (= lt!339253 k0!2102) (= (bvadd lt!339253 lt!339253) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!761515 () Bool)

(assert (=> b!761515 (and (bvsge (index!33154 lt!339254) #b00000000000000000000000000000000) (bvslt (index!33154 lt!339254) (size!20560 a!3186)))))

(assert (=> b!761515 (= e!424574 (= (select (arr!20140 a!3186) (index!33154 lt!339254)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!100907 c!83677) b!761509))

(assert (= (and d!100907 (not c!83677)) b!761514))

(assert (= (and b!761514 c!83676) b!761511))

(assert (= (and b!761514 (not c!83676)) b!761507))

(assert (= (and d!100907 c!83678) b!761510))

(assert (= (and d!100907 (not c!83678)) b!761508))

(assert (= (and b!761508 res!514929) b!761513))

(assert (= (and b!761513 (not res!514928)) b!761512))

(assert (= (and b!761512 (not res!514930)) b!761515))

(declare-fun m!708993 () Bool)

(assert (=> b!761512 m!708993))

(assert (=> b!761515 m!708993))

(assert (=> b!761507 m!708777))

(declare-fun m!708995 () Bool)

(assert (=> b!761507 m!708995))

(assert (=> b!761507 m!708995))

(declare-fun m!708997 () Bool)

(assert (=> b!761507 m!708997))

(assert (=> b!761513 m!708993))

(assert (=> d!100907 m!708777))

(declare-fun m!708999 () Bool)

(assert (=> d!100907 m!708999))

(assert (=> d!100907 m!708615))

(assert (=> d!100819 d!100907))

(declare-fun d!100909 () Bool)

(declare-fun lt!339256 () (_ BitVec 32))

(declare-fun lt!339255 () (_ BitVec 32))

(assert (=> d!100909 (= lt!339256 (bvmul (bvxor lt!339255 (bvlshr lt!339255 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!100909 (= lt!339255 ((_ extract 31 0) (bvand (bvxor k0!2102 (bvlshr k0!2102 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!100909 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!514811 (let ((h!15129 ((_ extract 31 0) (bvand (bvxor k0!2102 (bvlshr k0!2102 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64207 (bvmul (bvxor h!15129 (bvlshr h!15129 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64207 (bvlshr x!64207 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!514811 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!514811 #b00000000000000000000000000000000))))))

(assert (=> d!100909 (= (toIndex!0 k0!2102 mask!3328) (bvand (bvxor lt!339256 (bvlshr lt!339256 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> d!100819 d!100909))

(assert (=> d!100819 d!100799))

(declare-fun d!100911 () Bool)

(declare-fun res!514931 () Bool)

(declare-fun e!424578 () Bool)

(assert (=> d!100911 (=> res!514931 e!424578)))

(assert (=> d!100911 (= res!514931 (= (select (arr!20140 a!3186) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) k0!2102))))

(assert (=> d!100911 (= (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!424578)))

(declare-fun b!761516 () Bool)

(declare-fun e!424579 () Bool)

(assert (=> b!761516 (= e!424578 e!424579)))

(declare-fun res!514932 () Bool)

(assert (=> b!761516 (=> (not res!514932) (not e!424579))))

(assert (=> b!761516 (= res!514932 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!20560 a!3186)))))

(declare-fun b!761517 () Bool)

(assert (=> b!761517 (= e!424579 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!100911 (not res!514931)) b!761516))

(assert (= (and b!761516 res!514932) b!761517))

(declare-fun m!709001 () Bool)

(assert (=> d!100911 m!709001))

(declare-fun m!709003 () Bool)

(assert (=> b!761517 m!709003))

(assert (=> b!761131 d!100911))

(declare-fun b!761518 () Bool)

(declare-fun e!424583 () SeekEntryResult!7696)

(assert (=> b!761518 (= e!424583 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 (toIndex!0 (select (arr!20140 a!3186) j!159) mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) mask!3328) (select (arr!20140 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!761519 () Bool)

(declare-fun e!424580 () Bool)

(declare-fun e!424582 () Bool)

(assert (=> b!761519 (= e!424580 e!424582)))

(declare-fun res!514934 () Bool)

(declare-fun lt!339258 () SeekEntryResult!7696)

(assert (=> b!761519 (= res!514934 (and ((_ is Intermediate!7696) lt!339258) (not (undefined!8508 lt!339258)) (bvslt (x!64203 lt!339258) #b01111111111111111111111111111110) (bvsge (x!64203 lt!339258) #b00000000000000000000000000000000) (bvsge (x!64203 lt!339258) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!761519 (=> (not res!514934) (not e!424582))))

(declare-fun b!761520 () Bool)

(declare-fun e!424584 () SeekEntryResult!7696)

(assert (=> b!761520 (= e!424584 (Intermediate!7696 true (nextIndex!0 (toIndex!0 (select (arr!20140 a!3186) j!159) mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!761521 () Bool)

(assert (=> b!761521 (= e!424580 (bvsge (x!64203 lt!339258) #b01111111111111111111111111111110))))

(declare-fun d!100913 () Bool)

(assert (=> d!100913 e!424580))

(declare-fun c!83681 () Bool)

(assert (=> d!100913 (= c!83681 (and ((_ is Intermediate!7696) lt!339258) (undefined!8508 lt!339258)))))

(assert (=> d!100913 (= lt!339258 e!424584)))

(declare-fun c!83680 () Bool)

(assert (=> d!100913 (= c!83680 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(declare-fun lt!339257 () (_ BitVec 64))

(assert (=> d!100913 (= lt!339257 (select (arr!20140 a!3186) (nextIndex!0 (toIndex!0 (select (arr!20140 a!3186) j!159) mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3328)))))

(assert (=> d!100913 (validMask!0 mask!3328)))

(assert (=> d!100913 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20140 a!3186) j!159) mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3328) (select (arr!20140 a!3186) j!159) a!3186 mask!3328) lt!339258)))

(declare-fun b!761522 () Bool)

(assert (=> b!761522 (= e!424583 (Intermediate!7696 false (nextIndex!0 (toIndex!0 (select (arr!20140 a!3186) j!159) mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!761523 () Bool)

(assert (=> b!761523 (and (bvsge (index!33154 lt!339258) #b00000000000000000000000000000000) (bvslt (index!33154 lt!339258) (size!20560 a!3186)))))

(declare-fun res!514935 () Bool)

(assert (=> b!761523 (= res!514935 (= (select (arr!20140 a!3186) (index!33154 lt!339258)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!424581 () Bool)

(assert (=> b!761523 (=> res!514935 e!424581)))

(declare-fun b!761524 () Bool)

(assert (=> b!761524 (and (bvsge (index!33154 lt!339258) #b00000000000000000000000000000000) (bvslt (index!33154 lt!339258) (size!20560 a!3186)))))

(declare-fun res!514933 () Bool)

(assert (=> b!761524 (= res!514933 (= (select (arr!20140 a!3186) (index!33154 lt!339258)) (select (arr!20140 a!3186) j!159)))))

(assert (=> b!761524 (=> res!514933 e!424581)))

(assert (=> b!761524 (= e!424582 e!424581)))

(declare-fun b!761525 () Bool)

(assert (=> b!761525 (= e!424584 e!424583)))

(declare-fun c!83679 () Bool)

(assert (=> b!761525 (= c!83679 (or (= lt!339257 (select (arr!20140 a!3186) j!159)) (= (bvadd lt!339257 lt!339257) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!761526 () Bool)

(assert (=> b!761526 (and (bvsge (index!33154 lt!339258) #b00000000000000000000000000000000) (bvslt (index!33154 lt!339258) (size!20560 a!3186)))))

(assert (=> b!761526 (= e!424581 (= (select (arr!20140 a!3186) (index!33154 lt!339258)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!100913 c!83680) b!761520))

(assert (= (and d!100913 (not c!83680)) b!761525))

(assert (= (and b!761525 c!83679) b!761522))

(assert (= (and b!761525 (not c!83679)) b!761518))

(assert (= (and d!100913 c!83681) b!761521))

(assert (= (and d!100913 (not c!83681)) b!761519))

(assert (= (and b!761519 res!514934) b!761524))

(assert (= (and b!761524 (not res!514933)) b!761523))

(assert (= (and b!761523 (not res!514935)) b!761526))

(declare-fun m!709005 () Bool)

(assert (=> b!761523 m!709005))

(assert (=> b!761526 m!709005))

(assert (=> b!761518 m!708713))

(declare-fun m!709007 () Bool)

(assert (=> b!761518 m!709007))

(assert (=> b!761518 m!709007))

(assert (=> b!761518 m!708591))

(declare-fun m!709009 () Bool)

(assert (=> b!761518 m!709009))

(assert (=> b!761524 m!709005))

(assert (=> d!100913 m!708713))

(declare-fun m!709011 () Bool)

(assert (=> d!100913 m!709011))

(assert (=> d!100913 m!708615))

(assert (=> b!761108 d!100913))

(declare-fun d!100915 () Bool)

(declare-fun lt!339261 () (_ BitVec 32))

(assert (=> d!100915 (and (bvsge lt!339261 #b00000000000000000000000000000000) (bvslt lt!339261 (bvadd mask!3328 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!100915 (= lt!339261 (choose!52 (toIndex!0 (select (arr!20140 a!3186) j!159) mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3328))))

(assert (=> d!100915 (validMask!0 mask!3328)))

(assert (=> d!100915 (= (nextIndex!0 (toIndex!0 (select (arr!20140 a!3186) j!159) mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3328) lt!339261)))

(declare-fun bs!21410 () Bool)

(assert (= bs!21410 d!100915))

(assert (=> bs!21410 m!708593))

(declare-fun m!709013 () Bool)

(assert (=> bs!21410 m!709013))

(assert (=> bs!21410 m!708615))

(assert (=> b!761108 d!100915))

(assert (=> d!100865 d!100799))

(assert (=> d!100815 d!100799))

(declare-fun d!100917 () Bool)

(assert (=> d!100917 (= (validKeyInArray!0 (select (arr!20140 a!3186) #b00000000000000000000000000000000)) (and (not (= (select (arr!20140 a!3186) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20140 a!3186) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!761355 d!100917))

(declare-fun e!424588 () SeekEntryResult!7696)

(declare-fun b!761527 () Bool)

(assert (=> b!761527 (= e!424588 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) (bvadd x!1131 #b00000000000000000000000000000001 #b00000000000000000000000000000001) mask!3328) lt!339036 lt!339037 mask!3328))))

(declare-fun b!761528 () Bool)

(declare-fun e!424585 () Bool)

(declare-fun e!424587 () Bool)

(assert (=> b!761528 (= e!424585 e!424587)))

(declare-fun res!514937 () Bool)

(declare-fun lt!339263 () SeekEntryResult!7696)

(assert (=> b!761528 (= res!514937 (and ((_ is Intermediate!7696) lt!339263) (not (undefined!8508 lt!339263)) (bvslt (x!64203 lt!339263) #b01111111111111111111111111111110) (bvsge (x!64203 lt!339263) #b00000000000000000000000000000000) (bvsge (x!64203 lt!339263) (bvadd x!1131 #b00000000000000000000000000000001))))))

(assert (=> b!761528 (=> (not res!514937) (not e!424587))))

(declare-fun e!424589 () SeekEntryResult!7696)

(declare-fun b!761529 () Bool)

(assert (=> b!761529 (= e!424589 (Intermediate!7696 true (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) (bvadd x!1131 #b00000000000000000000000000000001)))))

(declare-fun b!761530 () Bool)

(assert (=> b!761530 (= e!424585 (bvsge (x!64203 lt!339263) #b01111111111111111111111111111110))))

(declare-fun d!100919 () Bool)

(assert (=> d!100919 e!424585))

(declare-fun c!83684 () Bool)

(assert (=> d!100919 (= c!83684 (and ((_ is Intermediate!7696) lt!339263) (undefined!8508 lt!339263)))))

(assert (=> d!100919 (= lt!339263 e!424589)))

(declare-fun c!83683 () Bool)

(assert (=> d!100919 (= c!83683 (bvsge (bvadd x!1131 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(declare-fun lt!339262 () (_ BitVec 64))

(assert (=> d!100919 (= lt!339262 (select (arr!20140 lt!339037) (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328)))))

(assert (=> d!100919 (validMask!0 mask!3328)))

(assert (=> d!100919 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) lt!339036 lt!339037 mask!3328) lt!339263)))

(declare-fun b!761531 () Bool)

(assert (=> b!761531 (= e!424588 (Intermediate!7696 false (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) (bvadd x!1131 #b00000000000000000000000000000001)))))

(declare-fun b!761532 () Bool)

(assert (=> b!761532 (and (bvsge (index!33154 lt!339263) #b00000000000000000000000000000000) (bvslt (index!33154 lt!339263) (size!20560 lt!339037)))))

(declare-fun res!514938 () Bool)

(assert (=> b!761532 (= res!514938 (= (select (arr!20140 lt!339037) (index!33154 lt!339263)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!424586 () Bool)

(assert (=> b!761532 (=> res!514938 e!424586)))

(declare-fun b!761533 () Bool)

(assert (=> b!761533 (and (bvsge (index!33154 lt!339263) #b00000000000000000000000000000000) (bvslt (index!33154 lt!339263) (size!20560 lt!339037)))))

(declare-fun res!514936 () Bool)

(assert (=> b!761533 (= res!514936 (= (select (arr!20140 lt!339037) (index!33154 lt!339263)) lt!339036))))

(assert (=> b!761533 (=> res!514936 e!424586)))

(assert (=> b!761533 (= e!424587 e!424586)))

(declare-fun b!761534 () Bool)

(assert (=> b!761534 (= e!424589 e!424588)))

(declare-fun c!83682 () Bool)

(assert (=> b!761534 (= c!83682 (or (= lt!339262 lt!339036) (= (bvadd lt!339262 lt!339262) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!761535 () Bool)

(assert (=> b!761535 (and (bvsge (index!33154 lt!339263) #b00000000000000000000000000000000) (bvslt (index!33154 lt!339263) (size!20560 lt!339037)))))

(assert (=> b!761535 (= e!424586 (= (select (arr!20140 lt!339037) (index!33154 lt!339263)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!100919 c!83683) b!761529))

(assert (= (and d!100919 (not c!83683)) b!761534))

(assert (= (and b!761534 c!83682) b!761531))

(assert (= (and b!761534 (not c!83682)) b!761527))

(assert (= (and d!100919 c!83684) b!761530))

(assert (= (and d!100919 (not c!83684)) b!761528))

(assert (= (and b!761528 res!514937) b!761533))

(assert (= (and b!761533 (not res!514936)) b!761532))

(assert (= (and b!761532 (not res!514938)) b!761535))

(declare-fun m!709015 () Bool)

(assert (=> b!761532 m!709015))

(assert (=> b!761535 m!709015))

(assert (=> b!761527 m!708721))

(declare-fun m!709017 () Bool)

(assert (=> b!761527 m!709017))

(assert (=> b!761527 m!709017))

(declare-fun m!709019 () Bool)

(assert (=> b!761527 m!709019))

(assert (=> b!761533 m!709015))

(assert (=> d!100919 m!708721))

(declare-fun m!709021 () Bool)

(assert (=> d!100919 m!709021))

(assert (=> d!100919 m!708615))

(assert (=> b!761132 d!100919))

(declare-fun d!100921 () Bool)

(declare-fun lt!339264 () (_ BitVec 32))

(assert (=> d!100921 (and (bvsge lt!339264 #b00000000000000000000000000000000) (bvslt lt!339264 (bvadd mask!3328 #b00000000000000000000000000000001)))))

(assert (=> d!100921 (= lt!339264 (choose!52 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328))))

(assert (=> d!100921 (validMask!0 mask!3328)))

(assert (=> d!100921 (= (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) lt!339264)))

(declare-fun bs!21411 () Bool)

(assert (= bs!21411 d!100921))

(declare-fun m!709023 () Bool)

(assert (=> bs!21411 m!709023))

(assert (=> bs!21411 m!708615))

(assert (=> b!761132 d!100921))

(declare-fun e!424593 () SeekEntryResult!7696)

(declare-fun b!761536 () Bool)

(assert (=> b!761536 (= e!424593 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) (bvadd x!1131 #b00000000000000000000000000000001 #b00000000000000000000000000000001) mask!3328) (select (arr!20140 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!761537 () Bool)

(declare-fun e!424590 () Bool)

(declare-fun e!424592 () Bool)

(assert (=> b!761537 (= e!424590 e!424592)))

(declare-fun res!514940 () Bool)

(declare-fun lt!339266 () SeekEntryResult!7696)

(assert (=> b!761537 (= res!514940 (and ((_ is Intermediate!7696) lt!339266) (not (undefined!8508 lt!339266)) (bvslt (x!64203 lt!339266) #b01111111111111111111111111111110) (bvsge (x!64203 lt!339266) #b00000000000000000000000000000000) (bvsge (x!64203 lt!339266) (bvadd x!1131 #b00000000000000000000000000000001))))))

(assert (=> b!761537 (=> (not res!514940) (not e!424592))))

(declare-fun e!424594 () SeekEntryResult!7696)

(declare-fun b!761538 () Bool)

(assert (=> b!761538 (= e!424594 (Intermediate!7696 true (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) (bvadd x!1131 #b00000000000000000000000000000001)))))

(declare-fun b!761539 () Bool)

(assert (=> b!761539 (= e!424590 (bvsge (x!64203 lt!339266) #b01111111111111111111111111111110))))

(declare-fun d!100923 () Bool)

(assert (=> d!100923 e!424590))

(declare-fun c!83687 () Bool)

(assert (=> d!100923 (= c!83687 (and ((_ is Intermediate!7696) lt!339266) (undefined!8508 lt!339266)))))

(assert (=> d!100923 (= lt!339266 e!424594)))

(declare-fun c!83686 () Bool)

(assert (=> d!100923 (= c!83686 (bvsge (bvadd x!1131 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(declare-fun lt!339265 () (_ BitVec 64))

(assert (=> d!100923 (= lt!339265 (select (arr!20140 a!3186) (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328)))))

(assert (=> d!100923 (validMask!0 mask!3328)))

(assert (=> d!100923 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) (select (arr!20140 a!3186) j!159) a!3186 mask!3328) lt!339266)))

(declare-fun b!761540 () Bool)

(assert (=> b!761540 (= e!424593 (Intermediate!7696 false (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) (bvadd x!1131 #b00000000000000000000000000000001)))))

(declare-fun b!761541 () Bool)

(assert (=> b!761541 (and (bvsge (index!33154 lt!339266) #b00000000000000000000000000000000) (bvslt (index!33154 lt!339266) (size!20560 a!3186)))))

(declare-fun res!514941 () Bool)

(assert (=> b!761541 (= res!514941 (= (select (arr!20140 a!3186) (index!33154 lt!339266)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!424591 () Bool)

(assert (=> b!761541 (=> res!514941 e!424591)))

(declare-fun b!761542 () Bool)

(assert (=> b!761542 (and (bvsge (index!33154 lt!339266) #b00000000000000000000000000000000) (bvslt (index!33154 lt!339266) (size!20560 a!3186)))))

(declare-fun res!514939 () Bool)

(assert (=> b!761542 (= res!514939 (= (select (arr!20140 a!3186) (index!33154 lt!339266)) (select (arr!20140 a!3186) j!159)))))

(assert (=> b!761542 (=> res!514939 e!424591)))

(assert (=> b!761542 (= e!424592 e!424591)))

(declare-fun b!761543 () Bool)

(assert (=> b!761543 (= e!424594 e!424593)))

(declare-fun c!83685 () Bool)

(assert (=> b!761543 (= c!83685 (or (= lt!339265 (select (arr!20140 a!3186) j!159)) (= (bvadd lt!339265 lt!339265) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!761544 () Bool)

(assert (=> b!761544 (and (bvsge (index!33154 lt!339266) #b00000000000000000000000000000000) (bvslt (index!33154 lt!339266) (size!20560 a!3186)))))

(assert (=> b!761544 (= e!424591 (= (select (arr!20140 a!3186) (index!33154 lt!339266)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!100923 c!83686) b!761538))

(assert (= (and d!100923 (not c!83686)) b!761543))

(assert (= (and b!761543 c!83685) b!761540))

(assert (= (and b!761543 (not c!83685)) b!761536))

(assert (= (and d!100923 c!83687) b!761539))

(assert (= (and d!100923 (not c!83687)) b!761537))

(assert (= (and b!761537 res!514940) b!761542))

(assert (= (and b!761542 (not res!514939)) b!761541))

(assert (= (and b!761541 (not res!514941)) b!761544))

(declare-fun m!709025 () Bool)

(assert (=> b!761541 m!709025))

(assert (=> b!761544 m!709025))

(assert (=> b!761536 m!708721))

(assert (=> b!761536 m!709017))

(assert (=> b!761536 m!709017))

(assert (=> b!761536 m!708591))

(declare-fun m!709027 () Bool)

(assert (=> b!761536 m!709027))

(assert (=> b!761542 m!709025))

(assert (=> d!100923 m!708721))

(declare-fun m!709029 () Bool)

(assert (=> d!100923 m!709029))

(assert (=> d!100923 m!708615))

(assert (=> b!761117 d!100923))

(assert (=> b!761117 d!100921))

(assert (=> b!761358 d!100917))

(declare-fun b!761545 () Bool)

(declare-fun e!424598 () Bool)

(declare-fun e!424595 () Bool)

(assert (=> b!761545 (= e!424598 e!424595)))

(declare-fun c!83688 () Bool)

(assert (=> b!761545 (= c!83688 (validKeyInArray!0 (select (arr!20140 a!3186) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!761546 () Bool)

(declare-fun call!34984 () Bool)

(assert (=> b!761546 (= e!424595 call!34984)))

(declare-fun b!761547 () Bool)

(assert (=> b!761547 (= e!424595 call!34984)))

(declare-fun b!761548 () Bool)

(declare-fun e!424596 () Bool)

(assert (=> b!761548 (= e!424596 e!424598)))

(declare-fun res!514942 () Bool)

(assert (=> b!761548 (=> (not res!514942) (not e!424598))))

(declare-fun e!424597 () Bool)

(assert (=> b!761548 (= res!514942 (not e!424597))))

(declare-fun res!514943 () Bool)

(assert (=> b!761548 (=> (not res!514943) (not e!424597))))

(assert (=> b!761548 (= res!514943 (validKeyInArray!0 (select (arr!20140 a!3186) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!100925 () Bool)

(declare-fun res!514944 () Bool)

(assert (=> d!100925 (=> res!514944 e!424596)))

(assert (=> d!100925 (= res!514944 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20560 a!3186)))))

(assert (=> d!100925 (= (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!83615 (Cons!14045 (select (arr!20140 a!3186) #b00000000000000000000000000000000) Nil!14046) Nil!14046)) e!424596)))

(declare-fun bm!34981 () Bool)

(assert (=> bm!34981 (= call!34984 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!83688 (Cons!14045 (select (arr!20140 a!3186) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!83615 (Cons!14045 (select (arr!20140 a!3186) #b00000000000000000000000000000000) Nil!14046) Nil!14046)) (ite c!83615 (Cons!14045 (select (arr!20140 a!3186) #b00000000000000000000000000000000) Nil!14046) Nil!14046))))))

(declare-fun b!761549 () Bool)

(assert (=> b!761549 (= e!424597 (contains!4047 (ite c!83615 (Cons!14045 (select (arr!20140 a!3186) #b00000000000000000000000000000000) Nil!14046) Nil!14046) (select (arr!20140 a!3186) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!100925 (not res!514944)) b!761548))

(assert (= (and b!761548 res!514943) b!761549))

(assert (= (and b!761548 res!514942) b!761545))

(assert (= (and b!761545 c!83688) b!761547))

(assert (= (and b!761545 (not c!83688)) b!761546))

(assert (= (or b!761547 b!761546) bm!34981))

(assert (=> b!761545 m!709001))

(assert (=> b!761545 m!709001))

(declare-fun m!709031 () Bool)

(assert (=> b!761545 m!709031))

(assert (=> b!761548 m!709001))

(assert (=> b!761548 m!709001))

(assert (=> b!761548 m!709031))

(assert (=> bm!34981 m!709001))

(declare-fun m!709033 () Bool)

(assert (=> bm!34981 m!709033))

(assert (=> b!761549 m!709001))

(assert (=> b!761549 m!709001))

(declare-fun m!709035 () Bool)

(assert (=> b!761549 m!709035))

(assert (=> bm!34974 d!100925))

(declare-fun d!100927 () Bool)

(declare-fun lt!339269 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!380 (List!14049) (InoxSet (_ BitVec 64)))

(assert (=> d!100927 (= lt!339269 (select (content!380 Nil!14046) (select (arr!20140 a!3186) #b00000000000000000000000000000000)))))

(declare-fun e!424604 () Bool)

(assert (=> d!100927 (= lt!339269 e!424604)))

(declare-fun res!514950 () Bool)

(assert (=> d!100927 (=> (not res!514950) (not e!424604))))

(assert (=> d!100927 (= res!514950 ((_ is Cons!14045) Nil!14046))))

(assert (=> d!100927 (= (contains!4047 Nil!14046 (select (arr!20140 a!3186) #b00000000000000000000000000000000)) lt!339269)))

(declare-fun b!761554 () Bool)

(declare-fun e!424603 () Bool)

(assert (=> b!761554 (= e!424604 e!424603)))

(declare-fun res!514949 () Bool)

(assert (=> b!761554 (=> res!514949 e!424603)))

(assert (=> b!761554 (= res!514949 (= (h!15126 Nil!14046) (select (arr!20140 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!761555 () Bool)

(assert (=> b!761555 (= e!424603 (contains!4047 (t!20356 Nil!14046) (select (arr!20140 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!100927 res!514950) b!761554))

(assert (= (and b!761554 (not res!514949)) b!761555))

(declare-fun m!709037 () Bool)

(assert (=> d!100927 m!709037))

(assert (=> d!100927 m!708727))

(declare-fun m!709039 () Bool)

(assert (=> d!100927 m!709039))

(assert (=> b!761555 m!708727))

(declare-fun m!709041 () Bool)

(assert (=> b!761555 m!709041))

(assert (=> b!761359 d!100927))

(assert (=> d!100813 d!100799))

(declare-fun b!761556 () Bool)

(declare-fun e!424606 () SeekEntryResult!7696)

(assert (=> b!761556 (= e!424606 Undefined!7696)))

(declare-fun b!761558 () Bool)

(declare-fun e!424605 () SeekEntryResult!7696)

(assert (=> b!761558 (= e!424606 e!424605)))

(declare-fun c!83689 () Bool)

(declare-fun lt!339271 () (_ BitVec 64))

(assert (=> b!761558 (= c!83689 (= lt!339271 (select (arr!20140 a!3186) j!159)))))

(declare-fun b!761559 () Bool)

(declare-fun e!424607 () SeekEntryResult!7696)

(assert (=> b!761559 (= e!424607 (MissingVacant!7696 (index!33154 lt!339142)))))

(declare-fun b!761560 () Bool)

(declare-fun c!83691 () Bool)

(assert (=> b!761560 (= c!83691 (= lt!339271 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!761560 (= e!424605 e!424607)))

(declare-fun b!761561 () Bool)

(assert (=> b!761561 (= e!424607 (seekKeyOrZeroReturnVacant!0 (bvadd (x!64203 lt!339142) #b00000000000000000000000000000001) (nextIndex!0 (index!33154 lt!339142) (bvadd (x!64203 lt!339142) #b00000000000000000000000000000001) mask!3328) (index!33154 lt!339142) (select (arr!20140 a!3186) j!159) a!3186 mask!3328))))

(declare-fun d!100929 () Bool)

(declare-fun lt!339270 () SeekEntryResult!7696)

(assert (=> d!100929 (and (or ((_ is Undefined!7696) lt!339270) (not ((_ is Found!7696) lt!339270)) (and (bvsge (index!33153 lt!339270) #b00000000000000000000000000000000) (bvslt (index!33153 lt!339270) (size!20560 a!3186)))) (or ((_ is Undefined!7696) lt!339270) ((_ is Found!7696) lt!339270) (not ((_ is MissingVacant!7696) lt!339270)) (not (= (index!33155 lt!339270) (index!33154 lt!339142))) (and (bvsge (index!33155 lt!339270) #b00000000000000000000000000000000) (bvslt (index!33155 lt!339270) (size!20560 a!3186)))) (or ((_ is Undefined!7696) lt!339270) (ite ((_ is Found!7696) lt!339270) (= (select (arr!20140 a!3186) (index!33153 lt!339270)) (select (arr!20140 a!3186) j!159)) (and ((_ is MissingVacant!7696) lt!339270) (= (index!33155 lt!339270) (index!33154 lt!339142)) (= (select (arr!20140 a!3186) (index!33155 lt!339270)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!100929 (= lt!339270 e!424606)))

(declare-fun c!83690 () Bool)

(assert (=> d!100929 (= c!83690 (bvsge (x!64203 lt!339142) #b01111111111111111111111111111110))))

(assert (=> d!100929 (= lt!339271 (select (arr!20140 a!3186) (index!33154 lt!339142)))))

(assert (=> d!100929 (validMask!0 mask!3328)))

(assert (=> d!100929 (= (seekKeyOrZeroReturnVacant!0 (x!64203 lt!339142) (index!33154 lt!339142) (index!33154 lt!339142) (select (arr!20140 a!3186) j!159) a!3186 mask!3328) lt!339270)))

(declare-fun b!761557 () Bool)

(assert (=> b!761557 (= e!424605 (Found!7696 (index!33154 lt!339142)))))

(assert (= (and d!100929 c!83690) b!761556))

(assert (= (and d!100929 (not c!83690)) b!761558))

(assert (= (and b!761558 c!83689) b!761557))

(assert (= (and b!761558 (not c!83689)) b!761560))

(assert (= (and b!761560 c!83691) b!761559))

(assert (= (and b!761560 (not c!83691)) b!761561))

(declare-fun m!709043 () Bool)

(assert (=> b!761561 m!709043))

(assert (=> b!761561 m!709043))

(assert (=> b!761561 m!708591))

(declare-fun m!709045 () Bool)

(assert (=> b!761561 m!709045))

(declare-fun m!709047 () Bool)

(assert (=> d!100929 m!709047))

(declare-fun m!709049 () Bool)

(assert (=> d!100929 m!709049))

(assert (=> d!100929 m!708793))

(assert (=> d!100929 m!708615))

(assert (=> b!761243 d!100929))

(declare-fun b!761562 () Bool)

(declare-fun e!424609 () SeekEntryResult!7696)

(assert (=> b!761562 (= e!424609 Undefined!7696)))

(declare-fun b!761564 () Bool)

(declare-fun e!424608 () SeekEntryResult!7696)

(assert (=> b!761564 (= e!424609 e!424608)))

(declare-fun c!83692 () Bool)

(declare-fun lt!339273 () (_ BitVec 64))

(assert (=> b!761564 (= c!83692 (= lt!339273 (select (arr!20140 a!3186) j!159)))))

(declare-fun b!761565 () Bool)

(declare-fun e!424610 () SeekEntryResult!7696)

(assert (=> b!761565 (= e!424610 (MissingVacant!7696 resIntermediateIndex!5))))

(declare-fun b!761566 () Bool)

(declare-fun c!83694 () Bool)

(assert (=> b!761566 (= c!83694 (= lt!339273 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!761566 (= e!424608 e!424610)))

(declare-fun b!761567 () Bool)

(assert (=> b!761567 (= e!424610 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 resIntermediateIndex!5 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) mask!3328) (bvadd resIntermediateX!5 #b00000000000000000000000000000001 #b00000000000000000000000000000001) mask!3328) resIntermediateIndex!5 (select (arr!20140 a!3186) j!159) a!3186 mask!3328))))

(declare-fun d!100931 () Bool)

(declare-fun lt!339272 () SeekEntryResult!7696)

(assert (=> d!100931 (and (or ((_ is Undefined!7696) lt!339272) (not ((_ is Found!7696) lt!339272)) (and (bvsge (index!33153 lt!339272) #b00000000000000000000000000000000) (bvslt (index!33153 lt!339272) (size!20560 a!3186)))) (or ((_ is Undefined!7696) lt!339272) ((_ is Found!7696) lt!339272) (not ((_ is MissingVacant!7696) lt!339272)) (not (= (index!33155 lt!339272) resIntermediateIndex!5)) (and (bvsge (index!33155 lt!339272) #b00000000000000000000000000000000) (bvslt (index!33155 lt!339272) (size!20560 a!3186)))) (or ((_ is Undefined!7696) lt!339272) (ite ((_ is Found!7696) lt!339272) (= (select (arr!20140 a!3186) (index!33153 lt!339272)) (select (arr!20140 a!3186) j!159)) (and ((_ is MissingVacant!7696) lt!339272) (= (index!33155 lt!339272) resIntermediateIndex!5) (= (select (arr!20140 a!3186) (index!33155 lt!339272)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!100931 (= lt!339272 e!424609)))

(declare-fun c!83693 () Bool)

(assert (=> d!100931 (= c!83693 (bvsge (bvadd resIntermediateX!5 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!100931 (= lt!339273 (select (arr!20140 a!3186) (nextIndex!0 resIntermediateIndex!5 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) mask!3328)))))

(assert (=> d!100931 (validMask!0 mask!3328)))

(assert (=> d!100931 (= (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) mask!3328) resIntermediateIndex!5 (select (arr!20140 a!3186) j!159) a!3186 mask!3328) lt!339272)))

(declare-fun b!761563 () Bool)

(assert (=> b!761563 (= e!424608 (Found!7696 (nextIndex!0 resIntermediateIndex!5 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) mask!3328)))))

(assert (= (and d!100931 c!83693) b!761562))

(assert (= (and d!100931 (not c!83693)) b!761564))

(assert (= (and b!761564 c!83692) b!761563))

(assert (= (and b!761564 (not c!83692)) b!761566))

(assert (= (and b!761566 c!83694) b!761565))

(assert (= (and b!761566 (not c!83694)) b!761567))

(assert (=> b!761567 m!708823))

(declare-fun m!709051 () Bool)

(assert (=> b!761567 m!709051))

(assert (=> b!761567 m!709051))

(assert (=> b!761567 m!708591))

(declare-fun m!709053 () Bool)

(assert (=> b!761567 m!709053))

(declare-fun m!709055 () Bool)

(assert (=> d!100931 m!709055))

(declare-fun m!709057 () Bool)

(assert (=> d!100931 m!709057))

(assert (=> d!100931 m!708823))

(declare-fun m!709059 () Bool)

(assert (=> d!100931 m!709059))

(assert (=> d!100931 m!708615))

(assert (=> b!761306 d!100931))

(declare-fun d!100933 () Bool)

(declare-fun lt!339274 () (_ BitVec 32))

(assert (=> d!100933 (and (bvsge lt!339274 #b00000000000000000000000000000000) (bvslt lt!339274 (bvadd mask!3328 #b00000000000000000000000000000001)))))

(assert (=> d!100933 (= lt!339274 (choose!52 resIntermediateIndex!5 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) mask!3328))))

(assert (=> d!100933 (validMask!0 mask!3328)))

(assert (=> d!100933 (= (nextIndex!0 resIntermediateIndex!5 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) mask!3328) lt!339274)))

(declare-fun bs!21412 () Bool)

(assert (= bs!21412 d!100933))

(declare-fun m!709061 () Bool)

(assert (=> bs!21412 m!709061))

(assert (=> bs!21412 m!708615))

(assert (=> b!761306 d!100933))

(assert (=> d!100863 d!100859))

(declare-fun d!100935 () Bool)

(assert (=> d!100935 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(assert (=> d!100935 true))

(declare-fun _$72!107 () Unit!26311)

(assert (=> d!100935 (= (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) _$72!107)))

(declare-fun bs!21413 () Bool)

(assert (= bs!21413 d!100935))

(assert (=> bs!21413 m!708609))

(assert (=> d!100863 d!100935))

(assert (=> d!100863 d!100799))

(assert (=> d!100797 d!100799))

(declare-fun d!100937 () Bool)

(assert (=> d!100937 (arrayContainsKey!0 a!3186 lt!339172 #b00000000000000000000000000000000)))

(declare-fun lt!339277 () Unit!26311)

(declare-fun choose!13 (array!42064 (_ BitVec 64) (_ BitVec 32)) Unit!26311)

(assert (=> d!100937 (= lt!339277 (choose!13 a!3186 lt!339172 #b00000000000000000000000000000000))))

(assert (=> d!100937 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!100937 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!339172 #b00000000000000000000000000000000) lt!339277)))

(declare-fun bs!21414 () Bool)

(assert (= bs!21414 d!100937))

(assert (=> bs!21414 m!708847))

(declare-fun m!709063 () Bool)

(assert (=> bs!21414 m!709063))

(assert (=> b!761330 d!100937))

(declare-fun d!100939 () Bool)

(declare-fun res!514951 () Bool)

(declare-fun e!424611 () Bool)

(assert (=> d!100939 (=> res!514951 e!424611)))

(assert (=> d!100939 (= res!514951 (= (select (arr!20140 a!3186) #b00000000000000000000000000000000) lt!339172))))

(assert (=> d!100939 (= (arrayContainsKey!0 a!3186 lt!339172 #b00000000000000000000000000000000) e!424611)))

(declare-fun b!761568 () Bool)

(declare-fun e!424612 () Bool)

(assert (=> b!761568 (= e!424611 e!424612)))

(declare-fun res!514952 () Bool)

(assert (=> b!761568 (=> (not res!514952) (not e!424612))))

(assert (=> b!761568 (= res!514952 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20560 a!3186)))))

(declare-fun b!761569 () Bool)

(assert (=> b!761569 (= e!424612 (arrayContainsKey!0 a!3186 lt!339172 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!100939 (not res!514951)) b!761568))

(assert (= (and b!761568 res!514952) b!761569))

(assert (=> d!100939 m!708727))

(declare-fun m!709065 () Bool)

(assert (=> b!761569 m!709065))

(assert (=> b!761330 d!100939))

(declare-fun b!761570 () Bool)

(declare-fun e!424615 () SeekEntryResult!7696)

(assert (=> b!761570 (= e!424615 Undefined!7696)))

(declare-fun d!100941 () Bool)

(declare-fun lt!339280 () SeekEntryResult!7696)

(assert (=> d!100941 (and (or ((_ is Undefined!7696) lt!339280) (not ((_ is Found!7696) lt!339280)) (and (bvsge (index!33153 lt!339280) #b00000000000000000000000000000000) (bvslt (index!33153 lt!339280) (size!20560 a!3186)))) (or ((_ is Undefined!7696) lt!339280) ((_ is Found!7696) lt!339280) (not ((_ is MissingZero!7696) lt!339280)) (and (bvsge (index!33152 lt!339280) #b00000000000000000000000000000000) (bvslt (index!33152 lt!339280) (size!20560 a!3186)))) (or ((_ is Undefined!7696) lt!339280) ((_ is Found!7696) lt!339280) ((_ is MissingZero!7696) lt!339280) (not ((_ is MissingVacant!7696) lt!339280)) (and (bvsge (index!33155 lt!339280) #b00000000000000000000000000000000) (bvslt (index!33155 lt!339280) (size!20560 a!3186)))) (or ((_ is Undefined!7696) lt!339280) (ite ((_ is Found!7696) lt!339280) (= (select (arr!20140 a!3186) (index!33153 lt!339280)) (select (arr!20140 a!3186) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!7696) lt!339280) (= (select (arr!20140 a!3186) (index!33152 lt!339280)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7696) lt!339280) (= (select (arr!20140 a!3186) (index!33155 lt!339280)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!100941 (= lt!339280 e!424615)))

(declare-fun c!83696 () Bool)

(declare-fun lt!339278 () SeekEntryResult!7696)

(assert (=> d!100941 (= c!83696 (and ((_ is Intermediate!7696) lt!339278) (undefined!8508 lt!339278)))))

(assert (=> d!100941 (= lt!339278 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20140 a!3186) #b00000000000000000000000000000000) mask!3328) (select (arr!20140 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328))))

(assert (=> d!100941 (validMask!0 mask!3328)))

(assert (=> d!100941 (= (seekEntryOrOpen!0 (select (arr!20140 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) lt!339280)))

(declare-fun b!761571 () Bool)

(declare-fun c!83697 () Bool)

(declare-fun lt!339279 () (_ BitVec 64))

(assert (=> b!761571 (= c!83697 (= lt!339279 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!424613 () SeekEntryResult!7696)

(declare-fun e!424614 () SeekEntryResult!7696)

(assert (=> b!761571 (= e!424613 e!424614)))

(declare-fun b!761572 () Bool)

(assert (=> b!761572 (= e!424615 e!424613)))

(assert (=> b!761572 (= lt!339279 (select (arr!20140 a!3186) (index!33154 lt!339278)))))

(declare-fun c!83695 () Bool)

(assert (=> b!761572 (= c!83695 (= lt!339279 (select (arr!20140 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!761573 () Bool)

(assert (=> b!761573 (= e!424614 (seekKeyOrZeroReturnVacant!0 (x!64203 lt!339278) (index!33154 lt!339278) (index!33154 lt!339278) (select (arr!20140 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328))))

(declare-fun b!761574 () Bool)

(assert (=> b!761574 (= e!424613 (Found!7696 (index!33154 lt!339278)))))

(declare-fun b!761575 () Bool)

(assert (=> b!761575 (= e!424614 (MissingZero!7696 (index!33154 lt!339278)))))

(assert (= (and d!100941 c!83696) b!761570))

(assert (= (and d!100941 (not c!83696)) b!761572))

(assert (= (and b!761572 c!83695) b!761574))

(assert (= (and b!761572 (not c!83695)) b!761571))

(assert (= (and b!761571 c!83697) b!761575))

(assert (= (and b!761571 (not c!83697)) b!761573))

(declare-fun m!709067 () Bool)

(assert (=> d!100941 m!709067))

(declare-fun m!709069 () Bool)

(assert (=> d!100941 m!709069))

(declare-fun m!709071 () Bool)

(assert (=> d!100941 m!709071))

(assert (=> d!100941 m!708727))

(declare-fun m!709073 () Bool)

(assert (=> d!100941 m!709073))

(declare-fun m!709075 () Bool)

(assert (=> d!100941 m!709075))

(assert (=> d!100941 m!708615))

(assert (=> d!100941 m!708727))

(assert (=> d!100941 m!709071))

(declare-fun m!709077 () Bool)

(assert (=> b!761572 m!709077))

(assert (=> b!761573 m!708727))

(declare-fun m!709079 () Bool)

(assert (=> b!761573 m!709079))

(assert (=> b!761330 d!100941))

(assert (=> b!761331 d!100917))

(declare-fun b!761576 () Bool)

(declare-fun e!424617 () SeekEntryResult!7696)

(assert (=> b!761576 (= e!424617 Undefined!7696)))

(declare-fun b!761578 () Bool)

(declare-fun e!424616 () SeekEntryResult!7696)

(assert (=> b!761578 (= e!424617 e!424616)))

(declare-fun c!83698 () Bool)

(declare-fun lt!339282 () (_ BitVec 64))

(assert (=> b!761578 (= c!83698 (= lt!339282 k0!2102))))

(declare-fun b!761579 () Bool)

(declare-fun e!424618 () SeekEntryResult!7696)

(assert (=> b!761579 (= e!424618 (MissingVacant!7696 (index!33154 lt!339139)))))

(declare-fun b!761580 () Bool)

(declare-fun c!83700 () Bool)

(assert (=> b!761580 (= c!83700 (= lt!339282 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!761580 (= e!424616 e!424618)))

(declare-fun b!761581 () Bool)

(assert (=> b!761581 (= e!424618 (seekKeyOrZeroReturnVacant!0 (bvadd (x!64203 lt!339139) #b00000000000000000000000000000001) (nextIndex!0 (index!33154 lt!339139) (bvadd (x!64203 lt!339139) #b00000000000000000000000000000001) mask!3328) (index!33154 lt!339139) k0!2102 a!3186 mask!3328))))

(declare-fun lt!339281 () SeekEntryResult!7696)

(declare-fun d!100943 () Bool)

(assert (=> d!100943 (and (or ((_ is Undefined!7696) lt!339281) (not ((_ is Found!7696) lt!339281)) (and (bvsge (index!33153 lt!339281) #b00000000000000000000000000000000) (bvslt (index!33153 lt!339281) (size!20560 a!3186)))) (or ((_ is Undefined!7696) lt!339281) ((_ is Found!7696) lt!339281) (not ((_ is MissingVacant!7696) lt!339281)) (not (= (index!33155 lt!339281) (index!33154 lt!339139))) (and (bvsge (index!33155 lt!339281) #b00000000000000000000000000000000) (bvslt (index!33155 lt!339281) (size!20560 a!3186)))) (or ((_ is Undefined!7696) lt!339281) (ite ((_ is Found!7696) lt!339281) (= (select (arr!20140 a!3186) (index!33153 lt!339281)) k0!2102) (and ((_ is MissingVacant!7696) lt!339281) (= (index!33155 lt!339281) (index!33154 lt!339139)) (= (select (arr!20140 a!3186) (index!33155 lt!339281)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!100943 (= lt!339281 e!424617)))

(declare-fun c!83699 () Bool)

(assert (=> d!100943 (= c!83699 (bvsge (x!64203 lt!339139) #b01111111111111111111111111111110))))

(assert (=> d!100943 (= lt!339282 (select (arr!20140 a!3186) (index!33154 lt!339139)))))

(assert (=> d!100943 (validMask!0 mask!3328)))

(assert (=> d!100943 (= (seekKeyOrZeroReturnVacant!0 (x!64203 lt!339139) (index!33154 lt!339139) (index!33154 lt!339139) k0!2102 a!3186 mask!3328) lt!339281)))

(declare-fun b!761577 () Bool)

(assert (=> b!761577 (= e!424616 (Found!7696 (index!33154 lt!339139)))))

(assert (= (and d!100943 c!83699) b!761576))

(assert (= (and d!100943 (not c!83699)) b!761578))

(assert (= (and b!761578 c!83698) b!761577))

(assert (= (and b!761578 (not c!83698)) b!761580))

(assert (= (and b!761580 c!83700) b!761579))

(assert (= (and b!761580 (not c!83700)) b!761581))

(declare-fun m!709081 () Bool)

(assert (=> b!761581 m!709081))

(assert (=> b!761581 m!709081))

(declare-fun m!709083 () Bool)

(assert (=> b!761581 m!709083))

(declare-fun m!709085 () Bool)

(assert (=> d!100943 m!709085))

(declare-fun m!709087 () Bool)

(assert (=> d!100943 m!709087))

(assert (=> d!100943 m!708783))

(assert (=> d!100943 m!708615))

(assert (=> b!761237 d!100943))

(declare-fun b!761582 () Bool)

(declare-fun e!424620 () Bool)

(declare-fun call!34985 () Bool)

(assert (=> b!761582 (= e!424620 call!34985)))

(declare-fun bm!34982 () Bool)

(assert (=> bm!34982 (= call!34985 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!761584 () Bool)

(declare-fun e!424621 () Bool)

(declare-fun e!424619 () Bool)

(assert (=> b!761584 (= e!424621 e!424619)))

(declare-fun c!83701 () Bool)

(assert (=> b!761584 (= c!83701 (validKeyInArray!0 (select (arr!20140 a!3186) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!761585 () Bool)

(assert (=> b!761585 (= e!424619 call!34985)))

(declare-fun b!761583 () Bool)

(assert (=> b!761583 (= e!424619 e!424620)))

(declare-fun lt!339284 () (_ BitVec 64))

(assert (=> b!761583 (= lt!339284 (select (arr!20140 a!3186) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!339285 () Unit!26311)

(assert (=> b!761583 (= lt!339285 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!339284 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!761583 (arrayContainsKey!0 a!3186 lt!339284 #b00000000000000000000000000000000)))

(declare-fun lt!339283 () Unit!26311)

(assert (=> b!761583 (= lt!339283 lt!339285)))

(declare-fun res!514953 () Bool)

(assert (=> b!761583 (= res!514953 (= (seekEntryOrOpen!0 (select (arr!20140 a!3186) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) a!3186 mask!3328) (Found!7696 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!761583 (=> (not res!514953) (not e!424620))))

(declare-fun d!100945 () Bool)

(declare-fun res!514954 () Bool)

(assert (=> d!100945 (=> res!514954 e!424621)))

(assert (=> d!100945 (= res!514954 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20560 a!3186)))))

(assert (=> d!100945 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328) e!424621)))

(assert (= (and d!100945 (not res!514954)) b!761584))

(assert (= (and b!761584 c!83701) b!761583))

(assert (= (and b!761584 (not c!83701)) b!761585))

(assert (= (and b!761583 res!514953) b!761582))

(assert (= (or b!761582 b!761585) bm!34982))

(declare-fun m!709089 () Bool)

(assert (=> bm!34982 m!709089))

(assert (=> b!761584 m!709001))

(assert (=> b!761584 m!709001))

(assert (=> b!761584 m!709031))

(assert (=> b!761583 m!709001))

(declare-fun m!709091 () Bool)

(assert (=> b!761583 m!709091))

(declare-fun m!709093 () Bool)

(assert (=> b!761583 m!709093))

(assert (=> b!761583 m!709001))

(declare-fun m!709095 () Bool)

(assert (=> b!761583 m!709095))

(assert (=> bm!34971 d!100945))

(assert (=> d!100831 d!100793))

(assert (=> d!100831 d!100795))

(assert (=> d!100831 d!100799))

(declare-fun d!100947 () Bool)

(assert (=> d!100947 (arrayContainsKey!0 a!3186 lt!339190 #b00000000000000000000000000000000)))

(declare-fun lt!339286 () Unit!26311)

(assert (=> d!100947 (= lt!339286 (choose!13 a!3186 lt!339190 j!159))))

(assert (=> d!100947 (bvsge j!159 #b00000000000000000000000000000000)))

(assert (=> d!100947 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!339190 j!159) lt!339286)))

(declare-fun bs!21415 () Bool)

(assert (= bs!21415 d!100947))

(assert (=> bs!21415 m!708869))

(declare-fun m!709097 () Bool)

(assert (=> bs!21415 m!709097))

(assert (=> b!761371 d!100947))

(declare-fun d!100949 () Bool)

(declare-fun res!514955 () Bool)

(declare-fun e!424622 () Bool)

(assert (=> d!100949 (=> res!514955 e!424622)))

(assert (=> d!100949 (= res!514955 (= (select (arr!20140 a!3186) #b00000000000000000000000000000000) lt!339190))))

(assert (=> d!100949 (= (arrayContainsKey!0 a!3186 lt!339190 #b00000000000000000000000000000000) e!424622)))

(declare-fun b!761586 () Bool)

(declare-fun e!424623 () Bool)

(assert (=> b!761586 (= e!424622 e!424623)))

(declare-fun res!514956 () Bool)

(assert (=> b!761586 (=> (not res!514956) (not e!424623))))

(assert (=> b!761586 (= res!514956 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20560 a!3186)))))

(declare-fun b!761587 () Bool)

(assert (=> b!761587 (= e!424623 (arrayContainsKey!0 a!3186 lt!339190 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!100949 (not res!514955)) b!761586))

(assert (= (and b!761586 res!514956) b!761587))

(assert (=> d!100949 m!708727))

(declare-fun m!709099 () Bool)

(assert (=> b!761587 m!709099))

(assert (=> b!761371 d!100949))

(assert (=> b!761371 d!100831))

(assert (=> d!100833 d!100799))

(declare-fun e!424627 () SeekEntryResult!7696)

(declare-fun b!761588 () Bool)

(assert (=> b!761588 (= e!424627 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 (toIndex!0 lt!339036 mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) mask!3328) lt!339036 lt!339037 mask!3328))))

(declare-fun b!761589 () Bool)

(declare-fun e!424624 () Bool)

(declare-fun e!424626 () Bool)

(assert (=> b!761589 (= e!424624 e!424626)))

(declare-fun res!514958 () Bool)

(declare-fun lt!339288 () SeekEntryResult!7696)

(assert (=> b!761589 (= res!514958 (and ((_ is Intermediate!7696) lt!339288) (not (undefined!8508 lt!339288)) (bvslt (x!64203 lt!339288) #b01111111111111111111111111111110) (bvsge (x!64203 lt!339288) #b00000000000000000000000000000000) (bvsge (x!64203 lt!339288) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!761589 (=> (not res!514958) (not e!424626))))

(declare-fun b!761590 () Bool)

(declare-fun e!424628 () SeekEntryResult!7696)

(assert (=> b!761590 (= e!424628 (Intermediate!7696 true (nextIndex!0 (toIndex!0 lt!339036 mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!761591 () Bool)

(assert (=> b!761591 (= e!424624 (bvsge (x!64203 lt!339288) #b01111111111111111111111111111110))))

(declare-fun d!100951 () Bool)

(assert (=> d!100951 e!424624))

(declare-fun c!83704 () Bool)

(assert (=> d!100951 (= c!83704 (and ((_ is Intermediate!7696) lt!339288) (undefined!8508 lt!339288)))))

(assert (=> d!100951 (= lt!339288 e!424628)))

(declare-fun c!83703 () Bool)

(assert (=> d!100951 (= c!83703 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(declare-fun lt!339287 () (_ BitVec 64))

(assert (=> d!100951 (= lt!339287 (select (arr!20140 lt!339037) (nextIndex!0 (toIndex!0 lt!339036 mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3328)))))

(assert (=> d!100951 (validMask!0 mask!3328)))

(assert (=> d!100951 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!339036 mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3328) lt!339036 lt!339037 mask!3328) lt!339288)))

(declare-fun b!761592 () Bool)

(assert (=> b!761592 (= e!424627 (Intermediate!7696 false (nextIndex!0 (toIndex!0 lt!339036 mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!761593 () Bool)

(assert (=> b!761593 (and (bvsge (index!33154 lt!339288) #b00000000000000000000000000000000) (bvslt (index!33154 lt!339288) (size!20560 lt!339037)))))

(declare-fun res!514959 () Bool)

(assert (=> b!761593 (= res!514959 (= (select (arr!20140 lt!339037) (index!33154 lt!339288)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!424625 () Bool)

(assert (=> b!761593 (=> res!514959 e!424625)))

(declare-fun b!761594 () Bool)

(assert (=> b!761594 (and (bvsge (index!33154 lt!339288) #b00000000000000000000000000000000) (bvslt (index!33154 lt!339288) (size!20560 lt!339037)))))

(declare-fun res!514957 () Bool)

(assert (=> b!761594 (= res!514957 (= (select (arr!20140 lt!339037) (index!33154 lt!339288)) lt!339036))))

(assert (=> b!761594 (=> res!514957 e!424625)))

(assert (=> b!761594 (= e!424626 e!424625)))

(declare-fun b!761595 () Bool)

(assert (=> b!761595 (= e!424628 e!424627)))

(declare-fun c!83702 () Bool)

(assert (=> b!761595 (= c!83702 (or (= lt!339287 lt!339036) (= (bvadd lt!339287 lt!339287) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!761596 () Bool)

(assert (=> b!761596 (and (bvsge (index!33154 lt!339288) #b00000000000000000000000000000000) (bvslt (index!33154 lt!339288) (size!20560 lt!339037)))))

(assert (=> b!761596 (= e!424625 (= (select (arr!20140 lt!339037) (index!33154 lt!339288)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!100951 c!83703) b!761590))

(assert (= (and d!100951 (not c!83703)) b!761595))

(assert (= (and b!761595 c!83702) b!761592))

(assert (= (and b!761595 (not c!83702)) b!761588))

(assert (= (and d!100951 c!83704) b!761591))

(assert (= (and d!100951 (not c!83704)) b!761589))

(assert (= (and b!761589 res!514958) b!761594))

(assert (= (and b!761594 (not res!514957)) b!761593))

(assert (= (and b!761593 (not res!514959)) b!761596))

(declare-fun m!709101 () Bool)

(assert (=> b!761593 m!709101))

(assert (=> b!761596 m!709101))

(assert (=> b!761588 m!708739))

(declare-fun m!709103 () Bool)

(assert (=> b!761588 m!709103))

(assert (=> b!761588 m!709103))

(declare-fun m!709105 () Bool)

(assert (=> b!761588 m!709105))

(assert (=> b!761594 m!709101))

(assert (=> d!100951 m!708739))

(declare-fun m!709107 () Bool)

(assert (=> d!100951 m!709107))

(assert (=> d!100951 m!708615))

(assert (=> b!761147 d!100951))

(declare-fun d!100953 () Bool)

(declare-fun lt!339289 () (_ BitVec 32))

(assert (=> d!100953 (and (bvsge lt!339289 #b00000000000000000000000000000000) (bvslt lt!339289 (bvadd mask!3328 #b00000000000000000000000000000001)))))

(assert (=> d!100953 (= lt!339289 (choose!52 (toIndex!0 lt!339036 mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3328))))

(assert (=> d!100953 (validMask!0 mask!3328)))

(assert (=> d!100953 (= (nextIndex!0 (toIndex!0 lt!339036 mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3328) lt!339289)))

(declare-fun bs!21416 () Bool)

(assert (= bs!21416 d!100953))

(assert (=> bs!21416 m!708579))

(declare-fun m!709109 () Bool)

(assert (=> bs!21416 m!709109))

(assert (=> bs!21416 m!708615))

(assert (=> b!761147 d!100953))

(assert (=> b!761372 d!100807))

(declare-fun b!761597 () Bool)

(declare-fun e!424630 () Bool)

(declare-fun call!34986 () Bool)

(assert (=> b!761597 (= e!424630 call!34986)))

(declare-fun bm!34983 () Bool)

(assert (=> bm!34983 (= call!34986 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!761599 () Bool)

(declare-fun e!424631 () Bool)

(declare-fun e!424629 () Bool)

(assert (=> b!761599 (= e!424631 e!424629)))

(declare-fun c!83705 () Bool)

(assert (=> b!761599 (= c!83705 (validKeyInArray!0 (select (arr!20140 a!3186) (bvadd j!159 #b00000000000000000000000000000001))))))

(declare-fun b!761600 () Bool)

(assert (=> b!761600 (= e!424629 call!34986)))

(declare-fun b!761598 () Bool)

(assert (=> b!761598 (= e!424629 e!424630)))

(declare-fun lt!339291 () (_ BitVec 64))

(assert (=> b!761598 (= lt!339291 (select (arr!20140 a!3186) (bvadd j!159 #b00000000000000000000000000000001)))))

(declare-fun lt!339292 () Unit!26311)

(assert (=> b!761598 (= lt!339292 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!339291 (bvadd j!159 #b00000000000000000000000000000001)))))

(assert (=> b!761598 (arrayContainsKey!0 a!3186 lt!339291 #b00000000000000000000000000000000)))

(declare-fun lt!339290 () Unit!26311)

(assert (=> b!761598 (= lt!339290 lt!339292)))

(declare-fun res!514960 () Bool)

(assert (=> b!761598 (= res!514960 (= (seekEntryOrOpen!0 (select (arr!20140 a!3186) (bvadd j!159 #b00000000000000000000000000000001)) a!3186 mask!3328) (Found!7696 (bvadd j!159 #b00000000000000000000000000000001))))))

(assert (=> b!761598 (=> (not res!514960) (not e!424630))))

(declare-fun d!100955 () Bool)

(declare-fun res!514961 () Bool)

(assert (=> d!100955 (=> res!514961 e!424631)))

(assert (=> d!100955 (= res!514961 (bvsge (bvadd j!159 #b00000000000000000000000000000001) (size!20560 a!3186)))))

(assert (=> d!100955 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328) e!424631)))

(assert (= (and d!100955 (not res!514961)) b!761599))

(assert (= (and b!761599 c!83705) b!761598))

(assert (= (and b!761599 (not c!83705)) b!761600))

(assert (= (and b!761598 res!514960) b!761597))

(assert (= (or b!761597 b!761600) bm!34983))

(declare-fun m!709111 () Bool)

(assert (=> bm!34983 m!709111))

(declare-fun m!709113 () Bool)

(assert (=> b!761599 m!709113))

(assert (=> b!761599 m!709113))

(declare-fun m!709115 () Bool)

(assert (=> b!761599 m!709115))

(assert (=> b!761598 m!709113))

(declare-fun m!709117 () Bool)

(assert (=> b!761598 m!709117))

(declare-fun m!709119 () Bool)

(assert (=> b!761598 m!709119))

(assert (=> b!761598 m!709113))

(declare-fun m!709121 () Bool)

(assert (=> b!761598 m!709121))

(assert (=> bm!34975 d!100955))

(declare-fun b!761601 () Bool)

(declare-fun e!424633 () SeekEntryResult!7696)

(assert (=> b!761601 (= e!424633 Undefined!7696)))

(declare-fun b!761603 () Bool)

(declare-fun e!424632 () SeekEntryResult!7696)

(assert (=> b!761603 (= e!424633 e!424632)))

(declare-fun c!83706 () Bool)

(declare-fun lt!339294 () (_ BitVec 64))

(assert (=> b!761603 (= c!83706 (= lt!339294 (select (arr!20140 a!3186) j!159)))))

(declare-fun b!761604 () Bool)

(declare-fun e!424634 () SeekEntryResult!7696)

(assert (=> b!761604 (= e!424634 (MissingVacant!7696 resIntermediateIndex!5))))

(declare-fun b!761605 () Bool)

(declare-fun c!83708 () Bool)

(assert (=> b!761605 (= c!83708 (= lt!339294 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!761605 (= e!424632 e!424634)))

(declare-fun b!761606 () Bool)

(assert (=> b!761606 (= e!424634 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) (bvadd x!1131 #b00000000000000000000000000000001 #b00000000000000000000000000000001) mask!3328) resIntermediateIndex!5 (select (arr!20140 a!3186) j!159) a!3186 mask!3328))))

(declare-fun d!100957 () Bool)

(declare-fun lt!339293 () SeekEntryResult!7696)

(assert (=> d!100957 (and (or ((_ is Undefined!7696) lt!339293) (not ((_ is Found!7696) lt!339293)) (and (bvsge (index!33153 lt!339293) #b00000000000000000000000000000000) (bvslt (index!33153 lt!339293) (size!20560 a!3186)))) (or ((_ is Undefined!7696) lt!339293) ((_ is Found!7696) lt!339293) (not ((_ is MissingVacant!7696) lt!339293)) (not (= (index!33155 lt!339293) resIntermediateIndex!5)) (and (bvsge (index!33155 lt!339293) #b00000000000000000000000000000000) (bvslt (index!33155 lt!339293) (size!20560 a!3186)))) (or ((_ is Undefined!7696) lt!339293) (ite ((_ is Found!7696) lt!339293) (= (select (arr!20140 a!3186) (index!33153 lt!339293)) (select (arr!20140 a!3186) j!159)) (and ((_ is MissingVacant!7696) lt!339293) (= (index!33155 lt!339293) resIntermediateIndex!5) (= (select (arr!20140 a!3186) (index!33155 lt!339293)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!100957 (= lt!339293 e!424633)))

(declare-fun c!83707 () Bool)

(assert (=> d!100957 (= c!83707 (bvsge (bvadd x!1131 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!100957 (= lt!339294 (select (arr!20140 a!3186) (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328)))))

(assert (=> d!100957 (validMask!0 mask!3328)))

(assert (=> d!100957 (= (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) resIntermediateIndex!5 (select (arr!20140 a!3186) j!159) a!3186 mask!3328) lt!339293)))

(declare-fun b!761602 () Bool)

(assert (=> b!761602 (= e!424632 (Found!7696 (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328)))))

(assert (= (and d!100957 c!83707) b!761601))

(assert (= (and d!100957 (not c!83707)) b!761603))

(assert (= (and b!761603 c!83706) b!761602))

(assert (= (and b!761603 (not c!83706)) b!761605))

(assert (= (and b!761605 c!83708) b!761604))

(assert (= (and b!761605 (not c!83708)) b!761606))

(assert (=> b!761606 m!708721))

(assert (=> b!761606 m!709017))

(assert (=> b!761606 m!709017))

(assert (=> b!761606 m!708591))

(declare-fun m!709123 () Bool)

(assert (=> b!761606 m!709123))

(declare-fun m!709125 () Bool)

(assert (=> d!100957 m!709125))

(declare-fun m!709127 () Bool)

(assert (=> d!100957 m!709127))

(assert (=> d!100957 m!708721))

(assert (=> d!100957 m!709029))

(assert (=> d!100957 m!708615))

(assert (=> b!761393 d!100957))

(assert (=> b!761393 d!100921))

(assert (=> d!100793 d!100799))

(check-sat (not bm!34982) (not d!100937) (not b!761548) (not b!761507) (not b!761545) (not b!761583) (not b!761561) (not b!761606) (not b!761567) (not d!100931) (not b!761598) (not d!100953) (not d!100919) (not b!761518) (not d!100947) (not b!761555) (not d!100907) (not d!100951) (not b!761573) (not d!100943) (not d!100923) (not d!100957) (not b!761599) (not b!761587) (not b!761527) (not b!761584) (not b!761581) (not d!100933) (not d!100927) (not b!761536) (not d!100941) (not bm!34983) (not b!761549) (not d!100921) (not b!761517) (not bm!34981) (not b!761588) (not d!100915) (not d!100929) (not d!100913) (not d!100935) (not b!761569))
(check-sat)
