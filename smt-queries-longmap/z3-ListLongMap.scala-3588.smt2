; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49316 () Bool)

(assert start!49316)

(declare-fun b!543186 () Bool)

(declare-fun res!337738 () Bool)

(declare-fun e!314216 () Bool)

(assert (=> b!543186 (=> (not res!337738) (not e!314216))))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34324 0))(
  ( (array!34325 (arr!16495 (Array (_ BitVec 32) (_ BitVec 64))) (size!16859 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34324)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4953 0))(
  ( (MissingZero!4953 (index!22036 (_ BitVec 32))) (Found!4953 (index!22037 (_ BitVec 32))) (Intermediate!4953 (undefined!5765 Bool) (index!22038 (_ BitVec 32)) (x!50944 (_ BitVec 32))) (Undefined!4953) (MissingVacant!4953 (index!22039 (_ BitVec 32))) )
))
(declare-fun lt!248109 () SeekEntryResult!4953)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34324 (_ BitVec 32)) SeekEntryResult!4953)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!543186 (= res!337738 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16495 a!3154) j!147) mask!3216) (select (arr!16495 a!3154) j!147) a!3154 mask!3216) lt!248109))))

(declare-fun b!543187 () Bool)

(declare-fun e!314215 () Bool)

(declare-fun e!314214 () Bool)

(assert (=> b!543187 (= e!314215 e!314214)))

(declare-fun res!337741 () Bool)

(assert (=> b!543187 (=> (not res!337741) (not e!314214))))

(declare-fun lt!248108 () SeekEntryResult!4953)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!543187 (= res!337741 (or (= lt!248108 (MissingZero!4953 i!1153)) (= lt!248108 (MissingVacant!4953 i!1153))))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34324 (_ BitVec 32)) SeekEntryResult!4953)

