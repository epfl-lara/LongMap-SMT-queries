; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68918 () Bool)

(assert start!68918)

(declare-fun b!803918 () Bool)

(declare-fun e!445431 () Bool)

(declare-fun e!445433 () Bool)

(assert (=> b!803918 (= e!445431 e!445433)))

(declare-fun res!548438 () Bool)

(assert (=> b!803918 (=> (not res!548438) (not e!445433))))

(declare-datatypes ((SeekEntryResult!8525 0))(
  ( (MissingZero!8525 (index!36468 (_ BitVec 32))) (Found!8525 (index!36469 (_ BitVec 32))) (Intermediate!8525 (undefined!9337 Bool) (index!36470 (_ BitVec 32)) (x!67307 (_ BitVec 32))) (Undefined!8525) (MissingVacant!8525 (index!36471 (_ BitVec 32))) )
))
(declare-fun lt!359958 () SeekEntryResult!8525)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!803918 (= res!548438 (or (= lt!359958 (MissingZero!8525 i!1163)) (= lt!359958 (MissingVacant!8525 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-datatypes ((array!43708 0))(
  ( (array!43709 (arr!20934 (Array (_ BitVec 32) (_ BitVec 64))) (size!21355 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43708)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43708 (_ BitVec 32)) SeekEntryResult!8525)

(assert (=> b!803918 (= lt!359958 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!803919 () Bool)

(declare-fun res!548444 () Bool)

(assert (=> b!803919 (=> (not res!548444) (not e!445431))))

(declare-fun arrayContainsKey!0 (array!43708 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!803919 (= res!548444 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!803920 () Bool)

(declare-fun e!445430 () Bool)

(declare-fun e!445429 () Bool)

(assert (=> b!803920 (= e!445430 e!445429)))

(declare-fun res!548442 () Bool)

(assert (=> b!803920 (=> (not res!548442) (not e!445429))))

(declare-fun lt!359955 () SeekEntryResult!8525)

(declare-fun lt!359960 () SeekEntryResult!8525)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!803920 (= res!548442 (and (= lt!359960 lt!359955) (= lt!359955 (Found!8525 j!153)) (not (= (select (arr!20934 a!3170) index!1236) (select (arr!20934 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43708 (_ BitVec 32)) SeekEntryResult!8525)

(assert (=> b!803920 (= lt!359955 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20934 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!803920 (= lt!359960 (seekEntryOrOpen!0 (select (arr!20934 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!803921 () Bool)

(declare-fun res!548439 () Bool)

(assert (=> b!803921 (=> (not res!548439) (not e!445433))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43708 (_ BitVec 32)) Bool)

(assert (=> b!803921 (= res!548439 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!803922 () Bool)

(declare-fun res!548446 () Bool)

(assert (=> b!803922 (=> (not res!548446) (not e!445433))))

(declare-datatypes ((List!14897 0))(
  ( (Nil!14894) (Cons!14893 (h!16022 (_ BitVec 64)) (t!21212 List!14897)) )
))
(declare-fun arrayNoDuplicates!0 (array!43708 (_ BitVec 32) List!14897) Bool)

(assert (=> b!803922 (= res!548446 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14894))))

(declare-fun b!803923 () Bool)

(declare-fun res!548441 () Bool)

(assert (=> b!803923 (=> (not res!548441) (not e!445431))))

(assert (=> b!803923 (= res!548441 (and (= (size!21355 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21355 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21355 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!803924 () Bool)

(declare-fun res!548445 () Bool)

(assert (=> b!803924 (=> (not res!548445) (not e!445431))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!803924 (= res!548445 (validKeyInArray!0 k!2044))))

(declare-fun b!803925 () Bool)

(declare-fun res!548443 () Bool)

(assert (=> b!803925 (=> (not res!548443) (not e!445431))))

(assert (=> b!803925 (= res!548443 (validKeyInArray!0 (select (arr!20934 a!3170) j!153)))))

(declare-fun b!803926 () Bool)

(assert (=> b!803926 (= e!445433 e!445430)))

(declare-fun res!548440 () Bool)

(assert (=> b!803926 (=> (not res!548440) (not e!445430))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!359956 () (_ BitVec 64))

(declare-fun lt!359954 () array!43708)

(assert (=> b!803926 (= res!548440 (= (seekEntryOrOpen!0 lt!359956 lt!359954 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!359956 lt!359954 mask!3266)))))

(assert (=> b!803926 (= lt!359956 (select (store (arr!20934 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!803926 (= lt!359954 (array!43709 (store (arr!20934 a!3170) i!1163 k!2044) (size!21355 a!3170)))))

(declare-fun res!548447 () Bool)

(assert (=> start!68918 (=> (not res!548447) (not e!445431))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68918 (= res!548447 (validMask!0 mask!3266))))

(assert (=> start!68918 e!445431))

(assert (=> start!68918 true))

(declare-fun array_inv!16730 (array!43708) Bool)

(assert (=> start!68918 (array_inv!16730 a!3170)))

(declare-fun b!803927 () Bool)

(declare-fun res!548437 () Bool)

(assert (=> b!803927 (=> (not res!548437) (not e!445433))))

(assert (=> b!803927 (= res!548437 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21355 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20934 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21355 a!3170)) (= (select (arr!20934 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!803928 () Bool)

(assert (=> b!803928 (= e!445429 (not true))))

(declare-fun lt!359957 () (_ BitVec 32))

(assert (=> b!803928 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359957 vacantAfter!23 lt!359956 lt!359954 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359957 vacantBefore!23 (select (arr!20934 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27590 0))(
  ( (Unit!27591) )
))
(declare-fun lt!359959 () Unit!27590)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43708 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27590)

(assert (=> b!803928 (= lt!359959 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k!2044 j!153 lt!359957 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!803928 (= lt!359957 (nextIndex!0 index!1236 x!1077 mask!3266))))

(assert (= (and start!68918 res!548447) b!803923))

(assert (= (and b!803923 res!548441) b!803925))

(assert (= (and b!803925 res!548443) b!803924))

(assert (= (and b!803924 res!548445) b!803919))

(assert (= (and b!803919 res!548444) b!803918))

(assert (= (and b!803918 res!548438) b!803921))

(assert (= (and b!803921 res!548439) b!803922))

(assert (= (and b!803922 res!548446) b!803927))

(assert (= (and b!803927 res!548437) b!803926))

(assert (= (and b!803926 res!548440) b!803920))

(assert (= (and b!803920 res!548442) b!803928))

(declare-fun m!745775 () Bool)

(assert (=> b!803924 m!745775))

(declare-fun m!745777 () Bool)

(assert (=> b!803922 m!745777))

(declare-fun m!745779 () Bool)

(assert (=> b!803920 m!745779))

(declare-fun m!745781 () Bool)

(assert (=> b!803920 m!745781))

(assert (=> b!803920 m!745781))

(declare-fun m!745783 () Bool)

(assert (=> b!803920 m!745783))

(assert (=> b!803920 m!745781))

(declare-fun m!745785 () Bool)

(assert (=> b!803920 m!745785))

(declare-fun m!745787 () Bool)

(assert (=> start!68918 m!745787))

(declare-fun m!745789 () Bool)

(assert (=> start!68918 m!745789))

(declare-fun m!745791 () Bool)

(assert (=> b!803927 m!745791))

(declare-fun m!745793 () Bool)

(assert (=> b!803927 m!745793))

(assert (=> b!803925 m!745781))

(assert (=> b!803925 m!745781))

(declare-fun m!745795 () Bool)

(assert (=> b!803925 m!745795))

(assert (=> b!803928 m!745781))

(assert (=> b!803928 m!745781))

(declare-fun m!745797 () Bool)

(assert (=> b!803928 m!745797))

(declare-fun m!745799 () Bool)

(assert (=> b!803928 m!745799))

(declare-fun m!745801 () Bool)

(assert (=> b!803928 m!745801))

(declare-fun m!745803 () Bool)

(assert (=> b!803928 m!745803))

(declare-fun m!745805 () Bool)

(assert (=> b!803921 m!745805))

(declare-fun m!745807 () Bool)

(assert (=> b!803926 m!745807))

(declare-fun m!745809 () Bool)

(assert (=> b!803926 m!745809))

(declare-fun m!745811 () Bool)

(assert (=> b!803926 m!745811))

(declare-fun m!745813 () Bool)

(assert (=> b!803926 m!745813))

(declare-fun m!745815 () Bool)

(assert (=> b!803919 m!745815))

(declare-fun m!745817 () Bool)

(assert (=> b!803918 m!745817))

(push 1)

