; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92422 () Bool)

(assert start!92422)

(declare-fun b!1050811 () Bool)

(declare-fun e!596370 () Bool)

(declare-fun e!596366 () Bool)

(assert (=> b!1050811 (= e!596370 e!596366)))

(declare-fun res!699937 () Bool)

(assert (=> b!1050811 (=> res!699937 e!596366)))

(declare-fun lt!464081 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1050811 (= res!699937 (or (bvsgt lt!464081 i!1381) (bvsle i!1381 lt!464081)))))

(declare-fun b!1050812 () Bool)

(declare-fun e!596369 () Bool)

(assert (=> b!1050812 (= e!596369 (not true))))

(assert (=> b!1050812 e!596370))

(declare-fun res!699941 () Bool)

(assert (=> b!1050812 (=> (not res!699941) (not e!596370))))

(declare-datatypes ((array!66223 0))(
  ( (array!66224 (arr!31851 (Array (_ BitVec 32) (_ BitVec 64))) (size!32387 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66223)

(declare-fun k!2747 () (_ BitVec 64))

(assert (=> b!1050812 (= res!699941 (= (select (store (arr!31851 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464081) k!2747))))

(declare-fun b!1050813 () Bool)

(declare-fun res!699938 () Bool)

(declare-fun e!596371 () Bool)

(assert (=> b!1050813 (=> (not res!699938) (not e!596371))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1050813 (= res!699938 (validKeyInArray!0 k!2747))))

(declare-fun b!1050814 () Bool)

(declare-fun res!699939 () Bool)

(assert (=> b!1050814 (=> (not res!699939) (not e!596371))))

(declare-datatypes ((List!22163 0))(
  ( (Nil!22160) (Cons!22159 (h!23368 (_ BitVec 64)) (t!31470 List!22163)) )
))
(declare-fun arrayNoDuplicates!0 (array!66223 (_ BitVec 32) List!22163) Bool)

(assert (=> b!1050814 (= res!699939 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22160))))

(declare-fun b!1050815 () Bool)

(declare-fun e!596368 () Bool)

(assert (=> b!1050815 (= e!596368 e!596369)))

(declare-fun res!699942 () Bool)

(assert (=> b!1050815 (=> (not res!699942) (not e!596369))))

(assert (=> b!1050815 (= res!699942 (not (= lt!464081 i!1381)))))

(declare-fun lt!464082 () array!66223)

(declare-fun arrayScanForKey!0 (array!66223 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1050815 (= lt!464081 (arrayScanForKey!0 lt!464082 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1050816 () Bool)

(assert (=> b!1050816 (= e!596371 e!596368)))

(declare-fun res!699943 () Bool)

(assert (=> b!1050816 (=> (not res!699943) (not e!596368))))

(declare-fun arrayContainsKey!0 (array!66223 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1050816 (= res!699943 (arrayContainsKey!0 lt!464082 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1050816 (= lt!464082 (array!66224 (store (arr!31851 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32387 a!3488)))))

(declare-fun b!1050817 () Bool)

(assert (=> b!1050817 (= e!596366 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun b!1050818 () Bool)

(declare-fun res!699940 () Bool)

(assert (=> b!1050818 (=> (not res!699940) (not e!596371))))

(assert (=> b!1050818 (= res!699940 (= (select (arr!31851 a!3488) i!1381) k!2747))))

(declare-fun res!699944 () Bool)

(assert (=> start!92422 (=> (not res!699944) (not e!596371))))

(assert (=> start!92422 (= res!699944 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32387 a!3488)) (bvslt (size!32387 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92422 e!596371))

(assert (=> start!92422 true))

(declare-fun array_inv!24631 (array!66223) Bool)

(assert (=> start!92422 (array_inv!24631 a!3488)))

(assert (= (and start!92422 res!699944) b!1050814))

(assert (= (and b!1050814 res!699939) b!1050813))

(assert (= (and b!1050813 res!699938) b!1050818))

(assert (= (and b!1050818 res!699940) b!1050816))

(assert (= (and b!1050816 res!699943) b!1050815))

(assert (= (and b!1050815 res!699942) b!1050812))

(assert (= (and b!1050812 res!699941) b!1050811))

(assert (= (and b!1050811 (not res!699937)) b!1050817))

(declare-fun m!971447 () Bool)

(assert (=> b!1050816 m!971447))

(declare-fun m!971449 () Bool)

(assert (=> b!1050816 m!971449))

(declare-fun m!971451 () Bool)

(assert (=> start!92422 m!971451))

(declare-fun m!971453 () Bool)

(assert (=> b!1050814 m!971453))

(declare-fun m!971455 () Bool)

(assert (=> b!1050818 m!971455))

(declare-fun m!971457 () Bool)

(assert (=> b!1050813 m!971457))

(declare-fun m!971459 () Bool)

(assert (=> b!1050817 m!971459))

(assert (=> b!1050812 m!971449))

(declare-fun m!971461 () Bool)

(assert (=> b!1050812 m!971461))

(declare-fun m!971463 () Bool)

(assert (=> b!1050815 m!971463))

(push 1)

(assert (not b!1050817))

(assert (not b!1050816))

(assert (not b!1050814))

(assert (not b!1050813))

(assert (not start!92422))

(assert (not b!1050815))

(check-sat)

(pop 1)

