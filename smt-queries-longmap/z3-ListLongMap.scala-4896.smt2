; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67672 () Bool)

(assert start!67672)

(declare-fun b!782407 () Bool)

(declare-fun e!435199 () Bool)

(declare-fun e!435201 () Bool)

(assert (=> b!782407 (= e!435199 e!435201)))

(declare-fun res!529168 () Bool)

(assert (=> b!782407 (=> (not res!529168) (not e!435201))))

(declare-datatypes ((array!42655 0))(
  ( (array!42656 (arr!20413 (Array (_ BitVec 32) (_ BitVec 64))) (size!20833 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42655)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7969 0))(
  ( (MissingZero!7969 (index!34244 (_ BitVec 32))) (Found!7969 (index!34245 (_ BitVec 32))) (Intermediate!7969 (undefined!8781 Bool) (index!34246 (_ BitVec 32)) (x!65359 (_ BitVec 32))) (Undefined!7969) (MissingVacant!7969 (index!34247 (_ BitVec 32))) )
))
(declare-fun lt!348657 () SeekEntryResult!7969)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42655 (_ BitVec 32)) SeekEntryResult!7969)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!782407 (= res!529168 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20413 a!3186) j!159) mask!3328) (select (arr!20413 a!3186) j!159) a!3186 mask!3328) lt!348657))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!782407 (= lt!348657 (Intermediate!7969 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!782408 () Bool)

(declare-fun res!529172 () Bool)

(declare-fun e!435200 () Bool)

(assert (=> b!782408 (=> res!529172 e!435200)))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!348659 () SeekEntryResult!7969)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42655 (_ BitVec 32)) SeekEntryResult!7969)

(assert (=> b!782408 (= res!529172 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20413 a!3186) j!159) a!3186 mask!3328) lt!348659)))))

(declare-fun b!782409 () Bool)

(declare-fun e!435204 () Bool)

(assert (=> b!782409 (= e!435201 e!435204)))

(declare-fun res!529173 () Bool)

(assert (=> b!782409 (=> (not res!529173) (not e!435204))))

(declare-fun lt!348658 () SeekEntryResult!7969)

(declare-fun lt!348653 () SeekEntryResult!7969)

(assert (=> b!782409 (= res!529173 (= lt!348658 lt!348653))))

(declare-fun lt!348656 () (_ BitVec 64))

(declare-fun lt!348654 () array!42655)

(assert (=> b!782409 (= lt!348653 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!348656 lt!348654 mask!3328))))

