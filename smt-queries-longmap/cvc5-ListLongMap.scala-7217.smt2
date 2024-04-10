; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92364 () Bool)

(assert start!92364)

(declare-fun b!1050078 () Bool)

(declare-fun e!595841 () Bool)

(declare-fun e!595840 () Bool)

(assert (=> b!1050078 (= e!595841 (not e!595840))))

(declare-fun res!699213 () Bool)

(assert (=> b!1050078 (=> res!699213 e!595840)))

(declare-fun lt!463780 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1050078 (= res!699213 (bvsle lt!463780 i!1381))))

(declare-fun e!595843 () Bool)

(assert (=> b!1050078 e!595843))

(declare-fun res!699204 () Bool)

(assert (=> b!1050078 (=> (not res!699204) (not e!595843))))

(declare-datatypes ((array!66165 0))(
  ( (array!66166 (arr!31822 (Array (_ BitVec 32) (_ BitVec 64))) (size!32358 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66165)

(declare-fun k!2747 () (_ BitVec 64))

(assert (=> b!1050078 (= res!699204 (= (select (store (arr!31822 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463780) k!2747))))

(declare-fun res!699215 () Bool)

(declare-fun e!595846 () Bool)

(assert (=> start!92364 (=> (not res!699215) (not e!595846))))

(assert (=> start!92364 (= res!699215 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32358 a!3488)) (bvslt (size!32358 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92364 e!595846))

(assert (=> start!92364 true))

(declare-fun array_inv!24602 (array!66165) Bool)

(assert (=> start!92364 (array_inv!24602 a!3488)))

(declare-fun b!1050079 () Bool)

(declare-fun e!595842 () Bool)

(assert (=> b!1050079 (= e!595842 true)))

(declare-fun lt!463782 () Bool)

(declare-datatypes ((List!22134 0))(
  ( (Nil!22131) (Cons!22130 (h!23339 (_ BitVec 64)) (t!31441 List!22134)) )
))
(declare-fun contains!6127 (List!22134 (_ BitVec 64)) Bool)

(assert (=> b!1050079 (= lt!463782 (contains!6127 Nil!22131 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1050080 () Bool)

(declare-fun res!699206 () Bool)

(assert (=> b!1050080 (=> (not res!699206) (not e!595846))))

(declare-fun arrayNoDuplicates!0 (array!66165 (_ BitVec 32) List!22134) Bool)

(assert (=> b!1050080 (= res!699206 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22131))))

(declare-fun b!1050081 () Bool)

(declare-fun res!699205 () Bool)

(assert (=> b!1050081 (=> res!699205 e!595842)))

(assert (=> b!1050081 (= res!699205 (contains!6127 Nil!22131 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1050082 () Bool)

(declare-fun e!595844 () Bool)

(assert (=> b!1050082 (= e!595844 e!595841)))

(declare-fun res!699209 () Bool)

(assert (=> b!1050082 (=> (not res!699209) (not e!595841))))

(assert (=> b!1050082 (= res!699209 (not (= lt!463780 i!1381)))))

(declare-fun lt!463779 () array!66165)

(declare-fun arrayScanForKey!0 (array!66165 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1050082 (= lt!463780 (arrayScanForKey!0 lt!463779 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1050083 () Bool)

(assert (=> b!1050083 (= e!595846 e!595844)))

(declare-fun res!699214 () Bool)

(assert (=> b!1050083 (=> (not res!699214) (not e!595844))))

(declare-fun arrayContainsKey!0 (array!66165 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1050083 (= res!699214 (arrayContainsKey!0 lt!463779 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1050083 (= lt!463779 (array!66166 (store (arr!31822 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32358 a!3488)))))

(declare-fun b!1050084 () Bool)

(declare-fun res!699210 () Bool)

(assert (=> b!1050084 (=> (not res!699210) (not e!595846))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1050084 (= res!699210 (validKeyInArray!0 k!2747))))

(declare-fun e!595839 () Bool)

(declare-fun b!1050085 () Bool)

(assert (=> b!1050085 (= e!595839 (arrayContainsKey!0 a!3488 k!2747 lt!463780))))

(declare-fun b!1050086 () Bool)

(declare-fun res!699207 () Bool)

(assert (=> b!1050086 (=> (not res!699207) (not e!595846))))

(assert (=> b!1050086 (= res!699207 (= (select (arr!31822 a!3488) i!1381) k!2747))))

(declare-fun b!1050087 () Bool)

(assert (=> b!1050087 (= e!595843 e!595839)))

(declare-fun res!699208 () Bool)

(assert (=> b!1050087 (=> res!699208 e!595839)))

(assert (=> b!1050087 (= res!699208 (bvsle lt!463780 i!1381))))

(declare-fun b!1050088 () Bool)

(declare-fun res!699212 () Bool)

(assert (=> b!1050088 (=> res!699212 e!595842)))

(declare-fun noDuplicate!1512 (List!22134) Bool)

(assert (=> b!1050088 (= res!699212 (not (noDuplicate!1512 Nil!22131)))))

(declare-fun b!1050089 () Bool)

(assert (=> b!1050089 (= e!595840 e!595842)))

(declare-fun res!699211 () Bool)

(assert (=> b!1050089 (=> res!699211 e!595842)))

(assert (=> b!1050089 (= res!699211 (bvsge (bvadd #b00000000000000000000000000000001 i!1381) (size!32358 a!3488)))))

(assert (=> b!1050089 (arrayContainsKey!0 a!3488 k!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-datatypes ((Unit!34364 0))(
  ( (Unit!34365) )
))
(declare-fun lt!463781 () Unit!34364)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66165 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34364)

(assert (=> b!1050089 (= lt!463781 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 lt!463780 (bvadd #b00000000000000000000000000000001 i!1381)))))

(assert (=> b!1050089 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22131)))

(declare-fun lt!463778 () Unit!34364)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66165 (_ BitVec 32) (_ BitVec 32)) Unit!34364)

(assert (=> b!1050089 (= lt!463778 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(assert (= (and start!92364 res!699215) b!1050080))

(assert (= (and b!1050080 res!699206) b!1050084))

(assert (= (and b!1050084 res!699210) b!1050086))

(assert (= (and b!1050086 res!699207) b!1050083))

(assert (= (and b!1050083 res!699214) b!1050082))

(assert (= (and b!1050082 res!699209) b!1050078))

(assert (= (and b!1050078 res!699204) b!1050087))

(assert (= (and b!1050087 (not res!699208)) b!1050085))

(assert (= (and b!1050078 (not res!699213)) b!1050089))

(assert (= (and b!1050089 (not res!699211)) b!1050088))

(assert (= (and b!1050088 (not res!699212)) b!1050081))

(assert (= (and b!1050081 (not res!699205)) b!1050079))

(declare-fun m!970769 () Bool)

(assert (=> start!92364 m!970769))

(declare-fun m!970771 () Bool)

(assert (=> b!1050080 m!970771))

(declare-fun m!970773 () Bool)

(assert (=> b!1050089 m!970773))

(declare-fun m!970775 () Bool)

(assert (=> b!1050089 m!970775))

(declare-fun m!970777 () Bool)

(assert (=> b!1050089 m!970777))

(declare-fun m!970779 () Bool)

(assert (=> b!1050089 m!970779))

(declare-fun m!970781 () Bool)

(assert (=> b!1050084 m!970781))

(declare-fun m!970783 () Bool)

(assert (=> b!1050078 m!970783))

(declare-fun m!970785 () Bool)

(assert (=> b!1050078 m!970785))

(declare-fun m!970787 () Bool)

(assert (=> b!1050086 m!970787))

(declare-fun m!970789 () Bool)

(assert (=> b!1050085 m!970789))

(declare-fun m!970791 () Bool)

(assert (=> b!1050083 m!970791))

(assert (=> b!1050083 m!970783))

(declare-fun m!970793 () Bool)

(assert (=> b!1050081 m!970793))

(declare-fun m!970795 () Bool)

(assert (=> b!1050079 m!970795))

(declare-fun m!970797 () Bool)

(assert (=> b!1050082 m!970797))

(declare-fun m!970799 () Bool)

(assert (=> b!1050088 m!970799))

(push 1)

(assert (not b!1050084))

(assert (not b!1050082))

(assert (not b!1050089))

(assert (not b!1050088))

(assert (not b!1050080))

(assert (not b!1050079))

(assert (not b!1050085))

