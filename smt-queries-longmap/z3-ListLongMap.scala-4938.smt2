; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67982 () Bool)

(assert start!67982)

(declare-fun b!791152 () Bool)

(declare-fun res!536050 () Bool)

(declare-fun e!439665 () Bool)

(assert (=> b!791152 (=> (not res!536050) (not e!439665))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42915 0))(
  ( (array!42916 (arr!20543 (Array (_ BitVec 32) (_ BitVec 64))) (size!20964 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42915)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!791152 (= res!536050 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20543 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!791153 () Bool)

(declare-fun res!536045 () Bool)

(assert (=> b!791153 (=> (not res!536045) (not e!439665))))

(declare-fun e!439671 () Bool)

(assert (=> b!791153 (= res!536045 e!439671)))

(declare-fun c!87966 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!791153 (= c!87966 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!791154 () Bool)

(declare-fun e!439670 () Bool)

(assert (=> b!791154 (= e!439670 e!439665)))

(declare-fun res!536042 () Bool)

(assert (=> b!791154 (=> (not res!536042) (not e!439665))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8140 0))(
  ( (MissingZero!8140 (index!34928 (_ BitVec 32))) (Found!8140 (index!34929 (_ BitVec 32))) (Intermediate!8140 (undefined!8952 Bool) (index!34930 (_ BitVec 32)) (x!65877 (_ BitVec 32))) (Undefined!8140) (MissingVacant!8140 (index!34931 (_ BitVec 32))) )
))
(declare-fun lt!353007 () SeekEntryResult!8140)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42915 (_ BitVec 32)) SeekEntryResult!8140)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!791154 (= res!536042 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20543 a!3186) j!159) mask!3328) (select (arr!20543 a!3186) j!159) a!3186 mask!3328) lt!353007))))

(assert (=> b!791154 (= lt!353007 (Intermediate!8140 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!791155 () Bool)

(declare-fun res!536046 () Bool)

(assert (=> b!791155 (=> (not res!536046) (not e!439670))))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!791155 (= res!536046 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20964 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20964 a!3186))))))

(declare-fun b!791156 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42915 (_ BitVec 32)) SeekEntryResult!8140)

(assert (=> b!791156 (= e!439671 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20543 a!3186) j!159) a!3186 mask!3328) (Found!8140 j!159)))))

(declare-fun res!536041 () Bool)

(declare-fun e!439672 () Bool)

(assert (=> start!67982 (=> (not res!536041) (not e!439672))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67982 (= res!536041 (validMask!0 mask!3328))))

(assert (=> start!67982 e!439672))

(assert (=> start!67982 true))

(declare-fun array_inv!16426 (array!42915) Bool)

(assert (=> start!67982 (array_inv!16426 a!3186)))

(declare-fun b!791157 () Bool)

(declare-fun res!536044 () Bool)

(assert (=> b!791157 (=> (not res!536044) (not e!439672))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!791157 (= res!536044 (validKeyInArray!0 (select (arr!20543 a!3186) j!159)))))

(declare-fun b!791158 () Bool)

(declare-fun res!536043 () Bool)

(assert (=> b!791158 (=> (not res!536043) (not e!439672))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!791158 (= res!536043 (validKeyInArray!0 k0!2102))))

(declare-fun b!791159 () Bool)

(declare-fun res!536052 () Bool)

(assert (=> b!791159 (=> (not res!536052) (not e!439672))))

(declare-fun arrayContainsKey!0 (array!42915 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!791159 (= res!536052 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!791160 () Bool)

(declare-fun e!439667 () Bool)

(declare-fun e!439668 () Bool)

(assert (=> b!791160 (= e!439667 e!439668)))

(declare-fun res!536049 () Bool)

(assert (=> b!791160 (=> (not res!536049) (not e!439668))))

(declare-fun lt!353005 () SeekEntryResult!8140)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42915 (_ BitVec 32)) SeekEntryResult!8140)

(assert (=> b!791160 (= res!536049 (= (seekEntryOrOpen!0 (select (arr!20543 a!3186) j!159) a!3186 mask!3328) lt!353005))))

(assert (=> b!791160 (= lt!353005 (Found!8140 j!159))))

(declare-fun b!791161 () Bool)

(declare-fun res!536047 () Bool)

(assert (=> b!791161 (=> (not res!536047) (not e!439670))))

(declare-datatypes ((List!14584 0))(
  ( (Nil!14581) (Cons!14580 (h!15709 (_ BitVec 64)) (t!20890 List!14584)) )
))
(declare-fun arrayNoDuplicates!0 (array!42915 (_ BitVec 32) List!14584) Bool)

(assert (=> b!791161 (= res!536047 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14581))))

(declare-fun b!791162 () Bool)

(assert (=> b!791162 (= e!439671 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20543 a!3186) j!159) a!3186 mask!3328) lt!353007))))

(declare-fun b!791163 () Bool)

(declare-fun res!536051 () Bool)

(assert (=> b!791163 (=> (not res!536051) (not e!439672))))

