; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45238 () Bool)

(assert start!45238)

(declare-fun b!496750 () Bool)

(declare-fun res!299141 () Bool)

(declare-fun e!291263 () Bool)

(assert (=> b!496750 (=> (not res!299141) (not e!291263))))

(declare-datatypes ((array!32126 0))(
  ( (array!32127 (arr!15446 (Array (_ BitVec 32) (_ BitVec 64))) (size!15810 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32126)

(declare-datatypes ((List!9604 0))(
  ( (Nil!9601) (Cons!9600 (h!10471 (_ BitVec 64)) (t!15832 List!9604)) )
))
(declare-fun arrayNoDuplicates!0 (array!32126 (_ BitVec 32) List!9604) Bool)

(assert (=> b!496750 (= res!299141 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9601))))

(declare-fun b!496751 () Bool)

(declare-fun res!299143 () Bool)

(declare-fun e!291264 () Bool)

(assert (=> b!496751 (=> (not res!299143) (not e!291264))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32126 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!496751 (= res!299143 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!496752 () Bool)

(declare-fun res!299137 () Bool)

(assert (=> b!496752 (=> (not res!299137) (not e!291264))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!496752 (= res!299137 (and (= (size!15810 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15810 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15810 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!496753 () Bool)

(declare-fun res!299147 () Bool)

(declare-fun e!291265 () Bool)

(assert (=> b!496753 (=> res!299147 e!291265)))

(declare-datatypes ((SeekEntryResult!3913 0))(
  ( (MissingZero!3913 (index!17831 (_ BitVec 32))) (Found!3913 (index!17832 (_ BitVec 32))) (Intermediate!3913 (undefined!4725 Bool) (index!17833 (_ BitVec 32)) (x!46885 (_ BitVec 32))) (Undefined!3913) (MissingVacant!3913 (index!17834 (_ BitVec 32))) )
))
(declare-fun lt!224885 () SeekEntryResult!3913)

(assert (=> b!496753 (= res!299147 (or (undefined!4725 lt!224885) (not (is-Intermediate!3913 lt!224885))))))

(declare-fun b!496754 () Bool)

(assert (=> b!496754 (= e!291264 e!291263)))

(declare-fun res!299138 () Bool)

(assert (=> b!496754 (=> (not res!299138) (not e!291263))))

(declare-fun lt!224886 () SeekEntryResult!3913)

(assert (=> b!496754 (= res!299138 (or (= lt!224886 (MissingZero!3913 i!1204)) (= lt!224886 (MissingVacant!3913 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32126 (_ BitVec 32)) SeekEntryResult!3913)

(assert (=> b!496754 (= lt!224886 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!496755 () Bool)

(declare-fun res!299140 () Bool)

(assert (=> b!496755 (=> (not res!299140) (not e!291264))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!496755 (= res!299140 (validKeyInArray!0 (select (arr!15446 a!3235) j!176)))))

(declare-fun b!496756 () Bool)

(declare-fun res!299139 () Bool)

(assert (=> b!496756 (=> (not res!299139) (not e!291264))))

(assert (=> b!496756 (= res!299139 (validKeyInArray!0 k!2280))))

(declare-fun b!496758 () Bool)

(declare-fun e!291267 () Bool)

(assert (=> b!496758 (= e!291267 (= (seekEntryOrOpen!0 (select (arr!15446 a!3235) j!176) a!3235 mask!3524) (Found!3913 j!176)))))

(declare-fun b!496759 () Bool)

(declare-fun res!299145 () Bool)

(assert (=> b!496759 (=> (not res!299145) (not e!291263))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32126 (_ BitVec 32)) Bool)

(assert (=> b!496759 (= res!299145 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!496760 () Bool)

(assert (=> b!496760 (= e!291265 true)))

(assert (=> b!496760 (and (bvslt (x!46885 lt!224885) #b01111111111111111111111111111110) (or (= (select (arr!15446 a!3235) (index!17833 lt!224885)) (select (arr!15446 a!3235) j!176)) (= (select (arr!15446 a!3235) (index!17833 lt!224885)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15446 a!3235) (index!17833 lt!224885)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!496757 () Bool)

(assert (=> b!496757 (= e!291263 (not e!291265))))

(declare-fun res!299142 () Bool)

(assert (=> b!496757 (=> res!299142 e!291265)))

(declare-fun lt!224887 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32126 (_ BitVec 32)) SeekEntryResult!3913)

(assert (=> b!496757 (= res!299142 (= lt!224885 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224887 (select (store (arr!15446 a!3235) i!1204 k!2280) j!176) (array!32127 (store (arr!15446 a!3235) i!1204 k!2280) (size!15810 a!3235)) mask!3524)))))

(declare-fun lt!224883 () (_ BitVec 32))

(assert (=> b!496757 (= lt!224885 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224883 (select (arr!15446 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!496757 (= lt!224887 (toIndex!0 (select (store (arr!15446 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!496757 (= lt!224883 (toIndex!0 (select (arr!15446 a!3235) j!176) mask!3524))))

(assert (=> b!496757 e!291267))

(declare-fun res!299144 () Bool)

(assert (=> b!496757 (=> (not res!299144) (not e!291267))))

(assert (=> b!496757 (= res!299144 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14772 0))(
  ( (Unit!14773) )
))
(declare-fun lt!224884 () Unit!14772)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32126 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14772)

(assert (=> b!496757 (= lt!224884 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!299146 () Bool)

(assert (=> start!45238 (=> (not res!299146) (not e!291264))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45238 (= res!299146 (validMask!0 mask!3524))))

(assert (=> start!45238 e!291264))

(assert (=> start!45238 true))

(declare-fun array_inv!11242 (array!32126) Bool)

(assert (=> start!45238 (array_inv!11242 a!3235)))

(assert (= (and start!45238 res!299146) b!496752))

(assert (= (and b!496752 res!299137) b!496755))

(assert (= (and b!496755 res!299140) b!496756))

(assert (= (and b!496756 res!299139) b!496751))

(assert (= (and b!496751 res!299143) b!496754))

(assert (= (and b!496754 res!299138) b!496759))

(assert (= (and b!496759 res!299145) b!496750))

(assert (= (and b!496750 res!299141) b!496757))

(assert (= (and b!496757 res!299144) b!496758))

(assert (= (and b!496757 (not res!299142)) b!496753))

(assert (= (and b!496753 (not res!299147)) b!496760))

(declare-fun m!478033 () Bool)

(assert (=> b!496759 m!478033))

(declare-fun m!478035 () Bool)

(assert (=> b!496750 m!478035))

(declare-fun m!478037 () Bool)

(assert (=> b!496755 m!478037))

(assert (=> b!496755 m!478037))

(declare-fun m!478039 () Bool)

(assert (=> b!496755 m!478039))

(declare-fun m!478041 () Bool)

(assert (=> b!496754 m!478041))

(declare-fun m!478043 () Bool)

(assert (=> b!496751 m!478043))

(declare-fun m!478045 () Bool)

(assert (=> b!496756 m!478045))

(assert (=> b!496758 m!478037))

(assert (=> b!496758 m!478037))

(declare-fun m!478047 () Bool)

(assert (=> b!496758 m!478047))

(declare-fun m!478049 () Bool)

(assert (=> start!45238 m!478049))

(declare-fun m!478051 () Bool)

(assert (=> start!45238 m!478051))

(declare-fun m!478053 () Bool)

(assert (=> b!496760 m!478053))

(assert (=> b!496760 m!478037))

(declare-fun m!478055 () Bool)

(assert (=> b!496757 m!478055))

(declare-fun m!478057 () Bool)

(assert (=> b!496757 m!478057))

(declare-fun m!478059 () Bool)

(assert (=> b!496757 m!478059))

(assert (=> b!496757 m!478037))

(declare-fun m!478061 () Bool)

(assert (=> b!496757 m!478061))

(assert (=> b!496757 m!478037))

(declare-fun m!478063 () Bool)

(assert (=> b!496757 m!478063))

(assert (=> b!496757 m!478059))

(declare-fun m!478065 () Bool)

(assert (=> b!496757 m!478065))

(assert (=> b!496757 m!478059))

(declare-fun m!478067 () Bool)

(assert (=> b!496757 m!478067))

(assert (=> b!496757 m!478037))

(declare-fun m!478069 () Bool)

(assert (=> b!496757 m!478069))

(push 1)

