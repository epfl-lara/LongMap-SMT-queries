; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27306 () Bool)

(assert start!27306)

(declare-fun b!282959 () Bool)

(declare-fun res!146032 () Bool)

(declare-fun e!179546 () Bool)

(assert (=> b!282959 (=> (not res!146032) (not e!179546))))

(declare-datatypes ((array!14124 0))(
  ( (array!14125 (arr!6704 (Array (_ BitVec 32) (_ BitVec 64))) (size!7056 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14124)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14124 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!282959 (= res!146032 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!282960 () Bool)

(declare-fun e!179545 () Bool)

(assert (=> b!282960 (= e!179545 true)))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun lt!139835 () array!14124)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14124 (_ BitVec 32)) Bool)

(assert (=> b!282960 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!139835 mask!3868)))

(declare-fun i!1267 () (_ BitVec 32))

(declare-datatypes ((Unit!9008 0))(
  ( (Unit!9009) )
))
(declare-fun lt!139836 () Unit!9008)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!14124 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!9008)

(assert (=> b!282960 (= lt!139836 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun b!282961 () Bool)

(declare-fun res!146033 () Bool)

(declare-fun e!179547 () Bool)

(assert (=> b!282961 (=> (not res!146033) (not e!179547))))

(assert (=> b!282961 (= res!146033 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!282962 () Bool)

(declare-fun res!146036 () Bool)

(assert (=> b!282962 (=> (not res!146036) (not e!179546))))

(assert (=> b!282962 (= res!146036 (and (= (size!7056 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7056 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7056 a!3325))))))

(declare-fun res!146030 () Bool)

(assert (=> start!27306 (=> (not res!146030) (not e!179546))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27306 (= res!146030 (validMask!0 mask!3868))))

(assert (=> start!27306 e!179546))

(declare-fun array_inv!4667 (array!14124) Bool)

(assert (=> start!27306 (array_inv!4667 a!3325)))

(assert (=> start!27306 true))

(declare-fun b!282963 () Bool)

(declare-fun res!146034 () Bool)

(assert (=> b!282963 (=> (not res!146034) (not e!179546))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!282963 (= res!146034 (validKeyInArray!0 k!2581))))

(declare-fun b!282964 () Bool)

(declare-fun res!146035 () Bool)

(declare-fun e!179548 () Bool)

(assert (=> b!282964 (=> (not res!146035) (not e!179548))))

(assert (=> b!282964 (= res!146035 (validKeyInArray!0 (select (arr!6704 a!3325) startIndex!26)))))

(declare-fun b!282965 () Bool)

(assert (=> b!282965 (= e!179546 e!179547)))

(declare-fun res!146028 () Bool)

(assert (=> b!282965 (=> (not res!146028) (not e!179547))))

(declare-datatypes ((SeekEntryResult!1862 0))(
  ( (MissingZero!1862 (index!9618 (_ BitVec 32))) (Found!1862 (index!9619 (_ BitVec 32))) (Intermediate!1862 (undefined!2674 Bool) (index!9620 (_ BitVec 32)) (x!27828 (_ BitVec 32))) (Undefined!1862) (MissingVacant!1862 (index!9621 (_ BitVec 32))) )
))
(declare-fun lt!139840 () SeekEntryResult!1862)

(assert (=> b!282965 (= res!146028 (or (= lt!139840 (MissingZero!1862 i!1267)) (= lt!139840 (MissingVacant!1862 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14124 (_ BitVec 32)) SeekEntryResult!1862)

(assert (=> b!282965 (= lt!139840 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!282966 () Bool)

(declare-fun res!146037 () Bool)

(assert (=> b!282966 (=> (not res!146037) (not e!179546))))

(declare-datatypes ((List!4512 0))(
  ( (Nil!4509) (Cons!4508 (h!5178 (_ BitVec 64)) (t!9594 List!4512)) )
))
(declare-fun arrayNoDuplicates!0 (array!14124 (_ BitVec 32) List!4512) Bool)

(assert (=> b!282966 (= res!146037 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4509))))

(declare-fun b!282967 () Bool)

(assert (=> b!282967 (= e!179547 e!179548)))

(declare-fun res!146029 () Bool)

(assert (=> b!282967 (=> (not res!146029) (not e!179548))))

(assert (=> b!282967 (= res!146029 (not (= startIndex!26 i!1267)))))

(assert (=> b!282967 (= lt!139835 (array!14125 (store (arr!6704 a!3325) i!1267 k!2581) (size!7056 a!3325)))))

(declare-fun b!282968 () Bool)

(assert (=> b!282968 (= e!179548 (not e!179545))))

(declare-fun res!146031 () Bool)

(assert (=> b!282968 (=> res!146031 e!179545)))

(assert (=> b!282968 (= res!146031 (or (bvsge startIndex!26 (bvsub (size!7056 a!3325) #b00000000000000000000000000000001)) (bvslt (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000)))))

(assert (=> b!282968 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-fun lt!139837 () Unit!9008)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14124 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9008)

(assert (=> b!282968 (= lt!139837 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(assert (=> b!282968 (= (seekEntryOrOpen!0 (select (arr!6704 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6704 a!3325) i!1267 k!2581) startIndex!26) lt!139835 mask!3868))))

(declare-fun lt!139838 () Unit!9008)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14124 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!9008)

(assert (=> b!282968 (= lt!139838 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(assert (=> b!282968 (arrayNoDuplicates!0 lt!139835 #b00000000000000000000000000000000 Nil!4509)))

(declare-fun lt!139839 () Unit!9008)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14124 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4512) Unit!9008)

(assert (=> b!282968 (= lt!139839 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4509))))

(assert (= (and start!27306 res!146030) b!282962))

(assert (= (and b!282962 res!146036) b!282963))

(assert (= (and b!282963 res!146034) b!282966))

(assert (= (and b!282966 res!146037) b!282959))

(assert (= (and b!282959 res!146032) b!282965))

(assert (= (and b!282965 res!146028) b!282961))

(assert (= (and b!282961 res!146033) b!282967))

(assert (= (and b!282967 res!146029) b!282964))

(assert (= (and b!282964 res!146035) b!282968))

(assert (= (and b!282968 (not res!146031)) b!282960))

(declare-fun m!297699 () Bool)

(assert (=> start!27306 m!297699))

(declare-fun m!297701 () Bool)

(assert (=> start!27306 m!297701))

(declare-fun m!297703 () Bool)

(assert (=> b!282961 m!297703))

(declare-fun m!297705 () Bool)

(assert (=> b!282959 m!297705))

(declare-fun m!297707 () Bool)

(assert (=> b!282966 m!297707))

(declare-fun m!297709 () Bool)

(assert (=> b!282960 m!297709))

(declare-fun m!297711 () Bool)

(assert (=> b!282960 m!297711))

(declare-fun m!297713 () Bool)

(assert (=> b!282963 m!297713))

(declare-fun m!297715 () Bool)

(assert (=> b!282965 m!297715))

(declare-fun m!297717 () Bool)

(assert (=> b!282967 m!297717))

(declare-fun m!297719 () Bool)

(assert (=> b!282964 m!297719))

(assert (=> b!282964 m!297719))

(declare-fun m!297721 () Bool)

(assert (=> b!282964 m!297721))

(declare-fun m!297723 () Bool)

(assert (=> b!282968 m!297723))

(declare-fun m!297725 () Bool)

(assert (=> b!282968 m!297725))

(declare-fun m!297727 () Bool)

(assert (=> b!282968 m!297727))

(assert (=> b!282968 m!297725))

(assert (=> b!282968 m!297717))

(declare-fun m!297729 () Bool)

(assert (=> b!282968 m!297729))

(assert (=> b!282968 m!297719))

(declare-fun m!297731 () Bool)

(assert (=> b!282968 m!297731))

(declare-fun m!297733 () Bool)

(assert (=> b!282968 m!297733))

(declare-fun m!297735 () Bool)

(assert (=> b!282968 m!297735))

(assert (=> b!282968 m!297719))

(declare-fun m!297737 () Bool)

(assert (=> b!282968 m!297737))

(push 1)

