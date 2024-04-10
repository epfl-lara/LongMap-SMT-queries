; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120360 () Bool)

(assert start!120360)

(declare-fun b!1400948 () Bool)

(declare-fun res!939462 () Bool)

(declare-fun e!793222 () Bool)

(assert (=> b!1400948 (=> (not res!939462) (not e!793222))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95769 0))(
  ( (array!95770 (arr!46235 (Array (_ BitVec 32) (_ BitVec 64))) (size!46785 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95769)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1400948 (= res!939462 (and (= (size!46785 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46785 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46785 a!2901)) (not (= i!1037 j!112))))))

(declare-fun e!793225 () Bool)

(declare-fun b!1400949 () Bool)

(declare-datatypes ((SeekEntryResult!10552 0))(
  ( (MissingZero!10552 (index!44585 (_ BitVec 32))) (Found!10552 (index!44586 (_ BitVec 32))) (Intermediate!10552 (undefined!11364 Bool) (index!44587 (_ BitVec 32)) (x!126227 (_ BitVec 32))) (Undefined!10552) (MissingVacant!10552 (index!44588 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95769 (_ BitVec 32)) SeekEntryResult!10552)

(assert (=> b!1400949 (= e!793225 (= (seekEntryOrOpen!0 (select (arr!46235 a!2901) j!112) a!2901 mask!2840) (Found!10552 j!112)))))

(declare-fun lt!616581 () (_ BitVec 64))

(declare-fun lt!616580 () array!95769)

(declare-fun b!1400950 () Bool)

(declare-fun e!793220 () Bool)

(declare-fun lt!616577 () SeekEntryResult!10552)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95769 (_ BitVec 32)) SeekEntryResult!10552)

(assert (=> b!1400950 (= e!793220 (= (seekEntryOrOpen!0 lt!616581 lt!616580 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126227 lt!616577) (index!44587 lt!616577) (index!44587 lt!616577) (select (arr!46235 a!2901) j!112) lt!616580 mask!2840)))))

(declare-fun res!939467 () Bool)

(assert (=> start!120360 (=> (not res!939467) (not e!793222))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120360 (= res!939467 (validMask!0 mask!2840))))

(assert (=> start!120360 e!793222))

(assert (=> start!120360 true))

(declare-fun array_inv!35263 (array!95769) Bool)

(assert (=> start!120360 (array_inv!35263 a!2901)))

(declare-fun b!1400951 () Bool)

(declare-fun e!793226 () Bool)

(assert (=> b!1400951 (= e!793226 true)))

(declare-fun lt!616578 () (_ BitVec 32))

(declare-fun lt!616579 () SeekEntryResult!10552)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95769 (_ BitVec 32)) SeekEntryResult!10552)

(assert (=> b!1400951 (= lt!616579 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616578 lt!616581 lt!616580 mask!2840))))

(declare-fun b!1400952 () Bool)

(declare-fun res!939464 () Bool)

(assert (=> b!1400952 (=> (not res!939464) (not e!793222))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1400952 (= res!939464 (validKeyInArray!0 (select (arr!46235 a!2901) j!112)))))

(declare-fun b!1400953 () Bool)

(declare-fun res!939466 () Bool)

(assert (=> b!1400953 (=> (not res!939466) (not e!793222))))

(declare-datatypes ((List!32754 0))(
  ( (Nil!32751) (Cons!32750 (h!33998 (_ BitVec 64)) (t!47448 List!32754)) )
))
(declare-fun arrayNoDuplicates!0 (array!95769 (_ BitVec 32) List!32754) Bool)

(assert (=> b!1400953 (= res!939466 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32751))))

(declare-fun b!1400954 () Bool)

(declare-fun e!793223 () Bool)

(assert (=> b!1400954 (= e!793222 (not e!793223))))

(declare-fun res!939463 () Bool)

(assert (=> b!1400954 (=> res!939463 e!793223)))

(declare-fun lt!616574 () SeekEntryResult!10552)

(assert (=> b!1400954 (= res!939463 (or (not (is-Intermediate!10552 lt!616574)) (undefined!11364 lt!616574)))))

(assert (=> b!1400954 e!793225))

(declare-fun res!939461 () Bool)

(assert (=> b!1400954 (=> (not res!939461) (not e!793225))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95769 (_ BitVec 32)) Bool)

(assert (=> b!1400954 (= res!939461 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47108 0))(
  ( (Unit!47109) )
))
(declare-fun lt!616575 () Unit!47108)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95769 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47108)

