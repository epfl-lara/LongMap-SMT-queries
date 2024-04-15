; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117044 () Bool)

(assert start!117044)

(declare-fun res!920554 () Bool)

(declare-fun e!780609 () Bool)

(assert (=> start!117044 (=> (not res!920554) (not e!780609))))

(declare-fun i!1451 () (_ BitVec 32))

(declare-datatypes ((array!93615 0))(
  ( (array!93616 (arr!45208 (Array (_ BitVec 32) (_ BitVec 64))) (size!45760 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93615)

(assert (=> start!117044 (= res!920554 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45760 a!4094))))))

(assert (=> start!117044 e!780609))

(assert (=> start!117044 true))

(declare-fun array_inv!34441 (array!93615) Bool)

(assert (=> start!117044 (array_inv!34441 a!4094)))

(declare-fun b!1377976 () Bool)

(declare-fun res!920553 () Bool)

(assert (=> b!1377976 (=> (not res!920553) (not e!780609))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377976 (= res!920553 (validKeyInArray!0 (select (arr!45208 a!4094) i!1451)))))

(declare-fun b!1377977 () Bool)

(declare-fun res!920555 () Bool)

(assert (=> b!1377977 (=> (not res!920555) (not e!780609))))

(declare-fun k0!2953 () (_ BitVec 64))

(assert (=> b!1377977 (= res!920555 (not (validKeyInArray!0 k0!2953)))))

(declare-fun b!1377978 () Bool)

(declare-fun from!3466 () (_ BitVec 32))

(assert (=> b!1377978 (= e!780609 (and (bvslt (size!45760 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45760 a!4094)) (bvsge i!1451 from!3466) (bvsgt from!3466 (bvadd #b00000000000000000000000000000001 i!1451))))))

(assert (= (and start!117044 res!920554) b!1377976))

(assert (= (and b!1377976 res!920553) b!1377977))

(assert (= (and b!1377977 res!920555) b!1377978))

(declare-fun m!1261989 () Bool)

(assert (=> start!117044 m!1261989))

(declare-fun m!1261991 () Bool)

(assert (=> b!1377976 m!1261991))

(assert (=> b!1377976 m!1261991))

(declare-fun m!1261993 () Bool)

(assert (=> b!1377976 m!1261993))

(declare-fun m!1261995 () Bool)

(assert (=> b!1377977 m!1261995))

(check-sat (not b!1377976) (not start!117044) (not b!1377977))
(check-sat)
