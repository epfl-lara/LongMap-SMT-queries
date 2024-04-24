; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32370 () Bool)

(assert start!32370)

(declare-fun b!322767 () Bool)

(declare-fun e!199666 () Bool)

(declare-fun e!199670 () Bool)

(assert (=> b!322767 (= e!199666 e!199670)))

(declare-fun res!176594 () Bool)

(assert (=> b!322767 (=> (not res!176594) (not e!199670))))

(declare-datatypes ((array!16522 0))(
  ( (array!16523 (arr!7818 (Array (_ BitVec 32) (_ BitVec 64))) (size!8170 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16522)

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2914 0))(
  ( (MissingZero!2914 (index!13832 (_ BitVec 32))) (Found!2914 (index!13833 (_ BitVec 32))) (Intermediate!2914 (undefined!3726 Bool) (index!13834 (_ BitVec 32)) (x!32195 (_ BitVec 32))) (Undefined!2914) (MissingVacant!2914 (index!13835 (_ BitVec 32))) )
))
(declare-fun lt!156539 () SeekEntryResult!2914)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16522 (_ BitVec 32)) SeekEntryResult!2914)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!322767 (= res!176594 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156539))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!322767 (= lt!156539 (Intermediate!2914 false resIndex!58 resX!58))))

(declare-fun b!322768 () Bool)

(declare-fun res!176595 () Bool)

(assert (=> b!322768 (=> (not res!176595) (not e!199666))))

(declare-fun arrayContainsKey!0 (array!16522 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!322768 (= res!176595 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!322769 () Bool)

(assert (=> b!322769 false))

(declare-datatypes ((Unit!9875 0))(
  ( (Unit!9876) )
))
(declare-fun e!199667 () Unit!9875)

(declare-fun Unit!9877 () Unit!9875)

(assert (=> b!322769 (= e!199667 Unit!9877)))

(declare-fun b!322770 () Bool)

(assert (=> b!322770 false))

(declare-fun lt!156540 () Unit!9875)

(declare-fun e!199668 () Unit!9875)

(assert (=> b!322770 (= lt!156540 e!199668)))

(declare-fun c!50718 () Bool)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!322770 (= c!50718 (is-Intermediate!2914 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) k!2497 a!3305 mask!3777)))))

(declare-fun Unit!9878 () Unit!9875)

(assert (=> b!322770 (= e!199667 Unit!9878)))

(declare-fun b!322771 () Bool)

(declare-fun Unit!9879 () Unit!9875)

(assert (=> b!322771 (= e!199668 Unit!9879)))

(declare-fun res!176586 () Bool)

(assert (=> start!32370 (=> (not res!176586) (not e!199666))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32370 (= res!176586 (validMask!0 mask!3777))))

(assert (=> start!32370 e!199666))

(declare-fun array_inv!5768 (array!16522) Bool)

(assert (=> start!32370 (array_inv!5768 a!3305)))

(assert (=> start!32370 true))

(declare-fun b!322772 () Bool)

(declare-fun res!176589 () Bool)

(assert (=> b!322772 (=> (not res!176589) (not e!199666))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16522 (_ BitVec 32)) Bool)

