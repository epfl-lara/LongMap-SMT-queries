; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87178 () Bool)

(assert start!87178)

(declare-fun b!1009929 () Bool)

(declare-fun res!678073 () Bool)

(declare-fun e!568326 () Bool)

(assert (=> b!1009929 (=> (not res!678073) (not e!568326))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(assert (=> b!1009929 (= res!678073 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun res!678072 () Bool)

(declare-fun e!568325 () Bool)

(assert (=> start!87178 (=> (not res!678072) (not e!568325))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!87178 (= res!678072 (validMask!0 mask!3464))))

(assert (=> start!87178 e!568325))

(declare-datatypes ((array!63645 0))(
  ( (array!63646 (arr!30637 (Array (_ BitVec 32) (_ BitVec 64))) (size!31140 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63645)

(declare-fun array_inv!23773 (array!63645) Bool)

(assert (=> start!87178 (array_inv!23773 a!3219)))

(assert (=> start!87178 true))

(declare-fun b!1009930 () Bool)

(declare-fun e!568322 () Bool)

(declare-fun e!568324 () Bool)

(assert (=> b!1009930 (= e!568322 e!568324)))

(declare-fun res!678062 () Bool)

(assert (=> b!1009930 (=> (not res!678062) (not e!568324))))

(declare-datatypes ((SeekEntryResult!9505 0))(
  ( (MissingZero!9505 (index!40391 (_ BitVec 32))) (Found!9505 (index!40392 (_ BitVec 32))) (Intermediate!9505 (undefined!10317 Bool) (index!40393 (_ BitVec 32)) (x!87939 (_ BitVec 32))) (Undefined!9505) (MissingVacant!9505 (index!40394 (_ BitVec 32))) )
))
(declare-fun lt!446302 () SeekEntryResult!9505)

(declare-fun lt!446305 () SeekEntryResult!9505)

(assert (=> b!1009930 (= res!678062 (= lt!446302 lt!446305))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63645 (_ BitVec 32)) SeekEntryResult!9505)

(assert (=> b!1009930 (= lt!446302 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30637 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1009931 () Bool)

(declare-fun res!678063 () Bool)

(assert (=> b!1009931 (=> (not res!678063) (not e!568325))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1009931 (= res!678063 (validKeyInArray!0 k0!2224))))

(declare-fun b!1009932 () Bool)

(declare-fun res!678068 () Bool)

(declare-fun e!568323 () Bool)

(assert (=> b!1009932 (=> (not res!678068) (not e!568323))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63645 (_ BitVec 32)) Bool)

(assert (=> b!1009932 (= res!678068 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1009933 () Bool)

(declare-fun res!678067 () Bool)

(assert (=> b!1009933 (=> (not res!678067) (not e!568325))))

(assert (=> b!1009933 (= res!678067 (validKeyInArray!0 (select (arr!30637 a!3219) j!170)))))

(declare-fun b!1009934 () Bool)

(assert (=> b!1009934 (= e!568323 e!568322)))

(declare-fun res!678074 () Bool)

(assert (=> b!1009934 (=> (not res!678074) (not e!568322))))

(declare-fun lt!446301 () SeekEntryResult!9505)

(assert (=> b!1009934 (= res!678074 (= lt!446301 lt!446305))))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1009934 (= lt!446305 (Intermediate!9505 false resIndex!38 resX!38))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1009934 (= lt!446301 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30637 a!3219) j!170) mask!3464) (select (arr!30637 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1009935 () Bool)

(declare-fun res!678071 () Bool)

(assert (=> b!1009935 (=> (not res!678071) (not e!568323))))

(assert (=> b!1009935 (= res!678071 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31140 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31140 a!3219))))))

(declare-fun b!1009936 () Bool)

(declare-fun res!678069 () Bool)

(assert (=> b!1009936 (=> (not res!678069) (not e!568323))))

(declare-datatypes ((List!21284 0))(
  ( (Nil!21281) (Cons!21280 (h!22475 (_ BitVec 64)) (t!30277 List!21284)) )
))
(declare-fun arrayNoDuplicates!0 (array!63645 (_ BitVec 32) List!21284) Bool)

(assert (=> b!1009936 (= res!678069 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21281))))

(declare-fun b!1009937 () Bool)

(declare-fun res!678066 () Bool)

(assert (=> b!1009937 (=> (not res!678066) (not e!568325))))

(declare-fun arrayContainsKey!0 (array!63645 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1009937 (= res!678066 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1009938 () Bool)

(assert (=> b!1009938 (= e!568326 false)))

(declare-fun lt!446300 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1009938 (= lt!446300 (nextIndex!0 index!1507 (bvadd #b00000000000000000000000000000001 x!1245) mask!3464))))

(declare-fun b!1009939 () Bool)

(assert (=> b!1009939 (= e!568324 e!568326)))

(declare-fun res!678061 () Bool)

(assert (=> b!1009939 (=> (not res!678061) (not e!568326))))

(declare-fun lt!446304 () array!63645)

(declare-fun lt!446306 () (_ BitVec 64))

(assert (=> b!1009939 (= res!678061 (not (= lt!446301 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!446306 mask!3464) lt!446306 lt!446304 mask!3464))))))

(assert (=> b!1009939 (= lt!446306 (select (store (arr!30637 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1009939 (= lt!446304 (array!63646 (store (arr!30637 a!3219) i!1194 k0!2224) (size!31140 a!3219)))))

(declare-fun b!1009940 () Bool)

(declare-fun res!678070 () Bool)

(assert (=> b!1009940 (=> (not res!678070) (not e!568325))))

(assert (=> b!1009940 (= res!678070 (and (= (size!31140 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31140 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31140 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1009941 () Bool)

(assert (=> b!1009941 (= e!568325 e!568323)))

(declare-fun res!678065 () Bool)

(assert (=> b!1009941 (=> (not res!678065) (not e!568323))))

(declare-fun lt!446303 () SeekEntryResult!9505)

(assert (=> b!1009941 (= res!678065 (or (= lt!446303 (MissingVacant!9505 i!1194)) (= lt!446303 (MissingZero!9505 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63645 (_ BitVec 32)) SeekEntryResult!9505)

(assert (=> b!1009941 (= lt!446303 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1009942 () Bool)

(declare-fun res!678064 () Bool)

(assert (=> b!1009942 (=> (not res!678064) (not e!568326))))

(assert (=> b!1009942 (= res!678064 (not (= lt!446302 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!446306 lt!446304 mask!3464))))))

(assert (= (and start!87178 res!678072) b!1009940))

(assert (= (and b!1009940 res!678070) b!1009933))

(assert (= (and b!1009933 res!678067) b!1009931))

(assert (= (and b!1009931 res!678063) b!1009937))

(assert (= (and b!1009937 res!678066) b!1009941))

(assert (= (and b!1009941 res!678065) b!1009932))

(assert (= (and b!1009932 res!678068) b!1009936))

(assert (= (and b!1009936 res!678069) b!1009935))

(assert (= (and b!1009935 res!678071) b!1009934))

(assert (= (and b!1009934 res!678074) b!1009930))

(assert (= (and b!1009930 res!678062) b!1009939))

(assert (= (and b!1009939 res!678061) b!1009942))

(assert (= (and b!1009942 res!678064) b!1009929))

(assert (= (and b!1009929 res!678073) b!1009938))

(declare-fun m!934919 () Bool)

(assert (=> b!1009942 m!934919))

(declare-fun m!934921 () Bool)

(assert (=> b!1009930 m!934921))

(assert (=> b!1009930 m!934921))

(declare-fun m!934923 () Bool)

(assert (=> b!1009930 m!934923))

(declare-fun m!934925 () Bool)

(assert (=> b!1009936 m!934925))

(declare-fun m!934927 () Bool)

(assert (=> b!1009938 m!934927))

(declare-fun m!934929 () Bool)

(assert (=> b!1009932 m!934929))

(declare-fun m!934931 () Bool)

(assert (=> b!1009937 m!934931))

(declare-fun m!934933 () Bool)

(assert (=> b!1009939 m!934933))

(assert (=> b!1009939 m!934933))

(declare-fun m!934935 () Bool)

(assert (=> b!1009939 m!934935))

(declare-fun m!934937 () Bool)

(assert (=> b!1009939 m!934937))

(declare-fun m!934939 () Bool)

(assert (=> b!1009939 m!934939))

(declare-fun m!934941 () Bool)

(assert (=> b!1009931 m!934941))

(declare-fun m!934943 () Bool)

(assert (=> b!1009941 m!934943))

(declare-fun m!934945 () Bool)

(assert (=> start!87178 m!934945))

(declare-fun m!934947 () Bool)

(assert (=> start!87178 m!934947))

(assert (=> b!1009933 m!934921))

(assert (=> b!1009933 m!934921))

(declare-fun m!934949 () Bool)

(assert (=> b!1009933 m!934949))

(assert (=> b!1009934 m!934921))

(assert (=> b!1009934 m!934921))

(declare-fun m!934951 () Bool)

(assert (=> b!1009934 m!934951))

(assert (=> b!1009934 m!934951))

(assert (=> b!1009934 m!934921))

(declare-fun m!934953 () Bool)

(assert (=> b!1009934 m!934953))

(check-sat (not start!87178) (not b!1009938) (not b!1009942) (not b!1009939) (not b!1009931) (not b!1009933) (not b!1009934) (not b!1009941) (not b!1009932) (not b!1009930) (not b!1009936) (not b!1009937))
(check-sat)
