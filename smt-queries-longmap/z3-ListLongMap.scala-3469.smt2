; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48132 () Bool)

(assert start!48132)

(declare-fun res!325921 () Bool)

(declare-fun e!308831 () Bool)

(assert (=> start!48132 (=> (not res!325921) (not e!308831))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48132 (= res!325921 (validMask!0 mask!3524))))

(assert (=> start!48132 e!308831))

(assert (=> start!48132 true))

(declare-datatypes ((array!33578 0))(
  ( (array!33579 (arr!16136 (Array (_ BitVec 32) (_ BitVec 64))) (size!16501 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33578)

(declare-fun array_inv!12019 (array!33578) Bool)

(assert (=> start!48132 (array_inv!12019 a!3235)))

(declare-fun b!530064 () Bool)

(declare-fun e!308833 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4600 0))(
  ( (MissingZero!4600 (index!20624 (_ BitVec 32))) (Found!4600 (index!20625 (_ BitVec 32))) (Intermediate!4600 (undefined!5412 Bool) (index!20626 (_ BitVec 32)) (x!49601 (_ BitVec 32))) (Undefined!4600) (MissingVacant!4600 (index!20627 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33578 (_ BitVec 32)) SeekEntryResult!4600)

(assert (=> b!530064 (= e!308833 (= (seekEntryOrOpen!0 (select (arr!16136 a!3235) j!176) a!3235 mask!3524) (Found!4600 j!176)))))

(declare-fun b!530065 () Bool)

(declare-fun res!325922 () Bool)

(assert (=> b!530065 (=> (not res!325922) (not e!308831))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!530065 (= res!325922 (and (= (size!16501 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16501 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16501 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!530066 () Bool)

(declare-fun res!325920 () Bool)

(assert (=> b!530066 (=> (not res!325920) (not e!308831))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!530066 (= res!325920 (validKeyInArray!0 k0!2280))))

(declare-fun b!530067 () Bool)

(declare-fun e!308835 () Bool)

(assert (=> b!530067 (= e!308835 true)))

(declare-fun lt!244461 () SeekEntryResult!4600)

(declare-fun lt!244465 () array!33578)

(declare-fun lt!244467 () (_ BitVec 64))

(assert (=> b!530067 (= lt!244461 (seekEntryOrOpen!0 lt!244467 lt!244465 mask!3524))))

(assert (=> b!530067 false))

(declare-fun b!530068 () Bool)

(declare-fun res!325917 () Bool)

(assert (=> b!530068 (=> (not res!325917) (not e!308831))))

(assert (=> b!530068 (= res!325917 (validKeyInArray!0 (select (arr!16136 a!3235) j!176)))))

(declare-fun b!530069 () Bool)

(declare-fun res!325919 () Bool)

(assert (=> b!530069 (=> (not res!325919) (not e!308831))))

(declare-fun arrayContainsKey!0 (array!33578 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!530069 (= res!325919 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!530070 () Bool)

(declare-fun e!308832 () Bool)

(assert (=> b!530070 (= e!308832 e!308835)))

(declare-fun res!325918 () Bool)

(assert (=> b!530070 (=> res!325918 e!308835)))

(declare-fun lt!244462 () Bool)

(declare-fun lt!244468 () SeekEntryResult!4600)

(assert (=> b!530070 (= res!325918 (or (and (not lt!244462) (undefined!5412 lt!244468)) (and (not lt!244462) (not (undefined!5412 lt!244468)))))))

(get-info :version)

(assert (=> b!530070 (= lt!244462 (not ((_ is Intermediate!4600) lt!244468)))))

(declare-fun b!530071 () Bool)

(declare-fun res!325912 () Bool)

(declare-fun e!308830 () Bool)

(assert (=> b!530071 (=> (not res!325912) (not e!308830))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33578 (_ BitVec 32)) Bool)

(assert (=> b!530071 (= res!325912 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!530072 () Bool)

(assert (=> b!530072 (= e!308830 (not e!308832))))

(declare-fun res!325913 () Bool)

(assert (=> b!530072 (=> res!325913 e!308832)))

(declare-fun lt!244464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33578 (_ BitVec 32)) SeekEntryResult!4600)

(assert (=> b!530072 (= res!325913 (= lt!244468 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244464 lt!244467 lt!244465 mask!3524)))))

(declare-fun lt!244466 () (_ BitVec 32))

(assert (=> b!530072 (= lt!244468 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244466 (select (arr!16136 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!530072 (= lt!244464 (toIndex!0 lt!244467 mask!3524))))

(assert (=> b!530072 (= lt!244467 (select (store (arr!16136 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!530072 (= lt!244466 (toIndex!0 (select (arr!16136 a!3235) j!176) mask!3524))))

(assert (=> b!530072 (= lt!244465 (array!33579 (store (arr!16136 a!3235) i!1204 k0!2280) (size!16501 a!3235)))))

(assert (=> b!530072 e!308833))

(declare-fun res!325914 () Bool)

(assert (=> b!530072 (=> (not res!325914) (not e!308833))))

(assert (=> b!530072 (= res!325914 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16798 0))(
  ( (Unit!16799) )
))
(declare-fun lt!244463 () Unit!16798)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33578 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16798)

(assert (=> b!530072 (= lt!244463 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!530073 () Bool)

(assert (=> b!530073 (= e!308831 e!308830)))

(declare-fun res!325916 () Bool)

(assert (=> b!530073 (=> (not res!325916) (not e!308830))))

(declare-fun lt!244460 () SeekEntryResult!4600)

(assert (=> b!530073 (= res!325916 (or (= lt!244460 (MissingZero!4600 i!1204)) (= lt!244460 (MissingVacant!4600 i!1204))))))

(assert (=> b!530073 (= lt!244460 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!530074 () Bool)

(declare-fun res!325915 () Bool)

(assert (=> b!530074 (=> (not res!325915) (not e!308830))))

(declare-datatypes ((List!10333 0))(
  ( (Nil!10330) (Cons!10329 (h!11269 (_ BitVec 64)) (t!16552 List!10333)) )
))
(declare-fun arrayNoDuplicates!0 (array!33578 (_ BitVec 32) List!10333) Bool)

(assert (=> b!530074 (= res!325915 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10330))))

(assert (= (and start!48132 res!325921) b!530065))

(assert (= (and b!530065 res!325922) b!530068))

(assert (= (and b!530068 res!325917) b!530066))

(assert (= (and b!530066 res!325920) b!530069))

(assert (= (and b!530069 res!325919) b!530073))

(assert (= (and b!530073 res!325916) b!530071))

(assert (= (and b!530071 res!325912) b!530074))

(assert (= (and b!530074 res!325915) b!530072))

(assert (= (and b!530072 res!325914) b!530064))

(assert (= (and b!530072 (not res!325913)) b!530070))

(assert (= (and b!530070 (not res!325918)) b!530067))

(declare-fun m!510151 () Bool)

(assert (=> b!530069 m!510151))

(declare-fun m!510153 () Bool)

(assert (=> start!48132 m!510153))

(declare-fun m!510155 () Bool)

(assert (=> start!48132 m!510155))

(declare-fun m!510157 () Bool)

(assert (=> b!530064 m!510157))

(assert (=> b!530064 m!510157))

(declare-fun m!510159 () Bool)

(assert (=> b!530064 m!510159))

(declare-fun m!510161 () Bool)

(assert (=> b!530066 m!510161))

(declare-fun m!510163 () Bool)

(assert (=> b!530073 m!510163))

(declare-fun m!510165 () Bool)

(assert (=> b!530074 m!510165))

(declare-fun m!510167 () Bool)

(assert (=> b!530067 m!510167))

(declare-fun m!510169 () Bool)

(assert (=> b!530072 m!510169))

(declare-fun m!510171 () Bool)

(assert (=> b!530072 m!510171))

(declare-fun m!510173 () Bool)

(assert (=> b!530072 m!510173))

(declare-fun m!510175 () Bool)

(assert (=> b!530072 m!510175))

(assert (=> b!530072 m!510157))

(declare-fun m!510177 () Bool)

(assert (=> b!530072 m!510177))

(assert (=> b!530072 m!510157))

(declare-fun m!510179 () Bool)

(assert (=> b!530072 m!510179))

(declare-fun m!510181 () Bool)

(assert (=> b!530072 m!510181))

(declare-fun m!510183 () Bool)

(assert (=> b!530072 m!510183))

(assert (=> b!530072 m!510157))

(declare-fun m!510185 () Bool)

(assert (=> b!530071 m!510185))

(assert (=> b!530068 m!510157))

(assert (=> b!530068 m!510157))

(declare-fun m!510187 () Bool)

(assert (=> b!530068 m!510187))

(check-sat (not start!48132) (not b!530072) (not b!530066) (not b!530071) (not b!530073) (not b!530064) (not b!530068) (not b!530067) (not b!530074) (not b!530069))
(check-sat)
