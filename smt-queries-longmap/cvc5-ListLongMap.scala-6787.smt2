; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85460 () Bool)

(assert start!85460)

(declare-fun res!663981 () Bool)

(declare-fun e!560588 () Bool)

(assert (=> start!85460 (=> (not res!663981) (not e!560588))))

(declare-datatypes ((array!62741 0))(
  ( (array!62742 (arr!30214 (Array (_ BitVec 32) (_ BitVec 64))) (size!30711 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62741)

(declare-fun size!36 () (_ BitVec 32))

(declare-fun from!3778 () (_ BitVec 32))

(assert (=> start!85460 (= res!663981 (and (= (size!30711 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62742 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30711 a!4424))))))

(assert (=> start!85460 e!560588))

(declare-fun array_inv!23338 (array!62741) Bool)

(assert (=> start!85460 (array_inv!23338 a!4424)))

(assert (=> start!85460 true))

(declare-fun b!993416 () Bool)

(declare-fun res!663979 () Bool)

(assert (=> b!993416 (=> (not res!663979) (not e!560588))))

(declare-datatypes ((List!20932 0))(
  ( (Nil!20929) (Cons!20928 (h!22090 (_ BitVec 64)) (t!29933 List!20932)) )
))
(declare-fun acc!919 () List!20932)

(declare-fun contains!5793 (List!20932 (_ BitVec 64)) Bool)

(assert (=> b!993416 (= res!663979 (not (contains!5793 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993417 () Bool)

(declare-fun res!663980 () Bool)

(assert (=> b!993417 (=> (not res!663980) (not e!560588))))

(assert (=> b!993417 (= res!663980 (not (contains!5793 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993418 () Bool)

(assert (=> b!993418 (= e!560588 false)))

(declare-fun lt!440530 () Bool)

(declare-fun noDuplicate!1391 (List!20932) Bool)

(assert (=> b!993418 (= lt!440530 (noDuplicate!1391 acc!919))))

(assert (= (and start!85460 res!663981) b!993416))

(assert (= (and b!993416 res!663979) b!993417))

(assert (= (and b!993417 res!663980) b!993418))

(declare-fun m!921139 () Bool)

(assert (=> start!85460 m!921139))

(declare-fun m!921141 () Bool)

(assert (=> b!993416 m!921141))

(declare-fun m!921143 () Bool)

(assert (=> b!993417 m!921143))

(declare-fun m!921145 () Bool)

(assert (=> b!993418 m!921145))

(push 1)

(assert (not b!993416))

(assert (not b!993418))

(assert (not b!993417))

(assert (not start!85460))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

