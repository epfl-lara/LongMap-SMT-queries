; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86992 () Bool)

(assert start!86992)

(declare-fun b!1007086 () Bool)

(declare-fun res!675414 () Bool)

(declare-fun e!567093 () Bool)

(assert (=> b!1007086 (=> (not res!675414) (not e!567093))))

(declare-datatypes ((array!63510 0))(
  ( (array!63511 (arr!30571 (Array (_ BitVec 32) (_ BitVec 64))) (size!31074 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63510)

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63510 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1007086 (= res!675414 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1007087 () Bool)

(declare-fun res!675415 () Bool)

(declare-fun e!567092 () Bool)

(assert (=> b!1007087 (=> (not res!675415) (not e!567092))))

(declare-datatypes ((List!21218 0))(
  ( (Nil!21215) (Cons!21214 (h!22406 (_ BitVec 64)) (t!30211 List!21218)) )
))
(declare-fun arrayNoDuplicates!0 (array!63510 (_ BitVec 32) List!21218) Bool)

(assert (=> b!1007087 (= res!675415 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21215))))

(declare-fun b!1007088 () Bool)

(assert (=> b!1007088 (= e!567093 e!567092)))

(declare-fun res!675419 () Bool)

(assert (=> b!1007088 (=> (not res!675419) (not e!567092))))

(declare-datatypes ((SeekEntryResult!9439 0))(
  ( (MissingZero!9439 (index!40127 (_ BitVec 32))) (Found!9439 (index!40128 (_ BitVec 32))) (Intermediate!9439 (undefined!10251 Bool) (index!40129 (_ BitVec 32)) (x!87691 (_ BitVec 32))) (Undefined!9439) (MissingVacant!9439 (index!40130 (_ BitVec 32))) )
))
(declare-fun lt!445114 () SeekEntryResult!9439)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1007088 (= res!675419 (or (= lt!445114 (MissingVacant!9439 i!1194)) (= lt!445114 (MissingZero!9439 i!1194))))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63510 (_ BitVec 32)) SeekEntryResult!9439)

(assert (=> b!1007088 (= lt!445114 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1007089 () Bool)

(declare-fun res!675420 () Bool)

(assert (=> b!1007089 (=> (not res!675420) (not e!567092))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63510 (_ BitVec 32)) Bool)

(assert (=> b!1007089 (= res!675420 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1007090 () Bool)

(declare-fun res!675416 () Bool)

(assert (=> b!1007090 (=> (not res!675416) (not e!567093))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1007090 (= res!675416 (validKeyInArray!0 (select (arr!30571 a!3219) j!170)))))

(declare-fun b!1007091 () Bool)

(declare-fun res!675421 () Bool)

(assert (=> b!1007091 (=> (not res!675421) (not e!567092))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1007091 (= res!675421 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31074 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31074 a!3219))))))

(declare-fun b!1007092 () Bool)

(assert (=> b!1007092 (= e!567092 false)))

(declare-fun lt!445115 () SeekEntryResult!9439)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63510 (_ BitVec 32)) SeekEntryResult!9439)

(assert (=> b!1007092 (= lt!445115 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30571 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1007093 () Bool)

(declare-fun res!675417 () Bool)

(assert (=> b!1007093 (=> (not res!675417) (not e!567093))))

(assert (=> b!1007093 (= res!675417 (and (= (size!31074 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31074 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31074 a!3219)) (not (= i!1194 j!170))))))

(declare-fun res!675413 () Bool)

(assert (=> start!86992 (=> (not res!675413) (not e!567093))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86992 (= res!675413 (validMask!0 mask!3464))))

(assert (=> start!86992 e!567093))

(declare-fun array_inv!23707 (array!63510) Bool)

(assert (=> start!86992 (array_inv!23707 a!3219)))

(assert (=> start!86992 true))

(declare-fun b!1007094 () Bool)

(declare-fun res!675422 () Bool)

(assert (=> b!1007094 (=> (not res!675422) (not e!567092))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1007094 (= res!675422 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30571 a!3219) j!170) mask!3464) (select (arr!30571 a!3219) j!170) a!3219 mask!3464) (Intermediate!9439 false resIndex!38 resX!38)))))

(declare-fun b!1007095 () Bool)

(declare-fun res!675418 () Bool)

(assert (=> b!1007095 (=> (not res!675418) (not e!567093))))

(assert (=> b!1007095 (= res!675418 (validKeyInArray!0 k0!2224))))

(assert (= (and start!86992 res!675413) b!1007093))

(assert (= (and b!1007093 res!675417) b!1007090))

(assert (= (and b!1007090 res!675416) b!1007095))

(assert (= (and b!1007095 res!675418) b!1007086))

(assert (= (and b!1007086 res!675414) b!1007088))

(assert (= (and b!1007088 res!675419) b!1007089))

(assert (= (and b!1007089 res!675420) b!1007087))

(assert (= (and b!1007087 res!675415) b!1007091))

(assert (= (and b!1007091 res!675421) b!1007094))

(assert (= (and b!1007094 res!675422) b!1007092))

(declare-fun m!932525 () Bool)

(assert (=> b!1007088 m!932525))

(declare-fun m!932527 () Bool)

(assert (=> b!1007094 m!932527))

(assert (=> b!1007094 m!932527))

(declare-fun m!932529 () Bool)

(assert (=> b!1007094 m!932529))

(assert (=> b!1007094 m!932529))

(assert (=> b!1007094 m!932527))

(declare-fun m!932531 () Bool)

(assert (=> b!1007094 m!932531))

(declare-fun m!932533 () Bool)

(assert (=> start!86992 m!932533))

(declare-fun m!932535 () Bool)

(assert (=> start!86992 m!932535))

(declare-fun m!932537 () Bool)

(assert (=> b!1007086 m!932537))

(assert (=> b!1007090 m!932527))

(assert (=> b!1007090 m!932527))

(declare-fun m!932539 () Bool)

(assert (=> b!1007090 m!932539))

(assert (=> b!1007092 m!932527))

(assert (=> b!1007092 m!932527))

(declare-fun m!932541 () Bool)

(assert (=> b!1007092 m!932541))

(declare-fun m!932543 () Bool)

(assert (=> b!1007087 m!932543))

(declare-fun m!932545 () Bool)

(assert (=> b!1007089 m!932545))

(declare-fun m!932547 () Bool)

(assert (=> b!1007095 m!932547))

(check-sat (not b!1007089) (not b!1007086) (not b!1007095) (not b!1007092) (not b!1007090) (not start!86992) (not b!1007087) (not b!1007094) (not b!1007088))
(check-sat)
