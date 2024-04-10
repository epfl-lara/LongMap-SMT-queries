; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44282 () Bool)

(assert start!44282)

(declare-fun b!486956 () Bool)

(declare-fun res!290345 () Bool)

(declare-fun e!286596 () Bool)

(assert (=> b!486956 (=> (not res!290345) (not e!286596))))

(declare-datatypes ((array!31533 0))(
  ( (array!31534 (arr!15160 (Array (_ BitVec 32) (_ BitVec 64))) (size!15524 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31533)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31533 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!486956 (= res!290345 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!486957 () Bool)

(declare-fun res!290342 () Bool)

(declare-fun e!286594 () Bool)

(assert (=> b!486957 (=> (not res!290342) (not e!286594))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31533 (_ BitVec 32)) Bool)

(assert (=> b!486957 (= res!290342 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!486958 () Bool)

(declare-fun res!290343 () Bool)

(assert (=> b!486958 (=> (not res!290343) (not e!286596))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!486958 (= res!290343 (validKeyInArray!0 k0!2280))))

(declare-fun b!486960 () Bool)

(assert (=> b!486960 (= e!286596 e!286594)))

(declare-fun res!290348 () Bool)

(assert (=> b!486960 (=> (not res!290348) (not e!286594))))

(declare-datatypes ((SeekEntryResult!3627 0))(
  ( (MissingZero!3627 (index!16687 (_ BitVec 32))) (Found!3627 (index!16688 (_ BitVec 32))) (Intermediate!3627 (undefined!4439 Bool) (index!16689 (_ BitVec 32)) (x!45815 (_ BitVec 32))) (Undefined!3627) (MissingVacant!3627 (index!16690 (_ BitVec 32))) )
))
(declare-fun lt!219904 () SeekEntryResult!3627)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!486960 (= res!290348 (or (= lt!219904 (MissingZero!3627 i!1204)) (= lt!219904 (MissingVacant!3627 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31533 (_ BitVec 32)) SeekEntryResult!3627)

(assert (=> b!486960 (= lt!219904 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!486961 () Bool)

(assert (=> b!486961 (= e!286594 false)))

(declare-fun lt!219903 () Bool)

(declare-datatypes ((List!9318 0))(
  ( (Nil!9315) (Cons!9314 (h!10170 (_ BitVec 64)) (t!15546 List!9318)) )
))
(declare-fun arrayNoDuplicates!0 (array!31533 (_ BitVec 32) List!9318) Bool)

(assert (=> b!486961 (= lt!219903 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9315))))

(declare-fun b!486962 () Bool)

(declare-fun res!290347 () Bool)

(assert (=> b!486962 (=> (not res!290347) (not e!286596))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!486962 (= res!290347 (validKeyInArray!0 (select (arr!15160 a!3235) j!176)))))

(declare-fun b!486959 () Bool)

(declare-fun res!290344 () Bool)

(assert (=> b!486959 (=> (not res!290344) (not e!286596))))

(assert (=> b!486959 (= res!290344 (and (= (size!15524 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15524 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15524 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!290346 () Bool)

(assert (=> start!44282 (=> (not res!290346) (not e!286596))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44282 (= res!290346 (validMask!0 mask!3524))))

(assert (=> start!44282 e!286596))

(assert (=> start!44282 true))

(declare-fun array_inv!10956 (array!31533) Bool)

(assert (=> start!44282 (array_inv!10956 a!3235)))

(assert (= (and start!44282 res!290346) b!486959))

(assert (= (and b!486959 res!290344) b!486962))

(assert (= (and b!486962 res!290347) b!486958))

(assert (= (and b!486958 res!290343) b!486956))

(assert (= (and b!486956 res!290345) b!486960))

(assert (= (and b!486960 res!290348) b!486957))

(assert (= (and b!486957 res!290342) b!486961))

(declare-fun m!466821 () Bool)

(assert (=> b!486961 m!466821))

(declare-fun m!466823 () Bool)

(assert (=> b!486962 m!466823))

(assert (=> b!486962 m!466823))

(declare-fun m!466825 () Bool)

(assert (=> b!486962 m!466825))

(declare-fun m!466827 () Bool)

(assert (=> start!44282 m!466827))

(declare-fun m!466829 () Bool)

(assert (=> start!44282 m!466829))

(declare-fun m!466831 () Bool)

(assert (=> b!486957 m!466831))

(declare-fun m!466833 () Bool)

(assert (=> b!486958 m!466833))

(declare-fun m!466835 () Bool)

(assert (=> b!486956 m!466835))

(declare-fun m!466837 () Bool)

(assert (=> b!486960 m!466837))

(check-sat (not b!486957) (not b!486961) (not b!486956) (not b!486960) (not b!486962) (not start!44282) (not b!486958))
(check-sat)
