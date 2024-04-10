; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92350 () Bool)

(assert start!92350)

(declare-fun b!1049826 () Bool)

(declare-fun e!595677 () Bool)

(declare-fun e!595671 () Bool)

(assert (=> b!1049826 (= e!595677 e!595671)))

(declare-fun res!698961 () Bool)

(assert (=> b!1049826 (=> (not res!698961) (not e!595671))))

(declare-datatypes ((array!66151 0))(
  ( (array!66152 (arr!31815 (Array (_ BitVec 32) (_ BitVec 64))) (size!32351 (_ BitVec 32))) )
))
(declare-fun lt!463677 () array!66151)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66151 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1049826 (= res!698961 (arrayContainsKey!0 lt!463677 k!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66151)

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1049826 (= lt!463677 (array!66152 (store (arr!31815 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32351 a!3488)))))

(declare-fun e!595678 () Bool)

(declare-fun b!1049827 () Bool)

(declare-fun lt!463673 () (_ BitVec 32))

(assert (=> b!1049827 (= e!595678 (arrayContainsKey!0 a!3488 k!2747 lt!463673))))

(declare-fun b!1049829 () Bool)

(declare-fun e!595674 () Bool)

(assert (=> b!1049829 (= e!595674 e!595678)))

(declare-fun res!698963 () Bool)

(assert (=> b!1049829 (=> res!698963 e!595678)))

(assert (=> b!1049829 (= res!698963 (bvsle lt!463673 i!1381))))

(declare-fun b!1049830 () Bool)

(declare-fun res!698955 () Bool)

(declare-fun e!595676 () Bool)

(assert (=> b!1049830 (=> res!698955 e!595676)))

(declare-datatypes ((List!22127 0))(
  ( (Nil!22124) (Cons!22123 (h!23332 (_ BitVec 64)) (t!31434 List!22127)) )
))
(declare-fun contains!6120 (List!22127 (_ BitVec 64)) Bool)

