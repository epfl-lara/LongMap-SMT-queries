; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46088 () Bool)

(assert start!46088)

(declare-fun b!510560 () Bool)

(declare-fun res!311464 () Bool)

(declare-fun e!298409 () Bool)

(assert (=> b!510560 (=> (not res!311464) (not e!298409))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!510560 (= res!311464 (validKeyInArray!0 k0!2280))))

(declare-fun b!510561 () Bool)

(declare-fun e!298407 () Bool)

(assert (=> b!510561 (= e!298407 true)))

(declare-datatypes ((SeekEntryResult!4201 0))(
  ( (MissingZero!4201 (index!18992 (_ BitVec 32))) (Found!4201 (index!18993 (_ BitVec 32))) (Intermediate!4201 (undefined!5013 Bool) (index!18994 (_ BitVec 32)) (x!48095 (_ BitVec 32))) (Undefined!4201) (MissingVacant!4201 (index!18995 (_ BitVec 32))) )
))
(declare-fun lt!233517 () SeekEntryResult!4201)

(declare-datatypes ((array!32800 0))(
  ( (array!32801 (arr!15778 (Array (_ BitVec 32) (_ BitVec 64))) (size!16142 (_ BitVec 32))) )
))
(declare-fun lt!233516 () array!32800)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!233519 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32800 (_ BitVec 32)) SeekEntryResult!4201)

(assert (=> b!510561 (= lt!233517 (seekEntryOrOpen!0 lt!233519 lt!233516 mask!3524))))

(declare-datatypes ((Unit!15721 0))(
  ( (Unit!15722) )
))
(declare-fun lt!233520 () Unit!15721)

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun a!3235 () array!32800)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!32800 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!15721)

(assert (=> b!510561 (= lt!233520 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k0!2280 j!176 mask!3524))))

(declare-fun b!510562 () Bool)

(declare-fun e!298408 () Bool)

(assert (=> b!510562 (= e!298408 (not e!298407))))

(declare-fun res!311459 () Bool)

(assert (=> b!510562 (=> res!311459 e!298407)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32800 (_ BitVec 32)) SeekEntryResult!4201)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!510562 (= res!311459 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15778 a!3235) j!176) mask!3524) (select (arr!15778 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!233519 mask!3524) lt!233519 lt!233516 mask!3524))))))

