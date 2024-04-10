; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49320 () Bool)

(assert start!49320)

(declare-fun b!543258 () Bool)

(declare-fun e!314241 () Bool)

(declare-fun e!314239 () Bool)

(assert (=> b!543258 (= e!314241 e!314239)))

(declare-fun res!337815 () Bool)

(assert (=> b!543258 (=> (not res!337815) (not e!314239))))

(declare-datatypes ((SeekEntryResult!4955 0))(
  ( (MissingZero!4955 (index!22044 (_ BitVec 32))) (Found!4955 (index!22045 (_ BitVec 32))) (Intermediate!4955 (undefined!5767 Bool) (index!22046 (_ BitVec 32)) (x!50954 (_ BitVec 32))) (Undefined!4955) (MissingVacant!4955 (index!22047 (_ BitVec 32))) )
))
(declare-fun lt!248128 () SeekEntryResult!4955)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!543258 (= res!337815 (or (= lt!248128 (MissingZero!4955 i!1153)) (= lt!248128 (MissingVacant!4955 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun k!1998 () (_ BitVec 64))

(declare-datatypes ((array!34328 0))(
  ( (array!34329 (arr!16497 (Array (_ BitVec 32) (_ BitVec 64))) (size!16861 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34328)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34328 (_ BitVec 32)) SeekEntryResult!4955)

(assert (=> b!543258 (= lt!248128 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!543259 () Bool)

(declare-fun res!337816 () Bool)

(assert (=> b!543259 (=> (not res!337816) (not e!314241))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!543259 (= res!337816 (validKeyInArray!0 (select (arr!16497 a!3154) j!147)))))

(declare-fun b!543260 () Bool)

(declare-fun res!337812 () Bool)

(assert (=> b!543260 (=> (not res!337812) (not e!314241))))

(assert (=> b!543260 (= res!337812 (and (= (size!16861 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16861 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16861 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!543261 () Bool)

(declare-fun res!337810 () Bool)

(assert (=> b!543261 (=> (not res!337810) (not e!314239))))

(declare-datatypes ((List!10616 0))(
  ( (Nil!10613) (Cons!10612 (h!11567 (_ BitVec 64)) (t!16844 List!10616)) )
))
(declare-fun arrayNoDuplicates!0 (array!34328 (_ BitVec 32) List!10616) Bool)

(assert (=> b!543261 (= res!337810 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10613))))

(declare-fun b!543262 () Bool)

(declare-fun e!314238 () Bool)

(assert (=> b!543262 (= e!314239 e!314238)))

(declare-fun res!337820 () Bool)

(assert (=> b!543262 (=> (not res!337820) (not e!314238))))

(declare-fun lt!248126 () SeekEntryResult!4955)

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!543262 (= res!337820 (= lt!248126 (Intermediate!4955 false resIndex!32 resX!32)))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34328 (_ BitVec 32)) SeekEntryResult!4955)

(assert (=> b!543262 (= lt!248126 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16497 a!3154) j!147) a!3154 mask!3216))))

(declare-fun res!337811 () Bool)

(assert (=> start!49320 (=> (not res!337811) (not e!314241))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49320 (= res!337811 (validMask!0 mask!3216))))

(assert (=> start!49320 e!314241))

(assert (=> start!49320 true))

(declare-fun array_inv!12293 (array!34328) Bool)

(assert (=> start!49320 (array_inv!12293 a!3154)))

(declare-fun b!543263 () Bool)

(declare-fun res!337813 () Bool)

(assert (=> b!543263 (=> (not res!337813) (not e!314239))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34328 (_ BitVec 32)) Bool)

(assert (=> b!543263 (= res!337813 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!543264 () Bool)

(declare-fun res!337814 () Bool)

(assert (=> b!543264 (=> (not res!337814) (not e!314241))))

(assert (=> b!543264 (= res!337814 (validKeyInArray!0 k!1998))))

(declare-fun b!543265 () Bool)

(assert (=> b!543265 (= e!314238 false)))

(declare-fun lt!248127 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!543265 (= lt!248127 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!543266 () Bool)

(declare-fun res!337817 () Bool)

(assert (=> b!543266 (=> (not res!337817) (not e!314241))))

(declare-fun arrayContainsKey!0 (array!34328 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!543266 (= res!337817 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!543267 () Bool)

(declare-fun res!337809 () Bool)

(assert (=> b!543267 (=> (not res!337809) (not e!314238))))

(assert (=> b!543267 (= res!337809 (and (not (= (select (arr!16497 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16497 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16497 a!3154) index!1177) (select (arr!16497 a!3154) j!147)))))))

(declare-fun b!543268 () Bool)

(declare-fun res!337819 () Bool)

(assert (=> b!543268 (=> (not res!337819) (not e!314238))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!543268 (= res!337819 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16497 a!3154) j!147) mask!3216) (select (arr!16497 a!3154) j!147) a!3154 mask!3216) lt!248126))))

(declare-fun b!543269 () Bool)

(declare-fun res!337818 () Bool)

(assert (=> b!543269 (=> (not res!337818) (not e!314239))))

(assert (=> b!543269 (= res!337818 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16861 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16861 a!3154)) (= (select (arr!16497 a!3154) resIndex!32) (select (arr!16497 a!3154) j!147))))))

(assert (= (and start!49320 res!337811) b!543260))

(assert (= (and b!543260 res!337812) b!543259))

(assert (= (and b!543259 res!337816) b!543264))

(assert (= (and b!543264 res!337814) b!543266))

(assert (= (and b!543266 res!337817) b!543258))

(assert (= (and b!543258 res!337815) b!543263))

(assert (= (and b!543263 res!337813) b!543261))

(assert (= (and b!543261 res!337810) b!543269))

(assert (= (and b!543269 res!337818) b!543262))

(assert (= (and b!543262 res!337820) b!543268))

(assert (= (and b!543268 res!337819) b!543267))

(assert (= (and b!543267 res!337809) b!543265))

(declare-fun m!521379 () Bool)

(assert (=> b!543261 m!521379))

(declare-fun m!521381 () Bool)

(assert (=> b!543265 m!521381))

(declare-fun m!521383 () Bool)

(assert (=> b!543268 m!521383))

(assert (=> b!543268 m!521383))

(declare-fun m!521385 () Bool)

(assert (=> b!543268 m!521385))

(assert (=> b!543268 m!521385))

(assert (=> b!543268 m!521383))

(declare-fun m!521387 () Bool)

(assert (=> b!543268 m!521387))

(declare-fun m!521389 () Bool)

(assert (=> b!543258 m!521389))

(declare-fun m!521391 () Bool)

(assert (=> b!543266 m!521391))

(assert (=> b!543259 m!521383))

(assert (=> b!543259 m!521383))

(declare-fun m!521393 () Bool)

(assert (=> b!543259 m!521393))

(declare-fun m!521395 () Bool)

(assert (=> b!543263 m!521395))

(declare-fun m!521397 () Bool)

(assert (=> b!543269 m!521397))

(assert (=> b!543269 m!521383))

(declare-fun m!521399 () Bool)

(assert (=> b!543264 m!521399))

(declare-fun m!521401 () Bool)

(assert (=> b!543267 m!521401))

(assert (=> b!543267 m!521383))

(assert (=> b!543262 m!521383))

(assert (=> b!543262 m!521383))

(declare-fun m!521403 () Bool)

(assert (=> b!543262 m!521403))

(declare-fun m!521405 () Bool)

(assert (=> start!49320 m!521405))

(declare-fun m!521407 () Bool)

(assert (=> start!49320 m!521407))

(push 1)

