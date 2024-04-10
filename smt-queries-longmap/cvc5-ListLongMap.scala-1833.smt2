; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33208 () Bool)

(assert start!33208)

(declare-fun b!330122 () Bool)

(declare-fun res!181910 () Bool)

(declare-fun e!202712 () Bool)

(assert (=> b!330122 (=> (not res!181910) (not e!202712))))

(declare-datatypes ((array!16867 0))(
  ( (array!16868 (arr!7976 (Array (_ BitVec 32) (_ BitVec 64))) (size!8328 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16867)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16867 (_ BitVec 32)) Bool)

(assert (=> b!330122 (= res!181910 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!330123 () Bool)

(declare-fun e!202717 () Bool)

(assert (=> b!330123 (= e!202712 e!202717)))

(declare-fun res!181912 () Bool)

(assert (=> b!330123 (=> (not res!181912) (not e!202717))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3107 0))(
  ( (MissingZero!3107 (index!14604 (_ BitVec 32))) (Found!3107 (index!14605 (_ BitVec 32))) (Intermediate!3107 (undefined!3919 Bool) (index!14606 (_ BitVec 32)) (x!32890 (_ BitVec 32))) (Undefined!3107) (MissingVacant!3107 (index!14607 (_ BitVec 32))) )
))
(declare-fun lt!158454 () SeekEntryResult!3107)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16867 (_ BitVec 32)) SeekEntryResult!3107)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!330123 (= res!181912 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!158454))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!330123 (= lt!158454 (Intermediate!3107 false resIndex!58 resX!58))))

(declare-fun b!330124 () Bool)

(declare-datatypes ((Unit!10239 0))(
  ( (Unit!10240) )
))
(declare-fun e!202716 () Unit!10239)

(declare-fun Unit!10241 () Unit!10239)

(assert (=> b!330124 (= e!202716 Unit!10241)))

(declare-fun b!330126 () Bool)

(declare-fun res!181907 () Bool)

(assert (=> b!330126 (=> (not res!181907) (not e!202712))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!330126 (= res!181907 (and (= (size!8328 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8328 a!3305))))))

(declare-fun b!330127 () Bool)

(declare-fun e!202715 () Unit!10239)

(declare-fun Unit!10242 () Unit!10239)

(assert (=> b!330127 (= e!202715 Unit!10242)))

(assert (=> b!330127 false))

(declare-fun b!330128 () Bool)

(declare-fun res!181914 () Bool)

(assert (=> b!330128 (=> (not res!181914) (not e!202712))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16867 (_ BitVec 32)) SeekEntryResult!3107)

(assert (=> b!330128 (= res!181914 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3107 i!1250)))))

(declare-fun b!330129 () Bool)

(declare-fun res!181908 () Bool)

