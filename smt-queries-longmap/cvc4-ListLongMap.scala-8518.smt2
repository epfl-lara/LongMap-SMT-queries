; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103908 () Bool)

(assert start!103908)

(declare-fun b!1243720 () Bool)

(declare-fun e!705010 () Bool)

(assert (=> b!1243720 (= e!705010 false)))

(declare-datatypes ((array!80000 0))(
  ( (array!80001 (arr!38593 (Array (_ BitVec 32) (_ BitVec 64))) (size!39129 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80000)

(declare-fun from!3270 () (_ BitVec 32))

(declare-datatypes ((List!27396 0))(
  ( (Nil!27393) (Cons!27392 (h!28601 (_ BitVec 64)) (t!40865 List!27396)) )
))
(declare-fun lt!562464 () List!27396)

(declare-fun lt!562465 () Bool)

(declare-fun arrayNoDuplicates!0 (array!80000 (_ BitVec 32) List!27396) Bool)

(assert (=> b!1243720 (= lt!562465 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) lt!562464))))

(declare-datatypes ((Unit!41295 0))(
  ( (Unit!41296) )
))
(declare-fun lt!562466 () Unit!41295)

(declare-fun noDuplicateSubseq!97 (List!27396 List!27396) Unit!41295)

(assert (=> b!1243720 (= lt!562466 (noDuplicateSubseq!97 Nil!27393 lt!562464))))

(declare-fun b!1243721 () Bool)

(declare-fun res!829504 () Bool)

(assert (=> b!1243721 (=> (not res!829504) (not e!705010))))

(declare-fun contains!7417 (List!27396 (_ BitVec 64)) Bool)

(assert (=> b!1243721 (= res!829504 (not (contains!7417 Nil!27393 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!829507 () Bool)

(declare-fun e!705012 () Bool)

(assert (=> start!103908 (=> (not res!829507) (not e!705012))))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> start!103908 (= res!829507 (and (bvslt (size!39129 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39129 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39129 a!3892))))))

(assert (=> start!103908 e!705012))

(declare-fun array_inv!29441 (array!80000) Bool)

(assert (=> start!103908 (array_inv!29441 a!3892)))

(assert (=> start!103908 true))

(declare-fun b!1243722 () Bool)

(declare-fun res!829499 () Bool)

(assert (=> b!1243722 (=> (not res!829499) (not e!705010))))

(assert (=> b!1243722 (= res!829499 (not (contains!7417 lt!562464 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243723 () Bool)

(declare-fun res!829505 () Bool)

(assert (=> b!1243723 (=> (not res!829505) (not e!705010))))

(assert (=> b!1243723 (= res!829505 (not (contains!7417 lt!562464 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243724 () Bool)

(declare-fun res!829501 () Bool)

(assert (=> b!1243724 (=> (not res!829501) (not e!705012))))

(assert (=> b!1243724 (= res!829501 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39129 a!3892)) (not (= newFrom!287 (size!39129 a!3892)))))))

(declare-fun b!1243725 () Bool)

(declare-fun res!829498 () Bool)

(assert (=> b!1243725 (=> (not res!829498) (not e!705010))))

(declare-fun noDuplicate!1995 (List!27396) Bool)

(assert (=> b!1243725 (= res!829498 (noDuplicate!1995 lt!562464))))

(declare-fun b!1243726 () Bool)

(declare-fun res!829502 () Bool)

(assert (=> b!1243726 (=> (not res!829502) (not e!705012))))

(assert (=> b!1243726 (= res!829502 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27393))))

(declare-fun b!1243727 () Bool)

(assert (=> b!1243727 (= e!705012 e!705010)))

(declare-fun res!829506 () Bool)

(assert (=> b!1243727 (=> (not res!829506) (not e!705010))))

(assert (=> b!1243727 (= res!829506 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000))))

(assert (=> b!1243727 (= lt!562464 (Cons!27392 (select (arr!38593 a!3892) from!3270) Nil!27393))))

(declare-fun b!1243728 () Bool)

(declare-fun res!829500 () Bool)

(assert (=> b!1243728 (=> (not res!829500) (not e!705010))))

(declare-fun subseq!643 (List!27396 List!27396) Bool)

(assert (=> b!1243728 (= res!829500 (subseq!643 Nil!27393 lt!562464))))

(declare-fun b!1243729 () Bool)

(declare-fun res!829497 () Bool)

(assert (=> b!1243729 (=> (not res!829497) (not e!705012))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1243729 (= res!829497 (validKeyInArray!0 (select (arr!38593 a!3892) from!3270)))))

(declare-fun b!1243730 () Bool)

(declare-fun res!829503 () Bool)

(assert (=> b!1243730 (=> (not res!829503) (not e!705010))))

(assert (=> b!1243730 (= res!829503 (not (contains!7417 Nil!27393 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!103908 res!829507) b!1243726))

(assert (= (and b!1243726 res!829502) b!1243724))

(assert (= (and b!1243724 res!829501) b!1243729))

(assert (= (and b!1243729 res!829497) b!1243727))

(assert (= (and b!1243727 res!829506) b!1243725))

(assert (= (and b!1243725 res!829498) b!1243723))

(assert (= (and b!1243723 res!829505) b!1243722))

(assert (= (and b!1243722 res!829499) b!1243730))

(assert (= (and b!1243730 res!829503) b!1243721))

(assert (= (and b!1243721 res!829504) b!1243728))

(assert (= (and b!1243728 res!829500) b!1243720))

(declare-fun m!1146203 () Bool)

(assert (=> b!1243722 m!1146203))

(declare-fun m!1146205 () Bool)

(assert (=> b!1243727 m!1146205))

(declare-fun m!1146207 () Bool)

(assert (=> b!1243725 m!1146207))

(declare-fun m!1146209 () Bool)

(assert (=> b!1243728 m!1146209))

(declare-fun m!1146211 () Bool)

(assert (=> b!1243730 m!1146211))

(declare-fun m!1146213 () Bool)

(assert (=> b!1243726 m!1146213))

(declare-fun m!1146215 () Bool)

(assert (=> start!103908 m!1146215))

(declare-fun m!1146217 () Bool)

(assert (=> b!1243723 m!1146217))

(declare-fun m!1146219 () Bool)

(assert (=> b!1243720 m!1146219))

(declare-fun m!1146221 () Bool)

(assert (=> b!1243720 m!1146221))

(declare-fun m!1146223 () Bool)

(assert (=> b!1243721 m!1146223))

(assert (=> b!1243729 m!1146205))

(assert (=> b!1243729 m!1146205))

(declare-fun m!1146225 () Bool)

(assert (=> b!1243729 m!1146225))

(push 1)

(assert (not b!1243725))

(assert (not b!1243720))

(assert (not b!1243721))

(assert (not b!1243722))

