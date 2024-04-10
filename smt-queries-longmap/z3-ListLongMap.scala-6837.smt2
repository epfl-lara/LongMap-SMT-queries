; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86062 () Bool)

(assert start!86062)

(declare-fun b!996937 () Bool)

(declare-fun res!667057 () Bool)

(declare-fun e!562358 () Bool)

(assert (=> b!996937 (=> (not res!667057) (not e!562358))))

(declare-datatypes ((array!63067 0))(
  ( (array!63068 (arr!30365 (Array (_ BitVec 32) (_ BitVec 64))) (size!30867 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63067)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63067 (_ BitVec 32)) Bool)

(assert (=> b!996937 (= res!667057 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!996938 () Bool)

(declare-fun res!667052 () Bool)

(declare-fun e!562359 () Bool)

(assert (=> b!996938 (=> (not res!667052) (not e!562359))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!996938 (= res!667052 (validKeyInArray!0 k0!2224))))

(declare-fun res!667055 () Bool)

(assert (=> start!86062 (=> (not res!667055) (not e!562359))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86062 (= res!667055 (validMask!0 mask!3464))))

(assert (=> start!86062 e!562359))

(declare-fun array_inv!23489 (array!63067) Bool)

(assert (=> start!86062 (array_inv!23489 a!3219)))

(assert (=> start!86062 true))

(declare-fun b!996939 () Bool)

(declare-fun res!667059 () Bool)

(assert (=> b!996939 (=> (not res!667059) (not e!562358))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!996939 (= res!667059 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30867 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30867 a!3219))))))

(declare-fun b!996940 () Bool)

(declare-fun res!667054 () Bool)

(assert (=> b!996940 (=> (not res!667054) (not e!562358))))

(declare-datatypes ((List!21041 0))(
  ( (Nil!21038) (Cons!21037 (h!22202 (_ BitVec 64)) (t!30042 List!21041)) )
))
(declare-fun arrayNoDuplicates!0 (array!63067 (_ BitVec 32) List!21041) Bool)

(assert (=> b!996940 (= res!667054 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21038))))

(declare-fun b!996941 () Bool)

(declare-fun res!667051 () Bool)

(assert (=> b!996941 (=> (not res!667051) (not e!562359))))

(declare-fun arrayContainsKey!0 (array!63067 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!996941 (= res!667051 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!996942 () Bool)

(declare-fun res!667053 () Bool)

(assert (=> b!996942 (=> (not res!667053) (not e!562359))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!996942 (= res!667053 (and (= (size!30867 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30867 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30867 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!996943 () Bool)

(assert (=> b!996943 (= e!562359 e!562358)))

(declare-fun res!667058 () Bool)

(assert (=> b!996943 (=> (not res!667058) (not e!562358))))

(declare-datatypes ((SeekEntryResult!9297 0))(
  ( (MissingZero!9297 (index!39559 (_ BitVec 32))) (Found!9297 (index!39560 (_ BitVec 32))) (Intermediate!9297 (undefined!10109 Bool) (index!39561 (_ BitVec 32)) (x!86989 (_ BitVec 32))) (Undefined!9297) (MissingVacant!9297 (index!39562 (_ BitVec 32))) )
))
(declare-fun lt!441313 () SeekEntryResult!9297)

(assert (=> b!996943 (= res!667058 (or (= lt!441313 (MissingVacant!9297 i!1194)) (= lt!441313 (MissingZero!9297 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63067 (_ BitVec 32)) SeekEntryResult!9297)

(assert (=> b!996943 (= lt!441313 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!996944 () Bool)

(assert (=> b!996944 (= e!562358 false)))

(declare-fun lt!441314 () SeekEntryResult!9297)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63067 (_ BitVec 32)) SeekEntryResult!9297)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!996944 (= lt!441314 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30365 a!3219) j!170) mask!3464) (select (arr!30365 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!996945 () Bool)

(declare-fun res!667056 () Bool)

(assert (=> b!996945 (=> (not res!667056) (not e!562359))))

(assert (=> b!996945 (= res!667056 (validKeyInArray!0 (select (arr!30365 a!3219) j!170)))))

(assert (= (and start!86062 res!667055) b!996942))

(assert (= (and b!996942 res!667053) b!996945))

(assert (= (and b!996945 res!667056) b!996938))

(assert (= (and b!996938 res!667052) b!996941))

(assert (= (and b!996941 res!667051) b!996943))

(assert (= (and b!996943 res!667058) b!996937))

(assert (= (and b!996937 res!667057) b!996940))

(assert (= (and b!996940 res!667054) b!996939))

(assert (= (and b!996939 res!667059) b!996944))

(declare-fun m!923937 () Bool)

(assert (=> start!86062 m!923937))

(declare-fun m!923939 () Bool)

(assert (=> start!86062 m!923939))

(declare-fun m!923941 () Bool)

(assert (=> b!996938 m!923941))

(declare-fun m!923943 () Bool)

(assert (=> b!996944 m!923943))

(assert (=> b!996944 m!923943))

(declare-fun m!923945 () Bool)

(assert (=> b!996944 m!923945))

(assert (=> b!996944 m!923945))

(assert (=> b!996944 m!923943))

(declare-fun m!923947 () Bool)

(assert (=> b!996944 m!923947))

(declare-fun m!923949 () Bool)

(assert (=> b!996943 m!923949))

(declare-fun m!923951 () Bool)

(assert (=> b!996941 m!923951))

(declare-fun m!923953 () Bool)

(assert (=> b!996937 m!923953))

(assert (=> b!996945 m!923943))

(assert (=> b!996945 m!923943))

(declare-fun m!923955 () Bool)

(assert (=> b!996945 m!923955))

(declare-fun m!923957 () Bool)

(assert (=> b!996940 m!923957))

(check-sat (not start!86062) (not b!996941) (not b!996940) (not b!996943) (not b!996937) (not b!996945) (not b!996938) (not b!996944))
(check-sat)
