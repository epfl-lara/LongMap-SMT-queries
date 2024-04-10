; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86936 () Bool)

(assert start!86936)

(declare-fun res!677329 () Bool)

(declare-fun e!567414 () Bool)

(assert (=> start!86936 (=> (not res!677329) (not e!567414))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86936 (= res!677329 (validMask!0 mask!3464))))

(assert (=> start!86936 e!567414))

(declare-datatypes ((array!63584 0))(
  ( (array!63585 (arr!30613 (Array (_ BitVec 32) (_ BitVec 64))) (size!31115 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63584)

(declare-fun array_inv!23737 (array!63584) Bool)

(assert (=> start!86936 (array_inv!23737 a!3219)))

(assert (=> start!86936 true))

(declare-fun b!1008431 () Bool)

(declare-fun res!677337 () Bool)

(assert (=> b!1008431 (=> (not res!677337) (not e!567414))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1008431 (= res!677337 (validKeyInArray!0 k!2224))))

(declare-fun b!1008432 () Bool)

(declare-fun res!677335 () Bool)

(declare-fun e!567410 () Bool)

(assert (=> b!1008432 (=> (not res!677335) (not e!567410))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1008432 (= res!677335 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31115 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31115 a!3219))))))

(declare-fun b!1008433 () Bool)

(declare-fun e!567412 () Bool)

(assert (=> b!1008433 (= e!567412 false)))

(declare-fun lt!445698 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1008433 (= lt!445698 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1008434 () Bool)

(declare-fun res!677326 () Bool)

(assert (=> b!1008434 (=> (not res!677326) (not e!567410))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63584 (_ BitVec 32)) Bool)

(assert (=> b!1008434 (= res!677326 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1008435 () Bool)

(declare-fun res!677333 () Bool)

(assert (=> b!1008435 (=> (not res!677333) (not e!567414))))

(declare-fun arrayContainsKey!0 (array!63584 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1008435 (= res!677333 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1008436 () Bool)

(declare-fun res!677327 () Bool)

(assert (=> b!1008436 (=> (not res!677327) (not e!567412))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1008436 (= res!677327 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1008437 () Bool)

(declare-fun e!567415 () Bool)

(declare-fun e!567413 () Bool)

(assert (=> b!1008437 (= e!567415 e!567413)))

(declare-fun res!677331 () Bool)

(assert (=> b!1008437 (=> (not res!677331) (not e!567413))))

(declare-datatypes ((SeekEntryResult!9545 0))(
  ( (MissingZero!9545 (index!40551 (_ BitVec 32))) (Found!9545 (index!40552 (_ BitVec 32))) (Intermediate!9545 (undefined!10357 Bool) (index!40553 (_ BitVec 32)) (x!87943 (_ BitVec 32))) (Undefined!9545) (MissingVacant!9545 (index!40554 (_ BitVec 32))) )
))
(declare-fun lt!445695 () SeekEntryResult!9545)

(declare-fun lt!445699 () SeekEntryResult!9545)

(assert (=> b!1008437 (= res!677331 (= lt!445695 lt!445699))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63584 (_ BitVec 32)) SeekEntryResult!9545)

(assert (=> b!1008437 (= lt!445695 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30613 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1008438 () Bool)

(declare-fun res!677330 () Bool)

(assert (=> b!1008438 (=> (not res!677330) (not e!567414))))

(assert (=> b!1008438 (= res!677330 (and (= (size!31115 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31115 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31115 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1008439 () Bool)

(declare-fun res!677328 () Bool)

(assert (=> b!1008439 (=> (not res!677328) (not e!567410))))

(declare-datatypes ((List!21289 0))(
  ( (Nil!21286) (Cons!21285 (h!22471 (_ BitVec 64)) (t!30290 List!21289)) )
))
(declare-fun arrayNoDuplicates!0 (array!63584 (_ BitVec 32) List!21289) Bool)

(assert (=> b!1008439 (= res!677328 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21286))))

(declare-fun b!1008440 () Bool)

(declare-fun res!677334 () Bool)

(assert (=> b!1008440 (=> (not res!677334) (not e!567412))))

(declare-fun lt!445694 () array!63584)

(declare-fun lt!445697 () (_ BitVec 64))

(assert (=> b!1008440 (= res!677334 (not (= lt!445695 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!445697 lt!445694 mask!3464))))))

(declare-fun b!1008441 () Bool)

(assert (=> b!1008441 (= e!567414 e!567410)))

(declare-fun res!677324 () Bool)

(assert (=> b!1008441 (=> (not res!677324) (not e!567410))))

(declare-fun lt!445700 () SeekEntryResult!9545)

(assert (=> b!1008441 (= res!677324 (or (= lt!445700 (MissingVacant!9545 i!1194)) (= lt!445700 (MissingZero!9545 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63584 (_ BitVec 32)) SeekEntryResult!9545)

(assert (=> b!1008441 (= lt!445700 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1008442 () Bool)

(declare-fun res!677336 () Bool)

(assert (=> b!1008442 (=> (not res!677336) (not e!567414))))

(assert (=> b!1008442 (= res!677336 (validKeyInArray!0 (select (arr!30613 a!3219) j!170)))))

(declare-fun b!1008443 () Bool)

(assert (=> b!1008443 (= e!567410 e!567415)))

(declare-fun res!677332 () Bool)

(assert (=> b!1008443 (=> (not res!677332) (not e!567415))))

(declare-fun lt!445696 () SeekEntryResult!9545)

(assert (=> b!1008443 (= res!677332 (= lt!445696 lt!445699))))

(assert (=> b!1008443 (= lt!445699 (Intermediate!9545 false resIndex!38 resX!38))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1008443 (= lt!445696 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30613 a!3219) j!170) mask!3464) (select (arr!30613 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1008444 () Bool)

(assert (=> b!1008444 (= e!567413 e!567412)))

(declare-fun res!677325 () Bool)

(assert (=> b!1008444 (=> (not res!677325) (not e!567412))))

(assert (=> b!1008444 (= res!677325 (not (= lt!445696 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!445697 mask!3464) lt!445697 lt!445694 mask!3464))))))

(assert (=> b!1008444 (= lt!445697 (select (store (arr!30613 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1008444 (= lt!445694 (array!63585 (store (arr!30613 a!3219) i!1194 k!2224) (size!31115 a!3219)))))

(assert (= (and start!86936 res!677329) b!1008438))

(assert (= (and b!1008438 res!677330) b!1008442))

(assert (= (and b!1008442 res!677336) b!1008431))

(assert (= (and b!1008431 res!677337) b!1008435))

(assert (= (and b!1008435 res!677333) b!1008441))

(assert (= (and b!1008441 res!677324) b!1008434))

(assert (= (and b!1008434 res!677326) b!1008439))

(assert (= (and b!1008439 res!677328) b!1008432))

(assert (= (and b!1008432 res!677335) b!1008443))

(assert (= (and b!1008443 res!677332) b!1008437))

(assert (= (and b!1008437 res!677331) b!1008444))

(assert (= (and b!1008444 res!677325) b!1008440))

(assert (= (and b!1008440 res!677334) b!1008436))

(assert (= (and b!1008436 res!677327) b!1008433))

(declare-fun m!933179 () Bool)

(assert (=> b!1008439 m!933179))

(declare-fun m!933181 () Bool)

(assert (=> b!1008440 m!933181))

(declare-fun m!933183 () Bool)

(assert (=> b!1008437 m!933183))

(assert (=> b!1008437 m!933183))

(declare-fun m!933185 () Bool)

(assert (=> b!1008437 m!933185))

(declare-fun m!933187 () Bool)

(assert (=> b!1008435 m!933187))

(declare-fun m!933189 () Bool)

(assert (=> start!86936 m!933189))

(declare-fun m!933191 () Bool)

(assert (=> start!86936 m!933191))

(declare-fun m!933193 () Bool)

(assert (=> b!1008441 m!933193))

(declare-fun m!933195 () Bool)

(assert (=> b!1008433 m!933195))

(declare-fun m!933197 () Bool)

(assert (=> b!1008431 m!933197))

(declare-fun m!933199 () Bool)

(assert (=> b!1008444 m!933199))

(assert (=> b!1008444 m!933199))

(declare-fun m!933201 () Bool)

(assert (=> b!1008444 m!933201))

(declare-fun m!933203 () Bool)

(assert (=> b!1008444 m!933203))

(declare-fun m!933205 () Bool)

(assert (=> b!1008444 m!933205))

(declare-fun m!933207 () Bool)

(assert (=> b!1008434 m!933207))

(assert (=> b!1008443 m!933183))

(assert (=> b!1008443 m!933183))

(declare-fun m!933209 () Bool)

(assert (=> b!1008443 m!933209))

(assert (=> b!1008443 m!933209))

(assert (=> b!1008443 m!933183))

(declare-fun m!933211 () Bool)

(assert (=> b!1008443 m!933211))

(assert (=> b!1008442 m!933183))

(assert (=> b!1008442 m!933183))

(declare-fun m!933213 () Bool)

(assert (=> b!1008442 m!933213))

(push 1)