(assert (=> b!1049830 (= res!698955 (contains!6120 Nil!22124 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1049831 () Bool)

(declare-fun e!595673 () Bool)

(assert (=> b!1049831 (= e!595671 e!595673)))

(declare-fun res!698954 () Bool)

(assert (=> b!1049831 (=> (not res!698954) (not e!595673))))

(assert (=> b!1049831 (= res!698954 (not (= lt!463673 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66151 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1049831 (= lt!463673 (arrayScanForKey!0 lt!463677 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1049832 () Bool)

(declare-fun e!595675 () Bool)

(assert (=> b!1049832 (= e!595673 (not e!595675))))

(declare-fun res!698953 () Bool)

(assert (=> b!1049832 (=> res!698953 e!595675)))

(assert (=> b!1049832 (= res!698953 (bvsle lt!463673 i!1381))))

(assert (=> b!1049832 e!595674))

(declare-fun res!698959 () Bool)

(assert (=> b!1049832 (=> (not res!698959) (not e!595674))))

(assert (=> b!1049832 (= res!698959 (= (select (store (arr!31815 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463673) k!2747))))

(declare-fun b!1049833 () Bool)

(declare-fun res!698960 () Bool)

(assert (=> b!1049833 (=> (not res!698960) (not e!595677))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1049833 (= res!698960 (validKeyInArray!0 k!2747))))

(declare-fun b!1049834 () Bool)

(assert (=> b!1049834 (= e!595676 true)))

(declare-fun lt!463675 () Bool)

(assert (=> b!1049834 (= lt!463675 (contains!6120 Nil!22124 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1049835 () Bool)

(declare-fun res!698952 () Bool)

(assert (=> b!1049835 (=> (not res!698952) (not e!595677))))

(assert (=> b!1049835 (= res!698952 (= (select (arr!31815 a!3488) i!1381) k!2747))))

(declare-fun res!698957 () Bool)

(assert (=> start!92350 (=> (not res!698957) (not e!595677))))

(assert (=> start!92350 (= res!698957 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32351 a!3488)) (bvslt (size!32351 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92350 e!595677))

(assert (=> start!92350 true))

(declare-fun array_inv!24595 (array!66151) Bool)

(assert (=> start!92350 (array_inv!24595 a!3488)))

(declare-fun b!1049828 () Bool)

(declare-fun res!698962 () Bool)

(assert (=> b!1049828 (=> res!698962 e!595676)))

(declare-fun noDuplicate!1505 (List!22127) Bool)

(assert (=> b!1049828 (= res!698962 (not (noDuplicate!1505 Nil!22124)))))

(declare-fun b!1049836 () Bool)

(assert (=> b!1049836 (= e!595675 e!595676)))

(declare-fun res!698958 () Bool)

(assert (=> b!1049836 (=> res!698958 e!595676)))

(assert (=> b!1049836 (= res!698958 (bvsge (bvadd #b00000000000000000000000000000001 i!1381) (size!32351 a!3488)))))

(assert (=> b!1049836 (arrayContainsKey!0 a!3488 k!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-datatypes ((Unit!34350 0))(
  ( (Unit!34351) )
))
(declare-fun lt!463676 () Unit!34350)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66151 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34350)

(assert (=> b!1049836 (= lt!463676 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 lt!463673 (bvadd #b00000000000000000000000000000001 i!1381)))))

(declare-fun arrayNoDuplicates!0 (array!66151 (_ BitVec 32) List!22127) Bool)

(assert (=> b!1049836 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22124)))

(declare-fun lt!463674 () Unit!34350)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66151 (_ BitVec 32) (_ BitVec 32)) Unit!34350)

(assert (=> b!1049836 (= lt!463674 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1049837 () Bool)

(declare-fun res!698956 () Bool)

(assert (=> b!1049837 (=> (not res!698956) (not e!595677))))

(assert (=> b!1049837 (= res!698956 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22124))))

(assert (= (and start!92350 res!698957) b!1049837))

(assert (= (and b!1049837 res!698956) b!1049833))

(assert (= (and b!1049833 res!698960) b!1049835))

(assert (= (and b!1049835 res!698952) b!1049826))

(assert (= (and b!1049826 res!698961) b!1049831))

(assert (= (and b!1049831 res!698954) b!1049832))

(assert (= (and b!1049832 res!698959) b!1049829))

(assert (= (and b!1049829 (not res!698963)) b!1049827))

(assert (= (and b!1049832 (not res!698953)) b!1049836))

(assert (= (and b!1049836 (not res!698958)) b!1049828))

(assert (= (and b!1049828 (not res!698962)) b!1049830))

(assert (= (and b!1049830 (not res!698955)) b!1049834))

(declare-fun m!970545 () Bool)

(assert (=> start!92350 m!970545))

(declare-fun m!970547 () Bool)

(assert (=> b!1049832 m!970547))

(declare-fun m!970549 () Bool)

(assert (=> b!1049832 m!970549))

(declare-fun m!970551 () Bool)

(assert (=> b!1049837 m!970551))

(declare-fun m!970553 () Bool)

(assert (=> b!1049834 m!970553))

(declare-fun m!970555 () Bool)

(assert (=> b!1049831 m!970555))

(declare-fun m!970557 () Bool)

(assert (=> b!1049833 m!970557))

(declare-fun m!970559 () Bool)

(assert (=> b!1049828 m!970559))

(declare-fun m!970561 () Bool)

(assert (=> b!1049830 m!970561))

(declare-fun m!970563 () Bool)

(assert (=> b!1049836 m!970563))

(declare-fun m!970565 () Bool)

(assert (=> b!1049836 m!970565))

(declare-fun m!970567 () Bool)

(assert (=> b!1049836 m!970567))

(declare-fun m!970569 () Bool)

(assert (=> b!1049836 m!970569))

(declare-fun m!970571 () Bool)

(assert (=> b!1049827 m!970571))

(declare-fun m!970573 () Bool)

(assert (=> b!1049826 m!970573))

(assert (=> b!1049826 m!970547))

(declare-fun m!970575 () Bool)

(assert (=> b!1049835 m!970575))

(push 1)

(assert (not b!1049834))

(assert (not b!1049833))

(assert (not b!1049828))

(assert (not start!92350))

(assert (not b!1049830))

(assert (not b!1049826))

(assert (not b!1049836))

(assert (not b!1049831))

(assert (not b!1049827))

(assert (not b!1049837))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

