; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68744 () Bool)

(assert start!68744)

(declare-fun b!800835 () Bool)

(declare-fun res!545361 () Bool)

(declare-fun e!443976 () Bool)

(assert (=> b!800835 (=> (not res!545361) (not e!443976))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43534 0))(
  ( (array!43535 (arr!20847 (Array (_ BitVec 32) (_ BitVec 64))) (size!21268 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43534)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!800835 (= res!545361 (and (= (size!21268 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21268 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21268 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!800836 () Bool)

(declare-fun res!545363 () Bool)

(declare-fun e!443973 () Bool)

(assert (=> b!800836 (=> (not res!545363) (not e!443973))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!800836 (= res!545363 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21268 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20847 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21268 a!3170)) (= (select (arr!20847 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun res!545359 () Bool)

(assert (=> start!68744 (=> (not res!545359) (not e!443976))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68744 (= res!545359 (validMask!0 mask!3266))))

(assert (=> start!68744 e!443976))

(assert (=> start!68744 true))

(declare-fun array_inv!16643 (array!43534) Bool)

(assert (=> start!68744 (array_inv!16643 a!3170)))

(declare-fun b!800837 () Bool)

(declare-fun res!545358 () Bool)

(assert (=> b!800837 (=> (not res!545358) (not e!443973))))

(declare-datatypes ((List!14810 0))(
  ( (Nil!14807) (Cons!14806 (h!15935 (_ BitVec 64)) (t!21125 List!14810)) )
))
(declare-fun arrayNoDuplicates!0 (array!43534 (_ BitVec 32) List!14810) Bool)

(assert (=> b!800837 (= res!545358 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14807))))

(declare-fun b!800838 () Bool)

(declare-fun e!443974 () Bool)

(declare-fun e!443978 () Bool)

(assert (=> b!800838 (= e!443974 e!443978)))

(declare-fun res!545354 () Bool)

(assert (=> b!800838 (=> (not res!545354) (not e!443978))))

(declare-fun lt!357854 () (_ BitVec 32))

(assert (=> b!800838 (= res!545354 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!357854 #b00000000000000000000000000000000) (bvslt lt!357854 (size!21268 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!800838 (= lt!357854 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!800839 () Bool)

(declare-fun res!545366 () Bool)

(assert (=> b!800839 (=> (not res!545366) (not e!443978))))

(declare-fun lt!357852 () (_ BitVec 64))

(declare-fun lt!357855 () array!43534)

(declare-datatypes ((SeekEntryResult!8438 0))(
  ( (MissingZero!8438 (index!36120 (_ BitVec 32))) (Found!8438 (index!36121 (_ BitVec 32))) (Intermediate!8438 (undefined!9250 Bool) (index!36122 (_ BitVec 32)) (x!66988 (_ BitVec 32))) (Undefined!8438) (MissingVacant!8438 (index!36123 (_ BitVec 32))) )
))
(declare-fun lt!357850 () SeekEntryResult!8438)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43534 (_ BitVec 32)) SeekEntryResult!8438)

(assert (=> b!800839 (= res!545366 (= lt!357850 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357854 vacantAfter!23 lt!357852 lt!357855 mask!3266)))))

(declare-fun b!800840 () Bool)

(declare-fun res!545356 () Bool)

(assert (=> b!800840 (=> (not res!545356) (not e!443976))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43534 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!800840 (= res!545356 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!800841 () Bool)

(declare-fun res!545355 () Bool)

(assert (=> b!800841 (=> (not res!545355) (not e!443976))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!800841 (= res!545355 (validKeyInArray!0 k!2044))))

(declare-fun b!800842 () Bool)

(declare-fun res!545360 () Bool)

(assert (=> b!800842 (=> (not res!545360) (not e!443976))))

(assert (=> b!800842 (= res!545360 (validKeyInArray!0 (select (arr!20847 a!3170) j!153)))))

(declare-fun b!800843 () Bool)

(assert (=> b!800843 (= e!443978 false)))

(declare-fun lt!357851 () SeekEntryResult!8438)

(assert (=> b!800843 (= lt!357851 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357854 vacantBefore!23 (select (arr!20847 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!800844 () Bool)

(declare-fun res!545365 () Bool)

(assert (=> b!800844 (=> (not res!545365) (not e!443973))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43534 (_ BitVec 32)) Bool)

(assert (=> b!800844 (= res!545365 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!800845 () Bool)

(assert (=> b!800845 (= e!443976 e!443973)))

(declare-fun res!545364 () Bool)

(assert (=> b!800845 (=> (not res!545364) (not e!443973))))

(declare-fun lt!357856 () SeekEntryResult!8438)

(assert (=> b!800845 (= res!545364 (or (= lt!357856 (MissingZero!8438 i!1163)) (= lt!357856 (MissingVacant!8438 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43534 (_ BitVec 32)) SeekEntryResult!8438)

(assert (=> b!800845 (= lt!357856 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!800846 () Bool)

(declare-fun e!443975 () Bool)

(assert (=> b!800846 (= e!443975 e!443974)))

(declare-fun res!545362 () Bool)

(assert (=> b!800846 (=> (not res!545362) (not e!443974))))

(declare-fun lt!357853 () SeekEntryResult!8438)

(declare-fun lt!357857 () SeekEntryResult!8438)

(assert (=> b!800846 (= res!545362 (and (= lt!357857 lt!357853) (= lt!357853 (Found!8438 j!153)) (not (= (select (arr!20847 a!3170) index!1236) (select (arr!20847 a!3170) j!153)))))))

(assert (=> b!800846 (= lt!357853 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20847 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!800846 (= lt!357857 (seekEntryOrOpen!0 (select (arr!20847 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!800847 () Bool)

(assert (=> b!800847 (= e!443973 e!443975)))

(declare-fun res!545357 () Bool)

(assert (=> b!800847 (=> (not res!545357) (not e!443975))))

(assert (=> b!800847 (= res!545357 (= lt!357850 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!357852 lt!357855 mask!3266)))))

(assert (=> b!800847 (= lt!357850 (seekEntryOrOpen!0 lt!357852 lt!357855 mask!3266))))

(assert (=> b!800847 (= lt!357852 (select (store (arr!20847 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!800847 (= lt!357855 (array!43535 (store (arr!20847 a!3170) i!1163 k!2044) (size!21268 a!3170)))))

(assert (= (and start!68744 res!545359) b!800835))

(assert (= (and b!800835 res!545361) b!800842))

(assert (= (and b!800842 res!545360) b!800841))

(assert (= (and b!800841 res!545355) b!800840))

(assert (= (and b!800840 res!545356) b!800845))

(assert (= (and b!800845 res!545364) b!800844))

(assert (= (and b!800844 res!545365) b!800837))

(assert (= (and b!800837 res!545358) b!800836))

(assert (= (and b!800836 res!545363) b!800847))

(assert (= (and b!800847 res!545357) b!800846))

(assert (= (and b!800846 res!545362) b!800838))

(assert (= (and b!800838 res!545354) b!800839))

(assert (= (and b!800839 res!545366) b!800843))

(declare-fun m!741953 () Bool)

(assert (=> b!800843 m!741953))

(assert (=> b!800843 m!741953))

(declare-fun m!741955 () Bool)

(assert (=> b!800843 m!741955))

(declare-fun m!741957 () Bool)

(assert (=> b!800847 m!741957))

(declare-fun m!741959 () Bool)

(assert (=> b!800847 m!741959))

(declare-fun m!741961 () Bool)

(assert (=> b!800847 m!741961))

(declare-fun m!741963 () Bool)

(assert (=> b!800847 m!741963))

(declare-fun m!741965 () Bool)

(assert (=> b!800838 m!741965))

(assert (=> b!800842 m!741953))

(assert (=> b!800842 m!741953))

(declare-fun m!741967 () Bool)

(assert (=> b!800842 m!741967))

(declare-fun m!741969 () Bool)

(assert (=> b!800840 m!741969))

(declare-fun m!741971 () Bool)

(assert (=> start!68744 m!741971))

(declare-fun m!741973 () Bool)

(assert (=> start!68744 m!741973))

(declare-fun m!741975 () Bool)

(assert (=> b!800841 m!741975))

(declare-fun m!741977 () Bool)

(assert (=> b!800846 m!741977))

(assert (=> b!800846 m!741953))

(assert (=> b!800846 m!741953))

(declare-fun m!741979 () Bool)

(assert (=> b!800846 m!741979))

(assert (=> b!800846 m!741953))

(declare-fun m!741981 () Bool)

(assert (=> b!800846 m!741981))

(declare-fun m!741983 () Bool)

(assert (=> b!800837 m!741983))

(declare-fun m!741985 () Bool)

(assert (=> b!800839 m!741985))

(declare-fun m!741987 () Bool)

(assert (=> b!800844 m!741987))

(declare-fun m!741989 () Bool)

(assert (=> b!800845 m!741989))

(declare-fun m!741991 () Bool)

(assert (=> b!800836 m!741991))

(declare-fun m!741993 () Bool)

(assert (=> b!800836 m!741993))

(push 1)

