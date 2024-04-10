; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45034 () Bool)

(assert start!45034)

(declare-fun b!494156 () Bool)

(declare-fun e!290070 () Bool)

(declare-fun e!290073 () Bool)

(assert (=> b!494156 (= e!290070 e!290073)))

(declare-fun res!296729 () Bool)

(assert (=> b!494156 (=> (not res!296729) (not e!290073))))

(declare-datatypes ((SeekEntryResult!3841 0))(
  ( (MissingZero!3841 (index!17543 (_ BitVec 32))) (Found!3841 (index!17544 (_ BitVec 32))) (Intermediate!3841 (undefined!4653 Bool) (index!17545 (_ BitVec 32)) (x!46615 (_ BitVec 32))) (Undefined!3841) (MissingVacant!3841 (index!17546 (_ BitVec 32))) )
))
(declare-fun lt!223603 () SeekEntryResult!3841)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!494156 (= res!296729 (or (= lt!223603 (MissingZero!3841 i!1204)) (= lt!223603 (MissingVacant!3841 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!31979 0))(
  ( (array!31980 (arr!15374 (Array (_ BitVec 32) (_ BitVec 64))) (size!15738 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31979)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31979 (_ BitVec 32)) SeekEntryResult!3841)

(assert (=> b!494156 (= lt!223603 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!494157 () Bool)

(declare-fun res!296733 () Bool)

(assert (=> b!494157 (=> (not res!296733) (not e!290070))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!494157 (= res!296733 (validKeyInArray!0 (select (arr!15374 a!3235) j!176)))))

(declare-fun b!494158 () Bool)

(declare-fun e!290072 () Bool)

(assert (=> b!494158 (= e!290072 true)))

(declare-fun lt!223605 () SeekEntryResult!3841)

(assert (=> b!494158 (= lt!223605 Undefined!3841)))

(declare-fun b!494159 () Bool)

(declare-fun res!296730 () Bool)

(assert (=> b!494159 (=> (not res!296730) (not e!290070))))

(assert (=> b!494159 (= res!296730 (validKeyInArray!0 k!2280))))

(declare-fun res!296726 () Bool)

(assert (=> start!45034 (=> (not res!296726) (not e!290070))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45034 (= res!296726 (validMask!0 mask!3524))))

(assert (=> start!45034 e!290070))

(assert (=> start!45034 true))

(declare-fun array_inv!11170 (array!31979) Bool)

(assert (=> start!45034 (array_inv!11170 a!3235)))

(declare-fun b!494160 () Bool)

(declare-fun res!296734 () Bool)

(assert (=> b!494160 (=> (not res!296734) (not e!290070))))

(assert (=> b!494160 (= res!296734 (and (= (size!15738 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15738 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15738 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!494161 () Bool)

(declare-fun res!296728 () Bool)

(assert (=> b!494161 (=> (not res!296728) (not e!290070))))

(declare-fun arrayContainsKey!0 (array!31979 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!494161 (= res!296728 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!494162 () Bool)

(declare-fun res!296735 () Bool)

(assert (=> b!494162 (=> (not res!296735) (not e!290073))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31979 (_ BitVec 32)) Bool)

(assert (=> b!494162 (= res!296735 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!494163 () Bool)

(declare-fun res!296731 () Bool)

(assert (=> b!494163 (=> (not res!296731) (not e!290073))))

(declare-datatypes ((List!9532 0))(
  ( (Nil!9529) (Cons!9528 (h!10396 (_ BitVec 64)) (t!15760 List!9532)) )
))
(declare-fun arrayNoDuplicates!0 (array!31979 (_ BitVec 32) List!9532) Bool)

(assert (=> b!494163 (= res!296731 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9529))))

(declare-fun b!494164 () Bool)

(declare-fun res!296732 () Bool)

(assert (=> b!494164 (=> res!296732 e!290072)))

(declare-fun lt!223601 () SeekEntryResult!3841)

(assert (=> b!494164 (= res!296732 (or (not (is-Intermediate!3841 lt!223601)) (not (undefined!4653 lt!223601))))))

(declare-fun b!494165 () Bool)

(assert (=> b!494165 (= e!290073 (not e!290072))))

(declare-fun res!296727 () Bool)

(assert (=> b!494165 (=> res!296727 e!290072)))

(declare-fun lt!223604 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31979 (_ BitVec 32)) SeekEntryResult!3841)

(assert (=> b!494165 (= res!296727 (= lt!223601 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223604 (select (store (arr!15374 a!3235) i!1204 k!2280) j!176) (array!31980 (store (arr!15374 a!3235) i!1204 k!2280) (size!15738 a!3235)) mask!3524)))))

(declare-fun lt!223606 () (_ BitVec 32))

(assert (=> b!494165 (= lt!223601 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223606 (select (arr!15374 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!494165 (= lt!223604 (toIndex!0 (select (store (arr!15374 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!494165 (= lt!223606 (toIndex!0 (select (arr!15374 a!3235) j!176) mask!3524))))

(assert (=> b!494165 (= lt!223605 (Found!3841 j!176))))

(assert (=> b!494165 (= lt!223605 (seekEntryOrOpen!0 (select (arr!15374 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!494165 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14628 0))(
  ( (Unit!14629) )
))
(declare-fun lt!223602 () Unit!14628)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31979 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14628)

(assert (=> b!494165 (= lt!223602 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!45034 res!296726) b!494160))

(assert (= (and b!494160 res!296734) b!494157))

(assert (= (and b!494157 res!296733) b!494159))

(assert (= (and b!494159 res!296730) b!494161))

(assert (= (and b!494161 res!296728) b!494156))

(assert (= (and b!494156 res!296729) b!494162))

(assert (= (and b!494162 res!296735) b!494163))

(assert (= (and b!494163 res!296731) b!494165))

(assert (= (and b!494165 (not res!296727)) b!494164))

(assert (= (and b!494164 (not res!296732)) b!494158))

(declare-fun m!475143 () Bool)

(assert (=> start!45034 m!475143))

(declare-fun m!475145 () Bool)

(assert (=> start!45034 m!475145))

(declare-fun m!475147 () Bool)

(assert (=> b!494163 m!475147))

(declare-fun m!475149 () Bool)

(assert (=> b!494161 m!475149))

(declare-fun m!475151 () Bool)

(assert (=> b!494159 m!475151))

(declare-fun m!475153 () Bool)

(assert (=> b!494162 m!475153))

(declare-fun m!475155 () Bool)

(assert (=> b!494157 m!475155))

(assert (=> b!494157 m!475155))

(declare-fun m!475157 () Bool)

(assert (=> b!494157 m!475157))

(declare-fun m!475159 () Bool)

(assert (=> b!494165 m!475159))

(declare-fun m!475161 () Bool)

(assert (=> b!494165 m!475161))

(declare-fun m!475163 () Bool)

(assert (=> b!494165 m!475163))

(assert (=> b!494165 m!475155))

(declare-fun m!475165 () Bool)

(assert (=> b!494165 m!475165))

(assert (=> b!494165 m!475155))

(declare-fun m!475167 () Bool)

(assert (=> b!494165 m!475167))

(assert (=> b!494165 m!475163))

(declare-fun m!475169 () Bool)

(assert (=> b!494165 m!475169))

(assert (=> b!494165 m!475155))

(declare-fun m!475171 () Bool)

(assert (=> b!494165 m!475171))

(assert (=> b!494165 m!475155))

(declare-fun m!475173 () Bool)

(assert (=> b!494165 m!475173))

(assert (=> b!494165 m!475163))

(declare-fun m!475175 () Bool)

(assert (=> b!494165 m!475175))

(declare-fun m!475177 () Bool)

(assert (=> b!494156 m!475177))

(push 1)

