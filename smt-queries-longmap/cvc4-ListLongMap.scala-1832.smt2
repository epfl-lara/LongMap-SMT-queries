; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33206 () Bool)

(assert start!33206)

(declare-fun b!330074 () Bool)

(declare-fun e!202694 () Bool)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!330074 (= e!202694 (not (= index!1840 resIndex!58)))))

(declare-datatypes ((Unit!10232 0))(
  ( (Unit!10233) )
))
(declare-fun lt!158444 () Unit!10232)

(declare-fun e!202697 () Unit!10232)

(assert (=> b!330074 (= lt!158444 e!202697)))

(declare-fun c!51743 () Bool)

(assert (=> b!330074 (= c!51743 (not (= resIndex!58 index!1840)))))

(declare-fun b!330075 () Bool)

(declare-fun res!181883 () Bool)

(assert (=> b!330075 (=> (not res!181883) (not e!202694))))

(declare-datatypes ((array!16865 0))(
  ( (array!16866 (arr!7975 (Array (_ BitVec 32) (_ BitVec 64))) (size!8327 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16865)

(declare-datatypes ((SeekEntryResult!3106 0))(
  ( (MissingZero!3106 (index!14600 (_ BitVec 32))) (Found!3106 (index!14601 (_ BitVec 32))) (Intermediate!3106 (undefined!3918 Bool) (index!14602 (_ BitVec 32)) (x!32881 (_ BitVec 32))) (Undefined!3106) (MissingVacant!3106 (index!14603 (_ BitVec 32))) )
))
(declare-fun lt!158445 () SeekEntryResult!3106)

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16865 (_ BitVec 32)) SeekEntryResult!3106)

(assert (=> b!330075 (= res!181883 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!158445))))

(declare-fun b!330076 () Bool)

(declare-fun res!181875 () Bool)

(declare-fun e!202696 () Bool)

(assert (=> b!330076 (=> (not res!181875) (not e!202696))))

(declare-fun arrayContainsKey!0 (array!16865 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!330076 (= res!181875 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun res!181877 () Bool)

(assert (=> start!33206 (=> (not res!181877) (not e!202696))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33206 (= res!181877 (validMask!0 mask!3777))))

(assert (=> start!33206 e!202696))

(declare-fun array_inv!5938 (array!16865) Bool)

(assert (=> start!33206 (array_inv!5938 a!3305)))

(assert (=> start!33206 true))

(declare-fun b!330077 () Bool)

(declare-fun res!181884 () Bool)

(assert (=> b!330077 (=> (not res!181884) (not e!202694))))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!330077 (= res!181884 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7975 a!3305) index!1840) k!2497)) (= x!1490 resX!58)))))

(declare-fun b!330078 () Bool)

(declare-fun e!202695 () Unit!10232)

(declare-fun Unit!10234 () Unit!10232)

(assert (=> b!330078 (= e!202695 Unit!10234)))

(declare-fun b!330079 () Bool)

(declare-fun Unit!10235 () Unit!10232)

(assert (=> b!330079 (= e!202695 Unit!10235)))

(assert (=> b!330079 false))

(declare-fun b!330080 () Bool)

(assert (=> b!330080 false))

(declare-fun e!202698 () Unit!10232)

(declare-fun Unit!10236 () Unit!10232)

(assert (=> b!330080 (= e!202698 Unit!10236)))

(declare-fun b!330081 () Bool)

(declare-fun res!181879 () Bool)

(assert (=> b!330081 (=> (not res!181879) (not e!202696))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!330081 (= res!181879 (validKeyInArray!0 k!2497))))

(declare-fun b!330082 () Bool)

(declare-fun res!181876 () Bool)

(assert (=> b!330082 (=> (not res!181876) (not e!202696))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16865 (_ BitVec 32)) Bool)

