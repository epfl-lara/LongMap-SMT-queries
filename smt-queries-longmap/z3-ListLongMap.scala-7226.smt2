; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92652 () Bool)

(assert start!92652)

(declare-fun b!1052078 () Bool)

(declare-fun res!700402 () Bool)

(declare-fun e!597178 () Bool)

(assert (=> b!1052078 (=> (not res!700402) (not e!597178))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1052078 (= res!700402 (validKeyInArray!0 k0!2747))))

(declare-fun b!1052079 () Bool)

(declare-fun e!597173 () Bool)

(assert (=> b!1052079 (= e!597178 e!597173)))

(declare-fun res!700403 () Bool)

(assert (=> b!1052079 (=> (not res!700403) (not e!597173))))

(declare-datatypes ((array!66268 0))(
  ( (array!66269 (arr!31867 (Array (_ BitVec 32) (_ BitVec 64))) (size!32404 (_ BitVec 32))) )
))
(declare-fun lt!464584 () array!66268)

(declare-fun arrayContainsKey!0 (array!66268 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1052079 (= res!700403 (arrayContainsKey!0 lt!464584 k0!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66268)

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1052079 (= lt!464584 (array!66269 (store (arr!31867 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32404 a!3488)))))

(declare-fun res!700404 () Bool)

(assert (=> start!92652 (=> (not res!700404) (not e!597178))))

(assert (=> start!92652 (= res!700404 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32404 a!3488)) (bvslt (size!32404 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92652 e!597178))

(assert (=> start!92652 true))

(declare-fun array_inv!24649 (array!66268) Bool)

(assert (=> start!92652 (array_inv!24649 a!3488)))

(declare-fun b!1052080 () Bool)

(declare-fun e!597174 () Bool)

(assert (=> b!1052080 (= e!597174 (not true))))

(declare-fun e!597177 () Bool)

(assert (=> b!1052080 e!597177))

(declare-fun res!700401 () Bool)

(assert (=> b!1052080 (=> (not res!700401) (not e!597177))))

(declare-fun lt!464585 () (_ BitVec 32))

(assert (=> b!1052080 (= res!700401 (= (select (store (arr!31867 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464585) k0!2747))))

(declare-fun b!1052081 () Bool)

(declare-fun res!700399 () Bool)

(assert (=> b!1052081 (=> (not res!700399) (not e!597178))))

(declare-datatypes ((List!22149 0))(
  ( (Nil!22146) (Cons!22145 (h!23363 (_ BitVec 64)) (t!31448 List!22149)) )
))
(declare-fun arrayNoDuplicates!0 (array!66268 (_ BitVec 32) List!22149) Bool)

(assert (=> b!1052081 (= res!700399 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22146))))

(declare-fun b!1052082 () Bool)

(declare-fun e!597176 () Bool)

(assert (=> b!1052082 (= e!597176 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1052083 () Bool)

(declare-fun res!700400 () Bool)

(assert (=> b!1052083 (=> (not res!700400) (not e!597178))))

(assert (=> b!1052083 (= res!700400 (= (select (arr!31867 a!3488) i!1381) k0!2747))))

(declare-fun b!1052084 () Bool)

(assert (=> b!1052084 (= e!597173 e!597174)))

(declare-fun res!700406 () Bool)

(assert (=> b!1052084 (=> (not res!700406) (not e!597174))))

(assert (=> b!1052084 (= res!700406 (not (= lt!464585 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66268 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1052084 (= lt!464585 (arrayScanForKey!0 lt!464584 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1052085 () Bool)

(assert (=> b!1052085 (= e!597177 e!597176)))

(declare-fun res!700405 () Bool)

(assert (=> b!1052085 (=> res!700405 e!597176)))

(assert (=> b!1052085 (= res!700405 (or (bvsgt lt!464585 i!1381) (bvsle i!1381 lt!464585)))))

(assert (= (and start!92652 res!700404) b!1052081))

(assert (= (and b!1052081 res!700399) b!1052078))

(assert (= (and b!1052078 res!700402) b!1052083))

(assert (= (and b!1052083 res!700400) b!1052079))

(assert (= (and b!1052079 res!700403) b!1052084))

(assert (= (and b!1052084 res!700406) b!1052080))

(assert (= (and b!1052080 res!700401) b!1052085))

(assert (= (and b!1052085 (not res!700405)) b!1052082))

(declare-fun m!973079 () Bool)

(assert (=> b!1052083 m!973079))

(declare-fun m!973081 () Bool)

(assert (=> b!1052079 m!973081))

(declare-fun m!973083 () Bool)

(assert (=> b!1052079 m!973083))

(assert (=> b!1052080 m!973083))

(declare-fun m!973085 () Bool)

(assert (=> b!1052080 m!973085))

(declare-fun m!973087 () Bool)

(assert (=> b!1052084 m!973087))

(declare-fun m!973089 () Bool)

(assert (=> b!1052078 m!973089))

(declare-fun m!973091 () Bool)

(assert (=> start!92652 m!973091))

(declare-fun m!973093 () Bool)

(assert (=> b!1052081 m!973093))

(declare-fun m!973095 () Bool)

(assert (=> b!1052082 m!973095))

(check-sat (not b!1052084) (not b!1052081) (not b!1052079) (not b!1052082) (not start!92652) (not b!1052078))
(check-sat)
