; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25968 () Bool)

(assert start!25968)

(declare-fun b!268006 () Bool)

(declare-fun e!173188 () Bool)

(assert (=> b!268006 (= e!173188 false)))

(declare-datatypes ((array!13065 0))(
  ( (array!13066 (arr!6182 (Array (_ BitVec 32) (_ BitVec 64))) (size!6534 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13065)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1340 0))(
  ( (MissingZero!1340 (index!7530 (_ BitVec 32))) (Found!1340 (index!7531 (_ BitVec 32))) (Intermediate!1340 (undefined!2152 Bool) (index!7532 (_ BitVec 32)) (x!25905 (_ BitVec 32))) (Undefined!1340) (MissingVacant!1340 (index!7533 (_ BitVec 32))) )
))
(declare-fun lt!134767 () SeekEntryResult!1340)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13065 (_ BitVec 32)) SeekEntryResult!1340)

(assert (=> b!268006 (= lt!134767 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!268007 () Bool)

(declare-fun res!132287 () Bool)

(assert (=> b!268007 (=> (not res!132287) (not e!173188))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!268007 (= res!132287 (and (= (size!6534 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6534 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6534 a!3325))))))

(declare-fun b!268008 () Bool)

(declare-fun res!132285 () Bool)

(assert (=> b!268008 (=> (not res!132285) (not e!173188))))

(declare-fun arrayContainsKey!0 (array!13065 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268008 (= res!132285 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun res!132284 () Bool)

(assert (=> start!25968 (=> (not res!132284) (not e!173188))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25968 (= res!132284 (validMask!0 mask!3868))))

(assert (=> start!25968 e!173188))

(declare-fun array_inv!4145 (array!13065) Bool)

(assert (=> start!25968 (array_inv!4145 a!3325)))

(assert (=> start!25968 true))

(declare-fun b!268009 () Bool)

(declare-fun res!132288 () Bool)

(assert (=> b!268009 (=> (not res!132288) (not e!173188))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268009 (= res!132288 (validKeyInArray!0 k!2581))))

(declare-fun b!268010 () Bool)

(declare-fun res!132286 () Bool)

(assert (=> b!268010 (=> (not res!132286) (not e!173188))))

(declare-datatypes ((List!3990 0))(
  ( (Nil!3987) (Cons!3986 (h!4653 (_ BitVec 64)) (t!9072 List!3990)) )
))
(declare-fun arrayNoDuplicates!0 (array!13065 (_ BitVec 32) List!3990) Bool)

(assert (=> b!268010 (= res!132286 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3987))))

(assert (= (and start!25968 res!132284) b!268007))

(assert (= (and b!268007 res!132287) b!268009))

(assert (= (and b!268009 res!132288) b!268010))

(assert (= (and b!268010 res!132286) b!268008))

(assert (= (and b!268008 res!132285) b!268006))

(declare-fun m!284235 () Bool)

(assert (=> b!268008 m!284235))

(declare-fun m!284237 () Bool)

(assert (=> b!268009 m!284237))

(declare-fun m!284239 () Bool)

(assert (=> start!25968 m!284239))

(declare-fun m!284241 () Bool)

(assert (=> start!25968 m!284241))

(declare-fun m!284243 () Bool)

(assert (=> b!268010 m!284243))

(declare-fun m!284245 () Bool)

(assert (=> b!268006 m!284245))

(push 1)

(assert (not b!268010))

(assert (not b!268006))

(assert (not b!268008))

(assert (not start!25968))

(assert (not b!268009))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

