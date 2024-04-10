; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68384 () Bool)

(assert start!68384)

(declare-fun res!539149 () Bool)

(declare-fun e!441191 () Bool)

(assert (=> start!68384 (=> (not res!539149) (not e!441191))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68384 (= res!539149 (validMask!0 mask!3266))))

(assert (=> start!68384 e!441191))

(assert (=> start!68384 true))

(declare-datatypes ((array!43174 0))(
  ( (array!43175 (arr!20667 (Array (_ BitVec 32) (_ BitVec 64))) (size!21088 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43174)

(declare-fun array_inv!16463 (array!43174) Bool)

(assert (=> start!68384 (array_inv!16463 a!3170)))

(declare-fun b!794630 () Bool)

(declare-fun res!539150 () Bool)

(assert (=> b!794630 (=> (not res!539150) (not e!441191))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!794630 (= res!539150 (and (= (size!21088 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21088 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21088 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!794631 () Bool)

(declare-fun res!539157 () Bool)

(declare-fun e!441189 () Bool)

(assert (=> b!794631 (=> (not res!539157) (not e!441189))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43174 (_ BitVec 32)) Bool)

(assert (=> b!794631 (= res!539157 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!794632 () Bool)

(declare-fun res!539152 () Bool)

(assert (=> b!794632 (=> (not res!539152) (not e!441191))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43174 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!794632 (= res!539152 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!794633 () Bool)

(declare-fun res!539153 () Bool)

(declare-fun e!441190 () Bool)

(assert (=> b!794633 (=> (not res!539153) (not e!441190))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8258 0))(
  ( (MissingZero!8258 (index!35400 (_ BitVec 32))) (Found!8258 (index!35401 (_ BitVec 32))) (Intermediate!8258 (undefined!9070 Bool) (index!35402 (_ BitVec 32)) (x!66328 (_ BitVec 32))) (Undefined!8258) (MissingVacant!8258 (index!35403 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43174 (_ BitVec 32)) SeekEntryResult!8258)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43174 (_ BitVec 32)) SeekEntryResult!8258)

(assert (=> b!794633 (= res!539153 (= (seekEntryOrOpen!0 (select (arr!20667 a!3170) j!153) a!3170 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20667 a!3170) j!153) a!3170 mask!3266)))))

(declare-fun b!794634 () Bool)

(assert (=> b!794634 (= e!441189 e!441190)))

(declare-fun res!539156 () Bool)

(assert (=> b!794634 (=> (not res!539156) (not e!441190))))

(declare-fun lt!354232 () array!43174)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!354231 () (_ BitVec 64))

(assert (=> b!794634 (= res!539156 (= (seekEntryOrOpen!0 lt!354231 lt!354232 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354231 lt!354232 mask!3266)))))

(assert (=> b!794634 (= lt!354231 (select (store (arr!20667 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!794634 (= lt!354232 (array!43175 (store (arr!20667 a!3170) i!1163 k!2044) (size!21088 a!3170)))))

(declare-fun b!794635 () Bool)

(assert (=> b!794635 (= e!441190 (bvslt mask!3266 #b00000000000000000000000000000000))))

(declare-fun b!794636 () Bool)

(declare-fun res!539159 () Bool)

(assert (=> b!794636 (=> (not res!539159) (not e!441191))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!794636 (= res!539159 (validKeyInArray!0 (select (arr!20667 a!3170) j!153)))))

(declare-fun b!794637 () Bool)

(assert (=> b!794637 (= e!441191 e!441189)))

(declare-fun res!539151 () Bool)

(assert (=> b!794637 (=> (not res!539151) (not e!441189))))

(declare-fun lt!354233 () SeekEntryResult!8258)

(assert (=> b!794637 (= res!539151 (or (= lt!354233 (MissingZero!8258 i!1163)) (= lt!354233 (MissingVacant!8258 i!1163))))))

(assert (=> b!794637 (= lt!354233 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!794638 () Bool)

(declare-fun res!539158 () Bool)

(assert (=> b!794638 (=> (not res!539158) (not e!441189))))

(declare-datatypes ((List!14630 0))(
  ( (Nil!14627) (Cons!14626 (h!15755 (_ BitVec 64)) (t!20945 List!14630)) )
))
(declare-fun arrayNoDuplicates!0 (array!43174 (_ BitVec 32) List!14630) Bool)

(assert (=> b!794638 (= res!539158 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14627))))

(declare-fun b!794639 () Bool)

(declare-fun res!539154 () Bool)

(assert (=> b!794639 (=> (not res!539154) (not e!441189))))

(assert (=> b!794639 (= res!539154 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21088 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20667 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21088 a!3170)) (= (select (arr!20667 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!794640 () Bool)

(declare-fun res!539155 () Bool)

(assert (=> b!794640 (=> (not res!539155) (not e!441191))))

(assert (=> b!794640 (= res!539155 (validKeyInArray!0 k!2044))))

(assert (= (and start!68384 res!539149) b!794630))

(assert (= (and b!794630 res!539150) b!794636))

(assert (= (and b!794636 res!539159) b!794640))

(assert (= (and b!794640 res!539155) b!794632))

(assert (= (and b!794632 res!539152) b!794637))

(assert (= (and b!794637 res!539151) b!794631))

(assert (= (and b!794631 res!539157) b!794638))

(assert (= (and b!794638 res!539158) b!794639))

(assert (= (and b!794639 res!539154) b!794634))

(assert (= (and b!794634 res!539156) b!794633))

(assert (= (and b!794633 res!539153) b!794635))

(declare-fun m!735185 () Bool)

(assert (=> b!794631 m!735185))

(declare-fun m!735187 () Bool)

(assert (=> start!68384 m!735187))

(declare-fun m!735189 () Bool)

(assert (=> start!68384 m!735189))

(declare-fun m!735191 () Bool)

(assert (=> b!794637 m!735191))

(declare-fun m!735193 () Bool)

(assert (=> b!794634 m!735193))

(declare-fun m!735195 () Bool)

(assert (=> b!794634 m!735195))

(declare-fun m!735197 () Bool)

(assert (=> b!794634 m!735197))

(declare-fun m!735199 () Bool)

(assert (=> b!794634 m!735199))

(declare-fun m!735201 () Bool)

(assert (=> b!794636 m!735201))

(assert (=> b!794636 m!735201))

(declare-fun m!735203 () Bool)

(assert (=> b!794636 m!735203))

(declare-fun m!735205 () Bool)

(assert (=> b!794638 m!735205))

(assert (=> b!794633 m!735201))

(assert (=> b!794633 m!735201))

(declare-fun m!735207 () Bool)

(assert (=> b!794633 m!735207))

(assert (=> b!794633 m!735201))

(declare-fun m!735209 () Bool)

(assert (=> b!794633 m!735209))

(declare-fun m!735211 () Bool)

(assert (=> b!794639 m!735211))

(declare-fun m!735213 () Bool)

(assert (=> b!794639 m!735213))

(declare-fun m!735215 () Bool)

(assert (=> b!794632 m!735215))

(declare-fun m!735217 () Bool)

(assert (=> b!794640 m!735217))

(push 1)

(assert (not start!68384))

(assert (not b!794637))

(assert (not b!794638))

(assert (not b!794633))

(assert (not b!794640))

(assert (not b!794632))

(assert (not b!794634))

(assert (not b!794631))

(assert (not b!794636))

(check-sat)

(pop 1)

(push 1)

(check-sat)

