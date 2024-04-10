; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93046 () Bool)

(assert start!93046)

(declare-fun b!1055592 () Bool)

(declare-fun e!599960 () Bool)

(declare-fun e!599959 () Bool)

(assert (=> b!1055592 (= e!599960 e!599959)))

(declare-fun res!704417 () Bool)

(assert (=> b!1055592 (=> res!704417 e!599959)))

(declare-fun lt!465821 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1055592 (= res!704417 (bvsle lt!465821 i!1381))))

(declare-fun b!1055593 () Bool)

(declare-fun res!704406 () Bool)

(declare-fun e!599961 () Bool)

(assert (=> b!1055593 (=> (not res!704406) (not e!599961))))

(declare-datatypes ((array!66571 0))(
  ( (array!66572 (arr!32013 (Array (_ BitVec 32) (_ BitVec 64))) (size!32549 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66571)

(declare-fun k!2747 () (_ BitVec 64))

(assert (=> b!1055593 (= res!704406 (= (select (arr!32013 a!3488) i!1381) k!2747))))

(declare-fun b!1055594 () Bool)

(declare-fun res!704407 () Bool)

(assert (=> b!1055594 (=> (not res!704407) (not e!599961))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1055594 (= res!704407 (validKeyInArray!0 k!2747))))

(declare-fun b!1055595 () Bool)

(declare-fun res!704413 () Bool)

(declare-fun e!599964 () Bool)

(assert (=> b!1055595 (=> res!704413 e!599964)))

(declare-datatypes ((List!22325 0))(
  ( (Nil!22322) (Cons!22321 (h!23530 (_ BitVec 64)) (t!31632 List!22325)) )
))
(declare-fun noDuplicate!1553 (List!22325) Bool)

(assert (=> b!1055595 (= res!704413 (not (noDuplicate!1553 Nil!22322)))))

(declare-fun b!1055596 () Bool)

(declare-fun e!599962 () Bool)

(assert (=> b!1055596 (= e!599961 e!599962)))

(declare-fun res!704410 () Bool)

(assert (=> b!1055596 (=> (not res!704410) (not e!599962))))

(declare-fun lt!465818 () array!66571)

(declare-fun arrayContainsKey!0 (array!66571 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1055596 (= res!704410 (arrayContainsKey!0 lt!465818 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1055596 (= lt!465818 (array!66572 (store (arr!32013 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32549 a!3488)))))

(declare-fun b!1055597 () Bool)

(assert (=> b!1055597 (= e!599959 (arrayContainsKey!0 a!3488 k!2747 lt!465821))))

(declare-fun b!1055598 () Bool)

(declare-fun e!599963 () Bool)

(declare-fun e!599958 () Bool)

(assert (=> b!1055598 (= e!599963 (not e!599958))))

(declare-fun res!704412 () Bool)

(assert (=> b!1055598 (=> res!704412 e!599958)))

(assert (=> b!1055598 (= res!704412 (bvsle lt!465821 i!1381))))

(assert (=> b!1055598 e!599960))

(declare-fun res!704411 () Bool)

(assert (=> b!1055598 (=> (not res!704411) (not e!599960))))

(assert (=> b!1055598 (= res!704411 (= (select (store (arr!32013 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465821) k!2747))))

(declare-fun b!1055599 () Bool)

(declare-fun res!704416 () Bool)

(assert (=> b!1055599 (=> res!704416 e!599964)))

(declare-fun contains!6185 (List!22325 (_ BitVec 64)) Bool)

(assert (=> b!1055599 (= res!704416 (contains!6185 Nil!22322 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!704414 () Bool)

(assert (=> start!93046 (=> (not res!704414) (not e!599961))))

(assert (=> start!93046 (= res!704414 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32549 a!3488)) (bvslt (size!32549 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93046 e!599961))

(assert (=> start!93046 true))

(declare-fun array_inv!24793 (array!66571) Bool)

(assert (=> start!93046 (array_inv!24793 a!3488)))

(declare-fun b!1055600 () Bool)

(assert (=> b!1055600 (= e!599958 e!599964)))

(declare-fun res!704408 () Bool)

(assert (=> b!1055600 (=> res!704408 e!599964)))

(assert (=> b!1055600 (= res!704408 (bvsge (bvadd #b00000000000000000000000000000001 i!1381) (size!32549 a!3488)))))

(assert (=> b!1055600 (arrayContainsKey!0 a!3488 k!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-datatypes ((Unit!34584 0))(
  ( (Unit!34585) )
))
(declare-fun lt!465820 () Unit!34584)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66571 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34584)

(assert (=> b!1055600 (= lt!465820 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 lt!465821 (bvadd #b00000000000000000000000000000001 i!1381)))))

(declare-fun arrayNoDuplicates!0 (array!66571 (_ BitVec 32) List!22325) Bool)

(assert (=> b!1055600 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22322)))

(declare-fun lt!465822 () Unit!34584)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66571 (_ BitVec 32) (_ BitVec 32)) Unit!34584)

(assert (=> b!1055600 (= lt!465822 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1055601 () Bool)

(declare-fun res!704409 () Bool)

(assert (=> b!1055601 (=> (not res!704409) (not e!599961))))

(assert (=> b!1055601 (= res!704409 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22322))))

(declare-fun b!1055602 () Bool)

(assert (=> b!1055602 (= e!599964 true)))

(declare-fun lt!465819 () Bool)

(assert (=> b!1055602 (= lt!465819 (contains!6185 Nil!22322 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1055603 () Bool)

(assert (=> b!1055603 (= e!599962 e!599963)))

(declare-fun res!704415 () Bool)

(assert (=> b!1055603 (=> (not res!704415) (not e!599963))))

(assert (=> b!1055603 (= res!704415 (not (= lt!465821 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66571 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1055603 (= lt!465821 (arrayScanForKey!0 lt!465818 k!2747 #b00000000000000000000000000000000))))

(assert (= (and start!93046 res!704414) b!1055601))

(assert (= (and b!1055601 res!704409) b!1055594))

(assert (= (and b!1055594 res!704407) b!1055593))

(assert (= (and b!1055593 res!704406) b!1055596))

(assert (= (and b!1055596 res!704410) b!1055603))

(assert (= (and b!1055603 res!704415) b!1055598))

(assert (= (and b!1055598 res!704411) b!1055592))

(assert (= (and b!1055592 (not res!704417)) b!1055597))

(assert (= (and b!1055598 (not res!704412)) b!1055600))

(assert (= (and b!1055600 (not res!704408)) b!1055595))

(assert (= (and b!1055595 (not res!704413)) b!1055599))

(assert (= (and b!1055599 (not res!704416)) b!1055602))

(declare-fun m!975573 () Bool)

(assert (=> b!1055600 m!975573))

(declare-fun m!975575 () Bool)

(assert (=> b!1055600 m!975575))

(declare-fun m!975577 () Bool)

(assert (=> b!1055600 m!975577))

(declare-fun m!975579 () Bool)

(assert (=> b!1055600 m!975579))

(declare-fun m!975581 () Bool)

(assert (=> b!1055601 m!975581))

(declare-fun m!975583 () Bool)

(assert (=> b!1055593 m!975583))

(declare-fun m!975585 () Bool)

(assert (=> start!93046 m!975585))

(declare-fun m!975587 () Bool)

(assert (=> b!1055602 m!975587))

(declare-fun m!975589 () Bool)

(assert (=> b!1055598 m!975589))

(declare-fun m!975591 () Bool)

(assert (=> b!1055598 m!975591))

(declare-fun m!975593 () Bool)

(assert (=> b!1055603 m!975593))

(declare-fun m!975595 () Bool)

(assert (=> b!1055596 m!975595))

(assert (=> b!1055596 m!975589))

(declare-fun m!975597 () Bool)

(assert (=> b!1055599 m!975597))

(declare-fun m!975599 () Bool)

(assert (=> b!1055594 m!975599))

(declare-fun m!975601 () Bool)

(assert (=> b!1055595 m!975601))

(declare-fun m!975603 () Bool)

(assert (=> b!1055597 m!975603))

(push 1)

