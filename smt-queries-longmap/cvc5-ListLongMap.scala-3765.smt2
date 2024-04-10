; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51584 () Bool)

(assert start!51584)

(declare-fun b!564466 () Bool)

(declare-fun res!355619 () Bool)

(declare-fun e!325129 () Bool)

(assert (=> b!564466 (=> (not res!355619) (not e!325129))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!564466 (= res!355619 (validKeyInArray!0 k!1914))))

(declare-fun b!564467 () Bool)

(declare-fun e!325131 () Bool)

(assert (=> b!564467 (= e!325129 e!325131)))

(declare-fun res!355624 () Bool)

(assert (=> b!564467 (=> (not res!355624) (not e!325131))))

(declare-datatypes ((SeekEntryResult!5474 0))(
  ( (MissingZero!5474 (index!24123 (_ BitVec 32))) (Found!5474 (index!24124 (_ BitVec 32))) (Intermediate!5474 (undefined!6286 Bool) (index!24125 (_ BitVec 32)) (x!53001 (_ BitVec 32))) (Undefined!5474) (MissingVacant!5474 (index!24126 (_ BitVec 32))) )
))
(declare-fun lt!257539 () SeekEntryResult!5474)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!564467 (= res!355624 (or (= lt!257539 (MissingZero!5474 i!1132)) (= lt!257539 (MissingVacant!5474 i!1132))))))

(declare-datatypes ((array!35449 0))(
  ( (array!35450 (arr!17025 (Array (_ BitVec 32) (_ BitVec 64))) (size!17389 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35449)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35449 (_ BitVec 32)) SeekEntryResult!5474)

(assert (=> b!564467 (= lt!257539 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!564468 () Bool)

(declare-fun res!355618 () Bool)

(assert (=> b!564468 (=> (not res!355618) (not e!325131))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35449 (_ BitVec 32)) Bool)

(assert (=> b!564468 (= res!355618 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!564469 () Bool)

(declare-fun res!355623 () Bool)

(assert (=> b!564469 (=> (not res!355623) (not e!325129))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!564469 (= res!355623 (and (= (size!17389 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17389 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17389 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!564470 () Bool)

(assert (=> b!564470 (= e!325131 false)))

(declare-fun lt!257538 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!564470 (= lt!257538 (toIndex!0 (select (store (arr!17025 a!3118) i!1132 k!1914) j!142) mask!3119))))

(declare-fun b!564471 () Bool)

(declare-fun res!355621 () Bool)

(assert (=> b!564471 (=> (not res!355621) (not e!325129))))

(assert (=> b!564471 (= res!355621 (validKeyInArray!0 (select (arr!17025 a!3118) j!142)))))

(declare-fun b!564472 () Bool)

(declare-fun res!355620 () Bool)

(assert (=> b!564472 (=> (not res!355620) (not e!325131))))

(declare-datatypes ((List!11105 0))(
  ( (Nil!11102) (Cons!11101 (h!12104 (_ BitVec 64)) (t!17333 List!11105)) )
))
(declare-fun arrayNoDuplicates!0 (array!35449 (_ BitVec 32) List!11105) Bool)

(assert (=> b!564472 (= res!355620 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11102))))

(declare-fun b!564473 () Bool)

(declare-fun res!355622 () Bool)

(assert (=> b!564473 (=> (not res!355622) (not e!325129))))

(declare-fun arrayContainsKey!0 (array!35449 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!564473 (= res!355622 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun res!355625 () Bool)

(assert (=> start!51584 (=> (not res!355625) (not e!325129))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51584 (= res!355625 (validMask!0 mask!3119))))

(assert (=> start!51584 e!325129))

(assert (=> start!51584 true))

(declare-fun array_inv!12821 (array!35449) Bool)

(assert (=> start!51584 (array_inv!12821 a!3118)))

(assert (= (and start!51584 res!355625) b!564469))

(assert (= (and b!564469 res!355623) b!564471))

(assert (= (and b!564471 res!355621) b!564466))

(assert (= (and b!564466 res!355619) b!564473))

(assert (= (and b!564473 res!355622) b!564467))

(assert (= (and b!564467 res!355624) b!564468))

(assert (= (and b!564468 res!355618) b!564472))

(assert (= (and b!564472 res!355620) b!564470))

(declare-fun m!542889 () Bool)

(assert (=> b!564466 m!542889))

(declare-fun m!542891 () Bool)

(assert (=> b!564471 m!542891))

(assert (=> b!564471 m!542891))

(declare-fun m!542893 () Bool)

(assert (=> b!564471 m!542893))

(declare-fun m!542895 () Bool)

(assert (=> start!51584 m!542895))

(declare-fun m!542897 () Bool)

(assert (=> start!51584 m!542897))

(declare-fun m!542899 () Bool)

(assert (=> b!564472 m!542899))

(declare-fun m!542901 () Bool)

(assert (=> b!564473 m!542901))

(declare-fun m!542903 () Bool)

(assert (=> b!564470 m!542903))

(declare-fun m!542905 () Bool)

(assert (=> b!564470 m!542905))

(assert (=> b!564470 m!542905))

(declare-fun m!542907 () Bool)

(assert (=> b!564470 m!542907))

(declare-fun m!542909 () Bool)

(assert (=> b!564467 m!542909))

(declare-fun m!542911 () Bool)

(assert (=> b!564468 m!542911))

(push 1)

