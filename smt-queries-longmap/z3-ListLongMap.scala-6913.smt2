; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87124 () Bool)

(assert start!87124)

(declare-fun b!1008796 () Bool)

(declare-fun e!567836 () Bool)

(assert (=> b!1008796 (= e!567836 false)))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun lt!445739 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1008796 (= lt!445739 (nextIndex!0 index!1507 (bvadd #b00000000000000000000000000000001 x!1245) mask!3464))))

(declare-fun b!1008797 () Bool)

(declare-fun e!567835 () Bool)

(declare-fun e!567839 () Bool)

(assert (=> b!1008797 (= e!567835 e!567839)))

(declare-fun res!676938 () Bool)

(assert (=> b!1008797 (=> (not res!676938) (not e!567839))))

(declare-datatypes ((SeekEntryResult!9478 0))(
  ( (MissingZero!9478 (index!40283 (_ BitVec 32))) (Found!9478 (index!40284 (_ BitVec 32))) (Intermediate!9478 (undefined!10290 Bool) (index!40285 (_ BitVec 32)) (x!87840 (_ BitVec 32))) (Undefined!9478) (MissingVacant!9478 (index!40286 (_ BitVec 32))) )
))
(declare-fun lt!445737 () SeekEntryResult!9478)

(declare-fun lt!445736 () SeekEntryResult!9478)

(assert (=> b!1008797 (= res!676938 (= lt!445737 lt!445736))))

(declare-datatypes ((array!63591 0))(
  ( (array!63592 (arr!30610 (Array (_ BitVec 32) (_ BitVec 64))) (size!31113 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63591)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63591 (_ BitVec 32)) SeekEntryResult!9478)

(assert (=> b!1008797 (= lt!445737 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30610 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1008798 () Bool)

(declare-fun res!676933 () Bool)

(declare-fun e!567837 () Bool)

(assert (=> b!1008798 (=> (not res!676933) (not e!567837))))

(declare-datatypes ((List!21257 0))(
  ( (Nil!21254) (Cons!21253 (h!22448 (_ BitVec 64)) (t!30250 List!21257)) )
))
(declare-fun arrayNoDuplicates!0 (array!63591 (_ BitVec 32) List!21257) Bool)

(assert (=> b!1008798 (= res!676933 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21254))))

(declare-fun b!1008799 () Bool)

(declare-fun res!676939 () Bool)

(declare-fun e!567838 () Bool)

(assert (=> b!1008799 (=> (not res!676939) (not e!567838))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1008799 (= res!676939 (validKeyInArray!0 k0!2224))))

(declare-fun b!1008800 () Bool)

(declare-fun res!676928 () Bool)

(assert (=> b!1008800 (=> (not res!676928) (not e!567838))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1008800 (= res!676928 (and (= (size!31113 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31113 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31113 a!3219)) (not (= i!1194 j!170))))))

(declare-fun res!676932 () Bool)

(assert (=> start!87124 (=> (not res!676932) (not e!567838))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!87124 (= res!676932 (validMask!0 mask!3464))))

(assert (=> start!87124 e!567838))

(declare-fun array_inv!23746 (array!63591) Bool)

(assert (=> start!87124 (array_inv!23746 a!3219)))

(assert (=> start!87124 true))

(declare-fun b!1008795 () Bool)

(declare-fun res!676934 () Bool)

(assert (=> b!1008795 (=> (not res!676934) (not e!567837))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63591 (_ BitVec 32)) Bool)

(assert (=> b!1008795 (= res!676934 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1008801 () Bool)

(declare-fun res!676931 () Bool)

(assert (=> b!1008801 (=> (not res!676931) (not e!567836))))

(declare-fun lt!445734 () array!63591)

(declare-fun lt!445735 () (_ BitVec 64))

(assert (=> b!1008801 (= res!676931 (not (= lt!445737 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!445735 lt!445734 mask!3464))))))

(declare-fun b!1008802 () Bool)

(assert (=> b!1008802 (= e!567837 e!567835)))

(declare-fun res!676937 () Bool)

(assert (=> b!1008802 (=> (not res!676937) (not e!567835))))

(declare-fun lt!445738 () SeekEntryResult!9478)

(assert (=> b!1008802 (= res!676937 (= lt!445738 lt!445736))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1008802 (= lt!445736 (Intermediate!9478 false resIndex!38 resX!38))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1008802 (= lt!445738 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30610 a!3219) j!170) mask!3464) (select (arr!30610 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1008803 () Bool)

(declare-fun res!676929 () Bool)

(assert (=> b!1008803 (=> (not res!676929) (not e!567837))))

(assert (=> b!1008803 (= res!676929 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31113 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31113 a!3219))))))

(declare-fun b!1008804 () Bool)

(declare-fun res!676927 () Bool)

(assert (=> b!1008804 (=> (not res!676927) (not e!567838))))

(assert (=> b!1008804 (= res!676927 (validKeyInArray!0 (select (arr!30610 a!3219) j!170)))))

(declare-fun b!1008805 () Bool)

(declare-fun res!676935 () Bool)

(assert (=> b!1008805 (=> (not res!676935) (not e!567836))))

(assert (=> b!1008805 (= res!676935 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1008806 () Bool)

(assert (=> b!1008806 (= e!567838 e!567837)))

(declare-fun res!676940 () Bool)

(assert (=> b!1008806 (=> (not res!676940) (not e!567837))))

(declare-fun lt!445733 () SeekEntryResult!9478)

(assert (=> b!1008806 (= res!676940 (or (= lt!445733 (MissingVacant!9478 i!1194)) (= lt!445733 (MissingZero!9478 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63591 (_ BitVec 32)) SeekEntryResult!9478)

(assert (=> b!1008806 (= lt!445733 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1008807 () Bool)

(assert (=> b!1008807 (= e!567839 e!567836)))

(declare-fun res!676930 () Bool)

(assert (=> b!1008807 (=> (not res!676930) (not e!567836))))

(assert (=> b!1008807 (= res!676930 (not (= lt!445738 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!445735 mask!3464) lt!445735 lt!445734 mask!3464))))))

(assert (=> b!1008807 (= lt!445735 (select (store (arr!30610 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1008807 (= lt!445734 (array!63592 (store (arr!30610 a!3219) i!1194 k0!2224) (size!31113 a!3219)))))

(declare-fun b!1008808 () Bool)

(declare-fun res!676936 () Bool)

(assert (=> b!1008808 (=> (not res!676936) (not e!567838))))

(declare-fun arrayContainsKey!0 (array!63591 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1008808 (= res!676936 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(assert (= (and start!87124 res!676932) b!1008800))

(assert (= (and b!1008800 res!676928) b!1008804))

(assert (= (and b!1008804 res!676927) b!1008799))

(assert (= (and b!1008799 res!676939) b!1008808))

(assert (= (and b!1008808 res!676936) b!1008806))

(assert (= (and b!1008806 res!676940) b!1008795))

(assert (= (and b!1008795 res!676934) b!1008798))

(assert (= (and b!1008798 res!676933) b!1008803))

(assert (= (and b!1008803 res!676929) b!1008802))

(assert (= (and b!1008802 res!676937) b!1008797))

(assert (= (and b!1008797 res!676938) b!1008807))

(assert (= (and b!1008807 res!676930) b!1008801))

(assert (= (and b!1008801 res!676931) b!1008805))

(assert (= (and b!1008805 res!676935) b!1008796))

(declare-fun m!933947 () Bool)

(assert (=> b!1008798 m!933947))

(declare-fun m!933949 () Bool)

(assert (=> b!1008796 m!933949))

(declare-fun m!933951 () Bool)

(assert (=> b!1008799 m!933951))

(declare-fun m!933953 () Bool)

(assert (=> b!1008808 m!933953))

(declare-fun m!933955 () Bool)

(assert (=> b!1008802 m!933955))

(assert (=> b!1008802 m!933955))

(declare-fun m!933957 () Bool)

(assert (=> b!1008802 m!933957))

(assert (=> b!1008802 m!933957))

(assert (=> b!1008802 m!933955))

(declare-fun m!933959 () Bool)

(assert (=> b!1008802 m!933959))

(declare-fun m!933961 () Bool)

(assert (=> b!1008807 m!933961))

(assert (=> b!1008807 m!933961))

(declare-fun m!933963 () Bool)

(assert (=> b!1008807 m!933963))

(declare-fun m!933965 () Bool)

(assert (=> b!1008807 m!933965))

(declare-fun m!933967 () Bool)

(assert (=> b!1008807 m!933967))

(assert (=> b!1008804 m!933955))

(assert (=> b!1008804 m!933955))

(declare-fun m!933969 () Bool)

(assert (=> b!1008804 m!933969))

(declare-fun m!933971 () Bool)

(assert (=> b!1008801 m!933971))

(assert (=> b!1008797 m!933955))

(assert (=> b!1008797 m!933955))

(declare-fun m!933973 () Bool)

(assert (=> b!1008797 m!933973))

(declare-fun m!933975 () Bool)

(assert (=> start!87124 m!933975))

(declare-fun m!933977 () Bool)

(assert (=> start!87124 m!933977))

(declare-fun m!933979 () Bool)

(assert (=> b!1008806 m!933979))

(declare-fun m!933981 () Bool)

(assert (=> b!1008795 m!933981))

(check-sat (not start!87124) (not b!1008797) (not b!1008804) (not b!1008795) (not b!1008798) (not b!1008806) (not b!1008801) (not b!1008808) (not b!1008807) (not b!1008799) (not b!1008796) (not b!1008802))
(check-sat)
