; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46102 () Bool)

(assert start!46102)

(declare-fun b!510675 () Bool)

(declare-fun res!311521 () Bool)

(declare-fun e!298473 () Bool)

(assert (=> b!510675 (=> (not res!311521) (not e!298473))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!510675 (= res!311521 (validKeyInArray!0 k!2280))))

(declare-fun b!510676 () Bool)

(declare-fun res!311520 () Bool)

(assert (=> b!510676 (=> (not res!311520) (not e!298473))))

(declare-datatypes ((array!32813 0))(
  ( (array!32814 (arr!15785 (Array (_ BitVec 32) (_ BitVec 64))) (size!16149 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32813)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!510676 (= res!311520 (validKeyInArray!0 (select (arr!15785 a!3235) j!176)))))

(declare-fun b!510677 () Bool)

(declare-fun e!298472 () Bool)

(assert (=> b!510677 (= e!298472 true)))

(declare-datatypes ((SeekEntryResult!4252 0))(
  ( (MissingZero!4252 (index!19196 (_ BitVec 32))) (Found!4252 (index!19197 (_ BitVec 32))) (Intermediate!4252 (undefined!5064 Bool) (index!19198 (_ BitVec 32)) (x!48149 (_ BitVec 32))) (Undefined!4252) (MissingVacant!4252 (index!19199 (_ BitVec 32))) )
))
(declare-fun lt!233542 () SeekEntryResult!4252)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!233543 () array!32813)

(declare-fun lt!233541 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32813 (_ BitVec 32)) SeekEntryResult!4252)

(assert (=> b!510677 (= lt!233542 (seekEntryOrOpen!0 lt!233541 lt!233543 mask!3524))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((Unit!15762 0))(
  ( (Unit!15763) )
))
(declare-fun lt!233544 () Unit!15762)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!32813 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!15762)

(assert (=> b!510677 (= lt!233544 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k!2280 j!176 mask!3524))))

(declare-fun b!510678 () Bool)

(declare-fun e!298470 () Bool)

(assert (=> b!510678 (= e!298470 (not e!298472))))

(declare-fun res!311522 () Bool)

(assert (=> b!510678 (=> res!311522 e!298472)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32813 (_ BitVec 32)) SeekEntryResult!4252)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!510678 (= res!311522 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15785 a!3235) j!176) mask!3524) (select (arr!15785 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!233541 mask!3524) lt!233541 lt!233543 mask!3524))))))

(assert (=> b!510678 (= lt!233541 (select (store (arr!15785 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!510678 (= lt!233543 (array!32814 (store (arr!15785 a!3235) i!1204 k!2280) (size!16149 a!3235)))))

(assert (=> b!510678 (= lt!233542 (Found!4252 j!176))))

(assert (=> b!510678 (= lt!233542 (seekEntryOrOpen!0 (select (arr!15785 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32813 (_ BitVec 32)) Bool)

(assert (=> b!510678 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!233540 () Unit!15762)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32813 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15762)

(assert (=> b!510678 (= lt!233540 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!510679 () Bool)

(assert (=> b!510679 (= e!298473 e!298470)))

(declare-fun res!311526 () Bool)

(assert (=> b!510679 (=> (not res!311526) (not e!298470))))

(declare-fun lt!233545 () SeekEntryResult!4252)

(assert (=> b!510679 (= res!311526 (or (= lt!233545 (MissingZero!4252 i!1204)) (= lt!233545 (MissingVacant!4252 i!1204))))))

(assert (=> b!510679 (= lt!233545 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun res!311527 () Bool)

(assert (=> start!46102 (=> (not res!311527) (not e!298473))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46102 (= res!311527 (validMask!0 mask!3524))))

(assert (=> start!46102 e!298473))

(assert (=> start!46102 true))

(declare-fun array_inv!11581 (array!32813) Bool)

(assert (=> start!46102 (array_inv!11581 a!3235)))

(declare-fun b!510680 () Bool)

(declare-fun res!311528 () Bool)

(assert (=> b!510680 (=> (not res!311528) (not e!298470))))

(declare-datatypes ((List!9943 0))(
  ( (Nil!9940) (Cons!9939 (h!10816 (_ BitVec 64)) (t!16171 List!9943)) )
))
(declare-fun arrayNoDuplicates!0 (array!32813 (_ BitVec 32) List!9943) Bool)

(assert (=> b!510680 (= res!311528 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9940))))

(declare-fun b!510681 () Bool)

(declare-fun res!311525 () Bool)

(assert (=> b!510681 (=> (not res!311525) (not e!298470))))

(assert (=> b!510681 (= res!311525 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!510682 () Bool)

(declare-fun res!311523 () Bool)

(assert (=> b!510682 (=> (not res!311523) (not e!298473))))

(declare-fun arrayContainsKey!0 (array!32813 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!510682 (= res!311523 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!510683 () Bool)

(declare-fun res!311524 () Bool)

(assert (=> b!510683 (=> (not res!311524) (not e!298473))))

(assert (=> b!510683 (= res!311524 (and (= (size!16149 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16149 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16149 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!46102 res!311527) b!510683))

(assert (= (and b!510683 res!311524) b!510676))

(assert (= (and b!510676 res!311520) b!510675))

(assert (= (and b!510675 res!311521) b!510682))

(assert (= (and b!510682 res!311523) b!510679))

(assert (= (and b!510679 res!311526) b!510681))

(assert (= (and b!510681 res!311525) b!510680))

(assert (= (and b!510680 res!311528) b!510678))

(assert (= (and b!510678 (not res!311522)) b!510677))

(declare-fun m!492053 () Bool)

(assert (=> b!510675 m!492053))

(declare-fun m!492055 () Bool)

(assert (=> b!510677 m!492055))

(declare-fun m!492057 () Bool)

(assert (=> b!510677 m!492057))

(declare-fun m!492059 () Bool)

(assert (=> b!510678 m!492059))

(declare-fun m!492061 () Bool)

(assert (=> b!510678 m!492061))

(declare-fun m!492063 () Bool)

(assert (=> b!510678 m!492063))

(declare-fun m!492065 () Bool)

(assert (=> b!510678 m!492065))

(declare-fun m!492067 () Bool)

(assert (=> b!510678 m!492067))

(declare-fun m!492069 () Bool)

(assert (=> b!510678 m!492069))

(declare-fun m!492071 () Bool)

(assert (=> b!510678 m!492071))

(declare-fun m!492073 () Bool)

(assert (=> b!510678 m!492073))

(assert (=> b!510678 m!492067))

(assert (=> b!510678 m!492065))

(assert (=> b!510678 m!492067))

(declare-fun m!492075 () Bool)

(assert (=> b!510678 m!492075))

(assert (=> b!510678 m!492067))

(declare-fun m!492077 () Bool)

(assert (=> b!510678 m!492077))

(assert (=> b!510678 m!492071))

(declare-fun m!492079 () Bool)

(assert (=> b!510681 m!492079))

(declare-fun m!492081 () Bool)

(assert (=> b!510682 m!492081))

(declare-fun m!492083 () Bool)

(assert (=> start!46102 m!492083))

(declare-fun m!492085 () Bool)

(assert (=> start!46102 m!492085))

(assert (=> b!510676 m!492067))

(assert (=> b!510676 m!492067))

(declare-fun m!492087 () Bool)

(assert (=> b!510676 m!492087))

(declare-fun m!492089 () Bool)

(assert (=> b!510680 m!492089))

(declare-fun m!492091 () Bool)

(assert (=> b!510679 m!492091))

(push 1)