(assert (=> b!543187 (= lt!248108 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun res!337746 () Bool)

(assert (=> start!49316 (=> (not res!337746) (not e!314215))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49316 (= res!337746 (validMask!0 mask!3216))))

(assert (=> start!49316 e!314215))

(assert (=> start!49316 true))

(declare-fun array_inv!12291 (array!34324) Bool)

(assert (=> start!49316 (array_inv!12291 a!3154)))

(declare-fun b!543188 () Bool)

(declare-fun res!337739 () Bool)

(assert (=> b!543188 (=> (not res!337739) (not e!314214))))

(declare-datatypes ((List!10614 0))(
  ( (Nil!10611) (Cons!10610 (h!11565 (_ BitVec 64)) (t!16842 List!10614)) )
))
(declare-fun arrayNoDuplicates!0 (array!34324 (_ BitVec 32) List!10614) Bool)

(assert (=> b!543188 (= res!337739 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10611))))

(declare-fun b!543189 () Bool)

(declare-fun res!337744 () Bool)

(assert (=> b!543189 (=> (not res!337744) (not e!314215))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!543189 (= res!337744 (validKeyInArray!0 (select (arr!16495 a!3154) j!147)))))

(declare-fun b!543190 () Bool)

(assert (=> b!543190 (= e!314216 false)))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun lt!248110 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!543190 (= lt!248110 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!543191 () Bool)

(assert (=> b!543191 (= e!314214 e!314216)))

(declare-fun res!337745 () Bool)

(assert (=> b!543191 (=> (not res!337745) (not e!314216))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!543191 (= res!337745 (= lt!248109 (Intermediate!4953 false resIndex!32 resX!32)))))

(assert (=> b!543191 (= lt!248109 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16495 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!543192 () Bool)

(declare-fun res!337748 () Bool)

(assert (=> b!543192 (=> (not res!337748) (not e!314215))))

(assert (=> b!543192 (= res!337748 (validKeyInArray!0 k0!1998))))

(declare-fun b!543193 () Bool)

(declare-fun res!337742 () Bool)

(assert (=> b!543193 (=> (not res!337742) (not e!314216))))

(assert (=> b!543193 (= res!337742 (and (not (= (select (arr!16495 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16495 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16495 a!3154) index!1177) (select (arr!16495 a!3154) j!147)))))))

(declare-fun b!543194 () Bool)

(declare-fun res!337743 () Bool)

(assert (=> b!543194 (=> (not res!337743) (not e!314215))))

(assert (=> b!543194 (= res!337743 (and (= (size!16859 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16859 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16859 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!543195 () Bool)

(declare-fun res!337740 () Bool)

(assert (=> b!543195 (=> (not res!337740) (not e!314215))))

(declare-fun arrayContainsKey!0 (array!34324 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!543195 (= res!337740 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!543196 () Bool)

(declare-fun res!337747 () Bool)

(assert (=> b!543196 (=> (not res!337747) (not e!314214))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34324 (_ BitVec 32)) Bool)

(assert (=> b!543196 (= res!337747 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!543197 () Bool)

(declare-fun res!337737 () Bool)

(assert (=> b!543197 (=> (not res!337737) (not e!314214))))

(assert (=> b!543197 (= res!337737 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16859 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16859 a!3154)) (= (select (arr!16495 a!3154) resIndex!32) (select (arr!16495 a!3154) j!147))))))

(assert (= (and start!49316 res!337746) b!543194))

(assert (= (and b!543194 res!337743) b!543189))

(assert (= (and b!543189 res!337744) b!543192))

(assert (= (and b!543192 res!337748) b!543195))

(assert (= (and b!543195 res!337740) b!543187))

(assert (= (and b!543187 res!337741) b!543196))

(assert (= (and b!543196 res!337747) b!543188))

(assert (= (and b!543188 res!337739) b!543197))

(assert (= (and b!543197 res!337737) b!543191))

(assert (= (and b!543191 res!337745) b!543186))

(assert (= (and b!543186 res!337738) b!543193))

(assert (= (and b!543193 res!337742) b!543190))

(declare-fun m!521319 () Bool)

(assert (=> b!543190 m!521319))

(declare-fun m!521321 () Bool)

(assert (=> b!543186 m!521321))

(assert (=> b!543186 m!521321))

(declare-fun m!521323 () Bool)

(assert (=> b!543186 m!521323))

(assert (=> b!543186 m!521323))

(assert (=> b!543186 m!521321))

(declare-fun m!521325 () Bool)

(assert (=> b!543186 m!521325))

(declare-fun m!521327 () Bool)

(assert (=> b!543187 m!521327))

(declare-fun m!521329 () Bool)

(assert (=> b!543188 m!521329))

(declare-fun m!521331 () Bool)

(assert (=> start!49316 m!521331))

(declare-fun m!521333 () Bool)

(assert (=> start!49316 m!521333))

(declare-fun m!521335 () Bool)

(assert (=> b!543196 m!521335))

(declare-fun m!521337 () Bool)

(assert (=> b!543192 m!521337))

(assert (=> b!543191 m!521321))

(assert (=> b!543191 m!521321))

(declare-fun m!521339 () Bool)

(assert (=> b!543191 m!521339))

(assert (=> b!543189 m!521321))

(assert (=> b!543189 m!521321))

(declare-fun m!521341 () Bool)

(assert (=> b!543189 m!521341))

(declare-fun m!521343 () Bool)

(assert (=> b!543197 m!521343))

(assert (=> b!543197 m!521321))

(declare-fun m!521345 () Bool)

(assert (=> b!543193 m!521345))

(assert (=> b!543193 m!521321))

(declare-fun m!521347 () Bool)

(assert (=> b!543195 m!521347))

(check-sat (not b!543195) (not b!543196) (not b!543188) (not b!543191) (not start!49316) (not b!543190) (not b!543189) (not b!543192) (not b!543186) (not b!543187))
(check-sat)
