; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61742 () Bool)

(assert start!61742)

(declare-fun b!690602 () Bool)

(declare-fun res!454996 () Bool)

(declare-fun e!393242 () Bool)

(assert (=> b!690602 (=> (not res!454996) (not e!393242))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39763 0))(
  ( (array!39764 (arr!19050 (Array (_ BitVec 32) (_ BitVec 64))) (size!19435 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39763)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!690602 (= res!454996 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19435 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!690603 () Bool)

(declare-fun res!454994 () Bool)

(assert (=> b!690603 (=> (not res!454994) (not e!393242))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39763 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!690603 (= res!454994 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!690604 () Bool)

(declare-fun res!454982 () Bool)

(assert (=> b!690604 (=> (not res!454982) (not e!393242))))

(assert (=> b!690604 (= res!454982 (= (select (arr!19050 a!3626) from!3004) k!2843))))

(declare-fun b!690605 () Bool)

(declare-fun res!454986 () Bool)

(assert (=> b!690605 (=> (not res!454986) (not e!393242))))

(declare-datatypes ((List!13091 0))(
  ( (Nil!13088) (Cons!13087 (h!14132 (_ BitVec 64)) (t!19358 List!13091)) )
))
(declare-fun acc!681 () List!13091)

(declare-fun noDuplicate!915 (List!13091) Bool)

(assert (=> b!690605 (= res!454986 (noDuplicate!915 acc!681))))

(declare-fun b!690606 () Bool)

(declare-fun res!454997 () Bool)

(assert (=> b!690606 (=> (not res!454997) (not e!393242))))

(declare-fun e!393245 () Bool)

(assert (=> b!690606 (= res!454997 e!393245)))

(declare-fun res!454983 () Bool)

(assert (=> b!690606 (=> res!454983 e!393245)))

(declare-fun e!393243 () Bool)

(assert (=> b!690606 (= res!454983 e!393243)))

(declare-fun res!454993 () Bool)

(assert (=> b!690606 (=> (not res!454993) (not e!393243))))

(assert (=> b!690606 (= res!454993 (bvsgt from!3004 i!1382))))

(declare-fun b!690607 () Bool)

(declare-fun e!393246 () Bool)

(assert (=> b!690607 (= e!393245 e!393246)))

(declare-fun res!454987 () Bool)

(assert (=> b!690607 (=> (not res!454987) (not e!393246))))

(assert (=> b!690607 (= res!454987 (bvsle from!3004 i!1382))))

(declare-fun res!454985 () Bool)

(assert (=> start!61742 (=> (not res!454985) (not e!393242))))

(assert (=> start!61742 (= res!454985 (and (bvslt (size!19435 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19435 a!3626))))))

(assert (=> start!61742 e!393242))

(assert (=> start!61742 true))

(declare-fun array_inv!14846 (array!39763) Bool)

(assert (=> start!61742 (array_inv!14846 a!3626)))

(declare-fun b!690608 () Bool)

(declare-fun contains!3668 (List!13091 (_ BitVec 64)) Bool)

(assert (=> b!690608 (= e!393243 (contains!3668 acc!681 k!2843))))

(declare-fun b!690609 () Bool)

(declare-fun res!454992 () Bool)

(assert (=> b!690609 (=> (not res!454992) (not e!393242))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!690609 (= res!454992 (validKeyInArray!0 (select (arr!19050 a!3626) from!3004)))))

(declare-fun b!690610 () Bool)

(declare-fun res!454990 () Bool)

(assert (=> b!690610 (=> (not res!454990) (not e!393242))))

(declare-fun arrayNoDuplicates!0 (array!39763 (_ BitVec 32) List!13091) Bool)

(assert (=> b!690610 (= res!454990 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13088))))

(declare-fun b!690611 () Bool)

(declare-fun res!454995 () Bool)

(assert (=> b!690611 (=> (not res!454995) (not e!393242))))

(assert (=> b!690611 (= res!454995 (not (contains!3668 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!690612 () Bool)

(declare-fun res!454988 () Bool)

(assert (=> b!690612 (=> (not res!454988) (not e!393242))))

(assert (=> b!690612 (= res!454988 (validKeyInArray!0 k!2843))))

(declare-fun b!690613 () Bool)

(declare-fun res!454991 () Bool)

(assert (=> b!690613 (=> (not res!454991) (not e!393242))))

(assert (=> b!690613 (= res!454991 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19435 a!3626))))))

(declare-fun b!690614 () Bool)

(declare-fun res!454984 () Bool)

(assert (=> b!690614 (=> (not res!454984) (not e!393242))))

(assert (=> b!690614 (= res!454984 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!690615 () Bool)

(assert (=> b!690615 (= e!393246 (not (contains!3668 acc!681 k!2843)))))

(declare-fun b!690616 () Bool)

(assert (=> b!690616 (= e!393242 (not true))))

(assert (=> b!690616 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun b!690617 () Bool)

(declare-fun res!454989 () Bool)

(assert (=> b!690617 (=> (not res!454989) (not e!393242))))

(assert (=> b!690617 (= res!454989 (not (contains!3668 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!61742 res!454985) b!690605))

(assert (= (and b!690605 res!454986) b!690617))

(assert (= (and b!690617 res!454989) b!690611))

(assert (= (and b!690611 res!454995) b!690606))

(assert (= (and b!690606 res!454993) b!690608))

(assert (= (and b!690606 (not res!454983)) b!690607))

(assert (= (and b!690607 res!454987) b!690615))

(assert (= (and b!690606 res!454997) b!690610))

(assert (= (and b!690610 res!454990) b!690614))

(assert (= (and b!690614 res!454984) b!690613))

(assert (= (and b!690613 res!454991) b!690612))

(assert (= (and b!690612 res!454988) b!690603))

(assert (= (and b!690603 res!454994) b!690602))

(assert (= (and b!690602 res!454996) b!690609))

(assert (= (and b!690609 res!454992) b!690604))

(assert (= (and b!690604 res!454982) b!690616))

(declare-fun m!654041 () Bool)

(assert (=> b!690604 m!654041))

(declare-fun m!654043 () Bool)

(assert (=> b!690610 m!654043))

(declare-fun m!654045 () Bool)

(assert (=> b!690611 m!654045))

(declare-fun m!654047 () Bool)

(assert (=> b!690616 m!654047))

(declare-fun m!654049 () Bool)

(assert (=> b!690614 m!654049))

(declare-fun m!654051 () Bool)

(assert (=> b!690608 m!654051))

(declare-fun m!654053 () Bool)

(assert (=> start!61742 m!654053))

(declare-fun m!654055 () Bool)

(assert (=> b!690605 m!654055))

(declare-fun m!654057 () Bool)

(assert (=> b!690617 m!654057))

(declare-fun m!654059 () Bool)

(assert (=> b!690603 m!654059))

(assert (=> b!690609 m!654041))

(assert (=> b!690609 m!654041))

(declare-fun m!654061 () Bool)

(assert (=> b!690609 m!654061))

(declare-fun m!654063 () Bool)

(assert (=> b!690612 m!654063))

(assert (=> b!690615 m!654051))

(push 1)

(assert (not b!690603))

(assert (not b!690614))

(assert (not b!690605))

(assert (not b!690609))

(assert (not b!690615))

(assert (not b!690617))

(assert (not b!690611))

(assert (not b!690616))

(assert (not b!690608))

(assert (not b!690612))

(assert (not b!690610))

(assert (not start!61742))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

