; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86804 () Bool)

(assert start!86804)

(declare-fun b!1006517 () Bool)

(declare-fun res!675611 () Bool)

(declare-fun e!566524 () Bool)

(assert (=> b!1006517 (=> (not res!675611) (not e!566524))))

(declare-datatypes ((array!63503 0))(
  ( (array!63504 (arr!30574 (Array (_ BitVec 32) (_ BitVec 64))) (size!31076 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63503)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9506 0))(
  ( (MissingZero!9506 (index!40395 (_ BitVec 32))) (Found!9506 (index!40396 (_ BitVec 32))) (Intermediate!9506 (undefined!10318 Bool) (index!40397 (_ BitVec 32)) (x!87794 (_ BitVec 32))) (Undefined!9506) (MissingVacant!9506 (index!40398 (_ BitVec 32))) )
))
(declare-fun lt!444808 () SeekEntryResult!9506)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63503 (_ BitVec 32)) SeekEntryResult!9506)

(assert (=> b!1006517 (= res!675611 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30574 a!3219) j!170) a!3219 mask!3464) lt!444808))))

(declare-fun b!1006518 () Bool)

(declare-fun res!675615 () Bool)

(declare-fun e!566525 () Bool)

(assert (=> b!1006518 (=> (not res!675615) (not e!566525))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63503 (_ BitVec 32)) Bool)

(assert (=> b!1006518 (= res!675615 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1006519 () Bool)

(declare-fun res!675613 () Bool)

(declare-fun e!566526 () Bool)

(assert (=> b!1006519 (=> (not res!675613) (not e!566526))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63503 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1006519 (= res!675613 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1006520 () Bool)

(declare-fun res!675605 () Bool)

(assert (=> b!1006520 (=> (not res!675605) (not e!566526))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1006520 (= res!675605 (validKeyInArray!0 (select (arr!30574 a!3219) j!170)))))

(declare-fun b!1006522 () Bool)

(assert (=> b!1006522 (= e!566525 e!566524)))

(declare-fun res!675609 () Bool)

(assert (=> b!1006522 (=> (not res!675609) (not e!566524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1006522 (= res!675609 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30574 a!3219) j!170) mask!3464) (select (arr!30574 a!3219) j!170) a!3219 mask!3464) lt!444808))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1006522 (= lt!444808 (Intermediate!9506 false resIndex!38 resX!38))))

(declare-fun b!1006521 () Bool)

(assert (=> b!1006521 (= e!566524 false)))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun lt!444809 () SeekEntryResult!9506)

(assert (=> b!1006521 (= lt!444809 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!30574 a!3219) i!1194 k!2224) j!170) mask!3464) (select (store (arr!30574 a!3219) i!1194 k!2224) j!170) (array!63504 (store (arr!30574 a!3219) i!1194 k!2224) (size!31076 a!3219)) mask!3464))))

(declare-fun res!675614 () Bool)

(assert (=> start!86804 (=> (not res!675614) (not e!566526))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86804 (= res!675614 (validMask!0 mask!3464))))

(assert (=> start!86804 e!566526))

(declare-fun array_inv!23698 (array!63503) Bool)

(assert (=> start!86804 (array_inv!23698 a!3219)))

(assert (=> start!86804 true))

(declare-fun b!1006523 () Bool)

(declare-fun res!675606 () Bool)

(assert (=> b!1006523 (=> (not res!675606) (not e!566525))))

(declare-datatypes ((List!21250 0))(
  ( (Nil!21247) (Cons!21246 (h!22429 (_ BitVec 64)) (t!30251 List!21250)) )
))
(declare-fun arrayNoDuplicates!0 (array!63503 (_ BitVec 32) List!21250) Bool)

(assert (=> b!1006523 (= res!675606 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21247))))

(declare-fun b!1006524 () Bool)

(assert (=> b!1006524 (= e!566526 e!566525)))

(declare-fun res!675608 () Bool)

(assert (=> b!1006524 (=> (not res!675608) (not e!566525))))

(declare-fun lt!444807 () SeekEntryResult!9506)

(assert (=> b!1006524 (= res!675608 (or (= lt!444807 (MissingVacant!9506 i!1194)) (= lt!444807 (MissingZero!9506 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63503 (_ BitVec 32)) SeekEntryResult!9506)

(assert (=> b!1006524 (= lt!444807 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1006525 () Bool)

(declare-fun res!675612 () Bool)

(assert (=> b!1006525 (=> (not res!675612) (not e!566526))))

(assert (=> b!1006525 (= res!675612 (validKeyInArray!0 k!2224))))

(declare-fun b!1006526 () Bool)

(declare-fun res!675607 () Bool)

(assert (=> b!1006526 (=> (not res!675607) (not e!566525))))

(assert (=> b!1006526 (= res!675607 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31076 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31076 a!3219))))))

(declare-fun b!1006527 () Bool)

(declare-fun res!675610 () Bool)

(assert (=> b!1006527 (=> (not res!675610) (not e!566526))))

(assert (=> b!1006527 (= res!675610 (and (= (size!31076 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31076 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31076 a!3219)) (not (= i!1194 j!170))))))

(assert (= (and start!86804 res!675614) b!1006527))

(assert (= (and b!1006527 res!675610) b!1006520))

(assert (= (and b!1006520 res!675605) b!1006525))

(assert (= (and b!1006525 res!675612) b!1006519))

(assert (= (and b!1006519 res!675613) b!1006524))

(assert (= (and b!1006524 res!675608) b!1006518))

(assert (= (and b!1006518 res!675615) b!1006523))

(assert (= (and b!1006523 res!675606) b!1006526))

(assert (= (and b!1006526 res!675607) b!1006522))

(assert (= (and b!1006522 res!675609) b!1006517))

(assert (= (and b!1006517 res!675611) b!1006521))

(declare-fun m!931613 () Bool)

(assert (=> b!1006518 m!931613))

(declare-fun m!931615 () Bool)

(assert (=> b!1006520 m!931615))

(assert (=> b!1006520 m!931615))

(declare-fun m!931617 () Bool)

(assert (=> b!1006520 m!931617))

(declare-fun m!931619 () Bool)

(assert (=> b!1006524 m!931619))

(declare-fun m!931621 () Bool)

(assert (=> start!86804 m!931621))

(declare-fun m!931623 () Bool)

(assert (=> start!86804 m!931623))

(declare-fun m!931625 () Bool)

(assert (=> b!1006523 m!931625))

(assert (=> b!1006522 m!931615))

(assert (=> b!1006522 m!931615))

(declare-fun m!931627 () Bool)

(assert (=> b!1006522 m!931627))

(assert (=> b!1006522 m!931627))

(assert (=> b!1006522 m!931615))

(declare-fun m!931629 () Bool)

(assert (=> b!1006522 m!931629))

(declare-fun m!931631 () Bool)

(assert (=> b!1006525 m!931631))

(assert (=> b!1006517 m!931615))

(assert (=> b!1006517 m!931615))

(declare-fun m!931633 () Bool)

(assert (=> b!1006517 m!931633))

(declare-fun m!931635 () Bool)

(assert (=> b!1006521 m!931635))

(declare-fun m!931637 () Bool)

(assert (=> b!1006521 m!931637))

(assert (=> b!1006521 m!931637))

(declare-fun m!931639 () Bool)

(assert (=> b!1006521 m!931639))

(assert (=> b!1006521 m!931639))

(assert (=> b!1006521 m!931637))

(declare-fun m!931641 () Bool)

(assert (=> b!1006521 m!931641))

(declare-fun m!931643 () Bool)

(assert (=> b!1006519 m!931643))

(push 1)

