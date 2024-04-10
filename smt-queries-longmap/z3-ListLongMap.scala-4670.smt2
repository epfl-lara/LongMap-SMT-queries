; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64938 () Bool)

(assert start!64938)

(declare-fun b!733157 () Bool)

(declare-fun res!492689 () Bool)

(declare-fun e!410234 () Bool)

(assert (=> b!733157 (=> (not res!492689) (not e!410234))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41249 0))(
  ( (array!41250 (arr!19741 (Array (_ BitVec 32) (_ BitVec 64))) (size!20162 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41249)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!733157 (= res!492689 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19741 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!733158 () Bool)

(declare-fun res!492688 () Bool)

(declare-fun e!410237 () Bool)

(assert (=> b!733158 (=> (not res!492688) (not e!410237))))

(declare-datatypes ((List!13743 0))(
  ( (Nil!13740) (Cons!13739 (h!14805 (_ BitVec 64)) (t!20058 List!13743)) )
))
(declare-fun arrayNoDuplicates!0 (array!41249 (_ BitVec 32) List!13743) Bool)

(assert (=> b!733158 (= res!492688 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13740))))

(declare-fun b!733159 () Bool)

(declare-fun e!410240 () Bool)

(declare-fun e!410232 () Bool)

(assert (=> b!733159 (= e!410240 e!410232)))

(declare-fun res!492673 () Bool)

(assert (=> b!733159 (=> res!492673 e!410232)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!733159 (= res!492673 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!324936 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!733159 (= lt!324936 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!733160 () Bool)

(assert (=> b!733160 (= e!410237 e!410234)))

(declare-fun res!492678 () Bool)

(assert (=> b!733160 (=> (not res!492678) (not e!410234))))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7341 0))(
  ( (MissingZero!7341 (index!31732 (_ BitVec 32))) (Found!7341 (index!31733 (_ BitVec 32))) (Intermediate!7341 (undefined!8153 Bool) (index!31734 (_ BitVec 32)) (x!62723 (_ BitVec 32))) (Undefined!7341) (MissingVacant!7341 (index!31735 (_ BitVec 32))) )
))
(declare-fun lt!324940 () SeekEntryResult!7341)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41249 (_ BitVec 32)) SeekEntryResult!7341)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!733160 (= res!492678 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19741 a!3186) j!159) mask!3328) (select (arr!19741 a!3186) j!159) a!3186 mask!3328) lt!324940))))

(assert (=> b!733160 (= lt!324940 (Intermediate!7341 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!733161 () Bool)

(declare-fun e!410239 () Bool)

(assert (=> b!733161 (= e!410239 (not e!410240))))

(declare-fun res!492684 () Bool)

(assert (=> b!733161 (=> res!492684 e!410240)))

(declare-fun lt!324939 () SeekEntryResult!7341)

(get-info :version)

(assert (=> b!733161 (= res!492684 (or (not ((_ is Intermediate!7341) lt!324939)) (bvsge x!1131 (x!62723 lt!324939))))))

(declare-fun e!410233 () Bool)

(assert (=> b!733161 e!410233))

(declare-fun res!492681 () Bool)

(assert (=> b!733161 (=> (not res!492681) (not e!410233))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41249 (_ BitVec 32)) Bool)

(assert (=> b!733161 (= res!492681 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25000 0))(
  ( (Unit!25001) )
))
(declare-fun lt!324933 () Unit!25000)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41249 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25000)

(assert (=> b!733161 (= lt!324933 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!733162 () Bool)

(declare-fun e!410236 () Bool)

(assert (=> b!733162 (= e!410236 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19741 a!3186) j!159) a!3186 mask!3328) lt!324940))))

(declare-fun b!733163 () Bool)

(declare-fun res!492687 () Bool)

(assert (=> b!733163 (=> (not res!492687) (not e!410237))))

