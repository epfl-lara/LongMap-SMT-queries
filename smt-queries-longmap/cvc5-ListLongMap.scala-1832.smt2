; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33202 () Bool)

(assert start!33202)

(declare-fun b!329978 () Bool)

(declare-datatypes ((Unit!10218 0))(
  ( (Unit!10219) )
))
(declare-fun e!202663 () Unit!10218)

(declare-fun Unit!10220 () Unit!10218)

(assert (=> b!329978 (= e!202663 Unit!10220)))

(declare-fun b!329979 () Bool)

(declare-fun res!181824 () Bool)

(declare-fun e!202658 () Bool)

(assert (=> b!329979 (=> (not res!181824) (not e!202658))))

(declare-datatypes ((array!16861 0))(
  ( (array!16862 (arr!7973 (Array (_ BitVec 32) (_ BitVec 64))) (size!8325 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16861)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!329979 (= res!181824 (and (= (size!8325 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8325 a!3305))))))

(declare-fun b!329980 () Bool)

(declare-fun res!181815 () Bool)

(assert (=> b!329980 (=> (not res!181815) (not e!202658))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16861 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!329980 (= res!181815 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!329981 () Bool)

(declare-fun Unit!10221 () Unit!10218)

(assert (=> b!329981 (= e!202663 Unit!10221)))

(assert (=> b!329981 false))

(declare-fun b!329983 () Bool)

(declare-fun res!181823 () Bool)

(declare-fun e!202659 () Bool)

(assert (=> b!329983 (=> (not res!181823) (not e!202659))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3104 0))(
  ( (MissingZero!3104 (index!14592 (_ BitVec 32))) (Found!3104 (index!14593 (_ BitVec 32))) (Intermediate!3104 (undefined!3916 Bool) (index!14594 (_ BitVec 32)) (x!32879 (_ BitVec 32))) (Undefined!3104) (MissingVacant!3104 (index!14595 (_ BitVec 32))) )
))
(declare-fun lt!158425 () SeekEntryResult!3104)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16861 (_ BitVec 32)) SeekEntryResult!3104)

(assert (=> b!329983 (= res!181823 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!158425))))

(declare-fun b!329984 () Bool)

(declare-fun res!181817 () Bool)

(assert (=> b!329984 (=> (not res!181817) (not e!202659))))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!329984 (= res!181817 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7973 a!3305) index!1840) k!2497)) (= x!1490 resX!58)))))

(declare-fun b!329985 () Bool)

(declare-fun res!181820 () Bool)

(assert (=> b!329985 (=> (not res!181820) (not e!202658))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16861 (_ BitVec 32)) SeekEntryResult!3104)

(assert (=> b!329985 (= res!181820 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3104 i!1250)))))

(declare-fun b!329986 () Bool)

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!329986 (= e!202659 (not (= index!1840 resIndex!58)))))

(declare-fun lt!158427 () Unit!10218)

(declare-fun e!202661 () Unit!10218)

(assert (=> b!329986 (= lt!158427 e!202661)))

(declare-fun c!51726 () Bool)

(assert (=> b!329986 (= c!51726 (not (= resIndex!58 index!1840)))))

(declare-fun b!329982 () Bool)

(declare-fun res!181821 () Bool)

(assert (=> b!329982 (=> (not res!181821) (not e!202659))))

