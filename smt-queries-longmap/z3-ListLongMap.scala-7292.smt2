; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93408 () Bool)

(assert start!93408)

(declare-fun b!1057966 () Bool)

(declare-fun res!705911 () Bool)

(declare-fun e!601606 () Bool)

(assert (=> b!1057966 (=> (not res!705911) (not e!601606))))

(declare-datatypes ((array!66694 0))(
  ( (array!66695 (arr!32065 (Array (_ BitVec 32) (_ BitVec 64))) (size!32602 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66694)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1057966 (= res!705911 (= (select (arr!32065 a!3488) i!1381) k0!2747))))

(declare-fun b!1057967 () Bool)

(declare-fun res!705907 () Bool)

(assert (=> b!1057967 (=> (not res!705907) (not e!601606))))

(declare-datatypes ((List!22347 0))(
  ( (Nil!22344) (Cons!22343 (h!23561 (_ BitVec 64)) (t!31646 List!22347)) )
))
(declare-fun arrayNoDuplicates!0 (array!66694 (_ BitVec 32) List!22347) Bool)

(assert (=> b!1057967 (= res!705907 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22344))))

(declare-fun b!1057968 () Bool)

(declare-fun e!601604 () Bool)

(assert (=> b!1057968 (= e!601604 true)))

(declare-fun lt!466678 () (_ BitVec 32))

(assert (=> b!1057968 (arrayNoDuplicates!0 a!3488 lt!466678 Nil!22344)))

(declare-datatypes ((Unit!34621 0))(
  ( (Unit!34622) )
))
(declare-fun lt!466677 () Unit!34621)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66694 (_ BitVec 32) (_ BitVec 32)) Unit!34621)

(assert (=> b!1057968 (= lt!466677 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466678))))

(declare-fun b!1057969 () Bool)

(declare-fun e!601605 () Bool)

(declare-fun e!601601 () Bool)

(assert (=> b!1057969 (= e!601605 e!601601)))

(declare-fun res!705909 () Bool)

(assert (=> b!1057969 (=> res!705909 e!601601)))

(assert (=> b!1057969 (= res!705909 (or (bvsgt lt!466678 i!1381) (bvsle i!1381 lt!466678)))))

(declare-fun b!1057970 () Bool)

(declare-fun e!601600 () Bool)

(assert (=> b!1057970 (= e!601606 e!601600)))

(declare-fun res!705908 () Bool)

(assert (=> b!1057970 (=> (not res!705908) (not e!601600))))

(declare-fun lt!466679 () array!66694)

(declare-fun arrayContainsKey!0 (array!66694 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1057970 (= res!705908 (arrayContainsKey!0 lt!466679 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1057970 (= lt!466679 (array!66695 (store (arr!32065 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32602 a!3488)))))

(declare-fun b!1057971 () Bool)

(declare-fun res!705904 () Bool)

(assert (=> b!1057971 (=> (not res!705904) (not e!601606))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1057971 (= res!705904 (validKeyInArray!0 k0!2747))))

(declare-fun b!1057972 () Bool)

(declare-fun e!601603 () Bool)

(assert (=> b!1057972 (= e!601600 e!601603)))

(declare-fun res!705905 () Bool)

(assert (=> b!1057972 (=> (not res!705905) (not e!601603))))

(assert (=> b!1057972 (= res!705905 (not (= lt!466678 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66694 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1057972 (= lt!466678 (arrayScanForKey!0 lt!466679 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1057973 () Bool)

(assert (=> b!1057973 (= e!601603 (not e!601604))))

(declare-fun res!705903 () Bool)

(assert (=> b!1057973 (=> res!705903 e!601604)))

(assert (=> b!1057973 (= res!705903 (or (bvsgt lt!466678 i!1381) (bvsle i!1381 lt!466678)))))

(assert (=> b!1057973 e!601605))

(declare-fun res!705906 () Bool)

(assert (=> b!1057973 (=> (not res!705906) (not e!601605))))

(assert (=> b!1057973 (= res!705906 (= (select (store (arr!32065 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466678) k0!2747))))

(declare-fun res!705910 () Bool)

(assert (=> start!93408 (=> (not res!705910) (not e!601606))))

(assert (=> start!93408 (= res!705910 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32602 a!3488)) (bvslt (size!32602 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93408 e!601606))

(assert (=> start!93408 true))

(declare-fun array_inv!24847 (array!66694) Bool)

(assert (=> start!93408 (array_inv!24847 a!3488)))

(declare-fun b!1057974 () Bool)

(assert (=> b!1057974 (= e!601601 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(assert (= (and start!93408 res!705910) b!1057967))

(assert (= (and b!1057967 res!705907) b!1057971))

(assert (= (and b!1057971 res!705904) b!1057966))

(assert (= (and b!1057966 res!705911) b!1057970))

(assert (= (and b!1057970 res!705908) b!1057972))

(assert (= (and b!1057972 res!705905) b!1057973))

(assert (= (and b!1057973 res!705906) b!1057969))

(assert (= (and b!1057969 (not res!705909)) b!1057974))

(assert (= (and b!1057973 (not res!705903)) b!1057968))

(declare-fun m!978119 () Bool)

(assert (=> b!1057972 m!978119))

(declare-fun m!978121 () Bool)

(assert (=> b!1057971 m!978121))

(declare-fun m!978123 () Bool)

(assert (=> start!93408 m!978123))

(declare-fun m!978125 () Bool)

(assert (=> b!1057973 m!978125))

(declare-fun m!978127 () Bool)

(assert (=> b!1057973 m!978127))

(declare-fun m!978129 () Bool)

(assert (=> b!1057968 m!978129))

(declare-fun m!978131 () Bool)

(assert (=> b!1057968 m!978131))

(declare-fun m!978133 () Bool)

(assert (=> b!1057966 m!978133))

(declare-fun m!978135 () Bool)

(assert (=> b!1057970 m!978135))

(assert (=> b!1057970 m!978125))

(declare-fun m!978137 () Bool)

(assert (=> b!1057967 m!978137))

(declare-fun m!978139 () Bool)

(assert (=> b!1057974 m!978139))

(check-sat (not b!1057968) (not start!93408) (not b!1057974) (not b!1057970) (not b!1057971) (not b!1057972) (not b!1057967))
(check-sat)
