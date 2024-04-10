; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86798 () Bool)

(assert start!86798)

(declare-fun b!1006418 () Bool)

(declare-fun res!675508 () Bool)

(declare-fun e!566489 () Bool)

(assert (=> b!1006418 (=> (not res!675508) (not e!566489))))

(declare-datatypes ((array!63497 0))(
  ( (array!63498 (arr!30571 (Array (_ BitVec 32) (_ BitVec 64))) (size!31073 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63497)

(declare-datatypes ((List!21247 0))(
  ( (Nil!21244) (Cons!21243 (h!22426 (_ BitVec 64)) (t!30248 List!21247)) )
))
(declare-fun arrayNoDuplicates!0 (array!63497 (_ BitVec 32) List!21247) Bool)

(assert (=> b!1006418 (= res!675508 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21244))))

(declare-fun res!675513 () Bool)

(declare-fun e!566488 () Bool)

(assert (=> start!86798 (=> (not res!675513) (not e!566488))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86798 (= res!675513 (validMask!0 mask!3464))))

(assert (=> start!86798 e!566488))

(declare-fun array_inv!23695 (array!63497) Bool)

(assert (=> start!86798 (array_inv!23695 a!3219)))

(assert (=> start!86798 true))

(declare-fun b!1006419 () Bool)

(declare-fun res!675514 () Bool)

(declare-fun e!566491 () Bool)

(assert (=> b!1006419 (=> (not res!675514) (not e!566491))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9503 0))(
  ( (MissingZero!9503 (index!40383 (_ BitVec 32))) (Found!9503 (index!40384 (_ BitVec 32))) (Intermediate!9503 (undefined!10315 Bool) (index!40385 (_ BitVec 32)) (x!87783 (_ BitVec 32))) (Undefined!9503) (MissingVacant!9503 (index!40386 (_ BitVec 32))) )
))
(declare-fun lt!444781 () SeekEntryResult!9503)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63497 (_ BitVec 32)) SeekEntryResult!9503)

(assert (=> b!1006419 (= res!675514 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30571 a!3219) j!170) a!3219 mask!3464) lt!444781))))

(declare-fun b!1006420 () Bool)

(declare-fun res!675511 () Bool)

(assert (=> b!1006420 (=> (not res!675511) (not e!566488))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1006420 (= res!675511 (validKeyInArray!0 (select (arr!30571 a!3219) j!170)))))

(declare-fun b!1006421 () Bool)

(assert (=> b!1006421 (= e!566489 e!566491)))

(declare-fun res!675506 () Bool)

(assert (=> b!1006421 (=> (not res!675506) (not e!566491))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1006421 (= res!675506 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30571 a!3219) j!170) mask!3464) (select (arr!30571 a!3219) j!170) a!3219 mask!3464) lt!444781))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1006421 (= lt!444781 (Intermediate!9503 false resIndex!38 resX!38))))

(declare-fun b!1006422 () Bool)

(declare-fun res!675509 () Bool)

(assert (=> b!1006422 (=> (not res!675509) (not e!566488))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1006422 (= res!675509 (and (= (size!31073 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31073 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31073 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1006423 () Bool)

(declare-fun res!675515 () Bool)

(assert (=> b!1006423 (=> (not res!675515) (not e!566488))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63497 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1006423 (= res!675515 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1006424 () Bool)

(declare-fun res!675510 () Bool)

(assert (=> b!1006424 (=> (not res!675510) (not e!566489))))

(assert (=> b!1006424 (= res!675510 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31073 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31073 a!3219))))))

(declare-fun b!1006425 () Bool)

(declare-fun res!675512 () Bool)

(assert (=> b!1006425 (=> (not res!675512) (not e!566489))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63497 (_ BitVec 32)) Bool)

(assert (=> b!1006425 (= res!675512 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1006426 () Bool)

(assert (=> b!1006426 (= e!566491 false)))

(declare-fun lt!444780 () SeekEntryResult!9503)

(assert (=> b!1006426 (= lt!444780 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!30571 a!3219) i!1194 k!2224) j!170) mask!3464) (select (store (arr!30571 a!3219) i!1194 k!2224) j!170) (array!63498 (store (arr!30571 a!3219) i!1194 k!2224) (size!31073 a!3219)) mask!3464))))

(declare-fun b!1006427 () Bool)

(assert (=> b!1006427 (= e!566488 e!566489)))

(declare-fun res!675516 () Bool)

(assert (=> b!1006427 (=> (not res!675516) (not e!566489))))

(declare-fun lt!444782 () SeekEntryResult!9503)

(assert (=> b!1006427 (= res!675516 (or (= lt!444782 (MissingVacant!9503 i!1194)) (= lt!444782 (MissingZero!9503 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63497 (_ BitVec 32)) SeekEntryResult!9503)

(assert (=> b!1006427 (= lt!444782 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1006428 () Bool)

(declare-fun res!675507 () Bool)

(assert (=> b!1006428 (=> (not res!675507) (not e!566488))))

(assert (=> b!1006428 (= res!675507 (validKeyInArray!0 k!2224))))

(assert (= (and start!86798 res!675513) b!1006422))

(assert (= (and b!1006422 res!675509) b!1006420))

(assert (= (and b!1006420 res!675511) b!1006428))

(assert (= (and b!1006428 res!675507) b!1006423))

(assert (= (and b!1006423 res!675515) b!1006427))

(assert (= (and b!1006427 res!675516) b!1006425))

(assert (= (and b!1006425 res!675512) b!1006418))

(assert (= (and b!1006418 res!675508) b!1006424))

(assert (= (and b!1006424 res!675510) b!1006421))

(assert (= (and b!1006421 res!675506) b!1006419))

(assert (= (and b!1006419 res!675514) b!1006426))

(declare-fun m!931517 () Bool)

(assert (=> b!1006427 m!931517))

(declare-fun m!931519 () Bool)

(assert (=> start!86798 m!931519))

(declare-fun m!931521 () Bool)

(assert (=> start!86798 m!931521))

(declare-fun m!931523 () Bool)

(assert (=> b!1006418 m!931523))

(declare-fun m!931525 () Bool)

(assert (=> b!1006421 m!931525))

(assert (=> b!1006421 m!931525))

(declare-fun m!931527 () Bool)

(assert (=> b!1006421 m!931527))

(assert (=> b!1006421 m!931527))

(assert (=> b!1006421 m!931525))

(declare-fun m!931529 () Bool)

(assert (=> b!1006421 m!931529))

(declare-fun m!931531 () Bool)

(assert (=> b!1006423 m!931531))

(declare-fun m!931533 () Bool)

(assert (=> b!1006426 m!931533))

(declare-fun m!931535 () Bool)

(assert (=> b!1006426 m!931535))

(assert (=> b!1006426 m!931535))

(declare-fun m!931537 () Bool)

(assert (=> b!1006426 m!931537))

(assert (=> b!1006426 m!931537))

(assert (=> b!1006426 m!931535))

(declare-fun m!931539 () Bool)

(assert (=> b!1006426 m!931539))

(assert (=> b!1006420 m!931525))

(assert (=> b!1006420 m!931525))

(declare-fun m!931541 () Bool)

(assert (=> b!1006420 m!931541))

(declare-fun m!931543 () Bool)

(assert (=> b!1006428 m!931543))

(assert (=> b!1006419 m!931525))

(assert (=> b!1006419 m!931525))

(declare-fun m!931545 () Bool)

(assert (=> b!1006419 m!931545))

(declare-fun m!931547 () Bool)

(assert (=> b!1006425 m!931547))

(push 1)

