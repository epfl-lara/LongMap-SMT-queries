; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68832 () Bool)

(assert start!68832)

(declare-fun b!802417 () Bool)

(declare-fun e!444703 () Bool)

(declare-fun e!444706 () Bool)

(assert (=> b!802417 (= e!444703 e!444706)))

(declare-fun res!546940 () Bool)

(assert (=> b!802417 (=> (not res!546940) (not e!444706))))

(declare-datatypes ((SeekEntryResult!8482 0))(
  ( (MissingZero!8482 (index!36296 (_ BitVec 32))) (Found!8482 (index!36297 (_ BitVec 32))) (Intermediate!8482 (undefined!9294 Bool) (index!36298 (_ BitVec 32)) (x!67144 (_ BitVec 32))) (Undefined!8482) (MissingVacant!8482 (index!36299 (_ BitVec 32))) )
))
(declare-fun lt!358838 () SeekEntryResult!8482)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!802417 (= res!546940 (or (= lt!358838 (MissingZero!8482 i!1163)) (= lt!358838 (MissingVacant!8482 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-datatypes ((array!43622 0))(
  ( (array!43623 (arr!20891 (Array (_ BitVec 32) (_ BitVec 64))) (size!21312 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43622)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43622 (_ BitVec 32)) SeekEntryResult!8482)

(assert (=> b!802417 (= lt!358838 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!802418 () Bool)

(declare-fun e!444707 () Bool)

(declare-fun e!444704 () Bool)

(assert (=> b!802418 (= e!444707 e!444704)))

(declare-fun res!546945 () Bool)

(assert (=> b!802418 (=> (not res!546945) (not e!444704))))

(declare-fun lt!358839 () SeekEntryResult!8482)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun lt!358840 () SeekEntryResult!8482)

(assert (=> b!802418 (= res!546945 (and (= lt!358840 lt!358839) (= lt!358839 (Found!8482 j!153)) (not (= (select (arr!20891 a!3170) index!1236) (select (arr!20891 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43622 (_ BitVec 32)) SeekEntryResult!8482)

(assert (=> b!802418 (= lt!358839 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20891 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!802418 (= lt!358840 (seekEntryOrOpen!0 (select (arr!20891 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!802419 () Bool)

(declare-fun e!444705 () Bool)

(declare-fun lt!358835 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!802419 (= e!444705 (validKeyInArray!0 lt!358835))))

(declare-fun b!802420 () Bool)

(declare-fun res!546939 () Bool)

(assert (=> b!802420 (=> (not res!546939) (not e!444703))))

(declare-fun arrayContainsKey!0 (array!43622 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!802420 (= res!546939 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!802421 () Bool)

(declare-fun res!546936 () Bool)

(assert (=> b!802421 (=> (not res!546936) (not e!444703))))

(assert (=> b!802421 (= res!546936 (validKeyInArray!0 (select (arr!20891 a!3170) j!153)))))

(declare-fun b!802422 () Bool)

(assert (=> b!802422 (= e!444704 (not e!444705))))

(declare-fun res!546938 () Bool)

(assert (=> b!802422 (=> res!546938 e!444705)))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(assert (=> b!802422 (= res!546938 (or (bvslt mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266)) (not (= (select (store (arr!20891 a!3170) i!1163 k!2044) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!358841 () array!43622)

(declare-fun lt!358836 () (_ BitVec 32))

(assert (=> b!802422 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358836 vacantAfter!23 lt!358835 lt!358841 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358836 vacantBefore!23 (select (arr!20891 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27504 0))(
  ( (Unit!27505) )
))
(declare-fun lt!358837 () Unit!27504)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43622 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27504)

(assert (=> b!802422 (= lt!358837 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k!2044 j!153 lt!358836 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!802422 (= lt!358836 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!802423 () Bool)

(declare-fun res!546947 () Bool)

(assert (=> b!802423 (=> (not res!546947) (not e!444706))))

(declare-datatypes ((List!14854 0))(
  ( (Nil!14851) (Cons!14850 (h!15979 (_ BitVec 64)) (t!21169 List!14854)) )
))
(declare-fun arrayNoDuplicates!0 (array!43622 (_ BitVec 32) List!14854) Bool)

(assert (=> b!802423 (= res!546947 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14851))))

(declare-fun b!802424 () Bool)

(assert (=> b!802424 (= e!444706 e!444707)))

(declare-fun res!546944 () Bool)

(assert (=> b!802424 (=> (not res!546944) (not e!444707))))

(assert (=> b!802424 (= res!546944 (= (seekEntryOrOpen!0 lt!358835 lt!358841 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!358835 lt!358841 mask!3266)))))

(assert (=> b!802424 (= lt!358835 (select (store (arr!20891 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!802424 (= lt!358841 (array!43623 (store (arr!20891 a!3170) i!1163 k!2044) (size!21312 a!3170)))))

(declare-fun res!546943 () Bool)

(assert (=> start!68832 (=> (not res!546943) (not e!444703))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68832 (= res!546943 (validMask!0 mask!3266))))

(assert (=> start!68832 e!444703))

(assert (=> start!68832 true))

(declare-fun array_inv!16687 (array!43622) Bool)

(assert (=> start!68832 (array_inv!16687 a!3170)))

(declare-fun b!802425 () Bool)

(declare-fun res!546946 () Bool)

(assert (=> b!802425 (=> (not res!546946) (not e!444706))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43622 (_ BitVec 32)) Bool)

(assert (=> b!802425 (= res!546946 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!802426 () Bool)

(declare-fun res!546942 () Bool)

(assert (=> b!802426 (=> (not res!546942) (not e!444706))))

(assert (=> b!802426 (= res!546942 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21312 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20891 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21312 a!3170)) (= (select (arr!20891 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!802427 () Bool)

(declare-fun res!546941 () Bool)

(assert (=> b!802427 (=> (not res!546941) (not e!444703))))

(assert (=> b!802427 (= res!546941 (validKeyInArray!0 k!2044))))

(declare-fun b!802428 () Bool)

(declare-fun res!546937 () Bool)

(assert (=> b!802428 (=> (not res!546937) (not e!444703))))

(assert (=> b!802428 (= res!546937 (and (= (size!21312 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21312 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21312 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!68832 res!546943) b!802428))

(assert (= (and b!802428 res!546937) b!802421))

(assert (= (and b!802421 res!546936) b!802427))

(assert (= (and b!802427 res!546941) b!802420))

(assert (= (and b!802420 res!546939) b!802417))

(assert (= (and b!802417 res!546940) b!802425))

(assert (= (and b!802425 res!546946) b!802423))

(assert (= (and b!802423 res!546947) b!802426))

(assert (= (and b!802426 res!546942) b!802424))

(assert (= (and b!802424 res!546944) b!802418))

(assert (= (and b!802418 res!546945) b!802422))

(assert (= (and b!802422 (not res!546938)) b!802419))

(declare-fun m!743861 () Bool)

(assert (=> b!802421 m!743861))

(assert (=> b!802421 m!743861))

(declare-fun m!743863 () Bool)

(assert (=> b!802421 m!743863))

(declare-fun m!743865 () Bool)

(assert (=> b!802427 m!743865))

(declare-fun m!743867 () Bool)

(assert (=> b!802425 m!743867))

(declare-fun m!743869 () Bool)

(assert (=> b!802423 m!743869))

(declare-fun m!743871 () Bool)

(assert (=> b!802418 m!743871))

(assert (=> b!802418 m!743861))

(assert (=> b!802418 m!743861))

(declare-fun m!743873 () Bool)

(assert (=> b!802418 m!743873))

(assert (=> b!802418 m!743861))

(declare-fun m!743875 () Bool)

(assert (=> b!802418 m!743875))

(declare-fun m!743877 () Bool)

(assert (=> b!802420 m!743877))

(declare-fun m!743879 () Bool)

(assert (=> b!802417 m!743879))

(declare-fun m!743881 () Bool)

(assert (=> b!802419 m!743881))

(declare-fun m!743883 () Bool)

(assert (=> start!68832 m!743883))

(declare-fun m!743885 () Bool)

(assert (=> start!68832 m!743885))

(declare-fun m!743887 () Bool)

(assert (=> b!802422 m!743887))

(assert (=> b!802422 m!743861))

(declare-fun m!743889 () Bool)

(assert (=> b!802422 m!743889))

(assert (=> b!802422 m!743861))

(declare-fun m!743891 () Bool)

(assert (=> b!802422 m!743891))

(declare-fun m!743893 () Bool)

(assert (=> b!802422 m!743893))

(declare-fun m!743895 () Bool)

(assert (=> b!802422 m!743895))

(declare-fun m!743897 () Bool)

(assert (=> b!802422 m!743897))

(declare-fun m!743899 () Bool)

(assert (=> b!802426 m!743899))

(declare-fun m!743901 () Bool)

(assert (=> b!802426 m!743901))

(declare-fun m!743903 () Bool)

(assert (=> b!802424 m!743903))

(declare-fun m!743905 () Bool)

(assert (=> b!802424 m!743905))

(assert (=> b!802424 m!743897))

(declare-fun m!743907 () Bool)

(assert (=> b!802424 m!743907))

(push 1)

(assert (not b!802420))

(assert (not b!802423))

(assert (not b!802417))

(assert (not b!802421))

(assert (not b!802425))

(assert (not b!802422))

(assert (not b!802427))

(assert (not b!802418))

(assert (not b!802424))

(assert (not b!802419))

(assert (not start!68832))

(check-sat)

