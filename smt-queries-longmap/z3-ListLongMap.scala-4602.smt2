; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64188 () Bool)

(assert start!64188)

(declare-fun b!720911 () Bool)

(declare-fun e!404289 () Bool)

(declare-fun e!404287 () Bool)

(assert (=> b!720911 (= e!404289 e!404287)))

(declare-fun res!483017 () Bool)

(assert (=> b!720911 (=> (not res!483017) (not e!404287))))

(declare-datatypes ((array!40826 0))(
  ( (array!40827 (arr!19537 (Array (_ BitVec 32) (_ BitVec 64))) (size!19958 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40826)

(declare-datatypes ((SeekEntryResult!7137 0))(
  ( (MissingZero!7137 (index!30916 (_ BitVec 32))) (Found!7137 (index!30917 (_ BitVec 32))) (Intermediate!7137 (undefined!7949 Bool) (index!30918 (_ BitVec 32)) (x!61921 (_ BitVec 32))) (Undefined!7137) (MissingVacant!7137 (index!30919 (_ BitVec 32))) )
))
(declare-fun lt!319919 () SeekEntryResult!7137)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40826 (_ BitVec 32)) SeekEntryResult!7137)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!720911 (= res!483017 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19537 a!3186) j!159) mask!3328) (select (arr!19537 a!3186) j!159) a!3186 mask!3328) lt!319919))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!720911 (= lt!319919 (Intermediate!7137 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!720912 () Bool)

(declare-fun res!483011 () Bool)

(declare-fun e!404288 () Bool)

(assert (=> b!720912 (=> (not res!483011) (not e!404288))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!720912 (= res!483011 (validKeyInArray!0 (select (arr!19537 a!3186) j!159)))))

(declare-fun b!720913 () Bool)

(declare-fun res!483020 () Bool)

(assert (=> b!720913 (=> (not res!483020) (not e!404288))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40826 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!720913 (= res!483020 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!720914 () Bool)

(declare-fun res!483013 () Bool)

(assert (=> b!720914 (=> (not res!483013) (not e!404289))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!720914 (= res!483013 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19958 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19958 a!3186))))))

(declare-fun b!720915 () Bool)

(declare-fun res!483009 () Bool)

(assert (=> b!720915 (=> (not res!483009) (not e!404287))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!720915 (= res!483009 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19537 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!720916 () Bool)

(declare-fun e!404291 () Bool)

(assert (=> b!720916 (= e!404291 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19537 a!3186) j!159) a!3186 mask!3328) lt!319919))))

(declare-fun res!483012 () Bool)

(assert (=> start!64188 (=> (not res!483012) (not e!404288))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64188 (= res!483012 (validMask!0 mask!3328))))

(assert (=> start!64188 e!404288))

(assert (=> start!64188 true))

(declare-fun array_inv!15333 (array!40826) Bool)

(assert (=> start!64188 (array_inv!15333 a!3186)))

(declare-fun b!720917 () Bool)

(assert (=> b!720917 (= e!404287 false)))

(declare-fun lt!319918 () (_ BitVec 32))

(assert (=> b!720917 (= lt!319918 (toIndex!0 (select (store (arr!19537 a!3186) i!1173 k0!2102) j!159) mask!3328))))

(declare-fun b!720918 () Bool)

(declare-fun res!483019 () Bool)

(assert (=> b!720918 (=> (not res!483019) (not e!404289))))

(declare-datatypes ((List!13539 0))(
  ( (Nil!13536) (Cons!13535 (h!14586 (_ BitVec 64)) (t!19854 List!13539)) )
))
(declare-fun arrayNoDuplicates!0 (array!40826 (_ BitVec 32) List!13539) Bool)

(assert (=> b!720918 (= res!483019 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13536))))

(declare-fun b!720919 () Bool)

(declare-fun res!483015 () Bool)

(assert (=> b!720919 (=> (not res!483015) (not e!404289))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40826 (_ BitVec 32)) Bool)

