; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45042 () Bool)

(assert start!45042)

(declare-fun b!494185 () Bool)

(declare-fun res!296905 () Bool)

(declare-fun e!290018 () Bool)

(assert (=> b!494185 (=> res!296905 e!290018)))

(declare-datatypes ((SeekEntryResult!3847 0))(
  ( (MissingZero!3847 (index!17567 (_ BitVec 32))) (Found!3847 (index!17568 (_ BitVec 32))) (Intermediate!3847 (undefined!4659 Bool) (index!17569 (_ BitVec 32)) (x!46648 (_ BitVec 32))) (Undefined!3847) (MissingVacant!3847 (index!17570 (_ BitVec 32))) )
))
(declare-fun lt!223548 () SeekEntryResult!3847)

(get-info :version)

(assert (=> b!494185 (= res!296905 (or (not ((_ is Intermediate!3847) lt!223548)) (not (undefined!4659 lt!223548))))))

(declare-fun b!494186 () Bool)

(assert (=> b!494186 (= e!290018 true)))

(declare-fun lt!223547 () SeekEntryResult!3847)

(assert (=> b!494186 (= lt!223547 Undefined!3847)))

(declare-fun b!494187 () Bool)

(declare-fun res!296904 () Bool)

(declare-fun e!290016 () Bool)

(assert (=> b!494187 (=> (not res!296904) (not e!290016))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!494187 (= res!296904 (validKeyInArray!0 k0!2280))))

(declare-fun b!494188 () Bool)

(declare-fun res!296899 () Bool)

(declare-fun e!290019 () Bool)

(assert (=> b!494188 (=> (not res!296899) (not e!290019))))