(assert (=> b!510562 (= lt!233519 (select (store (arr!15778 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!510562 (= lt!233516 (array!32801 (store (arr!15778 a!3235) i!1204 k0!2280) (size!16142 a!3235)))))

(assert (=> b!510562 (= lt!233517 (Found!4201 j!176))))

(assert (=> b!510562 (= lt!233517 (seekEntryOrOpen!0 (select (arr!15778 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32800 (_ BitVec 32)) Bool)

(assert (=> b!510562 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!233518 () Unit!15721)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32800 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15721)

(assert (=> b!510562 (= lt!233518 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!510563 () Bool)

(assert (=> b!510563 (= e!298409 e!298408)))

(declare-fun res!311463 () Bool)

(assert (=> b!510563 (=> (not res!311463) (not e!298408))))

(declare-fun lt!233521 () SeekEntryResult!4201)

(assert (=> b!510563 (= res!311463 (or (= lt!233521 (MissingZero!4201 i!1204)) (= lt!233521 (MissingVacant!4201 i!1204))))))

(assert (=> b!510563 (= lt!233521 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!510564 () Bool)

(declare-fun res!311465 () Bool)

(assert (=> b!510564 (=> (not res!311465) (not e!298408))))

(assert (=> b!510564 (= res!311465 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!510565 () Bool)

(declare-fun res!311466 () Bool)

(assert (=> b!510565 (=> (not res!311466) (not e!298409))))

(assert (=> b!510565 (= res!311466 (and (= (size!16142 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16142 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16142 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!510567 () Bool)

(declare-fun res!311461 () Bool)

(assert (=> b!510567 (=> (not res!311461) (not e!298408))))

(declare-datatypes ((List!9843 0))(
  ( (Nil!9840) (Cons!9839 (h!10716 (_ BitVec 64)) (t!16063 List!9843)) )
))
(declare-fun arrayNoDuplicates!0 (array!32800 (_ BitVec 32) List!9843) Bool)

(assert (=> b!510567 (= res!311461 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9840))))

(declare-fun b!510568 () Bool)

(declare-fun res!311460 () Bool)

(assert (=> b!510568 (=> (not res!311460) (not e!298409))))

(declare-fun arrayContainsKey!0 (array!32800 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!510568 (= res!311460 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!311462 () Bool)

(assert (=> start!46088 (=> (not res!311462) (not e!298409))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46088 (= res!311462 (validMask!0 mask!3524))))

(assert (=> start!46088 e!298409))

(assert (=> start!46088 true))

(declare-fun array_inv!11637 (array!32800) Bool)

(assert (=> start!46088 (array_inv!11637 a!3235)))

(declare-fun b!510566 () Bool)

(declare-fun res!311467 () Bool)

(assert (=> b!510566 (=> (not res!311467) (not e!298409))))

(assert (=> b!510566 (= res!311467 (validKeyInArray!0 (select (arr!15778 a!3235) j!176)))))

(assert (= (and start!46088 res!311462) b!510565))

(assert (= (and b!510565 res!311466) b!510566))

(assert (= (and b!510566 res!311467) b!510560))

(assert (= (and b!510560 res!311464) b!510568))

(assert (= (and b!510568 res!311460) b!510563))

(assert (= (and b!510563 res!311463) b!510564))

(assert (= (and b!510564 res!311465) b!510567))

(assert (= (and b!510567 res!311461) b!510562))

(assert (= (and b!510562 (not res!311459)) b!510561))

(declare-fun m!492157 () Bool)

(assert (=> b!510563 m!492157))

(declare-fun m!492159 () Bool)

(assert (=> b!510561 m!492159))

(declare-fun m!492161 () Bool)

(assert (=> b!510561 m!492161))

(declare-fun m!492163 () Bool)

(assert (=> b!510567 m!492163))

(declare-fun m!492165 () Bool)

(assert (=> start!46088 m!492165))

(declare-fun m!492167 () Bool)

(assert (=> start!46088 m!492167))

(declare-fun m!492169 () Bool)

(assert (=> b!510566 m!492169))

(assert (=> b!510566 m!492169))

(declare-fun m!492171 () Bool)

(assert (=> b!510566 m!492171))

(declare-fun m!492173 () Bool)

(assert (=> b!510562 m!492173))

(declare-fun m!492175 () Bool)

(assert (=> b!510562 m!492175))

(declare-fun m!492177 () Bool)

(assert (=> b!510562 m!492177))

(assert (=> b!510562 m!492169))

(declare-fun m!492179 () Bool)

(assert (=> b!510562 m!492179))

(declare-fun m!492181 () Bool)

(assert (=> b!510562 m!492181))

(declare-fun m!492183 () Bool)

(assert (=> b!510562 m!492183))

(assert (=> b!510562 m!492169))

(assert (=> b!510562 m!492177))

(assert (=> b!510562 m!492169))

(declare-fun m!492185 () Bool)

(assert (=> b!510562 m!492185))

(assert (=> b!510562 m!492169))

(declare-fun m!492187 () Bool)

(assert (=> b!510562 m!492187))

(assert (=> b!510562 m!492181))

(declare-fun m!492189 () Bool)

(assert (=> b!510562 m!492189))

(declare-fun m!492191 () Bool)

(assert (=> b!510560 m!492191))

(declare-fun m!492193 () Bool)

(assert (=> b!510564 m!492193))

(declare-fun m!492195 () Bool)

(assert (=> b!510568 m!492195))

(check-sat (not b!510562) (not b!510568) (not b!510563) (not b!510566) (not b!510560) (not b!510567) (not b!510564) (not start!46088) (not b!510561))
(check-sat)
