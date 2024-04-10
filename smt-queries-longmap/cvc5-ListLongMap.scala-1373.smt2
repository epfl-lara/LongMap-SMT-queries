; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27090 () Bool)

(assert start!27090)

(declare-fun b!279869 () Bool)

(declare-fun res!142950 () Bool)

(declare-fun e!178407 () Bool)

(assert (=> b!279869 (=> (not res!142950) (not e!178407))))

(declare-datatypes ((array!13908 0))(
  ( (array!13909 (arr!6596 (Array (_ BitVec 32) (_ BitVec 64))) (size!6948 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13908)

(declare-datatypes ((List!4404 0))(
  ( (Nil!4401) (Cons!4400 (h!5070 (_ BitVec 64)) (t!9486 List!4404)) )
))
(declare-fun arrayNoDuplicates!0 (array!13908 (_ BitVec 32) List!4404) Bool)

(assert (=> b!279869 (= res!142950 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4401))))

(declare-fun b!279870 () Bool)

(declare-fun res!142938 () Bool)

(assert (=> b!279870 (=> (not res!142938) (not e!178407))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!279870 (= res!142938 (validKeyInArray!0 k!2581))))

(declare-fun b!279871 () Bool)

(declare-fun res!142941 () Bool)

(assert (=> b!279871 (=> (not res!142941) (not e!178407))))

(declare-fun arrayContainsKey!0 (array!13908 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!279871 (= res!142941 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun res!142939 () Bool)

(assert (=> start!27090 (=> (not res!142939) (not e!178407))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27090 (= res!142939 (validMask!0 mask!3868))))

(assert (=> start!27090 e!178407))

(declare-fun array_inv!4559 (array!13908) Bool)

(assert (=> start!27090 (array_inv!4559 a!3325)))

(assert (=> start!27090 true))

(declare-fun b!279872 () Bool)

(declare-fun res!142940 () Bool)

(declare-fun e!178408 () Bool)

(assert (=> b!279872 (=> (not res!142940) (not e!178408))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!279872 (= res!142940 (not (= startIndex!26 i!1267)))))

(declare-fun b!279873 () Bool)

(declare-fun res!142943 () Bool)

(assert (=> b!279873 (=> (not res!142943) (not e!178408))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13908 (_ BitVec 32)) Bool)

(assert (=> b!279873 (= res!142943 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!279874 () Bool)

(assert (=> b!279874 (= e!178407 e!178408)))

(declare-fun res!142946 () Bool)

(assert (=> b!279874 (=> (not res!142946) (not e!178408))))

(declare-datatypes ((SeekEntryResult!1754 0))(
  ( (MissingZero!1754 (index!9186 (_ BitVec 32))) (Found!1754 (index!9187 (_ BitVec 32))) (Intermediate!1754 (undefined!2566 Bool) (index!9188 (_ BitVec 32)) (x!27432 (_ BitVec 32))) (Undefined!1754) (MissingVacant!1754 (index!9189 (_ BitVec 32))) )
))
(declare-fun lt!138739 () SeekEntryResult!1754)

(assert (=> b!279874 (= res!142946 (or (= lt!138739 (MissingZero!1754 i!1267)) (= lt!138739 (MissingVacant!1754 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13908 (_ BitVec 32)) SeekEntryResult!1754)

(assert (=> b!279874 (= lt!138739 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!279875 () Bool)

(declare-fun res!142945 () Bool)

(assert (=> b!279875 (=> (not res!142945) (not e!178407))))

(assert (=> b!279875 (= res!142945 (and (= (size!6948 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6948 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6948 a!3325))))))

(declare-fun b!279876 () Bool)

(declare-fun res!142942 () Bool)

(assert (=> b!279876 (=> (not res!142942) (not e!178408))))

(assert (=> b!279876 (= res!142942 (validKeyInArray!0 (select (arr!6596 a!3325) startIndex!26)))))

(declare-fun b!279877 () Bool)

(declare-fun res!142949 () Bool)

(assert (=> b!279877 (=> (not res!142949) (not e!178408))))

(declare-fun noDuplicate!158 (List!4404) Bool)

(assert (=> b!279877 (= res!142949 (noDuplicate!158 Nil!4401))))

(declare-fun b!279878 () Bool)

(assert (=> b!279878 (= e!178408 false)))

(declare-fun lt!138738 () Bool)

(declare-fun contains!1976 (List!4404 (_ BitVec 64)) Bool)

(assert (=> b!279878 (= lt!138738 (contains!1976 Nil!4401 k!2581))))

(declare-fun b!279879 () Bool)

(declare-fun res!142944 () Bool)

(assert (=> b!279879 (=> (not res!142944) (not e!178408))))

(assert (=> b!279879 (= res!142944 (not (contains!1976 Nil!4401 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!279880 () Bool)

(declare-fun res!142947 () Bool)

(assert (=> b!279880 (=> (not res!142947) (not e!178408))))

(assert (=> b!279880 (= res!142947 (not (contains!1976 Nil!4401 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!279881 () Bool)

(declare-fun res!142948 () Bool)

(assert (=> b!279881 (=> (not res!142948) (not e!178408))))

(assert (=> b!279881 (= res!142948 (and (bvslt (size!6948 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6948 a!3325))))))

(assert (= (and start!27090 res!142939) b!279875))

(assert (= (and b!279875 res!142945) b!279870))

(assert (= (and b!279870 res!142938) b!279869))

(assert (= (and b!279869 res!142950) b!279871))

(assert (= (and b!279871 res!142941) b!279874))

(assert (= (and b!279874 res!142946) b!279873))

(assert (= (and b!279873 res!142943) b!279872))

(assert (= (and b!279872 res!142940) b!279876))

(assert (= (and b!279876 res!142942) b!279881))

(assert (= (and b!279881 res!142948) b!279877))

(assert (= (and b!279877 res!142949) b!279879))

(assert (= (and b!279879 res!142944) b!279880))

(assert (= (and b!279880 res!142947) b!279878))

(declare-fun m!294489 () Bool)

(assert (=> b!279877 m!294489))

(declare-fun m!294491 () Bool)

(assert (=> b!279880 m!294491))

(declare-fun m!294493 () Bool)

(assert (=> b!279873 m!294493))

(declare-fun m!294495 () Bool)

(assert (=> b!279871 m!294495))

(declare-fun m!294497 () Bool)

(assert (=> start!27090 m!294497))

(declare-fun m!294499 () Bool)

(assert (=> start!27090 m!294499))

(declare-fun m!294501 () Bool)

(assert (=> b!279878 m!294501))

(declare-fun m!294503 () Bool)

(assert (=> b!279870 m!294503))

(declare-fun m!294505 () Bool)

(assert (=> b!279869 m!294505))

(declare-fun m!294507 () Bool)

(assert (=> b!279876 m!294507))

(assert (=> b!279876 m!294507))

(declare-fun m!294509 () Bool)

(assert (=> b!279876 m!294509))

(declare-fun m!294511 () Bool)

(assert (=> b!279874 m!294511))

(declare-fun m!294513 () Bool)

(assert (=> b!279879 m!294513))

(push 1)

