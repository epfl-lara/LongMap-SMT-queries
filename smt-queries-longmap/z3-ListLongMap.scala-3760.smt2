; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51600 () Bool)

(assert start!51600)

(declare-fun b!564331 () Bool)

(declare-fun e!325124 () Bool)

(declare-fun e!325125 () Bool)

(assert (=> b!564331 (= e!325124 e!325125)))

(declare-fun res!355382 () Bool)

(assert (=> b!564331 (=> (not res!355382) (not e!325125))))

(declare-datatypes ((SeekEntryResult!5410 0))(
  ( (MissingZero!5410 (index!23867 (_ BitVec 32))) (Found!5410 (index!23868 (_ BitVec 32))) (Intermediate!5410 (undefined!6222 Bool) (index!23869 (_ BitVec 32)) (x!52900 (_ BitVec 32))) (Undefined!5410) (MissingVacant!5410 (index!23870 (_ BitVec 32))) )
))
(declare-fun lt!257560 () SeekEntryResult!5410)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!564331 (= res!355382 (or (= lt!257560 (MissingZero!5410 i!1132)) (= lt!257560 (MissingVacant!5410 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-datatypes ((array!35412 0))(
  ( (array!35413 (arr!17005 (Array (_ BitVec 32) (_ BitVec 64))) (size!17369 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35412)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35412 (_ BitVec 32)) SeekEntryResult!5410)

(assert (=> b!564331 (= lt!257560 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!564332 () Bool)

(declare-fun res!355381 () Bool)

(assert (=> b!564332 (=> (not res!355381) (not e!325124))))

(declare-fun arrayContainsKey!0 (array!35412 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!564332 (= res!355381 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!564333 () Bool)

(declare-fun res!355378 () Bool)

(assert (=> b!564333 (=> (not res!355378) (not e!325124))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!564333 (= res!355378 (and (= (size!17369 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17369 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17369 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!564334 () Bool)

(declare-fun res!355379 () Bool)

(assert (=> b!564334 (=> (not res!355379) (not e!325124))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!564334 (= res!355379 (validKeyInArray!0 (select (arr!17005 a!3118) j!142)))))

(declare-fun res!355383 () Bool)

(assert (=> start!51600 (=> (not res!355383) (not e!325124))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51600 (= res!355383 (validMask!0 mask!3119))))

(assert (=> start!51600 e!325124))

(assert (=> start!51600 true))

(declare-fun array_inv!12864 (array!35412) Bool)

(assert (=> start!51600 (array_inv!12864 a!3118)))

(declare-fun b!564335 () Bool)

(declare-fun res!355380 () Bool)

(assert (=> b!564335 (=> (not res!355380) (not e!325125))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35412 (_ BitVec 32)) Bool)

(assert (=> b!564335 (= res!355380 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!564336 () Bool)

(declare-fun res!355384 () Bool)

(assert (=> b!564336 (=> (not res!355384) (not e!325124))))

(assert (=> b!564336 (= res!355384 (validKeyInArray!0 k0!1914))))

(declare-fun b!564337 () Bool)

(assert (=> b!564337 (= e!325125 false)))

(declare-fun lt!257559 () Bool)

(declare-datatypes ((List!10992 0))(
  ( (Nil!10989) (Cons!10988 (h!11994 (_ BitVec 64)) (t!17212 List!10992)) )
))
(declare-fun arrayNoDuplicates!0 (array!35412 (_ BitVec 32) List!10992) Bool)

(assert (=> b!564337 (= lt!257559 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10989))))

(assert (= (and start!51600 res!355383) b!564333))

(assert (= (and b!564333 res!355378) b!564334))

(assert (= (and b!564334 res!355379) b!564336))

(assert (= (and b!564336 res!355384) b!564332))

(assert (= (and b!564332 res!355381) b!564331))

(assert (= (and b!564331 res!355382) b!564335))

(assert (= (and b!564335 res!355380) b!564337))

(declare-fun m!542933 () Bool)

(assert (=> b!564337 m!542933))

(declare-fun m!542935 () Bool)

(assert (=> b!564336 m!542935))

(declare-fun m!542937 () Bool)

(assert (=> b!564334 m!542937))

(assert (=> b!564334 m!542937))

(declare-fun m!542939 () Bool)

(assert (=> b!564334 m!542939))

(declare-fun m!542941 () Bool)

(assert (=> b!564335 m!542941))

(declare-fun m!542943 () Bool)

(assert (=> b!564332 m!542943))

(declare-fun m!542945 () Bool)

(assert (=> start!51600 m!542945))

(declare-fun m!542947 () Bool)

(assert (=> start!51600 m!542947))

(declare-fun m!542949 () Bool)

(assert (=> b!564331 m!542949))

(check-sat (not b!564335) (not b!564332) (not b!564337) (not start!51600) (not b!564334) (not b!564336) (not b!564331))
(check-sat)
