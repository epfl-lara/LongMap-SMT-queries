; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52984 () Bool)

(assert start!52984)

(declare-fun b!577048 () Bool)

(declare-fun res!365084 () Bool)

(declare-fun e!331971 () Bool)

(assert (=> b!577048 (=> (not res!365084) (not e!331971))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36002 0))(
  ( (array!36003 (arr!17280 (Array (_ BitVec 32) (_ BitVec 64))) (size!17644 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36002)

(declare-fun mask!3053 () (_ BitVec 32))

(assert (=> b!577048 (= res!365084 (and (= (size!17644 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17644 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17644 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!577049 () Bool)

(declare-fun res!365080 () Bool)

(assert (=> b!577049 (=> (not res!365080) (not e!331971))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36002 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!577049 (= res!365080 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!577050 () Bool)

(declare-fun res!365083 () Bool)

(assert (=> b!577050 (=> (not res!365083) (not e!331971))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!577050 (= res!365083 (validKeyInArray!0 k!1786))))

(declare-fun res!365082 () Bool)

(assert (=> start!52984 (=> (not res!365082) (not e!331971))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52984 (= res!365082 (validMask!0 mask!3053))))

(assert (=> start!52984 e!331971))

(assert (=> start!52984 true))

(declare-fun array_inv!13076 (array!36002) Bool)

(assert (=> start!52984 (array_inv!13076 a!2986)))

(declare-fun b!577051 () Bool)

(assert (=> b!577051 (= e!331971 false)))

(declare-datatypes ((SeekEntryResult!5720 0))(
  ( (MissingZero!5720 (index!25107 (_ BitVec 32))) (Found!5720 (index!25108 (_ BitVec 32))) (Intermediate!5720 (undefined!6532 Bool) (index!25109 (_ BitVec 32)) (x!54029 (_ BitVec 32))) (Undefined!5720) (MissingVacant!5720 (index!25110 (_ BitVec 32))) )
))
(declare-fun lt!263899 () SeekEntryResult!5720)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36002 (_ BitVec 32)) SeekEntryResult!5720)

(assert (=> b!577051 (= lt!263899 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!577052 () Bool)

(declare-fun res!365081 () Bool)

(assert (=> b!577052 (=> (not res!365081) (not e!331971))))

(assert (=> b!577052 (= res!365081 (validKeyInArray!0 (select (arr!17280 a!2986) j!136)))))

(assert (= (and start!52984 res!365082) b!577048))

(assert (= (and b!577048 res!365084) b!577052))

(assert (= (and b!577052 res!365081) b!577050))

(assert (= (and b!577050 res!365083) b!577049))

(assert (= (and b!577049 res!365080) b!577051))

(declare-fun m!555975 () Bool)

(assert (=> b!577051 m!555975))

(declare-fun m!555977 () Bool)

(assert (=> b!577052 m!555977))

(assert (=> b!577052 m!555977))

(declare-fun m!555979 () Bool)

(assert (=> b!577052 m!555979))

(declare-fun m!555981 () Bool)

(assert (=> start!52984 m!555981))

(declare-fun m!555983 () Bool)

(assert (=> start!52984 m!555983))

(declare-fun m!555985 () Bool)

(assert (=> b!577050 m!555985))

(declare-fun m!555987 () Bool)

(assert (=> b!577049 m!555987))

(push 1)

(assert (not b!577052))

(assert (not b!577049))

(assert (not b!577050))

(assert (not b!577051))

(assert (not start!52984))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

