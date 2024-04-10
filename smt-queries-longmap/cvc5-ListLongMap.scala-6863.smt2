; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86432 () Bool)

(assert start!86432)

(declare-fun b!1000525 () Bool)

(declare-fun e!563924 () Bool)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!1000525 (= e!563924 (and (bvsge mask!3464 #b00000000000000000000000000000000) (bvsge index!1507 (bvadd #b00000000000000000000000000000001 mask!3464))))))

(declare-fun b!1000526 () Bool)

(declare-fun res!670003 () Bool)

(assert (=> b!1000526 (=> (not res!670003) (not e!563924))))

(declare-datatypes ((array!63233 0))(
  ( (array!63234 (arr!30442 (Array (_ BitVec 32) (_ BitVec 64))) (size!30944 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63233)

(declare-fun j!170 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9374 0))(
  ( (MissingZero!9374 (index!39867 (_ BitVec 32))) (Found!9374 (index!39868 (_ BitVec 32))) (Intermediate!9374 (undefined!10186 Bool) (index!39869 (_ BitVec 32)) (x!87298 (_ BitVec 32))) (Undefined!9374) (MissingVacant!9374 (index!39870 (_ BitVec 32))) )
))
(declare-fun lt!442312 () SeekEntryResult!9374)

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63233 (_ BitVec 32)) SeekEntryResult!9374)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1000526 (= res!670003 (not (= lt!442312 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!30442 a!3219) i!1194 k!2224) j!170) mask!3464) (select (store (arr!30442 a!3219) i!1194 k!2224) j!170) (array!63234 (store (arr!30442 a!3219) i!1194 k!2224) (size!30944 a!3219)) mask!3464))))))

(declare-fun b!1000527 () Bool)

(declare-fun res!670014 () Bool)

(declare-fun e!563926 () Bool)

(assert (=> b!1000527 (=> (not res!670014) (not e!563926))))

