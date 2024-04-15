; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92302 () Bool)

(assert start!92302)

(declare-fun b!1048922 () Bool)

(declare-fun e!595053 () Bool)

(assert (=> b!1048922 (= e!595053 true)))

(declare-datatypes ((array!66044 0))(
  ( (array!66045 (arr!31761 (Array (_ BitVec 32) (_ BitVec 64))) (size!32299 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66044)

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((List!22132 0))(
  ( (Nil!22129) (Cons!22128 (h!23337 (_ BitVec 64)) (t!31430 List!22132)) )
))
(declare-fun arrayNoDuplicates!0 (array!66044 (_ BitVec 32) List!22132) Bool)

(assert (=> b!1048922 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22129)))

(declare-datatypes ((Unit!34175 0))(
  ( (Unit!34176) )
))
(declare-fun lt!463178 () Unit!34175)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66044 (_ BitVec 32) (_ BitVec 32)) Unit!34175)

(assert (=> b!1048922 (= lt!463178 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1048923 () Bool)

(declare-fun e!595057 () Bool)

(assert (=> b!1048923 (= e!595057 (not e!595053))))

(declare-fun res!698132 () Bool)

(assert (=> b!1048923 (=> res!698132 e!595053)))

(declare-fun lt!463180 () (_ BitVec 32))

(assert (=> b!1048923 (= res!698132 (bvsle lt!463180 i!1381))))

(declare-fun e!595056 () Bool)

(assert (=> b!1048923 e!595056))

(declare-fun res!698140 () Bool)

(assert (=> b!1048923 (=> (not res!698140) (not e!595056))))

(declare-fun k0!2747 () (_ BitVec 64))

(assert (=> b!1048923 (= res!698140 (= (select (store (arr!31761 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463180) k0!2747))))

(declare-fun b!1048924 () Bool)

(declare-fun e!595055 () Bool)

(assert (=> b!1048924 (= e!595056 e!595055)))

(declare-fun res!698136 () Bool)

(assert (=> b!1048924 (=> res!698136 e!595055)))

(assert (=> b!1048924 (= res!698136 (bvsle lt!463180 i!1381))))

(declare-fun b!1048925 () Bool)

(declare-fun res!698134 () Bool)

(declare-fun e!595059 () Bool)

(assert (=> b!1048925 (=> (not res!698134) (not e!595059))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1048925 (= res!698134 (validKeyInArray!0 k0!2747))))

(declare-fun b!1048926 () Bool)

(declare-fun res!698139 () Bool)

(assert (=> b!1048926 (=> (not res!698139) (not e!595059))))

(assert (=> b!1048926 (= res!698139 (= (select (arr!31761 a!3488) i!1381) k0!2747))))

(declare-fun b!1048927 () Bool)

(declare-fun e!595054 () Bool)

(assert (=> b!1048927 (= e!595054 e!595057)))

(declare-fun res!698135 () Bool)

(assert (=> b!1048927 (=> (not res!698135) (not e!595057))))

(assert (=> b!1048927 (= res!698135 (not (= lt!463180 i!1381)))))

(declare-fun lt!463179 () array!66044)

(declare-fun arrayScanForKey!0 (array!66044 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1048927 (= lt!463180 (arrayScanForKey!0 lt!463179 k0!2747 #b00000000000000000000000000000000))))

(declare-fun res!698138 () Bool)

(assert (=> start!92302 (=> (not res!698138) (not e!595059))))

(assert (=> start!92302 (= res!698138 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32299 a!3488)) (bvslt (size!32299 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92302 e!595059))

(assert (=> start!92302 true))

(declare-fun array_inv!24544 (array!66044) Bool)

(assert (=> start!92302 (array_inv!24544 a!3488)))

(declare-fun b!1048928 () Bool)

(declare-fun res!698133 () Bool)

(assert (=> b!1048928 (=> (not res!698133) (not e!595059))))

(assert (=> b!1048928 (= res!698133 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22129))))

(declare-fun b!1048929 () Bool)

(assert (=> b!1048929 (= e!595059 e!595054)))

(declare-fun res!698137 () Bool)

(assert (=> b!1048929 (=> (not res!698137) (not e!595054))))

(declare-fun arrayContainsKey!0 (array!66044 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1048929 (= res!698137 (arrayContainsKey!0 lt!463179 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1048929 (= lt!463179 (array!66045 (store (arr!31761 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32299 a!3488)))))

(declare-fun b!1048930 () Bool)

(assert (=> b!1048930 (= e!595055 (arrayContainsKey!0 a!3488 k0!2747 lt!463180))))

(assert (= (and start!92302 res!698138) b!1048928))

(assert (= (and b!1048928 res!698133) b!1048925))

(assert (= (and b!1048925 res!698134) b!1048926))

(assert (= (and b!1048926 res!698139) b!1048929))

(assert (= (and b!1048929 res!698137) b!1048927))

(assert (= (and b!1048927 res!698135) b!1048923))

(assert (= (and b!1048923 res!698140) b!1048924))

(assert (= (and b!1048924 (not res!698136)) b!1048930))

(assert (= (and b!1048923 (not res!698132)) b!1048922))

(declare-fun m!969283 () Bool)

(assert (=> b!1048928 m!969283))

(declare-fun m!969285 () Bool)

(assert (=> b!1048922 m!969285))

(declare-fun m!969287 () Bool)

(assert (=> b!1048922 m!969287))

(declare-fun m!969289 () Bool)

(assert (=> b!1048926 m!969289))

(declare-fun m!969291 () Bool)

(assert (=> b!1048927 m!969291))

(declare-fun m!969293 () Bool)

(assert (=> b!1048925 m!969293))

(declare-fun m!969295 () Bool)

(assert (=> start!92302 m!969295))

(declare-fun m!969297 () Bool)

(assert (=> b!1048923 m!969297))

(declare-fun m!969299 () Bool)

(assert (=> b!1048923 m!969299))

(declare-fun m!969301 () Bool)

(assert (=> b!1048929 m!969301))

(assert (=> b!1048929 m!969297))

(declare-fun m!969303 () Bool)

(assert (=> b!1048930 m!969303))

(check-sat (not start!92302) (not b!1048927) (not b!1048929) (not b!1048925) (not b!1048930) (not b!1048928) (not b!1048922))
(check-sat)
