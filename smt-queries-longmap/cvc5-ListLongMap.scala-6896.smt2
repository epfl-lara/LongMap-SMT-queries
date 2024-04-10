; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86738 () Bool)

(assert start!86738)

(declare-fun b!1005487 () Bool)

(declare-fun res!674576 () Bool)

(declare-fun e!566181 () Bool)

(assert (=> b!1005487 (=> (not res!674576) (not e!566181))))

(declare-datatypes ((array!63437 0))(
  ( (array!63438 (arr!30541 (Array (_ BitVec 32) (_ BitVec 64))) (size!31043 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63437)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1005487 (= res!674576 (validKeyInArray!0 (select (arr!30541 a!3219) j!170)))))

(declare-fun b!1005488 () Bool)

(declare-fun e!566180 () Bool)

(assert (=> b!1005488 (= e!566180 false)))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9473 0))(
  ( (MissingZero!9473 (index!40263 (_ BitVec 32))) (Found!9473 (index!40264 (_ BitVec 32))) (Intermediate!9473 (undefined!10285 Bool) (index!40265 (_ BitVec 32)) (x!87673 (_ BitVec 32))) (Undefined!9473) (MissingVacant!9473 (index!40266 (_ BitVec 32))) )
))
(declare-fun lt!444563 () SeekEntryResult!9473)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63437 (_ BitVec 32)) SeekEntryResult!9473)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1005488 (= lt!444563 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30541 a!3219) j!170) mask!3464) (select (arr!30541 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1005489 () Bool)

(declare-fun res!674578 () Bool)

(assert (=> b!1005489 (=> (not res!674578) (not e!566181))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63437 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1005489 (= res!674578 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1005490 () Bool)

(declare-fun res!674575 () Bool)

(assert (=> b!1005490 (=> (not res!674575) (not e!566180))))

(declare-datatypes ((List!21217 0))(
  ( (Nil!21214) (Cons!21213 (h!22396 (_ BitVec 64)) (t!30218 List!21217)) )
))
(declare-fun arrayNoDuplicates!0 (array!63437 (_ BitVec 32) List!21217) Bool)

(assert (=> b!1005490 (= res!674575 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21214))))

(declare-fun res!674582 () Bool)

(assert (=> start!86738 (=> (not res!674582) (not e!566181))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86738 (= res!674582 (validMask!0 mask!3464))))

(assert (=> start!86738 e!566181))

(declare-fun array_inv!23665 (array!63437) Bool)

(assert (=> start!86738 (array_inv!23665 a!3219)))

(assert (=> start!86738 true))

(declare-fun b!1005491 () Bool)

(assert (=> b!1005491 (= e!566181 e!566180)))

(declare-fun res!674583 () Bool)

(assert (=> b!1005491 (=> (not res!674583) (not e!566180))))

(declare-fun lt!444562 () SeekEntryResult!9473)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1005491 (= res!674583 (or (= lt!444562 (MissingVacant!9473 i!1194)) (= lt!444562 (MissingZero!9473 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63437 (_ BitVec 32)) SeekEntryResult!9473)

(assert (=> b!1005491 (= lt!444562 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1005492 () Bool)

(declare-fun res!674577 () Bool)

(assert (=> b!1005492 (=> (not res!674577) (not e!566181))))

(assert (=> b!1005492 (= res!674577 (validKeyInArray!0 k!2224))))

(declare-fun b!1005493 () Bool)

(declare-fun res!674580 () Bool)

(assert (=> b!1005493 (=> (not res!674580) (not e!566181))))

(assert (=> b!1005493 (= res!674580 (and (= (size!31043 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31043 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31043 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1005494 () Bool)

(declare-fun res!674579 () Bool)

(assert (=> b!1005494 (=> (not res!674579) (not e!566180))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1005494 (= res!674579 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31043 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31043 a!3219))))))

(declare-fun b!1005495 () Bool)

(declare-fun res!674581 () Bool)

(assert (=> b!1005495 (=> (not res!674581) (not e!566180))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63437 (_ BitVec 32)) Bool)

(assert (=> b!1005495 (= res!674581 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(assert (= (and start!86738 res!674582) b!1005493))

(assert (= (and b!1005493 res!674580) b!1005487))

(assert (= (and b!1005487 res!674576) b!1005492))

(assert (= (and b!1005492 res!674577) b!1005489))

(assert (= (and b!1005489 res!674578) b!1005491))

(assert (= (and b!1005491 res!674583) b!1005495))

(assert (= (and b!1005495 res!674581) b!1005490))

(assert (= (and b!1005490 res!674575) b!1005494))

(assert (= (and b!1005494 res!674579) b!1005488))

(declare-fun m!930719 () Bool)

(assert (=> b!1005490 m!930719))

(declare-fun m!930721 () Bool)

(assert (=> b!1005487 m!930721))

(assert (=> b!1005487 m!930721))

(declare-fun m!930723 () Bool)

(assert (=> b!1005487 m!930723))

(declare-fun m!930725 () Bool)

(assert (=> b!1005492 m!930725))

(declare-fun m!930727 () Bool)

(assert (=> b!1005495 m!930727))

(declare-fun m!930729 () Bool)

(assert (=> b!1005491 m!930729))

(assert (=> b!1005488 m!930721))

(assert (=> b!1005488 m!930721))

(declare-fun m!930731 () Bool)

(assert (=> b!1005488 m!930731))

(assert (=> b!1005488 m!930731))

(assert (=> b!1005488 m!930721))

(declare-fun m!930733 () Bool)

(assert (=> b!1005488 m!930733))

(declare-fun m!930735 () Bool)

(assert (=> start!86738 m!930735))

(declare-fun m!930737 () Bool)

(assert (=> start!86738 m!930737))

(declare-fun m!930739 () Bool)

(assert (=> b!1005489 m!930739))

(push 1)

