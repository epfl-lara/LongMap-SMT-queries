; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131578 () Bool)

(assert start!131578)

(declare-fun b!1541094 () Bool)

(declare-fun res!1056502 () Bool)

(declare-fun e!857554 () Bool)

(assert (=> b!1541094 (=> (not res!1056502) (not e!857554))))

(declare-datatypes ((array!102347 0))(
  ( (array!102348 (arr!49380 (Array (_ BitVec 32) (_ BitVec 64))) (size!49931 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102347)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1541094 (= res!1056502 (validKeyInArray!0 (select (arr!49380 a!2792) j!64)))))

(declare-fun b!1541095 () Bool)

(declare-fun res!1056497 () Bool)

(assert (=> b!1541095 (=> (not res!1056497) (not e!857554))))

(declare-datatypes ((List!35841 0))(
  ( (Nil!35838) (Cons!35837 (h!37300 (_ BitVec 64)) (t!50527 List!35841)) )
))
(declare-fun arrayNoDuplicates!0 (array!102347 (_ BitVec 32) List!35841) Bool)

(assert (=> b!1541095 (= res!1056497 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35838))))

(declare-fun b!1541096 () Bool)

(assert (=> b!1541096 (= e!857554 false)))

(declare-fun lt!665835 () (_ BitVec 32))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1541096 (= lt!665835 (nextIndex!0 index!463 (bvadd #b00000000000000000000000000000001 x!510) mask!2480))))

(declare-fun b!1541097 () Bool)

(declare-fun res!1056500 () Bool)

(assert (=> b!1541097 (=> (not res!1056500) (not e!857554))))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13401 0))(
  ( (MissingZero!13401 (index!55999 (_ BitVec 32))) (Found!13401 (index!56000 (_ BitVec 32))) (Intermediate!13401 (undefined!14213 Bool) (index!56001 (_ BitVec 32)) (x!137936 (_ BitVec 32))) (Undefined!13401) (MissingVacant!13401 (index!56002 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102347 (_ BitVec 32)) SeekEntryResult!13401)

(assert (=> b!1541097 (= res!1056500 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49380 a!2792) j!64) a!2792 mask!2480) (Found!13401 j!64)))))

(declare-fun b!1541098 () Bool)

(declare-fun res!1056499 () Bool)

(assert (=> b!1541098 (=> (not res!1056499) (not e!857554))))

(assert (=> b!1541098 (= res!1056499 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49931 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49931 a!2792)) (= (select (arr!49380 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1541099 () Bool)

(declare-fun res!1056498 () Bool)

(assert (=> b!1541099 (=> (not res!1056498) (not e!857554))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1541099 (= res!1056498 (and (= (size!49931 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49931 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49931 a!2792)) (not (= i!951 j!64))))))

(declare-fun res!1056504 () Bool)

(assert (=> start!131578 (=> (not res!1056504) (not e!857554))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131578 (= res!1056504 (validMask!0 mask!2480))))

(assert (=> start!131578 e!857554))

(assert (=> start!131578 true))

(declare-fun array_inv!38661 (array!102347) Bool)

(assert (=> start!131578 (array_inv!38661 a!2792)))

(declare-fun b!1541100 () Bool)

(declare-fun res!1056496 () Bool)

(assert (=> b!1541100 (=> (not res!1056496) (not e!857554))))

(assert (=> b!1541100 (= res!1056496 (not (= (select (arr!49380 a!2792) index!463) (select (arr!49380 a!2792) j!64))))))

(declare-fun b!1541101 () Bool)

(declare-fun res!1056503 () Bool)

(assert (=> b!1541101 (=> (not res!1056503) (not e!857554))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102347 (_ BitVec 32)) Bool)

(assert (=> b!1541101 (= res!1056503 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1541102 () Bool)

(declare-fun res!1056501 () Bool)

(assert (=> b!1541102 (=> (not res!1056501) (not e!857554))))

(assert (=> b!1541102 (= res!1056501 (validKeyInArray!0 (select (arr!49380 a!2792) i!951)))))

(assert (= (and start!131578 res!1056504) b!1541099))

(assert (= (and b!1541099 res!1056498) b!1541102))

(assert (= (and b!1541102 res!1056501) b!1541094))

(assert (= (and b!1541094 res!1056502) b!1541101))

(assert (= (and b!1541101 res!1056503) b!1541095))

(assert (= (and b!1541095 res!1056497) b!1541098))

(assert (= (and b!1541098 res!1056499) b!1541097))

(assert (= (and b!1541097 res!1056500) b!1541100))

(assert (= (and b!1541100 res!1056496) b!1541096))

(declare-fun m!1423303 () Bool)

(assert (=> b!1541094 m!1423303))

(assert (=> b!1541094 m!1423303))

(declare-fun m!1423305 () Bool)

(assert (=> b!1541094 m!1423305))

(declare-fun m!1423307 () Bool)

(assert (=> start!131578 m!1423307))

(declare-fun m!1423309 () Bool)

(assert (=> start!131578 m!1423309))

(declare-fun m!1423311 () Bool)

(assert (=> b!1541095 m!1423311))

(declare-fun m!1423313 () Bool)

(assert (=> b!1541100 m!1423313))

(assert (=> b!1541100 m!1423303))

(declare-fun m!1423315 () Bool)

(assert (=> b!1541096 m!1423315))

(declare-fun m!1423317 () Bool)

(assert (=> b!1541102 m!1423317))

(assert (=> b!1541102 m!1423317))

(declare-fun m!1423319 () Bool)

(assert (=> b!1541102 m!1423319))

(declare-fun m!1423321 () Bool)

(assert (=> b!1541101 m!1423321))

(declare-fun m!1423323 () Bool)

(assert (=> b!1541098 m!1423323))

(assert (=> b!1541097 m!1423303))

(assert (=> b!1541097 m!1423303))

(declare-fun m!1423325 () Bool)

(assert (=> b!1541097 m!1423325))

(push 1)

(assert (not b!1541095))

(assert (not b!1541102))

(assert (not b!1541101))

(assert (not b!1541094))

(assert (not start!131578))

(assert (not b!1541096))

(assert (not b!1541097))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

