; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87130 () Bool)

(assert start!87130)

(declare-fun b!1008921 () Bool)

(declare-fun res!677060 () Bool)

(declare-fun e!567892 () Bool)

(assert (=> b!1008921 (=> (not res!677060) (not e!567892))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!1008921 (= res!677060 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1008922 () Bool)

(declare-fun res!677057 () Bool)

(assert (=> b!1008922 (=> (not res!677057) (not e!567892))))

(declare-datatypes ((array!63597 0))(
  ( (array!63598 (arr!30613 (Array (_ BitVec 32) (_ BitVec 64))) (size!31116 (_ BitVec 32))) )
))
(declare-fun lt!445802 () array!63597)

(declare-datatypes ((SeekEntryResult!9481 0))(
  ( (MissingZero!9481 (index!40295 (_ BitVec 32))) (Found!9481 (index!40296 (_ BitVec 32))) (Intermediate!9481 (undefined!10293 Bool) (index!40297 (_ BitVec 32)) (x!87851 (_ BitVec 32))) (Undefined!9481) (MissingVacant!9481 (index!40298 (_ BitVec 32))) )
))
(declare-fun lt!445799 () SeekEntryResult!9481)

(declare-fun lt!445796 () (_ BitVec 64))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63597 (_ BitVec 32)) SeekEntryResult!9481)

(assert (=> b!1008922 (= res!677057 (not (= lt!445799 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!445796 lt!445802 mask!3464))))))

(declare-fun res!677064 () Bool)

(declare-fun e!567893 () Bool)

(assert (=> start!87130 (=> (not res!677064) (not e!567893))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!87130 (= res!677064 (validMask!0 mask!3464))))

(assert (=> start!87130 e!567893))

(declare-fun a!3219 () array!63597)

(declare-fun array_inv!23749 (array!63597) Bool)

(assert (=> start!87130 (array_inv!23749 a!3219)))

(assert (=> start!87130 true))

(declare-fun b!1008923 () Bool)

(declare-fun res!677066 () Bool)

(declare-fun e!567889 () Bool)

(assert (=> b!1008923 (=> (not res!677066) (not e!567889))))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1008923 (= res!677066 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31116 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31116 a!3219))))))

(declare-fun b!1008924 () Bool)

(declare-fun e!567891 () Bool)

(assert (=> b!1008924 (= e!567891 e!567892)))

(declare-fun res!677061 () Bool)

(assert (=> b!1008924 (=> (not res!677061) (not e!567892))))

(declare-fun lt!445800 () SeekEntryResult!9481)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1008924 (= res!677061 (not (= lt!445800 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!445796 mask!3464) lt!445796 lt!445802 mask!3464))))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun k0!2224 () (_ BitVec 64))

