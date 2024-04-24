; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32408 () Bool)

(assert start!32408)

(declare-fun b!323679 () Bool)

(declare-fun e!200010 () Bool)

(declare-fun e!200008 () Bool)

(assert (=> b!323679 (= e!200010 e!200008)))

(declare-fun res!177159 () Bool)

(assert (=> b!323679 (=> (not res!177159) (not e!200008))))

(declare-datatypes ((array!16560 0))(
  ( (array!16561 (arr!7837 (Array (_ BitVec 32) (_ BitVec 64))) (size!8189 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16560)

(declare-datatypes ((SeekEntryResult!2933 0))(
  ( (MissingZero!2933 (index!13908 (_ BitVec 32))) (Found!2933 (index!13909 (_ BitVec 32))) (Intermediate!2933 (undefined!3745 Bool) (index!13910 (_ BitVec 32)) (x!32270 (_ BitVec 32))) (Undefined!2933) (MissingVacant!2933 (index!13911 (_ BitVec 32))) )
))
(declare-fun lt!156709 () SeekEntryResult!2933)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16560 (_ BitVec 32)) SeekEntryResult!2933)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!323679 (= res!177159 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156709))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!323679 (= lt!156709 (Intermediate!2933 false resIndex!58 resX!58))))

(declare-fun res!177162 () Bool)

(assert (=> start!32408 (=> (not res!177162) (not e!200010))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32408 (= res!177162 (validMask!0 mask!3777))))

(assert (=> start!32408 e!200010))

(declare-fun array_inv!5787 (array!16560) Bool)

(assert (=> start!32408 (array_inv!5787 a!3305)))

(assert (=> start!32408 true))

(declare-fun b!323680 () Bool)

(declare-fun res!177164 () Bool)

(assert (=> b!323680 (=> (not res!177164) (not e!200010))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16560 (_ BitVec 32)) Bool)

(assert (=> b!323680 (= res!177164 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!323681 () Bool)

(declare-fun res!177160 () Bool)

(assert (=> b!323681 (=> (not res!177160) (not e!200008))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!323681 (= res!177160 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7837 a!3305) index!1840) k0!2497)) (= x!1490 resX!58)))))

(declare-fun b!323682 () Bool)

(declare-datatypes ((Unit!10008 0))(
  ( (Unit!10009) )
))
(declare-fun e!200012 () Unit!10008)

(declare-fun e!200013 () Unit!10008)

(assert (=> b!323682 (= e!200012 e!200013)))

(declare-fun c!50891 () Bool)

(assert (=> b!323682 (= c!50891 (or (= (select (arr!7837 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7837 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!323683 () Bool)

(assert (=> b!323683 false))

(declare-fun Unit!10010 () Unit!10008)

(assert (=> b!323683 (= e!200013 Unit!10010)))

(declare-fun b!323684 () Bool)

(declare-fun e!200009 () Unit!10008)

(declare-fun Unit!10011 () Unit!10008)

(assert (=> b!323684 (= e!200009 Unit!10011)))

(assert (=> b!323684 false))

(declare-fun b!323685 () Bool)

(declare-fun res!177161 () Bool)

(assert (=> b!323685 (=> (not res!177161) (not e!200010))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16560 (_ BitVec 32)) SeekEntryResult!2933)

(assert (=> b!323685 (= res!177161 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2933 i!1250)))))

(declare-fun b!323686 () Bool)

(assert (=> b!323686 false))

(declare-fun lt!156710 () Unit!10008)

(assert (=> b!323686 (= lt!156710 e!200009)))

(declare-fun c!50890 () Bool)

(get-info :version)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!323686 (= c!50890 ((_ is Intermediate!2933) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) k0!2497 a!3305 mask!3777)))))

(declare-fun Unit!10012 () Unit!10008)

(assert (=> b!323686 (= e!200013 Unit!10012)))

(declare-fun b!323687 () Bool)

(declare-fun res!177157 () Bool)

(assert (=> b!323687 (=> (not res!177157) (not e!200010))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!323687 (= res!177157 (validKeyInArray!0 k0!2497))))

(declare-fun b!323688 () Bool)

(declare-fun res!177163 () Bool)

