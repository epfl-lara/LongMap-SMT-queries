; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44952 () Bool)

(assert start!44952)

(declare-fun b!492853 () Bool)

(declare-fun res!295571 () Bool)

(declare-fun e!289471 () Bool)

(assert (=> b!492853 (=> (not res!295571) (not e!289471))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!492853 (= res!295571 (validKeyInArray!0 k0!2280))))

(declare-fun b!492855 () Bool)

(declare-fun res!295573 () Bool)

(declare-fun e!289470 () Bool)

(assert (=> b!492855 (=> (not res!295573) (not e!289470))))

(declare-datatypes ((array!31907 0))(
  ( (array!31908 (arr!15338 (Array (_ BitVec 32) (_ BitVec 64))) (size!15703 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31907)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31907 (_ BitVec 32)) Bool)

(assert (=> b!492855 (= res!295573 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!492856 () Bool)

(declare-fun res!295565 () Bool)

(assert (=> b!492856 (=> (not res!295565) (not e!289470))))

(declare-datatypes ((List!9535 0))(
  ( (Nil!9532) (Cons!9531 (h!10399 (_ BitVec 64)) (t!15754 List!9535)) )
))
(declare-fun arrayNoDuplicates!0 (array!31907 (_ BitVec 32) List!9535) Bool)

(assert (=> b!492856 (= res!295565 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9532))))

(declare-fun b!492857 () Bool)

(declare-fun res!295569 () Bool)

(assert (=> b!492857 (=> (not res!295569) (not e!289471))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!492857 (= res!295569 (and (= (size!15703 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15703 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15703 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!492858 () Bool)

(declare-fun e!289472 () Bool)

(declare-datatypes ((SeekEntryResult!3802 0))(
  ( (MissingZero!3802 (index!17387 (_ BitVec 32))) (Found!3802 (index!17388 (_ BitVec 32))) (Intermediate!3802 (undefined!4614 Bool) (index!17389 (_ BitVec 32)) (x!46483 (_ BitVec 32))) (Undefined!3802) (MissingVacant!3802 (index!17390 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31907 (_ BitVec 32)) SeekEntryResult!3802)

(assert (=> b!492858 (= e!289472 (= (seekEntryOrOpen!0 (select (arr!15338 a!3235) j!176) a!3235 mask!3524) (Found!3802 j!176)))))

(declare-fun b!492859 () Bool)

(declare-fun e!289469 () Bool)

(declare-fun lt!222747 () SeekEntryResult!3802)

(get-info :version)

(assert (=> b!492859 (= e!289469 (or (not ((_ is Intermediate!3802) lt!222747)) (not (undefined!4614 lt!222747)) (bvsge mask!3524 #b00000000000000000000000000000000)))))

(declare-fun b!492860 () Bool)

(declare-fun res!295566 () Bool)

(assert (=> b!492860 (=> (not res!295566) (not e!289471))))

(declare-fun arrayContainsKey!0 (array!31907 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!492860 (= res!295566 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!492861 () Bool)

(assert (=> b!492861 (= e!289470 (not e!289469))))

(declare-fun res!295567 () Bool)

(assert (=> b!492861 (=> res!295567 e!289469)))

(declare-fun lt!222748 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31907 (_ BitVec 32)) SeekEntryResult!3802)

(assert (=> b!492861 (= res!295567 (= lt!222747 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!222748 (select (store (arr!15338 a!3235) i!1204 k0!2280) j!176) (array!31908 (store (arr!15338 a!3235) i!1204 k0!2280) (size!15703 a!3235)) mask!3524)))))

(declare-fun lt!222746 () (_ BitVec 32))

(assert (=> b!492861 (= lt!222747 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!222746 (select (arr!15338 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!492861 (= lt!222748 (toIndex!0 (select (store (arr!15338 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!492861 (= lt!222746 (toIndex!0 (select (arr!15338 a!3235) j!176) mask!3524))))

(assert (=> b!492861 e!289472))

(declare-fun res!295568 () Bool)

(assert (=> b!492861 (=> (not res!295568) (not e!289472))))

(assert (=> b!492861 (= res!295568 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14536 0))(
  ( (Unit!14537) )
))
(declare-fun lt!222744 () Unit!14536)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31907 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14536)

(assert (=> b!492861 (= lt!222744 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!492862 () Bool)

(assert (=> b!492862 (= e!289471 e!289470)))

(declare-fun res!295572 () Bool)

(assert (=> b!492862 (=> (not res!295572) (not e!289470))))

(declare-fun lt!222745 () SeekEntryResult!3802)

(assert (=> b!492862 (= res!295572 (or (= lt!222745 (MissingZero!3802 i!1204)) (= lt!222745 (MissingVacant!3802 i!1204))))))

(assert (=> b!492862 (= lt!222745 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!492854 () Bool)

(declare-fun res!295574 () Bool)

(assert (=> b!492854 (=> (not res!295574) (not e!289471))))

(assert (=> b!492854 (= res!295574 (validKeyInArray!0 (select (arr!15338 a!3235) j!176)))))

(declare-fun res!295570 () Bool)

(assert (=> start!44952 (=> (not res!295570) (not e!289471))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44952 (= res!295570 (validMask!0 mask!3524))))

(assert (=> start!44952 e!289471))

(assert (=> start!44952 true))

(declare-fun array_inv!11221 (array!31907) Bool)

(assert (=> start!44952 (array_inv!11221 a!3235)))

(assert (= (and start!44952 res!295570) b!492857))

(assert (= (and b!492857 res!295569) b!492854))

(assert (= (and b!492854 res!295574) b!492853))

(assert (= (and b!492853 res!295571) b!492860))

(assert (= (and b!492860 res!295566) b!492862))

(assert (= (and b!492862 res!295572) b!492855))

(assert (= (and b!492855 res!295573) b!492856))

(assert (= (and b!492856 res!295565) b!492861))

(assert (= (and b!492861 res!295568) b!492858))

(assert (= (and b!492861 (not res!295567)) b!492859))

(declare-fun m!473131 () Bool)

(assert (=> b!492858 m!473131))

(assert (=> b!492858 m!473131))

(declare-fun m!473133 () Bool)

(assert (=> b!492858 m!473133))

(declare-fun m!473135 () Bool)

(assert (=> b!492856 m!473135))

(declare-fun m!473137 () Bool)

(assert (=> b!492862 m!473137))

(declare-fun m!473139 () Bool)

(assert (=> b!492855 m!473139))

(declare-fun m!473141 () Bool)

(assert (=> b!492853 m!473141))

(declare-fun m!473143 () Bool)

(assert (=> b!492860 m!473143))

(assert (=> b!492854 m!473131))

(assert (=> b!492854 m!473131))

(declare-fun m!473145 () Bool)

(assert (=> b!492854 m!473145))

(declare-fun m!473147 () Bool)

(assert (=> start!44952 m!473147))

(declare-fun m!473149 () Bool)

(assert (=> start!44952 m!473149))

(declare-fun m!473151 () Bool)

(assert (=> b!492861 m!473151))

(declare-fun m!473153 () Bool)

(assert (=> b!492861 m!473153))

(declare-fun m!473155 () Bool)

(assert (=> b!492861 m!473155))

(declare-fun m!473157 () Bool)

(assert (=> b!492861 m!473157))

(assert (=> b!492861 m!473153))

(assert (=> b!492861 m!473131))

(declare-fun m!473159 () Bool)

(assert (=> b!492861 m!473159))

(assert (=> b!492861 m!473131))

(declare-fun m!473161 () Bool)

(assert (=> b!492861 m!473161))

(assert (=> b!492861 m!473153))

(declare-fun m!473163 () Bool)

(assert (=> b!492861 m!473163))

(assert (=> b!492861 m!473131))

(declare-fun m!473165 () Bool)

(assert (=> b!492861 m!473165))

(check-sat (not b!492862) (not b!492856) (not b!492853) (not b!492861) (not b!492858) (not b!492860) (not start!44952) (not b!492854) (not b!492855))
(check-sat)
