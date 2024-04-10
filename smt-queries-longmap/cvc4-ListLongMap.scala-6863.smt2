; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86436 () Bool)

(assert start!86436)

(declare-fun b!1000597 () Bool)

(declare-fun res!670082 () Bool)

(declare-fun e!563950 () Bool)

(assert (=> b!1000597 (=> (not res!670082) (not e!563950))))

(declare-datatypes ((array!63237 0))(
  ( (array!63238 (arr!30444 (Array (_ BitVec 32) (_ BitVec 64))) (size!30946 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63237)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9376 0))(
  ( (MissingZero!9376 (index!39875 (_ BitVec 32))) (Found!9376 (index!39876 (_ BitVec 32))) (Intermediate!9376 (undefined!10188 Bool) (index!39877 (_ BitVec 32)) (x!87300 (_ BitVec 32))) (Undefined!9376) (MissingVacant!9376 (index!39878 (_ BitVec 32))) )
))
(declare-fun lt!442329 () SeekEntryResult!9376)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63237 (_ BitVec 32)) SeekEntryResult!9376)

(assert (=> b!1000597 (= res!670082 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30444 a!3219) j!170) a!3219 mask!3464) lt!442329))))

(declare-fun b!1000598 () Bool)

(declare-fun res!670078 () Bool)

(declare-fun e!563949 () Bool)

(assert (=> b!1000598 (=> (not res!670078) (not e!563949))))

(declare-datatypes ((List!21120 0))(
  ( (Nil!21117) (Cons!21116 (h!22293 (_ BitVec 64)) (t!30121 List!21120)) )
))
(declare-fun arrayNoDuplicates!0 (array!63237 (_ BitVec 32) List!21120) Bool)

(assert (=> b!1000598 (= res!670078 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21117))))

(declare-fun res!670083 () Bool)

(declare-fun e!563948 () Bool)

(assert (=> start!86436 (=> (not res!670083) (not e!563948))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86436 (= res!670083 (validMask!0 mask!3464))))

(assert (=> start!86436 e!563948))

(declare-fun array_inv!23568 (array!63237) Bool)

(assert (=> start!86436 (array_inv!23568 a!3219)))

(assert (=> start!86436 true))

(declare-fun b!1000599 () Bool)

(declare-fun res!670085 () Bool)

(assert (=> b!1000599 (=> (not res!670085) (not e!563950))))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun lt!442331 () SeekEntryResult!9376)

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1000599 (= res!670085 (not (= lt!442331 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!30444 a!3219) i!1194 k!2224) j!170) mask!3464) (select (store (arr!30444 a!3219) i!1194 k!2224) j!170) (array!63238 (store (arr!30444 a!3219) i!1194 k!2224) (size!30946 a!3219)) mask!3464))))))

(declare-fun b!1000600 () Bool)