(assert (=> b!330082 (= res!181876 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!330083 () Bool)

(declare-fun res!181878 () Bool)

(assert (=> b!330083 (=> (not res!181878) (not e!202694))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!330083 (= res!181878 (and (= (select (arr!7975 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8327 a!3305))))))

(declare-fun b!330084 () Bool)

(declare-fun res!181880 () Bool)

(assert (=> b!330084 (=> (not res!181880) (not e!202696))))

(assert (=> b!330084 (= res!181880 (and (= (size!8327 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8327 a!3305))))))

(declare-fun b!330085 () Bool)

(assert (=> b!330085 false))

(declare-fun lt!158443 () Unit!10232)

(assert (=> b!330085 (= lt!158443 e!202695)))

(declare-fun c!51744 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!330085 (= c!51744 (is-Intermediate!3106 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k!2497 a!3305 mask!3777)))))

(declare-fun Unit!10237 () Unit!10232)

(assert (=> b!330085 (= e!202698 Unit!10237)))

(declare-fun b!330086 () Bool)

(assert (=> b!330086 (= e!202696 e!202694)))

(declare-fun res!181882 () Bool)

(assert (=> b!330086 (=> (not res!181882) (not e!202694))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!330086 (= res!181882 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!158445))))

(assert (=> b!330086 (= lt!158445 (Intermediate!3106 false resIndex!58 resX!58))))

(declare-fun b!330087 () Bool)

(declare-fun Unit!10238 () Unit!10232)

(assert (=> b!330087 (= e!202697 Unit!10238)))

(declare-fun b!330088 () Bool)

(assert (=> b!330088 (= e!202697 e!202698)))

(declare-fun c!51742 () Bool)

(assert (=> b!330088 (= c!51742 (or (= (select (arr!7975 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7975 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!330089 () Bool)

(declare-fun res!181881 () Bool)

(assert (=> b!330089 (=> (not res!181881) (not e!202696))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16865 (_ BitVec 32)) SeekEntryResult!3106)

(assert (=> b!330089 (= res!181881 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3106 i!1250)))))

(assert (= (and start!33206 res!181877) b!330084))

(assert (= (and b!330084 res!181880) b!330081))

(assert (= (and b!330081 res!181879) b!330076))

(assert (= (and b!330076 res!181875) b!330089))

(assert (= (and b!330089 res!181881) b!330082))

(assert (= (and b!330082 res!181876) b!330086))

(assert (= (and b!330086 res!181882) b!330083))

(assert (= (and b!330083 res!181878) b!330075))

(assert (= (and b!330075 res!181883) b!330077))

(assert (= (and b!330077 res!181884) b!330074))

(assert (= (and b!330074 c!51743) b!330088))

(assert (= (and b!330074 (not c!51743)) b!330087))

(assert (= (and b!330088 c!51742) b!330080))

(assert (= (and b!330088 (not c!51742)) b!330085))

(assert (= (and b!330085 c!51744) b!330078))

(assert (= (and b!330085 (not c!51744)) b!330079))

(declare-fun m!335475 () Bool)

(assert (=> b!330089 m!335475))

(declare-fun m!335477 () Bool)

(assert (=> b!330088 m!335477))

(declare-fun m!335479 () Bool)

(assert (=> b!330083 m!335479))

(declare-fun m!335481 () Bool)

(assert (=> b!330082 m!335481))

(declare-fun m!335483 () Bool)

(assert (=> b!330076 m!335483))

(declare-fun m!335485 () Bool)

(assert (=> b!330081 m!335485))

(declare-fun m!335487 () Bool)

(assert (=> b!330086 m!335487))

(assert (=> b!330086 m!335487))

(declare-fun m!335489 () Bool)

(assert (=> b!330086 m!335489))

(declare-fun m!335491 () Bool)

(assert (=> start!33206 m!335491))

(declare-fun m!335493 () Bool)

(assert (=> start!33206 m!335493))

(declare-fun m!335495 () Bool)

(assert (=> b!330075 m!335495))

(declare-fun m!335497 () Bool)

(assert (=> b!330085 m!335497))

(assert (=> b!330085 m!335497))

(declare-fun m!335499 () Bool)

(assert (=> b!330085 m!335499))

(assert (=> b!330077 m!335477))

(push 1)

(assert (not b!330089))

(assert (not b!330082))

(assert (not b!330081))

(assert (not b!330085))

