; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46108 () Bool)

(assert start!46108)

(declare-fun b!510756 () Bool)

(declare-fun res!311609 () Bool)

(declare-fun e!298507 () Bool)

(assert (=> b!510756 (=> (not res!311609) (not e!298507))))

(declare-datatypes ((array!32819 0))(
  ( (array!32820 (arr!15788 (Array (_ BitVec 32) (_ BitVec 64))) (size!16152 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32819)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32819 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!510756 (= res!311609 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!510757 () Bool)

(declare-fun res!311605 () Bool)

(declare-fun e!298508 () Bool)

(assert (=> b!510757 (=> (not res!311605) (not e!298508))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32819 (_ BitVec 32)) Bool)

(assert (=> b!510757 (= res!311605 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!510758 () Bool)

(declare-fun res!311608 () Bool)

(assert (=> b!510758 (=> (not res!311608) (not e!298508))))

(declare-datatypes ((List!9946 0))(
  ( (Nil!9943) (Cons!9942 (h!10819 (_ BitVec 64)) (t!16174 List!9946)) )
))
(declare-fun arrayNoDuplicates!0 (array!32819 (_ BitVec 32) List!9946) Bool)

(assert (=> b!510758 (= res!311608 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9943))))

(declare-fun b!510759 () Bool)

(declare-fun e!298506 () Bool)

(assert (=> b!510759 (= e!298506 true)))

(declare-fun lt!233595 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!4255 0))(
  ( (MissingZero!4255 (index!19208 (_ BitVec 32))) (Found!4255 (index!19209 (_ BitVec 32))) (Intermediate!4255 (undefined!5067 Bool) (index!19210 (_ BitVec 32)) (x!48160 (_ BitVec 32))) (Undefined!4255) (MissingVacant!4255 (index!19211 (_ BitVec 32))) )
))
(declare-fun lt!233596 () SeekEntryResult!4255)

(declare-fun lt!233599 () array!32819)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32819 (_ BitVec 32)) SeekEntryResult!4255)

(assert (=> b!510759 (= lt!233596 (seekEntryOrOpen!0 lt!233595 lt!233599 mask!3524))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((Unit!15768 0))(
  ( (Unit!15769) )
))
(declare-fun lt!233597 () Unit!15768)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!32819 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!15768)

(assert (=> b!510759 (= lt!233597 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k!2280 j!176 mask!3524))))

(declare-fun b!510760 () Bool)

(assert (=> b!510760 (= e!298507 e!298508)))

(declare-fun res!311601 () Bool)

(assert (=> b!510760 (=> (not res!311601) (not e!298508))))

(declare-fun lt!233598 () SeekEntryResult!4255)

(assert (=> b!510760 (= res!311601 (or (= lt!233598 (MissingZero!4255 i!1204)) (= lt!233598 (MissingVacant!4255 i!1204))))))

(assert (=> b!510760 (= lt!233598 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun res!311607 () Bool)

(assert (=> start!46108 (=> (not res!311607) (not e!298507))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46108 (= res!311607 (validMask!0 mask!3524))))

(assert (=> start!46108 e!298507))

(assert (=> start!46108 true))

(declare-fun array_inv!11584 (array!32819) Bool)

(assert (=> start!46108 (array_inv!11584 a!3235)))

(declare-fun b!510761 () Bool)

(declare-fun res!311602 () Bool)

(assert (=> b!510761 (=> (not res!311602) (not e!298507))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!510761 (= res!311602 (validKeyInArray!0 (select (arr!15788 a!3235) j!176)))))

(declare-fun b!510762 () Bool)

(assert (=> b!510762 (= e!298508 (not e!298506))))

(declare-fun res!311603 () Bool)

(assert (=> b!510762 (=> res!311603 e!298506)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32819 (_ BitVec 32)) SeekEntryResult!4255)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!510762 (= res!311603 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15788 a!3235) j!176) mask!3524) (select (arr!15788 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!233595 mask!3524) lt!233595 lt!233599 mask!3524))))))

(assert (=> b!510762 (= lt!233595 (select (store (arr!15788 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!510762 (= lt!233599 (array!32820 (store (arr!15788 a!3235) i!1204 k!2280) (size!16152 a!3235)))))

(assert (=> b!510762 (= lt!233596 (Found!4255 j!176))))

(assert (=> b!510762 (= lt!233596 (seekEntryOrOpen!0 (select (arr!15788 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!510762 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!233594 () Unit!15768)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32819 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15768)

(assert (=> b!510762 (= lt!233594 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!510763 () Bool)

(declare-fun res!311604 () Bool)

(assert (=> b!510763 (=> (not res!311604) (not e!298507))))

(assert (=> b!510763 (= res!311604 (and (= (size!16152 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16152 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16152 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!510764 () Bool)

(declare-fun res!311606 () Bool)

(assert (=> b!510764 (=> (not res!311606) (not e!298507))))

(assert (=> b!510764 (= res!311606 (validKeyInArray!0 k!2280))))

(assert (= (and start!46108 res!311607) b!510763))

(assert (= (and b!510763 res!311604) b!510761))

(assert (= (and b!510761 res!311602) b!510764))

(assert (= (and b!510764 res!311606) b!510756))

(assert (= (and b!510756 res!311609) b!510760))

(assert (= (and b!510760 res!311601) b!510757))

(assert (= (and b!510757 res!311605) b!510758))

(assert (= (and b!510758 res!311608) b!510762))

(assert (= (and b!510762 (not res!311603)) b!510759))

(declare-fun m!492173 () Bool)

(assert (=> b!510759 m!492173))

(declare-fun m!492175 () Bool)

(assert (=> b!510759 m!492175))

(declare-fun m!492177 () Bool)

(assert (=> start!46108 m!492177))

(declare-fun m!492179 () Bool)

(assert (=> start!46108 m!492179))

(declare-fun m!492181 () Bool)

(assert (=> b!510762 m!492181))

(declare-fun m!492183 () Bool)

(assert (=> b!510762 m!492183))

(declare-fun m!492185 () Bool)

(assert (=> b!510762 m!492185))

(declare-fun m!492187 () Bool)

(assert (=> b!510762 m!492187))

(declare-fun m!492189 () Bool)

(assert (=> b!510762 m!492189))

(declare-fun m!492191 () Bool)

(assert (=> b!510762 m!492191))

(declare-fun m!492193 () Bool)

(assert (=> b!510762 m!492193))

(declare-fun m!492195 () Bool)

(assert (=> b!510762 m!492195))

(assert (=> b!510762 m!492181))

(assert (=> b!510762 m!492193))

(assert (=> b!510762 m!492191))

(assert (=> b!510762 m!492193))

(declare-fun m!492197 () Bool)

(assert (=> b!510762 m!492197))

(assert (=> b!510762 m!492193))

(declare-fun m!492199 () Bool)

(assert (=> b!510762 m!492199))

(declare-fun m!492201 () Bool)

(assert (=> b!510758 m!492201))

(declare-fun m!492203 () Bool)

(assert (=> b!510757 m!492203))

(declare-fun m!492205 () Bool)

(assert (=> b!510764 m!492205))

(assert (=> b!510761 m!492193))

(assert (=> b!510761 m!492193))

(declare-fun m!492207 () Bool)

(assert (=> b!510761 m!492207))

(declare-fun m!492209 () Bool)

(assert (=> b!510756 m!492209))

(declare-fun m!492211 () Bool)

(assert (=> b!510760 m!492211))

(push 1)

