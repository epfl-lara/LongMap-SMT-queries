; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65394 () Bool)

(assert start!65394)

(declare-fun b!741112 () Bool)

(declare-fun res!498198 () Bool)

(declare-fun e!414411 () Bool)

(assert (=> b!741112 (=> (not res!498198) (not e!414411))))

(declare-datatypes ((array!41437 0))(
  ( (array!41438 (arr!19828 (Array (_ BitVec 32) (_ BitVec 64))) (size!20248 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41437)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41437 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!741112 (= res!498198 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!741113 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun e!414412 () Bool)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7384 0))(
  ( (MissingZero!7384 (index!31904 (_ BitVec 32))) (Found!7384 (index!31905 (_ BitVec 32))) (Intermediate!7384 (undefined!8196 Bool) (index!31906 (_ BitVec 32)) (x!63050 (_ BitVec 32))) (Undefined!7384) (MissingVacant!7384 (index!31907 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41437 (_ BitVec 32)) SeekEntryResult!7384)

(assert (=> b!741113 (= e!414412 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19828 a!3186) j!159) a!3186 mask!3328) (Found!7384 j!159)))))

(declare-fun b!741114 () Bool)

(declare-fun res!498194 () Bool)

(assert (=> b!741114 (=> (not res!498194) (not e!414411))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!741114 (= res!498194 (validKeyInArray!0 k0!2102))))

(declare-fun lt!329201 () (_ BitVec 32))

(declare-fun b!741115 () Bool)

(declare-fun lt!329208 () SeekEntryResult!7384)

(declare-fun e!414416 () Bool)

(assert (=> b!741115 (= e!414416 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!329201 resIntermediateIndex!5 (select (arr!19828 a!3186) j!159) a!3186 mask!3328) lt!329208)))))

(declare-fun lt!329203 () SeekEntryResult!7384)

(declare-fun b!741116 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41437 (_ BitVec 32)) SeekEntryResult!7384)

(assert (=> b!741116 (= e!414416 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!329201 (select (arr!19828 a!3186) j!159) a!3186 mask!3328) lt!329203)))))

(declare-fun e!414419 () Bool)

(declare-fun lt!329199 () SeekEntryResult!7384)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!741117 () Bool)

(assert (=> b!741117 (= e!414419 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19828 a!3186) j!159) a!3186 mask!3328) lt!329199))))

(declare-fun b!741118 () Bool)

(declare-fun e!414418 () Bool)

(declare-fun e!414414 () Bool)

(assert (=> b!741118 (= e!414418 e!414414)))

(declare-fun res!498197 () Bool)

(assert (=> b!741118 (=> (not res!498197) (not e!414414))))

(declare-fun lt!329202 () SeekEntryResult!7384)

(declare-fun lt!329204 () SeekEntryResult!7384)

(assert (=> b!741118 (= res!498197 (= lt!329202 lt!329204))))

(declare-fun lt!329200 () (_ BitVec 64))

(declare-fun lt!329206 () array!41437)

(assert (=> b!741118 (= lt!329204 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!329200 lt!329206 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!741118 (= lt!329202 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!329200 mask!3328) lt!329200 lt!329206 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!741118 (= lt!329200 (select (store (arr!19828 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!741118 (= lt!329206 (array!41438 (store (arr!19828 a!3186) i!1173 k0!2102) (size!20248 a!3186)))))

(declare-fun b!741119 () Bool)

(declare-datatypes ((Unit!25309 0))(
  ( (Unit!25310) )
))
(declare-fun e!414415 () Unit!25309)

(declare-fun Unit!25311 () Unit!25309)

(assert (=> b!741119 (= e!414415 Unit!25311)))

(declare-fun lt!329207 () SeekEntryResult!7384)

(assert (=> b!741119 (= lt!329207 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19828 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!741119 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!329201 resIntermediateIndex!5 (select (arr!19828 a!3186) j!159) a!3186 mask!3328) lt!329208)))

(declare-fun b!741120 () Bool)

(declare-fun res!498188 () Bool)

(declare-fun e!414410 () Bool)

(assert (=> b!741120 (=> res!498188 e!414410)))

(assert (=> b!741120 (= res!498188 (not (= lt!329202 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!329201 lt!329200 lt!329206 mask!3328))))))

(declare-fun b!741121 () Bool)

(declare-fun res!498192 () Bool)

(declare-fun e!414417 () Bool)

(assert (=> b!741121 (=> (not res!498192) (not e!414417))))

(declare-datatypes ((List!13737 0))(
  ( (Nil!13734) (Cons!13733 (h!14811 (_ BitVec 64)) (t!20044 List!13737)) )
))
(declare-fun arrayNoDuplicates!0 (array!41437 (_ BitVec 32) List!13737) Bool)

(assert (=> b!741121 (= res!498192 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13734))))

(declare-fun b!741122 () Bool)

(declare-fun res!498181 () Bool)

(assert (=> b!741122 (=> (not res!498181) (not e!414417))))

(assert (=> b!741122 (= res!498181 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20248 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20248 a!3186))))))

