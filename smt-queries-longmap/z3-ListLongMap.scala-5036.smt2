; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68894 () Bool)

(assert start!68894)

(declare-fun b!801372 () Bool)

(declare-fun e!444387 () Bool)

(assert (=> b!801372 (= e!444387 false)))

(declare-datatypes ((SeekEntryResult!8380 0))(
  ( (MissingZero!8380 (index!35888 (_ BitVec 32))) (Found!8380 (index!35889 (_ BitVec 32))) (Intermediate!8380 (undefined!9192 Bool) (index!35890 (_ BitVec 32)) (x!66920 (_ BitVec 32))) (Undefined!8380) (MissingVacant!8380 (index!35891 (_ BitVec 32))) )
))
(declare-fun lt!357997 () SeekEntryResult!8380)

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((array!43516 0))(
  ( (array!43517 (arr!20833 (Array (_ BitVec 32) (_ BitVec 64))) (size!21253 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43516)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun lt!357994 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43516 (_ BitVec 32)) SeekEntryResult!8380)

(assert (=> b!801372 (= lt!357997 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357994 vacantBefore!23 (select (arr!20833 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!801373 () Bool)

(declare-fun e!444388 () Bool)

(declare-fun e!444386 () Bool)

(assert (=> b!801373 (= e!444388 e!444386)))

(declare-fun res!545346 () Bool)

(assert (=> b!801373 (=> (not res!545346) (not e!444386))))

(declare-fun lt!357992 () SeekEntryResult!8380)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!801373 (= res!545346 (or (= lt!357992 (MissingZero!8380 i!1163)) (= lt!357992 (MissingVacant!8380 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43516 (_ BitVec 32)) SeekEntryResult!8380)

(assert (=> b!801373 (= lt!357992 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!801374 () Bool)

(declare-fun res!545347 () Bool)

(assert (=> b!801374 (=> (not res!545347) (not e!444388))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!801374 (= res!545347 (validKeyInArray!0 k0!2044))))

(declare-fun b!801375 () Bool)

(declare-fun e!444384 () Bool)

(declare-fun e!444383 () Bool)

(assert (=> b!801375 (= e!444384 e!444383)))

(declare-fun res!545349 () Bool)

(assert (=> b!801375 (=> (not res!545349) (not e!444383))))

(declare-fun lt!357991 () SeekEntryResult!8380)

(declare-fun lt!357995 () SeekEntryResult!8380)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!801375 (= res!545349 (and (= lt!357991 lt!357995) (= lt!357995 (Found!8380 j!153)) (not (= (select (arr!20833 a!3170) index!1236) (select (arr!20833 a!3170) j!153)))))))

(assert (=> b!801375 (= lt!357995 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20833 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!801375 (= lt!357991 (seekEntryOrOpen!0 (select (arr!20833 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!801376 () Bool)

(assert (=> b!801376 (= e!444386 e!444384)))

(declare-fun res!545354 () Bool)

(assert (=> b!801376 (=> (not res!545354) (not e!444384))))

(declare-fun lt!357998 () array!43516)

(declare-fun lt!357996 () SeekEntryResult!8380)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!357993 () (_ BitVec 64))

(assert (=> b!801376 (= res!545354 (= lt!357996 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!357993 lt!357998 mask!3266)))))

(assert (=> b!801376 (= lt!357996 (seekEntryOrOpen!0 lt!357993 lt!357998 mask!3266))))

(assert (=> b!801376 (= lt!357993 (select (store (arr!20833 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!801376 (= lt!357998 (array!43517 (store (arr!20833 a!3170) i!1163 k0!2044) (size!21253 a!3170)))))

(declare-fun b!801377 () Bool)

(declare-fun res!545352 () Bool)

(assert (=> b!801377 (=> (not res!545352) (not e!444388))))

(assert (=> b!801377 (= res!545352 (validKeyInArray!0 (select (arr!20833 a!3170) j!153)))))

(declare-fun b!801378 () Bool)

(declare-fun res!545351 () Bool)

(assert (=> b!801378 (=> (not res!545351) (not e!444388))))

(declare-fun arrayContainsKey!0 (array!43516 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!801378 (= res!545351 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!801379 () Bool)

(assert (=> b!801379 (= e!444383 e!444387)))

(declare-fun res!545343 () Bool)

(assert (=> b!801379 (=> (not res!545343) (not e!444387))))

(assert (=> b!801379 (= res!545343 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!357994 #b00000000000000000000000000000000) (bvslt lt!357994 (size!21253 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!801379 (= lt!357994 (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(declare-fun b!801381 () Bool)

(declare-fun res!545345 () Bool)

(assert (=> b!801381 (=> (not res!545345) (not e!444388))))

(assert (=> b!801381 (= res!545345 (and (= (size!21253 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21253 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21253 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!801382 () Bool)

(declare-fun res!545348 () Bool)

(assert (=> b!801382 (=> (not res!545348) (not e!444386))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43516 (_ BitVec 32)) Bool)

(assert (=> b!801382 (= res!545348 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!801383 () Bool)

(declare-fun res!545353 () Bool)

(assert (=> b!801383 (=> (not res!545353) (not e!444386))))

(assert (=> b!801383 (= res!545353 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21253 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20833 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21253 a!3170)) (= (select (arr!20833 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!801384 () Bool)

(declare-fun res!545344 () Bool)

(assert (=> b!801384 (=> (not res!545344) (not e!444387))))

(assert (=> b!801384 (= res!545344 (= lt!357996 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357994 vacantAfter!23 lt!357993 lt!357998 mask!3266)))))

(declare-fun res!545350 () Bool)

(assert (=> start!68894 (=> (not res!545350) (not e!444388))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68894 (= res!545350 (validMask!0 mask!3266))))

(assert (=> start!68894 e!444388))

(assert (=> start!68894 true))

(declare-fun array_inv!16692 (array!43516) Bool)

(assert (=> start!68894 (array_inv!16692 a!3170)))

(declare-fun b!801380 () Bool)

(declare-fun res!545355 () Bool)

(assert (=> b!801380 (=> (not res!545355) (not e!444386))))

(declare-datatypes ((List!14703 0))(
  ( (Nil!14700) (Cons!14699 (h!15834 (_ BitVec 64)) (t!21010 List!14703)) )
))
(declare-fun arrayNoDuplicates!0 (array!43516 (_ BitVec 32) List!14703) Bool)

(assert (=> b!801380 (= res!545355 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14700))))

(assert (= (and start!68894 res!545350) b!801381))

(assert (= (and b!801381 res!545345) b!801377))

(assert (= (and b!801377 res!545352) b!801374))

(assert (= (and b!801374 res!545347) b!801378))

(assert (= (and b!801378 res!545351) b!801373))

(assert (= (and b!801373 res!545346) b!801382))

(assert (= (and b!801382 res!545348) b!801380))

(assert (= (and b!801380 res!545355) b!801383))

(assert (= (and b!801383 res!545353) b!801376))

(assert (= (and b!801376 res!545354) b!801375))

(assert (= (and b!801375 res!545349) b!801379))

(assert (= (and b!801379 res!545343) b!801384))

(assert (= (and b!801384 res!545344) b!801372))

(declare-fun m!742831 () Bool)

(assert (=> b!801383 m!742831))

(declare-fun m!742833 () Bool)

(assert (=> b!801383 m!742833))

(declare-fun m!742835 () Bool)

(assert (=> b!801374 m!742835))

(declare-fun m!742837 () Bool)

(assert (=> b!801384 m!742837))

(declare-fun m!742839 () Bool)

(assert (=> b!801375 m!742839))

(declare-fun m!742841 () Bool)

(assert (=> b!801375 m!742841))

(assert (=> b!801375 m!742841))

(declare-fun m!742843 () Bool)

(assert (=> b!801375 m!742843))

(assert (=> b!801375 m!742841))

(declare-fun m!742845 () Bool)

(assert (=> b!801375 m!742845))

(declare-fun m!742847 () Bool)

(assert (=> start!68894 m!742847))

(declare-fun m!742849 () Bool)

(assert (=> start!68894 m!742849))

(declare-fun m!742851 () Bool)

(assert (=> b!801376 m!742851))

(declare-fun m!742853 () Bool)

(assert (=> b!801376 m!742853))

(declare-fun m!742855 () Bool)

(assert (=> b!801376 m!742855))

(declare-fun m!742857 () Bool)

(assert (=> b!801376 m!742857))

(assert (=> b!801377 m!742841))

(assert (=> b!801377 m!742841))

(declare-fun m!742859 () Bool)

(assert (=> b!801377 m!742859))

(declare-fun m!742861 () Bool)

(assert (=> b!801382 m!742861))

(declare-fun m!742863 () Bool)

(assert (=> b!801378 m!742863))

(declare-fun m!742865 () Bool)

(assert (=> b!801373 m!742865))

(declare-fun m!742867 () Bool)

(assert (=> b!801379 m!742867))

(declare-fun m!742869 () Bool)

(assert (=> b!801380 m!742869))

(assert (=> b!801372 m!742841))

(assert (=> b!801372 m!742841))

(declare-fun m!742871 () Bool)

(assert (=> b!801372 m!742871))

(check-sat (not b!801377) (not start!68894) (not b!801379) (not b!801376) (not b!801373) (not b!801374) (not b!801380) (not b!801384) (not b!801375) (not b!801382) (not b!801372) (not b!801378))
(check-sat)
