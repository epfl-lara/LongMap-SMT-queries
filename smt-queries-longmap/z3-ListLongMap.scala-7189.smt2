; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92370 () Bool)

(assert start!92370)

(declare-fun res!697688 () Bool)

(declare-fun e!595152 () Bool)

(assert (=> start!92370 (=> (not res!697688) (not e!595152))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66037 0))(
  ( (array!66038 (arr!31756 (Array (_ BitVec 32) (_ BitVec 64))) (size!32293 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66037)

(assert (=> start!92370 (= res!697688 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32293 a!3488)) (bvslt (size!32293 a!3488) #b01111111111111111111111111111111) (bvsle #b00000000000000000000000000000000 (size!32293 a!3488))))))

(assert (=> start!92370 e!595152))

(assert (=> start!92370 true))

(declare-fun array_inv!24538 (array!66037) Bool)

(assert (=> start!92370 (array_inv!24538 a!3488)))

(declare-fun b!1049331 () Bool)

(declare-datatypes ((List!22038 0))(
  ( (Nil!22035) (Cons!22034 (h!23252 (_ BitVec 64)) (t!31337 List!22038)) )
))
(declare-fun noDuplicate!1501 (List!22038) Bool)

(assert (=> b!1049331 (= e!595152 (not (noDuplicate!1501 Nil!22035)))))

(assert (= (and start!92370 res!697688) b!1049331))

(declare-fun m!970721 () Bool)

(assert (=> start!92370 m!970721))

(declare-fun m!970723 () Bool)

(assert (=> b!1049331 m!970723))

(check-sat (not start!92370) (not b!1049331))
(check-sat)
(get-model)

(declare-fun d!128065 () Bool)

(assert (=> d!128065 (= (array_inv!24538 a!3488) (bvsge (size!32293 a!3488) #b00000000000000000000000000000000))))

(assert (=> start!92370 d!128065))

(declare-fun d!128067 () Bool)

(declare-fun res!697699 () Bool)

(declare-fun e!595170 () Bool)

(assert (=> d!128067 (=> res!697699 e!595170)))

(get-info :version)

(assert (=> d!128067 (= res!697699 ((_ is Nil!22035) Nil!22035))))

(assert (=> d!128067 (= (noDuplicate!1501 Nil!22035) e!595170)))

(declare-fun b!1049342 () Bool)

(declare-fun e!595171 () Bool)

(assert (=> b!1049342 (= e!595170 e!595171)))

(declare-fun res!697700 () Bool)

(assert (=> b!1049342 (=> (not res!697700) (not e!595171))))

(declare-fun contains!6123 (List!22038 (_ BitVec 64)) Bool)

(assert (=> b!1049342 (= res!697700 (not (contains!6123 (t!31337 Nil!22035) (h!23252 Nil!22035))))))

(declare-fun b!1049343 () Bool)

(assert (=> b!1049343 (= e!595171 (noDuplicate!1501 (t!31337 Nil!22035)))))

(assert (= (and d!128067 (not res!697699)) b!1049342))

(assert (= (and b!1049342 res!697700) b!1049343))

(declare-fun m!970733 () Bool)

(assert (=> b!1049342 m!970733))

(declare-fun m!970735 () Bool)

(assert (=> b!1049343 m!970735))

(assert (=> b!1049331 d!128067))

(check-sat (not b!1049343) (not b!1049342))
(check-sat)