(assert (=> b!1400954 (= lt!616575 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1400954 (= lt!616574 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616578 (select (arr!46235 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1400954 (= lt!616578 (toIndex!0 (select (arr!46235 a!2901) j!112) mask!2840))))

(declare-fun b!1400955 () Bool)

(declare-fun e!793224 () Bool)

(assert (=> b!1400955 (= e!793224 e!793226)))

(declare-fun res!939468 () Bool)

(assert (=> b!1400955 (=> res!939468 e!793226)))

(assert (=> b!1400955 (= res!939468 (or (bvslt (x!126227 lt!616574) #b00000000000000000000000000000000) (bvsgt (x!126227 lt!616574) #b01111111111111111111111111111110) (bvslt (x!126227 lt!616577) #b00000000000000000000000000000000) (bvsgt (x!126227 lt!616577) #b01111111111111111111111111111110) (bvslt lt!616578 #b00000000000000000000000000000000) (bvsge lt!616578 (size!46785 a!2901)) (bvslt (index!44587 lt!616574) #b00000000000000000000000000000000) (bvsge (index!44587 lt!616574) (size!46785 a!2901)) (bvslt (index!44587 lt!616577) #b00000000000000000000000000000000) (bvsge (index!44587 lt!616577) (size!46785 a!2901)) (not (= lt!616574 (Intermediate!10552 false (index!44587 lt!616574) (x!126227 lt!616574)))) (not (= lt!616577 (Intermediate!10552 false (index!44587 lt!616577) (x!126227 lt!616577))))))))

(assert (=> b!1400955 e!793220))

(declare-fun res!939469 () Bool)

(assert (=> b!1400955 (=> (not res!939469) (not e!793220))))

(assert (=> b!1400955 (= res!939469 (and (not (undefined!11364 lt!616577)) (= (index!44587 lt!616577) i!1037) (bvslt (x!126227 lt!616577) (x!126227 lt!616574)) (= (select (store (arr!46235 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44587 lt!616577)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!616576 () Unit!47108)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95769 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47108)

(assert (=> b!1400955 (= lt!616576 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!616578 (x!126227 lt!616574) (index!44587 lt!616574) (x!126227 lt!616577) (index!44587 lt!616577) (undefined!11364 lt!616577) mask!2840))))

(declare-fun b!1400956 () Bool)

(declare-fun res!939459 () Bool)

(assert (=> b!1400956 (=> (not res!939459) (not e!793222))))

(assert (=> b!1400956 (= res!939459 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1400957 () Bool)

(assert (=> b!1400957 (= e!793223 e!793224)))

(declare-fun res!939465 () Bool)

(assert (=> b!1400957 (=> res!939465 e!793224)))

(assert (=> b!1400957 (= res!939465 (or (= lt!616574 lt!616577) (not (is-Intermediate!10552 lt!616577))))))

(assert (=> b!1400957 (= lt!616577 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!616581 mask!2840) lt!616581 lt!616580 mask!2840))))

(assert (=> b!1400957 (= lt!616581 (select (store (arr!46235 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1400957 (= lt!616580 (array!95770 (store (arr!46235 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46785 a!2901)))))

(declare-fun b!1400958 () Bool)

(declare-fun res!939460 () Bool)

(assert (=> b!1400958 (=> (not res!939460) (not e!793222))))

(assert (=> b!1400958 (= res!939460 (validKeyInArray!0 (select (arr!46235 a!2901) i!1037)))))

(assert (= (and start!120360 res!939467) b!1400948))

(assert (= (and b!1400948 res!939462) b!1400958))

(assert (= (and b!1400958 res!939460) b!1400952))

(assert (= (and b!1400952 res!939464) b!1400956))

(assert (= (and b!1400956 res!939459) b!1400953))

(assert (= (and b!1400953 res!939466) b!1400954))

(assert (= (and b!1400954 res!939461) b!1400949))

(assert (= (and b!1400954 (not res!939463)) b!1400957))

(assert (= (and b!1400957 (not res!939465)) b!1400955))

(assert (= (and b!1400955 res!939469) b!1400950))

(assert (= (and b!1400955 (not res!939468)) b!1400951))

(declare-fun m!1288569 () Bool)

(assert (=> b!1400949 m!1288569))

(assert (=> b!1400949 m!1288569))

(declare-fun m!1288571 () Bool)

(assert (=> b!1400949 m!1288571))

(declare-fun m!1288573 () Bool)

(assert (=> b!1400953 m!1288573))

(declare-fun m!1288575 () Bool)

(assert (=> b!1400956 m!1288575))

(declare-fun m!1288577 () Bool)

(assert (=> start!120360 m!1288577))

(declare-fun m!1288579 () Bool)

(assert (=> start!120360 m!1288579))

(declare-fun m!1288581 () Bool)

(assert (=> b!1400955 m!1288581))

(declare-fun m!1288583 () Bool)

(assert (=> b!1400955 m!1288583))

(declare-fun m!1288585 () Bool)

(assert (=> b!1400955 m!1288585))

(declare-fun m!1288587 () Bool)

(assert (=> b!1400951 m!1288587))

(assert (=> b!1400954 m!1288569))

(declare-fun m!1288589 () Bool)

(assert (=> b!1400954 m!1288589))

(assert (=> b!1400954 m!1288569))

(assert (=> b!1400954 m!1288569))

(declare-fun m!1288591 () Bool)

(assert (=> b!1400954 m!1288591))

(declare-fun m!1288593 () Bool)

(assert (=> b!1400954 m!1288593))

(declare-fun m!1288595 () Bool)

(assert (=> b!1400954 m!1288595))

(declare-fun m!1288597 () Bool)

(assert (=> b!1400957 m!1288597))

(assert (=> b!1400957 m!1288597))

(declare-fun m!1288599 () Bool)

(assert (=> b!1400957 m!1288599))

(assert (=> b!1400957 m!1288581))

(declare-fun m!1288601 () Bool)

(assert (=> b!1400957 m!1288601))

(declare-fun m!1288603 () Bool)

(assert (=> b!1400950 m!1288603))

(assert (=> b!1400950 m!1288569))

(assert (=> b!1400950 m!1288569))

(declare-fun m!1288605 () Bool)

(assert (=> b!1400950 m!1288605))

(assert (=> b!1400952 m!1288569))

(assert (=> b!1400952 m!1288569))

(declare-fun m!1288607 () Bool)

(assert (=> b!1400952 m!1288607))

(declare-fun m!1288609 () Bool)

(assert (=> b!1400958 m!1288609))

(assert (=> b!1400958 m!1288609))

(declare-fun m!1288611 () Bool)

(assert (=> b!1400958 m!1288611))

(push 1)

