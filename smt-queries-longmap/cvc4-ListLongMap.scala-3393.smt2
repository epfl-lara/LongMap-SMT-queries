; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46774 () Bool)

(assert start!46774)

(declare-fun b!516634 () Bool)

(declare-fun res!316203 () Bool)

(declare-fun e!301491 () Bool)

(assert (=> b!516634 (=> (not res!316203) (not e!301491))))

(declare-datatypes ((array!33086 0))(
  ( (array!33087 (arr!15911 (Array (_ BitVec 32) (_ BitVec 64))) (size!16275 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33086)

(declare-datatypes ((List!10069 0))(
  ( (Nil!10066) (Cons!10065 (h!10963 (_ BitVec 64)) (t!16297 List!10069)) )
))
(declare-fun arrayNoDuplicates!0 (array!33086 (_ BitVec 32) List!10069) Bool)

(assert (=> b!516634 (= res!316203 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10066))))

(declare-fun b!516635 () Bool)

(declare-fun res!316198 () Bool)

(declare-fun e!301490 () Bool)

(assert (=> b!516635 (=> (not res!316198) (not e!301490))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!516635 (= res!316198 (and (= (size!16275 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16275 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16275 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!516636 () Bool)

(declare-fun res!316199 () Bool)

(declare-fun e!301494 () Bool)

(assert (=> b!516636 (=> res!316199 e!301494)))

(declare-datatypes ((SeekEntryResult!4378 0))(
  ( (MissingZero!4378 (index!19700 (_ BitVec 32))) (Found!4378 (index!19701 (_ BitVec 32))) (Intermediate!4378 (undefined!5190 Bool) (index!19702 (_ BitVec 32)) (x!48653 (_ BitVec 32))) (Undefined!4378) (MissingVacant!4378 (index!19703 (_ BitVec 32))) )
))
(declare-fun lt!236508 () SeekEntryResult!4378)

(assert (=> b!516636 (= res!316199 (or (undefined!5190 lt!236508) (not (is-Intermediate!4378 lt!236508))))))

(declare-fun b!516637 () Bool)

(assert (=> b!516637 (= e!301491 (not e!301494))))

(declare-fun res!316206 () Bool)

(assert (=> b!516637 (=> res!316206 e!301494)))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun lt!236505 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33086 (_ BitVec 32)) SeekEntryResult!4378)

(assert (=> b!516637 (= res!316206 (= lt!236508 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236505 (select (store (arr!15911 a!3235) i!1204 k!2280) j!176) (array!33087 (store (arr!15911 a!3235) i!1204 k!2280) (size!16275 a!3235)) mask!3524)))))

(declare-fun lt!236506 () (_ BitVec 32))

(assert (=> b!516637 (= lt!236508 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236506 (select (arr!15911 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!516637 (= lt!236505 (toIndex!0 (select (store (arr!15911 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!516637 (= lt!236506 (toIndex!0 (select (arr!15911 a!3235) j!176) mask!3524))))

(declare-fun e!301492 () Bool)

(assert (=> b!516637 e!301492))

(declare-fun res!316208 () Bool)

(assert (=> b!516637 (=> (not res!316208) (not e!301492))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33086 (_ BitVec 32)) Bool)

(assert (=> b!516637 (= res!316208 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16014 0))(
  ( (Unit!16015) )
))
(declare-fun lt!236509 () Unit!16014)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33086 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16014)

(assert (=> b!516637 (= lt!236509 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!516638 () Bool)

(declare-fun res!316202 () Bool)

(assert (=> b!516638 (=> (not res!316202) (not e!301490))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!516638 (= res!316202 (validKeyInArray!0 k!2280))))

(declare-fun b!516639 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33086 (_ BitVec 32)) SeekEntryResult!4378)

(assert (=> b!516639 (= e!301492 (= (seekEntryOrOpen!0 (select (arr!15911 a!3235) j!176) a!3235 mask!3524) (Found!4378 j!176)))))

(declare-fun b!516640 () Bool)

(declare-fun res!316204 () Bool)

(assert (=> b!516640 (=> (not res!316204) (not e!301490))))

(declare-fun arrayContainsKey!0 (array!33086 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!516640 (= res!316204 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!516641 () Bool)

(assert (=> b!516641 (= e!301494 (or (not (= (select (arr!15911 a!3235) (index!19702 lt!236508)) (select (arr!15911 a!3235) j!176))) (bvsle (x!48653 lt!236508) #b01111111111111111111111111111110)))))

(assert (=> b!516641 (and (bvslt (x!48653 lt!236508) #b01111111111111111111111111111110) (or (= (select (arr!15911 a!3235) (index!19702 lt!236508)) (select (arr!15911 a!3235) j!176)) (= (select (arr!15911 a!3235) (index!19702 lt!236508)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15911 a!3235) (index!19702 lt!236508)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!516642 () Bool)

(declare-fun res!316205 () Bool)

(assert (=> b!516642 (=> (not res!316205) (not e!301491))))

(assert (=> b!516642 (= res!316205 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!516644 () Bool)

(assert (=> b!516644 (= e!301490 e!301491)))

(declare-fun res!316201 () Bool)

(assert (=> b!516644 (=> (not res!316201) (not e!301491))))

(declare-fun lt!236507 () SeekEntryResult!4378)

(assert (=> b!516644 (= res!316201 (or (= lt!236507 (MissingZero!4378 i!1204)) (= lt!236507 (MissingVacant!4378 i!1204))))))

(assert (=> b!516644 (= lt!236507 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!516643 () Bool)

(declare-fun res!316200 () Bool)

(assert (=> b!516643 (=> (not res!316200) (not e!301490))))

(assert (=> b!516643 (= res!316200 (validKeyInArray!0 (select (arr!15911 a!3235) j!176)))))

(declare-fun res!316207 () Bool)

(assert (=> start!46774 (=> (not res!316207) (not e!301490))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46774 (= res!316207 (validMask!0 mask!3524))))

(assert (=> start!46774 e!301490))

(assert (=> start!46774 true))

(declare-fun array_inv!11707 (array!33086) Bool)

(assert (=> start!46774 (array_inv!11707 a!3235)))

(assert (= (and start!46774 res!316207) b!516635))

(assert (= (and b!516635 res!316198) b!516643))

(assert (= (and b!516643 res!316200) b!516638))

(assert (= (and b!516638 res!316202) b!516640))

(assert (= (and b!516640 res!316204) b!516644))

(assert (= (and b!516644 res!316201) b!516642))

(assert (= (and b!516642 res!316205) b!516634))

(assert (= (and b!516634 res!316203) b!516637))

(assert (= (and b!516637 res!316208) b!516639))

(assert (= (and b!516637 (not res!316206)) b!516636))

(assert (= (and b!516636 (not res!316199)) b!516641))

(declare-fun m!498151 () Bool)

(assert (=> b!516638 m!498151))

(declare-fun m!498153 () Bool)

(assert (=> b!516643 m!498153))

(assert (=> b!516643 m!498153))

(declare-fun m!498155 () Bool)

(assert (=> b!516643 m!498155))

(declare-fun m!498157 () Bool)

(assert (=> b!516641 m!498157))

(assert (=> b!516641 m!498153))

(declare-fun m!498159 () Bool)

(assert (=> b!516637 m!498159))

(declare-fun m!498161 () Bool)

(assert (=> b!516637 m!498161))

(declare-fun m!498163 () Bool)

(assert (=> b!516637 m!498163))

(assert (=> b!516637 m!498153))

(declare-fun m!498165 () Bool)

(assert (=> b!516637 m!498165))

(assert (=> b!516637 m!498153))

(declare-fun m!498167 () Bool)

(assert (=> b!516637 m!498167))

(assert (=> b!516637 m!498163))

(declare-fun m!498169 () Bool)

(assert (=> b!516637 m!498169))

(assert (=> b!516637 m!498153))

(declare-fun m!498171 () Bool)

(assert (=> b!516637 m!498171))

(assert (=> b!516637 m!498163))

(declare-fun m!498173 () Bool)

(assert (=> b!516637 m!498173))

(assert (=> b!516639 m!498153))

(assert (=> b!516639 m!498153))

(declare-fun m!498175 () Bool)

(assert (=> b!516639 m!498175))

(declare-fun m!498177 () Bool)

(assert (=> b!516640 m!498177))

(declare-fun m!498179 () Bool)

(assert (=> b!516642 m!498179))

(declare-fun m!498181 () Bool)

(assert (=> start!46774 m!498181))

(declare-fun m!498183 () Bool)

(assert (=> start!46774 m!498183))

(declare-fun m!498185 () Bool)

(assert (=> b!516634 m!498185))

(declare-fun m!498187 () Bool)

(assert (=> b!516644 m!498187))

(push 1)

