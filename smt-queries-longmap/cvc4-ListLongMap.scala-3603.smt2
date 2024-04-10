; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49612 () Bool)

(assert start!49612)

(declare-fun b!545888 () Bool)

(declare-fun e!315517 () Bool)

(assert (=> b!545888 (= e!315517 (not true))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34425 0))(
  ( (array!34426 (arr!16541 (Array (_ BitVec 32) (_ BitVec 64))) (size!16905 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34425)

(declare-fun lt!249059 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4999 0))(
  ( (MissingZero!4999 (index!22220 (_ BitVec 32))) (Found!4999 (index!22221 (_ BitVec 32))) (Intermediate!4999 (undefined!5811 Bool) (index!22222 (_ BitVec 32)) (x!51143 (_ BitVec 32))) (Undefined!4999) (MissingVacant!4999 (index!22223 (_ BitVec 32))) )
))
(declare-fun lt!249060 () SeekEntryResult!4999)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34425 (_ BitVec 32)) SeekEntryResult!4999)

(assert (=> b!545888 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!249059 (select (store (arr!16541 a!3154) i!1153 k!1998) j!147) (array!34426 (store (arr!16541 a!3154) i!1153 k!1998) (size!16905 a!3154)) mask!3216) lt!249060)))

(declare-datatypes ((Unit!16932 0))(
  ( (Unit!16933) )
))
(declare-fun lt!249058 () Unit!16932)

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!34425 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16932)

