; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45036 () Bool)

(assert start!45036)

(declare-fun b!494186 () Bool)

(declare-fun res!296765 () Bool)

(declare-fun e!290083 () Bool)

(assert (=> b!494186 (=> (not res!296765) (not e!290083))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!31981 0))(
  ( (array!31982 (arr!15375 (Array (_ BitVec 32) (_ BitVec 64))) (size!15739 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31981)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!494186 (= res!296765 (and (= (size!15739 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15739 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15739 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!494187 () Bool)

(declare-fun e!290085 () Bool)

(declare-fun e!290084 () Bool)

(assert (=> b!494187 (= e!290085 (not e!290084))))

(declare-fun res!296759 () Bool)

(assert (=> b!494187 (=> res!296759 e!290084)))

(declare-fun lt!223620 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3842 0))(
  ( (MissingZero!3842 (index!17547 (_ BitVec 32))) (Found!3842 (index!17548 (_ BitVec 32))) (Intermediate!3842 (undefined!4654 Bool) (index!17549 (_ BitVec 32)) (x!46624 (_ BitVec 32))) (Undefined!3842) (MissingVacant!3842 (index!17550 (_ BitVec 32))) )
))
(declare-fun lt!223624 () SeekEntryResult!3842)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31981 (_ BitVec 32)) SeekEntryResult!3842)

(assert (=> b!494187 (= res!296759 (= lt!223624 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223620 (select (store (arr!15375 a!3235) i!1204 k!2280) j!176) (array!31982 (store (arr!15375 a!3235) i!1204 k!2280) (size!15739 a!3235)) mask!3524)))))

(declare-fun lt!223623 () (_ BitVec 32))

(assert (=> b!494187 (= lt!223624 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223623 (select (arr!15375 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!494187 (= lt!223620 (toIndex!0 (select (store (arr!15375 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!494187 (= lt!223623 (toIndex!0 (select (arr!15375 a!3235) j!176) mask!3524))))

(declare-fun lt!223619 () SeekEntryResult!3842)

(assert (=> b!494187 (= lt!223619 (Found!3842 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31981 (_ BitVec 32)) SeekEntryResult!3842)

(assert (=> b!494187 (= lt!223619 (seekEntryOrOpen!0 (select (arr!15375 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31981 (_ BitVec 32)) Bool)

(assert (=> b!494187 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14630 0))(
  ( (Unit!14631) )
))
(declare-fun lt!223621 () Unit!14630)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31981 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14630)

(assert (=> b!494187 (= lt!223621 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!494188 () Bool)

(assert (=> b!494188 (= e!290084 true)))

(assert (=> b!494188 (= lt!223619 Undefined!3842)))

(declare-fun b!494189 () Bool)

(declare-fun res!296764 () Bool)

(assert (=> b!494189 (=> (not res!296764) (not e!290085))))

(declare-datatypes ((List!9533 0))(
  ( (Nil!9530) (Cons!9529 (h!10397 (_ BitVec 64)) (t!15761 List!9533)) )
))
(declare-fun arrayNoDuplicates!0 (array!31981 (_ BitVec 32) List!9533) Bool)

(assert (=> b!494189 (= res!296764 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9530))))

(declare-fun res!296761 () Bool)

(assert (=> start!45036 (=> (not res!296761) (not e!290083))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45036 (= res!296761 (validMask!0 mask!3524))))

(assert (=> start!45036 e!290083))

(assert (=> start!45036 true))

(declare-fun array_inv!11171 (array!31981) Bool)

(assert (=> start!45036 (array_inv!11171 a!3235)))

(declare-fun b!494190 () Bool)

(declare-fun res!296758 () Bool)

(assert (=> b!494190 (=> (not res!296758) (not e!290083))))

(declare-fun arrayContainsKey!0 (array!31981 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!494190 (= res!296758 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!494191 () Bool)

(declare-fun res!296763 () Bool)

(assert (=> b!494191 (=> (not res!296763) (not e!290083))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!494191 (= res!296763 (validKeyInArray!0 (select (arr!15375 a!3235) j!176)))))

(declare-fun b!494192 () Bool)

(declare-fun res!296756 () Bool)

(assert (=> b!494192 (=> (not res!296756) (not e!290083))))

(assert (=> b!494192 (= res!296756 (validKeyInArray!0 k!2280))))

(declare-fun b!494193 () Bool)

(declare-fun res!296762 () Bool)

(assert (=> b!494193 (=> (not res!296762) (not e!290085))))

(assert (=> b!494193 (= res!296762 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!494194 () Bool)

(assert (=> b!494194 (= e!290083 e!290085)))

(declare-fun res!296760 () Bool)

(assert (=> b!494194 (=> (not res!296760) (not e!290085))))

(declare-fun lt!223622 () SeekEntryResult!3842)

(assert (=> b!494194 (= res!296760 (or (= lt!223622 (MissingZero!3842 i!1204)) (= lt!223622 (MissingVacant!3842 i!1204))))))

(assert (=> b!494194 (= lt!223622 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!494195 () Bool)

(declare-fun res!296757 () Bool)

(assert (=> b!494195 (=> res!296757 e!290084)))

(assert (=> b!494195 (= res!296757 (or (not (is-Intermediate!3842 lt!223624)) (not (undefined!4654 lt!223624))))))

(assert (= (and start!45036 res!296761) b!494186))

(assert (= (and b!494186 res!296765) b!494191))

(assert (= (and b!494191 res!296763) b!494192))

(assert (= (and b!494192 res!296756) b!494190))

(assert (= (and b!494190 res!296758) b!494194))

(assert (= (and b!494194 res!296760) b!494193))

(assert (= (and b!494193 res!296762) b!494189))

(assert (= (and b!494189 res!296764) b!494187))

(assert (= (and b!494187 (not res!296759)) b!494195))

(assert (= (and b!494195 (not res!296757)) b!494188))

(declare-fun m!475179 () Bool)

(assert (=> b!494192 m!475179))

(declare-fun m!475181 () Bool)

(assert (=> start!45036 m!475181))

(declare-fun m!475183 () Bool)

(assert (=> start!45036 m!475183))

(declare-fun m!475185 () Bool)

(assert (=> b!494187 m!475185))

(declare-fun m!475187 () Bool)

(assert (=> b!494187 m!475187))

(declare-fun m!475189 () Bool)

(assert (=> b!494187 m!475189))

(assert (=> b!494187 m!475189))

(declare-fun m!475191 () Bool)

(assert (=> b!494187 m!475191))

(declare-fun m!475193 () Bool)

(assert (=> b!494187 m!475193))

(declare-fun m!475195 () Bool)

(assert (=> b!494187 m!475195))

(assert (=> b!494187 m!475193))

(declare-fun m!475197 () Bool)

(assert (=> b!494187 m!475197))

(assert (=> b!494187 m!475193))

(declare-fun m!475199 () Bool)

(assert (=> b!494187 m!475199))

(assert (=> b!494187 m!475193))

(declare-fun m!475201 () Bool)

(assert (=> b!494187 m!475201))

(assert (=> b!494187 m!475189))

(declare-fun m!475203 () Bool)

(assert (=> b!494187 m!475203))

(declare-fun m!475205 () Bool)

(assert (=> b!494193 m!475205))

(declare-fun m!475207 () Bool)

(assert (=> b!494189 m!475207))

(declare-fun m!475209 () Bool)

(assert (=> b!494194 m!475209))

(assert (=> b!494191 m!475193))

(assert (=> b!494191 m!475193))

(declare-fun m!475211 () Bool)

(assert (=> b!494191 m!475211))

(declare-fun m!475213 () Bool)

(assert (=> b!494190 m!475213))

(push 1)

