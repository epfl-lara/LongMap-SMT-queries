; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86802 () Bool)

(assert start!86802)

(declare-fun b!1006484 () Bool)

(declare-fun e!566512 () Bool)

(declare-fun e!566515 () Bool)

(assert (=> b!1006484 (= e!566512 e!566515)))

(declare-fun res!675574 () Bool)

(assert (=> b!1006484 (=> (not res!675574) (not e!566515))))

(declare-datatypes ((SeekEntryResult!9505 0))(
  ( (MissingZero!9505 (index!40391 (_ BitVec 32))) (Found!9505 (index!40392 (_ BitVec 32))) (Intermediate!9505 (undefined!10317 Bool) (index!40393 (_ BitVec 32)) (x!87785 (_ BitVec 32))) (Undefined!9505) (MissingVacant!9505 (index!40394 (_ BitVec 32))) )
))
(declare-fun lt!444799 () SeekEntryResult!9505)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1006484 (= res!675574 (or (= lt!444799 (MissingVacant!9505 i!1194)) (= lt!444799 (MissingZero!9505 i!1194))))))

(declare-datatypes ((array!63501 0))(
  ( (array!63502 (arr!30573 (Array (_ BitVec 32) (_ BitVec 64))) (size!31075 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63501)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63501 (_ BitVec 32)) SeekEntryResult!9505)

(assert (=> b!1006484 (= lt!444799 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1006485 () Bool)

(declare-fun res!675581 () Bool)

(assert (=> b!1006485 (=> (not res!675581) (not e!566512))))

(declare-fun arrayContainsKey!0 (array!63501 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1006485 (= res!675581 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1006487 () Bool)

(declare-fun res!675582 () Bool)

(assert (=> b!1006487 (=> (not res!675582) (not e!566512))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1006487 (= res!675582 (validKeyInArray!0 k!2224))))

(declare-fun b!1006488 () Bool)

(declare-fun e!566513 () Bool)

(assert (=> b!1006488 (= e!566515 e!566513)))

(declare-fun res!675573 () Bool)

(assert (=> b!1006488 (=> (not res!675573) (not e!566513))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun lt!444798 () SeekEntryResult!9505)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63501 (_ BitVec 32)) SeekEntryResult!9505)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1006488 (= res!675573 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30573 a!3219) j!170) mask!3464) (select (arr!30573 a!3219) j!170) a!3219 mask!3464) lt!444798))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1006488 (= lt!444798 (Intermediate!9505 false resIndex!38 resX!38))))

(declare-fun b!1006489 () Bool)

(declare-fun res!675578 () Bool)

(assert (=> b!1006489 (=> (not res!675578) (not e!566513))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!1006489 (= res!675578 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30573 a!3219) j!170) a!3219 mask!3464) lt!444798))))

(declare-fun b!1006490 () Bool)

(assert (=> b!1006490 (= e!566513 false)))

(declare-fun lt!444800 () SeekEntryResult!9505)

(assert (=> b!1006490 (= lt!444800 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!30573 a!3219) i!1194 k!2224) j!170) mask!3464) (select (store (arr!30573 a!3219) i!1194 k!2224) j!170) (array!63502 (store (arr!30573 a!3219) i!1194 k!2224) (size!31075 a!3219)) mask!3464))))

(declare-fun res!675575 () Bool)

(assert (=> start!86802 (=> (not res!675575) (not e!566512))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86802 (= res!675575 (validMask!0 mask!3464))))

(assert (=> start!86802 e!566512))

(declare-fun array_inv!23697 (array!63501) Bool)

(assert (=> start!86802 (array_inv!23697 a!3219)))

(assert (=> start!86802 true))

(declare-fun b!1006486 () Bool)

(declare-fun res!675580 () Bool)

(assert (=> b!1006486 (=> (not res!675580) (not e!566515))))

