; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128290 () Bool)

(assert start!128290)

(declare-fun b!1505634 () Bool)

(declare-fun res!1026064 () Bool)

(declare-fun e!841509 () Bool)

(assert (=> b!1505634 (=> (not res!1026064) (not e!841509))))

(declare-datatypes ((array!100422 0))(
  ( (array!100423 (arr!48460 (Array (_ BitVec 32) (_ BitVec 64))) (size!49010 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100422)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100422 (_ BitVec 32)) Bool)

(assert (=> b!1505634 (= res!1026064 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1026063 () Bool)

(assert (=> start!128290 (=> (not res!1026063) (not e!841509))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128290 (= res!1026063 (validMask!0 mask!2512))))

(assert (=> start!128290 e!841509))

(assert (=> start!128290 true))

(declare-fun array_inv!37488 (array!100422) Bool)

(assert (=> start!128290 (array_inv!37488 a!2804)))

(declare-fun b!1505635 () Bool)

(declare-fun res!1026062 () Bool)

(assert (=> b!1505635 (=> (not res!1026062) (not e!841509))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1505635 (= res!1026062 (and (= (size!49010 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49010 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49010 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1505636 () Bool)

(declare-fun res!1026067 () Bool)

(assert (=> b!1505636 (=> (not res!1026067) (not e!841509))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1505636 (= res!1026067 (validKeyInArray!0 (select (arr!48460 a!2804) j!70)))))

(declare-fun b!1505637 () Bool)

(declare-fun res!1026066 () Bool)

(assert (=> b!1505637 (=> (not res!1026066) (not e!841509))))

(assert (=> b!1505637 (= res!1026066 (and (bvsle #b00000000000000000000000000000000 (size!49010 a!2804)) (bvslt (size!49010 a!2804) #b01111111111111111111111111111111)))))

(declare-fun b!1505638 () Bool)

(declare-fun res!1026065 () Bool)

(assert (=> b!1505638 (=> (not res!1026065) (not e!841509))))

(assert (=> b!1505638 (= res!1026065 (validKeyInArray!0 (select (arr!48460 a!2804) i!961)))))

(declare-fun b!1505639 () Bool)

(declare-datatypes ((List!34943 0))(
  ( (Nil!34940) (Cons!34939 (h!36336 (_ BitVec 64)) (t!49637 List!34943)) )
))
(declare-fun noDuplicate!2626 (List!34943) Bool)

(assert (=> b!1505639 (= e!841509 (not (noDuplicate!2626 Nil!34940)))))

(assert (= (and start!128290 res!1026063) b!1505635))

(assert (= (and b!1505635 res!1026062) b!1505638))

(assert (= (and b!1505638 res!1026065) b!1505636))

(assert (= (and b!1505636 res!1026067) b!1505634))

(assert (= (and b!1505634 res!1026064) b!1505637))

(assert (= (and b!1505637 res!1026066) b!1505639))

(declare-fun m!1388721 () Bool)

(assert (=> b!1505638 m!1388721))

(assert (=> b!1505638 m!1388721))

(declare-fun m!1388723 () Bool)

(assert (=> b!1505638 m!1388723))

(declare-fun m!1388725 () Bool)

(assert (=> b!1505634 m!1388725))

(declare-fun m!1388727 () Bool)

(assert (=> start!128290 m!1388727))

(declare-fun m!1388729 () Bool)

(assert (=> start!128290 m!1388729))

(declare-fun m!1388731 () Bool)

(assert (=> b!1505636 m!1388731))

(assert (=> b!1505636 m!1388731))

(declare-fun m!1388733 () Bool)

(assert (=> b!1505636 m!1388733))

(declare-fun m!1388735 () Bool)

(assert (=> b!1505639 m!1388735))

(push 1)

(assert (not b!1505639))

(assert (not b!1505636))

(assert (not b!1505638))

(assert (not b!1505634))

(assert (not start!128290))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!158067 () Bool)

(assert (=> d!158067 (= (validKeyInArray!0 (select (arr!48460 a!2804) j!70)) (and (not (= (select (arr!48460 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48460 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1505636 d!158067))

(declare-fun d!158069 () Bool)

(assert (=> d!158069 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!128290 d!158069))

(declare-fun d!158085 () Bool)

(assert (=> d!158085 (= (array_inv!37488 a!2804) (bvsge (size!49010 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!128290 d!158085))

(declare-fun b!1505684 () Bool)

(declare-fun e!841548 () Bool)

(declare-fun e!841547 () Bool)

(assert (=> b!1505684 (= e!841548 e!841547)))

(declare-fun lt!654075 () (_ BitVec 64))