(assert (=> b!1008924 (= lt!445796 (select (store (arr!30613 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1008924 (= lt!445802 (array!63598 (store (arr!30613 a!3219) i!1194 k0!2224) (size!31116 a!3219)))))

(declare-fun b!1008925 () Bool)

(declare-fun e!567890 () Bool)

(assert (=> b!1008925 (= e!567890 e!567891)))

(declare-fun res!677056 () Bool)

(assert (=> b!1008925 (=> (not res!677056) (not e!567891))))

(declare-fun lt!445798 () SeekEntryResult!9481)

(assert (=> b!1008925 (= res!677056 (= lt!445799 lt!445798))))

(assert (=> b!1008925 (= lt!445799 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30613 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1008926 () Bool)

(assert (=> b!1008926 (= e!567892 false)))

(declare-fun lt!445797 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1008926 (= lt!445797 (nextIndex!0 index!1507 (bvadd #b00000000000000000000000000000001 x!1245) mask!3464))))

(declare-fun b!1008927 () Bool)

(declare-fun res!677055 () Bool)

(assert (=> b!1008927 (=> (not res!677055) (not e!567889))))

(declare-datatypes ((List!21260 0))(
  ( (Nil!21257) (Cons!21256 (h!22451 (_ BitVec 64)) (t!30253 List!21260)) )
))
(declare-fun arrayNoDuplicates!0 (array!63597 (_ BitVec 32) List!21260) Bool)

(assert (=> b!1008927 (= res!677055 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21257))))

(declare-fun b!1008928 () Bool)

(declare-fun res!677065 () Bool)

(assert (=> b!1008928 (=> (not res!677065) (not e!567893))))

(declare-fun arrayContainsKey!0 (array!63597 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1008928 (= res!677065 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1008929 () Bool)

(declare-fun res!677059 () Bool)

(assert (=> b!1008929 (=> (not res!677059) (not e!567893))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1008929 (= res!677059 (validKeyInArray!0 k0!2224))))

(declare-fun b!1008930 () Bool)

(declare-fun res!677062 () Bool)

(assert (=> b!1008930 (=> (not res!677062) (not e!567893))))

(assert (=> b!1008930 (= res!677062 (and (= (size!31116 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31116 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31116 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1008931 () Bool)

(declare-fun res!677054 () Bool)

(assert (=> b!1008931 (=> (not res!677054) (not e!567889))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63597 (_ BitVec 32)) Bool)

(assert (=> b!1008931 (= res!677054 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1008932 () Bool)

(assert (=> b!1008932 (= e!567889 e!567890)))

(declare-fun res!677063 () Bool)

(assert (=> b!1008932 (=> (not res!677063) (not e!567890))))

(assert (=> b!1008932 (= res!677063 (= lt!445800 lt!445798))))

(assert (=> b!1008932 (= lt!445798 (Intermediate!9481 false resIndex!38 resX!38))))

(assert (=> b!1008932 (= lt!445800 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30613 a!3219) j!170) mask!3464) (select (arr!30613 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1008933 () Bool)

(declare-fun res!677058 () Bool)

(assert (=> b!1008933 (=> (not res!677058) (not e!567893))))

(assert (=> b!1008933 (= res!677058 (validKeyInArray!0 (select (arr!30613 a!3219) j!170)))))

(declare-fun b!1008934 () Bool)

(assert (=> b!1008934 (= e!567893 e!567889)))

(declare-fun res!677053 () Bool)

(assert (=> b!1008934 (=> (not res!677053) (not e!567889))))

(declare-fun lt!445801 () SeekEntryResult!9481)

(assert (=> b!1008934 (= res!677053 (or (= lt!445801 (MissingVacant!9481 i!1194)) (= lt!445801 (MissingZero!9481 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63597 (_ BitVec 32)) SeekEntryResult!9481)

(assert (=> b!1008934 (= lt!445801 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(assert (= (and start!87130 res!677064) b!1008930))

(assert (= (and b!1008930 res!677062) b!1008933))

(assert (= (and b!1008933 res!677058) b!1008929))

(assert (= (and b!1008929 res!677059) b!1008928))

(assert (= (and b!1008928 res!677065) b!1008934))

(assert (= (and b!1008934 res!677053) b!1008931))

(assert (= (and b!1008931 res!677054) b!1008927))

(assert (= (and b!1008927 res!677055) b!1008923))

(assert (= (and b!1008923 res!677066) b!1008932))

(assert (= (and b!1008932 res!677063) b!1008925))

(assert (= (and b!1008925 res!677056) b!1008924))

(assert (= (and b!1008924 res!677061) b!1008922))

(assert (= (and b!1008922 res!677057) b!1008921))

(assert (= (and b!1008921 res!677060) b!1008926))

(declare-fun m!934055 () Bool)

(assert (=> b!1008934 m!934055))

(declare-fun m!934057 () Bool)

(assert (=> b!1008931 m!934057))

(declare-fun m!934059 () Bool)

(assert (=> start!87130 m!934059))

(declare-fun m!934061 () Bool)

(assert (=> start!87130 m!934061))

(declare-fun m!934063 () Bool)

(assert (=> b!1008924 m!934063))

(assert (=> b!1008924 m!934063))

(declare-fun m!934065 () Bool)

(assert (=> b!1008924 m!934065))

(declare-fun m!934067 () Bool)

(assert (=> b!1008924 m!934067))

(declare-fun m!934069 () Bool)

(assert (=> b!1008924 m!934069))

(declare-fun m!934071 () Bool)

(assert (=> b!1008928 m!934071))

(declare-fun m!934073 () Bool)

(assert (=> b!1008929 m!934073))

(declare-fun m!934075 () Bool)

(assert (=> b!1008922 m!934075))

(declare-fun m!934077 () Bool)

(assert (=> b!1008927 m!934077))

(declare-fun m!934079 () Bool)

(assert (=> b!1008925 m!934079))

(assert (=> b!1008925 m!934079))

(declare-fun m!934081 () Bool)

(assert (=> b!1008925 m!934081))

(assert (=> b!1008933 m!934079))

(assert (=> b!1008933 m!934079))

(declare-fun m!934083 () Bool)

(assert (=> b!1008933 m!934083))

(assert (=> b!1008932 m!934079))

(assert (=> b!1008932 m!934079))

(declare-fun m!934085 () Bool)

(assert (=> b!1008932 m!934085))

(assert (=> b!1008932 m!934085))

(assert (=> b!1008932 m!934079))

(declare-fun m!934087 () Bool)

(assert (=> b!1008932 m!934087))

(declare-fun m!934089 () Bool)

(assert (=> b!1008926 m!934089))

(check-sat (not b!1008922) (not b!1008928) (not b!1008931) (not start!87130) (not b!1008925) (not b!1008927) (not b!1008934) (not b!1008933) (not b!1008926) (not b!1008929) (not b!1008924) (not b!1008932))
(check-sat)
