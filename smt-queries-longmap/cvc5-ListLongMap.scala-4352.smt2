; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60202 () Bool)

(assert start!60202)

(declare-fun b!671572 () Bool)

(declare-fun res!438170 () Bool)

(declare-fun e!383839 () Bool)

(assert (=> b!671572 (=> (not res!438170) (not e!383839))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39187 0))(
  ( (array!39188 (arr!18783 (Array (_ BitVec 32) (_ BitVec 64))) (size!19147 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39187)

(assert (=> b!671572 (= res!438170 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19147 a!3626))))))

(declare-fun b!671573 () Bool)

(declare-fun res!438166 () Bool)

(assert (=> b!671573 (=> (not res!438166) (not e!383839))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!671573 (= res!438166 (validKeyInArray!0 k!2843))))

(declare-fun b!671574 () Bool)

(declare-fun res!438167 () Bool)

(assert (=> b!671574 (=> (not res!438167) (not e!383839))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!671574 (= res!438167 (validKeyInArray!0 (select (arr!18783 a!3626) from!3004)))))

(declare-fun b!671575 () Bool)

(declare-fun e!383838 () Bool)

(declare-datatypes ((List!12731 0))(
  ( (Nil!12728) (Cons!12727 (h!13775 (_ BitVec 64)) (t!18951 List!12731)) )
))
(declare-fun acc!681 () List!12731)

(declare-fun contains!3383 (List!12731 (_ BitVec 64)) Bool)

(assert (=> b!671575 (= e!383838 (not (contains!3383 acc!681 k!2843)))))

(declare-fun b!671576 () Bool)

(declare-fun res!438162 () Bool)

(assert (=> b!671576 (=> (not res!438162) (not e!383839))))

(assert (=> b!671576 (= res!438162 (not (contains!3383 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!671577 () Bool)

(declare-fun res!438157 () Bool)

(assert (=> b!671577 (=> (not res!438157) (not e!383839))))

(declare-fun arrayContainsKey!0 (array!39187 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!671577 (= res!438157 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!671578 () Bool)

(declare-fun e!383840 () Bool)

(assert (=> b!671578 (= e!383840 e!383838)))

(declare-fun res!438160 () Bool)

(assert (=> b!671578 (=> (not res!438160) (not e!383838))))

(assert (=> b!671578 (= res!438160 (bvsle from!3004 i!1382))))

(declare-fun b!671579 () Bool)

(assert (=> b!671579 (= e!383839 (not true))))

(assert (=> b!671579 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun b!671580 () Bool)

(declare-fun res!438161 () Bool)

(assert (=> b!671580 (=> (not res!438161) (not e!383839))))

(declare-fun noDuplicate!657 (List!12731) Bool)

(assert (=> b!671580 (= res!438161 (noDuplicate!657 acc!681))))

(declare-fun b!671581 () Bool)

(declare-fun e!383841 () Bool)

(assert (=> b!671581 (= e!383841 (contains!3383 acc!681 k!2843))))

(declare-fun b!671582 () Bool)

(declare-fun res!438165 () Bool)

(assert (=> b!671582 (=> (not res!438165) (not e!383839))))

(declare-fun arrayNoDuplicates!0 (array!39187 (_ BitVec 32) List!12731) Bool)

(assert (=> b!671582 (= res!438165 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12728))))

(declare-fun res!438164 () Bool)

(assert (=> start!60202 (=> (not res!438164) (not e!383839))))

(assert (=> start!60202 (= res!438164 (and (bvslt (size!19147 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19147 a!3626))))))

(assert (=> start!60202 e!383839))

(assert (=> start!60202 true))

(declare-fun array_inv!14642 (array!39187) Bool)

(assert (=> start!60202 (array_inv!14642 a!3626)))

(declare-fun b!671583 () Bool)

(declare-fun res!438172 () Bool)

(assert (=> b!671583 (=> (not res!438172) (not e!383839))))

(assert (=> b!671583 (= res!438172 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19147 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!671584 () Bool)

(declare-fun res!438169 () Bool)

(assert (=> b!671584 (=> (not res!438169) (not e!383839))))

(assert (=> b!671584 (= res!438169 (= (select (arr!18783 a!3626) from!3004) k!2843))))

(declare-fun b!671585 () Bool)

(declare-fun res!438158 () Bool)

(assert (=> b!671585 (=> (not res!438158) (not e!383839))))

(assert (=> b!671585 (= res!438158 (not (contains!3383 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!671586 () Bool)

(declare-fun res!438159 () Bool)

(assert (=> b!671586 (=> (not res!438159) (not e!383839))))

(assert (=> b!671586 (= res!438159 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!671587 () Bool)

(declare-fun res!438168 () Bool)

(assert (=> b!671587 (=> (not res!438168) (not e!383839))))

(assert (=> b!671587 (= res!438168 e!383840)))

(declare-fun res!438163 () Bool)

(assert (=> b!671587 (=> res!438163 e!383840)))

(assert (=> b!671587 (= res!438163 e!383841)))

(declare-fun res!438171 () Bool)

(assert (=> b!671587 (=> (not res!438171) (not e!383841))))

(assert (=> b!671587 (= res!438171 (bvsgt from!3004 i!1382))))

(assert (= (and start!60202 res!438164) b!671580))

(assert (= (and b!671580 res!438161) b!671585))

(assert (= (and b!671585 res!438158) b!671576))

(assert (= (and b!671576 res!438162) b!671587))

(assert (= (and b!671587 res!438171) b!671581))

(assert (= (and b!671587 (not res!438163)) b!671578))

(assert (= (and b!671578 res!438160) b!671575))

(assert (= (and b!671587 res!438168) b!671582))

(assert (= (and b!671582 res!438165) b!671586))

(assert (= (and b!671586 res!438159) b!671572))

(assert (= (and b!671572 res!438170) b!671573))

(assert (= (and b!671573 res!438166) b!671577))

(assert (= (and b!671577 res!438157) b!671583))

(assert (= (and b!671583 res!438172) b!671574))

(assert (= (and b!671574 res!438167) b!671584))

(assert (= (and b!671584 res!438169) b!671579))

(declare-fun m!641575 () Bool)

(assert (=> b!671574 m!641575))

(assert (=> b!671574 m!641575))

(declare-fun m!641577 () Bool)

(assert (=> b!671574 m!641577))

(declare-fun m!641579 () Bool)

(assert (=> b!671586 m!641579))

(declare-fun m!641581 () Bool)

(assert (=> b!671581 m!641581))

(assert (=> b!671584 m!641575))

(assert (=> b!671575 m!641581))

(declare-fun m!641583 () Bool)

(assert (=> b!671579 m!641583))

(declare-fun m!641585 () Bool)

(assert (=> b!671580 m!641585))

(declare-fun m!641587 () Bool)

(assert (=> b!671582 m!641587))

(declare-fun m!641589 () Bool)

(assert (=> b!671577 m!641589))

(declare-fun m!641591 () Bool)

(assert (=> start!60202 m!641591))

(declare-fun m!641593 () Bool)

(assert (=> b!671585 m!641593))

(declare-fun m!641595 () Bool)

(assert (=> b!671576 m!641595))

(declare-fun m!641597 () Bool)

(assert (=> b!671573 m!641597))

(push 1)

(assert (not b!671579))

(assert (not b!671580))

(assert (not b!671577))

(assert (not b!671582))

(assert (not start!60202))

(assert (not b!671573))

(assert (not b!671586))

(assert (not b!671581))

(assert (not b!671576))

(assert (not b!671585))

(assert (not b!671574))

(assert (not b!671575))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

