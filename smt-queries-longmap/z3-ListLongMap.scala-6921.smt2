; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87172 () Bool)

(assert start!87172)

(declare-fun b!1009803 () Bool)

(declare-fun res!677940 () Bool)

(declare-fun e!568267 () Bool)

(assert (=> b!1009803 (=> (not res!677940) (not e!568267))))

(declare-datatypes ((array!63639 0))(
  ( (array!63640 (arr!30634 (Array (_ BitVec 32) (_ BitVec 64))) (size!31137 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63639)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63639 (_ BitVec 32)) Bool)

(assert (=> b!1009803 (= res!677940 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1009804 () Bool)

(declare-fun res!677943 () Bool)

(declare-fun e!568268 () Bool)

(assert (=> b!1009804 (=> (not res!677943) (not e!568268))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1009804 (= res!677943 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1009805 () Bool)

(declare-fun res!677939 () Bool)

(declare-fun e!568271 () Bool)

(assert (=> b!1009805 (=> (not res!677939) (not e!568271))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1009805 (= res!677939 (validKeyInArray!0 (select (arr!30634 a!3219) j!170)))))

(declare-fun b!1009806 () Bool)

(declare-fun res!677942 () Bool)

(assert (=> b!1009806 (=> (not res!677942) (not e!568267))))

(declare-datatypes ((List!21281 0))(
  ( (Nil!21278) (Cons!21277 (h!22472 (_ BitVec 64)) (t!30274 List!21281)) )
))
(declare-fun arrayNoDuplicates!0 (array!63639 (_ BitVec 32) List!21281) Bool)

(assert (=> b!1009806 (= res!677942 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21278))))

(declare-fun b!1009807 () Bool)

(assert (=> b!1009807 (= e!568268 false)))

(declare-fun lt!446240 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1009807 (= lt!446240 (nextIndex!0 index!1507 (bvadd #b00000000000000000000000000000001 x!1245) mask!3464))))

(declare-fun b!1009808 () Bool)

(declare-fun e!568272 () Bool)

(declare-fun e!568269 () Bool)

(assert (=> b!1009808 (= e!568272 e!568269)))

(declare-fun res!677935 () Bool)

(assert (=> b!1009808 (=> (not res!677935) (not e!568269))))

(declare-datatypes ((SeekEntryResult!9502 0))(
  ( (MissingZero!9502 (index!40379 (_ BitVec 32))) (Found!9502 (index!40380 (_ BitVec 32))) (Intermediate!9502 (undefined!10314 Bool) (index!40381 (_ BitVec 32)) (x!87928 (_ BitVec 32))) (Undefined!9502) (MissingVacant!9502 (index!40382 (_ BitVec 32))) )
))
(declare-fun lt!446238 () SeekEntryResult!9502)

(declare-fun lt!446243 () SeekEntryResult!9502)

(assert (=> b!1009808 (= res!677935 (= lt!446238 lt!446243))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63639 (_ BitVec 32)) SeekEntryResult!9502)

(assert (=> b!1009808 (= lt!446238 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30634 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1009809 () Bool)

(assert (=> b!1009809 (= e!568271 e!568267)))

(declare-fun res!677944 () Bool)

(assert (=> b!1009809 (=> (not res!677944) (not e!568267))))

(declare-fun lt!446241 () SeekEntryResult!9502)

(assert (=> b!1009809 (= res!677944 (or (= lt!446241 (MissingVacant!9502 i!1194)) (= lt!446241 (MissingZero!9502 i!1194))))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63639 (_ BitVec 32)) SeekEntryResult!9502)

(assert (=> b!1009809 (= lt!446241 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1009810 () Bool)

(assert (=> b!1009810 (= e!568267 e!568272)))

(declare-fun res!677941 () Bool)

(assert (=> b!1009810 (=> (not res!677941) (not e!568272))))

(declare-fun lt!446239 () SeekEntryResult!9502)

(assert (=> b!1009810 (= res!677941 (= lt!446239 lt!446243))))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1009810 (= lt!446243 (Intermediate!9502 false resIndex!38 resX!38))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1009810 (= lt!446239 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30634 a!3219) j!170) mask!3464) (select (arr!30634 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1009811 () Bool)

(declare-fun res!677937 () Bool)

(assert (=> b!1009811 (=> (not res!677937) (not e!568271))))

(assert (=> b!1009811 (= res!677937 (and (= (size!31137 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31137 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31137 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1009812 () Bool)

(declare-fun res!677936 () Bool)

(assert (=> b!1009812 (=> (not res!677936) (not e!568267))))

(assert (=> b!1009812 (= res!677936 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31137 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31137 a!3219))))))

(declare-fun b!1009813 () Bool)

(declare-fun res!677947 () Bool)

(assert (=> b!1009813 (=> (not res!677947) (not e!568271))))

(declare-fun arrayContainsKey!0 (array!63639 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1009813 (= res!677947 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun res!677948 () Bool)

(assert (=> start!87172 (=> (not res!677948) (not e!568271))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!87172 (= res!677948 (validMask!0 mask!3464))))

(assert (=> start!87172 e!568271))

(declare-fun array_inv!23770 (array!63639) Bool)

(assert (=> start!87172 (array_inv!23770 a!3219)))

(assert (=> start!87172 true))

(declare-fun b!1009814 () Bool)

(declare-fun res!677946 () Bool)

(assert (=> b!1009814 (=> (not res!677946) (not e!568268))))

(declare-fun lt!446242 () array!63639)

(declare-fun lt!446237 () (_ BitVec 64))

(assert (=> b!1009814 (= res!677946 (not (= lt!446238 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!446237 lt!446242 mask!3464))))))

(declare-fun b!1009815 () Bool)

(declare-fun res!677945 () Bool)

(assert (=> b!1009815 (=> (not res!677945) (not e!568271))))

(assert (=> b!1009815 (= res!677945 (validKeyInArray!0 k0!2224))))

(declare-fun b!1009816 () Bool)

(assert (=> b!1009816 (= e!568269 e!568268)))

(declare-fun res!677938 () Bool)

(assert (=> b!1009816 (=> (not res!677938) (not e!568268))))

(assert (=> b!1009816 (= res!677938 (not (= lt!446239 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!446237 mask!3464) lt!446237 lt!446242 mask!3464))))))

(assert (=> b!1009816 (= lt!446237 (select (store (arr!30634 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1009816 (= lt!446242 (array!63640 (store (arr!30634 a!3219) i!1194 k0!2224) (size!31137 a!3219)))))

(assert (= (and start!87172 res!677948) b!1009811))

(assert (= (and b!1009811 res!677937) b!1009805))

(assert (= (and b!1009805 res!677939) b!1009815))

(assert (= (and b!1009815 res!677945) b!1009813))

(assert (= (and b!1009813 res!677947) b!1009809))

(assert (= (and b!1009809 res!677944) b!1009803))

(assert (= (and b!1009803 res!677940) b!1009806))

(assert (= (and b!1009806 res!677942) b!1009812))

(assert (= (and b!1009812 res!677936) b!1009810))

(assert (= (and b!1009810 res!677941) b!1009808))

(assert (= (and b!1009808 res!677935) b!1009816))

(assert (= (and b!1009816 res!677938) b!1009814))

(assert (= (and b!1009814 res!677946) b!1009804))

(assert (= (and b!1009804 res!677943) b!1009807))

(declare-fun m!934811 () Bool)

(assert (=> b!1009803 m!934811))

(declare-fun m!934813 () Bool)

(assert (=> b!1009816 m!934813))

(assert (=> b!1009816 m!934813))

(declare-fun m!934815 () Bool)

(assert (=> b!1009816 m!934815))

(declare-fun m!934817 () Bool)

(assert (=> b!1009816 m!934817))

(declare-fun m!934819 () Bool)

(assert (=> b!1009816 m!934819))

(declare-fun m!934821 () Bool)

(assert (=> b!1009814 m!934821))

(declare-fun m!934823 () Bool)

(assert (=> b!1009805 m!934823))

(assert (=> b!1009805 m!934823))

(declare-fun m!934825 () Bool)

(assert (=> b!1009805 m!934825))

(declare-fun m!934827 () Bool)

(assert (=> b!1009806 m!934827))

(declare-fun m!934829 () Bool)

(assert (=> b!1009815 m!934829))

(declare-fun m!934831 () Bool)

(assert (=> b!1009813 m!934831))

(declare-fun m!934833 () Bool)

(assert (=> b!1009807 m!934833))

(assert (=> b!1009808 m!934823))

(assert (=> b!1009808 m!934823))

(declare-fun m!934835 () Bool)

(assert (=> b!1009808 m!934835))

(declare-fun m!934837 () Bool)

(assert (=> b!1009809 m!934837))

(declare-fun m!934839 () Bool)

(assert (=> start!87172 m!934839))

(declare-fun m!934841 () Bool)

(assert (=> start!87172 m!934841))

(assert (=> b!1009810 m!934823))

(assert (=> b!1009810 m!934823))

(declare-fun m!934843 () Bool)

(assert (=> b!1009810 m!934843))

(assert (=> b!1009810 m!934843))

(assert (=> b!1009810 m!934823))

(declare-fun m!934845 () Bool)

(assert (=> b!1009810 m!934845))

(check-sat (not b!1009810) (not b!1009815) (not b!1009806) (not b!1009816) (not b!1009808) (not b!1009803) (not b!1009809) (not start!87172) (not b!1009813) (not b!1009807) (not b!1009814) (not b!1009805))
(check-sat)
