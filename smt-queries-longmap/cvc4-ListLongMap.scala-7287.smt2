; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93118 () Bool)

(assert start!93118)

(declare-fun b!1056241 () Bool)

(declare-fun res!705025 () Bool)

(declare-fun e!600447 () Bool)

(assert (=> b!1056241 (=> (not res!705025) (not e!600447))))

(declare-datatypes ((array!66616 0))(
  ( (array!66617 (arr!32034 (Array (_ BitVec 32) (_ BitVec 64))) (size!32570 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66616)

(declare-datatypes ((List!22346 0))(
  ( (Nil!22343) (Cons!22342 (h!23551 (_ BitVec 64)) (t!31653 List!22346)) )
))
(declare-fun arrayNoDuplicates!0 (array!66616 (_ BitVec 32) List!22346) Bool)

(assert (=> b!1056241 (= res!705025 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22343))))

(declare-fun b!1056242 () Bool)

(declare-fun res!705019 () Bool)

(assert (=> b!1056242 (=> (not res!705019) (not e!600447))))

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1056242 (= res!705019 (= (select (arr!32034 a!3488) i!1381) k!2747))))

(declare-fun b!1056243 () Bool)

(declare-fun e!600444 () Bool)

(declare-fun arrayContainsKey!0 (array!66616 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1056243 (= e!600444 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun b!1056244 () Bool)

(declare-fun e!600445 () Bool)

(assert (=> b!1056244 (= e!600445 e!600444)))

(declare-fun res!705024 () Bool)

(assert (=> b!1056244 (=> res!705024 e!600444)))

(declare-fun lt!466064 () (_ BitVec 32))

(assert (=> b!1056244 (= res!705024 (or (bvsgt lt!466064 i!1381) (bvsle i!1381 lt!466064)))))

(declare-fun res!705021 () Bool)

(assert (=> start!93118 (=> (not res!705021) (not e!600447))))

(assert (=> start!93118 (= res!705021 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32570 a!3488)) (bvslt (size!32570 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93118 e!600447))

(assert (=> start!93118 true))

(declare-fun array_inv!24814 (array!66616) Bool)

(assert (=> start!93118 (array_inv!24814 a!3488)))

(declare-fun b!1056245 () Bool)

(declare-fun e!600443 () Bool)

(assert (=> b!1056245 (= e!600447 e!600443)))

(declare-fun res!705023 () Bool)

(assert (=> b!1056245 (=> (not res!705023) (not e!600443))))

(declare-fun lt!466065 () array!66616)

(assert (=> b!1056245 (= res!705023 (arrayContainsKey!0 lt!466065 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1056245 (= lt!466065 (array!66617 (store (arr!32034 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32570 a!3488)))))

(declare-fun b!1056246 () Bool)

(declare-fun res!705026 () Bool)

(assert (=> b!1056246 (=> (not res!705026) (not e!600447))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1056246 (= res!705026 (validKeyInArray!0 k!2747))))

(declare-fun b!1056247 () Bool)

(declare-fun e!600446 () Bool)

(assert (=> b!1056247 (= e!600443 e!600446)))

(declare-fun res!705022 () Bool)

(assert (=> b!1056247 (=> (not res!705022) (not e!600446))))

(assert (=> b!1056247 (= res!705022 (not (= lt!466064 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66616 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1056247 (= lt!466064 (arrayScanForKey!0 lt!466065 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1056248 () Bool)

(assert (=> b!1056248 (= e!600446 (not true))))

(assert (=> b!1056248 e!600445))

(declare-fun res!705020 () Bool)

(assert (=> b!1056248 (=> (not res!705020) (not e!600445))))

(assert (=> b!1056248 (= res!705020 (= (select (store (arr!32034 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466064) k!2747))))

(assert (= (and start!93118 res!705021) b!1056241))

(assert (= (and b!1056241 res!705025) b!1056246))

(assert (= (and b!1056246 res!705026) b!1056242))

(assert (= (and b!1056242 res!705019) b!1056245))

(assert (= (and b!1056245 res!705023) b!1056247))

(assert (= (and b!1056247 res!705022) b!1056248))

(assert (= (and b!1056248 res!705020) b!1056244))

(assert (= (and b!1056244 (not res!705024)) b!1056243))

(declare-fun m!976151 () Bool)

(assert (=> b!1056245 m!976151))

(declare-fun m!976153 () Bool)

(assert (=> b!1056245 m!976153))

(declare-fun m!976155 () Bool)

(assert (=> b!1056247 m!976155))

(declare-fun m!976157 () Bool)

(assert (=> b!1056241 m!976157))

(assert (=> b!1056248 m!976153))

(declare-fun m!976159 () Bool)

(assert (=> b!1056248 m!976159))

(declare-fun m!976161 () Bool)

(assert (=> b!1056243 m!976161))

(declare-fun m!976163 () Bool)

(assert (=> b!1056246 m!976163))

(declare-fun m!976165 () Bool)

(assert (=> b!1056242 m!976165))

(declare-fun m!976167 () Bool)

(assert (=> start!93118 m!976167))

(push 1)

(assert (not b!1056241))

(assert (not start!93118))

