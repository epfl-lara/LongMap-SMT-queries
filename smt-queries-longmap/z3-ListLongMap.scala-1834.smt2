; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33200 () Bool)

(assert start!33200)

(declare-fun b!330213 () Bool)

(declare-fun res!181994 () Bool)

(declare-fun e!202734 () Bool)

(assert (=> b!330213 (=> (not res!181994) (not e!202734))))

(declare-datatypes ((array!16872 0))(
  ( (array!16873 (arr!7978 (Array (_ BitVec 32) (_ BitVec 64))) (size!8330 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16872)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!330213 (= res!181994 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7978 a!3305) index!1840) k0!2497)) (= x!1490 resX!58)))))

(declare-fun b!330214 () Bool)

(declare-fun e!202732 () Bool)

(assert (=> b!330214 (= e!202732 e!202734)))

(declare-fun res!181997 () Bool)

(assert (=> b!330214 (=> (not res!181997) (not e!202734))))

(declare-datatypes ((SeekEntryResult!3074 0))(
  ( (MissingZero!3074 (index!14472 (_ BitVec 32))) (Found!3074 (index!14473 (_ BitVec 32))) (Intermediate!3074 (undefined!3886 Bool) (index!14474 (_ BitVec 32)) (x!32862 (_ BitVec 32))) (Undefined!3074) (MissingVacant!3074 (index!14475 (_ BitVec 32))) )
))
(declare-fun lt!158497 () SeekEntryResult!3074)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16872 (_ BitVec 32)) SeekEntryResult!3074)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!330214 (= res!181997 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!158497))))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!330214 (= lt!158497 (Intermediate!3074 false resIndex!58 resX!58))))

(declare-fun b!330215 () Bool)

(declare-fun res!181999 () Bool)

(assert (=> b!330215 (=> (not res!181999) (not e!202732))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!330215 (= res!181999 (validKeyInArray!0 k0!2497))))

(declare-fun b!330216 () Bool)

(declare-fun res!181993 () Bool)

(assert (=> b!330216 (=> (not res!181993) (not e!202734))))

(assert (=> b!330216 (= res!181993 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!158497))))

(declare-fun b!330218 () Bool)

(declare-datatypes ((Unit!10228 0))(
  ( (Unit!10229) )
))
(declare-fun e!202733 () Unit!10228)

(declare-fun Unit!10230 () Unit!10228)

(assert (=> b!330218 (= e!202733 Unit!10230)))

(declare-fun b!330219 () Bool)

(declare-fun res!181998 () Bool)

(assert (=> b!330219 (=> (not res!181998) (not e!202732))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!330219 (= res!181998 (and (= (size!8330 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8330 a!3305))))))

(declare-fun b!330220 () Bool)