(assert (=> b!330129 (=> (not res!181908) (not e!202717))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!330129 (= res!181908 (and (= (select (arr!7976 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8328 a!3305))))))

(declare-fun b!330130 () Bool)

(declare-fun e!202714 () Unit!10239)

(assert (=> b!330130 (= e!202716 e!202714)))

(declare-fun c!51753 () Bool)

(assert (=> b!330130 (= c!51753 (or (= (select (arr!7976 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7976 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!330131 () Bool)

(assert (=> b!330131 false))

(declare-fun lt!158453 () Unit!10239)

(assert (=> b!330131 (= lt!158453 e!202715)))

(declare-fun c!51751 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!330131 (= c!51751 (is-Intermediate!3107 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k!2497 a!3305 mask!3777)))))

(declare-fun Unit!10243 () Unit!10239)

(assert (=> b!330131 (= e!202714 Unit!10243)))

(declare-fun b!330132 () Bool)

(declare-fun res!181906 () Bool)

(assert (=> b!330132 (=> (not res!181906) (not e!202712))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!330132 (= res!181906 (validKeyInArray!0 k!2497))))

(declare-fun b!330133 () Bool)

(assert (=> b!330133 false))

(declare-fun Unit!10244 () Unit!10239)

(assert (=> b!330133 (= e!202714 Unit!10244)))

(declare-fun b!330134 () Bool)

(declare-fun res!181909 () Bool)

(assert (=> b!330134 (=> (not res!181909) (not e!202712))))

(declare-fun arrayContainsKey!0 (array!16867 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!330134 (= res!181909 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!330135 () Bool)

(assert (=> b!330135 (= e!202717 (not true))))

(assert (=> b!330135 (= index!1840 resIndex!58)))

(declare-fun lt!158452 () Unit!10239)

(assert (=> b!330135 (= lt!158452 e!202716)))

(declare-fun c!51752 () Bool)

(assert (=> b!330135 (= c!51752 (not (= resIndex!58 index!1840)))))

(declare-fun b!330125 () Bool)

(declare-fun res!181905 () Bool)

(assert (=> b!330125 (=> (not res!181905) (not e!202717))))

(assert (=> b!330125 (= res!181905 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!158454))))

(declare-fun res!181913 () Bool)

(assert (=> start!33208 (=> (not res!181913) (not e!202712))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33208 (= res!181913 (validMask!0 mask!3777))))

(assert (=> start!33208 e!202712))

(declare-fun array_inv!5939 (array!16867) Bool)

(assert (=> start!33208 (array_inv!5939 a!3305)))

(assert (=> start!33208 true))

(declare-fun b!330136 () Bool)

(declare-fun Unit!10245 () Unit!10239)

(assert (=> b!330136 (= e!202715 Unit!10245)))

(declare-fun b!330137 () Bool)

(declare-fun res!181911 () Bool)

(assert (=> b!330137 (=> (not res!181911) (not e!202717))))

(assert (=> b!330137 (= res!181911 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7976 a!3305) index!1840) k!2497)) (= x!1490 resX!58)))))

(assert (= (and start!33208 res!181913) b!330126))

(assert (= (and b!330126 res!181907) b!330132))

(assert (= (and b!330132 res!181906) b!330134))

(assert (= (and b!330134 res!181909) b!330128))

(assert (= (and b!330128 res!181914) b!330122))

(assert (= (and b!330122 res!181910) b!330123))

(assert (= (and b!330123 res!181912) b!330129))

(assert (= (and b!330129 res!181908) b!330125))

(assert (= (and b!330125 res!181905) b!330137))

(assert (= (and b!330137 res!181911) b!330135))

(assert (= (and b!330135 c!51752) b!330130))

(assert (= (and b!330135 (not c!51752)) b!330124))

(assert (= (and b!330130 c!51753) b!330133))

(assert (= (and b!330130 (not c!51753)) b!330131))

(assert (= (and b!330131 c!51751) b!330136))

(assert (= (and b!330131 (not c!51751)) b!330127))

(declare-fun m!335501 () Bool)

(assert (=> b!330128 m!335501))

(declare-fun m!335503 () Bool)

(assert (=> b!330137 m!335503))

(declare-fun m!335505 () Bool)

(assert (=> b!330125 m!335505))

(declare-fun m!335507 () Bool)

(assert (=> b!330123 m!335507))

(assert (=> b!330123 m!335507))

(declare-fun m!335509 () Bool)

(assert (=> b!330123 m!335509))

(declare-fun m!335511 () Bool)

(assert (=> b!330132 m!335511))

(declare-fun m!335513 () Bool)

(assert (=> b!330129 m!335513))

(declare-fun m!335515 () Bool)

(assert (=> b!330122 m!335515))

(declare-fun m!335517 () Bool)

(assert (=> b!330131 m!335517))

(assert (=> b!330131 m!335517))

(declare-fun m!335519 () Bool)

(assert (=> b!330131 m!335519))

(declare-fun m!335521 () Bool)

(assert (=> start!33208 m!335521))

(declare-fun m!335523 () Bool)

(assert (=> start!33208 m!335523))

(assert (=> b!330130 m!335503))

(declare-fun m!335525 () Bool)

(assert (=> b!330134 m!335525))

(push 1)

