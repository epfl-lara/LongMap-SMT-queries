; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48694 () Bool)

(assert start!48694)

(declare-fun b!535196 () Bool)

(declare-fun res!330457 () Bool)

(declare-fun e!310940 () Bool)

(assert (=> b!535196 (=> (not res!330457) (not e!310940))))

(declare-datatypes ((array!33905 0))(
  ( (array!33906 (arr!16291 (Array (_ BitVec 32) (_ BitVec 64))) (size!16655 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33905)

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33905 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!535196 (= res!330457 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!535197 () Bool)

(declare-fun res!330460 () Bool)

(declare-fun e!310938 () Bool)

(assert (=> b!535197 (=> (not res!330460) (not e!310938))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33905 (_ BitVec 32)) Bool)

(assert (=> b!535197 (= res!330460 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun res!330459 () Bool)

(assert (=> start!48694 (=> (not res!330459) (not e!310940))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48694 (= res!330459 (validMask!0 mask!3216))))

(assert (=> start!48694 e!310940))

(assert (=> start!48694 true))

(declare-fun array_inv!12150 (array!33905) Bool)

(assert (=> start!48694 (array_inv!12150 a!3154)))

(declare-fun b!535198 () Bool)

(declare-fun res!330464 () Bool)

(assert (=> b!535198 (=> (not res!330464) (not e!310940))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!535198 (= res!330464 (and (= (size!16655 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16655 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16655 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!535199 () Bool)

(declare-fun res!330461 () Bool)

(assert (=> b!535199 (=> (not res!330461) (not e!310940))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!535199 (= res!330461 (validKeyInArray!0 k0!1998))))

(declare-fun b!535200 () Bool)

(declare-fun res!330466 () Bool)

(assert (=> b!535200 (=> (not res!330466) (not e!310938))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun index!1177 () (_ BitVec 32))

(assert (=> b!535200 (= res!330466 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16655 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16655 a!3154)) (= (select (arr!16291 a!3154) resIndex!32) (select (arr!16291 a!3154) j!147))))))

(declare-fun b!535201 () Bool)

(declare-fun e!310939 () Bool)

(assert (=> b!535201 (= e!310938 e!310939)))

(declare-fun res!330458 () Bool)

(assert (=> b!535201 (=> (not res!330458) (not e!310939))))

(declare-datatypes ((SeekEntryResult!4705 0))(
  ( (MissingZero!4705 (index!21044 (_ BitVec 32))) (Found!4705 (index!21045 (_ BitVec 32))) (Intermediate!4705 (undefined!5517 Bool) (index!21046 (_ BitVec 32)) (x!50141 (_ BitVec 32))) (Undefined!4705) (MissingVacant!4705 (index!21047 (_ BitVec 32))) )
))
(declare-fun lt!245802 () SeekEntryResult!4705)

(assert (=> b!535201 (= res!330458 (= lt!245802 (Intermediate!4705 false resIndex!32 resX!32)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33905 (_ BitVec 32)) SeekEntryResult!4705)

(assert (=> b!535201 (= lt!245802 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16291 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!535202 () Bool)

(assert (=> b!535202 (= e!310940 e!310938)))

(declare-fun res!330462 () Bool)

(assert (=> b!535202 (=> (not res!330462) (not e!310938))))

(declare-fun lt!245803 () SeekEntryResult!4705)

(assert (=> b!535202 (= res!330462 (or (= lt!245803 (MissingZero!4705 i!1153)) (= lt!245803 (MissingVacant!4705 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33905 (_ BitVec 32)) SeekEntryResult!4705)

(assert (=> b!535202 (= lt!245803 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!535203 () Bool)

(declare-fun res!330455 () Bool)

(assert (=> b!535203 (=> (not res!330455) (not e!310940))))

(assert (=> b!535203 (= res!330455 (validKeyInArray!0 (select (arr!16291 a!3154) j!147)))))

(declare-fun b!535204 () Bool)

(declare-fun res!330465 () Bool)

(assert (=> b!535204 (=> (not res!330465) (not e!310938))))

(declare-datatypes ((List!10317 0))(
  ( (Nil!10314) (Cons!10313 (h!11256 (_ BitVec 64)) (t!16537 List!10317)) )
))
(declare-fun arrayNoDuplicates!0 (array!33905 (_ BitVec 32) List!10317) Bool)

(assert (=> b!535204 (= res!330465 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10314))))

(declare-fun b!535205 () Bool)

(declare-fun res!330463 () Bool)

(assert (=> b!535205 (=> (not res!330463) (not e!310939))))

(assert (=> b!535205 (= res!330463 (and (not (= (select (arr!16291 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16291 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16291 a!3154) index!1177) (select (arr!16291 a!3154) j!147)) (= index!1177 resIndex!32) (bvsge mask!3216 #b00000000000000000000000000000000) (bvslt index!1177 (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsle x!1030 #b01111111111111111111111111111110)))))

(declare-fun b!535206 () Bool)

(assert (=> b!535206 (= e!310939 (not (validKeyInArray!0 (select (store (arr!16291 a!3154) i!1153 k0!1998) j!147))))))

(declare-fun b!535207 () Bool)

(declare-fun res!330456 () Bool)

(assert (=> b!535207 (=> (not res!330456) (not e!310939))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!535207 (= res!330456 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16291 a!3154) j!147) mask!3216) (select (arr!16291 a!3154) j!147) a!3154 mask!3216) lt!245802))))

(assert (= (and start!48694 res!330459) b!535198))

(assert (= (and b!535198 res!330464) b!535203))

(assert (= (and b!535203 res!330455) b!535199))

(assert (= (and b!535199 res!330461) b!535196))

(assert (= (and b!535196 res!330457) b!535202))

(assert (= (and b!535202 res!330462) b!535197))

(assert (= (and b!535197 res!330460) b!535204))

(assert (= (and b!535204 res!330465) b!535200))

(assert (= (and b!535200 res!330466) b!535201))

(assert (= (and b!535201 res!330458) b!535207))

(assert (= (and b!535207 res!330456) b!535205))

(assert (= (and b!535205 res!330463) b!535206))

(declare-fun m!515041 () Bool)

(assert (=> b!535206 m!515041))

(declare-fun m!515043 () Bool)

(assert (=> b!535206 m!515043))

(assert (=> b!535206 m!515043))

(declare-fun m!515045 () Bool)

(assert (=> b!535206 m!515045))

(declare-fun m!515047 () Bool)

(assert (=> b!535204 m!515047))

(declare-fun m!515049 () Bool)

(assert (=> b!535202 m!515049))

(declare-fun m!515051 () Bool)

(assert (=> b!535197 m!515051))

(declare-fun m!515053 () Bool)

(assert (=> b!535203 m!515053))

(assert (=> b!535203 m!515053))

(declare-fun m!515055 () Bool)

(assert (=> b!535203 m!515055))

(declare-fun m!515057 () Bool)

(assert (=> b!535200 m!515057))

(assert (=> b!535200 m!515053))

(assert (=> b!535207 m!515053))

(assert (=> b!535207 m!515053))

(declare-fun m!515059 () Bool)

(assert (=> b!535207 m!515059))

(assert (=> b!535207 m!515059))

(assert (=> b!535207 m!515053))

(declare-fun m!515061 () Bool)

(assert (=> b!535207 m!515061))

(declare-fun m!515063 () Bool)

(assert (=> start!48694 m!515063))

(declare-fun m!515065 () Bool)

(assert (=> start!48694 m!515065))

(declare-fun m!515067 () Bool)

(assert (=> b!535196 m!515067))

(assert (=> b!535201 m!515053))

(assert (=> b!535201 m!515053))

(declare-fun m!515069 () Bool)

(assert (=> b!535201 m!515069))

(declare-fun m!515071 () Bool)

(assert (=> b!535199 m!515071))

(declare-fun m!515073 () Bool)

(assert (=> b!535205 m!515073))

(assert (=> b!535205 m!515053))

(check-sat (not b!535202) (not b!535203) (not b!535201) (not b!535207) (not b!535196) (not b!535197) (not b!535199) (not start!48694) (not b!535204) (not b!535206))
(check-sat)
