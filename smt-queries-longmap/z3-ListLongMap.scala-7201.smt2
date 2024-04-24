; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92502 () Bool)

(assert start!92502)

(declare-fun res!698254 () Bool)

(declare-fun e!595637 () Bool)

(assert (=> start!92502 (=> (not res!698254) (not e!595637))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66118 0))(
  ( (array!66119 (arr!31792 (Array (_ BitVec 32) (_ BitVec 64))) (size!32329 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66118)

(assert (=> start!92502 (= res!698254 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32329 a!3488)) (bvslt (size!32329 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92502 e!595637))

(assert (=> start!92502 true))

(declare-fun array_inv!24574 (array!66118) Bool)

(assert (=> start!92502 (array_inv!24574 a!3488)))

(declare-fun b!1049927 () Bool)

(declare-fun e!595634 () Bool)

(assert (=> b!1049927 (= e!595634 (not true))))

(declare-fun e!595638 () Bool)

(assert (=> b!1049927 e!595638))

(declare-fun res!698253 () Bool)

(assert (=> b!1049927 (=> (not res!698253) (not e!595638))))

(declare-fun lt!463756 () (_ BitVec 32))

(declare-fun k0!2747 () (_ BitVec 64))

(assert (=> b!1049927 (= res!698253 (= (select (store (arr!31792 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463756) k0!2747))))

(declare-fun b!1049928 () Bool)

(declare-fun res!698255 () Bool)

(assert (=> b!1049928 (=> (not res!698255) (not e!595637))))

(assert (=> b!1049928 (= res!698255 (= (select (arr!31792 a!3488) i!1381) k0!2747))))

(declare-fun b!1049929 () Bool)

(declare-fun e!595639 () Bool)

(assert (=> b!1049929 (= e!595638 e!595639)))

(declare-fun res!698252 () Bool)

(assert (=> b!1049929 (=> res!698252 e!595639)))

(assert (=> b!1049929 (= res!698252 (bvsle lt!463756 i!1381))))

(declare-fun b!1049930 () Bool)

(declare-fun arrayContainsKey!0 (array!66118 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1049930 (= e!595639 (arrayContainsKey!0 a!3488 k0!2747 lt!463756))))

(declare-fun b!1049931 () Bool)

(declare-fun res!698249 () Bool)

(assert (=> b!1049931 (=> (not res!698249) (not e!595637))))

(declare-datatypes ((List!22074 0))(
  ( (Nil!22071) (Cons!22070 (h!23288 (_ BitVec 64)) (t!31373 List!22074)) )
))
(declare-fun arrayNoDuplicates!0 (array!66118 (_ BitVec 32) List!22074) Bool)

(assert (=> b!1049931 (= res!698249 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22071))))

(declare-fun b!1049932 () Bool)

(declare-fun e!595636 () Bool)

(assert (=> b!1049932 (= e!595636 e!595634)))

(declare-fun res!698250 () Bool)

(assert (=> b!1049932 (=> (not res!698250) (not e!595634))))

(assert (=> b!1049932 (= res!698250 (not (= lt!463756 i!1381)))))

(declare-fun lt!463757 () array!66118)

(declare-fun arrayScanForKey!0 (array!66118 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1049932 (= lt!463756 (arrayScanForKey!0 lt!463757 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1049933 () Bool)

(declare-fun res!698248 () Bool)

(assert (=> b!1049933 (=> (not res!698248) (not e!595637))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1049933 (= res!698248 (validKeyInArray!0 k0!2747))))

(declare-fun b!1049934 () Bool)

(assert (=> b!1049934 (= e!595637 e!595636)))

(declare-fun res!698251 () Bool)

(assert (=> b!1049934 (=> (not res!698251) (not e!595636))))

(assert (=> b!1049934 (= res!698251 (arrayContainsKey!0 lt!463757 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1049934 (= lt!463757 (array!66119 (store (arr!31792 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32329 a!3488)))))

(assert (= (and start!92502 res!698254) b!1049931))

(assert (= (and b!1049931 res!698249) b!1049933))

(assert (= (and b!1049933 res!698248) b!1049928))

(assert (= (and b!1049928 res!698255) b!1049934))

(assert (= (and b!1049934 res!698251) b!1049932))

(assert (= (and b!1049932 res!698250) b!1049927))

(assert (= (and b!1049927 res!698253) b!1049929))

(assert (= (and b!1049929 (not res!698252)) b!1049930))

(declare-fun m!971207 () Bool)

(assert (=> b!1049927 m!971207))

(declare-fun m!971209 () Bool)

(assert (=> b!1049927 m!971209))

(declare-fun m!971211 () Bool)

(assert (=> b!1049928 m!971211))

(declare-fun m!971213 () Bool)

(assert (=> start!92502 m!971213))

(declare-fun m!971215 () Bool)

(assert (=> b!1049934 m!971215))

(assert (=> b!1049934 m!971207))

(declare-fun m!971217 () Bool)

(assert (=> b!1049931 m!971217))

(declare-fun m!971219 () Bool)

(assert (=> b!1049932 m!971219))

(declare-fun m!971221 () Bool)

(assert (=> b!1049933 m!971221))

(declare-fun m!971223 () Bool)

(assert (=> b!1049930 m!971223))

(check-sat (not b!1049932) (not b!1049933) (not start!92502) (not b!1049934) (not b!1049931) (not b!1049930))
(check-sat)
