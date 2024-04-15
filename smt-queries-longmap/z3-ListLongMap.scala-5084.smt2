; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68994 () Bool)

(assert start!68994)

(declare-fun b!804899 () Bool)

(declare-fun e!445780 () Bool)

(assert (=> b!804899 (= e!445780 false)))

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((array!43801 0))(
  ( (array!43802 (arr!20981 (Array (_ BitVec 32) (_ BitVec 64))) (size!21402 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43801)

(declare-fun j!153 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8569 0))(
  ( (MissingZero!8569 (index!36644 (_ BitVec 32))) (Found!8569 (index!36645 (_ BitVec 32))) (Intermediate!8569 (undefined!9381 Bool) (index!36646 (_ BitVec 32)) (x!67474 (_ BitVec 32))) (Undefined!8569) (MissingVacant!8569 (index!36647 (_ BitVec 32))) )
))
(declare-fun lt!360242 () SeekEntryResult!8569)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43801 (_ BitVec 32)) SeekEntryResult!8569)

(assert (=> b!804899 (= lt!360242 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20981 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!360245 () SeekEntryResult!8569)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43801 (_ BitVec 32)) SeekEntryResult!8569)

(assert (=> b!804899 (= lt!360245 (seekEntryOrOpen!0 (select (arr!20981 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!804900 () Bool)

(declare-fun res!549563 () Bool)

(declare-fun e!445778 () Bool)

(assert (=> b!804900 (=> (not res!549563) (not e!445778))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43801 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!804900 (= res!549563 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!804901 () Bool)

(declare-fun e!445779 () Bool)

(assert (=> b!804901 (= e!445779 e!445780)))

(declare-fun res!549561 () Bool)

(assert (=> b!804901 (=> (not res!549561) (not e!445780))))

(declare-fun lt!360241 () array!43801)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!360243 () (_ BitVec 64))

(assert (=> b!804901 (= res!549561 (= (seekEntryOrOpen!0 lt!360243 lt!360241 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360243 lt!360241 mask!3266)))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!804901 (= lt!360243 (select (store (arr!20981 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!804901 (= lt!360241 (array!43802 (store (arr!20981 a!3170) i!1163 k0!2044) (size!21402 a!3170)))))

(declare-fun b!804902 () Bool)

(assert (=> b!804902 (= e!445778 e!445779)))

(declare-fun res!549560 () Bool)

(assert (=> b!804902 (=> (not res!549560) (not e!445779))))

(declare-fun lt!360244 () SeekEntryResult!8569)

(assert (=> b!804902 (= res!549560 (or (= lt!360244 (MissingZero!8569 i!1163)) (= lt!360244 (MissingVacant!8569 i!1163))))))

(assert (=> b!804902 (= lt!360244 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!804903 () Bool)

(declare-fun res!549562 () Bool)

(assert (=> b!804903 (=> (not res!549562) (not e!445778))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!804903 (= res!549562 (validKeyInArray!0 (select (arr!20981 a!3170) j!153)))))

(declare-fun b!804904 () Bool)

(declare-fun res!549566 () Bool)

(assert (=> b!804904 (=> (not res!549566) (not e!445779))))

(assert (=> b!804904 (= res!549566 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21402 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20981 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21402 a!3170)) (= (select (arr!20981 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!804905 () Bool)

(declare-fun res!549565 () Bool)

(assert (=> b!804905 (=> (not res!549565) (not e!445778))))

(assert (=> b!804905 (= res!549565 (validKeyInArray!0 k0!2044))))

(declare-fun b!804907 () Bool)

(declare-fun res!549567 () Bool)

(assert (=> b!804907 (=> (not res!549567) (not e!445778))))

(assert (=> b!804907 (= res!549567 (and (= (size!21402 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21402 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21402 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!804908 () Bool)

(declare-fun res!549564 () Bool)

(assert (=> b!804908 (=> (not res!549564) (not e!445779))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43801 (_ BitVec 32)) Bool)

(assert (=> b!804908 (= res!549564 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!804906 () Bool)

(declare-fun res!549559 () Bool)

(assert (=> b!804906 (=> (not res!549559) (not e!445779))))

(declare-datatypes ((List!14983 0))(
  ( (Nil!14980) (Cons!14979 (h!16108 (_ BitVec 64)) (t!21289 List!14983)) )
))
(declare-fun arrayNoDuplicates!0 (array!43801 (_ BitVec 32) List!14983) Bool)

(assert (=> b!804906 (= res!549559 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14980))))

(declare-fun res!549558 () Bool)

(assert (=> start!68994 (=> (not res!549558) (not e!445778))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68994 (= res!549558 (validMask!0 mask!3266))))

(assert (=> start!68994 e!445778))

(assert (=> start!68994 true))

(declare-fun array_inv!16864 (array!43801) Bool)

(assert (=> start!68994 (array_inv!16864 a!3170)))

(assert (= (and start!68994 res!549558) b!804907))

(assert (= (and b!804907 res!549567) b!804903))

(assert (= (and b!804903 res!549562) b!804905))

(assert (= (and b!804905 res!549565) b!804900))

(assert (= (and b!804900 res!549563) b!804902))

(assert (= (and b!804902 res!549560) b!804908))

(assert (= (and b!804908 res!549564) b!804906))

(assert (= (and b!804906 res!549559) b!804904))

(assert (= (and b!804904 res!549566) b!804901))

(assert (= (and b!804901 res!549561) b!804899))

(declare-fun m!746317 () Bool)

(assert (=> b!804901 m!746317))

(declare-fun m!746319 () Bool)

(assert (=> b!804901 m!746319))

(declare-fun m!746321 () Bool)

(assert (=> b!804901 m!746321))

(declare-fun m!746323 () Bool)

(assert (=> b!804901 m!746323))

(declare-fun m!746325 () Bool)

(assert (=> start!68994 m!746325))

(declare-fun m!746327 () Bool)

(assert (=> start!68994 m!746327))

(declare-fun m!746329 () Bool)

(assert (=> b!804904 m!746329))

(declare-fun m!746331 () Bool)

(assert (=> b!804904 m!746331))

(declare-fun m!746333 () Bool)

(assert (=> b!804905 m!746333))

(declare-fun m!746335 () Bool)

(assert (=> b!804906 m!746335))

(declare-fun m!746337 () Bool)

(assert (=> b!804908 m!746337))

(declare-fun m!746339 () Bool)

(assert (=> b!804902 m!746339))

(declare-fun m!746341 () Bool)

(assert (=> b!804903 m!746341))

(assert (=> b!804903 m!746341))

(declare-fun m!746343 () Bool)

(assert (=> b!804903 m!746343))

(declare-fun m!746345 () Bool)

(assert (=> b!804900 m!746345))

(assert (=> b!804899 m!746341))

(assert (=> b!804899 m!746341))

(declare-fun m!746347 () Bool)

(assert (=> b!804899 m!746347))

(assert (=> b!804899 m!746341))

(declare-fun m!746349 () Bool)

(assert (=> b!804899 m!746349))

(check-sat (not b!804902) (not start!68994) (not b!804903) (not b!804901) (not b!804905) (not b!804900) (not b!804906) (not b!804908) (not b!804899))
(check-sat)
