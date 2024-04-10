; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92366 () Bool)

(assert start!92366)

(declare-fun b!1050114 () Bool)

(declare-fun e!595868 () Bool)

(declare-fun e!595864 () Bool)

(assert (=> b!1050114 (= e!595868 e!595864)))

(declare-fun res!699244 () Bool)

(assert (=> b!1050114 (=> res!699244 e!595864)))

(declare-fun lt!463797 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1050114 (= res!699244 (bvsle lt!463797 i!1381))))

(declare-fun b!1050115 () Bool)

(declare-fun res!699240 () Bool)

(declare-fun e!595869 () Bool)

(assert (=> b!1050115 (=> (not res!699240) (not e!595869))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1050115 (= res!699240 (validKeyInArray!0 k0!2747))))

(declare-fun b!1050116 () Bool)

(declare-fun res!699242 () Bool)

(assert (=> b!1050116 (=> (not res!699242) (not e!595869))))

(declare-datatypes ((array!66167 0))(
  ( (array!66168 (arr!31823 (Array (_ BitVec 32) (_ BitVec 64))) (size!32359 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66167)

(declare-datatypes ((List!22135 0))(
  ( (Nil!22132) (Cons!22131 (h!23340 (_ BitVec 64)) (t!31442 List!22135)) )
))
(declare-fun arrayNoDuplicates!0 (array!66167 (_ BitVec 32) List!22135) Bool)

(assert (=> b!1050116 (= res!699242 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22132))))

(declare-fun b!1050117 () Bool)

(declare-fun e!595863 () Bool)

(declare-fun e!595867 () Bool)

(assert (=> b!1050117 (= e!595863 e!595867)))

(declare-fun res!699247 () Bool)

(assert (=> b!1050117 (=> (not res!699247) (not e!595867))))

(assert (=> b!1050117 (= res!699247 (not (= lt!463797 i!1381)))))

(declare-fun lt!463794 () array!66167)

(declare-fun arrayScanForKey!0 (array!66167 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1050117 (= lt!463797 (arrayScanForKey!0 lt!463794 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1050118 () Bool)

(declare-fun res!699250 () Bool)

(assert (=> b!1050118 (=> (not res!699250) (not e!595869))))

(assert (=> b!1050118 (= res!699250 (= (select (arr!31823 a!3488) i!1381) k0!2747))))

(declare-fun b!1050119 () Bool)

(declare-fun e!595865 () Bool)

(assert (=> b!1050119 (= e!595867 (not e!595865))))

(declare-fun res!699249 () Bool)

(assert (=> b!1050119 (=> res!699249 e!595865)))

(assert (=> b!1050119 (= res!699249 (bvsle lt!463797 i!1381))))

(assert (=> b!1050119 e!595868))

(declare-fun res!699241 () Bool)

(assert (=> b!1050119 (=> (not res!699241) (not e!595868))))

(assert (=> b!1050119 (= res!699241 (= (select (store (arr!31823 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463797) k0!2747))))

(declare-fun b!1050120 () Bool)

(declare-fun e!595866 () Bool)

(assert (=> b!1050120 (= e!595865 e!595866)))

(declare-fun res!699251 () Bool)

(assert (=> b!1050120 (=> res!699251 e!595866)))

(assert (=> b!1050120 (= res!699251 (bvsge (bvadd #b00000000000000000000000000000001 i!1381) (size!32359 a!3488)))))

(declare-fun arrayContainsKey!0 (array!66167 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1050120 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-datatypes ((Unit!34366 0))(
  ( (Unit!34367) )
))
(declare-fun lt!463793 () Unit!34366)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66167 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34366)

(assert (=> b!1050120 (= lt!463793 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 lt!463797 (bvadd #b00000000000000000000000000000001 i!1381)))))

(assert (=> b!1050120 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22132)))

(declare-fun lt!463796 () Unit!34366)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66167 (_ BitVec 32) (_ BitVec 32)) Unit!34366)

(assert (=> b!1050120 (= lt!463796 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1050122 () Bool)

(assert (=> b!1050122 (= e!595869 e!595863)))

(declare-fun res!699246 () Bool)

(assert (=> b!1050122 (=> (not res!699246) (not e!595863))))

(assert (=> b!1050122 (= res!699246 (arrayContainsKey!0 lt!463794 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1050122 (= lt!463794 (array!66168 (store (arr!31823 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32359 a!3488)))))

(declare-fun b!1050123 () Bool)

(declare-fun res!699248 () Bool)

(assert (=> b!1050123 (=> res!699248 e!595866)))

(declare-fun contains!6128 (List!22135 (_ BitVec 64)) Bool)

(assert (=> b!1050123 (= res!699248 (contains!6128 Nil!22132 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1050124 () Bool)

(assert (=> b!1050124 (= e!595864 (arrayContainsKey!0 a!3488 k0!2747 lt!463797))))

(declare-fun b!1050125 () Bool)

(declare-fun res!699243 () Bool)

(assert (=> b!1050125 (=> res!699243 e!595866)))

(declare-fun noDuplicate!1513 (List!22135) Bool)

(assert (=> b!1050125 (= res!699243 (not (noDuplicate!1513 Nil!22132)))))

(declare-fun b!1050121 () Bool)

(assert (=> b!1050121 (= e!595866 true)))

(declare-fun lt!463795 () Bool)

(assert (=> b!1050121 (= lt!463795 (contains!6128 Nil!22132 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!699245 () Bool)

(assert (=> start!92366 (=> (not res!699245) (not e!595869))))

(assert (=> start!92366 (= res!699245 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32359 a!3488)) (bvslt (size!32359 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92366 e!595869))

(assert (=> start!92366 true))

(declare-fun array_inv!24603 (array!66167) Bool)

(assert (=> start!92366 (array_inv!24603 a!3488)))

(assert (= (and start!92366 res!699245) b!1050116))

(assert (= (and b!1050116 res!699242) b!1050115))

(assert (= (and b!1050115 res!699240) b!1050118))

(assert (= (and b!1050118 res!699250) b!1050122))

(assert (= (and b!1050122 res!699246) b!1050117))

(assert (= (and b!1050117 res!699247) b!1050119))

(assert (= (and b!1050119 res!699241) b!1050114))

(assert (= (and b!1050114 (not res!699244)) b!1050124))

(assert (= (and b!1050119 (not res!699249)) b!1050120))

(assert (= (and b!1050120 (not res!699251)) b!1050125))

(assert (= (and b!1050125 (not res!699243)) b!1050123))

(assert (= (and b!1050123 (not res!699248)) b!1050121))

(declare-fun m!970801 () Bool)

(assert (=> b!1050125 m!970801))

(declare-fun m!970803 () Bool)

(assert (=> b!1050118 m!970803))

(declare-fun m!970805 () Bool)

(assert (=> b!1050119 m!970805))

(declare-fun m!970807 () Bool)

(assert (=> b!1050119 m!970807))

(declare-fun m!970809 () Bool)

(assert (=> b!1050117 m!970809))

(declare-fun m!970811 () Bool)

(assert (=> b!1050120 m!970811))

(declare-fun m!970813 () Bool)

(assert (=> b!1050120 m!970813))

(declare-fun m!970815 () Bool)

(assert (=> b!1050120 m!970815))

(declare-fun m!970817 () Bool)

(assert (=> b!1050120 m!970817))

(declare-fun m!970819 () Bool)

(assert (=> b!1050124 m!970819))

(declare-fun m!970821 () Bool)

(assert (=> start!92366 m!970821))

(declare-fun m!970823 () Bool)

(assert (=> b!1050123 m!970823))

(declare-fun m!970825 () Bool)

(assert (=> b!1050116 m!970825))

(declare-fun m!970827 () Bool)

(assert (=> b!1050122 m!970827))

(assert (=> b!1050122 m!970805))

(declare-fun m!970829 () Bool)

(assert (=> b!1050121 m!970829))

(declare-fun m!970831 () Bool)

(assert (=> b!1050115 m!970831))

(check-sat (not b!1050122) (not b!1050121) (not b!1050117) (not b!1050125) (not b!1050123) (not b!1050124) (not start!92366) (not b!1050120) (not b!1050115) (not b!1050116))
