; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33078 () Bool)

(assert start!33078)

(declare-fun b!329226 () Bool)

(declare-fun res!181416 () Bool)

(declare-fun e!202273 () Bool)

(assert (=> b!329226 (=> (not res!181416) (not e!202273))))

(declare-datatypes ((array!16839 0))(
  ( (array!16840 (arr!7965 (Array (_ BitVec 32) (_ BitVec 64))) (size!8317 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16839)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16839 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!329226 (= res!181416 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!329227 () Bool)

(declare-fun res!181412 () Bool)

(assert (=> b!329227 (=> (not res!181412) (not e!202273))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!329227 (= res!181412 (validKeyInArray!0 k0!2497))))

(declare-fun b!329228 () Bool)

(declare-fun res!181413 () Bool)

(assert (=> b!329228 (=> (not res!181413) (not e!202273))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16839 (_ BitVec 32)) Bool)

(assert (=> b!329228 (= res!181413 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!329229 () Bool)

(declare-fun e!202274 () Bool)

(assert (=> b!329229 (= e!202274 (not false))))

(declare-datatypes ((SeekEntryResult!3096 0))(
  ( (MissingZero!3096 (index!14560 (_ BitVec 32))) (Found!3096 (index!14561 (_ BitVec 32))) (Intermediate!3096 (undefined!3908 Bool) (index!14562 (_ BitVec 32)) (x!32829 (_ BitVec 32))) (Undefined!3096) (MissingVacant!3096 (index!14563 (_ BitVec 32))) )
))
(declare-fun lt!158163 () SeekEntryResult!3096)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!329229 (= lt!158163 (Intermediate!3096 false index!1840 resX!58))))

(declare-fun b!329230 () Bool)

(declare-fun res!181419 () Bool)

(assert (=> b!329230 (=> (not res!181419) (not e!202273))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16839 (_ BitVec 32)) SeekEntryResult!3096)

(assert (=> b!329230 (= res!181419 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3096 i!1250)))))

(declare-fun b!329231 () Bool)

(declare-fun e!202275 () Bool)

(assert (=> b!329231 (= e!202273 e!202275)))

(declare-fun res!181415 () Bool)

(assert (=> b!329231 (=> (not res!181415) (not e!202275))))

(declare-fun lt!158162 () SeekEntryResult!3096)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16839 (_ BitVec 32)) SeekEntryResult!3096)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!329231 (= res!181415 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!158162))))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!329231 (= lt!158162 (Intermediate!3096 false resIndex!58 resX!58))))

(declare-fun res!181414 () Bool)

(assert (=> start!33078 (=> (not res!181414) (not e!202273))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33078 (= res!181414 (validMask!0 mask!3777))))

(assert (=> start!33078 e!202273))

(declare-fun array_inv!5928 (array!16839) Bool)

(assert (=> start!33078 (array_inv!5928 a!3305)))

(assert (=> start!33078 true))

(declare-fun b!329232 () Bool)

(assert (=> b!329232 (= e!202275 e!202274)))

(declare-fun res!181411 () Bool)

(assert (=> b!329232 (=> (not res!181411) (not e!202274))))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!329232 (= res!181411 (and (= lt!158163 lt!158162) (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7965 a!3305) index!1840) k0!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (or (= (select (arr!7965 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7965 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!329232 (= lt!158163 (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777))))

(declare-fun b!329233 () Bool)

(declare-fun res!181418 () Bool)

(assert (=> b!329233 (=> (not res!181418) (not e!202275))))

(assert (=> b!329233 (= res!181418 (and (= (select (arr!7965 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8317 a!3305))))))

(declare-fun b!329234 () Bool)

(declare-fun res!181417 () Bool)

(assert (=> b!329234 (=> (not res!181417) (not e!202273))))

(assert (=> b!329234 (= res!181417 (and (= (size!8317 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8317 a!3305))))))

(assert (= (and start!33078 res!181414) b!329234))

(assert (= (and b!329234 res!181417) b!329227))

(assert (= (and b!329227 res!181412) b!329226))

(assert (= (and b!329226 res!181416) b!329230))

(assert (= (and b!329230 res!181419) b!329228))

(assert (= (and b!329228 res!181413) b!329231))

(assert (= (and b!329231 res!181415) b!329233))

(assert (= (and b!329233 res!181418) b!329232))

(assert (= (and b!329232 res!181411) b!329229))

(declare-fun m!334947 () Bool)

(assert (=> start!33078 m!334947))

(declare-fun m!334949 () Bool)

(assert (=> start!33078 m!334949))

(declare-fun m!334951 () Bool)

(assert (=> b!329233 m!334951))

(declare-fun m!334953 () Bool)

(assert (=> b!329227 m!334953))

(declare-fun m!334955 () Bool)

(assert (=> b!329226 m!334955))

(declare-fun m!334957 () Bool)

(assert (=> b!329232 m!334957))

(declare-fun m!334959 () Bool)

(assert (=> b!329232 m!334959))

(declare-fun m!334961 () Bool)

(assert (=> b!329231 m!334961))

(assert (=> b!329231 m!334961))

(declare-fun m!334963 () Bool)

(assert (=> b!329231 m!334963))

(declare-fun m!334965 () Bool)

(assert (=> b!329230 m!334965))

(declare-fun m!334967 () Bool)

(assert (=> b!329228 m!334967))

(check-sat (not b!329232) (not b!329227) (not b!329228) (not b!329226) (not start!33078) (not b!329231) (not b!329230))
(check-sat)
