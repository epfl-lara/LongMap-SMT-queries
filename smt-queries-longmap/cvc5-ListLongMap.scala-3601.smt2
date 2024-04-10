; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49596 () Bool)

(assert start!49596)

(declare-fun b!545583 () Bool)

(declare-fun res!339521 () Bool)

(declare-fun e!315353 () Bool)

(assert (=> b!545583 (=> (not res!339521) (not e!315353))))

(declare-datatypes ((array!34409 0))(
  ( (array!34410 (arr!16533 (Array (_ BitVec 32) (_ BitVec 64))) (size!16897 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34409)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!545583 (= res!339521 (validKeyInArray!0 (select (arr!16533 a!3154) j!147)))))

(declare-fun b!545584 () Bool)

(declare-fun res!339513 () Bool)

(assert (=> b!545584 (=> (not res!339513) (not e!315353))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34409 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!545584 (= res!339513 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!545585 () Bool)

(declare-fun res!339519 () Bool)

(declare-fun e!315355 () Bool)

(assert (=> b!545585 (=> (not res!339519) (not e!315355))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34409 (_ BitVec 32)) Bool)

(assert (=> b!545585 (= res!339519 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!545586 () Bool)

(declare-fun e!315352 () Bool)

(assert (=> b!545586 (= e!315355 e!315352)))

(declare-fun res!339517 () Bool)

(assert (=> b!545586 (=> (not res!339517) (not e!315352))))

(declare-datatypes ((SeekEntryResult!4991 0))(
  ( (MissingZero!4991 (index!22188 (_ BitVec 32))) (Found!4991 (index!22189 (_ BitVec 32))) (Intermediate!4991 (undefined!5803 Bool) (index!22190 (_ BitVec 32)) (x!51119 (_ BitVec 32))) (Undefined!4991) (MissingVacant!4991 (index!22191 (_ BitVec 32))) )
))
(declare-fun lt!248897 () SeekEntryResult!4991)

(declare-fun lt!248894 () SeekEntryResult!4991)

(assert (=> b!545586 (= res!339517 (= lt!248897 lt!248894))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!545586 (= lt!248894 (Intermediate!4991 false resIndex!32 resX!32))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34409 (_ BitVec 32)) SeekEntryResult!4991)

(assert (=> b!545586 (= lt!248897 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16533 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!545587 () Bool)

(declare-fun res!339514 () Bool)

(assert (=> b!545587 (=> (not res!339514) (not e!315353))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!545587 (= res!339514 (and (= (size!16897 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16897 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16897 a!3154)) (not (= i!1153 j!147))))))

(declare-fun e!315356 () Bool)

(declare-fun lt!248898 () SeekEntryResult!4991)

(declare-fun b!545588 () Bool)

(declare-fun lt!248895 () SeekEntryResult!4991)

(assert (=> b!545588 (= e!315356 (and (= lt!248898 lt!248894) (= lt!248895 lt!248898) (bvsge (bvsub #b01111111111111111111111111111110 (bvadd #b00000000000000000000000000000001 x!1030)) (bvsub #b01111111111111111111111111111110 x!1030))))))

(declare-fun lt!248896 () (_ BitVec 32))

(assert (=> b!545588 (= lt!248898 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!248896 (select (arr!16533 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!545589 () Bool)

(declare-fun res!339510 () Bool)

(assert (=> b!545589 (=> (not res!339510) (not e!315355))))

(assert (=> b!545589 (= res!339510 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16897 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16897 a!3154)) (= (select (arr!16533 a!3154) resIndex!32) (select (arr!16533 a!3154) j!147))))))

(declare-fun b!545591 () Bool)

(assert (=> b!545591 (= e!315353 e!315355)))

(declare-fun res!339515 () Bool)

(assert (=> b!545591 (=> (not res!339515) (not e!315355))))

(declare-fun lt!248899 () SeekEntryResult!4991)

(assert (=> b!545591 (= res!339515 (or (= lt!248899 (MissingZero!4991 i!1153)) (= lt!248899 (MissingVacant!4991 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34409 (_ BitVec 32)) SeekEntryResult!4991)

(assert (=> b!545591 (= lt!248899 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!545592 () Bool)

(declare-fun res!339511 () Bool)

(assert (=> b!545592 (=> (not res!339511) (not e!315353))))

(assert (=> b!545592 (= res!339511 (validKeyInArray!0 k!1998))))

(declare-fun b!545593 () Bool)

(declare-fun res!339512 () Bool)

(assert (=> b!545593 (=> (not res!339512) (not e!315355))))

(declare-datatypes ((List!10652 0))(
  ( (Nil!10649) (Cons!10648 (h!11612 (_ BitVec 64)) (t!16880 List!10652)) )
))
(declare-fun arrayNoDuplicates!0 (array!34409 (_ BitVec 32) List!10652) Bool)

(assert (=> b!545593 (= res!339512 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10649))))

(declare-fun b!545594 () Bool)

(declare-fun e!315354 () Bool)

(assert (=> b!545594 (= e!315354 e!315356)))

(declare-fun res!339520 () Bool)

(assert (=> b!545594 (=> (not res!339520) (not e!315356))))

(assert (=> b!545594 (= res!339520 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!248896 #b00000000000000000000000000000000) (bvslt lt!248896 (size!16897 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!545594 (= lt!248896 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun res!339518 () Bool)

(assert (=> start!49596 (=> (not res!339518) (not e!315353))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49596 (= res!339518 (validMask!0 mask!3216))))

(assert (=> start!49596 e!315353))

(assert (=> start!49596 true))

(declare-fun array_inv!12329 (array!34409) Bool)

(assert (=> start!49596 (array_inv!12329 a!3154)))

(declare-fun b!545590 () Bool)

(assert (=> b!545590 (= e!315352 e!315354)))

(declare-fun res!339516 () Bool)

(assert (=> b!545590 (=> (not res!339516) (not e!315354))))

(assert (=> b!545590 (= res!339516 (and (= lt!248895 lt!248897) (not (= (select (arr!16533 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16533 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16533 a!3154) index!1177) (select (arr!16533 a!3154) j!147)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!545590 (= lt!248895 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16533 a!3154) j!147) mask!3216) (select (arr!16533 a!3154) j!147) a!3154 mask!3216))))

(assert (= (and start!49596 res!339518) b!545587))

(assert (= (and b!545587 res!339514) b!545583))

(assert (= (and b!545583 res!339521) b!545592))

(assert (= (and b!545592 res!339511) b!545584))

(assert (= (and b!545584 res!339513) b!545591))

(assert (= (and b!545591 res!339515) b!545585))

(assert (= (and b!545585 res!339519) b!545593))

(assert (= (and b!545593 res!339512) b!545589))

(assert (= (and b!545589 res!339510) b!545586))

(assert (= (and b!545586 res!339517) b!545590))

(assert (= (and b!545590 res!339516) b!545594))

(assert (= (and b!545594 res!339520) b!545588))

(declare-fun m!523137 () Bool)

(assert (=> b!545586 m!523137))

(assert (=> b!545586 m!523137))

(declare-fun m!523139 () Bool)

(assert (=> b!545586 m!523139))

(declare-fun m!523141 () Bool)

(assert (=> b!545591 m!523141))

(declare-fun m!523143 () Bool)

(assert (=> b!545585 m!523143))

(declare-fun m!523145 () Bool)

(assert (=> b!545594 m!523145))

(assert (=> b!545588 m!523137))

(assert (=> b!545588 m!523137))

(declare-fun m!523147 () Bool)

(assert (=> b!545588 m!523147))

(assert (=> b!545583 m!523137))

(assert (=> b!545583 m!523137))

(declare-fun m!523149 () Bool)

(assert (=> b!545583 m!523149))

(declare-fun m!523151 () Bool)

(assert (=> b!545590 m!523151))

(assert (=> b!545590 m!523137))

(assert (=> b!545590 m!523137))

(declare-fun m!523153 () Bool)

(assert (=> b!545590 m!523153))

(assert (=> b!545590 m!523153))

(assert (=> b!545590 m!523137))

(declare-fun m!523155 () Bool)

(assert (=> b!545590 m!523155))

(declare-fun m!523157 () Bool)

(assert (=> b!545584 m!523157))

(declare-fun m!523159 () Bool)

(assert (=> b!545593 m!523159))

(declare-fun m!523161 () Bool)

(assert (=> b!545589 m!523161))

(assert (=> b!545589 m!523137))

(declare-fun m!523163 () Bool)

(assert (=> start!49596 m!523163))

(declare-fun m!523165 () Bool)

(assert (=> start!49596 m!523165))

(declare-fun m!523167 () Bool)

(assert (=> b!545592 m!523167))

(push 1)

(assert (not b!545591))

(assert (not b!545585))

(assert (not b!545590))

(assert (not b!545584))

(assert (not b!545583))

(assert (not b!545594))

(assert (not b!545588))

(assert (not b!545593))

(assert (not b!545586))

(assert (not start!49596))

(assert (not b!545592))

(check-sat)

(pop 1)

(push 1)

(check-sat)

