; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45844 () Bool)

(assert start!45844)

(declare-fun b!507709 () Bool)

(declare-fun e!297110 () Bool)

(declare-fun e!297113 () Bool)

(assert (=> b!507709 (= e!297110 (not e!297113))))

(declare-fun res!308673 () Bool)

(assert (=> b!507709 (=> res!308673 e!297113)))

(declare-fun lt!231945 () (_ BitVec 32))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4147 0))(
  ( (MissingZero!4147 (index!18776 (_ BitVec 32))) (Found!4147 (index!18777 (_ BitVec 32))) (Intermediate!4147 (undefined!4959 Bool) (index!18778 (_ BitVec 32)) (x!47764 (_ BitVec 32))) (Undefined!4147) (MissingVacant!4147 (index!18779 (_ BitVec 32))) )
))
(declare-fun lt!231947 () SeekEntryResult!4147)

(declare-fun lt!231952 () (_ BitVec 64))

(declare-datatypes ((array!32600 0))(
  ( (array!32601 (arr!15680 (Array (_ BitVec 32) (_ BitVec 64))) (size!16044 (_ BitVec 32))) )
))
(declare-fun lt!231946 () array!32600)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32600 (_ BitVec 32)) SeekEntryResult!4147)

(assert (=> b!507709 (= res!308673 (= lt!231947 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231945 lt!231952 lt!231946 mask!3524)))))

(declare-fun lt!231949 () (_ BitVec 32))