(assert (=> b!733163 (= res!492687 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!492674 () Bool)

(declare-fun e!410235 () Bool)

(assert (=> start!64938 (=> (not res!492674) (not e!410235))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64938 (= res!492674 (validMask!0 mask!3328))))

(assert (=> start!64938 e!410235))

(assert (=> start!64938 true))

(declare-fun array_inv!15537 (array!41249) Bool)

(assert (=> start!64938 (array_inv!15537 a!3186)))

(declare-fun b!733164 () Bool)

(assert (=> b!733164 (= e!410234 e!410239)))

(declare-fun res!492685 () Bool)

(assert (=> b!733164 (=> (not res!492685) (not e!410239))))

(declare-fun lt!324938 () SeekEntryResult!7341)

(assert (=> b!733164 (= res!492685 (= lt!324938 lt!324939))))

(declare-fun lt!324937 () (_ BitVec 64))

(declare-fun lt!324941 () array!41249)

(assert (=> b!733164 (= lt!324939 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!324937 lt!324941 mask!3328))))

(assert (=> b!733164 (= lt!324938 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!324937 mask!3328) lt!324937 lt!324941 mask!3328))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!733164 (= lt!324937 (select (store (arr!19741 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!733164 (= lt!324941 (array!41250 (store (arr!19741 a!3186) i!1173 k0!2102) (size!20162 a!3186)))))

(declare-fun b!733165 () Bool)

(assert (=> b!733165 (= e!410232 (bvsge mask!3328 #b00000000000000000000000000000000))))

(declare-fun b!733166 () Bool)

(declare-fun res!492676 () Bool)

(assert (=> b!733166 (=> (not res!492676) (not e!410235))))

(assert (=> b!733166 (= res!492676 (and (= (size!20162 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20162 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20162 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!733167 () Bool)

(declare-fun res!492680 () Bool)

(assert (=> b!733167 (=> (not res!492680) (not e!410235))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!733167 (= res!492680 (validKeyInArray!0 k0!2102))))

(declare-fun b!733168 () Bool)

(declare-fun res!492683 () Bool)

(assert (=> b!733168 (=> (not res!492683) (not e!410234))))

(assert (=> b!733168 (= res!492683 e!410236)))

(declare-fun c!80620 () Bool)

(assert (=> b!733168 (= c!80620 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!733169 () Bool)

(declare-fun res!492679 () Bool)

(assert (=> b!733169 (=> (not res!492679) (not e!410237))))

(assert (=> b!733169 (= res!492679 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20162 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20162 a!3186))))))

(declare-fun b!733170 () Bool)

(declare-fun lt!324935 () SeekEntryResult!7341)

(declare-fun e!410238 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41249 (_ BitVec 32)) SeekEntryResult!7341)

(assert (=> b!733170 (= e!410238 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19741 a!3186) j!159) a!3186 mask!3328) lt!324935))))

(declare-fun b!733171 () Bool)

(declare-fun res!492677 () Bool)

(assert (=> b!733171 (=> (not res!492677) (not e!410235))))

(declare-fun arrayContainsKey!0 (array!41249 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!733171 (= res!492677 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!733172 () Bool)

(assert (=> b!733172 (= e!410233 e!410238)))

(declare-fun res!492686 () Bool)

(assert (=> b!733172 (=> (not res!492686) (not e!410238))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41249 (_ BitVec 32)) SeekEntryResult!7341)

(assert (=> b!733172 (= res!492686 (= (seekEntryOrOpen!0 (select (arr!19741 a!3186) j!159) a!3186 mask!3328) lt!324935))))

(assert (=> b!733172 (= lt!324935 (Found!7341 j!159))))

(declare-fun b!733173 () Bool)

(declare-fun res!492682 () Bool)

(assert (=> b!733173 (=> (not res!492682) (not e!410235))))

(assert (=> b!733173 (= res!492682 (validKeyInArray!0 (select (arr!19741 a!3186) j!159)))))

(declare-fun b!733174 () Bool)

(declare-fun res!492675 () Bool)

(assert (=> b!733174 (=> res!492675 e!410232)))

(assert (=> b!733174 (= res!492675 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19741 a!3186) j!159) a!3186 mask!3328) (Found!7341 j!159)))))

(declare-fun b!733175 () Bool)

(assert (=> b!733175 (= e!410236 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19741 a!3186) j!159) a!3186 mask!3328) (Found!7341 j!159)))))

(declare-fun b!733176 () Bool)

(assert (=> b!733176 (= e!410235 e!410237)))

(declare-fun res!492672 () Bool)

(assert (=> b!733176 (=> (not res!492672) (not e!410237))))

(declare-fun lt!324934 () SeekEntryResult!7341)

(assert (=> b!733176 (= res!492672 (or (= lt!324934 (MissingZero!7341 i!1173)) (= lt!324934 (MissingVacant!7341 i!1173))))))

