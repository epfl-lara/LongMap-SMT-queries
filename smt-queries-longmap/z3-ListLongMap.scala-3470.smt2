; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48138 () Bool)

(assert start!48138)

(declare-fun b!530152 () Bool)

(declare-fun e!308876 () Bool)

(declare-datatypes ((array!33584 0))(
  ( (array!33585 (arr!16139 (Array (_ BitVec 32) (_ BitVec 64))) (size!16504 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33584)

(assert (=> b!530152 (= e!308876 (bvsge #b00000000000000000000000000000000 (size!16504 a!3154)))))

(declare-fun b!530151 () Bool)

(declare-fun res!325999 () Bool)

(assert (=> b!530151 (=> (not res!325999) (not e!308876))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!530151 (= res!325999 (validKeyInArray!0 k0!1998))))

(declare-fun b!530149 () Bool)

(declare-fun res!325998 () Bool)

(assert (=> b!530149 (=> (not res!325998) (not e!308876))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!530149 (= res!325998 (and (= (size!16504 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16504 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16504 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!530150 () Bool)

(declare-fun res!326000 () Bool)

(assert (=> b!530150 (=> (not res!326000) (not e!308876))))

(assert (=> b!530150 (= res!326000 (validKeyInArray!0 (select (arr!16139 a!3154) j!147)))))

(declare-fun res!325997 () Bool)

(assert (=> start!48138 (=> (not res!325997) (not e!308876))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48138 (= res!325997 (validMask!0 mask!3216))))

(assert (=> start!48138 e!308876))

(assert (=> start!48138 true))

(declare-fun array_inv!12022 (array!33584) Bool)

(assert (=> start!48138 (array_inv!12022 a!3154)))

(assert (= (and start!48138 res!325997) b!530149))

(assert (= (and b!530149 res!325998) b!530150))

(assert (= (and b!530150 res!326000) b!530151))

(assert (= (and b!530151 res!325999) b!530152))

(declare-fun m!510265 () Bool)

(assert (=> b!530151 m!510265))

(declare-fun m!510267 () Bool)

(assert (=> b!530150 m!510267))

(assert (=> b!530150 m!510267))

(declare-fun m!510269 () Bool)

(assert (=> b!530150 m!510269))

(declare-fun m!510271 () Bool)

(assert (=> start!48138 m!510271))

(declare-fun m!510273 () Bool)

(assert (=> start!48138 m!510273))

(check-sat (not b!530150) (not start!48138) (not b!530151))
(check-sat)
