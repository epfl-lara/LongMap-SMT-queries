; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65138 () Bool)

(assert start!65138)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41311 0))(
  ( (array!41312 (arr!19769 (Array (_ BitVec 32) (_ BitVec 64))) (size!20190 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41311)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!411631 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun b!735748 () Bool)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7369 0))(
  ( (MissingZero!7369 (index!31844 (_ BitVec 32))) (Found!7369 (index!31845 (_ BitVec 32))) (Intermediate!7369 (undefined!8181 Bool) (index!31846 (_ BitVec 32)) (x!62847 (_ BitVec 32))) (Undefined!7369) (MissingVacant!7369 (index!31847 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41311 (_ BitVec 32)) SeekEntryResult!7369)

(assert (=> b!735748 (= e!411631 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19769 a!3186) j!159) a!3186 mask!3328) (Found!7369 j!159)))))

(declare-fun b!735749 () Bool)

(declare-fun lt!326195 () SeekEntryResult!7369)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41311 (_ BitVec 32)) SeekEntryResult!7369)

(assert (=> b!735749 (= e!411631 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19769 a!3186) j!159) a!3186 mask!3328) lt!326195))))

(declare-fun b!735750 () Bool)

(declare-datatypes ((Unit!25072 0))(
  ( (Unit!25073) )
))
(declare-fun e!411638 () Unit!25072)

(declare-fun Unit!25074 () Unit!25072)

(assert (=> b!735750 (= e!411638 Unit!25074)))

(declare-fun lt!326205 () (_ BitVec 32))

(assert (=> b!735750 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326205 (select (arr!19769 a!3186) j!159) a!3186 mask!3328) lt!326195)))

(declare-fun b!735751 () Bool)

(declare-fun Unit!25075 () Unit!25072)

(assert (=> b!735751 (= e!411638 Unit!25075)))

(declare-fun lt!326194 () SeekEntryResult!7369)

(assert (=> b!735751 (= lt!326194 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19769 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!326207 () SeekEntryResult!7369)

(assert (=> b!735751 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326205 resIntermediateIndex!5 (select (arr!19769 a!3186) j!159) a!3186 mask!3328) lt!326207)))

(declare-fun b!735752 () Bool)

(declare-fun e!411637 () Bool)

(declare-fun e!411633 () Bool)

(assert (=> b!735752 (= e!411637 (not e!411633))))

(declare-fun res!494416 () Bool)

(assert (=> b!735752 (=> res!494416 e!411633)))

(declare-fun lt!326203 () SeekEntryResult!7369)

(assert (=> b!735752 (= res!494416 (or (not (is-Intermediate!7369 lt!326203)) (bvsge x!1131 (x!62847 lt!326203))))))

(assert (=> b!735752 (= lt!326207 (Found!7369 j!159))))

(declare-fun e!411635 () Bool)

(assert (=> b!735752 e!411635))

(declare-fun res!494424 () Bool)

(assert (=> b!735752 (=> (not res!494424) (not e!411635))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41311 (_ BitVec 32)) Bool)

