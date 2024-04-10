; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32390 () Bool)

(assert start!32390)

(declare-fun b!322964 () Bool)

(declare-datatypes ((Unit!9934 0))(
  ( (Unit!9935) )
))
(declare-fun e!199754 () Unit!9934)

(declare-fun Unit!9936 () Unit!9934)

(assert (=> b!322964 (= e!199754 Unit!9936)))

(assert (=> b!322964 false))

(declare-fun b!322965 () Bool)

(declare-fun e!199758 () Bool)

(declare-fun e!199756 () Bool)

(assert (=> b!322965 (= e!199758 e!199756)))

(declare-fun res!176688 () Bool)

(assert (=> b!322965 (=> (not res!176688) (not e!199756))))

(declare-datatypes ((array!16529 0))(
  ( (array!16530 (arr!7822 (Array (_ BitVec 32) (_ BitVec 64))) (size!8174 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16529)

(declare-datatypes ((SeekEntryResult!2953 0))(
  ( (MissingZero!2953 (index!13988 (_ BitVec 32))) (Found!2953 (index!13989 (_ BitVec 32))) (Intermediate!2953 (undefined!3765 Bool) (index!13990 (_ BitVec 32)) (x!32245 (_ BitVec 32))) (Undefined!2953) (MissingVacant!2953 (index!13991 (_ BitVec 32))) )
))
(declare-fun lt!156548 () SeekEntryResult!2953)

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16529 (_ BitVec 32)) SeekEntryResult!2953)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!322965 (= res!176688 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156548))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!322965 (= lt!156548 (Intermediate!2953 false resIndex!58 resX!58))))

