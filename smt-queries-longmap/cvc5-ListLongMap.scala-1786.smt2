; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32416 () Bool)

(assert start!32416)

(declare-fun b!323588 () Bool)

(declare-fun res!177076 () Bool)

(declare-fun e!199989 () Bool)

(assert (=> b!323588 (=> (not res!177076) (not e!199989))))

(declare-datatypes ((array!16555 0))(
  ( (array!16556 (arr!7835 (Array (_ BitVec 32) (_ BitVec 64))) (size!8187 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16555)

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16555 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!323588 (= res!177076 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!323589 () Bool)

(declare-fun res!177073 () Bool)

(declare-fun e!199992 () Bool)

(assert (=> b!323589 (=> (not res!177073) (not e!199992))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!323589 (= res!177073 (and (= (select (arr!7835 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8187 a!3305))))))

(declare-fun b!323590 () Bool)

(assert (=> b!323590 false))

(declare-datatypes ((Unit!10025 0))(
  ( (Unit!10026) )
))
(declare-fun lt!156666 () Unit!10025)

(declare-fun e!199993 () Unit!10025)

(assert (=> b!323590 (= lt!156666 e!199993)))

(declare-fun c!50889 () Bool)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2966 0))(
  ( (MissingZero!2966 (index!14040 (_ BitVec 32))) (Found!2966 (index!14041 (_ BitVec 32))) (Intermediate!2966 (undefined!3778 Bool) (index!14042 (_ BitVec 32)) (x!32298 (_ BitVec 32))) (Undefined!2966) (MissingVacant!2966 (index!14043 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16555 (_ BitVec 32)) SeekEntryResult!2966)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!323590 (= c!50889 (is-Intermediate!2966 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k!2497 a!3305 mask!3777)))))

(declare-fun e!199988 () Unit!10025)

(declare-fun Unit!10027 () Unit!10025)

(assert (=> b!323590 (= e!199988 Unit!10027)))

(declare-fun b!323591 () Bool)

(declare-fun res!177078 () Bool)

(assert (=> b!323591 (=> (not res!177078) (not e!199989))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!323591 (= res!177078 (validKeyInArray!0 k!2497))))

(declare-fun b!323592 () Bool)

(declare-fun Unit!10028 () Unit!10025)

(assert (=> b!323592 (= e!199993 Unit!10028)))

(declare-fun b!323593 () Bool)

(declare-fun res!177071 () Bool)

(assert (=> b!323593 (=> (not res!177071) (not e!199992))))

(assert (=> b!323593 (= res!177071 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7835 a!3305) index!1840) k!2497)) (= x!1490 resX!58)))))

(declare-fun b!323594 () Bool)

(declare-fun e!199990 () Unit!10025)

(declare-fun Unit!10029 () Unit!10025)

(assert (=> b!323594 (= e!199990 Unit!10029)))

(declare-fun res!177072 () Bool)

(assert (=> start!32416 (=> (not res!177072) (not e!199989))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32416 (= res!177072 (validMask!0 mask!3777))))

(assert (=> start!32416 e!199989))

(declare-fun array_inv!5798 (array!16555) Bool)

(assert (=> start!32416 (array_inv!5798 a!3305)))

(assert (=> start!32416 true))

(declare-fun b!323595 () Bool)

(assert (=> b!323595 (= e!199989 e!199992)))

(declare-fun res!177077 () Bool)

(assert (=> b!323595 (=> (not res!177077) (not e!199992))))

(declare-fun lt!156664 () SeekEntryResult!2966)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!323595 (= res!177077 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156664))))

(assert (=> b!323595 (= lt!156664 (Intermediate!2966 false resIndex!58 resX!58))))

(declare-fun b!323596 () Bool)

(declare-fun Unit!10030 () Unit!10025)

(assert (=> b!323596 (= e!199993 Unit!10030)))

(assert (=> b!323596 false))

(declare-fun b!323597 () Bool)

(declare-fun res!177069 () Bool)

(assert (=> b!323597 (=> (not res!177069) (not e!199992))))

(assert (=> b!323597 (= res!177069 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156664))))

(declare-fun b!323598 () Bool)

