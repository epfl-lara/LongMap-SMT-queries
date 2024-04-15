; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48842 () Bool)

(assert start!48842)

(declare-fun b!537862 () Bool)

(declare-fun e!311892 () Bool)

(assert (=> b!537862 (= e!311892 false)))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34064 0))(
  ( (array!34065 (arr!16371 (Array (_ BitVec 32) (_ BitVec 64))) (size!16736 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34064)

(declare-datatypes ((SeekEntryResult!4826 0))(
  ( (MissingZero!4826 (index!21528 (_ BitVec 32))) (Found!4826 (index!21529 (_ BitVec 32))) (Intermediate!4826 (undefined!5638 Bool) (index!21530 (_ BitVec 32)) (x!50460 (_ BitVec 32))) (Undefined!4826) (MissingVacant!4826 (index!21531 (_ BitVec 32))) )
))
(declare-fun lt!246385 () SeekEntryResult!4826)

(declare-fun lt!246382 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34064 (_ BitVec 32)) SeekEntryResult!4826)

(assert (=> b!537862 (= lt!246385 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246382 (select (arr!16371 a!3154) j!147) a!3154 mask!3216))))

(declare-fun res!333216 () Bool)

(declare-fun e!311894 () Bool)

(assert (=> start!48842 (=> (not res!333216) (not e!311894))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48842 (= res!333216 (validMask!0 mask!3216))))

(assert (=> start!48842 e!311894))

(assert (=> start!48842 true))

(declare-fun array_inv!12254 (array!34064) Bool)

(assert (=> start!48842 (array_inv!12254 a!3154)))

(declare-fun b!537863 () Bool)

(declare-fun res!333215 () Bool)

(assert (=> b!537863 (=> (not res!333215) (not e!311894))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!537863 (= res!333215 (validKeyInArray!0 k!1998))))

(declare-fun b!537864 () Bool)

(declare-fun res!333211 () Bool)

(assert (=> b!537864 (=> (not res!333211) (not e!311894))))

(declare-fun arrayContainsKey!0 (array!34064 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!537864 (= res!333211 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!537865 () Bool)

(declare-fun res!333214 () Bool)

(declare-fun e!311895 () Bool)

(assert (=> b!537865 (=> (not res!333214) (not e!311895))))

(declare-datatypes ((List!10529 0))(
  ( (Nil!10526) (Cons!10525 (h!11468 (_ BitVec 64)) (t!16748 List!10529)) )
))
(declare-fun arrayNoDuplicates!0 (array!34064 (_ BitVec 32) List!10529) Bool)

(assert (=> b!537865 (= res!333214 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10526))))

(declare-fun b!537866 () Bool)

(declare-fun res!333219 () Bool)

(declare-fun e!311893 () Bool)

(assert (=> b!537866 (=> (not res!333219) (not e!311893))))

(declare-fun index!1177 () (_ BitVec 32))

(assert (=> b!537866 (= res!333219 (and (not (= (select (arr!16371 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16371 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16371 a!3154) index!1177) (select (arr!16371 a!3154) j!147)))))))

(declare-fun b!537867 () Bool)

(declare-fun res!333213 () Bool)

(assert (=> b!537867 (=> (not res!333213) (not e!311895))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!537867 (= res!333213 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16736 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16736 a!3154)) (= (select (arr!16371 a!3154) resIndex!32) (select (arr!16371 a!3154) j!147))))))

(declare-fun b!537868 () Bool)

(assert (=> b!537868 (= e!311893 e!311892)))

(declare-fun res!333212 () Bool)

(assert (=> b!537868 (=> (not res!333212) (not e!311892))))

(assert (=> b!537868 (= res!333212 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246382 #b00000000000000000000000000000000) (bvslt lt!246382 (size!16736 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537868 (= lt!246382 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!537869 () Bool)

(declare-fun res!333210 () Bool)

(assert (=> b!537869 (=> (not res!333210) (not e!311893))))

(declare-fun lt!246384 () SeekEntryResult!4826)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537869 (= res!333210 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16371 a!3154) j!147) mask!3216) (select (arr!16371 a!3154) j!147) a!3154 mask!3216) lt!246384))))

(declare-fun b!537870 () Bool)

(assert (=> b!537870 (= e!311895 e!311893)))

(declare-fun res!333221 () Bool)

(assert (=> b!537870 (=> (not res!333221) (not e!311893))))

