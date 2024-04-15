; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52972 () Bool)

(assert start!52972)

(declare-fun b!576807 () Bool)

(declare-fun e!331808 () Bool)

(assert (=> b!576807 (= e!331808 false)))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((array!36004 0))(
  ( (array!36005 (arr!17281 (Array (_ BitVec 32) (_ BitVec 64))) (size!17646 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36004)

(declare-datatypes ((SeekEntryResult!5718 0))(
  ( (MissingZero!5718 (index!25099 (_ BitVec 32))) (Found!5718 (index!25100 (_ BitVec 32))) (Intermediate!5718 (undefined!6530 Bool) (index!25101 (_ BitVec 32)) (x!54022 (_ BitVec 32))) (Undefined!5718) (MissingVacant!5718 (index!25102 (_ BitVec 32))) )
))
(declare-fun lt!263671 () SeekEntryResult!5718)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36004 (_ BitVec 32)) SeekEntryResult!5718)

(assert (=> b!576807 (= lt!263671 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!576808 () Bool)

(declare-fun res!364983 () Bool)

(assert (=> b!576808 (=> (not res!364983) (not e!331808))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!576808 (= res!364983 (validKeyInArray!0 (select (arr!17281 a!2986) j!136)))))

(declare-fun b!576809 () Bool)

(declare-fun res!364985 () Bool)

(assert (=> b!576809 (=> (not res!364985) (not e!331808))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!576809 (= res!364985 (and (= (size!17646 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17646 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17646 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!364982 () Bool)

(assert (=> start!52972 (=> (not res!364982) (not e!331808))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52972 (= res!364982 (validMask!0 mask!3053))))

(assert (=> start!52972 e!331808))

(assert (=> start!52972 true))

(declare-fun array_inv!13164 (array!36004) Bool)

(assert (=> start!52972 (array_inv!13164 a!2986)))

(declare-fun b!576810 () Bool)

(declare-fun res!364981 () Bool)

(assert (=> b!576810 (=> (not res!364981) (not e!331808))))

(assert (=> b!576810 (= res!364981 (validKeyInArray!0 k!1786))))

(declare-fun b!576811 () Bool)

(declare-fun res!364984 () Bool)

(assert (=> b!576811 (=> (not res!364984) (not e!331808))))

(declare-fun arrayContainsKey!0 (array!36004 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!576811 (= res!364984 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!52972 res!364982) b!576809))

(assert (= (and b!576809 res!364985) b!576808))

(assert (= (and b!576808 res!364983) b!576810))

(assert (= (and b!576810 res!364981) b!576811))

(assert (= (and b!576811 res!364984) b!576807))

(declare-fun m!555231 () Bool)

(assert (=> b!576811 m!555231))

(declare-fun m!555233 () Bool)

(assert (=> start!52972 m!555233))

(declare-fun m!555235 () Bool)

(assert (=> start!52972 m!555235))

(declare-fun m!555237 () Bool)

(assert (=> b!576808 m!555237))

(assert (=> b!576808 m!555237))

(declare-fun m!555239 () Bool)

(assert (=> b!576808 m!555239))

(declare-fun m!555241 () Bool)

(assert (=> b!576810 m!555241))

(declare-fun m!555243 () Bool)

(assert (=> b!576807 m!555243))

(push 1)

(assert (not b!576810))

(assert (not b!576811))

(assert (not start!52972))

(assert (not b!576808))

(assert (not b!576807))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

