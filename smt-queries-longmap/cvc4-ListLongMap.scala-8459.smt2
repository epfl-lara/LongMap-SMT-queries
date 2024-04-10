; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102892 () Bool)

(assert start!102892)

(declare-fun b!1236601 () Bool)

(declare-fun res!824584 () Bool)

(declare-fun e!700887 () Bool)

(assert (=> b!1236601 (=> (not res!824584) (not e!700887))))

(declare-datatypes ((array!79737 0))(
  ( (array!79738 (arr!38476 (Array (_ BitVec 32) (_ BitVec 64))) (size!39012 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79737)

(declare-datatypes ((List!27249 0))(
  ( (Nil!27246) (Cons!27245 (h!28454 (_ BitVec 64)) (t!40712 List!27249)) )
))
(declare-fun acc!846 () List!27249)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79737 (_ BitVec 32) List!27249) Bool)

(assert (=> b!1236601 (= res!824584 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1236602 () Bool)

(declare-fun res!824585 () Bool)

(assert (=> b!1236602 (=> (not res!824585) (not e!700887))))

(declare-fun contains!7311 (List!27249 (_ BitVec 64)) Bool)

(assert (=> b!1236602 (= res!824585 (not (contains!7311 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236603 () Bool)

(declare-fun res!824589 () Bool)

(assert (=> b!1236603 (=> (not res!824589) (not e!700887))))

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1236603 (= res!824589 (contains!7311 acc!846 k!2925))))

(declare-fun b!1236604 () Bool)

(assert (=> b!1236604 (= e!700887 (not true))))

(declare-fun lt!560828 () List!27249)

(declare-fun subseq!565 (List!27249 List!27249) Bool)

(assert (=> b!1236604 (subseq!565 lt!560828 lt!560828)))

(declare-datatypes ((Unit!41016 0))(
  ( (Unit!41017) )
))
(declare-fun lt!560827 () Unit!41016)

(declare-fun lemmaListSubSeqRefl!0 (List!27249) Unit!41016)

(assert (=> b!1236604 (= lt!560827 (lemmaListSubSeqRefl!0 lt!560828))))

(assert (=> b!1236604 (= lt!560828 (Cons!27245 (select (arr!38476 a!3835) from!3213) acc!846))))

(declare-fun b!1236605 () Bool)

(declare-fun res!824586 () Bool)

(assert (=> b!1236605 (=> (not res!824586) (not e!700887))))

(assert (=> b!1236605 (= res!824586 (not (contains!7311 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!824588 () Bool)

(assert (=> start!102892 (=> (not res!824588) (not e!700887))))

(assert (=> start!102892 (= res!824588 (and (bvslt (size!39012 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39012 a!3835))))))

(assert (=> start!102892 e!700887))

(declare-fun array_inv!29324 (array!79737) Bool)

(assert (=> start!102892 (array_inv!29324 a!3835)))

(assert (=> start!102892 true))

(declare-fun b!1236606 () Bool)

(declare-fun res!824587 () Bool)

(assert (=> b!1236606 (=> (not res!824587) (not e!700887))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1236606 (= res!824587 (validKeyInArray!0 (select (arr!38476 a!3835) from!3213)))))

(declare-fun b!1236607 () Bool)

(declare-fun res!824590 () Bool)

(assert (=> b!1236607 (=> (not res!824590) (not e!700887))))

(assert (=> b!1236607 (= res!824590 (not (= from!3213 (bvsub (size!39012 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1236608 () Bool)

(declare-fun res!824583 () Bool)

(assert (=> b!1236608 (=> (not res!824583) (not e!700887))))

(declare-fun noDuplicate!1908 (List!27249) Bool)

(assert (=> b!1236608 (= res!824583 (noDuplicate!1908 acc!846))))

(assert (= (and start!102892 res!824588) b!1236608))

(assert (= (and b!1236608 res!824583) b!1236602))

(assert (= (and b!1236602 res!824585) b!1236605))

(assert (= (and b!1236605 res!824586) b!1236601))

(assert (= (and b!1236601 res!824584) b!1236603))

(assert (= (and b!1236603 res!824589) b!1236607))

(assert (= (and b!1236607 res!824590) b!1236606))

(assert (= (and b!1236606 res!824587) b!1236604))

(declare-fun m!1140371 () Bool)

(assert (=> b!1236604 m!1140371))

(declare-fun m!1140373 () Bool)

(assert (=> b!1236604 m!1140373))

(declare-fun m!1140375 () Bool)

(assert (=> b!1236604 m!1140375))

(declare-fun m!1140377 () Bool)

(assert (=> b!1236602 m!1140377))

(declare-fun m!1140379 () Bool)

(assert (=> b!1236608 m!1140379))

(declare-fun m!1140381 () Bool)

(assert (=> start!102892 m!1140381))

(assert (=> b!1236606 m!1140375))

(assert (=> b!1236606 m!1140375))

(declare-fun m!1140383 () Bool)

(assert (=> b!1236606 m!1140383))

(declare-fun m!1140385 () Bool)

(assert (=> b!1236601 m!1140385))

(declare-fun m!1140387 () Bool)

(assert (=> b!1236605 m!1140387))

(declare-fun m!1140389 () Bool)

(assert (=> b!1236603 m!1140389))

(push 1)

(assert (not b!1236606))

(assert (not b!1236605))

(assert (not b!1236601))

(assert (not b!1236604))

(assert (not b!1236608))

(assert (not start!102892))

(assert (not b!1236603))

(assert (not b!1236602))

(check-sat)

