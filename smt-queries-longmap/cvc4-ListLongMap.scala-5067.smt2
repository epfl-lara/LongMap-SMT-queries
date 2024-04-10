; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68916 () Bool)

(assert start!68916)

(declare-fun b!803884 () Bool)

(declare-fun e!445418 () Bool)

(declare-fun e!445417 () Bool)

(assert (=> b!803884 (= e!445418 e!445417)))

(declare-fun res!548404 () Bool)

(assert (=> b!803884 (=> (not res!548404) (not e!445417))))

(declare-datatypes ((SeekEntryResult!8524 0))(
  ( (MissingZero!8524 (index!36464 (_ BitVec 32))) (Found!8524 (index!36465 (_ BitVec 32))) (Intermediate!8524 (undefined!9336 Bool) (index!36466 (_ BitVec 32)) (x!67298 (_ BitVec 32))) (Undefined!8524) (MissingVacant!8524 (index!36467 (_ BitVec 32))) )
))
(declare-fun lt!359937 () SeekEntryResult!8524)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!803884 (= res!548404 (or (= lt!359937 (MissingZero!8524 i!1163)) (= lt!359937 (MissingVacant!8524 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-datatypes ((array!43706 0))(
  ( (array!43707 (arr!20933 (Array (_ BitVec 32) (_ BitVec 64))) (size!21354 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43706)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43706 (_ BitVec 32)) SeekEntryResult!8524)

(assert (=> b!803884 (= lt!359937 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!803885 () Bool)

(declare-fun res!548414 () Bool)

(assert (=> b!803885 (=> (not res!548414) (not e!445417))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43706 (_ BitVec 32)) Bool)

(assert (=> b!803885 (= res!548414 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!548408 () Bool)

(assert (=> start!68916 (=> (not res!548408) (not e!445418))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68916 (= res!548408 (validMask!0 mask!3266))))

(assert (=> start!68916 e!445418))

(assert (=> start!68916 true))

(declare-fun array_inv!16729 (array!43706) Bool)

(assert (=> start!68916 (array_inv!16729 a!3170)))

(declare-fun b!803886 () Bool)

(declare-fun res!548409 () Bool)

(assert (=> b!803886 (=> (not res!548409) (not e!445418))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!803886 (= res!548409 (validKeyInArray!0 (select (arr!20933 a!3170) j!153)))))

(declare-fun b!803887 () Bool)

(declare-fun res!548412 () Bool)

(assert (=> b!803887 (=> (not res!548412) (not e!445417))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!803887 (= res!548412 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21354 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20933 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21354 a!3170)) (= (select (arr!20933 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!803888 () Bool)

(declare-fun e!445414 () Bool)

(declare-fun e!445416 () Bool)

(assert (=> b!803888 (= e!445414 e!445416)))

(declare-fun res!548403 () Bool)

(assert (=> b!803888 (=> (not res!548403) (not e!445416))))

(declare-fun lt!359939 () SeekEntryResult!8524)

(declare-fun lt!359931 () SeekEntryResult!8524)

(assert (=> b!803888 (= res!548403 (= lt!359939 lt!359931))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43706 (_ BitVec 32)) SeekEntryResult!8524)

(assert (=> b!803888 (= lt!359931 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20933 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!803888 (= lt!359939 (seekEntryOrOpen!0 (select (arr!20933 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!803889 () Bool)

(declare-fun res!548407 () Bool)

(assert (=> b!803889 (=> (not res!548407) (not e!445417))))

(declare-datatypes ((List!14896 0))(
  ( (Nil!14893) (Cons!14892 (h!16021 (_ BitVec 64)) (t!21211 List!14896)) )
))
(declare-fun arrayNoDuplicates!0 (array!43706 (_ BitVec 32) List!14896) Bool)

(assert (=> b!803889 (= res!548407 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14893))))

(declare-fun e!445415 () Bool)

(declare-fun b!803890 () Bool)

(declare-fun lt!359932 () SeekEntryResult!8524)

(declare-fun lt!359933 () SeekEntryResult!8524)

(assert (=> b!803890 (= e!445415 (not (or (not (= lt!359932 lt!359933)) (bvslt mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (and (bvsge vacantBefore!23 #b00000000000000000000000000000000) (bvslt vacantBefore!23 (bvadd #b00000000000000000000000000000001 mask!3266))))))))

(declare-fun lt!359934 () (_ BitVec 64))

(declare-fun lt!359930 () array!43706)

(declare-fun lt!359936 () (_ BitVec 32))

(assert (=> b!803890 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359936 vacantAfter!23 lt!359934 lt!359930 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359936 vacantBefore!23 (select (arr!20933 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27588 0))(
  ( (Unit!27589) )
))
(declare-fun lt!359935 () Unit!27588)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43706 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27588)

(assert (=> b!803890 (= lt!359935 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k!2044 j!153 lt!359936 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!803890 (= lt!359936 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!803891 () Bool)

(assert (=> b!803891 (= e!445416 e!445415)))

(declare-fun res!548413 () Bool)

(assert (=> b!803891 (=> (not res!548413) (not e!445415))))

(assert (=> b!803891 (= res!548413 (and (= lt!359931 lt!359933) (not (= (select (arr!20933 a!3170) index!1236) (select (arr!20933 a!3170) j!153)))))))

(assert (=> b!803891 (= lt!359933 (Found!8524 j!153))))

(declare-fun b!803892 () Bool)

(declare-fun res!548405 () Bool)

(assert (=> b!803892 (=> (not res!548405) (not e!445418))))

(assert (=> b!803892 (= res!548405 (and (= (size!21354 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21354 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21354 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!803893 () Bool)

(declare-fun res!548411 () Bool)

(assert (=> b!803893 (=> (not res!548411) (not e!445418))))

(assert (=> b!803893 (= res!548411 (validKeyInArray!0 k!2044))))

(declare-fun b!803894 () Bool)

(assert (=> b!803894 (= e!445417 e!445414)))

(declare-fun res!548410 () Bool)

(assert (=> b!803894 (=> (not res!548410) (not e!445414))))

(declare-fun lt!359938 () SeekEntryResult!8524)

(assert (=> b!803894 (= res!548410 (= lt!359938 lt!359932))))

(assert (=> b!803894 (= lt!359932 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!359934 lt!359930 mask!3266))))

(assert (=> b!803894 (= lt!359938 (seekEntryOrOpen!0 lt!359934 lt!359930 mask!3266))))

(assert (=> b!803894 (= lt!359934 (select (store (arr!20933 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!803894 (= lt!359930 (array!43707 (store (arr!20933 a!3170) i!1163 k!2044) (size!21354 a!3170)))))

(declare-fun b!803895 () Bool)

(declare-fun res!548406 () Bool)

(assert (=> b!803895 (=> (not res!548406) (not e!445418))))

(declare-fun arrayContainsKey!0 (array!43706 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!803895 (= res!548406 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!68916 res!548408) b!803892))

(assert (= (and b!803892 res!548405) b!803886))

(assert (= (and b!803886 res!548409) b!803893))

(assert (= (and b!803893 res!548411) b!803895))

(assert (= (and b!803895 res!548406) b!803884))

(assert (= (and b!803884 res!548404) b!803885))

(assert (= (and b!803885 res!548414) b!803889))

(assert (= (and b!803889 res!548407) b!803887))

(assert (= (and b!803887 res!548412) b!803894))

(assert (= (and b!803894 res!548410) b!803888))

(assert (= (and b!803888 res!548403) b!803891))

(assert (= (and b!803891 res!548413) b!803890))

(declare-fun m!745731 () Bool)

(assert (=> b!803891 m!745731))

(declare-fun m!745733 () Bool)

(assert (=> b!803891 m!745733))

(assert (=> b!803886 m!745733))

(assert (=> b!803886 m!745733))

(declare-fun m!745735 () Bool)

(assert (=> b!803886 m!745735))

(assert (=> b!803890 m!745733))

(declare-fun m!745737 () Bool)

(assert (=> b!803890 m!745737))

(assert (=> b!803890 m!745733))

(declare-fun m!745739 () Bool)

(assert (=> b!803890 m!745739))

(declare-fun m!745741 () Bool)

(assert (=> b!803890 m!745741))

(declare-fun m!745743 () Bool)

(assert (=> b!803890 m!745743))

(declare-fun m!745745 () Bool)

(assert (=> b!803887 m!745745))

(declare-fun m!745747 () Bool)

(assert (=> b!803887 m!745747))

(declare-fun m!745749 () Bool)

(assert (=> b!803895 m!745749))

(declare-fun m!745751 () Bool)

(assert (=> b!803893 m!745751))

(declare-fun m!745753 () Bool)

(assert (=> start!68916 m!745753))

(declare-fun m!745755 () Bool)

(assert (=> start!68916 m!745755))

(declare-fun m!745757 () Bool)

(assert (=> b!803884 m!745757))

(declare-fun m!745759 () Bool)

(assert (=> b!803885 m!745759))

(assert (=> b!803888 m!745733))

(assert (=> b!803888 m!745733))

(declare-fun m!745761 () Bool)

(assert (=> b!803888 m!745761))

(assert (=> b!803888 m!745733))

(declare-fun m!745763 () Bool)

(assert (=> b!803888 m!745763))

(declare-fun m!745765 () Bool)

(assert (=> b!803889 m!745765))

(declare-fun m!745767 () Bool)

(assert (=> b!803894 m!745767))

(declare-fun m!745769 () Bool)

(assert (=> b!803894 m!745769))

(declare-fun m!745771 () Bool)

(assert (=> b!803894 m!745771))

(declare-fun m!745773 () Bool)

(assert (=> b!803894 m!745773))

(push 1)

(assert (not b!803895))

(assert (not b!803893))

(assert (not b!803886))

(assert (not b!803888))

(assert (not b!803894))

(assert (not start!68916))

(assert (not b!803889))

(assert (not b!803890))

(assert (not b!803885))

(assert (not b!803884))

(check-sat)

(pop 1)

(push 1)

(check-sat)