(declare-fun b!741123 () Bool)

(declare-fun res!498183 () Bool)

(assert (=> b!741123 (=> (not res!498183) (not e!414418))))

(assert (=> b!741123 (= res!498183 e!414412)))

(declare-fun c!81851 () Bool)

(assert (=> b!741123 (= c!81851 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!741124 () Bool)

(declare-fun e!414420 () Bool)

(assert (=> b!741124 (= e!414414 (not e!414420))))

(declare-fun res!498190 () Bool)

(assert (=> b!741124 (=> res!498190 e!414420)))

(get-info :version)

(assert (=> b!741124 (= res!498190 (or (not ((_ is Intermediate!7384) lt!329204)) (bvsge x!1131 (x!63050 lt!329204))))))

(assert (=> b!741124 (= lt!329208 (Found!7384 j!159))))

(declare-fun e!414409 () Bool)

(assert (=> b!741124 e!414409))

(declare-fun res!498196 () Bool)

(assert (=> b!741124 (=> (not res!498196) (not e!414409))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41437 (_ BitVec 32)) Bool)

(assert (=> b!741124 (= res!498196 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!329198 () Unit!25309)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41437 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25309)

(assert (=> b!741124 (= lt!329198 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!741125 () Bool)

(declare-fun res!498193 () Bool)

(assert (=> b!741125 (=> (not res!498193) (not e!414417))))

(assert (=> b!741125 (= res!498193 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!741126 () Bool)

(assert (=> b!741126 (= e!414409 e!414419)))

(declare-fun res!498189 () Bool)

(assert (=> b!741126 (=> (not res!498189) (not e!414419))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41437 (_ BitVec 32)) SeekEntryResult!7384)

(assert (=> b!741126 (= res!498189 (= (seekEntryOrOpen!0 (select (arr!19828 a!3186) j!159) a!3186 mask!3328) lt!329199))))

(assert (=> b!741126 (= lt!329199 (Found!7384 j!159))))

(declare-fun b!741127 () Bool)

(assert (=> b!741127 (= e!414410 (bvsge mask!3328 #b00000000000000000000000000000000))))

(assert (=> b!741127 (= (seekEntryOrOpen!0 lt!329200 lt!329206 mask!3328) lt!329208)))

(declare-fun lt!329195 () Unit!25309)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!41437 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25309)

(assert (=> b!741127 (= lt!329195 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3186 i!1173 k0!2102 j!159 lt!329201 (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateIndex!5 resIntermediateX!5 mask!3328))))

(declare-fun b!741128 () Bool)

(declare-fun res!498195 () Bool)

(assert (=> b!741128 (=> (not res!498195) (not e!414411))))

(assert (=> b!741128 (= res!498195 (validKeyInArray!0 (select (arr!19828 a!3186) j!159)))))

(declare-fun b!741129 () Bool)

(assert (=> b!741129 (= e!414412 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19828 a!3186) j!159) a!3186 mask!3328) lt!329203))))

(declare-fun b!741130 () Bool)

(declare-fun Unit!25312 () Unit!25309)

(assert (=> b!741130 (= e!414415 Unit!25312)))

(assert (=> b!741130 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!329201 (select (arr!19828 a!3186) j!159) a!3186 mask!3328) lt!329203)))

(declare-fun b!741131 () Bool)

(declare-fun res!498187 () Bool)

(assert (=> b!741131 (=> (not res!498187) (not e!414411))))

(assert (=> b!741131 (= res!498187 (and (= (size!20248 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20248 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20248 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!498184 () Bool)

(assert (=> start!65394 (=> (not res!498184) (not e!414411))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65394 (= res!498184 (validMask!0 mask!3328))))

(assert (=> start!65394 e!414411))

(assert (=> start!65394 true))

(declare-fun array_inv!15687 (array!41437) Bool)

(assert (=> start!65394 (array_inv!15687 a!3186)))

(declare-fun b!741132 () Bool)

(assert (=> b!741132 (= e!414411 e!414417)))

(declare-fun res!498186 () Bool)

(assert (=> b!741132 (=> (not res!498186) (not e!414417))))

(declare-fun lt!329197 () SeekEntryResult!7384)

(assert (=> b!741132 (= res!498186 (or (= lt!329197 (MissingZero!7384 i!1173)) (= lt!329197 (MissingVacant!7384 i!1173))))))

(assert (=> b!741132 (= lt!329197 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!741133 () Bool)

(declare-fun res!498182 () Bool)

(assert (=> b!741133 (=> (not res!498182) (not e!414418))))

(assert (=> b!741133 (= res!498182 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19828 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!741134 () Bool)

(assert (=> b!741134 (= e!414420 e!414410)))

(declare-fun res!498191 () Bool)

(assert (=> b!741134 (=> res!498191 e!414410)))

(assert (=> b!741134 (= res!498191 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!329201 #b00000000000000000000000000000000) (bvsge lt!329201 (size!20248 a!3186))))))

(declare-fun lt!329205 () Unit!25309)

(assert (=> b!741134 (= lt!329205 e!414415)))

(declare-fun c!81849 () Bool)

(declare-fun lt!329196 () Bool)

(assert (=> b!741134 (= c!81849 lt!329196)))

(assert (=> b!741134 (= lt!329196 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!741134 (= lt!329201 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!741135 () Bool)

(assert (=> b!741135 (= e!414417 e!414418)))

(declare-fun res!498185 () Bool)

(assert (=> b!741135 (=> (not res!498185) (not e!414418))))

(assert (=> b!741135 (= res!498185 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19828 a!3186) j!159) mask!3328) (select (arr!19828 a!3186) j!159) a!3186 mask!3328) lt!329203))))

(assert (=> b!741135 (= lt!329203 (Intermediate!7384 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!741136 () Bool)

(declare-fun res!498199 () Bool)

(assert (=> b!741136 (=> res!498199 e!414410)))

(assert (=> b!741136 (= res!498199 e!414416)))

(declare-fun c!81850 () Bool)

(assert (=> b!741136 (= c!81850 lt!329196)))

(assert (= (and start!65394 res!498184) b!741131))

(assert (= (and b!741131 res!498187) b!741128))

(assert (= (and b!741128 res!498195) b!741114))

(assert (= (and b!741114 res!498194) b!741112))

(assert (= (and b!741112 res!498198) b!741132))

(assert (= (and b!741132 res!498186) b!741125))

(assert (= (and b!741125 res!498193) b!741121))

(assert (= (and b!741121 res!498192) b!741122))

(assert (= (and b!741122 res!498181) b!741135))

(assert (= (and b!741135 res!498185) b!741133))

(assert (= (and b!741133 res!498182) b!741123))

(assert (= (and b!741123 c!81851) b!741129))

(assert (= (and b!741123 (not c!81851)) b!741113))

(assert (= (and b!741123 res!498183) b!741118))

(assert (= (and b!741118 res!498197) b!741124))

(assert (= (and b!741124 res!498196) b!741126))

(assert (= (and b!741126 res!498189) b!741117))

(assert (= (and b!741124 (not res!498190)) b!741134))

(assert (= (and b!741134 c!81849) b!741130))

(assert (= (and b!741134 (not c!81849)) b!741119))

(assert (= (and b!741134 (not res!498191)) b!741136))

(assert (= (and b!741136 c!81850) b!741116))

(assert (= (and b!741136 (not c!81850)) b!741115))

(assert (= (and b!741136 (not res!498199)) b!741120))

(assert (= (and b!741120 (not res!498188)) b!741127))

(declare-fun m!692679 () Bool)

(assert (=> b!741118 m!692679))

(declare-fun m!692681 () Bool)

(assert (=> b!741118 m!692681))

(declare-fun m!692683 () Bool)

(assert (=> b!741118 m!692683))

(declare-fun m!692685 () Bool)

(assert (=> b!741118 m!692685))

(declare-fun m!692687 () Bool)

(assert (=> b!741118 m!692687))

(assert (=> b!741118 m!692681))

(declare-fun m!692689 () Bool)

(assert (=> b!741114 m!692689))

(declare-fun m!692691 () Bool)

(assert (=> b!741127 m!692691))

(declare-fun m!692693 () Bool)

(assert (=> b!741127 m!692693))

(declare-fun m!692695 () Bool)

(assert (=> b!741135 m!692695))

(assert (=> b!741135 m!692695))

(declare-fun m!692697 () Bool)

(assert (=> b!741135 m!692697))

(assert (=> b!741135 m!692697))

(assert (=> b!741135 m!692695))

(declare-fun m!692699 () Bool)

(assert (=> b!741135 m!692699))

(assert (=> b!741126 m!692695))

(assert (=> b!741126 m!692695))

(declare-fun m!692701 () Bool)

(assert (=> b!741126 m!692701))

(declare-fun m!692703 () Bool)

(assert (=> b!741112 m!692703))

(assert (=> b!741128 m!692695))

(assert (=> b!741128 m!692695))

(declare-fun m!692705 () Bool)

(assert (=> b!741128 m!692705))

(assert (=> b!741119 m!692695))

(assert (=> b!741119 m!692695))

(declare-fun m!692707 () Bool)

(assert (=> b!741119 m!692707))

(assert (=> b!741119 m!692695))

(declare-fun m!692709 () Bool)

(assert (=> b!741119 m!692709))

(declare-fun m!692711 () Bool)

(assert (=> b!741124 m!692711))

(declare-fun m!692713 () Bool)

(assert (=> b!741124 m!692713))

(declare-fun m!692715 () Bool)

(assert (=> b!741121 m!692715))

(assert (=> b!741113 m!692695))

(assert (=> b!741113 m!692695))

(assert (=> b!741113 m!692707))

(declare-fun m!692717 () Bool)

(assert (=> b!741132 m!692717))

(assert (=> b!741117 m!692695))

(assert (=> b!741117 m!692695))

(declare-fun m!692719 () Bool)

(assert (=> b!741117 m!692719))

(declare-fun m!692721 () Bool)

(assert (=> start!65394 m!692721))

(declare-fun m!692723 () Bool)

(assert (=> start!65394 m!692723))

(declare-fun m!692725 () Bool)

(assert (=> b!741120 m!692725))

(declare-fun m!692727 () Bool)

(assert (=> b!741134 m!692727))

(assert (=> b!741115 m!692695))

(assert (=> b!741115 m!692695))

(assert (=> b!741115 m!692709))

(assert (=> b!741130 m!692695))

(assert (=> b!741130 m!692695))

(declare-fun m!692729 () Bool)

(assert (=> b!741130 m!692729))

(assert (=> b!741116 m!692695))

(assert (=> b!741116 m!692695))

(assert (=> b!741116 m!692729))

(declare-fun m!692731 () Bool)

(assert (=> b!741125 m!692731))

(assert (=> b!741129 m!692695))

(assert (=> b!741129 m!692695))

(declare-fun m!692733 () Bool)

(assert (=> b!741129 m!692733))

(declare-fun m!692735 () Bool)

(assert (=> b!741133 m!692735))

(check-sat (not b!741132) (not b!741127) (not b!741113) (not b!741124) (not b!741117) (not b!741130) (not b!741134) (not start!65394) (not b!741119) (not b!741115) (not b!741126) (not b!741125) (not b!741114) (not b!741112) (not b!741118) (not b!741135) (not b!741120) (not b!741116) (not b!741121) (not b!741129) (not b!741128))
(check-sat)