(declare-datatypes ((array!31997 0))(
  ( (array!31998 (arr!15383 (Array (_ BitVec 32) (_ BitVec 64))) (size!15748 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31997)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31997 (_ BitVec 32)) Bool)

(assert (=> b!494188 (= res!296899 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!296906 () Bool)

(assert (=> start!45042 (=> (not res!296906) (not e!290016))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45042 (= res!296906 (validMask!0 mask!3524))))

(assert (=> start!45042 e!290016))

(assert (=> start!45042 true))

(declare-fun array_inv!11266 (array!31997) Bool)

(assert (=> start!45042 (array_inv!11266 a!3235)))

(declare-fun b!494189 () Bool)

(assert (=> b!494189 (= e!290016 e!290019)))

(declare-fun res!296898 () Bool)

(assert (=> b!494189 (=> (not res!296898) (not e!290019))))

(declare-fun lt!223552 () SeekEntryResult!3847)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!494189 (= res!296898 (or (= lt!223552 (MissingZero!3847 i!1204)) (= lt!223552 (MissingVacant!3847 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31997 (_ BitVec 32)) SeekEntryResult!3847)

(assert (=> b!494189 (= lt!223552 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!494190 () Bool)

(declare-fun res!296897 () Bool)

(assert (=> b!494190 (=> (not res!296897) (not e!290019))))

(declare-datatypes ((List!9580 0))(
  ( (Nil!9577) (Cons!9576 (h!10444 (_ BitVec 64)) (t!15799 List!9580)) )
))
(declare-fun arrayNoDuplicates!0 (array!31997 (_ BitVec 32) List!9580) Bool)

(assert (=> b!494190 (= res!296897 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9577))))

(declare-fun b!494191 () Bool)

(declare-fun res!296901 () Bool)

(assert (=> b!494191 (=> (not res!296901) (not e!290016))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!494191 (= res!296901 (and (= (size!15748 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15748 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15748 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!494192 () Bool)

(declare-fun res!296903 () Bool)

(assert (=> b!494192 (=> (not res!296903) (not e!290016))))

(assert (=> b!494192 (= res!296903 (validKeyInArray!0 (select (arr!15383 a!3235) j!176)))))

(declare-fun b!494193 () Bool)

(declare-fun res!296900 () Bool)

(assert (=> b!494193 (=> (not res!296900) (not e!290016))))

(declare-fun arrayContainsKey!0 (array!31997 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!494193 (= res!296900 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!494194 () Bool)

(assert (=> b!494194 (= e!290019 (not e!290018))))

(declare-fun res!296902 () Bool)

(assert (=> b!494194 (=> res!296902 e!290018)))

(declare-fun lt!223550 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31997 (_ BitVec 32)) SeekEntryResult!3847)

(assert (=> b!494194 (= res!296902 (= lt!223548 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223550 (select (store (arr!15383 a!3235) i!1204 k0!2280) j!176) (array!31998 (store (arr!15383 a!3235) i!1204 k0!2280) (size!15748 a!3235)) mask!3524)))))

(declare-fun lt!223549 () (_ BitVec 32))

(assert (=> b!494194 (= lt!223548 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223549 (select (arr!15383 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!494194 (= lt!223550 (toIndex!0 (select (store (arr!15383 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!494194 (= lt!223549 (toIndex!0 (select (arr!15383 a!3235) j!176) mask!3524))))

(assert (=> b!494194 (= lt!223547 (Found!3847 j!176))))

(assert (=> b!494194 (= lt!223547 (seekEntryOrOpen!0 (select (arr!15383 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!494194 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14626 0))(
  ( (Unit!14627) )
))
(declare-fun lt!223551 () Unit!14626)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31997 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14626)

(assert (=> b!494194 (= lt!223551 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!45042 res!296906) b!494191))

(assert (= (and b!494191 res!296901) b!494192))

(assert (= (and b!494192 res!296903) b!494187))

(assert (= (and b!494187 res!296904) b!494193))

(assert (= (and b!494193 res!296900) b!494189))

(assert (= (and b!494189 res!296898) b!494188))

(assert (= (and b!494188 res!296899) b!494190))

(assert (= (and b!494190 res!296897) b!494194))

(assert (= (and b!494194 (not res!296902)) b!494185))

(assert (= (and b!494185 (not res!296905)) b!494186))

(declare-fun m!474751 () Bool)

(assert (=> b!494188 m!474751))

(declare-fun m!474753 () Bool)

(assert (=> start!45042 m!474753))

(declare-fun m!474755 () Bool)

(assert (=> start!45042 m!474755))

(declare-fun m!474757 () Bool)

(assert (=> b!494189 m!474757))

(declare-fun m!474759 () Bool)

(assert (=> b!494190 m!474759))

(declare-fun m!474761 () Bool)

(assert (=> b!494193 m!474761))

(declare-fun m!474763 () Bool)

(assert (=> b!494194 m!474763))

(declare-fun m!474765 () Bool)

(assert (=> b!494194 m!474765))

(declare-fun m!474767 () Bool)

(assert (=> b!494194 m!474767))

(declare-fun m!474769 () Bool)

(assert (=> b!494194 m!474769))

(declare-fun m!474771 () Bool)

(assert (=> b!494194 m!474771))

(declare-fun m!474773 () Bool)

(assert (=> b!494194 m!474773))

(assert (=> b!494194 m!474771))

(declare-fun m!474775 () Bool)

(assert (=> b!494194 m!474775))

(assert (=> b!494194 m!474771))

(declare-fun m!474777 () Bool)

(assert (=> b!494194 m!474777))

(assert (=> b!494194 m!474767))

(declare-fun m!474779 () Bool)

(assert (=> b!494194 m!474779))

(assert (=> b!494194 m!474771))

(declare-fun m!474781 () Bool)

(assert (=> b!494194 m!474781))

(assert (=> b!494194 m!474767))

(declare-fun m!474783 () Bool)

(assert (=> b!494187 m!474783))

(assert (=> b!494192 m!474771))

(assert (=> b!494192 m!474771))

(declare-fun m!474785 () Bool)

(assert (=> b!494192 m!474785))

(check-sat (not b!494189) (not b!494193) (not b!494194) (not b!494192) (not b!494188) (not start!45042) (not b!494190) (not b!494187))
(check-sat)
