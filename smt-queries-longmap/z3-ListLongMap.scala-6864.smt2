; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86614 () Bool)

(assert start!86614)

(declare-fun b!1001564 () Bool)

(declare-fun e!564565 () Bool)

(declare-fun e!564566 () Bool)

(assert (=> b!1001564 (= e!564565 e!564566)))

(declare-fun res!670482 () Bool)

(assert (=> b!1001564 (=> (not res!670482) (not e!564566))))

(declare-datatypes ((SeekEntryResult!9331 0))(
  ( (MissingZero!9331 (index!39695 (_ BitVec 32))) (Found!9331 (index!39696 (_ BitVec 32))) (Intermediate!9331 (undefined!10143 Bool) (index!39697 (_ BitVec 32)) (x!87277 (_ BitVec 32))) (Undefined!9331) (MissingVacant!9331 (index!39698 (_ BitVec 32))) )
))
(declare-fun lt!442705 () SeekEntryResult!9331)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1001564 (= res!670482 (or (= lt!442705 (MissingVacant!9331 i!1194)) (= lt!442705 (MissingZero!9331 i!1194))))))

(declare-datatypes ((array!63285 0))(
  ( (array!63286 (arr!30463 (Array (_ BitVec 32) (_ BitVec 64))) (size!30966 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63285)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63285 (_ BitVec 32)) SeekEntryResult!9331)

(assert (=> b!1001564 (= lt!442705 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun res!670483 () Bool)

(assert (=> start!86614 (=> (not res!670483) (not e!564565))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86614 (= res!670483 (validMask!0 mask!3464))))

(assert (=> start!86614 e!564565))

(declare-fun array_inv!23599 (array!63285) Bool)

(assert (=> start!86614 (array_inv!23599 a!3219)))

(assert (=> start!86614 true))

(declare-fun b!1001565 () Bool)

(declare-fun res!670481 () Bool)

(assert (=> b!1001565 (=> (not res!670481) (not e!564565))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1001565 (= res!670481 (validKeyInArray!0 (select (arr!30463 a!3219) j!170)))))

(declare-fun b!1001566 () Bool)

(declare-fun res!670479 () Bool)

(declare-fun e!564564 () Bool)

(assert (=> b!1001566 (=> (not res!670479) (not e!564564))))

(declare-fun lt!442706 () SeekEntryResult!9331)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63285 (_ BitVec 32)) SeekEntryResult!9331)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1001566 (= res!670479 (not (= lt!442706 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!30463 a!3219) i!1194 k0!2224) j!170) mask!3464) (select (store (arr!30463 a!3219) i!1194 k0!2224) j!170) (array!63286 (store (arr!30463 a!3219) i!1194 k0!2224) (size!30966 a!3219)) mask!3464))))))

(declare-fun b!1001567 () Bool)

(assert (=> b!1001567 (= e!564566 e!564564)))

(declare-fun res!670486 () Bool)

(assert (=> b!1001567 (=> (not res!670486) (not e!564564))))

(declare-fun lt!442704 () SeekEntryResult!9331)

(assert (=> b!1001567 (= res!670486 (= lt!442706 lt!442704))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1001567 (= lt!442704 (Intermediate!9331 false resIndex!38 resX!38))))

(assert (=> b!1001567 (= lt!442706 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30463 a!3219) j!170) mask!3464) (select (arr!30463 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1001568 () Bool)

(declare-fun res!670480 () Bool)

(assert (=> b!1001568 (=> (not res!670480) (not e!564566))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!1001568 (= res!670480 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30966 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30966 a!3219))))))

(declare-fun b!1001569 () Bool)

(declare-fun res!670478 () Bool)

(assert (=> b!1001569 (=> (not res!670478) (not e!564565))))

