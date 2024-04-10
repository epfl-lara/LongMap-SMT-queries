; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86386 () Bool)

(assert start!86386)

(declare-fun b!999733 () Bool)

(declare-fun res!669221 () Bool)

(declare-fun e!563650 () Bool)

(assert (=> b!999733 (=> (not res!669221) (not e!563650))))

(declare-datatypes ((array!63187 0))(
  ( (array!63188 (arr!30419 (Array (_ BitVec 32) (_ BitVec 64))) (size!30921 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63187)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63187 (_ BitVec 32)) Bool)

(assert (=> b!999733 (= res!669221 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!999734 () Bool)

(declare-fun res!669213 () Bool)

(assert (=> b!999734 (=> (not res!669213) (not e!563650))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!999734 (= res!669213 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30921 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30921 a!3219))))))

(declare-fun b!999735 () Bool)

(declare-fun e!563647 () Bool)

(assert (=> b!999735 (= e!563647 (bvslt mask!3464 #b00000000000000000000000000000000))))

(declare-fun b!999736 () Bool)

(declare-fun res!669216 () Bool)

(declare-fun e!563648 () Bool)

(assert (=> b!999736 (=> (not res!669216) (not e!563648))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63187 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!999736 (= res!669216 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!999737 () Bool)

(declare-fun res!669222 () Bool)

(assert (=> b!999737 (=> (not res!669222) (not e!563647))))

(declare-fun j!170 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9351 0))(
  ( (MissingZero!9351 (index!39775 (_ BitVec 32))) (Found!9351 (index!39776 (_ BitVec 32))) (Intermediate!9351 (undefined!10163 Bool) (index!39777 (_ BitVec 32)) (x!87211 (_ BitVec 32))) (Undefined!9351) (MissingVacant!9351 (index!39778 (_ BitVec 32))) )
))
(declare-fun lt!442104 () SeekEntryResult!9351)

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63187 (_ BitVec 32)) SeekEntryResult!9351)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!999737 (= res!669222 (not (= lt!442104 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!30419 a!3219) i!1194 k0!2224) j!170) mask!3464) (select (store (arr!30419 a!3219) i!1194 k0!2224) j!170) (array!63188 (store (arr!30419 a!3219) i!1194 k0!2224) (size!30921 a!3219)) mask!3464))))))

(declare-fun b!999738 () Bool)

(declare-fun res!669219 () Bool)

(assert (=> b!999738 (=> (not res!669219) (not e!563650))))

(declare-datatypes ((List!21095 0))(
  ( (Nil!21092) (Cons!21091 (h!22268 (_ BitVec 64)) (t!30096 List!21095)) )
))
(declare-fun arrayNoDuplicates!0 (array!63187 (_ BitVec 32) List!21095) Bool)

(assert (=> b!999738 (= res!669219 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21092))))

(declare-fun b!999739 () Bool)

(declare-fun res!669217 () Bool)

(assert (=> b!999739 (=> (not res!669217) (not e!563648))))

