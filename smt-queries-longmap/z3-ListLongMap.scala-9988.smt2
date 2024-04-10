; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117936 () Bool)

(assert start!117936)

(declare-fun b!1381701 () Bool)

(declare-fun e!783221 () Bool)

(assert (=> b!1381701 (= e!783221 false)))

(declare-fun lt!608265 () Bool)

(declare-datatypes ((array!94327 0))(
  ( (array!94328 (arr!45546 (Array (_ BitVec 32) (_ BitVec 64))) (size!46096 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94327)

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94327 (_ BitVec 32)) Bool)

(assert (=> b!1381701 (= lt!608265 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1381699 () Bool)

(declare-fun res!923327 () Bool)

(assert (=> b!1381699 (=> (not res!923327) (not e!783221))))

(declare-fun i!1094 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381699 (= res!923327 (validKeyInArray!0 (select (arr!45546 a!2971) i!1094)))))

(declare-fun b!1381700 () Bool)

(declare-fun res!923328 () Bool)

(assert (=> b!1381700 (=> (not res!923328) (not e!783221))))

(declare-datatypes ((List!32080 0))(
  ( (Nil!32077) (Cons!32076 (h!33285 (_ BitVec 64)) (t!46774 List!32080)) )
))
(declare-fun arrayNoDuplicates!0 (array!94327 (_ BitVec 32) List!32080) Bool)

(assert (=> b!1381700 (= res!923328 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32077))))

(declare-fun b!1381698 () Bool)

(declare-fun res!923326 () Bool)

(assert (=> b!1381698 (=> (not res!923326) (not e!783221))))

(assert (=> b!1381698 (= res!923326 (and (= (size!46096 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46096 a!2971))))))

(declare-fun res!923329 () Bool)

(assert (=> start!117936 (=> (not res!923329) (not e!783221))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117936 (= res!923329 (validMask!0 mask!3034))))

(assert (=> start!117936 e!783221))

(assert (=> start!117936 true))

(declare-fun array_inv!34574 (array!94327) Bool)

(assert (=> start!117936 (array_inv!34574 a!2971)))

(assert (= (and start!117936 res!923329) b!1381698))

(assert (= (and b!1381698 res!923326) b!1381699))

(assert (= (and b!1381699 res!923327) b!1381700))

(assert (= (and b!1381700 res!923328) b!1381701))

(declare-fun m!1266879 () Bool)

(assert (=> b!1381701 m!1266879))

(declare-fun m!1266881 () Bool)

(assert (=> b!1381699 m!1266881))

(assert (=> b!1381699 m!1266881))

(declare-fun m!1266883 () Bool)

(assert (=> b!1381699 m!1266883))

(declare-fun m!1266885 () Bool)

(assert (=> b!1381700 m!1266885))

(declare-fun m!1266887 () Bool)

(assert (=> start!117936 m!1266887))

(declare-fun m!1266889 () Bool)

(assert (=> start!117936 m!1266889))

(check-sat (not b!1381701) (not start!117936) (not b!1381700) (not b!1381699))
(check-sat)