(assert (=> b!330220 (= e!202734 (not (= (select (arr!7978 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!330220 (= index!1840 resIndex!58)))

(declare-fun lt!158498 () Unit!10228)

(assert (=> b!330220 (= lt!158498 e!202733)))

(declare-fun c!51753 () Bool)

(assert (=> b!330220 (= c!51753 (not (= resIndex!58 index!1840)))))

(declare-fun b!330221 () Bool)

(declare-fun res!182000 () Bool)

(assert (=> b!330221 (=> (not res!182000) (not e!202732))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16872 (_ BitVec 32)) Bool)

(assert (=> b!330221 (= res!182000 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!330222 () Bool)

(declare-fun res!181996 () Bool)

(assert (=> b!330222 (=> (not res!181996) (not e!202734))))

(assert (=> b!330222 (= res!181996 (and (= (select (arr!7978 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8330 a!3305))))))

(declare-fun b!330223 () Bool)

(declare-fun res!182001 () Bool)

(assert (=> b!330223 (=> (not res!182001) (not e!202732))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16872 (_ BitVec 32)) SeekEntryResult!3074)

(assert (=> b!330223 (= res!182001 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3074 i!1250)))))

(declare-fun b!330224 () Bool)

(assert (=> b!330224 false))

(declare-fun lt!158499 () Unit!10228)

(declare-fun e!202737 () Unit!10228)

(assert (=> b!330224 (= lt!158499 e!202737)))

(declare-fun c!51755 () Bool)

(get-info :version)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!330224 (= c!51755 ((_ is Intermediate!3074) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) k0!2497 a!3305 mask!3777)))))

(declare-fun e!202736 () Unit!10228)

(declare-fun Unit!10231 () Unit!10228)

(assert (=> b!330224 (= e!202736 Unit!10231)))

(declare-fun res!181995 () Bool)

(assert (=> start!33200 (=> (not res!181995) (not e!202732))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33200 (= res!181995 (validMask!0 mask!3777))))

(assert (=> start!33200 e!202732))

(declare-fun array_inv!5928 (array!16872) Bool)

(assert (=> start!33200 (array_inv!5928 a!3305)))

(assert (=> start!33200 true))

(declare-fun b!330217 () Bool)

(declare-fun res!181992 () Bool)

(assert (=> b!330217 (=> (not res!181992) (not e!202732))))

(declare-fun arrayContainsKey!0 (array!16872 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!330217 (= res!181992 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!330225 () Bool)

(assert (=> b!330225 false))

(declare-fun Unit!10232 () Unit!10228)

(assert (=> b!330225 (= e!202736 Unit!10232)))

(declare-fun b!330226 () Bool)

(declare-fun Unit!10233 () Unit!10228)

(assert (=> b!330226 (= e!202737 Unit!10233)))

(declare-fun b!330227 () Bool)

(assert (=> b!330227 (= e!202733 e!202736)))

(declare-fun c!51754 () Bool)

(assert (=> b!330227 (= c!51754 (or (= (select (arr!7978 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7978 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!330228 () Bool)

(declare-fun Unit!10234 () Unit!10228)

(assert (=> b!330228 (= e!202737 Unit!10234)))

(assert (=> b!330228 false))

(assert (= (and start!33200 res!181995) b!330219))

(assert (= (and b!330219 res!181998) b!330215))

(assert (= (and b!330215 res!181999) b!330217))

(assert (= (and b!330217 res!181992) b!330223))

(assert (= (and b!330223 res!182001) b!330221))

(assert (= (and b!330221 res!182000) b!330214))

(assert (= (and b!330214 res!181997) b!330222))

(assert (= (and b!330222 res!181996) b!330216))

(assert (= (and b!330216 res!181993) b!330213))

(assert (= (and b!330213 res!181994) b!330220))

(assert (= (and b!330220 c!51753) b!330227))

(assert (= (and b!330220 (not c!51753)) b!330218))

(assert (= (and b!330227 c!51754) b!330225))

(assert (= (and b!330227 (not c!51754)) b!330224))

(assert (= (and b!330224 c!51755) b!330226))

(assert (= (and b!330224 (not c!51755)) b!330228))

(declare-fun m!335791 () Bool)

(assert (=> b!330227 m!335791))

(declare-fun m!335793 () Bool)

(assert (=> b!330221 m!335793))

(declare-fun m!335795 () Bool)

(assert (=> b!330216 m!335795))

(declare-fun m!335797 () Bool)

(assert (=> start!33200 m!335797))

(declare-fun m!335799 () Bool)

(assert (=> start!33200 m!335799))

(declare-fun m!335801 () Bool)

(assert (=> b!330217 m!335801))

(declare-fun m!335803 () Bool)

(assert (=> b!330214 m!335803))

(assert (=> b!330214 m!335803))

(declare-fun m!335805 () Bool)

(assert (=> b!330214 m!335805))

(declare-fun m!335807 () Bool)

(assert (=> b!330215 m!335807))

(assert (=> b!330213 m!335791))

(declare-fun m!335809 () Bool)

(assert (=> b!330223 m!335809))

(declare-fun m!335811 () Bool)

(assert (=> b!330222 m!335811))

(declare-fun m!335813 () Bool)

(assert (=> b!330224 m!335813))

(assert (=> b!330224 m!335813))

(declare-fun m!335815 () Bool)

(assert (=> b!330224 m!335815))

(assert (=> b!330220 m!335791))

(check-sat (not b!330215) (not start!33200) (not b!330214) (not b!330217) (not b!330221) (not b!330223) (not b!330216) (not b!330224))
(check-sat)
