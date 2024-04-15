; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32348 () Bool)

(assert start!32348)

(declare-fun b!322017 () Bool)

(declare-fun res!176133 () Bool)

(declare-fun e!199330 () Bool)

(assert (=> b!322017 (=> (not res!176133) (not e!199330))))

(declare-datatypes ((array!16491 0))(
  ( (array!16492 (arr!7803 (Array (_ BitVec 32) (_ BitVec 64))) (size!8156 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16491)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!322017 (= res!176133 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7803 a!3305) index!1840) k0!2497)) (= x!1490 resX!58)))))

(declare-fun b!322019 () Bool)

(declare-fun e!199327 () Bool)

(assert (=> b!322019 (= e!199327 e!199330)))

(declare-fun res!176139 () Bool)

(assert (=> b!322019 (=> (not res!176139) (not e!199330))))

(declare-datatypes ((SeekEntryResult!2933 0))(
  ( (MissingZero!2933 (index!13908 (_ BitVec 32))) (Found!2933 (index!13909 (_ BitVec 32))) (Intermediate!2933 (undefined!3745 Bool) (index!13910 (_ BitVec 32)) (x!32188 (_ BitVec 32))) (Undefined!2933) (MissingVacant!2933 (index!13911 (_ BitVec 32))) )
))
(declare-fun lt!156187 () SeekEntryResult!2933)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16491 (_ BitVec 32)) SeekEntryResult!2933)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!322019 (= res!176139 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156187))))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!322019 (= lt!156187 (Intermediate!2933 false resIndex!58 resX!58))))

(declare-fun b!322020 () Bool)

(declare-datatypes ((Unit!9800 0))(
  ( (Unit!9801) )
))
(declare-fun e!199328 () Unit!9800)

(declare-fun e!199326 () Unit!9800)

(assert (=> b!322020 (= e!199328 e!199326)))

(declare-fun c!50572 () Bool)