(assert (=> b!323598 (= e!199992 (not (or (not (= (select (arr!7835 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!3777 #b00000000000000000000000000000000) (bvslt index!1840 (bvadd #b00000000000000000000000000000001 mask!3777)))))))

(assert (=> b!323598 (= index!1840 resIndex!58)))

(declare-fun lt!156665 () Unit!10025)

(assert (=> b!323598 (= lt!156665 e!199990)))

(declare-fun c!50888 () Bool)

(assert (=> b!323598 (= c!50888 (not (= resIndex!58 index!1840)))))

(declare-fun b!323599 () Bool)

(assert (=> b!323599 false))

(declare-fun Unit!10031 () Unit!10025)

(assert (=> b!323599 (= e!199988 Unit!10031)))

(declare-fun b!323600 () Bool)

(declare-fun res!177074 () Bool)

(assert (=> b!323600 (=> (not res!177074) (not e!199989))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16555 (_ BitVec 32)) Bool)

(assert (=> b!323600 (= res!177074 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!323601 () Bool)

(assert (=> b!323601 (= e!199990 e!199988)))

(declare-fun c!50887 () Bool)

(assert (=> b!323601 (= c!50887 (or (= (select (arr!7835 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7835 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!323602 () Bool)

(declare-fun res!177070 () Bool)

(assert (=> b!323602 (=> (not res!177070) (not e!199989))))

(assert (=> b!323602 (= res!177070 (and (= (size!8187 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8187 a!3305))))))

(declare-fun b!323603 () Bool)

(declare-fun res!177075 () Bool)

(assert (=> b!323603 (=> (not res!177075) (not e!199989))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16555 (_ BitVec 32)) SeekEntryResult!2966)

(assert (=> b!323603 (= res!177075 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2966 i!1250)))))

(assert (= (and start!32416 res!177072) b!323602))

(assert (= (and b!323602 res!177070) b!323591))

(assert (= (and b!323591 res!177078) b!323588))

(assert (= (and b!323588 res!177076) b!323603))

(assert (= (and b!323603 res!177075) b!323600))

(assert (= (and b!323600 res!177074) b!323595))

(assert (= (and b!323595 res!177077) b!323589))

(assert (= (and b!323589 res!177073) b!323597))

(assert (= (and b!323597 res!177069) b!323593))

(assert (= (and b!323593 res!177071) b!323598))

(assert (= (and b!323598 c!50888) b!323601))

(assert (= (and b!323598 (not c!50888)) b!323594))

(assert (= (and b!323601 c!50887) b!323599))

(assert (= (and b!323601 (not c!50887)) b!323590))

(assert (= (and b!323590 c!50889) b!323592))

(assert (= (and b!323590 (not c!50889)) b!323596))

(declare-fun m!330899 () Bool)

(assert (=> b!323595 m!330899))

(assert (=> b!323595 m!330899))

(declare-fun m!330901 () Bool)

(assert (=> b!323595 m!330901))

(declare-fun m!330903 () Bool)

(assert (=> b!323597 m!330903))

(declare-fun m!330905 () Bool)

(assert (=> b!323593 m!330905))

(declare-fun m!330907 () Bool)

(assert (=> start!32416 m!330907))

(declare-fun m!330909 () Bool)

(assert (=> start!32416 m!330909))

(declare-fun m!330911 () Bool)

(assert (=> b!323591 m!330911))

(assert (=> b!323601 m!330905))

(declare-fun m!330913 () Bool)

(assert (=> b!323603 m!330913))

(declare-fun m!330915 () Bool)

(assert (=> b!323590 m!330915))

(assert (=> b!323590 m!330915))

(declare-fun m!330917 () Bool)

(assert (=> b!323590 m!330917))

(assert (=> b!323598 m!330905))

(declare-fun m!330919 () Bool)

(assert (=> b!323600 m!330919))

(declare-fun m!330921 () Bool)

(assert (=> b!323588 m!330921))

(declare-fun m!330923 () Bool)

(assert (=> b!323589 m!330923))

(push 1)

(assert (not b!323590))

(assert (not b!323588))

(assert (not b!323595))

(assert (not b!323603))

(assert (not b!323597))

(assert (not b!323591))

(assert (not start!32416))

(assert (not b!323600))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

