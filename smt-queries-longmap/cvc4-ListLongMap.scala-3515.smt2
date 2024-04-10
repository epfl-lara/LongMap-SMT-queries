; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48664 () Bool)

(assert start!48664)

(declare-fun res!329865 () Bool)

(declare-fun e!310778 () Bool)

(assert (=> start!48664 (=> (not res!329865) (not e!310778))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48664 (= res!329865 (validMask!0 mask!3216))))

(assert (=> start!48664 e!310778))

(assert (=> start!48664 true))

(declare-datatypes ((array!33876 0))(
  ( (array!33877 (arr!16277 (Array (_ BitVec 32) (_ BitVec 64))) (size!16641 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33876)

(declare-fun array_inv!12073 (array!33876) Bool)

(assert (=> start!48664 (array_inv!12073 a!3154)))

(declare-fun b!534656 () Bool)

(declare-fun res!329866 () Bool)

(declare-fun e!310777 () Bool)

(assert (=> b!534656 (=> (not res!329866) (not e!310777))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4735 0))(
  ( (MissingZero!4735 (index!21164 (_ BitVec 32))) (Found!4735 (index!21165 (_ BitVec 32))) (Intermediate!4735 (undefined!5547 Bool) (index!21166 (_ BitVec 32)) (x!50118 (_ BitVec 32))) (Undefined!4735) (MissingVacant!4735 (index!21167 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33876 (_ BitVec 32)) SeekEntryResult!4735)

(assert (=> b!534656 (= res!329866 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16277 a!3154) j!147) a!3154 mask!3216) (Intermediate!4735 false resIndex!32 resX!32)))))

(declare-fun b!534657 () Bool)

(declare-fun res!329862 () Bool)

(assert (=> b!534657 (=> (not res!329862) (not e!310777))))

(assert (=> b!534657 (= res!329862 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16641 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16641 a!3154)) (= (select (arr!16277 a!3154) resIndex!32) (select (arr!16277 a!3154) j!147))))))

(declare-fun b!534658 () Bool)

(assert (=> b!534658 (= e!310777 false)))

(declare-fun lt!245676 () SeekEntryResult!4735)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!534658 (= lt!245676 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16277 a!3154) j!147) mask!3216) (select (arr!16277 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!534659 () Bool)

(declare-fun res!329868 () Bool)

(assert (=> b!534659 (=> (not res!329868) (not e!310778))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33876 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!534659 (= res!329868 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!534660 () Bool)

(declare-fun res!329870 () Bool)

(assert (=> b!534660 (=> (not res!329870) (not e!310778))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!534660 (= res!329870 (and (= (size!16641 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16641 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16641 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!534661 () Bool)

(declare-fun res!329867 () Bool)

(assert (=> b!534661 (=> (not res!329867) (not e!310777))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33876 (_ BitVec 32)) Bool)

(assert (=> b!534661 (= res!329867 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!534662 () Bool)

(declare-fun res!329864 () Bool)

(assert (=> b!534662 (=> (not res!329864) (not e!310778))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!534662 (= res!329864 (validKeyInArray!0 (select (arr!16277 a!3154) j!147)))))

(declare-fun b!534663 () Bool)

(declare-fun res!329861 () Bool)

(assert (=> b!534663 (=> (not res!329861) (not e!310778))))

(assert (=> b!534663 (= res!329861 (validKeyInArray!0 k!1998))))

(declare-fun b!534664 () Bool)

(declare-fun res!329869 () Bool)

(assert (=> b!534664 (=> (not res!329869) (not e!310777))))

(declare-datatypes ((List!10396 0))(
  ( (Nil!10393) (Cons!10392 (h!11335 (_ BitVec 64)) (t!16624 List!10396)) )
))
(declare-fun arrayNoDuplicates!0 (array!33876 (_ BitVec 32) List!10396) Bool)

(assert (=> b!534664 (= res!329869 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10393))))

(declare-fun b!534665 () Bool)

(assert (=> b!534665 (= e!310778 e!310777)))

(declare-fun res!329863 () Bool)

(assert (=> b!534665 (=> (not res!329863) (not e!310777))))

(declare-fun lt!245677 () SeekEntryResult!4735)

(assert (=> b!534665 (= res!329863 (or (= lt!245677 (MissingZero!4735 i!1153)) (= lt!245677 (MissingVacant!4735 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33876 (_ BitVec 32)) SeekEntryResult!4735)

(assert (=> b!534665 (= lt!245677 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(assert (= (and start!48664 res!329865) b!534660))

(assert (= (and b!534660 res!329870) b!534662))

(assert (= (and b!534662 res!329864) b!534663))

(assert (= (and b!534663 res!329861) b!534659))

(assert (= (and b!534659 res!329868) b!534665))

(assert (= (and b!534665 res!329863) b!534661))

(assert (= (and b!534661 res!329867) b!534664))

(assert (= (and b!534664 res!329869) b!534657))

(assert (= (and b!534657 res!329862) b!534656))

(assert (= (and b!534656 res!329866) b!534658))

(declare-fun m!514345 () Bool)

(assert (=> b!534664 m!514345))

(declare-fun m!514347 () Bool)

(assert (=> b!534663 m!514347))

(declare-fun m!514349 () Bool)

(assert (=> start!48664 m!514349))

(declare-fun m!514351 () Bool)

(assert (=> start!48664 m!514351))

(declare-fun m!514353 () Bool)

(assert (=> b!534657 m!514353))

(declare-fun m!514355 () Bool)

(assert (=> b!534657 m!514355))

(declare-fun m!514357 () Bool)

(assert (=> b!534661 m!514357))

(assert (=> b!534662 m!514355))

(assert (=> b!534662 m!514355))

(declare-fun m!514359 () Bool)

(assert (=> b!534662 m!514359))

(declare-fun m!514361 () Bool)

(assert (=> b!534665 m!514361))

(assert (=> b!534658 m!514355))

(assert (=> b!534658 m!514355))

(declare-fun m!514363 () Bool)

(assert (=> b!534658 m!514363))

(assert (=> b!534658 m!514363))

(assert (=> b!534658 m!514355))

(declare-fun m!514365 () Bool)

(assert (=> b!534658 m!514365))

(declare-fun m!514367 () Bool)

(assert (=> b!534659 m!514367))

(assert (=> b!534656 m!514355))

(assert (=> b!534656 m!514355))

(declare-fun m!514369 () Bool)

(assert (=> b!534656 m!514369))

(push 1)

(assert (not b!534664))

(assert (not b!534658))

(assert (not start!48664))

(assert (not b!534662))

(assert (not b!534659))

(assert (not b!534665))

(assert (not b!534661))

