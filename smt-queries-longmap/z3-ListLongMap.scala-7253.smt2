; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92578 () Bool)

(assert start!92578)

(declare-fun res!702013 () Bool)

(declare-fun e!597806 () Bool)

(assert (=> start!92578 (=> (not res!702013) (not e!597806))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66320 0))(
  ( (array!66321 (arr!31899 (Array (_ BitVec 32) (_ BitVec 64))) (size!32437 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66320)

(assert (=> start!92578 (= res!702013 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32437 a!3488)) (bvslt (size!32437 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92578 e!597806))

(assert (=> start!92578 true))

(declare-fun array_inv!24682 (array!66320) Bool)

(assert (=> start!92578 (array_inv!24682 a!3488)))

(declare-fun b!1052803 () Bool)

(assert (=> b!1052803 (= e!597806 false)))

(declare-fun lt!464812 () Bool)

(declare-datatypes ((List!22270 0))(
  ( (Nil!22267) (Cons!22266 (h!23475 (_ BitVec 64)) (t!31568 List!22270)) )
))
(declare-fun arrayNoDuplicates!0 (array!66320 (_ BitVec 32) List!22270) Bool)

(assert (=> b!1052803 (= lt!464812 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22267))))

(assert (= (and start!92578 res!702013) b!1052803))

(declare-fun m!972733 () Bool)

(assert (=> start!92578 m!972733))

(declare-fun m!972735 () Bool)

(assert (=> b!1052803 m!972735))

(check-sat (not b!1052803) (not start!92578))
(check-sat)
