; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118582 () Bool)

(assert start!118582)

(declare-fun b!1386283 () Bool)

(declare-fun res!927520 () Bool)

(declare-fun e!785329 () Bool)

(assert (=> b!1386283 (=> (not res!927520) (not e!785329))))

(declare-datatypes ((array!94858 0))(
  ( (array!94859 (arr!45805 (Array (_ BitVec 32) (_ BitVec 64))) (size!46355 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94858)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94858 (_ BitVec 32)) Bool)

(assert (=> b!1386283 (= res!927520 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1386284 () Bool)

(declare-fun e!785328 () Bool)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1386284 (= e!785328 (validKeyInArray!0 (select (arr!45805 a!2938) startIndex!16)))))

(declare-fun b!1386285 () Bool)

(declare-fun res!927517 () Bool)

(assert (=> b!1386285 (=> (not res!927517) (not e!785329))))

(declare-fun i!1065 () (_ BitVec 32))

(assert (=> b!1386285 (= res!927517 (and (= (size!46355 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46355 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46355 a!2938))))))

(declare-fun b!1386286 () Bool)

(declare-fun res!927519 () Bool)

(assert (=> b!1386286 (=> (not res!927519) (not e!785329))))

(assert (=> b!1386286 (= res!927519 (and (not (= (select (arr!45805 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45805 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1386287 () Bool)

(declare-datatypes ((Unit!46286 0))(
  ( (Unit!46287) )
))
(declare-fun e!785327 () Unit!46286)

(declare-fun Unit!46288 () Unit!46286)

(assert (=> b!1386287 (= e!785327 Unit!46288)))

(declare-fun b!1386288 () Bool)

(declare-fun res!927523 () Bool)

(assert (=> b!1386288 (=> (not res!927523) (not e!785329))))

(declare-datatypes ((List!32333 0))(
  ( (Nil!32330) (Cons!32329 (h!33538 (_ BitVec 64)) (t!47027 List!32333)) )
))
(declare-fun arrayNoDuplicates!0 (array!94858 (_ BitVec 32) List!32333) Bool)

(assert (=> b!1386288 (= res!927523 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32330))))

(declare-fun b!1386289 () Bool)

(assert (=> b!1386289 (= e!785329 false)))

(declare-fun lt!609414 () Unit!46286)

(assert (=> b!1386289 (= lt!609414 e!785327)))

(declare-fun c!128823 () Bool)

(assert (=> b!1386289 (= c!128823 e!785328)))

(declare-fun res!927522 () Bool)

(assert (=> b!1386289 (=> (not res!927522) (not e!785328))))

(assert (=> b!1386289 (= res!927522 (not (= startIndex!16 i!1065)))))

(declare-fun res!927521 () Bool)

(assert (=> start!118582 (=> (not res!927521) (not e!785329))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118582 (= res!927521 (validMask!0 mask!2987))))

(assert (=> start!118582 e!785329))

(assert (=> start!118582 true))

(declare-fun array_inv!34833 (array!94858) Bool)

(assert (=> start!118582 (array_inv!34833 a!2938)))

(declare-fun b!1386290 () Bool)

(declare-fun lt!609412 () Unit!46286)

(assert (=> b!1386290 (= e!785327 lt!609412)))

(declare-fun lt!609413 () Unit!46286)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94858 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46286)

(assert (=> b!1386290 (= lt!609413 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10148 0))(
  ( (MissingZero!10148 (index!42963 (_ BitVec 32))) (Found!10148 (index!42964 (_ BitVec 32))) (Intermediate!10148 (undefined!10960 Bool) (index!42965 (_ BitVec 32)) (x!124581 (_ BitVec 32))) (Undefined!10148) (MissingVacant!10148 (index!42966 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94858 (_ BitVec 32)) SeekEntryResult!10148)

(assert (=> b!1386290 (= (seekEntryOrOpen!0 (select (arr!45805 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45805 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94859 (store (arr!45805 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46355 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94858 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46286)

(assert (=> b!1386290 (= lt!609412 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1386290 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1386291 () Bool)

(declare-fun res!927518 () Bool)

(assert (=> b!1386291 (=> (not res!927518) (not e!785329))))

(assert (=> b!1386291 (= res!927518 (validKeyInArray!0 (select (arr!45805 a!2938) i!1065)))))

(assert (= (and start!118582 res!927521) b!1386285))

(assert (= (and b!1386285 res!927517) b!1386291))

(assert (= (and b!1386291 res!927518) b!1386288))

(assert (= (and b!1386288 res!927523) b!1386283))

(assert (= (and b!1386283 res!927520) b!1386286))

(assert (= (and b!1386286 res!927519) b!1386289))

(assert (= (and b!1386289 res!927522) b!1386284))

(assert (= (and b!1386289 c!128823) b!1386290))

(assert (= (and b!1386289 (not c!128823)) b!1386287))

(declare-fun m!1271631 () Bool)

(assert (=> b!1386288 m!1271631))

(declare-fun m!1271633 () Bool)

(assert (=> b!1386291 m!1271633))

(assert (=> b!1386291 m!1271633))

(declare-fun m!1271635 () Bool)

(assert (=> b!1386291 m!1271635))

(declare-fun m!1271637 () Bool)

(assert (=> start!118582 m!1271637))

(declare-fun m!1271639 () Bool)

(assert (=> start!118582 m!1271639))

(declare-fun m!1271641 () Bool)

(assert (=> b!1386290 m!1271641))

(declare-fun m!1271643 () Bool)

(assert (=> b!1386290 m!1271643))

(assert (=> b!1386290 m!1271643))

(declare-fun m!1271645 () Bool)

(assert (=> b!1386290 m!1271645))

(declare-fun m!1271647 () Bool)

(assert (=> b!1386290 m!1271647))

(declare-fun m!1271649 () Bool)

(assert (=> b!1386290 m!1271649))

(declare-fun m!1271651 () Bool)

(assert (=> b!1386290 m!1271651))

(declare-fun m!1271653 () Bool)

(assert (=> b!1386290 m!1271653))

(assert (=> b!1386290 m!1271651))

(declare-fun m!1271655 () Bool)

(assert (=> b!1386290 m!1271655))

(assert (=> b!1386286 m!1271633))

(assert (=> b!1386284 m!1271651))

(assert (=> b!1386284 m!1271651))

(declare-fun m!1271657 () Bool)

(assert (=> b!1386284 m!1271657))

(declare-fun m!1271659 () Bool)

(assert (=> b!1386283 m!1271659))

(push 1)

(assert (not start!118582))

(assert (not b!1386288))

(assert (not b!1386290))

(assert (not b!1386283))

(assert (not b!1386291))

(assert (not b!1386284))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

