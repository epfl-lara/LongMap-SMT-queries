; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118242 () Bool)

(assert start!118242)

(declare-fun b!1383543 () Bool)

(declare-fun e!784317 () Bool)

(assert (=> b!1383543 (= e!784317 false)))

(declare-fun lt!608856 () Bool)

(declare-datatypes ((array!94502 0))(
  ( (array!94503 (arr!45630 (Array (_ BitVec 32) (_ BitVec 64))) (size!46181 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94502)

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94502 (_ BitVec 32)) Bool)

(assert (=> b!1383543 (= lt!608856 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun res!924343 () Bool)

(assert (=> start!118242 (=> (not res!924343) (not e!784317))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118242 (= res!924343 (validMask!0 mask!3034))))

(assert (=> start!118242 e!784317))

(assert (=> start!118242 true))

(declare-fun array_inv!34911 (array!94502) Bool)

(assert (=> start!118242 (array_inv!34911 a!2971)))

(declare-fun b!1383542 () Bool)

(declare-fun res!924345 () Bool)

(assert (=> b!1383542 (=> (not res!924345) (not e!784317))))

(declare-datatypes ((List!32151 0))(
  ( (Nil!32148) (Cons!32147 (h!33365 (_ BitVec 64)) (t!46837 List!32151)) )
))
(declare-fun arrayNoDuplicates!0 (array!94502 (_ BitVec 32) List!32151) Bool)

(assert (=> b!1383542 (= res!924345 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32148))))

(declare-fun b!1383540 () Bool)

(declare-fun res!924346 () Bool)

(assert (=> b!1383540 (=> (not res!924346) (not e!784317))))

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1383540 (= res!924346 (and (= (size!46181 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46181 a!2971))))))

(declare-fun b!1383541 () Bool)

(declare-fun res!924344 () Bool)

(assert (=> b!1383541 (=> (not res!924344) (not e!784317))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383541 (= res!924344 (validKeyInArray!0 (select (arr!45630 a!2971) i!1094)))))

(assert (= (and start!118242 res!924343) b!1383540))

(assert (= (and b!1383540 res!924346) b!1383541))

(assert (= (and b!1383541 res!924344) b!1383542))

(assert (= (and b!1383542 res!924345) b!1383543))

(declare-fun m!1269003 () Bool)

(assert (=> b!1383543 m!1269003))

(declare-fun m!1269005 () Bool)

(assert (=> start!118242 m!1269005))

(declare-fun m!1269007 () Bool)

(assert (=> start!118242 m!1269007))

(declare-fun m!1269009 () Bool)

(assert (=> b!1383542 m!1269009))

(declare-fun m!1269011 () Bool)

(assert (=> b!1383541 m!1269011))

(assert (=> b!1383541 m!1269011))

(declare-fun m!1269013 () Bool)

(assert (=> b!1383541 m!1269013))

(push 1)

(assert (not b!1383541))

(assert (not b!1383543))

(assert (not start!118242))

(assert (not b!1383542))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

