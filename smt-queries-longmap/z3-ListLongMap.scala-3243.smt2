; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45252 () Bool)

(assert start!45252)

(declare-fun b!496908 () Bool)

(declare-fun res!299446 () Bool)

(declare-fun e!291284 () Bool)

(assert (=> b!496908 (=> res!299446 e!291284)))

(declare-datatypes ((SeekEntryResult!3922 0))(
  ( (MissingZero!3922 (index!17867 (_ BitVec 32))) (Found!3922 (index!17868 (_ BitVec 32))) (Intermediate!3922 (undefined!4734 Bool) (index!17869 (_ BitVec 32)) (x!46929 (_ BitVec 32))) (Undefined!3922) (MissingVacant!3922 (index!17870 (_ BitVec 32))) )
))
(declare-fun lt!224846 () SeekEntryResult!3922)

(get-info :version)

(assert (=> b!496908 (= res!299446 (or (undefined!4734 lt!224846) (not ((_ is Intermediate!3922) lt!224846))))))

(declare-fun b!496909 () Bool)

(declare-fun e!291285 () Bool)

(declare-fun e!291287 () Bool)

(assert (=> b!496909 (= e!291285 e!291287)))

(declare-fun res!299440 () Bool)

(assert (=> b!496909 (=> (not res!299440) (not e!291287))))

