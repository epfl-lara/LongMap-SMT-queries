; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33224 () Bool)

(assert start!33224)

(declare-fun b!330506 () Bool)

(assert (=> b!330506 false))

(declare-datatypes ((Unit!10295 0))(
  ( (Unit!10296) )
))
(declare-fun lt!158526 () Unit!10295)

(declare-fun e!202861 () Unit!10295)

(assert (=> b!330506 (= lt!158526 e!202861)))

(declare-datatypes ((array!16883 0))(
  ( (array!16884 (arr!7984 (Array (_ BitVec 32) (_ BitVec 64))) (size!8336 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16883)

(declare-fun c!51823 () Bool)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3115 0))(
  ( (MissingZero!3115 (index!14636 (_ BitVec 32))) (Found!3115 (index!14637 (_ BitVec 32))) (Intermediate!3115 (undefined!3927 Bool) (index!14638 (_ BitVec 32)) (x!32914 (_ BitVec 32))) (Undefined!3115) (MissingVacant!3115 (index!14639 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16883 (_ BitVec 32)) SeekEntryResult!3115)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!330506 (= c!51823 (is-Intermediate!3115 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k!2497 a!3305 mask!3777)))))

(declare-fun e!202859 () Unit!10295)

(declare-fun Unit!10297 () Unit!10295)

(assert (=> b!330506 (= e!202859 Unit!10297)))

(declare-fun b!330507 () Bool)

(declare-fun Unit!10298 () Unit!10295)

(assert (=> b!330507 (= e!202861 Unit!10298)))

(declare-fun b!330508 () Bool)

(declare-fun res!182154 () Bool)

(declare-fun e!202856 () Bool)

(assert (=> b!330508 (=> (not res!182154) (not e!202856))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!330508 (= res!182154 (validKeyInArray!0 k!2497))))

(declare-fun b!330509 () Bool)

(declare-fun e!202858 () Unit!10295)

(declare-fun Unit!10299 () Unit!10295)

(assert (=> b!330509 (= e!202858 Unit!10299)))

(declare-fun b!330510 () Bool)

(declare-fun res!182149 () Bool)

(declare-fun e!202860 () Bool)

(assert (=> b!330510 (=> (not res!182149) (not e!202860))))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!330510 (= res!182149 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7984 a!3305) index!1840) k!2497)) (= x!1490 resX!58)))))

(declare-fun b!330511 () Bool)

(declare-fun res!182148 () Bool)

(assert (=> b!330511 (=> (not res!182148) (not e!202856))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16883 (_ BitVec 32)) SeekEntryResult!3115)

(assert (=> b!330511 (= res!182148 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3115 i!1250)))))

(declare-fun b!330512 () Bool)

(assert (=> b!330512 (= e!202856 e!202860)))

(declare-fun res!182146 () Bool)

(assert (=> b!330512 (=> (not res!182146) (not e!202860))))

(declare-fun lt!158524 () SeekEntryResult!3115)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!330512 (= res!182146 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!158524))))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!330512 (= lt!158524 (Intermediate!3115 false resIndex!58 resX!58))))

(declare-fun b!330514 () Bool)

(declare-fun res!182151 () Bool)

(assert (=> b!330514 (=> (not res!182151) (not e!202860))))

(assert (=> b!330514 (= res!182151 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!158524))))

(declare-fun b!330515 () Bool)

(assert (=> b!330515 (= e!202858 e!202859)))

(declare-fun c!51825 () Bool)

