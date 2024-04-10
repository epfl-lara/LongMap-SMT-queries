; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86948 () Bool)

(assert start!86948)

(declare-fun b!1008683 () Bool)

(declare-fun e!567519 () Bool)

(declare-fun e!567520 () Bool)

(assert (=> b!1008683 (= e!567519 e!567520)))

(declare-fun res!677578 () Bool)

(assert (=> b!1008683 (=> (not res!677578) (not e!567520))))

(declare-datatypes ((SeekEntryResult!9551 0))(
  ( (MissingZero!9551 (index!40575 (_ BitVec 32))) (Found!9551 (index!40576 (_ BitVec 32))) (Intermediate!9551 (undefined!10363 Bool) (index!40577 (_ BitVec 32)) (x!87965 (_ BitVec 32))) (Undefined!9551) (MissingVacant!9551 (index!40578 (_ BitVec 32))) )
))
(declare-fun lt!445821 () SeekEntryResult!9551)

(declare-fun lt!445826 () SeekEntryResult!9551)

(assert (=> b!1008683 (= res!677578 (= lt!445821 lt!445826))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1008683 (= lt!445826 (Intermediate!9551 false resIndex!38 resX!38))))

(declare-datatypes ((array!63596 0))(
  ( (array!63597 (arr!30619 (Array (_ BitVec 32) (_ BitVec 64))) (size!31121 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63596)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63596 (_ BitVec 32)) SeekEntryResult!9551)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1008683 (= lt!445821 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30619 a!3219) j!170) mask!3464) (select (arr!30619 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1008684 () Bool)

(declare-fun res!677580 () Bool)

(declare-fun e!567523 () Bool)

(assert (=> b!1008684 (=> (not res!677580) (not e!567523))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1008684 (= res!677580 (validKeyInArray!0 (select (arr!30619 a!3219) j!170)))))

(declare-fun res!677581 () Bool)

(assert (=> start!86948 (=> (not res!677581) (not e!567523))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86948 (= res!677581 (validMask!0 mask!3464))))

(assert (=> start!86948 e!567523))

(declare-fun array_inv!23743 (array!63596) Bool)

(assert (=> start!86948 (array_inv!23743 a!3219)))

(assert (=> start!86948 true))

(declare-fun b!1008685 () Bool)

(assert (=> b!1008685 (= e!567523 e!567519)))

(declare-fun res!677579 () Bool)

(assert (=> b!1008685 (=> (not res!677579) (not e!567519))))

(declare-fun lt!445824 () SeekEntryResult!9551)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1008685 (= res!677579 (or (= lt!445824 (MissingVacant!9551 i!1194)) (= lt!445824 (MissingZero!9551 i!1194))))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63596 (_ BitVec 32)) SeekEntryResult!9551)

(assert (=> b!1008685 (= lt!445824 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1008686 () Bool)

(declare-fun res!677587 () Bool)

(assert (=> b!1008686 (=> (not res!677587) (not e!567523))))

(declare-fun arrayContainsKey!0 (array!63596 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1008686 (= res!677587 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1008687 () Bool)

(declare-fun res!677577 () Bool)

(assert (=> b!1008687 (=> (not res!677577) (not e!567519))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!1008687 (= res!677577 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31121 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31121 a!3219))))))

(declare-fun b!1008688 () Bool)

(declare-fun res!677576 () Bool)

(declare-fun e!567522 () Bool)

(assert (=> b!1008688 (=> (not res!677576) (not e!567522))))

(declare-fun lt!445822 () array!63596)

(declare-fun lt!445825 () SeekEntryResult!9551)

(declare-fun lt!445820 () (_ BitVec 64))

(assert (=> b!1008688 (= res!677576 (not (= lt!445825 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!445820 lt!445822 mask!3464))))))

(declare-fun b!1008689 () Bool)

(assert (=> b!1008689 (= e!567522 false)))

