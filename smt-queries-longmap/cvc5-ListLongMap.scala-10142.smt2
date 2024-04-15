; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119616 () Bool)

(assert start!119616)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95251 0))(
  ( (array!95252 (arr!45984 (Array (_ BitVec 32) (_ BitVec 64))) (size!46536 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95251)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun b!1393298 () Bool)

(declare-fun e!788948 () Bool)

(declare-datatypes ((SeekEntryResult!10327 0))(
  ( (MissingZero!10327 (index!43679 (_ BitVec 32))) (Found!10327 (index!43680 (_ BitVec 32))) (Intermediate!10327 (undefined!11139 Bool) (index!43681 (_ BitVec 32)) (x!125352 (_ BitVec 32))) (Undefined!10327) (MissingVacant!10327 (index!43682 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95251 (_ BitVec 32)) SeekEntryResult!10327)

(assert (=> b!1393298 (= e!788948 (= (seekEntryOrOpen!0 (select (arr!45984 a!2901) j!112) a!2901 mask!2840) (Found!10327 j!112)))))

(declare-fun b!1393299 () Bool)

(declare-fun res!932760 () Bool)

(declare-fun e!788949 () Bool)

(assert (=> b!1393299 (=> (not res!932760) (not e!788949))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1393299 (= res!932760 (validKeyInArray!0 (select (arr!45984 a!2901) i!1037)))))

(declare-fun b!1393300 () Bool)

(declare-fun res!932759 () Bool)

(assert (=> b!1393300 (=> (not res!932759) (not e!788949))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95251 (_ BitVec 32)) Bool)

(assert (=> b!1393300 (= res!932759 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1393301 () Bool)

(declare-fun e!788950 () Bool)

(assert (=> b!1393301 (= e!788949 (not e!788950))))

(declare-fun res!932758 () Bool)

(assert (=> b!1393301 (=> res!932758 e!788950)))

(declare-fun lt!611779 () SeekEntryResult!10327)

(assert (=> b!1393301 (= res!932758 (or (not (is-Intermediate!10327 lt!611779)) (undefined!11139 lt!611779)))))

(assert (=> b!1393301 e!788948))

(declare-fun res!932762 () Bool)

(assert (=> b!1393301 (=> (not res!932762) (not e!788948))))

(assert (=> b!1393301 (= res!932762 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46501 0))(
  ( (Unit!46502) )
))
(declare-fun lt!611778 () Unit!46501)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95251 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46501)

(assert (=> b!1393301 (= lt!611778 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95251 (_ BitVec 32)) SeekEntryResult!10327)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1393301 (= lt!611779 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45984 a!2901) j!112) mask!2840) (select (arr!45984 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1393302 () Bool)

(declare-fun res!932763 () Bool)

(assert (=> b!1393302 (=> (not res!932763) (not e!788949))))

(declare-datatypes ((List!32581 0))(
  ( (Nil!32578) (Cons!32577 (h!33810 (_ BitVec 64)) (t!47267 List!32581)) )
))
(declare-fun arrayNoDuplicates!0 (array!95251 (_ BitVec 32) List!32581) Bool)

(assert (=> b!1393302 (= res!932763 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32578))))

(declare-fun res!932761 () Bool)

(assert (=> start!119616 (=> (not res!932761) (not e!788949))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119616 (= res!932761 (validMask!0 mask!2840))))

(assert (=> start!119616 e!788949))

(assert (=> start!119616 true))

(declare-fun array_inv!35217 (array!95251) Bool)

(assert (=> start!119616 (array_inv!35217 a!2901)))

(declare-fun b!1393303 () Bool)

(declare-fun res!932764 () Bool)

(assert (=> b!1393303 (=> (not res!932764) (not e!788949))))

(assert (=> b!1393303 (= res!932764 (and (= (size!46536 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46536 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46536 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1393304 () Bool)

(declare-fun res!932757 () Bool)

(assert (=> b!1393304 (=> (not res!932757) (not e!788949))))

(assert (=> b!1393304 (= res!932757 (validKeyInArray!0 (select (arr!45984 a!2901) j!112)))))

(declare-fun b!1393305 () Bool)

(assert (=> b!1393305 (= e!788950 true)))

(declare-fun lt!611780 () SeekEntryResult!10327)

(assert (=> b!1393305 (= lt!611780 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!45984 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!45984 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95252 (store (arr!45984 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46536 a!2901)) mask!2840))))

(assert (= (and start!119616 res!932761) b!1393303))

(assert (= (and b!1393303 res!932764) b!1393299))

(assert (= (and b!1393299 res!932760) b!1393304))

(assert (= (and b!1393304 res!932757) b!1393300))

(assert (= (and b!1393300 res!932759) b!1393302))

(assert (= (and b!1393302 res!932763) b!1393301))

(assert (= (and b!1393301 res!932762) b!1393298))

(assert (= (and b!1393301 (not res!932758)) b!1393305))

(declare-fun m!1278729 () Bool)

(assert (=> b!1393298 m!1278729))

(assert (=> b!1393298 m!1278729))

(declare-fun m!1278731 () Bool)

(assert (=> b!1393298 m!1278731))

(declare-fun m!1278733 () Bool)

(assert (=> b!1393299 m!1278733))

(assert (=> b!1393299 m!1278733))

(declare-fun m!1278735 () Bool)

(assert (=> b!1393299 m!1278735))

(assert (=> b!1393301 m!1278729))

(declare-fun m!1278737 () Bool)

(assert (=> b!1393301 m!1278737))

(assert (=> b!1393301 m!1278729))

(declare-fun m!1278739 () Bool)

(assert (=> b!1393301 m!1278739))

(assert (=> b!1393301 m!1278737))

(assert (=> b!1393301 m!1278729))

(declare-fun m!1278741 () Bool)

(assert (=> b!1393301 m!1278741))

(declare-fun m!1278743 () Bool)

(assert (=> b!1393301 m!1278743))

(declare-fun m!1278745 () Bool)

(assert (=> start!119616 m!1278745))

(declare-fun m!1278747 () Bool)

(assert (=> start!119616 m!1278747))

(declare-fun m!1278749 () Bool)

(assert (=> b!1393305 m!1278749))

(declare-fun m!1278751 () Bool)

(assert (=> b!1393305 m!1278751))

(assert (=> b!1393305 m!1278751))

(declare-fun m!1278753 () Bool)

(assert (=> b!1393305 m!1278753))

(assert (=> b!1393305 m!1278753))

(assert (=> b!1393305 m!1278751))

(declare-fun m!1278755 () Bool)

(assert (=> b!1393305 m!1278755))

(declare-fun m!1278757 () Bool)

(assert (=> b!1393300 m!1278757))

(assert (=> b!1393304 m!1278729))

(assert (=> b!1393304 m!1278729))

(declare-fun m!1278759 () Bool)

(assert (=> b!1393304 m!1278759))

(declare-fun m!1278761 () Bool)

(assert (=> b!1393302 m!1278761))

(push 1)

(assert (not start!119616))

(assert (not b!1393301))

(assert (not b!1393305))

(assert (not b!1393298))

(assert (not b!1393299))

(assert (not b!1393300))

(assert (not b!1393304))

(assert (not b!1393302))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

