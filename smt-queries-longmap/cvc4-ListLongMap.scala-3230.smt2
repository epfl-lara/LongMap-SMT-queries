; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45190 () Bool)

(assert start!45190)

(declare-fun b!495958 () Bool)

(declare-fun res!298353 () Bool)

(declare-fun e!290905 () Bool)

(assert (=> b!495958 (=> (not res!298353) (not e!290905))))

(declare-datatypes ((array!32078 0))(
  ( (array!32079 (arr!15422 (Array (_ BitVec 32) (_ BitVec 64))) (size!15786 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32078)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32078 (_ BitVec 32)) Bool)

(assert (=> b!495958 (= res!298353 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!495959 () Bool)

(declare-fun res!298351 () Bool)

(assert (=> b!495959 (=> (not res!298351) (not e!290905))))

(declare-datatypes ((List!9580 0))(
  ( (Nil!9577) (Cons!9576 (h!10447 (_ BitVec 64)) (t!15808 List!9580)) )
))
(declare-fun arrayNoDuplicates!0 (array!32078 (_ BitVec 32) List!9580) Bool)

(assert (=> b!495959 (= res!298351 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9577))))

(declare-fun b!495960 () Bool)

(declare-fun res!298347 () Bool)

(declare-fun e!290906 () Bool)

(assert (=> b!495960 (=> (not res!298347) (not e!290906))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!495960 (= res!298347 (and (= (size!15786 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15786 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15786 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!495961 () Bool)

(declare-fun e!290907 () Bool)

(assert (=> b!495961 (= e!290905 (not e!290907))))

(declare-fun res!298345 () Bool)

(assert (=> b!495961 (=> res!298345 e!290907)))

(declare-datatypes ((SeekEntryResult!3889 0))(
  ( (MissingZero!3889 (index!17735 (_ BitVec 32))) (Found!3889 (index!17736 (_ BitVec 32))) (Intermediate!3889 (undefined!4701 Bool) (index!17737 (_ BitVec 32)) (x!46797 (_ BitVec 32))) (Undefined!3889) (MissingVacant!3889 (index!17738 (_ BitVec 32))) )
))
(declare-fun lt!224524 () SeekEntryResult!3889)

(declare-fun lt!224525 () (_ BitVec 32))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32078 (_ BitVec 32)) SeekEntryResult!3889)

(assert (=> b!495961 (= res!298345 (= lt!224524 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224525 (select (store (arr!15422 a!3235) i!1204 k!2280) j!176) (array!32079 (store (arr!15422 a!3235) i!1204 k!2280) (size!15786 a!3235)) mask!3524)))))

(declare-fun lt!224523 () (_ BitVec 32))

(assert (=> b!495961 (= lt!224524 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224523 (select (arr!15422 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!495961 (= lt!224525 (toIndex!0 (select (store (arr!15422 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!495961 (= lt!224523 (toIndex!0 (select (arr!15422 a!3235) j!176) mask!3524))))

(declare-fun e!290903 () Bool)

(assert (=> b!495961 e!290903))

(declare-fun res!298349 () Bool)

(assert (=> b!495961 (=> (not res!298349) (not e!290903))))

(assert (=> b!495961 (= res!298349 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14724 0))(
  ( (Unit!14725) )
))
(declare-fun lt!224527 () Unit!14724)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32078 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14724)

(assert (=> b!495961 (= lt!224527 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!495962 () Bool)

(declare-fun res!298350 () Bool)

(assert (=> b!495962 (=> (not res!298350) (not e!290906))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!495962 (= res!298350 (validKeyInArray!0 (select (arr!15422 a!3235) j!176)))))

(declare-fun b!495963 () Bool)

(assert (=> b!495963 (= e!290907 true)))

(assert (=> b!495963 (and (bvslt (x!46797 lt!224524) #b01111111111111111111111111111110) (or (= (select (arr!15422 a!3235) (index!17737 lt!224524)) (select (arr!15422 a!3235) j!176)) (= (select (arr!15422 a!3235) (index!17737 lt!224524)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15422 a!3235) (index!17737 lt!224524)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!495964 () Bool)

(declare-fun res!298354 () Bool)

(assert (=> b!495964 (=> res!298354 e!290907)))

(assert (=> b!495964 (= res!298354 (or (undefined!4701 lt!224524) (not (is-Intermediate!3889 lt!224524))))))

(declare-fun b!495965 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32078 (_ BitVec 32)) SeekEntryResult!3889)

(assert (=> b!495965 (= e!290903 (= (seekEntryOrOpen!0 (select (arr!15422 a!3235) j!176) a!3235 mask!3524) (Found!3889 j!176)))))

(declare-fun b!495966 () Bool)

(declare-fun res!298355 () Bool)

(assert (=> b!495966 (=> (not res!298355) (not e!290906))))

(assert (=> b!495966 (= res!298355 (validKeyInArray!0 k!2280))))

(declare-fun res!298348 () Bool)

(assert (=> start!45190 (=> (not res!298348) (not e!290906))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45190 (= res!298348 (validMask!0 mask!3524))))

(assert (=> start!45190 e!290906))

(assert (=> start!45190 true))

(declare-fun array_inv!11218 (array!32078) Bool)

(assert (=> start!45190 (array_inv!11218 a!3235)))

(declare-fun b!495967 () Bool)

(assert (=> b!495967 (= e!290906 e!290905)))

(declare-fun res!298352 () Bool)

(assert (=> b!495967 (=> (not res!298352) (not e!290905))))

(declare-fun lt!224526 () SeekEntryResult!3889)

(assert (=> b!495967 (= res!298352 (or (= lt!224526 (MissingZero!3889 i!1204)) (= lt!224526 (MissingVacant!3889 i!1204))))))

(assert (=> b!495967 (= lt!224526 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!495968 () Bool)

(declare-fun res!298346 () Bool)

(assert (=> b!495968 (=> (not res!298346) (not e!290906))))

(declare-fun arrayContainsKey!0 (array!32078 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!495968 (= res!298346 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!45190 res!298348) b!495960))

(assert (= (and b!495960 res!298347) b!495962))

(assert (= (and b!495962 res!298350) b!495966))

(assert (= (and b!495966 res!298355) b!495968))

(assert (= (and b!495968 res!298346) b!495967))

(assert (= (and b!495967 res!298352) b!495958))

(assert (= (and b!495958 res!298353) b!495959))

(assert (= (and b!495959 res!298351) b!495961))

(assert (= (and b!495961 res!298349) b!495965))

(assert (= (and b!495961 (not res!298345)) b!495964))

(assert (= (and b!495964 (not res!298354)) b!495963))

(declare-fun m!477121 () Bool)

(assert (=> b!495959 m!477121))

(declare-fun m!477123 () Bool)

(assert (=> b!495962 m!477123))

(assert (=> b!495962 m!477123))

(declare-fun m!477125 () Bool)

(assert (=> b!495962 m!477125))

(assert (=> b!495961 m!477123))

(declare-fun m!477127 () Bool)

(assert (=> b!495961 m!477127))

(declare-fun m!477129 () Bool)

(assert (=> b!495961 m!477129))

(declare-fun m!477131 () Bool)

(assert (=> b!495961 m!477131))

(declare-fun m!477133 () Bool)

(assert (=> b!495961 m!477133))

(assert (=> b!495961 m!477123))

(declare-fun m!477135 () Bool)

(assert (=> b!495961 m!477135))

(assert (=> b!495961 m!477123))

(declare-fun m!477137 () Bool)

(assert (=> b!495961 m!477137))

(assert (=> b!495961 m!477133))

(declare-fun m!477139 () Bool)

(assert (=> b!495961 m!477139))

(assert (=> b!495961 m!477133))

(declare-fun m!477141 () Bool)

(assert (=> b!495961 m!477141))

(declare-fun m!477143 () Bool)

(assert (=> b!495963 m!477143))

(assert (=> b!495963 m!477123))

(assert (=> b!495965 m!477123))

(assert (=> b!495965 m!477123))

(declare-fun m!477145 () Bool)

(assert (=> b!495965 m!477145))

(declare-fun m!477147 () Bool)

(assert (=> b!495958 m!477147))

(declare-fun m!477149 () Bool)

(assert (=> start!45190 m!477149))

(declare-fun m!477151 () Bool)

(assert (=> start!45190 m!477151))

(declare-fun m!477153 () Bool)

(assert (=> b!495967 m!477153))

(declare-fun m!477155 () Bool)

(assert (=> b!495968 m!477155))

(declare-fun m!477157 () Bool)

(assert (=> b!495966 m!477157))

(push 1)