(assert (=> b!791163 (= res!536051 (and (= (size!20964 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20964 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20964 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!791164 () Bool)

(assert (=> b!791164 (= e!439672 e!439670)))

(declare-fun res!536048 () Bool)

(assert (=> b!791164 (=> (not res!536048) (not e!439670))))

(declare-fun lt!353006 () SeekEntryResult!8140)

(assert (=> b!791164 (= res!536048 (or (= lt!353006 (MissingZero!8140 i!1173)) (= lt!353006 (MissingVacant!8140 i!1173))))))

(assert (=> b!791164 (= lt!353006 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!791165 () Bool)

(declare-fun res!536055 () Bool)

(assert (=> b!791165 (=> (not res!536055) (not e!439670))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42915 (_ BitVec 32)) Bool)

(assert (=> b!791165 (= res!536055 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!791166 () Bool)

(declare-fun e!439669 () Bool)

(assert (=> b!791166 (= e!439669 (not true))))

(assert (=> b!791166 e!439667))

(declare-fun res!536054 () Bool)

(assert (=> b!791166 (=> (not res!536054) (not e!439667))))

(assert (=> b!791166 (= res!536054 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!27404 0))(
  ( (Unit!27405) )
))
(declare-fun lt!353008 () Unit!27404)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42915 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27404)

(assert (=> b!791166 (= lt!353008 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!791167 () Bool)

(assert (=> b!791167 (= e!439668 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20543 a!3186) j!159) a!3186 mask!3328) lt!353005))))

(declare-fun b!791168 () Bool)

(assert (=> b!791168 (= e!439665 e!439669)))

(declare-fun res!536053 () Bool)

(assert (=> b!791168 (=> (not res!536053) (not e!439669))))

(declare-fun lt!353004 () array!42915)

(declare-fun lt!353009 () (_ BitVec 64))

(assert (=> b!791168 (= res!536053 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!353009 mask!3328) lt!353009 lt!353004 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!353009 lt!353004 mask!3328)))))

(assert (=> b!791168 (= lt!353009 (select (store (arr!20543 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!791168 (= lt!353004 (array!42916 (store (arr!20543 a!3186) i!1173 k0!2102) (size!20964 a!3186)))))

(assert (= (and start!67982 res!536041) b!791163))

(assert (= (and b!791163 res!536051) b!791157))

(assert (= (and b!791157 res!536044) b!791158))

(assert (= (and b!791158 res!536043) b!791159))

(assert (= (and b!791159 res!536052) b!791164))

(assert (= (and b!791164 res!536048) b!791165))

(assert (= (and b!791165 res!536055) b!791161))

(assert (= (and b!791161 res!536047) b!791155))

(assert (= (and b!791155 res!536046) b!791154))

(assert (= (and b!791154 res!536042) b!791152))

(assert (= (and b!791152 res!536050) b!791153))

(assert (= (and b!791153 c!87966) b!791162))

(assert (= (and b!791153 (not c!87966)) b!791156))

(assert (= (and b!791153 res!536045) b!791168))

(assert (= (and b!791168 res!536053) b!791166))

(assert (= (and b!791166 res!536054) b!791160))

(assert (= (and b!791160 res!536049) b!791167))

(declare-fun m!731385 () Bool)

(assert (=> b!791157 m!731385))

(assert (=> b!791157 m!731385))

(declare-fun m!731387 () Bool)

(assert (=> b!791157 m!731387))

(assert (=> b!791167 m!731385))

(assert (=> b!791167 m!731385))

(declare-fun m!731389 () Bool)

(assert (=> b!791167 m!731389))

(declare-fun m!731391 () Bool)

(assert (=> b!791161 m!731391))

(assert (=> b!791154 m!731385))

(assert (=> b!791154 m!731385))

(declare-fun m!731393 () Bool)

(assert (=> b!791154 m!731393))

(assert (=> b!791154 m!731393))

(assert (=> b!791154 m!731385))

(declare-fun m!731395 () Bool)

(assert (=> b!791154 m!731395))

(assert (=> b!791160 m!731385))

(assert (=> b!791160 m!731385))

(declare-fun m!731397 () Bool)

(assert (=> b!791160 m!731397))

(declare-fun m!731399 () Bool)

(assert (=> b!791159 m!731399))

(declare-fun m!731401 () Bool)

(assert (=> b!791168 m!731401))

(declare-fun m!731403 () Bool)

(assert (=> b!791168 m!731403))

(declare-fun m!731405 () Bool)

(assert (=> b!791168 m!731405))

(assert (=> b!791168 m!731401))

(declare-fun m!731407 () Bool)

(assert (=> b!791168 m!731407))

(declare-fun m!731409 () Bool)

(assert (=> b!791168 m!731409))

(declare-fun m!731411 () Bool)

(assert (=> b!791158 m!731411))

(declare-fun m!731413 () Bool)

(assert (=> b!791164 m!731413))

(assert (=> b!791156 m!731385))

(assert (=> b!791156 m!731385))

(declare-fun m!731415 () Bool)

(assert (=> b!791156 m!731415))

(declare-fun m!731417 () Bool)

(assert (=> start!67982 m!731417))

(declare-fun m!731419 () Bool)

(assert (=> start!67982 m!731419))

(declare-fun m!731421 () Bool)

(assert (=> b!791165 m!731421))

(assert (=> b!791162 m!731385))

(assert (=> b!791162 m!731385))

(declare-fun m!731423 () Bool)

(assert (=> b!791162 m!731423))

(declare-fun m!731425 () Bool)

(assert (=> b!791166 m!731425))

(declare-fun m!731427 () Bool)

(assert (=> b!791166 m!731427))

(declare-fun m!731429 () Bool)

(assert (=> b!791152 m!731429))

(check-sat (not b!791161) (not b!791159) (not b!791167) (not b!791164) (not b!791156) (not b!791160) (not b!791165) (not b!791154) (not b!791162) (not b!791166) (not start!67982) (not b!791157) (not b!791158) (not b!791168))
(check-sat)
