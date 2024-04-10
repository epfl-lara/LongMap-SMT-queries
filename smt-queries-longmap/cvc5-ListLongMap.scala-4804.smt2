; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65884 () Bool)

(assert start!65884)

(declare-fun b!759656 () Bool)

(declare-fun res!514133 () Bool)

(declare-fun e!423465 () Bool)

(assert (=> b!759656 (=> (not res!514133) (not e!423465))))

(declare-fun e!423463 () Bool)

(assert (=> b!759656 (= res!514133 e!423463)))

(declare-fun c!83143 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!759656 (= c!83143 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!759657 () Bool)

(declare-fun res!514136 () Bool)

(assert (=> b!759657 (=> (not res!514136) (not e!423465))))

(declare-datatypes ((array!42057 0))(
  ( (array!42058 (arr!20142 (Array (_ BitVec 32) (_ BitVec 64))) (size!20563 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42057)

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!759657 (= res!514136 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20142 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!759658 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7742 0))(
  ( (MissingZero!7742 (index!33336 (_ BitVec 32))) (Found!7742 (index!33337 (_ BitVec 32))) (Intermediate!7742 (undefined!8554 Bool) (index!33338 (_ BitVec 32)) (x!64220 (_ BitVec 32))) (Undefined!7742) (MissingVacant!7742 (index!33339 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42057 (_ BitVec 32)) SeekEntryResult!7742)

(assert (=> b!759658 (= e!423463 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20142 a!3186) j!159) a!3186 mask!3328) (Found!7742 j!159)))))

(declare-fun b!759659 () Bool)

(declare-fun res!514135 () Bool)

(declare-fun e!423467 () Bool)

(assert (=> b!759659 (=> (not res!514135) (not e!423467))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42057 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!759659 (= res!514135 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!759660 () Bool)

(declare-fun res!514143 () Bool)

(assert (=> b!759660 (=> (not res!514143) (not e!423467))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!759660 (= res!514143 (validKeyInArray!0 k!2102))))

(declare-fun b!759661 () Bool)

(declare-fun res!514137 () Bool)

(declare-fun e!423468 () Bool)

(assert (=> b!759661 (=> (not res!514137) (not e!423468))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42057 (_ BitVec 32)) Bool)

(assert (=> b!759661 (= res!514137 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!759662 () Bool)

(declare-fun e!423466 () Bool)

(declare-fun e!423464 () Bool)

(assert (=> b!759662 (= e!423466 e!423464)))

(declare-fun res!514139 () Bool)

(assert (=> b!759662 (=> (not res!514139) (not e!423464))))

(declare-fun lt!338482 () SeekEntryResult!7742)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42057 (_ BitVec 32)) SeekEntryResult!7742)

(assert (=> b!759662 (= res!514139 (= (seekEntryOrOpen!0 (select (arr!20142 a!3186) j!159) a!3186 mask!3328) lt!338482))))

(assert (=> b!759662 (= lt!338482 (Found!7742 j!159))))

(declare-fun b!759663 () Bool)

(assert (=> b!759663 (= e!423468 e!423465)))

(declare-fun res!514141 () Bool)

(assert (=> b!759663 (=> (not res!514141) (not e!423465))))

(declare-fun lt!338488 () SeekEntryResult!7742)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42057 (_ BitVec 32)) SeekEntryResult!7742)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!759663 (= res!514141 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20142 a!3186) j!159) mask!3328) (select (arr!20142 a!3186) j!159) a!3186 mask!3328) lt!338488))))

(assert (=> b!759663 (= lt!338488 (Intermediate!7742 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!759664 () Bool)

(declare-fun res!514134 () Bool)

(assert (=> b!759664 (=> (not res!514134) (not e!423467))))

(assert (=> b!759664 (= res!514134 (validKeyInArray!0 (select (arr!20142 a!3186) j!159)))))

(declare-fun b!759665 () Bool)

(assert (=> b!759665 (= e!423467 e!423468)))

(declare-fun res!514142 () Bool)

(assert (=> b!759665 (=> (not res!514142) (not e!423468))))

(declare-fun lt!338487 () SeekEntryResult!7742)

(assert (=> b!759665 (= res!514142 (or (= lt!338487 (MissingZero!7742 i!1173)) (= lt!338487 (MissingVacant!7742 i!1173))))))

(assert (=> b!759665 (= lt!338487 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!759666 () Bool)

(assert (=> b!759666 (= e!423464 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20142 a!3186) j!159) a!3186 mask!3328) lt!338482))))

(declare-fun b!759667 () Bool)

(declare-fun e!423469 () Bool)

(declare-fun lt!338486 () SeekEntryResult!7742)

(assert (=> b!759667 (= e!423469 (not (or (not (is-Intermediate!7742 lt!338486)) (bvslt x!1131 (x!64220 lt!338486)) (= x!1131 (x!64220 lt!338486)))))))

(assert (=> b!759667 e!423466))

(declare-fun res!514144 () Bool)

(assert (=> b!759667 (=> (not res!514144) (not e!423466))))

(assert (=> b!759667 (= res!514144 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26324 0))(
  ( (Unit!26325) )
))
(declare-fun lt!338484 () Unit!26324)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42057 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26324)

(assert (=> b!759667 (= lt!338484 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun res!514132 () Bool)

(assert (=> start!65884 (=> (not res!514132) (not e!423467))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65884 (= res!514132 (validMask!0 mask!3328))))

(assert (=> start!65884 e!423467))

(assert (=> start!65884 true))

(declare-fun array_inv!15938 (array!42057) Bool)

(assert (=> start!65884 (array_inv!15938 a!3186)))

(declare-fun b!759668 () Bool)

(declare-fun res!514145 () Bool)

(assert (=> b!759668 (=> (not res!514145) (not e!423468))))

(assert (=> b!759668 (= res!514145 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20563 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20563 a!3186))))))

(declare-fun b!759669 () Bool)

(declare-fun res!514140 () Bool)

(assert (=> b!759669 (=> (not res!514140) (not e!423467))))

