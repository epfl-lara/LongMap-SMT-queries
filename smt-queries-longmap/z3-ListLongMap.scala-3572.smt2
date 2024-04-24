; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49156 () Bool)

(assert start!49156)

(declare-fun b!541186 () Bool)

(declare-fun res!335970 () Bool)

(declare-fun e!313458 () Bool)

(assert (=> b!541186 (=> (not res!335970) (not e!313458))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34214 0))(
  ( (array!34215 (arr!16441 (Array (_ BitVec 32) (_ BitVec 64))) (size!16805 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34214)

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!541186 (= res!335970 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16805 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16805 a!3154)) (= (select (arr!16441 a!3154) resIndex!32) (select (arr!16441 a!3154) j!147))))))

(declare-fun b!541187 () Bool)

(declare-fun res!335976 () Bool)

(declare-fun e!313456 () Bool)

(assert (=> b!541187 (=> (not res!335976) (not e!313456))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!541187 (= res!335976 (validKeyInArray!0 (select (arr!16441 a!3154) j!147)))))

(declare-fun b!541189 () Bool)

(declare-fun res!335977 () Bool)

(assert (=> b!541189 (=> (not res!335977) (not e!313458))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4855 0))(
  ( (MissingZero!4855 (index!21644 (_ BitVec 32))) (Found!4855 (index!21645 (_ BitVec 32))) (Intermediate!4855 (undefined!5667 Bool) (index!21646 (_ BitVec 32)) (x!50709 (_ BitVec 32))) (Undefined!4855) (MissingVacant!4855 (index!21647 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34214 (_ BitVec 32)) SeekEntryResult!4855)

(assert (=> b!541189 (= res!335977 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16441 a!3154) j!147) a!3154 mask!3216) (Intermediate!4855 false resIndex!32 resX!32)))))

(declare-fun b!541190 () Bool)

(declare-fun res!335974 () Bool)

(assert (=> b!541190 (=> (not res!335974) (not e!313458))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34214 (_ BitVec 32)) Bool)

(assert (=> b!541190 (= res!335974 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!541191 () Bool)

(assert (=> b!541191 (= e!313458 false)))

(declare-fun lt!247639 () SeekEntryResult!4855)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!541191 (= lt!247639 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16441 a!3154) j!147) mask!3216) (select (arr!16441 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!541192 () Bool)

(declare-fun res!335972 () Bool)

(assert (=> b!541192 (=> (not res!335972) (not e!313456))))

(declare-fun k0!1998 () (_ BitVec 64))

(assert (=> b!541192 (= res!335972 (validKeyInArray!0 k0!1998))))

(declare-fun b!541193 () Bool)

(assert (=> b!541193 (= e!313456 e!313458)))

(declare-fun res!335969 () Bool)

(assert (=> b!541193 (=> (not res!335969) (not e!313458))))

(declare-fun lt!247638 () SeekEntryResult!4855)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!541193 (= res!335969 (or (= lt!247638 (MissingZero!4855 i!1153)) (= lt!247638 (MissingVacant!4855 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34214 (_ BitVec 32)) SeekEntryResult!4855)

(assert (=> b!541193 (= lt!247638 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun res!335973 () Bool)

(assert (=> start!49156 (=> (not res!335973) (not e!313456))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49156 (= res!335973 (validMask!0 mask!3216))))

(assert (=> start!49156 e!313456))

(assert (=> start!49156 true))

(declare-fun array_inv!12300 (array!34214) Bool)

(assert (=> start!49156 (array_inv!12300 a!3154)))

(declare-fun b!541188 () Bool)

(declare-fun res!335971 () Bool)

(assert (=> b!541188 (=> (not res!335971) (not e!313456))))

(declare-fun arrayContainsKey!0 (array!34214 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!541188 (= res!335971 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!541194 () Bool)

(declare-fun res!335968 () Bool)

(assert (=> b!541194 (=> (not res!335968) (not e!313458))))

(declare-datatypes ((List!10467 0))(
  ( (Nil!10464) (Cons!10463 (h!11415 (_ BitVec 64)) (t!16687 List!10467)) )
))
(declare-fun arrayNoDuplicates!0 (array!34214 (_ BitVec 32) List!10467) Bool)

(assert (=> b!541194 (= res!335968 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10464))))

(declare-fun b!541195 () Bool)

(declare-fun res!335975 () Bool)

(assert (=> b!541195 (=> (not res!335975) (not e!313456))))

(assert (=> b!541195 (= res!335975 (and (= (size!16805 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16805 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16805 a!3154)) (not (= i!1153 j!147))))))

(assert (= (and start!49156 res!335973) b!541195))

(assert (= (and b!541195 res!335975) b!541187))

(assert (= (and b!541187 res!335976) b!541192))

(assert (= (and b!541192 res!335972) b!541188))

(assert (= (and b!541188 res!335971) b!541193))

(assert (= (and b!541193 res!335969) b!541190))

(assert (= (and b!541190 res!335974) b!541194))

(assert (= (and b!541194 res!335968) b!541186))

(assert (= (and b!541186 res!335970) b!541189))

(assert (= (and b!541189 res!335977) b!541191))

(declare-fun m!519943 () Bool)

(assert (=> b!541191 m!519943))

(assert (=> b!541191 m!519943))

(declare-fun m!519945 () Bool)

(assert (=> b!541191 m!519945))

(assert (=> b!541191 m!519945))

(assert (=> b!541191 m!519943))

(declare-fun m!519947 () Bool)

(assert (=> b!541191 m!519947))

(declare-fun m!519949 () Bool)

(assert (=> b!541193 m!519949))

(declare-fun m!519951 () Bool)

(assert (=> b!541190 m!519951))

(assert (=> b!541187 m!519943))

(assert (=> b!541187 m!519943))

(declare-fun m!519953 () Bool)

(assert (=> b!541187 m!519953))

(declare-fun m!519955 () Bool)

(assert (=> b!541194 m!519955))

(declare-fun m!519957 () Bool)

(assert (=> start!49156 m!519957))

(declare-fun m!519959 () Bool)

(assert (=> start!49156 m!519959))

(declare-fun m!519961 () Bool)

(assert (=> b!541188 m!519961))

(assert (=> b!541189 m!519943))

(assert (=> b!541189 m!519943))

(declare-fun m!519963 () Bool)

(assert (=> b!541189 m!519963))

(declare-fun m!519965 () Bool)

(assert (=> b!541186 m!519965))

(assert (=> b!541186 m!519943))

(declare-fun m!519967 () Bool)

(assert (=> b!541192 m!519967))

(check-sat (not b!541192) (not b!541193) (not start!49156) (not b!541188) (not b!541190) (not b!541191) (not b!541194) (not b!541187) (not b!541189))
(check-sat)
