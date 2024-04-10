; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44712 () Bool)

(assert start!44712)

(declare-fun b!490704 () Bool)

(declare-fun res!293644 () Bool)

(declare-fun e!288423 () Bool)

(assert (=> b!490704 (=> (not res!293644) (not e!288423))))

(declare-datatypes ((array!31771 0))(
  ( (array!31772 (arr!15273 (Array (_ BitVec 32) (_ BitVec 64))) (size!15637 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31771)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!490704 (= res!293644 (validKeyInArray!0 (select (arr!15273 a!3235) j!176)))))

(declare-fun b!490705 () Bool)

(declare-fun res!293646 () Bool)

(assert (=> b!490705 (=> (not res!293646) (not e!288423))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!490705 (= res!293646 (and (= (size!15637 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15637 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15637 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!490706 () Bool)

(declare-fun res!293642 () Bool)

(assert (=> b!490706 (=> (not res!293642) (not e!288423))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31771 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!490706 (= res!293642 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!490708 () Bool)

(declare-fun res!293645 () Bool)

(declare-fun e!288424 () Bool)

(assert (=> b!490708 (=> (not res!293645) (not e!288424))))

(declare-datatypes ((List!9431 0))(
  ( (Nil!9428) (Cons!9427 (h!10289 (_ BitVec 64)) (t!15659 List!9431)) )
))
(declare-fun arrayNoDuplicates!0 (array!31771 (_ BitVec 32) List!9431) Bool)

(assert (=> b!490708 (= res!293645 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9428))))

(declare-fun b!490709 () Bool)

(declare-fun res!293648 () Bool)

(assert (=> b!490709 (=> (not res!293648) (not e!288424))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31771 (_ BitVec 32)) Bool)

(assert (=> b!490709 (= res!293648 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!490710 () Bool)

(declare-fun e!288426 () Bool)

(assert (=> b!490710 (= e!288426 true)))

(declare-datatypes ((SeekEntryResult!3740 0))(
  ( (MissingZero!3740 (index!17139 (_ BitVec 32))) (Found!3740 (index!17140 (_ BitVec 32))) (Intermediate!3740 (undefined!4552 Bool) (index!17141 (_ BitVec 32)) (x!46238 (_ BitVec 32))) (Undefined!3740) (MissingVacant!3740 (index!17142 (_ BitVec 32))) )
))
(declare-fun lt!221671 () SeekEntryResult!3740)

(declare-fun lt!221670 () (_ BitVec 64))

(declare-fun lt!221674 () array!31771)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31771 (_ BitVec 32)) SeekEntryResult!3740)

(assert (=> b!490710 (= lt!221671 (seekEntryOrOpen!0 lt!221670 lt!221674 mask!3524))))

(declare-datatypes ((Unit!14426 0))(
  ( (Unit!14427) )
))
(declare-fun lt!221669 () Unit!14426)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!31771 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!14426)

(assert (=> b!490710 (= lt!221669 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k!2280 j!176 mask!3524))))

(declare-fun b!490711 () Bool)

(declare-fun res!293640 () Bool)

(assert (=> b!490711 (=> (not res!293640) (not e!288423))))

(assert (=> b!490711 (= res!293640 (validKeyInArray!0 k!2280))))

(declare-fun b!490712 () Bool)

(assert (=> b!490712 (= e!288423 e!288424)))

(declare-fun res!293641 () Bool)

(assert (=> b!490712 (=> (not res!293641) (not e!288424))))

(declare-fun lt!221673 () SeekEntryResult!3740)

(assert (=> b!490712 (= res!293641 (or (= lt!221673 (MissingZero!3740 i!1204)) (= lt!221673 (MissingVacant!3740 i!1204))))))

(assert (=> b!490712 (= lt!221673 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!490707 () Bool)

(assert (=> b!490707 (= e!288424 (not e!288426))))

(declare-fun res!293643 () Bool)

(assert (=> b!490707 (=> res!293643 e!288426)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31771 (_ BitVec 32)) SeekEntryResult!3740)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!490707 (= res!293643 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15273 a!3235) j!176) mask!3524) (select (arr!15273 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!221670 mask!3524) lt!221670 lt!221674 mask!3524))))))

(assert (=> b!490707 (= lt!221670 (select (store (arr!15273 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!490707 (= lt!221674 (array!31772 (store (arr!15273 a!3235) i!1204 k!2280) (size!15637 a!3235)))))

(assert (=> b!490707 (= lt!221671 (Found!3740 j!176))))

(assert (=> b!490707 (= lt!221671 (seekEntryOrOpen!0 (select (arr!15273 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!490707 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!221672 () Unit!14426)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31771 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14426)

(assert (=> b!490707 (= lt!221672 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!293647 () Bool)

(assert (=> start!44712 (=> (not res!293647) (not e!288423))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44712 (= res!293647 (validMask!0 mask!3524))))

(assert (=> start!44712 e!288423))

(assert (=> start!44712 true))

(declare-fun array_inv!11069 (array!31771) Bool)

(assert (=> start!44712 (array_inv!11069 a!3235)))

(assert (= (and start!44712 res!293647) b!490705))

(assert (= (and b!490705 res!293646) b!490704))

(assert (= (and b!490704 res!293644) b!490711))

(assert (= (and b!490711 res!293640) b!490706))

(assert (= (and b!490706 res!293642) b!490712))

(assert (= (and b!490712 res!293641) b!490709))

(assert (= (and b!490709 res!293648) b!490708))

(assert (= (and b!490708 res!293645) b!490707))

(assert (= (and b!490707 (not res!293643)) b!490710))

(declare-fun m!470937 () Bool)

(assert (=> b!490706 m!470937))

(declare-fun m!470939 () Bool)

(assert (=> b!490709 m!470939))

(declare-fun m!470941 () Bool)

(assert (=> b!490710 m!470941))

(declare-fun m!470943 () Bool)

(assert (=> b!490710 m!470943))

(declare-fun m!470945 () Bool)

(assert (=> b!490708 m!470945))

(declare-fun m!470947 () Bool)

(assert (=> b!490711 m!470947))

(declare-fun m!470949 () Bool)

(assert (=> b!490704 m!470949))

(assert (=> b!490704 m!470949))

(declare-fun m!470951 () Bool)

(assert (=> b!490704 m!470951))

(declare-fun m!470953 () Bool)

(assert (=> start!44712 m!470953))

(declare-fun m!470955 () Bool)

(assert (=> start!44712 m!470955))

(declare-fun m!470957 () Bool)

(assert (=> b!490712 m!470957))

(declare-fun m!470959 () Bool)

(assert (=> b!490707 m!470959))

(declare-fun m!470961 () Bool)

(assert (=> b!490707 m!470961))

(declare-fun m!470963 () Bool)

(assert (=> b!490707 m!470963))

(assert (=> b!490707 m!470949))

(declare-fun m!470965 () Bool)

(assert (=> b!490707 m!470965))

(declare-fun m!470967 () Bool)

(assert (=> b!490707 m!470967))

(declare-fun m!470969 () Bool)

(assert (=> b!490707 m!470969))

(assert (=> b!490707 m!470949))

(assert (=> b!490707 m!470963))

(assert (=> b!490707 m!470949))

(declare-fun m!470971 () Bool)

(assert (=> b!490707 m!470971))

(assert (=> b!490707 m!470949))

(declare-fun m!470973 () Bool)

(assert (=> b!490707 m!470973))

(assert (=> b!490707 m!470967))

(declare-fun m!470975 () Bool)

(assert (=> b!490707 m!470975))

(push 1)

