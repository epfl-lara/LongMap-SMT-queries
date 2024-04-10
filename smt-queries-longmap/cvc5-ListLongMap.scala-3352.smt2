; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46104 () Bool)

(assert start!46104)

(declare-fun b!510702 () Bool)

(declare-fun res!311555 () Bool)

(declare-fun e!298485 () Bool)

(assert (=> b!510702 (=> (not res!311555) (not e!298485))))

(declare-datatypes ((array!32815 0))(
  ( (array!32816 (arr!15786 (Array (_ BitVec 32) (_ BitVec 64))) (size!16150 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32815)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32815 (_ BitVec 32)) Bool)

(assert (=> b!510702 (= res!311555 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!510703 () Bool)

(declare-fun res!311554 () Bool)

(declare-fun e!298482 () Bool)

(assert (=> b!510703 (=> (not res!311554) (not e!298482))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32815 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!510703 (= res!311554 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!510704 () Bool)

(declare-fun res!311553 () Bool)

(assert (=> b!510704 (=> (not res!311553) (not e!298482))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!510704 (= res!311553 (validKeyInArray!0 (select (arr!15786 a!3235) j!176)))))

(declare-fun b!510705 () Bool)

(declare-fun res!311552 () Bool)

(assert (=> b!510705 (=> (not res!311552) (not e!298482))))

(assert (=> b!510705 (= res!311552 (validKeyInArray!0 k!2280))))

(declare-fun res!311549 () Bool)

(assert (=> start!46104 (=> (not res!311549) (not e!298482))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46104 (= res!311549 (validMask!0 mask!3524))))

(assert (=> start!46104 e!298482))

(assert (=> start!46104 true))

(declare-fun array_inv!11582 (array!32815) Bool)

(assert (=> start!46104 (array_inv!11582 a!3235)))

(declare-fun b!510706 () Bool)

(declare-fun res!311547 () Bool)

(assert (=> b!510706 (=> (not res!311547) (not e!298485))))

(declare-datatypes ((List!9944 0))(
  ( (Nil!9941) (Cons!9940 (h!10817 (_ BitVec 64)) (t!16172 List!9944)) )
))
(declare-fun arrayNoDuplicates!0 (array!32815 (_ BitVec 32) List!9944) Bool)

(assert (=> b!510706 (= res!311547 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9941))))

(declare-fun b!510707 () Bool)

(declare-fun res!311548 () Bool)

(assert (=> b!510707 (=> (not res!311548) (not e!298482))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!510707 (= res!311548 (and (= (size!16150 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16150 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16150 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!510708 () Bool)

(declare-fun e!298483 () Bool)

(assert (=> b!510708 (= e!298485 (not e!298483))))

(declare-fun res!311551 () Bool)

(assert (=> b!510708 (=> res!311551 e!298483)))

(declare-fun lt!233560 () array!32815)

(declare-fun lt!233562 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!4253 0))(
  ( (MissingZero!4253 (index!19200 (_ BitVec 32))) (Found!4253 (index!19201 (_ BitVec 32))) (Intermediate!4253 (undefined!5065 Bool) (index!19202 (_ BitVec 32)) (x!48158 (_ BitVec 32))) (Undefined!4253) (MissingVacant!4253 (index!19203 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32815 (_ BitVec 32)) SeekEntryResult!4253)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!510708 (= res!311551 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15786 a!3235) j!176) mask!3524) (select (arr!15786 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!233562 mask!3524) lt!233562 lt!233560 mask!3524))))))

(assert (=> b!510708 (= lt!233562 (select (store (arr!15786 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!510708 (= lt!233560 (array!32816 (store (arr!15786 a!3235) i!1204 k!2280) (size!16150 a!3235)))))

(declare-fun lt!233561 () SeekEntryResult!4253)

(assert (=> b!510708 (= lt!233561 (Found!4253 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32815 (_ BitVec 32)) SeekEntryResult!4253)

(assert (=> b!510708 (= lt!233561 (seekEntryOrOpen!0 (select (arr!15786 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!510708 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15764 0))(
  ( (Unit!15765) )
))
(declare-fun lt!233563 () Unit!15764)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32815 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15764)

(assert (=> b!510708 (= lt!233563 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!510709 () Bool)

(assert (=> b!510709 (= e!298482 e!298485)))

(declare-fun res!311550 () Bool)

(assert (=> b!510709 (=> (not res!311550) (not e!298485))))

(declare-fun lt!233558 () SeekEntryResult!4253)

(assert (=> b!510709 (= res!311550 (or (= lt!233558 (MissingZero!4253 i!1204)) (= lt!233558 (MissingVacant!4253 i!1204))))))

(assert (=> b!510709 (= lt!233558 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!510710 () Bool)

(assert (=> b!510710 (= e!298483 true)))

(assert (=> b!510710 (= lt!233561 (seekEntryOrOpen!0 lt!233562 lt!233560 mask!3524))))

(declare-fun lt!233559 () Unit!15764)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!32815 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!15764)

(assert (=> b!510710 (= lt!233559 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k!2280 j!176 mask!3524))))

(assert (= (and start!46104 res!311549) b!510707))

(assert (= (and b!510707 res!311548) b!510704))

(assert (= (and b!510704 res!311553) b!510705))

(assert (= (and b!510705 res!311552) b!510703))

(assert (= (and b!510703 res!311554) b!510709))

(assert (= (and b!510709 res!311550) b!510702))

(assert (= (and b!510702 res!311555) b!510706))

(assert (= (and b!510706 res!311547) b!510708))

(assert (= (and b!510708 (not res!311551)) b!510710))

(declare-fun m!492093 () Bool)

(assert (=> b!510703 m!492093))

(declare-fun m!492095 () Bool)

(assert (=> b!510704 m!492095))

(assert (=> b!510704 m!492095))

(declare-fun m!492097 () Bool)

(assert (=> b!510704 m!492097))

(declare-fun m!492099 () Bool)

(assert (=> b!510710 m!492099))

(declare-fun m!492101 () Bool)

(assert (=> b!510710 m!492101))

(declare-fun m!492103 () Bool)

(assert (=> b!510705 m!492103))

(declare-fun m!492105 () Bool)

(assert (=> b!510706 m!492105))

(declare-fun m!492107 () Bool)

(assert (=> start!46104 m!492107))

(declare-fun m!492109 () Bool)

(assert (=> start!46104 m!492109))

(declare-fun m!492111 () Bool)

(assert (=> b!510708 m!492111))

(declare-fun m!492113 () Bool)

(assert (=> b!510708 m!492113))

(declare-fun m!492115 () Bool)

(assert (=> b!510708 m!492115))

(declare-fun m!492117 () Bool)

(assert (=> b!510708 m!492117))

(assert (=> b!510708 m!492095))

(declare-fun m!492119 () Bool)

(assert (=> b!510708 m!492119))

(declare-fun m!492121 () Bool)

(assert (=> b!510708 m!492121))

(declare-fun m!492123 () Bool)

(assert (=> b!510708 m!492123))

(assert (=> b!510708 m!492095))

(assert (=> b!510708 m!492117))

(assert (=> b!510708 m!492095))

(declare-fun m!492125 () Bool)

(assert (=> b!510708 m!492125))

(assert (=> b!510708 m!492095))

(declare-fun m!492127 () Bool)

(assert (=> b!510708 m!492127))

(assert (=> b!510708 m!492121))

(declare-fun m!492129 () Bool)

(assert (=> b!510702 m!492129))

(declare-fun m!492131 () Bool)

(assert (=> b!510709 m!492131))

(push 1)

