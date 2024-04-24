; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66164 () Bool)

(assert start!66164)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42073 0))(
  ( (array!42074 (arr!20143 (Array (_ BitVec 32) (_ BitVec 64))) (size!20563 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42073)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun b!761643 () Bool)

(declare-fun e!424657 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7699 0))(
  ( (MissingZero!7699 (index!33164 (_ BitVec 32))) (Found!7699 (index!33165 (_ BitVec 32))) (Intermediate!7699 (undefined!8511 Bool) (index!33166 (_ BitVec 32)) (x!64224 (_ BitVec 32))) (Undefined!7699) (MissingVacant!7699 (index!33167 (_ BitVec 32))) )
))
(declare-fun lt!339315 () SeekEntryResult!7699)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42073 (_ BitVec 32)) SeekEntryResult!7699)

(assert (=> b!761643 (= e!424657 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20143 a!3186) j!159) a!3186 mask!3328) lt!339315))))

(declare-fun b!761644 () Bool)

(declare-fun res!515003 () Bool)

(declare-fun e!424660 () Bool)

(assert (=> b!761644 (=> (not res!515003) (not e!424660))))

(declare-datatypes ((List!14052 0))(
  ( (Nil!14049) (Cons!14048 (h!15132 (_ BitVec 64)) (t!20359 List!14052)) )
))
(declare-fun arrayNoDuplicates!0 (array!42073 (_ BitVec 32) List!14052) Bool)

(assert (=> b!761644 (= res!515003 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14049))))

(declare-fun b!761645 () Bool)

(declare-fun e!424654 () Bool)

(assert (=> b!761645 (= e!424654 e!424660)))

(declare-fun res!514994 () Bool)

(assert (=> b!761645 (=> (not res!514994) (not e!424660))))

(declare-fun lt!339317 () SeekEntryResult!7699)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!761645 (= res!514994 (or (= lt!339317 (MissingZero!7699 i!1173)) (= lt!339317 (MissingVacant!7699 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42073 (_ BitVec 32)) SeekEntryResult!7699)

(assert (=> b!761645 (= lt!339317 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!761646 () Bool)

(declare-fun res!515004 () Bool)

(declare-fun e!424658 () Bool)

(assert (=> b!761646 (=> (not res!515004) (not e!424658))))

(declare-fun e!424661 () Bool)

(assert (=> b!761646 (= res!515004 e!424661)))

(declare-fun c!83711 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!761646 (= c!83711 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!761647 () Bool)

(assert (=> b!761647 (= e!424660 e!424658)))

(declare-fun res!515000 () Bool)

(assert (=> b!761647 (=> (not res!515000) (not e!424658))))

(declare-fun lt!339313 () SeekEntryResult!7699)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42073 (_ BitVec 32)) SeekEntryResult!7699)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!761647 (= res!515000 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20143 a!3186) j!159) mask!3328) (select (arr!20143 a!3186) j!159) a!3186 mask!3328) lt!339313))))

(assert (=> b!761647 (= lt!339313 (Intermediate!7699 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!761648 () Bool)

(declare-fun res!515002 () Bool)

(assert (=> b!761648 (=> (not res!515002) (not e!424658))))

(assert (=> b!761648 (= res!515002 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20143 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!761649 () Bool)

(declare-fun res!515005 () Bool)

(assert (=> b!761649 (=> (not res!515005) (not e!424654))))

(assert (=> b!761649 (= res!515005 (and (= (size!20563 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20563 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20563 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!514998 () Bool)

(assert (=> start!66164 (=> (not res!514998) (not e!424654))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66164 (= res!514998 (validMask!0 mask!3328))))

(assert (=> start!66164 e!424654))

(assert (=> start!66164 true))

(declare-fun array_inv!16002 (array!42073) Bool)

(assert (=> start!66164 (array_inv!16002 a!3186)))

(declare-fun b!761650 () Bool)

(declare-fun res!515001 () Bool)

(assert (=> b!761650 (=> (not res!515001) (not e!424654))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!761650 (= res!515001 (validKeyInArray!0 k0!2102))))

(declare-fun b!761651 () Bool)

(declare-fun e!424656 () Bool)

(declare-fun e!424659 () Bool)

(assert (=> b!761651 (= e!424656 (not e!424659))))

(declare-fun res!514996 () Bool)

(assert (=> b!761651 (=> res!514996 e!424659)))

(declare-fun lt!339311 () SeekEntryResult!7699)

(declare-fun index!1321 () (_ BitVec 32))

(get-info :version)

(assert (=> b!761651 (= res!514996 (or (not ((_ is Intermediate!7699) lt!339311)) (bvslt x!1131 (x!64224 lt!339311)) (not (= x!1131 (x!64224 lt!339311))) (not (= index!1321 (index!33166 lt!339311)))))))

(declare-fun e!424653 () Bool)

(assert (=> b!761651 e!424653))

(declare-fun res!514995 () Bool)

(assert (=> b!761651 (=> (not res!514995) (not e!424653))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42073 (_ BitVec 32)) Bool)

(assert (=> b!761651 (= res!514995 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26317 0))(
  ( (Unit!26318) )
))
(declare-fun lt!339318 () Unit!26317)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42073 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26317)

(assert (=> b!761651 (= lt!339318 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!761652 () Bool)

(assert (=> b!761652 (= e!424653 e!424657)))

(declare-fun res!515009 () Bool)

(assert (=> b!761652 (=> (not res!515009) (not e!424657))))

(assert (=> b!761652 (= res!515009 (= (seekEntryOrOpen!0 (select (arr!20143 a!3186) j!159) a!3186 mask!3328) lt!339315))))

(assert (=> b!761652 (= lt!339315 (Found!7699 j!159))))

(declare-fun b!761653 () Bool)

(assert (=> b!761653 (= e!424659 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20143 a!3186) j!159) a!3186 mask!3328) (Found!7699 j!159)))))

(declare-fun b!761654 () Bool)

(declare-fun res!514997 () Bool)

(assert (=> b!761654 (=> (not res!514997) (not e!424660))))

(assert (=> b!761654 (= res!514997 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20563 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20563 a!3186))))))

(declare-fun b!761655 () Bool)

(declare-fun res!515008 () Bool)

(assert (=> b!761655 (=> (not res!515008) (not e!424654))))

(assert (=> b!761655 (= res!515008 (validKeyInArray!0 (select (arr!20143 a!3186) j!159)))))

(declare-fun b!761656 () Bool)

(declare-fun res!514999 () Bool)

(assert (=> b!761656 (=> (not res!514999) (not e!424654))))

(declare-fun arrayContainsKey!0 (array!42073 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!761656 (= res!514999 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!761657 () Bool)

(assert (=> b!761657 (= e!424661 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20143 a!3186) j!159) a!3186 mask!3328) lt!339313))))

(declare-fun b!761658 () Bool)

(assert (=> b!761658 (= e!424661 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20143 a!3186) j!159) a!3186 mask!3328) (Found!7699 j!159)))))

(declare-fun b!761659 () Bool)

(assert (=> b!761659 (= e!424658 e!424656)))

(declare-fun res!515006 () Bool)

(assert (=> b!761659 (=> (not res!515006) (not e!424656))))

(declare-fun lt!339312 () SeekEntryResult!7699)

(assert (=> b!761659 (= res!515006 (= lt!339312 lt!339311))))

(declare-fun lt!339314 () array!42073)

(declare-fun lt!339316 () (_ BitVec 64))

(assert (=> b!761659 (= lt!339311 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!339316 lt!339314 mask!3328))))

(assert (=> b!761659 (= lt!339312 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!339316 mask!3328) lt!339316 lt!339314 mask!3328))))

