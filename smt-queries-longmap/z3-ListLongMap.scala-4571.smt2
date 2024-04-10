; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63726 () Bool)

(assert start!63726)

(declare-fun b!717215 () Bool)

(declare-fun res!480001 () Bool)

(declare-fun e!402677 () Bool)

(assert (=> b!717215 (=> (not res!480001) (not e!402677))))

(declare-datatypes ((array!40622 0))(
  ( (array!40623 (arr!19444 (Array (_ BitVec 32) (_ BitVec 64))) (size!19865 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40622)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!717215 (= res!480001 (and (= (size!19865 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19865 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19865 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!717216 () Bool)

(declare-fun res!480002 () Bool)

(assert (=> b!717216 (=> (not res!480002) (not e!402677))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40622 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!717216 (= res!480002 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-datatypes ((SeekEntryResult!7044 0))(
  ( (MissingZero!7044 (index!30544 (_ BitVec 32))) (Found!7044 (index!30545 (_ BitVec 32))) (Intermediate!7044 (undefined!7856 Bool) (index!30546 (_ BitVec 32)) (x!61568 (_ BitVec 32))) (Undefined!7044) (MissingVacant!7044 (index!30547 (_ BitVec 32))) )
))
(declare-fun lt!319025 () SeekEntryResult!7044)

(declare-fun b!717218 () Bool)

(assert (=> b!717218 (= e!402677 (and (or (= lt!319025 (MissingZero!7044 i!1173)) (= lt!319025 (MissingVacant!7044 i!1173))) (bvsgt #b00000000000000000000000000000000 (size!19865 a!3186))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40622 (_ BitVec 32)) SeekEntryResult!7044)

(assert (=> b!717218 (= lt!319025 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!717219 () Bool)

(declare-fun res!480004 () Bool)

(assert (=> b!717219 (=> (not res!480004) (not e!402677))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!717219 (= res!480004 (validKeyInArray!0 k0!2102))))

(declare-fun b!717217 () Bool)

(declare-fun res!480003 () Bool)

(assert (=> b!717217 (=> (not res!480003) (not e!402677))))

(assert (=> b!717217 (= res!480003 (validKeyInArray!0 (select (arr!19444 a!3186) j!159)))))

(declare-fun res!480005 () Bool)

(assert (=> start!63726 (=> (not res!480005) (not e!402677))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63726 (= res!480005 (validMask!0 mask!3328))))

(assert (=> start!63726 e!402677))

(declare-fun array_inv!15240 (array!40622) Bool)

(assert (=> start!63726 (array_inv!15240 a!3186)))

(assert (=> start!63726 true))

(assert (= (and start!63726 res!480005) b!717215))

(assert (= (and b!717215 res!480001) b!717217))

(assert (= (and b!717217 res!480003) b!717219))

(assert (= (and b!717219 res!480004) b!717216))

(assert (= (and b!717216 res!480002) b!717218))

(declare-fun m!673167 () Bool)

(assert (=> b!717217 m!673167))

(assert (=> b!717217 m!673167))

(declare-fun m!673169 () Bool)

(assert (=> b!717217 m!673169))

(declare-fun m!673171 () Bool)

(assert (=> b!717218 m!673171))

(declare-fun m!673173 () Bool)

(assert (=> b!717219 m!673173))

(declare-fun m!673175 () Bool)

(assert (=> b!717216 m!673175))

(declare-fun m!673177 () Bool)

(assert (=> start!63726 m!673177))

(declare-fun m!673179 () Bool)

(assert (=> start!63726 m!673179))

(check-sat (not start!63726) (not b!717218) (not b!717219) (not b!717217) (not b!717216))
(check-sat)
