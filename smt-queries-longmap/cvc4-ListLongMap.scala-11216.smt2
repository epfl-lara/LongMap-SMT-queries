; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131348 () Bool)

(assert start!131348)

(declare-fun b!1538219 () Bool)

(declare-fun res!1053737 () Bool)

(declare-fun e!856409 () Bool)

(assert (=> b!1538219 (=> (not res!1053737) (not e!856409))))

(declare-datatypes ((array!102150 0))(
  ( (array!102151 (arr!49283 (Array (_ BitVec 32) (_ BitVec 64))) (size!49834 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102150)

(declare-datatypes ((List!35744 0))(
  ( (Nil!35741) (Cons!35740 (h!37203 (_ BitVec 64)) (t!50430 List!35744)) )
))
(declare-fun arrayNoDuplicates!0 (array!102150 (_ BitVec 32) List!35744) Bool)

(assert (=> b!1538219 (= res!1053737 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35741))))

(declare-fun b!1538220 () Bool)

(declare-fun res!1053735 () Bool)

(assert (=> b!1538220 (=> (not res!1053735) (not e!856409))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1538220 (= res!1053735 (validKeyInArray!0 (select (arr!49283 a!2792) i!951)))))

(declare-fun b!1538221 () Bool)

(declare-fun res!1053738 () Bool)

(assert (=> b!1538221 (=> (not res!1053738) (not e!856409))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(assert (=> b!1538221 (= res!1053738 (and (= (size!49834 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49834 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49834 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1538222 () Bool)

(declare-fun res!1053736 () Bool)

(assert (=> b!1538222 (=> (not res!1053736) (not e!856409))))

(assert (=> b!1538222 (= res!1053736 (validKeyInArray!0 (select (arr!49283 a!2792) j!64)))))

(declare-fun b!1538223 () Bool)

(declare-fun res!1053734 () Bool)

(assert (=> b!1538223 (=> (not res!1053734) (not e!856409))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102150 (_ BitVec 32)) Bool)

(assert (=> b!1538223 (= res!1053734 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1538224 () Bool)

(declare-fun e!856411 () Bool)

(assert (=> b!1538224 (= e!856411 false)))

(declare-datatypes ((SeekEntryResult!13310 0))(
  ( (MissingZero!13310 (index!55635 (_ BitVec 32))) (Found!13310 (index!55636 (_ BitVec 32))) (Intermediate!13310 (undefined!14122 Bool) (index!55637 (_ BitVec 32)) (x!137586 (_ BitVec 32))) (Undefined!13310) (MissingVacant!13310 (index!55638 (_ BitVec 32))) )
))
(declare-fun lt!665040 () SeekEntryResult!13310)

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun lt!665039 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102150 (_ BitVec 32)) SeekEntryResult!13310)

(assert (=> b!1538224 (= lt!665040 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665039 vacantIndex!5 (select (arr!49283 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1538225 () Bool)

(assert (=> b!1538225 (= e!856409 e!856411)))

(declare-fun res!1053731 () Bool)

(assert (=> b!1538225 (=> (not res!1053731) (not e!856411))))

(assert (=> b!1538225 (= res!1053731 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!665039 #b00000000000000000000000000000000) (bvslt lt!665039 (size!49834 a!2792))))))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1538225 (= lt!665039 (nextIndex!0 index!463 (bvadd #b00000000000000000000000000000001 x!510) mask!2480))))

(declare-fun res!1053730 () Bool)

(assert (=> start!131348 (=> (not res!1053730) (not e!856409))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131348 (= res!1053730 (validMask!0 mask!2480))))

(assert (=> start!131348 e!856409))

(assert (=> start!131348 true))

(declare-fun array_inv!38564 (array!102150) Bool)

(assert (=> start!131348 (array_inv!38564 a!2792)))

(declare-fun b!1538226 () Bool)

(declare-fun res!1053733 () Bool)

(assert (=> b!1538226 (=> (not res!1053733) (not e!856409))))

(assert (=> b!1538226 (= res!1053733 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49283 a!2792) j!64) a!2792 mask!2480) (Found!13310 j!64)))))

(declare-fun b!1538227 () Bool)

(declare-fun res!1053732 () Bool)

(assert (=> b!1538227 (=> (not res!1053732) (not e!856409))))

(assert (=> b!1538227 (= res!1053732 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49834 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49834 a!2792)) (= (select (arr!49283 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1538228 () Bool)

(declare-fun res!1053729 () Bool)

(assert (=> b!1538228 (=> (not res!1053729) (not e!856409))))

(assert (=> b!1538228 (= res!1053729 (not (= (select (arr!49283 a!2792) index!463) (select (arr!49283 a!2792) j!64))))))

(assert (= (and start!131348 res!1053730) b!1538221))

(assert (= (and b!1538221 res!1053738) b!1538220))

(assert (= (and b!1538220 res!1053735) b!1538222))

(assert (= (and b!1538222 res!1053736) b!1538223))

(assert (= (and b!1538223 res!1053734) b!1538219))

(assert (= (and b!1538219 res!1053737) b!1538227))

(assert (= (and b!1538227 res!1053732) b!1538226))

(assert (= (and b!1538226 res!1053733) b!1538228))

(assert (= (and b!1538228 res!1053729) b!1538225))

(assert (= (and b!1538225 res!1053731) b!1538224))

(declare-fun m!1420491 () Bool)

(assert (=> b!1538225 m!1420491))

(declare-fun m!1420493 () Bool)

(assert (=> b!1538222 m!1420493))

(assert (=> b!1538222 m!1420493))

(declare-fun m!1420495 () Bool)

(assert (=> b!1538222 m!1420495))

(declare-fun m!1420497 () Bool)

(assert (=> b!1538227 m!1420497))

(declare-fun m!1420499 () Bool)

(assert (=> b!1538219 m!1420499))

(assert (=> b!1538224 m!1420493))

(assert (=> b!1538224 m!1420493))

(declare-fun m!1420501 () Bool)

(assert (=> b!1538224 m!1420501))

(declare-fun m!1420503 () Bool)

(assert (=> b!1538228 m!1420503))

(assert (=> b!1538228 m!1420493))

(assert (=> b!1538226 m!1420493))

(assert (=> b!1538226 m!1420493))

(declare-fun m!1420505 () Bool)

(assert (=> b!1538226 m!1420505))

(declare-fun m!1420507 () Bool)

(assert (=> b!1538223 m!1420507))

(declare-fun m!1420509 () Bool)

(assert (=> start!131348 m!1420509))

(declare-fun m!1420511 () Bool)

(assert (=> start!131348 m!1420511))

(declare-fun m!1420513 () Bool)

(assert (=> b!1538220 m!1420513))

(assert (=> b!1538220 m!1420513))

(declare-fun m!1420515 () Bool)

(assert (=> b!1538220 m!1420515))

(push 1)

(assert (not b!1538225))

(assert (not b!1538223))

(assert (not b!1538226))

(assert (not b!1538222))

(assert (not b!1538224))

(assert (not b!1538220))

(assert (not start!131348))

(assert (not b!1538219))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

