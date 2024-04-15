; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93464 () Bool)

(assert start!93464)

(declare-fun b!1058537 () Bool)

(declare-fun e!602240 () Bool)

(declare-fun e!602241 () Bool)

(assert (=> b!1058537 (= e!602240 e!602241)))

(declare-fun res!707200 () Bool)

(assert (=> b!1058537 (=> (not res!707200) (not e!602241))))

(declare-fun lt!466821 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1058537 (= res!707200 (not (= lt!466821 i!1381)))))

(declare-datatypes ((array!66708 0))(
  ( (array!66709 (arr!32072 (Array (_ BitVec 32) (_ BitVec 64))) (size!32610 (_ BitVec 32))) )
))
(declare-fun lt!466822 () array!66708)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66708 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1058537 (= lt!466821 (arrayScanForKey!0 lt!466822 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1058538 () Bool)

(declare-fun res!707195 () Bool)

(declare-fun e!602239 () Bool)

(assert (=> b!1058538 (=> (not res!707195) (not e!602239))))

(declare-fun a!3488 () array!66708)

(declare-datatypes ((List!22443 0))(
  ( (Nil!22440) (Cons!22439 (h!23648 (_ BitVec 64)) (t!31741 List!22443)) )
))
(declare-fun arrayNoDuplicates!0 (array!66708 (_ BitVec 32) List!22443) Bool)

(assert (=> b!1058538 (= res!707195 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22440))))

(declare-fun b!1058539 () Bool)

(assert (=> b!1058539 (= e!602239 e!602240)))

(declare-fun res!707196 () Bool)

(assert (=> b!1058539 (=> (not res!707196) (not e!602240))))

(declare-fun arrayContainsKey!0 (array!66708 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1058539 (= res!707196 (arrayContainsKey!0 lt!466822 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1058539 (= lt!466822 (array!66709 (store (arr!32072 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32610 a!3488)))))

(declare-fun b!1058540 () Bool)

(assert (=> b!1058540 (= e!602241 (not (or (bvsgt lt!466821 i!1381) (bvsgt i!1381 lt!466821))))))

(assert (=> b!1058540 (= (select (store (arr!32072 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466821) k!2747)))

(declare-fun b!1058541 () Bool)

(declare-fun res!707198 () Bool)

(assert (=> b!1058541 (=> (not res!707198) (not e!602239))))

(assert (=> b!1058541 (= res!707198 (= (select (arr!32072 a!3488) i!1381) k!2747))))

(declare-fun res!707197 () Bool)

(assert (=> start!93464 (=> (not res!707197) (not e!602239))))

(assert (=> start!93464 (= res!707197 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32610 a!3488)) (bvslt (size!32610 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93464 e!602239))

(assert (=> start!93464 true))

(declare-fun array_inv!24855 (array!66708) Bool)

(assert (=> start!93464 (array_inv!24855 a!3488)))

(declare-fun b!1058542 () Bool)

(declare-fun res!707199 () Bool)

(assert (=> b!1058542 (=> (not res!707199) (not e!602239))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1058542 (= res!707199 (validKeyInArray!0 k!2747))))

(assert (= (and start!93464 res!707197) b!1058538))

(assert (= (and b!1058538 res!707195) b!1058542))

(assert (= (and b!1058542 res!707199) b!1058541))

(assert (= (and b!1058541 res!707198) b!1058539))

(assert (= (and b!1058539 res!707196) b!1058537))

(assert (= (and b!1058537 res!707200) b!1058540))

(declare-fun m!977713 () Bool)

(assert (=> b!1058542 m!977713))

(declare-fun m!977715 () Bool)

(assert (=> b!1058541 m!977715))

(declare-fun m!977717 () Bool)

(assert (=> b!1058538 m!977717))

(declare-fun m!977719 () Bool)

(assert (=> b!1058537 m!977719))

(declare-fun m!977721 () Bool)

(assert (=> b!1058539 m!977721))

(declare-fun m!977723 () Bool)

(assert (=> b!1058539 m!977723))

(assert (=> b!1058540 m!977723))

(declare-fun m!977725 () Bool)

(assert (=> b!1058540 m!977725))

(declare-fun m!977727 () Bool)

(assert (=> start!93464 m!977727))

(push 1)

(assert (not b!1058542))

(assert (not b!1058537))

(assert (not b!1058538))

(assert (not start!93464))

(assert (not b!1058539))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

