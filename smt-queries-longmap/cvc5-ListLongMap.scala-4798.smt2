; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65848 () Bool)

(assert start!65848)

(declare-fun b!758649 () Bool)

(declare-fun e!422965 () Bool)

(declare-fun e!422960 () Bool)

(assert (=> b!758649 (= e!422965 (not e!422960))))

(declare-fun res!513269 () Bool)

(assert (=> b!758649 (=> res!513269 e!422960)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7724 0))(
  ( (MissingZero!7724 (index!33264 (_ BitVec 32))) (Found!7724 (index!33265 (_ BitVec 32))) (Intermediate!7724 (undefined!8536 Bool) (index!33266 (_ BitVec 32)) (x!64154 (_ BitVec 32))) (Undefined!7724) (MissingVacant!7724 (index!33267 (_ BitVec 32))) )
))
(declare-fun lt!338020 () SeekEntryResult!7724)

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!758649 (= res!513269 (or (not (is-Intermediate!7724 lt!338020)) (bvslt x!1131 (x!64154 lt!338020)) (not (= x!1131 (x!64154 lt!338020))) (not (= index!1321 (index!33266 lt!338020)))))))

(declare-fun e!422966 () Bool)

(assert (=> b!758649 e!422966))

(declare-fun res!513266 () Bool)

(assert (=> b!758649 (=> (not res!513266) (not e!422966))))

(declare-fun lt!338017 () SeekEntryResult!7724)

(declare-fun lt!338013 () SeekEntryResult!7724)

(assert (=> b!758649 (= res!513266 (= lt!338017 lt!338013))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!758649 (= lt!338013 (Found!7724 j!159))))

