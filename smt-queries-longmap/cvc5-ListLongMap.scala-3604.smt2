; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49614 () Bool)

(assert start!49614)

(declare-fun res!339861 () Bool)

(declare-fun e!315534 () Bool)

(assert (=> start!49614 (=> (not res!339861) (not e!315534))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49614 (= res!339861 (validMask!0 mask!3216))))

(assert (=> start!49614 e!315534))

(assert (=> start!49614 true))

(declare-datatypes ((array!34427 0))(
  ( (array!34428 (arr!16542 (Array (_ BitVec 32) (_ BitVec 64))) (size!16906 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34427)

(declare-fun array_inv!12338 (array!34427) Bool)

(assert (=> start!49614 (array_inv!12338 a!3154)))

(declare-fun b!545927 () Bool)

(declare-fun res!339863 () Bool)

(declare-fun e!315538 () Bool)

(assert (=> b!545927 (=> (not res!339863) (not e!315538))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun index!1177 () (_ BitVec 32))

(assert (=> b!545927 (= res!339863 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16906 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16906 a!3154)) (= (select (arr!16542 a!3154) resIndex!32) (select (arr!16542 a!3154) j!147))))))

(declare-fun b!545928 () Bool)

(declare-fun e!315537 () Bool)

(assert (=> b!545928 (= e!315537 (not true))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun lt!249078 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5000 0))(
  ( (MissingZero!5000 (index!22224 (_ BitVec 32))) (Found!5000 (index!22225 (_ BitVec 32))) (Intermediate!5000 (undefined!5812 Bool) (index!22226 (_ BitVec 32)) (x!51152 (_ BitVec 32))) (Undefined!5000) (MissingVacant!5000 (index!22227 (_ BitVec 32))) )
))
(declare-fun lt!249079 () SeekEntryResult!5000)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34427 (_ BitVec 32)) SeekEntryResult!5000)

(assert (=> b!545928 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!249078 (select (store (arr!16542 a!3154) i!1153 k!1998) j!147) (array!34428 (store (arr!16542 a!3154) i!1153 k!1998) (size!16906 a!3154)) mask!3216) lt!249079)))

(declare-datatypes ((Unit!16934 0))(
  ( (Unit!16935) )
))
(declare-fun lt!249080 () Unit!16934)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!34427 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16934)

