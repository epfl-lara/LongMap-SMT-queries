; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69200 () Bool)

(assert start!69200)

(declare-fun b!807140 () Bool)

(declare-fun e!446916 () Bool)

(declare-fun e!446915 () Bool)

(assert (=> b!807140 (= e!446916 e!446915)))

(declare-fun res!551266 () Bool)

(assert (=> b!807140 (=> (not res!551266) (not e!446915))))

(declare-datatypes ((SeekEntryResult!8618 0))(
  ( (MissingZero!8618 (index!36840 (_ BitVec 32))) (Found!8618 (index!36841 (_ BitVec 32))) (Intermediate!8618 (undefined!9430 Bool) (index!36842 (_ BitVec 32)) (x!67654 (_ BitVec 32))) (Undefined!8618) (MissingVacant!8618 (index!36843 (_ BitVec 32))) )
))
(declare-fun lt!361566 () SeekEntryResult!8618)

(declare-datatypes ((array!43900 0))(
  ( (array!43901 (arr!21027 (Array (_ BitVec 32) (_ BitVec 64))) (size!21448 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43900)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun lt!361569 () SeekEntryResult!8618)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!807140 (= res!551266 (and (= lt!361569 lt!361566) (= lt!361566 (Found!8618 j!153)) (not (= (select (arr!21027 a!3170) index!1236) (select (arr!21027 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43900 (_ BitVec 32)) SeekEntryResult!8618)

(assert (=> b!807140 (= lt!361566 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21027 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43900 (_ BitVec 32)) SeekEntryResult!8618)

(assert (=> b!807140 (= lt!361569 (seekEntryOrOpen!0 (select (arr!21027 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!807141 () Bool)

(declare-fun res!551272 () Bool)

(declare-fun e!446917 () Bool)

(assert (=> b!807141 (=> (not res!551272) (not e!446917))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!807141 (= res!551272 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21448 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21027 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21448 a!3170)) (= (select (arr!21027 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!807142 () Bool)

(assert (=> b!807142 (= e!446915 false)))

(declare-fun lt!361570 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!807142 (= lt!361570 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!807143 () Bool)

(declare-fun e!446918 () Bool)

(assert (=> b!807143 (= e!446918 e!446917)))

(declare-fun res!551271 () Bool)

(assert (=> b!807143 (=> (not res!551271) (not e!446917))))

(declare-fun lt!361568 () SeekEntryResult!8618)

(assert (=> b!807143 (= res!551271 (or (= lt!361568 (MissingZero!8618 i!1163)) (= lt!361568 (MissingVacant!8618 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(assert (=> b!807143 (= lt!361568 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!807144 () Bool)

(declare-fun res!551263 () Bool)

(assert (=> b!807144 (=> (not res!551263) (not e!446918))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!807144 (= res!551263 (validKeyInArray!0 k!2044))))

(declare-fun res!551269 () Bool)

(assert (=> start!69200 (=> (not res!551269) (not e!446918))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69200 (= res!551269 (validMask!0 mask!3266))))

(assert (=> start!69200 e!446918))

(assert (=> start!69200 true))

(declare-fun array_inv!16823 (array!43900) Bool)

(assert (=> start!69200 (array_inv!16823 a!3170)))

(declare-fun b!807145 () Bool)

(declare-fun res!551265 () Bool)

(assert (=> b!807145 (=> (not res!551265) (not e!446918))))

(declare-fun arrayContainsKey!0 (array!43900 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!807145 (= res!551265 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!807146 () Bool)

(declare-fun res!551264 () Bool)

(assert (=> b!807146 (=> (not res!551264) (not e!446918))))

(assert (=> b!807146 (= res!551264 (and (= (size!21448 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21448 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21448 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!807147 () Bool)

(declare-fun res!551270 () Bool)

(assert (=> b!807147 (=> (not res!551270) (not e!446917))))

(declare-datatypes ((List!14990 0))(
  ( (Nil!14987) (Cons!14986 (h!16115 (_ BitVec 64)) (t!21305 List!14990)) )
))
(declare-fun arrayNoDuplicates!0 (array!43900 (_ BitVec 32) List!14990) Bool)

(assert (=> b!807147 (= res!551270 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14987))))

(declare-fun b!807148 () Bool)

(declare-fun res!551267 () Bool)

(assert (=> b!807148 (=> (not res!551267) (not e!446917))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43900 (_ BitVec 32)) Bool)

(assert (=> b!807148 (= res!551267 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!807149 () Bool)

(assert (=> b!807149 (= e!446917 e!446916)))

(declare-fun res!551268 () Bool)

(assert (=> b!807149 (=> (not res!551268) (not e!446916))))

(declare-fun lt!361567 () (_ BitVec 64))

(declare-fun lt!361571 () array!43900)

(assert (=> b!807149 (= res!551268 (= (seekEntryOrOpen!0 lt!361567 lt!361571 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!361567 lt!361571 mask!3266)))))

(assert (=> b!807149 (= lt!361567 (select (store (arr!21027 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!807149 (= lt!361571 (array!43901 (store (arr!21027 a!3170) i!1163 k!2044) (size!21448 a!3170)))))

(declare-fun b!807150 () Bool)

(declare-fun res!551273 () Bool)

(assert (=> b!807150 (=> (not res!551273) (not e!446918))))

(assert (=> b!807150 (= res!551273 (validKeyInArray!0 (select (arr!21027 a!3170) j!153)))))

(assert (= (and start!69200 res!551269) b!807146))

(assert (= (and b!807146 res!551264) b!807150))

(assert (= (and b!807150 res!551273) b!807144))

(assert (= (and b!807144 res!551263) b!807145))

(assert (= (and b!807145 res!551265) b!807143))

(assert (= (and b!807143 res!551271) b!807148))

(assert (= (and b!807148 res!551267) b!807147))

(assert (= (and b!807147 res!551270) b!807141))

(assert (= (and b!807141 res!551272) b!807149))

(assert (= (and b!807149 res!551268) b!807140))

(assert (= (and b!807140 res!551266) b!807142))

(declare-fun m!749129 () Bool)

(assert (=> b!807147 m!749129))

(declare-fun m!749131 () Bool)

(assert (=> b!807150 m!749131))

(assert (=> b!807150 m!749131))

(declare-fun m!749133 () Bool)

(assert (=> b!807150 m!749133))

(declare-fun m!749135 () Bool)

(assert (=> b!807145 m!749135))

(declare-fun m!749137 () Bool)

(assert (=> b!807140 m!749137))

(assert (=> b!807140 m!749131))

(assert (=> b!807140 m!749131))

(declare-fun m!749139 () Bool)

(assert (=> b!807140 m!749139))

(assert (=> b!807140 m!749131))

(declare-fun m!749141 () Bool)

(assert (=> b!807140 m!749141))

(declare-fun m!749143 () Bool)

(assert (=> b!807141 m!749143))

(declare-fun m!749145 () Bool)

(assert (=> b!807141 m!749145))

(declare-fun m!749147 () Bool)

(assert (=> start!69200 m!749147))

(declare-fun m!749149 () Bool)

(assert (=> start!69200 m!749149))

(declare-fun m!749151 () Bool)

(assert (=> b!807148 m!749151))

(declare-fun m!749153 () Bool)

(assert (=> b!807144 m!749153))

(declare-fun m!749155 () Bool)

(assert (=> b!807142 m!749155))

(declare-fun m!749157 () Bool)

(assert (=> b!807143 m!749157))

(declare-fun m!749159 () Bool)

(assert (=> b!807149 m!749159))

(declare-fun m!749161 () Bool)

(assert (=> b!807149 m!749161))

(declare-fun m!749163 () Bool)

(assert (=> b!807149 m!749163))

(declare-fun m!749165 () Bool)

(assert (=> b!807149 m!749165))

(push 1)

