; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32418 () Bool)

(assert start!32418)

(declare-datatypes ((array!16557 0))(
  ( (array!16558 (arr!7836 (Array (_ BitVec 32) (_ BitVec 64))) (size!8188 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16557)

(declare-fun b!323636 () Bool)

(declare-fun e!200009 () Bool)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun mask!3777 () (_ BitVec 32))

(assert (=> b!323636 (= e!200009 (not (or (not (= (select (arr!7836 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!3777 #b00000000000000000000000000000000) (bvslt index!1840 (bvadd #b00000000000000000000000000000001 mask!3777)))))))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!323636 (= index!1840 resIndex!58)))

(declare-datatypes ((Unit!10032 0))(
  ( (Unit!10033) )
))
(declare-fun lt!156675 () Unit!10032)

(declare-fun e!200007 () Unit!10032)

(assert (=> b!323636 (= lt!156675 e!200007)))

(declare-fun c!50898 () Bool)

(assert (=> b!323636 (= c!50898 (not (= resIndex!58 index!1840)))))

(declare-fun res!177099 () Bool)

(declare-fun e!200010 () Bool)

(assert (=> start!32418 (=> (not res!177099) (not e!200010))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32418 (= res!177099 (validMask!0 mask!3777))))

(assert (=> start!32418 e!200010))

(declare-fun array_inv!5799 (array!16557) Bool)

(assert (=> start!32418 (array_inv!5799 a!3305)))

(assert (=> start!32418 true))

(declare-fun b!323637 () Bool)

(assert (=> b!323637 false))

(declare-fun e!200008 () Unit!10032)

(declare-fun Unit!10034 () Unit!10032)

(assert (=> b!323637 (= e!200008 Unit!10034)))

(declare-fun b!323638 () Bool)

(assert (=> b!323638 (= e!200010 e!200009)))

(declare-fun res!177100 () Bool)

(assert (=> b!323638 (=> (not res!177100) (not e!200009))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2967 0))(
  ( (MissingZero!2967 (index!14044 (_ BitVec 32))) (Found!2967 (index!14045 (_ BitVec 32))) (Intermediate!2967 (undefined!3779 Bool) (index!14046 (_ BitVec 32)) (x!32299 (_ BitVec 32))) (Undefined!2967) (MissingVacant!2967 (index!14047 (_ BitVec 32))) )
))
(declare-fun lt!156673 () SeekEntryResult!2967)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16557 (_ BitVec 32)) SeekEntryResult!2967)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!323638 (= res!177100 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156673))))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!323638 (= lt!156673 (Intermediate!2967 false resIndex!58 resX!58))))

(declare-fun b!323639 () Bool)

(assert (=> b!323639 false))

(declare-fun lt!156674 () Unit!10032)

(declare-fun e!200011 () Unit!10032)

(assert (=> b!323639 (= lt!156674 e!200011)))

(declare-fun c!50896 () Bool)

(declare-fun x!1490 () (_ BitVec 32))

(get-info :version)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!323639 (= c!50896 ((_ is Intermediate!2967) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k0!2497 a!3305 mask!3777)))))

(declare-fun Unit!10035 () Unit!10032)

(assert (=> b!323639 (= e!200008 Unit!10035)))

(declare-fun b!323640 () Bool)

(declare-fun Unit!10036 () Unit!10032)

(assert (=> b!323640 (= e!200011 Unit!10036)))

(declare-fun b!323641 () Bool)

(declare-fun res!177101 () Bool)

(assert (=> b!323641 (=> (not res!177101) (not e!200010))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16557 (_ BitVec 32)) SeekEntryResult!2967)

(assert (=> b!323641 (= res!177101 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2967 i!1250)))))

(declare-fun b!323642 () Bool)

(declare-fun res!177106 () Bool)

(assert (=> b!323642 (=> (not res!177106) (not e!200010))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!323642 (= res!177106 (validKeyInArray!0 k0!2497))))

(declare-fun b!323643 () Bool)

(declare-fun Unit!10037 () Unit!10032)

(assert (=> b!323643 (= e!200007 Unit!10037)))

(declare-fun b!323644 () Bool)

(declare-fun res!177103 () Bool)

(assert (=> b!323644 (=> (not res!177103) (not e!200010))))

