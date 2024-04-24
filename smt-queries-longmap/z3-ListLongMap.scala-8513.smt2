; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104092 () Bool)

(assert start!104092)

(declare-fun res!829485 () Bool)

(declare-fun e!705678 () Bool)

(assert (=> start!104092 (=> (not res!829485) (not e!705678))))

(declare-datatypes ((array!79998 0))(
  ( (array!79999 (arr!38588 (Array (_ BitVec 32) (_ BitVec 64))) (size!39125 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!79998)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104092 (= res!829485 (and (bvslt (size!39125 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39125 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39125 a!3892))))))

(assert (=> start!104092 e!705678))

(declare-fun array_inv!29526 (array!79998) Bool)

(assert (=> start!104092 (array_inv!29526 a!3892)))

(assert (=> start!104092 true))

(declare-fun b!1244497 () Bool)

(declare-fun res!829484 () Bool)

(assert (=> b!1244497 (=> (not res!829484) (not e!705678))))

(declare-datatypes ((List!27404 0))(
  ( (Nil!27401) (Cons!27400 (h!28618 (_ BitVec 64)) (t!40865 List!27404)) )
))
(declare-fun noDuplicate!1996 (List!27404) Bool)

(assert (=> b!1244497 (= res!829484 (noDuplicate!1996 Nil!27401))))

(declare-fun b!1244498 () Bool)

(declare-fun e!705679 () Bool)

(assert (=> b!1244498 (= e!705678 e!705679)))

(declare-fun res!829483 () Bool)

(assert (=> b!1244498 (=> res!829483 e!705679)))

(declare-fun contains!7434 (List!27404 (_ BitVec 64)) Bool)

(assert (=> b!1244498 (= res!829483 (contains!7434 Nil!27401 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1244499 () Bool)

(assert (=> b!1244499 (= e!705679 (contains!7434 Nil!27401 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!104092 res!829485) b!1244497))

(assert (= (and b!1244497 res!829484) b!1244498))

(assert (= (and b!1244498 (not res!829483)) b!1244499))

(declare-fun m!1147441 () Bool)

(assert (=> start!104092 m!1147441))

(declare-fun m!1147443 () Bool)

(assert (=> b!1244497 m!1147443))

(declare-fun m!1147445 () Bool)

(assert (=> b!1244498 m!1147445))

(declare-fun m!1147447 () Bool)

(assert (=> b!1244499 m!1147447))

(check-sat (not b!1244498) (not b!1244497) (not b!1244499) (not start!104092))
(check-sat)
(get-model)

(declare-fun d!137529 () Bool)

(declare-fun lt!562808 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!607 (List!27404) (InoxSet (_ BitVec 64)))

(assert (=> d!137529 (= lt!562808 (select (content!607 Nil!27401) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!705703 () Bool)

(assert (=> d!137529 (= lt!562808 e!705703)))

(declare-fun res!829508 () Bool)

(assert (=> d!137529 (=> (not res!829508) (not e!705703))))

(get-info :version)

(assert (=> d!137529 (= res!829508 ((_ is Cons!27400) Nil!27401))))

(assert (=> d!137529 (= (contains!7434 Nil!27401 #b0000000000000000000000000000000000000000000000000000000000000000) lt!562808)))

(declare-fun b!1244522 () Bool)

(declare-fun e!705704 () Bool)

(assert (=> b!1244522 (= e!705703 e!705704)))

(declare-fun res!829509 () Bool)

(assert (=> b!1244522 (=> res!829509 e!705704)))

(assert (=> b!1244522 (= res!829509 (= (h!28618 Nil!27401) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1244523 () Bool)

(assert (=> b!1244523 (= e!705704 (contains!7434 (t!40865 Nil!27401) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137529 res!829508) b!1244522))

(assert (= (and b!1244522 (not res!829509)) b!1244523))

(declare-fun m!1147465 () Bool)

(assert (=> d!137529 m!1147465))

(declare-fun m!1147467 () Bool)

(assert (=> d!137529 m!1147467))

(declare-fun m!1147469 () Bool)

(assert (=> b!1244523 m!1147469))

(assert (=> b!1244498 d!137529))

(declare-fun d!137533 () Bool)

(declare-fun res!829520 () Bool)

(declare-fun e!705715 () Bool)

(assert (=> d!137533 (=> res!829520 e!705715)))

(assert (=> d!137533 (= res!829520 ((_ is Nil!27401) Nil!27401))))

(assert (=> d!137533 (= (noDuplicate!1996 Nil!27401) e!705715)))

(declare-fun b!1244534 () Bool)

(declare-fun e!705716 () Bool)

(assert (=> b!1244534 (= e!705715 e!705716)))

(declare-fun res!829521 () Bool)

(assert (=> b!1244534 (=> (not res!829521) (not e!705716))))

(assert (=> b!1244534 (= res!829521 (not (contains!7434 (t!40865 Nil!27401) (h!28618 Nil!27401))))))

(declare-fun b!1244535 () Bool)

(assert (=> b!1244535 (= e!705716 (noDuplicate!1996 (t!40865 Nil!27401)))))

(assert (= (and d!137533 (not res!829520)) b!1244534))

(assert (= (and b!1244534 res!829521) b!1244535))

(declare-fun m!1147477 () Bool)

(assert (=> b!1244534 m!1147477))

(declare-fun m!1147479 () Bool)

(assert (=> b!1244535 m!1147479))

(assert (=> b!1244497 d!137533))

(declare-fun d!137539 () Bool)

(declare-fun lt!562813 () Bool)

(assert (=> d!137539 (= lt!562813 (select (content!607 Nil!27401) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!705719 () Bool)

(assert (=> d!137539 (= lt!562813 e!705719)))

(declare-fun res!829524 () Bool)

(assert (=> d!137539 (=> (not res!829524) (not e!705719))))

(assert (=> d!137539 (= res!829524 ((_ is Cons!27400) Nil!27401))))

(assert (=> d!137539 (= (contains!7434 Nil!27401 #b1000000000000000000000000000000000000000000000000000000000000000) lt!562813)))

(declare-fun b!1244538 () Bool)

(declare-fun e!705720 () Bool)

(assert (=> b!1244538 (= e!705719 e!705720)))

(declare-fun res!829525 () Bool)

(assert (=> b!1244538 (=> res!829525 e!705720)))

(assert (=> b!1244538 (= res!829525 (= (h!28618 Nil!27401) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1244539 () Bool)

(assert (=> b!1244539 (= e!705720 (contains!7434 (t!40865 Nil!27401) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137539 res!829524) b!1244538))

(assert (= (and b!1244538 (not res!829525)) b!1244539))

(assert (=> d!137539 m!1147465))

(declare-fun m!1147485 () Bool)

(assert (=> d!137539 m!1147485))

(declare-fun m!1147487 () Bool)

(assert (=> b!1244539 m!1147487))

(assert (=> b!1244499 d!137539))

(declare-fun d!137543 () Bool)

(assert (=> d!137543 (= (array_inv!29526 a!3892) (bvsge (size!39125 a!3892) #b00000000000000000000000000000000))))

(assert (=> start!104092 d!137543))

(check-sat (not b!1244534) (not d!137539) (not b!1244535) (not b!1244523) (not b!1244539) (not d!137529))
(check-sat)