(assert (=> b!1001569 (= res!670478 (and (= (size!30966 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30966 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30966 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1001570 () Bool)

(declare-fun res!670476 () Bool)

(assert (=> b!1001570 (=> (not res!670476) (not e!564565))))

(assert (=> b!1001570 (= res!670476 (validKeyInArray!0 k0!2224))))

(declare-fun b!1001571 () Bool)

(declare-fun res!670484 () Bool)

(assert (=> b!1001571 (=> (not res!670484) (not e!564566))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63285 (_ BitVec 32)) Bool)

(assert (=> b!1001571 (= res!670484 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1001572 () Bool)

(declare-fun res!670485 () Bool)

(assert (=> b!1001572 (=> (not res!670485) (not e!564566))))

(declare-datatypes ((List!21110 0))(
  ( (Nil!21107) (Cons!21106 (h!22289 (_ BitVec 64)) (t!30103 List!21110)) )
))
(declare-fun arrayNoDuplicates!0 (array!63285 (_ BitVec 32) List!21110) Bool)

(assert (=> b!1001572 (= res!670485 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21107))))

(declare-fun b!1001573 () Bool)

(assert (=> b!1001573 (= e!564564 (and (bvsge mask!3464 #b00000000000000000000000000000000) (bvslt index!1507 (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsgt x!1245 #b01111111111111111111111111111110)))))

(declare-fun b!1001574 () Bool)

(declare-fun res!670477 () Bool)

(assert (=> b!1001574 (=> (not res!670477) (not e!564564))))

(assert (=> b!1001574 (= res!670477 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30463 a!3219) j!170) a!3219 mask!3464) lt!442704))))

(declare-fun b!1001575 () Bool)

(declare-fun res!670487 () Bool)

(assert (=> b!1001575 (=> (not res!670487) (not e!564565))))

(declare-fun arrayContainsKey!0 (array!63285 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1001575 (= res!670487 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(assert (= (and start!86614 res!670483) b!1001569))

(assert (= (and b!1001569 res!670478) b!1001565))

(assert (= (and b!1001565 res!670481) b!1001570))

(assert (= (and b!1001570 res!670476) b!1001575))

(assert (= (and b!1001575 res!670487) b!1001564))

(assert (= (and b!1001564 res!670482) b!1001571))

(assert (= (and b!1001571 res!670484) b!1001572))

(assert (= (and b!1001572 res!670485) b!1001568))

(assert (= (and b!1001568 res!670480) b!1001567))

(assert (= (and b!1001567 res!670486) b!1001574))

(assert (= (and b!1001574 res!670477) b!1001566))

(assert (= (and b!1001566 res!670479) b!1001573))

(declare-fun m!928121 () Bool)

(assert (=> b!1001574 m!928121))

(assert (=> b!1001574 m!928121))

(declare-fun m!928123 () Bool)

(assert (=> b!1001574 m!928123))

(declare-fun m!928125 () Bool)

(assert (=> b!1001571 m!928125))

(assert (=> b!1001567 m!928121))

(assert (=> b!1001567 m!928121))

(declare-fun m!928127 () Bool)

(assert (=> b!1001567 m!928127))

(assert (=> b!1001567 m!928127))

(assert (=> b!1001567 m!928121))

(declare-fun m!928129 () Bool)

(assert (=> b!1001567 m!928129))

(declare-fun m!928131 () Bool)

(assert (=> b!1001564 m!928131))

(declare-fun m!928133 () Bool)

(assert (=> start!86614 m!928133))

(declare-fun m!928135 () Bool)

(assert (=> start!86614 m!928135))

(declare-fun m!928137 () Bool)

(assert (=> b!1001575 m!928137))

(declare-fun m!928139 () Bool)

(assert (=> b!1001572 m!928139))

(assert (=> b!1001565 m!928121))

(assert (=> b!1001565 m!928121))

(declare-fun m!928141 () Bool)

(assert (=> b!1001565 m!928141))

(declare-fun m!928143 () Bool)

(assert (=> b!1001566 m!928143))

(declare-fun m!928145 () Bool)

(assert (=> b!1001566 m!928145))

(assert (=> b!1001566 m!928145))

(declare-fun m!928147 () Bool)

(assert (=> b!1001566 m!928147))

(assert (=> b!1001566 m!928147))

(assert (=> b!1001566 m!928145))

(declare-fun m!928149 () Bool)

(assert (=> b!1001566 m!928149))

(declare-fun m!928151 () Bool)

(assert (=> b!1001570 m!928151))

(check-sat (not b!1001566) (not b!1001571) (not start!86614) (not b!1001574) (not b!1001567) (not b!1001570) (not b!1001575) (not b!1001572) (not b!1001564) (not b!1001565))
(check-sat)
