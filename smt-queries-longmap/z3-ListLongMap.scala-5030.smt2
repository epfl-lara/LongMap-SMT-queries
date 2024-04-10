; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68692 () Bool)

(assert start!68692)

(declare-fun b!799821 () Bool)

(declare-fun res!544351 () Bool)

(declare-fun e!443506 () Bool)

(assert (=> b!799821 (=> (not res!544351) (not e!443506))))

(declare-fun lt!357226 () (_ BitVec 32))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-datatypes ((array!43482 0))(
  ( (array!43483 (arr!20821 (Array (_ BitVec 32) (_ BitVec 64))) (size!21242 (_ BitVec 32))) )
))
(declare-fun lt!357229 () array!43482)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun lt!357230 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!8412 0))(
  ( (MissingZero!8412 (index!36016 (_ BitVec 32))) (Found!8412 (index!36017 (_ BitVec 32))) (Intermediate!8412 (undefined!9224 Bool) (index!36018 (_ BitVec 32)) (x!66890 (_ BitVec 32))) (Undefined!8412) (MissingVacant!8412 (index!36019 (_ BitVec 32))) )
))
(declare-fun lt!357228 () SeekEntryResult!8412)

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43482 (_ BitVec 32)) SeekEntryResult!8412)

(assert (=> b!799821 (= res!544351 (= lt!357228 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357226 vacantAfter!23 lt!357230 lt!357229 mask!3266)))))

(declare-fun b!799822 () Bool)

(declare-fun res!544340 () Bool)

(declare-fun e!443510 () Bool)

(assert (=> b!799822 (=> (not res!544340) (not e!443510))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!799822 (= res!544340 (validKeyInArray!0 k0!2044))))

(declare-fun b!799823 () Bool)

(declare-fun res!544350 () Bool)

(assert (=> b!799823 (=> (not res!544350) (not e!443510))))

(declare-fun a!3170 () array!43482)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!799823 (= res!544350 (validKeyInArray!0 (select (arr!20821 a!3170) j!153)))))

(declare-fun b!799824 () Bool)

(declare-fun res!544343 () Bool)

(declare-fun e!443508 () Bool)

(assert (=> b!799824 (=> (not res!544343) (not e!443508))))

(declare-datatypes ((List!14784 0))(
  ( (Nil!14781) (Cons!14780 (h!15909 (_ BitVec 64)) (t!21099 List!14784)) )
))
(declare-fun arrayNoDuplicates!0 (array!43482 (_ BitVec 32) List!14784) Bool)

(assert (=> b!799824 (= res!544343 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14781))))

(declare-fun b!799825 () Bool)

(assert (=> b!799825 (= e!443510 e!443508)))

(declare-fun res!544352 () Bool)

(assert (=> b!799825 (=> (not res!544352) (not e!443508))))

