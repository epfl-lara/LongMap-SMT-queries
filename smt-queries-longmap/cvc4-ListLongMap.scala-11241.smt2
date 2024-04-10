; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131082 () Bool)

(assert start!131082)

(declare-fun res!1055056 () Bool)

(declare-fun e!855810 () Bool)

(assert (=> start!131082 (=> (not res!1055056) (not e!855810))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131082 (= res!1055056 (validMask!0 mask!2480))))

(assert (=> start!131082 e!855810))

(assert (=> start!131082 true))

(declare-datatypes ((array!102180 0))(
  ( (array!102181 (arr!49306 (Array (_ BitVec 32) (_ BitVec 64))) (size!49856 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102180)

(declare-fun array_inv!38334 (array!102180) Bool)

(assert (=> start!131082 (array_inv!38334 a!2792)))

(declare-fun b!1537967 () Bool)

(declare-fun res!1055058 () Bool)

(assert (=> b!1537967 (=> (not res!1055058) (not e!855810))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102180 (_ BitVec 32)) Bool)

(assert (=> b!1537967 (= res!1055058 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1537968 () Bool)

(declare-fun res!1055053 () Bool)

(assert (=> b!1537968 (=> (not res!1055053) (not e!855810))))

(declare-datatypes ((List!35780 0))(
  ( (Nil!35777) (Cons!35776 (h!37221 (_ BitVec 64)) (t!50474 List!35780)) )
))
(declare-fun arrayNoDuplicates!0 (array!102180 (_ BitVec 32) List!35780) Bool)

(assert (=> b!1537968 (= res!1055053 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35777))))

(declare-fun b!1537969 () Bool)

(declare-fun res!1055054 () Bool)

(assert (=> b!1537969 (=> (not res!1055054) (not e!855810))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1537969 (= res!1055054 (and (= (size!49856 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49856 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49856 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1537970 () Bool)

(assert (=> b!1537970 (= e!855810 false)))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13432 0))(
  ( (MissingZero!13432 (index!56123 (_ BitVec 32))) (Found!13432 (index!56124 (_ BitVec 32))) (Intermediate!13432 (undefined!14244 Bool) (index!56125 (_ BitVec 32)) (x!137858 (_ BitVec 32))) (Undefined!13432) (MissingVacant!13432 (index!56126 (_ BitVec 32))) )
))
(declare-fun lt!664810 () SeekEntryResult!13432)

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102180 (_ BitVec 32)) SeekEntryResult!13432)

(assert (=> b!1537970 (= lt!664810 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49306 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1537971 () Bool)

(declare-fun res!1055055 () Bool)

(assert (=> b!1537971 (=> (not res!1055055) (not e!855810))))

(assert (=> b!1537971 (= res!1055055 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49856 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49856 a!2792)) (= (select (arr!49306 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1537972 () Bool)

(declare-fun res!1055059 () Bool)

(assert (=> b!1537972 (=> (not res!1055059) (not e!855810))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1537972 (= res!1055059 (validKeyInArray!0 (select (arr!49306 a!2792) i!951)))))

(declare-fun b!1537973 () Bool)

(declare-fun res!1055057 () Bool)

(assert (=> b!1537973 (=> (not res!1055057) (not e!855810))))

(assert (=> b!1537973 (= res!1055057 (validKeyInArray!0 (select (arr!49306 a!2792) j!64)))))

(assert (= (and start!131082 res!1055056) b!1537969))

(assert (= (and b!1537969 res!1055054) b!1537972))

(assert (= (and b!1537972 res!1055059) b!1537973))

(assert (= (and b!1537973 res!1055057) b!1537967))

(assert (= (and b!1537967 res!1055058) b!1537968))

(assert (= (and b!1537968 res!1055053) b!1537971))

(assert (= (and b!1537971 res!1055055) b!1537970))

(declare-fun m!1420471 () Bool)

(assert (=> b!1537971 m!1420471))

(declare-fun m!1420473 () Bool)

(assert (=> start!131082 m!1420473))

(declare-fun m!1420475 () Bool)

(assert (=> start!131082 m!1420475))

(declare-fun m!1420477 () Bool)

(assert (=> b!1537968 m!1420477))

(declare-fun m!1420479 () Bool)

(assert (=> b!1537973 m!1420479))

(assert (=> b!1537973 m!1420479))

(declare-fun m!1420481 () Bool)

(assert (=> b!1537973 m!1420481))

(declare-fun m!1420483 () Bool)

(assert (=> b!1537967 m!1420483))

(assert (=> b!1537970 m!1420479))

(assert (=> b!1537970 m!1420479))

(declare-fun m!1420485 () Bool)

(assert (=> b!1537970 m!1420485))

(declare-fun m!1420487 () Bool)

(assert (=> b!1537972 m!1420487))

(assert (=> b!1537972 m!1420487))

(declare-fun m!1420489 () Bool)

(assert (=> b!1537972 m!1420489))

(push 1)

(assert (not start!131082))

(assert (not b!1537968))

(assert (not b!1537973))

(assert (not b!1537967))

(assert (not b!1537970))

(assert (not b!1537972))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

