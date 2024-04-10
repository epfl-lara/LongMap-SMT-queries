; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69236 () Bool)

(assert start!69236)

(declare-fun b!807734 () Bool)

(declare-fun res!551858 () Bool)

(declare-fun e!447186 () Bool)

(assert (=> b!807734 (=> (not res!551858) (not e!447186))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!807734 (= res!551858 (validKeyInArray!0 k!2044))))

(declare-fun b!807735 () Bool)

(declare-fun e!447185 () Bool)

(declare-fun e!447187 () Bool)

(assert (=> b!807735 (= e!447185 e!447187)))

(declare-fun res!551859 () Bool)

(assert (=> b!807735 (=> (not res!551859) (not e!447187))))

(declare-datatypes ((SeekEntryResult!8636 0))(
  ( (MissingZero!8636 (index!36912 (_ BitVec 32))) (Found!8636 (index!36913 (_ BitVec 32))) (Intermediate!8636 (undefined!9448 Bool) (index!36914 (_ BitVec 32)) (x!67720 (_ BitVec 32))) (Undefined!8636) (MissingVacant!8636 (index!36915 (_ BitVec 32))) )
))
(declare-fun lt!361893 () SeekEntryResult!8636)

(declare-datatypes ((array!43936 0))(
  ( (array!43937 (arr!21045 (Array (_ BitVec 32) (_ BitVec 64))) (size!21466 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43936)

(declare-fun lt!361891 () SeekEntryResult!8636)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!807735 (= res!551859 (and (= lt!361893 lt!361891) (= lt!361891 (Found!8636 j!153)) (not (= (select (arr!21045 a!3170) index!1236) (select (arr!21045 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43936 (_ BitVec 32)) SeekEntryResult!8636)

(assert (=> b!807735 (= lt!361891 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21045 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43936 (_ BitVec 32)) SeekEntryResult!8636)

(assert (=> b!807735 (= lt!361893 (seekEntryOrOpen!0 (select (arr!21045 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!807736 () Bool)

(declare-fun res!551864 () Bool)

(declare-fun e!447184 () Bool)

(assert (=> b!807736 (=> (not res!551864) (not e!447184))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43936 (_ BitVec 32)) Bool)

(assert (=> b!807736 (= res!551864 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!807737 () Bool)

(assert (=> b!807737 (= e!447187 false)))

(declare-fun lt!361895 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!807737 (= lt!361895 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun res!551867 () Bool)

(assert (=> start!69236 (=> (not res!551867) (not e!447186))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69236 (= res!551867 (validMask!0 mask!3266))))

(assert (=> start!69236 e!447186))

(assert (=> start!69236 true))

(declare-fun array_inv!16841 (array!43936) Bool)

(assert (=> start!69236 (array_inv!16841 a!3170)))

(declare-fun b!807738 () Bool)

(declare-fun res!551857 () Bool)

(assert (=> b!807738 (=> (not res!551857) (not e!447184))))

(declare-datatypes ((List!15008 0))(
  ( (Nil!15005) (Cons!15004 (h!16133 (_ BitVec 64)) (t!21323 List!15008)) )
))
(declare-fun arrayNoDuplicates!0 (array!43936 (_ BitVec 32) List!15008) Bool)

(assert (=> b!807738 (= res!551857 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15005))))

(declare-fun b!807739 () Bool)

(assert (=> b!807739 (= e!447184 e!447185)))

(declare-fun res!551863 () Bool)

(assert (=> b!807739 (=> (not res!551863) (not e!447185))))

(declare-fun lt!361890 () array!43936)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!361892 () (_ BitVec 64))

(assert (=> b!807739 (= res!551863 (= (seekEntryOrOpen!0 lt!361892 lt!361890 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!361892 lt!361890 mask!3266)))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!807739 (= lt!361892 (select (store (arr!21045 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!807739 (= lt!361890 (array!43937 (store (arr!21045 a!3170) i!1163 k!2044) (size!21466 a!3170)))))

(declare-fun b!807740 () Bool)

(declare-fun res!551866 () Bool)

(assert (=> b!807740 (=> (not res!551866) (not e!447186))))

(assert (=> b!807740 (= res!551866 (validKeyInArray!0 (select (arr!21045 a!3170) j!153)))))

(declare-fun b!807741 () Bool)

(declare-fun res!551862 () Bool)

(assert (=> b!807741 (=> (not res!551862) (not e!447186))))

(assert (=> b!807741 (= res!551862 (and (= (size!21466 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21466 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21466 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!807742 () Bool)

(declare-fun res!551861 () Bool)

(assert (=> b!807742 (=> (not res!551861) (not e!447184))))

(assert (=> b!807742 (= res!551861 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21466 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21045 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21466 a!3170)) (= (select (arr!21045 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!807743 () Bool)

(declare-fun res!551865 () Bool)

(assert (=> b!807743 (=> (not res!551865) (not e!447186))))

(declare-fun arrayContainsKey!0 (array!43936 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!807743 (= res!551865 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!807744 () Bool)

(assert (=> b!807744 (= e!447186 e!447184)))

(declare-fun res!551860 () Bool)

(assert (=> b!807744 (=> (not res!551860) (not e!447184))))

(declare-fun lt!361894 () SeekEntryResult!8636)

(assert (=> b!807744 (= res!551860 (or (= lt!361894 (MissingZero!8636 i!1163)) (= lt!361894 (MissingVacant!8636 i!1163))))))

(assert (=> b!807744 (= lt!361894 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(assert (= (and start!69236 res!551867) b!807741))

(assert (= (and b!807741 res!551862) b!807740))

(assert (= (and b!807740 res!551866) b!807734))

(assert (= (and b!807734 res!551858) b!807743))

(assert (= (and b!807743 res!551865) b!807744))

(assert (= (and b!807744 res!551860) b!807736))

(assert (= (and b!807736 res!551864) b!807738))

(assert (= (and b!807738 res!551857) b!807742))

(assert (= (and b!807742 res!551861) b!807739))

(assert (= (and b!807739 res!551863) b!807735))

(assert (= (and b!807735 res!551859) b!807737))

(declare-fun m!749813 () Bool)

(assert (=> b!807736 m!749813))

(declare-fun m!749815 () Bool)

(assert (=> b!807735 m!749815))

(declare-fun m!749817 () Bool)

(assert (=> b!807735 m!749817))

(assert (=> b!807735 m!749817))

(declare-fun m!749819 () Bool)

(assert (=> b!807735 m!749819))

(assert (=> b!807735 m!749817))

(declare-fun m!749821 () Bool)

(assert (=> b!807735 m!749821))

(declare-fun m!749823 () Bool)

(assert (=> b!807738 m!749823))

(declare-fun m!749825 () Bool)

(assert (=> b!807734 m!749825))

(declare-fun m!749827 () Bool)

(assert (=> b!807744 m!749827))

(declare-fun m!749829 () Bool)

(assert (=> b!807737 m!749829))

(declare-fun m!749831 () Bool)

(assert (=> b!807743 m!749831))

(assert (=> b!807740 m!749817))

(assert (=> b!807740 m!749817))

(declare-fun m!749833 () Bool)

(assert (=> b!807740 m!749833))

(declare-fun m!749835 () Bool)

(assert (=> b!807742 m!749835))

(declare-fun m!749837 () Bool)

(assert (=> b!807742 m!749837))

(declare-fun m!749839 () Bool)

(assert (=> start!69236 m!749839))

(declare-fun m!749841 () Bool)

(assert (=> start!69236 m!749841))

(declare-fun m!749843 () Bool)

(assert (=> b!807739 m!749843))

(declare-fun m!749845 () Bool)

(assert (=> b!807739 m!749845))

(declare-fun m!749847 () Bool)

(assert (=> b!807739 m!749847))

(declare-fun m!749849 () Bool)

(assert (=> b!807739 m!749849))

(push 1)

