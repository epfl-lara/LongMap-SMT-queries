; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68382 () Bool)

(assert start!68382)

(declare-fun b!794598 () Bool)

(declare-fun res!539124 () Bool)

(declare-fun e!441176 () Bool)

(assert (=> b!794598 (=> (not res!539124) (not e!441176))))

(declare-datatypes ((array!43172 0))(
  ( (array!43173 (arr!20666 (Array (_ BitVec 32) (_ BitVec 64))) (size!21087 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43172)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43172 (_ BitVec 32)) Bool)

(assert (=> b!794598 (= res!539124 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!794599 () Bool)

(declare-fun e!441179 () Bool)

(assert (=> b!794599 (= e!441179 false)))

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8257 0))(
  ( (MissingZero!8257 (index!35396 (_ BitVec 32))) (Found!8257 (index!35397 (_ BitVec 32))) (Intermediate!8257 (undefined!9069 Bool) (index!35398 (_ BitVec 32)) (x!66319 (_ BitVec 32))) (Undefined!8257) (MissingVacant!8257 (index!35399 (_ BitVec 32))) )
))
(declare-fun lt!354224 () SeekEntryResult!8257)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43172 (_ BitVec 32)) SeekEntryResult!8257)

(assert (=> b!794599 (= lt!354224 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20666 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!354221 () SeekEntryResult!8257)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43172 (_ BitVec 32)) SeekEntryResult!8257)

(assert (=> b!794599 (= lt!354221 (seekEntryOrOpen!0 (select (arr!20666 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!794600 () Bool)

(declare-fun res!539120 () Bool)

(assert (=> b!794600 (=> (not res!539120) (not e!441176))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!794600 (= res!539120 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21087 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20666 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21087 a!3170)) (= (select (arr!20666 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!794601 () Bool)

(declare-fun res!539125 () Bool)

(declare-fun e!441177 () Bool)

(assert (=> b!794601 (=> (not res!539125) (not e!441177))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43172 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!794601 (= res!539125 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!794602 () Bool)

(declare-fun res!539117 () Bool)

(assert (=> b!794602 (=> (not res!539117) (not e!441177))))

(assert (=> b!794602 (= res!539117 (and (= (size!21087 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21087 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21087 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!794603 () Bool)

(assert (=> b!794603 (= e!441176 e!441179)))

(declare-fun res!539118 () Bool)

(assert (=> b!794603 (=> (not res!539118) (not e!441179))))

(declare-fun lt!354223 () (_ BitVec 64))

(declare-fun lt!354222 () array!43172)

(assert (=> b!794603 (= res!539118 (= (seekEntryOrOpen!0 lt!354223 lt!354222 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354223 lt!354222 mask!3266)))))

(assert (=> b!794603 (= lt!354223 (select (store (arr!20666 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!794603 (= lt!354222 (array!43173 (store (arr!20666 a!3170) i!1163 k!2044) (size!21087 a!3170)))))

(declare-fun res!539126 () Bool)

(assert (=> start!68382 (=> (not res!539126) (not e!441177))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68382 (= res!539126 (validMask!0 mask!3266))))

(assert (=> start!68382 e!441177))

(assert (=> start!68382 true))

(declare-fun array_inv!16462 (array!43172) Bool)

(assert (=> start!68382 (array_inv!16462 a!3170)))

(declare-fun b!794604 () Bool)

(declare-fun res!539119 () Bool)

(assert (=> b!794604 (=> (not res!539119) (not e!441177))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!794604 (= res!539119 (validKeyInArray!0 (select (arr!20666 a!3170) j!153)))))

(declare-fun b!794605 () Bool)

(assert (=> b!794605 (= e!441177 e!441176)))

(declare-fun res!539123 () Bool)

(assert (=> b!794605 (=> (not res!539123) (not e!441176))))

(declare-fun lt!354220 () SeekEntryResult!8257)

(assert (=> b!794605 (= res!539123 (or (= lt!354220 (MissingZero!8257 i!1163)) (= lt!354220 (MissingVacant!8257 i!1163))))))

(assert (=> b!794605 (= lt!354220 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!794606 () Bool)

(declare-fun res!539121 () Bool)

(assert (=> b!794606 (=> (not res!539121) (not e!441176))))

(declare-datatypes ((List!14629 0))(
  ( (Nil!14626) (Cons!14625 (h!15754 (_ BitVec 64)) (t!20944 List!14629)) )
))
(declare-fun arrayNoDuplicates!0 (array!43172 (_ BitVec 32) List!14629) Bool)

(assert (=> b!794606 (= res!539121 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14626))))

(declare-fun b!794607 () Bool)

(declare-fun res!539122 () Bool)

(assert (=> b!794607 (=> (not res!539122) (not e!441177))))

(assert (=> b!794607 (= res!539122 (validKeyInArray!0 k!2044))))

(assert (= (and start!68382 res!539126) b!794602))

(assert (= (and b!794602 res!539117) b!794604))

(assert (= (and b!794604 res!539119) b!794607))

(assert (= (and b!794607 res!539122) b!794601))

(assert (= (and b!794601 res!539125) b!794605))

(assert (= (and b!794605 res!539123) b!794598))

(assert (= (and b!794598 res!539124) b!794606))

(assert (= (and b!794606 res!539121) b!794600))

(assert (= (and b!794600 res!539120) b!794603))

(assert (= (and b!794603 res!539118) b!794599))

(declare-fun m!735151 () Bool)

(assert (=> b!794600 m!735151))

(declare-fun m!735153 () Bool)

(assert (=> b!794600 m!735153))

(declare-fun m!735155 () Bool)

(assert (=> b!794598 m!735155))

(declare-fun m!735157 () Bool)

(assert (=> start!68382 m!735157))

(declare-fun m!735159 () Bool)

(assert (=> start!68382 m!735159))

(declare-fun m!735161 () Bool)

(assert (=> b!794601 m!735161))

(declare-fun m!735163 () Bool)

(assert (=> b!794599 m!735163))

(assert (=> b!794599 m!735163))

(declare-fun m!735165 () Bool)

(assert (=> b!794599 m!735165))

(assert (=> b!794599 m!735163))

(declare-fun m!735167 () Bool)

(assert (=> b!794599 m!735167))

(declare-fun m!735169 () Bool)

(assert (=> b!794606 m!735169))

(declare-fun m!735171 () Bool)

(assert (=> b!794603 m!735171))

(declare-fun m!735173 () Bool)

(assert (=> b!794603 m!735173))

(declare-fun m!735175 () Bool)

(assert (=> b!794603 m!735175))

(declare-fun m!735177 () Bool)

(assert (=> b!794603 m!735177))

(declare-fun m!735179 () Bool)

(assert (=> b!794605 m!735179))

(declare-fun m!735181 () Bool)

(assert (=> b!794607 m!735181))

(assert (=> b!794604 m!735163))

(assert (=> b!794604 m!735163))

(declare-fun m!735183 () Bool)

(assert (=> b!794604 m!735183))

(push 1)

(assert (not b!794603))

(assert (not start!68382))

(assert (not b!794598))

(assert (not b!794601))

(assert (not b!794607))

(assert (not b!794599))

(assert (not b!794606))

(assert (not b!794604))

(assert (not b!794605))

