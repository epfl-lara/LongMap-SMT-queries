; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86134 () Bool)

(assert start!86134)

(declare-fun b!996932 () Bool)

(declare-fun res!666571 () Bool)

(declare-fun e!562604 () Bool)

(assert (=> b!996932 (=> (not res!666571) (not e!562604))))

(declare-datatypes ((array!63054 0))(
  ( (array!63055 (arr!30355 (Array (_ BitVec 32) (_ BitVec 64))) (size!30858 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63054)

(declare-datatypes ((List!21002 0))(
  ( (Nil!20999) (Cons!20998 (h!22166 (_ BitVec 64)) (t!29995 List!21002)) )
))
(declare-fun arrayNoDuplicates!0 (array!63054 (_ BitVec 32) List!21002) Bool)

(assert (=> b!996932 (= res!666571 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!20999))))

(declare-fun res!666570 () Bool)

(declare-fun e!562603 () Bool)

(assert (=> start!86134 (=> (not res!666570) (not e!562603))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86134 (= res!666570 (validMask!0 mask!3464))))

(assert (=> start!86134 e!562603))

(declare-fun array_inv!23491 (array!63054) Bool)

(assert (=> start!86134 (array_inv!23491 a!3219)))

(assert (=> start!86134 true))

(declare-fun b!996933 () Bool)

(declare-fun res!666568 () Bool)

(assert (=> b!996933 (=> (not res!666568) (not e!562603))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!996933 (= res!666568 (validKeyInArray!0 k0!2224))))

(declare-fun b!996934 () Bool)

(assert (=> b!996934 (= e!562603 e!562604)))

(declare-fun res!666575 () Bool)

(assert (=> b!996934 (=> (not res!666575) (not e!562604))))

(declare-datatypes ((SeekEntryResult!9223 0))(
  ( (MissingZero!9223 (index!39263 (_ BitVec 32))) (Found!9223 (index!39264 (_ BitVec 32))) (Intermediate!9223 (undefined!10035 Bool) (index!39265 (_ BitVec 32)) (x!86854 (_ BitVec 32))) (Undefined!9223) (MissingVacant!9223 (index!39266 (_ BitVec 32))) )
))
(declare-fun lt!441466 () SeekEntryResult!9223)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!996934 (= res!666575 (or (= lt!441466 (MissingVacant!9223 i!1194)) (= lt!441466 (MissingZero!9223 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63054 (_ BitVec 32)) SeekEntryResult!9223)

(assert (=> b!996934 (= lt!441466 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!996935 () Bool)

(declare-fun res!666567 () Bool)

(assert (=> b!996935 (=> (not res!666567) (not e!562603))))

(declare-fun j!170 () (_ BitVec 32))

(assert (=> b!996935 (= res!666567 (validKeyInArray!0 (select (arr!30355 a!3219) j!170)))))

(declare-fun b!996936 () Bool)

(declare-fun res!666574 () Bool)

(assert (=> b!996936 (=> (not res!666574) (not e!562603))))

(declare-fun arrayContainsKey!0 (array!63054 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!996936 (= res!666574 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!996937 () Bool)

(declare-fun res!666569 () Bool)

(assert (=> b!996937 (=> (not res!666569) (not e!562604))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63054 (_ BitVec 32)) Bool)

(assert (=> b!996937 (= res!666569 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!996938 () Bool)

(assert (=> b!996938 (= e!562604 false)))

(declare-fun lt!441467 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!996938 (= lt!441467 (toIndex!0 (select (arr!30355 a!3219) j!170) mask!3464))))

(declare-fun b!996939 () Bool)

(declare-fun res!666573 () Bool)

(assert (=> b!996939 (=> (not res!666573) (not e!562604))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!996939 (= res!666573 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30858 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30858 a!3219))))))

(declare-fun b!996940 () Bool)

(declare-fun res!666572 () Bool)

(assert (=> b!996940 (=> (not res!666572) (not e!562603))))

(assert (=> b!996940 (= res!666572 (and (= (size!30858 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30858 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30858 a!3219)) (not (= i!1194 j!170))))))

(assert (= (and start!86134 res!666570) b!996940))

(assert (= (and b!996940 res!666572) b!996935))

(assert (= (and b!996935 res!666567) b!996933))

(assert (= (and b!996933 res!666568) b!996936))

(assert (= (and b!996936 res!666574) b!996934))

(assert (= (and b!996934 res!666575) b!996937))

(assert (= (and b!996937 res!666569) b!996932))

(assert (= (and b!996932 res!666571) b!996939))

(assert (= (and b!996939 res!666573) b!996938))

(declare-fun m!924587 () Bool)

(assert (=> b!996932 m!924587))

(declare-fun m!924589 () Bool)

(assert (=> b!996933 m!924589))

(declare-fun m!924591 () Bool)

(assert (=> b!996938 m!924591))

(assert (=> b!996938 m!924591))

(declare-fun m!924593 () Bool)

(assert (=> b!996938 m!924593))

(declare-fun m!924595 () Bool)

(assert (=> b!996936 m!924595))

(declare-fun m!924597 () Bool)

(assert (=> b!996934 m!924597))

(assert (=> b!996935 m!924591))

(assert (=> b!996935 m!924591))

(declare-fun m!924599 () Bool)

(assert (=> b!996935 m!924599))

(declare-fun m!924601 () Bool)

(assert (=> b!996937 m!924601))

(declare-fun m!924603 () Bool)

(assert (=> start!86134 m!924603))

(declare-fun m!924605 () Bool)

(assert (=> start!86134 m!924605))

(check-sat (not b!996937) (not b!996932) (not b!996935) (not b!996934) (not b!996936) (not b!996933) (not b!996938) (not start!86134))
(check-sat)