(assert (=> b!322020 (= c!50572 (or (= (select (arr!7803 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7803 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!322021 () Bool)

(declare-fun e!199329 () Unit!9800)

(declare-fun Unit!9802 () Unit!9800)

(assert (=> b!322021 (= e!199329 Unit!9802)))

(assert (=> b!322021 false))

(declare-fun b!322022 () Bool)

(declare-fun Unit!9803 () Unit!9800)

(assert (=> b!322022 (= e!199328 Unit!9803)))

(declare-fun b!322023 () Bool)

(declare-fun res!176134 () Bool)

(assert (=> b!322023 (=> (not res!176134) (not e!199327))))

(declare-fun arrayContainsKey!0 (array!16491 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!322023 (= res!176134 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!322024 () Bool)

(declare-fun res!176132 () Bool)

(assert (=> b!322024 (=> (not res!176132) (not e!199327))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!322024 (= res!176132 (and (= (size!8156 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8156 a!3305))))))

(declare-fun b!322025 () Bool)

(declare-fun Unit!9804 () Unit!9800)

(assert (=> b!322025 (= e!199329 Unit!9804)))

(declare-fun b!322026 () Bool)

(declare-fun res!176130 () Bool)

(assert (=> b!322026 (=> (not res!176130) (not e!199327))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!322026 (= res!176130 (validKeyInArray!0 k0!2497))))

(declare-fun b!322027 () Bool)

(declare-fun res!176137 () Bool)

(assert (=> b!322027 (=> (not res!176137) (not e!199330))))

(assert (=> b!322027 (= res!176137 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156187))))

(declare-fun b!322028 () Bool)

(assert (=> b!322028 (= e!199330 (not true))))

(assert (=> b!322028 (= index!1840 resIndex!58)))

(declare-fun lt!156186 () Unit!9800)

(assert (=> b!322028 (= lt!156186 e!199328)))

(declare-fun c!50573 () Bool)

(assert (=> b!322028 (= c!50573 (not (= resIndex!58 index!1840)))))

(declare-fun res!176135 () Bool)

(assert (=> start!32348 (=> (not res!176135) (not e!199327))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32348 (= res!176135 (validMask!0 mask!3777))))

(assert (=> start!32348 e!199327))

(declare-fun array_inv!5775 (array!16491) Bool)

(assert (=> start!32348 (array_inv!5775 a!3305)))

(assert (=> start!32348 true))

(declare-fun b!322018 () Bool)

(declare-fun res!176131 () Bool)

(assert (=> b!322018 (=> (not res!176131) (not e!199330))))

(assert (=> b!322018 (= res!176131 (and (= (select (arr!7803 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8156 a!3305))))))

(declare-fun b!322029 () Bool)

(declare-fun res!176138 () Bool)

(assert (=> b!322029 (=> (not res!176138) (not e!199327))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16491 (_ BitVec 32)) SeekEntryResult!2933)

(assert (=> b!322029 (= res!176138 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2933 i!1250)))))

(declare-fun b!322030 () Bool)

(assert (=> b!322030 false))

(declare-fun Unit!9805 () Unit!9800)

(assert (=> b!322030 (= e!199326 Unit!9805)))

(declare-fun b!322031 () Bool)

(assert (=> b!322031 false))

(declare-fun lt!156188 () Unit!9800)

(assert (=> b!322031 (= lt!156188 e!199329)))

(declare-fun c!50571 () Bool)

(get-info :version)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!322031 (= c!50571 ((_ is Intermediate!2933) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k0!2497 a!3305 mask!3777)))))

(declare-fun Unit!9806 () Unit!9800)

(assert (=> b!322031 (= e!199326 Unit!9806)))

(declare-fun b!322032 () Bool)

(declare-fun res!176136 () Bool)

(assert (=> b!322032 (=> (not res!176136) (not e!199327))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16491 (_ BitVec 32)) Bool)

(assert (=> b!322032 (= res!176136 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(assert (= (and start!32348 res!176135) b!322024))

(assert (= (and b!322024 res!176132) b!322026))

(assert (= (and b!322026 res!176130) b!322023))

(assert (= (and b!322023 res!176134) b!322029))

(assert (= (and b!322029 res!176138) b!322032))

(assert (= (and b!322032 res!176136) b!322019))

(assert (= (and b!322019 res!176139) b!322018))

(assert (= (and b!322018 res!176131) b!322027))

(assert (= (and b!322027 res!176137) b!322017))

(assert (= (and b!322017 res!176133) b!322028))

(assert (= (and b!322028 c!50573) b!322020))

(assert (= (and b!322028 (not c!50573)) b!322022))

(assert (= (and b!322020 c!50572) b!322030))

(assert (= (and b!322020 (not c!50572)) b!322031))

(assert (= (and b!322031 c!50571) b!322025))

(assert (= (and b!322031 (not c!50571)) b!322021))

(declare-fun m!329467 () Bool)

(assert (=> start!32348 m!329467))

(declare-fun m!329469 () Bool)

(assert (=> start!32348 m!329469))

(declare-fun m!329471 () Bool)

(assert (=> b!322027 m!329471))

(declare-fun m!329473 () Bool)

(assert (=> b!322018 m!329473))

(declare-fun m!329475 () Bool)

(assert (=> b!322020 m!329475))

(assert (=> b!322017 m!329475))

(declare-fun m!329477 () Bool)

(assert (=> b!322029 m!329477))

(declare-fun m!329479 () Bool)

(assert (=> b!322023 m!329479))

(declare-fun m!329481 () Bool)

(assert (=> b!322026 m!329481))

(declare-fun m!329483 () Bool)

(assert (=> b!322032 m!329483))

(declare-fun m!329485 () Bool)

(assert (=> b!322031 m!329485))

(assert (=> b!322031 m!329485))

(declare-fun m!329487 () Bool)

(assert (=> b!322031 m!329487))

(declare-fun m!329489 () Bool)

(assert (=> b!322019 m!329489))

(assert (=> b!322019 m!329489))

(declare-fun m!329491 () Bool)

(assert (=> b!322019 m!329491))

(check-sat (not b!322027) (not b!322031) (not b!322032) (not b!322019) (not b!322026) (not b!322023) (not start!32348) (not b!322029))
(check-sat)
