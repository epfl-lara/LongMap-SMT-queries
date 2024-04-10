; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103842 () Bool)

(assert start!103842)

(declare-fun res!828925 () Bool)

(declare-fun e!704783 () Bool)

(assert (=> start!103842 (=> (not res!828925) (not e!704783))))

(declare-datatypes ((array!79955 0))(
  ( (array!79956 (arr!38573 (Array (_ BitVec 32) (_ BitVec 64))) (size!39109 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!79955)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!103842 (= res!828925 (and (bvslt (size!39109 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39109 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39109 a!3892))))))

(assert (=> start!103842 e!704783))

(declare-fun array_inv!29421 (array!79955) Bool)

(assert (=> start!103842 (array_inv!29421 a!3892)))

(assert (=> start!103842 true))

(declare-fun b!1243148 () Bool)

(declare-datatypes ((List!27376 0))(
  ( (Nil!27373) (Cons!27372 (h!28581 (_ BitVec 64)) (t!40845 List!27376)) )
))
(declare-fun noDuplicate!1975 (List!27376) Bool)

(assert (=> b!1243148 (= e!704783 (not (noDuplicate!1975 Nil!27373)))))

(assert (= (and start!103842 res!828925) b!1243148))

(declare-fun m!1145785 () Bool)

(assert (=> start!103842 m!1145785))

(declare-fun m!1145787 () Bool)

(assert (=> b!1243148 m!1145787))

(push 1)

(assert (not start!103842))

(assert (not b!1243148))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

