; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86900 () Bool)

(assert start!86900)

(declare-fun b!1007675 () Bool)

(declare-fun res!676579 () Bool)

(declare-fun e!567088 () Bool)

(assert (=> b!1007675 (=> (not res!676579) (not e!567088))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun lt!445322 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!9527 0))(
  ( (MissingZero!9527 (index!40479 (_ BitVec 32))) (Found!9527 (index!40480 (_ BitVec 32))) (Intermediate!9527 (undefined!10339 Bool) (index!40481 (_ BitVec 32)) (x!87877 (_ BitVec 32))) (Undefined!9527) (MissingVacant!9527 (index!40482 (_ BitVec 32))) )
))
(declare-fun lt!445317 () SeekEntryResult!9527)

(declare-datatypes ((array!63548 0))(
  ( (array!63549 (arr!30595 (Array (_ BitVec 32) (_ BitVec 64))) (size!31097 (_ BitVec 32))) )
))
(declare-fun lt!445321 () array!63548)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63548 (_ BitVec 32)) SeekEntryResult!9527)

(assert (=> b!1007675 (= res!676579 (not (= lt!445317 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!445322 lt!445321 mask!3464))))))

(declare-fun b!1007676 () Bool)

(declare-fun res!676577 () Bool)

(declare-fun e!567086 () Bool)

(assert (=> b!1007676 (=> (not res!676577) (not e!567086))))

(declare-fun a!3219 () array!63548)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63548 (_ BitVec 32)) Bool)

