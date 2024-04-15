; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52980 () Bool)

(assert start!52980)

(declare-fun res!365051 () Bool)

(declare-fun e!331833 () Bool)

(assert (=> start!52980 (=> (not res!365051) (not e!331833))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52980 (= res!365051 (validMask!0 mask!3053))))

(assert (=> start!52980 e!331833))

(assert (=> start!52980 true))

(declare-datatypes ((array!36012 0))(
  ( (array!36013 (arr!17285 (Array (_ BitVec 32) (_ BitVec 64))) (size!17650 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36012)

(declare-fun array_inv!13168 (array!36012) Bool)

(assert (=> start!52980 (array_inv!13168 a!2986)))

(declare-fun b!576876 () Bool)

(declare-fun res!365053 () Bool)

(assert (=> b!576876 (=> (not res!365053) (not e!331833))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!576876 (= res!365053 (and (= (size!17650 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17650 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17650 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!576877 () Bool)

(declare-fun res!365052 () Bool)

(assert (=> b!576877 (=> (not res!365052) (not e!331833))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!576877 (= res!365052 (validKeyInArray!0 (select (arr!17285 a!2986) j!136)))))

(declare-fun b!576878 () Bool)

(declare-fun res!365054 () Bool)

(assert (=> b!576878 (=> (not res!365054) (not e!331833))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36012 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!576878 (= res!365054 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!576879 () Bool)

(declare-fun res!365050 () Bool)

(assert (=> b!576879 (=> (not res!365050) (not e!331833))))

(assert (=> b!576879 (= res!365050 (validKeyInArray!0 k0!1786))))

(declare-fun b!576880 () Bool)

(assert (=> b!576880 (= e!331833 false)))

(declare-datatypes ((SeekEntryResult!5722 0))(
  ( (MissingZero!5722 (index!25115 (_ BitVec 32))) (Found!5722 (index!25116 (_ BitVec 32))) (Intermediate!5722 (undefined!6534 Bool) (index!25117 (_ BitVec 32)) (x!54042 (_ BitVec 32))) (Undefined!5722) (MissingVacant!5722 (index!25118 (_ BitVec 32))) )
))
(declare-fun lt!263674 () SeekEntryResult!5722)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36012 (_ BitVec 32)) SeekEntryResult!5722)

(assert (=> b!576880 (= lt!263674 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(assert (= (and start!52980 res!365051) b!576876))

(assert (= (and b!576876 res!365053) b!576877))

(assert (= (and b!576877 res!365052) b!576879))

(assert (= (and b!576879 res!365050) b!576878))

(assert (= (and b!576878 res!365054) b!576880))

(declare-fun m!555287 () Bool)

(assert (=> b!576879 m!555287))

(declare-fun m!555289 () Bool)

(assert (=> start!52980 m!555289))

(declare-fun m!555291 () Bool)

(assert (=> start!52980 m!555291))

(declare-fun m!555293 () Bool)

(assert (=> b!576880 m!555293))

(declare-fun m!555295 () Bool)

(assert (=> b!576878 m!555295))

(declare-fun m!555297 () Bool)

(assert (=> b!576877 m!555297))

(assert (=> b!576877 m!555297))

(declare-fun m!555299 () Bool)

(assert (=> b!576877 m!555299))

(check-sat (not b!576879) (not b!576878) (not start!52980) (not b!576880) (not b!576877))
(check-sat)