(declare-fun a!3235 () array!32600)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!507709 (= lt!231947 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231949 (select (arr!15680 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!507709 (= lt!231945 (toIndex!0 lt!231952 mask!3524))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!507709 (= lt!231952 (select (store (arr!15680 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!507709 (= lt!231949 (toIndex!0 (select (arr!15680 a!3235) j!176) mask!3524))))

(assert (=> b!507709 (= lt!231946 (array!32601 (store (arr!15680 a!3235) i!1204 k!2280) (size!16044 a!3235)))))

(declare-fun e!297109 () Bool)

(assert (=> b!507709 e!297109))

(declare-fun res!308677 () Bool)

(assert (=> b!507709 (=> (not res!308677) (not e!297109))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32600 (_ BitVec 32)) Bool)

(assert (=> b!507709 (= res!308677 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15582 0))(
  ( (Unit!15583) )
))
(declare-fun lt!231944 () Unit!15582)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32600 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15582)

(assert (=> b!507709 (= lt!231944 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!507710 () Bool)

(declare-fun res!308668 () Bool)

(declare-fun e!297112 () Bool)

(assert (=> b!507710 (=> (not res!308668) (not e!297112))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!507710 (= res!308668 (validKeyInArray!0 (select (arr!15680 a!3235) j!176)))))

(declare-fun b!507711 () Bool)

(declare-fun res!308669 () Bool)

(assert (=> b!507711 (=> (not res!308669) (not e!297112))))

(assert (=> b!507711 (= res!308669 (and (= (size!16044 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16044 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16044 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!507712 () Bool)

(declare-fun res!308675 () Bool)

(assert (=> b!507712 (=> (not res!308675) (not e!297110))))

(declare-datatypes ((List!9838 0))(
  ( (Nil!9835) (Cons!9834 (h!10711 (_ BitVec 64)) (t!16066 List!9838)) )
))
(declare-fun arrayNoDuplicates!0 (array!32600 (_ BitVec 32) List!9838) Bool)

(assert (=> b!507712 (= res!308675 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9835))))

(declare-fun b!507713 () Bool)

(declare-fun e!297114 () Bool)

(assert (=> b!507713 (= e!297113 e!297114)))

(declare-fun res!308672 () Bool)

(assert (=> b!507713 (=> res!308672 e!297114)))

(declare-fun lt!231950 () Bool)

(assert (=> b!507713 (= res!308672 (or (and (not lt!231950) (undefined!4959 lt!231947)) (and (not lt!231950) (not (undefined!4959 lt!231947)))))))

(assert (=> b!507713 (= lt!231950 (not (is-Intermediate!4147 lt!231947)))))

(declare-fun b!507714 () Bool)

(assert (=> b!507714 (= e!297112 e!297110)))

(declare-fun res!308678 () Bool)

(assert (=> b!507714 (=> (not res!308678) (not e!297110))))

(declare-fun lt!231948 () SeekEntryResult!4147)

(assert (=> b!507714 (= res!308678 (or (= lt!231948 (MissingZero!4147 i!1204)) (= lt!231948 (MissingVacant!4147 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32600 (_ BitVec 32)) SeekEntryResult!4147)

(assert (=> b!507714 (= lt!231948 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!507715 () Bool)

(assert (=> b!507715 (= e!297114 true)))

(declare-fun lt!231951 () SeekEntryResult!4147)

(assert (=> b!507715 (= lt!231951 (seekEntryOrOpen!0 lt!231952 lt!231946 mask!3524))))

(assert (=> b!507715 false))

(declare-fun b!507716 () Bool)

(declare-fun res!308670 () Bool)

(assert (=> b!507716 (=> (not res!308670) (not e!297112))))

(assert (=> b!507716 (= res!308670 (validKeyInArray!0 k!2280))))

(declare-fun b!507717 () Bool)

(declare-fun res!308671 () Bool)

(assert (=> b!507717 (=> (not res!308671) (not e!297110))))

(assert (=> b!507717 (= res!308671 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!507718 () Bool)

(declare-fun res!308674 () Bool)

(assert (=> b!507718 (=> (not res!308674) (not e!297112))))

(declare-fun arrayContainsKey!0 (array!32600 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!507718 (= res!308674 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun res!308676 () Bool)

(assert (=> start!45844 (=> (not res!308676) (not e!297112))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45844 (= res!308676 (validMask!0 mask!3524))))

(assert (=> start!45844 e!297112))

(assert (=> start!45844 true))

(declare-fun array_inv!11476 (array!32600) Bool)

(assert (=> start!45844 (array_inv!11476 a!3235)))

(declare-fun b!507719 () Bool)

(assert (=> b!507719 (= e!297109 (= (seekEntryOrOpen!0 (select (arr!15680 a!3235) j!176) a!3235 mask!3524) (Found!4147 j!176)))))

(assert (= (and start!45844 res!308676) b!507711))

(assert (= (and b!507711 res!308669) b!507710))

(assert (= (and b!507710 res!308668) b!507716))

(assert (= (and b!507716 res!308670) b!507718))

(assert (= (and b!507718 res!308674) b!507714))

(assert (= (and b!507714 res!308678) b!507717))

(assert (= (and b!507717 res!308671) b!507712))

(assert (= (and b!507712 res!308675) b!507709))

(assert (= (and b!507709 res!308677) b!507719))

(assert (= (and b!507709 (not res!308673)) b!507713))

(assert (= (and b!507713 (not res!308672)) b!507715))

(declare-fun m!488521 () Bool)

(assert (=> b!507719 m!488521))

(assert (=> b!507719 m!488521))

(declare-fun m!488523 () Bool)

(assert (=> b!507719 m!488523))

(declare-fun m!488525 () Bool)

(assert (=> b!507717 m!488525))

(declare-fun m!488527 () Bool)

(assert (=> b!507709 m!488527))

(declare-fun m!488529 () Bool)

(assert (=> b!507709 m!488529))

(assert (=> b!507709 m!488521))

(declare-fun m!488531 () Bool)

(assert (=> b!507709 m!488531))

(assert (=> b!507709 m!488521))

(declare-fun m!488533 () Bool)

(assert (=> b!507709 m!488533))

(declare-fun m!488535 () Bool)

(assert (=> b!507709 m!488535))

(assert (=> b!507709 m!488521))

(declare-fun m!488537 () Bool)

(assert (=> b!507709 m!488537))

(declare-fun m!488539 () Bool)

(assert (=> b!507709 m!488539))

(declare-fun m!488541 () Bool)

(assert (=> b!507709 m!488541))

(declare-fun m!488543 () Bool)

(assert (=> start!45844 m!488543))

(declare-fun m!488545 () Bool)

(assert (=> start!45844 m!488545))

(declare-fun m!488547 () Bool)

(assert (=> b!507712 m!488547))

(declare-fun m!488549 () Bool)

(assert (=> b!507716 m!488549))

(declare-fun m!488551 () Bool)

(assert (=> b!507714 m!488551))

(declare-fun m!488553 () Bool)

(assert (=> b!507718 m!488553))

(declare-fun m!488555 () Bool)

(assert (=> b!507715 m!488555))

(assert (=> b!507710 m!488521))

(assert (=> b!507710 m!488521))

(declare-fun m!488557 () Bool)

(assert (=> b!507710 m!488557))

(push 1)

