; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62348 () Bool)

(assert start!62348)

(declare-fun b!698170 () Bool)

(declare-fun e!396875 () Bool)

(assert (=> b!698170 (= e!396875 false)))

(declare-fun lt!317016 () Bool)

(declare-datatypes ((List!13255 0))(
  ( (Nil!13252) (Cons!13251 (h!14296 (_ BitVec 64)) (t!19528 List!13255)) )
))
(declare-fun acc!652 () List!13255)

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun contains!3777 (List!13255 (_ BitVec 64)) Bool)

(assert (=> b!698170 (= lt!317016 (contains!3777 acc!652 k0!2824))))

(declare-fun b!698171 () Bool)

(declare-fun res!462144 () Bool)

(assert (=> b!698171 (=> (not res!462144) (not e!396875))))

(assert (=> b!698171 (= res!462144 (not (contains!3777 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!698172 () Bool)

(declare-fun res!462141 () Bool)

(assert (=> b!698172 (=> (not res!462141) (not e!396875))))

(declare-fun newAcc!49 () List!13255)

(declare-fun noDuplicate!1046 (List!13255) Bool)

(assert (=> b!698172 (= res!462141 (noDuplicate!1046 newAcc!49))))

(declare-fun b!698173 () Bool)

(declare-fun res!462143 () Bool)

(assert (=> b!698173 (=> (not res!462143) (not e!396875))))

(declare-datatypes ((array!40038 0))(
  ( (array!40039 (arr!19175 (Array (_ BitVec 32) (_ BitVec 64))) (size!19557 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40038)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!40038 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!698173 (= res!462143 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!698174 () Bool)

(declare-fun res!462140 () Bool)

(assert (=> b!698174 (=> (not res!462140) (not e!396875))))

(assert (=> b!698174 (= res!462140 (noDuplicate!1046 acc!652))))

(declare-fun b!698175 () Bool)

(declare-fun res!462142 () Bool)

(assert (=> b!698175 (=> (not res!462142) (not e!396875))))

(assert (=> b!698175 (= res!462142 (not (contains!3777 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!462145 () Bool)

(assert (=> start!62348 (=> (not res!462145) (not e!396875))))

(assert (=> start!62348 (= res!462145 (and (bvslt (size!19557 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19557 a!3591))))))

(assert (=> start!62348 e!396875))

(assert (=> start!62348 true))

(declare-fun array_inv!15058 (array!40038) Bool)

(assert (=> start!62348 (array_inv!15058 a!3591)))

(assert (= (and start!62348 res!462145) b!698174))

(assert (= (and b!698174 res!462140) b!698172))

(assert (= (and b!698172 res!462141) b!698175))

(assert (= (and b!698175 res!462142) b!698171))

(assert (= (and b!698171 res!462144) b!698173))

(assert (= (and b!698173 res!462143) b!698170))

(declare-fun m!657951 () Bool)

(assert (=> b!698175 m!657951))

(declare-fun m!657953 () Bool)

(assert (=> b!698172 m!657953))

(declare-fun m!657955 () Bool)

(assert (=> b!698170 m!657955))

(declare-fun m!657957 () Bool)

(assert (=> b!698174 m!657957))

(declare-fun m!657959 () Bool)

(assert (=> start!62348 m!657959))

(declare-fun m!657961 () Bool)

(assert (=> b!698173 m!657961))

(declare-fun m!657963 () Bool)

(assert (=> b!698171 m!657963))

(check-sat (not b!698170) (not b!698171) (not b!698173) (not b!698175) (not b!698174) (not start!62348) (not b!698172))
(check-sat)
