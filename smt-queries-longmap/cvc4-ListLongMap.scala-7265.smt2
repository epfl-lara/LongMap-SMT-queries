; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92776 () Bool)

(assert start!92776)

(declare-fun b!1053841 () Bool)

(declare-fun e!598587 () Bool)

(declare-fun e!598588 () Bool)

(assert (=> b!1053841 (= e!598587 e!598588)))

(declare-fun res!702829 () Bool)

(assert (=> b!1053841 (=> (not res!702829) (not e!598588))))

(declare-fun lt!465233 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1053841 (= res!702829 (not (= lt!465233 i!1381)))))

(declare-datatypes ((array!66469 0))(
  ( (array!66470 (arr!31968 (Array (_ BitVec 32) (_ BitVec 64))) (size!32504 (_ BitVec 32))) )
))
(declare-fun lt!465234 () array!66469)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66469 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1053841 (= lt!465233 (arrayScanForKey!0 lt!465234 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1053842 () Bool)

(declare-fun res!702828 () Bool)

(declare-fun e!598589 () Bool)

(assert (=> b!1053842 (=> (not res!702828) (not e!598589))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1053842 (= res!702828 (validKeyInArray!0 k!2747))))

(declare-fun b!1053843 () Bool)

(declare-fun res!702827 () Bool)

(assert (=> b!1053843 (=> (not res!702827) (not e!598589))))

(declare-fun a!3488 () array!66469)

(declare-datatypes ((List!22280 0))(
  ( (Nil!22277) (Cons!22276 (h!23485 (_ BitVec 64)) (t!31587 List!22280)) )
))
(declare-fun arrayNoDuplicates!0 (array!66469 (_ BitVec 32) List!22280) Bool)

(assert (=> b!1053843 (= res!702827 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22277))))

(declare-fun b!1053844 () Bool)

(assert (=> b!1053844 (= e!598589 e!598587)))

(declare-fun res!702826 () Bool)

(assert (=> b!1053844 (=> (not res!702826) (not e!598587))))

(declare-fun arrayContainsKey!0 (array!66469 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1053844 (= res!702826 (arrayContainsKey!0 lt!465234 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1053844 (= lt!465234 (array!66470 (store (arr!31968 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32504 a!3488)))))

(declare-fun res!702823 () Bool)

(assert (=> start!92776 (=> (not res!702823) (not e!598589))))

(assert (=> start!92776 (= res!702823 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32504 a!3488)) (bvslt (size!32504 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92776 e!598589))

(assert (=> start!92776 true))

(declare-fun array_inv!24748 (array!66469) Bool)

(assert (=> start!92776 (array_inv!24748 a!3488)))

(declare-fun b!1053845 () Bool)

(declare-fun res!702824 () Bool)

(assert (=> b!1053845 (=> (not res!702824) (not e!598589))))

(assert (=> b!1053845 (= res!702824 (= (select (arr!31968 a!3488) i!1381) k!2747))))

(declare-fun b!1053846 () Bool)

(declare-fun e!598591 () Bool)

(assert (=> b!1053846 (= e!598591 (arrayContainsKey!0 a!3488 k!2747 lt!465233))))

(declare-fun b!1053847 () Bool)

(assert (=> b!1053847 (= e!598588 (not (or (bvsle lt!465233 i!1381) (bvsgt #b00000000000000000000000000000000 (size!32504 a!3488)) (bvsle i!1381 (size!32504 a!3488)))))))

(declare-fun e!598586 () Bool)

(assert (=> b!1053847 e!598586))

(declare-fun res!702825 () Bool)

(assert (=> b!1053847 (=> (not res!702825) (not e!598586))))

(assert (=> b!1053847 (= res!702825 (= (select (store (arr!31968 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465233) k!2747))))

(declare-fun b!1053848 () Bool)

(assert (=> b!1053848 (= e!598586 e!598591)))

(declare-fun res!702830 () Bool)

(assert (=> b!1053848 (=> res!702830 e!598591)))

(assert (=> b!1053848 (= res!702830 (bvsle lt!465233 i!1381))))

(assert (= (and start!92776 res!702823) b!1053843))

(assert (= (and b!1053843 res!702827) b!1053842))

(assert (= (and b!1053842 res!702828) b!1053845))

(assert (= (and b!1053845 res!702824) b!1053844))

(assert (= (and b!1053844 res!702826) b!1053841))

(assert (= (and b!1053841 res!702829) b!1053847))

(assert (= (and b!1053847 res!702825) b!1053848))

(assert (= (and b!1053848 (not res!702830)) b!1053846))

(declare-fun m!974027 () Bool)

(assert (=> b!1053843 m!974027))

(declare-fun m!974029 () Bool)

(assert (=> b!1053844 m!974029))

(declare-fun m!974031 () Bool)

(assert (=> b!1053844 m!974031))

(declare-fun m!974033 () Bool)

(assert (=> b!1053845 m!974033))

(declare-fun m!974035 () Bool)

(assert (=> b!1053842 m!974035))

(declare-fun m!974037 () Bool)

(assert (=> b!1053841 m!974037))

(declare-fun m!974039 () Bool)

(assert (=> b!1053846 m!974039))

(assert (=> b!1053847 m!974031))

(declare-fun m!974041 () Bool)

(assert (=> b!1053847 m!974041))

(declare-fun m!974043 () Bool)

(assert (=> start!92776 m!974043))

(push 1)

(assert (not b!1053843))

(assert (not b!1053842))

(assert (not b!1053846))

(assert (not b!1053841))

(assert (not b!1053844))

(assert (not start!92776))

(check-sat)

(pop 1)

(push 1)

(check-sat)

