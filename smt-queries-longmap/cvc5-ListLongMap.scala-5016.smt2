; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68606 () Bool)

(assert start!68606)

(declare-fun b!798284 () Bool)

(declare-fun res!542807 () Bool)

(declare-fun e!442823 () Bool)

(assert (=> b!798284 (=> (not res!542807) (not e!442823))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43396 0))(
  ( (array!43397 (arr!20778 (Array (_ BitVec 32) (_ BitVec 64))) (size!21199 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43396)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!798284 (= res!542807 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21199 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20778 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21199 a!3170)) (= (select (arr!20778 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun res!542810 () Bool)

(declare-fun e!442822 () Bool)

(assert (=> start!68606 (=> (not res!542810) (not e!442822))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68606 (= res!542810 (validMask!0 mask!3266))))

(assert (=> start!68606 e!442822))

(assert (=> start!68606 true))

(declare-fun array_inv!16574 (array!43396) Bool)

(assert (=> start!68606 (array_inv!16574 a!3170)))

(declare-fun b!798285 () Bool)

(declare-fun res!542811 () Bool)

(assert (=> b!798285 (=> (not res!542811) (not e!442822))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!798285 (= res!542811 (validKeyInArray!0 (select (arr!20778 a!3170) j!153)))))

(declare-fun b!798286 () Bool)

(declare-fun res!542803 () Bool)

(assert (=> b!798286 (=> (not res!542803) (not e!442823))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43396 (_ BitVec 32)) Bool)

(assert (=> b!798286 (= res!542803 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!798287 () Bool)

(declare-fun res!542804 () Bool)

(assert (=> b!798287 (=> (not res!542804) (not e!442822))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43396 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!798287 (= res!542804 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!798288 () Bool)

(declare-fun res!542806 () Bool)

(assert (=> b!798288 (=> (not res!542806) (not e!442822))))

(assert (=> b!798288 (= res!542806 (validKeyInArray!0 k!2044))))

(declare-fun b!798289 () Bool)

(assert (=> b!798289 (= e!442822 e!442823)))

(declare-fun res!542813 () Bool)

(assert (=> b!798289 (=> (not res!542813) (not e!442823))))

(declare-datatypes ((SeekEntryResult!8369 0))(
  ( (MissingZero!8369 (index!35844 (_ BitVec 32))) (Found!8369 (index!35845 (_ BitVec 32))) (Intermediate!8369 (undefined!9181 Bool) (index!35846 (_ BitVec 32)) (x!66735 (_ BitVec 32))) (Undefined!8369) (MissingVacant!8369 (index!35847 (_ BitVec 32))) )
))
(declare-fun lt!356321 () SeekEntryResult!8369)

(assert (=> b!798289 (= res!542813 (or (= lt!356321 (MissingZero!8369 i!1163)) (= lt!356321 (MissingVacant!8369 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43396 (_ BitVec 32)) SeekEntryResult!8369)

(assert (=> b!798289 (= lt!356321 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!798290 () Bool)

(declare-fun e!442819 () Bool)

(assert (=> b!798290 (= e!442819 (not true))))

(declare-fun lt!356318 () SeekEntryResult!8369)

(assert (=> b!798290 (= lt!356318 (Found!8369 index!1236))))

(declare-fun b!798291 () Bool)

(declare-fun res!542808 () Bool)

(assert (=> b!798291 (=> (not res!542808) (not e!442823))))

(declare-datatypes ((List!14741 0))(
  ( (Nil!14738) (Cons!14737 (h!15866 (_ BitVec 64)) (t!21056 List!14741)) )
))
(declare-fun arrayNoDuplicates!0 (array!43396 (_ BitVec 32) List!14741) Bool)

(assert (=> b!798291 (= res!542808 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14738))))

(declare-fun b!798292 () Bool)

(declare-fun e!442821 () Bool)

(assert (=> b!798292 (= e!442821 e!442819)))

(declare-fun res!542805 () Bool)

(assert (=> b!798292 (=> (not res!542805) (not e!442819))))

(declare-fun lt!356323 () SeekEntryResult!8369)

(declare-fun lt!356322 () SeekEntryResult!8369)

(assert (=> b!798292 (= res!542805 (and (= lt!356322 lt!356323) (= lt!356323 (Found!8369 j!153)) (= (select (arr!20778 a!3170) index!1236) (select (arr!20778 a!3170) j!153))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43396 (_ BitVec 32)) SeekEntryResult!8369)

(assert (=> b!798292 (= lt!356323 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20778 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!798292 (= lt!356322 (seekEntryOrOpen!0 (select (arr!20778 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!798293 () Bool)

(assert (=> b!798293 (= e!442823 e!442821)))

(declare-fun res!542809 () Bool)

(assert (=> b!798293 (=> (not res!542809) (not e!442821))))

(declare-fun lt!356320 () SeekEntryResult!8369)

(assert (=> b!798293 (= res!542809 (= lt!356320 lt!356318))))

(declare-fun lt!356324 () array!43396)

(declare-fun lt!356319 () (_ BitVec 64))

(assert (=> b!798293 (= lt!356318 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!356319 lt!356324 mask!3266))))

(assert (=> b!798293 (= lt!356320 (seekEntryOrOpen!0 lt!356319 lt!356324 mask!3266))))

(assert (=> b!798293 (= lt!356319 (select (store (arr!20778 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!798293 (= lt!356324 (array!43397 (store (arr!20778 a!3170) i!1163 k!2044) (size!21199 a!3170)))))

(declare-fun b!798294 () Bool)

(declare-fun res!542812 () Bool)

(assert (=> b!798294 (=> (not res!542812) (not e!442822))))

(assert (=> b!798294 (= res!542812 (and (= (size!21199 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21199 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21199 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!68606 res!542810) b!798294))

(assert (= (and b!798294 res!542812) b!798285))

(assert (= (and b!798285 res!542811) b!798288))

(assert (= (and b!798288 res!542806) b!798287))

(assert (= (and b!798287 res!542804) b!798289))

(assert (= (and b!798289 res!542813) b!798286))

(assert (= (and b!798286 res!542803) b!798291))

(assert (= (and b!798291 res!542808) b!798284))

(assert (= (and b!798284 res!542807) b!798293))

(assert (= (and b!798293 res!542809) b!798292))

(assert (= (and b!798292 res!542805) b!798290))

(declare-fun m!739175 () Bool)

(assert (=> b!798292 m!739175))

(declare-fun m!739177 () Bool)

(assert (=> b!798292 m!739177))

(assert (=> b!798292 m!739177))

(declare-fun m!739179 () Bool)

(assert (=> b!798292 m!739179))

(assert (=> b!798292 m!739177))

(declare-fun m!739181 () Bool)

(assert (=> b!798292 m!739181))

(declare-fun m!739183 () Bool)

(assert (=> b!798289 m!739183))

(assert (=> b!798285 m!739177))

(assert (=> b!798285 m!739177))

(declare-fun m!739185 () Bool)

(assert (=> b!798285 m!739185))

(declare-fun m!739187 () Bool)

(assert (=> start!68606 m!739187))

(declare-fun m!739189 () Bool)

(assert (=> start!68606 m!739189))

(declare-fun m!739191 () Bool)

(assert (=> b!798286 m!739191))

(declare-fun m!739193 () Bool)

(assert (=> b!798284 m!739193))

(declare-fun m!739195 () Bool)

(assert (=> b!798284 m!739195))

(declare-fun m!739197 () Bool)

(assert (=> b!798291 m!739197))

(declare-fun m!739199 () Bool)

(assert (=> b!798287 m!739199))

(declare-fun m!739201 () Bool)

(assert (=> b!798293 m!739201))

(declare-fun m!739203 () Bool)

(assert (=> b!798293 m!739203))

(declare-fun m!739205 () Bool)

(assert (=> b!798293 m!739205))

(declare-fun m!739207 () Bool)

(assert (=> b!798293 m!739207))

(declare-fun m!739209 () Bool)

(assert (=> b!798288 m!739209))

(push 1)