(assert (=> b!323644 (= res!177103 (and (= (size!8188 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8188 a!3305))))))

(declare-fun b!323645 () Bool)

(declare-fun Unit!10038 () Unit!10032)

(assert (=> b!323645 (= e!200011 Unit!10038)))

(assert (=> b!323645 false))

(declare-fun b!323646 () Bool)

(declare-fun res!177102 () Bool)

(assert (=> b!323646 (=> (not res!177102) (not e!200009))))

(assert (=> b!323646 (= res!177102 (and (= (select (arr!7836 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8188 a!3305))))))

(declare-fun b!323647 () Bool)

(declare-fun res!177107 () Bool)

(assert (=> b!323647 (=> (not res!177107) (not e!200009))))

(assert (=> b!323647 (= res!177107 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7836 a!3305) index!1840) k0!2497)) (= x!1490 resX!58)))))

(declare-fun b!323648 () Bool)

(declare-fun res!177104 () Bool)

(assert (=> b!323648 (=> (not res!177104) (not e!200009))))

(assert (=> b!323648 (= res!177104 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156673))))

(declare-fun b!323649 () Bool)

(declare-fun res!177108 () Bool)

(assert (=> b!323649 (=> (not res!177108) (not e!200010))))

(declare-fun arrayContainsKey!0 (array!16557 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!323649 (= res!177108 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!323650 () Bool)

(assert (=> b!323650 (= e!200007 e!200008)))

(declare-fun c!50897 () Bool)

(assert (=> b!323650 (= c!50897 (or (= (select (arr!7836 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7836 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!323651 () Bool)

(declare-fun res!177105 () Bool)

(assert (=> b!323651 (=> (not res!177105) (not e!200010))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16557 (_ BitVec 32)) Bool)

(assert (=> b!323651 (= res!177105 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(assert (= (and start!32418 res!177099) b!323644))

(assert (= (and b!323644 res!177103) b!323642))

(assert (= (and b!323642 res!177106) b!323649))

(assert (= (and b!323649 res!177108) b!323641))

(assert (= (and b!323641 res!177101) b!323651))

(assert (= (and b!323651 res!177105) b!323638))

(assert (= (and b!323638 res!177100) b!323646))

(assert (= (and b!323646 res!177102) b!323648))

(assert (= (and b!323648 res!177104) b!323647))

(assert (= (and b!323647 res!177107) b!323636))

(assert (= (and b!323636 c!50898) b!323650))

(assert (= (and b!323636 (not c!50898)) b!323643))

(assert (= (and b!323650 c!50897) b!323637))

(assert (= (and b!323650 (not c!50897)) b!323639))

(assert (= (and b!323639 c!50896) b!323640))

(assert (= (and b!323639 (not c!50896)) b!323645))

(declare-fun m!330925 () Bool)

(assert (=> b!323648 m!330925))

(declare-fun m!330927 () Bool)

(assert (=> b!323651 m!330927))

(declare-fun m!330929 () Bool)

(assert (=> b!323646 m!330929))

(declare-fun m!330931 () Bool)

(assert (=> b!323639 m!330931))

(assert (=> b!323639 m!330931))

(declare-fun m!330933 () Bool)

(assert (=> b!323639 m!330933))

(declare-fun m!330935 () Bool)

(assert (=> b!323641 m!330935))

(declare-fun m!330937 () Bool)

(assert (=> b!323636 m!330937))

(declare-fun m!330939 () Bool)

(assert (=> b!323638 m!330939))

(assert (=> b!323638 m!330939))

(declare-fun m!330941 () Bool)

(assert (=> b!323638 m!330941))

(declare-fun m!330943 () Bool)

(assert (=> b!323642 m!330943))

(declare-fun m!330945 () Bool)

(assert (=> b!323649 m!330945))

(assert (=> b!323650 m!330937))

(declare-fun m!330947 () Bool)

(assert (=> start!32418 m!330947))

(declare-fun m!330949 () Bool)

(assert (=> start!32418 m!330949))

(assert (=> b!323647 m!330937))

(check-sat (not b!323651) (not b!323639) (not b!323642) (not b!323648) (not start!32418) (not b!323638) (not b!323649) (not b!323641))
(check-sat)
