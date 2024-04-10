; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49122 () Bool)

(assert start!49122)

(declare-fun b!541166 () Bool)

(declare-fun res!336060 () Bool)

(declare-fun e!313382 () Bool)

(assert (=> b!541166 (=> (not res!336060) (not e!313382))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34232 0))(
  ( (array!34233 (arr!16452 (Array (_ BitVec 32) (_ BitVec 64))) (size!16816 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34232)

(declare-fun resX!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4910 0))(
  ( (MissingZero!4910 (index!21864 (_ BitVec 32))) (Found!4910 (index!21865 (_ BitVec 32))) (Intermediate!4910 (undefined!5722 Bool) (index!21866 (_ BitVec 32)) (x!50777 (_ BitVec 32))) (Undefined!4910) (MissingVacant!4910 (index!21867 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34232 (_ BitVec 32)) SeekEntryResult!4910)

(assert (=> b!541166 (= res!336060 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16452 a!3154) j!147) a!3154 mask!3216) (Intermediate!4910 false resIndex!32 resX!32)))))

(declare-fun b!541167 () Bool)

(assert (=> b!541167 (= e!313382 false)))

(declare-fun lt!247566 () SeekEntryResult!4910)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!541167 (= lt!247566 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16452 a!3154) j!147) mask!3216) (select (arr!16452 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!541168 () Bool)

(declare-fun res!336058 () Bool)

(declare-fun e!313383 () Bool)

(assert (=> b!541168 (=> (not res!336058) (not e!313383))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!541168 (= res!336058 (validKeyInArray!0 k!1998))))

(declare-fun b!541169 () Bool)

(declare-fun res!336059 () Bool)

(assert (=> b!541169 (=> (not res!336059) (not e!313383))))

(assert (=> b!541169 (= res!336059 (validKeyInArray!0 (select (arr!16452 a!3154) j!147)))))

(declare-fun b!541170 () Bool)

(declare-fun res!336056 () Bool)

(assert (=> b!541170 (=> (not res!336056) (not e!313382))))

(assert (=> b!541170 (= res!336056 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16816 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16816 a!3154)) (= (select (arr!16452 a!3154) resIndex!32) (select (arr!16452 a!3154) j!147))))))

(declare-fun b!541171 () Bool)

(declare-fun res!336062 () Bool)

(assert (=> b!541171 (=> (not res!336062) (not e!313383))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!541171 (= res!336062 (and (= (size!16816 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16816 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16816 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!541172 () Bool)

(declare-fun res!336053 () Bool)

(assert (=> b!541172 (=> (not res!336053) (not e!313383))))

(declare-fun arrayContainsKey!0 (array!34232 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!541172 (= res!336053 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!541173 () Bool)

(declare-fun res!336054 () Bool)

(assert (=> b!541173 (=> (not res!336054) (not e!313382))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34232 (_ BitVec 32)) Bool)

(assert (=> b!541173 (= res!336054 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!541174 () Bool)

(assert (=> b!541174 (= e!313383 e!313382)))

(declare-fun res!336061 () Bool)

(assert (=> b!541174 (=> (not res!336061) (not e!313382))))

(declare-fun lt!247567 () SeekEntryResult!4910)

(assert (=> b!541174 (= res!336061 (or (= lt!247567 (MissingZero!4910 i!1153)) (= lt!247567 (MissingVacant!4910 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34232 (_ BitVec 32)) SeekEntryResult!4910)

(assert (=> b!541174 (= lt!247567 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun res!336057 () Bool)

(assert (=> start!49122 (=> (not res!336057) (not e!313383))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49122 (= res!336057 (validMask!0 mask!3216))))

(assert (=> start!49122 e!313383))

(assert (=> start!49122 true))

(declare-fun array_inv!12248 (array!34232) Bool)

(assert (=> start!49122 (array_inv!12248 a!3154)))

(declare-fun b!541175 () Bool)

(declare-fun res!336055 () Bool)

(assert (=> b!541175 (=> (not res!336055) (not e!313382))))

(declare-datatypes ((List!10571 0))(
  ( (Nil!10568) (Cons!10567 (h!11516 (_ BitVec 64)) (t!16799 List!10571)) )
))
(declare-fun arrayNoDuplicates!0 (array!34232 (_ BitVec 32) List!10571) Bool)

(assert (=> b!541175 (= res!336055 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10568))))

(assert (= (and start!49122 res!336057) b!541171))

(assert (= (and b!541171 res!336062) b!541169))

(assert (= (and b!541169 res!336059) b!541168))

(assert (= (and b!541168 res!336058) b!541172))

(assert (= (and b!541172 res!336053) b!541174))

(assert (= (and b!541174 res!336061) b!541173))

(assert (= (and b!541173 res!336054) b!541175))

(assert (= (and b!541175 res!336055) b!541170))

(assert (= (and b!541170 res!336056) b!541166))

(assert (= (and b!541166 res!336060) b!541167))

(declare-fun m!519777 () Bool)

(assert (=> b!541169 m!519777))

(assert (=> b!541169 m!519777))

(declare-fun m!519779 () Bool)

(assert (=> b!541169 m!519779))

(declare-fun m!519781 () Bool)

(assert (=> b!541170 m!519781))

(assert (=> b!541170 m!519777))

(assert (=> b!541167 m!519777))

(assert (=> b!541167 m!519777))

(declare-fun m!519783 () Bool)

(assert (=> b!541167 m!519783))

(assert (=> b!541167 m!519783))

(assert (=> b!541167 m!519777))

(declare-fun m!519785 () Bool)

(assert (=> b!541167 m!519785))

(declare-fun m!519787 () Bool)

(assert (=> b!541173 m!519787))

(declare-fun m!519789 () Bool)

(assert (=> b!541175 m!519789))

(assert (=> b!541166 m!519777))

(assert (=> b!541166 m!519777))

(declare-fun m!519791 () Bool)

(assert (=> b!541166 m!519791))

(declare-fun m!519793 () Bool)

(assert (=> b!541174 m!519793))

(declare-fun m!519795 () Bool)

(assert (=> start!49122 m!519795))

(declare-fun m!519797 () Bool)

(assert (=> start!49122 m!519797))

(declare-fun m!519799 () Bool)

(assert (=> b!541172 m!519799))

(declare-fun m!519801 () Bool)

(assert (=> b!541168 m!519801))

(push 1)