(declare-fun lt!224848 () SeekEntryResult!3922)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!496909 (= res!299440 (or (= lt!224848 (MissingZero!3922 i!1204)) (= lt!224848 (MissingVacant!3922 i!1204))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32150 0))(
  ( (array!32151 (arr!15458 (Array (_ BitVec 32) (_ BitVec 64))) (size!15823 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32150)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32150 (_ BitVec 32)) SeekEntryResult!3922)

(assert (=> b!496909 (= lt!224848 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun e!291288 () Bool)

(declare-fun b!496910 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!496910 (= e!291288 (= (seekEntryOrOpen!0 (select (arr!15458 a!3235) j!176) a!3235 mask!3524) (Found!3922 j!176)))))

(declare-fun res!299443 () Bool)

(assert (=> start!45252 (=> (not res!299443) (not e!291285))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45252 (= res!299443 (validMask!0 mask!3524))))

(assert (=> start!45252 e!291285))

(assert (=> start!45252 true))

(declare-fun array_inv!11341 (array!32150) Bool)

(assert (=> start!45252 (array_inv!11341 a!3235)))

(declare-fun b!496911 () Bool)

(assert (=> b!496911 (= e!291284 true)))

(assert (=> b!496911 (and (bvslt (x!46929 lt!224846) #b01111111111111111111111111111110) (or (= (select (arr!15458 a!3235) (index!17869 lt!224846)) (select (arr!15458 a!3235) j!176)) (= (select (arr!15458 a!3235) (index!17869 lt!224846)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15458 a!3235) (index!17869 lt!224846)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!496912 () Bool)

(declare-fun res!299447 () Bool)

(assert (=> b!496912 (=> (not res!299447) (not e!291287))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32150 (_ BitVec 32)) Bool)

(assert (=> b!496912 (= res!299447 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!496913 () Bool)

(declare-fun res!299439 () Bool)

(assert (=> b!496913 (=> (not res!299439) (not e!291285))))

(declare-fun arrayContainsKey!0 (array!32150 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!496913 (= res!299439 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!496914 () Bool)

(declare-fun res!299444 () Bool)

(assert (=> b!496914 (=> (not res!299444) (not e!291285))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!496914 (= res!299444 (validKeyInArray!0 k0!2280))))

(declare-fun b!496915 () Bool)

(declare-fun res!299445 () Bool)

(assert (=> b!496915 (=> (not res!299445) (not e!291285))))

(assert (=> b!496915 (= res!299445 (validKeyInArray!0 (select (arr!15458 a!3235) j!176)))))

(declare-fun b!496916 () Bool)

(declare-fun res!299441 () Bool)

(assert (=> b!496916 (=> (not res!299441) (not e!291285))))

(assert (=> b!496916 (= res!299441 (and (= (size!15823 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15823 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15823 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!496917 () Bool)

(assert (=> b!496917 (= e!291287 (not e!291284))))

(declare-fun res!299442 () Bool)

(assert (=> b!496917 (=> res!299442 e!291284)))

(declare-fun lt!224844 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32150 (_ BitVec 32)) SeekEntryResult!3922)

(assert (=> b!496917 (= res!299442 (= lt!224846 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224844 (select (store (arr!15458 a!3235) i!1204 k0!2280) j!176) (array!32151 (store (arr!15458 a!3235) i!1204 k0!2280) (size!15823 a!3235)) mask!3524)))))

(declare-fun lt!224847 () (_ BitVec 32))

(assert (=> b!496917 (= lt!224846 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224847 (select (arr!15458 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!496917 (= lt!224844 (toIndex!0 (select (store (arr!15458 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!496917 (= lt!224847 (toIndex!0 (select (arr!15458 a!3235) j!176) mask!3524))))

(assert (=> b!496917 e!291288))

(declare-fun res!299438 () Bool)

(assert (=> b!496917 (=> (not res!299438) (not e!291288))))

(assert (=> b!496917 (= res!299438 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14776 0))(
  ( (Unit!14777) )
))
(declare-fun lt!224845 () Unit!14776)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32150 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14776)

(assert (=> b!496917 (= lt!224845 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!496918 () Bool)

(declare-fun res!299437 () Bool)

(assert (=> b!496918 (=> (not res!299437) (not e!291287))))

(declare-datatypes ((List!9655 0))(
  ( (Nil!9652) (Cons!9651 (h!10522 (_ BitVec 64)) (t!15874 List!9655)) )
))
(declare-fun arrayNoDuplicates!0 (array!32150 (_ BitVec 32) List!9655) Bool)

(assert (=> b!496918 (= res!299437 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9652))))

(assert (= (and start!45252 res!299443) b!496916))

(assert (= (and b!496916 res!299441) b!496915))

(assert (= (and b!496915 res!299445) b!496914))

(assert (= (and b!496914 res!299444) b!496913))

(assert (= (and b!496913 res!299439) b!496909))

(assert (= (and b!496909 res!299440) b!496912))

(assert (= (and b!496912 res!299447) b!496918))

(assert (= (and b!496918 res!299437) b!496917))

(assert (= (and b!496917 res!299438) b!496910))

(assert (= (and b!496917 (not res!299442)) b!496908))

(assert (= (and b!496908 (not res!299446)) b!496911))

(declare-fun m!477775 () Bool)

(assert (=> b!496912 m!477775))

(declare-fun m!477777 () Bool)

(assert (=> b!496914 m!477777))

(declare-fun m!477779 () Bool)

(assert (=> b!496913 m!477779))

(declare-fun m!477781 () Bool)

(assert (=> b!496915 m!477781))

(assert (=> b!496915 m!477781))

(declare-fun m!477783 () Bool)

(assert (=> b!496915 m!477783))

(declare-fun m!477785 () Bool)

(assert (=> b!496909 m!477785))

(declare-fun m!477787 () Bool)

(assert (=> start!45252 m!477787))

(declare-fun m!477789 () Bool)

(assert (=> start!45252 m!477789))

(declare-fun m!477791 () Bool)

(assert (=> b!496917 m!477791))

(declare-fun m!477793 () Bool)

(assert (=> b!496917 m!477793))

(declare-fun m!477795 () Bool)

(assert (=> b!496917 m!477795))

(assert (=> b!496917 m!477781))

(declare-fun m!477797 () Bool)

(assert (=> b!496917 m!477797))

(assert (=> b!496917 m!477781))

(declare-fun m!477799 () Bool)

(assert (=> b!496917 m!477799))

(assert (=> b!496917 m!477781))

(assert (=> b!496917 m!477795))

(declare-fun m!477801 () Bool)

(assert (=> b!496917 m!477801))

(declare-fun m!477803 () Bool)

(assert (=> b!496917 m!477803))

(assert (=> b!496917 m!477795))

(declare-fun m!477805 () Bool)

(assert (=> b!496917 m!477805))

(assert (=> b!496910 m!477781))

(assert (=> b!496910 m!477781))

(declare-fun m!477807 () Bool)

(assert (=> b!496910 m!477807))

(declare-fun m!477809 () Bool)

(assert (=> b!496911 m!477809))

(assert (=> b!496911 m!477781))

(declare-fun m!477811 () Bool)

(assert (=> b!496918 m!477811))

(check-sat (not b!496912) (not b!496914) (not b!496915) (not b!496913) (not b!496917) (not b!496909) (not b!496918) (not start!45252) (not b!496910))
(check-sat)
