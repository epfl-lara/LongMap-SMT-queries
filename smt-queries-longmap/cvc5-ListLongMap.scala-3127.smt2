; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44052 () Bool)

(assert start!44052)

(declare-fun b!485607 () Bool)

(declare-fun res!289266 () Bool)

(declare-fun e!285912 () Bool)

(assert (=> b!485607 (=> (not res!289266) (not e!285912))))

(declare-datatypes ((array!31421 0))(
  ( (array!31422 (arr!15108 (Array (_ BitVec 32) (_ BitVec 64))) (size!15472 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31421)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!485607 (= res!289266 (validKeyInArray!0 (select (arr!15108 a!3235) j!176)))))

(declare-fun res!289263 () Bool)

(assert (=> start!44052 (=> (not res!289263) (not e!285912))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44052 (= res!289263 (validMask!0 mask!3524))))

(assert (=> start!44052 e!285912))

(assert (=> start!44052 true))

(declare-fun array_inv!10967 (array!31421) Bool)

(assert (=> start!44052 (array_inv!10967 a!3235)))

(declare-fun b!485608 () Bool)

(declare-fun res!289267 () Bool)

(assert (=> b!485608 (=> (not res!289267) (not e!285912))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!485608 (= res!289267 (validKeyInArray!0 k!2280))))

(declare-fun b!485609 () Bool)

(declare-fun res!289265 () Bool)

(assert (=> b!485609 (=> (not res!289265) (not e!285912))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!485609 (= res!289265 (and (= (size!15472 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15472 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15472 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!485610 () Bool)

(assert (=> b!485610 (= e!285912 false)))

(declare-datatypes ((SeekEntryResult!3531 0))(
  ( (MissingZero!3531 (index!16303 (_ BitVec 32))) (Found!3531 (index!16304 (_ BitVec 32))) (Intermediate!3531 (undefined!4343 Bool) (index!16305 (_ BitVec 32)) (x!45588 (_ BitVec 32))) (Undefined!3531) (MissingVacant!3531 (index!16306 (_ BitVec 32))) )
))
(declare-fun lt!219568 () SeekEntryResult!3531)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31421 (_ BitVec 32)) SeekEntryResult!3531)

(assert (=> b!485610 (= lt!219568 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!485611 () Bool)

(declare-fun res!289264 () Bool)

(assert (=> b!485611 (=> (not res!289264) (not e!285912))))

(declare-fun arrayContainsKey!0 (array!31421 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!485611 (= res!289264 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!44052 res!289263) b!485609))

(assert (= (and b!485609 res!289265) b!485607))

(assert (= (and b!485607 res!289266) b!485608))

(assert (= (and b!485608 res!289267) b!485611))

(assert (= (and b!485611 res!289264) b!485610))

(declare-fun m!465941 () Bool)

(assert (=> b!485607 m!465941))

(assert (=> b!485607 m!465941))

(declare-fun m!465943 () Bool)

(assert (=> b!485607 m!465943))

(declare-fun m!465945 () Bool)

(assert (=> start!44052 m!465945))

(declare-fun m!465947 () Bool)

(assert (=> start!44052 m!465947))

(declare-fun m!465949 () Bool)

(assert (=> b!485610 m!465949))

(declare-fun m!465951 () Bool)

(assert (=> b!485608 m!465951))

(declare-fun m!465953 () Bool)

(assert (=> b!485611 m!465953))

(push 1)

(assert (not b!485610))

(assert (not start!44052))

(assert (not b!485611))

(assert (not b!485607))

(assert (not b!485608))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

