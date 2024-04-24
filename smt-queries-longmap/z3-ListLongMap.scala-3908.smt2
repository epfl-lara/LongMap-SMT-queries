; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53508 () Bool)

(assert start!53508)

(declare-fun b!581915 () Bool)

(declare-fun res!369631 () Bool)

(declare-fun e!333880 () Bool)

(assert (=> b!581915 (=> (not res!369631) (not e!333880))))

(declare-datatypes ((array!36354 0))(
  ( (array!36355 (arr!17449 (Array (_ BitVec 32) (_ BitVec 64))) (size!17813 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36354)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36354 (_ BitVec 32)) Bool)

(assert (=> b!581915 (= res!369631 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!581916 () Bool)

(assert (=> b!581916 (= e!333880 false)))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5845 0))(
  ( (MissingZero!5845 (index!25607 (_ BitVec 32))) (Found!5845 (index!25608 (_ BitVec 32))) (Intermediate!5845 (undefined!6657 Bool) (index!25609 (_ BitVec 32)) (x!54621 (_ BitVec 32))) (Undefined!5845) (MissingVacant!5845 (index!25610 (_ BitVec 32))) )
))
(declare-fun lt!265077 () SeekEntryResult!5845)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36354 (_ BitVec 32)) SeekEntryResult!5845)

(assert (=> b!581916 (= lt!265077 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17449 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!581917 () Bool)

(declare-fun res!369627 () Bool)

(declare-fun e!333881 () Bool)

(assert (=> b!581917 (=> (not res!369627) (not e!333881))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!581917 (= res!369627 (validKeyInArray!0 (select (arr!17449 a!2986) j!136)))))

(declare-fun b!581919 () Bool)

(declare-fun res!369626 () Bool)

(assert (=> b!581919 (=> (not res!369626) (not e!333880))))

(declare-datatypes ((List!11397 0))(
  ( (Nil!11394) (Cons!11393 (h!12441 (_ BitVec 64)) (t!17617 List!11397)) )
))
(declare-fun arrayNoDuplicates!0 (array!36354 (_ BitVec 32) List!11397) Bool)

(assert (=> b!581919 (= res!369626 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11394))))

(declare-fun b!581918 () Bool)

(declare-fun res!369634 () Bool)

(assert (=> b!581918 (=> (not res!369634) (not e!333881))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36354 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!581918 (= res!369634 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!369630 () Bool)

(assert (=> start!53508 (=> (not res!369630) (not e!333881))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53508 (= res!369630 (validMask!0 mask!3053))))

(assert (=> start!53508 e!333881))

(assert (=> start!53508 true))

(declare-fun array_inv!13308 (array!36354) Bool)

(assert (=> start!53508 (array_inv!13308 a!2986)))

(declare-fun b!581920 () Bool)

(declare-fun res!369628 () Bool)

(assert (=> b!581920 (=> (not res!369628) (not e!333881))))

(assert (=> b!581920 (= res!369628 (validKeyInArray!0 k0!1786))))

(declare-fun b!581921 () Bool)

(assert (=> b!581921 (= e!333881 e!333880)))

(declare-fun res!369629 () Bool)

(assert (=> b!581921 (=> (not res!369629) (not e!333880))))

(declare-fun lt!265078 () SeekEntryResult!5845)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!581921 (= res!369629 (or (= lt!265078 (MissingZero!5845 i!1108)) (= lt!265078 (MissingVacant!5845 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36354 (_ BitVec 32)) SeekEntryResult!5845)

(assert (=> b!581921 (= lt!265078 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!581922 () Bool)

(declare-fun res!369633 () Bool)

(assert (=> b!581922 (=> (not res!369633) (not e!333881))))

(assert (=> b!581922 (= res!369633 (and (= (size!17813 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17813 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17813 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!581923 () Bool)

(declare-fun res!369632 () Bool)

(assert (=> b!581923 (=> (not res!369632) (not e!333880))))

(assert (=> b!581923 (= res!369632 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17449 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17449 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!53508 res!369630) b!581922))

(assert (= (and b!581922 res!369633) b!581917))

(assert (= (and b!581917 res!369627) b!581920))

(assert (= (and b!581920 res!369628) b!581918))

(assert (= (and b!581918 res!369634) b!581921))

(assert (= (and b!581921 res!369629) b!581915))

(assert (= (and b!581915 res!369631) b!581919))

(assert (= (and b!581919 res!369626) b!581923))

(assert (= (and b!581923 res!369632) b!581916))

(declare-fun m!560597 () Bool)

(assert (=> b!581918 m!560597))

(declare-fun m!560599 () Bool)

(assert (=> b!581921 m!560599))

(declare-fun m!560601 () Bool)

(assert (=> b!581920 m!560601))

(declare-fun m!560603 () Bool)

(assert (=> b!581915 m!560603))

(declare-fun m!560605 () Bool)

(assert (=> b!581923 m!560605))

(declare-fun m!560607 () Bool)

(assert (=> b!581923 m!560607))

(declare-fun m!560609 () Bool)

(assert (=> b!581923 m!560609))

(declare-fun m!560611 () Bool)

(assert (=> b!581916 m!560611))

(assert (=> b!581916 m!560611))

(declare-fun m!560613 () Bool)

(assert (=> b!581916 m!560613))

(declare-fun m!560615 () Bool)

(assert (=> start!53508 m!560615))

(declare-fun m!560617 () Bool)

(assert (=> start!53508 m!560617))

(assert (=> b!581917 m!560611))

(assert (=> b!581917 m!560611))

(declare-fun m!560619 () Bool)

(assert (=> b!581917 m!560619))

(declare-fun m!560621 () Bool)

(assert (=> b!581919 m!560621))

(check-sat (not b!581915) (not b!581918) (not b!581920) (not b!581917) (not b!581916) (not start!53508) (not b!581919) (not b!581921))
(check-sat)