(assert (=> b!999739 (= res!669217 (and (= (size!30921 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30921 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30921 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!999740 () Bool)

(assert (=> b!999740 (= e!563650 e!563647)))

(declare-fun res!669220 () Bool)

(assert (=> b!999740 (=> (not res!669220) (not e!563647))))

(declare-fun lt!442106 () SeekEntryResult!9351)

(assert (=> b!999740 (= res!669220 (= lt!442104 lt!442106))))

(assert (=> b!999740 (= lt!442106 (Intermediate!9351 false resIndex!38 resX!38))))

(assert (=> b!999740 (= lt!442104 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30419 a!3219) j!170) mask!3464) (select (arr!30419 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!999742 () Bool)

(assert (=> b!999742 (= e!563648 e!563650)))

(declare-fun res!669212 () Bool)

(assert (=> b!999742 (=> (not res!669212) (not e!563650))))

(declare-fun lt!442105 () SeekEntryResult!9351)

(assert (=> b!999742 (= res!669212 (or (= lt!442105 (MissingVacant!9351 i!1194)) (= lt!442105 (MissingZero!9351 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63187 (_ BitVec 32)) SeekEntryResult!9351)

(assert (=> b!999742 (= lt!442105 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!999743 () Bool)

(declare-fun res!669215 () Bool)

(assert (=> b!999743 (=> (not res!669215) (not e!563647))))

(assert (=> b!999743 (= res!669215 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30419 a!3219) j!170) a!3219 mask!3464) lt!442106))))

(declare-fun b!999744 () Bool)

(declare-fun res!669211 () Bool)

(assert (=> b!999744 (=> (not res!669211) (not e!563648))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!999744 (= res!669211 (validKeyInArray!0 (select (arr!30419 a!3219) j!170)))))

(declare-fun b!999741 () Bool)

(declare-fun res!669214 () Bool)

(assert (=> b!999741 (=> (not res!669214) (not e!563648))))

(assert (=> b!999741 (= res!669214 (validKeyInArray!0 k0!2224))))

(declare-fun res!669218 () Bool)

(assert (=> start!86386 (=> (not res!669218) (not e!563648))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86386 (= res!669218 (validMask!0 mask!3464))))

(assert (=> start!86386 e!563648))

(declare-fun array_inv!23543 (array!63187) Bool)

(assert (=> start!86386 (array_inv!23543 a!3219)))

(assert (=> start!86386 true))

(assert (= (and start!86386 res!669218) b!999739))

(assert (= (and b!999739 res!669217) b!999744))

(assert (= (and b!999744 res!669211) b!999741))

(assert (= (and b!999741 res!669214) b!999736))

(assert (= (and b!999736 res!669216) b!999742))

(assert (= (and b!999742 res!669212) b!999733))

(assert (= (and b!999733 res!669221) b!999738))

(assert (= (and b!999738 res!669219) b!999734))

(assert (= (and b!999734 res!669213) b!999740))

(assert (= (and b!999740 res!669220) b!999743))

(assert (= (and b!999743 res!669215) b!999737))

(assert (= (and b!999737 res!669222) b!999735))

(declare-fun m!925951 () Bool)

(assert (=> b!999744 m!925951))

(assert (=> b!999744 m!925951))

(declare-fun m!925953 () Bool)

(assert (=> b!999744 m!925953))

(declare-fun m!925955 () Bool)

(assert (=> b!999737 m!925955))

(declare-fun m!925957 () Bool)

(assert (=> b!999737 m!925957))

(assert (=> b!999737 m!925957))

(declare-fun m!925959 () Bool)

(assert (=> b!999737 m!925959))

(assert (=> b!999737 m!925959))

(assert (=> b!999737 m!925957))

(declare-fun m!925961 () Bool)

(assert (=> b!999737 m!925961))

(declare-fun m!925963 () Bool)

(assert (=> b!999736 m!925963))

(declare-fun m!925965 () Bool)

(assert (=> start!86386 m!925965))

(declare-fun m!925967 () Bool)

(assert (=> start!86386 m!925967))

(declare-fun m!925969 () Bool)

(assert (=> b!999738 m!925969))

(declare-fun m!925971 () Bool)

(assert (=> b!999742 m!925971))

(declare-fun m!925973 () Bool)

(assert (=> b!999733 m!925973))

(assert (=> b!999743 m!925951))

(assert (=> b!999743 m!925951))

(declare-fun m!925975 () Bool)

(assert (=> b!999743 m!925975))

(declare-fun m!925977 () Bool)

(assert (=> b!999741 m!925977))

(assert (=> b!999740 m!925951))

(assert (=> b!999740 m!925951))

(declare-fun m!925979 () Bool)

(assert (=> b!999740 m!925979))

(assert (=> b!999740 m!925979))

(assert (=> b!999740 m!925951))

(declare-fun m!925981 () Bool)

(assert (=> b!999740 m!925981))

(check-sat (not b!999733) (not b!999741) (not b!999744) (not b!999742) (not b!999743) (not b!999738) (not b!999736) (not start!86386) (not b!999737) (not b!999740))
(check-sat)