(assert (=> b!323688 (=> (not res!177163) (not e!200008))))

(assert (=> b!323688 (= res!177163 (and (= (select (arr!7837 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8189 a!3305))))))

(declare-fun b!323689 () Bool)

(declare-fun res!177165 () Bool)

(assert (=> b!323689 (=> (not res!177165) (not e!200010))))

(declare-fun arrayContainsKey!0 (array!16560 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!323689 (= res!177165 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!323690 () Bool)

(assert (=> b!323690 (= e!200008 (not (or (not (= (select (arr!7837 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!3777 #b00000000000000000000000000000000) (bvsge index!1840 (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsle x!1490 #b01111111111111111111111111111110))))))

(assert (=> b!323690 (= index!1840 resIndex!58)))

(declare-fun lt!156711 () Unit!10008)

(assert (=> b!323690 (= lt!156711 e!200012)))

(declare-fun c!50889 () Bool)

(assert (=> b!323690 (= c!50889 (not (= resIndex!58 index!1840)))))

(declare-fun b!323691 () Bool)

(declare-fun Unit!10013 () Unit!10008)

(assert (=> b!323691 (= e!200012 Unit!10013)))

(declare-fun b!323692 () Bool)

(declare-fun res!177156 () Bool)

(assert (=> b!323692 (=> (not res!177156) (not e!200010))))

(assert (=> b!323692 (= res!177156 (and (= (size!8189 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8189 a!3305))))))

(declare-fun b!323693 () Bool)

(declare-fun Unit!10014 () Unit!10008)

(assert (=> b!323693 (= e!200009 Unit!10014)))

(declare-fun b!323694 () Bool)

(declare-fun res!177158 () Bool)

(assert (=> b!323694 (=> (not res!177158) (not e!200008))))

(assert (=> b!323694 (= res!177158 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156709))))

(assert (= (and start!32408 res!177162) b!323692))

(assert (= (and b!323692 res!177156) b!323687))

(assert (= (and b!323687 res!177157) b!323689))

(assert (= (and b!323689 res!177165) b!323685))

(assert (= (and b!323685 res!177161) b!323680))

(assert (= (and b!323680 res!177164) b!323679))

(assert (= (and b!323679 res!177159) b!323688))

(assert (= (and b!323688 res!177163) b!323694))

(assert (= (and b!323694 res!177158) b!323681))

(assert (= (and b!323681 res!177160) b!323690))

(assert (= (and b!323690 c!50889) b!323682))

(assert (= (and b!323690 (not c!50889)) b!323691))

(assert (= (and b!323682 c!50891) b!323683))

(assert (= (and b!323682 (not c!50891)) b!323686))

(assert (= (and b!323686 c!50890) b!323693))

(assert (= (and b!323686 (not c!50890)) b!323684))

(declare-fun m!331159 () Bool)

(assert (=> b!323680 m!331159))

(declare-fun m!331161 () Bool)

(assert (=> b!323689 m!331161))

(declare-fun m!331163 () Bool)

(assert (=> b!323679 m!331163))

(assert (=> b!323679 m!331163))

(declare-fun m!331165 () Bool)

(assert (=> b!323679 m!331165))

(declare-fun m!331167 () Bool)

(assert (=> b!323686 m!331167))

(assert (=> b!323686 m!331167))

(declare-fun m!331169 () Bool)

(assert (=> b!323686 m!331169))

(declare-fun m!331171 () Bool)

(assert (=> b!323688 m!331171))

(declare-fun m!331173 () Bool)

(assert (=> start!32408 m!331173))

(declare-fun m!331175 () Bool)

(assert (=> start!32408 m!331175))

(declare-fun m!331177 () Bool)

(assert (=> b!323687 m!331177))

(declare-fun m!331179 () Bool)

(assert (=> b!323685 m!331179))

(declare-fun m!331181 () Bool)

(assert (=> b!323682 m!331181))

(assert (=> b!323681 m!331181))

(declare-fun m!331183 () Bool)

(assert (=> b!323694 m!331183))

(assert (=> b!323690 m!331181))

(check-sat (not b!323687) (not b!323680) (not b!323689) (not b!323686) (not start!32408) (not b!323679) (not b!323685) (not b!323694))
(check-sat)
