; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53030 () Bool)

(assert start!53030)

(declare-fun res!365435 () Bool)

(declare-fun e!332109 () Bool)

(assert (=> start!53030 (=> (not res!365435) (not e!332109))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53030 (= res!365435 (validMask!0 mask!3053))))

(assert (=> start!53030 e!332109))

(assert (=> start!53030 true))

(declare-datatypes ((array!36048 0))(
  ( (array!36049 (arr!17303 (Array (_ BitVec 32) (_ BitVec 64))) (size!17667 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36048)

(declare-fun array_inv!13099 (array!36048) Bool)

(assert (=> start!53030 (array_inv!13099 a!2986)))

(declare-fun b!577402 () Bool)

(declare-fun res!365436 () Bool)

(assert (=> b!577402 (=> (not res!365436) (not e!332109))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36048 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!577402 (= res!365436 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!577403 () Bool)

(declare-fun res!365434 () Bool)

(assert (=> b!577403 (=> (not res!365434) (not e!332109))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!577403 (= res!365434 (validKeyInArray!0 (select (arr!17303 a!2986) j!136)))))

(declare-fun b!577404 () Bool)

(declare-fun res!365437 () Bool)

(assert (=> b!577404 (=> (not res!365437) (not e!332109))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!577404 (= res!365437 (and (= (size!17667 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17667 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17667 a!2986)) (not (= i!1108 j!136))))))

(declare-datatypes ((SeekEntryResult!5743 0))(
  ( (MissingZero!5743 (index!25199 (_ BitVec 32))) (Found!5743 (index!25200 (_ BitVec 32))) (Intermediate!5743 (undefined!6555 Bool) (index!25201 (_ BitVec 32)) (x!54108 (_ BitVec 32))) (Undefined!5743) (MissingVacant!5743 (index!25202 (_ BitVec 32))) )
))
(declare-fun lt!263959 () SeekEntryResult!5743)

(declare-fun b!577405 () Bool)

(assert (=> b!577405 (= e!332109 (and (or (= lt!263959 (MissingZero!5743 i!1108)) (= lt!263959 (MissingVacant!5743 i!1108))) (bvsgt #b00000000000000000000000000000000 (size!17667 a!2986))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36048 (_ BitVec 32)) SeekEntryResult!5743)

(assert (=> b!577405 (= lt!263959 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!577406 () Bool)

(declare-fun res!365438 () Bool)

(assert (=> b!577406 (=> (not res!365438) (not e!332109))))

(assert (=> b!577406 (= res!365438 (validKeyInArray!0 k!1786))))

(assert (= (and start!53030 res!365435) b!577404))

(assert (= (and b!577404 res!365437) b!577403))

(assert (= (and b!577403 res!365434) b!577406))

(assert (= (and b!577406 res!365438) b!577402))

(assert (= (and b!577402 res!365436) b!577405))

(declare-fun m!556297 () Bool)

(assert (=> start!53030 m!556297))

(declare-fun m!556299 () Bool)

(assert (=> start!53030 m!556299))

(declare-fun m!556301 () Bool)

(assert (=> b!577403 m!556301))

(assert (=> b!577403 m!556301))

(declare-fun m!556303 () Bool)

(assert (=> b!577403 m!556303))

(declare-fun m!556305 () Bool)

(assert (=> b!577405 m!556305))

(declare-fun m!556307 () Bool)

(assert (=> b!577402 m!556307))

(declare-fun m!556309 () Bool)

(assert (=> b!577406 m!556309))

(push 1)

(assert (not b!577402))

(assert (not start!53030))

(assert (not b!577406))

(assert (not b!577405))

(assert (not b!577403))

(check-sat)

(pop 1)

