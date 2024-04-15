; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118056 () Bool)

(assert start!118056)

(declare-fun b!1382344 () Bool)

(declare-fun res!923978 () Bool)

(declare-fun e!783528 () Bool)

(assert (=> b!1382344 (=> (not res!923978) (not e!783528))))

(declare-datatypes ((array!94372 0))(
  ( (array!94373 (arr!45567 (Array (_ BitVec 32) (_ BitVec 64))) (size!46119 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94372)

(declare-fun i!1094 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382344 (= res!923978 (validKeyInArray!0 (select (arr!45567 a!2971) i!1094)))))

(declare-fun res!923979 () Bool)

(assert (=> start!118056 (=> (not res!923979) (not e!783528))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118056 (= res!923979 (validMask!0 mask!3034))))

(assert (=> start!118056 e!783528))

(assert (=> start!118056 true))

(declare-fun array_inv!34800 (array!94372) Bool)

(assert (=> start!118056 (array_inv!34800 a!2971)))

(declare-fun b!1382343 () Bool)

(declare-fun res!923980 () Bool)

(assert (=> b!1382343 (=> (not res!923980) (not e!783528))))

(assert (=> b!1382343 (= res!923980 (and (= (size!46119 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46119 a!2971))))))

(declare-fun b!1382345 () Bool)

(declare-fun res!923981 () Bool)

(assert (=> b!1382345 (=> (not res!923981) (not e!783528))))

(declare-datatypes ((List!32179 0))(
  ( (Nil!32176) (Cons!32175 (h!33384 (_ BitVec 64)) (t!46865 List!32179)) )
))
(declare-fun arrayNoDuplicates!0 (array!94372 (_ BitVec 32) List!32179) Bool)

(assert (=> b!1382345 (= res!923981 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32176))))

(declare-fun b!1382346 () Bool)

(assert (=> b!1382346 (= e!783528 false)))

(declare-fun lt!608237 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94372 (_ BitVec 32)) Bool)

(assert (=> b!1382346 (= lt!608237 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(assert (= (and start!118056 res!923979) b!1382343))

(assert (= (and b!1382343 res!923980) b!1382344))

(assert (= (and b!1382344 res!923978) b!1382345))

(assert (= (and b!1382345 res!923981) b!1382346))

(declare-fun m!1267047 () Bool)

(assert (=> b!1382344 m!1267047))

(assert (=> b!1382344 m!1267047))

(declare-fun m!1267049 () Bool)

(assert (=> b!1382344 m!1267049))

(declare-fun m!1267051 () Bool)

(assert (=> start!118056 m!1267051))

(declare-fun m!1267053 () Bool)

(assert (=> start!118056 m!1267053))

(declare-fun m!1267055 () Bool)

(assert (=> b!1382345 m!1267055))

(declare-fun m!1267057 () Bool)

(assert (=> b!1382346 m!1267057))

(push 1)

(assert (not b!1382344))

(assert (not start!118056))

(assert (not b!1382345))

(assert (not b!1382346))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

