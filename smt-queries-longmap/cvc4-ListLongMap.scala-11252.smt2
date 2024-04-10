; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131184 () Bool)

(assert start!131184)

(declare-fun b!1538982 () Bool)

(declare-fun res!1055967 () Bool)

(declare-fun e!856117 () Bool)

(assert (=> b!1538982 (=> (not res!1055967) (not e!856117))))

(declare-datatypes ((array!102249 0))(
  ( (array!102250 (arr!49339 (Array (_ BitVec 32) (_ BitVec 64))) (size!49889 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102249)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13465 0))(
  ( (MissingZero!13465 (index!56255 (_ BitVec 32))) (Found!13465 (index!56256 (_ BitVec 32))) (Intermediate!13465 (undefined!14277 Bool) (index!56257 (_ BitVec 32)) (x!137982 (_ BitVec 32))) (Undefined!13465) (MissingVacant!13465 (index!56258 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102249 (_ BitVec 32)) SeekEntryResult!13465)

(assert (=> b!1538982 (= res!1055967 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49339 a!2792) j!64) a!2792 mask!2480) (Found!13465 j!64)))))

(declare-fun b!1538983 () Bool)

(declare-fun res!1055966 () Bool)

(assert (=> b!1538983 (=> (not res!1055966) (not e!856117))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1538983 (= res!1055966 (and (= (size!49889 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49889 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49889 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1538984 () Bool)

(declare-fun res!1055960 () Bool)

(assert (=> b!1538984 (=> (not res!1055960) (not e!856117))))

(assert (=> b!1538984 (= res!1055960 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49889 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49889 a!2792)) (= (select (arr!49339 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1538985 () Bool)

(declare-fun res!1055964 () Bool)

(assert (=> b!1538985 (=> (not res!1055964) (not e!856117))))

(assert (=> b!1538985 (= res!1055964 (not (= (select (arr!49339 a!2792) index!463) (select (arr!49339 a!2792) j!64))))))

(declare-fun b!1538986 () Bool)

(declare-fun res!1055962 () Bool)

(assert (=> b!1538986 (=> (not res!1055962) (not e!856117))))

(declare-datatypes ((List!35813 0))(
  ( (Nil!35810) (Cons!35809 (h!37254 (_ BitVec 64)) (t!50507 List!35813)) )
))
(declare-fun arrayNoDuplicates!0 (array!102249 (_ BitVec 32) List!35813) Bool)

(assert (=> b!1538986 (= res!1055962 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35810))))

(declare-fun b!1538987 () Bool)

(declare-fun res!1055965 () Bool)

(assert (=> b!1538987 (=> (not res!1055965) (not e!856117))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1538987 (= res!1055965 (validKeyInArray!0 (select (arr!49339 a!2792) j!64)))))

(declare-fun b!1538989 () Bool)

(assert (=> b!1538989 (= e!856117 false)))

(declare-fun lt!664960 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1538989 (= lt!664960 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1538990 () Bool)

(declare-fun res!1055968 () Bool)

(assert (=> b!1538990 (=> (not res!1055968) (not e!856117))))

(assert (=> b!1538990 (= res!1055968 (validKeyInArray!0 (select (arr!49339 a!2792) i!951)))))

(declare-fun res!1055963 () Bool)

(assert (=> start!131184 (=> (not res!1055963) (not e!856117))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131184 (= res!1055963 (validMask!0 mask!2480))))

(assert (=> start!131184 e!856117))

(assert (=> start!131184 true))

(declare-fun array_inv!38367 (array!102249) Bool)

(assert (=> start!131184 (array_inv!38367 a!2792)))

(declare-fun b!1538988 () Bool)

(declare-fun res!1055961 () Bool)

(assert (=> b!1538988 (=> (not res!1055961) (not e!856117))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102249 (_ BitVec 32)) Bool)

(assert (=> b!1538988 (= res!1055961 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(assert (= (and start!131184 res!1055963) b!1538983))

(assert (= (and b!1538983 res!1055966) b!1538990))

(assert (= (and b!1538990 res!1055968) b!1538987))

(assert (= (and b!1538987 res!1055965) b!1538988))

(assert (= (and b!1538988 res!1055961) b!1538986))

(assert (= (and b!1538986 res!1055962) b!1538984))

(assert (= (and b!1538984 res!1055960) b!1538982))

(assert (= (and b!1538982 res!1055967) b!1538985))

(assert (= (and b!1538985 res!1055964) b!1538989))

(declare-fun m!1421355 () Bool)

(assert (=> b!1538988 m!1421355))

(declare-fun m!1421357 () Bool)

(assert (=> b!1538985 m!1421357))

(declare-fun m!1421359 () Bool)

(assert (=> b!1538985 m!1421359))

(assert (=> b!1538987 m!1421359))

(assert (=> b!1538987 m!1421359))

(declare-fun m!1421361 () Bool)

(assert (=> b!1538987 m!1421361))

(declare-fun m!1421363 () Bool)

(assert (=> b!1538986 m!1421363))

(declare-fun m!1421365 () Bool)

(assert (=> b!1538984 m!1421365))

(declare-fun m!1421367 () Bool)

(assert (=> b!1538990 m!1421367))

(assert (=> b!1538990 m!1421367))

(declare-fun m!1421369 () Bool)

(assert (=> b!1538990 m!1421369))

(assert (=> b!1538982 m!1421359))

(assert (=> b!1538982 m!1421359))

(declare-fun m!1421371 () Bool)

(assert (=> b!1538982 m!1421371))

(declare-fun m!1421373 () Bool)

(assert (=> start!131184 m!1421373))

(declare-fun m!1421375 () Bool)

(assert (=> start!131184 m!1421375))

(declare-fun m!1421377 () Bool)

(assert (=> b!1538989 m!1421377))

(push 1)

(assert (not b!1538988))

(assert (not b!1538987))

(assert (not b!1538990))

(assert (not b!1538986))

(assert (not start!131184))

(assert (not b!1538982))

(assert (not b!1538989))

(check-sat)