(declare-datatypes ((array!42021 0))(
  ( (array!42022 (arr!20124 (Array (_ BitVec 32) (_ BitVec 64))) (size!20545 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42021)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42021 (_ BitVec 32)) SeekEntryResult!7724)

(assert (=> b!758649 (= lt!338017 (seekEntryOrOpen!0 (select (arr!20124 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42021 (_ BitVec 32)) Bool)

(assert (=> b!758649 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!26276 0))(
  ( (Unit!26277) )
))
(declare-fun lt!338015 () Unit!26276)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42021 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26276)

(assert (=> b!758649 (= lt!338015 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!758650 () Bool)

(declare-fun e!422967 () Bool)

(assert (=> b!758650 (= e!422967 true)))

(declare-fun lt!338023 () SeekEntryResult!7724)

(declare-fun lt!338011 () SeekEntryResult!7724)

(assert (=> b!758650 (= lt!338023 lt!338011)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun lt!338019 () Unit!26276)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!42021 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26276)

(assert (=> b!758650 (= lt!338019 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3186 i!1173 k!2102 j!159 index!1321 x!1131 resIntermediateIndex!5 index!1321 mask!3328))))

(declare-fun b!758652 () Bool)

(declare-fun res!513279 () Bool)

(declare-fun e!422963 () Bool)

(assert (=> b!758652 (=> (not res!513279) (not e!422963))))

(declare-fun e!422964 () Bool)

(assert (=> b!758652 (= res!513279 e!422964)))

(declare-fun c!83074 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!758652 (= c!83074 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!758653 () Bool)

(declare-fun res!513273 () Bool)

(declare-fun e!422968 () Bool)

(assert (=> b!758653 (=> (not res!513273) (not e!422968))))

(declare-fun arrayContainsKey!0 (array!42021 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!758653 (= res!513273 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!758654 () Bool)

(declare-fun res!513268 () Bool)

(assert (=> b!758654 (=> (not res!513268) (not e!422968))))

(assert (=> b!758654 (= res!513268 (and (= (size!20545 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20545 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20545 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!758655 () Bool)

(declare-fun e!422959 () Bool)

(assert (=> b!758655 (= e!422959 e!422963)))

(declare-fun res!513265 () Bool)

(assert (=> b!758655 (=> (not res!513265) (not e!422963))))

(declare-fun lt!338010 () SeekEntryResult!7724)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42021 (_ BitVec 32)) SeekEntryResult!7724)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!758655 (= res!513265 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20124 a!3186) j!159) mask!3328) (select (arr!20124 a!3186) j!159) a!3186 mask!3328) lt!338010))))

(assert (=> b!758655 (= lt!338010 (Intermediate!7724 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!758656 () Bool)

(declare-fun e!422962 () Unit!26276)

(declare-fun Unit!26278 () Unit!26276)

(assert (=> b!758656 (= e!422962 Unit!26278)))

(declare-fun b!758657 () Bool)

(declare-fun e!422958 () Bool)

(assert (=> b!758657 (= e!422960 e!422958)))

(declare-fun res!513267 () Bool)

(assert (=> b!758657 (=> res!513267 e!422958)))

(assert (=> b!758657 (= res!513267 (not (= lt!338011 lt!338013)))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42021 (_ BitVec 32)) SeekEntryResult!7724)

(assert (=> b!758657 (= lt!338011 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20124 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!758658 () Bool)

(declare-fun res!513277 () Bool)

(assert (=> b!758658 (=> (not res!513277) (not e!422968))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!758658 (= res!513277 (validKeyInArray!0 (select (arr!20124 a!3186) j!159)))))

(declare-fun b!758659 () Bool)

(declare-fun Unit!26279 () Unit!26276)

(assert (=> b!758659 (= e!422962 Unit!26279)))

(assert (=> b!758659 false))

(declare-fun b!758660 () Bool)

(declare-fun e!422961 () Bool)

(assert (=> b!758660 (= e!422958 e!422961)))

(declare-fun res!513278 () Bool)

(assert (=> b!758660 (=> res!513278 e!422961)))

(declare-fun lt!338022 () (_ BitVec 64))

(declare-fun lt!338018 () (_ BitVec 64))

(assert (=> b!758660 (= res!513278 (= lt!338022 lt!338018))))

(assert (=> b!758660 (= lt!338022 (select (store (arr!20124 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!758661 () Bool)

(declare-fun res!513274 () Bool)

(assert (=> b!758661 (=> (not res!513274) (not e!422959))))

(assert (=> b!758661 (= res!513274 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20545 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20545 a!3186))))))

(declare-fun res!513281 () Bool)

(assert (=> start!65848 (=> (not res!513281) (not e!422968))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65848 (= res!513281 (validMask!0 mask!3328))))

(assert (=> start!65848 e!422968))

(assert (=> start!65848 true))

(declare-fun array_inv!15920 (array!42021) Bool)

(assert (=> start!65848 (array_inv!15920 a!3186)))

(declare-fun b!758651 () Bool)

(assert (=> b!758651 (= e!422961 e!422967)))

(declare-fun res!513271 () Bool)

(assert (=> b!758651 (=> res!513271 e!422967)))

(assert (=> b!758651 (= res!513271 (or (not (= (select (arr!20124 a!3186) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)) (= index!1321 resIntermediateIndex!5)))))

(declare-fun lt!338014 () SeekEntryResult!7724)

(assert (=> b!758651 (and (= lt!338014 lt!338023) (= lt!338017 lt!338011))))

(declare-fun lt!338021 () array!42021)

(assert (=> b!758651 (= lt!338023 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!338018 lt!338021 mask!3328))))

(assert (=> b!758651 (= lt!338014 (seekEntryOrOpen!0 lt!338018 lt!338021 mask!3328))))

(assert (=> b!758651 (= lt!338022 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!338012 () Unit!26276)

(assert (=> b!758651 (= lt!338012 e!422962)))

(declare-fun c!83073 () Bool)

(assert (=> b!758651 (= c!83073 (= lt!338022 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!758662 () Bool)

(assert (=> b!758662 (= e!422964 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20124 a!3186) j!159) a!3186 mask!3328) (Found!7724 j!159)))))

(declare-fun b!758663 () Bool)

(declare-fun res!513270 () Bool)

(assert (=> b!758663 (=> (not res!513270) (not e!422959))))

(assert (=> b!758663 (= res!513270 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!758664 () Bool)

(assert (=> b!758664 (= e!422968 e!422959)))

(declare-fun res!513275 () Bool)

(assert (=> b!758664 (=> (not res!513275) (not e!422959))))

(declare-fun lt!338024 () SeekEntryResult!7724)

(assert (=> b!758664 (= res!513275 (or (= lt!338024 (MissingZero!7724 i!1173)) (= lt!338024 (MissingVacant!7724 i!1173))))))

(assert (=> b!758664 (= lt!338024 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!758665 () Bool)

(assert (=> b!758665 (= e!422964 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20124 a!3186) j!159) a!3186 mask!3328) lt!338010))))

(declare-fun b!758666 () Bool)

(declare-fun res!513276 () Bool)

(assert (=> b!758666 (=> (not res!513276) (not e!422959))))

(declare-datatypes ((List!14126 0))(
  ( (Nil!14123) (Cons!14122 (h!15194 (_ BitVec 64)) (t!20441 List!14126)) )
))
(declare-fun arrayNoDuplicates!0 (array!42021 (_ BitVec 32) List!14126) Bool)

(assert (=> b!758666 (= res!513276 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14123))))

(declare-fun b!758667 () Bool)

(assert (=> b!758667 (= e!422966 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20124 a!3186) j!159) a!3186 mask!3328) lt!338013))))

(declare-fun b!758668 () Bool)

(declare-fun res!513272 () Bool)

(assert (=> b!758668 (=> (not res!513272) (not e!422963))))

(assert (=> b!758668 (= res!513272 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20124 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!758669 () Bool)

(assert (=> b!758669 (= e!422963 e!422965)))

(declare-fun res!513280 () Bool)

(assert (=> b!758669 (=> (not res!513280) (not e!422965))))

(declare-fun lt!338016 () SeekEntryResult!7724)

(assert (=> b!758669 (= res!513280 (= lt!338016 lt!338020))))

(assert (=> b!758669 (= lt!338020 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!338018 lt!338021 mask!3328))))

(assert (=> b!758669 (= lt!338016 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!338018 mask!3328) lt!338018 lt!338021 mask!3328))))

(assert (=> b!758669 (= lt!338018 (select (store (arr!20124 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!758669 (= lt!338021 (array!42022 (store (arr!20124 a!3186) i!1173 k!2102) (size!20545 a!3186)))))

(declare-fun b!758670 () Bool)

(declare-fun res!513264 () Bool)

(assert (=> b!758670 (=> (not res!513264) (not e!422968))))

(assert (=> b!758670 (= res!513264 (validKeyInArray!0 k!2102))))

(assert (= (and start!65848 res!513281) b!758654))

(assert (= (and b!758654 res!513268) b!758658))

(assert (= (and b!758658 res!513277) b!758670))

(assert (= (and b!758670 res!513264) b!758653))

(assert (= (and b!758653 res!513273) b!758664))

(assert (= (and b!758664 res!513275) b!758663))

(assert (= (and b!758663 res!513270) b!758666))

(assert (= (and b!758666 res!513276) b!758661))

(assert (= (and b!758661 res!513274) b!758655))

(assert (= (and b!758655 res!513265) b!758668))

(assert (= (and b!758668 res!513272) b!758652))

(assert (= (and b!758652 c!83074) b!758665))

(assert (= (and b!758652 (not c!83074)) b!758662))

(assert (= (and b!758652 res!513279) b!758669))

(assert (= (and b!758669 res!513280) b!758649))

(assert (= (and b!758649 res!513266) b!758667))

(assert (= (and b!758649 (not res!513269)) b!758657))

(assert (= (and b!758657 (not res!513267)) b!758660))

(assert (= (and b!758660 (not res!513278)) b!758651))

(assert (= (and b!758651 c!83073) b!758659))

(assert (= (and b!758651 (not c!83073)) b!758656))

(assert (= (and b!758651 (not res!513271)) b!758650))

(declare-fun m!706099 () Bool)

(assert (=> b!758660 m!706099))

(declare-fun m!706101 () Bool)

(assert (=> b!758660 m!706101))

(declare-fun m!706103 () Bool)

(assert (=> start!65848 m!706103))

(declare-fun m!706105 () Bool)

(assert (=> start!65848 m!706105))

(declare-fun m!706107 () Bool)

(assert (=> b!758665 m!706107))

(assert (=> b!758665 m!706107))

(declare-fun m!706109 () Bool)

(assert (=> b!758665 m!706109))

(assert (=> b!758658 m!706107))

(assert (=> b!758658 m!706107))

(declare-fun m!706111 () Bool)

(assert (=> b!758658 m!706111))

(declare-fun m!706113 () Bool)

(assert (=> b!758664 m!706113))

(assert (=> b!758669 m!706099))

(declare-fun m!706115 () Bool)

(assert (=> b!758669 m!706115))

(declare-fun m!706117 () Bool)

(assert (=> b!758669 m!706117))

(declare-fun m!706119 () Bool)

(assert (=> b!758669 m!706119))

(declare-fun m!706121 () Bool)

(assert (=> b!758669 m!706121))

(assert (=> b!758669 m!706119))

(assert (=> b!758662 m!706107))

(assert (=> b!758662 m!706107))

(declare-fun m!706123 () Bool)

(assert (=> b!758662 m!706123))

(declare-fun m!706125 () Bool)

(assert (=> b!758666 m!706125))

(declare-fun m!706127 () Bool)

(assert (=> b!758663 m!706127))

(assert (=> b!758667 m!706107))

(assert (=> b!758667 m!706107))

(declare-fun m!706129 () Bool)

(assert (=> b!758667 m!706129))

(assert (=> b!758655 m!706107))

(assert (=> b!758655 m!706107))

(declare-fun m!706131 () Bool)

(assert (=> b!758655 m!706131))

(assert (=> b!758655 m!706131))

(assert (=> b!758655 m!706107))

(declare-fun m!706133 () Bool)

(assert (=> b!758655 m!706133))

(declare-fun m!706135 () Bool)

(assert (=> b!758653 m!706135))

(declare-fun m!706137 () Bool)

(assert (=> b!758668 m!706137))

(declare-fun m!706139 () Bool)

(assert (=> b!758650 m!706139))

(assert (=> b!758649 m!706107))

(assert (=> b!758649 m!706107))

(declare-fun m!706141 () Bool)

(assert (=> b!758649 m!706141))

(declare-fun m!706143 () Bool)

(assert (=> b!758649 m!706143))

(declare-fun m!706145 () Bool)

(assert (=> b!758649 m!706145))

(declare-fun m!706147 () Bool)

(assert (=> b!758651 m!706147))

(declare-fun m!706149 () Bool)

(assert (=> b!758651 m!706149))

(declare-fun m!706151 () Bool)

(assert (=> b!758651 m!706151))

(assert (=> b!758657 m!706107))

(assert (=> b!758657 m!706107))

(assert (=> b!758657 m!706123))

(declare-fun m!706153 () Bool)

(assert (=> b!758670 m!706153))

(push 1)

