; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66664 () Bool)

(assert start!66664)

(declare-fun res!519653 () Bool)

(declare-fun e!427797 () Bool)

(assert (=> start!66664 (=> (not res!519653) (not e!427797))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66664 (= res!519653 (validMask!0 mask!3328))))

(assert (=> start!66664 e!427797))

(assert (=> start!66664 true))

(declare-datatypes ((array!42305 0))(
  ( (array!42306 (arr!20254 (Array (_ BitVec 32) (_ BitVec 64))) (size!20675 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42305)

(declare-fun array_inv!16050 (array!42305) Bool)

(assert (=> start!66664 (array_inv!16050 a!3186)))

(declare-fun b!768235 () Bool)

(declare-fun e!427803 () Bool)

(declare-fun e!427798 () Bool)

(assert (=> b!768235 (= e!427803 e!427798)))

(declare-fun res!519663 () Bool)

(assert (=> b!768235 (=> (not res!519663) (not e!427798))))

(declare-datatypes ((SeekEntryResult!7854 0))(
  ( (MissingZero!7854 (index!33784 (_ BitVec 32))) (Found!7854 (index!33785 (_ BitVec 32))) (Intermediate!7854 (undefined!8666 Bool) (index!33786 (_ BitVec 32)) (x!64708 (_ BitVec 32))) (Undefined!7854) (MissingVacant!7854 (index!33787 (_ BitVec 32))) )
))
(declare-fun lt!341771 () SeekEntryResult!7854)

(declare-fun lt!341762 () SeekEntryResult!7854)

(assert (=> b!768235 (= res!519663 (= lt!341771 lt!341762))))

(declare-fun lt!341768 () (_ BitVec 64))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!341766 () array!42305)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42305 (_ BitVec 32)) SeekEntryResult!7854)

(assert (=> b!768235 (= lt!341762 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!341768 lt!341766 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!768235 (= lt!341771 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!341768 mask!3328) lt!341768 lt!341766 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!768235 (= lt!341768 (select (store (arr!20254 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!768235 (= lt!341766 (array!42306 (store (arr!20254 a!3186) i!1173 k0!2102) (size!20675 a!3186)))))

(declare-fun b!768236 () Bool)

(declare-fun res!519654 () Bool)

(assert (=> b!768236 (=> (not res!519654) (not e!427797))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!768236 (= res!519654 (validKeyInArray!0 (select (arr!20254 a!3186) j!159)))))

(declare-fun b!768237 () Bool)

(declare-fun e!427796 () Bool)

(assert (=> b!768237 (= e!427797 e!427796)))

(declare-fun res!519659 () Bool)

(assert (=> b!768237 (=> (not res!519659) (not e!427796))))

(declare-fun lt!341763 () SeekEntryResult!7854)

(assert (=> b!768237 (= res!519659 (or (= lt!341763 (MissingZero!7854 i!1173)) (= lt!341763 (MissingVacant!7854 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42305 (_ BitVec 32)) SeekEntryResult!7854)

(assert (=> b!768237 (= lt!341763 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!768238 () Bool)

(declare-fun res!519658 () Bool)

(declare-fun e!427794 () Bool)

(assert (=> b!768238 (=> res!519658 e!427794)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun lt!341770 () SeekEntryResult!7854)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42305 (_ BitVec 32)) SeekEntryResult!7854)

(assert (=> b!768238 (= res!519658 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20254 a!3186) j!159) a!3186 mask!3328) lt!341770))))

(declare-fun e!427795 () Bool)

(declare-fun lt!341769 () SeekEntryResult!7854)

(declare-fun b!768239 () Bool)

(assert (=> b!768239 (= e!427795 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20254 a!3186) j!159) a!3186 mask!3328) lt!341769))))

(declare-fun b!768240 () Bool)

(declare-fun e!427800 () Bool)

(assert (=> b!768240 (= e!427800 e!427794)))

(declare-fun res!519665 () Bool)

(assert (=> b!768240 (=> res!519665 e!427794)))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!768240 (= res!519665 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!341765 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!768240 (= lt!341765 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!768241 () Bool)

(assert (=> b!768241 (= e!427795 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20254 a!3186) j!159) a!3186 mask!3328) (Found!7854 j!159)))))

(declare-fun b!768242 () Bool)

(declare-fun res!519650 () Bool)

(assert (=> b!768242 (=> (not res!519650) (not e!427803))))

(assert (=> b!768242 (= res!519650 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20254 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!768243 () Bool)

(declare-fun res!519660 () Bool)

(assert (=> b!768243 (=> (not res!519660) (not e!427797))))

(declare-fun arrayContainsKey!0 (array!42305 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!768243 (= res!519660 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!768244 () Bool)

(declare-fun res!519666 () Bool)

(assert (=> b!768244 (=> (not res!519666) (not e!427797))))

(assert (=> b!768244 (= res!519666 (validKeyInArray!0 k0!2102))))

(declare-fun b!768245 () Bool)

(declare-fun res!519655 () Bool)

(assert (=> b!768245 (=> (not res!519655) (not e!427803))))

(assert (=> b!768245 (= res!519655 e!427795)))

(declare-fun c!84685 () Bool)

(assert (=> b!768245 (= c!84685 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!768246 () Bool)

(assert (=> b!768246 (= e!427794 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!341765 resIntermediateIndex!5 (select (arr!20254 a!3186) j!159) a!3186 mask!3328) lt!341770))))

(declare-fun b!768247 () Bool)

(declare-fun res!519662 () Bool)

(assert (=> b!768247 (=> (not res!519662) (not e!427796))))

(assert (=> b!768247 (= res!519662 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20675 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20675 a!3186))))))

(declare-fun b!768248 () Bool)

(declare-fun res!519652 () Bool)

(assert (=> b!768248 (=> (not res!519652) (not e!427797))))

(assert (=> b!768248 (= res!519652 (and (= (size!20675 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20675 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20675 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!768249 () Bool)

(declare-fun res!519651 () Bool)

(assert (=> b!768249 (=> (not res!519651) (not e!427796))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42305 (_ BitVec 32)) Bool)

(assert (=> b!768249 (= res!519651 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun lt!341767 () SeekEntryResult!7854)

(declare-fun e!427799 () Bool)

(declare-fun b!768250 () Bool)

(assert (=> b!768250 (= e!427799 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20254 a!3186) j!159) a!3186 mask!3328) lt!341767))))

(declare-fun b!768251 () Bool)

(declare-fun res!519664 () Bool)

(assert (=> b!768251 (=> (not res!519664) (not e!427796))))

(declare-datatypes ((List!14256 0))(
  ( (Nil!14253) (Cons!14252 (h!15348 (_ BitVec 64)) (t!20571 List!14256)) )
))
(declare-fun arrayNoDuplicates!0 (array!42305 (_ BitVec 32) List!14256) Bool)

(assert (=> b!768251 (= res!519664 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14253))))

(declare-fun b!768252 () Bool)

(declare-fun e!427802 () Bool)

(assert (=> b!768252 (= e!427802 e!427799)))

(declare-fun res!519657 () Bool)

(assert (=> b!768252 (=> (not res!519657) (not e!427799))))

(assert (=> b!768252 (= res!519657 (= (seekEntryOrOpen!0 (select (arr!20254 a!3186) j!159) a!3186 mask!3328) lt!341767))))

(assert (=> b!768252 (= lt!341767 (Found!7854 j!159))))

(declare-fun b!768253 () Bool)

(assert (=> b!768253 (= e!427796 e!427803)))

(declare-fun res!519661 () Bool)

(assert (=> b!768253 (=> (not res!519661) (not e!427803))))

(assert (=> b!768253 (= res!519661 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20254 a!3186) j!159) mask!3328) (select (arr!20254 a!3186) j!159) a!3186 mask!3328) lt!341769))))

