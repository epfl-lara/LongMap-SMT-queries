; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68590 () Bool)

(assert start!68590)

(declare-fun b!798007 () Bool)

(declare-fun e!442689 () Bool)

(declare-fun e!442690 () Bool)

(assert (=> b!798007 (= e!442689 e!442690)))

(declare-fun res!542536 () Bool)

(assert (=> b!798007 (=> (not res!542536) (not e!442690))))

(declare-datatypes ((SeekEntryResult!8361 0))(
  ( (MissingZero!8361 (index!35812 (_ BitVec 32))) (Found!8361 (index!35813 (_ BitVec 32))) (Intermediate!8361 (undefined!9173 Bool) (index!35814 (_ BitVec 32)) (x!66703 (_ BitVec 32))) (Undefined!8361) (MissingVacant!8361 (index!35815 (_ BitVec 32))) )
))
(declare-fun lt!356137 () SeekEntryResult!8361)

(declare-fun lt!356140 () SeekEntryResult!8361)

(declare-datatypes ((array!43380 0))(
  ( (array!43381 (arr!20770 (Array (_ BitVec 32) (_ BitVec 64))) (size!21191 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43380)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!798007 (= res!542536 (and (= lt!356137 lt!356140) (= (select (arr!20770 a!3170) index!1236) (select (arr!20770 a!3170) j!153))))))

(assert (=> b!798007 (= lt!356140 (Found!8361 j!153))))

(declare-fun res!542532 () Bool)

(declare-fun e!442691 () Bool)

(assert (=> start!68590 (=> (not res!542532) (not e!442691))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68590 (= res!542532 (validMask!0 mask!3266))))

(assert (=> start!68590 e!442691))

(assert (=> start!68590 true))

(declare-fun array_inv!16566 (array!43380) Bool)

(assert (=> start!68590 (array_inv!16566 a!3170)))

(declare-fun b!798008 () Bool)

(declare-fun res!542537 () Bool)

(declare-fun e!442687 () Bool)

(assert (=> b!798008 (=> (not res!542537) (not e!442687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43380 (_ BitVec 32)) Bool)

(assert (=> b!798008 (= res!542537 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!798009 () Bool)

(declare-fun res!542526 () Bool)

(assert (=> b!798009 (=> (not res!542526) (not e!442691))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!798009 (= res!542526 (validKeyInArray!0 (select (arr!20770 a!3170) j!153)))))

(declare-fun b!798010 () Bool)

(declare-fun e!442688 () Bool)

(assert (=> b!798010 (= e!442688 e!442689)))

(declare-fun res!542530 () Bool)

(assert (=> b!798010 (=> (not res!542530) (not e!442689))))

(declare-fun lt!356139 () SeekEntryResult!8361)

(assert (=> b!798010 (= res!542530 (= lt!356139 lt!356137))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43380 (_ BitVec 32)) SeekEntryResult!8361)

(assert (=> b!798010 (= lt!356137 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20770 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43380 (_ BitVec 32)) SeekEntryResult!8361)

(assert (=> b!798010 (= lt!356139 (seekEntryOrOpen!0 (select (arr!20770 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!798011 () Bool)

(declare-fun res!542533 () Bool)

(assert (=> b!798011 (=> (not res!542533) (not e!442687))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!798011 (= res!542533 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21191 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20770 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21191 a!3170)) (= (select (arr!20770 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!798012 () Bool)

(declare-fun res!542535 () Bool)

(assert (=> b!798012 (=> (not res!542535) (not e!442691))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!798012 (= res!542535 (validKeyInArray!0 k0!2044))))

(declare-fun b!798013 () Bool)

(declare-fun res!542531 () Bool)

(assert (=> b!798013 (=> (not res!542531) (not e!442691))))

(declare-fun arrayContainsKey!0 (array!43380 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!798013 (= res!542531 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun lt!356142 () SeekEntryResult!8361)

(declare-fun b!798014 () Bool)

(assert (=> b!798014 (= e!442690 (not (or (not (= lt!356142 lt!356140)) (bvslt mask!3266 #b00000000000000000000000000000000) (bvslt index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)))))))

(assert (=> b!798014 (= lt!356142 (Found!8361 index!1236))))

(declare-fun b!798015 () Bool)

(declare-fun res!542534 () Bool)

(assert (=> b!798015 (=> (not res!542534) (not e!442691))))

(assert (=> b!798015 (= res!542534 (and (= (size!21191 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21191 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21191 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!798016 () Bool)

(assert (=> b!798016 (= e!442691 e!442687)))

(declare-fun res!542528 () Bool)

(assert (=> b!798016 (=> (not res!542528) (not e!442687))))

(declare-fun lt!356143 () SeekEntryResult!8361)

(assert (=> b!798016 (= res!542528 (or (= lt!356143 (MissingZero!8361 i!1163)) (= lt!356143 (MissingVacant!8361 i!1163))))))

(assert (=> b!798016 (= lt!356143 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!798017 () Bool)

(assert (=> b!798017 (= e!442687 e!442688)))

(declare-fun res!542529 () Bool)

(assert (=> b!798017 (=> (not res!542529) (not e!442688))))

(declare-fun lt!356138 () SeekEntryResult!8361)

(assert (=> b!798017 (= res!542529 (= lt!356138 lt!356142))))

(declare-fun lt!356144 () array!43380)

(declare-fun lt!356141 () (_ BitVec 64))

(assert (=> b!798017 (= lt!356142 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!356141 lt!356144 mask!3266))))

(assert (=> b!798017 (= lt!356138 (seekEntryOrOpen!0 lt!356141 lt!356144 mask!3266))))

(assert (=> b!798017 (= lt!356141 (select (store (arr!20770 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!798017 (= lt!356144 (array!43381 (store (arr!20770 a!3170) i!1163 k0!2044) (size!21191 a!3170)))))

(declare-fun b!798018 () Bool)

(declare-fun res!542527 () Bool)

(assert (=> b!798018 (=> (not res!542527) (not e!442687))))

(declare-datatypes ((List!14733 0))(
  ( (Nil!14730) (Cons!14729 (h!15858 (_ BitVec 64)) (t!21048 List!14733)) )
))
(declare-fun arrayNoDuplicates!0 (array!43380 (_ BitVec 32) List!14733) Bool)

(assert (=> b!798018 (= res!542527 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14730))))

(assert (= (and start!68590 res!542532) b!798015))

(assert (= (and b!798015 res!542534) b!798009))

(assert (= (and b!798009 res!542526) b!798012))

(assert (= (and b!798012 res!542535) b!798013))

(assert (= (and b!798013 res!542531) b!798016))

(assert (= (and b!798016 res!542528) b!798008))

(assert (= (and b!798008 res!542537) b!798018))

(assert (= (and b!798018 res!542527) b!798011))

(assert (= (and b!798011 res!542533) b!798017))

(assert (= (and b!798017 res!542529) b!798010))

(assert (= (and b!798010 res!542530) b!798007))

(assert (= (and b!798007 res!542536) b!798014))

(declare-fun m!738887 () Bool)

(assert (=> start!68590 m!738887))

(declare-fun m!738889 () Bool)

(assert (=> start!68590 m!738889))

(declare-fun m!738891 () Bool)

(assert (=> b!798017 m!738891))

(declare-fun m!738893 () Bool)

(assert (=> b!798017 m!738893))

(declare-fun m!738895 () Bool)

(assert (=> b!798017 m!738895))

(declare-fun m!738897 () Bool)

(assert (=> b!798017 m!738897))

(declare-fun m!738899 () Bool)

(assert (=> b!798016 m!738899))

(declare-fun m!738901 () Bool)

(assert (=> b!798010 m!738901))

(assert (=> b!798010 m!738901))

(declare-fun m!738903 () Bool)

(assert (=> b!798010 m!738903))

(assert (=> b!798010 m!738901))

(declare-fun m!738905 () Bool)

(assert (=> b!798010 m!738905))

(declare-fun m!738907 () Bool)

(assert (=> b!798018 m!738907))

(declare-fun m!738909 () Bool)

(assert (=> b!798011 m!738909))

(declare-fun m!738911 () Bool)

(assert (=> b!798011 m!738911))

(declare-fun m!738913 () Bool)

(assert (=> b!798012 m!738913))

(declare-fun m!738915 () Bool)

(assert (=> b!798008 m!738915))

(assert (=> b!798009 m!738901))

(assert (=> b!798009 m!738901))

(declare-fun m!738917 () Bool)

(assert (=> b!798009 m!738917))

(declare-fun m!738919 () Bool)

(assert (=> b!798007 m!738919))

(assert (=> b!798007 m!738901))

(declare-fun m!738921 () Bool)

(assert (=> b!798013 m!738921))

(check-sat (not start!68590) (not b!798010) (not b!798018) (not b!798016) (not b!798008) (not b!798017) (not b!798009) (not b!798012) (not b!798013))
(check-sat)