(assert (=> b!1000600 (= e!563950 (and (bvsge mask!3464 #b00000000000000000000000000000000) (bvsge index!1507 (bvadd #b00000000000000000000000000000001 mask!3464))))))

(declare-fun b!1000601 () Bool)

(declare-fun res!670084 () Bool)

(assert (=> b!1000601 (=> (not res!670084) (not e!563948))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1000601 (= res!670084 (validKeyInArray!0 (select (arr!30444 a!3219) j!170)))))

(declare-fun b!1000602 () Bool)

(declare-fun res!670080 () Bool)

(assert (=> b!1000602 (=> (not res!670080) (not e!563949))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1000602 (= res!670080 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30946 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30946 a!3219))))))

(declare-fun b!1000603 () Bool)

(declare-fun res!670077 () Bool)

(assert (=> b!1000603 (=> (not res!670077) (not e!563948))))

(declare-fun arrayContainsKey!0 (array!63237 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1000603 (= res!670077 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1000604 () Bool)

(assert (=> b!1000604 (= e!563948 e!563949)))

(declare-fun res!670086 () Bool)

(assert (=> b!1000604 (=> (not res!670086) (not e!563949))))

(declare-fun lt!442330 () SeekEntryResult!9376)

(assert (=> b!1000604 (= res!670086 (or (= lt!442330 (MissingVacant!9376 i!1194)) (= lt!442330 (MissingZero!9376 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63237 (_ BitVec 32)) SeekEntryResult!9376)

(assert (=> b!1000604 (= lt!442330 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1000605 () Bool)

(declare-fun res!670079 () Bool)

(assert (=> b!1000605 (=> (not res!670079) (not e!563948))))

(assert (=> b!1000605 (= res!670079 (validKeyInArray!0 k!2224))))

(declare-fun b!1000606 () Bool)

(declare-fun res!670076 () Bool)

(assert (=> b!1000606 (=> (not res!670076) (not e!563949))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63237 (_ BitVec 32)) Bool)

(assert (=> b!1000606 (= res!670076 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1000607 () Bool)

(declare-fun res!670075 () Bool)

(assert (=> b!1000607 (=> (not res!670075) (not e!563948))))

(assert (=> b!1000607 (= res!670075 (and (= (size!30946 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30946 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30946 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1000608 () Bool)

(assert (=> b!1000608 (= e!563949 e!563950)))

(declare-fun res!670081 () Bool)

(assert (=> b!1000608 (=> (not res!670081) (not e!563950))))

(assert (=> b!1000608 (= res!670081 (= lt!442331 lt!442329))))

(assert (=> b!1000608 (= lt!442329 (Intermediate!9376 false resIndex!38 resX!38))))

(assert (=> b!1000608 (= lt!442331 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30444 a!3219) j!170) mask!3464) (select (arr!30444 a!3219) j!170) a!3219 mask!3464))))

(assert (= (and start!86436 res!670083) b!1000607))

(assert (= (and b!1000607 res!670075) b!1000601))

(assert (= (and b!1000601 res!670084) b!1000605))

(assert (= (and b!1000605 res!670079) b!1000603))

(assert (= (and b!1000603 res!670077) b!1000604))

(assert (= (and b!1000604 res!670086) b!1000606))

(assert (= (and b!1000606 res!670076) b!1000598))

(assert (= (and b!1000598 res!670078) b!1000602))

(assert (= (and b!1000602 res!670080) b!1000608))

(assert (= (and b!1000608 res!670081) b!1000597))

(assert (= (and b!1000597 res!670082) b!1000599))

(assert (= (and b!1000599 res!670085) b!1000600))

(declare-fun m!926751 () Bool)

(assert (=> b!1000606 m!926751))

(declare-fun m!926753 () Bool)

(assert (=> b!1000601 m!926753))

(assert (=> b!1000601 m!926753))

(declare-fun m!926755 () Bool)

(assert (=> b!1000601 m!926755))

(declare-fun m!926757 () Bool)

(assert (=> b!1000603 m!926757))

(declare-fun m!926759 () Bool)

(assert (=> start!86436 m!926759))

(declare-fun m!926761 () Bool)

(assert (=> start!86436 m!926761))

(declare-fun m!926763 () Bool)

(assert (=> b!1000598 m!926763))

(assert (=> b!1000608 m!926753))

(assert (=> b!1000608 m!926753))

(declare-fun m!926765 () Bool)

(assert (=> b!1000608 m!926765))

(assert (=> b!1000608 m!926765))

(assert (=> b!1000608 m!926753))

(declare-fun m!926767 () Bool)

(assert (=> b!1000608 m!926767))

(declare-fun m!926769 () Bool)

(assert (=> b!1000604 m!926769))

(assert (=> b!1000597 m!926753))

(assert (=> b!1000597 m!926753))

(declare-fun m!926771 () Bool)

(assert (=> b!1000597 m!926771))

(declare-fun m!926773 () Bool)

(assert (=> b!1000605 m!926773))

(declare-fun m!926775 () Bool)

(assert (=> b!1000599 m!926775))

(declare-fun m!926777 () Bool)

(assert (=> b!1000599 m!926777))

(assert (=> b!1000599 m!926777))

(declare-fun m!926779 () Bool)

(assert (=> b!1000599 m!926779))

(assert (=> b!1000599 m!926779))

(assert (=> b!1000599 m!926777))

(declare-fun m!926781 () Bool)

(assert (=> b!1000599 m!926781))

(push 1)

(assert (not b!1000601))

(assert (not b!1000604))

(assert (not b!1000597))

(assert (not b!1000605))

(assert (not b!1000603))

(assert (not b!1000599))

(assert (not b!1000598))

(assert (not b!1000608))

(assert (not start!86436))

(assert (not b!1000606))

(check-sat)

(pop 1)

(push 1)

(check-sat)