(declare-datatypes ((List!21249 0))(
  ( (Nil!21246) (Cons!21245 (h!22428 (_ BitVec 64)) (t!30250 List!21249)) )
))
(declare-fun arrayNoDuplicates!0 (array!63501 (_ BitVec 32) List!21249) Bool)

(assert (=> b!1006486 (= res!675580 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21246))))

(declare-fun b!1006491 () Bool)

(declare-fun res!675572 () Bool)

(assert (=> b!1006491 (=> (not res!675572) (not e!566515))))

(assert (=> b!1006491 (= res!675572 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31075 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31075 a!3219))))))

(declare-fun b!1006492 () Bool)

(declare-fun res!675579 () Bool)

(assert (=> b!1006492 (=> (not res!675579) (not e!566512))))

(assert (=> b!1006492 (= res!675579 (and (= (size!31075 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31075 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31075 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1006493 () Bool)

(declare-fun res!675577 () Bool)

(assert (=> b!1006493 (=> (not res!675577) (not e!566515))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63501 (_ BitVec 32)) Bool)

(assert (=> b!1006493 (= res!675577 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1006494 () Bool)

(declare-fun res!675576 () Bool)

(assert (=> b!1006494 (=> (not res!675576) (not e!566512))))

(assert (=> b!1006494 (= res!675576 (validKeyInArray!0 (select (arr!30573 a!3219) j!170)))))

(assert (= (and start!86802 res!675575) b!1006492))

(assert (= (and b!1006492 res!675579) b!1006494))

(assert (= (and b!1006494 res!675576) b!1006487))

(assert (= (and b!1006487 res!675582) b!1006485))

(assert (= (and b!1006485 res!675581) b!1006484))

(assert (= (and b!1006484 res!675574) b!1006493))

(assert (= (and b!1006493 res!675577) b!1006486))

(assert (= (and b!1006486 res!675580) b!1006491))

(assert (= (and b!1006491 res!675572) b!1006488))

(assert (= (and b!1006488 res!675573) b!1006489))

(assert (= (and b!1006489 res!675578) b!1006490))

(declare-fun m!931581 () Bool)

(assert (=> b!1006486 m!931581))

(declare-fun m!931583 () Bool)

(assert (=> b!1006494 m!931583))

(assert (=> b!1006494 m!931583))

(declare-fun m!931585 () Bool)

(assert (=> b!1006494 m!931585))

(declare-fun m!931587 () Bool)

(assert (=> b!1006490 m!931587))

(declare-fun m!931589 () Bool)

(assert (=> b!1006490 m!931589))

(assert (=> b!1006490 m!931589))

(declare-fun m!931591 () Bool)

(assert (=> b!1006490 m!931591))

(assert (=> b!1006490 m!931591))

(assert (=> b!1006490 m!931589))

(declare-fun m!931593 () Bool)

(assert (=> b!1006490 m!931593))

(declare-fun m!931595 () Bool)

(assert (=> start!86802 m!931595))

(declare-fun m!931597 () Bool)

(assert (=> start!86802 m!931597))

(assert (=> b!1006489 m!931583))

(assert (=> b!1006489 m!931583))

(declare-fun m!931599 () Bool)

(assert (=> b!1006489 m!931599))

(assert (=> b!1006488 m!931583))

(assert (=> b!1006488 m!931583))

(declare-fun m!931601 () Bool)

(assert (=> b!1006488 m!931601))

(assert (=> b!1006488 m!931601))

(assert (=> b!1006488 m!931583))

(declare-fun m!931603 () Bool)

(assert (=> b!1006488 m!931603))

(declare-fun m!931605 () Bool)

(assert (=> b!1006485 m!931605))

(declare-fun m!931607 () Bool)

(assert (=> b!1006493 m!931607))

(declare-fun m!931609 () Bool)

(assert (=> b!1006484 m!931609))

(declare-fun m!931611 () Bool)

(assert (=> b!1006487 m!931611))

(push 1)

(assert (not b!1006488))

