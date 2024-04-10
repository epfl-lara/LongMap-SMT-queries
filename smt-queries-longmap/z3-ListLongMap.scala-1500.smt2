; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28436 () Bool)

(assert start!28436)

(declare-fun b!291194 () Bool)

(declare-fun e!184262 () Bool)

(declare-fun e!184260 () Bool)

(assert (=> b!291194 (= e!184262 e!184260)))

(declare-fun res!152533 () Bool)

(assert (=> b!291194 (=> (not res!152533) (not e!184260))))

(declare-datatypes ((SeekEntryResult!2127 0))(
  ( (MissingZero!2127 (index!10678 (_ BitVec 32))) (Found!2127 (index!10679 (_ BitVec 32))) (Intermediate!2127 (undefined!2939 Bool) (index!10680 (_ BitVec 32)) (x!28866 (_ BitVec 32))) (Undefined!2127) (MissingVacant!2127 (index!10681 (_ BitVec 32))) )
))
(declare-fun lt!144009 () SeekEntryResult!2127)

(declare-fun lt!144013 () Bool)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!291194 (= res!152533 (or lt!144013 (= lt!144009 (MissingVacant!2127 i!1256))))))

(assert (=> b!291194 (= lt!144013 (= lt!144009 (MissingZero!2127 i!1256)))))

(declare-datatypes ((array!14705 0))(
  ( (array!14706 (arr!6978 (Array (_ BitVec 32) (_ BitVec 64))) (size!7330 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14705)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14705 (_ BitVec 32)) SeekEntryResult!2127)

(assert (=> b!291194 (= lt!144009 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!291195 () Bool)

(declare-fun e!184259 () Bool)

(assert (=> b!291195 (= e!184260 e!184259)))

(declare-fun res!152537 () Bool)

(assert (=> b!291195 (=> (not res!152537) (not e!184259))))

(assert (=> b!291195 (= res!152537 (and (not lt!144013) (= lt!144009 (MissingVacant!2127 i!1256))))))

(declare-fun lt!144008 () (_ BitVec 32))

(declare-fun lt!144010 () SeekEntryResult!2127)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14705 (_ BitVec 32)) SeekEntryResult!2127)

(assert (=> b!291195 (= lt!144010 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144008 k0!2524 (array!14706 (store (arr!6978 a!3312) i!1256 k0!2524) (size!7330 a!3312)) mask!3809))))

(declare-fun lt!144012 () SeekEntryResult!2127)

(assert (=> b!291195 (= lt!144012 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144008 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!291195 (= lt!144008 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!291196 () Bool)

(declare-fun res!152534 () Bool)

(assert (=> b!291196 (=> (not res!152534) (not e!184262))))

(declare-fun arrayContainsKey!0 (array!14705 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!291196 (= res!152534 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!291197 () Bool)

(declare-fun e!184258 () Bool)

(assert (=> b!291197 (= e!184259 e!184258)))

(declare-fun res!152536 () Bool)

(assert (=> b!291197 (=> (not res!152536) (not e!184258))))

(declare-fun lt!144011 () Bool)

(assert (=> b!291197 (= res!152536 (and (or lt!144011 (not (undefined!2939 lt!144012))) (not lt!144011) (= (select (arr!6978 a!3312) (index!10680 lt!144012)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(get-info :version)

(assert (=> b!291197 (= lt!144011 (not ((_ is Intermediate!2127) lt!144012)))))

(declare-fun b!291198 () Bool)

(declare-fun res!152531 () Bool)

(assert (=> b!291198 (=> (not res!152531) (not e!184260))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14705 (_ BitVec 32)) Bool)

(assert (=> b!291198 (= res!152531 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!291199 () Bool)

(declare-fun res!152538 () Bool)

(assert (=> b!291199 (=> (not res!152538) (not e!184262))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!291199 (= res!152538 (validKeyInArray!0 k0!2524))))

(declare-fun b!291200 () Bool)

(assert (=> b!291200 (= e!184258 (not (= lt!144012 (Intermediate!2127 false (index!10680 lt!144012) (x!28866 lt!144012)))))))

(assert (=> b!291200 (= (index!10680 lt!144012) i!1256)))

(declare-fun res!152532 () Bool)

(assert (=> start!28436 (=> (not res!152532) (not e!184262))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28436 (= res!152532 (validMask!0 mask!3809))))

(assert (=> start!28436 e!184262))

(assert (=> start!28436 true))

(declare-fun array_inv!4941 (array!14705) Bool)

(assert (=> start!28436 (array_inv!4941 a!3312)))

(declare-fun b!291193 () Bool)

(declare-fun res!152535 () Bool)

(assert (=> b!291193 (=> (not res!152535) (not e!184262))))

(assert (=> b!291193 (= res!152535 (and (= (size!7330 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7330 a!3312))))))

(assert (= (and start!28436 res!152532) b!291193))

(assert (= (and b!291193 res!152535) b!291199))

(assert (= (and b!291199 res!152538) b!291196))

(assert (= (and b!291196 res!152534) b!291194))

(assert (= (and b!291194 res!152533) b!291198))

(assert (= (and b!291198 res!152531) b!291195))

(assert (= (and b!291195 res!152537) b!291197))

(assert (= (and b!291197 res!152536) b!291200))

(declare-fun m!305149 () Bool)

(assert (=> b!291199 m!305149))

(declare-fun m!305151 () Bool)

(assert (=> b!291194 m!305151))

(declare-fun m!305153 () Bool)

(assert (=> b!291198 m!305153))

(declare-fun m!305155 () Bool)

(assert (=> b!291195 m!305155))

(declare-fun m!305157 () Bool)

(assert (=> b!291195 m!305157))

(declare-fun m!305159 () Bool)

(assert (=> b!291195 m!305159))

(declare-fun m!305161 () Bool)

(assert (=> b!291195 m!305161))

(declare-fun m!305163 () Bool)

(assert (=> b!291196 m!305163))

(declare-fun m!305165 () Bool)

(assert (=> start!28436 m!305165))

(declare-fun m!305167 () Bool)

(assert (=> start!28436 m!305167))

(declare-fun m!305169 () Bool)

(assert (=> b!291197 m!305169))

(check-sat (not b!291196) (not b!291195) (not b!291194) (not b!291198) (not b!291199) (not start!28436))
(check-sat)
