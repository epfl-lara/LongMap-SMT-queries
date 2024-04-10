; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44716 () Bool)

(assert start!44716)

(declare-fun b!490758 () Bool)

(declare-fun res!293697 () Bool)

(declare-fun e!288448 () Bool)

(assert (=> b!490758 (=> (not res!293697) (not e!288448))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!31775 0))(
  ( (array!31776 (arr!15275 (Array (_ BitVec 32) (_ BitVec 64))) (size!15639 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31775)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!490758 (= res!293697 (and (= (size!15639 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15639 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15639 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!490759 () Bool)

(declare-fun res!293694 () Bool)

(declare-fun e!288450 () Bool)

(assert (=> b!490759 (=> (not res!293694) (not e!288450))))

(declare-datatypes ((List!9433 0))(
  ( (Nil!9430) (Cons!9429 (h!10291 (_ BitVec 64)) (t!15661 List!9433)) )
))
(declare-fun arrayNoDuplicates!0 (array!31775 (_ BitVec 32) List!9433) Bool)

(assert (=> b!490759 (= res!293694 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9430))))

(declare-fun b!490760 () Bool)

(declare-fun e!288449 () Bool)

(assert (=> b!490760 (= e!288449 true)))

(declare-fun lt!221707 () (_ BitVec 64))

(declare-fun lt!221709 () array!31775)

(declare-datatypes ((SeekEntryResult!3742 0))(
  ( (MissingZero!3742 (index!17147 (_ BitVec 32))) (Found!3742 (index!17148 (_ BitVec 32))) (Intermediate!3742 (undefined!4554 Bool) (index!17149 (_ BitVec 32)) (x!46240 (_ BitVec 32))) (Undefined!3742) (MissingVacant!3742 (index!17150 (_ BitVec 32))) )
))
(declare-fun lt!221705 () SeekEntryResult!3742)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31775 (_ BitVec 32)) SeekEntryResult!3742)

(assert (=> b!490760 (= lt!221705 (seekEntryOrOpen!0 lt!221707 lt!221709 mask!3524))))

(declare-datatypes ((Unit!14430 0))(
  ( (Unit!14431) )
))
(declare-fun lt!221706 () Unit!14430)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!31775 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!14430)

(assert (=> b!490760 (= lt!221706 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k!2280 j!176 mask!3524))))

(declare-fun b!490761 () Bool)

(assert (=> b!490761 (= e!288450 (not e!288449))))

(declare-fun res!293699 () Bool)

(assert (=> b!490761 (=> res!293699 e!288449)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31775 (_ BitVec 32)) SeekEntryResult!3742)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!490761 (= res!293699 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15275 a!3235) j!176) mask!3524) (select (arr!15275 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!221707 mask!3524) lt!221707 lt!221709 mask!3524))))))

