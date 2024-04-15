; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36524 () Bool)

(assert start!36524)

(declare-fun b!364787 () Bool)

(declare-fun res!203995 () Bool)

(declare-fun e!223281 () Bool)

(assert (=> b!364787 (=> (not res!203995) (not e!223281))))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20779 0))(
  ( (array!20780 (arr!9867 (Array (_ BitVec 32) (_ BitVec 64))) (size!10220 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20779)

(assert (=> b!364787 (= res!203995 (and (bvslt (size!10220 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10220 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!364785 () Bool)

(declare-fun res!203992 () Bool)

(assert (=> b!364785 (=> (not res!203992) (not e!223281))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364785 (= res!203992 (not (validKeyInArray!0 (select (arr!9867 a!4289) i!1472))))))

(declare-fun res!203993 () Bool)

(assert (=> start!36524 (=> (not res!203993) (not e!223281))))

(assert (=> start!36524 (= res!203993 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10220 a!4289))))))

(assert (=> start!36524 e!223281))

(assert (=> start!36524 true))

(declare-fun array_inv!7316 (array!20779) Bool)

(assert (=> start!36524 (array_inv!7316 a!4289)))

(declare-fun b!364786 () Bool)

(declare-fun res!203994 () Bool)

(assert (=> b!364786 (=> (not res!203994) (not e!223281))))

(declare-fun k!2974 () (_ BitVec 64))

(assert (=> b!364786 (= res!203994 (validKeyInArray!0 k!2974))))

(declare-fun b!364788 () Bool)

(assert (=> b!364788 (= e!223281 false)))

(declare-fun lt!168903 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20779 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364788 (= lt!168903 (arrayCountValidKeys!0 (array!20780 (store (arr!9867 a!4289) i!1472 k!2974) (size!10220 a!4289)) from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!168904 () (_ BitVec 32))

(assert (=> b!364788 (= lt!168904 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (= (and start!36524 res!203993) b!364785))

(assert (= (and b!364785 res!203992) b!364786))

(assert (= (and b!364786 res!203994) b!364787))

(assert (= (and b!364787 res!203995) b!364788))

(declare-fun m!362171 () Bool)

(assert (=> b!364785 m!362171))

(assert (=> b!364785 m!362171))

(declare-fun m!362173 () Bool)

(assert (=> b!364785 m!362173))

(declare-fun m!362175 () Bool)

(assert (=> start!36524 m!362175))

(declare-fun m!362177 () Bool)

(assert (=> b!364786 m!362177))

(declare-fun m!362179 () Bool)

(assert (=> b!364788 m!362179))

(declare-fun m!362181 () Bool)

(assert (=> b!364788 m!362181))

(declare-fun m!362183 () Bool)

(assert (=> b!364788 m!362183))

(push 1)

(assert (not b!364788))

(assert (not start!36524))

(assert (not b!364785))

(assert (not b!364786))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

