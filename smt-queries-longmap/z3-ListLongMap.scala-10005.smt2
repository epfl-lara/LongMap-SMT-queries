; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118064 () Bool)

(assert start!118064)

(declare-fun b!1382393 () Bool)

(declare-fun res!924030 () Bool)

(declare-fun e!783553 () Bool)

(assert (=> b!1382393 (=> (not res!924030) (not e!783553))))

(declare-datatypes ((array!94380 0))(
  ( (array!94381 (arr!45571 (Array (_ BitVec 32) (_ BitVec 64))) (size!46123 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94380)

(declare-datatypes ((List!32183 0))(
  ( (Nil!32180) (Cons!32179 (h!33388 (_ BitVec 64)) (t!46869 List!32183)) )
))
(declare-fun arrayNoDuplicates!0 (array!94380 (_ BitVec 32) List!32183) Bool)

(assert (=> b!1382393 (= res!924030 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32180))))

(declare-fun b!1382394 () Bool)

(declare-fun res!924032 () Bool)

(assert (=> b!1382394 (=> (not res!924032) (not e!783553))))

(declare-fun i!1094 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382394 (= res!924032 (validKeyInArray!0 (select (arr!45571 a!2971) i!1094)))))

(declare-fun b!1382395 () Bool)

(declare-fun res!924029 () Bool)

(assert (=> b!1382395 (=> (not res!924029) (not e!783553))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94380 (_ BitVec 32)) Bool)

(assert (=> b!1382395 (= res!924029 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun res!924031 () Bool)

(assert (=> start!118064 (=> (not res!924031) (not e!783553))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118064 (= res!924031 (validMask!0 mask!3034))))

(assert (=> start!118064 e!783553))

(assert (=> start!118064 true))

(declare-fun array_inv!34804 (array!94380) Bool)

(assert (=> start!118064 (array_inv!34804 a!2971)))

(declare-fun b!1382396 () Bool)

(declare-fun res!924028 () Bool)

(assert (=> b!1382396 (=> (not res!924028) (not e!783553))))

(assert (=> b!1382396 (= res!924028 (and (= (size!46123 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46123 a!2971))))))

(declare-fun b!1382397 () Bool)

(assert (=> b!1382397 (= e!783553 (and (not (= (select (arr!45571 a!2971) i!1094) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45571 a!2971) i!1094) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge #b00000000000000000000000000000000 (size!46123 a!2971))))))

(assert (= (and start!118064 res!924031) b!1382396))

(assert (= (and b!1382396 res!924028) b!1382394))

(assert (= (and b!1382394 res!924032) b!1382393))

(assert (= (and b!1382393 res!924030) b!1382395))

(assert (= (and b!1382395 res!924029) b!1382397))

(declare-fun m!1267095 () Bool)

(assert (=> b!1382393 m!1267095))

(declare-fun m!1267097 () Bool)

(assert (=> b!1382394 m!1267097))

(assert (=> b!1382394 m!1267097))

(declare-fun m!1267099 () Bool)

(assert (=> b!1382394 m!1267099))

(declare-fun m!1267101 () Bool)

(assert (=> start!118064 m!1267101))

(declare-fun m!1267103 () Bool)

(assert (=> start!118064 m!1267103))

(assert (=> b!1382397 m!1267097))

(declare-fun m!1267105 () Bool)

(assert (=> b!1382395 m!1267105))

(check-sat (not start!118064) (not b!1382393) (not b!1382394) (not b!1382395))
(check-sat)