(assert (=> b!720919 (= res!483015 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!720920 () Bool)

(declare-fun res!483016 () Bool)

(assert (=> b!720920 (=> (not res!483016) (not e!404288))))

(assert (=> b!720920 (= res!483016 (and (= (size!19958 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19958 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19958 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!720921 () Bool)

(declare-fun res!483010 () Bool)

(assert (=> b!720921 (=> (not res!483010) (not e!404288))))

(assert (=> b!720921 (= res!483010 (validKeyInArray!0 k0!2102))))

(declare-fun b!720922 () Bool)

(declare-fun res!483018 () Bool)

(assert (=> b!720922 (=> (not res!483018) (not e!404287))))

(assert (=> b!720922 (= res!483018 e!404291)))

(declare-fun c!79321 () Bool)

(assert (=> b!720922 (= c!79321 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!720923 () Bool)

(assert (=> b!720923 (= e!404288 e!404289)))

(declare-fun res!483014 () Bool)

(assert (=> b!720923 (=> (not res!483014) (not e!404289))))

(declare-fun lt!319917 () SeekEntryResult!7137)

(assert (=> b!720923 (= res!483014 (or (= lt!319917 (MissingZero!7137 i!1173)) (= lt!319917 (MissingVacant!7137 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40826 (_ BitVec 32)) SeekEntryResult!7137)

(assert (=> b!720923 (= lt!319917 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!720924 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40826 (_ BitVec 32)) SeekEntryResult!7137)

(assert (=> b!720924 (= e!404291 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19537 a!3186) j!159) a!3186 mask!3328) (Found!7137 j!159)))))

(assert (= (and start!64188 res!483012) b!720920))

(assert (= (and b!720920 res!483016) b!720912))

(assert (= (and b!720912 res!483011) b!720921))

(assert (= (and b!720921 res!483010) b!720913))

(assert (= (and b!720913 res!483020) b!720923))

(assert (= (and b!720923 res!483014) b!720919))

(assert (= (and b!720919 res!483015) b!720918))

(assert (= (and b!720918 res!483019) b!720914))

(assert (= (and b!720914 res!483013) b!720911))

(assert (= (and b!720911 res!483017) b!720915))

(assert (= (and b!720915 res!483009) b!720922))

(assert (= (and b!720922 c!79321) b!720916))

(assert (= (and b!720922 (not c!79321)) b!720924))

(assert (= (and b!720922 res!483018) b!720917))

(declare-fun m!675899 () Bool)

(assert (=> b!720923 m!675899))

(declare-fun m!675901 () Bool)

(assert (=> b!720915 m!675901))

(declare-fun m!675903 () Bool)

(assert (=> b!720924 m!675903))

(assert (=> b!720924 m!675903))

(declare-fun m!675905 () Bool)

(assert (=> b!720924 m!675905))

(declare-fun m!675907 () Bool)

(assert (=> b!720921 m!675907))

(assert (=> b!720916 m!675903))

(assert (=> b!720916 m!675903))

(declare-fun m!675909 () Bool)

(assert (=> b!720916 m!675909))

(declare-fun m!675911 () Bool)

(assert (=> start!64188 m!675911))

(declare-fun m!675913 () Bool)

(assert (=> start!64188 m!675913))

(assert (=> b!720911 m!675903))

(assert (=> b!720911 m!675903))

(declare-fun m!675915 () Bool)

(assert (=> b!720911 m!675915))

(assert (=> b!720911 m!675915))

(assert (=> b!720911 m!675903))

(declare-fun m!675917 () Bool)

(assert (=> b!720911 m!675917))

(assert (=> b!720912 m!675903))

(assert (=> b!720912 m!675903))

(declare-fun m!675919 () Bool)

(assert (=> b!720912 m!675919))

(declare-fun m!675921 () Bool)

(assert (=> b!720918 m!675921))

(declare-fun m!675923 () Bool)

(assert (=> b!720917 m!675923))

(declare-fun m!675925 () Bool)

(assert (=> b!720917 m!675925))

(assert (=> b!720917 m!675925))

(declare-fun m!675927 () Bool)

(assert (=> b!720917 m!675927))

(declare-fun m!675929 () Bool)

(assert (=> b!720919 m!675929))

(declare-fun m!675931 () Bool)

(assert (=> b!720913 m!675931))

(check-sat (not start!64188) (not b!720911) (not b!720916) (not b!720924) (not b!720919) (not b!720917) (not b!720921) (not b!720923) (not b!720912) (not b!720918) (not b!720913))
(check-sat)
