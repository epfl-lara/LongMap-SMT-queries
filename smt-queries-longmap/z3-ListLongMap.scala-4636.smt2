; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64496 () Bool)

(assert start!64496)

(declare-fun b!725992 () Bool)

(declare-fun res!487138 () Bool)

(declare-fun e!406483 () Bool)

(assert (=> b!725992 (=> (not res!487138) (not e!406483))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!725992 (= res!487138 (validKeyInArray!0 k0!2102))))

(declare-fun b!725993 () Bool)

(declare-fun res!487149 () Bool)

(assert (=> b!725993 (=> (not res!487149) (not e!406483))))

(declare-datatypes ((array!41031 0))(
  ( (array!41032 (arr!19637 (Array (_ BitVec 32) (_ BitVec 64))) (size!20058 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41031)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!725993 (= res!487149 (and (= (size!20058 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20058 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20058 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!725994 () Bool)

(declare-fun res!487146 () Bool)

(assert (=> b!725994 (=> (not res!487146) (not e!406483))))

(declare-fun arrayContainsKey!0 (array!41031 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!725994 (= res!487146 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!725995 () Bool)

(declare-fun res!487143 () Bool)

(declare-fun e!406480 () Bool)

(assert (=> b!725995 (=> (not res!487143) (not e!406480))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!725995 (= res!487143 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19637 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!725996 () Bool)

(declare-fun res!487150 () Bool)

(declare-fun e!406485 () Bool)

(assert (=> b!725996 (=> (not res!487150) (not e!406485))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41031 (_ BitVec 32)) Bool)

(assert (=> b!725996 (= res!487150 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!725997 () Bool)

(declare-fun res!487142 () Bool)

(assert (=> b!725997 (=> (not res!487142) (not e!406485))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!725997 (= res!487142 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20058 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20058 a!3186))))))

(declare-fun b!725998 () Bool)

(declare-fun res!487151 () Bool)

(assert (=> b!725998 (=> (not res!487151) (not e!406485))))

(declare-datatypes ((List!13678 0))(
  ( (Nil!13675) (Cons!13674 (h!14731 (_ BitVec 64)) (t!19984 List!13678)) )
))
(declare-fun arrayNoDuplicates!0 (array!41031 (_ BitVec 32) List!13678) Bool)

(assert (=> b!725998 (= res!487151 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13675))))

(declare-fun b!725999 () Bool)

(declare-fun res!487140 () Bool)

(assert (=> b!725999 (=> (not res!487140) (not e!406480))))

(declare-fun e!406482 () Bool)

(assert (=> b!725999 (= res!487140 e!406482)))

(declare-fun c!79800 () Bool)

(assert (=> b!725999 (= c!79800 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!726000 () Bool)

(assert (=> b!726000 (= e!406483 e!406485)))

(declare-fun res!487141 () Bool)

(assert (=> b!726000 (=> (not res!487141) (not e!406485))))

(declare-datatypes ((SeekEntryResult!7234 0))(
  ( (MissingZero!7234 (index!31304 (_ BitVec 32))) (Found!7234 (index!31305 (_ BitVec 32))) (Intermediate!7234 (undefined!8046 Bool) (index!31306 (_ BitVec 32)) (x!62303 (_ BitVec 32))) (Undefined!7234) (MissingVacant!7234 (index!31307 (_ BitVec 32))) )
))
(declare-fun lt!321391 () SeekEntryResult!7234)

(assert (=> b!726000 (= res!487141 (or (= lt!321391 (MissingZero!7234 i!1173)) (= lt!321391 (MissingVacant!7234 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41031 (_ BitVec 32)) SeekEntryResult!7234)

(assert (=> b!726000 (= lt!321391 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun e!406479 () Bool)

(declare-fun lt!321392 () SeekEntryResult!7234)

(declare-fun b!726001 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41031 (_ BitVec 32)) SeekEntryResult!7234)

(assert (=> b!726001 (= e!406479 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19637 a!3186) j!159) a!3186 mask!3328) lt!321392))))

(declare-fun b!726003 () Bool)

(assert (=> b!726003 (= e!406482 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19637 a!3186) j!159) a!3186 mask!3328) (Found!7234 j!159)))))

(declare-fun b!726004 () Bool)

(declare-fun e!406484 () Bool)

(assert (=> b!726004 (= e!406480 e!406484)))

(declare-fun res!487144 () Bool)

(assert (=> b!726004 (=> (not res!487144) (not e!406484))))

(declare-fun lt!321389 () SeekEntryResult!7234)

(declare-fun lt!321390 () SeekEntryResult!7234)

(assert (=> b!726004 (= res!487144 (= lt!321389 lt!321390))))

(declare-fun lt!321393 () (_ BitVec 64))

(declare-fun lt!321394 () array!41031)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41031 (_ BitVec 32)) SeekEntryResult!7234)

(assert (=> b!726004 (= lt!321390 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!321393 lt!321394 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!726004 (= lt!321389 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!321393 mask!3328) lt!321393 lt!321394 mask!3328))))

(assert (=> b!726004 (= lt!321393 (select (store (arr!19637 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!726004 (= lt!321394 (array!41032 (store (arr!19637 a!3186) i!1173 k0!2102) (size!20058 a!3186)))))

(declare-fun lt!321388 () SeekEntryResult!7234)

(declare-fun b!726005 () Bool)

(assert (=> b!726005 (= e!406482 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19637 a!3186) j!159) a!3186 mask!3328) lt!321388))))

(declare-fun b!726006 () Bool)

(declare-fun res!487145 () Bool)

(assert (=> b!726006 (=> (not res!487145) (not e!406483))))

(assert (=> b!726006 (= res!487145 (validKeyInArray!0 (select (arr!19637 a!3186) j!159)))))

(declare-fun res!487152 () Bool)

(assert (=> start!64496 (=> (not res!487152) (not e!406483))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64496 (= res!487152 (validMask!0 mask!3328))))

(assert (=> start!64496 e!406483))

(assert (=> start!64496 true))

(declare-fun array_inv!15520 (array!41031) Bool)

(assert (=> start!64496 (array_inv!15520 a!3186)))

(declare-fun b!726002 () Bool)

(declare-fun e!406481 () Bool)

(assert (=> b!726002 (= e!406481 e!406479)))

(declare-fun res!487147 () Bool)

(assert (=> b!726002 (=> (not res!487147) (not e!406479))))

(assert (=> b!726002 (= res!487147 (= (seekEntryOrOpen!0 (select (arr!19637 a!3186) j!159) a!3186 mask!3328) lt!321392))))

(assert (=> b!726002 (= lt!321392 (Found!7234 j!159))))

(declare-fun b!726007 () Bool)

(assert (=> b!726007 (= e!406485 e!406480)))

(declare-fun res!487139 () Bool)

(assert (=> b!726007 (=> (not res!487139) (not e!406480))))

(assert (=> b!726007 (= res!487139 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19637 a!3186) j!159) mask!3328) (select (arr!19637 a!3186) j!159) a!3186 mask!3328) lt!321388))))

