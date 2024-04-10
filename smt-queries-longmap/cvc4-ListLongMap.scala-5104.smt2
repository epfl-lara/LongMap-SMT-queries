; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69234 () Bool)

(assert start!69234)

(declare-fun b!807701 () Bool)

(declare-fun e!447170 () Bool)

(declare-fun e!447171 () Bool)

(assert (=> b!807701 (= e!447170 e!447171)))

(declare-fun res!551827 () Bool)

(assert (=> b!807701 (=> (not res!551827) (not e!447171))))

(declare-datatypes ((SeekEntryResult!8635 0))(
  ( (MissingZero!8635 (index!36908 (_ BitVec 32))) (Found!8635 (index!36909 (_ BitVec 32))) (Intermediate!8635 (undefined!9447 Bool) (index!36910 (_ BitVec 32)) (x!67711 (_ BitVec 32))) (Undefined!8635) (MissingVacant!8635 (index!36911 (_ BitVec 32))) )
))
(declare-fun lt!361874 () SeekEntryResult!8635)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!807701 (= res!551827 (or (= lt!361874 (MissingZero!8635 i!1163)) (= lt!361874 (MissingVacant!8635 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-datatypes ((array!43934 0))(
  ( (array!43935 (arr!21044 (Array (_ BitVec 32) (_ BitVec 64))) (size!21465 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43934)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43934 (_ BitVec 32)) SeekEntryResult!8635)

(assert (=> b!807701 (= lt!361874 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!807702 () Bool)

(declare-fun e!447169 () Bool)

(assert (=> b!807702 (= e!447169 false)))

(declare-fun lt!361872 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!807702 (= lt!361872 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!807703 () Bool)

(declare-fun res!551825 () Bool)

(assert (=> b!807703 (=> (not res!551825) (not e!447171))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43934 (_ BitVec 32)) Bool)

(assert (=> b!807703 (= res!551825 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!807704 () Bool)

(declare-fun res!551833 () Bool)

(assert (=> b!807704 (=> (not res!551833) (not e!447171))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!807704 (= res!551833 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21465 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21044 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21465 a!3170)) (= (select (arr!21044 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!807705 () Bool)

(declare-fun res!551831 () Bool)

(assert (=> b!807705 (=> (not res!551831) (not e!447170))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!807705 (= res!551831 (validKeyInArray!0 k!2044))))

(declare-fun b!807706 () Bool)

(declare-fun e!447173 () Bool)

(assert (=> b!807706 (= e!447171 e!447173)))

(declare-fun res!551832 () Bool)

(assert (=> b!807706 (=> (not res!551832) (not e!447173))))

(declare-fun lt!361873 () array!43934)

(declare-fun lt!361877 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43934 (_ BitVec 32)) SeekEntryResult!8635)

(assert (=> b!807706 (= res!551832 (= (seekEntryOrOpen!0 lt!361877 lt!361873 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!361877 lt!361873 mask!3266)))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!807706 (= lt!361877 (select (store (arr!21044 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!807706 (= lt!361873 (array!43935 (store (arr!21044 a!3170) i!1163 k!2044) (size!21465 a!3170)))))

(declare-fun res!551826 () Bool)

(assert (=> start!69234 (=> (not res!551826) (not e!447170))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69234 (= res!551826 (validMask!0 mask!3266))))

(assert (=> start!69234 e!447170))

(assert (=> start!69234 true))

(declare-fun array_inv!16840 (array!43934) Bool)

(assert (=> start!69234 (array_inv!16840 a!3170)))

(declare-fun b!807707 () Bool)

(declare-fun res!551830 () Bool)

(assert (=> b!807707 (=> (not res!551830) (not e!447170))))

(assert (=> b!807707 (= res!551830 (validKeyInArray!0 (select (arr!21044 a!3170) j!153)))))

(declare-fun b!807708 () Bool)

(declare-fun res!551824 () Bool)

(assert (=> b!807708 (=> (not res!551824) (not e!447171))))

(declare-datatypes ((List!15007 0))(
  ( (Nil!15004) (Cons!15003 (h!16132 (_ BitVec 64)) (t!21322 List!15007)) )
))
(declare-fun arrayNoDuplicates!0 (array!43934 (_ BitVec 32) List!15007) Bool)

(assert (=> b!807708 (= res!551824 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15004))))

(declare-fun b!807709 () Bool)

(assert (=> b!807709 (= e!447173 e!447169)))

(declare-fun res!551828 () Bool)

(assert (=> b!807709 (=> (not res!551828) (not e!447169))))

(declare-fun lt!361875 () SeekEntryResult!8635)

(declare-fun lt!361876 () SeekEntryResult!8635)

(assert (=> b!807709 (= res!551828 (and (= lt!361875 lt!361876) (= lt!361876 (Found!8635 j!153)) (not (= (select (arr!21044 a!3170) index!1236) (select (arr!21044 a!3170) j!153)))))))

(assert (=> b!807709 (= lt!361876 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21044 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!807709 (= lt!361875 (seekEntryOrOpen!0 (select (arr!21044 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!807710 () Bool)

(declare-fun res!551834 () Bool)

(assert (=> b!807710 (=> (not res!551834) (not e!447170))))

(declare-fun arrayContainsKey!0 (array!43934 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!807710 (= res!551834 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!807711 () Bool)

(declare-fun res!551829 () Bool)

(assert (=> b!807711 (=> (not res!551829) (not e!447170))))

(assert (=> b!807711 (= res!551829 (and (= (size!21465 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21465 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21465 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!69234 res!551826) b!807711))

(assert (= (and b!807711 res!551829) b!807707))

(assert (= (and b!807707 res!551830) b!807705))

(assert (= (and b!807705 res!551831) b!807710))

(assert (= (and b!807710 res!551834) b!807701))

(assert (= (and b!807701 res!551827) b!807703))

(assert (= (and b!807703 res!551825) b!807708))

(assert (= (and b!807708 res!551824) b!807704))

(assert (= (and b!807704 res!551833) b!807706))

(assert (= (and b!807706 res!551832) b!807709))

(assert (= (and b!807709 res!551828) b!807702))

(declare-fun m!749775 () Bool)

(assert (=> b!807705 m!749775))

(declare-fun m!749777 () Bool)

(assert (=> b!807706 m!749777))

(declare-fun m!749779 () Bool)

(assert (=> b!807706 m!749779))

(declare-fun m!749781 () Bool)

(assert (=> b!807706 m!749781))

(declare-fun m!749783 () Bool)

(assert (=> b!807706 m!749783))

(declare-fun m!749785 () Bool)

(assert (=> b!807701 m!749785))

(declare-fun m!749787 () Bool)

(assert (=> b!807702 m!749787))

(declare-fun m!749789 () Bool)

(assert (=> b!807703 m!749789))

(declare-fun m!749791 () Bool)

(assert (=> b!807709 m!749791))

(declare-fun m!749793 () Bool)

(assert (=> b!807709 m!749793))

(assert (=> b!807709 m!749793))

(declare-fun m!749795 () Bool)

(assert (=> b!807709 m!749795))

(assert (=> b!807709 m!749793))

(declare-fun m!749797 () Bool)

(assert (=> b!807709 m!749797))

(declare-fun m!749799 () Bool)

(assert (=> b!807704 m!749799))

(declare-fun m!749801 () Bool)

(assert (=> b!807704 m!749801))

(declare-fun m!749803 () Bool)

(assert (=> b!807710 m!749803))

(assert (=> b!807707 m!749793))

(assert (=> b!807707 m!749793))

(declare-fun m!749805 () Bool)

(assert (=> b!807707 m!749805))

(declare-fun m!749807 () Bool)

(assert (=> start!69234 m!749807))

(declare-fun m!749809 () Bool)

(assert (=> start!69234 m!749809))

(declare-fun m!749811 () Bool)

(assert (=> b!807708 m!749811))

(push 1)

