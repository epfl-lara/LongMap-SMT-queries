; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118302 () Bool)

(assert start!118302)

(declare-fun b!1383911 () Bool)

(declare-fun res!924713 () Bool)

(declare-fun e!784497 () Bool)

(assert (=> b!1383911 (=> (not res!924713) (not e!784497))))

(declare-datatypes ((array!94562 0))(
  ( (array!94563 (arr!45660 (Array (_ BitVec 32) (_ BitVec 64))) (size!46211 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94562)

(declare-datatypes ((List!32181 0))(
  ( (Nil!32178) (Cons!32177 (h!33395 (_ BitVec 64)) (t!46867 List!32181)) )
))
(declare-fun arrayNoDuplicates!0 (array!94562 (_ BitVec 32) List!32181) Bool)

(assert (=> b!1383911 (= res!924713 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32178))))

(declare-fun b!1383912 () Bool)

(assert (=> b!1383912 (= e!784497 false)))

(declare-fun lt!608937 () Bool)

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94562 (_ BitVec 32)) Bool)

(assert (=> b!1383912 (= lt!608937 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun res!924714 () Bool)

(assert (=> start!118302 (=> (not res!924714) (not e!784497))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118302 (= res!924714 (validMask!0 mask!3034))))

(assert (=> start!118302 e!784497))

(assert (=> start!118302 true))

(declare-fun array_inv!34941 (array!94562) Bool)

(assert (=> start!118302 (array_inv!34941 a!2971)))

(declare-fun b!1383909 () Bool)

(declare-fun res!924712 () Bool)

(assert (=> b!1383909 (=> (not res!924712) (not e!784497))))

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1383909 (= res!924712 (and (= (size!46211 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46211 a!2971))))))

(declare-fun b!1383910 () Bool)

(declare-fun res!924715 () Bool)

(assert (=> b!1383910 (=> (not res!924715) (not e!784497))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383910 (= res!924715 (validKeyInArray!0 (select (arr!45660 a!2971) i!1094)))))

(assert (= (and start!118302 res!924714) b!1383909))

(assert (= (and b!1383909 res!924712) b!1383910))

(assert (= (and b!1383910 res!924715) b!1383911))

(assert (= (and b!1383911 res!924713) b!1383912))

(declare-fun m!1269363 () Bool)

(assert (=> b!1383911 m!1269363))

(declare-fun m!1269365 () Bool)

(assert (=> b!1383912 m!1269365))

(declare-fun m!1269367 () Bool)

(assert (=> start!118302 m!1269367))

(declare-fun m!1269369 () Bool)

(assert (=> start!118302 m!1269369))

(declare-fun m!1269371 () Bool)

(assert (=> b!1383910 m!1269371))

(assert (=> b!1383910 m!1269371))

(declare-fun m!1269373 () Bool)

(assert (=> b!1383910 m!1269373))

(push 1)

(assert (not start!118302))

(assert (not b!1383911))

(assert (not b!1383912))

(assert (not b!1383910))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