(assert (=> b!545888 (= lt!249058 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3154 i!1153 k!1998 j!147 lt!249059 (bvadd #b00000000000000000000000000000001 x!1030) resIndex!32 resX!32 mask!3216))))

(declare-fun b!545889 () Bool)

(declare-fun e!315519 () Bool)

(declare-fun e!315515 () Bool)

(assert (=> b!545889 (= e!315519 e!315515)))

(declare-fun res!339823 () Bool)

(assert (=> b!545889 (=> (not res!339823) (not e!315515))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun lt!249055 () SeekEntryResult!4999)

(declare-fun lt!249057 () SeekEntryResult!4999)

(assert (=> b!545889 (= res!339823 (and (= lt!249055 lt!249057) (not (= (select (arr!16541 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16541 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16541 a!3154) index!1177) (select (arr!16541 a!3154) j!147)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!545889 (= lt!249055 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16541 a!3154) j!147) mask!3216) (select (arr!16541 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!545890 () Bool)

(declare-fun res!339817 () Bool)

(declare-fun e!315513 () Bool)

(assert (=> b!545890 (=> (not res!339817) (not e!315513))))

(declare-datatypes ((List!10660 0))(
  ( (Nil!10657) (Cons!10656 (h!11620 (_ BitVec 64)) (t!16888 List!10660)) )
))
(declare-fun arrayNoDuplicates!0 (array!34425 (_ BitVec 32) List!10660) Bool)

(assert (=> b!545890 (= res!339817 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10657))))

(declare-fun b!545891 () Bool)

(assert (=> b!545891 (= e!315513 e!315519)))

(declare-fun res!339821 () Bool)

(assert (=> b!545891 (=> (not res!339821) (not e!315519))))

(assert (=> b!545891 (= res!339821 (= lt!249057 lt!249060))))

(assert (=> b!545891 (= lt!249060 (Intermediate!4999 false resIndex!32 resX!32))))

(assert (=> b!545891 (= lt!249057 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16541 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!545892 () Bool)

(declare-fun res!339818 () Bool)

(declare-fun e!315514 () Bool)

(assert (=> b!545892 (=> (not res!339818) (not e!315514))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!545892 (= res!339818 (validKeyInArray!0 (select (arr!16541 a!3154) j!147)))))

(declare-fun b!545893 () Bool)

(declare-fun res!339815 () Bool)

(assert (=> b!545893 (=> (not res!339815) (not e!315513))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34425 (_ BitVec 32)) Bool)

(assert (=> b!545893 (= res!339815 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!545894 () Bool)

(declare-fun res!339820 () Bool)

(assert (=> b!545894 (=> (not res!339820) (not e!315514))))

(assert (=> b!545894 (= res!339820 (and (= (size!16905 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16905 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16905 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!545895 () Bool)

(declare-fun e!315516 () Bool)

(assert (=> b!545895 (= e!315515 e!315516)))

(declare-fun res!339825 () Bool)

(assert (=> b!545895 (=> (not res!339825) (not e!315516))))

(assert (=> b!545895 (= res!339825 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!249059 #b00000000000000000000000000000000) (bvslt lt!249059 (size!16905 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!545895 (= lt!249059 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!545896 () Bool)

(declare-fun res!339816 () Bool)

(assert (=> b!545896 (=> (not res!339816) (not e!315514))))

(assert (=> b!545896 (= res!339816 (validKeyInArray!0 k!1998))))

(declare-fun b!545897 () Bool)

(assert (=> b!545897 (= e!315514 e!315513)))

(declare-fun res!339819 () Bool)

(assert (=> b!545897 (=> (not res!339819) (not e!315513))))

(declare-fun lt!249061 () SeekEntryResult!4999)

(assert (=> b!545897 (= res!339819 (or (= lt!249061 (MissingZero!4999 i!1153)) (= lt!249061 (MissingVacant!4999 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34425 (_ BitVec 32)) SeekEntryResult!4999)

(assert (=> b!545897 (= lt!249061 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!545898 () Bool)

(declare-fun res!339822 () Bool)

(assert (=> b!545898 (=> (not res!339822) (not e!315514))))

(declare-fun arrayContainsKey!0 (array!34425 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!545898 (= res!339822 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun res!339826 () Bool)

(assert (=> start!49612 (=> (not res!339826) (not e!315514))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49612 (= res!339826 (validMask!0 mask!3216))))

(assert (=> start!49612 e!315514))

(assert (=> start!49612 true))

(declare-fun array_inv!12337 (array!34425) Bool)

(assert (=> start!49612 (array_inv!12337 a!3154)))

(declare-fun b!545899 () Bool)

(declare-fun res!339824 () Bool)

(assert (=> b!545899 (=> (not res!339824) (not e!315513))))

(assert (=> b!545899 (= res!339824 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16905 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16905 a!3154)) (= (select (arr!16541 a!3154) resIndex!32) (select (arr!16541 a!3154) j!147))))))

(declare-fun b!545900 () Bool)

(assert (=> b!545900 (= e!315516 e!315517)))

(declare-fun res!339827 () Bool)

(assert (=> b!545900 (=> (not res!339827) (not e!315517))))

(declare-fun lt!249056 () SeekEntryResult!4999)

(assert (=> b!545900 (= res!339827 (and (= lt!249056 lt!249060) (= lt!249055 lt!249056)))))

(assert (=> b!545900 (= lt!249056 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!249059 (select (arr!16541 a!3154) j!147) a!3154 mask!3216))))

(assert (= (and start!49612 res!339826) b!545894))

(assert (= (and b!545894 res!339820) b!545892))

(assert (= (and b!545892 res!339818) b!545896))

(assert (= (and b!545896 res!339816) b!545898))

(assert (= (and b!545898 res!339822) b!545897))

(assert (= (and b!545897 res!339819) b!545893))

(assert (= (and b!545893 res!339815) b!545890))

(assert (= (and b!545890 res!339817) b!545899))

(assert (= (and b!545899 res!339824) b!545891))

(assert (= (and b!545891 res!339821) b!545889))

(assert (= (and b!545889 res!339823) b!545895))

(assert (= (and b!545895 res!339825) b!545900))

(assert (= (and b!545900 res!339827) b!545888))

(declare-fun m!523433 () Bool)

(assert (=> b!545888 m!523433))

(declare-fun m!523435 () Bool)

(assert (=> b!545888 m!523435))

(assert (=> b!545888 m!523435))

(declare-fun m!523437 () Bool)

(assert (=> b!545888 m!523437))

(declare-fun m!523439 () Bool)

(assert (=> b!545888 m!523439))

(declare-fun m!523441 () Bool)

(assert (=> b!545899 m!523441))

(declare-fun m!523443 () Bool)

(assert (=> b!545899 m!523443))

(declare-fun m!523445 () Bool)

(assert (=> b!545896 m!523445))

(assert (=> b!545900 m!523443))

(assert (=> b!545900 m!523443))

(declare-fun m!523447 () Bool)

(assert (=> b!545900 m!523447))

(declare-fun m!523449 () Bool)

(assert (=> b!545889 m!523449))

(assert (=> b!545889 m!523443))

(assert (=> b!545889 m!523443))

(declare-fun m!523451 () Bool)

(assert (=> b!545889 m!523451))

(assert (=> b!545889 m!523451))

(assert (=> b!545889 m!523443))

(declare-fun m!523453 () Bool)

(assert (=> b!545889 m!523453))

(declare-fun m!523455 () Bool)

(assert (=> b!545893 m!523455))

(declare-fun m!523457 () Bool)

(assert (=> b!545897 m!523457))

(declare-fun m!523459 () Bool)

(assert (=> b!545895 m!523459))

(assert (=> b!545892 m!523443))

(assert (=> b!545892 m!523443))

(declare-fun m!523461 () Bool)

(assert (=> b!545892 m!523461))

(declare-fun m!523463 () Bool)

(assert (=> b!545898 m!523463))

(declare-fun m!523465 () Bool)

(assert (=> b!545890 m!523465))

(declare-fun m!523467 () Bool)

(assert (=> start!49612 m!523467))

(declare-fun m!523469 () Bool)

(assert (=> start!49612 m!523469))

(assert (=> b!545891 m!523443))

(assert (=> b!545891 m!523443))

(declare-fun m!523471 () Bool)

(assert (=> b!545891 m!523471))

(push 1)

(assert (not b!545898))

(assert (not b!545896))

(assert (not b!545893))

(assert (not b!545900))

(assert (not b!545891))

(assert (not start!49612))

(assert (not b!545897))

(assert (not b!545890))

(assert (not b!545888))

(assert (not b!545892))

(assert (not b!545895))

(assert (not b!545889))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

