; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120194 () Bool)

(assert start!120194)

(declare-fun b!1398181 () Bool)

(declare-fun res!936415 () Bool)

(declare-fun e!791648 () Bool)

(assert (=> b!1398181 (=> (not res!936415) (not e!791648))))

(declare-datatypes ((array!95645 0))(
  ( (array!95646 (arr!46174 (Array (_ BitVec 32) (_ BitVec 64))) (size!46725 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95645)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1398181 (= res!936415 (validKeyInArray!0 (select (arr!46174 a!2901) j!112)))))

(declare-fun b!1398182 () Bool)

(declare-fun e!791651 () Bool)

(assert (=> b!1398182 (= e!791648 (not e!791651))))

(declare-fun res!936413 () Bool)

(assert (=> b!1398182 (=> res!936413 e!791651)))

(declare-datatypes ((SeekEntryResult!10394 0))(
  ( (MissingZero!10394 (index!43947 (_ BitVec 32))) (Found!10394 (index!43948 (_ BitVec 32))) (Intermediate!10394 (undefined!11206 Bool) (index!43949 (_ BitVec 32)) (x!125763 (_ BitVec 32))) (Undefined!10394) (MissingVacant!10394 (index!43950 (_ BitVec 32))) )
))
(declare-fun lt!614295 () SeekEntryResult!10394)

(get-info :version)

(assert (=> b!1398182 (= res!936413 (or (not ((_ is Intermediate!10394) lt!614295)) (undefined!11206 lt!614295)))))

(declare-fun e!791647 () Bool)

(assert (=> b!1398182 e!791647))

(declare-fun res!936414 () Bool)

(assert (=> b!1398182 (=> (not res!936414) (not e!791647))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95645 (_ BitVec 32)) Bool)

(assert (=> b!1398182 (= res!936414 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46819 0))(
  ( (Unit!46820) )
))
(declare-fun lt!614291 () Unit!46819)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95645 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46819)

(assert (=> b!1398182 (= lt!614291 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!614296 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95645 (_ BitVec 32)) SeekEntryResult!10394)

(assert (=> b!1398182 (= lt!614295 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614296 (select (arr!46174 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1398182 (= lt!614296 (toIndex!0 (select (arr!46174 a!2901) j!112) mask!2840))))

(declare-fun res!936418 () Bool)

(assert (=> start!120194 (=> (not res!936418) (not e!791648))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120194 (= res!936418 (validMask!0 mask!2840))))

(assert (=> start!120194 e!791648))

(assert (=> start!120194 true))

(declare-fun array_inv!35455 (array!95645) Bool)

(assert (=> start!120194 (array_inv!35455 a!2901)))

(declare-fun b!1398183 () Bool)

(declare-fun res!936416 () Bool)

(assert (=> b!1398183 (=> (not res!936416) (not e!791648))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1398183 (= res!936416 (validKeyInArray!0 (select (arr!46174 a!2901) i!1037)))))

(declare-fun b!1398184 () Bool)

(declare-fun e!791650 () Bool)

(assert (=> b!1398184 (= e!791651 e!791650)))

(declare-fun res!936412 () Bool)

(assert (=> b!1398184 (=> res!936412 e!791650)))

(declare-fun lt!614292 () SeekEntryResult!10394)

(assert (=> b!1398184 (= res!936412 (or (= lt!614295 lt!614292) (not ((_ is Intermediate!10394) lt!614292)) (bvslt (x!125763 lt!614295) #b00000000000000000000000000000000) (bvsgt (x!125763 lt!614295) #b01111111111111111111111111111110) (bvslt lt!614296 #b00000000000000000000000000000000) (bvsge lt!614296 (size!46725 a!2901)) (bvslt (index!43949 lt!614295) #b00000000000000000000000000000000) (bvsge (index!43949 lt!614295) (size!46725 a!2901)) (not (= lt!614295 (Intermediate!10394 false (index!43949 lt!614295) (x!125763 lt!614295)))) (not (= lt!614292 (Intermediate!10394 (undefined!11206 lt!614292) (index!43949 lt!614292) (x!125763 lt!614292))))))))

(declare-fun lt!614297 () array!95645)

(declare-fun lt!614294 () (_ BitVec 64))

(assert (=> b!1398184 (= lt!614292 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614294 mask!2840) lt!614294 lt!614297 mask!2840))))

(assert (=> b!1398184 (= lt!614294 (select (store (arr!46174 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1398184 (= lt!614297 (array!95646 (store (arr!46174 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46725 a!2901)))))

(declare-fun b!1398185 () Bool)

(assert (=> b!1398185 (= e!791650 true)))

(declare-fun lt!614293 () SeekEntryResult!10394)

(assert (=> b!1398185 (= lt!614293 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614296 lt!614294 lt!614297 mask!2840))))

(declare-fun b!1398186 () Bool)

(declare-fun res!936410 () Bool)

(assert (=> b!1398186 (=> (not res!936410) (not e!791648))))

(declare-datatypes ((List!32680 0))(
  ( (Nil!32677) (Cons!32676 (h!33926 (_ BitVec 64)) (t!47366 List!32680)) )
))
(declare-fun arrayNoDuplicates!0 (array!95645 (_ BitVec 32) List!32680) Bool)

(assert (=> b!1398186 (= res!936410 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32677))))

(declare-fun b!1398187 () Bool)

(declare-fun res!936417 () Bool)

(assert (=> b!1398187 (=> (not res!936417) (not e!791648))))

(assert (=> b!1398187 (= res!936417 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1398188 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95645 (_ BitVec 32)) SeekEntryResult!10394)

(assert (=> b!1398188 (= e!791647 (= (seekEntryOrOpen!0 (select (arr!46174 a!2901) j!112) a!2901 mask!2840) (Found!10394 j!112)))))

(declare-fun b!1398189 () Bool)

(declare-fun res!936411 () Bool)

(assert (=> b!1398189 (=> (not res!936411) (not e!791648))))

(assert (=> b!1398189 (= res!936411 (and (= (size!46725 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46725 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46725 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!120194 res!936418) b!1398189))

(assert (= (and b!1398189 res!936411) b!1398183))

(assert (= (and b!1398183 res!936416) b!1398181))

(assert (= (and b!1398181 res!936415) b!1398187))

(assert (= (and b!1398187 res!936417) b!1398186))

(assert (= (and b!1398186 res!936410) b!1398182))

(assert (= (and b!1398182 res!936414) b!1398188))

(assert (= (and b!1398182 (not res!936413)) b!1398184))

(assert (= (and b!1398184 (not res!936412)) b!1398185))

(declare-fun m!1285051 () Bool)

(assert (=> b!1398183 m!1285051))

(assert (=> b!1398183 m!1285051))

(declare-fun m!1285053 () Bool)

(assert (=> b!1398183 m!1285053))

(declare-fun m!1285055 () Bool)

(assert (=> b!1398187 m!1285055))

(declare-fun m!1285057 () Bool)

(assert (=> b!1398184 m!1285057))

(assert (=> b!1398184 m!1285057))

(declare-fun m!1285059 () Bool)

(assert (=> b!1398184 m!1285059))

(declare-fun m!1285061 () Bool)

(assert (=> b!1398184 m!1285061))

(declare-fun m!1285063 () Bool)

(assert (=> b!1398184 m!1285063))

(declare-fun m!1285065 () Bool)

(assert (=> b!1398181 m!1285065))

(assert (=> b!1398181 m!1285065))

(declare-fun m!1285067 () Bool)

(assert (=> b!1398181 m!1285067))

(declare-fun m!1285069 () Bool)

(assert (=> b!1398185 m!1285069))

(assert (=> b!1398188 m!1285065))

(assert (=> b!1398188 m!1285065))

(declare-fun m!1285071 () Bool)

(assert (=> b!1398188 m!1285071))

(declare-fun m!1285073 () Bool)

(assert (=> start!120194 m!1285073))

(declare-fun m!1285075 () Bool)

(assert (=> start!120194 m!1285075))

(assert (=> b!1398182 m!1285065))

(declare-fun m!1285077 () Bool)

(assert (=> b!1398182 m!1285077))

(assert (=> b!1398182 m!1285065))

(declare-fun m!1285079 () Bool)

(assert (=> b!1398182 m!1285079))

(assert (=> b!1398182 m!1285065))

(declare-fun m!1285081 () Bool)

(assert (=> b!1398182 m!1285081))

(declare-fun m!1285083 () Bool)

(assert (=> b!1398182 m!1285083))

(declare-fun m!1285085 () Bool)

(assert (=> b!1398186 m!1285085))

(check-sat (not b!1398183) (not b!1398188) (not b!1398185) (not b!1398181) (not start!120194) (not b!1398186) (not b!1398182) (not b!1398184) (not b!1398187))
(check-sat)