(declare-fun lt!445823 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1008689 (= lt!445823 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1008690 () Bool)

(declare-fun e!567518 () Bool)

(assert (=> b!1008690 (= e!567520 e!567518)))

(declare-fun res!677589 () Bool)

(assert (=> b!1008690 (=> (not res!677589) (not e!567518))))

(assert (=> b!1008690 (= res!677589 (= lt!445825 lt!445826))))

(assert (=> b!1008690 (= lt!445825 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30619 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1008691 () Bool)

(declare-fun res!677585 () Bool)

(assert (=> b!1008691 (=> (not res!677585) (not e!567519))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63596 (_ BitVec 32)) Bool)

(assert (=> b!1008691 (= res!677585 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1008692 () Bool)

(declare-fun res!677583 () Bool)

(assert (=> b!1008692 (=> (not res!677583) (not e!567523))))

(assert (=> b!1008692 (= res!677583 (validKeyInArray!0 k!2224))))

(declare-fun b!1008693 () Bool)

(assert (=> b!1008693 (= e!567518 e!567522)))

(declare-fun res!677584 () Bool)

(assert (=> b!1008693 (=> (not res!677584) (not e!567522))))

(assert (=> b!1008693 (= res!677584 (not (= lt!445821 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!445820 mask!3464) lt!445820 lt!445822 mask!3464))))))

(assert (=> b!1008693 (= lt!445820 (select (store (arr!30619 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1008693 (= lt!445822 (array!63597 (store (arr!30619 a!3219) i!1194 k!2224) (size!31121 a!3219)))))

(declare-fun b!1008694 () Bool)

(declare-fun res!677582 () Bool)

(assert (=> b!1008694 (=> (not res!677582) (not e!567523))))

(assert (=> b!1008694 (= res!677582 (and (= (size!31121 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31121 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31121 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1008695 () Bool)

(declare-fun res!677586 () Bool)

(assert (=> b!1008695 (=> (not res!677586) (not e!567519))))

(declare-datatypes ((List!21295 0))(
  ( (Nil!21292) (Cons!21291 (h!22477 (_ BitVec 64)) (t!30296 List!21295)) )
))
(declare-fun arrayNoDuplicates!0 (array!63596 (_ BitVec 32) List!21295) Bool)

(assert (=> b!1008695 (= res!677586 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21292))))

(declare-fun b!1008696 () Bool)

(declare-fun res!677588 () Bool)

(assert (=> b!1008696 (=> (not res!677588) (not e!567522))))

(assert (=> b!1008696 (= res!677588 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(assert (= (and start!86948 res!677581) b!1008694))

(assert (= (and b!1008694 res!677582) b!1008684))

(assert (= (and b!1008684 res!677580) b!1008692))

(assert (= (and b!1008692 res!677583) b!1008686))

(assert (= (and b!1008686 res!677587) b!1008685))

(assert (= (and b!1008685 res!677579) b!1008691))

(assert (= (and b!1008691 res!677585) b!1008695))

(assert (= (and b!1008695 res!677586) b!1008687))

(assert (= (and b!1008687 res!677577) b!1008683))

(assert (= (and b!1008683 res!677578) b!1008690))

(assert (= (and b!1008690 res!677589) b!1008693))

(assert (= (and b!1008693 res!677584) b!1008688))

(assert (= (and b!1008688 res!677576) b!1008696))

(assert (= (and b!1008696 res!677588) b!1008689))

(declare-fun m!933395 () Bool)

(assert (=> b!1008690 m!933395))

(assert (=> b!1008690 m!933395))

(declare-fun m!933397 () Bool)

(assert (=> b!1008690 m!933397))

(declare-fun m!933399 () Bool)

(assert (=> b!1008685 m!933399))

(declare-fun m!933401 () Bool)

(assert (=> b!1008695 m!933401))

(declare-fun m!933403 () Bool)

(assert (=> b!1008693 m!933403))

(assert (=> b!1008693 m!933403))

(declare-fun m!933405 () Bool)

(assert (=> b!1008693 m!933405))

(declare-fun m!933407 () Bool)

(assert (=> b!1008693 m!933407))

(declare-fun m!933409 () Bool)

(assert (=> b!1008693 m!933409))

(declare-fun m!933411 () Bool)

(assert (=> b!1008686 m!933411))

(declare-fun m!933413 () Bool)

(assert (=> start!86948 m!933413))

(declare-fun m!933415 () Bool)

(assert (=> start!86948 m!933415))

(assert (=> b!1008683 m!933395))

(assert (=> b!1008683 m!933395))

(declare-fun m!933417 () Bool)

(assert (=> b!1008683 m!933417))

(assert (=> b!1008683 m!933417))

(assert (=> b!1008683 m!933395))

(declare-fun m!933419 () Bool)

(assert (=> b!1008683 m!933419))

(declare-fun m!933421 () Bool)

(assert (=> b!1008688 m!933421))

(declare-fun m!933423 () Bool)

(assert (=> b!1008691 m!933423))

(assert (=> b!1008684 m!933395))

(assert (=> b!1008684 m!933395))

(declare-fun m!933425 () Bool)

(assert (=> b!1008684 m!933425))

(declare-fun m!933427 () Bool)

(assert (=> b!1008689 m!933427))

(declare-fun m!933429 () Bool)

(assert (=> b!1008692 m!933429))

(push 1)

(assert (not b!1008695))

(assert (not b!1008685))

(assert (not b!1008692))

(assert (not b!1008693))

(assert (not b!1008684))

