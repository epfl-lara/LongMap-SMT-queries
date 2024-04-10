; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49616 () Bool)

(assert start!49616)

(declare-fun b!545966 () Bool)

(declare-fun e!315560 () Bool)

(declare-fun e!315556 () Bool)

(assert (=> b!545966 (= e!315560 e!315556)))

(declare-fun res!339905 () Bool)

(assert (=> b!545966 (=> (not res!339905) (not e!315556))))

(declare-datatypes ((array!34429 0))(
  ( (array!34430 (arr!16543 (Array (_ BitVec 32) (_ BitVec 64))) (size!16907 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34429)

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun lt!249099 () (_ BitVec 32))

(assert (=> b!545966 (= res!339905 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!249099 #b00000000000000000000000000000000) (bvslt lt!249099 (size!16907 a!3154))))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!545966 (= lt!249099 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!545967 () Bool)

(declare-fun res!339898 () Bool)

(declare-fun e!315561 () Bool)

(assert (=> b!545967 (=> (not res!339898) (not e!315561))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34429 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!545967 (= res!339898 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!545968 () Bool)

(declare-fun e!315557 () Bool)

(assert (=> b!545968 (= e!315557 (not true))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5001 0))(
  ( (MissingZero!5001 (index!22228 (_ BitVec 32))) (Found!5001 (index!22229 (_ BitVec 32))) (Intermediate!5001 (undefined!5813 Bool) (index!22230 (_ BitVec 32)) (x!51153 (_ BitVec 32))) (Undefined!5001) (MissingVacant!5001 (index!22231 (_ BitVec 32))) )
))
(declare-fun lt!249100 () SeekEntryResult!5001)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34429 (_ BitVec 32)) SeekEntryResult!5001)

(assert (=> b!545968 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!249099 (select (store (arr!16543 a!3154) i!1153 k0!1998) j!147) (array!34430 (store (arr!16543 a!3154) i!1153 k0!1998) (size!16907 a!3154)) mask!3216) lt!249100)))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-datatypes ((Unit!16936 0))(
  ( (Unit!16937) )
))
(declare-fun lt!249101 () Unit!16936)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!34429 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16936)

(assert (=> b!545968 (= lt!249101 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3154 i!1153 k0!1998 j!147 lt!249099 (bvadd #b00000000000000000000000000000001 x!1030) resIndex!32 resX!32 mask!3216))))

(declare-fun b!545969 () Bool)

(declare-fun res!339902 () Bool)

(declare-fun e!315555 () Bool)

(assert (=> b!545969 (=> (not res!339902) (not e!315555))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34429 (_ BitVec 32)) Bool)

(assert (=> b!545969 (= res!339902 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun res!339903 () Bool)

(assert (=> start!49616 (=> (not res!339903) (not e!315561))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49616 (= res!339903 (validMask!0 mask!3216))))

(assert (=> start!49616 e!315561))

(assert (=> start!49616 true))

(declare-fun array_inv!12339 (array!34429) Bool)

(assert (=> start!49616 (array_inv!12339 a!3154)))

(declare-fun b!545970 () Bool)

(declare-fun res!339896 () Bool)

(assert (=> b!545970 (=> (not res!339896) (not e!315561))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!545970 (= res!339896 (validKeyInArray!0 k0!1998))))

(declare-fun b!545971 () Bool)

(assert (=> b!545971 (= e!315561 e!315555)))

(declare-fun res!339894 () Bool)

(assert (=> b!545971 (=> (not res!339894) (not e!315555))))

(declare-fun lt!249098 () SeekEntryResult!5001)

(assert (=> b!545971 (= res!339894 (or (= lt!249098 (MissingZero!5001 i!1153)) (= lt!249098 (MissingVacant!5001 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34429 (_ BitVec 32)) SeekEntryResult!5001)

(assert (=> b!545971 (= lt!249098 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!545972 () Bool)

(declare-fun res!339897 () Bool)

(assert (=> b!545972 (=> (not res!339897) (not e!315561))))

(assert (=> b!545972 (= res!339897 (and (= (size!16907 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16907 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16907 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!545973 () Bool)

(declare-fun res!339899 () Bool)

(assert (=> b!545973 (=> (not res!339899) (not e!315555))))

(assert (=> b!545973 (= res!339899 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16907 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16907 a!3154)) (= (select (arr!16543 a!3154) resIndex!32) (select (arr!16543 a!3154) j!147))))))

(declare-fun b!545974 () Bool)

(declare-fun res!339893 () Bool)

(assert (=> b!545974 (=> (not res!339893) (not e!315555))))

(declare-datatypes ((List!10662 0))(
  ( (Nil!10659) (Cons!10658 (h!11622 (_ BitVec 64)) (t!16890 List!10662)) )
))
(declare-fun arrayNoDuplicates!0 (array!34429 (_ BitVec 32) List!10662) Bool)

(assert (=> b!545974 (= res!339893 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10659))))

(declare-fun b!545975 () Bool)

(declare-fun res!339904 () Bool)

(assert (=> b!545975 (=> (not res!339904) (not e!315561))))

(assert (=> b!545975 (= res!339904 (validKeyInArray!0 (select (arr!16543 a!3154) j!147)))))

(declare-fun b!545976 () Bool)

(declare-fun e!315558 () Bool)

(assert (=> b!545976 (= e!315558 e!315560)))

(declare-fun res!339901 () Bool)

(assert (=> b!545976 (=> (not res!339901) (not e!315560))))

(declare-fun lt!249102 () SeekEntryResult!5001)

(declare-fun lt!249103 () SeekEntryResult!5001)

(assert (=> b!545976 (= res!339901 (and (= lt!249102 lt!249103) (not (= (select (arr!16543 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16543 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16543 a!3154) index!1177) (select (arr!16543 a!3154) j!147)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!545976 (= lt!249102 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16543 a!3154) j!147) mask!3216) (select (arr!16543 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!545977 () Bool)

(assert (=> b!545977 (= e!315556 e!315557)))

(declare-fun res!339900 () Bool)

(assert (=> b!545977 (=> (not res!339900) (not e!315557))))

(declare-fun lt!249097 () SeekEntryResult!5001)

(assert (=> b!545977 (= res!339900 (and (= lt!249097 lt!249100) (= lt!249102 lt!249097)))))

(assert (=> b!545977 (= lt!249097 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!249099 (select (arr!16543 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!545978 () Bool)

(assert (=> b!545978 (= e!315555 e!315558)))

(declare-fun res!339895 () Bool)

(assert (=> b!545978 (=> (not res!339895) (not e!315558))))

(assert (=> b!545978 (= res!339895 (= lt!249103 lt!249100))))

(assert (=> b!545978 (= lt!249100 (Intermediate!5001 false resIndex!32 resX!32))))

(assert (=> b!545978 (= lt!249103 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16543 a!3154) j!147) a!3154 mask!3216))))

(assert (= (and start!49616 res!339903) b!545972))

(assert (= (and b!545972 res!339897) b!545975))

(assert (= (and b!545975 res!339904) b!545970))

(assert (= (and b!545970 res!339896) b!545967))

(assert (= (and b!545967 res!339898) b!545971))

(assert (= (and b!545971 res!339894) b!545969))

(assert (= (and b!545969 res!339902) b!545974))

(assert (= (and b!545974 res!339893) b!545973))

(assert (= (and b!545973 res!339899) b!545978))

(assert (= (and b!545978 res!339895) b!545976))

(assert (= (and b!545976 res!339901) b!545966))

(assert (= (and b!545966 res!339905) b!545977))

(assert (= (and b!545977 res!339900) b!545968))

(declare-fun m!523513 () Bool)

(assert (=> b!545974 m!523513))

(declare-fun m!523515 () Bool)

(assert (=> b!545971 m!523515))

(declare-fun m!523517 () Bool)

(assert (=> b!545968 m!523517))

(declare-fun m!523519 () Bool)

(assert (=> b!545968 m!523519))

(assert (=> b!545968 m!523519))

(declare-fun m!523521 () Bool)

(assert (=> b!545968 m!523521))

(declare-fun m!523523 () Bool)

(assert (=> b!545968 m!523523))

(declare-fun m!523525 () Bool)

(assert (=> start!49616 m!523525))

(declare-fun m!523527 () Bool)

(assert (=> start!49616 m!523527))

(declare-fun m!523529 () Bool)

(assert (=> b!545969 m!523529))

(declare-fun m!523531 () Bool)

(assert (=> b!545977 m!523531))

(assert (=> b!545977 m!523531))

(declare-fun m!523533 () Bool)

(assert (=> b!545977 m!523533))

(declare-fun m!523535 () Bool)

(assert (=> b!545976 m!523535))

(assert (=> b!545976 m!523531))

(assert (=> b!545976 m!523531))

(declare-fun m!523537 () Bool)

(assert (=> b!545976 m!523537))

(assert (=> b!545976 m!523537))

(assert (=> b!545976 m!523531))

(declare-fun m!523539 () Bool)

(assert (=> b!545976 m!523539))

(declare-fun m!523541 () Bool)

(assert (=> b!545967 m!523541))

(declare-fun m!523543 () Bool)

(assert (=> b!545970 m!523543))

(assert (=> b!545978 m!523531))

(assert (=> b!545978 m!523531))

(declare-fun m!523545 () Bool)

(assert (=> b!545978 m!523545))

(declare-fun m!523547 () Bool)

(assert (=> b!545966 m!523547))

(assert (=> b!545975 m!523531))

(assert (=> b!545975 m!523531))

(declare-fun m!523549 () Bool)

(assert (=> b!545975 m!523549))

(declare-fun m!523551 () Bool)

(assert (=> b!545973 m!523551))

(assert (=> b!545973 m!523531))

(check-sat (not b!545978) (not b!545969) (not b!545971) (not b!545976) (not start!49616) (not b!545977) (not b!545970) (not b!545967) (not b!545974) (not b!545966) (not b!545968) (not b!545975))
(check-sat)
