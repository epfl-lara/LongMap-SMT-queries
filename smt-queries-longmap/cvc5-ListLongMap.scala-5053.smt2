; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68812 () Bool)

(assert start!68812)

(declare-fun b!802167 () Bool)

(declare-fun res!546833 () Bool)

(declare-fun e!444552 () Bool)

(assert (=> b!802167 (=> (not res!546833) (not e!444552))))

(declare-datatypes ((array!43619 0))(
  ( (array!43620 (arr!20890 (Array (_ BitVec 32) (_ BitVec 64))) (size!21311 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43619)

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43619 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!802167 (= res!546833 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!802168 () Bool)

(declare-fun res!546832 () Bool)

(assert (=> b!802168 (=> (not res!546832) (not e!444552))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!802168 (= res!546832 (validKeyInArray!0 (select (arr!20890 a!3170) j!153)))))

(declare-fun b!802169 () Bool)

(declare-fun res!546827 () Bool)

(assert (=> b!802169 (=> (not res!546827) (not e!444552))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!802169 (= res!546827 (and (= (size!21311 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21311 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21311 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!802170 () Bool)

(declare-fun e!444551 () Bool)

(declare-fun e!444549 () Bool)

(assert (=> b!802170 (= e!444551 e!444549)))

(declare-fun res!546834 () Bool)

(assert (=> b!802170 (=> (not res!546834) (not e!444549))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!358598 () (_ BitVec 64))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!358600 () array!43619)

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8478 0))(
  ( (MissingZero!8478 (index!36280 (_ BitVec 32))) (Found!8478 (index!36281 (_ BitVec 32))) (Intermediate!8478 (undefined!9290 Bool) (index!36282 (_ BitVec 32)) (x!67135 (_ BitVec 32))) (Undefined!8478) (MissingVacant!8478 (index!36283 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43619 (_ BitVec 32)) SeekEntryResult!8478)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43619 (_ BitVec 32)) SeekEntryResult!8478)

(assert (=> b!802170 (= res!546834 (= (seekEntryOrOpen!0 lt!358598 lt!358600 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!358598 lt!358600 mask!3266)))))

(assert (=> b!802170 (= lt!358598 (select (store (arr!20890 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!802170 (= lt!358600 (array!43620 (store (arr!20890 a!3170) i!1163 k!2044) (size!21311 a!3170)))))

(declare-fun b!802171 () Bool)

(declare-fun res!546828 () Bool)

(assert (=> b!802171 (=> (not res!546828) (not e!444552))))

(assert (=> b!802171 (= res!546828 (validKeyInArray!0 k!2044))))

(declare-fun b!802172 () Bool)

(declare-fun e!444550 () Bool)

(assert (=> b!802172 (= e!444550 (validKeyInArray!0 lt!358598))))

(declare-fun res!546830 () Bool)

(assert (=> start!68812 (=> (not res!546830) (not e!444552))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68812 (= res!546830 (validMask!0 mask!3266))))

(assert (=> start!68812 e!444552))

(assert (=> start!68812 true))

(declare-fun array_inv!16773 (array!43619) Bool)

(assert (=> start!68812 (array_inv!16773 a!3170)))

(declare-fun b!802173 () Bool)

(declare-fun e!444553 () Bool)

(assert (=> b!802173 (= e!444549 e!444553)))

(declare-fun res!546837 () Bool)

(assert (=> b!802173 (=> (not res!546837) (not e!444553))))

(declare-fun lt!358601 () SeekEntryResult!8478)

(declare-fun lt!358599 () SeekEntryResult!8478)

(assert (=> b!802173 (= res!546837 (and (= lt!358601 lt!358599) (= lt!358599 (Found!8478 j!153)) (not (= (select (arr!20890 a!3170) index!1236) (select (arr!20890 a!3170) j!153)))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!802173 (= lt!358599 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20890 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!802173 (= lt!358601 (seekEntryOrOpen!0 (select (arr!20890 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!802174 () Bool)

(assert (=> b!802174 (= e!444552 e!444551)))

(declare-fun res!546829 () Bool)

(assert (=> b!802174 (=> (not res!546829) (not e!444551))))

(declare-fun lt!358597 () SeekEntryResult!8478)

(assert (=> b!802174 (= res!546829 (or (= lt!358597 (MissingZero!8478 i!1163)) (= lt!358597 (MissingVacant!8478 i!1163))))))

(assert (=> b!802174 (= lt!358597 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!802175 () Bool)

(declare-fun res!546835 () Bool)

(assert (=> b!802175 (=> (not res!546835) (not e!444551))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43619 (_ BitVec 32)) Bool)

(assert (=> b!802175 (= res!546835 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!802176 () Bool)

(declare-fun res!546826 () Bool)

(assert (=> b!802176 (=> (not res!546826) (not e!444551))))

(assert (=> b!802176 (= res!546826 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21311 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20890 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21311 a!3170)) (= (select (arr!20890 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!802177 () Bool)

(assert (=> b!802177 (= e!444553 (not e!444550))))

(declare-fun res!546836 () Bool)

(assert (=> b!802177 (=> res!546836 e!444550)))

(assert (=> b!802177 (= res!546836 (or (bvslt mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266)) (not (= (select (store (arr!20890 a!3170) i!1163 k!2044) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!358596 () (_ BitVec 32))

(assert (=> b!802177 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358596 vacantAfter!23 lt!358598 lt!358600 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358596 vacantBefore!23 (select (arr!20890 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27470 0))(
  ( (Unit!27471) )
))
(declare-fun lt!358595 () Unit!27470)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43619 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27470)

(assert (=> b!802177 (= lt!358595 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k!2044 j!153 lt!358596 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!802177 (= lt!358596 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!802178 () Bool)

(declare-fun res!546831 () Bool)

(assert (=> b!802178 (=> (not res!546831) (not e!444551))))

(declare-datatypes ((List!14892 0))(
  ( (Nil!14889) (Cons!14888 (h!16017 (_ BitVec 64)) (t!21198 List!14892)) )
))
(declare-fun arrayNoDuplicates!0 (array!43619 (_ BitVec 32) List!14892) Bool)

(assert (=> b!802178 (= res!546831 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14889))))

(assert (= (and start!68812 res!546830) b!802169))

(assert (= (and b!802169 res!546827) b!802168))

(assert (= (and b!802168 res!546832) b!802171))

(assert (= (and b!802171 res!546828) b!802167))

(assert (= (and b!802167 res!546833) b!802174))

(assert (= (and b!802174 res!546829) b!802175))

(assert (= (and b!802175 res!546835) b!802178))

(assert (= (and b!802178 res!546831) b!802176))

(assert (= (and b!802176 res!546826) b!802170))

(assert (= (and b!802170 res!546834) b!802173))

(assert (= (and b!802173 res!546837) b!802177))

(assert (= (and b!802177 (not res!546836)) b!802172))

(declare-fun m!743119 () Bool)

(assert (=> b!802167 m!743119))

(declare-fun m!743121 () Bool)

(assert (=> b!802171 m!743121))

(declare-fun m!743123 () Bool)

(assert (=> b!802178 m!743123))

(declare-fun m!743125 () Bool)

(assert (=> b!802174 m!743125))

(declare-fun m!743127 () Bool)

(assert (=> b!802168 m!743127))

(assert (=> b!802168 m!743127))

(declare-fun m!743129 () Bool)

(assert (=> b!802168 m!743129))

(assert (=> b!802177 m!743127))

(declare-fun m!743131 () Bool)

(assert (=> b!802177 m!743131))

(declare-fun m!743133 () Bool)

(assert (=> b!802177 m!743133))

(declare-fun m!743135 () Bool)

(assert (=> b!802177 m!743135))

(declare-fun m!743137 () Bool)

(assert (=> b!802177 m!743137))

(assert (=> b!802177 m!743127))

(declare-fun m!743139 () Bool)

(assert (=> b!802177 m!743139))

(declare-fun m!743141 () Bool)

(assert (=> b!802177 m!743141))

(declare-fun m!743143 () Bool)

(assert (=> b!802175 m!743143))

(declare-fun m!743145 () Bool)

(assert (=> start!68812 m!743145))

(declare-fun m!743147 () Bool)

(assert (=> start!68812 m!743147))

(declare-fun m!743149 () Bool)

(assert (=> b!802176 m!743149))

(declare-fun m!743151 () Bool)

(assert (=> b!802176 m!743151))

(declare-fun m!743153 () Bool)

(assert (=> b!802173 m!743153))

(assert (=> b!802173 m!743127))

(assert (=> b!802173 m!743127))

(declare-fun m!743155 () Bool)

(assert (=> b!802173 m!743155))

(assert (=> b!802173 m!743127))

(declare-fun m!743157 () Bool)

(assert (=> b!802173 m!743157))

(declare-fun m!743159 () Bool)

(assert (=> b!802172 m!743159))

(declare-fun m!743161 () Bool)

(assert (=> b!802170 m!743161))

(declare-fun m!743163 () Bool)

(assert (=> b!802170 m!743163))

(assert (=> b!802170 m!743141))

(declare-fun m!743165 () Bool)

(assert (=> b!802170 m!743165))

(push 1)

(assert (not b!802168))

(assert (not b!802175))

(assert (not b!802167))

(assert (not b!802170))

(assert (not b!802172))

(assert (not b!802178))

(assert (not b!802173))

(assert (not start!68812))

(assert (not b!802177))

(assert (not b!802174))

(assert (not b!802171))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

