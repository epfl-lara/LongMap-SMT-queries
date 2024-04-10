; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63658 () Bool)

(assert start!63658)

(declare-fun b!716819 () Bool)

(declare-fun res!479603 () Bool)

(declare-fun e!402520 () Bool)

(assert (=> b!716819 (=> (not res!479603) (not e!402520))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!716819 (= res!479603 (validKeyInArray!0 k!2102))))

(declare-fun res!479605 () Bool)

(assert (=> start!63658 (=> (not res!479605) (not e!402520))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63658 (= res!479605 (validMask!0 mask!3328))))

(assert (=> start!63658 e!402520))

(declare-datatypes ((array!40568 0))(
  ( (array!40569 (arr!19418 (Array (_ BitVec 32) (_ BitVec 64))) (size!19839 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40568)

(declare-fun array_inv!15214 (array!40568) Bool)

(assert (=> start!63658 (array_inv!15214 a!3186)))

(assert (=> start!63658 true))

(declare-fun b!716818 () Bool)

(declare-fun res!479604 () Bool)

(assert (=> b!716818 (=> (not res!479604) (not e!402520))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!716818 (= res!479604 (validKeyInArray!0 (select (arr!19418 a!3186) j!159)))))

(declare-fun b!716820 () Bool)

(assert (=> b!716820 (= e!402520 (and (bvslt #b00000000000000000000000000000000 (size!19839 a!3186)) (bvsge (size!19839 a!3186) #b01111111111111111111111111111111)))))

(declare-fun b!716817 () Bool)

(declare-fun res!479606 () Bool)

(assert (=> b!716817 (=> (not res!479606) (not e!402520))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!716817 (= res!479606 (and (= (size!19839 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19839 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19839 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!63658 res!479605) b!716817))

(assert (= (and b!716817 res!479606) b!716818))

(assert (= (and b!716818 res!479604) b!716819))

(assert (= (and b!716819 res!479603) b!716820))

(declare-fun m!672813 () Bool)

(assert (=> b!716819 m!672813))

(declare-fun m!672815 () Bool)

(assert (=> start!63658 m!672815))

(declare-fun m!672817 () Bool)

(assert (=> start!63658 m!672817))

(declare-fun m!672819 () Bool)

(assert (=> b!716818 m!672819))

(assert (=> b!716818 m!672819))

(declare-fun m!672821 () Bool)

(assert (=> b!716818 m!672821))

(push 1)

(assert (not start!63658))

(assert (not b!716818))

(assert (not b!716819))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!98759 () Bool)

(assert (=> d!98759 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

