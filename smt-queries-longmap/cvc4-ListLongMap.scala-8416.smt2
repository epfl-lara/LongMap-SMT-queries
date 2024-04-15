; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102432 () Bool)

(assert start!102432)

(declare-fun b!1232004 () Bool)

(declare-fun res!820419 () Bool)

(declare-fun e!698847 () Bool)

(assert (=> b!1232004 (=> (not res!820419) (not e!698847))))

(declare-datatypes ((array!79386 0))(
  ( (array!79387 (arr!38307 (Array (_ BitVec 32) (_ BitVec 64))) (size!38845 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79386)

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!79386 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1232004 (= res!820419 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1232005 () Bool)

(declare-fun res!820418 () Bool)

(assert (=> b!1232005 (=> (not res!820418) (not e!698847))))

(declare-datatypes ((List!27181 0))(
  ( (Nil!27178) (Cons!27177 (h!28386 (_ BitVec 64)) (t!40635 List!27181)) )
))
(declare-fun acc!823 () List!27181)

(declare-fun contains!7153 (List!27181 (_ BitVec 64)) Bool)

(assert (=> b!1232005 (= res!820418 (not (contains!7153 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1232006 () Bool)

(declare-fun res!820422 () Bool)

(assert (=> b!1232006 (=> (not res!820422) (not e!698847))))

(declare-fun noDuplicate!1796 (List!27181) Bool)

(assert (=> b!1232006 (= res!820422 (noDuplicate!1796 acc!823))))

(declare-fun b!1232007 () Bool)

(declare-fun res!820427 () Bool)

(assert (=> b!1232007 (=> (not res!820427) (not e!698847))))

(declare-fun arrayNoDuplicates!0 (array!79386 (_ BitVec 32) List!27181) Bool)

(assert (=> b!1232007 (= res!820427 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1232008 () Bool)

(declare-fun res!820426 () Bool)

(assert (=> b!1232008 (=> (not res!820426) (not e!698847))))

(assert (=> b!1232008 (= res!820426 (not (contains!7153 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!820424 () Bool)

(assert (=> start!102432 (=> (not res!820424) (not e!698847))))

(assert (=> start!102432 (= res!820424 (bvslt (size!38845 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102432 e!698847))

(declare-fun array_inv!29290 (array!79386) Bool)

(assert (=> start!102432 (array_inv!29290 a!3806)))

(assert (=> start!102432 true))

(declare-fun b!1232009 () Bool)

(declare-fun e!698848 () Bool)

(assert (=> b!1232009 (= e!698848 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27177 (select (arr!38307 a!3806) from!3184) Nil!27178)))))

(declare-fun b!1232010 () Bool)

(assert (=> b!1232010 (= e!698847 (not true))))

(assert (=> b!1232010 e!698848))

(declare-fun res!820421 () Bool)

(assert (=> b!1232010 (=> (not res!820421) (not e!698848))))

(assert (=> b!1232010 (= res!820421 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27178))))

(declare-datatypes ((Unit!40645 0))(
  ( (Unit!40646) )
))
(declare-fun lt!559307 () Unit!40645)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79386 List!27181 List!27181 (_ BitVec 32)) Unit!40645)

(assert (=> b!1232010 (= lt!559307 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27178 from!3184))))

(assert (=> b!1232010 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27177 (select (arr!38307 a!3806) from!3184) acc!823))))

(declare-fun b!1232011 () Bool)

(declare-fun res!820423 () Bool)

(assert (=> b!1232011 (=> (not res!820423) (not e!698847))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1232011 (= res!820423 (validKeyInArray!0 k!2913))))

(declare-fun b!1232012 () Bool)

(declare-fun res!820425 () Bool)

(assert (=> b!1232012 (=> (not res!820425) (not e!698847))))

(assert (=> b!1232012 (= res!820425 (validKeyInArray!0 (select (arr!38307 a!3806) from!3184)))))

(declare-fun b!1232013 () Bool)

(declare-fun res!820420 () Bool)

(assert (=> b!1232013 (=> (not res!820420) (not e!698847))))

(assert (=> b!1232013 (= res!820420 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38845 a!3806)) (bvslt from!3184 (size!38845 a!3806))))))

(assert (= (and start!102432 res!820424) b!1232011))

(assert (= (and b!1232011 res!820423) b!1232013))

(assert (= (and b!1232013 res!820420) b!1232006))

(assert (= (and b!1232006 res!820422) b!1232008))

(assert (= (and b!1232008 res!820426) b!1232005))

(assert (= (and b!1232005 res!820418) b!1232004))

(assert (= (and b!1232004 res!820419) b!1232007))

(assert (= (and b!1232007 res!820427) b!1232012))

(assert (= (and b!1232012 res!820425) b!1232010))

(assert (= (and b!1232010 res!820421) b!1232009))

(declare-fun m!1135613 () Bool)

(assert (=> start!102432 m!1135613))

(declare-fun m!1135615 () Bool)

(assert (=> b!1232005 m!1135615))

(declare-fun m!1135617 () Bool)

(assert (=> b!1232008 m!1135617))

(declare-fun m!1135619 () Bool)

(assert (=> b!1232006 m!1135619))

(declare-fun m!1135621 () Bool)

(assert (=> b!1232004 m!1135621))

(declare-fun m!1135623 () Bool)

(assert (=> b!1232007 m!1135623))

(declare-fun m!1135625 () Bool)

(assert (=> b!1232009 m!1135625))

(declare-fun m!1135627 () Bool)

(assert (=> b!1232009 m!1135627))

(declare-fun m!1135629 () Bool)

(assert (=> b!1232010 m!1135629))

(declare-fun m!1135631 () Bool)

(assert (=> b!1232010 m!1135631))

(assert (=> b!1232010 m!1135625))

(declare-fun m!1135633 () Bool)

(assert (=> b!1232010 m!1135633))

(declare-fun m!1135635 () Bool)

(assert (=> b!1232011 m!1135635))

(assert (=> b!1232012 m!1135625))

(assert (=> b!1232012 m!1135625))

(declare-fun m!1135637 () Bool)

(assert (=> b!1232012 m!1135637))

(push 1)

(assert (not start!102432))

(assert (not b!1232004))

(assert (not b!1232006))

(assert (not b!1232008))

(assert (not b!1232009))

(assert (not b!1232010))

(assert (not b!1232012))

(assert (not b!1232005))

(assert (not b!1232011))

(assert (not b!1232007))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