(assert (=> b!537870 (= res!333221 (= lt!246384 (Intermediate!4826 false resIndex!32 resX!32)))))

(assert (=> b!537870 (= lt!246384 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16371 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!537871 () Bool)

(declare-fun res!333217 () Bool)

(assert (=> b!537871 (=> (not res!333217) (not e!311894))))

(assert (=> b!537871 (= res!333217 (validKeyInArray!0 (select (arr!16371 a!3154) j!147)))))

(declare-fun b!537872 () Bool)

(assert (=> b!537872 (= e!311894 e!311895)))

(declare-fun res!333220 () Bool)

(assert (=> b!537872 (=> (not res!333220) (not e!311895))))

(declare-fun lt!246383 () SeekEntryResult!4826)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!537872 (= res!333220 (or (= lt!246383 (MissingZero!4826 i!1153)) (= lt!246383 (MissingVacant!4826 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34064 (_ BitVec 32)) SeekEntryResult!4826)

(assert (=> b!537872 (= lt!246383 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!537873 () Bool)

(declare-fun res!333218 () Bool)

(assert (=> b!537873 (=> (not res!333218) (not e!311894))))

(assert (=> b!537873 (= res!333218 (and (= (size!16736 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16736 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16736 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!537874 () Bool)

(declare-fun res!333209 () Bool)

(assert (=> b!537874 (=> (not res!333209) (not e!311895))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34064 (_ BitVec 32)) Bool)

(assert (=> b!537874 (= res!333209 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(assert (= (and start!48842 res!333216) b!537873))

(assert (= (and b!537873 res!333218) b!537871))

(assert (= (and b!537871 res!333217) b!537863))

(assert (= (and b!537863 res!333215) b!537864))

(assert (= (and b!537864 res!333211) b!537872))

(assert (= (and b!537872 res!333220) b!537874))

(assert (= (and b!537874 res!333209) b!537865))

(assert (= (and b!537865 res!333214) b!537867))

(assert (= (and b!537867 res!333213) b!537870))

(assert (= (and b!537870 res!333221) b!537869))

(assert (= (and b!537869 res!333210) b!537866))

(assert (= (and b!537866 res!333219) b!537868))

(assert (= (and b!537868 res!333212) b!537862))

(declare-fun m!516489 () Bool)

(assert (=> b!537871 m!516489))

(assert (=> b!537871 m!516489))

(declare-fun m!516491 () Bool)

(assert (=> b!537871 m!516491))

(declare-fun m!516493 () Bool)

(assert (=> b!537864 m!516493))

(declare-fun m!516495 () Bool)

(assert (=> b!537865 m!516495))

(declare-fun m!516497 () Bool)

(assert (=> b!537874 m!516497))

(assert (=> b!537870 m!516489))

(assert (=> b!537870 m!516489))

(declare-fun m!516499 () Bool)

(assert (=> b!537870 m!516499))

(declare-fun m!516501 () Bool)

(assert (=> b!537863 m!516501))

(assert (=> b!537869 m!516489))

(assert (=> b!537869 m!516489))

(declare-fun m!516503 () Bool)

(assert (=> b!537869 m!516503))

(assert (=> b!537869 m!516503))

(assert (=> b!537869 m!516489))

(declare-fun m!516505 () Bool)

(assert (=> b!537869 m!516505))

(declare-fun m!516507 () Bool)

(assert (=> b!537872 m!516507))

(declare-fun m!516509 () Bool)

(assert (=> b!537867 m!516509))

(assert (=> b!537867 m!516489))

(assert (=> b!537862 m!516489))

(assert (=> b!537862 m!516489))

(declare-fun m!516511 () Bool)

(assert (=> b!537862 m!516511))

(declare-fun m!516513 () Bool)

(assert (=> b!537868 m!516513))

(declare-fun m!516515 () Bool)

(assert (=> b!537866 m!516515))

(assert (=> b!537866 m!516489))

(declare-fun m!516517 () Bool)

(assert (=> start!48842 m!516517))

(declare-fun m!516519 () Bool)

(assert (=> start!48842 m!516519))

(push 1)

(assert (not b!537874))

(assert (not b!537863))

(assert (not b!537862))

(assert (not b!537864))

(assert (not b!537871))

(assert (not b!537865))

(assert (not b!537870))

(assert (not b!537872))

(assert (not b!537869))

(assert (not b!537868))

(assert (not start!48842))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

