; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27094 () Bool)

(assert start!27094)

(declare-fun b!279947 () Bool)

(declare-fun res!143018 () Bool)

(declare-fun e!178425 () Bool)

(assert (=> b!279947 (=> (not res!143018) (not e!178425))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!279947 (= res!143018 (validKeyInArray!0 k!2581))))

(declare-fun b!279948 () Bool)

(declare-fun e!178426 () Bool)

(assert (=> b!279948 (= e!178426 false)))

(declare-fun lt!138750 () Bool)

(declare-datatypes ((List!4406 0))(
  ( (Nil!4403) (Cons!4402 (h!5072 (_ BitVec 64)) (t!9488 List!4406)) )
))
(declare-fun contains!1978 (List!4406 (_ BitVec 64)) Bool)

(assert (=> b!279948 (= lt!138750 (contains!1978 Nil!4403 k!2581))))

(declare-fun b!279949 () Bool)

(declare-fun res!143019 () Bool)

(assert (=> b!279949 (=> (not res!143019) (not e!178426))))

(declare-datatypes ((array!13912 0))(
  ( (array!13913 (arr!6598 (Array (_ BitVec 32) (_ BitVec 64))) (size!6950 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13912)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13912 (_ BitVec 32)) Bool)

(assert (=> b!279949 (= res!143019 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!279950 () Bool)

(declare-fun res!143020 () Bool)

(assert (=> b!279950 (=> (not res!143020) (not e!178426))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!279950 (= res!143020 (not (= startIndex!26 i!1267)))))

(declare-fun b!279951 () Bool)

(declare-fun res!143017 () Bool)

(assert (=> b!279951 (=> (not res!143017) (not e!178425))))

(assert (=> b!279951 (= res!143017 (and (= (size!6950 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6950 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6950 a!3325))))))

(declare-fun res!143016 () Bool)

(assert (=> start!27094 (=> (not res!143016) (not e!178425))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27094 (= res!143016 (validMask!0 mask!3868))))

(assert (=> start!27094 e!178425))

(declare-fun array_inv!4561 (array!13912) Bool)

(assert (=> start!27094 (array_inv!4561 a!3325)))

(assert (=> start!27094 true))

(declare-fun b!279952 () Bool)

(declare-fun res!143027 () Bool)

(assert (=> b!279952 (=> (not res!143027) (not e!178426))))

(assert (=> b!279952 (= res!143027 (and (bvslt (size!6950 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6950 a!3325))))))

(declare-fun b!279953 () Bool)

(declare-fun res!143028 () Bool)

(assert (=> b!279953 (=> (not res!143028) (not e!178426))))

(assert (=> b!279953 (= res!143028 (not (contains!1978 Nil!4403 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!279954 () Bool)

(assert (=> b!279954 (= e!178425 e!178426)))

(declare-fun res!143023 () Bool)

(assert (=> b!279954 (=> (not res!143023) (not e!178426))))

(declare-datatypes ((SeekEntryResult!1756 0))(
  ( (MissingZero!1756 (index!9194 (_ BitVec 32))) (Found!1756 (index!9195 (_ BitVec 32))) (Intermediate!1756 (undefined!2568 Bool) (index!9196 (_ BitVec 32)) (x!27434 (_ BitVec 32))) (Undefined!1756) (MissingVacant!1756 (index!9197 (_ BitVec 32))) )
))
(declare-fun lt!138751 () SeekEntryResult!1756)

(assert (=> b!279954 (= res!143023 (or (= lt!138751 (MissingZero!1756 i!1267)) (= lt!138751 (MissingVacant!1756 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13912 (_ BitVec 32)) SeekEntryResult!1756)

(assert (=> b!279954 (= lt!138751 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!279955 () Bool)

(declare-fun res!143021 () Bool)

(assert (=> b!279955 (=> (not res!143021) (not e!178426))))

(assert (=> b!279955 (= res!143021 (not (contains!1978 Nil!4403 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!279956 () Bool)

(declare-fun res!143022 () Bool)

(assert (=> b!279956 (=> (not res!143022) (not e!178426))))

(assert (=> b!279956 (= res!143022 (validKeyInArray!0 (select (arr!6598 a!3325) startIndex!26)))))

(declare-fun b!279957 () Bool)

(declare-fun res!143024 () Bool)

(assert (=> b!279957 (=> (not res!143024) (not e!178425))))

(declare-fun arrayContainsKey!0 (array!13912 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!279957 (= res!143024 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!279958 () Bool)

(declare-fun res!143026 () Bool)

(assert (=> b!279958 (=> (not res!143026) (not e!178426))))

(declare-fun noDuplicate!160 (List!4406) Bool)

(assert (=> b!279958 (= res!143026 (noDuplicate!160 Nil!4403))))

(declare-fun b!279959 () Bool)

(declare-fun res!143025 () Bool)

(assert (=> b!279959 (=> (not res!143025) (not e!178425))))

(declare-fun arrayNoDuplicates!0 (array!13912 (_ BitVec 32) List!4406) Bool)

(assert (=> b!279959 (= res!143025 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4403))))

(assert (= (and start!27094 res!143016) b!279951))

(assert (= (and b!279951 res!143017) b!279947))

(assert (= (and b!279947 res!143018) b!279959))

(assert (= (and b!279959 res!143025) b!279957))

(assert (= (and b!279957 res!143024) b!279954))

(assert (= (and b!279954 res!143023) b!279949))

(assert (= (and b!279949 res!143019) b!279950))

(assert (= (and b!279950 res!143020) b!279956))

(assert (= (and b!279956 res!143022) b!279952))

(assert (= (and b!279952 res!143027) b!279958))

(assert (= (and b!279958 res!143026) b!279953))

(assert (= (and b!279953 res!143028) b!279955))

(assert (= (and b!279955 res!143021) b!279948))

(declare-fun m!294541 () Bool)

(assert (=> b!279953 m!294541))

(declare-fun m!294543 () Bool)

(assert (=> b!279959 m!294543))

(declare-fun m!294545 () Bool)

(assert (=> b!279947 m!294545))

(declare-fun m!294547 () Bool)

(assert (=> b!279948 m!294547))

(declare-fun m!294549 () Bool)

(assert (=> start!27094 m!294549))

(declare-fun m!294551 () Bool)

(assert (=> start!27094 m!294551))

(declare-fun m!294553 () Bool)

(assert (=> b!279954 m!294553))

(declare-fun m!294555 () Bool)

(assert (=> b!279958 m!294555))

(declare-fun m!294557 () Bool)

(assert (=> b!279957 m!294557))

(declare-fun m!294559 () Bool)

(assert (=> b!279955 m!294559))

(declare-fun m!294561 () Bool)

(assert (=> b!279956 m!294561))

(assert (=> b!279956 m!294561))

(declare-fun m!294563 () Bool)

(assert (=> b!279956 m!294563))

(declare-fun m!294565 () Bool)

(assert (=> b!279949 m!294565))

(push 1)

(assert (not b!279948))

(assert (not b!279959))

(assert (not b!279953))

(assert (not b!279947))

(assert (not start!27094))