(assert (=> b!768253 (= lt!341769 (Intermediate!7854 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!768254 () Bool)

(assert (=> b!768254 (= e!427798 (not e!427800))))

(declare-fun res!519656 () Bool)

(assert (=> b!768254 (=> res!519656 e!427800)))

(get-info :version)

(assert (=> b!768254 (= res!519656 (or (not ((_ is Intermediate!7854) lt!341762)) (bvsge x!1131 (x!64708 lt!341762))))))

(assert (=> b!768254 (= lt!341770 (Found!7854 j!159))))

(assert (=> b!768254 e!427802))

(declare-fun res!519667 () Bool)

(assert (=> b!768254 (=> (not res!519667) (not e!427802))))

(assert (=> b!768254 (= res!519667 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26434 0))(
  ( (Unit!26435) )
))
(declare-fun lt!341764 () Unit!26434)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42305 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26434)

(assert (=> b!768254 (= lt!341764 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (= (and start!66664 res!519653) b!768248))

(assert (= (and b!768248 res!519652) b!768236))

(assert (= (and b!768236 res!519654) b!768244))

(assert (= (and b!768244 res!519666) b!768243))

(assert (= (and b!768243 res!519660) b!768237))

(assert (= (and b!768237 res!519659) b!768249))

(assert (= (and b!768249 res!519651) b!768251))

(assert (= (and b!768251 res!519664) b!768247))

(assert (= (and b!768247 res!519662) b!768253))

(assert (= (and b!768253 res!519661) b!768242))

(assert (= (and b!768242 res!519650) b!768245))

(assert (= (and b!768245 c!84685) b!768239))

(assert (= (and b!768245 (not c!84685)) b!768241))

(assert (= (and b!768245 res!519655) b!768235))

(assert (= (and b!768235 res!519663) b!768254))

(assert (= (and b!768254 res!519667) b!768252))

(assert (= (and b!768252 res!519657) b!768250))

(assert (= (and b!768254 (not res!519656)) b!768240))

(assert (= (and b!768240 (not res!519665)) b!768238))

(assert (= (and b!768238 (not res!519658)) b!768246))

(declare-fun m!713825 () Bool)

(assert (=> start!66664 m!713825))

(declare-fun m!713827 () Bool)

(assert (=> start!66664 m!713827))

(declare-fun m!713829 () Bool)

(assert (=> b!768249 m!713829))

(declare-fun m!713831 () Bool)

(assert (=> b!768243 m!713831))

(declare-fun m!713833 () Bool)

(assert (=> b!768236 m!713833))

(assert (=> b!768236 m!713833))

(declare-fun m!713835 () Bool)

(assert (=> b!768236 m!713835))

(declare-fun m!713837 () Bool)

(assert (=> b!768235 m!713837))

(declare-fun m!713839 () Bool)

(assert (=> b!768235 m!713839))

(assert (=> b!768235 m!713837))

(declare-fun m!713841 () Bool)

(assert (=> b!768235 m!713841))

(declare-fun m!713843 () Bool)

(assert (=> b!768235 m!713843))

(declare-fun m!713845 () Bool)

(assert (=> b!768235 m!713845))

(assert (=> b!768250 m!713833))

(assert (=> b!768250 m!713833))

(declare-fun m!713847 () Bool)

(assert (=> b!768250 m!713847))

(declare-fun m!713849 () Bool)

(assert (=> b!768237 m!713849))

(declare-fun m!713851 () Bool)

(assert (=> b!768251 m!713851))

(declare-fun m!713853 () Bool)

(assert (=> b!768242 m!713853))

(assert (=> b!768246 m!713833))

(assert (=> b!768246 m!713833))

(declare-fun m!713855 () Bool)

(assert (=> b!768246 m!713855))

(assert (=> b!768252 m!713833))

(assert (=> b!768252 m!713833))

(declare-fun m!713857 () Bool)

(assert (=> b!768252 m!713857))

(declare-fun m!713859 () Bool)

(assert (=> b!768254 m!713859))

(declare-fun m!713861 () Bool)

(assert (=> b!768254 m!713861))

(declare-fun m!713863 () Bool)

(assert (=> b!768240 m!713863))

(assert (=> b!768238 m!713833))

(assert (=> b!768238 m!713833))

(declare-fun m!713865 () Bool)

(assert (=> b!768238 m!713865))

(declare-fun m!713867 () Bool)

(assert (=> b!768244 m!713867))

(assert (=> b!768253 m!713833))

(assert (=> b!768253 m!713833))

(declare-fun m!713869 () Bool)

(assert (=> b!768253 m!713869))

(assert (=> b!768253 m!713869))

(assert (=> b!768253 m!713833))

(declare-fun m!713871 () Bool)

(assert (=> b!768253 m!713871))

(assert (=> b!768239 m!713833))

(assert (=> b!768239 m!713833))

(declare-fun m!713873 () Bool)

(assert (=> b!768239 m!713873))

(assert (=> b!768241 m!713833))

(assert (=> b!768241 m!713833))

(assert (=> b!768241 m!713865))

(check-sat (not b!768249) (not b!768241) (not b!768252) (not b!768253) (not b!768239) (not b!768236) (not b!768240) (not b!768254) (not b!768235) (not b!768243) (not b!768238) (not b!768244) (not b!768251) (not start!66664) (not b!768250) (not b!768237) (not b!768246))
(check-sat)
(get-model)

(declare-fun d!101479 () Bool)

(declare-fun res!519726 () Bool)

(declare-fun e!427838 () Bool)

(assert (=> d!101479 (=> res!519726 e!427838)))

(assert (=> d!101479 (= res!519726 (= (select (arr!20254 a!3186) #b00000000000000000000000000000000) k0!2102))))

(assert (=> d!101479 (= (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000) e!427838)))

(declare-fun b!768319 () Bool)

(declare-fun e!427839 () Bool)

(assert (=> b!768319 (= e!427838 e!427839)))

(declare-fun res!519727 () Bool)

(assert (=> b!768319 (=> (not res!519727) (not e!427839))))

(assert (=> b!768319 (= res!519727 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20675 a!3186)))))

(declare-fun b!768320 () Bool)

(assert (=> b!768320 (= e!427839 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!101479 (not res!519726)) b!768319))

(assert (= (and b!768319 res!519727) b!768320))

(declare-fun m!713925 () Bool)

(assert (=> d!101479 m!713925))

(declare-fun m!713927 () Bool)

(assert (=> b!768320 m!713927))

(assert (=> b!768243 d!101479))

(declare-fun d!101481 () Bool)

(declare-fun res!519732 () Bool)

(declare-fun e!427848 () Bool)

(assert (=> d!101481 (=> res!519732 e!427848)))

(assert (=> d!101481 (= res!519732 (bvsge j!159 (size!20675 a!3186)))))

(assert (=> d!101481 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!427848)))

(declare-fun b!768329 () Bool)

(declare-fun e!427847 () Bool)

(declare-fun e!427846 () Bool)

(assert (=> b!768329 (= e!427847 e!427846)))

(declare-fun lt!341810 () (_ BitVec 64))

(assert (=> b!768329 (= lt!341810 (select (arr!20254 a!3186) j!159))))

(declare-fun lt!341809 () Unit!26434)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42305 (_ BitVec 64) (_ BitVec 32)) Unit!26434)

(assert (=> b!768329 (= lt!341809 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!341810 j!159))))

(assert (=> b!768329 (arrayContainsKey!0 a!3186 lt!341810 #b00000000000000000000000000000000)))

(declare-fun lt!341808 () Unit!26434)

(assert (=> b!768329 (= lt!341808 lt!341809)))

(declare-fun res!519733 () Bool)

(assert (=> b!768329 (= res!519733 (= (seekEntryOrOpen!0 (select (arr!20254 a!3186) j!159) a!3186 mask!3328) (Found!7854 j!159)))))

(assert (=> b!768329 (=> (not res!519733) (not e!427846))))

(declare-fun b!768330 () Bool)

(declare-fun call!35088 () Bool)

(assert (=> b!768330 (= e!427846 call!35088)))

(declare-fun b!768331 () Bool)

(assert (=> b!768331 (= e!427848 e!427847)))

(declare-fun c!84691 () Bool)

(assert (=> b!768331 (= c!84691 (validKeyInArray!0 (select (arr!20254 a!3186) j!159)))))

(declare-fun bm!35085 () Bool)

(assert (=> bm!35085 (= call!35088 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!768332 () Bool)

(assert (=> b!768332 (= e!427847 call!35088)))

(assert (= (and d!101481 (not res!519732)) b!768331))

(assert (= (and b!768331 c!84691) b!768329))

(assert (= (and b!768331 (not c!84691)) b!768332))

(assert (= (and b!768329 res!519733) b!768330))

(assert (= (or b!768330 b!768332) bm!35085))

(assert (=> b!768329 m!713833))

(declare-fun m!713929 () Bool)

(assert (=> b!768329 m!713929))

(declare-fun m!713931 () Bool)

(assert (=> b!768329 m!713931))

(assert (=> b!768329 m!713833))

(assert (=> b!768329 m!713857))

(assert (=> b!768331 m!713833))

(assert (=> b!768331 m!713833))

(assert (=> b!768331 m!713835))

(declare-fun m!713933 () Bool)

(assert (=> bm!35085 m!713933))

(assert (=> b!768254 d!101481))

(declare-fun d!101483 () Bool)

(assert (=> d!101483 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!341813 () Unit!26434)

(declare-fun choose!38 (array!42305 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26434)

(assert (=> d!101483 (= lt!341813 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!101483 (validMask!0 mask!3328)))

(assert (=> d!101483 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!341813)))

(declare-fun bs!21534 () Bool)

(assert (= bs!21534 d!101483))

(assert (=> bs!21534 m!713859))

(declare-fun m!713935 () Bool)

(assert (=> bs!21534 m!713935))

(assert (=> bs!21534 m!713825))

(assert (=> b!768254 d!101483))

(declare-fun d!101485 () Bool)

(declare-fun e!427859 () Bool)

(assert (=> d!101485 e!427859))

(declare-fun c!84700 () Bool)

(declare-fun lt!341818 () SeekEntryResult!7854)

(assert (=> d!101485 (= c!84700 (and ((_ is Intermediate!7854) lt!341818) (undefined!8666 lt!341818)))))

(declare-fun e!427860 () SeekEntryResult!7854)

(assert (=> d!101485 (= lt!341818 e!427860)))

(declare-fun c!84699 () Bool)

(assert (=> d!101485 (= c!84699 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!341819 () (_ BitVec 64))

(assert (=> d!101485 (= lt!341819 (select (arr!20254 a!3186) (toIndex!0 (select (arr!20254 a!3186) j!159) mask!3328)))))

(assert (=> d!101485 (validMask!0 mask!3328)))

(assert (=> d!101485 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20254 a!3186) j!159) mask!3328) (select (arr!20254 a!3186) j!159) a!3186 mask!3328) lt!341818)))

(declare-fun b!768351 () Bool)

(declare-fun e!427862 () Bool)

(assert (=> b!768351 (= e!427859 e!427862)))

(declare-fun res!519742 () Bool)

(assert (=> b!768351 (= res!519742 (and ((_ is Intermediate!7854) lt!341818) (not (undefined!8666 lt!341818)) (bvslt (x!64708 lt!341818) #b01111111111111111111111111111110) (bvsge (x!64708 lt!341818) #b00000000000000000000000000000000) (bvsge (x!64708 lt!341818) #b00000000000000000000000000000000)))))

(assert (=> b!768351 (=> (not res!519742) (not e!427862))))

(declare-fun b!768352 () Bool)

(declare-fun e!427863 () SeekEntryResult!7854)

(assert (=> b!768352 (= e!427863 (Intermediate!7854 false (toIndex!0 (select (arr!20254 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!768353 () Bool)

(assert (=> b!768353 (= e!427859 (bvsge (x!64708 lt!341818) #b01111111111111111111111111111110))))

(declare-fun b!768354 () Bool)

(assert (=> b!768354 (= e!427860 e!427863)))

(declare-fun c!84698 () Bool)

(assert (=> b!768354 (= c!84698 (or (= lt!341819 (select (arr!20254 a!3186) j!159)) (= (bvadd lt!341819 lt!341819) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!768355 () Bool)

(assert (=> b!768355 (= e!427863 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20254 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!20254 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!768356 () Bool)

(assert (=> b!768356 (and (bvsge (index!33786 lt!341818) #b00000000000000000000000000000000) (bvslt (index!33786 lt!341818) (size!20675 a!3186)))))

(declare-fun res!519740 () Bool)

(assert (=> b!768356 (= res!519740 (= (select (arr!20254 a!3186) (index!33786 lt!341818)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!427861 () Bool)

(assert (=> b!768356 (=> res!519740 e!427861)))

(declare-fun b!768357 () Bool)

(assert (=> b!768357 (and (bvsge (index!33786 lt!341818) #b00000000000000000000000000000000) (bvslt (index!33786 lt!341818) (size!20675 a!3186)))))

(assert (=> b!768357 (= e!427861 (= (select (arr!20254 a!3186) (index!33786 lt!341818)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!768358 () Bool)

(assert (=> b!768358 (and (bvsge (index!33786 lt!341818) #b00000000000000000000000000000000) (bvslt (index!33786 lt!341818) (size!20675 a!3186)))))

(declare-fun res!519741 () Bool)

(assert (=> b!768358 (= res!519741 (= (select (arr!20254 a!3186) (index!33786 lt!341818)) (select (arr!20254 a!3186) j!159)))))

(assert (=> b!768358 (=> res!519741 e!427861)))

(assert (=> b!768358 (= e!427862 e!427861)))

(declare-fun b!768359 () Bool)

(assert (=> b!768359 (= e!427860 (Intermediate!7854 true (toIndex!0 (select (arr!20254 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(assert (= (and d!101485 c!84699) b!768359))

(assert (= (and d!101485 (not c!84699)) b!768354))

(assert (= (and b!768354 c!84698) b!768352))

(assert (= (and b!768354 (not c!84698)) b!768355))

(assert (= (and d!101485 c!84700) b!768353))

(assert (= (and d!101485 (not c!84700)) b!768351))

(assert (= (and b!768351 res!519742) b!768358))

(assert (= (and b!768358 (not res!519741)) b!768356))

(assert (= (and b!768356 (not res!519740)) b!768357))

(declare-fun m!713937 () Bool)

(assert (=> b!768358 m!713937))

(assert (=> b!768356 m!713937))

(assert (=> d!101485 m!713869))

(declare-fun m!713939 () Bool)

(assert (=> d!101485 m!713939))

(assert (=> d!101485 m!713825))

(assert (=> b!768357 m!713937))

(assert (=> b!768355 m!713869))

(declare-fun m!713941 () Bool)

(assert (=> b!768355 m!713941))

(assert (=> b!768355 m!713941))

(assert (=> b!768355 m!713833))

(declare-fun m!713943 () Bool)

(assert (=> b!768355 m!713943))

(assert (=> b!768253 d!101485))

(declare-fun d!101487 () Bool)

(declare-fun lt!341825 () (_ BitVec 32))

(declare-fun lt!341824 () (_ BitVec 32))

(assert (=> d!101487 (= lt!341825 (bvmul (bvxor lt!341824 (bvlshr lt!341824 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!101487 (= lt!341824 ((_ extract 31 0) (bvand (bvxor (select (arr!20254 a!3186) j!159) (bvlshr (select (arr!20254 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!101487 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!519743 (let ((h!15350 ((_ extract 31 0) (bvand (bvxor (select (arr!20254 a!3186) j!159) (bvlshr (select (arr!20254 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64711 (bvmul (bvxor h!15350 (bvlshr h!15350 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64711 (bvlshr x!64711 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!519743 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!519743 #b00000000000000000000000000000000))))))

(assert (=> d!101487 (= (toIndex!0 (select (arr!20254 a!3186) j!159) mask!3328) (bvand (bvxor lt!341825 (bvlshr lt!341825 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!768253 d!101487))

(declare-fun d!101489 () Bool)

(assert (=> d!101489 (= (validKeyInArray!0 k0!2102) (and (not (= k0!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!768244 d!101489))

(declare-fun d!101491 () Bool)

(declare-fun e!427864 () Bool)

(assert (=> d!101491 e!427864))

(declare-fun c!84703 () Bool)

(declare-fun lt!341826 () SeekEntryResult!7854)

(assert (=> d!101491 (= c!84703 (and ((_ is Intermediate!7854) lt!341826) (undefined!8666 lt!341826)))))

(declare-fun e!427865 () SeekEntryResult!7854)

(assert (=> d!101491 (= lt!341826 e!427865)))

(declare-fun c!84702 () Bool)

(assert (=> d!101491 (= c!84702 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!341827 () (_ BitVec 64))

(assert (=> d!101491 (= lt!341827 (select (arr!20254 lt!341766) index!1321))))

(assert (=> d!101491 (validMask!0 mask!3328)))

(assert (=> d!101491 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!341768 lt!341766 mask!3328) lt!341826)))

(declare-fun b!768360 () Bool)

(declare-fun e!427867 () Bool)

(assert (=> b!768360 (= e!427864 e!427867)))

(declare-fun res!519746 () Bool)

(assert (=> b!768360 (= res!519746 (and ((_ is Intermediate!7854) lt!341826) (not (undefined!8666 lt!341826)) (bvslt (x!64708 lt!341826) #b01111111111111111111111111111110) (bvsge (x!64708 lt!341826) #b00000000000000000000000000000000) (bvsge (x!64708 lt!341826) x!1131)))))

(assert (=> b!768360 (=> (not res!519746) (not e!427867))))

(declare-fun b!768361 () Bool)

(declare-fun e!427868 () SeekEntryResult!7854)

(assert (=> b!768361 (= e!427868 (Intermediate!7854 false index!1321 x!1131))))

(declare-fun b!768362 () Bool)

(assert (=> b!768362 (= e!427864 (bvsge (x!64708 lt!341826) #b01111111111111111111111111111110))))

(declare-fun b!768363 () Bool)

(assert (=> b!768363 (= e!427865 e!427868)))

(declare-fun c!84701 () Bool)

(assert (=> b!768363 (= c!84701 (or (= lt!341827 lt!341768) (= (bvadd lt!341827 lt!341827) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!768364 () Bool)

(assert (=> b!768364 (= e!427868 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!341768 lt!341766 mask!3328))))

(declare-fun b!768365 () Bool)

(assert (=> b!768365 (and (bvsge (index!33786 lt!341826) #b00000000000000000000000000000000) (bvslt (index!33786 lt!341826) (size!20675 lt!341766)))))

(declare-fun res!519744 () Bool)

(assert (=> b!768365 (= res!519744 (= (select (arr!20254 lt!341766) (index!33786 lt!341826)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!427866 () Bool)

(assert (=> b!768365 (=> res!519744 e!427866)))

(declare-fun b!768366 () Bool)

(assert (=> b!768366 (and (bvsge (index!33786 lt!341826) #b00000000000000000000000000000000) (bvslt (index!33786 lt!341826) (size!20675 lt!341766)))))

(assert (=> b!768366 (= e!427866 (= (select (arr!20254 lt!341766) (index!33786 lt!341826)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!768367 () Bool)

(assert (=> b!768367 (and (bvsge (index!33786 lt!341826) #b00000000000000000000000000000000) (bvslt (index!33786 lt!341826) (size!20675 lt!341766)))))

(declare-fun res!519745 () Bool)

(assert (=> b!768367 (= res!519745 (= (select (arr!20254 lt!341766) (index!33786 lt!341826)) lt!341768))))

(assert (=> b!768367 (=> res!519745 e!427866)))

(assert (=> b!768367 (= e!427867 e!427866)))

(declare-fun b!768368 () Bool)

(assert (=> b!768368 (= e!427865 (Intermediate!7854 true index!1321 x!1131))))

(assert (= (and d!101491 c!84702) b!768368))

(assert (= (and d!101491 (not c!84702)) b!768363))

(assert (= (and b!768363 c!84701) b!768361))

(assert (= (and b!768363 (not c!84701)) b!768364))

(assert (= (and d!101491 c!84703) b!768362))

(assert (= (and d!101491 (not c!84703)) b!768360))

(assert (= (and b!768360 res!519746) b!768367))

(assert (= (and b!768367 (not res!519745)) b!768365))

(assert (= (and b!768365 (not res!519744)) b!768366))

(declare-fun m!713945 () Bool)

(assert (=> b!768367 m!713945))

(assert (=> b!768365 m!713945))

(declare-fun m!713947 () Bool)

(assert (=> d!101491 m!713947))

(assert (=> d!101491 m!713825))

(assert (=> b!768366 m!713945))

(assert (=> b!768364 m!713863))

(assert (=> b!768364 m!713863))

(declare-fun m!713949 () Bool)

(assert (=> b!768364 m!713949))

(assert (=> b!768235 d!101491))

(declare-fun d!101493 () Bool)

(declare-fun e!427869 () Bool)

(assert (=> d!101493 e!427869))

(declare-fun c!84706 () Bool)

(declare-fun lt!341828 () SeekEntryResult!7854)

(assert (=> d!101493 (= c!84706 (and ((_ is Intermediate!7854) lt!341828) (undefined!8666 lt!341828)))))

(declare-fun e!427870 () SeekEntryResult!7854)

(assert (=> d!101493 (= lt!341828 e!427870)))

(declare-fun c!84705 () Bool)

(assert (=> d!101493 (= c!84705 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!341829 () (_ BitVec 64))

(assert (=> d!101493 (= lt!341829 (select (arr!20254 lt!341766) (toIndex!0 lt!341768 mask!3328)))))

(assert (=> d!101493 (validMask!0 mask!3328)))

(assert (=> d!101493 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!341768 mask!3328) lt!341768 lt!341766 mask!3328) lt!341828)))

(declare-fun b!768369 () Bool)

(declare-fun e!427872 () Bool)

(assert (=> b!768369 (= e!427869 e!427872)))

(declare-fun res!519749 () Bool)

(assert (=> b!768369 (= res!519749 (and ((_ is Intermediate!7854) lt!341828) (not (undefined!8666 lt!341828)) (bvslt (x!64708 lt!341828) #b01111111111111111111111111111110) (bvsge (x!64708 lt!341828) #b00000000000000000000000000000000) (bvsge (x!64708 lt!341828) #b00000000000000000000000000000000)))))

(assert (=> b!768369 (=> (not res!519749) (not e!427872))))

(declare-fun b!768370 () Bool)

(declare-fun e!427873 () SeekEntryResult!7854)

(assert (=> b!768370 (= e!427873 (Intermediate!7854 false (toIndex!0 lt!341768 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!768371 () Bool)

(assert (=> b!768371 (= e!427869 (bvsge (x!64708 lt!341828) #b01111111111111111111111111111110))))

(declare-fun b!768372 () Bool)

(assert (=> b!768372 (= e!427870 e!427873)))

(declare-fun c!84704 () Bool)

(assert (=> b!768372 (= c!84704 (or (= lt!341829 lt!341768) (= (bvadd lt!341829 lt!341829) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!768373 () Bool)

(assert (=> b!768373 (= e!427873 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!341768 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!341768 lt!341766 mask!3328))))

(declare-fun b!768374 () Bool)

(assert (=> b!768374 (and (bvsge (index!33786 lt!341828) #b00000000000000000000000000000000) (bvslt (index!33786 lt!341828) (size!20675 lt!341766)))))

(declare-fun res!519747 () Bool)

(assert (=> b!768374 (= res!519747 (= (select (arr!20254 lt!341766) (index!33786 lt!341828)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!427871 () Bool)

(assert (=> b!768374 (=> res!519747 e!427871)))

(declare-fun b!768375 () Bool)

(assert (=> b!768375 (and (bvsge (index!33786 lt!341828) #b00000000000000000000000000000000) (bvslt (index!33786 lt!341828) (size!20675 lt!341766)))))

(assert (=> b!768375 (= e!427871 (= (select (arr!20254 lt!341766) (index!33786 lt!341828)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!768376 () Bool)

(assert (=> b!768376 (and (bvsge (index!33786 lt!341828) #b00000000000000000000000000000000) (bvslt (index!33786 lt!341828) (size!20675 lt!341766)))))

(declare-fun res!519748 () Bool)

(assert (=> b!768376 (= res!519748 (= (select (arr!20254 lt!341766) (index!33786 lt!341828)) lt!341768))))

(assert (=> b!768376 (=> res!519748 e!427871)))

(assert (=> b!768376 (= e!427872 e!427871)))

(declare-fun b!768377 () Bool)

(assert (=> b!768377 (= e!427870 (Intermediate!7854 true (toIndex!0 lt!341768 mask!3328) #b00000000000000000000000000000000))))

(assert (= (and d!101493 c!84705) b!768377))

(assert (= (and d!101493 (not c!84705)) b!768372))

(assert (= (and b!768372 c!84704) b!768370))

(assert (= (and b!768372 (not c!84704)) b!768373))

(assert (= (and d!101493 c!84706) b!768371))

(assert (= (and d!101493 (not c!84706)) b!768369))

(assert (= (and b!768369 res!519749) b!768376))

(assert (= (and b!768376 (not res!519748)) b!768374))

(assert (= (and b!768374 (not res!519747)) b!768375))

(declare-fun m!713951 () Bool)

(assert (=> b!768376 m!713951))

(assert (=> b!768374 m!713951))

(assert (=> d!101493 m!713837))

(declare-fun m!713953 () Bool)

(assert (=> d!101493 m!713953))

(assert (=> d!101493 m!713825))

(assert (=> b!768375 m!713951))

(assert (=> b!768373 m!713837))

(declare-fun m!713955 () Bool)

(assert (=> b!768373 m!713955))

(assert (=> b!768373 m!713955))

(declare-fun m!713957 () Bool)

(assert (=> b!768373 m!713957))

(assert (=> b!768235 d!101493))

(declare-fun d!101495 () Bool)

(declare-fun lt!341831 () (_ BitVec 32))

(declare-fun lt!341830 () (_ BitVec 32))

(assert (=> d!101495 (= lt!341831 (bvmul (bvxor lt!341830 (bvlshr lt!341830 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!101495 (= lt!341830 ((_ extract 31 0) (bvand (bvxor lt!341768 (bvlshr lt!341768 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!101495 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!519743 (let ((h!15350 ((_ extract 31 0) (bvand (bvxor lt!341768 (bvlshr lt!341768 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64711 (bvmul (bvxor h!15350 (bvlshr h!15350 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64711 (bvlshr x!64711 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!519743 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!519743 #b00000000000000000000000000000000))))))

(assert (=> d!101495 (= (toIndex!0 lt!341768 mask!3328) (bvand (bvxor lt!341831 (bvlshr lt!341831 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!768235 d!101495))

(declare-fun b!768408 () Bool)

(declare-fun e!427897 () SeekEntryResult!7854)

(assert (=> b!768408 (= e!427897 (MissingVacant!7854 resIntermediateIndex!5))))

(declare-fun b!768409 () Bool)

(declare-fun e!427896 () SeekEntryResult!7854)

(assert (=> b!768409 (= e!427896 (Found!7854 lt!341765))))

(declare-fun lt!341845 () SeekEntryResult!7854)

(declare-fun d!101499 () Bool)

(assert (=> d!101499 (and (or ((_ is Undefined!7854) lt!341845) (not ((_ is Found!7854) lt!341845)) (and (bvsge (index!33785 lt!341845) #b00000000000000000000000000000000) (bvslt (index!33785 lt!341845) (size!20675 a!3186)))) (or ((_ is Undefined!7854) lt!341845) ((_ is Found!7854) lt!341845) (not ((_ is MissingVacant!7854) lt!341845)) (not (= (index!33787 lt!341845) resIntermediateIndex!5)) (and (bvsge (index!33787 lt!341845) #b00000000000000000000000000000000) (bvslt (index!33787 lt!341845) (size!20675 a!3186)))) (or ((_ is Undefined!7854) lt!341845) (ite ((_ is Found!7854) lt!341845) (= (select (arr!20254 a!3186) (index!33785 lt!341845)) (select (arr!20254 a!3186) j!159)) (and ((_ is MissingVacant!7854) lt!341845) (= (index!33787 lt!341845) resIntermediateIndex!5) (= (select (arr!20254 a!3186) (index!33787 lt!341845)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!427895 () SeekEntryResult!7854)

(assert (=> d!101499 (= lt!341845 e!427895)))

(declare-fun c!84718 () Bool)

(assert (=> d!101499 (= c!84718 (bvsge (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110))))

(declare-fun lt!341846 () (_ BitVec 64))

(assert (=> d!101499 (= lt!341846 (select (arr!20254 a!3186) lt!341765))))

(assert (=> d!101499 (validMask!0 mask!3328)))

(assert (=> d!101499 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!341765 resIntermediateIndex!5 (select (arr!20254 a!3186) j!159) a!3186 mask!3328) lt!341845)))

(declare-fun b!768410 () Bool)

(assert (=> b!768410 (= e!427895 Undefined!7854)))

(declare-fun b!768411 () Bool)

(declare-fun c!84716 () Bool)

(assert (=> b!768411 (= c!84716 (= lt!341846 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!768411 (= e!427896 e!427897)))

(declare-fun b!768412 () Bool)

(assert (=> b!768412 (= e!427895 e!427896)))

(declare-fun c!84717 () Bool)

(assert (=> b!768412 (= c!84717 (= lt!341846 (select (arr!20254 a!3186) j!159)))))

(declare-fun b!768413 () Bool)

(assert (=> b!768413 (= e!427897 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131 #b00000000000000000000000000000001) (nextIndex!0 lt!341765 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328) resIntermediateIndex!5 (select (arr!20254 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and d!101499 c!84718) b!768410))

(assert (= (and d!101499 (not c!84718)) b!768412))

(assert (= (and b!768412 c!84717) b!768409))

(assert (= (and b!768412 (not c!84717)) b!768411))

(assert (= (and b!768411 c!84716) b!768408))

(assert (= (and b!768411 (not c!84716)) b!768413))

(declare-fun m!713969 () Bool)

(assert (=> d!101499 m!713969))

(declare-fun m!713971 () Bool)

(assert (=> d!101499 m!713971))

(declare-fun m!713973 () Bool)

(assert (=> d!101499 m!713973))

(assert (=> d!101499 m!713825))

(declare-fun m!713975 () Bool)

(assert (=> b!768413 m!713975))

(assert (=> b!768413 m!713975))

(assert (=> b!768413 m!713833))

(declare-fun m!713977 () Bool)

(assert (=> b!768413 m!713977))

(assert (=> b!768246 d!101499))

(declare-fun d!101509 () Bool)

(assert (=> d!101509 (= (validKeyInArray!0 (select (arr!20254 a!3186) j!159)) (and (not (= (select (arr!20254 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20254 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!768236 d!101509))

(declare-fun d!101511 () Bool)

(assert (=> d!101511 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!66664 d!101511))

(declare-fun d!101515 () Bool)

(assert (=> d!101515 (= (array_inv!16050 a!3186) (bvsge (size!20675 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!66664 d!101515))

(declare-fun b!768426 () Bool)

(declare-fun e!427906 () SeekEntryResult!7854)

(assert (=> b!768426 (= e!427906 (MissingVacant!7854 resIntermediateIndex!5))))

(declare-fun b!768427 () Bool)

(declare-fun e!427905 () SeekEntryResult!7854)

(assert (=> b!768427 (= e!427905 (Found!7854 index!1321))))

(declare-fun d!101517 () Bool)

(declare-fun lt!341856 () SeekEntryResult!7854)

(assert (=> d!101517 (and (or ((_ is Undefined!7854) lt!341856) (not ((_ is Found!7854) lt!341856)) (and (bvsge (index!33785 lt!341856) #b00000000000000000000000000000000) (bvslt (index!33785 lt!341856) (size!20675 a!3186)))) (or ((_ is Undefined!7854) lt!341856) ((_ is Found!7854) lt!341856) (not ((_ is MissingVacant!7854) lt!341856)) (not (= (index!33787 lt!341856) resIntermediateIndex!5)) (and (bvsge (index!33787 lt!341856) #b00000000000000000000000000000000) (bvslt (index!33787 lt!341856) (size!20675 a!3186)))) (or ((_ is Undefined!7854) lt!341856) (ite ((_ is Found!7854) lt!341856) (= (select (arr!20254 a!3186) (index!33785 lt!341856)) (select (arr!20254 a!3186) j!159)) (and ((_ is MissingVacant!7854) lt!341856) (= (index!33787 lt!341856) resIntermediateIndex!5) (= (select (arr!20254 a!3186) (index!33787 lt!341856)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!427904 () SeekEntryResult!7854)

(assert (=> d!101517 (= lt!341856 e!427904)))

(declare-fun c!84727 () Bool)

(assert (=> d!101517 (= c!84727 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!341857 () (_ BitVec 64))

(assert (=> d!101517 (= lt!341857 (select (arr!20254 a!3186) index!1321))))

(assert (=> d!101517 (validMask!0 mask!3328)))

(assert (=> d!101517 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20254 a!3186) j!159) a!3186 mask!3328) lt!341856)))

(declare-fun b!768428 () Bool)

(assert (=> b!768428 (= e!427904 Undefined!7854)))

(declare-fun b!768429 () Bool)

(declare-fun c!84725 () Bool)

(assert (=> b!768429 (= c!84725 (= lt!341857 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!768429 (= e!427905 e!427906)))

(declare-fun b!768430 () Bool)

(assert (=> b!768430 (= e!427904 e!427905)))

(declare-fun c!84726 () Bool)

(assert (=> b!768430 (= c!84726 (= lt!341857 (select (arr!20254 a!3186) j!159)))))

(declare-fun b!768431 () Bool)

(assert (=> b!768431 (= e!427906 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!20254 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and d!101517 c!84727) b!768428))

(assert (= (and d!101517 (not c!84727)) b!768430))

(assert (= (and b!768430 c!84726) b!768427))

(assert (= (and b!768430 (not c!84726)) b!768429))

(assert (= (and b!768429 c!84725) b!768426))

(assert (= (and b!768429 (not c!84725)) b!768431))

(declare-fun m!713981 () Bool)

(assert (=> d!101517 m!713981))

(declare-fun m!713983 () Bool)

(assert (=> d!101517 m!713983))

(declare-fun m!713985 () Bool)

(assert (=> d!101517 m!713985))

(assert (=> d!101517 m!713825))

(assert (=> b!768431 m!713863))

(assert (=> b!768431 m!713863))

(assert (=> b!768431 m!713833))

(declare-fun m!713987 () Bool)

(assert (=> b!768431 m!713987))

(assert (=> b!768238 d!101517))

(declare-fun b!768480 () Bool)

(declare-fun e!427935 () SeekEntryResult!7854)

(declare-fun lt!341881 () SeekEntryResult!7854)

(assert (=> b!768480 (= e!427935 (Found!7854 (index!33786 lt!341881)))))

(declare-fun b!768481 () Bool)

(declare-fun e!427936 () SeekEntryResult!7854)

(assert (=> b!768481 (= e!427936 e!427935)))

(declare-fun lt!341879 () (_ BitVec 64))

(assert (=> b!768481 (= lt!341879 (select (arr!20254 a!3186) (index!33786 lt!341881)))))

(declare-fun c!84750 () Bool)

(assert (=> b!768481 (= c!84750 (= lt!341879 k0!2102))))

(declare-fun b!768482 () Bool)

(declare-fun e!427934 () SeekEntryResult!7854)

(assert (=> b!768482 (= e!427934 (seekKeyOrZeroReturnVacant!0 (x!64708 lt!341881) (index!33786 lt!341881) (index!33786 lt!341881) k0!2102 a!3186 mask!3328))))

(declare-fun b!768483 () Bool)

(declare-fun c!84751 () Bool)

(assert (=> b!768483 (= c!84751 (= lt!341879 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!768483 (= e!427935 e!427934)))

(declare-fun d!101519 () Bool)

(declare-fun lt!341880 () SeekEntryResult!7854)

(assert (=> d!101519 (and (or ((_ is Undefined!7854) lt!341880) (not ((_ is Found!7854) lt!341880)) (and (bvsge (index!33785 lt!341880) #b00000000000000000000000000000000) (bvslt (index!33785 lt!341880) (size!20675 a!3186)))) (or ((_ is Undefined!7854) lt!341880) ((_ is Found!7854) lt!341880) (not ((_ is MissingZero!7854) lt!341880)) (and (bvsge (index!33784 lt!341880) #b00000000000000000000000000000000) (bvslt (index!33784 lt!341880) (size!20675 a!3186)))) (or ((_ is Undefined!7854) lt!341880) ((_ is Found!7854) lt!341880) ((_ is MissingZero!7854) lt!341880) (not ((_ is MissingVacant!7854) lt!341880)) (and (bvsge (index!33787 lt!341880) #b00000000000000000000000000000000) (bvslt (index!33787 lt!341880) (size!20675 a!3186)))) (or ((_ is Undefined!7854) lt!341880) (ite ((_ is Found!7854) lt!341880) (= (select (arr!20254 a!3186) (index!33785 lt!341880)) k0!2102) (ite ((_ is MissingZero!7854) lt!341880) (= (select (arr!20254 a!3186) (index!33784 lt!341880)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7854) lt!341880) (= (select (arr!20254 a!3186) (index!33787 lt!341880)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!101519 (= lt!341880 e!427936)))

(declare-fun c!84749 () Bool)

(assert (=> d!101519 (= c!84749 (and ((_ is Intermediate!7854) lt!341881) (undefined!8666 lt!341881)))))

(assert (=> d!101519 (= lt!341881 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328))))

(assert (=> d!101519 (validMask!0 mask!3328)))

(assert (=> d!101519 (= (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328) lt!341880)))

(declare-fun b!768484 () Bool)

(assert (=> b!768484 (= e!427936 Undefined!7854)))

(declare-fun b!768485 () Bool)

(assert (=> b!768485 (= e!427934 (MissingZero!7854 (index!33786 lt!341881)))))

(assert (= (and d!101519 c!84749) b!768484))

(assert (= (and d!101519 (not c!84749)) b!768481))

(assert (= (and b!768481 c!84750) b!768480))

(assert (= (and b!768481 (not c!84750)) b!768483))

(assert (= (and b!768483 c!84751) b!768485))

(assert (= (and b!768483 (not c!84751)) b!768482))

(declare-fun m!714027 () Bool)

(assert (=> b!768481 m!714027))

(declare-fun m!714029 () Bool)

(assert (=> b!768482 m!714029))

(assert (=> d!101519 m!713825))

(declare-fun m!714031 () Bool)

(assert (=> d!101519 m!714031))

(declare-fun m!714033 () Bool)

(assert (=> d!101519 m!714033))

(declare-fun m!714035 () Bool)

(assert (=> d!101519 m!714035))

(declare-fun m!714037 () Bool)

(assert (=> d!101519 m!714037))

(assert (=> d!101519 m!714033))

(declare-fun m!714039 () Bool)

(assert (=> d!101519 m!714039))

(assert (=> b!768237 d!101519))

(declare-fun d!101535 () Bool)

(declare-fun e!427937 () Bool)

(assert (=> d!101535 e!427937))

(declare-fun c!84754 () Bool)

(declare-fun lt!341882 () SeekEntryResult!7854)

(assert (=> d!101535 (= c!84754 (and ((_ is Intermediate!7854) lt!341882) (undefined!8666 lt!341882)))))

(declare-fun e!427938 () SeekEntryResult!7854)

(assert (=> d!101535 (= lt!341882 e!427938)))

(declare-fun c!84753 () Bool)

(assert (=> d!101535 (= c!84753 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!341883 () (_ BitVec 64))

(assert (=> d!101535 (= lt!341883 (select (arr!20254 a!3186) index!1321))))

(assert (=> d!101535 (validMask!0 mask!3328)))

(assert (=> d!101535 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20254 a!3186) j!159) a!3186 mask!3328) lt!341882)))

(declare-fun b!768486 () Bool)

(declare-fun e!427940 () Bool)

(assert (=> b!768486 (= e!427937 e!427940)))

(declare-fun res!519770 () Bool)

(assert (=> b!768486 (= res!519770 (and ((_ is Intermediate!7854) lt!341882) (not (undefined!8666 lt!341882)) (bvslt (x!64708 lt!341882) #b01111111111111111111111111111110) (bvsge (x!64708 lt!341882) #b00000000000000000000000000000000) (bvsge (x!64708 lt!341882) x!1131)))))

(assert (=> b!768486 (=> (not res!519770) (not e!427940))))

(declare-fun b!768487 () Bool)

(declare-fun e!427941 () SeekEntryResult!7854)

(assert (=> b!768487 (= e!427941 (Intermediate!7854 false index!1321 x!1131))))

(declare-fun b!768488 () Bool)

(assert (=> b!768488 (= e!427937 (bvsge (x!64708 lt!341882) #b01111111111111111111111111111110))))

(declare-fun b!768489 () Bool)

(assert (=> b!768489 (= e!427938 e!427941)))

(declare-fun c!84752 () Bool)

(assert (=> b!768489 (= c!84752 (or (= lt!341883 (select (arr!20254 a!3186) j!159)) (= (bvadd lt!341883 lt!341883) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!768490 () Bool)

(assert (=> b!768490 (= e!427941 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!20254 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!768491 () Bool)

(assert (=> b!768491 (and (bvsge (index!33786 lt!341882) #b00000000000000000000000000000000) (bvslt (index!33786 lt!341882) (size!20675 a!3186)))))

(declare-fun res!519768 () Bool)

(assert (=> b!768491 (= res!519768 (= (select (arr!20254 a!3186) (index!33786 lt!341882)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!427939 () Bool)

(assert (=> b!768491 (=> res!519768 e!427939)))

(declare-fun b!768492 () Bool)

(assert (=> b!768492 (and (bvsge (index!33786 lt!341882) #b00000000000000000000000000000000) (bvslt (index!33786 lt!341882) (size!20675 a!3186)))))

(assert (=> b!768492 (= e!427939 (= (select (arr!20254 a!3186) (index!33786 lt!341882)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!768493 () Bool)

(assert (=> b!768493 (and (bvsge (index!33786 lt!341882) #b00000000000000000000000000000000) (bvslt (index!33786 lt!341882) (size!20675 a!3186)))))

(declare-fun res!519769 () Bool)

(assert (=> b!768493 (= res!519769 (= (select (arr!20254 a!3186) (index!33786 lt!341882)) (select (arr!20254 a!3186) j!159)))))

(assert (=> b!768493 (=> res!519769 e!427939)))

(assert (=> b!768493 (= e!427940 e!427939)))

(declare-fun b!768494 () Bool)

(assert (=> b!768494 (= e!427938 (Intermediate!7854 true index!1321 x!1131))))

(assert (= (and d!101535 c!84753) b!768494))

(assert (= (and d!101535 (not c!84753)) b!768489))

(assert (= (and b!768489 c!84752) b!768487))

(assert (= (and b!768489 (not c!84752)) b!768490))

(assert (= (and d!101535 c!84754) b!768488))

(assert (= (and d!101535 (not c!84754)) b!768486))

(assert (= (and b!768486 res!519770) b!768493))

(assert (= (and b!768493 (not res!519769)) b!768491))

(assert (= (and b!768491 (not res!519768)) b!768492))

(declare-fun m!714041 () Bool)

(assert (=> b!768493 m!714041))

(assert (=> b!768491 m!714041))

(assert (=> d!101535 m!713985))

(assert (=> d!101535 m!713825))

(assert (=> b!768492 m!714041))

(assert (=> b!768490 m!713863))

(assert (=> b!768490 m!713863))

(assert (=> b!768490 m!713833))

(declare-fun m!714043 () Bool)

(assert (=> b!768490 m!714043))

(assert (=> b!768239 d!101535))

(declare-fun b!768495 () Bool)

(declare-fun e!427944 () SeekEntryResult!7854)

(assert (=> b!768495 (= e!427944 (MissingVacant!7854 resIntermediateIndex!5))))

(declare-fun b!768496 () Bool)

(declare-fun e!427943 () SeekEntryResult!7854)

(assert (=> b!768496 (= e!427943 (Found!7854 resIntermediateIndex!5))))

(declare-fun lt!341884 () SeekEntryResult!7854)

(declare-fun d!101537 () Bool)

(assert (=> d!101537 (and (or ((_ is Undefined!7854) lt!341884) (not ((_ is Found!7854) lt!341884)) (and (bvsge (index!33785 lt!341884) #b00000000000000000000000000000000) (bvslt (index!33785 lt!341884) (size!20675 a!3186)))) (or ((_ is Undefined!7854) lt!341884) ((_ is Found!7854) lt!341884) (not ((_ is MissingVacant!7854) lt!341884)) (not (= (index!33787 lt!341884) resIntermediateIndex!5)) (and (bvsge (index!33787 lt!341884) #b00000000000000000000000000000000) (bvslt (index!33787 lt!341884) (size!20675 a!3186)))) (or ((_ is Undefined!7854) lt!341884) (ite ((_ is Found!7854) lt!341884) (= (select (arr!20254 a!3186) (index!33785 lt!341884)) (select (arr!20254 a!3186) j!159)) (and ((_ is MissingVacant!7854) lt!341884) (= (index!33787 lt!341884) resIntermediateIndex!5) (= (select (arr!20254 a!3186) (index!33787 lt!341884)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!427942 () SeekEntryResult!7854)

(assert (=> d!101537 (= lt!341884 e!427942)))

(declare-fun c!84757 () Bool)

(assert (=> d!101537 (= c!84757 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(declare-fun lt!341885 () (_ BitVec 64))

(assert (=> d!101537 (= lt!341885 (select (arr!20254 a!3186) resIntermediateIndex!5))))

(assert (=> d!101537 (validMask!0 mask!3328)))

(assert (=> d!101537 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20254 a!3186) j!159) a!3186 mask!3328) lt!341884)))

(declare-fun b!768497 () Bool)

(assert (=> b!768497 (= e!427942 Undefined!7854)))

(declare-fun b!768498 () Bool)

(declare-fun c!84755 () Bool)

(assert (=> b!768498 (= c!84755 (= lt!341885 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!768498 (= e!427943 e!427944)))

(declare-fun b!768499 () Bool)

(assert (=> b!768499 (= e!427942 e!427943)))

(declare-fun c!84756 () Bool)

(assert (=> b!768499 (= c!84756 (= lt!341885 (select (arr!20254 a!3186) j!159)))))

(declare-fun b!768500 () Bool)

(assert (=> b!768500 (= e!427944 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) resIntermediateIndex!5 (select (arr!20254 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and d!101537 c!84757) b!768497))

(assert (= (and d!101537 (not c!84757)) b!768499))

(assert (= (and b!768499 c!84756) b!768496))

(assert (= (and b!768499 (not c!84756)) b!768498))

(assert (= (and b!768498 c!84755) b!768495))

(assert (= (and b!768498 (not c!84755)) b!768500))

(declare-fun m!714045 () Bool)

(assert (=> d!101537 m!714045))

(declare-fun m!714047 () Bool)

(assert (=> d!101537 m!714047))

(assert (=> d!101537 m!713853))

(assert (=> d!101537 m!713825))

(declare-fun m!714049 () Bool)

(assert (=> b!768500 m!714049))

(assert (=> b!768500 m!714049))

(assert (=> b!768500 m!713833))

(declare-fun m!714051 () Bool)

(assert (=> b!768500 m!714051))

(assert (=> b!768250 d!101537))

(declare-fun d!101539 () Bool)

(declare-fun res!519771 () Bool)

(declare-fun e!427953 () Bool)

(assert (=> d!101539 (=> res!519771 e!427953)))

(assert (=> d!101539 (= res!519771 (bvsge #b00000000000000000000000000000000 (size!20675 a!3186)))))

(assert (=> d!101539 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!427953)))

(declare-fun b!768513 () Bool)

(declare-fun e!427952 () Bool)

(declare-fun e!427951 () Bool)

(assert (=> b!768513 (= e!427952 e!427951)))

(declare-fun lt!341892 () (_ BitVec 64))

(assert (=> b!768513 (= lt!341892 (select (arr!20254 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!341891 () Unit!26434)

(assert (=> b!768513 (= lt!341891 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!341892 #b00000000000000000000000000000000))))

(assert (=> b!768513 (arrayContainsKey!0 a!3186 lt!341892 #b00000000000000000000000000000000)))

(declare-fun lt!341890 () Unit!26434)

(assert (=> b!768513 (= lt!341890 lt!341891)))

(declare-fun res!519772 () Bool)

(assert (=> b!768513 (= res!519772 (= (seekEntryOrOpen!0 (select (arr!20254 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7854 #b00000000000000000000000000000000)))))

(assert (=> b!768513 (=> (not res!519772) (not e!427951))))

(declare-fun b!768514 () Bool)

(declare-fun call!35092 () Bool)

(assert (=> b!768514 (= e!427951 call!35092)))

(declare-fun b!768515 () Bool)

(assert (=> b!768515 (= e!427953 e!427952)))

(declare-fun c!84764 () Bool)

(assert (=> b!768515 (= c!84764 (validKeyInArray!0 (select (arr!20254 a!3186) #b00000000000000000000000000000000)))))

(declare-fun bm!35089 () Bool)

(assert (=> bm!35089 (= call!35092 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!768516 () Bool)

(assert (=> b!768516 (= e!427952 call!35092)))

(assert (= (and d!101539 (not res!519771)) b!768515))

(assert (= (and b!768515 c!84764) b!768513))

(assert (= (and b!768515 (not c!84764)) b!768516))

(assert (= (and b!768513 res!519772) b!768514))

(assert (= (or b!768514 b!768516) bm!35089))

(assert (=> b!768513 m!713925))

(declare-fun m!714053 () Bool)

(assert (=> b!768513 m!714053))

(declare-fun m!714055 () Bool)

(assert (=> b!768513 m!714055))

(assert (=> b!768513 m!713925))

(declare-fun m!714057 () Bool)

(assert (=> b!768513 m!714057))

(assert (=> b!768515 m!713925))

(assert (=> b!768515 m!713925))

(declare-fun m!714059 () Bool)

(assert (=> b!768515 m!714059))

(declare-fun m!714061 () Bool)

(assert (=> bm!35089 m!714061))

(assert (=> b!768249 d!101539))

(declare-fun b!768533 () Bool)

(declare-fun e!427967 () Bool)

(declare-fun call!35095 () Bool)

(assert (=> b!768533 (= e!427967 call!35095)))

(declare-fun d!101541 () Bool)

(declare-fun res!519781 () Bool)

(declare-fun e!427965 () Bool)

(assert (=> d!101541 (=> res!519781 e!427965)))

(assert (=> d!101541 (= res!519781 (bvsge #b00000000000000000000000000000000 (size!20675 a!3186)))))

(assert (=> d!101541 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14253) e!427965)))

(declare-fun bm!35092 () Bool)

(declare-fun c!84770 () Bool)

(assert (=> bm!35092 (= call!35095 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!84770 (Cons!14252 (select (arr!20254 a!3186) #b00000000000000000000000000000000) Nil!14253) Nil!14253)))))

(declare-fun b!768534 () Bool)

(assert (=> b!768534 (= e!427967 call!35095)))

(declare-fun b!768535 () Bool)

(declare-fun e!427966 () Bool)

(assert (=> b!768535 (= e!427965 e!427966)))

(declare-fun res!519780 () Bool)

(assert (=> b!768535 (=> (not res!519780) (not e!427966))))

(declare-fun e!427968 () Bool)

(assert (=> b!768535 (= res!519780 (not e!427968))))

(declare-fun res!519779 () Bool)

(assert (=> b!768535 (=> (not res!519779) (not e!427968))))

(assert (=> b!768535 (= res!519779 (validKeyInArray!0 (select (arr!20254 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!768536 () Bool)

(assert (=> b!768536 (= e!427966 e!427967)))

(assert (=> b!768536 (= c!84770 (validKeyInArray!0 (select (arr!20254 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!768537 () Bool)

(declare-fun contains!4086 (List!14256 (_ BitVec 64)) Bool)

(assert (=> b!768537 (= e!427968 (contains!4086 Nil!14253 (select (arr!20254 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!101541 (not res!519781)) b!768535))

(assert (= (and b!768535 res!519779) b!768537))

(assert (= (and b!768535 res!519780) b!768536))

(assert (= (and b!768536 c!84770) b!768533))

(assert (= (and b!768536 (not c!84770)) b!768534))

(assert (= (or b!768533 b!768534) bm!35092))

(assert (=> bm!35092 m!713925))

(declare-fun m!714071 () Bool)

(assert (=> bm!35092 m!714071))

(assert (=> b!768535 m!713925))

(assert (=> b!768535 m!713925))

(assert (=> b!768535 m!714059))

(assert (=> b!768536 m!713925))

(assert (=> b!768536 m!713925))

(assert (=> b!768536 m!714059))

(assert (=> b!768537 m!713925))

(assert (=> b!768537 m!713925))

(declare-fun m!714073 () Bool)

(assert (=> b!768537 m!714073))

(assert (=> b!768251 d!101541))

(declare-fun d!101545 () Bool)

(declare-fun lt!341901 () (_ BitVec 32))

(assert (=> d!101545 (and (bvsge lt!341901 #b00000000000000000000000000000000) (bvslt lt!341901 (bvadd mask!3328 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!101545 (= lt!341901 (choose!52 index!1321 x!1131 mask!3328))))

(assert (=> d!101545 (validMask!0 mask!3328)))

(assert (=> d!101545 (= (nextIndex!0 index!1321 x!1131 mask!3328) lt!341901)))

(declare-fun bs!21536 () Bool)

(assert (= bs!21536 d!101545))

(declare-fun m!714075 () Bool)

(assert (=> bs!21536 m!714075))

(assert (=> bs!21536 m!713825))

(assert (=> b!768240 d!101545))

(assert (=> b!768241 d!101517))

(declare-fun b!768556 () Bool)

(declare-fun e!427980 () SeekEntryResult!7854)

(declare-fun lt!341904 () SeekEntryResult!7854)

(assert (=> b!768556 (= e!427980 (Found!7854 (index!33786 lt!341904)))))

(declare-fun b!768557 () Bool)

(declare-fun e!427981 () SeekEntryResult!7854)

(assert (=> b!768557 (= e!427981 e!427980)))

(declare-fun lt!341902 () (_ BitVec 64))

(assert (=> b!768557 (= lt!341902 (select (arr!20254 a!3186) (index!33786 lt!341904)))))

(declare-fun c!84778 () Bool)

(assert (=> b!768557 (= c!84778 (= lt!341902 (select (arr!20254 a!3186) j!159)))))

(declare-fun b!768558 () Bool)

(declare-fun e!427979 () SeekEntryResult!7854)

(assert (=> b!768558 (= e!427979 (seekKeyOrZeroReturnVacant!0 (x!64708 lt!341904) (index!33786 lt!341904) (index!33786 lt!341904) (select (arr!20254 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!768559 () Bool)

(declare-fun c!84779 () Bool)

(assert (=> b!768559 (= c!84779 (= lt!341902 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!768559 (= e!427980 e!427979)))

(declare-fun d!101547 () Bool)

(declare-fun lt!341903 () SeekEntryResult!7854)

(assert (=> d!101547 (and (or ((_ is Undefined!7854) lt!341903) (not ((_ is Found!7854) lt!341903)) (and (bvsge (index!33785 lt!341903) #b00000000000000000000000000000000) (bvslt (index!33785 lt!341903) (size!20675 a!3186)))) (or ((_ is Undefined!7854) lt!341903) ((_ is Found!7854) lt!341903) (not ((_ is MissingZero!7854) lt!341903)) (and (bvsge (index!33784 lt!341903) #b00000000000000000000000000000000) (bvslt (index!33784 lt!341903) (size!20675 a!3186)))) (or ((_ is Undefined!7854) lt!341903) ((_ is Found!7854) lt!341903) ((_ is MissingZero!7854) lt!341903) (not ((_ is MissingVacant!7854) lt!341903)) (and (bvsge (index!33787 lt!341903) #b00000000000000000000000000000000) (bvslt (index!33787 lt!341903) (size!20675 a!3186)))) (or ((_ is Undefined!7854) lt!341903) (ite ((_ is Found!7854) lt!341903) (= (select (arr!20254 a!3186) (index!33785 lt!341903)) (select (arr!20254 a!3186) j!159)) (ite ((_ is MissingZero!7854) lt!341903) (= (select (arr!20254 a!3186) (index!33784 lt!341903)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7854) lt!341903) (= (select (arr!20254 a!3186) (index!33787 lt!341903)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!101547 (= lt!341903 e!427981)))

(declare-fun c!84777 () Bool)

(assert (=> d!101547 (= c!84777 (and ((_ is Intermediate!7854) lt!341904) (undefined!8666 lt!341904)))))

(assert (=> d!101547 (= lt!341904 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20254 a!3186) j!159) mask!3328) (select (arr!20254 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!101547 (validMask!0 mask!3328)))

(assert (=> d!101547 (= (seekEntryOrOpen!0 (select (arr!20254 a!3186) j!159) a!3186 mask!3328) lt!341903)))

(declare-fun b!768560 () Bool)

(assert (=> b!768560 (= e!427981 Undefined!7854)))

(declare-fun b!768561 () Bool)

(assert (=> b!768561 (= e!427979 (MissingZero!7854 (index!33786 lt!341904)))))

(assert (= (and d!101547 c!84777) b!768560))

(assert (= (and d!101547 (not c!84777)) b!768557))

(assert (= (and b!768557 c!84778) b!768556))

(assert (= (and b!768557 (not c!84778)) b!768559))

(assert (= (and b!768559 c!84779) b!768561))

(assert (= (and b!768559 (not c!84779)) b!768558))

(declare-fun m!714077 () Bool)

(assert (=> b!768557 m!714077))

(assert (=> b!768558 m!713833))

(declare-fun m!714079 () Bool)

(assert (=> b!768558 m!714079))

(assert (=> d!101547 m!713825))

(declare-fun m!714081 () Bool)

(assert (=> d!101547 m!714081))

(assert (=> d!101547 m!713869))

(assert (=> d!101547 m!713833))

(assert (=> d!101547 m!713871))

(declare-fun m!714083 () Bool)

(assert (=> d!101547 m!714083))

(assert (=> d!101547 m!713833))

(assert (=> d!101547 m!713869))

(declare-fun m!714085 () Bool)

(assert (=> d!101547 m!714085))

(assert (=> b!768252 d!101547))

(check-sat (not b!768515) (not b!768535) (not d!101483) (not b!768373) (not d!101493) (not d!101535) (not d!101499) (not b!768329) (not bm!35085) (not b!768355) (not b!768320) (not d!101517) (not b!768513) (not d!101547) (not d!101491) (not b!768331) (not bm!35092) (not b!768500) (not b!768490) (not d!101519) (not b!768536) (not b!768482) (not b!768558) (not d!101545) (not d!101537) (not b!768537) (not bm!35089) (not b!768413) (not b!768431) (not d!101485) (not b!768364))
(check-sat)
(get-model)

(assert (=> d!101483 d!101481))

(declare-fun d!101605 () Bool)

(assert (=> d!101605 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(assert (=> d!101605 true))

(declare-fun _$72!113 () Unit!26434)

(assert (=> d!101605 (= (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) _$72!113)))

(declare-fun bs!21540 () Bool)

(assert (= bs!21540 d!101605))

(assert (=> bs!21540 m!713859))

(assert (=> d!101483 d!101605))

(assert (=> d!101483 d!101511))

(declare-fun d!101607 () Bool)

(declare-fun res!519848 () Bool)

(declare-fun e!428095 () Bool)

(assert (=> d!101607 (=> res!519848 e!428095)))

(assert (=> d!101607 (= res!519848 (= (select (arr!20254 a!3186) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) k0!2102))))

(assert (=> d!101607 (= (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!428095)))

(declare-fun b!768750 () Bool)

(declare-fun e!428096 () Bool)

(assert (=> b!768750 (= e!428095 e!428096)))

(declare-fun res!519849 () Bool)

(assert (=> b!768750 (=> (not res!519849) (not e!428096))))

(assert (=> b!768750 (= res!519849 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!20675 a!3186)))))

(declare-fun b!768751 () Bool)

(assert (=> b!768751 (= e!428096 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!101607 (not res!519848)) b!768750))

(assert (= (and b!768750 res!519849) b!768751))

(declare-fun m!714237 () Bool)

(assert (=> d!101607 m!714237))

(declare-fun m!714239 () Bool)

(assert (=> b!768751 m!714239))

(assert (=> b!768320 d!101607))

(declare-fun d!101609 () Bool)

(assert (=> d!101609 (arrayContainsKey!0 a!3186 lt!341892 #b00000000000000000000000000000000)))

(declare-fun lt!341984 () Unit!26434)

(declare-fun choose!13 (array!42305 (_ BitVec 64) (_ BitVec 32)) Unit!26434)

(assert (=> d!101609 (= lt!341984 (choose!13 a!3186 lt!341892 #b00000000000000000000000000000000))))

(assert (=> d!101609 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!101609 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!341892 #b00000000000000000000000000000000) lt!341984)))

(declare-fun bs!21541 () Bool)

(assert (= bs!21541 d!101609))

(assert (=> bs!21541 m!714055))

(declare-fun m!714241 () Bool)

(assert (=> bs!21541 m!714241))

(assert (=> b!768513 d!101609))

(declare-fun d!101611 () Bool)

(declare-fun res!519850 () Bool)

(declare-fun e!428097 () Bool)

(assert (=> d!101611 (=> res!519850 e!428097)))

(assert (=> d!101611 (= res!519850 (= (select (arr!20254 a!3186) #b00000000000000000000000000000000) lt!341892))))

(assert (=> d!101611 (= (arrayContainsKey!0 a!3186 lt!341892 #b00000000000000000000000000000000) e!428097)))

(declare-fun b!768752 () Bool)

(declare-fun e!428098 () Bool)

(assert (=> b!768752 (= e!428097 e!428098)))

(declare-fun res!519851 () Bool)

(assert (=> b!768752 (=> (not res!519851) (not e!428098))))

(assert (=> b!768752 (= res!519851 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20675 a!3186)))))

(declare-fun b!768753 () Bool)

(assert (=> b!768753 (= e!428098 (arrayContainsKey!0 a!3186 lt!341892 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!101611 (not res!519850)) b!768752))

(assert (= (and b!768752 res!519851) b!768753))

(assert (=> d!101611 m!713925))

(declare-fun m!714243 () Bool)

(assert (=> b!768753 m!714243))

(assert (=> b!768513 d!101611))

(declare-fun b!768754 () Bool)

(declare-fun e!428100 () SeekEntryResult!7854)

(declare-fun lt!341987 () SeekEntryResult!7854)

(assert (=> b!768754 (= e!428100 (Found!7854 (index!33786 lt!341987)))))

(declare-fun b!768755 () Bool)

(declare-fun e!428101 () SeekEntryResult!7854)

(assert (=> b!768755 (= e!428101 e!428100)))

(declare-fun lt!341985 () (_ BitVec 64))

(assert (=> b!768755 (= lt!341985 (select (arr!20254 a!3186) (index!33786 lt!341987)))))

(declare-fun c!84846 () Bool)

(assert (=> b!768755 (= c!84846 (= lt!341985 (select (arr!20254 a!3186) #b00000000000000000000000000000000)))))

(declare-fun e!428099 () SeekEntryResult!7854)

(declare-fun b!768756 () Bool)

(assert (=> b!768756 (= e!428099 (seekKeyOrZeroReturnVacant!0 (x!64708 lt!341987) (index!33786 lt!341987) (index!33786 lt!341987) (select (arr!20254 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328))))

(declare-fun b!768757 () Bool)

(declare-fun c!84847 () Bool)

(assert (=> b!768757 (= c!84847 (= lt!341985 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!768757 (= e!428100 e!428099)))

(declare-fun d!101613 () Bool)

(declare-fun lt!341986 () SeekEntryResult!7854)

(assert (=> d!101613 (and (or ((_ is Undefined!7854) lt!341986) (not ((_ is Found!7854) lt!341986)) (and (bvsge (index!33785 lt!341986) #b00000000000000000000000000000000) (bvslt (index!33785 lt!341986) (size!20675 a!3186)))) (or ((_ is Undefined!7854) lt!341986) ((_ is Found!7854) lt!341986) (not ((_ is MissingZero!7854) lt!341986)) (and (bvsge (index!33784 lt!341986) #b00000000000000000000000000000000) (bvslt (index!33784 lt!341986) (size!20675 a!3186)))) (or ((_ is Undefined!7854) lt!341986) ((_ is Found!7854) lt!341986) ((_ is MissingZero!7854) lt!341986) (not ((_ is MissingVacant!7854) lt!341986)) (and (bvsge (index!33787 lt!341986) #b00000000000000000000000000000000) (bvslt (index!33787 lt!341986) (size!20675 a!3186)))) (or ((_ is Undefined!7854) lt!341986) (ite ((_ is Found!7854) lt!341986) (= (select (arr!20254 a!3186) (index!33785 lt!341986)) (select (arr!20254 a!3186) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!7854) lt!341986) (= (select (arr!20254 a!3186) (index!33784 lt!341986)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7854) lt!341986) (= (select (arr!20254 a!3186) (index!33787 lt!341986)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!101613 (= lt!341986 e!428101)))

(declare-fun c!84845 () Bool)

(assert (=> d!101613 (= c!84845 (and ((_ is Intermediate!7854) lt!341987) (undefined!8666 lt!341987)))))

(assert (=> d!101613 (= lt!341987 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20254 a!3186) #b00000000000000000000000000000000) mask!3328) (select (arr!20254 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328))))

(assert (=> d!101613 (validMask!0 mask!3328)))

(assert (=> d!101613 (= (seekEntryOrOpen!0 (select (arr!20254 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) lt!341986)))

(declare-fun b!768758 () Bool)

(assert (=> b!768758 (= e!428101 Undefined!7854)))

(declare-fun b!768759 () Bool)

(assert (=> b!768759 (= e!428099 (MissingZero!7854 (index!33786 lt!341987)))))

(assert (= (and d!101613 c!84845) b!768758))

(assert (= (and d!101613 (not c!84845)) b!768755))

(assert (= (and b!768755 c!84846) b!768754))

(assert (= (and b!768755 (not c!84846)) b!768757))

(assert (= (and b!768757 c!84847) b!768759))

(assert (= (and b!768757 (not c!84847)) b!768756))

(declare-fun m!714245 () Bool)

(assert (=> b!768755 m!714245))

(assert (=> b!768756 m!713925))

(declare-fun m!714247 () Bool)

(assert (=> b!768756 m!714247))

(assert (=> d!101613 m!713825))

(declare-fun m!714249 () Bool)

(assert (=> d!101613 m!714249))

(declare-fun m!714251 () Bool)

(assert (=> d!101613 m!714251))

(assert (=> d!101613 m!713925))

(declare-fun m!714253 () Bool)

(assert (=> d!101613 m!714253))

(declare-fun m!714255 () Bool)

(assert (=> d!101613 m!714255))

(assert (=> d!101613 m!713925))

(assert (=> d!101613 m!714251))

(declare-fun m!714257 () Bool)

(assert (=> d!101613 m!714257))

(assert (=> b!768513 d!101613))

(declare-fun b!768760 () Bool)

(declare-fun e!428104 () Bool)

(declare-fun call!35107 () Bool)

(assert (=> b!768760 (= e!428104 call!35107)))

(declare-fun d!101615 () Bool)

(declare-fun res!519854 () Bool)

(declare-fun e!428102 () Bool)

(assert (=> d!101615 (=> res!519854 e!428102)))

(assert (=> d!101615 (= res!519854 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20675 a!3186)))))

(assert (=> d!101615 (= (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!84770 (Cons!14252 (select (arr!20254 a!3186) #b00000000000000000000000000000000) Nil!14253) Nil!14253)) e!428102)))

(declare-fun c!84848 () Bool)

(declare-fun bm!35104 () Bool)

(assert (=> bm!35104 (= call!35107 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!84848 (Cons!14252 (select (arr!20254 a!3186) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!84770 (Cons!14252 (select (arr!20254 a!3186) #b00000000000000000000000000000000) Nil!14253) Nil!14253)) (ite c!84770 (Cons!14252 (select (arr!20254 a!3186) #b00000000000000000000000000000000) Nil!14253) Nil!14253))))))

(declare-fun b!768761 () Bool)

(assert (=> b!768761 (= e!428104 call!35107)))

(declare-fun b!768762 () Bool)

(declare-fun e!428103 () Bool)

(assert (=> b!768762 (= e!428102 e!428103)))

(declare-fun res!519853 () Bool)

(assert (=> b!768762 (=> (not res!519853) (not e!428103))))

(declare-fun e!428105 () Bool)

(assert (=> b!768762 (= res!519853 (not e!428105))))

(declare-fun res!519852 () Bool)

(assert (=> b!768762 (=> (not res!519852) (not e!428105))))

(assert (=> b!768762 (= res!519852 (validKeyInArray!0 (select (arr!20254 a!3186) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!768763 () Bool)

(assert (=> b!768763 (= e!428103 e!428104)))

(assert (=> b!768763 (= c!84848 (validKeyInArray!0 (select (arr!20254 a!3186) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!768764 () Bool)

(assert (=> b!768764 (= e!428105 (contains!4086 (ite c!84770 (Cons!14252 (select (arr!20254 a!3186) #b00000000000000000000000000000000) Nil!14253) Nil!14253) (select (arr!20254 a!3186) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!101615 (not res!519854)) b!768762))

(assert (= (and b!768762 res!519852) b!768764))

(assert (= (and b!768762 res!519853) b!768763))

(assert (= (and b!768763 c!84848) b!768760))

(assert (= (and b!768763 (not c!84848)) b!768761))

(assert (= (or b!768760 b!768761) bm!35104))

(assert (=> bm!35104 m!714237))

(declare-fun m!714259 () Bool)

(assert (=> bm!35104 m!714259))

(assert (=> b!768762 m!714237))

(assert (=> b!768762 m!714237))

(declare-fun m!714261 () Bool)

(assert (=> b!768762 m!714261))

(assert (=> b!768763 m!714237))

(assert (=> b!768763 m!714237))

(assert (=> b!768763 m!714261))

(assert (=> b!768764 m!714237))

(assert (=> b!768764 m!714237))

(declare-fun m!714263 () Bool)

(assert (=> b!768764 m!714263))

(assert (=> bm!35092 d!101615))

(declare-fun b!768765 () Bool)

(declare-fun e!428108 () SeekEntryResult!7854)

(assert (=> b!768765 (= e!428108 (MissingVacant!7854 (index!33786 lt!341904)))))

(declare-fun b!768766 () Bool)

(declare-fun e!428107 () SeekEntryResult!7854)

(assert (=> b!768766 (= e!428107 (Found!7854 (index!33786 lt!341904)))))

(declare-fun d!101617 () Bool)

(declare-fun lt!341988 () SeekEntryResult!7854)

(assert (=> d!101617 (and (or ((_ is Undefined!7854) lt!341988) (not ((_ is Found!7854) lt!341988)) (and (bvsge (index!33785 lt!341988) #b00000000000000000000000000000000) (bvslt (index!33785 lt!341988) (size!20675 a!3186)))) (or ((_ is Undefined!7854) lt!341988) ((_ is Found!7854) lt!341988) (not ((_ is MissingVacant!7854) lt!341988)) (not (= (index!33787 lt!341988) (index!33786 lt!341904))) (and (bvsge (index!33787 lt!341988) #b00000000000000000000000000000000) (bvslt (index!33787 lt!341988) (size!20675 a!3186)))) (or ((_ is Undefined!7854) lt!341988) (ite ((_ is Found!7854) lt!341988) (= (select (arr!20254 a!3186) (index!33785 lt!341988)) (select (arr!20254 a!3186) j!159)) (and ((_ is MissingVacant!7854) lt!341988) (= (index!33787 lt!341988) (index!33786 lt!341904)) (= (select (arr!20254 a!3186) (index!33787 lt!341988)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!428106 () SeekEntryResult!7854)

(assert (=> d!101617 (= lt!341988 e!428106)))

(declare-fun c!84851 () Bool)

(assert (=> d!101617 (= c!84851 (bvsge (x!64708 lt!341904) #b01111111111111111111111111111110))))

(declare-fun lt!341989 () (_ BitVec 64))

(assert (=> d!101617 (= lt!341989 (select (arr!20254 a!3186) (index!33786 lt!341904)))))

(assert (=> d!101617 (validMask!0 mask!3328)))

(assert (=> d!101617 (= (seekKeyOrZeroReturnVacant!0 (x!64708 lt!341904) (index!33786 lt!341904) (index!33786 lt!341904) (select (arr!20254 a!3186) j!159) a!3186 mask!3328) lt!341988)))

(declare-fun b!768767 () Bool)

(assert (=> b!768767 (= e!428106 Undefined!7854)))

(declare-fun b!768768 () Bool)

(declare-fun c!84849 () Bool)

(assert (=> b!768768 (= c!84849 (= lt!341989 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!768768 (= e!428107 e!428108)))

(declare-fun b!768769 () Bool)

(assert (=> b!768769 (= e!428106 e!428107)))

(declare-fun c!84850 () Bool)

(assert (=> b!768769 (= c!84850 (= lt!341989 (select (arr!20254 a!3186) j!159)))))

(declare-fun b!768770 () Bool)

(assert (=> b!768770 (= e!428108 (seekKeyOrZeroReturnVacant!0 (bvadd (x!64708 lt!341904) #b00000000000000000000000000000001) (nextIndex!0 (index!33786 lt!341904) (x!64708 lt!341904) mask!3328) (index!33786 lt!341904) (select (arr!20254 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and d!101617 c!84851) b!768767))

(assert (= (and d!101617 (not c!84851)) b!768769))

(assert (= (and b!768769 c!84850) b!768766))

(assert (= (and b!768769 (not c!84850)) b!768768))

(assert (= (and b!768768 c!84849) b!768765))

(assert (= (and b!768768 (not c!84849)) b!768770))

(declare-fun m!714265 () Bool)

(assert (=> d!101617 m!714265))

(declare-fun m!714267 () Bool)

(assert (=> d!101617 m!714267))

(assert (=> d!101617 m!714077))

(assert (=> d!101617 m!713825))

(declare-fun m!714269 () Bool)

(assert (=> b!768770 m!714269))

(assert (=> b!768770 m!714269))

(assert (=> b!768770 m!713833))

(declare-fun m!714271 () Bool)

(assert (=> b!768770 m!714271))

(assert (=> b!768558 d!101617))

(declare-fun d!101619 () Bool)

(assert (=> d!101619 (= (validKeyInArray!0 (select (arr!20254 a!3186) #b00000000000000000000000000000000)) (and (not (= (select (arr!20254 a!3186) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20254 a!3186) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!768515 d!101619))

(declare-fun d!101621 () Bool)

(declare-fun res!519855 () Bool)

(declare-fun e!428111 () Bool)

(assert (=> d!101621 (=> res!519855 e!428111)))

(assert (=> d!101621 (= res!519855 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20675 a!3186)))))

(assert (=> d!101621 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328) e!428111)))

(declare-fun b!768771 () Bool)

(declare-fun e!428110 () Bool)

(declare-fun e!428109 () Bool)

(assert (=> b!768771 (= e!428110 e!428109)))

(declare-fun lt!341992 () (_ BitVec 64))

(assert (=> b!768771 (= lt!341992 (select (arr!20254 a!3186) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!341991 () Unit!26434)

(assert (=> b!768771 (= lt!341991 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!341992 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!768771 (arrayContainsKey!0 a!3186 lt!341992 #b00000000000000000000000000000000)))

(declare-fun lt!341990 () Unit!26434)

(assert (=> b!768771 (= lt!341990 lt!341991)))

(declare-fun res!519856 () Bool)

(assert (=> b!768771 (= res!519856 (= (seekEntryOrOpen!0 (select (arr!20254 a!3186) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) a!3186 mask!3328) (Found!7854 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!768771 (=> (not res!519856) (not e!428109))))

(declare-fun b!768772 () Bool)

(declare-fun call!35108 () Bool)

(assert (=> b!768772 (= e!428109 call!35108)))

(declare-fun b!768773 () Bool)

(assert (=> b!768773 (= e!428111 e!428110)))

(declare-fun c!84852 () Bool)

(assert (=> b!768773 (= c!84852 (validKeyInArray!0 (select (arr!20254 a!3186) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!35105 () Bool)

(assert (=> bm!35105 (= call!35108 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!768774 () Bool)

(assert (=> b!768774 (= e!428110 call!35108)))

(assert (= (and d!101621 (not res!519855)) b!768773))

(assert (= (and b!768773 c!84852) b!768771))

(assert (= (and b!768773 (not c!84852)) b!768774))

(assert (= (and b!768771 res!519856) b!768772))

(assert (= (or b!768772 b!768774) bm!35105))

(assert (=> b!768771 m!714237))

(declare-fun m!714273 () Bool)

(assert (=> b!768771 m!714273))

(declare-fun m!714275 () Bool)

(assert (=> b!768771 m!714275))

(assert (=> b!768771 m!714237))

(declare-fun m!714277 () Bool)

(assert (=> b!768771 m!714277))

(assert (=> b!768773 m!714237))

(assert (=> b!768773 m!714237))

(assert (=> b!768773 m!714261))

(declare-fun m!714279 () Bool)

(assert (=> bm!35105 m!714279))

(assert (=> bm!35089 d!101621))

(assert (=> b!768535 d!101619))

(assert (=> b!768536 d!101619))

(declare-fun d!101623 () Bool)

(declare-fun e!428112 () Bool)

(assert (=> d!101623 e!428112))

(declare-fun c!84855 () Bool)

(declare-fun lt!341993 () SeekEntryResult!7854)

(assert (=> d!101623 (= c!84855 (and ((_ is Intermediate!7854) lt!341993) (undefined!8666 lt!341993)))))

(declare-fun e!428113 () SeekEntryResult!7854)

(assert (=> d!101623 (= lt!341993 e!428113)))

(declare-fun c!84854 () Bool)

(assert (=> d!101623 (= c!84854 (bvsge (bvadd x!1131 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(declare-fun lt!341994 () (_ BitVec 64))

(assert (=> d!101623 (= lt!341994 (select (arr!20254 a!3186) (nextIndex!0 index!1321 x!1131 mask!3328)))))

(assert (=> d!101623 (validMask!0 mask!3328)))

(assert (=> d!101623 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!20254 a!3186) j!159) a!3186 mask!3328) lt!341993)))

(declare-fun b!768775 () Bool)

(declare-fun e!428115 () Bool)

(assert (=> b!768775 (= e!428112 e!428115)))

(declare-fun res!519859 () Bool)

(assert (=> b!768775 (= res!519859 (and ((_ is Intermediate!7854) lt!341993) (not (undefined!8666 lt!341993)) (bvslt (x!64708 lt!341993) #b01111111111111111111111111111110) (bvsge (x!64708 lt!341993) #b00000000000000000000000000000000) (bvsge (x!64708 lt!341993) (bvadd x!1131 #b00000000000000000000000000000001))))))

(assert (=> b!768775 (=> (not res!519859) (not e!428115))))

(declare-fun e!428116 () SeekEntryResult!7854)

(declare-fun b!768776 () Bool)

(assert (=> b!768776 (= e!428116 (Intermediate!7854 false (nextIndex!0 index!1321 x!1131 mask!3328) (bvadd x!1131 #b00000000000000000000000000000001)))))

(declare-fun b!768777 () Bool)

(assert (=> b!768777 (= e!428112 (bvsge (x!64708 lt!341993) #b01111111111111111111111111111110))))

(declare-fun b!768778 () Bool)

(assert (=> b!768778 (= e!428113 e!428116)))

(declare-fun c!84853 () Bool)

(assert (=> b!768778 (= c!84853 (or (= lt!341994 (select (arr!20254 a!3186) j!159)) (= (bvadd lt!341994 lt!341994) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!768779 () Bool)

(assert (=> b!768779 (= e!428116 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!1321 x!1131 mask!3328) (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) (select (arr!20254 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!768780 () Bool)

(assert (=> b!768780 (and (bvsge (index!33786 lt!341993) #b00000000000000000000000000000000) (bvslt (index!33786 lt!341993) (size!20675 a!3186)))))

(declare-fun res!519857 () Bool)

(assert (=> b!768780 (= res!519857 (= (select (arr!20254 a!3186) (index!33786 lt!341993)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!428114 () Bool)

(assert (=> b!768780 (=> res!519857 e!428114)))

(declare-fun b!768781 () Bool)

(assert (=> b!768781 (and (bvsge (index!33786 lt!341993) #b00000000000000000000000000000000) (bvslt (index!33786 lt!341993) (size!20675 a!3186)))))

(assert (=> b!768781 (= e!428114 (= (select (arr!20254 a!3186) (index!33786 lt!341993)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!768782 () Bool)

(assert (=> b!768782 (and (bvsge (index!33786 lt!341993) #b00000000000000000000000000000000) (bvslt (index!33786 lt!341993) (size!20675 a!3186)))))

(declare-fun res!519858 () Bool)

(assert (=> b!768782 (= res!519858 (= (select (arr!20254 a!3186) (index!33786 lt!341993)) (select (arr!20254 a!3186) j!159)))))

(assert (=> b!768782 (=> res!519858 e!428114)))

(assert (=> b!768782 (= e!428115 e!428114)))

(declare-fun b!768783 () Bool)

(assert (=> b!768783 (= e!428113 (Intermediate!7854 true (nextIndex!0 index!1321 x!1131 mask!3328) (bvadd x!1131 #b00000000000000000000000000000001)))))

(assert (= (and d!101623 c!84854) b!768783))

(assert (= (and d!101623 (not c!84854)) b!768778))

(assert (= (and b!768778 c!84853) b!768776))

(assert (= (and b!768778 (not c!84853)) b!768779))

(assert (= (and d!101623 c!84855) b!768777))

(assert (= (and d!101623 (not c!84855)) b!768775))

(assert (= (and b!768775 res!519859) b!768782))

(assert (= (and b!768782 (not res!519858)) b!768780))

(assert (= (and b!768780 (not res!519857)) b!768781))

(declare-fun m!714281 () Bool)

(assert (=> b!768782 m!714281))

(assert (=> b!768780 m!714281))

(assert (=> d!101623 m!713863))

(declare-fun m!714283 () Bool)

(assert (=> d!101623 m!714283))

(assert (=> d!101623 m!713825))

(assert (=> b!768781 m!714281))

(assert (=> b!768779 m!713863))

(declare-fun m!714285 () Bool)

(assert (=> b!768779 m!714285))

(assert (=> b!768779 m!714285))

(assert (=> b!768779 m!713833))

(declare-fun m!714287 () Bool)

(assert (=> b!768779 m!714287))

(assert (=> b!768490 d!101623))

(assert (=> b!768490 d!101545))

(declare-fun d!101625 () Bool)

(declare-fun lt!341997 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!381 (List!14256) (InoxSet (_ BitVec 64)))

(assert (=> d!101625 (= lt!341997 (select (content!381 Nil!14253) (select (arr!20254 a!3186) #b00000000000000000000000000000000)))))

(declare-fun e!428122 () Bool)

(assert (=> d!101625 (= lt!341997 e!428122)))

(declare-fun res!519864 () Bool)

(assert (=> d!101625 (=> (not res!519864) (not e!428122))))

(assert (=> d!101625 (= res!519864 ((_ is Cons!14252) Nil!14253))))

(assert (=> d!101625 (= (contains!4086 Nil!14253 (select (arr!20254 a!3186) #b00000000000000000000000000000000)) lt!341997)))

(declare-fun b!768788 () Bool)

(declare-fun e!428121 () Bool)

(assert (=> b!768788 (= e!428122 e!428121)))

(declare-fun res!519865 () Bool)

(assert (=> b!768788 (=> res!519865 e!428121)))

(assert (=> b!768788 (= res!519865 (= (h!15348 Nil!14253) (select (arr!20254 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!768789 () Bool)

(assert (=> b!768789 (= e!428121 (contains!4086 (t!20571 Nil!14253) (select (arr!20254 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!101625 res!519864) b!768788))

(assert (= (and b!768788 (not res!519865)) b!768789))

(declare-fun m!714289 () Bool)

(assert (=> d!101625 m!714289))

(assert (=> d!101625 m!713925))

(declare-fun m!714291 () Bool)

(assert (=> d!101625 m!714291))

(assert (=> b!768789 m!713925))

(declare-fun m!714293 () Bool)

(assert (=> b!768789 m!714293))

(assert (=> b!768537 d!101625))

(assert (=> d!101517 d!101511))

(declare-fun b!768790 () Bool)

(declare-fun e!428125 () SeekEntryResult!7854)

(assert (=> b!768790 (= e!428125 (MissingVacant!7854 resIntermediateIndex!5))))

(declare-fun b!768791 () Bool)

(declare-fun e!428124 () SeekEntryResult!7854)

(assert (=> b!768791 (= e!428124 (Found!7854 (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328)))))

(declare-fun d!101627 () Bool)

(declare-fun lt!341998 () SeekEntryResult!7854)

(assert (=> d!101627 (and (or ((_ is Undefined!7854) lt!341998) (not ((_ is Found!7854) lt!341998)) (and (bvsge (index!33785 lt!341998) #b00000000000000000000000000000000) (bvslt (index!33785 lt!341998) (size!20675 a!3186)))) (or ((_ is Undefined!7854) lt!341998) ((_ is Found!7854) lt!341998) (not ((_ is MissingVacant!7854) lt!341998)) (not (= (index!33787 lt!341998) resIntermediateIndex!5)) (and (bvsge (index!33787 lt!341998) #b00000000000000000000000000000000) (bvslt (index!33787 lt!341998) (size!20675 a!3186)))) (or ((_ is Undefined!7854) lt!341998) (ite ((_ is Found!7854) lt!341998) (= (select (arr!20254 a!3186) (index!33785 lt!341998)) (select (arr!20254 a!3186) j!159)) (and ((_ is MissingVacant!7854) lt!341998) (= (index!33787 lt!341998) resIntermediateIndex!5) (= (select (arr!20254 a!3186) (index!33787 lt!341998)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!428123 () SeekEntryResult!7854)

(assert (=> d!101627 (= lt!341998 e!428123)))

(declare-fun c!84858 () Bool)

(assert (=> d!101627 (= c!84858 (bvsge (bvadd resIntermediateX!5 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(declare-fun lt!341999 () (_ BitVec 64))

(assert (=> d!101627 (= lt!341999 (select (arr!20254 a!3186) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328)))))

(assert (=> d!101627 (validMask!0 mask!3328)))

(assert (=> d!101627 (= (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) resIntermediateIndex!5 (select (arr!20254 a!3186) j!159) a!3186 mask!3328) lt!341998)))

(declare-fun b!768792 () Bool)

(assert (=> b!768792 (= e!428123 Undefined!7854)))

(declare-fun b!768793 () Bool)

(declare-fun c!84856 () Bool)

(assert (=> b!768793 (= c!84856 (= lt!341999 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!768793 (= e!428124 e!428125)))

(declare-fun b!768794 () Bool)

(assert (=> b!768794 (= e!428123 e!428124)))

(declare-fun c!84857 () Bool)

(assert (=> b!768794 (= c!84857 (= lt!341999 (select (arr!20254 a!3186) j!159)))))

(declare-fun b!768795 () Bool)

(assert (=> b!768795 (= e!428125 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) (bvadd resIntermediateX!5 #b00000000000000000000000000000001) mask!3328) resIntermediateIndex!5 (select (arr!20254 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and d!101627 c!84858) b!768792))

(assert (= (and d!101627 (not c!84858)) b!768794))

(assert (= (and b!768794 c!84857) b!768791))

(assert (= (and b!768794 (not c!84857)) b!768793))

(assert (= (and b!768793 c!84856) b!768790))

(assert (= (and b!768793 (not c!84856)) b!768795))

(declare-fun m!714295 () Bool)

(assert (=> d!101627 m!714295))

(declare-fun m!714297 () Bool)

(assert (=> d!101627 m!714297))

(assert (=> d!101627 m!714049))

(declare-fun m!714299 () Bool)

(assert (=> d!101627 m!714299))

(assert (=> d!101627 m!713825))

(assert (=> b!768795 m!714049))

(declare-fun m!714301 () Bool)

(assert (=> b!768795 m!714301))

(assert (=> b!768795 m!714301))

(assert (=> b!768795 m!713833))

(declare-fun m!714303 () Bool)

(assert (=> b!768795 m!714303))

(assert (=> b!768500 d!101627))

(declare-fun d!101629 () Bool)

(declare-fun lt!342000 () (_ BitVec 32))

(assert (=> d!101629 (and (bvsge lt!342000 #b00000000000000000000000000000000) (bvslt lt!342000 (bvadd mask!3328 #b00000000000000000000000000000001)))))

(assert (=> d!101629 (= lt!342000 (choose!52 resIntermediateIndex!5 resIntermediateX!5 mask!3328))))

(assert (=> d!101629 (validMask!0 mask!3328)))

(assert (=> d!101629 (= (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) lt!342000)))

(declare-fun bs!21542 () Bool)

(assert (= bs!21542 d!101629))

(declare-fun m!714305 () Bool)

(assert (=> bs!21542 m!714305))

(assert (=> bs!21542 m!713825))

(assert (=> b!768500 d!101629))

(declare-fun d!101631 () Bool)

(declare-fun e!428126 () Bool)

(assert (=> d!101631 e!428126))

(declare-fun c!84861 () Bool)

(declare-fun lt!342001 () SeekEntryResult!7854)

(assert (=> d!101631 (= c!84861 (and ((_ is Intermediate!7854) lt!342001) (undefined!8666 lt!342001)))))

(declare-fun e!428127 () SeekEntryResult!7854)

(assert (=> d!101631 (= lt!342001 e!428127)))

(declare-fun c!84860 () Bool)

(assert (=> d!101631 (= c!84860 (bvsge (bvadd x!1131 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(declare-fun lt!342002 () (_ BitVec 64))

(assert (=> d!101631 (= lt!342002 (select (arr!20254 lt!341766) (nextIndex!0 index!1321 x!1131 mask!3328)))))

(assert (=> d!101631 (validMask!0 mask!3328)))

(assert (=> d!101631 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!341768 lt!341766 mask!3328) lt!342001)))

(declare-fun b!768796 () Bool)

(declare-fun e!428129 () Bool)

(assert (=> b!768796 (= e!428126 e!428129)))

(declare-fun res!519868 () Bool)

(assert (=> b!768796 (= res!519868 (and ((_ is Intermediate!7854) lt!342001) (not (undefined!8666 lt!342001)) (bvslt (x!64708 lt!342001) #b01111111111111111111111111111110) (bvsge (x!64708 lt!342001) #b00000000000000000000000000000000) (bvsge (x!64708 lt!342001) (bvadd x!1131 #b00000000000000000000000000000001))))))

(assert (=> b!768796 (=> (not res!519868) (not e!428129))))

(declare-fun e!428130 () SeekEntryResult!7854)

(declare-fun b!768797 () Bool)

(assert (=> b!768797 (= e!428130 (Intermediate!7854 false (nextIndex!0 index!1321 x!1131 mask!3328) (bvadd x!1131 #b00000000000000000000000000000001)))))

(declare-fun b!768798 () Bool)

(assert (=> b!768798 (= e!428126 (bvsge (x!64708 lt!342001) #b01111111111111111111111111111110))))

(declare-fun b!768799 () Bool)

(assert (=> b!768799 (= e!428127 e!428130)))

(declare-fun c!84859 () Bool)

(assert (=> b!768799 (= c!84859 (or (= lt!342002 lt!341768) (= (bvadd lt!342002 lt!342002) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!768800 () Bool)

(assert (=> b!768800 (= e!428130 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!1321 x!1131 mask!3328) (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) lt!341768 lt!341766 mask!3328))))

(declare-fun b!768801 () Bool)

(assert (=> b!768801 (and (bvsge (index!33786 lt!342001) #b00000000000000000000000000000000) (bvslt (index!33786 lt!342001) (size!20675 lt!341766)))))

(declare-fun res!519866 () Bool)

(assert (=> b!768801 (= res!519866 (= (select (arr!20254 lt!341766) (index!33786 lt!342001)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!428128 () Bool)

(assert (=> b!768801 (=> res!519866 e!428128)))

(declare-fun b!768802 () Bool)

(assert (=> b!768802 (and (bvsge (index!33786 lt!342001) #b00000000000000000000000000000000) (bvslt (index!33786 lt!342001) (size!20675 lt!341766)))))

(assert (=> b!768802 (= e!428128 (= (select (arr!20254 lt!341766) (index!33786 lt!342001)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!768803 () Bool)

(assert (=> b!768803 (and (bvsge (index!33786 lt!342001) #b00000000000000000000000000000000) (bvslt (index!33786 lt!342001) (size!20675 lt!341766)))))

(declare-fun res!519867 () Bool)

(assert (=> b!768803 (= res!519867 (= (select (arr!20254 lt!341766) (index!33786 lt!342001)) lt!341768))))

(assert (=> b!768803 (=> res!519867 e!428128)))

(assert (=> b!768803 (= e!428129 e!428128)))

(declare-fun b!768804 () Bool)

(assert (=> b!768804 (= e!428127 (Intermediate!7854 true (nextIndex!0 index!1321 x!1131 mask!3328) (bvadd x!1131 #b00000000000000000000000000000001)))))

(assert (= (and d!101631 c!84860) b!768804))

(assert (= (and d!101631 (not c!84860)) b!768799))

(assert (= (and b!768799 c!84859) b!768797))

(assert (= (and b!768799 (not c!84859)) b!768800))

(assert (= (and d!101631 c!84861) b!768798))

(assert (= (and d!101631 (not c!84861)) b!768796))

(assert (= (and b!768796 res!519868) b!768803))

(assert (= (and b!768803 (not res!519867)) b!768801))

(assert (= (and b!768801 (not res!519866)) b!768802))

(declare-fun m!714307 () Bool)

(assert (=> b!768803 m!714307))

(assert (=> b!768801 m!714307))

(assert (=> d!101631 m!713863))

(declare-fun m!714309 () Bool)

(assert (=> d!101631 m!714309))

(assert (=> d!101631 m!713825))

(assert (=> b!768802 m!714307))

(assert (=> b!768800 m!713863))

(assert (=> b!768800 m!714285))

(assert (=> b!768800 m!714285))

(declare-fun m!714311 () Bool)

(assert (=> b!768800 m!714311))

(assert (=> b!768364 d!101631))

(assert (=> b!768364 d!101545))

(assert (=> d!101535 d!101511))

(declare-fun d!101633 () Bool)

(declare-fun e!428131 () Bool)

(assert (=> d!101633 e!428131))

(declare-fun c!84864 () Bool)

(declare-fun lt!342003 () SeekEntryResult!7854)

(assert (=> d!101633 (= c!84864 (and ((_ is Intermediate!7854) lt!342003) (undefined!8666 lt!342003)))))

(declare-fun e!428132 () SeekEntryResult!7854)

(assert (=> d!101633 (= lt!342003 e!428132)))

(declare-fun c!84863 () Bool)

(assert (=> d!101633 (= c!84863 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!342004 () (_ BitVec 64))

(assert (=> d!101633 (= lt!342004 (select (arr!20254 a!3186) (toIndex!0 k0!2102 mask!3328)))))

(assert (=> d!101633 (validMask!0 mask!3328)))

(assert (=> d!101633 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328) lt!342003)))

(declare-fun b!768805 () Bool)

(declare-fun e!428134 () Bool)

(assert (=> b!768805 (= e!428131 e!428134)))

(declare-fun res!519871 () Bool)

(assert (=> b!768805 (= res!519871 (and ((_ is Intermediate!7854) lt!342003) (not (undefined!8666 lt!342003)) (bvslt (x!64708 lt!342003) #b01111111111111111111111111111110) (bvsge (x!64708 lt!342003) #b00000000000000000000000000000000) (bvsge (x!64708 lt!342003) #b00000000000000000000000000000000)))))

(assert (=> b!768805 (=> (not res!519871) (not e!428134))))

(declare-fun b!768806 () Bool)

(declare-fun e!428135 () SeekEntryResult!7854)

(assert (=> b!768806 (= e!428135 (Intermediate!7854 false (toIndex!0 k0!2102 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!768807 () Bool)

(assert (=> b!768807 (= e!428131 (bvsge (x!64708 lt!342003) #b01111111111111111111111111111110))))

(declare-fun b!768808 () Bool)

(assert (=> b!768808 (= e!428132 e!428135)))

(declare-fun c!84862 () Bool)

(assert (=> b!768808 (= c!84862 (or (= lt!342004 k0!2102) (= (bvadd lt!342004 lt!342004) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!768809 () Bool)

(assert (=> b!768809 (= e!428135 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2102 mask!3328) #b00000000000000000000000000000000 mask!3328) k0!2102 a!3186 mask!3328))))

(declare-fun b!768810 () Bool)

(assert (=> b!768810 (and (bvsge (index!33786 lt!342003) #b00000000000000000000000000000000) (bvslt (index!33786 lt!342003) (size!20675 a!3186)))))

(declare-fun res!519869 () Bool)

(assert (=> b!768810 (= res!519869 (= (select (arr!20254 a!3186) (index!33786 lt!342003)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!428133 () Bool)

(assert (=> b!768810 (=> res!519869 e!428133)))

(declare-fun b!768811 () Bool)

(assert (=> b!768811 (and (bvsge (index!33786 lt!342003) #b00000000000000000000000000000000) (bvslt (index!33786 lt!342003) (size!20675 a!3186)))))

(assert (=> b!768811 (= e!428133 (= (select (arr!20254 a!3186) (index!33786 lt!342003)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!768812 () Bool)

(assert (=> b!768812 (and (bvsge (index!33786 lt!342003) #b00000000000000000000000000000000) (bvslt (index!33786 lt!342003) (size!20675 a!3186)))))

(declare-fun res!519870 () Bool)

(assert (=> b!768812 (= res!519870 (= (select (arr!20254 a!3186) (index!33786 lt!342003)) k0!2102))))

(assert (=> b!768812 (=> res!519870 e!428133)))

(assert (=> b!768812 (= e!428134 e!428133)))

(declare-fun b!768813 () Bool)

(assert (=> b!768813 (= e!428132 (Intermediate!7854 true (toIndex!0 k0!2102 mask!3328) #b00000000000000000000000000000000))))

(assert (= (and d!101633 c!84863) b!768813))

(assert (= (and d!101633 (not c!84863)) b!768808))

(assert (= (and b!768808 c!84862) b!768806))

(assert (= (and b!768808 (not c!84862)) b!768809))

(assert (= (and d!101633 c!84864) b!768807))

(assert (= (and d!101633 (not c!84864)) b!768805))

(assert (= (and b!768805 res!519871) b!768812))

(assert (= (and b!768812 (not res!519870)) b!768810))

(assert (= (and b!768810 (not res!519869)) b!768811))

(declare-fun m!714313 () Bool)

(assert (=> b!768812 m!714313))

(assert (=> b!768810 m!714313))

(assert (=> d!101633 m!714033))

(declare-fun m!714315 () Bool)

(assert (=> d!101633 m!714315))

(assert (=> d!101633 m!713825))

(assert (=> b!768811 m!714313))

(assert (=> b!768809 m!714033))

(declare-fun m!714317 () Bool)

(assert (=> b!768809 m!714317))

(assert (=> b!768809 m!714317))

(declare-fun m!714319 () Bool)

(assert (=> b!768809 m!714319))

(assert (=> d!101519 d!101633))

(declare-fun d!101635 () Bool)

(declare-fun lt!342006 () (_ BitVec 32))

(declare-fun lt!342005 () (_ BitVec 32))

(assert (=> d!101635 (= lt!342006 (bvmul (bvxor lt!342005 (bvlshr lt!342005 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!101635 (= lt!342005 ((_ extract 31 0) (bvand (bvxor k0!2102 (bvlshr k0!2102 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!101635 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!519743 (let ((h!15350 ((_ extract 31 0) (bvand (bvxor k0!2102 (bvlshr k0!2102 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64711 (bvmul (bvxor h!15350 (bvlshr h!15350 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64711 (bvlshr x!64711 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!519743 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!519743 #b00000000000000000000000000000000))))))

(assert (=> d!101635 (= (toIndex!0 k0!2102 mask!3328) (bvand (bvxor lt!342006 (bvlshr lt!342006 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> d!101519 d!101635))

(assert (=> d!101519 d!101511))

(declare-fun d!101637 () Bool)

(assert (=> d!101637 (arrayContainsKey!0 a!3186 lt!341810 #b00000000000000000000000000000000)))

(declare-fun lt!342007 () Unit!26434)

(assert (=> d!101637 (= lt!342007 (choose!13 a!3186 lt!341810 j!159))))

(assert (=> d!101637 (bvsge j!159 #b00000000000000000000000000000000)))

(assert (=> d!101637 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!341810 j!159) lt!342007)))

(declare-fun bs!21543 () Bool)

(assert (= bs!21543 d!101637))

(assert (=> bs!21543 m!713931))

(declare-fun m!714321 () Bool)

(assert (=> bs!21543 m!714321))

(assert (=> b!768329 d!101637))

(declare-fun d!101639 () Bool)

(declare-fun res!519872 () Bool)

(declare-fun e!428136 () Bool)

(assert (=> d!101639 (=> res!519872 e!428136)))

(assert (=> d!101639 (= res!519872 (= (select (arr!20254 a!3186) #b00000000000000000000000000000000) lt!341810))))

(assert (=> d!101639 (= (arrayContainsKey!0 a!3186 lt!341810 #b00000000000000000000000000000000) e!428136)))

(declare-fun b!768814 () Bool)

(declare-fun e!428137 () Bool)

(assert (=> b!768814 (= e!428136 e!428137)))

(declare-fun res!519873 () Bool)

(assert (=> b!768814 (=> (not res!519873) (not e!428137))))

(assert (=> b!768814 (= res!519873 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20675 a!3186)))))

(declare-fun b!768815 () Bool)

(assert (=> b!768815 (= e!428137 (arrayContainsKey!0 a!3186 lt!341810 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!101639 (not res!519872)) b!768814))

(assert (= (and b!768814 res!519873) b!768815))

(assert (=> d!101639 m!713925))

(declare-fun m!714323 () Bool)

(assert (=> b!768815 m!714323))

(assert (=> b!768329 d!101639))

(assert (=> b!768329 d!101547))

(assert (=> d!101491 d!101511))

(declare-fun b!768816 () Bool)

(declare-fun e!428140 () SeekEntryResult!7854)

(assert (=> b!768816 (= e!428140 (MissingVacant!7854 (index!33786 lt!341881)))))

(declare-fun b!768817 () Bool)

(declare-fun e!428139 () SeekEntryResult!7854)

(assert (=> b!768817 (= e!428139 (Found!7854 (index!33786 lt!341881)))))

(declare-fun lt!342008 () SeekEntryResult!7854)

(declare-fun d!101641 () Bool)

(assert (=> d!101641 (and (or ((_ is Undefined!7854) lt!342008) (not ((_ is Found!7854) lt!342008)) (and (bvsge (index!33785 lt!342008) #b00000000000000000000000000000000) (bvslt (index!33785 lt!342008) (size!20675 a!3186)))) (or ((_ is Undefined!7854) lt!342008) ((_ is Found!7854) lt!342008) (not ((_ is MissingVacant!7854) lt!342008)) (not (= (index!33787 lt!342008) (index!33786 lt!341881))) (and (bvsge (index!33787 lt!342008) #b00000000000000000000000000000000) (bvslt (index!33787 lt!342008) (size!20675 a!3186)))) (or ((_ is Undefined!7854) lt!342008) (ite ((_ is Found!7854) lt!342008) (= (select (arr!20254 a!3186) (index!33785 lt!342008)) k0!2102) (and ((_ is MissingVacant!7854) lt!342008) (= (index!33787 lt!342008) (index!33786 lt!341881)) (= (select (arr!20254 a!3186) (index!33787 lt!342008)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!428138 () SeekEntryResult!7854)

(assert (=> d!101641 (= lt!342008 e!428138)))

(declare-fun c!84867 () Bool)

(assert (=> d!101641 (= c!84867 (bvsge (x!64708 lt!341881) #b01111111111111111111111111111110))))

(declare-fun lt!342009 () (_ BitVec 64))

(assert (=> d!101641 (= lt!342009 (select (arr!20254 a!3186) (index!33786 lt!341881)))))

(assert (=> d!101641 (validMask!0 mask!3328)))

(assert (=> d!101641 (= (seekKeyOrZeroReturnVacant!0 (x!64708 lt!341881) (index!33786 lt!341881) (index!33786 lt!341881) k0!2102 a!3186 mask!3328) lt!342008)))

(declare-fun b!768818 () Bool)

(assert (=> b!768818 (= e!428138 Undefined!7854)))

(declare-fun b!768819 () Bool)

(declare-fun c!84865 () Bool)

(assert (=> b!768819 (= c!84865 (= lt!342009 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!768819 (= e!428139 e!428140)))

(declare-fun b!768820 () Bool)

(assert (=> b!768820 (= e!428138 e!428139)))

(declare-fun c!84866 () Bool)

(assert (=> b!768820 (= c!84866 (= lt!342009 k0!2102))))

(declare-fun b!768821 () Bool)

(assert (=> b!768821 (= e!428140 (seekKeyOrZeroReturnVacant!0 (bvadd (x!64708 lt!341881) #b00000000000000000000000000000001) (nextIndex!0 (index!33786 lt!341881) (x!64708 lt!341881) mask!3328) (index!33786 lt!341881) k0!2102 a!3186 mask!3328))))

(assert (= (and d!101641 c!84867) b!768818))

(assert (= (and d!101641 (not c!84867)) b!768820))

(assert (= (and b!768820 c!84866) b!768817))

(assert (= (and b!768820 (not c!84866)) b!768819))

(assert (= (and b!768819 c!84865) b!768816))

(assert (= (and b!768819 (not c!84865)) b!768821))

(declare-fun m!714325 () Bool)

(assert (=> d!101641 m!714325))

(declare-fun m!714327 () Bool)

(assert (=> d!101641 m!714327))

(assert (=> d!101641 m!714027))

(assert (=> d!101641 m!713825))

(declare-fun m!714329 () Bool)

(assert (=> b!768821 m!714329))

(assert (=> b!768821 m!714329))

(declare-fun m!714331 () Bool)

(assert (=> b!768821 m!714331))

(assert (=> b!768482 d!101641))

(assert (=> d!101547 d!101485))

(assert (=> d!101547 d!101487))

(assert (=> d!101547 d!101511))

(declare-fun d!101643 () Bool)

(declare-fun res!519876 () (_ BitVec 32))

(assert (=> d!101643 (and (bvsge res!519876 #b00000000000000000000000000000000) (bvslt res!519876 (bvadd mask!3328 #b00000000000000000000000000000001)))))

(assert (=> d!101643 true))

(assert (=> d!101643 (= (choose!52 index!1321 x!1131 mask!3328) res!519876)))

(assert (=> d!101545 d!101643))

(assert (=> d!101545 d!101511))

(declare-fun d!101645 () Bool)

(declare-fun res!519877 () Bool)

(declare-fun e!428143 () Bool)

(assert (=> d!101645 (=> res!519877 e!428143)))

(assert (=> d!101645 (= res!519877 (bvsge (bvadd j!159 #b00000000000000000000000000000001) (size!20675 a!3186)))))

(assert (=> d!101645 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328) e!428143)))

(declare-fun b!768822 () Bool)

(declare-fun e!428142 () Bool)

(declare-fun e!428141 () Bool)

(assert (=> b!768822 (= e!428142 e!428141)))

(declare-fun lt!342012 () (_ BitVec 64))

(assert (=> b!768822 (= lt!342012 (select (arr!20254 a!3186) (bvadd j!159 #b00000000000000000000000000000001)))))

(declare-fun lt!342011 () Unit!26434)

(assert (=> b!768822 (= lt!342011 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!342012 (bvadd j!159 #b00000000000000000000000000000001)))))

(assert (=> b!768822 (arrayContainsKey!0 a!3186 lt!342012 #b00000000000000000000000000000000)))

(declare-fun lt!342010 () Unit!26434)

(assert (=> b!768822 (= lt!342010 lt!342011)))

(declare-fun res!519878 () Bool)

(assert (=> b!768822 (= res!519878 (= (seekEntryOrOpen!0 (select (arr!20254 a!3186) (bvadd j!159 #b00000000000000000000000000000001)) a!3186 mask!3328) (Found!7854 (bvadd j!159 #b00000000000000000000000000000001))))))

(assert (=> b!768822 (=> (not res!519878) (not e!428141))))

(declare-fun b!768823 () Bool)

(declare-fun call!35109 () Bool)

(assert (=> b!768823 (= e!428141 call!35109)))

(declare-fun b!768824 () Bool)

(assert (=> b!768824 (= e!428143 e!428142)))

(declare-fun c!84868 () Bool)

(assert (=> b!768824 (= c!84868 (validKeyInArray!0 (select (arr!20254 a!3186) (bvadd j!159 #b00000000000000000000000000000001))))))

(declare-fun bm!35106 () Bool)

(assert (=> bm!35106 (= call!35109 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!768825 () Bool)

(assert (=> b!768825 (= e!428142 call!35109)))

(assert (= (and d!101645 (not res!519877)) b!768824))

(assert (= (and b!768824 c!84868) b!768822))

(assert (= (and b!768824 (not c!84868)) b!768825))

(assert (= (and b!768822 res!519878) b!768823))

(assert (= (or b!768823 b!768825) bm!35106))

(declare-fun m!714333 () Bool)

(assert (=> b!768822 m!714333))

(declare-fun m!714335 () Bool)

(assert (=> b!768822 m!714335))

(declare-fun m!714337 () Bool)

(assert (=> b!768822 m!714337))

(assert (=> b!768822 m!714333))

(declare-fun m!714339 () Bool)

(assert (=> b!768822 m!714339))

(assert (=> b!768824 m!714333))

(assert (=> b!768824 m!714333))

(declare-fun m!714341 () Bool)

(assert (=> b!768824 m!714341))

(declare-fun m!714343 () Bool)

(assert (=> bm!35106 m!714343))

(assert (=> bm!35085 d!101645))

(assert (=> b!768331 d!101509))

(assert (=> d!101537 d!101511))

(assert (=> d!101499 d!101511))

(declare-fun b!768826 () Bool)

(declare-fun e!428146 () SeekEntryResult!7854)

(assert (=> b!768826 (= e!428146 (MissingVacant!7854 resIntermediateIndex!5))))

(declare-fun b!768827 () Bool)

(declare-fun e!428145 () SeekEntryResult!7854)

(assert (=> b!768827 (= e!428145 (Found!7854 (nextIndex!0 lt!341765 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328)))))

(declare-fun d!101647 () Bool)

(declare-fun lt!342013 () SeekEntryResult!7854)

(assert (=> d!101647 (and (or ((_ is Undefined!7854) lt!342013) (not ((_ is Found!7854) lt!342013)) (and (bvsge (index!33785 lt!342013) #b00000000000000000000000000000000) (bvslt (index!33785 lt!342013) (size!20675 a!3186)))) (or ((_ is Undefined!7854) lt!342013) ((_ is Found!7854) lt!342013) (not ((_ is MissingVacant!7854) lt!342013)) (not (= (index!33787 lt!342013) resIntermediateIndex!5)) (and (bvsge (index!33787 lt!342013) #b00000000000000000000000000000000) (bvslt (index!33787 lt!342013) (size!20675 a!3186)))) (or ((_ is Undefined!7854) lt!342013) (ite ((_ is Found!7854) lt!342013) (= (select (arr!20254 a!3186) (index!33785 lt!342013)) (select (arr!20254 a!3186) j!159)) (and ((_ is MissingVacant!7854) lt!342013) (= (index!33787 lt!342013) resIntermediateIndex!5) (= (select (arr!20254 a!3186) (index!33787 lt!342013)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!428144 () SeekEntryResult!7854)

(assert (=> d!101647 (= lt!342013 e!428144)))

(declare-fun c!84871 () Bool)

(assert (=> d!101647 (= c!84871 (bvsge (bvadd #b00000000000000000000000000000001 x!1131 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(declare-fun lt!342014 () (_ BitVec 64))

(assert (=> d!101647 (= lt!342014 (select (arr!20254 a!3186) (nextIndex!0 lt!341765 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328)))))

(assert (=> d!101647 (validMask!0 mask!3328)))

(assert (=> d!101647 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131 #b00000000000000000000000000000001) (nextIndex!0 lt!341765 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328) resIntermediateIndex!5 (select (arr!20254 a!3186) j!159) a!3186 mask!3328) lt!342013)))

(declare-fun b!768828 () Bool)

(assert (=> b!768828 (= e!428144 Undefined!7854)))

(declare-fun b!768829 () Bool)

(declare-fun c!84869 () Bool)

(assert (=> b!768829 (= c!84869 (= lt!342014 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!768829 (= e!428145 e!428146)))

(declare-fun b!768830 () Bool)

(assert (=> b!768830 (= e!428144 e!428145)))

(declare-fun c!84870 () Bool)

(assert (=> b!768830 (= c!84870 (= lt!342014 (select (arr!20254 a!3186) j!159)))))

(declare-fun b!768831 () Bool)

(assert (=> b!768831 (= e!428146 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 lt!341765 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328) (bvadd #b00000000000000000000000000000001 x!1131 #b00000000000000000000000000000001) mask!3328) resIntermediateIndex!5 (select (arr!20254 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and d!101647 c!84871) b!768828))

(assert (= (and d!101647 (not c!84871)) b!768830))

(assert (= (and b!768830 c!84870) b!768827))

(assert (= (and b!768830 (not c!84870)) b!768829))

(assert (= (and b!768829 c!84869) b!768826))

(assert (= (and b!768829 (not c!84869)) b!768831))

(declare-fun m!714345 () Bool)

(assert (=> d!101647 m!714345))

(declare-fun m!714347 () Bool)

(assert (=> d!101647 m!714347))

(assert (=> d!101647 m!713975))

(declare-fun m!714349 () Bool)

(assert (=> d!101647 m!714349))

(assert (=> d!101647 m!713825))

(assert (=> b!768831 m!713975))

(declare-fun m!714351 () Bool)

(assert (=> b!768831 m!714351))

(assert (=> b!768831 m!714351))

(assert (=> b!768831 m!713833))

(declare-fun m!714353 () Bool)

(assert (=> b!768831 m!714353))

(assert (=> b!768413 d!101647))

(declare-fun d!101649 () Bool)

(declare-fun lt!342015 () (_ BitVec 32))

(assert (=> d!101649 (and (bvsge lt!342015 #b00000000000000000000000000000000) (bvslt lt!342015 (bvadd mask!3328 #b00000000000000000000000000000001)))))

(assert (=> d!101649 (= lt!342015 (choose!52 lt!341765 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(assert (=> d!101649 (validMask!0 mask!3328)))

(assert (=> d!101649 (= (nextIndex!0 lt!341765 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328) lt!342015)))

(declare-fun bs!21544 () Bool)

(assert (= bs!21544 d!101649))

(declare-fun m!714355 () Bool)

(assert (=> bs!21544 m!714355))

(assert (=> bs!21544 m!713825))

(assert (=> b!768413 d!101649))

(assert (=> d!101485 d!101511))

(declare-fun d!101651 () Bool)

(declare-fun e!428147 () Bool)

(assert (=> d!101651 e!428147))

(declare-fun c!84874 () Bool)

(declare-fun lt!342016 () SeekEntryResult!7854)

(assert (=> d!101651 (= c!84874 (and ((_ is Intermediate!7854) lt!342016) (undefined!8666 lt!342016)))))

(declare-fun e!428148 () SeekEntryResult!7854)

(assert (=> d!101651 (= lt!342016 e!428148)))

(declare-fun c!84873 () Bool)

(assert (=> d!101651 (= c!84873 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(declare-fun lt!342017 () (_ BitVec 64))

(assert (=> d!101651 (= lt!342017 (select (arr!20254 lt!341766) (nextIndex!0 (toIndex!0 lt!341768 mask!3328) #b00000000000000000000000000000000 mask!3328)))))

(assert (=> d!101651 (validMask!0 mask!3328)))

(assert (=> d!101651 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!341768 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!341768 lt!341766 mask!3328) lt!342016)))

(declare-fun b!768832 () Bool)

(declare-fun e!428150 () Bool)

(assert (=> b!768832 (= e!428147 e!428150)))

(declare-fun res!519881 () Bool)

(assert (=> b!768832 (= res!519881 (and ((_ is Intermediate!7854) lt!342016) (not (undefined!8666 lt!342016)) (bvslt (x!64708 lt!342016) #b01111111111111111111111111111110) (bvsge (x!64708 lt!342016) #b00000000000000000000000000000000) (bvsge (x!64708 lt!342016) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!768832 (=> (not res!519881) (not e!428150))))

(declare-fun b!768833 () Bool)

(declare-fun e!428151 () SeekEntryResult!7854)

(assert (=> b!768833 (= e!428151 (Intermediate!7854 false (nextIndex!0 (toIndex!0 lt!341768 mask!3328) #b00000000000000000000000000000000 mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!768834 () Bool)

(assert (=> b!768834 (= e!428147 (bvsge (x!64708 lt!342016) #b01111111111111111111111111111110))))

(declare-fun b!768835 () Bool)

(assert (=> b!768835 (= e!428148 e!428151)))

(declare-fun c!84872 () Bool)

(assert (=> b!768835 (= c!84872 (or (= lt!342017 lt!341768) (= (bvadd lt!342017 lt!342017) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!768836 () Bool)

(assert (=> b!768836 (= e!428151 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 (toIndex!0 lt!341768 mask!3328) #b00000000000000000000000000000000 mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3328) lt!341768 lt!341766 mask!3328))))

(declare-fun b!768837 () Bool)

(assert (=> b!768837 (and (bvsge (index!33786 lt!342016) #b00000000000000000000000000000000) (bvslt (index!33786 lt!342016) (size!20675 lt!341766)))))

(declare-fun res!519879 () Bool)

(assert (=> b!768837 (= res!519879 (= (select (arr!20254 lt!341766) (index!33786 lt!342016)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!428149 () Bool)

(assert (=> b!768837 (=> res!519879 e!428149)))

(declare-fun b!768838 () Bool)

(assert (=> b!768838 (and (bvsge (index!33786 lt!342016) #b00000000000000000000000000000000) (bvslt (index!33786 lt!342016) (size!20675 lt!341766)))))

(assert (=> b!768838 (= e!428149 (= (select (arr!20254 lt!341766) (index!33786 lt!342016)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!768839 () Bool)

(assert (=> b!768839 (and (bvsge (index!33786 lt!342016) #b00000000000000000000000000000000) (bvslt (index!33786 lt!342016) (size!20675 lt!341766)))))

(declare-fun res!519880 () Bool)

(assert (=> b!768839 (= res!519880 (= (select (arr!20254 lt!341766) (index!33786 lt!342016)) lt!341768))))

(assert (=> b!768839 (=> res!519880 e!428149)))

(assert (=> b!768839 (= e!428150 e!428149)))

(declare-fun b!768840 () Bool)

(assert (=> b!768840 (= e!428148 (Intermediate!7854 true (nextIndex!0 (toIndex!0 lt!341768 mask!3328) #b00000000000000000000000000000000 mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!101651 c!84873) b!768840))

(assert (= (and d!101651 (not c!84873)) b!768835))

(assert (= (and b!768835 c!84872) b!768833))

(assert (= (and b!768835 (not c!84872)) b!768836))

(assert (= (and d!101651 c!84874) b!768834))

(assert (= (and d!101651 (not c!84874)) b!768832))

(assert (= (and b!768832 res!519881) b!768839))

(assert (= (and b!768839 (not res!519880)) b!768837))

(assert (= (and b!768837 (not res!519879)) b!768838))

(declare-fun m!714357 () Bool)

(assert (=> b!768839 m!714357))

(assert (=> b!768837 m!714357))

(assert (=> d!101651 m!713955))

(declare-fun m!714359 () Bool)

(assert (=> d!101651 m!714359))

(assert (=> d!101651 m!713825))

(assert (=> b!768838 m!714357))

(assert (=> b!768836 m!713955))

(declare-fun m!714361 () Bool)

(assert (=> b!768836 m!714361))

(assert (=> b!768836 m!714361))

(declare-fun m!714363 () Bool)

(assert (=> b!768836 m!714363))

(assert (=> b!768373 d!101651))

(declare-fun d!101653 () Bool)

(declare-fun lt!342018 () (_ BitVec 32))

(assert (=> d!101653 (and (bvsge lt!342018 #b00000000000000000000000000000000) (bvslt lt!342018 (bvadd mask!3328 #b00000000000000000000000000000001)))))

(assert (=> d!101653 (= lt!342018 (choose!52 (toIndex!0 lt!341768 mask!3328) #b00000000000000000000000000000000 mask!3328))))

(assert (=> d!101653 (validMask!0 mask!3328)))

(assert (=> d!101653 (= (nextIndex!0 (toIndex!0 lt!341768 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!342018)))

(declare-fun bs!21545 () Bool)

(assert (= bs!21545 d!101653))

(assert (=> bs!21545 m!713837))

(declare-fun m!714365 () Bool)

(assert (=> bs!21545 m!714365))

(assert (=> bs!21545 m!713825))

(assert (=> b!768373 d!101653))

(declare-fun d!101655 () Bool)

(declare-fun e!428152 () Bool)

(assert (=> d!101655 e!428152))

(declare-fun c!84877 () Bool)

(declare-fun lt!342019 () SeekEntryResult!7854)

(assert (=> d!101655 (= c!84877 (and ((_ is Intermediate!7854) lt!342019) (undefined!8666 lt!342019)))))

(declare-fun e!428153 () SeekEntryResult!7854)

(assert (=> d!101655 (= lt!342019 e!428153)))

(declare-fun c!84876 () Bool)

(assert (=> d!101655 (= c!84876 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(declare-fun lt!342020 () (_ BitVec 64))

(assert (=> d!101655 (= lt!342020 (select (arr!20254 a!3186) (nextIndex!0 (toIndex!0 (select (arr!20254 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328)))))

(assert (=> d!101655 (validMask!0 mask!3328)))

(assert (=> d!101655 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20254 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!20254 a!3186) j!159) a!3186 mask!3328) lt!342019)))

(declare-fun b!768841 () Bool)

(declare-fun e!428155 () Bool)

(assert (=> b!768841 (= e!428152 e!428155)))

(declare-fun res!519884 () Bool)

(assert (=> b!768841 (= res!519884 (and ((_ is Intermediate!7854) lt!342019) (not (undefined!8666 lt!342019)) (bvslt (x!64708 lt!342019) #b01111111111111111111111111111110) (bvsge (x!64708 lt!342019) #b00000000000000000000000000000000) (bvsge (x!64708 lt!342019) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!768841 (=> (not res!519884) (not e!428155))))

(declare-fun e!428156 () SeekEntryResult!7854)

(declare-fun b!768842 () Bool)

(assert (=> b!768842 (= e!428156 (Intermediate!7854 false (nextIndex!0 (toIndex!0 (select (arr!20254 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!768843 () Bool)

(assert (=> b!768843 (= e!428152 (bvsge (x!64708 lt!342019) #b01111111111111111111111111111110))))

(declare-fun b!768844 () Bool)

(assert (=> b!768844 (= e!428153 e!428156)))

(declare-fun c!84875 () Bool)

(assert (=> b!768844 (= c!84875 (or (= lt!342020 (select (arr!20254 a!3186) j!159)) (= (bvadd lt!342020 lt!342020) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!768845 () Bool)

(assert (=> b!768845 (= e!428156 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 (toIndex!0 (select (arr!20254 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3328) (select (arr!20254 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!768846 () Bool)

(assert (=> b!768846 (and (bvsge (index!33786 lt!342019) #b00000000000000000000000000000000) (bvslt (index!33786 lt!342019) (size!20675 a!3186)))))

(declare-fun res!519882 () Bool)

(assert (=> b!768846 (= res!519882 (= (select (arr!20254 a!3186) (index!33786 lt!342019)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!428154 () Bool)

(assert (=> b!768846 (=> res!519882 e!428154)))

(declare-fun b!768847 () Bool)

(assert (=> b!768847 (and (bvsge (index!33786 lt!342019) #b00000000000000000000000000000000) (bvslt (index!33786 lt!342019) (size!20675 a!3186)))))

(assert (=> b!768847 (= e!428154 (= (select (arr!20254 a!3186) (index!33786 lt!342019)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!768848 () Bool)

(assert (=> b!768848 (and (bvsge (index!33786 lt!342019) #b00000000000000000000000000000000) (bvslt (index!33786 lt!342019) (size!20675 a!3186)))))

(declare-fun res!519883 () Bool)

(assert (=> b!768848 (= res!519883 (= (select (arr!20254 a!3186) (index!33786 lt!342019)) (select (arr!20254 a!3186) j!159)))))

(assert (=> b!768848 (=> res!519883 e!428154)))

(assert (=> b!768848 (= e!428155 e!428154)))

(declare-fun b!768849 () Bool)

(assert (=> b!768849 (= e!428153 (Intermediate!7854 true (nextIndex!0 (toIndex!0 (select (arr!20254 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!101655 c!84876) b!768849))

(assert (= (and d!101655 (not c!84876)) b!768844))

(assert (= (and b!768844 c!84875) b!768842))

(assert (= (and b!768844 (not c!84875)) b!768845))

(assert (= (and d!101655 c!84877) b!768843))

(assert (= (and d!101655 (not c!84877)) b!768841))

(assert (= (and b!768841 res!519884) b!768848))

(assert (= (and b!768848 (not res!519883)) b!768846))

(assert (= (and b!768846 (not res!519882)) b!768847))

(declare-fun m!714367 () Bool)

(assert (=> b!768848 m!714367))

(assert (=> b!768846 m!714367))

(assert (=> d!101655 m!713941))

(declare-fun m!714369 () Bool)

(assert (=> d!101655 m!714369))

(assert (=> d!101655 m!713825))

(assert (=> b!768847 m!714367))

(assert (=> b!768845 m!713941))

(declare-fun m!714371 () Bool)

(assert (=> b!768845 m!714371))

(assert (=> b!768845 m!714371))

(assert (=> b!768845 m!713833))

(declare-fun m!714373 () Bool)

(assert (=> b!768845 m!714373))

(assert (=> b!768355 d!101655))

(declare-fun d!101657 () Bool)

(declare-fun lt!342021 () (_ BitVec 32))

(assert (=> d!101657 (and (bvsge lt!342021 #b00000000000000000000000000000000) (bvslt lt!342021 (bvadd mask!3328 #b00000000000000000000000000000001)))))

(assert (=> d!101657 (= lt!342021 (choose!52 (toIndex!0 (select (arr!20254 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328))))

(assert (=> d!101657 (validMask!0 mask!3328)))

(assert (=> d!101657 (= (nextIndex!0 (toIndex!0 (select (arr!20254 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) lt!342021)))

(declare-fun bs!21546 () Bool)

(assert (= bs!21546 d!101657))

(assert (=> bs!21546 m!713869))

(declare-fun m!714375 () Bool)

(assert (=> bs!21546 m!714375))

(assert (=> bs!21546 m!713825))

(assert (=> b!768355 d!101657))

(assert (=> d!101493 d!101511))

(declare-fun b!768850 () Bool)

(declare-fun e!428159 () SeekEntryResult!7854)

(assert (=> b!768850 (= e!428159 (MissingVacant!7854 resIntermediateIndex!5))))

(declare-fun b!768851 () Bool)

(declare-fun e!428158 () SeekEntryResult!7854)

(assert (=> b!768851 (= e!428158 (Found!7854 (nextIndex!0 index!1321 x!1131 mask!3328)))))

(declare-fun d!101659 () Bool)

(declare-fun lt!342022 () SeekEntryResult!7854)

(assert (=> d!101659 (and (or ((_ is Undefined!7854) lt!342022) (not ((_ is Found!7854) lt!342022)) (and (bvsge (index!33785 lt!342022) #b00000000000000000000000000000000) (bvslt (index!33785 lt!342022) (size!20675 a!3186)))) (or ((_ is Undefined!7854) lt!342022) ((_ is Found!7854) lt!342022) (not ((_ is MissingVacant!7854) lt!342022)) (not (= (index!33787 lt!342022) resIntermediateIndex!5)) (and (bvsge (index!33787 lt!342022) #b00000000000000000000000000000000) (bvslt (index!33787 lt!342022) (size!20675 a!3186)))) (or ((_ is Undefined!7854) lt!342022) (ite ((_ is Found!7854) lt!342022) (= (select (arr!20254 a!3186) (index!33785 lt!342022)) (select (arr!20254 a!3186) j!159)) (and ((_ is MissingVacant!7854) lt!342022) (= (index!33787 lt!342022) resIntermediateIndex!5) (= (select (arr!20254 a!3186) (index!33787 lt!342022)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!428157 () SeekEntryResult!7854)

(assert (=> d!101659 (= lt!342022 e!428157)))

(declare-fun c!84880 () Bool)

(assert (=> d!101659 (= c!84880 (bvsge (bvadd x!1131 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(declare-fun lt!342023 () (_ BitVec 64))

(assert (=> d!101659 (= lt!342023 (select (arr!20254 a!3186) (nextIndex!0 index!1321 x!1131 mask!3328)))))

(assert (=> d!101659 (validMask!0 mask!3328)))

(assert (=> d!101659 (= (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!20254 a!3186) j!159) a!3186 mask!3328) lt!342022)))

(declare-fun b!768852 () Bool)

(assert (=> b!768852 (= e!428157 Undefined!7854)))

(declare-fun b!768853 () Bool)

(declare-fun c!84878 () Bool)

(assert (=> b!768853 (= c!84878 (= lt!342023 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!768853 (= e!428158 e!428159)))

(declare-fun b!768854 () Bool)

(assert (=> b!768854 (= e!428157 e!428158)))

(declare-fun c!84879 () Bool)

(assert (=> b!768854 (= c!84879 (= lt!342023 (select (arr!20254 a!3186) j!159)))))

(declare-fun b!768855 () Bool)

(assert (=> b!768855 (= e!428159 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!1321 x!1131 mask!3328) (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) resIntermediateIndex!5 (select (arr!20254 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and d!101659 c!84880) b!768852))

(assert (= (and d!101659 (not c!84880)) b!768854))

(assert (= (and b!768854 c!84879) b!768851))

(assert (= (and b!768854 (not c!84879)) b!768853))

(assert (= (and b!768853 c!84878) b!768850))

(assert (= (and b!768853 (not c!84878)) b!768855))

(declare-fun m!714377 () Bool)

(assert (=> d!101659 m!714377))

(declare-fun m!714379 () Bool)

(assert (=> d!101659 m!714379))

(assert (=> d!101659 m!713863))

(assert (=> d!101659 m!714283))

(assert (=> d!101659 m!713825))

(assert (=> b!768855 m!713863))

(assert (=> b!768855 m!714285))

(assert (=> b!768855 m!714285))

(assert (=> b!768855 m!713833))

(declare-fun m!714381 () Bool)

(assert (=> b!768855 m!714381))

(assert (=> b!768431 d!101659))

(assert (=> b!768431 d!101545))

(check-sat (not b!768763) (not d!101617) (not d!101629) (not b!768821) (not b!768855) (not b!768836) (not d!101625) (not b!768845) (not d!101623) (not b!768815) (not d!101655) (not bm!35105) (not d!101631) (not b!768824) (not bm!35106) (not d!101609) (not d!101613) (not b!768831) (not d!101659) (not b!768762) (not d!101657) (not b!768771) (not d!101641) (not d!101637) (not b!768773) (not b!768800) (not d!101605) (not d!101651) (not d!101627) (not d!101633) (not d!101647) (not d!101649) (not b!768795) (not b!768770) (not b!768779) (not b!768756) (not b!768751) (not b!768753) (not b!768809) (not bm!35104) (not b!768789) (not d!101653) (not b!768822) (not b!768764))
(check-sat)
