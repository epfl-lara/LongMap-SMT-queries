; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68550 () Bool)

(assert start!68550)

(declare-fun b!795936 () Bool)

(declare-fun e!441865 () Bool)

(assert (=> b!795936 (= e!441865 false)))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8230 0))(
  ( (MissingZero!8230 (index!35288 (_ BitVec 32))) (Found!8230 (index!35289 (_ BitVec 32))) (Intermediate!8230 (undefined!9042 Bool) (index!35290 (_ BitVec 32)) (x!66367 (_ BitVec 32))) (Undefined!8230) (MissingVacant!8230 (index!35291 (_ BitVec 32))) )
))
(declare-fun lt!354768 () SeekEntryResult!8230)

(declare-datatypes ((array!43214 0))(
  ( (array!43215 (arr!20683 (Array (_ BitVec 32) (_ BitVec 64))) (size!21103 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43214)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43214 (_ BitVec 32)) SeekEntryResult!8230)

(assert (=> b!795936 (= lt!354768 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20683 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!354769 () SeekEntryResult!8230)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43214 (_ BitVec 32)) SeekEntryResult!8230)

(assert (=> b!795936 (= lt!354769 (seekEntryOrOpen!0 (select (arr!20683 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!795937 () Bool)

(declare-fun res!540090 () Bool)

(declare-fun e!441864 () Bool)

(assert (=> b!795937 (=> (not res!540090) (not e!441864))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43214 (_ BitVec 32)) Bool)

(assert (=> b!795937 (= res!540090 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!540089 () Bool)

(declare-fun e!441863 () Bool)

(assert (=> start!68550 (=> (not res!540089) (not e!441863))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68550 (= res!540089 (validMask!0 mask!3266))))

(assert (=> start!68550 e!441863))

(assert (=> start!68550 true))

(declare-fun array_inv!16542 (array!43214) Bool)

(assert (=> start!68550 (array_inv!16542 a!3170)))

(declare-fun b!795938 () Bool)

(declare-fun res!540086 () Bool)

(assert (=> b!795938 (=> (not res!540086) (not e!441863))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!795938 (= res!540086 (validKeyInArray!0 k0!2044))))

(declare-fun b!795939 () Bool)

(declare-fun res!540083 () Bool)

(assert (=> b!795939 (=> (not res!540083) (not e!441864))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!795939 (= res!540083 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21103 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20683 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21103 a!3170)) (= (select (arr!20683 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!795940 () Bool)

(declare-fun res!540088 () Bool)

(assert (=> b!795940 (=> (not res!540088) (not e!441863))))

(declare-fun arrayContainsKey!0 (array!43214 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!795940 (= res!540088 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!795941 () Bool)

(declare-fun res!540081 () Bool)

(assert (=> b!795941 (=> (not res!540081) (not e!441863))))

(assert (=> b!795941 (= res!540081 (validKeyInArray!0 (select (arr!20683 a!3170) j!153)))))

(declare-fun b!795942 () Bool)

(declare-fun res!540082 () Bool)

(assert (=> b!795942 (=> (not res!540082) (not e!441863))))

(assert (=> b!795942 (= res!540082 (and (= (size!21103 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21103 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21103 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!795943 () Bool)

(declare-fun res!540085 () Bool)

(assert (=> b!795943 (=> (not res!540085) (not e!441864))))

(declare-datatypes ((List!14553 0))(
  ( (Nil!14550) (Cons!14549 (h!15684 (_ BitVec 64)) (t!20860 List!14553)) )
))
(declare-fun arrayNoDuplicates!0 (array!43214 (_ BitVec 32) List!14553) Bool)

(assert (=> b!795943 (= res!540085 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14550))))

(declare-fun b!795944 () Bool)

(assert (=> b!795944 (= e!441864 e!441865)))

(declare-fun res!540084 () Bool)

(assert (=> b!795944 (=> (not res!540084) (not e!441865))))

(declare-fun lt!354771 () (_ BitVec 64))

(declare-fun lt!354772 () array!43214)

(assert (=> b!795944 (= res!540084 (= (seekEntryOrOpen!0 lt!354771 lt!354772 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354771 lt!354772 mask!3266)))))

(assert (=> b!795944 (= lt!354771 (select (store (arr!20683 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!795944 (= lt!354772 (array!43215 (store (arr!20683 a!3170) i!1163 k0!2044) (size!21103 a!3170)))))

(declare-fun b!795945 () Bool)

(assert (=> b!795945 (= e!441863 e!441864)))

(declare-fun res!540087 () Bool)

(assert (=> b!795945 (=> (not res!540087) (not e!441864))))

(declare-fun lt!354770 () SeekEntryResult!8230)

(assert (=> b!795945 (= res!540087 (or (= lt!354770 (MissingZero!8230 i!1163)) (= lt!354770 (MissingVacant!8230 i!1163))))))

(assert (=> b!795945 (= lt!354770 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(assert (= (and start!68550 res!540089) b!795942))

(assert (= (and b!795942 res!540082) b!795941))

(assert (= (and b!795941 res!540081) b!795938))

(assert (= (and b!795938 res!540086) b!795940))

(assert (= (and b!795940 res!540088) b!795945))

(assert (= (and b!795945 res!540087) b!795937))

(assert (= (and b!795937 res!540090) b!795943))

(assert (= (and b!795943 res!540085) b!795939))

(assert (= (and b!795939 res!540083) b!795944))

(assert (= (and b!795944 res!540084) b!795936))

(declare-fun m!736979 () Bool)

(assert (=> b!795944 m!736979))

(declare-fun m!736981 () Bool)

(assert (=> b!795944 m!736981))

(declare-fun m!736983 () Bool)

(assert (=> b!795944 m!736983))

(declare-fun m!736985 () Bool)

(assert (=> b!795944 m!736985))

(declare-fun m!736987 () Bool)

(assert (=> b!795941 m!736987))

(assert (=> b!795941 m!736987))

(declare-fun m!736989 () Bool)

(assert (=> b!795941 m!736989))

(declare-fun m!736991 () Bool)

(assert (=> b!795943 m!736991))

(declare-fun m!736993 () Bool)

(assert (=> b!795945 m!736993))

(assert (=> b!795936 m!736987))

(assert (=> b!795936 m!736987))

(declare-fun m!736995 () Bool)

(assert (=> b!795936 m!736995))

(assert (=> b!795936 m!736987))

(declare-fun m!736997 () Bool)

(assert (=> b!795936 m!736997))

(declare-fun m!736999 () Bool)

(assert (=> start!68550 m!736999))

(declare-fun m!737001 () Bool)

(assert (=> start!68550 m!737001))

(declare-fun m!737003 () Bool)

(assert (=> b!795940 m!737003))

(declare-fun m!737005 () Bool)

(assert (=> b!795938 m!737005))

(declare-fun m!737007 () Bool)

(assert (=> b!795939 m!737007))

(declare-fun m!737009 () Bool)

(assert (=> b!795939 m!737009))

(declare-fun m!737011 () Bool)

(assert (=> b!795937 m!737011))

(check-sat (not b!795941) (not b!795936) (not start!68550) (not b!795940) (not b!795945) (not b!795937) (not b!795938) (not b!795943) (not b!795944))
(check-sat)