(declare-fun lt!357231 () SeekEntryResult!8412)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!799825 (= res!544352 (or (= lt!357231 (MissingZero!8412 i!1163)) (= lt!357231 (MissingVacant!8412 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43482 (_ BitVec 32)) SeekEntryResult!8412)

(assert (=> b!799825 (= lt!357231 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!799826 () Bool)

(declare-fun e!443507 () Bool)

(assert (=> b!799826 (= e!443508 e!443507)))

(declare-fun res!544349 () Bool)

(assert (=> b!799826 (=> (not res!544349) (not e!443507))))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!799826 (= res!544349 (= lt!357228 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!357230 lt!357229 mask!3266)))))

(assert (=> b!799826 (= lt!357228 (seekEntryOrOpen!0 lt!357230 lt!357229 mask!3266))))

(assert (=> b!799826 (= lt!357230 (select (store (arr!20821 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!799826 (= lt!357229 (array!43483 (store (arr!20821 a!3170) i!1163 k0!2044) (size!21242 a!3170)))))

(declare-fun b!799827 () Bool)

(declare-fun res!544347 () Bool)

(assert (=> b!799827 (=> (not res!544347) (not e!443508))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!799827 (= res!544347 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21242 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20821 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21242 a!3170)) (= (select (arr!20821 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!799828 () Bool)

(declare-fun e!443509 () Bool)

(assert (=> b!799828 (= e!443507 e!443509)))

(declare-fun res!544342 () Bool)

(assert (=> b!799828 (=> (not res!544342) (not e!443509))))

(declare-fun lt!357233 () SeekEntryResult!8412)

(declare-fun lt!357232 () SeekEntryResult!8412)

(assert (=> b!799828 (= res!544342 (and (= lt!357233 lt!357232) (= lt!357232 (Found!8412 j!153)) (not (= (select (arr!20821 a!3170) index!1236) (select (arr!20821 a!3170) j!153)))))))

(assert (=> b!799828 (= lt!357232 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20821 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!799828 (= lt!357233 (seekEntryOrOpen!0 (select (arr!20821 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!799829 () Bool)

(assert (=> b!799829 (= e!443506 false)))

(declare-fun lt!357227 () SeekEntryResult!8412)

(assert (=> b!799829 (= lt!357227 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357226 vacantBefore!23 (select (arr!20821 a!3170) j!153) a!3170 mask!3266))))

(declare-fun res!544346 () Bool)

(assert (=> start!68692 (=> (not res!544346) (not e!443510))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68692 (= res!544346 (validMask!0 mask!3266))))

(assert (=> start!68692 e!443510))

(assert (=> start!68692 true))

(declare-fun array_inv!16617 (array!43482) Bool)

(assert (=> start!68692 (array_inv!16617 a!3170)))

(declare-fun b!799830 () Bool)

(declare-fun res!544344 () Bool)

(assert (=> b!799830 (=> (not res!544344) (not e!443510))))

(declare-fun arrayContainsKey!0 (array!43482 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!799830 (= res!544344 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!799831 () Bool)

(assert (=> b!799831 (= e!443509 e!443506)))

(declare-fun res!544341 () Bool)

(assert (=> b!799831 (=> (not res!544341) (not e!443506))))

(assert (=> b!799831 (= res!544341 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!357226 #b00000000000000000000000000000000) (bvslt lt!357226 (size!21242 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!799831 (= lt!357226 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!799832 () Bool)

(declare-fun res!544345 () Bool)

(assert (=> b!799832 (=> (not res!544345) (not e!443510))))

(assert (=> b!799832 (= res!544345 (and (= (size!21242 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21242 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21242 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!799833 () Bool)

(declare-fun res!544348 () Bool)

(assert (=> b!799833 (=> (not res!544348) (not e!443508))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43482 (_ BitVec 32)) Bool)

(assert (=> b!799833 (= res!544348 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!68692 res!544346) b!799832))

(assert (= (and b!799832 res!544345) b!799823))

(assert (= (and b!799823 res!544350) b!799822))

(assert (= (and b!799822 res!544340) b!799830))

(assert (= (and b!799830 res!544344) b!799825))

(assert (= (and b!799825 res!544352) b!799833))

(assert (= (and b!799833 res!544348) b!799824))

(assert (= (and b!799824 res!544343) b!799827))

(assert (= (and b!799827 res!544347) b!799826))

(assert (= (and b!799826 res!544349) b!799828))

(assert (= (and b!799828 res!544342) b!799831))

(assert (= (and b!799831 res!544341) b!799821))

(assert (= (and b!799821 res!544351) b!799829))

(declare-fun m!740861 () Bool)

(assert (=> b!799826 m!740861))

(declare-fun m!740863 () Bool)

(assert (=> b!799826 m!740863))

(declare-fun m!740865 () Bool)

(assert (=> b!799826 m!740865))

(declare-fun m!740867 () Bool)

(assert (=> b!799826 m!740867))

(declare-fun m!740869 () Bool)

(assert (=> b!799822 m!740869))

(declare-fun m!740871 () Bool)

(assert (=> b!799828 m!740871))

(declare-fun m!740873 () Bool)

(assert (=> b!799828 m!740873))

(assert (=> b!799828 m!740873))

(declare-fun m!740875 () Bool)

(assert (=> b!799828 m!740875))

(assert (=> b!799828 m!740873))

(declare-fun m!740877 () Bool)

(assert (=> b!799828 m!740877))

(declare-fun m!740879 () Bool)

(assert (=> b!799827 m!740879))

(declare-fun m!740881 () Bool)

(assert (=> b!799827 m!740881))

(declare-fun m!740883 () Bool)

(assert (=> b!799825 m!740883))

(declare-fun m!740885 () Bool)

(assert (=> b!799833 m!740885))

(declare-fun m!740887 () Bool)

(assert (=> b!799824 m!740887))

(declare-fun m!740889 () Bool)

(assert (=> b!799821 m!740889))

(assert (=> b!799829 m!740873))

(assert (=> b!799829 m!740873))

(declare-fun m!740891 () Bool)

(assert (=> b!799829 m!740891))

(assert (=> b!799823 m!740873))

(assert (=> b!799823 m!740873))

(declare-fun m!740893 () Bool)

(assert (=> b!799823 m!740893))

(declare-fun m!740895 () Bool)

(assert (=> b!799831 m!740895))

(declare-fun m!740897 () Bool)

(assert (=> start!68692 m!740897))

(declare-fun m!740899 () Bool)

(assert (=> start!68692 m!740899))

(declare-fun m!740901 () Bool)

(assert (=> b!799830 m!740901))

(check-sat (not b!799829) (not b!799822) (not b!799821) (not b!799828) (not b!799831) (not b!799824) (not b!799833) (not b!799830) (not b!799826) (not b!799823) (not b!799825) (not start!68692))
(check-sat)
