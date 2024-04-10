; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49192 () Bool)

(assert start!49192)

(declare-fun b!541676 () Bool)

(declare-fun res!336406 () Bool)

(declare-fun e!313631 () Bool)

(assert (=> b!541676 (=> (not res!336406) (not e!313631))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34251 0))(
  ( (array!34252 (arr!16460 (Array (_ BitVec 32) (_ BitVec 64))) (size!16824 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34251)

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(assert (=> b!541676 (= res!336406 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16824 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16824 a!3154)) (= (select (arr!16460 a!3154) resIndex!32) (select (arr!16460 a!3154) j!147))))))

(declare-fun b!541677 () Bool)

(declare-fun res!336404 () Bool)

(declare-fun e!313630 () Bool)

(assert (=> b!541677 (=> (not res!336404) (not e!313630))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!541677 (= res!336404 (validKeyInArray!0 (select (arr!16460 a!3154) j!147)))))

(declare-fun b!541679 () Bool)

(assert (=> b!541679 (= e!313631 false)))

(declare-datatypes ((SeekEntryResult!4918 0))(
  ( (MissingZero!4918 (index!21896 (_ BitVec 32))) (Found!4918 (index!21897 (_ BitVec 32))) (Intermediate!4918 (undefined!5730 Bool) (index!21898 (_ BitVec 32)) (x!50807 (_ BitVec 32))) (Undefined!4918) (MissingVacant!4918 (index!21899 (_ BitVec 32))) )
))
(declare-fun lt!247711 () SeekEntryResult!4918)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34251 (_ BitVec 32)) SeekEntryResult!4918)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!541679 (= lt!247711 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16460 a!3154) j!147) mask!3216) (select (arr!16460 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!541680 () Bool)

(declare-fun res!336408 () Bool)

(assert (=> b!541680 (=> (not res!336408) (not e!313631))))

(declare-datatypes ((List!10579 0))(
  ( (Nil!10576) (Cons!10575 (h!11527 (_ BitVec 64)) (t!16807 List!10579)) )
))
(declare-fun arrayNoDuplicates!0 (array!34251 (_ BitVec 32) List!10579) Bool)

(assert (=> b!541680 (= res!336408 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10576))))

(declare-fun b!541681 () Bool)

(declare-fun res!336410 () Bool)

(assert (=> b!541681 (=> (not res!336410) (not e!313631))))

(assert (=> b!541681 (= res!336410 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16460 a!3154) j!147) a!3154 mask!3216) (Intermediate!4918 false resIndex!32 resX!32)))))

(declare-fun b!541682 () Bool)

(declare-fun res!336411 () Bool)

(assert (=> b!541682 (=> (not res!336411) (not e!313630))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!541682 (= res!336411 (and (= (size!16824 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16824 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16824 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!541683 () Bool)

(declare-fun res!336413 () Bool)

(assert (=> b!541683 (=> (not res!336413) (not e!313630))))

(declare-fun k!1998 () (_ BitVec 64))

(assert (=> b!541683 (= res!336413 (validKeyInArray!0 k!1998))))

(declare-fun b!541678 () Bool)

(declare-fun res!336407 () Bool)

(assert (=> b!541678 (=> (not res!336407) (not e!313630))))

(declare-fun arrayContainsKey!0 (array!34251 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!541678 (= res!336407 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun res!336405 () Bool)

(assert (=> start!49192 (=> (not res!336405) (not e!313630))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49192 (= res!336405 (validMask!0 mask!3216))))

(assert (=> start!49192 e!313630))

(assert (=> start!49192 true))

(declare-fun array_inv!12256 (array!34251) Bool)

(assert (=> start!49192 (array_inv!12256 a!3154)))

(declare-fun b!541684 () Bool)

(declare-fun res!336412 () Bool)

(assert (=> b!541684 (=> (not res!336412) (not e!313631))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34251 (_ BitVec 32)) Bool)

(assert (=> b!541684 (= res!336412 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!541685 () Bool)

(assert (=> b!541685 (= e!313630 e!313631)))

(declare-fun res!336409 () Bool)

(assert (=> b!541685 (=> (not res!336409) (not e!313631))))

(declare-fun lt!247710 () SeekEntryResult!4918)

(assert (=> b!541685 (= res!336409 (or (= lt!247710 (MissingZero!4918 i!1153)) (= lt!247710 (MissingVacant!4918 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34251 (_ BitVec 32)) SeekEntryResult!4918)

(assert (=> b!541685 (= lt!247710 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(assert (= (and start!49192 res!336405) b!541682))

(assert (= (and b!541682 res!336411) b!541677))

(assert (= (and b!541677 res!336404) b!541683))

(assert (= (and b!541683 res!336413) b!541678))

(assert (= (and b!541678 res!336407) b!541685))

(assert (= (and b!541685 res!336409) b!541684))

(assert (= (and b!541684 res!336412) b!541680))

(assert (= (and b!541680 res!336408) b!541676))

(assert (= (and b!541676 res!336406) b!541681))

(assert (= (and b!541681 res!336410) b!541679))

(declare-fun m!520129 () Bool)

(assert (=> b!541684 m!520129))

(declare-fun m!520131 () Bool)

(assert (=> b!541676 m!520131))

(declare-fun m!520133 () Bool)

(assert (=> b!541676 m!520133))

(declare-fun m!520135 () Bool)

(assert (=> start!49192 m!520135))

(declare-fun m!520137 () Bool)

(assert (=> start!49192 m!520137))

(declare-fun m!520139 () Bool)

(assert (=> b!541680 m!520139))

(assert (=> b!541679 m!520133))

(assert (=> b!541679 m!520133))

(declare-fun m!520141 () Bool)

(assert (=> b!541679 m!520141))

(assert (=> b!541679 m!520141))

(assert (=> b!541679 m!520133))

(declare-fun m!520143 () Bool)

(assert (=> b!541679 m!520143))

(declare-fun m!520145 () Bool)

(assert (=> b!541685 m!520145))

(declare-fun m!520147 () Bool)

(assert (=> b!541678 m!520147))

(declare-fun m!520149 () Bool)

(assert (=> b!541683 m!520149))

(assert (=> b!541677 m!520133))

(assert (=> b!541677 m!520133))

(declare-fun m!520151 () Bool)

(assert (=> b!541677 m!520151))

(assert (=> b!541681 m!520133))

(assert (=> b!541681 m!520133))

(declare-fun m!520153 () Bool)

(assert (=> b!541681 m!520153))

(push 1)

(assert (not b!541685))

(assert (not b!541683))

(assert (not b!541680))

(assert (not b!541684))

(assert (not b!541679))

(assert (not b!541677))

(assert (not b!541678))

(assert (not b!541681))

