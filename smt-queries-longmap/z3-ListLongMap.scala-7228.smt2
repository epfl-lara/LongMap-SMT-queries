; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92428 () Bool)

(assert start!92428)

(declare-fun b!1050756 () Bool)

(declare-fun e!596349 () Bool)

(assert (=> b!1050756 (= e!596349 (not true))))

(declare-fun e!596350 () Bool)

(assert (=> b!1050756 e!596350))

(declare-fun res!699967 () Bool)

(assert (=> b!1050756 (=> (not res!699967) (not e!596350))))

(declare-fun lt!463905 () (_ BitVec 32))

(declare-datatypes ((array!66170 0))(
  ( (array!66171 (arr!31824 (Array (_ BitVec 32) (_ BitVec 64))) (size!32362 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66170)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1050756 (= res!699967 (= (select (store (arr!31824 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463905) k0!2747))))

(declare-fun b!1050757 () Bool)

(declare-fun e!596347 () Bool)

(declare-fun e!596352 () Bool)

(assert (=> b!1050757 (= e!596347 e!596352)))

(declare-fun res!699969 () Bool)

(assert (=> b!1050757 (=> (not res!699969) (not e!596352))))

(declare-fun lt!463906 () array!66170)

(declare-fun arrayContainsKey!0 (array!66170 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1050757 (= res!699969 (arrayContainsKey!0 lt!463906 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1050757 (= lt!463906 (array!66171 (store (arr!31824 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32362 a!3488)))))

(declare-fun b!1050758 () Bool)

(assert (=> b!1050758 (= e!596352 e!596349)))

(declare-fun res!699972 () Bool)

(assert (=> b!1050758 (=> (not res!699972) (not e!596349))))

(assert (=> b!1050758 (= res!699972 (not (= lt!463905 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66170 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1050758 (= lt!463905 (arrayScanForKey!0 lt!463906 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1050759 () Bool)

(declare-fun res!699968 () Bool)

(assert (=> b!1050759 (=> (not res!699968) (not e!596347))))

(assert (=> b!1050759 (= res!699968 (= (select (arr!31824 a!3488) i!1381) k0!2747))))

(declare-fun e!596348 () Bool)

(declare-fun b!1050760 () Bool)

(assert (=> b!1050760 (= e!596348 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1050761 () Bool)

(declare-fun res!699971 () Bool)

(assert (=> b!1050761 (=> (not res!699971) (not e!596347))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1050761 (= res!699971 (validKeyInArray!0 k0!2747))))

(declare-fun res!699970 () Bool)

(assert (=> start!92428 (=> (not res!699970) (not e!596347))))

(assert (=> start!92428 (= res!699970 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32362 a!3488)) (bvslt (size!32362 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92428 e!596347))

(assert (=> start!92428 true))

(declare-fun array_inv!24607 (array!66170) Bool)

(assert (=> start!92428 (array_inv!24607 a!3488)))

(declare-fun b!1050762 () Bool)

(declare-fun res!699973 () Bool)

(assert (=> b!1050762 (=> (not res!699973) (not e!596347))))

(declare-datatypes ((List!22195 0))(
  ( (Nil!22192) (Cons!22191 (h!23400 (_ BitVec 64)) (t!31493 List!22195)) )
))
(declare-fun arrayNoDuplicates!0 (array!66170 (_ BitVec 32) List!22195) Bool)

(assert (=> b!1050762 (= res!699973 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22192))))

(declare-fun b!1050763 () Bool)

(assert (=> b!1050763 (= e!596350 e!596348)))

(declare-fun res!699966 () Bool)

(assert (=> b!1050763 (=> res!699966 e!596348)))

(assert (=> b!1050763 (= res!699966 (or (bvsgt lt!463905 i!1381) (bvsle i!1381 lt!463905)))))

(assert (= (and start!92428 res!699970) b!1050762))

(assert (= (and b!1050762 res!699973) b!1050761))

(assert (= (and b!1050761 res!699971) b!1050759))

(assert (= (and b!1050759 res!699968) b!1050757))

(assert (= (and b!1050757 res!699969) b!1050758))

(assert (= (and b!1050758 res!699972) b!1050756))

(assert (= (and b!1050756 res!699967) b!1050763))

(assert (= (and b!1050763 (not res!699966)) b!1050760))

(declare-fun m!970903 () Bool)

(assert (=> b!1050762 m!970903))

(declare-fun m!970905 () Bool)

(assert (=> start!92428 m!970905))

(declare-fun m!970907 () Bool)

(assert (=> b!1050757 m!970907))

(declare-fun m!970909 () Bool)

(assert (=> b!1050757 m!970909))

(assert (=> b!1050756 m!970909))

(declare-fun m!970911 () Bool)

(assert (=> b!1050756 m!970911))

(declare-fun m!970913 () Bool)

(assert (=> b!1050760 m!970913))

(declare-fun m!970915 () Bool)

(assert (=> b!1050758 m!970915))

(declare-fun m!970917 () Bool)

(assert (=> b!1050761 m!970917))

(declare-fun m!970919 () Bool)

(assert (=> b!1050759 m!970919))

(check-sat (not b!1050761) (not b!1050758) (not b!1050757) (not b!1050762) (not start!92428) (not b!1050760))
(check-sat)