(assert (=> b!545928 (= lt!249080 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3154 i!1153 k!1998 j!147 lt!249078 (bvadd #b00000000000000000000000000000001 x!1030) resIndex!32 resX!32 mask!3216))))

(declare-fun b!545929 () Bool)

(declare-fun res!339862 () Bool)

(assert (=> b!545929 (=> (not res!339862) (not e!315534))))

(declare-fun arrayContainsKey!0 (array!34427 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!545929 (= res!339862 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!545930 () Bool)

(declare-fun res!339859 () Bool)

(assert (=> b!545930 (=> (not res!339859) (not e!315538))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34427 (_ BitVec 32)) Bool)

(assert (=> b!545930 (= res!339859 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!545931 () Bool)

(declare-fun e!315536 () Bool)

(declare-fun e!315540 () Bool)

(assert (=> b!545931 (= e!315536 e!315540)))

(declare-fun res!339858 () Bool)

(assert (=> b!545931 (=> (not res!339858) (not e!315540))))

(declare-fun lt!249082 () SeekEntryResult!5000)

(declare-fun lt!249081 () SeekEntryResult!5000)

(assert (=> b!545931 (= res!339858 (and (= lt!249082 lt!249081) (not (= (select (arr!16542 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16542 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16542 a!3154) index!1177) (select (arr!16542 a!3154) j!147)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!545931 (= lt!249082 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16542 a!3154) j!147) mask!3216) (select (arr!16542 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!545932 () Bool)

(declare-fun res!339860 () Bool)

(assert (=> b!545932 (=> (not res!339860) (not e!315534))))

(assert (=> b!545932 (= res!339860 (and (= (size!16906 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16906 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16906 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!545933 () Bool)

(declare-fun e!315539 () Bool)

(assert (=> b!545933 (= e!315540 e!315539)))

(declare-fun res!339857 () Bool)

(assert (=> b!545933 (=> (not res!339857) (not e!315539))))

(assert (=> b!545933 (= res!339857 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!249078 #b00000000000000000000000000000000) (bvslt lt!249078 (size!16906 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!545933 (= lt!249078 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!545934 () Bool)

(assert (=> b!545934 (= e!315538 e!315536)))

(declare-fun res!339864 () Bool)

(assert (=> b!545934 (=> (not res!339864) (not e!315536))))

(assert (=> b!545934 (= res!339864 (= lt!249081 lt!249079))))

(assert (=> b!545934 (= lt!249079 (Intermediate!5000 false resIndex!32 resX!32))))

(assert (=> b!545934 (= lt!249081 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16542 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!545935 () Bool)

(declare-fun res!339865 () Bool)

(assert (=> b!545935 (=> (not res!339865) (not e!315534))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!545935 (= res!339865 (validKeyInArray!0 (select (arr!16542 a!3154) j!147)))))

(declare-fun b!545936 () Bool)

(declare-fun res!339866 () Bool)

(assert (=> b!545936 (=> (not res!339866) (not e!315538))))

(declare-datatypes ((List!10661 0))(
  ( (Nil!10658) (Cons!10657 (h!11621 (_ BitVec 64)) (t!16889 List!10661)) )
))
(declare-fun arrayNoDuplicates!0 (array!34427 (_ BitVec 32) List!10661) Bool)

(assert (=> b!545936 (= res!339866 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10658))))

(declare-fun b!545937 () Bool)

(assert (=> b!545937 (= e!315539 e!315537)))

(declare-fun res!339854 () Bool)

(assert (=> b!545937 (=> (not res!339854) (not e!315537))))

(declare-fun lt!249076 () SeekEntryResult!5000)

(assert (=> b!545937 (= res!339854 (and (= lt!249076 lt!249079) (= lt!249082 lt!249076)))))

(assert (=> b!545937 (= lt!249076 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!249078 (select (arr!16542 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!545938 () Bool)

(declare-fun res!339855 () Bool)

(assert (=> b!545938 (=> (not res!339855) (not e!315534))))

(assert (=> b!545938 (= res!339855 (validKeyInArray!0 k!1998))))

(declare-fun b!545939 () Bool)

(assert (=> b!545939 (= e!315534 e!315538)))

(declare-fun res!339856 () Bool)

(assert (=> b!545939 (=> (not res!339856) (not e!315538))))

(declare-fun lt!249077 () SeekEntryResult!5000)

(assert (=> b!545939 (= res!339856 (or (= lt!249077 (MissingZero!5000 i!1153)) (= lt!249077 (MissingVacant!5000 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34427 (_ BitVec 32)) SeekEntryResult!5000)

(assert (=> b!545939 (= lt!249077 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(assert (= (and start!49614 res!339861) b!545932))

(assert (= (and b!545932 res!339860) b!545935))

(assert (= (and b!545935 res!339865) b!545938))

(assert (= (and b!545938 res!339855) b!545929))

(assert (= (and b!545929 res!339862) b!545939))

(assert (= (and b!545939 res!339856) b!545930))

(assert (= (and b!545930 res!339859) b!545936))

(assert (= (and b!545936 res!339866) b!545927))

(assert (= (and b!545927 res!339863) b!545934))

(assert (= (and b!545934 res!339864) b!545931))

(assert (= (and b!545931 res!339858) b!545933))

(assert (= (and b!545933 res!339857) b!545937))

(assert (= (and b!545937 res!339854) b!545928))

(declare-fun m!523473 () Bool)

(assert (=> b!545929 m!523473))

(declare-fun m!523475 () Bool)

(assert (=> b!545928 m!523475))

(declare-fun m!523477 () Bool)

(assert (=> b!545928 m!523477))

(assert (=> b!545928 m!523477))

(declare-fun m!523479 () Bool)

(assert (=> b!545928 m!523479))

(declare-fun m!523481 () Bool)

(assert (=> b!545928 m!523481))

(declare-fun m!523483 () Bool)

(assert (=> b!545934 m!523483))

(assert (=> b!545934 m!523483))

(declare-fun m!523485 () Bool)

(assert (=> b!545934 m!523485))

(declare-fun m!523487 () Bool)

(assert (=> b!545936 m!523487))

(declare-fun m!523489 () Bool)

(assert (=> start!49614 m!523489))

(declare-fun m!523491 () Bool)

(assert (=> start!49614 m!523491))

(declare-fun m!523493 () Bool)

(assert (=> b!545939 m!523493))

(declare-fun m!523495 () Bool)

(assert (=> b!545931 m!523495))

(assert (=> b!545931 m!523483))

(assert (=> b!545931 m!523483))

(declare-fun m!523497 () Bool)

(assert (=> b!545931 m!523497))

(assert (=> b!545931 m!523497))

(assert (=> b!545931 m!523483))

(declare-fun m!523499 () Bool)

(assert (=> b!545931 m!523499))

(declare-fun m!523501 () Bool)

(assert (=> b!545933 m!523501))

(assert (=> b!545935 m!523483))

(assert (=> b!545935 m!523483))

(declare-fun m!523503 () Bool)

(assert (=> b!545935 m!523503))

(declare-fun m!523505 () Bool)

(assert (=> b!545930 m!523505))

(declare-fun m!523507 () Bool)

(assert (=> b!545938 m!523507))

(declare-fun m!523509 () Bool)

(assert (=> b!545927 m!523509))

(assert (=> b!545927 m!523483))

(assert (=> b!545937 m!523483))

(assert (=> b!545937 m!523483))

(declare-fun m!523511 () Bool)

(assert (=> b!545937 m!523511))

(push 1)

