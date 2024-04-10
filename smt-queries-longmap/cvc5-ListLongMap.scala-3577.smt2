; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49194 () Bool)

(assert start!49194)

(declare-fun b!541706 () Bool)

(declare-fun res!336435 () Bool)

(declare-fun e!313640 () Bool)

(assert (=> b!541706 (=> (not res!336435) (not e!313640))))

(declare-datatypes ((array!34253 0))(
  ( (array!34254 (arr!16461 (Array (_ BitVec 32) (_ BitVec 64))) (size!16825 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34253)

(declare-datatypes ((List!10580 0))(
  ( (Nil!10577) (Cons!10576 (h!11528 (_ BitVec 64)) (t!16808 List!10580)) )
))
(declare-fun arrayNoDuplicates!0 (array!34253 (_ BitVec 32) List!10580) Bool)

(assert (=> b!541706 (= res!336435 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10577))))

(declare-fun b!541707 () Bool)

(assert (=> b!541707 (= e!313640 false)))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4919 0))(
  ( (MissingZero!4919 (index!21900 (_ BitVec 32))) (Found!4919 (index!21901 (_ BitVec 32))) (Intermediate!4919 (undefined!5731 Bool) (index!21902 (_ BitVec 32)) (x!50816 (_ BitVec 32))) (Undefined!4919) (MissingVacant!4919 (index!21903 (_ BitVec 32))) )
))
(declare-fun lt!247716 () SeekEntryResult!4919)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34253 (_ BitVec 32)) SeekEntryResult!4919)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!541707 (= lt!247716 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16461 a!3154) j!147) mask!3216) (select (arr!16461 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!541708 () Bool)

(declare-fun res!336442 () Bool)

(declare-fun e!313641 () Bool)

(assert (=> b!541708 (=> (not res!336442) (not e!313641))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!541708 (= res!336442 (validKeyInArray!0 k!1998))))

(declare-fun b!541709 () Bool)

(declare-fun res!336437 () Bool)

(assert (=> b!541709 (=> (not res!336437) (not e!313641))))

(declare-fun arrayContainsKey!0 (array!34253 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!541709 (= res!336437 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun res!336438 () Bool)

(assert (=> start!49194 (=> (not res!336438) (not e!313641))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49194 (= res!336438 (validMask!0 mask!3216))))

(assert (=> start!49194 e!313641))

(assert (=> start!49194 true))

(declare-fun array_inv!12257 (array!34253) Bool)

(assert (=> start!49194 (array_inv!12257 a!3154)))

(declare-fun b!541710 () Bool)

(declare-fun res!336439 () Bool)

(assert (=> b!541710 (=> (not res!336439) (not e!313640))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!541710 (= res!336439 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16825 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16825 a!3154)) (= (select (arr!16461 a!3154) resIndex!32) (select (arr!16461 a!3154) j!147))))))

(declare-fun b!541711 () Bool)

(declare-fun res!336434 () Bool)

(assert (=> b!541711 (=> (not res!336434) (not e!313641))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!541711 (= res!336434 (and (= (size!16825 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16825 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16825 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!541712 () Bool)

(declare-fun res!336441 () Bool)

(assert (=> b!541712 (=> (not res!336441) (not e!313640))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34253 (_ BitVec 32)) Bool)

(assert (=> b!541712 (= res!336441 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!541713 () Bool)

(assert (=> b!541713 (= e!313641 e!313640)))

(declare-fun res!336440 () Bool)

(assert (=> b!541713 (=> (not res!336440) (not e!313640))))

(declare-fun lt!247717 () SeekEntryResult!4919)

(assert (=> b!541713 (= res!336440 (or (= lt!247717 (MissingZero!4919 i!1153)) (= lt!247717 (MissingVacant!4919 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34253 (_ BitVec 32)) SeekEntryResult!4919)

(assert (=> b!541713 (= lt!247717 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!541714 () Bool)

(declare-fun res!336443 () Bool)

(assert (=> b!541714 (=> (not res!336443) (not e!313640))))

(assert (=> b!541714 (= res!336443 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16461 a!3154) j!147) a!3154 mask!3216) (Intermediate!4919 false resIndex!32 resX!32)))))

(declare-fun b!541715 () Bool)

(declare-fun res!336436 () Bool)

(assert (=> b!541715 (=> (not res!336436) (not e!313641))))

(assert (=> b!541715 (= res!336436 (validKeyInArray!0 (select (arr!16461 a!3154) j!147)))))

(assert (= (and start!49194 res!336438) b!541711))

(assert (= (and b!541711 res!336434) b!541715))

(assert (= (and b!541715 res!336436) b!541708))

(assert (= (and b!541708 res!336442) b!541709))

(assert (= (and b!541709 res!336437) b!541713))

(assert (= (and b!541713 res!336440) b!541712))

(assert (= (and b!541712 res!336441) b!541706))

(assert (= (and b!541706 res!336435) b!541710))

(assert (= (and b!541710 res!336439) b!541714))

(assert (= (and b!541714 res!336443) b!541707))

(declare-fun m!520155 () Bool)

(assert (=> b!541715 m!520155))

(assert (=> b!541715 m!520155))

(declare-fun m!520157 () Bool)

(assert (=> b!541715 m!520157))

(assert (=> b!541707 m!520155))

(assert (=> b!541707 m!520155))

(declare-fun m!520159 () Bool)

(assert (=> b!541707 m!520159))

(assert (=> b!541707 m!520159))

(assert (=> b!541707 m!520155))

(declare-fun m!520161 () Bool)

(assert (=> b!541707 m!520161))

(declare-fun m!520163 () Bool)

(assert (=> b!541706 m!520163))

(declare-fun m!520165 () Bool)

(assert (=> b!541710 m!520165))

(assert (=> b!541710 m!520155))

(declare-fun m!520167 () Bool)

(assert (=> b!541713 m!520167))

(assert (=> b!541714 m!520155))

(assert (=> b!541714 m!520155))

(declare-fun m!520169 () Bool)

(assert (=> b!541714 m!520169))

(declare-fun m!520171 () Bool)

(assert (=> b!541712 m!520171))

(declare-fun m!520173 () Bool)

(assert (=> b!541709 m!520173))

(declare-fun m!520175 () Bool)

(assert (=> b!541708 m!520175))

(declare-fun m!520177 () Bool)

(assert (=> start!49194 m!520177))

(declare-fun m!520179 () Bool)

(assert (=> start!49194 m!520179))

(push 1)

