; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45186 () Bool)

(assert start!45186)

(declare-fun b!495892 () Bool)

(declare-fun res!298286 () Bool)

(declare-fun e!290875 () Bool)

(assert (=> b!495892 (=> (not res!298286) (not e!290875))))

(declare-datatypes ((array!32074 0))(
  ( (array!32075 (arr!15420 (Array (_ BitVec 32) (_ BitVec 64))) (size!15784 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32074)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!495892 (= res!298286 (validKeyInArray!0 (select (arr!15420 a!3235) j!176)))))

(declare-fun b!495893 () Bool)

(declare-fun res!298282 () Bool)

(assert (=> b!495893 (=> (not res!298282) (not e!290875))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!495893 (= res!298282 (validKeyInArray!0 k!2280))))

(declare-fun b!495894 () Bool)

(declare-fun res!298285 () Bool)

(assert (=> b!495894 (=> (not res!298285) (not e!290875))))

(declare-fun arrayContainsKey!0 (array!32074 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!495894 (= res!298285 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun res!298284 () Bool)

(assert (=> start!45186 (=> (not res!298284) (not e!290875))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45186 (= res!298284 (validMask!0 mask!3524))))

(assert (=> start!45186 e!290875))

(assert (=> start!45186 true))

(declare-fun array_inv!11216 (array!32074) Bool)

(assert (=> start!45186 (array_inv!11216 a!3235)))

(declare-fun b!495895 () Bool)

(declare-fun e!290873 () Bool)

(assert (=> b!495895 (= e!290873 true)))

(declare-datatypes ((SeekEntryResult!3887 0))(
  ( (MissingZero!3887 (index!17727 (_ BitVec 32))) (Found!3887 (index!17728 (_ BitVec 32))) (Intermediate!3887 (undefined!4699 Bool) (index!17729 (_ BitVec 32)) (x!46795 (_ BitVec 32))) (Undefined!3887) (MissingVacant!3887 (index!17730 (_ BitVec 32))) )
))
(declare-fun lt!224496 () SeekEntryResult!3887)

(assert (=> b!495895 (and (bvslt (x!46795 lt!224496) #b01111111111111111111111111111110) (or (= (select (arr!15420 a!3235) (index!17729 lt!224496)) (select (arr!15420 a!3235) j!176)) (= (select (arr!15420 a!3235) (index!17729 lt!224496)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15420 a!3235) (index!17729 lt!224496)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!495896 () Bool)

(declare-fun res!298281 () Bool)

(declare-fun e!290877 () Bool)

(assert (=> b!495896 (=> (not res!298281) (not e!290877))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32074 (_ BitVec 32)) Bool)

(assert (=> b!495896 (= res!298281 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!495897 () Bool)

(assert (=> b!495897 (= e!290875 e!290877)))

(declare-fun res!298287 () Bool)

(assert (=> b!495897 (=> (not res!298287) (not e!290877))))

(declare-fun lt!224493 () SeekEntryResult!3887)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!495897 (= res!298287 (or (= lt!224493 (MissingZero!3887 i!1204)) (= lt!224493 (MissingVacant!3887 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32074 (_ BitVec 32)) SeekEntryResult!3887)

(assert (=> b!495897 (= lt!224493 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!495898 () Bool)

(declare-fun e!290876 () Bool)

(assert (=> b!495898 (= e!290876 (= (seekEntryOrOpen!0 (select (arr!15420 a!3235) j!176) a!3235 mask!3524) (Found!3887 j!176)))))

(declare-fun b!495899 () Bool)

(declare-fun res!298279 () Bool)

(assert (=> b!495899 (=> (not res!298279) (not e!290875))))

(assert (=> b!495899 (= res!298279 (and (= (size!15784 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15784 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15784 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!495900 () Bool)

(declare-fun res!298283 () Bool)

(assert (=> b!495900 (=> res!298283 e!290873)))

(assert (=> b!495900 (= res!298283 (or (undefined!4699 lt!224496) (not (is-Intermediate!3887 lt!224496))))))

(declare-fun b!495901 () Bool)

(assert (=> b!495901 (= e!290877 (not e!290873))))

(declare-fun res!298288 () Bool)

(assert (=> b!495901 (=> res!298288 e!290873)))

(declare-fun lt!224494 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32074 (_ BitVec 32)) SeekEntryResult!3887)

(assert (=> b!495901 (= res!298288 (= lt!224496 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224494 (select (store (arr!15420 a!3235) i!1204 k!2280) j!176) (array!32075 (store (arr!15420 a!3235) i!1204 k!2280) (size!15784 a!3235)) mask!3524)))))

(declare-fun lt!224497 () (_ BitVec 32))

(assert (=> b!495901 (= lt!224496 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224497 (select (arr!15420 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!495901 (= lt!224494 (toIndex!0 (select (store (arr!15420 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!495901 (= lt!224497 (toIndex!0 (select (arr!15420 a!3235) j!176) mask!3524))))

(assert (=> b!495901 e!290876))

(declare-fun res!298280 () Bool)

(assert (=> b!495901 (=> (not res!298280) (not e!290876))))

(assert (=> b!495901 (= res!298280 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14720 0))(
  ( (Unit!14721) )
))
(declare-fun lt!224495 () Unit!14720)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32074 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14720)

(assert (=> b!495901 (= lt!224495 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!495902 () Bool)

(declare-fun res!298289 () Bool)

(assert (=> b!495902 (=> (not res!298289) (not e!290877))))

(declare-datatypes ((List!9578 0))(
  ( (Nil!9575) (Cons!9574 (h!10445 (_ BitVec 64)) (t!15806 List!9578)) )
))
(declare-fun arrayNoDuplicates!0 (array!32074 (_ BitVec 32) List!9578) Bool)

(assert (=> b!495902 (= res!298289 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9575))))

(assert (= (and start!45186 res!298284) b!495899))

(assert (= (and b!495899 res!298279) b!495892))

(assert (= (and b!495892 res!298286) b!495893))

(assert (= (and b!495893 res!298282) b!495894))

(assert (= (and b!495894 res!298285) b!495897))

(assert (= (and b!495897 res!298287) b!495896))

(assert (= (and b!495896 res!298281) b!495902))

(assert (= (and b!495902 res!298289) b!495901))

(assert (= (and b!495901 res!298280) b!495898))

(assert (= (and b!495901 (not res!298288)) b!495900))

(assert (= (and b!495900 (not res!298283)) b!495895))

(declare-fun m!477045 () Bool)

(assert (=> b!495897 m!477045))

(declare-fun m!477047 () Bool)

(assert (=> b!495893 m!477047))

(declare-fun m!477049 () Bool)

(assert (=> b!495898 m!477049))

(assert (=> b!495898 m!477049))

(declare-fun m!477051 () Bool)

(assert (=> b!495898 m!477051))

(declare-fun m!477053 () Bool)

(assert (=> b!495901 m!477053))

(declare-fun m!477055 () Bool)

(assert (=> b!495901 m!477055))

(assert (=> b!495901 m!477049))

(declare-fun m!477057 () Bool)

(assert (=> b!495901 m!477057))

(assert (=> b!495901 m!477049))

(declare-fun m!477059 () Bool)

(assert (=> b!495901 m!477059))

(assert (=> b!495901 m!477049))

(declare-fun m!477061 () Bool)

(assert (=> b!495901 m!477061))

(declare-fun m!477063 () Bool)

(assert (=> b!495901 m!477063))

(declare-fun m!477065 () Bool)

(assert (=> b!495901 m!477065))

(assert (=> b!495901 m!477063))

(declare-fun m!477067 () Bool)

(assert (=> b!495901 m!477067))

(assert (=> b!495901 m!477063))

(declare-fun m!477069 () Bool)

(assert (=> b!495902 m!477069))

(assert (=> b!495892 m!477049))

(assert (=> b!495892 m!477049))

(declare-fun m!477071 () Bool)

(assert (=> b!495892 m!477071))

(declare-fun m!477073 () Bool)

(assert (=> start!45186 m!477073))

(declare-fun m!477075 () Bool)

(assert (=> start!45186 m!477075))

(declare-fun m!477077 () Bool)

(assert (=> b!495896 m!477077))

(declare-fun m!477079 () Bool)

(assert (=> b!495895 m!477079))

(assert (=> b!495895 m!477049))

(declare-fun m!477081 () Bool)

(assert (=> b!495894 m!477081))

(push 1)

