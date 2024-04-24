; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93728 () Bool)

(assert start!93728)

(declare-fun res!707838 () Bool)

(declare-fun e!603252 () Bool)

(assert (=> start!93728 (=> (not res!707838) (not e!603252))))

(declare-fun from!2850 () (_ BitVec 32))

(declare-datatypes ((array!66839 0))(
  ( (array!66840 (arr!32131 (Array (_ BitVec 32) (_ BitVec 64))) (size!32668 (_ BitVec 32))) )
))
(declare-fun a!3475 () array!66839)

(assert (=> start!93728 (= res!707838 (and (bvsge from!2850 #b00000000000000000000000000000000) (bvslt from!2850 (size!32668 a!3475)) (bvslt (size!32668 a!3475) #b01111111111111111111111111111111)))))

(assert (=> start!93728 e!603252))

(assert (=> start!93728 true))

(declare-fun array_inv!24913 (array!66839) Bool)

(assert (=> start!93728 (array_inv!24913 a!3475)))

(declare-fun b!1060069 () Bool)

(declare-fun res!707840 () Bool)

(assert (=> b!1060069 (=> (not res!707840) (not e!603252))))

(declare-fun k0!2741 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66839 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1060069 (= res!707840 (arrayContainsKey!0 a!3475 k0!2741 from!2850))))

(declare-fun b!1060070 () Bool)

(declare-fun res!707839 () Bool)

(assert (=> b!1060070 (=> (not res!707839) (not e!603252))))

(assert (=> b!1060070 (= res!707839 (and (not (= (select (arr!32131 a!3475) from!2850) k0!2741)) (bvsge (bvadd #b00000000000000000000000000000001 from!2850) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2850) (size!32668 a!3475))))))

(declare-fun b!1060071 () Bool)

(assert (=> b!1060071 (= e!603252 (not (arrayContainsKey!0 a!3475 k0!2741 (bvadd #b00000000000000000000000000000001 from!2850))))))

(assert (= (and start!93728 res!707838) b!1060069))

(assert (= (and b!1060069 res!707840) b!1060070))

(assert (= (and b!1060070 res!707839) b!1060071))

(declare-fun m!980065 () Bool)

(assert (=> start!93728 m!980065))

(declare-fun m!980067 () Bool)

(assert (=> b!1060069 m!980067))

(declare-fun m!980069 () Bool)

(assert (=> b!1060070 m!980069))

(declare-fun m!980071 () Bool)

(assert (=> b!1060071 m!980071))

(check-sat (not b!1060071) (not b!1060069) (not start!93728))
(check-sat)
(get-model)

(declare-fun d!129091 () Bool)

(declare-fun res!707863 () Bool)

(declare-fun e!603270 () Bool)

(assert (=> d!129091 (=> res!707863 e!603270)))

(assert (=> d!129091 (= res!707863 (= (select (arr!32131 a!3475) (bvadd #b00000000000000000000000000000001 from!2850)) k0!2741))))

(assert (=> d!129091 (= (arrayContainsKey!0 a!3475 k0!2741 (bvadd #b00000000000000000000000000000001 from!2850)) e!603270)))

(declare-fun b!1060094 () Bool)

(declare-fun e!603271 () Bool)

(assert (=> b!1060094 (= e!603270 e!603271)))

(declare-fun res!707864 () Bool)

(assert (=> b!1060094 (=> (not res!707864) (not e!603271))))

(assert (=> b!1060094 (= res!707864 (bvslt (bvadd #b00000000000000000000000000000001 from!2850 #b00000000000000000000000000000001) (size!32668 a!3475)))))

(declare-fun b!1060095 () Bool)

(assert (=> b!1060095 (= e!603271 (arrayContainsKey!0 a!3475 k0!2741 (bvadd #b00000000000000000000000000000001 from!2850 #b00000000000000000000000000000001)))))

(assert (= (and d!129091 (not res!707863)) b!1060094))

(assert (= (and b!1060094 res!707864) b!1060095))

(declare-fun m!980089 () Bool)

(assert (=> d!129091 m!980089))

(declare-fun m!980091 () Bool)

(assert (=> b!1060095 m!980091))

(assert (=> b!1060071 d!129091))

(declare-fun d!129093 () Bool)

(declare-fun res!707865 () Bool)

(declare-fun e!603272 () Bool)

(assert (=> d!129093 (=> res!707865 e!603272)))

(assert (=> d!129093 (= res!707865 (= (select (arr!32131 a!3475) from!2850) k0!2741))))

(assert (=> d!129093 (= (arrayContainsKey!0 a!3475 k0!2741 from!2850) e!603272)))

(declare-fun b!1060096 () Bool)

(declare-fun e!603273 () Bool)

(assert (=> b!1060096 (= e!603272 e!603273)))

(declare-fun res!707866 () Bool)

(assert (=> b!1060096 (=> (not res!707866) (not e!603273))))

(assert (=> b!1060096 (= res!707866 (bvslt (bvadd from!2850 #b00000000000000000000000000000001) (size!32668 a!3475)))))

(declare-fun b!1060097 () Bool)

(assert (=> b!1060097 (= e!603273 (arrayContainsKey!0 a!3475 k0!2741 (bvadd from!2850 #b00000000000000000000000000000001)))))

(assert (= (and d!129093 (not res!707865)) b!1060096))

(assert (= (and b!1060096 res!707866) b!1060097))

(assert (=> d!129093 m!980069))

(declare-fun m!980093 () Bool)

(assert (=> b!1060097 m!980093))

(assert (=> b!1060069 d!129093))

(declare-fun d!129095 () Bool)

(assert (=> d!129095 (= (array_inv!24913 a!3475) (bvsge (size!32668 a!3475) #b00000000000000000000000000000000))))

(assert (=> start!93728 d!129095))

(check-sat (not b!1060097) (not b!1060095))
(check-sat)
