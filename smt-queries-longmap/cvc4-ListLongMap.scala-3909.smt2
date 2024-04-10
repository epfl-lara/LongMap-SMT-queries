; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53468 () Bool)

(assert start!53468)

(declare-fun b!581866 () Bool)

(declare-fun res!369686 () Bool)

(declare-fun e!333798 () Bool)

(assert (=> b!581866 (=> (not res!369686) (not e!333798))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-datatypes ((array!36369 0))(
  ( (array!36370 (arr!17459 (Array (_ BitVec 32) (_ BitVec 64))) (size!17823 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36369)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!581866 (= res!369686 (and (= (size!17823 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17823 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17823 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!581867 () Bool)

(declare-fun res!369690 () Bool)

(declare-fun e!333797 () Bool)

(assert (=> b!581867 (=> (not res!369690) (not e!333797))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36369 (_ BitVec 32)) Bool)

(assert (=> b!581867 (= res!369690 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!581868 () Bool)

(declare-fun res!369687 () Bool)

(assert (=> b!581868 (=> (not res!369687) (not e!333797))))

(declare-datatypes ((List!11500 0))(
  ( (Nil!11497) (Cons!11496 (h!12541 (_ BitVec 64)) (t!17728 List!11500)) )
))
(declare-fun arrayNoDuplicates!0 (array!36369 (_ BitVec 32) List!11500) Bool)

(assert (=> b!581868 (= res!369687 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11497))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun b!581869 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!581869 (= e!333797 (not (validKeyInArray!0 (select (store (arr!17459 a!2986) i!1108 k!1786) j!136))))))

(declare-fun b!581870 () Bool)

(declare-fun res!369682 () Bool)

(assert (=> b!581870 (=> (not res!369682) (not e!333797))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!581870 (= res!369682 (and (bvslt x!910 #b01111111111111111111111111111110) (= (select (arr!17459 a!2986) index!984) (select (arr!17459 a!2986) j!136)) (= index!984 j!136) (bvsge mask!3053 #b00000000000000000000000000000000)))))

(declare-fun b!581871 () Bool)

(declare-fun res!369689 () Bool)

(assert (=> b!581871 (=> (not res!369689) (not e!333798))))

(assert (=> b!581871 (= res!369689 (validKeyInArray!0 (select (arr!17459 a!2986) j!136)))))

(declare-fun b!581872 () Bool)

(declare-fun res!369685 () Bool)

(assert (=> b!581872 (=> (not res!369685) (not e!333797))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!581872 (= res!369685 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17459 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17459 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!581873 () Bool)

(declare-fun res!369684 () Bool)

(assert (=> b!581873 (=> (not res!369684) (not e!333798))))

(declare-fun arrayContainsKey!0 (array!36369 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!581873 (= res!369684 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!581874 () Bool)

(declare-fun res!369692 () Bool)

(assert (=> b!581874 (=> (not res!369692) (not e!333798))))

(assert (=> b!581874 (= res!369692 (validKeyInArray!0 k!1786))))

(declare-fun b!581875 () Bool)

(declare-fun res!369683 () Bool)

(assert (=> b!581875 (=> (not res!369683) (not e!333797))))

(declare-datatypes ((SeekEntryResult!5899 0))(
  ( (MissingZero!5899 (index!25823 (_ BitVec 32))) (Found!5899 (index!25824 (_ BitVec 32))) (Intermediate!5899 (undefined!6711 Bool) (index!25825 (_ BitVec 32)) (x!54680 (_ BitVec 32))) (Undefined!5899) (MissingVacant!5899 (index!25826 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36369 (_ BitVec 32)) SeekEntryResult!5899)

(assert (=> b!581875 (= res!369683 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17459 a!2986) j!136) a!2986 mask!3053) (Found!5899 j!136)))))

(declare-fun res!369688 () Bool)

(assert (=> start!53468 (=> (not res!369688) (not e!333798))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53468 (= res!369688 (validMask!0 mask!3053))))

(assert (=> start!53468 e!333798))

(assert (=> start!53468 true))

(declare-fun array_inv!13255 (array!36369) Bool)

(assert (=> start!53468 (array_inv!13255 a!2986)))

(declare-fun b!581876 () Bool)

(assert (=> b!581876 (= e!333798 e!333797)))

(declare-fun res!369691 () Bool)

(assert (=> b!581876 (=> (not res!369691) (not e!333797))))

(declare-fun lt!264988 () SeekEntryResult!5899)

(assert (=> b!581876 (= res!369691 (or (= lt!264988 (MissingZero!5899 i!1108)) (= lt!264988 (MissingVacant!5899 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36369 (_ BitVec 32)) SeekEntryResult!5899)

(assert (=> b!581876 (= lt!264988 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(assert (= (and start!53468 res!369688) b!581866))

(assert (= (and b!581866 res!369686) b!581871))

(assert (= (and b!581871 res!369689) b!581874))

(assert (= (and b!581874 res!369692) b!581873))

(assert (= (and b!581873 res!369684) b!581876))

(assert (= (and b!581876 res!369691) b!581867))

(assert (= (and b!581867 res!369690) b!581868))

(assert (= (and b!581868 res!369687) b!581872))

(assert (= (and b!581872 res!369685) b!581875))

(assert (= (and b!581875 res!369683) b!581870))

(assert (= (and b!581870 res!369682) b!581869))

(declare-fun m!560387 () Bool)

(assert (=> b!581867 m!560387))

(declare-fun m!560389 () Bool)

(assert (=> b!581869 m!560389))

(declare-fun m!560391 () Bool)

(assert (=> b!581869 m!560391))

(assert (=> b!581869 m!560391))

(declare-fun m!560393 () Bool)

(assert (=> b!581869 m!560393))

(declare-fun m!560395 () Bool)

(assert (=> start!53468 m!560395))

(declare-fun m!560397 () Bool)

(assert (=> start!53468 m!560397))

(declare-fun m!560399 () Bool)

(assert (=> b!581871 m!560399))

(assert (=> b!581871 m!560399))

(declare-fun m!560401 () Bool)

(assert (=> b!581871 m!560401))

(declare-fun m!560403 () Bool)

(assert (=> b!581873 m!560403))

(declare-fun m!560405 () Bool)

(assert (=> b!581876 m!560405))

(declare-fun m!560407 () Bool)

(assert (=> b!581874 m!560407))

(declare-fun m!560409 () Bool)

(assert (=> b!581872 m!560409))

(assert (=> b!581872 m!560389))

(declare-fun m!560411 () Bool)

(assert (=> b!581872 m!560411))

(assert (=> b!581875 m!560399))

(assert (=> b!581875 m!560399))

(declare-fun m!560413 () Bool)

(assert (=> b!581875 m!560413))

(declare-fun m!560415 () Bool)

(assert (=> b!581870 m!560415))

(assert (=> b!581870 m!560399))

(declare-fun m!560417 () Bool)

(assert (=> b!581868 m!560417))

(push 1)

(assert (not b!581875))

(assert (not b!581873))

(assert (not start!53468))

(assert (not b!581869))

(assert (not b!581876))

(assert (not b!581867))

(assert (not b!581868))

(assert (not b!581871))

(assert (not b!581874))

(check-sat)

(pop 1)

(push 1)

(check-sat)