(assert (=> b!490761 (= lt!221707 (select (store (arr!15275 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!490761 (= lt!221709 (array!31776 (store (arr!15275 a!3235) i!1204 k!2280) (size!15639 a!3235)))))

(assert (=> b!490761 (= lt!221705 (Found!3742 j!176))))

(assert (=> b!490761 (= lt!221705 (seekEntryOrOpen!0 (select (arr!15275 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31775 (_ BitVec 32)) Bool)

(assert (=> b!490761 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!221708 () Unit!14430)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31775 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14430)

(assert (=> b!490761 (= lt!221708 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!490762 () Bool)

(assert (=> b!490762 (= e!288448 e!288450)))

(declare-fun res!293702 () Bool)

(assert (=> b!490762 (=> (not res!293702) (not e!288450))))

(declare-fun lt!221710 () SeekEntryResult!3742)

(assert (=> b!490762 (= res!293702 (or (= lt!221710 (MissingZero!3742 i!1204)) (= lt!221710 (MissingVacant!3742 i!1204))))))

(assert (=> b!490762 (= lt!221710 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!490763 () Bool)

(declare-fun res!293700 () Bool)

(assert (=> b!490763 (=> (not res!293700) (not e!288448))))

(declare-fun arrayContainsKey!0 (array!31775 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!490763 (= res!293700 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun res!293695 () Bool)

(assert (=> start!44716 (=> (not res!293695) (not e!288448))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44716 (= res!293695 (validMask!0 mask!3524))))

(assert (=> start!44716 e!288448))

(assert (=> start!44716 true))

(declare-fun array_inv!11071 (array!31775) Bool)

(assert (=> start!44716 (array_inv!11071 a!3235)))

(declare-fun b!490764 () Bool)

(declare-fun res!293701 () Bool)

(assert (=> b!490764 (=> (not res!293701) (not e!288450))))

(assert (=> b!490764 (= res!293701 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!490765 () Bool)

(declare-fun res!293698 () Bool)

(assert (=> b!490765 (=> (not res!293698) (not e!288448))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!490765 (= res!293698 (validKeyInArray!0 (select (arr!15275 a!3235) j!176)))))

(declare-fun b!490766 () Bool)

(declare-fun res!293696 () Bool)

(assert (=> b!490766 (=> (not res!293696) (not e!288448))))

(assert (=> b!490766 (= res!293696 (validKeyInArray!0 k!2280))))

(assert (= (and start!44716 res!293695) b!490758))

(assert (= (and b!490758 res!293697) b!490765))

(assert (= (and b!490765 res!293698) b!490766))

(assert (= (and b!490766 res!293696) b!490763))

(assert (= (and b!490763 res!293700) b!490762))

(assert (= (and b!490762 res!293702) b!490764))

(assert (= (and b!490764 res!293701) b!490759))

(assert (= (and b!490759 res!293694) b!490761))

(assert (= (and b!490761 (not res!293699)) b!490760))

(declare-fun m!471017 () Bool)

(assert (=> b!490760 m!471017))

(declare-fun m!471019 () Bool)

(assert (=> b!490760 m!471019))

(declare-fun m!471021 () Bool)

(assert (=> b!490765 m!471021))

(assert (=> b!490765 m!471021))

(declare-fun m!471023 () Bool)

(assert (=> b!490765 m!471023))

(declare-fun m!471025 () Bool)

(assert (=> b!490761 m!471025))

(declare-fun m!471027 () Bool)

(assert (=> b!490761 m!471027))

(declare-fun m!471029 () Bool)

(assert (=> b!490761 m!471029))

(declare-fun m!471031 () Bool)

(assert (=> b!490761 m!471031))

(declare-fun m!471033 () Bool)

(assert (=> b!490761 m!471033))

(assert (=> b!490761 m!471021))

(declare-fun m!471035 () Bool)

(assert (=> b!490761 m!471035))

(assert (=> b!490761 m!471025))

(declare-fun m!471037 () Bool)

(assert (=> b!490761 m!471037))

(assert (=> b!490761 m!471021))

(assert (=> b!490761 m!471033))

(assert (=> b!490761 m!471021))

(declare-fun m!471039 () Bool)

(assert (=> b!490761 m!471039))

(assert (=> b!490761 m!471021))

(declare-fun m!471041 () Bool)

(assert (=> b!490761 m!471041))

(declare-fun m!471043 () Bool)

(assert (=> b!490764 m!471043))

(declare-fun m!471045 () Bool)

(assert (=> start!44716 m!471045))

(declare-fun m!471047 () Bool)

(assert (=> start!44716 m!471047))

(declare-fun m!471049 () Bool)

(assert (=> b!490759 m!471049))

(declare-fun m!471051 () Bool)

(assert (=> b!490763 m!471051))

(declare-fun m!471053 () Bool)

(assert (=> b!490762 m!471053))

(declare-fun m!471055 () Bool)

(assert (=> b!490766 m!471055))

(push 1)