(assert (=> b!1000527 (= res!670014 (and (= (size!30944 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30944 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30944 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1000528 () Bool)

(declare-fun e!563925 () Bool)

(assert (=> b!1000528 (= e!563926 e!563925)))

(declare-fun res!670012 () Bool)

(assert (=> b!1000528 (=> (not res!670012) (not e!563925))))

(declare-fun lt!442311 () SeekEntryResult!9374)

(assert (=> b!1000528 (= res!670012 (or (= lt!442311 (MissingVacant!9374 i!1194)) (= lt!442311 (MissingZero!9374 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63233 (_ BitVec 32)) SeekEntryResult!9374)

(assert (=> b!1000528 (= lt!442311 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1000529 () Bool)

(declare-fun res!670010 () Bool)

(assert (=> b!1000529 (=> (not res!670010) (not e!563925))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63233 (_ BitVec 32)) Bool)

(assert (=> b!1000529 (= res!670010 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1000530 () Bool)

(declare-fun res!670005 () Bool)

(assert (=> b!1000530 (=> (not res!670005) (not e!563925))))

(declare-datatypes ((List!21118 0))(
  ( (Nil!21115) (Cons!21114 (h!22291 (_ BitVec 64)) (t!30119 List!21118)) )
))
(declare-fun arrayNoDuplicates!0 (array!63233 (_ BitVec 32) List!21118) Bool)

(assert (=> b!1000530 (= res!670005 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21115))))

(declare-fun b!1000531 () Bool)

(assert (=> b!1000531 (= e!563925 e!563924)))

(declare-fun res!670007 () Bool)

(assert (=> b!1000531 (=> (not res!670007) (not e!563924))))

(declare-fun lt!442313 () SeekEntryResult!9374)

(assert (=> b!1000531 (= res!670007 (= lt!442312 lt!442313))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1000531 (= lt!442313 (Intermediate!9374 false resIndex!38 resX!38))))

(assert (=> b!1000531 (= lt!442312 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30442 a!3219) j!170) mask!3464) (select (arr!30442 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1000532 () Bool)

(declare-fun res!670009 () Bool)

(assert (=> b!1000532 (=> (not res!670009) (not e!563926))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1000532 (= res!670009 (validKeyInArray!0 k!2224))))

(declare-fun b!1000534 () Bool)

(declare-fun res!670013 () Bool)

(assert (=> b!1000534 (=> (not res!670013) (not e!563926))))

(assert (=> b!1000534 (= res!670013 (validKeyInArray!0 (select (arr!30442 a!3219) j!170)))))

(declare-fun b!1000535 () Bool)

(declare-fun res!670008 () Bool)

(assert (=> b!1000535 (=> (not res!670008) (not e!563926))))

(declare-fun arrayContainsKey!0 (array!63233 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1000535 (= res!670008 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1000536 () Bool)

(declare-fun res!670011 () Bool)

(assert (=> b!1000536 (=> (not res!670011) (not e!563925))))

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!1000536 (= res!670011 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30944 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30944 a!3219))))))

(declare-fun res!670004 () Bool)

(assert (=> start!86432 (=> (not res!670004) (not e!563926))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86432 (= res!670004 (validMask!0 mask!3464))))

(assert (=> start!86432 e!563926))

(declare-fun array_inv!23566 (array!63233) Bool)

(assert (=> start!86432 (array_inv!23566 a!3219)))

(assert (=> start!86432 true))

(declare-fun b!1000533 () Bool)

(declare-fun res!670006 () Bool)

(assert (=> b!1000533 (=> (not res!670006) (not e!563924))))

(assert (=> b!1000533 (= res!670006 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30442 a!3219) j!170) a!3219 mask!3464) lt!442313))))

(assert (= (and start!86432 res!670004) b!1000527))

(assert (= (and b!1000527 res!670014) b!1000534))

(assert (= (and b!1000534 res!670013) b!1000532))

(assert (= (and b!1000532 res!670009) b!1000535))

(assert (= (and b!1000535 res!670008) b!1000528))

(assert (= (and b!1000528 res!670012) b!1000529))

(assert (= (and b!1000529 res!670010) b!1000530))

(assert (= (and b!1000530 res!670005) b!1000536))

(assert (= (and b!1000536 res!670011) b!1000531))

(assert (= (and b!1000531 res!670007) b!1000533))

(assert (= (and b!1000533 res!670006) b!1000526))

(assert (= (and b!1000526 res!670003) b!1000525))

(declare-fun m!926687 () Bool)

(assert (=> start!86432 m!926687))

(declare-fun m!926689 () Bool)

(assert (=> start!86432 m!926689))

(declare-fun m!926691 () Bool)

(assert (=> b!1000535 m!926691))

(declare-fun m!926693 () Bool)

(assert (=> b!1000531 m!926693))

(assert (=> b!1000531 m!926693))

(declare-fun m!926695 () Bool)

(assert (=> b!1000531 m!926695))

(assert (=> b!1000531 m!926695))

(assert (=> b!1000531 m!926693))

(declare-fun m!926697 () Bool)

(assert (=> b!1000531 m!926697))

(declare-fun m!926699 () Bool)

(assert (=> b!1000526 m!926699))

(declare-fun m!926701 () Bool)

(assert (=> b!1000526 m!926701))

(assert (=> b!1000526 m!926701))

(declare-fun m!926703 () Bool)

(assert (=> b!1000526 m!926703))

(assert (=> b!1000526 m!926703))

(assert (=> b!1000526 m!926701))

(declare-fun m!926705 () Bool)

(assert (=> b!1000526 m!926705))

(declare-fun m!926707 () Bool)

(assert (=> b!1000532 m!926707))

(assert (=> b!1000533 m!926693))

(assert (=> b!1000533 m!926693))

(declare-fun m!926709 () Bool)

(assert (=> b!1000533 m!926709))

(declare-fun m!926711 () Bool)

(assert (=> b!1000530 m!926711))

(assert (=> b!1000534 m!926693))

(assert (=> b!1000534 m!926693))

(declare-fun m!926713 () Bool)

(assert (=> b!1000534 m!926713))

(declare-fun m!926715 () Bool)

(assert (=> b!1000529 m!926715))

(declare-fun m!926717 () Bool)

(assert (=> b!1000528 m!926717))

(push 1)

(assert (not b!1000528))

(assert (not b!1000534))

(assert (not b!1000533))

(assert (not b!1000526))

(assert (not b!1000530))

(assert (not start!86432))

(assert (not b!1000529))

(assert (not b!1000532))

(assert (not b!1000535))

(assert (not b!1000531))

(check-sat)

(pop 1)

(push 1)

(check-sat)