(assert (=> b!322772 (= res!176589 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!322773 () Bool)

(declare-fun res!176592 () Bool)

(assert (=> b!322773 (=> (not res!176592) (not e!199670))))

(assert (=> b!322773 (= res!176592 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156539))))

(declare-fun b!322774 () Bool)

(declare-fun Unit!9880 () Unit!9875)

(assert (=> b!322774 (= e!199668 Unit!9880)))

(assert (=> b!322774 false))

(declare-fun b!322775 () Bool)

(declare-fun res!176587 () Bool)

(assert (=> b!322775 (=> (not res!176587) (not e!199670))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!322775 (= res!176587 (and (= (select (arr!7818 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8170 a!3305))))))

(declare-fun b!322776 () Bool)

(declare-fun e!199669 () Unit!9875)

(assert (=> b!322776 (= e!199669 e!199667)))

(declare-fun c!50719 () Bool)

(assert (=> b!322776 (= c!50719 (or (= (select (arr!7818 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7818 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!322777 () Bool)

(declare-fun res!176588 () Bool)

(assert (=> b!322777 (=> (not res!176588) (not e!199666))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!322777 (= res!176588 (validKeyInArray!0 k!2497))))

(declare-fun b!322778 () Bool)

(declare-fun Unit!9881 () Unit!9875)

(assert (=> b!322778 (= e!199669 Unit!9881)))

(declare-fun b!322779 () Bool)

(declare-fun res!176591 () Bool)

(assert (=> b!322779 (=> (not res!176591) (not e!199666))))

(assert (=> b!322779 (= res!176591 (and (= (size!8170 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8170 a!3305))))))

(declare-fun b!322780 () Bool)

(declare-fun res!176590 () Bool)

(assert (=> b!322780 (=> (not res!176590) (not e!199670))))

(assert (=> b!322780 (= res!176590 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7818 a!3305) index!1840) k!2497)) (= x!1490 resX!58)))))

(declare-fun b!322781 () Bool)

(assert (=> b!322781 (= e!199670 (not (or (not (= (select (arr!7818 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!3777 #b00000000000000000000000000000000) (bvslt index!1840 (bvadd #b00000000000000000000000000000001 mask!3777)))))))

(assert (=> b!322781 (= index!1840 resIndex!58)))

(declare-fun lt!156538 () Unit!9875)

(assert (=> b!322781 (= lt!156538 e!199669)))

(declare-fun c!50720 () Bool)

(assert (=> b!322781 (= c!50720 (not (= resIndex!58 index!1840)))))

(declare-fun b!322782 () Bool)

(declare-fun res!176593 () Bool)

(assert (=> b!322782 (=> (not res!176593) (not e!199666))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16522 (_ BitVec 32)) SeekEntryResult!2914)

(assert (=> b!322782 (= res!176593 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2914 i!1250)))))

(assert (= (and start!32370 res!176586) b!322779))

(assert (= (and b!322779 res!176591) b!322777))

(assert (= (and b!322777 res!176588) b!322768))

(assert (= (and b!322768 res!176595) b!322782))

(assert (= (and b!322782 res!176593) b!322772))

(assert (= (and b!322772 res!176589) b!322767))

(assert (= (and b!322767 res!176594) b!322775))

(assert (= (and b!322775 res!176587) b!322773))

(assert (= (and b!322773 res!176592) b!322780))

(assert (= (and b!322780 res!176590) b!322781))

(assert (= (and b!322781 c!50720) b!322776))

(assert (= (and b!322781 (not c!50720)) b!322778))

(assert (= (and b!322776 c!50719) b!322769))

(assert (= (and b!322776 (not c!50719)) b!322770))

(assert (= (and b!322770 c!50718) b!322771))

(assert (= (and b!322770 (not c!50718)) b!322774))

(declare-fun m!330665 () Bool)

(assert (=> b!322767 m!330665))

(assert (=> b!322767 m!330665))

(declare-fun m!330667 () Bool)

(assert (=> b!322767 m!330667))

(declare-fun m!330669 () Bool)

(assert (=> b!322781 m!330669))

(declare-fun m!330671 () Bool)

(assert (=> b!322773 m!330671))

(assert (=> b!322776 m!330669))

(declare-fun m!330673 () Bool)

(assert (=> b!322768 m!330673))

(declare-fun m!330675 () Bool)

(assert (=> start!32370 m!330675))

(declare-fun m!330677 () Bool)

(assert (=> start!32370 m!330677))

(assert (=> b!322780 m!330669))

(declare-fun m!330679 () Bool)

(assert (=> b!322775 m!330679))

(declare-fun m!330681 () Bool)

(assert (=> b!322770 m!330681))

(assert (=> b!322770 m!330681))

(declare-fun m!330683 () Bool)

(assert (=> b!322770 m!330683))

(declare-fun m!330685 () Bool)

(assert (=> b!322777 m!330685))

(declare-fun m!330687 () Bool)

(assert (=> b!322782 m!330687))

(declare-fun m!330689 () Bool)

(assert (=> b!322772 m!330689))

(push 1)

(assert (not b!322767))

(assert (not start!32370))

(assert (not b!322782))

(assert (not b!322773))

(assert (not b!322772))

(assert (not b!322770))

(assert (not b!322777))

(assert (not b!322768))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

