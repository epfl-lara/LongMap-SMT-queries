; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48720 () Bool)

(assert start!48720)

(declare-fun b!535552 () Bool)

(declare-fun e!311079 () Bool)

(declare-fun e!311076 () Bool)

(assert (=> b!535552 (= e!311079 e!311076)))

(declare-fun res!330760 () Bool)

(assert (=> b!535552 (=> (not res!330760) (not e!311076))))

(declare-datatypes ((SeekEntryResult!4763 0))(
  ( (MissingZero!4763 (index!21276 (_ BitVec 32))) (Found!4763 (index!21277 (_ BitVec 32))) (Intermediate!4763 (undefined!5575 Bool) (index!21278 (_ BitVec 32)) (x!50226 (_ BitVec 32))) (Undefined!4763) (MissingVacant!4763 (index!21279 (_ BitVec 32))) )
))
(declare-fun lt!245845 () SeekEntryResult!4763)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!535552 (= res!330760 (or (= lt!245845 (MissingZero!4763 i!1153)) (= lt!245845 (MissingVacant!4763 i!1153))))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-datatypes ((array!33932 0))(
  ( (array!33933 (arr!16305 (Array (_ BitVec 32) (_ BitVec 64))) (size!16669 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33932)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33932 (_ BitVec 32)) SeekEntryResult!4763)

(assert (=> b!535552 (= lt!245845 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!535553 () Bool)

(declare-fun res!330759 () Bool)

(assert (=> b!535553 (=> (not res!330759) (not e!311079))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!535553 (= res!330759 (validKeyInArray!0 k!1998))))

(declare-fun res!330767 () Bool)

(assert (=> start!48720 (=> (not res!330767) (not e!311079))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48720 (= res!330767 (validMask!0 mask!3216))))

(assert (=> start!48720 e!311079))

(assert (=> start!48720 true))

(declare-fun array_inv!12101 (array!33932) Bool)

(assert (=> start!48720 (array_inv!12101 a!3154)))

(declare-fun b!535554 () Bool)

(declare-fun res!330764 () Bool)

(assert (=> b!535554 (=> (not res!330764) (not e!311079))))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!535554 (= res!330764 (and (= (size!16669 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16669 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16669 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!535555 () Bool)

(declare-fun res!330766 () Bool)

(assert (=> b!535555 (=> (not res!330766) (not e!311076))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33932 (_ BitVec 32)) Bool)

(assert (=> b!535555 (= res!330766 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!535556 () Bool)

(declare-fun res!330758 () Bool)

(assert (=> b!535556 (=> (not res!330758) (not e!311079))))

(assert (=> b!535556 (= res!330758 (validKeyInArray!0 (select (arr!16305 a!3154) j!147)))))

(declare-fun b!535557 () Bool)

(declare-fun res!330761 () Bool)

(assert (=> b!535557 (=> (not res!330761) (not e!311079))))

(declare-fun arrayContainsKey!0 (array!33932 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!535557 (= res!330761 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!535558 () Bool)

(declare-fun res!330765 () Bool)

(declare-fun e!311077 () Bool)

(assert (=> b!535558 (=> (not res!330765) (not e!311077))))

(declare-fun lt!245844 () SeekEntryResult!4763)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33932 (_ BitVec 32)) SeekEntryResult!4763)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!535558 (= res!330765 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16305 a!3154) j!147) mask!3216) (select (arr!16305 a!3154) j!147) a!3154 mask!3216) lt!245844))))

(declare-fun b!535559 () Bool)

(declare-fun res!330757 () Bool)

(assert (=> b!535559 (=> (not res!330757) (not e!311076))))

(declare-datatypes ((List!10424 0))(
  ( (Nil!10421) (Cons!10420 (h!11363 (_ BitVec 64)) (t!16652 List!10424)) )
))
(declare-fun arrayNoDuplicates!0 (array!33932 (_ BitVec 32) List!10424) Bool)

(assert (=> b!535559 (= res!330757 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10421))))

(declare-fun b!535560 () Bool)

(declare-fun res!330762 () Bool)

(assert (=> b!535560 (=> (not res!330762) (not e!311076))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(assert (=> b!535560 (= res!330762 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16669 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16669 a!3154)) (= (select (arr!16305 a!3154) resIndex!32) (select (arr!16305 a!3154) j!147))))))

(declare-fun b!535561 () Bool)

(assert (=> b!535561 (= e!311076 e!311077)))

(declare-fun res!330763 () Bool)

(assert (=> b!535561 (=> (not res!330763) (not e!311077))))

(assert (=> b!535561 (= res!330763 (= lt!245844 (Intermediate!4763 false resIndex!32 resX!32)))))

(assert (=> b!535561 (= lt!245844 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16305 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!535562 () Bool)

(assert (=> b!535562 (= e!311077 (and (not (= (select (arr!16305 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16305 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16305 a!3154) index!1177) (select (arr!16305 a!3154) j!147))) (bvsge mask!3216 #b00000000000000000000000000000000) (bvsge index!1177 (bvadd #b00000000000000000000000000000001 mask!3216))))))

(assert (= (and start!48720 res!330767) b!535554))

(assert (= (and b!535554 res!330764) b!535556))

(assert (= (and b!535556 res!330758) b!535553))

(assert (= (and b!535553 res!330759) b!535557))

(assert (= (and b!535557 res!330761) b!535552))

(assert (= (and b!535552 res!330760) b!535555))

(assert (= (and b!535555 res!330766) b!535559))

(assert (= (and b!535559 res!330757) b!535560))

(assert (= (and b!535560 res!330762) b!535561))

(assert (= (and b!535561 res!330763) b!535558))

(assert (= (and b!535558 res!330765) b!535562))

(declare-fun m!515121 () Bool)

(assert (=> b!535560 m!515121))

(declare-fun m!515123 () Bool)

(assert (=> b!535560 m!515123))

(declare-fun m!515125 () Bool)

(assert (=> b!535559 m!515125))

(declare-fun m!515127 () Bool)

(assert (=> b!535557 m!515127))

(assert (=> b!535556 m!515123))

(assert (=> b!535556 m!515123))

(declare-fun m!515129 () Bool)

(assert (=> b!535556 m!515129))

(declare-fun m!515131 () Bool)

(assert (=> b!535555 m!515131))

(assert (=> b!535558 m!515123))

(assert (=> b!535558 m!515123))

(declare-fun m!515133 () Bool)

(assert (=> b!535558 m!515133))

(assert (=> b!535558 m!515133))

(assert (=> b!535558 m!515123))

(declare-fun m!515135 () Bool)

(assert (=> b!535558 m!515135))

(declare-fun m!515137 () Bool)

(assert (=> b!535553 m!515137))

(declare-fun m!515139 () Bool)

(assert (=> b!535552 m!515139))

(declare-fun m!515141 () Bool)

(assert (=> b!535562 m!515141))

(assert (=> b!535562 m!515123))

(declare-fun m!515143 () Bool)

(assert (=> start!48720 m!515143))

(declare-fun m!515145 () Bool)

(assert (=> start!48720 m!515145))

(assert (=> b!535561 m!515123))

(assert (=> b!535561 m!515123))

(declare-fun m!515147 () Bool)

(assert (=> b!535561 m!515147))

(push 1)

(assert (not b!535561))

(assert (not start!48720))

(assert (not b!535557))

(assert (not b!535559))

(assert (not b!535553))

(assert (not b!535556))

(assert (not b!535552))

(assert (not b!535558))

(assert (not b!535555))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

