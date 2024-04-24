; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60390 () Bool)

(assert start!60390)

(declare-fun b!678040 () Bool)

(declare-fun res!444355 () Bool)

(declare-fun e!386463 () Bool)

(assert (=> b!678040 (=> (not res!444355) (not e!386463))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39375 0))(
  ( (array!39376 (arr!18877 (Array (_ BitVec 32) (_ BitVec 64))) (size!19241 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39375)

(assert (=> b!678040 (= res!444355 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19241 a!3626))))))

(declare-fun b!678041 () Bool)

(declare-fun res!444366 () Bool)

(assert (=> b!678041 (=> (not res!444366) (not e!386463))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39375 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!678041 (= res!444366 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!678042 () Bool)

(declare-fun res!444361 () Bool)

(assert (=> b!678042 (=> (not res!444361) (not e!386463))))

(declare-datatypes ((List!12825 0))(
  ( (Nil!12822) (Cons!12821 (h!13869 (_ BitVec 64)) (t!19045 List!12825)) )
))
(declare-fun arrayNoDuplicates!0 (array!39375 (_ BitVec 32) List!12825) Bool)

(assert (=> b!678042 (= res!444361 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12822))))

(declare-fun b!678043 () Bool)

(declare-fun res!444356 () Bool)

(assert (=> b!678043 (=> (not res!444356) (not e!386463))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!678043 (= res!444356 (validKeyInArray!0 k0!2843))))

(declare-fun b!678044 () Bool)

(declare-fun res!444360 () Bool)

(assert (=> b!678044 (=> (not res!444360) (not e!386463))))

(declare-fun acc!681 () List!12825)

(declare-fun noDuplicate!751 (List!12825) Bool)

(assert (=> b!678044 (= res!444360 (noDuplicate!751 acc!681))))

(declare-fun b!678045 () Bool)

(declare-fun res!444357 () Bool)

(assert (=> b!678045 (=> (not res!444357) (not e!386463))))

(declare-fun contains!3477 (List!12825 (_ BitVec 64)) Bool)

(assert (=> b!678045 (= res!444357 (not (contains!3477 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!444367 () Bool)

(assert (=> start!60390 (=> (not res!444367) (not e!386463))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!60390 (= res!444367 (and (bvslt (size!19241 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19241 a!3626))))))

(assert (=> start!60390 e!386463))

(assert (=> start!60390 true))

(declare-fun array_inv!14736 (array!39375) Bool)

(assert (=> start!60390 (array_inv!14736 a!3626)))

(declare-fun b!678046 () Bool)

(declare-fun e!386462 () Bool)

(declare-fun e!386466 () Bool)

(assert (=> b!678046 (= e!386462 e!386466)))

(declare-fun res!444362 () Bool)

(assert (=> b!678046 (=> (not res!444362) (not e!386466))))

(assert (=> b!678046 (= res!444362 (bvsle from!3004 i!1382))))

(declare-fun b!678047 () Bool)

(declare-fun e!386465 () Bool)

(assert (=> b!678047 (= e!386465 (contains!3477 acc!681 k0!2843))))

(declare-fun b!678048 () Bool)

(declare-fun res!444365 () Bool)

(assert (=> b!678048 (=> (not res!444365) (not e!386463))))

(assert (=> b!678048 (= res!444365 e!386462)))

(declare-fun res!444364 () Bool)

(assert (=> b!678048 (=> res!444364 e!386462)))

(assert (=> b!678048 (= res!444364 e!386465)))

(declare-fun res!444359 () Bool)

(assert (=> b!678048 (=> (not res!444359) (not e!386465))))

(assert (=> b!678048 (= res!444359 (bvsgt from!3004 i!1382))))

(declare-fun b!678049 () Bool)

(assert (=> b!678049 (= e!386463 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19241 a!3626)) (bvsgt from!3004 (size!19241 a!3626))))))

(declare-fun b!678050 () Bool)

(assert (=> b!678050 (= e!386466 (not (contains!3477 acc!681 k0!2843)))))

(declare-fun b!678051 () Bool)

(declare-fun res!444358 () Bool)

(assert (=> b!678051 (=> (not res!444358) (not e!386463))))

(assert (=> b!678051 (= res!444358 (not (contains!3477 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!678052 () Bool)

(declare-fun res!444363 () Bool)

(assert (=> b!678052 (=> (not res!444363) (not e!386463))))

(assert (=> b!678052 (= res!444363 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(assert (= (and start!60390 res!444367) b!678044))

(assert (= (and b!678044 res!444360) b!678051))

(assert (= (and b!678051 res!444358) b!678045))

(assert (= (and b!678045 res!444357) b!678048))

(assert (= (and b!678048 res!444359) b!678047))

(assert (= (and b!678048 (not res!444364)) b!678046))

(assert (= (and b!678046 res!444362) b!678050))

(assert (= (and b!678048 res!444365) b!678042))

(assert (= (and b!678042 res!444361) b!678052))

(assert (= (and b!678052 res!444363) b!678040))

(assert (= (and b!678040 res!444355) b!678043))

(assert (= (and b!678043 res!444356) b!678041))

(assert (= (and b!678041 res!444366) b!678049))

(declare-fun m!644605 () Bool)

(assert (=> b!678050 m!644605))

(declare-fun m!644607 () Bool)

(assert (=> b!678045 m!644607))

(declare-fun m!644609 () Bool)

(assert (=> b!678044 m!644609))

(declare-fun m!644611 () Bool)

(assert (=> b!678042 m!644611))

(declare-fun m!644613 () Bool)

(assert (=> b!678051 m!644613))

(declare-fun m!644615 () Bool)

(assert (=> b!678043 m!644615))

(declare-fun m!644617 () Bool)

(assert (=> b!678052 m!644617))

(assert (=> b!678047 m!644605))

(declare-fun m!644619 () Bool)

(assert (=> start!60390 m!644619))

(declare-fun m!644621 () Bool)

(assert (=> b!678041 m!644621))

(check-sat (not b!678044) (not start!60390) (not b!678050) (not b!678047) (not b!678043) (not b!678052) (not b!678041) (not b!678042) (not b!678051) (not b!678045))
(check-sat)
