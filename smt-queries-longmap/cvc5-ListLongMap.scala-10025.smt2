; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118254 () Bool)

(assert start!118254)

(declare-fun b!1383214 () Bool)

(declare-fun res!924850 () Bool)

(declare-fun e!783993 () Bool)

(assert (=> b!1383214 (=> (not res!924850) (not e!783993))))

(declare-datatypes ((array!94510 0))(
  ( (array!94511 (arr!45633 (Array (_ BitVec 32) (_ BitVec 64))) (size!46185 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94510)

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383214 (= res!924850 (validKeyInArray!0 (select (arr!45633 a!2938) i!1065)))))

(declare-fun res!924851 () Bool)

(assert (=> start!118254 (=> (not res!924851) (not e!783993))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118254 (= res!924851 (validMask!0 mask!2987))))

(assert (=> start!118254 e!783993))

(assert (=> start!118254 true))

(declare-fun array_inv!34866 (array!94510) Bool)

(assert (=> start!118254 (array_inv!34866 a!2938)))

(declare-fun b!1383213 () Bool)

(declare-fun res!924849 () Bool)

(assert (=> b!1383213 (=> (not res!924849) (not e!783993))))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1383213 (= res!924849 (and (= (size!46185 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46185 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46185 a!2938))))))

(declare-fun b!1383216 () Bool)

(assert (=> b!1383216 (= e!783993 false)))

(declare-fun lt!608393 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94510 (_ BitVec 32)) Bool)

(assert (=> b!1383216 (= lt!608393 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1383215 () Bool)

(declare-fun res!924848 () Bool)

(assert (=> b!1383215 (=> (not res!924848) (not e!783993))))

(declare-datatypes ((List!32239 0))(
  ( (Nil!32236) (Cons!32235 (h!33444 (_ BitVec 64)) (t!46925 List!32239)) )
))
(declare-fun arrayNoDuplicates!0 (array!94510 (_ BitVec 32) List!32239) Bool)

(assert (=> b!1383215 (= res!924848 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32236))))

(assert (= (and start!118254 res!924851) b!1383213))

(assert (= (and b!1383213 res!924849) b!1383214))

(assert (= (and b!1383214 res!924850) b!1383215))

(assert (= (and b!1383215 res!924848) b!1383216))

(declare-fun m!1267881 () Bool)

(assert (=> b!1383214 m!1267881))

(assert (=> b!1383214 m!1267881))

(declare-fun m!1267883 () Bool)

(assert (=> b!1383214 m!1267883))

(declare-fun m!1267885 () Bool)

(assert (=> start!118254 m!1267885))

(declare-fun m!1267887 () Bool)

(assert (=> start!118254 m!1267887))

(declare-fun m!1267889 () Bool)

(assert (=> b!1383216 m!1267889))

(declare-fun m!1267891 () Bool)

(assert (=> b!1383215 m!1267891))

(push 1)

(assert (not b!1383214))

(assert (not start!118254))

(assert (not b!1383215))

(assert (not b!1383216))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

