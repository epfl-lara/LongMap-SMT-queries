; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69100 () Bool)

(assert start!69100)

(declare-fun b!806003 () Bool)

(declare-fun res!550329 () Bool)

(declare-fun e!446347 () Bool)

(assert (=> b!806003 (=> (not res!550329) (not e!446347))))

(declare-datatypes ((array!43845 0))(
  ( (array!43846 (arr!21001 (Array (_ BitVec 32) (_ BitVec 64))) (size!21422 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43845)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43845 (_ BitVec 32)) Bool)

(assert (=> b!806003 (= res!550329 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!806004 () Bool)

(declare-fun res!550333 () Bool)

(declare-fun e!446348 () Bool)

(assert (=> b!806004 (=> (not res!550333) (not e!446348))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43845 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!806004 (= res!550333 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!806005 () Bool)

(declare-fun res!550334 () Bool)

(assert (=> b!806005 (=> (not res!550334) (not e!446348))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!806005 (= res!550334 (validKeyInArray!0 k0!2044))))

(declare-fun b!806006 () Bool)

(declare-fun res!550327 () Bool)

(assert (=> b!806006 (=> (not res!550327) (not e!446347))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!806006 (= res!550327 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21422 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21001 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21422 a!3170)) (= (select (arr!21001 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!806007 () Bool)

(declare-fun e!446344 () Bool)

(assert (=> b!806007 (= e!446344 (not true))))

(declare-datatypes ((SeekEntryResult!8592 0))(
  ( (MissingZero!8592 (index!36736 (_ BitVec 32))) (Found!8592 (index!36737 (_ BitVec 32))) (Intermediate!8592 (undefined!9404 Bool) (index!36738 (_ BitVec 32)) (x!67553 (_ BitVec 32))) (Undefined!8592) (MissingVacant!8592 (index!36739 (_ BitVec 32))) )
))
(declare-fun lt!360929 () SeekEntryResult!8592)

(assert (=> b!806007 (= lt!360929 (Found!8592 index!1236))))

(declare-fun b!806009 () Bool)

(declare-fun res!550325 () Bool)

(assert (=> b!806009 (=> (not res!550325) (not e!446348))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!806009 (= res!550325 (validKeyInArray!0 (select (arr!21001 a!3170) j!153)))))

(declare-fun b!806010 () Bool)

(declare-fun res!550330 () Bool)

(assert (=> b!806010 (=> (not res!550330) (not e!446347))))

(declare-datatypes ((List!14964 0))(
  ( (Nil!14961) (Cons!14960 (h!16089 (_ BitVec 64)) (t!21279 List!14964)) )
))
(declare-fun arrayNoDuplicates!0 (array!43845 (_ BitVec 32) List!14964) Bool)

(assert (=> b!806010 (= res!550330 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14961))))

(declare-fun b!806011 () Bool)

(declare-fun res!550331 () Bool)

(assert (=> b!806011 (=> (not res!550331) (not e!446348))))

(assert (=> b!806011 (= res!550331 (and (= (size!21422 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21422 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21422 a!3170)) (not (= i!1163 j!153))))))

(declare-fun res!550328 () Bool)

(assert (=> start!69100 (=> (not res!550328) (not e!446348))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69100 (= res!550328 (validMask!0 mask!3266))))

(assert (=> start!69100 e!446348))

(assert (=> start!69100 true))

(declare-fun array_inv!16797 (array!43845) Bool)

(assert (=> start!69100 (array_inv!16797 a!3170)))

(declare-fun b!806008 () Bool)

(declare-fun e!446346 () Bool)

(assert (=> b!806008 (= e!446347 e!446346)))

(declare-fun res!550332 () Bool)

(assert (=> b!806008 (=> (not res!550332) (not e!446346))))

(declare-fun lt!360930 () SeekEntryResult!8592)

(assert (=> b!806008 (= res!550332 (= lt!360930 lt!360929))))

(declare-fun lt!360926 () (_ BitVec 64))

(declare-fun lt!360932 () array!43845)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43845 (_ BitVec 32)) SeekEntryResult!8592)

(assert (=> b!806008 (= lt!360929 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360926 lt!360932 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43845 (_ BitVec 32)) SeekEntryResult!8592)

(assert (=> b!806008 (= lt!360930 (seekEntryOrOpen!0 lt!360926 lt!360932 mask!3266))))

(assert (=> b!806008 (= lt!360926 (select (store (arr!21001 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!806008 (= lt!360932 (array!43846 (store (arr!21001 a!3170) i!1163 k0!2044) (size!21422 a!3170)))))

(declare-fun b!806012 () Bool)

(assert (=> b!806012 (= e!446346 e!446344)))

(declare-fun res!550324 () Bool)

(assert (=> b!806012 (=> (not res!550324) (not e!446344))))

(declare-fun lt!360928 () SeekEntryResult!8592)

(declare-fun lt!360927 () SeekEntryResult!8592)

(assert (=> b!806012 (= res!550324 (and (= lt!360928 lt!360927) (= lt!360927 (Found!8592 j!153)) (= (select (arr!21001 a!3170) index!1236) (select (arr!21001 a!3170) j!153))))))

(assert (=> b!806012 (= lt!360927 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21001 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!806012 (= lt!360928 (seekEntryOrOpen!0 (select (arr!21001 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!806013 () Bool)

(assert (=> b!806013 (= e!446348 e!446347)))

(declare-fun res!550326 () Bool)

(assert (=> b!806013 (=> (not res!550326) (not e!446347))))

(declare-fun lt!360931 () SeekEntryResult!8592)

(assert (=> b!806013 (= res!550326 (or (= lt!360931 (MissingZero!8592 i!1163)) (= lt!360931 (MissingVacant!8592 i!1163))))))

(assert (=> b!806013 (= lt!360931 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(assert (= (and start!69100 res!550328) b!806011))

(assert (= (and b!806011 res!550331) b!806009))

(assert (= (and b!806009 res!550325) b!806005))

(assert (= (and b!806005 res!550334) b!806004))

(assert (= (and b!806004 res!550333) b!806013))

(assert (= (and b!806013 res!550326) b!806003))

(assert (= (and b!806003 res!550329) b!806010))

(assert (= (and b!806010 res!550330) b!806006))

(assert (= (and b!806006 res!550327) b!806008))

(assert (= (and b!806008 res!550332) b!806012))

(assert (= (and b!806012 res!550324) b!806007))

(declare-fun m!747953 () Bool)

(assert (=> b!806010 m!747953))

(declare-fun m!747955 () Bool)

(assert (=> b!806006 m!747955))

(declare-fun m!747957 () Bool)

(assert (=> b!806006 m!747957))

(declare-fun m!747959 () Bool)

(assert (=> b!806013 m!747959))

(declare-fun m!747961 () Bool)

(assert (=> b!806008 m!747961))

(declare-fun m!747963 () Bool)

(assert (=> b!806008 m!747963))

(declare-fun m!747965 () Bool)

(assert (=> b!806008 m!747965))

(declare-fun m!747967 () Bool)

(assert (=> b!806008 m!747967))

(declare-fun m!747969 () Bool)

(assert (=> start!69100 m!747969))

(declare-fun m!747971 () Bool)

(assert (=> start!69100 m!747971))

(declare-fun m!747973 () Bool)

(assert (=> b!806003 m!747973))

(declare-fun m!747975 () Bool)

(assert (=> b!806012 m!747975))

(declare-fun m!747977 () Bool)

(assert (=> b!806012 m!747977))

(assert (=> b!806012 m!747977))

(declare-fun m!747979 () Bool)

(assert (=> b!806012 m!747979))

(assert (=> b!806012 m!747977))

(declare-fun m!747981 () Bool)

(assert (=> b!806012 m!747981))

(declare-fun m!747983 () Bool)

(assert (=> b!806004 m!747983))

(declare-fun m!747985 () Bool)

(assert (=> b!806005 m!747985))

(assert (=> b!806009 m!747977))

(assert (=> b!806009 m!747977))

(declare-fun m!747987 () Bool)

(assert (=> b!806009 m!747987))

(check-sat (not b!806010) (not b!806009) (not b!806012) (not b!806004) (not b!806013) (not start!69100) (not b!806008) (not b!806003) (not b!806005))
(check-sat)
