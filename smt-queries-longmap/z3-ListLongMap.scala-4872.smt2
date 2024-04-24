; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67264 () Bool)

(assert start!67264)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42499 0))(
  ( (array!42500 (arr!20341 (Array (_ BitVec 32) (_ BitVec 64))) (size!20761 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42499)

(declare-fun b!776593 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!432240 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7897 0))(
  ( (MissingZero!7897 (index!33956 (_ BitVec 32))) (Found!7897 (index!33957 (_ BitVec 32))) (Intermediate!7897 (undefined!8709 Bool) (index!33958 (_ BitVec 32)) (x!65059 (_ BitVec 32))) (Undefined!7897) (MissingVacant!7897 (index!33959 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42499 (_ BitVec 32)) SeekEntryResult!7897)

(assert (=> b!776593 (= e!432240 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20341 a!3186) j!159) a!3186 mask!3328) (Found!7897 j!159)))))

(declare-fun b!776594 () Bool)

(declare-fun e!432242 () Bool)

(declare-fun e!432244 () Bool)

(assert (=> b!776594 (= e!432242 e!432244)))

(declare-fun res!525080 () Bool)

(assert (=> b!776594 (=> (not res!525080) (not e!432244))))

(declare-fun lt!345955 () SeekEntryResult!7897)

(declare-fun lt!345947 () SeekEntryResult!7897)

(assert (=> b!776594 (= res!525080 (= lt!345955 lt!345947))))

(declare-fun lt!345948 () (_ BitVec 64))

(declare-fun lt!345949 () array!42499)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42499 (_ BitVec 32)) SeekEntryResult!7897)

(assert (=> b!776594 (= lt!345947 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!345948 lt!345949 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!776594 (= lt!345955 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!345948 mask!3328) lt!345948 lt!345949 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!776594 (= lt!345948 (select (store (arr!20341 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!776594 (= lt!345949 (array!42500 (store (arr!20341 a!3186) i!1173 k0!2102) (size!20761 a!3186)))))

(declare-fun b!776595 () Bool)

(declare-fun lt!345951 () SeekEntryResult!7897)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun e!432236 () Bool)

(assert (=> b!776595 (= e!432236 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20341 a!3186) j!159) a!3186 mask!3328) lt!345951))))

(declare-fun b!776596 () Bool)

(declare-fun res!525089 () Bool)

(declare-fun e!432237 () Bool)

(assert (=> b!776596 (=> (not res!525089) (not e!432237))))

(assert (=> b!776596 (= res!525089 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20761 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20761 a!3186))))))

(declare-fun b!776597 () Bool)

(declare-fun res!525088 () Bool)

(assert (=> b!776597 (=> (not res!525088) (not e!432237))))

(declare-datatypes ((List!14250 0))(
  ( (Nil!14247) (Cons!14246 (h!15360 (_ BitVec 64)) (t!20557 List!14250)) )
))
(declare-fun arrayNoDuplicates!0 (array!42499 (_ BitVec 32) List!14250) Bool)

(assert (=> b!776597 (= res!525088 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14247))))

(declare-fun b!776598 () Bool)

(declare-fun res!525076 () Bool)

(declare-fun e!432241 () Bool)

(assert (=> b!776598 (=> (not res!525076) (not e!432241))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!776598 (= res!525076 (validKeyInArray!0 k0!2102))))

(declare-fun b!776599 () Bool)

(assert (=> b!776599 (= e!432241 e!432237)))

(declare-fun res!525081 () Bool)

(assert (=> b!776599 (=> (not res!525081) (not e!432237))))

(declare-fun lt!345950 () SeekEntryResult!7897)

