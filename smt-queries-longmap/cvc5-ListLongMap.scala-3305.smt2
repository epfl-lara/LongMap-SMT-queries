; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45774 () Bool)

(assert start!45774)

(declare-fun b!506554 () Bool)

(declare-fun res!307523 () Bool)

(declare-fun e!296483 () Bool)

(assert (=> b!506554 (=> (not res!307523) (not e!296483))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!506554 (= res!307523 (validKeyInArray!0 k!2280))))

(declare-fun b!506555 () Bool)

(declare-fun e!296479 () Bool)

(assert (=> b!506555 (= e!296483 e!296479)))

(declare-fun res!307515 () Bool)

(assert (=> b!506555 (=> (not res!307515) (not e!296479))))

(declare-datatypes ((SeekEntryResult!4112 0))(
  ( (MissingZero!4112 (index!18636 (_ BitVec 32))) (Found!4112 (index!18637 (_ BitVec 32))) (Intermediate!4112 (undefined!4924 Bool) (index!18638 (_ BitVec 32)) (x!47641 (_ BitVec 32))) (Undefined!4112) (MissingVacant!4112 (index!18639 (_ BitVec 32))) )
))
(declare-fun lt!231159 () SeekEntryResult!4112)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!506555 (= res!307515 (or (= lt!231159 (MissingZero!4112 i!1204)) (= lt!231159 (MissingVacant!4112 i!1204))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32530 0))(
  ( (array!32531 (arr!15645 (Array (_ BitVec 32) (_ BitVec 64))) (size!16009 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32530)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32530 (_ BitVec 32)) SeekEntryResult!4112)

(assert (=> b!506555 (= lt!231159 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!506556 () Bool)

(declare-fun res!307520 () Bool)

(assert (=> b!506556 (=> (not res!307520) (not e!296483))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!506556 (= res!307520 (and (= (size!16009 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16009 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16009 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!506557 () Bool)

(declare-fun e!296482 () Bool)

(assert (=> b!506557 (= e!296479 (not e!296482))))

(declare-fun res!307518 () Bool)

(assert (=> b!506557 (=> res!307518 e!296482)))

(declare-fun lt!231157 () SeekEntryResult!4112)

(declare-fun lt!231156 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32530 (_ BitVec 32)) SeekEntryResult!4112)

(assert (=> b!506557 (= res!307518 (= lt!231157 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231156 (select (store (arr!15645 a!3235) i!1204 k!2280) j!176) (array!32531 (store (arr!15645 a!3235) i!1204 k!2280) (size!16009 a!3235)) mask!3524)))))

(declare-fun lt!231155 () (_ BitVec 32))

(assert (=> b!506557 (= lt!231157 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231155 (select (arr!15645 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!506557 (= lt!231156 (toIndex!0 (select (store (arr!15645 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!506557 (= lt!231155 (toIndex!0 (select (arr!15645 a!3235) j!176) mask!3524))))

(declare-fun e!296480 () Bool)

(assert (=> b!506557 e!296480))

(declare-fun res!307517 () Bool)

(assert (=> b!506557 (=> (not res!307517) (not e!296480))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32530 (_ BitVec 32)) Bool)

(assert (=> b!506557 (= res!307517 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15512 0))(
  ( (Unit!15513) )
))
(declare-fun lt!231160 () Unit!15512)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32530 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15512)

(assert (=> b!506557 (= lt!231160 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!506558 () Bool)

(declare-fun res!307516 () Bool)

(assert (=> b!506558 (=> (not res!307516) (not e!296483))))

(assert (=> b!506558 (= res!307516 (validKeyInArray!0 (select (arr!15645 a!3235) j!176)))))

(declare-fun b!506559 () Bool)

(declare-fun e!296481 () Bool)

(assert (=> b!506559 (= e!296481 true)))

(assert (=> b!506559 false))

(declare-fun b!506560 () Bool)

(declare-fun res!307521 () Bool)

(assert (=> b!506560 (=> (not res!307521) (not e!296483))))

(declare-fun arrayContainsKey!0 (array!32530 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!506560 (= res!307521 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun res!307514 () Bool)

(assert (=> start!45774 (=> (not res!307514) (not e!296483))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45774 (= res!307514 (validMask!0 mask!3524))))

(assert (=> start!45774 e!296483))

(assert (=> start!45774 true))

(declare-fun array_inv!11441 (array!32530) Bool)

(assert (=> start!45774 (array_inv!11441 a!3235)))

(declare-fun b!506561 () Bool)

(assert (=> b!506561 (= e!296482 e!296481)))

(declare-fun res!307513 () Bool)

(assert (=> b!506561 (=> res!307513 e!296481)))

(declare-fun lt!231158 () Bool)

(assert (=> b!506561 (= res!307513 (or (and (not lt!231158) (undefined!4924 lt!231157)) (and (not lt!231158) (not (undefined!4924 lt!231157)))))))

(assert (=> b!506561 (= lt!231158 (not (is-Intermediate!4112 lt!231157)))))

(declare-fun b!506562 () Bool)

(declare-fun res!307519 () Bool)

(assert (=> b!506562 (=> (not res!307519) (not e!296479))))

(declare-datatypes ((List!9803 0))(
  ( (Nil!9800) (Cons!9799 (h!10676 (_ BitVec 64)) (t!16031 List!9803)) )
))
(declare-fun arrayNoDuplicates!0 (array!32530 (_ BitVec 32) List!9803) Bool)

(assert (=> b!506562 (= res!307519 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9800))))

(declare-fun b!506563 () Bool)

(assert (=> b!506563 (= e!296480 (= (seekEntryOrOpen!0 (select (arr!15645 a!3235) j!176) a!3235 mask!3524) (Found!4112 j!176)))))

(declare-fun b!506564 () Bool)

(declare-fun res!307522 () Bool)

(assert (=> b!506564 (=> (not res!307522) (not e!296479))))

(assert (=> b!506564 (= res!307522 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!45774 res!307514) b!506556))

(assert (= (and b!506556 res!307520) b!506558))

(assert (= (and b!506558 res!307516) b!506554))

(assert (= (and b!506554 res!307523) b!506560))

(assert (= (and b!506560 res!307521) b!506555))

(assert (= (and b!506555 res!307515) b!506564))

(assert (= (and b!506564 res!307522) b!506562))

(assert (= (and b!506562 res!307519) b!506557))

(assert (= (and b!506557 res!307517) b!506563))

(assert (= (and b!506557 (not res!307518)) b!506561))

(assert (= (and b!506561 (not res!307513)) b!506559))

(declare-fun m!487227 () Bool)

(assert (=> b!506560 m!487227))

(declare-fun m!487229 () Bool)

(assert (=> b!506554 m!487229))

(declare-fun m!487231 () Bool)

(assert (=> b!506564 m!487231))

(declare-fun m!487233 () Bool)

(assert (=> start!45774 m!487233))

(declare-fun m!487235 () Bool)

(assert (=> start!45774 m!487235))

(declare-fun m!487237 () Bool)

(assert (=> b!506562 m!487237))

(declare-fun m!487239 () Bool)

(assert (=> b!506557 m!487239))

(declare-fun m!487241 () Bool)

(assert (=> b!506557 m!487241))

(declare-fun m!487243 () Bool)

(assert (=> b!506557 m!487243))

(assert (=> b!506557 m!487243))

(declare-fun m!487245 () Bool)

(assert (=> b!506557 m!487245))

(declare-fun m!487247 () Bool)

(assert (=> b!506557 m!487247))

(declare-fun m!487249 () Bool)

(assert (=> b!506557 m!487249))

(assert (=> b!506557 m!487247))

(assert (=> b!506557 m!487243))

(declare-fun m!487251 () Bool)

(assert (=> b!506557 m!487251))

(declare-fun m!487253 () Bool)

(assert (=> b!506557 m!487253))

(assert (=> b!506557 m!487247))

(declare-fun m!487255 () Bool)

(assert (=> b!506557 m!487255))

(assert (=> b!506563 m!487247))

(assert (=> b!506563 m!487247))

(declare-fun m!487257 () Bool)

(assert (=> b!506563 m!487257))

(declare-fun m!487259 () Bool)

(assert (=> b!506555 m!487259))

(assert (=> b!506558 m!487247))

(assert (=> b!506558 m!487247))

(declare-fun m!487261 () Bool)

(assert (=> b!506558 m!487261))

(push 1)

