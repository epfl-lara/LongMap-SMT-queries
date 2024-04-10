; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85574 () Bool)

(assert start!85574)

(declare-fun res!664547 () Bool)

(declare-fun e!560910 () Bool)

(assert (=> start!85574 (=> (not res!664547) (not e!560910))))

(declare-datatypes ((array!62853 0))(
  ( (array!62854 (arr!30269 (Array (_ BitVec 32) (_ BitVec 64))) (size!30766 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62853)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85574 (= res!664547 (and (= (size!30766 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62854 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30766 a!4424))))))

(assert (=> start!85574 e!560910))

(declare-fun array_inv!23393 (array!62853) Bool)

(assert (=> start!85574 (array_inv!23393 a!4424)))

(assert (=> start!85574 true))

(declare-fun b!993983 () Bool)

(declare-fun res!664548 () Bool)

(assert (=> b!993983 (=> (not res!664548) (not e!560910))))

(declare-datatypes ((List!20984 0))(
  ( (Nil!20981) (Cons!20980 (h!22142 (_ BitVec 64)) (t!29985 List!20984)) )
))
(declare-fun acc!919 () List!20984)

(declare-fun contains!5845 (List!20984 (_ BitVec 64)) Bool)

(assert (=> b!993983 (= res!664548 (not (contains!5845 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993984 () Bool)

(declare-fun res!664546 () Bool)

(assert (=> b!993984 (=> (not res!664546) (not e!560910))))

(assert (=> b!993984 (= res!664546 (not (contains!5845 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993985 () Bool)

(assert (=> b!993985 (= e!560910 false)))

(declare-fun lt!440659 () Bool)

(declare-fun noDuplicate!1443 (List!20984) Bool)

(assert (=> b!993985 (= lt!440659 (noDuplicate!1443 acc!919))))

(assert (= (and start!85574 res!664547) b!993983))

(assert (= (and b!993983 res!664548) b!993984))

(assert (= (and b!993984 res!664546) b!993985))

(declare-fun m!921609 () Bool)

(assert (=> start!85574 m!921609))

(declare-fun m!921611 () Bool)

(assert (=> b!993983 m!921611))

(declare-fun m!921613 () Bool)

(assert (=> b!993984 m!921613))

(declare-fun m!921615 () Bool)

(assert (=> b!993985 m!921615))

(check-sat (not b!993985) (not start!85574) (not b!993984) (not b!993983))
