; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86448 () Bool)

(assert start!86448)

(declare-fun b!1000821 () Bool)

(declare-fun res!670300 () Bool)

(declare-fun e!564021 () Bool)

(assert (=> b!1000821 (=> (not res!670300) (not e!564021))))

(declare-datatypes ((array!63249 0))(
  ( (array!63250 (arr!30450 (Array (_ BitVec 32) (_ BitVec 64))) (size!30952 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63249)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9382 0))(
  ( (MissingZero!9382 (index!39899 (_ BitVec 32))) (Found!9382 (index!39900 (_ BitVec 32))) (Intermediate!9382 (undefined!10194 Bool) (index!39901 (_ BitVec 32)) (x!87322 (_ BitVec 32))) (Undefined!9382) (MissingVacant!9382 (index!39902 (_ BitVec 32))) )
))
(declare-fun lt!442385 () SeekEntryResult!9382)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63249 (_ BitVec 32)) SeekEntryResult!9382)

(assert (=> b!1000821 (= res!670300 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30450 a!3219) j!170) a!3219 mask!3464) lt!442385))))

(declare-fun b!1000822 () Bool)

(declare-fun res!670307 () Bool)

(declare-fun e!564019 () Bool)

(assert (=> b!1000822 (=> (not res!670307) (not e!564019))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1000822 (= res!670307 (validKeyInArray!0 (select (arr!30450 a!3219) j!170)))))

(declare-fun b!1000823 () Bool)

(declare-fun res!670301 () Bool)

(declare-fun e!564022 () Bool)

(assert (=> b!1000823 (=> (not res!670301) (not e!564022))))

(declare-datatypes ((List!21126 0))(
  ( (Nil!21123) (Cons!21122 (h!22299 (_ BitVec 64)) (t!30127 List!21126)) )
))
(declare-fun arrayNoDuplicates!0 (array!63249 (_ BitVec 32) List!21126) Bool)

(assert (=> b!1000823 (= res!670301 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21123))))

(declare-fun b!1000824 () Bool)

(declare-fun res!670311 () Bool)

(assert (=> b!1000824 (=> (not res!670311) (not e!564021))))

(declare-fun lt!442383 () SeekEntryResult!9382)

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1000824 (= res!670311 (not (= lt!442383 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!30450 a!3219) i!1194 k!2224) j!170) mask!3464) (select (store (arr!30450 a!3219) i!1194 k!2224) j!170) (array!63250 (store (arr!30450 a!3219) i!1194 k!2224) (size!30952 a!3219)) mask!3464))))))

(declare-fun b!1000825 () Bool)

(assert (=> b!1000825 (= e!564019 e!564022)))

(declare-fun res!670304 () Bool)

(assert (=> b!1000825 (=> (not res!670304) (not e!564022))))

(declare-fun lt!442384 () SeekEntryResult!9382)