(assert (=> b!735752 (= res!494424 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!326200 () Unit!25072)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41311 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25072)

(assert (=> b!735752 (= lt!326200 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun res!494426 () Bool)

(declare-fun e!411630 () Bool)

(assert (=> start!65138 (=> (not res!494426) (not e!411630))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65138 (= res!494426 (validMask!0 mask!3328))))

(assert (=> start!65138 e!411630))

(assert (=> start!65138 true))

(declare-fun array_inv!15565 (array!41311) Bool)

(assert (=> start!65138 (array_inv!15565 a!3186)))

(declare-fun b!735753 () Bool)

(declare-fun e!411629 () Bool)

(assert (=> b!735753 (= e!411635 e!411629)))

(declare-fun res!494413 () Bool)

(assert (=> b!735753 (=> (not res!494413) (not e!411629))))

(declare-fun lt!326197 () SeekEntryResult!7369)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41311 (_ BitVec 32)) SeekEntryResult!7369)

(assert (=> b!735753 (= res!494413 (= (seekEntryOrOpen!0 (select (arr!19769 a!3186) j!159) a!3186 mask!3328) lt!326197))))

(assert (=> b!735753 (= lt!326197 (Found!7369 j!159))))

(declare-fun b!735754 () Bool)

(declare-fun e!411628 () Bool)

(assert (=> b!735754 (= e!411630 e!411628)))

(declare-fun res!494412 () Bool)

(assert (=> b!735754 (=> (not res!494412) (not e!411628))))

(declare-fun lt!326201 () SeekEntryResult!7369)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!735754 (= res!494412 (or (= lt!326201 (MissingZero!7369 i!1173)) (= lt!326201 (MissingVacant!7369 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!735754 (= lt!326201 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!735755 () Bool)

(declare-fun res!494411 () Bool)

(assert (=> b!735755 (=> (not res!494411) (not e!411628))))

(assert (=> b!735755 (= res!494411 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!735756 () Bool)

(declare-fun res!494425 () Bool)

(declare-fun e!411634 () Bool)

(assert (=> b!735756 (=> (not res!494425) (not e!411634))))

(assert (=> b!735756 (= res!494425 e!411631)))

(declare-fun c!81050 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!735756 (= c!81050 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!735757 () Bool)

(declare-fun e!411627 () Bool)

(assert (=> b!735757 (= e!411627 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326205 (select (arr!19769 a!3186) j!159) a!3186 mask!3328) lt!326195)))))

(declare-fun b!735758 () Bool)

(declare-fun res!494415 () Bool)

(assert (=> b!735758 (=> (not res!494415) (not e!411628))))

(assert (=> b!735758 (= res!494415 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20190 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20190 a!3186))))))

(declare-fun b!735759 () Bool)

(assert (=> b!735759 (= e!411629 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19769 a!3186) j!159) a!3186 mask!3328) lt!326197))))

(declare-fun b!735760 () Bool)

(declare-fun res!494409 () Bool)

(assert (=> b!735760 (=> (not res!494409) (not e!411634))))

