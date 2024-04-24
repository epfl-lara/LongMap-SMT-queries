; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51486 () Bool)

(assert start!51486)

(declare-fun b!562471 () Bool)

(declare-fun res!353522 () Bool)

(declare-fun e!324164 () Bool)

(assert (=> b!562471 (=> (not res!353522) (not e!324164))))

(declare-datatypes ((array!35298 0))(
  ( (array!35299 (arr!16948 (Array (_ BitVec 32) (_ BitVec 64))) (size!17312 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35298)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35298 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!562471 (= res!353522 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!562472 () Bool)

(declare-fun res!353529 () Bool)

(assert (=> b!562472 (=> (not res!353529) (not e!324164))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!562472 (= res!353529 (validKeyInArray!0 k0!1914))))

(declare-fun b!562473 () Bool)

(declare-fun e!324161 () Bool)

(assert (=> b!562473 (= e!324164 e!324161)))

(declare-fun res!353521 () Bool)

(assert (=> b!562473 (=> (not res!353521) (not e!324161))))

(declare-datatypes ((SeekEntryResult!5353 0))(
  ( (MissingZero!5353 (index!23639 (_ BitVec 32))) (Found!5353 (index!23640 (_ BitVec 32))) (Intermediate!5353 (undefined!6165 Bool) (index!23641 (_ BitVec 32)) (x!52691 (_ BitVec 32))) (Undefined!5353) (MissingVacant!5353 (index!23642 (_ BitVec 32))) )
))
(declare-fun lt!256202 () SeekEntryResult!5353)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!562473 (= res!353521 (or (= lt!256202 (MissingZero!5353 i!1132)) (= lt!256202 (MissingVacant!5353 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35298 (_ BitVec 32)) SeekEntryResult!5353)

(assert (=> b!562473 (= lt!256202 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun res!353525 () Bool)

(assert (=> start!51486 (=> (not res!353525) (not e!324164))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51486 (= res!353525 (validMask!0 mask!3119))))

(assert (=> start!51486 e!324164))

(assert (=> start!51486 true))

(declare-fun array_inv!12807 (array!35298) Bool)

(assert (=> start!51486 (array_inv!12807 a!3118)))

(declare-fun b!562474 () Bool)

(declare-fun e!324168 () Bool)

(assert (=> b!562474 (= e!324168 (not true))))

(declare-fun e!324166 () Bool)

(assert (=> b!562474 e!324166))

(declare-fun res!353519 () Bool)

(assert (=> b!562474 (=> (not res!353519) (not e!324166))))

(declare-fun lt!256196 () SeekEntryResult!5353)

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!562474 (= res!353519 (= lt!256196 (Found!5353 j!142)))))

(assert (=> b!562474 (= lt!256196 (seekEntryOrOpen!0 (select (arr!16948 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35298 (_ BitVec 32)) Bool)

(assert (=> b!562474 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17551 0))(
  ( (Unit!17552) )
))
(declare-fun lt!256203 () Unit!17551)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35298 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17551)

(assert (=> b!562474 (= lt!256203 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!562475 () Bool)

(declare-fun e!324162 () Bool)

(assert (=> b!562475 (= e!324166 e!324162)))

(declare-fun res!353526 () Bool)

(assert (=> b!562475 (=> res!353526 e!324162)))

(declare-fun lt!256201 () SeekEntryResult!5353)

(get-info :version)

(assert (=> b!562475 (= res!353526 (or (undefined!6165 lt!256201) (not ((_ is Intermediate!5353) lt!256201))))))

(declare-fun b!562476 () Bool)

(declare-fun res!353523 () Bool)

(assert (=> b!562476 (=> (not res!353523) (not e!324164))))

(assert (=> b!562476 (= res!353523 (validKeyInArray!0 (select (arr!16948 a!3118) j!142)))))

(declare-fun b!562477 () Bool)

(assert (=> b!562477 (= e!324161 e!324168)))

(declare-fun res!353527 () Bool)

(assert (=> b!562477 (=> (not res!353527) (not e!324168))))

(declare-fun lt!256198 () (_ BitVec 64))

(declare-fun lt!256199 () array!35298)

(declare-fun lt!256200 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35298 (_ BitVec 32)) SeekEntryResult!5353)

(assert (=> b!562477 (= res!353527 (= lt!256201 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256200 lt!256198 lt!256199 mask!3119)))))

(declare-fun lt!256204 () (_ BitVec 32))

(assert (=> b!562477 (= lt!256201 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256204 (select (arr!16948 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!562477 (= lt!256200 (toIndex!0 lt!256198 mask!3119))))

(assert (=> b!562477 (= lt!256198 (select (store (arr!16948 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!562477 (= lt!256204 (toIndex!0 (select (arr!16948 a!3118) j!142) mask!3119))))

(assert (=> b!562477 (= lt!256199 (array!35299 (store (arr!16948 a!3118) i!1132 k0!1914) (size!17312 a!3118)))))

(declare-fun b!562478 () Bool)

(declare-fun res!353530 () Bool)

(assert (=> b!562478 (=> (not res!353530) (not e!324161))))

(assert (=> b!562478 (= res!353530 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!562479 () Bool)

(declare-fun e!324165 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35298 (_ BitVec 32)) SeekEntryResult!5353)

(assert (=> b!562479 (= e!324165 (= (seekEntryOrOpen!0 lt!256198 lt!256199 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52691 lt!256201) (index!23641 lt!256201) (index!23641 lt!256201) lt!256198 lt!256199 mask!3119)))))

(declare-fun b!562480 () Bool)

(declare-fun e!324167 () Bool)

(assert (=> b!562480 (= e!324167 e!324165)))

(declare-fun res!353528 () Bool)

(assert (=> b!562480 (=> (not res!353528) (not e!324165))))

(assert (=> b!562480 (= res!353528 (= lt!256196 (seekKeyOrZeroReturnVacant!0 (x!52691 lt!256201) (index!23641 lt!256201) (index!23641 lt!256201) (select (arr!16948 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!562481 () Bool)

(declare-fun res!353518 () Bool)

(assert (=> b!562481 (=> (not res!353518) (not e!324161))))

(declare-datatypes ((List!10935 0))(
  ( (Nil!10932) (Cons!10931 (h!11937 (_ BitVec 64)) (t!17155 List!10935)) )
))
(declare-fun arrayNoDuplicates!0 (array!35298 (_ BitVec 32) List!10935) Bool)

(assert (=> b!562481 (= res!353518 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10932))))

(declare-fun b!562482 () Bool)

(assert (=> b!562482 (= e!324162 e!324167)))

(declare-fun res!353524 () Bool)

(assert (=> b!562482 (=> res!353524 e!324167)))

(declare-fun lt!256197 () (_ BitVec 64))

(assert (=> b!562482 (= res!353524 (or (= lt!256197 (select (arr!16948 a!3118) j!142)) (= lt!256197 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!562482 (= lt!256197 (select (arr!16948 a!3118) (index!23641 lt!256201)))))

(declare-fun b!562483 () Bool)

(declare-fun res!353520 () Bool)

(assert (=> b!562483 (=> (not res!353520) (not e!324164))))

(assert (=> b!562483 (= res!353520 (and (= (size!17312 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17312 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17312 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!51486 res!353525) b!562483))

(assert (= (and b!562483 res!353520) b!562476))

(assert (= (and b!562476 res!353523) b!562472))

(assert (= (and b!562472 res!353529) b!562471))

(assert (= (and b!562471 res!353522) b!562473))

(assert (= (and b!562473 res!353521) b!562478))

(assert (= (and b!562478 res!353530) b!562481))

(assert (= (and b!562481 res!353518) b!562477))

(assert (= (and b!562477 res!353527) b!562474))

(assert (= (and b!562474 res!353519) b!562475))

(assert (= (and b!562475 (not res!353526)) b!562482))

(assert (= (and b!562482 (not res!353524)) b!562480))

(assert (= (and b!562480 res!353528) b!562479))

(declare-fun m!540611 () Bool)

(assert (=> b!562480 m!540611))

(assert (=> b!562480 m!540611))

(declare-fun m!540613 () Bool)

(assert (=> b!562480 m!540613))

(assert (=> b!562474 m!540611))

(assert (=> b!562474 m!540611))

(declare-fun m!540615 () Bool)

(assert (=> b!562474 m!540615))

(declare-fun m!540617 () Bool)

(assert (=> b!562474 m!540617))

(declare-fun m!540619 () Bool)

(assert (=> b!562474 m!540619))

(declare-fun m!540621 () Bool)

(assert (=> b!562472 m!540621))

(declare-fun m!540623 () Bool)

(assert (=> b!562471 m!540623))

(declare-fun m!540625 () Bool)

(assert (=> b!562477 m!540625))

(assert (=> b!562477 m!540611))

(declare-fun m!540627 () Bool)

(assert (=> b!562477 m!540627))

(assert (=> b!562477 m!540611))

(declare-fun m!540629 () Bool)

(assert (=> b!562477 m!540629))

(assert (=> b!562477 m!540611))

(declare-fun m!540631 () Bool)

(assert (=> b!562477 m!540631))

(declare-fun m!540633 () Bool)

(assert (=> b!562477 m!540633))

(declare-fun m!540635 () Bool)

(assert (=> b!562477 m!540635))

(declare-fun m!540637 () Bool)

(assert (=> b!562479 m!540637))

(declare-fun m!540639 () Bool)

(assert (=> b!562479 m!540639))

(declare-fun m!540641 () Bool)

(assert (=> b!562478 m!540641))

(assert (=> b!562482 m!540611))

(declare-fun m!540643 () Bool)

(assert (=> b!562482 m!540643))

(declare-fun m!540645 () Bool)

(assert (=> b!562481 m!540645))

(declare-fun m!540647 () Bool)

(assert (=> b!562473 m!540647))

(assert (=> b!562476 m!540611))

(assert (=> b!562476 m!540611))

(declare-fun m!540649 () Bool)

(assert (=> b!562476 m!540649))

(declare-fun m!540651 () Bool)

(assert (=> start!51486 m!540651))

(declare-fun m!540653 () Bool)

(assert (=> start!51486 m!540653))

(check-sat (not b!562473) (not b!562471) (not start!51486) (not b!562476) (not b!562479) (not b!562480) (not b!562478) (not b!562474) (not b!562481) (not b!562477) (not b!562472))
(check-sat)
