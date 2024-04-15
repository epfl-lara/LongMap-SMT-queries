; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68958 () Bool)

(assert start!68958)

(declare-fun b!804375 () Bool)

(declare-fun e!445579 () Bool)

(assert (=> b!804375 (= e!445579 false)))

(declare-datatypes ((array!43765 0))(
  ( (array!43766 (arr!20963 (Array (_ BitVec 32) (_ BitVec 64))) (size!21384 (_ BitVec 32))) )
))
(declare-fun lt!359973 () array!43765)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!359975 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!8551 0))(
  ( (MissingZero!8551 (index!36572 (_ BitVec 32))) (Found!8551 (index!36573 (_ BitVec 32))) (Intermediate!8551 (undefined!9363 Bool) (index!36574 (_ BitVec 32)) (x!67408 (_ BitVec 32))) (Undefined!8551) (MissingVacant!8551 (index!36575 (_ BitVec 32))) )
))
(declare-fun lt!359974 () SeekEntryResult!8551)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43765 (_ BitVec 32)) SeekEntryResult!8551)

(assert (=> b!804375 (= lt!359974 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!359975 lt!359973 mask!3266))))

(declare-fun lt!359971 () SeekEntryResult!8551)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43765 (_ BitVec 32)) SeekEntryResult!8551)

(assert (=> b!804375 (= lt!359971 (seekEntryOrOpen!0 lt!359975 lt!359973 mask!3266))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun a!3170 () array!43765)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!804375 (= lt!359975 (select (store (arr!20963 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!804375 (= lt!359973 (array!43766 (store (arr!20963 a!3170) i!1163 k0!2044) (size!21384 a!3170)))))

(declare-fun b!804376 () Bool)

(declare-fun res!549037 () Bool)

(declare-fun e!445578 () Bool)

(assert (=> b!804376 (=> (not res!549037) (not e!445578))))

(assert (=> b!804376 (= res!549037 (and (= (size!21384 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21384 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21384 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!804377 () Bool)

(declare-fun res!549035 () Bool)

(assert (=> b!804377 (=> (not res!549035) (not e!445578))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!804377 (= res!549035 (validKeyInArray!0 (select (arr!20963 a!3170) j!153)))))

(declare-fun b!804378 () Bool)

(declare-fun res!549042 () Bool)

(assert (=> b!804378 (=> (not res!549042) (not e!445579))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43765 (_ BitVec 32)) Bool)

(assert (=> b!804378 (= res!549042 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!804379 () Bool)

(declare-fun res!549041 () Bool)

(assert (=> b!804379 (=> (not res!549041) (not e!445578))))

(declare-fun arrayContainsKey!0 (array!43765 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!804379 (= res!549041 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!804380 () Bool)

(assert (=> b!804380 (= e!445578 e!445579)))

(declare-fun res!549034 () Bool)

(assert (=> b!804380 (=> (not res!549034) (not e!445579))))

(declare-fun lt!359972 () SeekEntryResult!8551)

(assert (=> b!804380 (= res!549034 (or (= lt!359972 (MissingZero!8551 i!1163)) (= lt!359972 (MissingVacant!8551 i!1163))))))

(assert (=> b!804380 (= lt!359972 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun res!549036 () Bool)

(assert (=> start!68958 (=> (not res!549036) (not e!445578))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68958 (= res!549036 (validMask!0 mask!3266))))

(assert (=> start!68958 e!445578))

(assert (=> start!68958 true))

(declare-fun array_inv!16846 (array!43765) Bool)

(assert (=> start!68958 (array_inv!16846 a!3170)))

(declare-fun b!804381 () Bool)

(declare-fun res!549040 () Bool)

(assert (=> b!804381 (=> (not res!549040) (not e!445579))))

(declare-datatypes ((List!14965 0))(
  ( (Nil!14962) (Cons!14961 (h!16090 (_ BitVec 64)) (t!21271 List!14965)) )
))
(declare-fun arrayNoDuplicates!0 (array!43765 (_ BitVec 32) List!14965) Bool)

(assert (=> b!804381 (= res!549040 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14962))))

(declare-fun b!804382 () Bool)

(declare-fun res!549038 () Bool)

(assert (=> b!804382 (=> (not res!549038) (not e!445579))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!804382 (= res!549038 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21384 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20963 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21384 a!3170)) (= (select (arr!20963 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!804383 () Bool)

(declare-fun res!549039 () Bool)

(assert (=> b!804383 (=> (not res!549039) (not e!445578))))

(assert (=> b!804383 (= res!549039 (validKeyInArray!0 k0!2044))))

(assert (= (and start!68958 res!549036) b!804376))

(assert (= (and b!804376 res!549037) b!804377))

(assert (= (and b!804377 res!549035) b!804383))

(assert (= (and b!804383 res!549039) b!804379))

(assert (= (and b!804379 res!549041) b!804380))

(assert (= (and b!804380 res!549034) b!804378))

(assert (= (and b!804378 res!549042) b!804381))

(assert (= (and b!804381 res!549040) b!804382))

(assert (= (and b!804382 res!549038) b!804375))

(declare-fun m!745729 () Bool)

(assert (=> b!804381 m!745729))

(declare-fun m!745731 () Bool)

(assert (=> b!804377 m!745731))

(assert (=> b!804377 m!745731))

(declare-fun m!745733 () Bool)

(assert (=> b!804377 m!745733))

(declare-fun m!745735 () Bool)

(assert (=> b!804382 m!745735))

(declare-fun m!745737 () Bool)

(assert (=> b!804382 m!745737))

(declare-fun m!745739 () Bool)

(assert (=> b!804380 m!745739))

(declare-fun m!745741 () Bool)

(assert (=> b!804379 m!745741))

(declare-fun m!745743 () Bool)

(assert (=> start!68958 m!745743))

(declare-fun m!745745 () Bool)

(assert (=> start!68958 m!745745))

(declare-fun m!745747 () Bool)

(assert (=> b!804378 m!745747))

(declare-fun m!745749 () Bool)

(assert (=> b!804383 m!745749))

(declare-fun m!745751 () Bool)

(assert (=> b!804375 m!745751))

(declare-fun m!745753 () Bool)

(assert (=> b!804375 m!745753))

(declare-fun m!745755 () Bool)

(assert (=> b!804375 m!745755))

(declare-fun m!745757 () Bool)

(assert (=> b!804375 m!745757))

(check-sat (not b!804379) (not b!804380) (not b!804383) (not b!804381) (not b!804377) (not b!804375) (not start!68958) (not b!804378))
(check-sat)
