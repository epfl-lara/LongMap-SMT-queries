; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86366 () Bool)

(assert start!86366)

(declare-fun b!999389 () Bool)

(declare-fun res!668867 () Bool)

(declare-fun e!563518 () Bool)

(assert (=> b!999389 (=> (not res!668867) (not e!563518))))

(declare-datatypes ((array!63167 0))(
  ( (array!63168 (arr!30409 (Array (_ BitVec 32) (_ BitVec 64))) (size!30911 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63167)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!999389 (= res!668867 (and (= (size!30911 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30911 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30911 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!999390 () Bool)

(declare-fun e!563519 () Bool)

(declare-fun e!563520 () Bool)

(assert (=> b!999390 (= e!563519 e!563520)))

(declare-fun res!668868 () Bool)

(assert (=> b!999390 (=> (not res!668868) (not e!563520))))

(declare-datatypes ((SeekEntryResult!9341 0))(
  ( (MissingZero!9341 (index!39735 (_ BitVec 32))) (Found!9341 (index!39736 (_ BitVec 32))) (Intermediate!9341 (undefined!10153 Bool) (index!39737 (_ BitVec 32)) (x!87177 (_ BitVec 32))) (Undefined!9341) (MissingVacant!9341 (index!39738 (_ BitVec 32))) )
))
(declare-fun lt!442016 () SeekEntryResult!9341)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63167 (_ BitVec 32)) SeekEntryResult!9341)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!999390 (= res!668868 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30409 a!3219) j!170) mask!3464) (select (arr!30409 a!3219) j!170) a!3219 mask!3464) lt!442016))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!999390 (= lt!442016 (Intermediate!9341 false resIndex!38 resX!38))))

(declare-fun b!999391 () Bool)

(declare-fun res!668876 () Bool)

(assert (=> b!999391 (=> (not res!668876) (not e!563518))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!999391 (= res!668876 (validKeyInArray!0 (select (arr!30409 a!3219) j!170)))))

(declare-fun b!999392 () Bool)

(declare-fun res!668875 () Bool)

(assert (=> b!999392 (=> (not res!668875) (not e!563519))))

(declare-datatypes ((List!21085 0))(
  ( (Nil!21082) (Cons!21081 (h!22258 (_ BitVec 64)) (t!30086 List!21085)) )
))
(declare-fun arrayNoDuplicates!0 (array!63167 (_ BitVec 32) List!21085) Bool)

(assert (=> b!999392 (= res!668875 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21082))))

(declare-fun res!668873 () Bool)

(assert (=> start!86366 (=> (not res!668873) (not e!563518))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86366 (= res!668873 (validMask!0 mask!3464))))

(assert (=> start!86366 e!563518))

(declare-fun array_inv!23533 (array!63167) Bool)

(assert (=> start!86366 (array_inv!23533 a!3219)))

(assert (=> start!86366 true))

(declare-fun b!999393 () Bool)

(declare-fun res!668871 () Bool)

(assert (=> b!999393 (=> (not res!668871) (not e!563520))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!999393 (= res!668871 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30409 a!3219) j!170) a!3219 mask!3464) lt!442016))))

(declare-fun b!999394 () Bool)

(declare-fun res!668869 () Bool)

(assert (=> b!999394 (=> (not res!668869) (not e!563519))))

(assert (=> b!999394 (= res!668869 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30911 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30911 a!3219))))))

(declare-fun b!999395 () Bool)

(assert (=> b!999395 (= e!563520 false)))

(declare-fun lt!442014 () (_ BitVec 32))

(declare-fun k!2224 () (_ BitVec 64))

(assert (=> b!999395 (= lt!442014 (toIndex!0 (select (store (arr!30409 a!3219) i!1194 k!2224) j!170) mask!3464))))

(declare-fun b!999396 () Bool)

(declare-fun res!668877 () Bool)

(assert (=> b!999396 (=> (not res!668877) (not e!563519))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63167 (_ BitVec 32)) Bool)

(assert (=> b!999396 (= res!668877 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!999397 () Bool)

(declare-fun res!668870 () Bool)

(assert (=> b!999397 (=> (not res!668870) (not e!563518))))

(declare-fun arrayContainsKey!0 (array!63167 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!999397 (= res!668870 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!999398 () Bool)

(declare-fun res!668874 () Bool)

(assert (=> b!999398 (=> (not res!668874) (not e!563518))))

(assert (=> b!999398 (= res!668874 (validKeyInArray!0 k!2224))))

(declare-fun b!999399 () Bool)

(assert (=> b!999399 (= e!563518 e!563519)))

(declare-fun res!668872 () Bool)

(assert (=> b!999399 (=> (not res!668872) (not e!563519))))

(declare-fun lt!442015 () SeekEntryResult!9341)

(assert (=> b!999399 (= res!668872 (or (= lt!442015 (MissingVacant!9341 i!1194)) (= lt!442015 (MissingZero!9341 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63167 (_ BitVec 32)) SeekEntryResult!9341)

(assert (=> b!999399 (= lt!442015 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(assert (= (and start!86366 res!668873) b!999389))

(assert (= (and b!999389 res!668867) b!999391))

(assert (= (and b!999391 res!668876) b!999398))

(assert (= (and b!999398 res!668874) b!999397))

(assert (= (and b!999397 res!668870) b!999399))

(assert (= (and b!999399 res!668872) b!999396))

(assert (= (and b!999396 res!668877) b!999392))

(assert (= (and b!999392 res!668875) b!999394))

(assert (= (and b!999394 res!668869) b!999390))

(assert (= (and b!999390 res!668868) b!999393))

(assert (= (and b!999393 res!668871) b!999395))

(declare-fun m!925637 () Bool)

(assert (=> b!999390 m!925637))

(assert (=> b!999390 m!925637))

(declare-fun m!925639 () Bool)

(assert (=> b!999390 m!925639))

(assert (=> b!999390 m!925639))

(assert (=> b!999390 m!925637))

(declare-fun m!925641 () Bool)

(assert (=> b!999390 m!925641))

(assert (=> b!999391 m!925637))

(assert (=> b!999391 m!925637))

(declare-fun m!925643 () Bool)

(assert (=> b!999391 m!925643))

(declare-fun m!925645 () Bool)

(assert (=> b!999395 m!925645))

(declare-fun m!925647 () Bool)

(assert (=> b!999395 m!925647))

(assert (=> b!999395 m!925647))

(declare-fun m!925649 () Bool)

(assert (=> b!999395 m!925649))

(declare-fun m!925651 () Bool)

(assert (=> b!999399 m!925651))

(declare-fun m!925653 () Bool)

(assert (=> b!999396 m!925653))

(assert (=> b!999393 m!925637))

(assert (=> b!999393 m!925637))

(declare-fun m!925655 () Bool)

(assert (=> b!999393 m!925655))

(declare-fun m!925657 () Bool)

(assert (=> b!999397 m!925657))

(declare-fun m!925659 () Bool)

(assert (=> b!999398 m!925659))

(declare-fun m!925661 () Bool)

(assert (=> start!86366 m!925661))

(declare-fun m!925663 () Bool)

(assert (=> start!86366 m!925663))

(declare-fun m!925665 () Bool)

(assert (=> b!999392 m!925665))

(push 1)

