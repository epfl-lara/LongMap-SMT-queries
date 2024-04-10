; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92490 () Bool)

(assert start!92490)

(declare-fun b!1051761 () Bool)

(declare-fun res!700894 () Bool)

(declare-fun e!597079 () Bool)

(assert (=> b!1051761 (=> res!700894 e!597079)))

(declare-datatypes ((List!22197 0))(
  ( (Nil!22194) (Cons!22193 (h!23402 (_ BitVec 64)) (t!31504 List!22197)) )
))
(declare-fun contains!6139 (List!22197 (_ BitVec 64)) Bool)

(assert (=> b!1051761 (= res!700894 (contains!6139 Nil!22194 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!700897 () Bool)

(declare-fun e!597078 () Bool)

(assert (=> start!92490 (=> (not res!700897) (not e!597078))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66291 0))(
  ( (array!66292 (arr!31885 (Array (_ BitVec 32) (_ BitVec 64))) (size!32421 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66291)

(assert (=> start!92490 (= res!700897 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32421 a!3488)) (bvslt (size!32421 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92490 e!597078))

(assert (=> start!92490 true))

(declare-fun array_inv!24665 (array!66291) Bool)

(assert (=> start!92490 (array_inv!24665 a!3488)))

(declare-fun b!1051762 () Bool)

(declare-fun e!597076 () Bool)

(declare-fun e!597077 () Bool)

(assert (=> b!1051762 (= e!597076 (not e!597077))))

(declare-fun res!700898 () Bool)

(assert (=> b!1051762 (=> res!700898 e!597077)))

(declare-fun lt!464424 () (_ BitVec 32))

(assert (=> b!1051762 (= res!700898 (or (bvsgt lt!464424 i!1381) (bvsle i!1381 lt!464424)))))

(declare-fun e!597074 () Bool)

(assert (=> b!1051762 e!597074))

(declare-fun res!700895 () Bool)

(assert (=> b!1051762 (=> (not res!700895) (not e!597074))))

(declare-fun k!2747 () (_ BitVec 64))

(assert (=> b!1051762 (= res!700895 (= (select (store (arr!31885 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464424) k!2747))))

(declare-fun b!1051763 () Bool)

(declare-fun res!700889 () Bool)

(assert (=> b!1051763 (=> (not res!700889) (not e!597078))))

(assert (=> b!1051763 (= res!700889 (= (select (arr!31885 a!3488) i!1381) k!2747))))

(declare-fun b!1051764 () Bool)

(declare-fun e!597075 () Bool)

(declare-fun arrayContainsKey!0 (array!66291 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1051764 (= e!597075 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun b!1051765 () Bool)

(declare-fun e!597072 () Bool)

(assert (=> b!1051765 (= e!597078 e!597072)))

(declare-fun res!700893 () Bool)

(assert (=> b!1051765 (=> (not res!700893) (not e!597072))))

(declare-fun lt!464423 () array!66291)

(assert (=> b!1051765 (= res!700893 (arrayContainsKey!0 lt!464423 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1051765 (= lt!464423 (array!66292 (store (arr!31885 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32421 a!3488)))))

(declare-fun b!1051766 () Bool)

(assert (=> b!1051766 (= e!597079 true)))

(declare-fun lt!464420 () Bool)

(assert (=> b!1051766 (= lt!464420 (contains!6139 Nil!22194 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1051767 () Bool)

(assert (=> b!1051767 (= e!597072 e!597076)))

(declare-fun res!700896 () Bool)

(assert (=> b!1051767 (=> (not res!700896) (not e!597076))))

(assert (=> b!1051767 (= res!700896 (not (= lt!464424 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66291 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1051767 (= lt!464424 (arrayScanForKey!0 lt!464423 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1051768 () Bool)

(declare-fun res!700887 () Bool)

(assert (=> b!1051768 (=> res!700887 e!597079)))

(declare-fun noDuplicate!1524 (List!22197) Bool)

(assert (=> b!1051768 (= res!700887 (not (noDuplicate!1524 Nil!22194)))))

(declare-fun b!1051769 () Bool)

(assert (=> b!1051769 (= e!597074 e!597075)))

(declare-fun res!700892 () Bool)

(assert (=> b!1051769 (=> res!700892 e!597075)))

(assert (=> b!1051769 (= res!700892 (or (bvsgt lt!464424 i!1381) (bvsle i!1381 lt!464424)))))

(declare-fun b!1051770 () Bool)

(assert (=> b!1051770 (= e!597077 e!597079)))

(declare-fun res!700888 () Bool)

(assert (=> b!1051770 (=> res!700888 e!597079)))

(declare-fun lt!464419 () (_ BitVec 32))

(assert (=> b!1051770 (= res!700888 (or (bvslt lt!464424 #b00000000000000000000000000000000) (bvsge lt!464419 (size!32421 a!3488)) (bvsge lt!464424 (size!32421 a!3488))))))

(assert (=> b!1051770 (arrayContainsKey!0 a!3488 k!2747 lt!464419)))

(declare-datatypes ((Unit!34442 0))(
  ( (Unit!34443) )
))
(declare-fun lt!464422 () Unit!34442)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66291 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34442)

(assert (=> b!1051770 (= lt!464422 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 i!1381 lt!464419))))

(assert (=> b!1051770 (= lt!464419 (bvadd #b00000000000000000000000000000001 lt!464424))))

(declare-fun arrayNoDuplicates!0 (array!66291 (_ BitVec 32) List!22197) Bool)

(assert (=> b!1051770 (arrayNoDuplicates!0 a!3488 lt!464424 Nil!22194)))

(declare-fun lt!464421 () Unit!34442)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66291 (_ BitVec 32) (_ BitVec 32)) Unit!34442)

(assert (=> b!1051770 (= lt!464421 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!464424))))

(declare-fun b!1051771 () Bool)

(declare-fun res!700890 () Bool)

(assert (=> b!1051771 (=> (not res!700890) (not e!597078))))

(assert (=> b!1051771 (= res!700890 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22194))))

(declare-fun b!1051772 () Bool)

(declare-fun res!700891 () Bool)

(assert (=> b!1051772 (=> (not res!700891) (not e!597078))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1051772 (= res!700891 (validKeyInArray!0 k!2747))))

(assert (= (and start!92490 res!700897) b!1051771))

(assert (= (and b!1051771 res!700890) b!1051772))

(assert (= (and b!1051772 res!700891) b!1051763))

(assert (= (and b!1051763 res!700889) b!1051765))

(assert (= (and b!1051765 res!700893) b!1051767))

(assert (= (and b!1051767 res!700896) b!1051762))

(assert (= (and b!1051762 res!700895) b!1051769))

(assert (= (and b!1051769 (not res!700892)) b!1051764))

(assert (= (and b!1051762 (not res!700898)) b!1051770))

(assert (= (and b!1051770 (not res!700888)) b!1051768))

(assert (= (and b!1051768 (not res!700887)) b!1051761))

(assert (= (and b!1051761 (not res!700894)) b!1051766))

(declare-fun m!972215 () Bool)

(assert (=> b!1051768 m!972215))

(declare-fun m!972217 () Bool)

(assert (=> b!1051761 m!972217))

(declare-fun m!972219 () Bool)

(assert (=> b!1051763 m!972219))

(declare-fun m!972221 () Bool)

(assert (=> b!1051765 m!972221))

(declare-fun m!972223 () Bool)

(assert (=> b!1051765 m!972223))

(declare-fun m!972225 () Bool)

(assert (=> b!1051770 m!972225))

(declare-fun m!972227 () Bool)

(assert (=> b!1051770 m!972227))

(declare-fun m!972229 () Bool)

(assert (=> b!1051770 m!972229))

(declare-fun m!972231 () Bool)

(assert (=> b!1051770 m!972231))

(declare-fun m!972233 () Bool)

(assert (=> start!92490 m!972233))

(declare-fun m!972235 () Bool)

(assert (=> b!1051771 m!972235))

(declare-fun m!972237 () Bool)

(assert (=> b!1051766 m!972237))

(assert (=> b!1051762 m!972223))

(declare-fun m!972239 () Bool)

(assert (=> b!1051762 m!972239))

(declare-fun m!972241 () Bool)

(assert (=> b!1051764 m!972241))

(declare-fun m!972243 () Bool)

(assert (=> b!1051772 m!972243))

(declare-fun m!972245 () Bool)

(assert (=> b!1051767 m!972245))

(push 1)