(assert (=> b!733176 (= lt!324934 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(assert (= (and start!64938 res!492674) b!733166))

(assert (= (and b!733166 res!492676) b!733173))

(assert (= (and b!733173 res!492682) b!733167))

(assert (= (and b!733167 res!492680) b!733171))

(assert (= (and b!733171 res!492677) b!733176))

(assert (= (and b!733176 res!492672) b!733163))

(assert (= (and b!733163 res!492687) b!733158))

(assert (= (and b!733158 res!492688) b!733169))

(assert (= (and b!733169 res!492679) b!733160))

(assert (= (and b!733160 res!492678) b!733157))

(assert (= (and b!733157 res!492689) b!733168))

(assert (= (and b!733168 c!80620) b!733162))

(assert (= (and b!733168 (not c!80620)) b!733175))

(assert (= (and b!733168 res!492683) b!733164))

(assert (= (and b!733164 res!492685) b!733161))

(assert (= (and b!733161 res!492681) b!733172))

(assert (= (and b!733172 res!492686) b!733170))

(assert (= (and b!733161 (not res!492684)) b!733159))

(assert (= (and b!733159 (not res!492673)) b!733174))

(assert (= (and b!733174 (not res!492675)) b!733165))

(declare-fun m!686095 () Bool)

(assert (=> b!733157 m!686095))

(declare-fun m!686097 () Bool)

(assert (=> b!733167 m!686097))

(declare-fun m!686099 () Bool)

(assert (=> b!733171 m!686099))

(declare-fun m!686101 () Bool)

(assert (=> b!733158 m!686101))

(declare-fun m!686103 () Bool)

(assert (=> b!733159 m!686103))

(declare-fun m!686105 () Bool)

(assert (=> b!733161 m!686105))

(declare-fun m!686107 () Bool)

(assert (=> b!733161 m!686107))

(declare-fun m!686109 () Bool)

(assert (=> b!733164 m!686109))

(declare-fun m!686111 () Bool)

(assert (=> b!733164 m!686111))

(assert (=> b!733164 m!686109))

(declare-fun m!686113 () Bool)

(assert (=> b!733164 m!686113))

(declare-fun m!686115 () Bool)

(assert (=> b!733164 m!686115))

(declare-fun m!686117 () Bool)

(assert (=> b!733164 m!686117))

(declare-fun m!686119 () Bool)

(assert (=> start!64938 m!686119))

(declare-fun m!686121 () Bool)

(assert (=> start!64938 m!686121))

(declare-fun m!686123 () Bool)

(assert (=> b!733175 m!686123))

(assert (=> b!733175 m!686123))

(declare-fun m!686125 () Bool)

(assert (=> b!733175 m!686125))

(assert (=> b!733162 m!686123))

(assert (=> b!733162 m!686123))

(declare-fun m!686127 () Bool)

(assert (=> b!733162 m!686127))

(declare-fun m!686129 () Bool)

(assert (=> b!733163 m!686129))

(declare-fun m!686131 () Bool)

(assert (=> b!733176 m!686131))

(assert (=> b!733170 m!686123))

(assert (=> b!733170 m!686123))

(declare-fun m!686133 () Bool)

(assert (=> b!733170 m!686133))

(assert (=> b!733160 m!686123))

(assert (=> b!733160 m!686123))

(declare-fun m!686135 () Bool)

(assert (=> b!733160 m!686135))

(assert (=> b!733160 m!686135))

(assert (=> b!733160 m!686123))

(declare-fun m!686137 () Bool)

(assert (=> b!733160 m!686137))

(assert (=> b!733173 m!686123))

(assert (=> b!733173 m!686123))

(declare-fun m!686139 () Bool)

(assert (=> b!733173 m!686139))

(assert (=> b!733174 m!686123))

(assert (=> b!733174 m!686123))

(assert (=> b!733174 m!686125))

(assert (=> b!733172 m!686123))

(assert (=> b!733172 m!686123))

(declare-fun m!686141 () Bool)

(assert (=> b!733172 m!686141))

(check-sat (not b!733176) (not b!733174) (not b!733173) (not b!733161) (not b!733164) (not b!733160) (not b!733159) (not b!733162) (not b!733158) (not b!733170) (not b!733163) (not b!733172) (not b!733175) (not b!733171) (not start!64938) (not b!733167))
(check-sat)
