; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68912 () Bool)

(assert start!68912)

(declare-fun b!803812 () Bool)

(declare-fun res!548337 () Bool)

(declare-fun e!445380 () Bool)

(assert (=> b!803812 (=> (not res!548337) (not e!445380))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43702 0))(
  ( (array!43703 (arr!20931 (Array (_ BitVec 32) (_ BitVec 64))) (size!21352 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43702)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!803812 (= res!548337 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21352 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20931 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21352 a!3170)) (= (select (arr!20931 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!803813 () Bool)

(declare-fun res!548340 () Bool)

(declare-fun e!445378 () Bool)

(assert (=> b!803813 (=> (not res!548340) (not e!445378))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!803813 (= res!548340 (validKeyInArray!0 (select (arr!20931 a!3170) j!153)))))

(declare-fun b!803814 () Bool)

(assert (=> b!803814 (= e!445378 e!445380)))

(declare-fun res!548342 () Bool)

(assert (=> b!803814 (=> (not res!548342) (not e!445380))))

(declare-datatypes ((SeekEntryResult!8522 0))(
  ( (MissingZero!8522 (index!36456 (_ BitVec 32))) (Found!8522 (index!36457 (_ BitVec 32))) (Intermediate!8522 (undefined!9334 Bool) (index!36458 (_ BitVec 32)) (x!67296 (_ BitVec 32))) (Undefined!8522) (MissingVacant!8522 (index!36459 (_ BitVec 32))) )
))
(declare-fun lt!359878 () SeekEntryResult!8522)

(assert (=> b!803814 (= res!548342 (or (= lt!359878 (MissingZero!8522 i!1163)) (= lt!359878 (MissingVacant!8522 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43702 (_ BitVec 32)) SeekEntryResult!8522)

(assert (=> b!803814 (= lt!359878 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!803815 () Bool)

(declare-fun e!445379 () Bool)

(assert (=> b!803815 (= e!445380 e!445379)))

(declare-fun res!548333 () Bool)

(assert (=> b!803815 (=> (not res!548333) (not e!445379))))

(declare-fun lt!359873 () SeekEntryResult!8522)

(declare-fun lt!359874 () SeekEntryResult!8522)

(assert (=> b!803815 (= res!548333 (= lt!359873 lt!359874))))

(declare-fun lt!359871 () (_ BitVec 64))

(declare-fun lt!359872 () array!43702)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43702 (_ BitVec 32)) SeekEntryResult!8522)

(assert (=> b!803815 (= lt!359874 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!359871 lt!359872 mask!3266))))

(assert (=> b!803815 (= lt!359873 (seekEntryOrOpen!0 lt!359871 lt!359872 mask!3266))))

(assert (=> b!803815 (= lt!359871 (select (store (arr!20931 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!803815 (= lt!359872 (array!43703 (store (arr!20931 a!3170) i!1163 k!2044) (size!21352 a!3170)))))

(declare-fun res!548336 () Bool)

(assert (=> start!68912 (=> (not res!548336) (not e!445378))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68912 (= res!548336 (validMask!0 mask!3266))))

(assert (=> start!68912 e!445378))

(assert (=> start!68912 true))

(declare-fun array_inv!16727 (array!43702) Bool)

(assert (=> start!68912 (array_inv!16727 a!3170)))

(declare-fun b!803816 () Bool)

(declare-fun res!548339 () Bool)

(assert (=> b!803816 (=> (not res!548339) (not e!445378))))

(assert (=> b!803816 (= res!548339 (validKeyInArray!0 k!2044))))

(declare-fun e!445382 () Bool)

(declare-fun lt!359879 () SeekEntryResult!8522)

(declare-fun b!803817 () Bool)

(assert (=> b!803817 (= e!445382 (not (or (not (= lt!359874 lt!359879)) (bvslt mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (and (bvsge vacantBefore!23 #b00000000000000000000000000000000) (bvslt vacantBefore!23 (bvadd #b00000000000000000000000000000001 mask!3266))))))))

(declare-fun lt!359876 () (_ BitVec 32))

(assert (=> b!803817 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359876 vacantAfter!23 lt!359871 lt!359872 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359876 vacantBefore!23 (select (arr!20931 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27584 0))(
  ( (Unit!27585) )
))
(declare-fun lt!359875 () Unit!27584)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43702 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27584)

(assert (=> b!803817 (= lt!359875 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k!2044 j!153 lt!359876 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!803817 (= lt!359876 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!803818 () Bool)

(declare-fun e!445381 () Bool)

(assert (=> b!803818 (= e!445379 e!445381)))

(declare-fun res!548338 () Bool)

(assert (=> b!803818 (=> (not res!548338) (not e!445381))))

(declare-fun lt!359870 () SeekEntryResult!8522)

(declare-fun lt!359877 () SeekEntryResult!8522)

(assert (=> b!803818 (= res!548338 (= lt!359870 lt!359877))))

(assert (=> b!803818 (= lt!359877 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20931 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!803818 (= lt!359870 (seekEntryOrOpen!0 (select (arr!20931 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!803819 () Bool)

(declare-fun res!548332 () Bool)

(assert (=> b!803819 (=> (not res!548332) (not e!445378))))

(assert (=> b!803819 (= res!548332 (and (= (size!21352 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21352 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21352 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!803820 () Bool)

(declare-fun res!548334 () Bool)

(assert (=> b!803820 (=> (not res!548334) (not e!445380))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43702 (_ BitVec 32)) Bool)

(assert (=> b!803820 (= res!548334 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!803821 () Bool)

(declare-fun res!548331 () Bool)

(assert (=> b!803821 (=> (not res!548331) (not e!445378))))

(declare-fun arrayContainsKey!0 (array!43702 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!803821 (= res!548331 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!803822 () Bool)

(assert (=> b!803822 (= e!445381 e!445382)))

(declare-fun res!548341 () Bool)

(assert (=> b!803822 (=> (not res!548341) (not e!445382))))

(assert (=> b!803822 (= res!548341 (and (= lt!359877 lt!359879) (not (= (select (arr!20931 a!3170) index!1236) (select (arr!20931 a!3170) j!153)))))))

(assert (=> b!803822 (= lt!359879 (Found!8522 j!153))))

(declare-fun b!803823 () Bool)

(declare-fun res!548335 () Bool)

(assert (=> b!803823 (=> (not res!548335) (not e!445380))))

(declare-datatypes ((List!14894 0))(
  ( (Nil!14891) (Cons!14890 (h!16019 (_ BitVec 64)) (t!21209 List!14894)) )
))
(declare-fun arrayNoDuplicates!0 (array!43702 (_ BitVec 32) List!14894) Bool)

(assert (=> b!803823 (= res!548335 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14891))))

(assert (= (and start!68912 res!548336) b!803819))

(assert (= (and b!803819 res!548332) b!803813))

(assert (= (and b!803813 res!548340) b!803816))

(assert (= (and b!803816 res!548339) b!803821))

(assert (= (and b!803821 res!548331) b!803814))

(assert (= (and b!803814 res!548342) b!803820))

(assert (= (and b!803820 res!548334) b!803823))

(assert (= (and b!803823 res!548335) b!803812))

(assert (= (and b!803812 res!548337) b!803815))

(assert (= (and b!803815 res!548333) b!803818))

(assert (= (and b!803818 res!548338) b!803822))

(assert (= (and b!803822 res!548341) b!803817))

(declare-fun m!745643 () Bool)

(assert (=> b!803822 m!745643))

(declare-fun m!745645 () Bool)

(assert (=> b!803822 m!745645))

(declare-fun m!745647 () Bool)

(assert (=> b!803820 m!745647))

(declare-fun m!745649 () Bool)

(assert (=> b!803812 m!745649))

(declare-fun m!745651 () Bool)

(assert (=> b!803812 m!745651))

(declare-fun m!745653 () Bool)

(assert (=> b!803816 m!745653))

(declare-fun m!745655 () Bool)

(assert (=> b!803815 m!745655))

(declare-fun m!745657 () Bool)

(assert (=> b!803815 m!745657))

(declare-fun m!745659 () Bool)

(assert (=> b!803815 m!745659))

(declare-fun m!745661 () Bool)

(assert (=> b!803815 m!745661))

(declare-fun m!745663 () Bool)

(assert (=> b!803823 m!745663))

(declare-fun m!745665 () Bool)

(assert (=> b!803814 m!745665))

(assert (=> b!803813 m!745645))

(assert (=> b!803813 m!745645))

(declare-fun m!745667 () Bool)

(assert (=> b!803813 m!745667))

(declare-fun m!745669 () Bool)

(assert (=> b!803821 m!745669))

(declare-fun m!745671 () Bool)

(assert (=> b!803817 m!745671))

(assert (=> b!803817 m!745645))

(declare-fun m!745673 () Bool)

(assert (=> b!803817 m!745673))

(declare-fun m!745675 () Bool)

(assert (=> b!803817 m!745675))

(assert (=> b!803817 m!745645))

(declare-fun m!745677 () Bool)

(assert (=> b!803817 m!745677))

(assert (=> b!803818 m!745645))

(assert (=> b!803818 m!745645))

(declare-fun m!745679 () Bool)

(assert (=> b!803818 m!745679))

(assert (=> b!803818 m!745645))

(declare-fun m!745681 () Bool)

(assert (=> b!803818 m!745681))

(declare-fun m!745683 () Bool)

(assert (=> start!68912 m!745683))

(declare-fun m!745685 () Bool)

(assert (=> start!68912 m!745685))

(push 1)

(assert (not b!803821))

(assert (not b!803815))

(assert (not start!68912))

(assert (not b!803823))

(assert (not b!803820))

(assert (not b!803816))

(assert (not b!803814))

(assert (not b!803813))

(assert (not b!803817))

(assert (not b!803818))

(check-sat)

(pop 1)

(push 1)

(check-sat)