(assert (=> b!761659 (= lt!339316 (select (store (arr!20143 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!761659 (= lt!339314 (array!42074 (store (arr!20143 a!3186) i!1173 k0!2102) (size!20563 a!3186)))))

(declare-fun b!761660 () Bool)

(declare-fun res!515007 () Bool)

(assert (=> b!761660 (=> (not res!515007) (not e!424660))))

(assert (=> b!761660 (= res!515007 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!66164 res!514998) b!761649))

(assert (= (and b!761649 res!515005) b!761655))

(assert (= (and b!761655 res!515008) b!761650))

(assert (= (and b!761650 res!515001) b!761656))

(assert (= (and b!761656 res!514999) b!761645))

(assert (= (and b!761645 res!514994) b!761660))

(assert (= (and b!761660 res!515007) b!761644))

(assert (= (and b!761644 res!515003) b!761654))

(assert (= (and b!761654 res!514997) b!761647))

(assert (= (and b!761647 res!515000) b!761648))

(assert (= (and b!761648 res!515002) b!761646))

(assert (= (and b!761646 c!83711) b!761657))

(assert (= (and b!761646 (not c!83711)) b!761658))

(assert (= (and b!761646 res!515004) b!761659))

(assert (= (and b!761659 res!515006) b!761651))

(assert (= (and b!761651 res!514995) b!761652))

(assert (= (and b!761652 res!515009) b!761643))

(assert (= (and b!761651 (not res!514996)) b!761653))

(declare-fun m!709129 () Bool)

(assert (=> start!66164 m!709129))

(declare-fun m!709131 () Bool)

(assert (=> start!66164 m!709131))

(declare-fun m!709133 () Bool)

(assert (=> b!761655 m!709133))

(assert (=> b!761655 m!709133))

(declare-fun m!709135 () Bool)

(assert (=> b!761655 m!709135))

(declare-fun m!709137 () Bool)

(assert (=> b!761659 m!709137))

(declare-fun m!709139 () Bool)

(assert (=> b!761659 m!709139))

(declare-fun m!709141 () Bool)

(assert (=> b!761659 m!709141))

(declare-fun m!709143 () Bool)

(assert (=> b!761659 m!709143))

(declare-fun m!709145 () Bool)

(assert (=> b!761659 m!709145))

(assert (=> b!761659 m!709139))

(declare-fun m!709147 () Bool)

(assert (=> b!761650 m!709147))

(assert (=> b!761657 m!709133))

(assert (=> b!761657 m!709133))

(declare-fun m!709149 () Bool)

(assert (=> b!761657 m!709149))

(declare-fun m!709151 () Bool)

(assert (=> b!761656 m!709151))

(declare-fun m!709153 () Bool)

(assert (=> b!761644 m!709153))

(declare-fun m!709155 () Bool)

(assert (=> b!761645 m!709155))

(declare-fun m!709157 () Bool)

(assert (=> b!761651 m!709157))

(declare-fun m!709159 () Bool)

(assert (=> b!761651 m!709159))

(assert (=> b!761658 m!709133))

(assert (=> b!761658 m!709133))

(declare-fun m!709161 () Bool)

(assert (=> b!761658 m!709161))

(assert (=> b!761652 m!709133))

(assert (=> b!761652 m!709133))

(declare-fun m!709163 () Bool)

(assert (=> b!761652 m!709163))

(assert (=> b!761647 m!709133))

(assert (=> b!761647 m!709133))

(declare-fun m!709165 () Bool)

(assert (=> b!761647 m!709165))

(assert (=> b!761647 m!709165))

(assert (=> b!761647 m!709133))

(declare-fun m!709167 () Bool)

(assert (=> b!761647 m!709167))

(declare-fun m!709169 () Bool)

(assert (=> b!761648 m!709169))

(assert (=> b!761643 m!709133))

(assert (=> b!761643 m!709133))

(declare-fun m!709171 () Bool)

(assert (=> b!761643 m!709171))

(declare-fun m!709173 () Bool)

(assert (=> b!761660 m!709173))

(assert (=> b!761653 m!709133))

(assert (=> b!761653 m!709133))

(assert (=> b!761653 m!709161))

(check-sat (not b!761659) (not b!761645) (not b!761653) (not b!761644) (not b!761651) (not b!761658) (not b!761647) (not b!761650) (not start!66164) (not b!761655) (not b!761660) (not b!761643) (not b!761656) (not b!761652) (not b!761657))
(check-sat)
(get-model)

(declare-fun b!761781 () Bool)

(declare-fun e!424723 () SeekEntryResult!7699)

(assert (=> b!761781 (= e!424723 Undefined!7699)))

(declare-fun e!424724 () SeekEntryResult!7699)

(declare-fun b!761782 () Bool)

(declare-fun lt!339375 () SeekEntryResult!7699)

(assert (=> b!761782 (= e!424724 (seekKeyOrZeroReturnVacant!0 (x!64224 lt!339375) (index!33166 lt!339375) (index!33166 lt!339375) k0!2102 a!3186 mask!3328))))

(declare-fun b!761783 () Bool)

(declare-fun e!424722 () SeekEntryResult!7699)

(assert (=> b!761783 (= e!424723 e!424722)))

(declare-fun lt!339373 () (_ BitVec 64))

(assert (=> b!761783 (= lt!339373 (select (arr!20143 a!3186) (index!33166 lt!339375)))))

(declare-fun c!83725 () Bool)

(assert (=> b!761783 (= c!83725 (= lt!339373 k0!2102))))

(declare-fun b!761784 () Bool)

(declare-fun c!83726 () Bool)

(assert (=> b!761784 (= c!83726 (= lt!339373 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!761784 (= e!424722 e!424724)))

(declare-fun d!100961 () Bool)

(declare-fun lt!339374 () SeekEntryResult!7699)

(assert (=> d!100961 (and (or ((_ is Undefined!7699) lt!339374) (not ((_ is Found!7699) lt!339374)) (and (bvsge (index!33165 lt!339374) #b00000000000000000000000000000000) (bvslt (index!33165 lt!339374) (size!20563 a!3186)))) (or ((_ is Undefined!7699) lt!339374) ((_ is Found!7699) lt!339374) (not ((_ is MissingZero!7699) lt!339374)) (and (bvsge (index!33164 lt!339374) #b00000000000000000000000000000000) (bvslt (index!33164 lt!339374) (size!20563 a!3186)))) (or ((_ is Undefined!7699) lt!339374) ((_ is Found!7699) lt!339374) ((_ is MissingZero!7699) lt!339374) (not ((_ is MissingVacant!7699) lt!339374)) (and (bvsge (index!33167 lt!339374) #b00000000000000000000000000000000) (bvslt (index!33167 lt!339374) (size!20563 a!3186)))) (or ((_ is Undefined!7699) lt!339374) (ite ((_ is Found!7699) lt!339374) (= (select (arr!20143 a!3186) (index!33165 lt!339374)) k0!2102) (ite ((_ is MissingZero!7699) lt!339374) (= (select (arr!20143 a!3186) (index!33164 lt!339374)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7699) lt!339374) (= (select (arr!20143 a!3186) (index!33167 lt!339374)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!100961 (= lt!339374 e!424723)))

(declare-fun c!83724 () Bool)

(assert (=> d!100961 (= c!83724 (and ((_ is Intermediate!7699) lt!339375) (undefined!8511 lt!339375)))))

(assert (=> d!100961 (= lt!339375 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328))))

(assert (=> d!100961 (validMask!0 mask!3328)))

(assert (=> d!100961 (= (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328) lt!339374)))

(declare-fun b!761785 () Bool)

(assert (=> b!761785 (= e!424724 (MissingZero!7699 (index!33166 lt!339375)))))

(declare-fun b!761786 () Bool)

(assert (=> b!761786 (= e!424722 (Found!7699 (index!33166 lt!339375)))))

(assert (= (and d!100961 c!83724) b!761781))

(assert (= (and d!100961 (not c!83724)) b!761783))

(assert (= (and b!761783 c!83725) b!761786))

(assert (= (and b!761783 (not c!83725)) b!761784))

(assert (= (and b!761784 c!83726) b!761785))

(assert (= (and b!761784 (not c!83726)) b!761782))

(declare-fun m!709267 () Bool)

(assert (=> b!761782 m!709267))

(declare-fun m!709269 () Bool)

(assert (=> b!761783 m!709269))

(declare-fun m!709271 () Bool)

(assert (=> d!100961 m!709271))

(declare-fun m!709273 () Bool)

(assert (=> d!100961 m!709273))

(declare-fun m!709275 () Bool)

(assert (=> d!100961 m!709275))

(declare-fun m!709277 () Bool)

(assert (=> d!100961 m!709277))

(assert (=> d!100961 m!709129))

(assert (=> d!100961 m!709277))

(declare-fun m!709279 () Bool)

(assert (=> d!100961 m!709279))

(assert (=> b!761645 d!100961))

(declare-fun d!100963 () Bool)

(declare-fun res!515110 () Bool)

(declare-fun e!424729 () Bool)

(assert (=> d!100963 (=> res!515110 e!424729)))

(assert (=> d!100963 (= res!515110 (= (select (arr!20143 a!3186) #b00000000000000000000000000000000) k0!2102))))

(assert (=> d!100963 (= (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000) e!424729)))

(declare-fun b!761791 () Bool)

(declare-fun e!424730 () Bool)

(assert (=> b!761791 (= e!424729 e!424730)))

(declare-fun res!515111 () Bool)

(assert (=> b!761791 (=> (not res!515111) (not e!424730))))

(assert (=> b!761791 (= res!515111 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20563 a!3186)))))

(declare-fun b!761792 () Bool)

(assert (=> b!761792 (= e!424730 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!100963 (not res!515110)) b!761791))

(assert (= (and b!761791 res!515111) b!761792))

(declare-fun m!709281 () Bool)

(assert (=> d!100963 m!709281))

(declare-fun m!709283 () Bool)

(assert (=> b!761792 m!709283))

(assert (=> b!761656 d!100963))

(declare-fun b!761811 () Bool)

(declare-fun e!424744 () SeekEntryResult!7699)

(assert (=> b!761811 (= e!424744 (Intermediate!7699 false index!1321 x!1131))))

(declare-fun b!761812 () Bool)

(declare-fun lt!339381 () SeekEntryResult!7699)

(assert (=> b!761812 (and (bvsge (index!33166 lt!339381) #b00000000000000000000000000000000) (bvslt (index!33166 lt!339381) (size!20563 a!3186)))))

(declare-fun res!515119 () Bool)

(assert (=> b!761812 (= res!515119 (= (select (arr!20143 a!3186) (index!33166 lt!339381)) (select (arr!20143 a!3186) j!159)))))

(declare-fun e!424741 () Bool)

(assert (=> b!761812 (=> res!515119 e!424741)))

(declare-fun e!424745 () Bool)

(assert (=> b!761812 (= e!424745 e!424741)))

(declare-fun b!761813 () Bool)

(declare-fun e!424743 () SeekEntryResult!7699)

(assert (=> b!761813 (= e!424743 e!424744)))

(declare-fun c!83734 () Bool)

(declare-fun lt!339380 () (_ BitVec 64))

(assert (=> b!761813 (= c!83734 (or (= lt!339380 (select (arr!20143 a!3186) j!159)) (= (bvadd lt!339380 lt!339380) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!761814 () Bool)

(assert (=> b!761814 (and (bvsge (index!33166 lt!339381) #b00000000000000000000000000000000) (bvslt (index!33166 lt!339381) (size!20563 a!3186)))))

(assert (=> b!761814 (= e!424741 (= (select (arr!20143 a!3186) (index!33166 lt!339381)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!100965 () Bool)

(declare-fun e!424742 () Bool)

(assert (=> d!100965 e!424742))

(declare-fun c!83735 () Bool)

(assert (=> d!100965 (= c!83735 (and ((_ is Intermediate!7699) lt!339381) (undefined!8511 lt!339381)))))

(assert (=> d!100965 (= lt!339381 e!424743)))

(declare-fun c!83733 () Bool)

(assert (=> d!100965 (= c!83733 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!100965 (= lt!339380 (select (arr!20143 a!3186) index!1321))))

(assert (=> d!100965 (validMask!0 mask!3328)))

(assert (=> d!100965 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20143 a!3186) j!159) a!3186 mask!3328) lt!339381)))

(declare-fun b!761815 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!761815 (= e!424744 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) (select (arr!20143 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!761816 () Bool)

(assert (=> b!761816 (= e!424742 (bvsge (x!64224 lt!339381) #b01111111111111111111111111111110))))

(declare-fun b!761817 () Bool)

(assert (=> b!761817 (= e!424743 (Intermediate!7699 true index!1321 x!1131))))

(declare-fun b!761818 () Bool)

(assert (=> b!761818 (= e!424742 e!424745)))

(declare-fun res!515120 () Bool)

(assert (=> b!761818 (= res!515120 (and ((_ is Intermediate!7699) lt!339381) (not (undefined!8511 lt!339381)) (bvslt (x!64224 lt!339381) #b01111111111111111111111111111110) (bvsge (x!64224 lt!339381) #b00000000000000000000000000000000) (bvsge (x!64224 lt!339381) x!1131)))))

(assert (=> b!761818 (=> (not res!515120) (not e!424745))))

(declare-fun b!761819 () Bool)

(assert (=> b!761819 (and (bvsge (index!33166 lt!339381) #b00000000000000000000000000000000) (bvslt (index!33166 lt!339381) (size!20563 a!3186)))))

(declare-fun res!515118 () Bool)

(assert (=> b!761819 (= res!515118 (= (select (arr!20143 a!3186) (index!33166 lt!339381)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!761819 (=> res!515118 e!424741)))

(assert (= (and d!100965 c!83733) b!761817))

(assert (= (and d!100965 (not c!83733)) b!761813))

(assert (= (and b!761813 c!83734) b!761811))

(assert (= (and b!761813 (not c!83734)) b!761815))

(assert (= (and d!100965 c!83735) b!761816))

(assert (= (and d!100965 (not c!83735)) b!761818))

(assert (= (and b!761818 res!515120) b!761812))

(assert (= (and b!761812 (not res!515119)) b!761819))

(assert (= (and b!761819 (not res!515118)) b!761814))

(declare-fun m!709285 () Bool)

(assert (=> b!761812 m!709285))

(assert (=> b!761814 m!709285))

(declare-fun m!709287 () Bool)

(assert (=> d!100965 m!709287))

(assert (=> d!100965 m!709129))

(assert (=> b!761819 m!709285))

(declare-fun m!709289 () Bool)

(assert (=> b!761815 m!709289))

(assert (=> b!761815 m!709289))

(assert (=> b!761815 m!709133))

(declare-fun m!709291 () Bool)

(assert (=> b!761815 m!709291))

(assert (=> b!761657 d!100965))

(declare-fun b!761824 () Bool)

(declare-fun e!424751 () SeekEntryResult!7699)

(assert (=> b!761824 (= e!424751 (Intermediate!7699 false (toIndex!0 (select (arr!20143 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!761825 () Bool)

(declare-fun lt!339387 () SeekEntryResult!7699)

(assert (=> b!761825 (and (bvsge (index!33166 lt!339387) #b00000000000000000000000000000000) (bvslt (index!33166 lt!339387) (size!20563 a!3186)))))

(declare-fun res!515122 () Bool)

(assert (=> b!761825 (= res!515122 (= (select (arr!20143 a!3186) (index!33166 lt!339387)) (select (arr!20143 a!3186) j!159)))))

(declare-fun e!424748 () Bool)

(assert (=> b!761825 (=> res!515122 e!424748)))

(declare-fun e!424752 () Bool)

(assert (=> b!761825 (= e!424752 e!424748)))

(declare-fun b!761826 () Bool)

(declare-fun e!424750 () SeekEntryResult!7699)

(assert (=> b!761826 (= e!424750 e!424751)))

(declare-fun lt!339386 () (_ BitVec 64))

(declare-fun c!83739 () Bool)

(assert (=> b!761826 (= c!83739 (or (= lt!339386 (select (arr!20143 a!3186) j!159)) (= (bvadd lt!339386 lt!339386) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!761827 () Bool)

(assert (=> b!761827 (and (bvsge (index!33166 lt!339387) #b00000000000000000000000000000000) (bvslt (index!33166 lt!339387) (size!20563 a!3186)))))

(assert (=> b!761827 (= e!424748 (= (select (arr!20143 a!3186) (index!33166 lt!339387)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!100971 () Bool)

(declare-fun e!424749 () Bool)

(assert (=> d!100971 e!424749))

(declare-fun c!83740 () Bool)

(assert (=> d!100971 (= c!83740 (and ((_ is Intermediate!7699) lt!339387) (undefined!8511 lt!339387)))))

(assert (=> d!100971 (= lt!339387 e!424750)))

(declare-fun c!83738 () Bool)

(assert (=> d!100971 (= c!83738 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!100971 (= lt!339386 (select (arr!20143 a!3186) (toIndex!0 (select (arr!20143 a!3186) j!159) mask!3328)))))

(assert (=> d!100971 (validMask!0 mask!3328)))

(assert (=> d!100971 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20143 a!3186) j!159) mask!3328) (select (arr!20143 a!3186) j!159) a!3186 mask!3328) lt!339387)))

(declare-fun b!761828 () Bool)

(assert (=> b!761828 (= e!424751 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20143 a!3186) j!159) mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3328) (select (arr!20143 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!761829 () Bool)

(assert (=> b!761829 (= e!424749 (bvsge (x!64224 lt!339387) #b01111111111111111111111111111110))))

(declare-fun b!761830 () Bool)

(assert (=> b!761830 (= e!424750 (Intermediate!7699 true (toIndex!0 (select (arr!20143 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!761831 () Bool)

(assert (=> b!761831 (= e!424749 e!424752)))

(declare-fun res!515123 () Bool)

(assert (=> b!761831 (= res!515123 (and ((_ is Intermediate!7699) lt!339387) (not (undefined!8511 lt!339387)) (bvslt (x!64224 lt!339387) #b01111111111111111111111111111110) (bvsge (x!64224 lt!339387) #b00000000000000000000000000000000) (bvsge (x!64224 lt!339387) #b00000000000000000000000000000000)))))

(assert (=> b!761831 (=> (not res!515123) (not e!424752))))

(declare-fun b!761832 () Bool)

(assert (=> b!761832 (and (bvsge (index!33166 lt!339387) #b00000000000000000000000000000000) (bvslt (index!33166 lt!339387) (size!20563 a!3186)))))

(declare-fun res!515121 () Bool)

(assert (=> b!761832 (= res!515121 (= (select (arr!20143 a!3186) (index!33166 lt!339387)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!761832 (=> res!515121 e!424748)))

(assert (= (and d!100971 c!83738) b!761830))

(assert (= (and d!100971 (not c!83738)) b!761826))

(assert (= (and b!761826 c!83739) b!761824))

(assert (= (and b!761826 (not c!83739)) b!761828))

(assert (= (and d!100971 c!83740) b!761829))

(assert (= (and d!100971 (not c!83740)) b!761831))

(assert (= (and b!761831 res!515123) b!761825))

(assert (= (and b!761825 (not res!515122)) b!761832))

(assert (= (and b!761832 (not res!515121)) b!761827))

(declare-fun m!709293 () Bool)

(assert (=> b!761825 m!709293))

(assert (=> b!761827 m!709293))

(assert (=> d!100971 m!709165))

(declare-fun m!709295 () Bool)

(assert (=> d!100971 m!709295))

(assert (=> d!100971 m!709129))

(assert (=> b!761832 m!709293))

(assert (=> b!761828 m!709165))

(declare-fun m!709297 () Bool)

(assert (=> b!761828 m!709297))

(assert (=> b!761828 m!709297))

(assert (=> b!761828 m!709133))

(declare-fun m!709299 () Bool)

(assert (=> b!761828 m!709299))

(assert (=> b!761647 d!100971))

(declare-fun d!100973 () Bool)

(declare-fun lt!339401 () (_ BitVec 32))

(declare-fun lt!339400 () (_ BitVec 32))

(assert (=> d!100973 (= lt!339401 (bvmul (bvxor lt!339400 (bvlshr lt!339400 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!100973 (= lt!339400 ((_ extract 31 0) (bvand (bvxor (select (arr!20143 a!3186) j!159) (bvlshr (select (arr!20143 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!100973 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!515124 (let ((h!15135 ((_ extract 31 0) (bvand (bvxor (select (arr!20143 a!3186) j!159) (bvlshr (select (arr!20143 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64229 (bvmul (bvxor h!15135 (bvlshr h!15135 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64229 (bvlshr x!64229 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!515124 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!515124 #b00000000000000000000000000000000))))))

(assert (=> d!100973 (= (toIndex!0 (select (arr!20143 a!3186) j!159) mask!3328) (bvand (bvxor lt!339401 (bvlshr lt!339401 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!761647 d!100973))

(declare-fun b!761889 () Bool)

(declare-fun c!83761 () Bool)

(declare-fun lt!339421 () (_ BitVec 64))

(assert (=> b!761889 (= c!83761 (= lt!339421 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!424790 () SeekEntryResult!7699)

(declare-fun e!424791 () SeekEntryResult!7699)

(assert (=> b!761889 (= e!424790 e!424791)))

(declare-fun b!761890 () Bool)

(assert (=> b!761890 (= e!424791 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) resIntermediateIndex!5 (select (arr!20143 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!761891 () Bool)

(assert (=> b!761891 (= e!424790 (Found!7699 index!1321))))

(declare-fun b!761892 () Bool)

(declare-fun e!424792 () SeekEntryResult!7699)

(assert (=> b!761892 (= e!424792 Undefined!7699)))

(declare-fun lt!339422 () SeekEntryResult!7699)

(declare-fun d!100979 () Bool)

(assert (=> d!100979 (and (or ((_ is Undefined!7699) lt!339422) (not ((_ is Found!7699) lt!339422)) (and (bvsge (index!33165 lt!339422) #b00000000000000000000000000000000) (bvslt (index!33165 lt!339422) (size!20563 a!3186)))) (or ((_ is Undefined!7699) lt!339422) ((_ is Found!7699) lt!339422) (not ((_ is MissingVacant!7699) lt!339422)) (not (= (index!33167 lt!339422) resIntermediateIndex!5)) (and (bvsge (index!33167 lt!339422) #b00000000000000000000000000000000) (bvslt (index!33167 lt!339422) (size!20563 a!3186)))) (or ((_ is Undefined!7699) lt!339422) (ite ((_ is Found!7699) lt!339422) (= (select (arr!20143 a!3186) (index!33165 lt!339422)) (select (arr!20143 a!3186) j!159)) (and ((_ is MissingVacant!7699) lt!339422) (= (index!33167 lt!339422) resIntermediateIndex!5) (= (select (arr!20143 a!3186) (index!33167 lt!339422)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!100979 (= lt!339422 e!424792)))

(declare-fun c!83760 () Bool)

(assert (=> d!100979 (= c!83760 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!100979 (= lt!339421 (select (arr!20143 a!3186) index!1321))))

(assert (=> d!100979 (validMask!0 mask!3328)))

(assert (=> d!100979 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20143 a!3186) j!159) a!3186 mask!3328) lt!339422)))

(declare-fun b!761893 () Bool)

(assert (=> b!761893 (= e!424792 e!424790)))

(declare-fun c!83762 () Bool)

(assert (=> b!761893 (= c!83762 (= lt!339421 (select (arr!20143 a!3186) j!159)))))

(declare-fun b!761894 () Bool)

(assert (=> b!761894 (= e!424791 (MissingVacant!7699 resIntermediateIndex!5))))

(assert (= (and d!100979 c!83760) b!761892))

(assert (= (and d!100979 (not c!83760)) b!761893))

(assert (= (and b!761893 c!83762) b!761891))

(assert (= (and b!761893 (not c!83762)) b!761889))

(assert (= (and b!761889 c!83761) b!761894))

(assert (= (and b!761889 (not c!83761)) b!761890))

(assert (=> b!761890 m!709289))

(assert (=> b!761890 m!709289))

(assert (=> b!761890 m!709133))

(declare-fun m!709331 () Bool)

(assert (=> b!761890 m!709331))

(declare-fun m!709333 () Bool)

(assert (=> d!100979 m!709333))

(declare-fun m!709335 () Bool)

(assert (=> d!100979 m!709335))

(assert (=> d!100979 m!709287))

(assert (=> d!100979 m!709129))

(assert (=> b!761658 d!100979))

(declare-fun b!761895 () Bool)

(declare-fun e!424796 () SeekEntryResult!7699)

(assert (=> b!761895 (= e!424796 (Intermediate!7699 false index!1321 x!1131))))

(declare-fun b!761896 () Bool)

(declare-fun lt!339424 () SeekEntryResult!7699)

(assert (=> b!761896 (and (bvsge (index!33166 lt!339424) #b00000000000000000000000000000000) (bvslt (index!33166 lt!339424) (size!20563 lt!339314)))))

(declare-fun res!515144 () Bool)

(assert (=> b!761896 (= res!515144 (= (select (arr!20143 lt!339314) (index!33166 lt!339424)) lt!339316))))

(declare-fun e!424793 () Bool)

(assert (=> b!761896 (=> res!515144 e!424793)))

(declare-fun e!424797 () Bool)

(assert (=> b!761896 (= e!424797 e!424793)))

(declare-fun b!761897 () Bool)

(declare-fun e!424795 () SeekEntryResult!7699)

(assert (=> b!761897 (= e!424795 e!424796)))

(declare-fun c!83764 () Bool)

(declare-fun lt!339423 () (_ BitVec 64))

(assert (=> b!761897 (= c!83764 (or (= lt!339423 lt!339316) (= (bvadd lt!339423 lt!339423) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!761898 () Bool)

(assert (=> b!761898 (and (bvsge (index!33166 lt!339424) #b00000000000000000000000000000000) (bvslt (index!33166 lt!339424) (size!20563 lt!339314)))))

(assert (=> b!761898 (= e!424793 (= (select (arr!20143 lt!339314) (index!33166 lt!339424)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!100989 () Bool)

(declare-fun e!424794 () Bool)

(assert (=> d!100989 e!424794))

(declare-fun c!83765 () Bool)

(assert (=> d!100989 (= c!83765 (and ((_ is Intermediate!7699) lt!339424) (undefined!8511 lt!339424)))))

(assert (=> d!100989 (= lt!339424 e!424795)))

(declare-fun c!83763 () Bool)

(assert (=> d!100989 (= c!83763 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!100989 (= lt!339423 (select (arr!20143 lt!339314) index!1321))))

(assert (=> d!100989 (validMask!0 mask!3328)))

(assert (=> d!100989 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!339316 lt!339314 mask!3328) lt!339424)))

(declare-fun b!761899 () Bool)

(assert (=> b!761899 (= e!424796 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) lt!339316 lt!339314 mask!3328))))

(declare-fun b!761900 () Bool)

(assert (=> b!761900 (= e!424794 (bvsge (x!64224 lt!339424) #b01111111111111111111111111111110))))

(declare-fun b!761901 () Bool)

(assert (=> b!761901 (= e!424795 (Intermediate!7699 true index!1321 x!1131))))

(declare-fun b!761902 () Bool)

(assert (=> b!761902 (= e!424794 e!424797)))

(declare-fun res!515145 () Bool)

(assert (=> b!761902 (= res!515145 (and ((_ is Intermediate!7699) lt!339424) (not (undefined!8511 lt!339424)) (bvslt (x!64224 lt!339424) #b01111111111111111111111111111110) (bvsge (x!64224 lt!339424) #b00000000000000000000000000000000) (bvsge (x!64224 lt!339424) x!1131)))))

(assert (=> b!761902 (=> (not res!515145) (not e!424797))))

(declare-fun b!761903 () Bool)

(assert (=> b!761903 (and (bvsge (index!33166 lt!339424) #b00000000000000000000000000000000) (bvslt (index!33166 lt!339424) (size!20563 lt!339314)))))

(declare-fun res!515143 () Bool)

(assert (=> b!761903 (= res!515143 (= (select (arr!20143 lt!339314) (index!33166 lt!339424)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!761903 (=> res!515143 e!424793)))

(assert (= (and d!100989 c!83763) b!761901))

(assert (= (and d!100989 (not c!83763)) b!761897))

(assert (= (and b!761897 c!83764) b!761895))

(assert (= (and b!761897 (not c!83764)) b!761899))

(assert (= (and d!100989 c!83765) b!761900))

(assert (= (and d!100989 (not c!83765)) b!761902))

(assert (= (and b!761902 res!515145) b!761896))

(assert (= (and b!761896 (not res!515144)) b!761903))

(assert (= (and b!761903 (not res!515143)) b!761898))

(declare-fun m!709337 () Bool)

(assert (=> b!761896 m!709337))

(assert (=> b!761898 m!709337))

(declare-fun m!709339 () Bool)

(assert (=> d!100989 m!709339))

(assert (=> d!100989 m!709129))

(assert (=> b!761903 m!709337))

(assert (=> b!761899 m!709289))

(assert (=> b!761899 m!709289))

(declare-fun m!709341 () Bool)

(assert (=> b!761899 m!709341))

(assert (=> b!761659 d!100989))

(declare-fun b!761904 () Bool)

(declare-fun e!424801 () SeekEntryResult!7699)

(assert (=> b!761904 (= e!424801 (Intermediate!7699 false (toIndex!0 lt!339316 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!761905 () Bool)

(declare-fun lt!339426 () SeekEntryResult!7699)

(assert (=> b!761905 (and (bvsge (index!33166 lt!339426) #b00000000000000000000000000000000) (bvslt (index!33166 lt!339426) (size!20563 lt!339314)))))

(declare-fun res!515147 () Bool)

(assert (=> b!761905 (= res!515147 (= (select (arr!20143 lt!339314) (index!33166 lt!339426)) lt!339316))))

(declare-fun e!424798 () Bool)

(assert (=> b!761905 (=> res!515147 e!424798)))

(declare-fun e!424802 () Bool)

(assert (=> b!761905 (= e!424802 e!424798)))

(declare-fun b!761906 () Bool)

(declare-fun e!424800 () SeekEntryResult!7699)

(assert (=> b!761906 (= e!424800 e!424801)))

(declare-fun c!83767 () Bool)

(declare-fun lt!339425 () (_ BitVec 64))

(assert (=> b!761906 (= c!83767 (or (= lt!339425 lt!339316) (= (bvadd lt!339425 lt!339425) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!761907 () Bool)

(assert (=> b!761907 (and (bvsge (index!33166 lt!339426) #b00000000000000000000000000000000) (bvslt (index!33166 lt!339426) (size!20563 lt!339314)))))

(assert (=> b!761907 (= e!424798 (= (select (arr!20143 lt!339314) (index!33166 lt!339426)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!100991 () Bool)

(declare-fun e!424799 () Bool)

(assert (=> d!100991 e!424799))

(declare-fun c!83768 () Bool)

(assert (=> d!100991 (= c!83768 (and ((_ is Intermediate!7699) lt!339426) (undefined!8511 lt!339426)))))

(assert (=> d!100991 (= lt!339426 e!424800)))

(declare-fun c!83766 () Bool)

(assert (=> d!100991 (= c!83766 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!100991 (= lt!339425 (select (arr!20143 lt!339314) (toIndex!0 lt!339316 mask!3328)))))

(assert (=> d!100991 (validMask!0 mask!3328)))

(assert (=> d!100991 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!339316 mask!3328) lt!339316 lt!339314 mask!3328) lt!339426)))

(declare-fun b!761908 () Bool)

(assert (=> b!761908 (= e!424801 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!339316 mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3328) lt!339316 lt!339314 mask!3328))))

(declare-fun b!761909 () Bool)

(assert (=> b!761909 (= e!424799 (bvsge (x!64224 lt!339426) #b01111111111111111111111111111110))))

(declare-fun b!761910 () Bool)

(assert (=> b!761910 (= e!424800 (Intermediate!7699 true (toIndex!0 lt!339316 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!761911 () Bool)

(assert (=> b!761911 (= e!424799 e!424802)))

(declare-fun res!515148 () Bool)

(assert (=> b!761911 (= res!515148 (and ((_ is Intermediate!7699) lt!339426) (not (undefined!8511 lt!339426)) (bvslt (x!64224 lt!339426) #b01111111111111111111111111111110) (bvsge (x!64224 lt!339426) #b00000000000000000000000000000000) (bvsge (x!64224 lt!339426) #b00000000000000000000000000000000)))))

(assert (=> b!761911 (=> (not res!515148) (not e!424802))))

(declare-fun b!761912 () Bool)

(assert (=> b!761912 (and (bvsge (index!33166 lt!339426) #b00000000000000000000000000000000) (bvslt (index!33166 lt!339426) (size!20563 lt!339314)))))

(declare-fun res!515146 () Bool)

(assert (=> b!761912 (= res!515146 (= (select (arr!20143 lt!339314) (index!33166 lt!339426)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!761912 (=> res!515146 e!424798)))

(assert (= (and d!100991 c!83766) b!761910))

(assert (= (and d!100991 (not c!83766)) b!761906))

(assert (= (and b!761906 c!83767) b!761904))

(assert (= (and b!761906 (not c!83767)) b!761908))

(assert (= (and d!100991 c!83768) b!761909))

(assert (= (and d!100991 (not c!83768)) b!761911))

(assert (= (and b!761911 res!515148) b!761905))

(assert (= (and b!761905 (not res!515147)) b!761912))

(assert (= (and b!761912 (not res!515146)) b!761907))

(declare-fun m!709343 () Bool)

(assert (=> b!761905 m!709343))

(assert (=> b!761907 m!709343))

(assert (=> d!100991 m!709139))

(declare-fun m!709345 () Bool)

(assert (=> d!100991 m!709345))

(assert (=> d!100991 m!709129))

(assert (=> b!761912 m!709343))

(assert (=> b!761908 m!709139))

(declare-fun m!709347 () Bool)

(assert (=> b!761908 m!709347))

(assert (=> b!761908 m!709347))

(declare-fun m!709349 () Bool)

(assert (=> b!761908 m!709349))

(assert (=> b!761659 d!100991))

(declare-fun d!100993 () Bool)

(declare-fun lt!339428 () (_ BitVec 32))

(declare-fun lt!339427 () (_ BitVec 32))

(assert (=> d!100993 (= lt!339428 (bvmul (bvxor lt!339427 (bvlshr lt!339427 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!100993 (= lt!339427 ((_ extract 31 0) (bvand (bvxor lt!339316 (bvlshr lt!339316 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!100993 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!515124 (let ((h!15135 ((_ extract 31 0) (bvand (bvxor lt!339316 (bvlshr lt!339316 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64229 (bvmul (bvxor h!15135 (bvlshr h!15135 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64229 (bvlshr x!64229 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!515124 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!515124 #b00000000000000000000000000000000))))))

(assert (=> d!100993 (= (toIndex!0 lt!339316 mask!3328) (bvand (bvxor lt!339428 (bvlshr lt!339428 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!761659 d!100993))

(declare-fun bm!34992 () Bool)

(declare-fun call!34995 () Bool)

(assert (=> bm!34992 (= call!34995 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!761951 () Bool)

(declare-fun e!424825 () Bool)

(declare-fun e!424826 () Bool)

(assert (=> b!761951 (= e!424825 e!424826)))

(declare-fun c!83786 () Bool)

(assert (=> b!761951 (= c!83786 (validKeyInArray!0 (select (arr!20143 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!761952 () Bool)

(declare-fun e!424824 () Bool)

(assert (=> b!761952 (= e!424826 e!424824)))

(declare-fun lt!339448 () (_ BitVec 64))

(assert (=> b!761952 (= lt!339448 (select (arr!20143 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!339450 () Unit!26317)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42073 (_ BitVec 64) (_ BitVec 32)) Unit!26317)

(assert (=> b!761952 (= lt!339450 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!339448 #b00000000000000000000000000000000))))

(assert (=> b!761952 (arrayContainsKey!0 a!3186 lt!339448 #b00000000000000000000000000000000)))

(declare-fun lt!339449 () Unit!26317)

(assert (=> b!761952 (= lt!339449 lt!339450)))

(declare-fun res!515153 () Bool)

(assert (=> b!761952 (= res!515153 (= (seekEntryOrOpen!0 (select (arr!20143 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7699 #b00000000000000000000000000000000)))))

(assert (=> b!761952 (=> (not res!515153) (not e!424824))))

(declare-fun d!100995 () Bool)

(declare-fun res!515154 () Bool)

(assert (=> d!100995 (=> res!515154 e!424825)))

(assert (=> d!100995 (= res!515154 (bvsge #b00000000000000000000000000000000 (size!20563 a!3186)))))

(assert (=> d!100995 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!424825)))

(declare-fun b!761953 () Bool)

(assert (=> b!761953 (= e!424824 call!34995)))

(declare-fun b!761954 () Bool)

(assert (=> b!761954 (= e!424826 call!34995)))

(assert (= (and d!100995 (not res!515154)) b!761951))

(assert (= (and b!761951 c!83786) b!761952))

(assert (= (and b!761951 (not c!83786)) b!761954))

(assert (= (and b!761952 res!515153) b!761953))

(assert (= (or b!761953 b!761954) bm!34992))

(declare-fun m!709365 () Bool)

(assert (=> bm!34992 m!709365))

(assert (=> b!761951 m!709281))

(assert (=> b!761951 m!709281))

(declare-fun m!709367 () Bool)

(assert (=> b!761951 m!709367))

(assert (=> b!761952 m!709281))

(declare-fun m!709369 () Bool)

(assert (=> b!761952 m!709369))

(declare-fun m!709371 () Bool)

(assert (=> b!761952 m!709371))

(assert (=> b!761952 m!709281))

(declare-fun m!709373 () Bool)

(assert (=> b!761952 m!709373))

(assert (=> b!761660 d!100995))

(declare-fun d!100999 () Bool)

(assert (=> d!100999 (= (validKeyInArray!0 k0!2102) (and (not (= k0!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!761650 d!100999))

(declare-fun bm!34993 () Bool)

(declare-fun call!34996 () Bool)

(assert (=> bm!34993 (= call!34996 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!761961 () Bool)

(declare-fun e!424832 () Bool)

(declare-fun e!424833 () Bool)

(assert (=> b!761961 (= e!424832 e!424833)))

(declare-fun c!83787 () Bool)

(assert (=> b!761961 (= c!83787 (validKeyInArray!0 (select (arr!20143 a!3186) j!159)))))

(declare-fun b!761962 () Bool)

(declare-fun e!424831 () Bool)

(assert (=> b!761962 (= e!424833 e!424831)))

(declare-fun lt!339451 () (_ BitVec 64))

(assert (=> b!761962 (= lt!339451 (select (arr!20143 a!3186) j!159))))

(declare-fun lt!339453 () Unit!26317)

(assert (=> b!761962 (= lt!339453 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!339451 j!159))))

(assert (=> b!761962 (arrayContainsKey!0 a!3186 lt!339451 #b00000000000000000000000000000000)))

(declare-fun lt!339452 () Unit!26317)

(assert (=> b!761962 (= lt!339452 lt!339453)))

(declare-fun res!515161 () Bool)

(assert (=> b!761962 (= res!515161 (= (seekEntryOrOpen!0 (select (arr!20143 a!3186) j!159) a!3186 mask!3328) (Found!7699 j!159)))))

(assert (=> b!761962 (=> (not res!515161) (not e!424831))))

(declare-fun d!101001 () Bool)

(declare-fun res!515162 () Bool)

(assert (=> d!101001 (=> res!515162 e!424832)))

(assert (=> d!101001 (= res!515162 (bvsge j!159 (size!20563 a!3186)))))

(assert (=> d!101001 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!424832)))

(declare-fun b!761963 () Bool)

(assert (=> b!761963 (= e!424831 call!34996)))

(declare-fun b!761964 () Bool)

(assert (=> b!761964 (= e!424833 call!34996)))

(assert (= (and d!101001 (not res!515162)) b!761961))

(assert (= (and b!761961 c!83787) b!761962))

(assert (= (and b!761961 (not c!83787)) b!761964))

(assert (= (and b!761962 res!515161) b!761963))

(assert (= (or b!761963 b!761964) bm!34993))

(declare-fun m!709375 () Bool)

(assert (=> bm!34993 m!709375))

(assert (=> b!761961 m!709133))

(assert (=> b!761961 m!709133))

(assert (=> b!761961 m!709135))

(assert (=> b!761962 m!709133))

(declare-fun m!709377 () Bool)

(assert (=> b!761962 m!709377))

(declare-fun m!709379 () Bool)

(assert (=> b!761962 m!709379))

(assert (=> b!761962 m!709133))

(assert (=> b!761962 m!709163))

(assert (=> b!761651 d!101001))

(declare-fun d!101003 () Bool)

(assert (=> d!101003 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!339458 () Unit!26317)

(declare-fun choose!38 (array!42073 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26317)

(assert (=> d!101003 (= lt!339458 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!101003 (validMask!0 mask!3328)))

(assert (=> d!101003 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!339458)))

(declare-fun bs!21421 () Bool)

(assert (= bs!21421 d!101003))

(assert (=> bs!21421 m!709157))

(declare-fun m!709389 () Bool)

(assert (=> bs!21421 m!709389))

(assert (=> bs!21421 m!709129))

(assert (=> b!761651 d!101003))

(declare-fun d!101007 () Bool)

(assert (=> d!101007 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!66164 d!101007))

(declare-fun d!101013 () Bool)

(assert (=> d!101013 (= (array_inv!16002 a!3186) (bvsge (size!20563 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!66164 d!101013))

(declare-fun b!761989 () Bool)

(declare-fun e!424852 () SeekEntryResult!7699)

(assert (=> b!761989 (= e!424852 Undefined!7699)))

(declare-fun b!761990 () Bool)

(declare-fun e!424853 () SeekEntryResult!7699)

(declare-fun lt!339461 () SeekEntryResult!7699)

(assert (=> b!761990 (= e!424853 (seekKeyOrZeroReturnVacant!0 (x!64224 lt!339461) (index!33166 lt!339461) (index!33166 lt!339461) (select (arr!20143 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!761991 () Bool)

(declare-fun e!424851 () SeekEntryResult!7699)

(assert (=> b!761991 (= e!424852 e!424851)))

(declare-fun lt!339459 () (_ BitVec 64))

(assert (=> b!761991 (= lt!339459 (select (arr!20143 a!3186) (index!33166 lt!339461)))))

(declare-fun c!83795 () Bool)

(assert (=> b!761991 (= c!83795 (= lt!339459 (select (arr!20143 a!3186) j!159)))))

(declare-fun b!761992 () Bool)

(declare-fun c!83796 () Bool)

(assert (=> b!761992 (= c!83796 (= lt!339459 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!761992 (= e!424851 e!424853)))

(declare-fun d!101015 () Bool)

(declare-fun lt!339460 () SeekEntryResult!7699)

(assert (=> d!101015 (and (or ((_ is Undefined!7699) lt!339460) (not ((_ is Found!7699) lt!339460)) (and (bvsge (index!33165 lt!339460) #b00000000000000000000000000000000) (bvslt (index!33165 lt!339460) (size!20563 a!3186)))) (or ((_ is Undefined!7699) lt!339460) ((_ is Found!7699) lt!339460) (not ((_ is MissingZero!7699) lt!339460)) (and (bvsge (index!33164 lt!339460) #b00000000000000000000000000000000) (bvslt (index!33164 lt!339460) (size!20563 a!3186)))) (or ((_ is Undefined!7699) lt!339460) ((_ is Found!7699) lt!339460) ((_ is MissingZero!7699) lt!339460) (not ((_ is MissingVacant!7699) lt!339460)) (and (bvsge (index!33167 lt!339460) #b00000000000000000000000000000000) (bvslt (index!33167 lt!339460) (size!20563 a!3186)))) (or ((_ is Undefined!7699) lt!339460) (ite ((_ is Found!7699) lt!339460) (= (select (arr!20143 a!3186) (index!33165 lt!339460)) (select (arr!20143 a!3186) j!159)) (ite ((_ is MissingZero!7699) lt!339460) (= (select (arr!20143 a!3186) (index!33164 lt!339460)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7699) lt!339460) (= (select (arr!20143 a!3186) (index!33167 lt!339460)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!101015 (= lt!339460 e!424852)))

(declare-fun c!83794 () Bool)

(assert (=> d!101015 (= c!83794 (and ((_ is Intermediate!7699) lt!339461) (undefined!8511 lt!339461)))))

(assert (=> d!101015 (= lt!339461 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20143 a!3186) j!159) mask!3328) (select (arr!20143 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!101015 (validMask!0 mask!3328)))

(assert (=> d!101015 (= (seekEntryOrOpen!0 (select (arr!20143 a!3186) j!159) a!3186 mask!3328) lt!339460)))

(declare-fun b!761993 () Bool)

(assert (=> b!761993 (= e!424853 (MissingZero!7699 (index!33166 lt!339461)))))

(declare-fun b!761994 () Bool)

(assert (=> b!761994 (= e!424851 (Found!7699 (index!33166 lt!339461)))))

(assert (= (and d!101015 c!83794) b!761989))

(assert (= (and d!101015 (not c!83794)) b!761991))

(assert (= (and b!761991 c!83795) b!761994))

(assert (= (and b!761991 (not c!83795)) b!761992))

(assert (= (and b!761992 c!83796) b!761993))

(assert (= (and b!761992 (not c!83796)) b!761990))

(assert (=> b!761990 m!709133))

(declare-fun m!709399 () Bool)

(assert (=> b!761990 m!709399))

(declare-fun m!709401 () Bool)

(assert (=> b!761991 m!709401))

(declare-fun m!709403 () Bool)

(assert (=> d!101015 m!709403))

(declare-fun m!709405 () Bool)

(assert (=> d!101015 m!709405))

(declare-fun m!709409 () Bool)

(assert (=> d!101015 m!709409))

(assert (=> d!101015 m!709133))

(assert (=> d!101015 m!709165))

(assert (=> d!101015 m!709129))

(assert (=> d!101015 m!709165))

(assert (=> d!101015 m!709133))

(assert (=> d!101015 m!709167))

(assert (=> b!761652 d!101015))

(assert (=> b!761653 d!100979))

(declare-fun b!762001 () Bool)

(declare-fun c!83801 () Bool)

(declare-fun lt!339465 () (_ BitVec 64))

(assert (=> b!762001 (= c!83801 (= lt!339465 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!424857 () SeekEntryResult!7699)

(declare-fun e!424858 () SeekEntryResult!7699)

(assert (=> b!762001 (= e!424857 e!424858)))

(declare-fun b!762002 () Bool)

(assert (=> b!762002 (= e!424858 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) mask!3328) resIntermediateIndex!5 (select (arr!20143 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!762003 () Bool)

(assert (=> b!762003 (= e!424857 (Found!7699 resIntermediateIndex!5))))

(declare-fun b!762004 () Bool)

(declare-fun e!424859 () SeekEntryResult!7699)

(assert (=> b!762004 (= e!424859 Undefined!7699)))

(declare-fun lt!339466 () SeekEntryResult!7699)

(declare-fun d!101019 () Bool)

(assert (=> d!101019 (and (or ((_ is Undefined!7699) lt!339466) (not ((_ is Found!7699) lt!339466)) (and (bvsge (index!33165 lt!339466) #b00000000000000000000000000000000) (bvslt (index!33165 lt!339466) (size!20563 a!3186)))) (or ((_ is Undefined!7699) lt!339466) ((_ is Found!7699) lt!339466) (not ((_ is MissingVacant!7699) lt!339466)) (not (= (index!33167 lt!339466) resIntermediateIndex!5)) (and (bvsge (index!33167 lt!339466) #b00000000000000000000000000000000) (bvslt (index!33167 lt!339466) (size!20563 a!3186)))) (or ((_ is Undefined!7699) lt!339466) (ite ((_ is Found!7699) lt!339466) (= (select (arr!20143 a!3186) (index!33165 lt!339466)) (select (arr!20143 a!3186) j!159)) (and ((_ is MissingVacant!7699) lt!339466) (= (index!33167 lt!339466) resIntermediateIndex!5) (= (select (arr!20143 a!3186) (index!33167 lt!339466)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!101019 (= lt!339466 e!424859)))

(declare-fun c!83800 () Bool)

(assert (=> d!101019 (= c!83800 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(assert (=> d!101019 (= lt!339465 (select (arr!20143 a!3186) resIntermediateIndex!5))))

(assert (=> d!101019 (validMask!0 mask!3328)))

(assert (=> d!101019 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20143 a!3186) j!159) a!3186 mask!3328) lt!339466)))

(declare-fun b!762005 () Bool)

(assert (=> b!762005 (= e!424859 e!424857)))

(declare-fun c!83802 () Bool)

(assert (=> b!762005 (= c!83802 (= lt!339465 (select (arr!20143 a!3186) j!159)))))

(declare-fun b!762006 () Bool)

(assert (=> b!762006 (= e!424858 (MissingVacant!7699 resIntermediateIndex!5))))

(assert (= (and d!101019 c!83800) b!762004))

(assert (= (and d!101019 (not c!83800)) b!762005))

(assert (= (and b!762005 c!83802) b!762003))

(assert (= (and b!762005 (not c!83802)) b!762001))

(assert (= (and b!762001 c!83801) b!762006))

(assert (= (and b!762001 (not c!83801)) b!762002))

(declare-fun m!709419 () Bool)

(assert (=> b!762002 m!709419))

(assert (=> b!762002 m!709419))

(assert (=> b!762002 m!709133))

(declare-fun m!709421 () Bool)

(assert (=> b!762002 m!709421))

(declare-fun m!709423 () Bool)

(assert (=> d!101019 m!709423))

(declare-fun m!709425 () Bool)

(assert (=> d!101019 m!709425))

(assert (=> d!101019 m!709169))

(assert (=> d!101019 m!709129))

(assert (=> b!761643 d!101019))

(declare-fun d!101023 () Bool)

(assert (=> d!101023 (= (validKeyInArray!0 (select (arr!20143 a!3186) j!159)) (and (not (= (select (arr!20143 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20143 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!761655 d!101023))

(declare-fun b!762041 () Bool)

(declare-fun e!424885 () Bool)

(declare-fun e!424886 () Bool)

(assert (=> b!762041 (= e!424885 e!424886)))

(declare-fun res!515187 () Bool)

(assert (=> b!762041 (=> (not res!515187) (not e!424886))))

(declare-fun e!424883 () Bool)

(assert (=> b!762041 (= res!515187 (not e!424883))))

(declare-fun res!515188 () Bool)

(assert (=> b!762041 (=> (not res!515188) (not e!424883))))

(assert (=> b!762041 (= res!515188 (validKeyInArray!0 (select (arr!20143 a!3186) #b00000000000000000000000000000000)))))

(declare-fun d!101025 () Bool)

(declare-fun res!515189 () Bool)

(assert (=> d!101025 (=> res!515189 e!424885)))

(assert (=> d!101025 (= res!515189 (bvsge #b00000000000000000000000000000000 (size!20563 a!3186)))))

(assert (=> d!101025 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14049) e!424885)))

(declare-fun bm!34999 () Bool)

(declare-fun call!35002 () Bool)

(declare-fun c!83814 () Bool)

(assert (=> bm!34999 (= call!35002 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!83814 (Cons!14048 (select (arr!20143 a!3186) #b00000000000000000000000000000000) Nil!14049) Nil!14049)))))

(declare-fun b!762042 () Bool)

(declare-fun contains!4049 (List!14052 (_ BitVec 64)) Bool)

(assert (=> b!762042 (= e!424883 (contains!4049 Nil!14049 (select (arr!20143 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!762043 () Bool)

(declare-fun e!424884 () Bool)

(assert (=> b!762043 (= e!424886 e!424884)))

(assert (=> b!762043 (= c!83814 (validKeyInArray!0 (select (arr!20143 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!762044 () Bool)

(assert (=> b!762044 (= e!424884 call!35002)))

(declare-fun b!762045 () Bool)

(assert (=> b!762045 (= e!424884 call!35002)))

(assert (= (and d!101025 (not res!515189)) b!762041))

(assert (= (and b!762041 res!515188) b!762042))

(assert (= (and b!762041 res!515187) b!762043))

(assert (= (and b!762043 c!83814) b!762044))

(assert (= (and b!762043 (not c!83814)) b!762045))

(assert (= (or b!762044 b!762045) bm!34999))

(assert (=> b!762041 m!709281))

(assert (=> b!762041 m!709281))

(assert (=> b!762041 m!709367))

(assert (=> bm!34999 m!709281))

(declare-fun m!709443 () Bool)

(assert (=> bm!34999 m!709443))

(assert (=> b!762042 m!709281))

(assert (=> b!762042 m!709281))

(declare-fun m!709445 () Bool)

(assert (=> b!762042 m!709445))

(assert (=> b!762043 m!709281))

(assert (=> b!762043 m!709281))

(assert (=> b!762043 m!709367))

(assert (=> b!761644 d!101025))

(check-sat (not d!100989) (not b!761815) (not b!762043) (not bm!34999) (not bm!34993) (not bm!34992) (not d!101019) (not d!100991) (not b!761828) (not b!761782) (not b!761908) (not d!100971) (not b!762002) (not d!100979) (not b!761890) (not b!761792) (not d!100965) (not b!762042) (not b!761961) (not b!761990) (not d!101003) (not b!761899) (not b!761962) (not b!761952) (not d!101015) (not b!762041) (not d!100961) (not b!761951))
(check-sat)