(declare-fun b!322966 () Bool)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!322966 (= e!199756 (not (or (not (= (select (arr!7822 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!3777 #b00000000000000000000000000000000) (bvsge index!1840 (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsle x!1490 #b01111111111111111111111111111110))))))

(assert (=> b!322966 (= index!1840 resIndex!58)))

(declare-fun lt!156547 () Unit!9934)

(declare-fun e!199755 () Unit!9934)

(assert (=> b!322966 (= lt!156547 e!199755)))

(declare-fun c!50770 () Bool)

(assert (=> b!322966 (= c!50770 (not (= resIndex!58 index!1840)))))

(declare-fun b!322968 () Bool)

(declare-fun res!176684 () Bool)

(assert (=> b!322968 (=> (not res!176684) (not e!199758))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16529 (_ BitVec 32)) SeekEntryResult!2953)

(assert (=> b!322968 (= res!176684 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2953 i!1250)))))

(declare-fun b!322969 () Bool)

(declare-fun Unit!9937 () Unit!9934)

(assert (=> b!322969 (= e!199754 Unit!9937)))

(declare-fun b!322970 () Bool)

(declare-fun res!176680 () Bool)

(assert (=> b!322970 (=> (not res!176680) (not e!199758))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!322970 (= res!176680 (validKeyInArray!0 k!2497))))

(declare-fun b!322971 () Bool)

(declare-fun Unit!9938 () Unit!9934)

(assert (=> b!322971 (= e!199755 Unit!9938)))

(declare-fun b!322972 () Bool)

(declare-fun e!199757 () Unit!9934)

(assert (=> b!322972 (= e!199755 e!199757)))

(declare-fun c!50771 () Bool)

(assert (=> b!322972 (= c!50771 (or (= (select (arr!7822 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7822 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!322973 () Bool)

(declare-fun res!176687 () Bool)

(assert (=> b!322973 (=> (not res!176687) (not e!199756))))

(assert (=> b!322973 (= res!176687 (and (= (select (arr!7822 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8174 a!3305))))))

(declare-fun b!322974 () Bool)

(assert (=> b!322974 false))

(declare-fun lt!156549 () Unit!9934)

(assert (=> b!322974 (= lt!156549 e!199754)))

(declare-fun c!50772 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!322974 (= c!50772 (is-Intermediate!2953 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k!2497 a!3305 mask!3777)))))

(declare-fun Unit!9939 () Unit!9934)

(assert (=> b!322974 (= e!199757 Unit!9939)))

(declare-fun b!322975 () Bool)

(declare-fun res!176682 () Bool)

(assert (=> b!322975 (=> (not res!176682) (not e!199756))))

(assert (=> b!322975 (= res!176682 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156548))))

(declare-fun b!322967 () Bool)

(declare-fun res!176681 () Bool)

(assert (=> b!322967 (=> (not res!176681) (not e!199758))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16529 (_ BitVec 32)) Bool)

(assert (=> b!322967 (= res!176681 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun res!176685 () Bool)

(assert (=> start!32390 (=> (not res!176685) (not e!199758))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32390 (= res!176685 (validMask!0 mask!3777))))

(assert (=> start!32390 e!199758))

(declare-fun array_inv!5785 (array!16529) Bool)

(assert (=> start!32390 (array_inv!5785 a!3305)))

(assert (=> start!32390 true))

(declare-fun b!322976 () Bool)

(assert (=> b!322976 false))

(declare-fun Unit!9940 () Unit!9934)

(assert (=> b!322976 (= e!199757 Unit!9940)))

(declare-fun b!322977 () Bool)

(declare-fun res!176686 () Bool)

(assert (=> b!322977 (=> (not res!176686) (not e!199756))))

(assert (=> b!322977 (= res!176686 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7822 a!3305) index!1840) k!2497)) (= x!1490 resX!58)))))

(declare-fun b!322978 () Bool)

(declare-fun res!176679 () Bool)

(assert (=> b!322978 (=> (not res!176679) (not e!199758))))

(declare-fun arrayContainsKey!0 (array!16529 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!322978 (= res!176679 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!322979 () Bool)

(declare-fun res!176683 () Bool)

(assert (=> b!322979 (=> (not res!176683) (not e!199758))))

(assert (=> b!322979 (= res!176683 (and (= (size!8174 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8174 a!3305))))))

(assert (= (and start!32390 res!176685) b!322979))

(assert (= (and b!322979 res!176683) b!322970))

(assert (= (and b!322970 res!176680) b!322978))

(assert (= (and b!322978 res!176679) b!322968))

(assert (= (and b!322968 res!176684) b!322967))

(assert (= (and b!322967 res!176681) b!322965))

(assert (= (and b!322965 res!176688) b!322973))

(assert (= (and b!322973 res!176687) b!322975))

(assert (= (and b!322975 res!176682) b!322977))

(assert (= (and b!322977 res!176686) b!322966))

(assert (= (and b!322966 c!50770) b!322972))

(assert (= (and b!322966 (not c!50770)) b!322971))

(assert (= (and b!322972 c!50771) b!322976))

(assert (= (and b!322972 (not c!50771)) b!322974))

(assert (= (and b!322974 c!50772) b!322969))

(assert (= (and b!322974 (not c!50772)) b!322964))

(declare-fun m!330561 () Bool)

(assert (=> b!322974 m!330561))

(assert (=> b!322974 m!330561))

(declare-fun m!330563 () Bool)

(assert (=> b!322974 m!330563))

(declare-fun m!330565 () Bool)

(assert (=> b!322972 m!330565))

(assert (=> b!322966 m!330565))

(declare-fun m!330567 () Bool)

(assert (=> b!322968 m!330567))

(declare-fun m!330569 () Bool)

(assert (=> b!322967 m!330569))

(assert (=> b!322977 m!330565))

(declare-fun m!330571 () Bool)

(assert (=> b!322978 m!330571))

(declare-fun m!330573 () Bool)

(assert (=> start!32390 m!330573))

(declare-fun m!330575 () Bool)

(assert (=> start!32390 m!330575))

(declare-fun m!330577 () Bool)

(assert (=> b!322965 m!330577))

(assert (=> b!322965 m!330577))

(declare-fun m!330579 () Bool)

(assert (=> b!322965 m!330579))

(declare-fun m!330581 () Bool)

(assert (=> b!322970 m!330581))

(declare-fun m!330583 () Bool)

(assert (=> b!322973 m!330583))

(declare-fun m!330585 () Bool)

(assert (=> b!322975 m!330585))

(push 1)