(assert (=> b!1000825 (= res!670304 (or (= lt!442384 (MissingVacant!9382 i!1194)) (= lt!442384 (MissingZero!9382 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63249 (_ BitVec 32)) SeekEntryResult!9382)

(assert (=> b!1000825 (= lt!442384 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1000826 () Bool)

(declare-fun res!670302 () Bool)

(assert (=> b!1000826 (=> (not res!670302) (not e!564022))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1000826 (= res!670302 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30952 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30952 a!3219))))))

(declare-fun res!670305 () Bool)

(assert (=> start!86448 (=> (not res!670305) (not e!564019))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86448 (= res!670305 (validMask!0 mask!3464))))

(assert (=> start!86448 e!564019))

(declare-fun array_inv!23574 (array!63249) Bool)

(assert (=> start!86448 (array_inv!23574 a!3219)))

(assert (=> start!86448 true))

(declare-fun b!1000827 () Bool)

(assert (=> b!1000827 (= e!564022 e!564021)))

(declare-fun res!670308 () Bool)

(assert (=> b!1000827 (=> (not res!670308) (not e!564021))))

(assert (=> b!1000827 (= res!670308 (= lt!442383 lt!442385))))

(assert (=> b!1000827 (= lt!442385 (Intermediate!9382 false resIndex!38 resX!38))))

(assert (=> b!1000827 (= lt!442383 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30450 a!3219) j!170) mask!3464) (select (arr!30450 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1000828 () Bool)

(declare-fun res!670309 () Bool)

(assert (=> b!1000828 (=> (not res!670309) (not e!564019))))

(assert (=> b!1000828 (= res!670309 (validKeyInArray!0 k!2224))))

(declare-fun b!1000829 () Bool)

(declare-fun res!670310 () Bool)

(assert (=> b!1000829 (=> (not res!670310) (not e!564022))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63249 (_ BitVec 32)) Bool)

(assert (=> b!1000829 (= res!670310 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1000830 () Bool)

(declare-fun res!670303 () Bool)

(assert (=> b!1000830 (=> (not res!670303) (not e!564021))))

(assert (=> b!1000830 (= res!670303 (and (bvsge mask!3464 #b00000000000000000000000000000000) (bvslt index!1507 (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsle x!1245 #b01111111111111111111111111111110)))))

(declare-fun b!1000831 () Bool)

(declare-fun res!670306 () Bool)

(assert (=> b!1000831 (=> (not res!670306) (not e!564019))))

(declare-fun arrayContainsKey!0 (array!63249 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1000831 (= res!670306 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1000832 () Bool)

(assert (=> b!1000832 (= e!564021 (not (validKeyInArray!0 (select (store (arr!30450 a!3219) i!1194 k!2224) j!170))))))

(declare-fun b!1000833 () Bool)

(declare-fun res!670299 () Bool)

(assert (=> b!1000833 (=> (not res!670299) (not e!564019))))

(assert (=> b!1000833 (= res!670299 (and (= (size!30952 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30952 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30952 a!3219)) (not (= i!1194 j!170))))))

(assert (= (and start!86448 res!670305) b!1000833))

(assert (= (and b!1000833 res!670299) b!1000822))

(assert (= (and b!1000822 res!670307) b!1000828))

(assert (= (and b!1000828 res!670309) b!1000831))

(assert (= (and b!1000831 res!670306) b!1000825))

(assert (= (and b!1000825 res!670304) b!1000829))

(assert (= (and b!1000829 res!670310) b!1000823))

(assert (= (and b!1000823 res!670301) b!1000826))

(assert (= (and b!1000826 res!670302) b!1000827))

(assert (= (and b!1000827 res!670308) b!1000821))

(assert (= (and b!1000821 res!670300) b!1000824))

(assert (= (and b!1000824 res!670311) b!1000830))

(assert (= (and b!1000830 res!670303) b!1000832))

(declare-fun m!926947 () Bool)

(assert (=> b!1000822 m!926947))

(assert (=> b!1000822 m!926947))

(declare-fun m!926949 () Bool)

(assert (=> b!1000822 m!926949))

(declare-fun m!926951 () Bool)

(assert (=> start!86448 m!926951))

(declare-fun m!926953 () Bool)

(assert (=> start!86448 m!926953))

(declare-fun m!926955 () Bool)

(assert (=> b!1000829 m!926955))

(declare-fun m!926957 () Bool)

(assert (=> b!1000824 m!926957))

(declare-fun m!926959 () Bool)

(assert (=> b!1000824 m!926959))

(assert (=> b!1000824 m!926959))

(declare-fun m!926961 () Bool)

(assert (=> b!1000824 m!926961))

(assert (=> b!1000824 m!926961))

(assert (=> b!1000824 m!926959))

(declare-fun m!926963 () Bool)

(assert (=> b!1000824 m!926963))

(assert (=> b!1000832 m!926957))

(assert (=> b!1000832 m!926959))

(assert (=> b!1000832 m!926959))

(declare-fun m!926965 () Bool)

(assert (=> b!1000832 m!926965))

(declare-fun m!926967 () Bool)

(assert (=> b!1000825 m!926967))

(assert (=> b!1000821 m!926947))

(assert (=> b!1000821 m!926947))

(declare-fun m!926969 () Bool)

(assert (=> b!1000821 m!926969))

(declare-fun m!926971 () Bool)

(assert (=> b!1000831 m!926971))

(assert (=> b!1000827 m!926947))

(assert (=> b!1000827 m!926947))

(declare-fun m!926973 () Bool)

(assert (=> b!1000827 m!926973))

(assert (=> b!1000827 m!926973))

(assert (=> b!1000827 m!926947))

(declare-fun m!926975 () Bool)

(assert (=> b!1000827 m!926975))

(declare-fun m!926977 () Bool)

(assert (=> b!1000823 m!926977))

(declare-fun m!926979 () Bool)

(assert (=> b!1000828 m!926979))

(push 1)

(assert (not b!1000828))

(assert (not b!1000824))

(assert (not b!1000832))

(assert (not b!1000827))