(assert (=> b!735760 (= res!494409 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19769 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!735761 () Bool)

(declare-fun e!411632 () Bool)

(assert (=> b!735761 (= e!411633 e!411632)))

(declare-fun res!494422 () Bool)

(assert (=> b!735761 (=> res!494422 e!411632)))

(assert (=> b!735761 (= res!494422 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!326205 #b00000000000000000000000000000000) (bvsge lt!326205 (size!20190 a!3186))))))

(declare-fun lt!326204 () Unit!25072)

(assert (=> b!735761 (= lt!326204 e!411638)))

(declare-fun c!81052 () Bool)

(declare-fun lt!326196 () Bool)

(assert (=> b!735761 (= c!81052 lt!326196)))

(assert (=> b!735761 (= lt!326196 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!735761 (= lt!326205 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!735762 () Bool)

(declare-fun res!494419 () Bool)

(assert (=> b!735762 (=> (not res!494419) (not e!411630))))

(assert (=> b!735762 (= res!494419 (and (= (size!20190 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20190 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20190 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!735763 () Bool)

(assert (=> b!735763 (= e!411632 true)))

(declare-fun lt!326199 () SeekEntryResult!7369)

(declare-fun lt!326198 () array!41311)

(declare-fun lt!326206 () (_ BitVec 64))

(assert (=> b!735763 (= lt!326199 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326205 lt!326206 lt!326198 mask!3328))))

(declare-fun b!735764 () Bool)

(assert (=> b!735764 (= e!411628 e!411634)))

(declare-fun res!494414 () Bool)

(assert (=> b!735764 (=> (not res!494414) (not e!411634))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!735764 (= res!494414 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19769 a!3186) j!159) mask!3328) (select (arr!19769 a!3186) j!159) a!3186 mask!3328) lt!326195))))

(assert (=> b!735764 (= lt!326195 (Intermediate!7369 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!735765 () Bool)

(declare-fun res!494410 () Bool)

(assert (=> b!735765 (=> (not res!494410) (not e!411628))))

(declare-datatypes ((List!13771 0))(
  ( (Nil!13768) (Cons!13767 (h!14839 (_ BitVec 64)) (t!20086 List!13771)) )
))
(declare-fun arrayNoDuplicates!0 (array!41311 (_ BitVec 32) List!13771) Bool)

(assert (=> b!735765 (= res!494410 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13768))))

(declare-fun b!735766 () Bool)

(assert (=> b!735766 (= e!411634 e!411637)))

(declare-fun res!494423 () Bool)

(assert (=> b!735766 (=> (not res!494423) (not e!411637))))

(declare-fun lt!326202 () SeekEntryResult!7369)

(assert (=> b!735766 (= res!494423 (= lt!326202 lt!326203))))

(assert (=> b!735766 (= lt!326203 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!326206 lt!326198 mask!3328))))

(assert (=> b!735766 (= lt!326202 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!326206 mask!3328) lt!326206 lt!326198 mask!3328))))

(assert (=> b!735766 (= lt!326206 (select (store (arr!19769 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!735766 (= lt!326198 (array!41312 (store (arr!19769 a!3186) i!1173 k!2102) (size!20190 a!3186)))))

(declare-fun b!735767 () Bool)

(declare-fun res!494420 () Bool)

(assert (=> b!735767 (=> res!494420 e!411632)))

(assert (=> b!735767 (= res!494420 e!411627)))

(declare-fun c!81051 () Bool)

(assert (=> b!735767 (= c!81051 lt!326196)))

(declare-fun b!735768 () Bool)

(declare-fun res!494421 () Bool)

(assert (=> b!735768 (=> (not res!494421) (not e!411630))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!735768 (= res!494421 (validKeyInArray!0 (select (arr!19769 a!3186) j!159)))))

(declare-fun b!735769 () Bool)

(declare-fun res!494417 () Bool)

(assert (=> b!735769 (=> (not res!494417) (not e!411630))))

(assert (=> b!735769 (= res!494417 (validKeyInArray!0 k!2102))))

(declare-fun b!735770 () Bool)

(declare-fun res!494418 () Bool)

(assert (=> b!735770 (=> (not res!494418) (not e!411630))))

(declare-fun arrayContainsKey!0 (array!41311 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!735770 (= res!494418 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!735771 () Bool)

(assert (=> b!735771 (= e!411627 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326205 resIntermediateIndex!5 (select (arr!19769 a!3186) j!159) a!3186 mask!3328) lt!326207)))))

(assert (= (and start!65138 res!494426) b!735762))

(assert (= (and b!735762 res!494419) b!735768))

(assert (= (and b!735768 res!494421) b!735769))

(assert (= (and b!735769 res!494417) b!735770))

(assert (= (and b!735770 res!494418) b!735754))

(assert (= (and b!735754 res!494412) b!735755))

(assert (= (and b!735755 res!494411) b!735765))

(assert (= (and b!735765 res!494410) b!735758))

(assert (= (and b!735758 res!494415) b!735764))

(assert (= (and b!735764 res!494414) b!735760))

(assert (= (and b!735760 res!494409) b!735756))

(assert (= (and b!735756 c!81050) b!735749))

(assert (= (and b!735756 (not c!81050)) b!735748))

(assert (= (and b!735756 res!494425) b!735766))

(assert (= (and b!735766 res!494423) b!735752))

(assert (= (and b!735752 res!494424) b!735753))

(assert (= (and b!735753 res!494413) b!735759))

(assert (= (and b!735752 (not res!494416)) b!735761))

(assert (= (and b!735761 c!81052) b!735750))

(assert (= (and b!735761 (not c!81052)) b!735751))

(assert (= (and b!735761 (not res!494422)) b!735767))

(assert (= (and b!735767 c!81051) b!735757))

(assert (= (and b!735767 (not c!81051)) b!735771))

(assert (= (and b!735767 (not res!494420)) b!735763))

(declare-fun m!688051 () Bool)

(assert (=> b!735751 m!688051))

(assert (=> b!735751 m!688051))

(declare-fun m!688053 () Bool)

(assert (=> b!735751 m!688053))

(assert (=> b!735751 m!688051))

(declare-fun m!688055 () Bool)

(assert (=> b!735751 m!688055))

(declare-fun m!688057 () Bool)

(assert (=> b!735754 m!688057))

(assert (=> b!735753 m!688051))

(assert (=> b!735753 m!688051))

(declare-fun m!688059 () Bool)

(assert (=> b!735753 m!688059))

(assert (=> b!735771 m!688051))

(assert (=> b!735771 m!688051))

(assert (=> b!735771 m!688055))

(declare-fun m!688061 () Bool)

(assert (=> b!735760 m!688061))

(assert (=> b!735757 m!688051))

(assert (=> b!735757 m!688051))

(declare-fun m!688063 () Bool)

(assert (=> b!735757 m!688063))

(declare-fun m!688065 () Bool)

(assert (=> b!735752 m!688065))

(declare-fun m!688067 () Bool)

(assert (=> b!735752 m!688067))

(declare-fun m!688069 () Bool)

(assert (=> b!735763 m!688069))

(assert (=> b!735748 m!688051))

(assert (=> b!735748 m!688051))

(assert (=> b!735748 m!688053))

(assert (=> b!735768 m!688051))

(assert (=> b!735768 m!688051))

(declare-fun m!688071 () Bool)

(assert (=> b!735768 m!688071))

(assert (=> b!735759 m!688051))

(assert (=> b!735759 m!688051))

(declare-fun m!688073 () Bool)

(assert (=> b!735759 m!688073))

(declare-fun m!688075 () Bool)

(assert (=> b!735766 m!688075))

(declare-fun m!688077 () Bool)

(assert (=> b!735766 m!688077))

(declare-fun m!688079 () Bool)

(assert (=> b!735766 m!688079))

(declare-fun m!688081 () Bool)

(assert (=> b!735766 m!688081))

(assert (=> b!735766 m!688079))

(declare-fun m!688083 () Bool)

(assert (=> b!735766 m!688083))

(assert (=> b!735764 m!688051))

(assert (=> b!735764 m!688051))

(declare-fun m!688085 () Bool)

(assert (=> b!735764 m!688085))

(assert (=> b!735764 m!688085))

(assert (=> b!735764 m!688051))

(declare-fun m!688087 () Bool)

(assert (=> b!735764 m!688087))

(assert (=> b!735750 m!688051))

(assert (=> b!735750 m!688051))

(assert (=> b!735750 m!688063))

(declare-fun m!688089 () Bool)

(assert (=> b!735770 m!688089))

(declare-fun m!688091 () Bool)

(assert (=> b!735761 m!688091))

(declare-fun m!688093 () Bool)

(assert (=> b!735755 m!688093))

(declare-fun m!688095 () Bool)

(assert (=> b!735769 m!688095))

(declare-fun m!688097 () Bool)

(assert (=> b!735765 m!688097))

(declare-fun m!688099 () Bool)

(assert (=> start!65138 m!688099))

(declare-fun m!688101 () Bool)

(assert (=> start!65138 m!688101))

(assert (=> b!735749 m!688051))

(assert (=> b!735749 m!688051))

(declare-fun m!688103 () Bool)

(assert (=> b!735749 m!688103))

(push 1)

(assert (not b!735764))

(assert (not b!735766))

(assert (not b!735755))

(assert (not b!735748))

(assert (not b!735754))

(assert (not b!735753))

(assert (not b!735751))

(assert (not b!735750))

(assert (not b!735769))

(assert (not b!735770))

(assert (not b!735763))

(assert (not b!735771))

(assert (not b!735765))

(assert (not b!735759))

(assert (not b!735761))

(assert (not b!735752))

(assert (not b!735749))

(assert (not b!735768))

(assert (not b!735757))

(assert (not start!65138))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

