; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118260 () Bool)

(assert start!118260)

(declare-fun b!1383251 () Bool)

(declare-fun res!924885 () Bool)

(declare-fun e!784012 () Bool)

(assert (=> b!1383251 (=> (not res!924885) (not e!784012))))

(declare-datatypes ((array!94516 0))(
  ( (array!94517 (arr!45636 (Array (_ BitVec 32) (_ BitVec 64))) (size!46188 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94516)

(declare-datatypes ((List!32242 0))(
  ( (Nil!32239) (Cons!32238 (h!33447 (_ BitVec 64)) (t!46928 List!32242)) )
))
(declare-fun arrayNoDuplicates!0 (array!94516 (_ BitVec 32) List!32242) Bool)

(assert (=> b!1383251 (= res!924885 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32239))))

(declare-fun b!1383252 () Bool)

(assert (=> b!1383252 (= e!784012 false)))

(declare-fun lt!608402 () Bool)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94516 (_ BitVec 32)) Bool)

(assert (=> b!1383252 (= lt!608402 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1383250 () Bool)

(declare-fun res!924884 () Bool)

(assert (=> b!1383250 (=> (not res!924884) (not e!784012))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383250 (= res!924884 (validKeyInArray!0 (select (arr!45636 a!2938) i!1065)))))

(declare-fun b!1383249 () Bool)

(declare-fun res!924886 () Bool)

(assert (=> b!1383249 (=> (not res!924886) (not e!784012))))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1383249 (= res!924886 (and (= (size!46188 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46188 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46188 a!2938))))))

(declare-fun res!924887 () Bool)

(assert (=> start!118260 (=> (not res!924887) (not e!784012))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118260 (= res!924887 (validMask!0 mask!2987))))

(assert (=> start!118260 e!784012))

(assert (=> start!118260 true))

(declare-fun array_inv!34869 (array!94516) Bool)

(assert (=> start!118260 (array_inv!34869 a!2938)))

(assert (= (and start!118260 res!924887) b!1383249))

(assert (= (and b!1383249 res!924886) b!1383250))

(assert (= (and b!1383250 res!924884) b!1383251))

(assert (= (and b!1383251 res!924885) b!1383252))

(declare-fun m!1267917 () Bool)

(assert (=> b!1383251 m!1267917))

(declare-fun m!1267919 () Bool)

(assert (=> b!1383252 m!1267919))

(declare-fun m!1267921 () Bool)

(assert (=> b!1383250 m!1267921))

(assert (=> b!1383250 m!1267921))

(declare-fun m!1267923 () Bool)

(assert (=> b!1383250 m!1267923))

(declare-fun m!1267925 () Bool)

(assert (=> start!118260 m!1267925))

(declare-fun m!1267927 () Bool)

(assert (=> start!118260 m!1267927))

(push 1)

(assert (not b!1383250))

(assert (not b!1383251))

(assert (not start!118260))

(assert (not b!1383252))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

