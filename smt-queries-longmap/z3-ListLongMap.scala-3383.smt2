; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46700 () Bool)

(assert start!46700)

(declare-fun b!515517 () Bool)

(declare-fun res!315142 () Bool)

(declare-fun e!300974 () Bool)

(assert (=> b!515517 (=> (not res!315142) (not e!300974))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!33013 0))(
  ( (array!33014 (arr!15874 (Array (_ BitVec 32) (_ BitVec 64))) (size!16238 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33013)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!515517 (= res!315142 (and (= (size!16238 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16238 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16238 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!515519 () Bool)

(declare-fun e!300975 () Bool)

(assert (=> b!515519 (= e!300975 true)))

(declare-datatypes ((SeekEntryResult!4297 0))(
  ( (MissingZero!4297 (index!19376 (_ BitVec 32))) (Found!4297 (index!19377 (_ BitVec 32))) (Intermediate!4297 (undefined!5109 Bool) (index!19378 (_ BitVec 32)) (x!48489 (_ BitVec 32))) (Undefined!4297) (MissingVacant!4297 (index!19379 (_ BitVec 32))) )
))
(declare-fun lt!236037 () SeekEntryResult!4297)

(assert (=> b!515519 (and (bvslt (x!48489 lt!236037) #b01111111111111111111111111111110) (or (= (select (arr!15874 a!3235) (index!19378 lt!236037)) (select (arr!15874 a!3235) j!176)) (= (select (arr!15874 a!3235) (index!19378 lt!236037)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15874 a!3235) (index!19378 lt!236037)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!515520 () Bool)

(declare-fun e!300972 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33013 (_ BitVec 32)) SeekEntryResult!4297)

(assert (=> b!515520 (= e!300972 (= (seekEntryOrOpen!0 (select (arr!15874 a!3235) j!176) a!3235 mask!3524) (Found!4297 j!176)))))

(declare-fun b!515521 () Bool)

(declare-fun res!315136 () Bool)

(assert (=> b!515521 (=> (not res!315136) (not e!300974))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33013 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!515521 (= res!315136 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!515522 () Bool)

(declare-fun e!300971 () Bool)

(assert (=> b!515522 (= e!300971 (not e!300975))))

(declare-fun res!315143 () Bool)

(assert (=> b!515522 (=> res!315143 e!300975)))

(declare-fun lt!236041 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33013 (_ BitVec 32)) SeekEntryResult!4297)

(assert (=> b!515522 (= res!315143 (= lt!236037 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236041 (select (store (arr!15874 a!3235) i!1204 k0!2280) j!176) (array!33014 (store (arr!15874 a!3235) i!1204 k0!2280) (size!16238 a!3235)) mask!3524)))))

(declare-fun lt!236038 () (_ BitVec 32))

(assert (=> b!515522 (= lt!236037 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236038 (select (arr!15874 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!515522 (= lt!236041 (toIndex!0 (select (store (arr!15874 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!515522 (= lt!236038 (toIndex!0 (select (arr!15874 a!3235) j!176) mask!3524))))

(assert (=> b!515522 e!300972))

(declare-fun res!315138 () Bool)

(assert (=> b!515522 (=> (not res!315138) (not e!300972))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33013 (_ BitVec 32)) Bool)

(assert (=> b!515522 (= res!315138 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15913 0))(
  ( (Unit!15914) )
))
(declare-fun lt!236040 () Unit!15913)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33013 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15913)

(assert (=> b!515522 (= lt!236040 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!515523 () Bool)

(declare-fun res!315141 () Bool)

(assert (=> b!515523 (=> (not res!315141) (not e!300974))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!515523 (= res!315141 (validKeyInArray!0 (select (arr!15874 a!3235) j!176)))))

(declare-fun b!515524 () Bool)

(assert (=> b!515524 (= e!300974 e!300971)))

(declare-fun res!315135 () Bool)

(assert (=> b!515524 (=> (not res!315135) (not e!300971))))

(declare-fun lt!236039 () SeekEntryResult!4297)

(assert (=> b!515524 (= res!315135 (or (= lt!236039 (MissingZero!4297 i!1204)) (= lt!236039 (MissingVacant!4297 i!1204))))))

(assert (=> b!515524 (= lt!236039 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!515525 () Bool)

(declare-fun res!315139 () Bool)

(assert (=> b!515525 (=> (not res!315139) (not e!300971))))

(assert (=> b!515525 (= res!315139 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!315137 () Bool)

(assert (=> start!46700 (=> (not res!315137) (not e!300974))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46700 (= res!315137 (validMask!0 mask!3524))))

(assert (=> start!46700 e!300974))

(assert (=> start!46700 true))

(declare-fun array_inv!11733 (array!33013) Bool)

(assert (=> start!46700 (array_inv!11733 a!3235)))

(declare-fun b!515518 () Bool)

(declare-fun res!315144 () Bool)

(assert (=> b!515518 (=> (not res!315144) (not e!300974))))

(assert (=> b!515518 (= res!315144 (validKeyInArray!0 k0!2280))))

(declare-fun b!515526 () Bool)

(declare-fun res!315140 () Bool)

(assert (=> b!515526 (=> (not res!315140) (not e!300971))))

(declare-datatypes ((List!9939 0))(
  ( (Nil!9936) (Cons!9935 (h!10833 (_ BitVec 64)) (t!16159 List!9939)) )
))
(declare-fun arrayNoDuplicates!0 (array!33013 (_ BitVec 32) List!9939) Bool)

(assert (=> b!515526 (= res!315140 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9936))))

(declare-fun b!515527 () Bool)

(declare-fun res!315145 () Bool)

(assert (=> b!515527 (=> res!315145 e!300975)))

(get-info :version)

(assert (=> b!515527 (= res!315145 (or (undefined!5109 lt!236037) (not ((_ is Intermediate!4297) lt!236037))))))

(assert (= (and start!46700 res!315137) b!515517))

(assert (= (and b!515517 res!315142) b!515523))

(assert (= (and b!515523 res!315141) b!515518))

(assert (= (and b!515518 res!315144) b!515521))

(assert (= (and b!515521 res!315136) b!515524))

(assert (= (and b!515524 res!315135) b!515525))

(assert (= (and b!515525 res!315139) b!515526))

(assert (= (and b!515526 res!315140) b!515522))

(assert (= (and b!515522 res!315138) b!515520))

(assert (= (and b!515522 (not res!315143)) b!515527))

(assert (= (and b!515527 (not res!315145)) b!515519))

(declare-fun m!497119 () Bool)

(assert (=> b!515525 m!497119))

(declare-fun m!497121 () Bool)

(assert (=> b!515521 m!497121))

(declare-fun m!497123 () Bool)

(assert (=> b!515522 m!497123))

(declare-fun m!497125 () Bool)

(assert (=> b!515522 m!497125))

(declare-fun m!497127 () Bool)

(assert (=> b!515522 m!497127))

(declare-fun m!497129 () Bool)

(assert (=> b!515522 m!497129))

(declare-fun m!497131 () Bool)

(assert (=> b!515522 m!497131))

(assert (=> b!515522 m!497129))

(declare-fun m!497133 () Bool)

(assert (=> b!515522 m!497133))

(assert (=> b!515522 m!497129))

(assert (=> b!515522 m!497127))

(declare-fun m!497135 () Bool)

(assert (=> b!515522 m!497135))

(declare-fun m!497137 () Bool)

(assert (=> b!515522 m!497137))

(assert (=> b!515522 m!497127))

(declare-fun m!497139 () Bool)

(assert (=> b!515522 m!497139))

(declare-fun m!497141 () Bool)

(assert (=> b!515519 m!497141))

(assert (=> b!515519 m!497129))

(declare-fun m!497143 () Bool)

(assert (=> start!46700 m!497143))

(declare-fun m!497145 () Bool)

(assert (=> start!46700 m!497145))

(assert (=> b!515520 m!497129))

(assert (=> b!515520 m!497129))

(declare-fun m!497147 () Bool)

(assert (=> b!515520 m!497147))

(assert (=> b!515523 m!497129))

(assert (=> b!515523 m!497129))

(declare-fun m!497149 () Bool)

(assert (=> b!515523 m!497149))

(declare-fun m!497151 () Bool)

(assert (=> b!515526 m!497151))

(declare-fun m!497153 () Bool)

(assert (=> b!515518 m!497153))

(declare-fun m!497155 () Bool)

(assert (=> b!515524 m!497155))

(check-sat (not b!515523) (not b!515521) (not b!515522) (not b!515524) (not b!515518) (not b!515520) (not start!46700) (not b!515525) (not b!515526))
(check-sat)
