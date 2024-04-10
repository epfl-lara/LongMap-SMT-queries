; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7064 () Bool)

(assert start!7064)

(declare-fun res!26637 () Bool)

(declare-fun e!28900 () Bool)

(assert (=> start!7064 (=> (not res!26637) (not e!28900))))

(declare-datatypes ((array!3047 0))(
  ( (array!3048 (arr!1464 (Array (_ BitVec 32) (_ BitVec 64))) (size!1686 (_ BitVec 32))) )
))
(declare-fun a!4401 () array!3047)

(declare-fun i!1488 () (_ BitVec 32))

(declare-fun k!2989 () (_ BitVec 64))

(assert (=> start!7064 (= res!26637 (and (bvslt (size!1686 a!4401) #b01111111111111111111111111111111) (bvsge i!1488 #b00000000000000000000000000000000) (bvslt i!1488 (size!1686 a!4401)) (= (select (arr!1464 a!4401) i!1488) k!2989)))))

(assert (=> start!7064 e!28900))

(declare-fun array_inv!876 (array!3047) Bool)

(assert (=> start!7064 (array_inv!876 a!4401)))

(assert (=> start!7064 true))

(declare-fun b!45438 () Bool)

(declare-fun arrayContainsKey!0 (array!3047 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!45438 (= e!28900 (not (arrayContainsKey!0 a!4401 k!2989 i!1488)))))

(assert (= (and start!7064 res!26637) b!45438))

(declare-fun m!39989 () Bool)

(assert (=> start!7064 m!39989))

(declare-fun m!39991 () Bool)

(assert (=> start!7064 m!39991))

(declare-fun m!39993 () Bool)

(assert (=> b!45438 m!39993))

(push 1)

(assert (not b!45438))

(assert (not start!7064))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!8857 () Bool)

(declare-fun res!26654 () Bool)

(declare-fun e!28924 () Bool)

(assert (=> d!8857 (=> res!26654 e!28924)))

(assert (=> d!8857 (= res!26654 (= (select (arr!1464 a!4401) i!1488) k!2989))))

(assert (=> d!8857 (= (arrayContainsKey!0 a!4401 k!2989 i!1488) e!28924)))

(declare-fun b!45455 () Bool)

(declare-fun e!28925 () Bool)

(assert (=> b!45455 (= e!28924 e!28925)))

(declare-fun res!26655 () Bool)

(assert (=> b!45455 (=> (not res!26655) (not e!28925))))

(assert (=> b!45455 (= res!26655 (bvslt (bvadd i!1488 #b00000000000000000000000000000001) (size!1686 a!4401)))))

(declare-fun b!45456 () Bool)

(assert (=> b!45456 (= e!28925 (arrayContainsKey!0 a!4401 k!2989 (bvadd i!1488 #b00000000000000000000000000000001)))))

(assert (= (and d!8857 (not res!26654)) b!45455))

(assert (= (and b!45455 res!26655) b!45456))

(assert (=> d!8857 m!39989))

(declare-fun m!40009 () Bool)

(assert (=> b!45456 m!40009))

(assert (=> b!45438 d!8857))

(declare-fun d!8859 () Bool)

(assert (=> d!8859 (= (array_inv!876 a!4401) (bvsge (size!1686 a!4401) #b00000000000000000000000000000000))))

(assert (=> start!7064 d!8859))

(push 1)

