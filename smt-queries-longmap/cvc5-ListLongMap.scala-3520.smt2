; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48690 () Bool)

(assert start!48690)

(declare-fun b!535057 () Bool)

(declare-fun res!330262 () Bool)

(declare-fun e!310905 () Bool)

(assert (=> b!535057 (=> (not res!330262) (not e!310905))))

(declare-datatypes ((array!33902 0))(
  ( (array!33903 (arr!16290 (Array (_ BitVec 32) (_ BitVec 64))) (size!16654 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33902)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33902 (_ BitVec 32)) Bool)

(assert (=> b!535057 (= res!330262 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!535058 () Bool)

(declare-fun e!310908 () Bool)

(assert (=> b!535058 (= e!310905 e!310908)))

(declare-fun res!330267 () Bool)

(assert (=> b!535058 (=> (not res!330267) (not e!310908))))

(declare-datatypes ((SeekEntryResult!4748 0))(
  ( (MissingZero!4748 (index!21216 (_ BitVec 32))) (Found!4748 (index!21217 (_ BitVec 32))) (Intermediate!4748 (undefined!5560 Bool) (index!21218 (_ BitVec 32)) (x!50171 (_ BitVec 32))) (Undefined!4748) (MissingVacant!4748 (index!21219 (_ BitVec 32))) )
))
(declare-fun lt!245754 () SeekEntryResult!4748)

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!535058 (= res!330267 (= lt!245754 (Intermediate!4748 false resIndex!32 resX!32)))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33902 (_ BitVec 32)) SeekEntryResult!4748)

(assert (=> b!535058 (= lt!245754 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16290 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!535059 () Bool)

(declare-fun res!330272 () Bool)

(declare-fun e!310907 () Bool)

(assert (=> b!535059 (=> (not res!330272) (not e!310907))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!535059 (= res!330272 (validKeyInArray!0 k!1998))))

(declare-fun b!535060 () Bool)

(assert (=> b!535060 (= e!310907 e!310905)))

(declare-fun res!330264 () Bool)

(assert (=> b!535060 (=> (not res!330264) (not e!310905))))

(declare-fun lt!245755 () SeekEntryResult!4748)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!535060 (= res!330264 (or (= lt!245755 (MissingZero!4748 i!1153)) (= lt!245755 (MissingVacant!4748 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33902 (_ BitVec 32)) SeekEntryResult!4748)

(assert (=> b!535060 (= lt!245755 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!535061 () Bool)

(assert (=> b!535061 (= e!310908 (and (not (= (select (arr!16290 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16290 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16290 a!3154) index!1177) (select (arr!16290 a!3154) j!147)) (= index!1177 resIndex!32) (bvsge mask!3216 #b00000000000000000000000000000000) (bvsge index!1177 (bvadd #b00000000000000000000000000000001 mask!3216))))))

(declare-fun res!330269 () Bool)

(assert (=> start!48690 (=> (not res!330269) (not e!310907))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48690 (= res!330269 (validMask!0 mask!3216))))

(assert (=> start!48690 e!310907))

(assert (=> start!48690 true))

(declare-fun array_inv!12086 (array!33902) Bool)

(assert (=> start!48690 (array_inv!12086 a!3154)))

(declare-fun b!535062 () Bool)

(declare-fun res!330271 () Bool)

(assert (=> b!535062 (=> (not res!330271) (not e!310905))))

(assert (=> b!535062 (= res!330271 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16654 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16654 a!3154)) (= (select (arr!16290 a!3154) resIndex!32) (select (arr!16290 a!3154) j!147))))))

(declare-fun b!535063 () Bool)

(declare-fun res!330270 () Bool)

(assert (=> b!535063 (=> (not res!330270) (not e!310907))))

(assert (=> b!535063 (= res!330270 (and (= (size!16654 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16654 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16654 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!535064 () Bool)

(declare-fun res!330268 () Bool)

(assert (=> b!535064 (=> (not res!330268) (not e!310905))))

(declare-datatypes ((List!10409 0))(
  ( (Nil!10406) (Cons!10405 (h!11348 (_ BitVec 64)) (t!16637 List!10409)) )
))
(declare-fun arrayNoDuplicates!0 (array!33902 (_ BitVec 32) List!10409) Bool)

(assert (=> b!535064 (= res!330268 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10406))))

(declare-fun b!535065 () Bool)

(declare-fun res!330265 () Bool)

(assert (=> b!535065 (=> (not res!330265) (not e!310907))))

(assert (=> b!535065 (= res!330265 (validKeyInArray!0 (select (arr!16290 a!3154) j!147)))))

(declare-fun b!535066 () Bool)

(declare-fun res!330263 () Bool)

(assert (=> b!535066 (=> (not res!330263) (not e!310907))))

(declare-fun arrayContainsKey!0 (array!33902 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!535066 (= res!330263 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!535067 () Bool)

(declare-fun res!330266 () Bool)

(assert (=> b!535067 (=> (not res!330266) (not e!310908))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!535067 (= res!330266 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16290 a!3154) j!147) mask!3216) (select (arr!16290 a!3154) j!147) a!3154 mask!3216) lt!245754))))

(assert (= (and start!48690 res!330269) b!535063))

(assert (= (and b!535063 res!330270) b!535065))

(assert (= (and b!535065 res!330265) b!535059))

(assert (= (and b!535059 res!330272) b!535066))

(assert (= (and b!535066 res!330263) b!535060))

(assert (= (and b!535060 res!330264) b!535057))

(assert (= (and b!535057 res!330262) b!535064))

(assert (= (and b!535064 res!330268) b!535062))

(assert (= (and b!535062 res!330271) b!535058))

(assert (= (and b!535058 res!330267) b!535067))

(assert (= (and b!535067 res!330266) b!535061))

(declare-fun m!514689 () Bool)

(assert (=> b!535062 m!514689))

(declare-fun m!514691 () Bool)

(assert (=> b!535062 m!514691))

(declare-fun m!514693 () Bool)

(assert (=> b!535064 m!514693))

(assert (=> b!535058 m!514691))

(assert (=> b!535058 m!514691))

(declare-fun m!514695 () Bool)

(assert (=> b!535058 m!514695))

(declare-fun m!514697 () Bool)

(assert (=> b!535061 m!514697))

(assert (=> b!535061 m!514691))

(declare-fun m!514699 () Bool)

(assert (=> b!535060 m!514699))

(declare-fun m!514701 () Bool)

(assert (=> b!535059 m!514701))

(assert (=> b!535067 m!514691))

(assert (=> b!535067 m!514691))

(declare-fun m!514703 () Bool)

(assert (=> b!535067 m!514703))

(assert (=> b!535067 m!514703))

(assert (=> b!535067 m!514691))

(declare-fun m!514705 () Bool)

(assert (=> b!535067 m!514705))

(assert (=> b!535065 m!514691))

(assert (=> b!535065 m!514691))

(declare-fun m!514707 () Bool)

(assert (=> b!535065 m!514707))

(declare-fun m!514709 () Bool)

(assert (=> start!48690 m!514709))

(declare-fun m!514711 () Bool)

(assert (=> start!48690 m!514711))

(declare-fun m!514713 () Bool)

(assert (=> b!535057 m!514713))

(declare-fun m!514715 () Bool)

(assert (=> b!535066 m!514715))

(push 1)

(assert (not b!535060))

(assert (not b!535059))

(assert (not b!535067))

(assert (not b!535058))

(assert (not b!535057))

(assert (not b!535065))

(assert (not b!535066))

(assert (not b!535064))

(assert (not start!48690))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

