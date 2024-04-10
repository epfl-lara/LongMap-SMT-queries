; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93222 () Bool)

(assert start!93222)

(declare-fun res!705617 () Bool)

(declare-fun e!600969 () Bool)

(assert (=> start!93222 (=> (not res!705617) (not e!600969))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66660 0))(
  ( (array!66661 (arr!32053 (Array (_ BitVec 32) (_ BitVec 64))) (size!32589 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66660)

(assert (=> start!93222 (= res!705617 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32589 a!3488)) (bvslt (size!32589 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93222 e!600969))

(assert (=> start!93222 true))

(declare-fun array_inv!24833 (array!66660) Bool)

(assert (=> start!93222 (array_inv!24833 a!3488)))

(declare-fun b!1056915 () Bool)

(declare-fun e!600970 () Bool)

(declare-fun e!600965 () Bool)

(assert (=> b!1056915 (= e!600970 (not e!600965))))

(declare-fun res!705618 () Bool)

(assert (=> b!1056915 (=> res!705618 e!600965)))

(declare-fun lt!466236 () (_ BitVec 32))

(assert (=> b!1056915 (= res!705618 (or (bvsgt lt!466236 i!1381) (bvsle i!1381 lt!466236)))))

(declare-fun e!600968 () Bool)

(assert (=> b!1056915 e!600968))

(declare-fun res!705616 () Bool)

(assert (=> b!1056915 (=> (not res!705616) (not e!600968))))

(declare-fun k!2747 () (_ BitVec 64))

(assert (=> b!1056915 (= res!705616 (= (select (store (arr!32053 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466236) k!2747))))

(declare-fun b!1056916 () Bool)

(declare-fun e!600966 () Bool)

(assert (=> b!1056916 (= e!600969 e!600966)))

(declare-fun res!705622 () Bool)

(assert (=> b!1056916 (=> (not res!705622) (not e!600966))))

(declare-fun lt!466235 () array!66660)

(declare-fun arrayContainsKey!0 (array!66660 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1056916 (= res!705622 (arrayContainsKey!0 lt!466235 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1056916 (= lt!466235 (array!66661 (store (arr!32053 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32589 a!3488)))))

(declare-fun b!1056917 () Bool)

(assert (=> b!1056917 (= e!600965 true)))

(declare-datatypes ((List!22365 0))(
  ( (Nil!22362) (Cons!22361 (h!23570 (_ BitVec 64)) (t!31672 List!22365)) )
))
(declare-fun arrayNoDuplicates!0 (array!66660 (_ BitVec 32) List!22365) Bool)

(assert (=> b!1056917 (arrayNoDuplicates!0 a!3488 lt!466236 Nil!22362)))

(declare-datatypes ((Unit!34628 0))(
  ( (Unit!34629) )
))
(declare-fun lt!466234 () Unit!34628)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66660 (_ BitVec 32) (_ BitVec 32)) Unit!34628)

(assert (=> b!1056917 (= lt!466234 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466236))))

(declare-fun b!1056918 () Bool)

(declare-fun res!705623 () Bool)

(assert (=> b!1056918 (=> (not res!705623) (not e!600969))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1056918 (= res!705623 (validKeyInArray!0 k!2747))))

(declare-fun b!1056919 () Bool)

(assert (=> b!1056919 (= e!600966 e!600970)))

(declare-fun res!705619 () Bool)

(assert (=> b!1056919 (=> (not res!705619) (not e!600970))))

(assert (=> b!1056919 (= res!705619 (not (= lt!466236 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66660 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1056919 (= lt!466236 (arrayScanForKey!0 lt!466235 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1056920 () Bool)

(declare-fun e!600967 () Bool)

(assert (=> b!1056920 (= e!600968 e!600967)))

(declare-fun res!705615 () Bool)

(assert (=> b!1056920 (=> res!705615 e!600967)))

(assert (=> b!1056920 (= res!705615 (or (bvsgt lt!466236 i!1381) (bvsle i!1381 lt!466236)))))

(declare-fun b!1056921 () Bool)

(declare-fun res!705621 () Bool)

(assert (=> b!1056921 (=> (not res!705621) (not e!600969))))

(assert (=> b!1056921 (= res!705621 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22362))))

(declare-fun b!1056922 () Bool)

(assert (=> b!1056922 (= e!600967 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun b!1056923 () Bool)

(declare-fun res!705620 () Bool)

(assert (=> b!1056923 (=> (not res!705620) (not e!600969))))

(assert (=> b!1056923 (= res!705620 (= (select (arr!32053 a!3488) i!1381) k!2747))))

(assert (= (and start!93222 res!705617) b!1056921))

(assert (= (and b!1056921 res!705621) b!1056918))

(assert (= (and b!1056918 res!705623) b!1056923))

(assert (= (and b!1056923 res!705620) b!1056916))

(assert (= (and b!1056916 res!705622) b!1056919))

(assert (= (and b!1056919 res!705619) b!1056915))

(assert (= (and b!1056915 res!705616) b!1056920))

(assert (= (and b!1056920 (not res!705615)) b!1056922))

(assert (= (and b!1056915 (not res!705618)) b!1056917))

(declare-fun m!976667 () Bool)

(assert (=> b!1056922 m!976667))

(declare-fun m!976669 () Bool)

(assert (=> b!1056916 m!976669))

(declare-fun m!976671 () Bool)

(assert (=> b!1056916 m!976671))

(declare-fun m!976673 () Bool)

(assert (=> b!1056923 m!976673))

(declare-fun m!976675 () Bool)

(assert (=> b!1056919 m!976675))

(assert (=> b!1056915 m!976671))

(declare-fun m!976677 () Bool)

(assert (=> b!1056915 m!976677))

(declare-fun m!976679 () Bool)

(assert (=> b!1056921 m!976679))

(declare-fun m!976681 () Bool)

(assert (=> b!1056918 m!976681))

(declare-fun m!976683 () Bool)

(assert (=> b!1056917 m!976683))

(declare-fun m!976685 () Bool)

(assert (=> b!1056917 m!976685))

(declare-fun m!976687 () Bool)

(assert (=> start!93222 m!976687))

(push 1)

