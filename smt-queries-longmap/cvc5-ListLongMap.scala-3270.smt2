; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45492 () Bool)

(assert start!45492)

(declare-fun b!501031 () Bool)

(declare-fun res!302784 () Bool)

(declare-fun e!293517 () Bool)

(assert (=> b!501031 (=> res!302784 e!293517)))

(declare-datatypes ((SeekEntryResult!4007 0))(
  ( (MissingZero!4007 (index!18210 (_ BitVec 32))) (Found!4007 (index!18211 (_ BitVec 32))) (Intermediate!4007 (undefined!4819 Bool) (index!18212 (_ BitVec 32)) (x!47244 (_ BitVec 32))) (Undefined!4007) (MissingVacant!4007 (index!18213 (_ BitVec 32))) )
))
(declare-fun lt!227518 () SeekEntryResult!4007)

(assert (=> b!501031 (= res!302784 (or (undefined!4819 lt!227518) (not (is-Intermediate!4007 lt!227518))))))

(declare-fun b!501032 () Bool)

(declare-fun e!293520 () Bool)

(assert (=> b!501032 (= e!293520 false)))

(declare-fun b!501033 () Bool)

(declare-fun res!302786 () Bool)

(declare-fun e!293522 () Bool)

(assert (=> b!501033 (=> (not res!302786) (not e!293522))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32317 0))(
  ( (array!32318 (arr!15540 (Array (_ BitVec 32) (_ BitVec 64))) (size!15904 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32317)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!501033 (= res!302786 (and (= (size!15904 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15904 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15904 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!501034 () Bool)

(declare-fun e!293519 () Bool)

(assert (=> b!501034 (= e!293522 e!293519)))

(declare-fun res!302782 () Bool)

(assert (=> b!501034 (=> (not res!302782) (not e!293519))))

(declare-fun lt!227512 () SeekEntryResult!4007)

(assert (=> b!501034 (= res!302782 (or (= lt!227512 (MissingZero!4007 i!1204)) (= lt!227512 (MissingVacant!4007 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32317 (_ BitVec 32)) SeekEntryResult!4007)

(assert (=> b!501034 (= lt!227512 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!501035 () Bool)

(declare-fun res!302791 () Bool)

(assert (=> b!501035 (=> (not res!302791) (not e!293519))))

(declare-datatypes ((List!9698 0))(
  ( (Nil!9695) (Cons!9694 (h!10568 (_ BitVec 64)) (t!15926 List!9698)) )
))
(declare-fun arrayNoDuplicates!0 (array!32317 (_ BitVec 32) List!9698) Bool)

(assert (=> b!501035 (= res!302791 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9695))))

(declare-fun b!501036 () Bool)

(declare-fun e!293521 () Bool)

(assert (=> b!501036 (= e!293521 (= (seekEntryOrOpen!0 (select (arr!15540 a!3235) j!176) a!3235 mask!3524) (Found!4007 j!176)))))

(declare-fun b!501037 () Bool)

(declare-fun res!302792 () Bool)

(assert (=> b!501037 (=> (not res!302792) (not e!293519))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32317 (_ BitVec 32)) Bool)

(assert (=> b!501037 (= res!302792 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!501038 () Bool)

(assert (=> b!501038 (= e!293517 (bvsge mask!3524 #b00000000000000000000000000000000))))

(assert (=> b!501038 (= (index!18212 lt!227518) i!1204)))

(declare-fun lt!227510 () (_ BitVec 32))

(declare-datatypes ((Unit!15104 0))(
  ( (Unit!15105) )
))
(declare-fun lt!227509 () Unit!15104)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32317 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15104)

(assert (=> b!501038 (= lt!227509 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!227510 #b00000000000000000000000000000000 (index!18212 lt!227518) (x!47244 lt!227518) mask!3524))))

(assert (=> b!501038 (and (or (= (select (arr!15540 a!3235) (index!18212 lt!227518)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15540 a!3235) (index!18212 lt!227518)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15540 a!3235) (index!18212 lt!227518)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15540 a!3235) (index!18212 lt!227518)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!227513 () Unit!15104)

(declare-fun e!293523 () Unit!15104)

(assert (=> b!501038 (= lt!227513 e!293523)))

(declare-fun c!59402 () Bool)

(assert (=> b!501038 (= c!59402 (= (select (arr!15540 a!3235) (index!18212 lt!227518)) (select (arr!15540 a!3235) j!176)))))

(assert (=> b!501038 (and (bvslt (x!47244 lt!227518) #b01111111111111111111111111111110) (or (= (select (arr!15540 a!3235) (index!18212 lt!227518)) (select (arr!15540 a!3235) j!176)) (= (select (arr!15540 a!3235) (index!18212 lt!227518)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15540 a!3235) (index!18212 lt!227518)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!302789 () Bool)

(assert (=> start!45492 (=> (not res!302789) (not e!293522))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45492 (= res!302789 (validMask!0 mask!3524))))

(assert (=> start!45492 e!293522))

(assert (=> start!45492 true))

(declare-fun array_inv!11336 (array!32317) Bool)

(assert (=> start!45492 (array_inv!11336 a!3235)))

(declare-fun b!501039 () Bool)

(declare-fun res!302787 () Bool)

(assert (=> b!501039 (=> (not res!302787) (not e!293522))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!501039 (= res!302787 (validKeyInArray!0 (select (arr!15540 a!3235) j!176)))))

(declare-fun b!501040 () Bool)

(declare-fun res!302790 () Bool)

(assert (=> b!501040 (=> (not res!302790) (not e!293522))))

(declare-fun arrayContainsKey!0 (array!32317 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!501040 (= res!302790 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!501041 () Bool)

(assert (=> b!501041 (= e!293519 (not e!293517))))

(declare-fun res!302783 () Bool)

(assert (=> b!501041 (=> res!302783 e!293517)))

(declare-fun lt!227517 () (_ BitVec 64))

(declare-fun lt!227511 () (_ BitVec 32))

(declare-fun lt!227515 () array!32317)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32317 (_ BitVec 32)) SeekEntryResult!4007)

(assert (=> b!501041 (= res!302783 (= lt!227518 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227511 lt!227517 lt!227515 mask!3524)))))

(assert (=> b!501041 (= lt!227518 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227510 (select (arr!15540 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!501041 (= lt!227511 (toIndex!0 lt!227517 mask!3524))))

(assert (=> b!501041 (= lt!227517 (select (store (arr!15540 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!501041 (= lt!227510 (toIndex!0 (select (arr!15540 a!3235) j!176) mask!3524))))

(assert (=> b!501041 (= lt!227515 (array!32318 (store (arr!15540 a!3235) i!1204 k!2280) (size!15904 a!3235)))))

(assert (=> b!501041 e!293521))

(declare-fun res!302781 () Bool)

(assert (=> b!501041 (=> (not res!302781) (not e!293521))))

(assert (=> b!501041 (= res!302781 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!227516 () Unit!15104)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32317 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15104)

(assert (=> b!501041 (= lt!227516 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!501042 () Bool)

(declare-fun Unit!15106 () Unit!15104)

(assert (=> b!501042 (= e!293523 Unit!15106)))

(declare-fun b!501043 () Bool)

(declare-fun Unit!15107 () Unit!15104)

(assert (=> b!501043 (= e!293523 Unit!15107)))

(declare-fun lt!227514 () Unit!15104)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32317 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15104)

(assert (=> b!501043 (= lt!227514 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!227510 #b00000000000000000000000000000000 (index!18212 lt!227518) (x!47244 lt!227518) mask!3524))))

(declare-fun res!302785 () Bool)

(assert (=> b!501043 (= res!302785 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227510 lt!227517 lt!227515 mask!3524) (Intermediate!4007 false (index!18212 lt!227518) (x!47244 lt!227518))))))

(assert (=> b!501043 (=> (not res!302785) (not e!293520))))

(assert (=> b!501043 e!293520))

(declare-fun b!501044 () Bool)

(declare-fun res!302788 () Bool)

(assert (=> b!501044 (=> (not res!302788) (not e!293522))))

(assert (=> b!501044 (= res!302788 (validKeyInArray!0 k!2280))))

(assert (= (and start!45492 res!302789) b!501033))

(assert (= (and b!501033 res!302786) b!501039))

(assert (= (and b!501039 res!302787) b!501044))

(assert (= (and b!501044 res!302788) b!501040))

(assert (= (and b!501040 res!302790) b!501034))

(assert (= (and b!501034 res!302782) b!501037))

(assert (= (and b!501037 res!302792) b!501035))

(assert (= (and b!501035 res!302791) b!501041))

(assert (= (and b!501041 res!302781) b!501036))

(assert (= (and b!501041 (not res!302783)) b!501031))

(assert (= (and b!501031 (not res!302784)) b!501038))

(assert (= (and b!501038 c!59402) b!501043))

(assert (= (and b!501038 (not c!59402)) b!501042))

(assert (= (and b!501043 res!302785) b!501032))

(declare-fun m!482127 () Bool)

(assert (=> b!501041 m!482127))

(declare-fun m!482129 () Bool)

(assert (=> b!501041 m!482129))

(declare-fun m!482131 () Bool)

(assert (=> b!501041 m!482131))

(declare-fun m!482133 () Bool)

(assert (=> b!501041 m!482133))

(declare-fun m!482135 () Bool)

(assert (=> b!501041 m!482135))

(assert (=> b!501041 m!482133))

(declare-fun m!482137 () Bool)

(assert (=> b!501041 m!482137))

(assert (=> b!501041 m!482133))

(declare-fun m!482139 () Bool)

(assert (=> b!501041 m!482139))

(declare-fun m!482141 () Bool)

(assert (=> b!501041 m!482141))

(declare-fun m!482143 () Bool)

(assert (=> b!501041 m!482143))

(declare-fun m!482145 () Bool)

(assert (=> b!501035 m!482145))

(declare-fun m!482147 () Bool)

(assert (=> b!501038 m!482147))

(declare-fun m!482149 () Bool)

(assert (=> b!501038 m!482149))

(assert (=> b!501038 m!482133))

(declare-fun m!482151 () Bool)

(assert (=> b!501040 m!482151))

(declare-fun m!482153 () Bool)

(assert (=> b!501043 m!482153))

(declare-fun m!482155 () Bool)

(assert (=> b!501043 m!482155))

(assert (=> b!501036 m!482133))

(assert (=> b!501036 m!482133))

(declare-fun m!482157 () Bool)

(assert (=> b!501036 m!482157))

(declare-fun m!482159 () Bool)

(assert (=> b!501037 m!482159))

(declare-fun m!482161 () Bool)

(assert (=> start!45492 m!482161))

(declare-fun m!482163 () Bool)

(assert (=> start!45492 m!482163))

(declare-fun m!482165 () Bool)

(assert (=> b!501034 m!482165))

(assert (=> b!501039 m!482133))

(assert (=> b!501039 m!482133))

(declare-fun m!482167 () Bool)

(assert (=> b!501039 m!482167))

(declare-fun m!482169 () Bool)

(assert (=> b!501044 m!482169))

(push 1)

