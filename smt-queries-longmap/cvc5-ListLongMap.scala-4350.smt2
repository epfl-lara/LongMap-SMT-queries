; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60120 () Bool)

(assert start!60120)

(declare-fun b!670764 () Bool)

(declare-fun e!383416 () Bool)

(declare-datatypes ((List!12861 0))(
  ( (Nil!12858) (Cons!12857 (h!13902 (_ BitVec 64)) (t!19080 List!12861)) )
))
(declare-fun acc!681 () List!12861)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3383 (List!12861 (_ BitVec 64)) Bool)

(assert (=> b!670764 (= e!383416 (not (contains!3383 acc!681 k!2843)))))

(declare-fun b!670765 () Bool)

(declare-fun res!437632 () Bool)

(declare-fun e!383417 () Bool)

(assert (=> b!670765 (=> (not res!437632) (not e!383417))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((array!39178 0))(
  ( (array!39179 (arr!18781 (Array (_ BitVec 32) (_ BitVec 64))) (size!19146 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39178)

(assert (=> b!670765 (= res!437632 (= (select (arr!18781 a!3626) from!3004) k!2843))))

(declare-fun b!670766 () Bool)

(declare-fun res!437622 () Bool)

(assert (=> b!670766 (=> (not res!437622) (not e!383417))))

(declare-fun noDuplicate!652 (List!12861) Bool)

(assert (=> b!670766 (= res!437622 (noDuplicate!652 acc!681))))

(declare-fun b!670767 () Bool)

(declare-fun res!437623 () Bool)

(assert (=> b!670767 (=> (not res!437623) (not e!383417))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!670767 (= res!437623 (validKeyInArray!0 k!2843))))

(declare-fun b!670768 () Bool)

(declare-fun res!437626 () Bool)

(assert (=> b!670768 (=> (not res!437626) (not e!383417))))

(assert (=> b!670768 (= res!437626 (not (contains!3383 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!670769 () Bool)

(declare-fun e!383418 () Bool)

(assert (=> b!670769 (= e!383418 e!383416)))

(declare-fun res!437635 () Bool)

(assert (=> b!670769 (=> (not res!437635) (not e!383416))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!670769 (= res!437635 (bvsle from!3004 i!1382))))

(declare-fun b!670770 () Bool)

(declare-fun res!437620 () Bool)

(assert (=> b!670770 (=> (not res!437620) (not e!383417))))

(declare-fun arrayContainsKey!0 (array!39178 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!670770 (= res!437620 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!670771 () Bool)

(assert (=> b!670771 (= e!383417 (not true))))

(assert (=> b!670771 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun res!437624 () Bool)

(assert (=> start!60120 (=> (not res!437624) (not e!383417))))

(assert (=> start!60120 (= res!437624 (and (bvslt (size!19146 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19146 a!3626))))))

(assert (=> start!60120 e!383417))

(assert (=> start!60120 true))

(declare-fun array_inv!14664 (array!39178) Bool)

(assert (=> start!60120 (array_inv!14664 a!3626)))

(declare-fun b!670772 () Bool)

(declare-fun res!437630 () Bool)

(assert (=> b!670772 (=> (not res!437630) (not e!383417))))

(assert (=> b!670772 (= res!437630 (not (contains!3383 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!670773 () Bool)

(declare-fun res!437633 () Bool)

(assert (=> b!670773 (=> (not res!437633) (not e!383417))))

(declare-fun arrayNoDuplicates!0 (array!39178 (_ BitVec 32) List!12861) Bool)

(assert (=> b!670773 (= res!437633 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12858))))

(declare-fun b!670774 () Bool)

(declare-fun res!437631 () Bool)

(assert (=> b!670774 (=> (not res!437631) (not e!383417))))

(assert (=> b!670774 (= res!437631 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19146 a!3626))))))

(declare-fun b!670775 () Bool)

(declare-fun res!437629 () Bool)

(assert (=> b!670775 (=> (not res!437629) (not e!383417))))

(assert (=> b!670775 (= res!437629 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19146 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!670776 () Bool)

(declare-fun e!383420 () Bool)

(assert (=> b!670776 (= e!383420 (contains!3383 acc!681 k!2843))))

(declare-fun b!670777 () Bool)

(declare-fun res!437625 () Bool)

(assert (=> b!670777 (=> (not res!437625) (not e!383417))))

(assert (=> b!670777 (= res!437625 e!383418)))

(declare-fun res!437628 () Bool)

(assert (=> b!670777 (=> res!437628 e!383418)))

(assert (=> b!670777 (= res!437628 e!383420)))

(declare-fun res!437627 () Bool)

(assert (=> b!670777 (=> (not res!437627) (not e!383420))))

(assert (=> b!670777 (= res!437627 (bvsgt from!3004 i!1382))))

(declare-fun b!670778 () Bool)

(declare-fun res!437634 () Bool)

(assert (=> b!670778 (=> (not res!437634) (not e!383417))))

(assert (=> b!670778 (= res!437634 (validKeyInArray!0 (select (arr!18781 a!3626) from!3004)))))

(declare-fun b!670779 () Bool)

(declare-fun res!437621 () Bool)

(assert (=> b!670779 (=> (not res!437621) (not e!383417))))

(assert (=> b!670779 (= res!437621 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(assert (= (and start!60120 res!437624) b!670766))

(assert (= (and b!670766 res!437622) b!670772))

(assert (= (and b!670772 res!437630) b!670768))

(assert (= (and b!670768 res!437626) b!670777))

(assert (= (and b!670777 res!437627) b!670776))

(assert (= (and b!670777 (not res!437628)) b!670769))

(assert (= (and b!670769 res!437635) b!670764))

(assert (= (and b!670777 res!437625) b!670773))

(assert (= (and b!670773 res!437633) b!670779))

(assert (= (and b!670779 res!437621) b!670774))

(assert (= (and b!670774 res!437631) b!670767))

(assert (= (and b!670767 res!437623) b!670770))

(assert (= (and b!670770 res!437620) b!670775))

(assert (= (and b!670775 res!437629) b!670778))

(assert (= (and b!670778 res!437634) b!670765))

(assert (= (and b!670765 res!437632) b!670771))

(declare-fun m!639951 () Bool)

(assert (=> b!670768 m!639951))

(declare-fun m!639953 () Bool)

(assert (=> start!60120 m!639953))

(declare-fun m!639955 () Bool)

(assert (=> b!670779 m!639955))

(declare-fun m!639957 () Bool)

(assert (=> b!670773 m!639957))

(declare-fun m!639959 () Bool)

(assert (=> b!670778 m!639959))

(assert (=> b!670778 m!639959))

(declare-fun m!639961 () Bool)

(assert (=> b!670778 m!639961))

(declare-fun m!639963 () Bool)

(assert (=> b!670772 m!639963))

(declare-fun m!639965 () Bool)

(assert (=> b!670766 m!639965))

(assert (=> b!670765 m!639959))

(declare-fun m!639967 () Bool)

(assert (=> b!670770 m!639967))

(declare-fun m!639969 () Bool)

(assert (=> b!670764 m!639969))

(declare-fun m!639971 () Bool)

(assert (=> b!670767 m!639971))

(declare-fun m!639973 () Bool)

(assert (=> b!670771 m!639973))

(assert (=> b!670776 m!639969))

(push 1)

(assert (not b!670778))

(assert (not start!60120))

(assert (not b!670764))

(assert (not b!670766))

(assert (not b!670768))

(assert (not b!670776))

(assert (not b!670772))

(assert (not b!670773))

(assert (not b!670771))

(assert (not b!670779))

(assert (not b!670770))

(assert (not b!670767))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

