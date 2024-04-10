; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48722 () Bool)

(assert start!48722)

(declare-fun b!535585 () Bool)

(declare-fun res!330793 () Bool)

(declare-fun e!311090 () Bool)

(assert (=> b!535585 (=> (not res!330793) (not e!311090))))

(declare-datatypes ((array!33934 0))(
  ( (array!33935 (arr!16306 (Array (_ BitVec 32) (_ BitVec 64))) (size!16670 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33934)

(declare-datatypes ((List!10425 0))(
  ( (Nil!10422) (Cons!10421 (h!11364 (_ BitVec 64)) (t!16653 List!10425)) )
))
(declare-fun arrayNoDuplicates!0 (array!33934 (_ BitVec 32) List!10425) Bool)

(assert (=> b!535585 (= res!330793 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10422))))

(declare-fun b!535586 () Bool)

(declare-fun e!311091 () Bool)

(assert (=> b!535586 (= e!311091 e!311090)))

(declare-fun res!330790 () Bool)

(assert (=> b!535586 (=> (not res!330790) (not e!311090))))

(declare-datatypes ((SeekEntryResult!4764 0))(
  ( (MissingZero!4764 (index!21280 (_ BitVec 32))) (Found!4764 (index!21281 (_ BitVec 32))) (Intermediate!4764 (undefined!5576 Bool) (index!21282 (_ BitVec 32)) (x!50227 (_ BitVec 32))) (Undefined!4764) (MissingVacant!4764 (index!21283 (_ BitVec 32))) )
))
(declare-fun lt!245850 () SeekEntryResult!4764)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!535586 (= res!330790 (or (= lt!245850 (MissingZero!4764 i!1153)) (= lt!245850 (MissingVacant!4764 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33934 (_ BitVec 32)) SeekEntryResult!4764)

(assert (=> b!535586 (= lt!245850 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun b!535587 () Bool)

(declare-fun e!311088 () Bool)

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!535587 (= e!311088 (and (not (= (select (arr!16306 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16306 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16306 a!3154) index!1177) (select (arr!16306 a!3154) j!147))) (bvsge mask!3216 #b00000000000000000000000000000000) (bvsge index!1177 (bvadd #b00000000000000000000000000000001 mask!3216))))))

(declare-fun b!535588 () Bool)

(declare-fun res!330799 () Bool)

(assert (=> b!535588 (=> (not res!330799) (not e!311088))))

(declare-fun lt!245851 () SeekEntryResult!4764)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33934 (_ BitVec 32)) SeekEntryResult!4764)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!535588 (= res!330799 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16306 a!3154) j!147) mask!3216) (select (arr!16306 a!3154) j!147) a!3154 mask!3216) lt!245851))))

(declare-fun b!535589 () Bool)

(declare-fun res!330794 () Bool)

(assert (=> b!535589 (=> (not res!330794) (not e!311090))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33934 (_ BitVec 32)) Bool)

(assert (=> b!535589 (= res!330794 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!535590 () Bool)

(declare-fun res!330792 () Bool)

(assert (=> b!535590 (=> (not res!330792) (not e!311091))))

(assert (=> b!535590 (= res!330792 (and (= (size!16670 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16670 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16670 a!3154)) (not (= i!1153 j!147))))))

(declare-fun res!330798 () Bool)

(assert (=> start!48722 (=> (not res!330798) (not e!311091))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48722 (= res!330798 (validMask!0 mask!3216))))

(assert (=> start!48722 e!311091))

(assert (=> start!48722 true))

(declare-fun array_inv!12102 (array!33934) Bool)

(assert (=> start!48722 (array_inv!12102 a!3154)))

(declare-fun b!535591 () Bool)

(assert (=> b!535591 (= e!311090 e!311088)))

(declare-fun res!330800 () Bool)

(assert (=> b!535591 (=> (not res!330800) (not e!311088))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!535591 (= res!330800 (= lt!245851 (Intermediate!4764 false resIndex!32 resX!32)))))

(declare-fun x!1030 () (_ BitVec 32))

(assert (=> b!535591 (= lt!245851 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16306 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!535592 () Bool)

(declare-fun res!330797 () Bool)

(assert (=> b!535592 (=> (not res!330797) (not e!311091))))

(declare-fun arrayContainsKey!0 (array!33934 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!535592 (= res!330797 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!535593 () Bool)

(declare-fun res!330795 () Bool)

(assert (=> b!535593 (=> (not res!330795) (not e!311090))))

(assert (=> b!535593 (= res!330795 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16670 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16670 a!3154)) (= (select (arr!16306 a!3154) resIndex!32) (select (arr!16306 a!3154) j!147))))))

(declare-fun b!535594 () Bool)

(declare-fun res!330791 () Bool)

(assert (=> b!535594 (=> (not res!330791) (not e!311091))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!535594 (= res!330791 (validKeyInArray!0 (select (arr!16306 a!3154) j!147)))))

(declare-fun b!535595 () Bool)

(declare-fun res!330796 () Bool)

(assert (=> b!535595 (=> (not res!330796) (not e!311091))))

(assert (=> b!535595 (= res!330796 (validKeyInArray!0 k0!1998))))

(assert (= (and start!48722 res!330798) b!535590))

(assert (= (and b!535590 res!330792) b!535594))

(assert (= (and b!535594 res!330791) b!535595))

(assert (= (and b!535595 res!330796) b!535592))

(assert (= (and b!535592 res!330797) b!535586))

(assert (= (and b!535586 res!330790) b!535589))

(assert (= (and b!535589 res!330794) b!535585))

(assert (= (and b!535585 res!330793) b!535593))

(assert (= (and b!535593 res!330795) b!535591))

(assert (= (and b!535591 res!330800) b!535588))

(assert (= (and b!535588 res!330799) b!535587))

(declare-fun m!515149 () Bool)

(assert (=> b!535586 m!515149))

(declare-fun m!515151 () Bool)

(assert (=> b!535592 m!515151))

(declare-fun m!515153 () Bool)

(assert (=> b!535588 m!515153))

(assert (=> b!535588 m!515153))

(declare-fun m!515155 () Bool)

(assert (=> b!535588 m!515155))

(assert (=> b!535588 m!515155))

(assert (=> b!535588 m!515153))

(declare-fun m!515157 () Bool)

(assert (=> b!535588 m!515157))

(assert (=> b!535591 m!515153))

(assert (=> b!535591 m!515153))

(declare-fun m!515159 () Bool)

(assert (=> b!535591 m!515159))

(declare-fun m!515161 () Bool)

(assert (=> b!535593 m!515161))

(assert (=> b!535593 m!515153))

(declare-fun m!515163 () Bool)

(assert (=> b!535587 m!515163))

(assert (=> b!535587 m!515153))

(declare-fun m!515165 () Bool)

(assert (=> b!535585 m!515165))

(declare-fun m!515167 () Bool)

(assert (=> b!535589 m!515167))

(declare-fun m!515169 () Bool)

(assert (=> start!48722 m!515169))

(declare-fun m!515171 () Bool)

(assert (=> start!48722 m!515171))

(declare-fun m!515173 () Bool)

(assert (=> b!535595 m!515173))

(assert (=> b!535594 m!515153))

(assert (=> b!535594 m!515153))

(declare-fun m!515175 () Bool)

(assert (=> b!535594 m!515175))

(check-sat (not start!48722) (not b!535585) (not b!535588) (not b!535591) (not b!535594) (not b!535592) (not b!535589) (not b!535595) (not b!535586))
(check-sat)
