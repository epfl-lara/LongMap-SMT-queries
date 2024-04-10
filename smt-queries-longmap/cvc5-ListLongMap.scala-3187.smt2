; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44748 () Bool)

(assert start!44748)

(declare-fun b!491199 () Bool)

(declare-fun res!294141 () Bool)

(declare-fun e!288648 () Bool)

(assert (=> b!491199 (=> (not res!294141) (not e!288648))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!491199 (= res!294141 (validKeyInArray!0 k!2280))))

(declare-fun b!491200 () Bool)

(declare-fun res!294142 () Bool)

(declare-fun e!288649 () Bool)

(assert (=> b!491200 (=> (not res!294142) (not e!288649))))

(declare-datatypes ((array!31807 0))(
  ( (array!31808 (arr!15291 (Array (_ BitVec 32) (_ BitVec 64))) (size!15655 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31807)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31807 (_ BitVec 32)) Bool)

(assert (=> b!491200 (= res!294142 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!491201 () Bool)

(declare-fun e!288650 () Bool)

(assert (=> b!491201 (= e!288649 (not e!288650))))

(declare-fun res!294136 () Bool)

(assert (=> b!491201 (=> res!294136 e!288650)))

(declare-fun lt!221993 () array!31807)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!221998 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3758 0))(
  ( (MissingZero!3758 (index!17211 (_ BitVec 32))) (Found!3758 (index!17212 (_ BitVec 32))) (Intermediate!3758 (undefined!4570 Bool) (index!17213 (_ BitVec 32)) (x!46304 (_ BitVec 32))) (Undefined!3758) (MissingVacant!3758 (index!17214 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31807 (_ BitVec 32)) SeekEntryResult!3758)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!491201 (= res!294136 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15291 a!3235) j!176) mask!3524) (select (arr!15291 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!221998 mask!3524) lt!221998 lt!221993 mask!3524))))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!491201 (= lt!221998 (select (store (arr!15291 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!491201 (= lt!221993 (array!31808 (store (arr!15291 a!3235) i!1204 k!2280) (size!15655 a!3235)))))

(declare-fun lt!221996 () SeekEntryResult!3758)

(assert (=> b!491201 (= lt!221996 (Found!3758 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31807 (_ BitVec 32)) SeekEntryResult!3758)

(assert (=> b!491201 (= lt!221996 (seekEntryOrOpen!0 (select (arr!15291 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!491201 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14462 0))(
  ( (Unit!14463) )
))
(declare-fun lt!221995 () Unit!14462)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31807 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14462)

(assert (=> b!491201 (= lt!221995 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!491202 () Bool)

(assert (=> b!491202 (= e!288648 e!288649)))

(declare-fun res!294143 () Bool)

(assert (=> b!491202 (=> (not res!294143) (not e!288649))))

(declare-fun lt!221994 () SeekEntryResult!3758)

(assert (=> b!491202 (= res!294143 (or (= lt!221994 (MissingZero!3758 i!1204)) (= lt!221994 (MissingVacant!3758 i!1204))))))

(assert (=> b!491202 (= lt!221994 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!491203 () Bool)

(declare-fun res!294135 () Bool)

(assert (=> b!491203 (=> (not res!294135) (not e!288648))))

(assert (=> b!491203 (= res!294135 (validKeyInArray!0 (select (arr!15291 a!3235) j!176)))))

(declare-fun b!491204 () Bool)

(assert (=> b!491204 (= e!288650 (bvsge mask!3524 #b00000000000000000000000000000000))))

(assert (=> b!491204 (= lt!221996 (seekEntryOrOpen!0 lt!221998 lt!221993 mask!3524))))

(declare-fun lt!221997 () Unit!14462)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!31807 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!14462)

(assert (=> b!491204 (= lt!221997 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k!2280 j!176 mask!3524))))

(declare-fun b!491205 () Bool)

(declare-fun res!294137 () Bool)

(assert (=> b!491205 (=> (not res!294137) (not e!288648))))

(assert (=> b!491205 (= res!294137 (and (= (size!15655 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15655 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15655 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!294138 () Bool)

(assert (=> start!44748 (=> (not res!294138) (not e!288648))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44748 (= res!294138 (validMask!0 mask!3524))))

(assert (=> start!44748 e!288648))

(assert (=> start!44748 true))

(declare-fun array_inv!11087 (array!31807) Bool)

(assert (=> start!44748 (array_inv!11087 a!3235)))

(declare-fun b!491206 () Bool)

(declare-fun res!294140 () Bool)

(assert (=> b!491206 (=> (not res!294140) (not e!288648))))

(declare-fun arrayContainsKey!0 (array!31807 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!491206 (= res!294140 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!491207 () Bool)

(declare-fun res!294139 () Bool)

(assert (=> b!491207 (=> (not res!294139) (not e!288649))))

(declare-datatypes ((List!9449 0))(
  ( (Nil!9446) (Cons!9445 (h!10307 (_ BitVec 64)) (t!15677 List!9449)) )
))
(declare-fun arrayNoDuplicates!0 (array!31807 (_ BitVec 32) List!9449) Bool)

(assert (=> b!491207 (= res!294139 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9446))))

(assert (= (and start!44748 res!294138) b!491205))

(assert (= (and b!491205 res!294137) b!491203))

(assert (= (and b!491203 res!294135) b!491199))

(assert (= (and b!491199 res!294141) b!491206))

(assert (= (and b!491206 res!294140) b!491202))

(assert (= (and b!491202 res!294143) b!491200))

(assert (= (and b!491200 res!294142) b!491207))

(assert (= (and b!491207 res!294139) b!491201))

(assert (= (and b!491201 (not res!294136)) b!491204))

(declare-fun m!471663 () Bool)

(assert (=> start!44748 m!471663))

(declare-fun m!471665 () Bool)

(assert (=> start!44748 m!471665))

(declare-fun m!471667 () Bool)

(assert (=> b!491199 m!471667))

(declare-fun m!471669 () Bool)

(assert (=> b!491202 m!471669))

(declare-fun m!471671 () Bool)

(assert (=> b!491201 m!471671))

(declare-fun m!471673 () Bool)

(assert (=> b!491201 m!471673))

(declare-fun m!471675 () Bool)

(assert (=> b!491201 m!471675))

(declare-fun m!471677 () Bool)

(assert (=> b!491201 m!471677))

(declare-fun m!471679 () Bool)

(assert (=> b!491201 m!471679))

(declare-fun m!471681 () Bool)

(assert (=> b!491201 m!471681))

(declare-fun m!471683 () Bool)

(assert (=> b!491201 m!471683))

(assert (=> b!491201 m!471681))

(assert (=> b!491201 m!471679))

(assert (=> b!491201 m!471681))

(assert (=> b!491201 m!471671))

(declare-fun m!471685 () Bool)

(assert (=> b!491201 m!471685))

(declare-fun m!471687 () Bool)

(assert (=> b!491201 m!471687))

(assert (=> b!491201 m!471681))

(declare-fun m!471689 () Bool)

(assert (=> b!491201 m!471689))

(declare-fun m!471691 () Bool)

(assert (=> b!491200 m!471691))

(declare-fun m!471693 () Bool)

(assert (=> b!491206 m!471693))

(declare-fun m!471695 () Bool)

(assert (=> b!491207 m!471695))

(assert (=> b!491203 m!471681))

(assert (=> b!491203 m!471681))

(declare-fun m!471697 () Bool)

(assert (=> b!491203 m!471697))

(declare-fun m!471699 () Bool)

(assert (=> b!491204 m!471699))

(declare-fun m!471701 () Bool)

(assert (=> b!491204 m!471701))

(push 1)