(assert (=> b!759669 (= res!514140 (and (= (size!20563 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20563 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20563 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!759670 () Bool)

(assert (=> b!759670 (= e!423465 e!423469)))

(declare-fun res!514138 () Bool)

(assert (=> b!759670 (=> (not res!514138) (not e!423469))))

(declare-fun lt!338483 () SeekEntryResult!7742)

(assert (=> b!759670 (= res!514138 (= lt!338483 lt!338486))))

(declare-fun lt!338489 () array!42057)

(declare-fun lt!338485 () (_ BitVec 64))

(assert (=> b!759670 (= lt!338486 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!338485 lt!338489 mask!3328))))

(assert (=> b!759670 (= lt!338483 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!338485 mask!3328) lt!338485 lt!338489 mask!3328))))

(assert (=> b!759670 (= lt!338485 (select (store (arr!20142 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!759670 (= lt!338489 (array!42058 (store (arr!20142 a!3186) i!1173 k!2102) (size!20563 a!3186)))))

(declare-fun b!759671 () Bool)

(declare-fun res!514131 () Bool)

(assert (=> b!759671 (=> (not res!514131) (not e!423468))))

(declare-datatypes ((List!14144 0))(
  ( (Nil!14141) (Cons!14140 (h!15212 (_ BitVec 64)) (t!20459 List!14144)) )
))
(declare-fun arrayNoDuplicates!0 (array!42057 (_ BitVec 32) List!14144) Bool)

(assert (=> b!759671 (= res!514131 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14141))))

(declare-fun b!759672 () Bool)

(assert (=> b!759672 (= e!423463 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20142 a!3186) j!159) a!3186 mask!3328) lt!338488))))

(assert (= (and start!65884 res!514132) b!759669))

(assert (= (and b!759669 res!514140) b!759664))

(assert (= (and b!759664 res!514134) b!759660))

(assert (= (and b!759660 res!514143) b!759659))

(assert (= (and b!759659 res!514135) b!759665))

(assert (= (and b!759665 res!514142) b!759661))

(assert (= (and b!759661 res!514137) b!759671))

(assert (= (and b!759671 res!514131) b!759668))

(assert (= (and b!759668 res!514145) b!759663))

(assert (= (and b!759663 res!514141) b!759657))

(assert (= (and b!759657 res!514136) b!759656))

(assert (= (and b!759656 c!83143) b!759672))

(assert (= (and b!759656 (not c!83143)) b!759658))

(assert (= (and b!759656 res!514133) b!759670))

(assert (= (and b!759670 res!514138) b!759667))

(assert (= (and b!759667 res!514144) b!759662))

(assert (= (and b!759662 res!514139) b!759666))

(declare-fun m!706993 () Bool)

(assert (=> b!759665 m!706993))

(declare-fun m!706995 () Bool)

(assert (=> b!759660 m!706995))

(declare-fun m!706997 () Bool)

(assert (=> b!759666 m!706997))

(assert (=> b!759666 m!706997))

(declare-fun m!706999 () Bool)

(assert (=> b!759666 m!706999))

(assert (=> b!759662 m!706997))

(assert (=> b!759662 m!706997))

(declare-fun m!707001 () Bool)

(assert (=> b!759662 m!707001))

(assert (=> b!759672 m!706997))

(assert (=> b!759672 m!706997))

(declare-fun m!707003 () Bool)

(assert (=> b!759672 m!707003))

(assert (=> b!759664 m!706997))

(assert (=> b!759664 m!706997))

(declare-fun m!707005 () Bool)

(assert (=> b!759664 m!707005))

(declare-fun m!707007 () Bool)

(assert (=> b!759659 m!707007))

(declare-fun m!707009 () Bool)

(assert (=> start!65884 m!707009))

(declare-fun m!707011 () Bool)

(assert (=> start!65884 m!707011))

(declare-fun m!707013 () Bool)

(assert (=> b!759661 m!707013))

(declare-fun m!707015 () Bool)

(assert (=> b!759670 m!707015))

(declare-fun m!707017 () Bool)

(assert (=> b!759670 m!707017))

(declare-fun m!707019 () Bool)

(assert (=> b!759670 m!707019))

(assert (=> b!759670 m!707015))

(declare-fun m!707021 () Bool)

(assert (=> b!759670 m!707021))

(declare-fun m!707023 () Bool)

(assert (=> b!759670 m!707023))

(declare-fun m!707025 () Bool)

(assert (=> b!759667 m!707025))

(declare-fun m!707027 () Bool)

(assert (=> b!759667 m!707027))

(assert (=> b!759663 m!706997))

(assert (=> b!759663 m!706997))

(declare-fun m!707029 () Bool)

(assert (=> b!759663 m!707029))

(assert (=> b!759663 m!707029))

(assert (=> b!759663 m!706997))

(declare-fun m!707031 () Bool)

(assert (=> b!759663 m!707031))

(declare-fun m!707033 () Bool)

(assert (=> b!759671 m!707033))

(declare-fun m!707035 () Bool)

(assert (=> b!759657 m!707035))

(assert (=> b!759658 m!706997))

(assert (=> b!759658 m!706997))

(declare-fun m!707037 () Bool)

(assert (=> b!759658 m!707037))

(push 1)

(assert (not b!759667))

(assert (not b!759671))

(assert (not b!759658))

(assert (not b!759666))

(assert (not b!759670))

(assert (not b!759661))

(assert (not b!759664))

(assert (not start!65884))

(assert (not b!759663))

(assert (not b!759662))

(assert (not b!759665))

(assert (not b!759659))

(assert (not b!759672))

(assert (not b!759660))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!100381 () Bool)

