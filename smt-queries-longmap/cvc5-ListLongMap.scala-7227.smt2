; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92424 () Bool)

(assert start!92424)

(declare-fun b!1050835 () Bool)

(declare-fun e!596386 () Bool)

(declare-fun e!596385 () Bool)

(assert (=> b!1050835 (= e!596386 e!596385)))

(declare-fun res!699965 () Bool)

(assert (=> b!1050835 (=> (not res!699965) (not e!596385))))

(declare-datatypes ((array!66225 0))(
  ( (array!66226 (arr!31852 (Array (_ BitVec 32) (_ BitVec 64))) (size!32388 (_ BitVec 32))) )
))
(declare-fun lt!464088 () array!66225)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66225 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1050835 (= res!699965 (arrayContainsKey!0 lt!464088 k!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66225)

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1050835 (= lt!464088 (array!66226 (store (arr!31852 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32388 a!3488)))))

(declare-fun b!1050836 () Bool)

(declare-fun e!596384 () Bool)

(assert (=> b!1050836 (= e!596385 e!596384)))

(declare-fun res!699962 () Bool)

(assert (=> b!1050836 (=> (not res!699962) (not e!596384))))

(declare-fun lt!464087 () (_ BitVec 32))

(assert (=> b!1050836 (= res!699962 (not (= lt!464087 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66225 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1050836 (= lt!464087 (arrayScanForKey!0 lt!464088 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1050837 () Bool)

(assert (=> b!1050837 (= e!596384 (not true))))

(declare-fun e!596387 () Bool)

(assert (=> b!1050837 e!596387))

(declare-fun res!699963 () Bool)

(assert (=> b!1050837 (=> (not res!699963) (not e!596387))))

(assert (=> b!1050837 (= res!699963 (= (select (store (arr!31852 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464087) k!2747))))

(declare-fun b!1050838 () Bool)

(declare-fun e!596388 () Bool)

(assert (=> b!1050838 (= e!596388 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun b!1050839 () Bool)

(declare-fun res!699966 () Bool)

(assert (=> b!1050839 (=> (not res!699966) (not e!596386))))

(declare-datatypes ((List!22164 0))(
  ( (Nil!22161) (Cons!22160 (h!23369 (_ BitVec 64)) (t!31471 List!22164)) )
))
(declare-fun arrayNoDuplicates!0 (array!66225 (_ BitVec 32) List!22164) Bool)

(assert (=> b!1050839 (= res!699966 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22161))))

(declare-fun b!1050840 () Bool)

(declare-fun res!699961 () Bool)

(assert (=> b!1050840 (=> (not res!699961) (not e!596386))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1050840 (= res!699961 (validKeyInArray!0 k!2747))))

(declare-fun b!1050841 () Bool)

(assert (=> b!1050841 (= e!596387 e!596388)))

(declare-fun res!699964 () Bool)

(assert (=> b!1050841 (=> res!699964 e!596388)))

(assert (=> b!1050841 (= res!699964 (or (bvsgt lt!464087 i!1381) (bvsle i!1381 lt!464087)))))

(declare-fun b!1050842 () Bool)

(declare-fun res!699967 () Bool)

(assert (=> b!1050842 (=> (not res!699967) (not e!596386))))

(assert (=> b!1050842 (= res!699967 (= (select (arr!31852 a!3488) i!1381) k!2747))))

(declare-fun res!699968 () Bool)

(assert (=> start!92424 (=> (not res!699968) (not e!596386))))

(assert (=> start!92424 (= res!699968 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32388 a!3488)) (bvslt (size!32388 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92424 e!596386))

(assert (=> start!92424 true))

(declare-fun array_inv!24632 (array!66225) Bool)

(assert (=> start!92424 (array_inv!24632 a!3488)))

(assert (= (and start!92424 res!699968) b!1050839))

(assert (= (and b!1050839 res!699966) b!1050840))

(assert (= (and b!1050840 res!699961) b!1050842))

(assert (= (and b!1050842 res!699967) b!1050835))

(assert (= (and b!1050835 res!699965) b!1050836))

(assert (= (and b!1050836 res!699962) b!1050837))

(assert (= (and b!1050837 res!699963) b!1050841))

(assert (= (and b!1050841 (not res!699964)) b!1050838))

(declare-fun m!971465 () Bool)

(assert (=> b!1050839 m!971465))

(declare-fun m!971467 () Bool)

(assert (=> b!1050835 m!971467))

(declare-fun m!971469 () Bool)

(assert (=> b!1050835 m!971469))

(declare-fun m!971471 () Bool)

(assert (=> b!1050838 m!971471))

(assert (=> b!1050837 m!971469))

(declare-fun m!971473 () Bool)

(assert (=> b!1050837 m!971473))

(declare-fun m!971475 () Bool)

(assert (=> start!92424 m!971475))

(declare-fun m!971477 () Bool)

(assert (=> b!1050840 m!971477))

(declare-fun m!971479 () Bool)

(assert (=> b!1050836 m!971479))

(declare-fun m!971481 () Bool)

(assert (=> b!1050842 m!971481))

(push 1)

