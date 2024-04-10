; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49196 () Bool)

(assert start!49196)

(declare-fun b!541736 () Bool)

(declare-fun res!336470 () Bool)

(declare-fun e!313649 () Bool)

(assert (=> b!541736 (=> (not res!336470) (not e!313649))))

(declare-datatypes ((array!34255 0))(
  ( (array!34256 (arr!16462 (Array (_ BitVec 32) (_ BitVec 64))) (size!16826 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34255)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34255 (_ BitVec 32)) Bool)

(assert (=> b!541736 (= res!336470 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!541737 () Bool)

(declare-fun res!336472 () Bool)

(declare-fun e!313648 () Bool)

(assert (=> b!541737 (=> (not res!336472) (not e!313648))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!541737 (= res!336472 (validKeyInArray!0 (select (arr!16462 a!3154) j!147)))))

(declare-fun b!541738 () Bool)

(assert (=> b!541738 (= e!313648 e!313649)))

(declare-fun res!336469 () Bool)

(assert (=> b!541738 (=> (not res!336469) (not e!313649))))

(declare-datatypes ((SeekEntryResult!4920 0))(
  ( (MissingZero!4920 (index!21904 (_ BitVec 32))) (Found!4920 (index!21905 (_ BitVec 32))) (Intermediate!4920 (undefined!5732 Bool) (index!21906 (_ BitVec 32)) (x!50817 (_ BitVec 32))) (Undefined!4920) (MissingVacant!4920 (index!21907 (_ BitVec 32))) )
))
(declare-fun lt!247723 () SeekEntryResult!4920)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!541738 (= res!336469 (or (= lt!247723 (MissingZero!4920 i!1153)) (= lt!247723 (MissingVacant!4920 i!1153))))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34255 (_ BitVec 32)) SeekEntryResult!4920)

(assert (=> b!541738 (= lt!247723 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun res!336468 () Bool)

(assert (=> start!49196 (=> (not res!336468) (not e!313648))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49196 (= res!336468 (validMask!0 mask!3216))))

(assert (=> start!49196 e!313648))

(assert (=> start!49196 true))

(declare-fun array_inv!12258 (array!34255) Bool)

(assert (=> start!49196 (array_inv!12258 a!3154)))

(declare-fun b!541739 () Bool)

(declare-fun res!336471 () Bool)

(assert (=> b!541739 (=> (not res!336471) (not e!313649))))

(declare-datatypes ((List!10581 0))(
  ( (Nil!10578) (Cons!10577 (h!11529 (_ BitVec 64)) (t!16809 List!10581)) )
))
(declare-fun arrayNoDuplicates!0 (array!34255 (_ BitVec 32) List!10581) Bool)

(assert (=> b!541739 (= res!336471 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10578))))

(declare-fun b!541740 () Bool)

(declare-fun res!336464 () Bool)

(assert (=> b!541740 (=> (not res!336464) (not e!313648))))

(declare-fun arrayContainsKey!0 (array!34255 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!541740 (= res!336464 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!541741 () Bool)

(assert (=> b!541741 (= e!313649 false)))

(declare-fun lt!247722 () SeekEntryResult!4920)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34255 (_ BitVec 32)) SeekEntryResult!4920)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!541741 (= lt!247722 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16462 a!3154) j!147) mask!3216) (select (arr!16462 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!541742 () Bool)

(declare-fun res!336473 () Bool)

(assert (=> b!541742 (=> (not res!336473) (not e!313648))))

(assert (=> b!541742 (= res!336473 (validKeyInArray!0 k0!1998))))

(declare-fun b!541743 () Bool)

(declare-fun res!336465 () Bool)

(assert (=> b!541743 (=> (not res!336465) (not e!313648))))

(assert (=> b!541743 (= res!336465 (and (= (size!16826 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16826 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16826 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!541744 () Bool)

(declare-fun res!336466 () Bool)

(assert (=> b!541744 (=> (not res!336466) (not e!313649))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!541744 (= res!336466 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16826 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16826 a!3154)) (= (select (arr!16462 a!3154) resIndex!32) (select (arr!16462 a!3154) j!147))))))

(declare-fun b!541745 () Bool)

(declare-fun res!336467 () Bool)

(assert (=> b!541745 (=> (not res!336467) (not e!313649))))

(assert (=> b!541745 (= res!336467 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16462 a!3154) j!147) a!3154 mask!3216) (Intermediate!4920 false resIndex!32 resX!32)))))

(assert (= (and start!49196 res!336468) b!541743))

(assert (= (and b!541743 res!336465) b!541737))

(assert (= (and b!541737 res!336472) b!541742))

(assert (= (and b!541742 res!336473) b!541740))

(assert (= (and b!541740 res!336464) b!541738))

(assert (= (and b!541738 res!336469) b!541736))

(assert (= (and b!541736 res!336470) b!541739))

(assert (= (and b!541739 res!336471) b!541744))

(assert (= (and b!541744 res!336466) b!541745))

(assert (= (and b!541745 res!336467) b!541741))

(declare-fun m!520181 () Bool)

(assert (=> b!541745 m!520181))

(assert (=> b!541745 m!520181))

(declare-fun m!520183 () Bool)

(assert (=> b!541745 m!520183))

(declare-fun m!520185 () Bool)

(assert (=> b!541740 m!520185))

(declare-fun m!520187 () Bool)

(assert (=> start!49196 m!520187))

(declare-fun m!520189 () Bool)

(assert (=> start!49196 m!520189))

(declare-fun m!520191 () Bool)

(assert (=> b!541736 m!520191))

(assert (=> b!541737 m!520181))

(assert (=> b!541737 m!520181))

(declare-fun m!520193 () Bool)

(assert (=> b!541737 m!520193))

(declare-fun m!520195 () Bool)

(assert (=> b!541744 m!520195))

(assert (=> b!541744 m!520181))

(declare-fun m!520197 () Bool)

(assert (=> b!541739 m!520197))

(declare-fun m!520199 () Bool)

(assert (=> b!541738 m!520199))

(declare-fun m!520201 () Bool)

(assert (=> b!541742 m!520201))

(assert (=> b!541741 m!520181))

(assert (=> b!541741 m!520181))

(declare-fun m!520203 () Bool)

(assert (=> b!541741 m!520203))

(assert (=> b!541741 m!520203))

(assert (=> b!541741 m!520181))

(declare-fun m!520205 () Bool)

(assert (=> b!541741 m!520205))

(check-sat (not b!541740) (not start!49196) (not b!541739) (not b!541737) (not b!541741) (not b!541745) (not b!541742) (not b!541736) (not b!541738))
(check-sat)
