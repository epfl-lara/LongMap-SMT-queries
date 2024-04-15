; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48876 () Bool)

(assert start!48876)

(declare-fun b!538527 () Bool)

(declare-fun e!312244 () Bool)

(declare-fun e!312247 () Bool)

(assert (=> b!538527 (= e!312244 e!312247)))

(declare-fun res!333882 () Bool)

(assert (=> b!538527 (=> (not res!333882) (not e!312247))))

(declare-datatypes ((SeekEntryResult!4843 0))(
  ( (MissingZero!4843 (index!21596 (_ BitVec 32))) (Found!4843 (index!21597 (_ BitVec 32))) (Intermediate!4843 (undefined!5655 Bool) (index!21598 (_ BitVec 32)) (x!50525 (_ BitVec 32))) (Undefined!4843) (MissingVacant!4843 (index!21599 (_ BitVec 32))) )
))
(declare-fun lt!246729 () SeekEntryResult!4843)

(declare-fun lt!246728 () SeekEntryResult!4843)

(declare-fun lt!246727 () SeekEntryResult!4843)

(assert (=> b!538527 (= res!333882 (and (= lt!246728 lt!246727) (= lt!246729 lt!246728)))))

(declare-fun lt!246730 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34098 0))(
  ( (array!34099 (arr!16388 (Array (_ BitVec 32) (_ BitVec 64))) (size!16753 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34098)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34098 (_ BitVec 32)) SeekEntryResult!4843)

(assert (=> b!538527 (= lt!246728 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246730 (select (arr!16388 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!538528 () Bool)

(declare-fun res!333883 () Bool)

(declare-fun e!312248 () Bool)

(assert (=> b!538528 (=> (not res!333883) (not e!312248))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!538528 (= res!333883 (validKeyInArray!0 (select (arr!16388 a!3154) j!147)))))

(declare-fun b!538529 () Bool)

(declare-fun res!333886 () Bool)

(declare-fun e!312245 () Bool)

(assert (=> b!538529 (=> (not res!333886) (not e!312245))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34098 (_ BitVec 32)) Bool)

(assert (=> b!538529 (= res!333886 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!538530 () Bool)

(declare-fun e!312246 () Bool)

(assert (=> b!538530 (= e!312245 e!312246)))

(declare-fun res!333885 () Bool)

(assert (=> b!538530 (=> (not res!333885) (not e!312246))))

(declare-fun lt!246733 () SeekEntryResult!4843)

(assert (=> b!538530 (= res!333885 (= lt!246733 lt!246727))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!538530 (= lt!246727 (Intermediate!4843 false resIndex!32 resX!32))))

(declare-fun index!1177 () (_ BitVec 32))

(assert (=> b!538530 (= lt!246733 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16388 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!538531 () Bool)

(declare-fun res!333874 () Bool)

(assert (=> b!538531 (=> (not res!333874) (not e!312245))))

(declare-datatypes ((List!10546 0))(
  ( (Nil!10543) (Cons!10542 (h!11485 (_ BitVec 64)) (t!16765 List!10546)) )
))
(declare-fun arrayNoDuplicates!0 (array!34098 (_ BitVec 32) List!10546) Bool)

(assert (=> b!538531 (= res!333874 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10543))))

(declare-fun b!538532 () Bool)

(assert (=> b!538532 (= e!312248 e!312245)))

(declare-fun res!333879 () Bool)

(assert (=> b!538532 (=> (not res!333879) (not e!312245))))

(declare-fun lt!246731 () SeekEntryResult!4843)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!538532 (= res!333879 (or (= lt!246731 (MissingZero!4843 i!1153)) (= lt!246731 (MissingVacant!4843 i!1153))))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34098 (_ BitVec 32)) SeekEntryResult!4843)

(assert (=> b!538532 (= lt!246731 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!538533 () Bool)

(declare-fun e!312249 () Bool)

(assert (=> b!538533 (= e!312249 e!312244)))

(declare-fun res!333878 () Bool)

(assert (=> b!538533 (=> (not res!333878) (not e!312244))))

(assert (=> b!538533 (= res!333878 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246730 #b00000000000000000000000000000000) (bvslt lt!246730 (size!16753 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!538533 (= lt!246730 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!538534 () Bool)

(declare-fun res!333881 () Bool)

(assert (=> b!538534 (=> (not res!333881) (not e!312245))))

(assert (=> b!538534 (= res!333881 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16753 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16753 a!3154)) (= (select (arr!16388 a!3154) resIndex!32) (select (arr!16388 a!3154) j!147))))))

(declare-fun b!538535 () Bool)

(assert (=> b!538535 (= e!312246 e!312249)))

(declare-fun res!333877 () Bool)

(assert (=> b!538535 (=> (not res!333877) (not e!312249))))

(assert (=> b!538535 (= res!333877 (and (= lt!246729 lt!246733) (not (= (select (arr!16388 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16388 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16388 a!3154) index!1177) (select (arr!16388 a!3154) j!147)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!538535 (= lt!246729 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16388 a!3154) j!147) mask!3216) (select (arr!16388 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!538537 () Bool)

(declare-fun res!333876 () Bool)

(assert (=> b!538537 (=> (not res!333876) (not e!312248))))

(assert (=> b!538537 (= res!333876 (validKeyInArray!0 k0!1998))))

(declare-fun b!538538 () Bool)

(declare-fun e!312242 () Bool)

(assert (=> b!538538 (= e!312242 (validKeyInArray!0 (select (store (arr!16388 a!3154) i!1153 k0!1998) j!147)))))

(declare-fun b!538539 () Bool)

(assert (=> b!538539 (= e!312247 (not e!312242))))

(declare-fun res!333884 () Bool)

(assert (=> b!538539 (=> res!333884 e!312242)))

(assert (=> b!538539 (= res!333884 (or (bvslt mask!3216 #b00000000000000000000000000000000) (bvsge index!1177 (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsgt x!1030 #b01111111111111111111111111111110)))))

(assert (=> b!538539 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246730 (select (store (arr!16388 a!3154) i!1153 k0!1998) j!147) (array!34099 (store (arr!16388 a!3154) i!1153 k0!1998) (size!16753 a!3154)) mask!3216) lt!246727)))

(declare-datatypes ((Unit!16858 0))(
  ( (Unit!16859) )
))
(declare-fun lt!246732 () Unit!16858)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!34098 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16858)

(assert (=> b!538539 (= lt!246732 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3154 i!1153 k0!1998 j!147 lt!246730 (bvadd #b00000000000000000000000000000001 x!1030) resIndex!32 resX!32 mask!3216))))

(declare-fun b!538540 () Bool)

(declare-fun res!333875 () Bool)

(assert (=> b!538540 (=> (not res!333875) (not e!312248))))

(assert (=> b!538540 (= res!333875 (and (= (size!16753 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16753 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16753 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!538536 () Bool)

(declare-fun res!333887 () Bool)

(assert (=> b!538536 (=> (not res!333887) (not e!312248))))

(declare-fun arrayContainsKey!0 (array!34098 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!538536 (= res!333887 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun res!333880 () Bool)

(assert (=> start!48876 (=> (not res!333880) (not e!312248))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48876 (= res!333880 (validMask!0 mask!3216))))

(assert (=> start!48876 e!312248))

(assert (=> start!48876 true))

(declare-fun array_inv!12271 (array!34098) Bool)

(assert (=> start!48876 (array_inv!12271 a!3154)))

(assert (= (and start!48876 res!333880) b!538540))

(assert (= (and b!538540 res!333875) b!538528))

(assert (= (and b!538528 res!333883) b!538537))

(assert (= (and b!538537 res!333876) b!538536))

(assert (= (and b!538536 res!333887) b!538532))

(assert (= (and b!538532 res!333879) b!538529))

(assert (= (and b!538529 res!333886) b!538531))

(assert (= (and b!538531 res!333874) b!538534))

(assert (= (and b!538534 res!333881) b!538530))

(assert (= (and b!538530 res!333885) b!538535))

(assert (= (and b!538535 res!333877) b!538533))

(assert (= (and b!538533 res!333878) b!538527))

(assert (= (and b!538527 res!333882) b!538539))

(assert (= (and b!538539 (not res!333884)) b!538538))

(declare-fun m!517153 () Bool)

(assert (=> b!538536 m!517153))

(declare-fun m!517155 () Bool)

(assert (=> b!538529 m!517155))

(declare-fun m!517157 () Bool)

(assert (=> b!538538 m!517157))

(declare-fun m!517159 () Bool)

(assert (=> b!538538 m!517159))

(assert (=> b!538538 m!517159))

(declare-fun m!517161 () Bool)

(assert (=> b!538538 m!517161))

(declare-fun m!517163 () Bool)

(assert (=> b!538534 m!517163))

(declare-fun m!517165 () Bool)

(assert (=> b!538534 m!517165))

(assert (=> b!538530 m!517165))

(assert (=> b!538530 m!517165))

(declare-fun m!517167 () Bool)

(assert (=> b!538530 m!517167))

(assert (=> b!538527 m!517165))

(assert (=> b!538527 m!517165))

(declare-fun m!517169 () Bool)

(assert (=> b!538527 m!517169))

(declare-fun m!517171 () Bool)

(assert (=> b!538537 m!517171))

(declare-fun m!517173 () Bool)

(assert (=> b!538533 m!517173))

(declare-fun m!517175 () Bool)

(assert (=> b!538532 m!517175))

(declare-fun m!517177 () Bool)

(assert (=> b!538535 m!517177))

(assert (=> b!538535 m!517165))

(assert (=> b!538535 m!517165))

(declare-fun m!517179 () Bool)

(assert (=> b!538535 m!517179))

(assert (=> b!538535 m!517179))

(assert (=> b!538535 m!517165))

(declare-fun m!517181 () Bool)

(assert (=> b!538535 m!517181))

(declare-fun m!517183 () Bool)

(assert (=> b!538531 m!517183))

(assert (=> b!538528 m!517165))

(assert (=> b!538528 m!517165))

(declare-fun m!517185 () Bool)

(assert (=> b!538528 m!517185))

(assert (=> b!538539 m!517157))

(assert (=> b!538539 m!517159))

(assert (=> b!538539 m!517159))

(declare-fun m!517187 () Bool)

(assert (=> b!538539 m!517187))

(declare-fun m!517189 () Bool)

(assert (=> b!538539 m!517189))

(declare-fun m!517191 () Bool)

(assert (=> start!48876 m!517191))

(declare-fun m!517193 () Bool)

(assert (=> start!48876 m!517193))

(check-sat (not b!538531) (not b!538537) (not b!538538) (not b!538535) (not b!538532) (not b!538527) (not b!538529) (not b!538533) (not start!48876) (not b!538530) (not b!538536) (not b!538528) (not b!538539))
(check-sat)