(assert (=> b!329982 (= res!181821 (and (= (select (arr!7973 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8325 a!3305))))))

(declare-fun res!181818 () Bool)

(assert (=> start!33202 (=> (not res!181818) (not e!202658))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33202 (= res!181818 (validMask!0 mask!3777))))

(assert (=> start!33202 e!202658))

(declare-fun array_inv!5936 (array!16861) Bool)

(assert (=> start!33202 (array_inv!5936 a!3305)))

(assert (=> start!33202 true))

(declare-fun b!329987 () Bool)

(declare-fun e!202660 () Unit!10218)

(assert (=> b!329987 (= e!202661 e!202660)))

(declare-fun c!51725 () Bool)

(assert (=> b!329987 (= c!51725 (or (= (select (arr!7973 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7973 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!329988 () Bool)

(declare-fun res!181816 () Bool)

(assert (=> b!329988 (=> (not res!181816) (not e!202658))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16861 (_ BitVec 32)) Bool)

(assert (=> b!329988 (= res!181816 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!329989 () Bool)

(assert (=> b!329989 false))

(declare-fun lt!158426 () Unit!10218)

(assert (=> b!329989 (= lt!158426 e!202663)))

(declare-fun c!51724 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!329989 (= c!51724 (is-Intermediate!3104 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k!2497 a!3305 mask!3777)))))

(declare-fun Unit!10222 () Unit!10218)

(assert (=> b!329989 (= e!202660 Unit!10222)))

(declare-fun b!329990 () Bool)

(assert (=> b!329990 (= e!202658 e!202659)))

(declare-fun res!181819 () Bool)

(assert (=> b!329990 (=> (not res!181819) (not e!202659))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!329990 (= res!181819 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!158425))))

(assert (=> b!329990 (= lt!158425 (Intermediate!3104 false resIndex!58 resX!58))))

(declare-fun b!329991 () Bool)

(assert (=> b!329991 false))

(declare-fun Unit!10223 () Unit!10218)

(assert (=> b!329991 (= e!202660 Unit!10223)))

(declare-fun b!329992 () Bool)

(declare-fun Unit!10224 () Unit!10218)

(assert (=> b!329992 (= e!202661 Unit!10224)))

(declare-fun b!329993 () Bool)

(declare-fun res!181822 () Bool)

(assert (=> b!329993 (=> (not res!181822) (not e!202658))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!329993 (= res!181822 (validKeyInArray!0 k!2497))))

(assert (= (and start!33202 res!181818) b!329979))

(assert (= (and b!329979 res!181824) b!329993))

(assert (= (and b!329993 res!181822) b!329980))

(assert (= (and b!329980 res!181815) b!329985))

(assert (= (and b!329985 res!181820) b!329988))

(assert (= (and b!329988 res!181816) b!329990))

(assert (= (and b!329990 res!181819) b!329982))

(assert (= (and b!329982 res!181821) b!329983))

(assert (= (and b!329983 res!181823) b!329984))

(assert (= (and b!329984 res!181817) b!329986))

(assert (= (and b!329986 c!51726) b!329987))

(assert (= (and b!329986 (not c!51726)) b!329992))

(assert (= (and b!329987 c!51725) b!329991))

(assert (= (and b!329987 (not c!51725)) b!329989))

(assert (= (and b!329989 c!51724) b!329978))

(assert (= (and b!329989 (not c!51724)) b!329981))

(declare-fun m!335423 () Bool)

(assert (=> b!329983 m!335423))

(declare-fun m!335425 () Bool)

(assert (=> b!329989 m!335425))

(assert (=> b!329989 m!335425))

(declare-fun m!335427 () Bool)

(assert (=> b!329989 m!335427))

(declare-fun m!335429 () Bool)

(assert (=> b!329980 m!335429))

(declare-fun m!335431 () Bool)

(assert (=> b!329985 m!335431))

(declare-fun m!335433 () Bool)

(assert (=> b!329984 m!335433))

(declare-fun m!335435 () Bool)

(assert (=> b!329990 m!335435))

(assert (=> b!329990 m!335435))

(declare-fun m!335437 () Bool)

(assert (=> b!329990 m!335437))

(declare-fun m!335439 () Bool)

(assert (=> b!329993 m!335439))

(assert (=> b!329987 m!335433))

(declare-fun m!335441 () Bool)

(assert (=> b!329988 m!335441))

(declare-fun m!335443 () Bool)

(assert (=> b!329982 m!335443))

(declare-fun m!335445 () Bool)

(assert (=> start!33202 m!335445))

(declare-fun m!335447 () Bool)

(assert (=> start!33202 m!335447))

(push 1)

