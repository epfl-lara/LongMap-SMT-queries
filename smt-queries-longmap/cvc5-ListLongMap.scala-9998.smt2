; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118024 () Bool)

(assert start!118024)

(declare-fun b!1382210 () Bool)

(declare-fun res!923802 () Bool)

(declare-fun e!783458 () Bool)

(assert (=> b!1382210 (=> (not res!923802) (not e!783458))))

(declare-datatypes ((array!94388 0))(
  ( (array!94389 (arr!45575 (Array (_ BitVec 32) (_ BitVec 64))) (size!46125 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94388)

(declare-datatypes ((List!32109 0))(
  ( (Nil!32106) (Cons!32105 (h!33314 (_ BitVec 64)) (t!46803 List!32109)) )
))
(declare-fun arrayNoDuplicates!0 (array!94388 (_ BitVec 32) List!32109) Bool)

(assert (=> b!1382210 (= res!923802 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32106))))

(declare-fun b!1382211 () Bool)

(assert (=> b!1382211 (= e!783458 false)))

(declare-fun lt!608370 () Bool)

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94388 (_ BitVec 32)) Bool)

(assert (=> b!1382211 (= lt!608370 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1382208 () Bool)

(declare-fun res!923801 () Bool)

(assert (=> b!1382208 (=> (not res!923801) (not e!783458))))

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1382208 (= res!923801 (and (= (size!46125 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46125 a!2971))))))

(declare-fun res!923800 () Bool)

(assert (=> start!118024 (=> (not res!923800) (not e!783458))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118024 (= res!923800 (validMask!0 mask!3034))))

(assert (=> start!118024 e!783458))

(assert (=> start!118024 true))

(declare-fun array_inv!34603 (array!94388) Bool)

(assert (=> start!118024 (array_inv!34603 a!2971)))

(declare-fun b!1382209 () Bool)

(declare-fun res!923803 () Bool)

(assert (=> b!1382209 (=> (not res!923803) (not e!783458))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382209 (= res!923803 (validKeyInArray!0 (select (arr!45575 a!2971) i!1094)))))

(assert (= (and start!118024 res!923800) b!1382208))

(assert (= (and b!1382208 res!923801) b!1382209))

(assert (= (and b!1382209 res!923803) b!1382210))

(assert (= (and b!1382210 res!923802) b!1382211))

(declare-fun m!1267347 () Bool)

(assert (=> b!1382210 m!1267347))

(declare-fun m!1267349 () Bool)

(assert (=> b!1382211 m!1267349))

(declare-fun m!1267351 () Bool)

(assert (=> start!118024 m!1267351))

(declare-fun m!1267353 () Bool)

(assert (=> start!118024 m!1267353))

(declare-fun m!1267355 () Bool)

(assert (=> b!1382209 m!1267355))

(assert (=> b!1382209 m!1267355))

(declare-fun m!1267357 () Bool)

(assert (=> b!1382209 m!1267357))

(push 1)

(assert (not b!1382209))

(assert (not start!118024))

(assert (not b!1382210))

(assert (not b!1382211))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

