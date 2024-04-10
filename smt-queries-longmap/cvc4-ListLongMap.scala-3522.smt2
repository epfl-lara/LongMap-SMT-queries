; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48706 () Bool)

(assert start!48706)

(declare-fun b!535329 () Bool)

(declare-fun res!330545 () Bool)

(declare-fun e!311002 () Bool)

(assert (=> b!535329 (=> (not res!330545) (not e!311002))))

(declare-datatypes ((array!33918 0))(
  ( (array!33919 (arr!16298 (Array (_ BitVec 32) (_ BitVec 64))) (size!16662 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33918)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!535329 (= res!330545 (validKeyInArray!0 (select (arr!16298 a!3154) j!147)))))

(declare-fun b!535330 () Bool)

(declare-fun res!330539 () Bool)

(assert (=> b!535330 (=> (not res!330539) (not e!311002))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33918 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!535330 (= res!330539 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!535331 () Bool)

(declare-fun res!330534 () Bool)

(declare-fun e!311001 () Bool)

(assert (=> b!535331 (=> (not res!330534) (not e!311001))))

(declare-datatypes ((List!10417 0))(
  ( (Nil!10414) (Cons!10413 (h!11356 (_ BitVec 64)) (t!16645 List!10417)) )
))
(declare-fun arrayNoDuplicates!0 (array!33918 (_ BitVec 32) List!10417) Bool)

(assert (=> b!535331 (= res!330534 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10414))))

(declare-fun b!535332 () Bool)

(declare-fun e!311003 () Bool)

(assert (=> b!535332 (= e!311001 e!311003)))

(declare-fun res!330540 () Bool)

(assert (=> b!535332 (=> (not res!330540) (not e!311003))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4756 0))(
  ( (MissingZero!4756 (index!21248 (_ BitVec 32))) (Found!4756 (index!21249 (_ BitVec 32))) (Intermediate!4756 (undefined!5568 Bool) (index!21250 (_ BitVec 32)) (x!50195 (_ BitVec 32))) (Undefined!4756) (MissingVacant!4756 (index!21251 (_ BitVec 32))) )
))
(declare-fun lt!245802 () SeekEntryResult!4756)

(assert (=> b!535332 (= res!330540 (= lt!245802 (Intermediate!4756 false resIndex!32 resX!32)))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33918 (_ BitVec 32)) SeekEntryResult!4756)

(assert (=> b!535332 (= lt!245802 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16298 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!535334 () Bool)

(declare-fun res!330535 () Bool)

(assert (=> b!535334 (=> (not res!330535) (not e!311001))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33918 (_ BitVec 32)) Bool)

(assert (=> b!535334 (= res!330535 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!535335 () Bool)

(assert (=> b!535335 (= e!311002 e!311001)))

(declare-fun res!330543 () Bool)

(assert (=> b!535335 (=> (not res!330543) (not e!311001))))

(declare-fun lt!245803 () SeekEntryResult!4756)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!535335 (= res!330543 (or (= lt!245803 (MissingZero!4756 i!1153)) (= lt!245803 (MissingVacant!4756 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33918 (_ BitVec 32)) SeekEntryResult!4756)

(assert (=> b!535335 (= lt!245803 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!535336 () Bool)

(declare-fun res!330542 () Bool)

(assert (=> b!535336 (=> (not res!330542) (not e!311002))))

(assert (=> b!535336 (= res!330542 (and (= (size!16662 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16662 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16662 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!535337 () Bool)

(assert (=> b!535337 (= e!311003 (not (validKeyInArray!0 (select (store (arr!16298 a!3154) i!1153 k!1998) j!147))))))

(declare-fun b!535338 () Bool)

(declare-fun res!330538 () Bool)

(assert (=> b!535338 (=> (not res!330538) (not e!311002))))

(assert (=> b!535338 (= res!330538 (validKeyInArray!0 k!1998))))

(declare-fun res!330537 () Bool)

(assert (=> start!48706 (=> (not res!330537) (not e!311002))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48706 (= res!330537 (validMask!0 mask!3216))))

(assert (=> start!48706 e!311002))

(assert (=> start!48706 true))

(declare-fun array_inv!12094 (array!33918) Bool)

(assert (=> start!48706 (array_inv!12094 a!3154)))

(declare-fun b!535333 () Bool)

(declare-fun res!330541 () Bool)

(assert (=> b!535333 (=> (not res!330541) (not e!311003))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!535333 (= res!330541 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16298 a!3154) j!147) mask!3216) (select (arr!16298 a!3154) j!147) a!3154 mask!3216) lt!245802))))

(declare-fun b!535339 () Bool)

(declare-fun res!330536 () Bool)

(assert (=> b!535339 (=> (not res!330536) (not e!311003))))

(assert (=> b!535339 (= res!330536 (and (not (= (select (arr!16298 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16298 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16298 a!3154) index!1177) (select (arr!16298 a!3154) j!147)) (= index!1177 resIndex!32) (bvsge mask!3216 #b00000000000000000000000000000000) (bvslt index!1177 (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsle x!1030 #b01111111111111111111111111111110)))))

(declare-fun b!535340 () Bool)

(declare-fun res!330544 () Bool)

(assert (=> b!535340 (=> (not res!330544) (not e!311001))))

(assert (=> b!535340 (= res!330544 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16662 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16662 a!3154)) (= (select (arr!16298 a!3154) resIndex!32) (select (arr!16298 a!3154) j!147))))))

(assert (= (and start!48706 res!330537) b!535336))

(assert (= (and b!535336 res!330542) b!535329))

(assert (= (and b!535329 res!330545) b!535338))

(assert (= (and b!535338 res!330538) b!535330))

(assert (= (and b!535330 res!330539) b!535335))

(assert (= (and b!535335 res!330543) b!535334))

(assert (= (and b!535334 res!330535) b!535331))

(assert (= (and b!535331 res!330534) b!535340))

(assert (= (and b!535340 res!330544) b!535332))

(assert (= (and b!535332 res!330540) b!535333))

(assert (= (and b!535333 res!330541) b!535339))

(assert (= (and b!535339 res!330536) b!535337))

(declare-fun m!514925 () Bool)

(assert (=> b!535331 m!514925))

(declare-fun m!514927 () Bool)

(assert (=> b!535337 m!514927))

(declare-fun m!514929 () Bool)

(assert (=> b!535337 m!514929))

(assert (=> b!535337 m!514929))

(declare-fun m!514931 () Bool)

(assert (=> b!535337 m!514931))

(declare-fun m!514933 () Bool)

(assert (=> b!535330 m!514933))

(declare-fun m!514935 () Bool)

(assert (=> b!535333 m!514935))

(assert (=> b!535333 m!514935))

(declare-fun m!514937 () Bool)

(assert (=> b!535333 m!514937))

(assert (=> b!535333 m!514937))

(assert (=> b!535333 m!514935))

(declare-fun m!514939 () Bool)

(assert (=> b!535333 m!514939))

(declare-fun m!514941 () Bool)

(assert (=> b!535340 m!514941))

(assert (=> b!535340 m!514935))

(declare-fun m!514943 () Bool)

(assert (=> start!48706 m!514943))

(declare-fun m!514945 () Bool)

(assert (=> start!48706 m!514945))

(declare-fun m!514947 () Bool)

(assert (=> b!535338 m!514947))

(declare-fun m!514949 () Bool)

(assert (=> b!535335 m!514949))

(declare-fun m!514951 () Bool)

(assert (=> b!535334 m!514951))

(assert (=> b!535332 m!514935))

(assert (=> b!535332 m!514935))

(declare-fun m!514953 () Bool)

(assert (=> b!535332 m!514953))

(assert (=> b!535329 m!514935))

(assert (=> b!535329 m!514935))

(declare-fun m!514955 () Bool)

(assert (=> b!535329 m!514955))

(declare-fun m!514957 () Bool)

(assert (=> b!535339 m!514957))

(assert (=> b!535339 m!514935))

(push 1)

(assert (not b!535330))

(assert (not b!535334))

(assert (not b!535337))

(assert (not b!535335))

(assert (not b!535333))

(assert (not b!535329))

(assert (not b!535338))

(assert (not start!48706))

(assert (not b!535331))