(assert (=> b!1007676 (= res!676577 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1007677 () Bool)

(declare-fun res!676570 () Bool)

(declare-fun e!567090 () Bool)

(assert (=> b!1007677 (=> (not res!676570) (not e!567090))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63548 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1007677 (= res!676570 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1007678 () Bool)

(assert (=> b!1007678 (= e!567090 e!567086)))

(declare-fun res!676576 () Bool)

(assert (=> b!1007678 (=> (not res!676576) (not e!567086))))

(declare-fun lt!445318 () SeekEntryResult!9527)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1007678 (= res!676576 (or (= lt!445318 (MissingVacant!9527 i!1194)) (= lt!445318 (MissingZero!9527 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63548 (_ BitVec 32)) SeekEntryResult!9527)

(assert (=> b!1007678 (= lt!445318 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1007679 () Bool)

(declare-fun res!676571 () Bool)

(assert (=> b!1007679 (=> (not res!676571) (not e!567086))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1007679 (= res!676571 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31097 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31097 a!3219))))))

(declare-fun b!1007680 () Bool)

(declare-fun e!567089 () Bool)

(assert (=> b!1007680 (= e!567086 e!567089)))

(declare-fun res!676573 () Bool)

(assert (=> b!1007680 (=> (not res!676573) (not e!567089))))

(declare-fun lt!445316 () SeekEntryResult!9527)

(declare-fun lt!445319 () SeekEntryResult!9527)

(assert (=> b!1007680 (= res!676573 (= lt!445316 lt!445319))))

(assert (=> b!1007680 (= lt!445319 (Intermediate!9527 false resIndex!38 resX!38))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1007680 (= lt!445316 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30595 a!3219) j!170) mask!3464) (select (arr!30595 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1007681 () Bool)

(declare-fun res!676574 () Bool)

(assert (=> b!1007681 (=> (not res!676574) (not e!567088))))

(assert (=> b!1007681 (= res!676574 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1007682 () Bool)

(declare-fun e!567091 () Bool)

(assert (=> b!1007682 (= e!567089 e!567091)))

(declare-fun res!676569 () Bool)

(assert (=> b!1007682 (=> (not res!676569) (not e!567091))))

(assert (=> b!1007682 (= res!676569 (= lt!445317 lt!445319))))

(assert (=> b!1007682 (= lt!445317 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30595 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1007683 () Bool)

(declare-fun res!676575 () Bool)

(assert (=> b!1007683 (=> (not res!676575) (not e!567090))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1007683 (= res!676575 (validKeyInArray!0 k!2224))))

(declare-fun b!1007684 () Bool)

(assert (=> b!1007684 (= e!567088 false)))

(declare-fun lt!445320 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1007684 (= lt!445320 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun res!676578 () Bool)

(assert (=> start!86900 (=> (not res!676578) (not e!567090))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86900 (= res!676578 (validMask!0 mask!3464))))

(assert (=> start!86900 e!567090))

(declare-fun array_inv!23719 (array!63548) Bool)

(assert (=> start!86900 (array_inv!23719 a!3219)))

(assert (=> start!86900 true))

(declare-fun b!1007685 () Bool)

(declare-fun res!676580 () Bool)

(assert (=> b!1007685 (=> (not res!676580) (not e!567090))))

(assert (=> b!1007685 (= res!676580 (validKeyInArray!0 (select (arr!30595 a!3219) j!170)))))

(declare-fun b!1007686 () Bool)

(assert (=> b!1007686 (= e!567091 e!567088)))

(declare-fun res!676572 () Bool)

(assert (=> b!1007686 (=> (not res!676572) (not e!567088))))

(assert (=> b!1007686 (= res!676572 (not (= lt!445316 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!445322 mask!3464) lt!445322 lt!445321 mask!3464))))))

(assert (=> b!1007686 (= lt!445322 (select (store (arr!30595 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1007686 (= lt!445321 (array!63549 (store (arr!30595 a!3219) i!1194 k!2224) (size!31097 a!3219)))))

(declare-fun b!1007687 () Bool)

(declare-fun res!676568 () Bool)

(assert (=> b!1007687 (=> (not res!676568) (not e!567086))))

(declare-datatypes ((List!21271 0))(
  ( (Nil!21268) (Cons!21267 (h!22453 (_ BitVec 64)) (t!30272 List!21271)) )
))
(declare-fun arrayNoDuplicates!0 (array!63548 (_ BitVec 32) List!21271) Bool)

(assert (=> b!1007687 (= res!676568 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21268))))

(declare-fun b!1007688 () Bool)

(declare-fun res!676581 () Bool)

(assert (=> b!1007688 (=> (not res!676581) (not e!567090))))

(assert (=> b!1007688 (= res!676581 (and (= (size!31097 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31097 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31097 a!3219)) (not (= i!1194 j!170))))))

(assert (= (and start!86900 res!676578) b!1007688))

(assert (= (and b!1007688 res!676581) b!1007685))

(assert (= (and b!1007685 res!676580) b!1007683))

(assert (= (and b!1007683 res!676575) b!1007677))

(assert (= (and b!1007677 res!676570) b!1007678))

(assert (= (and b!1007678 res!676576) b!1007676))

(assert (= (and b!1007676 res!676577) b!1007687))

(assert (= (and b!1007687 res!676568) b!1007679))

(assert (= (and b!1007679 res!676571) b!1007680))

(assert (= (and b!1007680 res!676573) b!1007682))

(assert (= (and b!1007682 res!676569) b!1007686))

(assert (= (and b!1007686 res!676572) b!1007675))

(assert (= (and b!1007675 res!676579) b!1007681))

(assert (= (and b!1007681 res!676574) b!1007684))

(declare-fun m!932531 () Bool)

(assert (=> b!1007677 m!932531))

(declare-fun m!932533 () Bool)

(assert (=> b!1007683 m!932533))

(declare-fun m!932535 () Bool)

(assert (=> b!1007678 m!932535))

(declare-fun m!932537 () Bool)

(assert (=> b!1007676 m!932537))

(declare-fun m!932539 () Bool)

(assert (=> b!1007686 m!932539))

(assert (=> b!1007686 m!932539))

(declare-fun m!932541 () Bool)

(assert (=> b!1007686 m!932541))

(declare-fun m!932543 () Bool)

(assert (=> b!1007686 m!932543))

(declare-fun m!932545 () Bool)

(assert (=> b!1007686 m!932545))

(declare-fun m!932547 () Bool)

(assert (=> b!1007684 m!932547))

(declare-fun m!932549 () Bool)

(assert (=> b!1007680 m!932549))

(assert (=> b!1007680 m!932549))

(declare-fun m!932551 () Bool)

(assert (=> b!1007680 m!932551))

(assert (=> b!1007680 m!932551))

(assert (=> b!1007680 m!932549))

(declare-fun m!932553 () Bool)

(assert (=> b!1007680 m!932553))

(assert (=> b!1007685 m!932549))

(assert (=> b!1007685 m!932549))

(declare-fun m!932555 () Bool)

(assert (=> b!1007685 m!932555))

(declare-fun m!932557 () Bool)

(assert (=> start!86900 m!932557))

(declare-fun m!932559 () Bool)

(assert (=> start!86900 m!932559))

(declare-fun m!932561 () Bool)

(assert (=> b!1007675 m!932561))

(assert (=> b!1007682 m!932549))

(assert (=> b!1007682 m!932549))

(declare-fun m!932563 () Bool)

(assert (=> b!1007682 m!932563))

(declare-fun m!932565 () Bool)

(assert (=> b!1007687 m!932565))

(push 1)

