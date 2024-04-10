; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44304 () Bool)

(assert start!44304)

(declare-fun res!290609 () Bool)

(declare-fun e!286694 () Bool)

(assert (=> start!44304 (=> (not res!290609) (not e!286694))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44304 (= res!290609 (validMask!0 mask!3524))))

(assert (=> start!44304 e!286694))

(assert (=> start!44304 true))

(declare-datatypes ((array!31555 0))(
  ( (array!31556 (arr!15171 (Array (_ BitVec 32) (_ BitVec 64))) (size!15535 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31555)

(declare-fun array_inv!10967 (array!31555) Bool)

(assert (=> start!44304 (array_inv!10967 a!3235)))

(declare-fun b!487216 () Bool)

(declare-fun res!290608 () Bool)

(assert (=> b!487216 (=> (not res!290608) (not e!286694))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31555 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!487216 (= res!290608 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!487217 () Bool)

(declare-fun res!290604 () Bool)

(declare-fun e!286695 () Bool)

(assert (=> b!487217 (=> (not res!290604) (not e!286695))))

(declare-datatypes ((List!9329 0))(
  ( (Nil!9326) (Cons!9325 (h!10181 (_ BitVec 64)) (t!15557 List!9329)) )
))
(declare-fun arrayNoDuplicates!0 (array!31555 (_ BitVec 32) List!9329) Bool)

(assert (=> b!487217 (= res!290604 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9326))))

(declare-fun b!487218 () Bool)

(declare-fun res!290605 () Bool)

(assert (=> b!487218 (=> (not res!290605) (not e!286695))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31555 (_ BitVec 32)) Bool)

(assert (=> b!487218 (= res!290605 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!487219 () Bool)

(declare-fun res!290602 () Bool)

(assert (=> b!487219 (=> (not res!290602) (not e!286694))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!487219 (= res!290602 (validKeyInArray!0 (select (arr!15171 a!3235) j!176)))))

(declare-fun b!487220 () Bool)

(declare-fun res!290603 () Bool)

(assert (=> b!487220 (=> (not res!290603) (not e!286694))))

(assert (=> b!487220 (= res!290603 (validKeyInArray!0 k!2280))))

(declare-fun b!487221 () Bool)

(assert (=> b!487221 (= e!286695 (not true))))

(assert (=> b!487221 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14222 0))(
  ( (Unit!14223) )
))
(declare-fun lt!219970 () Unit!14222)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31555 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14222)

(assert (=> b!487221 (= lt!219970 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!487222 () Bool)

(assert (=> b!487222 (= e!286694 e!286695)))

(declare-fun res!290606 () Bool)

(assert (=> b!487222 (=> (not res!290606) (not e!286695))))

(declare-datatypes ((SeekEntryResult!3638 0))(
  ( (MissingZero!3638 (index!16731 (_ BitVec 32))) (Found!3638 (index!16732 (_ BitVec 32))) (Intermediate!3638 (undefined!4450 Bool) (index!16733 (_ BitVec 32)) (x!45858 (_ BitVec 32))) (Undefined!3638) (MissingVacant!3638 (index!16734 (_ BitVec 32))) )
))
(declare-fun lt!219969 () SeekEntryResult!3638)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!487222 (= res!290606 (or (= lt!219969 (MissingZero!3638 i!1204)) (= lt!219969 (MissingVacant!3638 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31555 (_ BitVec 32)) SeekEntryResult!3638)

(assert (=> b!487222 (= lt!219969 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!487223 () Bool)

(declare-fun res!290607 () Bool)

(assert (=> b!487223 (=> (not res!290607) (not e!286694))))

(assert (=> b!487223 (= res!290607 (and (= (size!15535 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15535 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15535 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!44304 res!290609) b!487223))

(assert (= (and b!487223 res!290607) b!487219))

(assert (= (and b!487219 res!290602) b!487220))

(assert (= (and b!487220 res!290603) b!487216))

(assert (= (and b!487216 res!290608) b!487222))

(assert (= (and b!487222 res!290606) b!487218))

(assert (= (and b!487218 res!290605) b!487217))

(assert (= (and b!487217 res!290604) b!487221))

(declare-fun m!467055 () Bool)

(assert (=> b!487219 m!467055))

(assert (=> b!487219 m!467055))

(declare-fun m!467057 () Bool)

(assert (=> b!487219 m!467057))

(declare-fun m!467059 () Bool)

(assert (=> b!487221 m!467059))

(declare-fun m!467061 () Bool)

(assert (=> b!487221 m!467061))

(declare-fun m!467063 () Bool)

(assert (=> start!44304 m!467063))

(declare-fun m!467065 () Bool)

(assert (=> start!44304 m!467065))

(declare-fun m!467067 () Bool)

(assert (=> b!487217 m!467067))

(declare-fun m!467069 () Bool)

(assert (=> b!487220 m!467069))

(declare-fun m!467071 () Bool)

(assert (=> b!487222 m!467071))

(declare-fun m!467073 () Bool)

(assert (=> b!487216 m!467073))

(declare-fun m!467075 () Bool)

(assert (=> b!487218 m!467075))

(push 1)

(assert (not b!487220))

(assert (not b!487216))

(assert (not b!487218))

(assert (not b!487221))

(assert (not b!487217))

(assert (not start!44304))

(assert (not b!487222))

(assert (not b!487219))

(check-sat)

(pop 1)

