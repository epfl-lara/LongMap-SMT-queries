; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48684 () Bool)

(assert start!48684)

(declare-fun b!534965 () Bool)

(declare-fun e!310878 () Bool)

(assert (=> b!534965 (= e!310878 false)))

(declare-datatypes ((SeekEntryResult!4745 0))(
  ( (MissingZero!4745 (index!21204 (_ BitVec 32))) (Found!4745 (index!21205 (_ BitVec 32))) (Intermediate!4745 (undefined!5557 Bool) (index!21206 (_ BitVec 32)) (x!50160 (_ BitVec 32))) (Undefined!4745) (MissingVacant!4745 (index!21207 (_ BitVec 32))) )
))
(declare-fun lt!245737 () SeekEntryResult!4745)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33896 0))(
  ( (array!33897 (arr!16287 (Array (_ BitVec 32) (_ BitVec 64))) (size!16651 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33896)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33896 (_ BitVec 32)) SeekEntryResult!4745)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!534965 (= lt!245737 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16287 a!3154) j!147) mask!3216) (select (arr!16287 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!534966 () Bool)

(declare-fun res!330178 () Bool)

(declare-fun e!310876 () Bool)

(assert (=> b!534966 (=> (not res!330178) (not e!310876))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!534966 (= res!330178 (validKeyInArray!0 k!1998))))

(declare-fun b!534967 () Bool)

(declare-fun res!330176 () Bool)

(assert (=> b!534967 (=> (not res!330176) (not e!310878))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!534967 (= res!330176 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16287 a!3154) j!147) a!3154 mask!3216) (Intermediate!4745 false resIndex!32 resX!32)))))

(declare-fun b!534968 () Bool)

(declare-fun res!330170 () Bool)

(assert (=> b!534968 (=> (not res!330170) (not e!310876))))

(assert (=> b!534968 (= res!330170 (validKeyInArray!0 (select (arr!16287 a!3154) j!147)))))

(declare-fun b!534969 () Bool)

(declare-fun res!330177 () Bool)

(assert (=> b!534969 (=> (not res!330177) (not e!310878))))

(declare-datatypes ((List!10406 0))(
  ( (Nil!10403) (Cons!10402 (h!11345 (_ BitVec 64)) (t!16634 List!10406)) )
))
(declare-fun arrayNoDuplicates!0 (array!33896 (_ BitVec 32) List!10406) Bool)

(assert (=> b!534969 (= res!330177 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10403))))

(declare-fun b!534971 () Bool)

(declare-fun res!330174 () Bool)

(assert (=> b!534971 (=> (not res!330174) (not e!310876))))

(declare-fun arrayContainsKey!0 (array!33896 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!534971 (= res!330174 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!534972 () Bool)

(declare-fun res!330175 () Bool)

(assert (=> b!534972 (=> (not res!330175) (not e!310878))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33896 (_ BitVec 32)) Bool)

(assert (=> b!534972 (= res!330175 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!534973 () Bool)

(declare-fun res!330179 () Bool)

(assert (=> b!534973 (=> (not res!330179) (not e!310878))))

(assert (=> b!534973 (= res!330179 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16651 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16651 a!3154)) (= (select (arr!16287 a!3154) resIndex!32) (select (arr!16287 a!3154) j!147))))))

(declare-fun b!534974 () Bool)

(assert (=> b!534974 (= e!310876 e!310878)))

(declare-fun res!330173 () Bool)

(assert (=> b!534974 (=> (not res!330173) (not e!310878))))

(declare-fun lt!245736 () SeekEntryResult!4745)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!534974 (= res!330173 (or (= lt!245736 (MissingZero!4745 i!1153)) (= lt!245736 (MissingVacant!4745 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33896 (_ BitVec 32)) SeekEntryResult!4745)

(assert (=> b!534974 (= lt!245736 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!534970 () Bool)

(declare-fun res!330172 () Bool)

(assert (=> b!534970 (=> (not res!330172) (not e!310876))))

(assert (=> b!534970 (= res!330172 (and (= (size!16651 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16651 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16651 a!3154)) (not (= i!1153 j!147))))))

(declare-fun res!330171 () Bool)

(assert (=> start!48684 (=> (not res!330171) (not e!310876))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48684 (= res!330171 (validMask!0 mask!3216))))

(assert (=> start!48684 e!310876))

(assert (=> start!48684 true))

(declare-fun array_inv!12083 (array!33896) Bool)

(assert (=> start!48684 (array_inv!12083 a!3154)))

(assert (= (and start!48684 res!330171) b!534970))

(assert (= (and b!534970 res!330172) b!534968))

(assert (= (and b!534968 res!330170) b!534966))

(assert (= (and b!534966 res!330178) b!534971))

(assert (= (and b!534971 res!330174) b!534974))

(assert (= (and b!534974 res!330173) b!534972))

(assert (= (and b!534972 res!330175) b!534969))

(assert (= (and b!534969 res!330177) b!534973))

(assert (= (and b!534973 res!330179) b!534967))

(assert (= (and b!534967 res!330176) b!534965))

(declare-fun m!514611 () Bool)

(assert (=> b!534969 m!514611))

(declare-fun m!514613 () Bool)

(assert (=> b!534973 m!514613))

(declare-fun m!514615 () Bool)

(assert (=> b!534973 m!514615))

(assert (=> b!534968 m!514615))

(assert (=> b!534968 m!514615))

(declare-fun m!514617 () Bool)

(assert (=> b!534968 m!514617))

(declare-fun m!514619 () Bool)

(assert (=> start!48684 m!514619))

(declare-fun m!514621 () Bool)

(assert (=> start!48684 m!514621))

(declare-fun m!514623 () Bool)

(assert (=> b!534974 m!514623))

(declare-fun m!514625 () Bool)

(assert (=> b!534966 m!514625))

(assert (=> b!534967 m!514615))

(assert (=> b!534967 m!514615))

(declare-fun m!514627 () Bool)

(assert (=> b!534967 m!514627))

(declare-fun m!514629 () Bool)

(assert (=> b!534971 m!514629))

(declare-fun m!514631 () Bool)

(assert (=> b!534972 m!514631))

(assert (=> b!534965 m!514615))

(assert (=> b!534965 m!514615))

(declare-fun m!514633 () Bool)

(assert (=> b!534965 m!514633))

(assert (=> b!534965 m!514633))

(assert (=> b!534965 m!514615))

(declare-fun m!514635 () Bool)

(assert (=> b!534965 m!514635))

(push 1)

