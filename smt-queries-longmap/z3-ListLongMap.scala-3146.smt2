; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44288 () Bool)

(assert start!44288)

(declare-fun res!290528 () Bool)

(declare-fun e!286627 () Bool)

(assert (=> start!44288 (=> (not res!290528) (not e!286627))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44288 (= res!290528 (validMask!0 mask!3524))))

(assert (=> start!44288 e!286627))

(assert (=> start!44288 true))

(declare-datatypes ((array!31540 0))(
  ( (array!31541 (arr!15163 (Array (_ BitVec 32) (_ BitVec 64))) (size!15527 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31540)

(declare-fun array_inv!11022 (array!31540) Bool)

(assert (=> start!44288 (array_inv!11022 a!3235)))

(declare-fun b!487083 () Bool)

(declare-fun res!290530 () Bool)

(declare-fun e!286628 () Bool)

(assert (=> b!487083 (=> (not res!290530) (not e!286628))))

(declare-datatypes ((List!9228 0))(
  ( (Nil!9225) (Cons!9224 (h!10080 (_ BitVec 64)) (t!15448 List!9228)) )
))
(declare-fun arrayNoDuplicates!0 (array!31540 (_ BitVec 32) List!9228) Bool)

(assert (=> b!487083 (= res!290530 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9225))))

(declare-fun b!487084 () Bool)

(declare-fun res!290523 () Bool)

(assert (=> b!487084 (=> (not res!290523) (not e!286627))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31540 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!487084 (= res!290523 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!487085 () Bool)

(declare-fun res!290527 () Bool)

(assert (=> b!487085 (=> (not res!290527) (not e!286627))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!487085 (= res!290527 (and (= (size!15527 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15527 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15527 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!487086 () Bool)

(declare-fun res!290529 () Bool)

(assert (=> b!487086 (=> (not res!290529) (not e!286627))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!487086 (= res!290529 (validKeyInArray!0 k0!2280))))

(declare-fun b!487087 () Bool)

(declare-fun res!290525 () Bool)

(assert (=> b!487087 (=> (not res!290525) (not e!286627))))

(assert (=> b!487087 (= res!290525 (validKeyInArray!0 (select (arr!15163 a!3235) j!176)))))

(declare-fun b!487088 () Bool)

(assert (=> b!487088 (= e!286627 e!286628)))

(declare-fun res!290526 () Bool)

(assert (=> b!487088 (=> (not res!290526) (not e!286628))))

(declare-datatypes ((SeekEntryResult!3586 0))(
  ( (MissingZero!3586 (index!16523 (_ BitVec 32))) (Found!3586 (index!16524 (_ BitVec 32))) (Intermediate!3586 (undefined!4398 Bool) (index!16525 (_ BitVec 32)) (x!45795 (_ BitVec 32))) (Undefined!3586) (MissingVacant!3586 (index!16526 (_ BitVec 32))) )
))
(declare-fun lt!219963 () SeekEntryResult!3586)

(assert (=> b!487088 (= res!290526 (or (= lt!219963 (MissingZero!3586 i!1204)) (= lt!219963 (MissingVacant!3586 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31540 (_ BitVec 32)) SeekEntryResult!3586)

(assert (=> b!487088 (= lt!219963 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!487089 () Bool)

(assert (=> b!487089 (= e!286628 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31540 (_ BitVec 32)) Bool)

(assert (=> b!487089 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14179 0))(
  ( (Unit!14180) )
))
(declare-fun lt!219964 () Unit!14179)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31540 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14179)

(assert (=> b!487089 (= lt!219964 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!487090 () Bool)

(declare-fun res!290524 () Bool)

(assert (=> b!487090 (=> (not res!290524) (not e!286628))))

(assert (=> b!487090 (= res!290524 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!44288 res!290528) b!487085))

(assert (= (and b!487085 res!290527) b!487087))

(assert (= (and b!487087 res!290525) b!487086))

(assert (= (and b!487086 res!290529) b!487084))

(assert (= (and b!487084 res!290523) b!487088))

(assert (= (and b!487088 res!290526) b!487090))

(assert (= (and b!487090 res!290524) b!487083))

(assert (= (and b!487083 res!290530) b!487089))

(declare-fun m!467173 () Bool)

(assert (=> b!487083 m!467173))

(declare-fun m!467175 () Bool)

(assert (=> b!487084 m!467175))

(declare-fun m!467177 () Bool)

(assert (=> b!487086 m!467177))

(declare-fun m!467179 () Bool)

(assert (=> b!487088 m!467179))

(declare-fun m!467181 () Bool)

(assert (=> b!487087 m!467181))

(assert (=> b!487087 m!467181))

(declare-fun m!467183 () Bool)

(assert (=> b!487087 m!467183))

(declare-fun m!467185 () Bool)

(assert (=> start!44288 m!467185))

(declare-fun m!467187 () Bool)

(assert (=> start!44288 m!467187))

(declare-fun m!467189 () Bool)

(assert (=> b!487089 m!467189))

(declare-fun m!467191 () Bool)

(assert (=> b!487089 m!467191))

(declare-fun m!467193 () Bool)

(assert (=> b!487090 m!467193))

(check-sat (not b!487088) (not start!44288) (not b!487083) (not b!487089) (not b!487086) (not b!487087) (not b!487090) (not b!487084))
(check-sat)