(assert (=> b!776599 (= res!525081 (or (= lt!345950 (MissingZero!7897 i!1173)) (= lt!345950 (MissingVacant!7897 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42499 (_ BitVec 32)) SeekEntryResult!7897)

(assert (=> b!776599 (= lt!345950 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!776600 () Bool)

(declare-fun e!432239 () Bool)

(assert (=> b!776600 (= e!432244 (not e!432239))))

(declare-fun res!525090 () Bool)

(assert (=> b!776600 (=> res!525090 e!432239)))

(get-info :version)

(assert (=> b!776600 (= res!525090 (or (not ((_ is Intermediate!7897) lt!345947)) (bvslt x!1131 (x!65059 lt!345947)) (not (= x!1131 (x!65059 lt!345947))) (not (= index!1321 (index!33958 lt!345947)))))))

(declare-fun e!432243 () Bool)

(assert (=> b!776600 e!432243))

(declare-fun res!525084 () Bool)

(assert (=> b!776600 (=> (not res!525084) (not e!432243))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42499 (_ BitVec 32)) Bool)

(assert (=> b!776600 (= res!525084 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26767 0))(
  ( (Unit!26768) )
))
(declare-fun lt!345954 () Unit!26767)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42499 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26767)

(assert (=> b!776600 (= lt!345954 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun lt!345952 () SeekEntryResult!7897)

(declare-fun b!776601 () Bool)

(assert (=> b!776601 (= e!432240 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20341 a!3186) j!159) a!3186 mask!3328) lt!345952))))

(declare-fun b!776602 () Bool)

(assert (=> b!776602 (= e!432239 true)))

(declare-fun lt!345953 () SeekEntryResult!7897)

(assert (=> b!776602 (= lt!345953 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20341 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!776603 () Bool)

(declare-fun res!525082 () Bool)

(assert (=> b!776603 (=> (not res!525082) (not e!432237))))

(assert (=> b!776603 (= res!525082 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!525077 () Bool)

(assert (=> start!67264 (=> (not res!525077) (not e!432241))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67264 (= res!525077 (validMask!0 mask!3328))))

(assert (=> start!67264 e!432241))

(assert (=> start!67264 true))

(declare-fun array_inv!16200 (array!42499) Bool)

(assert (=> start!67264 (array_inv!16200 a!3186)))

(declare-fun b!776604 () Bool)

(declare-fun res!525075 () Bool)

(assert (=> b!776604 (=> (not res!525075) (not e!432242))))

(assert (=> b!776604 (= res!525075 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20341 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!776605 () Bool)

(declare-fun res!525083 () Bool)

(assert (=> b!776605 (=> (not res!525083) (not e!432241))))

(declare-fun arrayContainsKey!0 (array!42499 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!776605 (= res!525083 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!776606 () Bool)

(declare-fun res!525086 () Bool)

(assert (=> b!776606 (=> (not res!525086) (not e!432242))))

(assert (=> b!776606 (= res!525086 e!432240)))

(declare-fun c!86162 () Bool)

(assert (=> b!776606 (= c!86162 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!776607 () Bool)

(declare-fun res!525087 () Bool)

(assert (=> b!776607 (=> (not res!525087) (not e!432241))))

(assert (=> b!776607 (= res!525087 (and (= (size!20761 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20761 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20761 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!776608 () Bool)

(declare-fun res!525078 () Bool)

(assert (=> b!776608 (=> (not res!525078) (not e!432241))))

(assert (=> b!776608 (= res!525078 (validKeyInArray!0 (select (arr!20341 a!3186) j!159)))))

(declare-fun b!776609 () Bool)

(assert (=> b!776609 (= e!432237 e!432242)))

(declare-fun res!525085 () Bool)

(assert (=> b!776609 (=> (not res!525085) (not e!432242))))

(assert (=> b!776609 (= res!525085 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20341 a!3186) j!159) mask!3328) (select (arr!20341 a!3186) j!159) a!3186 mask!3328) lt!345952))))

(assert (=> b!776609 (= lt!345952 (Intermediate!7897 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!776610 () Bool)

(assert (=> b!776610 (= e!432243 e!432236)))

(declare-fun res!525079 () Bool)

(assert (=> b!776610 (=> (not res!525079) (not e!432236))))

(assert (=> b!776610 (= res!525079 (= (seekEntryOrOpen!0 (select (arr!20341 a!3186) j!159) a!3186 mask!3328) lt!345951))))

(assert (=> b!776610 (= lt!345951 (Found!7897 j!159))))

(assert (= (and start!67264 res!525077) b!776607))

(assert (= (and b!776607 res!525087) b!776608))

(assert (= (and b!776608 res!525078) b!776598))

(assert (= (and b!776598 res!525076) b!776605))

(assert (= (and b!776605 res!525083) b!776599))

(assert (= (and b!776599 res!525081) b!776603))

(assert (= (and b!776603 res!525082) b!776597))

(assert (= (and b!776597 res!525088) b!776596))

(assert (= (and b!776596 res!525089) b!776609))

(assert (= (and b!776609 res!525085) b!776604))

(assert (= (and b!776604 res!525075) b!776606))

(assert (= (and b!776606 c!86162) b!776601))

(assert (= (and b!776606 (not c!86162)) b!776593))

(assert (= (and b!776606 res!525086) b!776594))

(assert (= (and b!776594 res!525080) b!776600))

(assert (= (and b!776600 res!525084) b!776610))

(assert (= (and b!776610 res!525079) b!776595))

(assert (= (and b!776600 (not res!525090)) b!776602))

(declare-fun m!721163 () Bool)

(assert (=> b!776604 m!721163))

(declare-fun m!721165 () Bool)

(assert (=> b!776608 m!721165))

(assert (=> b!776608 m!721165))

(declare-fun m!721167 () Bool)

(assert (=> b!776608 m!721167))

(assert (=> b!776610 m!721165))

(assert (=> b!776610 m!721165))

(declare-fun m!721169 () Bool)

(assert (=> b!776610 m!721169))

(declare-fun m!721171 () Bool)

(assert (=> b!776603 m!721171))

(declare-fun m!721173 () Bool)

(assert (=> b!776599 m!721173))

(assert (=> b!776602 m!721165))

(assert (=> b!776602 m!721165))

(declare-fun m!721175 () Bool)

(assert (=> b!776602 m!721175))

(assert (=> b!776595 m!721165))

(assert (=> b!776595 m!721165))

(declare-fun m!721177 () Bool)

(assert (=> b!776595 m!721177))

(declare-fun m!721179 () Bool)

(assert (=> b!776598 m!721179))

(assert (=> b!776609 m!721165))

(assert (=> b!776609 m!721165))

(declare-fun m!721181 () Bool)

(assert (=> b!776609 m!721181))

(assert (=> b!776609 m!721181))

(assert (=> b!776609 m!721165))

(declare-fun m!721183 () Bool)

(assert (=> b!776609 m!721183))

(assert (=> b!776601 m!721165))

(assert (=> b!776601 m!721165))

(declare-fun m!721185 () Bool)

(assert (=> b!776601 m!721185))

(declare-fun m!721187 () Bool)

(assert (=> b!776594 m!721187))

(declare-fun m!721189 () Bool)

(assert (=> b!776594 m!721189))

(assert (=> b!776594 m!721187))

(declare-fun m!721191 () Bool)

(assert (=> b!776594 m!721191))

(declare-fun m!721193 () Bool)

(assert (=> b!776594 m!721193))

(declare-fun m!721195 () Bool)

(assert (=> b!776594 m!721195))

(declare-fun m!721197 () Bool)

(assert (=> b!776605 m!721197))

(declare-fun m!721199 () Bool)

(assert (=> start!67264 m!721199))

(declare-fun m!721201 () Bool)

(assert (=> start!67264 m!721201))

(declare-fun m!721203 () Bool)

(assert (=> b!776600 m!721203))

(declare-fun m!721205 () Bool)

(assert (=> b!776600 m!721205))

(declare-fun m!721207 () Bool)

(assert (=> b!776597 m!721207))

(assert (=> b!776593 m!721165))

(assert (=> b!776593 m!721165))

(assert (=> b!776593 m!721175))

(check-sat (not b!776605) (not b!776609) (not b!776602) (not b!776595) (not b!776601) (not b!776610) (not b!776597) (not b!776608) (not b!776598) (not b!776603) (not b!776599) (not b!776600) (not b!776593) (not start!67264) (not b!776594))
(check-sat)
