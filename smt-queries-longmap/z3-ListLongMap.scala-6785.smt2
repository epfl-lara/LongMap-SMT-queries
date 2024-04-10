; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85450 () Bool)

(assert start!85450)

(declare-fun res!663934 () Bool)

(declare-fun e!560559 () Bool)

(assert (=> start!85450 (=> (not res!663934) (not e!560559))))

(declare-datatypes ((array!62731 0))(
  ( (array!62732 (arr!30209 (Array (_ BitVec 32) (_ BitVec 64))) (size!30706 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62731)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85450 (= res!663934 (and (= (size!30706 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62732 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30706 a!4424))))))

(assert (=> start!85450 e!560559))

(declare-fun array_inv!23333 (array!62731) Bool)

(assert (=> start!85450 (array_inv!23333 a!4424)))

(assert (=> start!85450 true))

(declare-fun b!993371 () Bool)

(declare-fun res!663935 () Bool)

(assert (=> b!993371 (=> (not res!663935) (not e!560559))))

(declare-datatypes ((List!20927 0))(
  ( (Nil!20924) (Cons!20923 (h!22085 (_ BitVec 64)) (t!29928 List!20927)) )
))
(declare-fun acc!919 () List!20927)

(declare-fun contains!5788 (List!20927 (_ BitVec 64)) Bool)

(assert (=> b!993371 (= res!663935 (not (contains!5788 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993372 () Bool)

(declare-fun res!663936 () Bool)

(assert (=> b!993372 (=> (not res!663936) (not e!560559))))

(assert (=> b!993372 (= res!663936 (not (contains!5788 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993373 () Bool)

(assert (=> b!993373 (= e!560559 false)))

(declare-fun lt!440515 () Bool)

(declare-fun noDuplicate!1386 (List!20927) Bool)

(assert (=> b!993373 (= lt!440515 (noDuplicate!1386 acc!919))))

(assert (= (and start!85450 res!663934) b!993371))

(assert (= (and b!993371 res!663935) b!993372))

(assert (= (and b!993372 res!663936) b!993373))

(declare-fun m!921099 () Bool)

(assert (=> start!85450 m!921099))

(declare-fun m!921101 () Bool)

(assert (=> b!993371 m!921101))

(declare-fun m!921103 () Bool)

(assert (=> b!993372 m!921103))

(declare-fun m!921105 () Bool)

(assert (=> b!993373 m!921105))

(check-sat (not b!993371) (not b!993372) (not b!993373) (not start!85450))