(assert (=> b!726007 (= lt!321388 (Intermediate!7234 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!726008 () Bool)

(get-info :version)

(assert (=> b!726008 (= e!406484 (not (or (not ((_ is Intermediate!7234) lt!321390)) (bvsge x!1131 (x!62303 lt!321390)) (bvsge mask!3328 #b00000000000000000000000000000000))))))

(assert (=> b!726008 e!406481))

(declare-fun res!487148 () Bool)

(assert (=> b!726008 (=> (not res!487148) (not e!406481))))

(assert (=> b!726008 (= res!487148 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24758 0))(
  ( (Unit!24759) )
))
(declare-fun lt!321395 () Unit!24758)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41031 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24758)

(assert (=> b!726008 (= lt!321395 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (= (and start!64496 res!487152) b!725993))

(assert (= (and b!725993 res!487149) b!726006))

(assert (= (and b!726006 res!487145) b!725992))

(assert (= (and b!725992 res!487138) b!725994))

(assert (= (and b!725994 res!487146) b!726000))

(assert (= (and b!726000 res!487141) b!725996))

(assert (= (and b!725996 res!487150) b!725998))

(assert (= (and b!725998 res!487151) b!725997))

(assert (= (and b!725997 res!487142) b!726007))

(assert (= (and b!726007 res!487139) b!725995))

(assert (= (and b!725995 res!487143) b!725999))

(assert (= (and b!725999 c!79800) b!726005))

(assert (= (and b!725999 (not c!79800)) b!726003))

(assert (= (and b!725999 res!487140) b!726004))

(assert (= (and b!726004 res!487144) b!726008))

(assert (= (and b!726008 res!487148) b!726002))

(assert (= (and b!726002 res!487147) b!726001))

(declare-fun m!679565 () Bool)

(assert (=> b!726006 m!679565))

(assert (=> b!726006 m!679565))

(declare-fun m!679567 () Bool)

(assert (=> b!726006 m!679567))

(declare-fun m!679569 () Bool)

(assert (=> b!725995 m!679569))

(assert (=> b!726003 m!679565))

(assert (=> b!726003 m!679565))

(declare-fun m!679571 () Bool)

(assert (=> b!726003 m!679571))

(declare-fun m!679573 () Bool)

(assert (=> start!64496 m!679573))

(declare-fun m!679575 () Bool)

(assert (=> start!64496 m!679575))

(declare-fun m!679577 () Bool)

(assert (=> b!726004 m!679577))

(declare-fun m!679579 () Bool)

(assert (=> b!726004 m!679579))

(declare-fun m!679581 () Bool)

(assert (=> b!726004 m!679581))

(declare-fun m!679583 () Bool)

(assert (=> b!726004 m!679583))

(assert (=> b!726004 m!679577))

(declare-fun m!679585 () Bool)

(assert (=> b!726004 m!679585))

(assert (=> b!726001 m!679565))

(assert (=> b!726001 m!679565))

(declare-fun m!679587 () Bool)

(assert (=> b!726001 m!679587))

(declare-fun m!679589 () Bool)

(assert (=> b!726008 m!679589))

(declare-fun m!679591 () Bool)

(assert (=> b!726008 m!679591))

(declare-fun m!679593 () Bool)

(assert (=> b!725992 m!679593))

(declare-fun m!679595 () Bool)

(assert (=> b!725994 m!679595))

(assert (=> b!726007 m!679565))

(assert (=> b!726007 m!679565))

(declare-fun m!679597 () Bool)

(assert (=> b!726007 m!679597))

(assert (=> b!726007 m!679597))

(assert (=> b!726007 m!679565))

(declare-fun m!679599 () Bool)

(assert (=> b!726007 m!679599))

(declare-fun m!679601 () Bool)

(assert (=> b!725998 m!679601))

(assert (=> b!726002 m!679565))

(assert (=> b!726002 m!679565))

(declare-fun m!679603 () Bool)

(assert (=> b!726002 m!679603))

(assert (=> b!726005 m!679565))

(assert (=> b!726005 m!679565))

(declare-fun m!679605 () Bool)

(assert (=> b!726005 m!679605))

(declare-fun m!679607 () Bool)

(assert (=> b!725996 m!679607))

(declare-fun m!679609 () Bool)

(assert (=> b!726000 m!679609))

(check-sat (not b!725992) (not b!726004) (not b!726002) (not b!726003) (not start!64496) (not b!726001) (not b!725996) (not b!725998) (not b!726007) (not b!725994) (not b!726008) (not b!726000) (not b!726005) (not b!726006))
(check-sat)
