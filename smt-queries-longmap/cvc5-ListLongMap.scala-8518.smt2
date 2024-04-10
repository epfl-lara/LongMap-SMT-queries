; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103904 () Bool)

(assert start!103904)

(declare-fun b!1243654 () Bool)

(declare-fun res!829438 () Bool)

(declare-fun e!704994 () Bool)

(assert (=> b!1243654 (=> (not res!829438) (not e!704994))))

(declare-datatypes ((List!27394 0))(
  ( (Nil!27391) (Cons!27390 (h!28599 (_ BitVec 64)) (t!40863 List!27394)) )
))
(declare-fun lt!562446 () List!27394)

(declare-fun noDuplicate!1993 (List!27394) Bool)

(assert (=> b!1243654 (= res!829438 (noDuplicate!1993 lt!562446))))

(declare-fun b!1243655 () Bool)

(declare-fun e!704993 () Bool)

(assert (=> b!1243655 (= e!704993 e!704994)))

(declare-fun res!829432 () Bool)

(assert (=> b!1243655 (=> (not res!829432) (not e!704994))))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> b!1243655 (= res!829432 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000))))

(declare-datatypes ((array!79996 0))(
  ( (array!79997 (arr!38591 (Array (_ BitVec 32) (_ BitVec 64))) (size!39127 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!79996)

(assert (=> b!1243655 (= lt!562446 (Cons!27390 (select (arr!38591 a!3892) from!3270) Nil!27391))))

(declare-fun b!1243656 () Bool)

(declare-fun res!829434 () Bool)

(assert (=> b!1243656 (=> (not res!829434) (not e!704994))))

(declare-fun contains!7415 (List!27394 (_ BitVec 64)) Bool)

(assert (=> b!1243656 (= res!829434 (not (contains!7415 lt!562446 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243657 () Bool)

(declare-fun res!829441 () Bool)

(assert (=> b!1243657 (=> (not res!829441) (not e!704994))))

(assert (=> b!1243657 (= res!829441 (not (contains!7415 lt!562446 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243658 () Bool)

(declare-fun res!829437 () Bool)

(assert (=> b!1243658 (=> (not res!829437) (not e!704993))))

(declare-fun arrayNoDuplicates!0 (array!79996 (_ BitVec 32) List!27394) Bool)

(assert (=> b!1243658 (= res!829437 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27391))))

(declare-fun res!829436 () Bool)

(assert (=> start!103904 (=> (not res!829436) (not e!704993))))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> start!103904 (= res!829436 (and (bvslt (size!39127 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39127 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39127 a!3892))))))

(assert (=> start!103904 e!704993))

(declare-fun array_inv!29439 (array!79996) Bool)

(assert (=> start!103904 (array_inv!29439 a!3892)))

(assert (=> start!103904 true))

(declare-fun b!1243659 () Bool)

(declare-fun res!829439 () Bool)

(assert (=> b!1243659 (=> (not res!829439) (not e!704994))))

(declare-fun subseq!641 (List!27394 List!27394) Bool)

(assert (=> b!1243659 (= res!829439 (subseq!641 Nil!27391 lt!562446))))

(declare-fun b!1243660 () Bool)

(declare-fun res!829440 () Bool)

(assert (=> b!1243660 (=> (not res!829440) (not e!704993))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1243660 (= res!829440 (validKeyInArray!0 (select (arr!38591 a!3892) from!3270)))))

(declare-fun b!1243661 () Bool)

(declare-fun res!829435 () Bool)

(assert (=> b!1243661 (=> (not res!829435) (not e!704993))))

(assert (=> b!1243661 (= res!829435 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39127 a!3892)) (not (= newFrom!287 (size!39127 a!3892)))))))

(declare-fun b!1243662 () Bool)

(declare-fun res!829433 () Bool)

(assert (=> b!1243662 (=> (not res!829433) (not e!704994))))

(assert (=> b!1243662 (= res!829433 (not (contains!7415 Nil!27391 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243663 () Bool)

(assert (=> b!1243663 (= e!704994 false)))

(declare-fun lt!562448 () Bool)

(assert (=> b!1243663 (= lt!562448 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) lt!562446))))

(declare-datatypes ((Unit!41291 0))(
  ( (Unit!41292) )
))
(declare-fun lt!562447 () Unit!41291)

(declare-fun noDuplicateSubseq!95 (List!27394 List!27394) Unit!41291)

(assert (=> b!1243663 (= lt!562447 (noDuplicateSubseq!95 Nil!27391 lt!562446))))

(declare-fun b!1243664 () Bool)

(declare-fun res!829431 () Bool)

(assert (=> b!1243664 (=> (not res!829431) (not e!704994))))

(assert (=> b!1243664 (= res!829431 (not (contains!7415 Nil!27391 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!103904 res!829436) b!1243658))

(assert (= (and b!1243658 res!829437) b!1243661))

(assert (= (and b!1243661 res!829435) b!1243660))

(assert (= (and b!1243660 res!829440) b!1243655))

(assert (= (and b!1243655 res!829432) b!1243654))

(assert (= (and b!1243654 res!829438) b!1243657))

(assert (= (and b!1243657 res!829441) b!1243656))

(assert (= (and b!1243656 res!829434) b!1243664))

(assert (= (and b!1243664 res!829431) b!1243662))

(assert (= (and b!1243662 res!829433) b!1243659))

(assert (= (and b!1243659 res!829439) b!1243663))

(declare-fun m!1146155 () Bool)

(assert (=> b!1243656 m!1146155))

(declare-fun m!1146157 () Bool)

(assert (=> b!1243654 m!1146157))

(declare-fun m!1146159 () Bool)

(assert (=> b!1243657 m!1146159))

(declare-fun m!1146161 () Bool)

(assert (=> b!1243659 m!1146161))

(declare-fun m!1146163 () Bool)

(assert (=> b!1243660 m!1146163))

(assert (=> b!1243660 m!1146163))

(declare-fun m!1146165 () Bool)

(assert (=> b!1243660 m!1146165))

(declare-fun m!1146167 () Bool)

(assert (=> b!1243663 m!1146167))

(declare-fun m!1146169 () Bool)

(assert (=> b!1243663 m!1146169))

(assert (=> b!1243655 m!1146163))

(declare-fun m!1146171 () Bool)

(assert (=> b!1243658 m!1146171))

(declare-fun m!1146173 () Bool)

(assert (=> start!103904 m!1146173))

(declare-fun m!1146175 () Bool)

(assert (=> b!1243664 m!1146175))

(declare-fun m!1146177 () Bool)

(assert (=> b!1243662 m!1146177))

(push 1)

