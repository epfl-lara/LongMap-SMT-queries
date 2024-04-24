; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68870 () Bool)

(assert start!68870)

(declare-fun b!800904 () Bool)

(declare-fun e!444172 () Bool)

(declare-fun e!444167 () Bool)

(assert (=> b!800904 (= e!444172 e!444167)))

(declare-fun res!544885 () Bool)

(assert (=> b!800904 (=> (not res!544885) (not e!444167))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8368 0))(
  ( (MissingZero!8368 (index!35840 (_ BitVec 32))) (Found!8368 (index!35841 (_ BitVec 32))) (Intermediate!8368 (undefined!9180 Bool) (index!35842 (_ BitVec 32)) (x!66876 (_ BitVec 32))) (Undefined!8368) (MissingVacant!8368 (index!35843 (_ BitVec 32))) )
))
(declare-fun lt!357703 () SeekEntryResult!8368)

(declare-datatypes ((array!43492 0))(
  ( (array!43493 (arr!20821 (Array (_ BitVec 32) (_ BitVec 64))) (size!21241 (_ BitVec 32))) )
))
(declare-fun lt!357707 () array!43492)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!357704 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43492 (_ BitVec 32)) SeekEntryResult!8368)

(assert (=> b!800904 (= res!544885 (= lt!357703 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!357704 lt!357707 mask!3266)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43492 (_ BitVec 32)) SeekEntryResult!8368)

(assert (=> b!800904 (= lt!357703 (seekEntryOrOpen!0 lt!357704 lt!357707 mask!3266))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun a!3170 () array!43492)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!800904 (= lt!357704 (select (store (arr!20821 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!800904 (= lt!357707 (array!43493 (store (arr!20821 a!3170) i!1163 k0!2044) (size!21241 a!3170)))))

(declare-fun b!800905 () Bool)

(declare-fun res!544882 () Bool)

(declare-fun e!444170 () Bool)

(assert (=> b!800905 (=> (not res!544882) (not e!444170))))

(assert (=> b!800905 (= res!544882 (and (= (size!21241 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21241 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21241 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!800906 () Bool)

(declare-fun res!544876 () Bool)

(assert (=> b!800906 (=> (not res!544876) (not e!444170))))

(declare-fun arrayContainsKey!0 (array!43492 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!800906 (= res!544876 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!800907 () Bool)

(declare-fun e!444169 () Bool)

(declare-fun e!444168 () Bool)

(assert (=> b!800907 (= e!444169 e!444168)))

(declare-fun res!544875 () Bool)

(assert (=> b!800907 (=> (not res!544875) (not e!444168))))

(declare-fun lt!357705 () (_ BitVec 32))

(assert (=> b!800907 (= res!544875 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!357705 #b00000000000000000000000000000000) (bvslt lt!357705 (size!21241 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!800907 (= lt!357705 (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(declare-fun b!800908 () Bool)

(declare-fun res!544886 () Bool)

(assert (=> b!800908 (=> (not res!544886) (not e!444170))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!800908 (= res!544886 (validKeyInArray!0 k0!2044))))

(declare-fun b!800909 () Bool)

(declare-fun res!544883 () Bool)

(assert (=> b!800909 (=> (not res!544883) (not e!444172))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43492 (_ BitVec 32)) Bool)

(assert (=> b!800909 (= res!544883 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!800910 () Bool)

(assert (=> b!800910 (= e!444167 e!444169)))

(declare-fun res!544880 () Bool)

(assert (=> b!800910 (=> (not res!544880) (not e!444169))))

(declare-fun lt!357706 () SeekEntryResult!8368)

(declare-fun lt!357709 () SeekEntryResult!8368)

(assert (=> b!800910 (= res!544880 (and (= lt!357709 lt!357706) (= lt!357706 (Found!8368 j!153)) (not (= (select (arr!20821 a!3170) index!1236) (select (arr!20821 a!3170) j!153)))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!800910 (= lt!357706 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20821 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!800910 (= lt!357709 (seekEntryOrOpen!0 (select (arr!20821 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!800911 () Bool)

(assert (=> b!800911 (= e!444168 false)))

(declare-fun lt!357710 () SeekEntryResult!8368)

(assert (=> b!800911 (= lt!357710 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357705 vacantBefore!23 (select (arr!20821 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!800913 () Bool)

(assert (=> b!800913 (= e!444170 e!444172)))

(declare-fun res!544887 () Bool)

(assert (=> b!800913 (=> (not res!544887) (not e!444172))))

(declare-fun lt!357708 () SeekEntryResult!8368)

(assert (=> b!800913 (= res!544887 (or (= lt!357708 (MissingZero!8368 i!1163)) (= lt!357708 (MissingVacant!8368 i!1163))))))

(assert (=> b!800913 (= lt!357708 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!800914 () Bool)

(declare-fun res!544884 () Bool)

(assert (=> b!800914 (=> (not res!544884) (not e!444172))))

(assert (=> b!800914 (= res!544884 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21241 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20821 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21241 a!3170)) (= (select (arr!20821 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!800915 () Bool)

(declare-fun res!544878 () Bool)

(assert (=> b!800915 (=> (not res!544878) (not e!444168))))

(assert (=> b!800915 (= res!544878 (= lt!357703 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357705 vacantAfter!23 lt!357704 lt!357707 mask!3266)))))

(declare-fun b!800916 () Bool)

(declare-fun res!544879 () Bool)

(assert (=> b!800916 (=> (not res!544879) (not e!444172))))

(declare-datatypes ((List!14691 0))(
  ( (Nil!14688) (Cons!14687 (h!15822 (_ BitVec 64)) (t!20998 List!14691)) )
))
(declare-fun arrayNoDuplicates!0 (array!43492 (_ BitVec 32) List!14691) Bool)

(assert (=> b!800916 (= res!544879 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14688))))

(declare-fun b!800912 () Bool)

(declare-fun res!544877 () Bool)

(assert (=> b!800912 (=> (not res!544877) (not e!444170))))

(assert (=> b!800912 (= res!544877 (validKeyInArray!0 (select (arr!20821 a!3170) j!153)))))

(declare-fun res!544881 () Bool)

(assert (=> start!68870 (=> (not res!544881) (not e!444170))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68870 (= res!544881 (validMask!0 mask!3266))))

(assert (=> start!68870 e!444170))

(assert (=> start!68870 true))

(declare-fun array_inv!16680 (array!43492) Bool)

(assert (=> start!68870 (array_inv!16680 a!3170)))

(assert (= (and start!68870 res!544881) b!800905))

(assert (= (and b!800905 res!544882) b!800912))

(assert (= (and b!800912 res!544877) b!800908))

(assert (= (and b!800908 res!544886) b!800906))

(assert (= (and b!800906 res!544876) b!800913))

(assert (= (and b!800913 res!544887) b!800909))

(assert (= (and b!800909 res!544883) b!800916))

(assert (= (and b!800916 res!544879) b!800914))

(assert (= (and b!800914 res!544884) b!800904))

(assert (= (and b!800904 res!544885) b!800910))

(assert (= (and b!800910 res!544880) b!800907))

(assert (= (and b!800907 res!544875) b!800915))

(assert (= (and b!800915 res!544878) b!800911))

(declare-fun m!742327 () Bool)

(assert (=> b!800906 m!742327))

(declare-fun m!742329 () Bool)

(assert (=> b!800908 m!742329))

(declare-fun m!742331 () Bool)

(assert (=> b!800911 m!742331))

(assert (=> b!800911 m!742331))

(declare-fun m!742333 () Bool)

(assert (=> b!800911 m!742333))

(declare-fun m!742335 () Bool)

(assert (=> b!800910 m!742335))

(assert (=> b!800910 m!742331))

(assert (=> b!800910 m!742331))

(declare-fun m!742337 () Bool)

(assert (=> b!800910 m!742337))

(assert (=> b!800910 m!742331))

(declare-fun m!742339 () Bool)

(assert (=> b!800910 m!742339))

(declare-fun m!742341 () Bool)

(assert (=> b!800907 m!742341))

(declare-fun m!742343 () Bool)

(assert (=> b!800914 m!742343))

(declare-fun m!742345 () Bool)

(assert (=> b!800914 m!742345))

(declare-fun m!742347 () Bool)

(assert (=> b!800913 m!742347))

(declare-fun m!742349 () Bool)

(assert (=> start!68870 m!742349))

(declare-fun m!742351 () Bool)

(assert (=> start!68870 m!742351))

(declare-fun m!742353 () Bool)

(assert (=> b!800909 m!742353))

(assert (=> b!800912 m!742331))

(assert (=> b!800912 m!742331))

(declare-fun m!742355 () Bool)

(assert (=> b!800912 m!742355))

(declare-fun m!742357 () Bool)

(assert (=> b!800904 m!742357))

(declare-fun m!742359 () Bool)

(assert (=> b!800904 m!742359))

(declare-fun m!742361 () Bool)

(assert (=> b!800904 m!742361))

(declare-fun m!742363 () Bool)

(assert (=> b!800904 m!742363))

(declare-fun m!742365 () Bool)

(assert (=> b!800916 m!742365))

(declare-fun m!742367 () Bool)

(assert (=> b!800915 m!742367))

(check-sat (not b!800908) (not b!800912) (not b!800911) (not b!800910) (not start!68870) (not b!800904) (not b!800915) (not b!800907) (not b!800916) (not b!800909) (not b!800906) (not b!800913))
(check-sat)