(assert (=> b!782409 (= lt!348658 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!348656 mask!3328) lt!348656 lt!348654 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!782409 (= lt!348656 (select (store (arr!20413 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!782409 (= lt!348654 (array!42656 (store (arr!20413 a!3186) i!1173 k0!2102) (size!20833 a!3186)))))

(declare-fun b!782410 () Bool)

(declare-fun res!529167 () Bool)

(declare-fun e!435202 () Bool)

(assert (=> b!782410 (=> (not res!529167) (not e!435202))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!782410 (= res!529167 (validKeyInArray!0 (select (arr!20413 a!3186) j!159)))))

(declare-fun b!782411 () Bool)

(declare-fun res!529169 () Bool)

(assert (=> b!782411 (=> (not res!529169) (not e!435201))))

(assert (=> b!782411 (= res!529169 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20413 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!782412 () Bool)

(assert (=> b!782412 (= e!435204 (not e!435200))))

(declare-fun res!529170 () Bool)

(assert (=> b!782412 (=> res!529170 e!435200)))

(get-info :version)

(assert (=> b!782412 (= res!529170 (or (not ((_ is Intermediate!7969) lt!348653)) (bvslt x!1131 (x!65359 lt!348653)) (not (= x!1131 (x!65359 lt!348653))) (not (= index!1321 (index!34246 lt!348653)))))))

(declare-fun e!435205 () Bool)

(assert (=> b!782412 e!435205))

(declare-fun res!529176 () Bool)

(assert (=> b!782412 (=> (not res!529176) (not e!435205))))

(declare-fun lt!348652 () SeekEntryResult!7969)

(assert (=> b!782412 (= res!529176 (= lt!348652 lt!348659))))

(assert (=> b!782412 (= lt!348659 (Found!7969 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42655 (_ BitVec 32)) SeekEntryResult!7969)

(assert (=> b!782412 (= lt!348652 (seekEntryOrOpen!0 (select (arr!20413 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42655 (_ BitVec 32)) Bool)

(assert (=> b!782412 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!26941 0))(
  ( (Unit!26942) )
))
(declare-fun lt!348661 () Unit!26941)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42655 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26941)

(assert (=> b!782412 (= lt!348661 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!782413 () Bool)

(declare-fun res!529163 () Bool)

(assert (=> b!782413 (=> (not res!529163) (not e!435202))))

(declare-fun arrayContainsKey!0 (array!42655 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!782413 (= res!529163 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!782414 () Bool)

(declare-fun e!435203 () Unit!26941)

(declare-fun Unit!26943 () Unit!26941)

(assert (=> b!782414 (= e!435203 Unit!26943)))

(assert (=> b!782414 false))

(declare-fun b!782415 () Bool)

(declare-fun res!529178 () Bool)

(assert (=> b!782415 (=> (not res!529178) (not e!435199))))

(assert (=> b!782415 (= res!529178 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20833 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20833 a!3186))))))

(declare-fun b!782416 () Bool)

(declare-fun res!529174 () Bool)

(assert (=> b!782416 (=> (not res!529174) (not e!435199))))

(declare-datatypes ((List!14322 0))(
  ( (Nil!14319) (Cons!14318 (h!15444 (_ BitVec 64)) (t!20629 List!14322)) )
))
(declare-fun arrayNoDuplicates!0 (array!42655 (_ BitVec 32) List!14322) Bool)

(assert (=> b!782416 (= res!529174 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14319))))

(declare-fun b!782417 () Bool)

(declare-fun res!529177 () Bool)

(assert (=> b!782417 (=> (not res!529177) (not e!435199))))

(assert (=> b!782417 (= res!529177 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!782418 () Bool)

(assert (=> b!782418 (= e!435202 e!435199)))

(declare-fun res!529175 () Bool)

(assert (=> b!782418 (=> (not res!529175) (not e!435199))))

(declare-fun lt!348655 () SeekEntryResult!7969)

(assert (=> b!782418 (= res!529175 (or (= lt!348655 (MissingZero!7969 i!1173)) (= lt!348655 (MissingVacant!7969 i!1173))))))

(assert (=> b!782418 (= lt!348655 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!782420 () Bool)

(declare-fun res!529166 () Bool)

(assert (=> b!782420 (=> res!529166 e!435200)))

(assert (=> b!782420 (= res!529166 (= (select (store (arr!20413 a!3186) i!1173 k0!2102) index!1321) lt!348656))))

(declare-fun b!782421 () Bool)

(declare-fun res!529171 () Bool)

(assert (=> b!782421 (=> (not res!529171) (not e!435202))))

(assert (=> b!782421 (= res!529171 (and (= (size!20833 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20833 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20833 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!782422 () Bool)

(declare-fun Unit!26944 () Unit!26941)

(assert (=> b!782422 (= e!435203 Unit!26944)))

(declare-fun b!782423 () Bool)

(assert (=> b!782423 (= e!435200 true)))

(assert (=> b!782423 (= (select (store (arr!20413 a!3186) i!1173 k0!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!348660 () Unit!26941)

(assert (=> b!782423 (= lt!348660 e!435203)))

(declare-fun c!87031 () Bool)

(assert (=> b!782423 (= c!87031 (= (select (store (arr!20413 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!782424 () Bool)

(declare-fun e!435197 () Bool)

(assert (=> b!782424 (= e!435197 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20413 a!3186) j!159) a!3186 mask!3328) lt!348657))))

(declare-fun b!782425 () Bool)

(assert (=> b!782425 (= e!435205 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20413 a!3186) j!159) a!3186 mask!3328) lt!348659))))

(declare-fun b!782426 () Bool)

(declare-fun res!529164 () Bool)

(assert (=> b!782426 (=> (not res!529164) (not e!435202))))

(assert (=> b!782426 (= res!529164 (validKeyInArray!0 k0!2102))))

(declare-fun b!782427 () Bool)

(declare-fun res!529179 () Bool)

(assert (=> b!782427 (=> (not res!529179) (not e!435201))))

(assert (=> b!782427 (= res!529179 e!435197)))

(declare-fun c!87032 () Bool)

(assert (=> b!782427 (= c!87032 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!782419 () Bool)

(assert (=> b!782419 (= e!435197 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20413 a!3186) j!159) a!3186 mask!3328) (Found!7969 j!159)))))

(declare-fun res!529165 () Bool)

(assert (=> start!67672 (=> (not res!529165) (not e!435202))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67672 (= res!529165 (validMask!0 mask!3328))))

(assert (=> start!67672 e!435202))

(assert (=> start!67672 true))

(declare-fun array_inv!16272 (array!42655) Bool)

(assert (=> start!67672 (array_inv!16272 a!3186)))

(assert (= (and start!67672 res!529165) b!782421))

(assert (= (and b!782421 res!529171) b!782410))

(assert (= (and b!782410 res!529167) b!782426))

(assert (= (and b!782426 res!529164) b!782413))

(assert (= (and b!782413 res!529163) b!782418))

(assert (= (and b!782418 res!529175) b!782417))

(assert (= (and b!782417 res!529177) b!782416))

(assert (= (and b!782416 res!529174) b!782415))

(assert (= (and b!782415 res!529178) b!782407))

(assert (= (and b!782407 res!529168) b!782411))

(assert (= (and b!782411 res!529169) b!782427))

(assert (= (and b!782427 c!87032) b!782424))

(assert (= (and b!782427 (not c!87032)) b!782419))

(assert (= (and b!782427 res!529179) b!782409))

(assert (= (and b!782409 res!529173) b!782412))

(assert (= (and b!782412 res!529176) b!782425))

(assert (= (and b!782412 (not res!529170)) b!782408))

(assert (= (and b!782408 (not res!529172)) b!782420))

(assert (= (and b!782420 (not res!529166)) b!782423))

(assert (= (and b!782423 c!87031) b!782414))

(assert (= (and b!782423 (not c!87031)) b!782422))

(declare-fun m!725777 () Bool)

(assert (=> b!782416 m!725777))

(declare-fun m!725779 () Bool)

(assert (=> b!782408 m!725779))

(assert (=> b!782408 m!725779))

(declare-fun m!725781 () Bool)

(assert (=> b!782408 m!725781))

(declare-fun m!725783 () Bool)

(assert (=> b!782409 m!725783))

(declare-fun m!725785 () Bool)

(assert (=> b!782409 m!725785))

(declare-fun m!725787 () Bool)

(assert (=> b!782409 m!725787))

(declare-fun m!725789 () Bool)

(assert (=> b!782409 m!725789))

(assert (=> b!782409 m!725783))

(declare-fun m!725791 () Bool)

(assert (=> b!782409 m!725791))

(assert (=> b!782424 m!725779))

(assert (=> b!782424 m!725779))

(declare-fun m!725793 () Bool)

(assert (=> b!782424 m!725793))

(assert (=> b!782412 m!725779))

(assert (=> b!782412 m!725779))

(declare-fun m!725795 () Bool)

(assert (=> b!782412 m!725795))

(declare-fun m!725797 () Bool)

(assert (=> b!782412 m!725797))

(declare-fun m!725799 () Bool)

(assert (=> b!782412 m!725799))

(assert (=> b!782423 m!725785))

(declare-fun m!725801 () Bool)

(assert (=> b!782423 m!725801))

(assert (=> b!782425 m!725779))

(assert (=> b!782425 m!725779))

(declare-fun m!725803 () Bool)

(assert (=> b!782425 m!725803))

(declare-fun m!725805 () Bool)

(assert (=> b!782411 m!725805))

(assert (=> b!782419 m!725779))

(assert (=> b!782419 m!725779))

(assert (=> b!782419 m!725781))

(assert (=> b!782420 m!725785))

(assert (=> b!782420 m!725801))

(declare-fun m!725807 () Bool)

(assert (=> b!782426 m!725807))

(declare-fun m!725809 () Bool)

(assert (=> b!782418 m!725809))

(assert (=> b!782407 m!725779))

(assert (=> b!782407 m!725779))

(declare-fun m!725811 () Bool)

(assert (=> b!782407 m!725811))

(assert (=> b!782407 m!725811))

(assert (=> b!782407 m!725779))

(declare-fun m!725813 () Bool)

(assert (=> b!782407 m!725813))

(declare-fun m!725815 () Bool)

(assert (=> b!782417 m!725815))

(declare-fun m!725817 () Bool)

(assert (=> start!67672 m!725817))

(declare-fun m!725819 () Bool)

(assert (=> start!67672 m!725819))

(assert (=> b!782410 m!725779))

(assert (=> b!782410 m!725779))

(declare-fun m!725821 () Bool)

(assert (=> b!782410 m!725821))

(declare-fun m!725823 () Bool)

(assert (=> b!782413 m!725823))

(check-sat (not b!782413) (not b!782419) (not start!67672) (not b!782416) (not b!782409) (not b!782426) (not b!782417) (not b!782407) (not b!782418) (not b!782424) (not b!782410) (not b!782425) (not b!782408) (not b!782412))
(check-sat)
