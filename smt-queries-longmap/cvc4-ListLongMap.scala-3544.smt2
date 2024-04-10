; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48838 () Bool)

(assert start!48838)

(declare-fun b!537821 () Bool)

(declare-fun res!333026 () Bool)

(declare-fun e!311949 () Bool)

(assert (=> b!537821 (=> (not res!333026) (not e!311949))))

(declare-datatypes ((array!34050 0))(
  ( (array!34051 (arr!16364 (Array (_ BitVec 32) (_ BitVec 64))) (size!16728 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34050)

(declare-datatypes ((List!10483 0))(
  ( (Nil!10480) (Cons!10479 (h!11422 (_ BitVec 64)) (t!16711 List!10483)) )
))
(declare-fun arrayNoDuplicates!0 (array!34050 (_ BitVec 32) List!10483) Bool)

(assert (=> b!537821 (= res!333026 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10480))))

(declare-fun b!537822 () Bool)

(declare-fun res!333035 () Bool)

(declare-fun e!311946 () Bool)

(assert (=> b!537822 (=> (not res!333035) (not e!311946))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4822 0))(
  ( (MissingZero!4822 (index!21512 (_ BitVec 32))) (Found!4822 (index!21513 (_ BitVec 32))) (Intermediate!4822 (undefined!5634 Bool) (index!21514 (_ BitVec 32)) (x!50437 (_ BitVec 32))) (Undefined!4822) (MissingVacant!4822 (index!21515 (_ BitVec 32))) )
))
(declare-fun lt!246520 () SeekEntryResult!4822)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34050 (_ BitVec 32)) SeekEntryResult!4822)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537822 (= res!333035 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16364 a!3154) j!147) mask!3216) (select (arr!16364 a!3154) j!147) a!3154 mask!3216) lt!246520))))

(declare-fun b!537823 () Bool)

(declare-fun e!311947 () Bool)

(assert (=> b!537823 (= e!311947 e!311949)))

(declare-fun res!333030 () Bool)

(assert (=> b!537823 (=> (not res!333030) (not e!311949))))

(declare-fun lt!246521 () SeekEntryResult!4822)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!537823 (= res!333030 (or (= lt!246521 (MissingZero!4822 i!1153)) (= lt!246521 (MissingVacant!4822 i!1153))))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34050 (_ BitVec 32)) SeekEntryResult!4822)

