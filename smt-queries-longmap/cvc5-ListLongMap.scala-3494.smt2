; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48480 () Bool)

(assert start!48480)

(declare-fun b!532499 () Bool)

(declare-fun res!327848 () Bool)

(declare-fun e!310040 () Bool)

(assert (=> b!532499 (=> (not res!327848) (not e!310040))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!532499 (= res!327848 (validKeyInArray!0 k!1998))))

(declare-fun b!532500 () Bool)

(declare-fun res!327850 () Bool)

(declare-fun e!310039 () Bool)

(assert (=> b!532500 (=> (not res!327850) (not e!310039))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33743 0))(
  ( (array!33744 (arr!16212 (Array (_ BitVec 32) (_ BitVec 64))) (size!16576 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33743)

(declare-fun resX!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4670 0))(
  ( (MissingZero!4670 (index!20904 (_ BitVec 32))) (Found!4670 (index!20905 (_ BitVec 32))) (Intermediate!4670 (undefined!5482 Bool) (index!20906 (_ BitVec 32)) (x!49879 (_ BitVec 32))) (Undefined!4670) (MissingVacant!4670 (index!20907 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33743 (_ BitVec 32)) SeekEntryResult!4670)

(assert (=> b!532500 (= res!327850 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16212 a!3154) j!147) a!3154 mask!3216) (Intermediate!4670 false resIndex!32 resX!32)))))

(declare-fun b!532501 () Bool)

(declare-fun res!327846 () Bool)

(assert (=> b!532501 (=> (not res!327846) (not e!310040))))

(assert (=> b!532501 (= res!327846 (validKeyInArray!0 (select (arr!16212 a!3154) j!147)))))

(declare-fun b!532502 () Bool)

(declare-fun res!327853 () Bool)

(assert (=> b!532502 (=> (not res!327853) (not e!310039))))

(assert (=> b!532502 (= res!327853 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16576 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16576 a!3154)) (= (select (arr!16212 a!3154) resIndex!32) (select (arr!16212 a!3154) j!147))))))

(declare-fun b!532503 () Bool)

(assert (=> b!532503 (= e!310039 (bvslt mask!3216 #b00000000000000000000000000000000))))

(declare-fun lt!245223 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!532503 (= lt!245223 (toIndex!0 (select (arr!16212 a!3154) j!147) mask!3216))))

(declare-fun res!327851 () Bool)

(assert (=> start!48480 (=> (not res!327851) (not e!310040))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48480 (= res!327851 (validMask!0 mask!3216))))

(assert (=> start!48480 e!310040))

(assert (=> start!48480 true))

(declare-fun array_inv!12008 (array!33743) Bool)

(assert (=> start!48480 (array_inv!12008 a!3154)))

(declare-fun b!532504 () Bool)

(declare-fun res!327852 () Bool)

(assert (=> b!532504 (=> (not res!327852) (not e!310040))))

(declare-fun arrayContainsKey!0 (array!33743 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!532504 (= res!327852 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!532505 () Bool)

(assert (=> b!532505 (= e!310040 e!310039)))

(declare-fun res!327847 () Bool)

(assert (=> b!532505 (=> (not res!327847) (not e!310039))))

(declare-fun lt!245224 () SeekEntryResult!4670)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!532505 (= res!327847 (or (= lt!245224 (MissingZero!4670 i!1153)) (= lt!245224 (MissingVacant!4670 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33743 (_ BitVec 32)) SeekEntryResult!4670)

(assert (=> b!532505 (= lt!245224 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!532506 () Bool)

(declare-fun res!327845 () Bool)

(assert (=> b!532506 (=> (not res!327845) (not e!310040))))

(assert (=> b!532506 (= res!327845 (and (= (size!16576 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16576 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16576 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!532507 () Bool)

(declare-fun res!327849 () Bool)

(assert (=> b!532507 (=> (not res!327849) (not e!310039))))

(declare-datatypes ((List!10331 0))(
  ( (Nil!10328) (Cons!10327 (h!11267 (_ BitVec 64)) (t!16559 List!10331)) )
))
(declare-fun arrayNoDuplicates!0 (array!33743 (_ BitVec 32) List!10331) Bool)

(assert (=> b!532507 (= res!327849 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10328))))

(declare-fun b!532508 () Bool)

(declare-fun res!327854 () Bool)

(assert (=> b!532508 (=> (not res!327854) (not e!310039))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33743 (_ BitVec 32)) Bool)

(assert (=> b!532508 (= res!327854 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(assert (= (and start!48480 res!327851) b!532506))

(assert (= (and b!532506 res!327845) b!532501))

(assert (= (and b!532501 res!327846) b!532499))

(assert (= (and b!532499 res!327848) b!532504))

(assert (= (and b!532504 res!327852) b!532505))

(assert (= (and b!532505 res!327847) b!532508))

(assert (= (and b!532508 res!327854) b!532507))

(assert (= (and b!532507 res!327849) b!532502))

(assert (= (and b!532502 res!327853) b!532500))

(assert (= (and b!532500 res!327850) b!532503))

(declare-fun m!512637 () Bool)

(assert (=> b!532499 m!512637))

(declare-fun m!512639 () Bool)

(assert (=> b!532500 m!512639))

(assert (=> b!532500 m!512639))

(declare-fun m!512641 () Bool)

(assert (=> b!532500 m!512641))

(declare-fun m!512643 () Bool)

(assert (=> b!532502 m!512643))

(assert (=> b!532502 m!512639))

(assert (=> b!532503 m!512639))

(assert (=> b!532503 m!512639))

(declare-fun m!512645 () Bool)

(assert (=> b!532503 m!512645))

(declare-fun m!512647 () Bool)

(assert (=> start!48480 m!512647))

(declare-fun m!512649 () Bool)

(assert (=> start!48480 m!512649))

(assert (=> b!532501 m!512639))

(assert (=> b!532501 m!512639))

(declare-fun m!512651 () Bool)

(assert (=> b!532501 m!512651))

(declare-fun m!512653 () Bool)

(assert (=> b!532507 m!512653))

(declare-fun m!512655 () Bool)

(assert (=> b!532505 m!512655))

(declare-fun m!512657 () Bool)

(assert (=> b!532508 m!512657))

(declare-fun m!512659 () Bool)

(assert (=> b!532504 m!512659))

(push 1)

