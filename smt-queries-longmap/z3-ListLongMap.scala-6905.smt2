; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87022 () Bool)

(assert start!87022)

(declare-fun res!675894 () Bool)

(declare-fun e!567257 () Bool)

(assert (=> start!87022 (=> (not res!675894) (not e!567257))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!87022 (= res!675894 (validMask!0 mask!3464))))

(assert (=> start!87022 e!567257))

(declare-datatypes ((array!63540 0))(
  ( (array!63541 (arr!30586 (Array (_ BitVec 32) (_ BitVec 64))) (size!31089 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63540)

(declare-fun array_inv!23722 (array!63540) Bool)

(assert (=> start!87022 (array_inv!23722 a!3219)))

(assert (=> start!87022 true))

(declare-fun b!1007565 () Bool)

(declare-fun res!675902 () Bool)

(declare-fun e!567255 () Bool)

(assert (=> b!1007565 (=> (not res!675902) (not e!567255))))

(declare-datatypes ((List!21233 0))(
  ( (Nil!21230) (Cons!21229 (h!22421 (_ BitVec 64)) (t!30226 List!21233)) )
))
(declare-fun arrayNoDuplicates!0 (array!63540 (_ BitVec 32) List!21233) Bool)

(assert (=> b!1007565 (= res!675902 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21230))))

(declare-fun b!1007566 () Bool)

(declare-fun res!675896 () Bool)

(declare-fun e!567258 () Bool)

(assert (=> b!1007566 (=> (not res!675896) (not e!567258))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9454 0))(
  ( (MissingZero!9454 (index!40187 (_ BitVec 32))) (Found!9454 (index!40188 (_ BitVec 32))) (Intermediate!9454 (undefined!10266 Bool) (index!40189 (_ BitVec 32)) (x!87746 (_ BitVec 32))) (Undefined!9454) (MissingVacant!9454 (index!40190 (_ BitVec 32))) )
))
(declare-fun lt!445234 () SeekEntryResult!9454)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63540 (_ BitVec 32)) SeekEntryResult!9454)

(assert (=> b!1007566 (= res!675896 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30586 a!3219) j!170) a!3219 mask!3464) lt!445234))))

(declare-fun b!1007567 () Bool)

(declare-fun res!675898 () Bool)

(assert (=> b!1007567 (=> (not res!675898) (not e!567257))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63540 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1007567 (= res!675898 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1007568 () Bool)

(declare-fun res!675899 () Bool)

(assert (=> b!1007568 (=> (not res!675899) (not e!567255))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63540 (_ BitVec 32)) Bool)

(assert (=> b!1007568 (= res!675899 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1007569 () Bool)

(assert (=> b!1007569 (= e!567258 false)))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun lt!445235 () SeekEntryResult!9454)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1007569 (= lt!445235 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!30586 a!3219) i!1194 k0!2224) j!170) mask!3464) (select (store (arr!30586 a!3219) i!1194 k0!2224) j!170) (array!63541 (store (arr!30586 a!3219) i!1194 k0!2224) (size!31089 a!3219)) mask!3464))))

(declare-fun b!1007570 () Bool)

(declare-fun res!675900 () Bool)

(assert (=> b!1007570 (=> (not res!675900) (not e!567257))))

