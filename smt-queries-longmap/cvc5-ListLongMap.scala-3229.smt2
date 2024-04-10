; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45180 () Bool)

(assert start!45180)

(declare-fun b!495793 () Bool)

(declare-fun res!298188 () Bool)

(declare-fun e!290831 () Bool)

(assert (=> b!495793 (=> (not res!298188) (not e!290831))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!495793 (= res!298188 (validKeyInArray!0 k!2280))))

(declare-fun b!495794 () Bool)

(declare-fun e!290832 () Bool)

(declare-fun e!290828 () Bool)

(assert (=> b!495794 (= e!290832 (not e!290828))))

(declare-fun res!298190 () Bool)

(assert (=> b!495794 (=> res!298190 e!290828)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3884 0))(
  ( (MissingZero!3884 (index!17715 (_ BitVec 32))) (Found!3884 (index!17716 (_ BitVec 32))) (Intermediate!3884 (undefined!4696 Bool) (index!17717 (_ BitVec 32)) (x!46784 (_ BitVec 32))) (Undefined!3884) (MissingVacant!3884 (index!17718 (_ BitVec 32))) )
))
(declare-fun lt!224452 () SeekEntryResult!3884)

(declare-fun lt!224448 () (_ BitVec 32))

(declare-datatypes ((array!32068 0))(
  ( (array!32069 (arr!15417 (Array (_ BitVec 32) (_ BitVec 64))) (size!15781 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32068)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32068 (_ BitVec 32)) SeekEntryResult!3884)

(assert (=> b!495794 (= res!298190 (= lt!224452 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224448 (select (store (arr!15417 a!3235) i!1204 k!2280) j!176) (array!32069 (store (arr!15417 a!3235) i!1204 k!2280) (size!15781 a!3235)) mask!3524)))))

(declare-fun lt!224449 () (_ BitVec 32))

(assert (=> b!495794 (= lt!224452 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224449 (select (arr!15417 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!495794 (= lt!224448 (toIndex!0 (select (store (arr!15417 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!495794 (= lt!224449 (toIndex!0 (select (arr!15417 a!3235) j!176) mask!3524))))

(declare-fun e!290829 () Bool)

(assert (=> b!495794 e!290829))

(declare-fun res!298181 () Bool)

(assert (=> b!495794 (=> (not res!298181) (not e!290829))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32068 (_ BitVec 32)) Bool)

(assert (=> b!495794 (= res!298181 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14714 0))(
  ( (Unit!14715) )
))
(declare-fun lt!224450 () Unit!14714)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32068 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14714)

(assert (=> b!495794 (= lt!224450 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!495795 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32068 (_ BitVec 32)) SeekEntryResult!3884)

(assert (=> b!495795 (= e!290829 (= (seekEntryOrOpen!0 (select (arr!15417 a!3235) j!176) a!3235 mask!3524) (Found!3884 j!176)))))

(declare-fun b!495796 () Bool)

(declare-fun res!298182 () Bool)

(assert (=> b!495796 (=> res!298182 e!290828)))

(assert (=> b!495796 (= res!298182 (or (undefined!4696 lt!224452) (not (is-Intermediate!3884 lt!224452))))))

(declare-fun b!495797 () Bool)

(assert (=> b!495797 (= e!290831 e!290832)))

(declare-fun res!298180 () Bool)

(assert (=> b!495797 (=> (not res!298180) (not e!290832))))

(declare-fun lt!224451 () SeekEntryResult!3884)

(assert (=> b!495797 (= res!298180 (or (= lt!224451 (MissingZero!3884 i!1204)) (= lt!224451 (MissingVacant!3884 i!1204))))))

(assert (=> b!495797 (= lt!224451 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!495798 () Bool)

(declare-fun res!298187 () Bool)

(assert (=> b!495798 (=> (not res!298187) (not e!290831))))

(assert (=> b!495798 (= res!298187 (and (= (size!15781 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15781 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15781 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!495799 () Bool)

(assert (=> b!495799 (= e!290828 true)))

(assert (=> b!495799 (and (bvslt (x!46784 lt!224452) #b01111111111111111111111111111110) (or (= (select (arr!15417 a!3235) (index!17717 lt!224452)) (select (arr!15417 a!3235) j!176)) (= (select (arr!15417 a!3235) (index!17717 lt!224452)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15417 a!3235) (index!17717 lt!224452)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!298185 () Bool)

(assert (=> start!45180 (=> (not res!298185) (not e!290831))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45180 (= res!298185 (validMask!0 mask!3524))))

(assert (=> start!45180 e!290831))

(assert (=> start!45180 true))

(declare-fun array_inv!11213 (array!32068) Bool)

(assert (=> start!45180 (array_inv!11213 a!3235)))

(declare-fun b!495800 () Bool)

(declare-fun res!298184 () Bool)

(assert (=> b!495800 (=> (not res!298184) (not e!290832))))

(declare-datatypes ((List!9575 0))(
  ( (Nil!9572) (Cons!9571 (h!10442 (_ BitVec 64)) (t!15803 List!9575)) )
))
(declare-fun arrayNoDuplicates!0 (array!32068 (_ BitVec 32) List!9575) Bool)

(assert (=> b!495800 (= res!298184 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9572))))

(declare-fun b!495801 () Bool)

(declare-fun res!298186 () Bool)

(assert (=> b!495801 (=> (not res!298186) (not e!290831))))

(assert (=> b!495801 (= res!298186 (validKeyInArray!0 (select (arr!15417 a!3235) j!176)))))

(declare-fun b!495802 () Bool)

(declare-fun res!298189 () Bool)

(assert (=> b!495802 (=> (not res!298189) (not e!290831))))

(declare-fun arrayContainsKey!0 (array!32068 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!495802 (= res!298189 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!495803 () Bool)

(declare-fun res!298183 () Bool)

(assert (=> b!495803 (=> (not res!298183) (not e!290832))))

(assert (=> b!495803 (= res!298183 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!45180 res!298185) b!495798))

(assert (= (and b!495798 res!298187) b!495801))

(assert (= (and b!495801 res!298186) b!495793))

(assert (= (and b!495793 res!298188) b!495802))

(assert (= (and b!495802 res!298189) b!495797))

(assert (= (and b!495797 res!298180) b!495803))

(assert (= (and b!495803 res!298183) b!495800))

(assert (= (and b!495800 res!298184) b!495794))

(assert (= (and b!495794 res!298181) b!495795))

(assert (= (and b!495794 (not res!298190)) b!495796))

(assert (= (and b!495796 (not res!298182)) b!495799))

(declare-fun m!476931 () Bool)

(assert (=> b!495801 m!476931))

(assert (=> b!495801 m!476931))

(declare-fun m!476933 () Bool)

(assert (=> b!495801 m!476933))

(assert (=> b!495795 m!476931))

(assert (=> b!495795 m!476931))

(declare-fun m!476935 () Bool)

(assert (=> b!495795 m!476935))

(declare-fun m!476937 () Bool)

(assert (=> b!495802 m!476937))

(declare-fun m!476939 () Bool)

(assert (=> b!495799 m!476939))

(assert (=> b!495799 m!476931))

(assert (=> b!495794 m!476931))

(declare-fun m!476941 () Bool)

(assert (=> b!495794 m!476941))

(declare-fun m!476943 () Bool)

(assert (=> b!495794 m!476943))

(declare-fun m!476945 () Bool)

(assert (=> b!495794 m!476945))

(assert (=> b!495794 m!476931))

(declare-fun m!476947 () Bool)

(assert (=> b!495794 m!476947))

(assert (=> b!495794 m!476931))

(declare-fun m!476949 () Bool)

(assert (=> b!495794 m!476949))

(declare-fun m!476951 () Bool)

(assert (=> b!495794 m!476951))

(declare-fun m!476953 () Bool)

(assert (=> b!495794 m!476953))

(assert (=> b!495794 m!476951))

(declare-fun m!476955 () Bool)

(assert (=> b!495794 m!476955))

(assert (=> b!495794 m!476951))

(declare-fun m!476957 () Bool)

(assert (=> b!495797 m!476957))

(declare-fun m!476959 () Bool)

(assert (=> start!45180 m!476959))

(declare-fun m!476961 () Bool)

(assert (=> start!45180 m!476961))

(declare-fun m!476963 () Bool)

(assert (=> b!495800 m!476963))

(declare-fun m!476965 () Bool)

(assert (=> b!495803 m!476965))

(declare-fun m!476967 () Bool)

(assert (=> b!495793 m!476967))

(push 1)

(assert (not b!495797))

(assert (not b!495800))

(assert (not b!495801))

(assert (not b!495795))

(assert (not start!45180))

(assert (not b!495803))

(assert (not b!495794))

(assert (not b!495802))

(assert (not b!495793))

(check-sat)

(pop 1)

