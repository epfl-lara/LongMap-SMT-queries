; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92368 () Bool)

(assert start!92368)

(declare-fun b!1050150 () Bool)

(declare-fun res!699277 () Bool)

(declare-fun e!595891 () Bool)

(assert (=> b!1050150 (=> (not res!699277) (not e!595891))))

(declare-datatypes ((array!66169 0))(
  ( (array!66170 (arr!31824 (Array (_ BitVec 32) (_ BitVec 64))) (size!32360 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66169)

(declare-datatypes ((List!22136 0))(
  ( (Nil!22133) (Cons!22132 (h!23341 (_ BitVec 64)) (t!31443 List!22136)) )
))
(declare-fun arrayNoDuplicates!0 (array!66169 (_ BitVec 32) List!22136) Bool)

(assert (=> b!1050150 (= res!699277 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22133))))

(declare-fun b!1050151 () Bool)

(declare-fun res!699285 () Bool)

(declare-fun e!595890 () Bool)

(assert (=> b!1050151 (=> res!699285 e!595890)))

(declare-fun contains!6129 (List!22136 (_ BitVec 64)) Bool)

(assert (=> b!1050151 (= res!699285 (contains!6129 Nil!22133 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1050152 () Bool)

(declare-fun e!595894 () Bool)

(declare-fun e!595887 () Bool)

(assert (=> b!1050152 (= e!595894 (not e!595887))))

(declare-fun res!699280 () Bool)

(assert (=> b!1050152 (=> res!699280 e!595887)))

(declare-fun lt!463812 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1050152 (= res!699280 (bvsle lt!463812 i!1381))))

(declare-fun e!595888 () Bool)

(assert (=> b!1050152 e!595888))

(declare-fun res!699281 () Bool)

(assert (=> b!1050152 (=> (not res!699281) (not e!595888))))

(declare-fun k!2747 () (_ BitVec 64))

(assert (=> b!1050152 (= res!699281 (= (select (store (arr!31824 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463812) k!2747))))

(declare-fun b!1050153 () Bool)

(declare-fun e!595889 () Bool)

(declare-fun arrayContainsKey!0 (array!66169 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1050153 (= e!595889 (arrayContainsKey!0 a!3488 k!2747 lt!463812))))

(declare-fun b!1050154 () Bool)

(declare-fun e!595893 () Bool)

(assert (=> b!1050154 (= e!595893 e!595894)))

(declare-fun res!699282 () Bool)

(assert (=> b!1050154 (=> (not res!699282) (not e!595894))))

(assert (=> b!1050154 (= res!699282 (not (= lt!463812 i!1381)))))

(declare-fun lt!463810 () array!66169)

(declare-fun arrayScanForKey!0 (array!66169 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1050154 (= lt!463812 (arrayScanForKey!0 lt!463810 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1050155 () Bool)

(assert (=> b!1050155 (= e!595891 e!595893)))

(declare-fun res!699279 () Bool)

(assert (=> b!1050155 (=> (not res!699279) (not e!595893))))

(assert (=> b!1050155 (= res!699279 (arrayContainsKey!0 lt!463810 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1050155 (= lt!463810 (array!66170 (store (arr!31824 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32360 a!3488)))))

(declare-fun b!1050156 () Bool)

(declare-fun res!699284 () Bool)

(assert (=> b!1050156 (=> res!699284 e!595890)))

(declare-fun noDuplicate!1514 (List!22136) Bool)

(assert (=> b!1050156 (= res!699284 (not (noDuplicate!1514 Nil!22133)))))

(declare-fun res!699283 () Bool)

(assert (=> start!92368 (=> (not res!699283) (not e!595891))))

(assert (=> start!92368 (= res!699283 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32360 a!3488)) (bvslt (size!32360 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92368 e!595891))

(assert (=> start!92368 true))

(declare-fun array_inv!24604 (array!66169) Bool)

(assert (=> start!92368 (array_inv!24604 a!3488)))

(declare-fun b!1050157 () Bool)

(assert (=> b!1050157 (= e!595887 e!595890)))

(declare-fun res!699287 () Bool)

(assert (=> b!1050157 (=> res!699287 e!595890)))

(assert (=> b!1050157 (= res!699287 (bvsge (bvadd #b00000000000000000000000000000001 i!1381) (size!32360 a!3488)))))

(assert (=> b!1050157 (arrayContainsKey!0 a!3488 k!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-datatypes ((Unit!34368 0))(
  ( (Unit!34369) )
))
(declare-fun lt!463808 () Unit!34368)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66169 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34368)

(assert (=> b!1050157 (= lt!463808 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 lt!463812 (bvadd #b00000000000000000000000000000001 i!1381)))))

(assert (=> b!1050157 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22133)))

(declare-fun lt!463809 () Unit!34368)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66169 (_ BitVec 32) (_ BitVec 32)) Unit!34368)

(assert (=> b!1050157 (= lt!463809 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1050158 () Bool)

(declare-fun res!699276 () Bool)

(assert (=> b!1050158 (=> (not res!699276) (not e!595891))))

(assert (=> b!1050158 (= res!699276 (= (select (arr!31824 a!3488) i!1381) k!2747))))

(declare-fun b!1050159 () Bool)

(assert (=> b!1050159 (= e!595890 true)))

(declare-fun lt!463811 () Bool)

(assert (=> b!1050159 (= lt!463811 (contains!6129 Nil!22133 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1050160 () Bool)

(assert (=> b!1050160 (= e!595888 e!595889)))

(declare-fun res!699278 () Bool)

(assert (=> b!1050160 (=> res!699278 e!595889)))

(assert (=> b!1050160 (= res!699278 (bvsle lt!463812 i!1381))))

(declare-fun b!1050161 () Bool)

(declare-fun res!699286 () Bool)

(assert (=> b!1050161 (=> (not res!699286) (not e!595891))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1050161 (= res!699286 (validKeyInArray!0 k!2747))))

(assert (= (and start!92368 res!699283) b!1050150))

(assert (= (and b!1050150 res!699277) b!1050161))

(assert (= (and b!1050161 res!699286) b!1050158))

(assert (= (and b!1050158 res!699276) b!1050155))

(assert (= (and b!1050155 res!699279) b!1050154))

(assert (= (and b!1050154 res!699282) b!1050152))

(assert (= (and b!1050152 res!699281) b!1050160))

(assert (= (and b!1050160 (not res!699278)) b!1050153))

(assert (= (and b!1050152 (not res!699280)) b!1050157))

(assert (= (and b!1050157 (not res!699287)) b!1050156))

(assert (= (and b!1050156 (not res!699284)) b!1050151))

(assert (= (and b!1050151 (not res!699285)) b!1050159))

(declare-fun m!970833 () Bool)

(assert (=> b!1050155 m!970833))

(declare-fun m!970835 () Bool)

(assert (=> b!1050155 m!970835))

(declare-fun m!970837 () Bool)

(assert (=> b!1050158 m!970837))

(assert (=> b!1050152 m!970835))

(declare-fun m!970839 () Bool)

(assert (=> b!1050152 m!970839))

(declare-fun m!970841 () Bool)

(assert (=> b!1050153 m!970841))

(declare-fun m!970843 () Bool)

(assert (=> b!1050159 m!970843))

(declare-fun m!970845 () Bool)

(assert (=> b!1050157 m!970845))

(declare-fun m!970847 () Bool)

(assert (=> b!1050157 m!970847))

(declare-fun m!970849 () Bool)

(assert (=> b!1050157 m!970849))

(declare-fun m!970851 () Bool)

(assert (=> b!1050157 m!970851))

(declare-fun m!970853 () Bool)

(assert (=> b!1050156 m!970853))

(declare-fun m!970855 () Bool)

(assert (=> b!1050161 m!970855))

(declare-fun m!970857 () Bool)

(assert (=> b!1050151 m!970857))

(declare-fun m!970859 () Bool)

(assert (=> b!1050154 m!970859))

(declare-fun m!970861 () Bool)

(assert (=> start!92368 m!970861))

(declare-fun m!970863 () Bool)

(assert (=> b!1050150 m!970863))

(push 1)

(assert (not b!1050156))

(assert (not b!1050155))

(assert (not b!1050151))

(assert (not b!1050154))

(assert (not b!1050157))

(assert (not b!1050150))

(assert (not b!1050153))

(assert (not b!1050159))

(assert (not b!1050161))

(assert (not start!92368))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

