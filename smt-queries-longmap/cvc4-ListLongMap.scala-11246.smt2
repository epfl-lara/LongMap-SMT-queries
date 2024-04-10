; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131148 () Bool)

(assert start!131148)

(declare-fun b!1538496 () Bool)

(declare-fun res!1055481 () Bool)

(declare-fun e!856008 () Bool)

(assert (=> b!1538496 (=> (not res!1055481) (not e!856008))))

(declare-datatypes ((array!102213 0))(
  ( (array!102214 (arr!49321 (Array (_ BitVec 32) (_ BitVec 64))) (size!49871 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102213)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1538496 (= res!1055481 (not (= (select (arr!49321 a!2792) index!463) (select (arr!49321 a!2792) j!64))))))

(declare-fun b!1538497 () Bool)

(declare-fun res!1055476 () Bool)

(assert (=> b!1538497 (=> (not res!1055476) (not e!856008))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1538497 (= res!1055476 (and (= (size!49871 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49871 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49871 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1538498 () Bool)

(declare-fun res!1055479 () Bool)

(assert (=> b!1538498 (=> (not res!1055479) (not e!856008))))

(declare-datatypes ((List!35795 0))(
  ( (Nil!35792) (Cons!35791 (h!37236 (_ BitVec 64)) (t!50489 List!35795)) )
))
(declare-fun arrayNoDuplicates!0 (array!102213 (_ BitVec 32) List!35795) Bool)

(assert (=> b!1538498 (= res!1055479 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35792))))

(declare-fun b!1538499 () Bool)

(declare-fun res!1055475 () Bool)

(assert (=> b!1538499 (=> (not res!1055475) (not e!856008))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1538499 (= res!1055475 (validKeyInArray!0 (select (arr!49321 a!2792) j!64)))))

(declare-fun res!1055474 () Bool)

(assert (=> start!131148 (=> (not res!1055474) (not e!856008))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131148 (= res!1055474 (validMask!0 mask!2480))))

(assert (=> start!131148 e!856008))

(assert (=> start!131148 true))

(declare-fun array_inv!38349 (array!102213) Bool)

(assert (=> start!131148 (array_inv!38349 a!2792)))

(declare-fun b!1538500 () Bool)

(declare-fun res!1055480 () Bool)

(assert (=> b!1538500 (=> (not res!1055480) (not e!856008))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102213 (_ BitVec 32)) Bool)

(assert (=> b!1538500 (= res!1055480 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1538501 () Bool)

(declare-fun res!1055482 () Bool)

(assert (=> b!1538501 (=> (not res!1055482) (not e!856008))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(assert (=> b!1538501 (= res!1055482 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49871 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49871 a!2792)) (= (select (arr!49321 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1538502 () Bool)

(assert (=> b!1538502 (= e!856008 false)))

(declare-fun lt!664906 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1538502 (= lt!664906 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1538503 () Bool)

(declare-fun res!1055478 () Bool)

(assert (=> b!1538503 (=> (not res!1055478) (not e!856008))))

(declare-datatypes ((SeekEntryResult!13447 0))(
  ( (MissingZero!13447 (index!56183 (_ BitVec 32))) (Found!13447 (index!56184 (_ BitVec 32))) (Intermediate!13447 (undefined!14259 Bool) (index!56185 (_ BitVec 32)) (x!137916 (_ BitVec 32))) (Undefined!13447) (MissingVacant!13447 (index!56186 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102213 (_ BitVec 32)) SeekEntryResult!13447)

(assert (=> b!1538503 (= res!1055478 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49321 a!2792) j!64) a!2792 mask!2480) (Found!13447 j!64)))))

(declare-fun b!1538504 () Bool)

(declare-fun res!1055477 () Bool)

(assert (=> b!1538504 (=> (not res!1055477) (not e!856008))))

(assert (=> b!1538504 (= res!1055477 (validKeyInArray!0 (select (arr!49321 a!2792) i!951)))))

(assert (= (and start!131148 res!1055474) b!1538497))

(assert (= (and b!1538497 res!1055476) b!1538504))

(assert (= (and b!1538504 res!1055477) b!1538499))

(assert (= (and b!1538499 res!1055475) b!1538500))

(assert (= (and b!1538500 res!1055480) b!1538498))

(assert (= (and b!1538498 res!1055479) b!1538501))

(assert (= (and b!1538501 res!1055482) b!1538503))

(assert (= (and b!1538503 res!1055478) b!1538496))

(assert (= (and b!1538496 res!1055481) b!1538502))

(declare-fun m!1420923 () Bool)

(assert (=> b!1538500 m!1420923))

(declare-fun m!1420925 () Bool)

(assert (=> b!1538504 m!1420925))

(assert (=> b!1538504 m!1420925))

(declare-fun m!1420927 () Bool)

(assert (=> b!1538504 m!1420927))

(declare-fun m!1420929 () Bool)

(assert (=> b!1538498 m!1420929))

(declare-fun m!1420931 () Bool)

(assert (=> b!1538503 m!1420931))

(assert (=> b!1538503 m!1420931))

(declare-fun m!1420933 () Bool)

(assert (=> b!1538503 m!1420933))

(declare-fun m!1420935 () Bool)

(assert (=> b!1538502 m!1420935))

(declare-fun m!1420937 () Bool)

(assert (=> start!131148 m!1420937))

(declare-fun m!1420939 () Bool)

(assert (=> start!131148 m!1420939))

(declare-fun m!1420941 () Bool)

(assert (=> b!1538501 m!1420941))

(declare-fun m!1420943 () Bool)

(assert (=> b!1538496 m!1420943))

(assert (=> b!1538496 m!1420931))

(assert (=> b!1538499 m!1420931))

(assert (=> b!1538499 m!1420931))

(declare-fun m!1420945 () Bool)

(assert (=> b!1538499 m!1420945))

(push 1)

(assert (not b!1538498))

(assert (not b!1538504))

(assert (not b!1538503))

(assert (not b!1538502))

(assert (not b!1538499))

(assert (not start!131148))

(assert (not b!1538500))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

