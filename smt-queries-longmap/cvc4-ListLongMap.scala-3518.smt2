; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48682 () Bool)

(assert start!48682)

(declare-fun b!534934 () Bool)

(declare-fun res!330143 () Bool)

(declare-fun e!310868 () Bool)

(assert (=> b!534934 (=> (not res!330143) (not e!310868))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4744 0))(
  ( (MissingZero!4744 (index!21200 (_ BitVec 32))) (Found!4744 (index!21201 (_ BitVec 32))) (Intermediate!4744 (undefined!5556 Bool) (index!21202 (_ BitVec 32)) (x!50151 (_ BitVec 32))) (Undefined!4744) (MissingVacant!4744 (index!21203 (_ BitVec 32))) )
))
(declare-fun lt!245731 () SeekEntryResult!4744)

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33894 0))(
  ( (array!33895 (arr!16286 (Array (_ BitVec 32) (_ BitVec 64))) (size!16650 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33894)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33894 (_ BitVec 32)) SeekEntryResult!4744)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!534934 (= res!330143 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16286 a!3154) j!147) mask!3216) (select (arr!16286 a!3154) j!147) a!3154 mask!3216) lt!245731))))

(declare-fun b!534935 () Bool)

(declare-fun res!330144 () Bool)

(declare-fun e!310866 () Bool)

(assert (=> b!534935 (=> (not res!330144) (not e!310866))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33894 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!534935 (= res!330144 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!534936 () Bool)

(declare-fun res!330149 () Bool)

(assert (=> b!534936 (=> (not res!330149) (not e!310866))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!534936 (= res!330149 (validKeyInArray!0 k!1998))))

(declare-fun b!534937 () Bool)

(declare-fun res!330145 () Bool)

(assert (=> b!534937 (=> (not res!330145) (not e!310866))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!534937 (= res!330145 (and (= (size!16650 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16650 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16650 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!534938 () Bool)

(declare-fun res!330148 () Bool)

(declare-fun e!310869 () Bool)

(assert (=> b!534938 (=> (not res!330148) (not e!310869))))

(declare-datatypes ((List!10405 0))(
  ( (Nil!10402) (Cons!10401 (h!11344 (_ BitVec 64)) (t!16633 List!10405)) )
))
(declare-fun arrayNoDuplicates!0 (array!33894 (_ BitVec 32) List!10405) Bool)

(assert (=> b!534938 (= res!330148 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10402))))

(declare-fun b!534939 () Bool)

(assert (=> b!534939 (= e!310866 e!310869)))

(declare-fun res!330141 () Bool)

(assert (=> b!534939 (=> (not res!330141) (not e!310869))))

(declare-fun lt!245730 () SeekEntryResult!4744)

(assert (=> b!534939 (= res!330141 (or (= lt!245730 (MissingZero!4744 i!1153)) (= lt!245730 (MissingVacant!4744 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33894 (_ BitVec 32)) SeekEntryResult!4744)

(assert (=> b!534939 (= lt!245730 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!534940 () Bool)

(declare-fun res!330147 () Bool)

(assert (=> b!534940 (=> (not res!330147) (not e!310869))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!534940 (= res!330147 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16650 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16650 a!3154)) (= (select (arr!16286 a!3154) resIndex!32) (select (arr!16286 a!3154) j!147))))))

(declare-fun b!534942 () Bool)

(declare-fun res!330146 () Bool)

(assert (=> b!534942 (=> (not res!330146) (not e!310866))))

(assert (=> b!534942 (= res!330146 (validKeyInArray!0 (select (arr!16286 a!3154) j!147)))))

(declare-fun b!534943 () Bool)

(assert (=> b!534943 (= e!310868 (and (not (= (select (arr!16286 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16286 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16286 a!3154) index!1177) (select (arr!16286 a!3154) j!147)) (= index!1177 resIndex!32) (bvslt mask!3216 #b00000000000000000000000000000000)))))

(declare-fun b!534944 () Bool)

(assert (=> b!534944 (= e!310869 e!310868)))

(declare-fun res!330140 () Bool)

(assert (=> b!534944 (=> (not res!330140) (not e!310868))))

(assert (=> b!534944 (= res!330140 (= lt!245731 (Intermediate!4744 false resIndex!32 resX!32)))))

(assert (=> b!534944 (= lt!245731 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16286 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!534941 () Bool)

(declare-fun res!330142 () Bool)

(assert (=> b!534941 (=> (not res!330142) (not e!310869))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33894 (_ BitVec 32)) Bool)

(assert (=> b!534941 (= res!330142 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun res!330139 () Bool)

(assert (=> start!48682 (=> (not res!330139) (not e!310866))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48682 (= res!330139 (validMask!0 mask!3216))))

(assert (=> start!48682 e!310866))

(assert (=> start!48682 true))

(declare-fun array_inv!12082 (array!33894) Bool)

(assert (=> start!48682 (array_inv!12082 a!3154)))

(assert (= (and start!48682 res!330139) b!534937))

(assert (= (and b!534937 res!330145) b!534942))

(assert (= (and b!534942 res!330146) b!534936))

(assert (= (and b!534936 res!330149) b!534935))

(assert (= (and b!534935 res!330144) b!534939))

(assert (= (and b!534939 res!330141) b!534941))

(assert (= (and b!534941 res!330142) b!534938))

(assert (= (and b!534938 res!330148) b!534940))

(assert (= (and b!534940 res!330147) b!534944))

(assert (= (and b!534944 res!330140) b!534934))

(assert (= (and b!534934 res!330143) b!534943))

(declare-fun m!514583 () Bool)

(assert (=> b!534939 m!514583))

(declare-fun m!514585 () Bool)

(assert (=> b!534942 m!514585))

(assert (=> b!534942 m!514585))

(declare-fun m!514587 () Bool)

(assert (=> b!534942 m!514587))

(declare-fun m!514589 () Bool)

(assert (=> b!534935 m!514589))

(assert (=> b!534934 m!514585))

(assert (=> b!534934 m!514585))

(declare-fun m!514591 () Bool)

(assert (=> b!534934 m!514591))

(assert (=> b!534934 m!514591))

(assert (=> b!534934 m!514585))

(declare-fun m!514593 () Bool)

(assert (=> b!534934 m!514593))

(assert (=> b!534944 m!514585))

(assert (=> b!534944 m!514585))

(declare-fun m!514595 () Bool)

(assert (=> b!534944 m!514595))

(declare-fun m!514597 () Bool)

(assert (=> b!534941 m!514597))

(declare-fun m!514599 () Bool)

(assert (=> b!534936 m!514599))

(declare-fun m!514601 () Bool)

(assert (=> b!534943 m!514601))

(assert (=> b!534943 m!514585))

(declare-fun m!514603 () Bool)

(assert (=> b!534938 m!514603))

(declare-fun m!514605 () Bool)

(assert (=> start!48682 m!514605))

(declare-fun m!514607 () Bool)

(assert (=> start!48682 m!514607))

(declare-fun m!514609 () Bool)

(assert (=> b!534940 m!514609))

(assert (=> b!534940 m!514585))

(push 1)

(assert (not b!534941))

(assert (not b!534934))

(assert (not b!534936))

(assert (not b!534935))

(assert (not b!534944))

(assert (not b!534942))

(assert (not b!534939))

(assert (not start!48682))

(assert (not b!534938))

(check-sat)