(assert (=> d!100381 (= (validKeyInArray!0 (select (arr!20142 a!3186) j!159)) (and (not (= (select (arr!20142 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20142 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!759664 d!100381))

(declare-fun b!759850 () Bool)

(declare-fun e!423565 () SeekEntryResult!7742)

(declare-fun e!423566 () SeekEntryResult!7742)

(assert (=> b!759850 (= e!423565 e!423566)))

(declare-fun lt!338572 () (_ BitVec 64))

(declare-fun lt!338571 () SeekEntryResult!7742)

(assert (=> b!759850 (= lt!338572 (select (arr!20142 a!3186) (index!33338 lt!338571)))))

(declare-fun c!83179 () Bool)

(assert (=> b!759850 (= c!83179 (= lt!338572 k!2102))))

(declare-fun d!100383 () Bool)

(declare-fun lt!338573 () SeekEntryResult!7742)

(assert (=> d!100383 (and (or (is-Undefined!7742 lt!338573) (not (is-Found!7742 lt!338573)) (and (bvsge (index!33337 lt!338573) #b00000000000000000000000000000000) (bvslt (index!33337 lt!338573) (size!20563 a!3186)))) (or (is-Undefined!7742 lt!338573) (is-Found!7742 lt!338573) (not (is-MissingZero!7742 lt!338573)) (and (bvsge (index!33336 lt!338573) #b00000000000000000000000000000000) (bvslt (index!33336 lt!338573) (size!20563 a!3186)))) (or (is-Undefined!7742 lt!338573) (is-Found!7742 lt!338573) (is-MissingZero!7742 lt!338573) (not (is-MissingVacant!7742 lt!338573)) (and (bvsge (index!33339 lt!338573) #b00000000000000000000000000000000) (bvslt (index!33339 lt!338573) (size!20563 a!3186)))) (or (is-Undefined!7742 lt!338573) (ite (is-Found!7742 lt!338573) (= (select (arr!20142 a!3186) (index!33337 lt!338573)) k!2102) (ite (is-MissingZero!7742 lt!338573) (= (select (arr!20142 a!3186) (index!33336 lt!338573)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7742 lt!338573) (= (select (arr!20142 a!3186) (index!33339 lt!338573)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!100383 (= lt!338573 e!423565)))

(declare-fun c!83177 () Bool)

(assert (=> d!100383 (= c!83177 (and (is-Intermediate!7742 lt!338571) (undefined!8554 lt!338571)))))

(assert (=> d!100383 (= lt!338571 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2102 mask!3328) k!2102 a!3186 mask!3328))))

(assert (=> d!100383 (validMask!0 mask!3328)))

(assert (=> d!100383 (= (seekEntryOrOpen!0 k!2102 a!3186 mask!3328) lt!338573)))

(declare-fun b!759851 () Bool)

(declare-fun e!423564 () SeekEntryResult!7742)

(assert (=> b!759851 (= e!423564 (MissingZero!7742 (index!33338 lt!338571)))))

(declare-fun b!759852 () Bool)

(assert (=> b!759852 (= e!423566 (Found!7742 (index!33338 lt!338571)))))

(declare-fun b!759853 () Bool)

(assert (=> b!759853 (= e!423564 (seekKeyOrZeroReturnVacant!0 (x!64220 lt!338571) (index!33338 lt!338571) (index!33338 lt!338571) k!2102 a!3186 mask!3328))))

(declare-fun b!759854 () Bool)

(assert (=> b!759854 (= e!423565 Undefined!7742)))

(declare-fun b!759855 () Bool)

(declare-fun c!83178 () Bool)

(assert (=> b!759855 (= c!83178 (= lt!338572 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!759855 (= e!423566 e!423564)))

(assert (= (and d!100383 c!83177) b!759854))

(assert (= (and d!100383 (not c!83177)) b!759850))

(assert (= (and b!759850 c!83179) b!759852))

(assert (= (and b!759850 (not c!83179)) b!759855))

(assert (= (and b!759855 c!83178) b!759851))

(assert (= (and b!759855 (not c!83178)) b!759853))

(declare-fun m!707163 () Bool)

(assert (=> b!759850 m!707163))

(declare-fun m!707165 () Bool)

(assert (=> d!100383 m!707165))

(declare-fun m!707167 () Bool)

(assert (=> d!100383 m!707167))

(declare-fun m!707169 () Bool)

(assert (=> d!100383 m!707169))

(assert (=> d!100383 m!707009))

(assert (=> d!100383 m!707165))

(declare-fun m!707171 () Bool)

(assert (=> d!100383 m!707171))

(declare-fun m!707173 () Bool)

(assert (=> d!100383 m!707173))

(declare-fun m!707175 () Bool)

(assert (=> b!759853 m!707175))

(assert (=> b!759665 d!100383))

(declare-fun d!100391 () Bool)

(declare-fun lt!338595 () SeekEntryResult!7742)

(assert (=> d!100391 (and (or (is-Undefined!7742 lt!338595) (not (is-Found!7742 lt!338595)) (and (bvsge (index!33337 lt!338595) #b00000000000000000000000000000000) (bvslt (index!33337 lt!338595) (size!20563 a!3186)))) (or (is-Undefined!7742 lt!338595) (is-Found!7742 lt!338595) (not (is-MissingVacant!7742 lt!338595)) (not (= (index!33339 lt!338595) resIntermediateIndex!5)) (and (bvsge (index!33339 lt!338595) #b00000000000000000000000000000000) (bvslt (index!33339 lt!338595) (size!20563 a!3186)))) (or (is-Undefined!7742 lt!338595) (ite (is-Found!7742 lt!338595) (= (select (arr!20142 a!3186) (index!33337 lt!338595)) (select (arr!20142 a!3186) j!159)) (and (is-MissingVacant!7742 lt!338595) (= (index!33339 lt!338595) resIntermediateIndex!5) (= (select (arr!20142 a!3186) (index!33339 lt!338595)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!423602 () SeekEntryResult!7742)

(assert (=> d!100391 (= lt!338595 e!423602)))

(declare-fun c!83209 () Bool)

(assert (=> d!100391 (= c!83209 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(declare-fun lt!338596 () (_ BitVec 64))

(assert (=> d!100391 (= lt!338596 (select (arr!20142 a!3186) resIntermediateIndex!5))))

(assert (=> d!100391 (validMask!0 mask!3328)))

(assert (=> d!100391 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20142 a!3186) j!159) a!3186 mask!3328) lt!338595)))

(declare-fun b!759922 () Bool)

(declare-fun e!423603 () SeekEntryResult!7742)

(assert (=> b!759922 (= e!423603 (Found!7742 resIntermediateIndex!5))))

(declare-fun e!423604 () SeekEntryResult!7742)

(declare-fun b!759923 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!759923 (= e!423604 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) resIntermediateIndex!5 (select (arr!20142 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!759924 () Bool)

(assert (=> b!759924 (= e!423604 (MissingVacant!7742 resIntermediateIndex!5))))

(declare-fun b!759925 () Bool)

(declare-fun c!83208 () Bool)

(assert (=> b!759925 (= c!83208 (= lt!338596 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!759925 (= e!423603 e!423604)))

(declare-fun b!759926 () Bool)

(assert (=> b!759926 (= e!423602 e!423603)))

(declare-fun c!83207 () Bool)

(assert (=> b!759926 (= c!83207 (= lt!338596 (select (arr!20142 a!3186) j!159)))))

(declare-fun b!759927 () Bool)

(assert (=> b!759927 (= e!423602 Undefined!7742)))

(assert (= (and d!100391 c!83209) b!759927))

(assert (= (and d!100391 (not c!83209)) b!759926))

(assert (= (and b!759926 c!83207) b!759922))

(assert (= (and b!759926 (not c!83207)) b!759925))

(assert (= (and b!759925 c!83208) b!759924))

(assert (= (and b!759925 (not c!83208)) b!759923))

(declare-fun m!707201 () Bool)

(assert (=> d!100391 m!707201))

(declare-fun m!707203 () Bool)

(assert (=> d!100391 m!707203))

(assert (=> d!100391 m!707035))

(assert (=> d!100391 m!707009))

(declare-fun m!707207 () Bool)

(assert (=> b!759923 m!707207))

(assert (=> b!759923 m!707207))

(assert (=> b!759923 m!706997))

(declare-fun m!707209 () Bool)

(assert (=> b!759923 m!707209))

(assert (=> b!759666 d!100391))

(declare-fun b!759954 () Bool)

(declare-fun e!423627 () Bool)

(declare-fun e!423626 () Bool)

(assert (=> b!759954 (= e!423627 e!423626)))

(declare-fun lt!338618 () (_ BitVec 64))

(assert (=> b!759954 (= lt!338618 (select (arr!20142 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!338620 () Unit!26324)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42057 (_ BitVec 64) (_ BitVec 32)) Unit!26324)

(assert (=> b!759954 (= lt!338620 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!338618 #b00000000000000000000000000000000))))

(assert (=> b!759954 (arrayContainsKey!0 a!3186 lt!338618 #b00000000000000000000000000000000)))

(declare-fun lt!338619 () Unit!26324)

(assert (=> b!759954 (= lt!338619 lt!338620)))

(declare-fun res!514288 () Bool)

(assert (=> b!759954 (= res!514288 (= (seekEntryOrOpen!0 (select (arr!20142 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7742 #b00000000000000000000000000000000)))))

(assert (=> b!759954 (=> (not res!514288) (not e!423626))))

(declare-fun b!759955 () Bool)

(declare-fun call!34920 () Bool)

(assert (=> b!759955 (= e!423626 call!34920)))

(declare-fun b!759956 () Bool)

(assert (=> b!759956 (= e!423627 call!34920)))

(declare-fun b!759957 () Bool)

(declare-fun e!423628 () Bool)

(assert (=> b!759957 (= e!423628 e!423627)))

(declare-fun c!83215 () Bool)

(assert (=> b!759957 (= c!83215 (validKeyInArray!0 (select (arr!20142 a!3186) #b00000000000000000000000000000000)))))

(declare-fun d!100401 () Bool)

(declare-fun res!514287 () Bool)

(assert (=> d!100401 (=> res!514287 e!423628)))

(assert (=> d!100401 (= res!514287 (bvsge #b00000000000000000000000000000000 (size!20563 a!3186)))))

(assert (=> d!100401 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!423628)))

(declare-fun bm!34917 () Bool)

(assert (=> bm!34917 (= call!34920 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(assert (= (and d!100401 (not res!514287)) b!759957))

(assert (= (and b!759957 c!83215) b!759954))

(assert (= (and b!759957 (not c!83215)) b!759956))

(assert (= (and b!759954 res!514288) b!759955))

(assert (= (or b!759955 b!759956) bm!34917))

(declare-fun m!707219 () Bool)

(assert (=> b!759954 m!707219))

(declare-fun m!707221 () Bool)

(assert (=> b!759954 m!707221))

(declare-fun m!707223 () Bool)

(assert (=> b!759954 m!707223))

(assert (=> b!759954 m!707219))

(declare-fun m!707225 () Bool)

(assert (=> b!759954 m!707225))

(assert (=> b!759957 m!707219))

(assert (=> b!759957 m!707219))

(declare-fun m!707227 () Bool)

(assert (=> b!759957 m!707227))

(declare-fun m!707229 () Bool)

(assert (=> bm!34917 m!707229))

(assert (=> b!759661 d!100401))

(declare-fun b!760004 () Bool)

(declare-fun e!423660 () Bool)

(declare-fun lt!338635 () SeekEntryResult!7742)

(assert (=> b!760004 (= e!423660 (bvsge (x!64220 lt!338635) #b01111111111111111111111111111110))))

(declare-fun b!760005 () Bool)

(assert (=> b!760005 (and (bvsge (index!33338 lt!338635) #b00000000000000000000000000000000) (bvslt (index!33338 lt!338635) (size!20563 a!3186)))))

(declare-fun e!423658 () Bool)

(assert (=> b!760005 (= e!423658 (= (select (arr!20142 a!3186) (index!33338 lt!338635)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!100409 () Bool)

(assert (=> d!100409 e!423660))

(declare-fun c!83232 () Bool)

(assert (=> d!100409 (= c!83232 (and (is-Intermediate!7742 lt!338635) (undefined!8554 lt!338635)))))

(declare-fun e!423661 () SeekEntryResult!7742)

(assert (=> d!100409 (= lt!338635 e!423661)))

(declare-fun c!83231 () Bool)

(assert (=> d!100409 (= c!83231 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!338634 () (_ BitVec 64))

(assert (=> d!100409 (= lt!338634 (select (arr!20142 a!3186) index!1321))))

(assert (=> d!100409 (validMask!0 mask!3328)))

(assert (=> d!100409 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20142 a!3186) j!159) a!3186 mask!3328) lt!338635)))

(declare-fun b!760006 () Bool)

(assert (=> b!760006 (and (bvsge (index!33338 lt!338635) #b00000000000000000000000000000000) (bvslt (index!33338 lt!338635) (size!20563 a!3186)))))

(declare-fun res!514307 () Bool)

(assert (=> b!760006 (= res!514307 (= (select (arr!20142 a!3186) (index!33338 lt!338635)) (select (arr!20142 a!3186) j!159)))))

(assert (=> b!760006 (=> res!514307 e!423658)))

(declare-fun e!423657 () Bool)

(assert (=> b!760006 (= e!423657 e!423658)))

(declare-fun b!760007 () Bool)

(assert (=> b!760007 (and (bvsge (index!33338 lt!338635) #b00000000000000000000000000000000) (bvslt (index!33338 lt!338635) (size!20563 a!3186)))))

(declare-fun res!514309 () Bool)

(assert (=> b!760007 (= res!514309 (= (select (arr!20142 a!3186) (index!33338 lt!338635)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!760007 (=> res!514309 e!423658)))

(declare-fun b!760008 () Bool)

(assert (=> b!760008 (= e!423660 e!423657)))

(declare-fun res!514308 () Bool)

(assert (=> b!760008 (= res!514308 (and (is-Intermediate!7742 lt!338635) (not (undefined!8554 lt!338635)) (bvslt (x!64220 lt!338635) #b01111111111111111111111111111110) (bvsge (x!64220 lt!338635) #b00000000000000000000000000000000) (bvsge (x!64220 lt!338635) x!1131)))))

(assert (=> b!760008 (=> (not res!514308) (not e!423657))))

(declare-fun b!760009 () Bool)

(declare-fun e!423659 () SeekEntryResult!7742)

(assert (=> b!760009 (= e!423659 (Intermediate!7742 false index!1321 x!1131))))

(declare-fun b!760010 () Bool)

(assert (=> b!760010 (= e!423661 (Intermediate!7742 true index!1321 x!1131))))

(declare-fun b!760011 () Bool)

(assert (=> b!760011 (= e!423661 e!423659)))

(declare-fun c!83230 () Bool)

(assert (=> b!760011 (= c!83230 (or (= lt!338634 (select (arr!20142 a!3186) j!159)) (= (bvadd lt!338634 lt!338634) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!760012 () Bool)

(assert (=> b!760012 (= e!423659 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!20142 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and d!100409 c!83231) b!760010))

(assert (= (and d!100409 (not c!83231)) b!760011))

(assert (= (and b!760011 c!83230) b!760009))

(assert (= (and b!760011 (not c!83230)) b!760012))

(assert (= (and d!100409 c!83232) b!760004))

(assert (= (and d!100409 (not c!83232)) b!760008))

(assert (= (and b!760008 res!514308) b!760006))

(assert (= (and b!760006 (not res!514307)) b!760007))

(assert (= (and b!760007 (not res!514309)) b!760005))

(declare-fun m!707249 () Bool)

(assert (=> b!760006 m!707249))

(declare-fun m!707251 () Bool)

(assert (=> b!760012 m!707251))

(assert (=> b!760012 m!707251))

(assert (=> b!760012 m!706997))

(declare-fun m!707253 () Bool)

(assert (=> b!760012 m!707253))

(assert (=> b!760005 m!707249))

(assert (=> b!760007 m!707249))

(declare-fun m!707255 () Bool)

(assert (=> d!100409 m!707255))

(assert (=> d!100409 m!707009))

(assert (=> b!759672 d!100409))

(declare-fun b!760018 () Bool)

(declare-fun e!423667 () SeekEntryResult!7742)

(declare-fun e!423668 () SeekEntryResult!7742)

(assert (=> b!760018 (= e!423667 e!423668)))

(declare-fun lt!338637 () (_ BitVec 64))

(declare-fun lt!338636 () SeekEntryResult!7742)

(assert (=> b!760018 (= lt!338637 (select (arr!20142 a!3186) (index!33338 lt!338636)))))

(declare-fun c!83236 () Bool)

(assert (=> b!760018 (= c!83236 (= lt!338637 (select (arr!20142 a!3186) j!159)))))

(declare-fun d!100427 () Bool)

(declare-fun lt!338638 () SeekEntryResult!7742)

(assert (=> d!100427 (and (or (is-Undefined!7742 lt!338638) (not (is-Found!7742 lt!338638)) (and (bvsge (index!33337 lt!338638) #b00000000000000000000000000000000) (bvslt (index!33337 lt!338638) (size!20563 a!3186)))) (or (is-Undefined!7742 lt!338638) (is-Found!7742 lt!338638) (not (is-MissingZero!7742 lt!338638)) (and (bvsge (index!33336 lt!338638) #b00000000000000000000000000000000) (bvslt (index!33336 lt!338638) (size!20563 a!3186)))) (or (is-Undefined!7742 lt!338638) (is-Found!7742 lt!338638) (is-MissingZero!7742 lt!338638) (not (is-MissingVacant!7742 lt!338638)) (and (bvsge (index!33339 lt!338638) #b00000000000000000000000000000000) (bvslt (index!33339 lt!338638) (size!20563 a!3186)))) (or (is-Undefined!7742 lt!338638) (ite (is-Found!7742 lt!338638) (= (select (arr!20142 a!3186) (index!33337 lt!338638)) (select (arr!20142 a!3186) j!159)) (ite (is-MissingZero!7742 lt!338638) (= (select (arr!20142 a!3186) (index!33336 lt!338638)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7742 lt!338638) (= (select (arr!20142 a!3186) (index!33339 lt!338638)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!100427 (= lt!338638 e!423667)))

(declare-fun c!83234 () Bool)

(assert (=> d!100427 (= c!83234 (and (is-Intermediate!7742 lt!338636) (undefined!8554 lt!338636)))))

(assert (=> d!100427 (= lt!338636 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20142 a!3186) j!159) mask!3328) (select (arr!20142 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!100427 (validMask!0 mask!3328)))

(assert (=> d!100427 (= (seekEntryOrOpen!0 (select (arr!20142 a!3186) j!159) a!3186 mask!3328) lt!338638)))

(declare-fun b!760019 () Bool)

(declare-fun e!423666 () SeekEntryResult!7742)

(assert (=> b!760019 (= e!423666 (MissingZero!7742 (index!33338 lt!338636)))))

(declare-fun b!760020 () Bool)

(assert (=> b!760020 (= e!423668 (Found!7742 (index!33338 lt!338636)))))

(declare-fun b!760021 () Bool)

(assert (=> b!760021 (= e!423666 (seekKeyOrZeroReturnVacant!0 (x!64220 lt!338636) (index!33338 lt!338636) (index!33338 lt!338636) (select (arr!20142 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!760022 () Bool)

(assert (=> b!760022 (= e!423667 Undefined!7742)))

(declare-fun b!760023 () Bool)

(declare-fun c!83235 () Bool)

(assert (=> b!760023 (= c!83235 (= lt!338637 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!760023 (= e!423668 e!423666)))

(assert (= (and d!100427 c!83234) b!760022))

(assert (= (and d!100427 (not c!83234)) b!760018))

(assert (= (and b!760018 c!83236) b!760020))

(assert (= (and b!760018 (not c!83236)) b!760023))

(assert (= (and b!760023 c!83235) b!760019))

(assert (= (and b!760023 (not c!83235)) b!760021))

(declare-fun m!707263 () Bool)

(assert (=> b!760018 m!707263))

(assert (=> d!100427 m!706997))

(assert (=> d!100427 m!707029))

(declare-fun m!707265 () Bool)

(assert (=> d!100427 m!707265))

(declare-fun m!707267 () Bool)

(assert (=> d!100427 m!707267))

(assert (=> d!100427 m!707009))

(assert (=> d!100427 m!707029))

(assert (=> d!100427 m!706997))

(assert (=> d!100427 m!707031))

(declare-fun m!707269 () Bool)

(assert (=> d!100427 m!707269))

(assert (=> b!760021 m!706997))

(declare-fun m!707271 () Bool)

(assert (=> b!760021 m!707271))

(assert (=> b!759662 d!100427))

(declare-fun d!100431 () Bool)

(assert (=> d!100431 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!65884 d!100431))

(declare-fun d!100445 () Bool)

(assert (=> d!100445 (= (array_inv!15938 a!3186) (bvsge (size!20563 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!65884 d!100445))

(declare-fun b!760071 () Bool)

(declare-fun e!423698 () Bool)

(declare-fun lt!338659 () SeekEntryResult!7742)

(assert (=> b!760071 (= e!423698 (bvsge (x!64220 lt!338659) #b01111111111111111111111111111110))))

(declare-fun b!760072 () Bool)

(assert (=> b!760072 (and (bvsge (index!33338 lt!338659) #b00000000000000000000000000000000) (bvslt (index!33338 lt!338659) (size!20563 a!3186)))))

(declare-fun e!423696 () Bool)

(assert (=> b!760072 (= e!423696 (= (select (arr!20142 a!3186) (index!33338 lt!338659)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!100447 () Bool)

(assert (=> d!100447 e!423698))

(declare-fun c!83259 () Bool)

(assert (=> d!100447 (= c!83259 (and (is-Intermediate!7742 lt!338659) (undefined!8554 lt!338659)))))

(declare-fun e!423699 () SeekEntryResult!7742)

(assert (=> d!100447 (= lt!338659 e!423699)))

(declare-fun c!83258 () Bool)

(assert (=> d!100447 (= c!83258 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!338658 () (_ BitVec 64))

(assert (=> d!100447 (= lt!338658 (select (arr!20142 a!3186) (toIndex!0 (select (arr!20142 a!3186) j!159) mask!3328)))))

(assert (=> d!100447 (validMask!0 mask!3328)))

(assert (=> d!100447 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20142 a!3186) j!159) mask!3328) (select (arr!20142 a!3186) j!159) a!3186 mask!3328) lt!338659)))

(declare-fun b!760073 () Bool)

(assert (=> b!760073 (and (bvsge (index!33338 lt!338659) #b00000000000000000000000000000000) (bvslt (index!33338 lt!338659) (size!20563 a!3186)))))

(declare-fun res!514320 () Bool)

(assert (=> b!760073 (= res!514320 (= (select (arr!20142 a!3186) (index!33338 lt!338659)) (select (arr!20142 a!3186) j!159)))))

(assert (=> b!760073 (=> res!514320 e!423696)))

(declare-fun e!423695 () Bool)

(assert (=> b!760073 (= e!423695 e!423696)))

(declare-fun b!760074 () Bool)

(assert (=> b!760074 (and (bvsge (index!33338 lt!338659) #b00000000000000000000000000000000) (bvslt (index!33338 lt!338659) (size!20563 a!3186)))))

(declare-fun res!514322 () Bool)

(assert (=> b!760074 (= res!514322 (= (select (arr!20142 a!3186) (index!33338 lt!338659)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!760074 (=> res!514322 e!423696)))

(declare-fun b!760075 () Bool)

(assert (=> b!760075 (= e!423698 e!423695)))

(declare-fun res!514321 () Bool)

(assert (=> b!760075 (= res!514321 (and (is-Intermediate!7742 lt!338659) (not (undefined!8554 lt!338659)) (bvslt (x!64220 lt!338659) #b01111111111111111111111111111110) (bvsge (x!64220 lt!338659) #b00000000000000000000000000000000) (bvsge (x!64220 lt!338659) #b00000000000000000000000000000000)))))

(assert (=> b!760075 (=> (not res!514321) (not e!423695))))

(declare-fun b!760076 () Bool)

(declare-fun e!423697 () SeekEntryResult!7742)

(assert (=> b!760076 (= e!423697 (Intermediate!7742 false (toIndex!0 (select (arr!20142 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!760077 () Bool)

(assert (=> b!760077 (= e!423699 (Intermediate!7742 true (toIndex!0 (select (arr!20142 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!760078 () Bool)

(assert (=> b!760078 (= e!423699 e!423697)))

(declare-fun c!83257 () Bool)

(assert (=> b!760078 (= c!83257 (or (= lt!338658 (select (arr!20142 a!3186) j!159)) (= (bvadd lt!338658 lt!338658) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!760079 () Bool)

(assert (=> b!760079 (= e!423697 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20142 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!20142 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and d!100447 c!83258) b!760077))

(assert (= (and d!100447 (not c!83258)) b!760078))

(assert (= (and b!760078 c!83257) b!760076))

(assert (= (and b!760078 (not c!83257)) b!760079))

(assert (= (and d!100447 c!83259) b!760071))

(assert (= (and d!100447 (not c!83259)) b!760075))

(assert (= (and b!760075 res!514321) b!760073))

(assert (= (and b!760073 (not res!514320)) b!760074))

(assert (= (and b!760074 (not res!514322)) b!760072))

(declare-fun m!707321 () Bool)

(assert (=> b!760073 m!707321))

(assert (=> b!760079 m!707029))

(declare-fun m!707323 () Bool)

(assert (=> b!760079 m!707323))

(assert (=> b!760079 m!707323))

(assert (=> b!760079 m!706997))

(declare-fun m!707325 () Bool)

(assert (=> b!760079 m!707325))

(assert (=> b!760072 m!707321))

(assert (=> b!760074 m!707321))

(assert (=> d!100447 m!707029))

(declare-fun m!707327 () Bool)

(assert (=> d!100447 m!707327))

(assert (=> d!100447 m!707009))

(assert (=> b!759663 d!100447))

(declare-fun d!100449 () Bool)

(declare-fun lt!338667 () (_ BitVec 32))

(declare-fun lt!338666 () (_ BitVec 32))

(assert (=> d!100449 (= lt!338667 (bvmul (bvxor lt!338666 (bvlshr lt!338666 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!100449 (= lt!338666 ((_ extract 31 0) (bvand (bvxor (select (arr!20142 a!3186) j!159) (bvlshr (select (arr!20142 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!100449 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!514323 (let ((h!15217 ((_ extract 31 0) (bvand (bvxor (select (arr!20142 a!3186) j!159) (bvlshr (select (arr!20142 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64231 (bvmul (bvxor h!15217 (bvlshr h!15217 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64231 (bvlshr x!64231 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!514323 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!514323 #b00000000000000000000000000000000))))))

(assert (=> d!100449 (= (toIndex!0 (select (arr!20142 a!3186) j!159) mask!3328) (bvand (bvxor lt!338667 (bvlshr lt!338667 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!759663 d!100449))

(declare-fun d!100451 () Bool)

(declare-fun res!514328 () Bool)

(declare-fun e!423704 () Bool)

(assert (=> d!100451 (=> res!514328 e!423704)))

(assert (=> d!100451 (= res!514328 (= (select (arr!20142 a!3186) #b00000000000000000000000000000000) k!2102))))

(assert (=> d!100451 (= (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000) e!423704)))

(declare-fun b!760084 () Bool)

(declare-fun e!423705 () Bool)

(assert (=> b!760084 (= e!423704 e!423705)))

(declare-fun res!514329 () Bool)

(assert (=> b!760084 (=> (not res!514329) (not e!423705))))

(assert (=> b!760084 (= res!514329 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20563 a!3186)))))

(declare-fun b!760085 () Bool)

(assert (=> b!760085 (= e!423705 (arrayContainsKey!0 a!3186 k!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!100451 (not res!514328)) b!760084))

(assert (= (and b!760084 res!514329) b!760085))

(assert (=> d!100451 m!707219))

(declare-fun m!707331 () Bool)

(assert (=> b!760085 m!707331))

(assert (=> b!759659 d!100451))

(declare-fun b!760086 () Bool)

(declare-fun e!423709 () Bool)

(declare-fun lt!338670 () SeekEntryResult!7742)

(assert (=> b!760086 (= e!423709 (bvsge (x!64220 lt!338670) #b01111111111111111111111111111110))))

(declare-fun b!760087 () Bool)

(assert (=> b!760087 (and (bvsge (index!33338 lt!338670) #b00000000000000000000000000000000) (bvslt (index!33338 lt!338670) (size!20563 lt!338489)))))

(declare-fun e!423707 () Bool)

(assert (=> b!760087 (= e!423707 (= (select (arr!20142 lt!338489) (index!33338 lt!338670)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!100455 () Bool)

(assert (=> d!100455 e!423709))

(declare-fun c!83262 () Bool)

(assert (=> d!100455 (= c!83262 (and (is-Intermediate!7742 lt!338670) (undefined!8554 lt!338670)))))

(declare-fun e!423710 () SeekEntryResult!7742)

(assert (=> d!100455 (= lt!338670 e!423710)))

(declare-fun c!83261 () Bool)

(assert (=> d!100455 (= c!83261 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!338669 () (_ BitVec 64))

(assert (=> d!100455 (= lt!338669 (select (arr!20142 lt!338489) index!1321))))

(assert (=> d!100455 (validMask!0 mask!3328)))

(assert (=> d!100455 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!338485 lt!338489 mask!3328) lt!338670)))

(declare-fun b!760088 () Bool)

(assert (=> b!760088 (and (bvsge (index!33338 lt!338670) #b00000000000000000000000000000000) (bvslt (index!33338 lt!338670) (size!20563 lt!338489)))))

(declare-fun res!514330 () Bool)

(assert (=> b!760088 (= res!514330 (= (select (arr!20142 lt!338489) (index!33338 lt!338670)) lt!338485))))

(assert (=> b!760088 (=> res!514330 e!423707)))

(declare-fun e!423706 () Bool)

(assert (=> b!760088 (= e!423706 e!423707)))

(declare-fun b!760089 () Bool)

(assert (=> b!760089 (and (bvsge (index!33338 lt!338670) #b00000000000000000000000000000000) (bvslt (index!33338 lt!338670) (size!20563 lt!338489)))))

(declare-fun res!514332 () Bool)

(assert (=> b!760089 (= res!514332 (= (select (arr!20142 lt!338489) (index!33338 lt!338670)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!760089 (=> res!514332 e!423707)))

(declare-fun b!760090 () Bool)

(assert (=> b!760090 (= e!423709 e!423706)))

(declare-fun res!514331 () Bool)

(assert (=> b!760090 (= res!514331 (and (is-Intermediate!7742 lt!338670) (not (undefined!8554 lt!338670)) (bvslt (x!64220 lt!338670) #b01111111111111111111111111111110) (bvsge (x!64220 lt!338670) #b00000000000000000000000000000000) (bvsge (x!64220 lt!338670) x!1131)))))

(assert (=> b!760090 (=> (not res!514331) (not e!423706))))

(declare-fun b!760091 () Bool)

(declare-fun e!423708 () SeekEntryResult!7742)

(assert (=> b!760091 (= e!423708 (Intermediate!7742 false index!1321 x!1131))))

(declare-fun b!760092 () Bool)

(assert (=> b!760092 (= e!423710 (Intermediate!7742 true index!1321 x!1131))))

(declare-fun b!760093 () Bool)

(assert (=> b!760093 (= e!423710 e!423708)))

(declare-fun c!83260 () Bool)

(assert (=> b!760093 (= c!83260 (or (= lt!338669 lt!338485) (= (bvadd lt!338669 lt!338669) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!760094 () Bool)

(assert (=> b!760094 (= e!423708 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!338485 lt!338489 mask!3328))))

(assert (= (and d!100455 c!83261) b!760092))

(assert (= (and d!100455 (not c!83261)) b!760093))

(assert (= (and b!760093 c!83260) b!760091))

(assert (= (and b!760093 (not c!83260)) b!760094))

(assert (= (and d!100455 c!83262) b!760086))

(assert (= (and d!100455 (not c!83262)) b!760090))

(assert (= (and b!760090 res!514331) b!760088))

(assert (= (and b!760088 (not res!514330)) b!760089))

(assert (= (and b!760089 (not res!514332)) b!760087))

(declare-fun m!707333 () Bool)

(assert (=> b!760088 m!707333))

(assert (=> b!760094 m!707251))

(assert (=> b!760094 m!707251))

(declare-fun m!707335 () Bool)

(assert (=> b!760094 m!707335))

(assert (=> b!760087 m!707333))

(assert (=> b!760089 m!707333))

(declare-fun m!707337 () Bool)

(assert (=> d!100455 m!707337))

(assert (=> d!100455 m!707009))

(assert (=> b!759670 d!100455))

(declare-fun b!760095 () Bool)

(declare-fun e!423714 () Bool)

(declare-fun lt!338672 () SeekEntryResult!7742)

(assert (=> b!760095 (= e!423714 (bvsge (x!64220 lt!338672) #b01111111111111111111111111111110))))

(declare-fun b!760096 () Bool)

(assert (=> b!760096 (and (bvsge (index!33338 lt!338672) #b00000000000000000000000000000000) (bvslt (index!33338 lt!338672) (size!20563 lt!338489)))))

(declare-fun e!423712 () Bool)

(assert (=> b!760096 (= e!423712 (= (select (arr!20142 lt!338489) (index!33338 lt!338672)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!100457 () Bool)

(assert (=> d!100457 e!423714))

(declare-fun c!83265 () Bool)

(assert (=> d!100457 (= c!83265 (and (is-Intermediate!7742 lt!338672) (undefined!8554 lt!338672)))))

(declare-fun e!423715 () SeekEntryResult!7742)

(assert (=> d!100457 (= lt!338672 e!423715)))

(declare-fun c!83264 () Bool)

(assert (=> d!100457 (= c!83264 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!338671 () (_ BitVec 64))

(assert (=> d!100457 (= lt!338671 (select (arr!20142 lt!338489) (toIndex!0 lt!338485 mask!3328)))))

(assert (=> d!100457 (validMask!0 mask!3328)))

(assert (=> d!100457 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!338485 mask!3328) lt!338485 lt!338489 mask!3328) lt!338672)))

(declare-fun b!760097 () Bool)

(assert (=> b!760097 (and (bvsge (index!33338 lt!338672) #b00000000000000000000000000000000) (bvslt (index!33338 lt!338672) (size!20563 lt!338489)))))

(declare-fun res!514333 () Bool)

(assert (=> b!760097 (= res!514333 (= (select (arr!20142 lt!338489) (index!33338 lt!338672)) lt!338485))))

(assert (=> b!760097 (=> res!514333 e!423712)))

(declare-fun e!423711 () Bool)

(assert (=> b!760097 (= e!423711 e!423712)))

(declare-fun b!760098 () Bool)

(assert (=> b!760098 (and (bvsge (index!33338 lt!338672) #b00000000000000000000000000000000) (bvslt (index!33338 lt!338672) (size!20563 lt!338489)))))

(declare-fun res!514335 () Bool)

(assert (=> b!760098 (= res!514335 (= (select (arr!20142 lt!338489) (index!33338 lt!338672)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!760098 (=> res!514335 e!423712)))

(declare-fun b!760099 () Bool)

(assert (=> b!760099 (= e!423714 e!423711)))

(declare-fun res!514334 () Bool)

(assert (=> b!760099 (= res!514334 (and (is-Intermediate!7742 lt!338672) (not (undefined!8554 lt!338672)) (bvslt (x!64220 lt!338672) #b01111111111111111111111111111110) (bvsge (x!64220 lt!338672) #b00000000000000000000000000000000) (bvsge (x!64220 lt!338672) #b00000000000000000000000000000000)))))

(assert (=> b!760099 (=> (not res!514334) (not e!423711))))

(declare-fun b!760100 () Bool)

(declare-fun e!423713 () SeekEntryResult!7742)

(assert (=> b!760100 (= e!423713 (Intermediate!7742 false (toIndex!0 lt!338485 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!760101 () Bool)

(assert (=> b!760101 (= e!423715 (Intermediate!7742 true (toIndex!0 lt!338485 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!760102 () Bool)

(assert (=> b!760102 (= e!423715 e!423713)))

(declare-fun c!83263 () Bool)

(assert (=> b!760102 (= c!83263 (or (= lt!338671 lt!338485) (= (bvadd lt!338671 lt!338671) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!760103 () Bool)

(assert (=> b!760103 (= e!423713 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!338485 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!338485 lt!338489 mask!3328))))

(assert (= (and d!100457 c!83264) b!760101))

(assert (= (and d!100457 (not c!83264)) b!760102))

(assert (= (and b!760102 c!83263) b!760100))

(assert (= (and b!760102 (not c!83263)) b!760103))

(assert (= (and d!100457 c!83265) b!760095))

(assert (= (and d!100457 (not c!83265)) b!760099))

(assert (= (and b!760099 res!514334) b!760097))

(assert (= (and b!760097 (not res!514333)) b!760098))

(assert (= (and b!760098 (not res!514335)) b!760096))

(declare-fun m!707339 () Bool)

(assert (=> b!760097 m!707339))

(assert (=> b!760103 m!707015))

(declare-fun m!707341 () Bool)

(assert (=> b!760103 m!707341))

(assert (=> b!760103 m!707341))

(declare-fun m!707343 () Bool)

(assert (=> b!760103 m!707343))

(assert (=> b!760096 m!707339))

(assert (=> b!760098 m!707339))

(assert (=> d!100457 m!707015))

(declare-fun m!707345 () Bool)

(assert (=> d!100457 m!707345))

(assert (=> d!100457 m!707009))

(assert (=> b!759670 d!100457))

(declare-fun d!100459 () Bool)

(declare-fun lt!338674 () (_ BitVec 32))

(declare-fun lt!338673 () (_ BitVec 32))

(assert (=> d!100459 (= lt!338674 (bvmul (bvxor lt!338673 (bvlshr lt!338673 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!100459 (= lt!338673 ((_ extract 31 0) (bvand (bvxor lt!338485 (bvlshr lt!338485 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!100459 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!514323 (let ((h!15217 ((_ extract 31 0) (bvand (bvxor lt!338485 (bvlshr lt!338485 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64231 (bvmul (bvxor h!15217 (bvlshr h!15217 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64231 (bvlshr x!64231 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!514323 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!514323 #b00000000000000000000000000000000))))))

(assert (=> d!100459 (= (toIndex!0 lt!338485 mask!3328) (bvand (bvxor lt!338674 (bvlshr lt!338674 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!759670 d!100459))

(declare-fun d!100461 () Bool)

(assert (=> d!100461 (= (validKeyInArray!0 k!2102) (and (not (= k!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!759660 d!100461))

(declare-fun b!760114 () Bool)

(declare-fun e!423725 () Bool)

(declare-fun contains!4064 (List!14144 (_ BitVec 64)) Bool)

(assert (=> b!760114 (= e!423725 (contains!4064 Nil!14141 (select (arr!20142 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!760115 () Bool)

(declare-fun e!423726 () Bool)

(declare-fun call!34928 () Bool)

(assert (=> b!760115 (= e!423726 call!34928)))

(declare-fun b!760116 () Bool)

(declare-fun e!423727 () Bool)

(declare-fun e!423724 () Bool)

(assert (=> b!760116 (= e!423727 e!423724)))

(declare-fun res!514343 () Bool)

(assert (=> b!760116 (=> (not res!514343) (not e!423724))))

(assert (=> b!760116 (= res!514343 (not e!423725))))

(declare-fun res!514342 () Bool)

(assert (=> b!760116 (=> (not res!514342) (not e!423725))))

(assert (=> b!760116 (= res!514342 (validKeyInArray!0 (select (arr!20142 a!3186) #b00000000000000000000000000000000)))))

(declare-fun bm!34925 () Bool)

(declare-fun c!83268 () Bool)

(assert (=> bm!34925 (= call!34928 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!83268 (Cons!14140 (select (arr!20142 a!3186) #b00000000000000000000000000000000) Nil!14141) Nil!14141)))))

(declare-fun d!100463 () Bool)

(declare-fun res!514344 () Bool)

(assert (=> d!100463 (=> res!514344 e!423727)))

(assert (=> d!100463 (= res!514344 (bvsge #b00000000000000000000000000000000 (size!20563 a!3186)))))

(assert (=> d!100463 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14141) e!423727)))

(declare-fun b!760117 () Bool)

(assert (=> b!760117 (= e!423724 e!423726)))

(assert (=> b!760117 (= c!83268 (validKeyInArray!0 (select (arr!20142 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!760118 () Bool)

(assert (=> b!760118 (= e!423726 call!34928)))

(assert (= (and d!100463 (not res!514344)) b!760116))

(assert (= (and b!760116 res!514342) b!760114))

(assert (= (and b!760116 res!514343) b!760117))

(assert (= (and b!760117 c!83268) b!760118))

(assert (= (and b!760117 (not c!83268)) b!760115))

(assert (= (or b!760118 b!760115) bm!34925))

(assert (=> b!760114 m!707219))

(assert (=> b!760114 m!707219))

(declare-fun m!707347 () Bool)

(assert (=> b!760114 m!707347))

(assert (=> b!760116 m!707219))

(assert (=> b!760116 m!707219))

(assert (=> b!760116 m!707227))

(assert (=> bm!34925 m!707219))

(declare-fun m!707349 () Bool)

(assert (=> bm!34925 m!707349))

(assert (=> b!760117 m!707219))

(assert (=> b!760117 m!707219))

(assert (=> b!760117 m!707227))

(assert (=> b!759671 d!100463))

(declare-fun b!760119 () Bool)

(declare-fun e!423729 () Bool)

(declare-fun e!423728 () Bool)

(assert (=> b!760119 (= e!423729 e!423728)))

(declare-fun lt!338675 () (_ BitVec 64))

(assert (=> b!760119 (= lt!338675 (select (arr!20142 a!3186) j!159))))

(declare-fun lt!338677 () Unit!26324)

(assert (=> b!760119 (= lt!338677 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!338675 j!159))))

(assert (=> b!760119 (arrayContainsKey!0 a!3186 lt!338675 #b00000000000000000000000000000000)))

(declare-fun lt!338676 () Unit!26324)

(assert (=> b!760119 (= lt!338676 lt!338677)))

(declare-fun res!514346 () Bool)

(assert (=> b!760119 (= res!514346 (= (seekEntryOrOpen!0 (select (arr!20142 a!3186) j!159) a!3186 mask!3328) (Found!7742 j!159)))))

(assert (=> b!760119 (=> (not res!514346) (not e!423728))))

(declare-fun b!760120 () Bool)

(declare-fun call!34929 () Bool)

(assert (=> b!760120 (= e!423728 call!34929)))

(declare-fun b!760121 () Bool)

(assert (=> b!760121 (= e!423729 call!34929)))

(declare-fun b!760122 () Bool)

(declare-fun e!423730 () Bool)

(assert (=> b!760122 (= e!423730 e!423729)))

(declare-fun c!83269 () Bool)

(assert (=> b!760122 (= c!83269 (validKeyInArray!0 (select (arr!20142 a!3186) j!159)))))

(declare-fun d!100465 () Bool)

(declare-fun res!514345 () Bool)

(assert (=> d!100465 (=> res!514345 e!423730)))

(assert (=> d!100465 (= res!514345 (bvsge j!159 (size!20563 a!3186)))))

(assert (=> d!100465 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!423730)))

(declare-fun bm!34926 () Bool)

(assert (=> bm!34926 (= call!34929 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(assert (= (and d!100465 (not res!514345)) b!760122))

(assert (= (and b!760122 c!83269) b!760119))

(assert (= (and b!760122 (not c!83269)) b!760121))

(assert (= (and b!760119 res!514346) b!760120))

(assert (= (or b!760120 b!760121) bm!34926))

(assert (=> b!760119 m!706997))

(declare-fun m!707351 () Bool)

(assert (=> b!760119 m!707351))

(declare-fun m!707353 () Bool)

(assert (=> b!760119 m!707353))

(assert (=> b!760119 m!706997))

(assert (=> b!760119 m!707001))

(assert (=> b!760122 m!706997))

(assert (=> b!760122 m!706997))

(assert (=> b!760122 m!707005))

(declare-fun m!707355 () Bool)

(assert (=> bm!34926 m!707355))

(assert (=> b!759667 d!100465))

(declare-fun d!100467 () Bool)

(assert (=> d!100467 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!338680 () Unit!26324)

(declare-fun choose!38 (array!42057 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26324)

(assert (=> d!100467 (= lt!338680 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!100467 (validMask!0 mask!3328)))

(assert (=> d!100467 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!338680)))

(declare-fun bs!21381 () Bool)

(assert (= bs!21381 d!100467))

(assert (=> bs!21381 m!707025))

(declare-fun m!707357 () Bool)

(assert (=> bs!21381 m!707357))

(assert (=> bs!21381 m!707009))

(assert (=> b!759667 d!100467))

(declare-fun lt!338681 () SeekEntryResult!7742)

(declare-fun d!100469 () Bool)

(assert (=> d!100469 (and (or (is-Undefined!7742 lt!338681) (not (is-Found!7742 lt!338681)) (and (bvsge (index!33337 lt!338681) #b00000000000000000000000000000000) (bvslt (index!33337 lt!338681) (size!20563 a!3186)))) (or (is-Undefined!7742 lt!338681) (is-Found!7742 lt!338681) (not (is-MissingVacant!7742 lt!338681)) (not (= (index!33339 lt!338681) resIntermediateIndex!5)) (and (bvsge (index!33339 lt!338681) #b00000000000000000000000000000000) (bvslt (index!33339 lt!338681) (size!20563 a!3186)))) (or (is-Undefined!7742 lt!338681) (ite (is-Found!7742 lt!338681) (= (select (arr!20142 a!3186) (index!33337 lt!338681)) (select (arr!20142 a!3186) j!159)) (and (is-MissingVacant!7742 lt!338681) (= (index!33339 lt!338681) resIntermediateIndex!5) (= (select (arr!20142 a!3186) (index!33339 lt!338681)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!423731 () SeekEntryResult!7742)

(assert (=> d!100469 (= lt!338681 e!423731)))

(declare-fun c!83272 () Bool)

(assert (=> d!100469 (= c!83272 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!338682 () (_ BitVec 64))

(assert (=> d!100469 (= lt!338682 (select (arr!20142 a!3186) index!1321))))

(assert (=> d!100469 (validMask!0 mask!3328)))

(assert (=> d!100469 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20142 a!3186) j!159) a!3186 mask!3328) lt!338681)))

(declare-fun b!760123 () Bool)

(declare-fun e!423732 () SeekEntryResult!7742)

(assert (=> b!760123 (= e!423732 (Found!7742 index!1321))))

(declare-fun b!760124 () Bool)

(declare-fun e!423733 () SeekEntryResult!7742)

(assert (=> b!760124 (= e!423733 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!20142 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!760125 () Bool)

(assert (=> b!760125 (= e!423733 (MissingVacant!7742 resIntermediateIndex!5))))

(declare-fun b!760126 () Bool)

(declare-fun c!83271 () Bool)

(assert (=> b!760126 (= c!83271 (= lt!338682 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!760126 (= e!423732 e!423733)))

(declare-fun b!760127 () Bool)

(assert (=> b!760127 (= e!423731 e!423732)))

(declare-fun c!83270 () Bool)

(assert (=> b!760127 (= c!83270 (= lt!338682 (select (arr!20142 a!3186) j!159)))))

(declare-fun b!760128 () Bool)

(assert (=> b!760128 (= e!423731 Undefined!7742)))

(assert (= (and d!100469 c!83272) b!760128))

(assert (= (and d!100469 (not c!83272)) b!760127))

(assert (= (and b!760127 c!83270) b!760123))

(assert (= (and b!760127 (not c!83270)) b!760126))

(assert (= (and b!760126 c!83271) b!760125))

(assert (= (and b!760126 (not c!83271)) b!760124))

(declare-fun m!707359 () Bool)

(assert (=> d!100469 m!707359))

(declare-fun m!707361 () Bool)

(assert (=> d!100469 m!707361))

(assert (=> d!100469 m!707255))

(assert (=> d!100469 m!707009))

(assert (=> b!760124 m!707251))

(assert (=> b!760124 m!707251))

(assert (=> b!760124 m!706997))

(declare-fun m!707363 () Bool)

(assert (=> b!760124 m!707363))

(assert (=> b!759658 d!100469))

(push 1)

(assert (not b!759957))

(assert (not b!759923))

(assert (not d!100427))

(assert (not d!100467))

(assert (not b!760079))

(assert (not b!760012))

(assert (not d!100391))

(assert (not b!760122))

(assert (not b!759954))

(assert (not d!100383))

(assert (not b!760021))

(assert (not b!759853))

(assert (not d!100469))

(assert (not bm!34926))

(assert (not b!760085))

(assert (not b!760114))

(assert (not d!100455))

(assert (not b!760124))

(assert (not bm!34917))

(assert (not b!760116))

(assert (not d!100447))

(assert (not d!100409))

(assert (not b!760094))

(assert (not d!100457))

(assert (not bm!34925))

(assert (not b!760103))

(assert (not b!760117))

(assert (not b!760119))

(check-sat)

(pop 1)

(push 1)

(check-sat)