(assert (=> b!537823 (= lt!246521 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!537824 () Bool)

(declare-fun res!333038 () Bool)

(assert (=> b!537824 (=> (not res!333038) (not e!311946))))

(declare-fun index!1177 () (_ BitVec 32))

(assert (=> b!537824 (= res!333038 (and (not (= (select (arr!16364 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16364 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16364 a!3154) index!1177) (select (arr!16364 a!3154) j!147)))))))

(declare-fun b!537825 () Bool)

(declare-fun e!311948 () Bool)

(assert (=> b!537825 (= e!311948 false)))

(declare-fun lt!246522 () SeekEntryResult!4822)

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun lt!246523 () (_ BitVec 32))

(assert (=> b!537825 (= lt!246522 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246523 (select (arr!16364 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!537826 () Bool)

(assert (=> b!537826 (= e!311946 e!311948)))

(declare-fun res!333028 () Bool)

(assert (=> b!537826 (=> (not res!333028) (not e!311948))))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!537826 (= res!333028 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246523 #b00000000000000000000000000000000) (bvslt lt!246523 (size!16728 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537826 (= lt!246523 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!537827 () Bool)

(declare-fun res!333034 () Bool)

(assert (=> b!537827 (=> (not res!333034) (not e!311947))))

(assert (=> b!537827 (= res!333034 (and (= (size!16728 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16728 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16728 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!537828 () Bool)

(declare-fun res!333031 () Bool)

(assert (=> b!537828 (=> (not res!333031) (not e!311949))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34050 (_ BitVec 32)) Bool)

(assert (=> b!537828 (= res!333031 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!537829 () Bool)

(declare-fun res!333029 () Bool)

(assert (=> b!537829 (=> (not res!333029) (not e!311947))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!537829 (= res!333029 (validKeyInArray!0 (select (arr!16364 a!3154) j!147)))))

(declare-fun res!333032 () Bool)

(assert (=> start!48838 (=> (not res!333032) (not e!311947))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48838 (= res!333032 (validMask!0 mask!3216))))

(assert (=> start!48838 e!311947))

(assert (=> start!48838 true))

(declare-fun array_inv!12160 (array!34050) Bool)

(assert (=> start!48838 (array_inv!12160 a!3154)))

(declare-fun b!537830 () Bool)

(declare-fun res!333036 () Bool)

(assert (=> b!537830 (=> (not res!333036) (not e!311947))))

(declare-fun arrayContainsKey!0 (array!34050 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!537830 (= res!333036 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!537831 () Bool)

(declare-fun res!333027 () Bool)

(assert (=> b!537831 (=> (not res!333027) (not e!311949))))

(declare-fun resIndex!32 () (_ BitVec 32))

(assert (=> b!537831 (= res!333027 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16728 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16728 a!3154)) (= (select (arr!16364 a!3154) resIndex!32) (select (arr!16364 a!3154) j!147))))))

(declare-fun b!537832 () Bool)

(assert (=> b!537832 (= e!311949 e!311946)))

(declare-fun res!333037 () Bool)

(assert (=> b!537832 (=> (not res!333037) (not e!311946))))

(assert (=> b!537832 (= res!333037 (= lt!246520 (Intermediate!4822 false resIndex!32 resX!32)))))

(assert (=> b!537832 (= lt!246520 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16364 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!537833 () Bool)

(declare-fun res!333033 () Bool)

(assert (=> b!537833 (=> (not res!333033) (not e!311947))))

(assert (=> b!537833 (= res!333033 (validKeyInArray!0 k!1998))))

(assert (= (and start!48838 res!333032) b!537827))

(assert (= (and b!537827 res!333034) b!537829))

(assert (= (and b!537829 res!333029) b!537833))

(assert (= (and b!537833 res!333033) b!537830))

(assert (= (and b!537830 res!333036) b!537823))

(assert (= (and b!537823 res!333030) b!537828))

(assert (= (and b!537828 res!333031) b!537821))

(assert (= (and b!537821 res!333026) b!537831))

(assert (= (and b!537831 res!333027) b!537832))

(assert (= (and b!537832 res!333037) b!537822))

(assert (= (and b!537822 res!333035) b!537824))

(assert (= (and b!537824 res!333038) b!537826))

(assert (= (and b!537826 res!333028) b!537825))

(declare-fun m!516985 () Bool)

(assert (=> b!537826 m!516985))

(declare-fun m!516987 () Bool)

(assert (=> b!537832 m!516987))

(assert (=> b!537832 m!516987))

(declare-fun m!516989 () Bool)

(assert (=> b!537832 m!516989))

(declare-fun m!516991 () Bool)

(assert (=> start!48838 m!516991))

(declare-fun m!516993 () Bool)

(assert (=> start!48838 m!516993))

(declare-fun m!516995 () Bool)

(assert (=> b!537831 m!516995))

(assert (=> b!537831 m!516987))

(declare-fun m!516997 () Bool)

(assert (=> b!537833 m!516997))

(declare-fun m!516999 () Bool)

(assert (=> b!537824 m!516999))

(assert (=> b!537824 m!516987))

(declare-fun m!517001 () Bool)

(assert (=> b!537828 m!517001))

(assert (=> b!537825 m!516987))

(assert (=> b!537825 m!516987))

(declare-fun m!517003 () Bool)

(assert (=> b!537825 m!517003))

(assert (=> b!537829 m!516987))

(assert (=> b!537829 m!516987))

(declare-fun m!517005 () Bool)

(assert (=> b!537829 m!517005))

(declare-fun m!517007 () Bool)

(assert (=> b!537830 m!517007))

(declare-fun m!517009 () Bool)

(assert (=> b!537823 m!517009))

(declare-fun m!517011 () Bool)

(assert (=> b!537821 m!517011))

(assert (=> b!537822 m!516987))

(assert (=> b!537822 m!516987))

(declare-fun m!517013 () Bool)

(assert (=> b!537822 m!517013))

(assert (=> b!537822 m!517013))

(assert (=> b!537822 m!516987))

(declare-fun m!517015 () Bool)

(assert (=> b!537822 m!517015))

(push 1)

(assert (not b!537826))

(assert (not b!537829))

(assert (not b!537825))

(assert (not b!537830))

(assert (not b!537832))

(assert (not b!537833))

(assert (not b!537822))