(assert (=> b!330515 (= c!51825 (or (= (select (arr!7984 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7984 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!330516 () Bool)

(assert (=> b!330516 false))

(declare-fun Unit!10300 () Unit!10295)

(assert (=> b!330516 (= e!202859 Unit!10300)))

(declare-fun b!330517 () Bool)

(declare-fun res!182145 () Bool)

(assert (=> b!330517 (=> (not res!182145) (not e!202856))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16883 (_ BitVec 32)) Bool)

(assert (=> b!330517 (= res!182145 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun res!182153 () Bool)

(assert (=> start!33224 (=> (not res!182153) (not e!202856))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33224 (= res!182153 (validMask!0 mask!3777))))

(assert (=> start!33224 e!202856))

(declare-fun array_inv!5947 (array!16883) Bool)

(assert (=> start!33224 (array_inv!5947 a!3305)))

(assert (=> start!33224 true))

(declare-fun b!330513 () Bool)

(declare-fun res!182152 () Bool)

(assert (=> b!330513 (=> (not res!182152) (not e!202856))))

(declare-fun arrayContainsKey!0 (array!16883 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!330513 (= res!182152 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!330518 () Bool)

(assert (=> b!330518 (= e!202860 (not true))))

(assert (=> b!330518 (= index!1840 resIndex!58)))

(declare-fun lt!158525 () Unit!10295)

(assert (=> b!330518 (= lt!158525 e!202858)))

(declare-fun c!51824 () Bool)

(assert (=> b!330518 (= c!51824 (not (= resIndex!58 index!1840)))))

(declare-fun b!330519 () Bool)

(declare-fun res!182147 () Bool)

(assert (=> b!330519 (=> (not res!182147) (not e!202860))))

(assert (=> b!330519 (= res!182147 (and (= (select (arr!7984 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8336 a!3305))))))

(declare-fun b!330520 () Bool)

(declare-fun res!182150 () Bool)

(assert (=> b!330520 (=> (not res!182150) (not e!202856))))

(assert (=> b!330520 (= res!182150 (and (= (size!8336 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8336 a!3305))))))

(declare-fun b!330521 () Bool)

(declare-fun Unit!10301 () Unit!10295)

(assert (=> b!330521 (= e!202861 Unit!10301)))

(assert (=> b!330521 false))

(assert (= (and start!33224 res!182153) b!330520))

(assert (= (and b!330520 res!182150) b!330508))

(assert (= (and b!330508 res!182154) b!330513))

(assert (= (and b!330513 res!182152) b!330511))

(assert (= (and b!330511 res!182148) b!330517))

(assert (= (and b!330517 res!182145) b!330512))

(assert (= (and b!330512 res!182146) b!330519))

(assert (= (and b!330519 res!182147) b!330514))

(assert (= (and b!330514 res!182151) b!330510))

(assert (= (and b!330510 res!182149) b!330518))

(assert (= (and b!330518 c!51824) b!330515))

(assert (= (and b!330518 (not c!51824)) b!330509))

(assert (= (and b!330515 c!51825) b!330516))

(assert (= (and b!330515 (not c!51825)) b!330506))

(assert (= (and b!330506 c!51823) b!330507))

(assert (= (and b!330506 (not c!51823)) b!330521))

(declare-fun m!335709 () Bool)

(assert (=> b!330519 m!335709))

(declare-fun m!335711 () Bool)

(assert (=> start!33224 m!335711))

(declare-fun m!335713 () Bool)

(assert (=> start!33224 m!335713))

(declare-fun m!335715 () Bool)

(assert (=> b!330515 m!335715))

(declare-fun m!335717 () Bool)

(assert (=> b!330511 m!335717))

(declare-fun m!335719 () Bool)

(assert (=> b!330508 m!335719))

(declare-fun m!335721 () Bool)

(assert (=> b!330512 m!335721))

(assert (=> b!330512 m!335721))

(declare-fun m!335723 () Bool)

(assert (=> b!330512 m!335723))

(declare-fun m!335725 () Bool)

(assert (=> b!330506 m!335725))

(assert (=> b!330506 m!335725))

(declare-fun m!335727 () Bool)

(assert (=> b!330506 m!335727))

(declare-fun m!335729 () Bool)

(assert (=> b!330514 m!335729))

(assert (=> b!330510 m!335715))

(declare-fun m!335731 () Bool)

(assert (=> b!330517 m!335731))

(declare-fun m!335733 () Bool)

(assert (=> b!330513 m!335733))

(push 1)

(assert (not start!33224))

(assert (not b!330514))

(assert (not b!330508))

(assert (not b!330511))

(assert (not b!330512))

(assert (not b!330506))

(assert (not b!330517))

(assert (not b!330513))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

