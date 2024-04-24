; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131572 () Bool)

(assert start!131572)

(declare-fun b!1541013 () Bool)

(declare-fun res!1056423 () Bool)

(declare-fun e!857536 () Bool)

(assert (=> b!1541013 (=> (not res!1056423) (not e!857536))))

(declare-datatypes ((array!102341 0))(
  ( (array!102342 (arr!49377 (Array (_ BitVec 32) (_ BitVec 64))) (size!49928 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102341)

(declare-datatypes ((List!35838 0))(
  ( (Nil!35835) (Cons!35834 (h!37297 (_ BitVec 64)) (t!50524 List!35838)) )
))
(declare-fun arrayNoDuplicates!0 (array!102341 (_ BitVec 32) List!35838) Bool)

(assert (=> b!1541013 (= res!1056423 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35835))))

(declare-fun b!1541014 () Bool)

(declare-fun res!1056415 () Bool)

(assert (=> b!1541014 (=> (not res!1056415) (not e!857536))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1541014 (= res!1056415 (and (= (size!49928 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49928 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49928 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1541015 () Bool)

(declare-fun res!1056416 () Bool)

(assert (=> b!1541015 (=> (not res!1056416) (not e!857536))))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1541015 (= res!1056416 (not (= (select (arr!49377 a!2792) index!463) (select (arr!49377 a!2792) j!64))))))

(declare-fun b!1541017 () Bool)

(assert (=> b!1541017 (= e!857536 false)))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun lt!665826 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1541017 (= lt!665826 (nextIndex!0 index!463 (bvadd #b00000000000000000000000000000001 x!510) mask!2480))))

(declare-fun b!1541018 () Bool)

(declare-fun res!1056419 () Bool)

(assert (=> b!1541018 (=> (not res!1056419) (not e!857536))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1541018 (= res!1056419 (validKeyInArray!0 (select (arr!49377 a!2792) i!951)))))

(declare-fun b!1541019 () Bool)

(declare-fun res!1056422 () Bool)

(assert (=> b!1541019 (=> (not res!1056422) (not e!857536))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102341 (_ BitVec 32)) Bool)

(assert (=> b!1541019 (= res!1056422 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1541020 () Bool)

(declare-fun res!1056418 () Bool)

(assert (=> b!1541020 (=> (not res!1056418) (not e!857536))))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13398 0))(
  ( (MissingZero!13398 (index!55987 (_ BitVec 32))) (Found!13398 (index!55988 (_ BitVec 32))) (Intermediate!13398 (undefined!14210 Bool) (index!55989 (_ BitVec 32)) (x!137925 (_ BitVec 32))) (Undefined!13398) (MissingVacant!13398 (index!55990 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102341 (_ BitVec 32)) SeekEntryResult!13398)

(assert (=> b!1541020 (= res!1056418 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49377 a!2792) j!64) a!2792 mask!2480) (Found!13398 j!64)))))

(declare-fun b!1541021 () Bool)

(declare-fun res!1056420 () Bool)

(assert (=> b!1541021 (=> (not res!1056420) (not e!857536))))

(assert (=> b!1541021 (= res!1056420 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49928 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49928 a!2792)) (= (select (arr!49377 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!1056421 () Bool)

(assert (=> start!131572 (=> (not res!1056421) (not e!857536))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131572 (= res!1056421 (validMask!0 mask!2480))))

(assert (=> start!131572 e!857536))

(assert (=> start!131572 true))

(declare-fun array_inv!38658 (array!102341) Bool)

(assert (=> start!131572 (array_inv!38658 a!2792)))

(declare-fun b!1541016 () Bool)

(declare-fun res!1056417 () Bool)

(assert (=> b!1541016 (=> (not res!1056417) (not e!857536))))

(assert (=> b!1541016 (= res!1056417 (validKeyInArray!0 (select (arr!49377 a!2792) j!64)))))

(assert (= (and start!131572 res!1056421) b!1541014))

(assert (= (and b!1541014 res!1056415) b!1541018))

(assert (= (and b!1541018 res!1056419) b!1541016))

(assert (= (and b!1541016 res!1056417) b!1541019))

(assert (= (and b!1541019 res!1056422) b!1541013))

(assert (= (and b!1541013 res!1056423) b!1541021))

(assert (= (and b!1541021 res!1056420) b!1541020))

(assert (= (and b!1541020 res!1056418) b!1541015))

(assert (= (and b!1541015 res!1056416) b!1541017))

(declare-fun m!1423231 () Bool)

(assert (=> b!1541016 m!1423231))

(assert (=> b!1541016 m!1423231))

(declare-fun m!1423233 () Bool)

(assert (=> b!1541016 m!1423233))

(declare-fun m!1423235 () Bool)

(assert (=> b!1541015 m!1423235))

(assert (=> b!1541015 m!1423231))

(declare-fun m!1423237 () Bool)

(assert (=> b!1541021 m!1423237))

(declare-fun m!1423239 () Bool)

(assert (=> start!131572 m!1423239))

(declare-fun m!1423241 () Bool)

(assert (=> start!131572 m!1423241))

(declare-fun m!1423243 () Bool)

(assert (=> b!1541013 m!1423243))

(assert (=> b!1541020 m!1423231))

(assert (=> b!1541020 m!1423231))

(declare-fun m!1423245 () Bool)

(assert (=> b!1541020 m!1423245))

(declare-fun m!1423247 () Bool)

(assert (=> b!1541019 m!1423247))

(declare-fun m!1423249 () Bool)

(assert (=> b!1541017 m!1423249))

(declare-fun m!1423251 () Bool)

(assert (=> b!1541018 m!1423251))

(assert (=> b!1541018 m!1423251))

(declare-fun m!1423253 () Bool)

(assert (=> b!1541018 m!1423253))

(push 1)

(assert (not b!1541013))

(assert (not b!1541019))

(assert (not b!1541020))

(assert (not b!1541017))

(assert (not start!131572))

(assert (not b!1541018))

(assert (not b!1541016))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