(assert (=> b!1007570 (= res!675900 (and (= (size!31089 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31089 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31089 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1007571 () Bool)

(declare-fun res!675897 () Bool)

(assert (=> b!1007571 (=> (not res!675897) (not e!567255))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1007571 (= res!675897 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31089 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31089 a!3219))))))

(declare-fun b!1007572 () Bool)

(declare-fun res!675892 () Bool)

(assert (=> b!1007572 (=> (not res!675892) (not e!567257))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1007572 (= res!675892 (validKeyInArray!0 k0!2224))))

(declare-fun b!1007573 () Bool)

(assert (=> b!1007573 (= e!567257 e!567255)))

(declare-fun res!675895 () Bool)

(assert (=> b!1007573 (=> (not res!675895) (not e!567255))))

(declare-fun lt!445233 () SeekEntryResult!9454)

(assert (=> b!1007573 (= res!675895 (or (= lt!445233 (MissingVacant!9454 i!1194)) (= lt!445233 (MissingZero!9454 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63540 (_ BitVec 32)) SeekEntryResult!9454)

(assert (=> b!1007573 (= lt!445233 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1007574 () Bool)

(declare-fun res!675901 () Bool)

(assert (=> b!1007574 (=> (not res!675901) (not e!567257))))

(assert (=> b!1007574 (= res!675901 (validKeyInArray!0 (select (arr!30586 a!3219) j!170)))))

(declare-fun b!1007575 () Bool)

(assert (=> b!1007575 (= e!567255 e!567258)))

(declare-fun res!675893 () Bool)

(assert (=> b!1007575 (=> (not res!675893) (not e!567258))))

(assert (=> b!1007575 (= res!675893 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30586 a!3219) j!170) mask!3464) (select (arr!30586 a!3219) j!170) a!3219 mask!3464) lt!445234))))

(assert (=> b!1007575 (= lt!445234 (Intermediate!9454 false resIndex!38 resX!38))))

(assert (= (and start!87022 res!675894) b!1007570))

(assert (= (and b!1007570 res!675900) b!1007574))

(assert (= (and b!1007574 res!675901) b!1007572))

(assert (= (and b!1007572 res!675892) b!1007567))

(assert (= (and b!1007567 res!675898) b!1007573))

(assert (= (and b!1007573 res!675895) b!1007568))

(assert (= (and b!1007568 res!675899) b!1007565))

(assert (= (and b!1007565 res!675902) b!1007571))

(assert (= (and b!1007571 res!675897) b!1007575))

(assert (= (and b!1007575 res!675893) b!1007566))

(assert (= (and b!1007566 res!675896) b!1007569))

(declare-fun m!932945 () Bool)

(assert (=> start!87022 m!932945))

(declare-fun m!932947 () Bool)

(assert (=> start!87022 m!932947))

(declare-fun m!932949 () Bool)

(assert (=> b!1007573 m!932949))

(declare-fun m!932951 () Bool)

(assert (=> b!1007575 m!932951))

(assert (=> b!1007575 m!932951))

(declare-fun m!932953 () Bool)

(assert (=> b!1007575 m!932953))

(assert (=> b!1007575 m!932953))

(assert (=> b!1007575 m!932951))

(declare-fun m!932955 () Bool)

(assert (=> b!1007575 m!932955))

(declare-fun m!932957 () Bool)

(assert (=> b!1007567 m!932957))

(declare-fun m!932959 () Bool)

(assert (=> b!1007568 m!932959))

(assert (=> b!1007574 m!932951))

(assert (=> b!1007574 m!932951))

(declare-fun m!932961 () Bool)

(assert (=> b!1007574 m!932961))

(declare-fun m!932963 () Bool)

(assert (=> b!1007569 m!932963))

(declare-fun m!932965 () Bool)

(assert (=> b!1007569 m!932965))

(assert (=> b!1007569 m!932965))

(declare-fun m!932967 () Bool)

(assert (=> b!1007569 m!932967))

(assert (=> b!1007569 m!932967))

(assert (=> b!1007569 m!932965))

(declare-fun m!932969 () Bool)

(assert (=> b!1007569 m!932969))

(assert (=> b!1007566 m!932951))

(assert (=> b!1007566 m!932951))

(declare-fun m!932971 () Bool)

(assert (=> b!1007566 m!932971))

(declare-fun m!932973 () Bool)

(assert (=> b!1007572 m!932973))

(declare-fun m!932975 () Bool)

(assert (=> b!1007565 m!932975))

(check-sat (not start!87022) (not b!1007574) (not b!1007573) (not b!1007569) (not b!1007565) (not b!1007568) (not b!1007572) (not b!1007575) (not b!1007567) (not b!1007566))
(check-sat)
