; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46110 () Bool)

(assert start!46110)

(declare-fun b!510783 () Bool)

(declare-fun res!311628 () Bool)

(declare-fun e!298520 () Bool)

(assert (=> b!510783 (=> (not res!311628) (not e!298520))))

(declare-datatypes ((array!32821 0))(
  ( (array!32822 (arr!15789 (Array (_ BitVec 32) (_ BitVec 64))) (size!16153 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32821)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32821 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!510783 (= res!311628 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!510784 () Bool)

(declare-fun res!311631 () Bool)

(assert (=> b!510784 (=> (not res!311631) (not e!298520))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!510784 (= res!311631 (validKeyInArray!0 k!2280))))

(declare-fun e!298518 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun b!510785 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4256 0))(
  ( (MissingZero!4256 (index!19212 (_ BitVec 32))) (Found!4256 (index!19213 (_ BitVec 32))) (Intermediate!4256 (undefined!5068 Bool) (index!19214 (_ BitVec 32)) (x!48169 (_ BitVec 32))) (Undefined!4256) (MissingVacant!4256 (index!19215 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32821 (_ BitVec 32)) SeekEntryResult!4256)

(assert (=> b!510785 (= e!298518 (= (seekEntryOrOpen!0 (select (arr!15789 a!3235) j!176) a!3235 mask!3524) (Found!4256 j!176)))))

(declare-fun b!510787 () Bool)

(declare-fun res!311636 () Bool)

(assert (=> b!510787 (=> (not res!311636) (not e!298520))))

(assert (=> b!510787 (= res!311636 (validKeyInArray!0 (select (arr!15789 a!3235) j!176)))))

(declare-fun b!510788 () Bool)

(declare-fun res!311629 () Bool)

(declare-fun e!298521 () Bool)

(assert (=> b!510788 (=> (not res!311629) (not e!298521))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32821 (_ BitVec 32)) Bool)

(assert (=> b!510788 (= res!311629 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!510789 () Bool)

(declare-fun res!311630 () Bool)

(assert (=> b!510789 (=> (not res!311630) (not e!298520))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!510789 (= res!311630 (and (= (size!16153 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16153 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16153 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!510790 () Bool)

(assert (=> b!510790 (= e!298521 (not true))))

(declare-fun lt!233614 () SeekEntryResult!4256)

(declare-fun lt!233617 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32821 (_ BitVec 32)) SeekEntryResult!4256)

(assert (=> b!510790 (= lt!233614 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233617 (select (store (arr!15789 a!3235) i!1204 k!2280) j!176) (array!32822 (store (arr!15789 a!3235) i!1204 k!2280) (size!16153 a!3235)) mask!3524))))

(declare-fun lt!233612 () (_ BitVec 32))

(declare-fun lt!233613 () SeekEntryResult!4256)

(assert (=> b!510790 (= lt!233613 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233612 (select (arr!15789 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!510790 (= lt!233617 (toIndex!0 (select (store (arr!15789 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!510790 (= lt!233612 (toIndex!0 (select (arr!15789 a!3235) j!176) mask!3524))))

(assert (=> b!510790 e!298518))

(declare-fun res!311635 () Bool)

(assert (=> b!510790 (=> (not res!311635) (not e!298518))))

(assert (=> b!510790 (= res!311635 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15770 0))(
  ( (Unit!15771) )
))
(declare-fun lt!233615 () Unit!15770)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32821 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15770)

(assert (=> b!510790 (= lt!233615 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!510791 () Bool)

(declare-fun res!311633 () Bool)

(assert (=> b!510791 (=> (not res!311633) (not e!298521))))

(declare-datatypes ((List!9947 0))(
  ( (Nil!9944) (Cons!9943 (h!10820 (_ BitVec 64)) (t!16175 List!9947)) )
))
(declare-fun arrayNoDuplicates!0 (array!32821 (_ BitVec 32) List!9947) Bool)

(assert (=> b!510791 (= res!311633 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9944))))

(declare-fun res!311634 () Bool)

(assert (=> start!46110 (=> (not res!311634) (not e!298520))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46110 (= res!311634 (validMask!0 mask!3524))))

(assert (=> start!46110 e!298520))

(assert (=> start!46110 true))

(declare-fun array_inv!11585 (array!32821) Bool)

(assert (=> start!46110 (array_inv!11585 a!3235)))

(declare-fun b!510786 () Bool)

(assert (=> b!510786 (= e!298520 e!298521)))

(declare-fun res!311632 () Bool)

(assert (=> b!510786 (=> (not res!311632) (not e!298521))))

(declare-fun lt!233616 () SeekEntryResult!4256)

(assert (=> b!510786 (= res!311632 (or (= lt!233616 (MissingZero!4256 i!1204)) (= lt!233616 (MissingVacant!4256 i!1204))))))

(assert (=> b!510786 (= lt!233616 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(assert (= (and start!46110 res!311634) b!510789))

(assert (= (and b!510789 res!311630) b!510787))

(assert (= (and b!510787 res!311636) b!510784))

(assert (= (and b!510784 res!311631) b!510783))

(assert (= (and b!510783 res!311628) b!510786))

(assert (= (and b!510786 res!311632) b!510788))

(assert (= (and b!510788 res!311629) b!510791))

(assert (= (and b!510791 res!311633) b!510790))

(assert (= (and b!510790 res!311635) b!510785))

(declare-fun m!492213 () Bool)

(assert (=> start!46110 m!492213))

(declare-fun m!492215 () Bool)

(assert (=> start!46110 m!492215))

(declare-fun m!492217 () Bool)

(assert (=> b!510787 m!492217))

(assert (=> b!510787 m!492217))

(declare-fun m!492219 () Bool)

(assert (=> b!510787 m!492219))

(declare-fun m!492221 () Bool)

(assert (=> b!510784 m!492221))

(declare-fun m!492223 () Bool)

(assert (=> b!510786 m!492223))

(declare-fun m!492225 () Bool)

(assert (=> b!510783 m!492225))

(declare-fun m!492227 () Bool)

(assert (=> b!510791 m!492227))

(declare-fun m!492229 () Bool)

(assert (=> b!510788 m!492229))

(assert (=> b!510785 m!492217))

(assert (=> b!510785 m!492217))

(declare-fun m!492231 () Bool)

(assert (=> b!510785 m!492231))

(declare-fun m!492233 () Bool)

(assert (=> b!510790 m!492233))

(declare-fun m!492235 () Bool)

(assert (=> b!510790 m!492235))

(declare-fun m!492237 () Bool)

(assert (=> b!510790 m!492237))

(declare-fun m!492239 () Bool)

(assert (=> b!510790 m!492239))

(assert (=> b!510790 m!492233))

(assert (=> b!510790 m!492217))

(declare-fun m!492241 () Bool)

(assert (=> b!510790 m!492241))

(assert (=> b!510790 m!492233))

(declare-fun m!492243 () Bool)

(assert (=> b!510790 m!492243))

(assert (=> b!510790 m!492217))

(declare-fun m!492245 () Bool)

(assert (=> b!510790 m!492245))

(assert (=> b!510790 m!492217))

(declare-fun m!492247 () Bool)

(assert (=> b!510790 m!492247))

(push 1)

