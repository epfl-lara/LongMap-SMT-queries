; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131134 () Bool)

(assert start!131134)

(declare-fun b!1535732 () Bool)

(declare-fun res!1051335 () Bool)

(declare-fun e!855655 () Bool)

(assert (=> b!1535732 (=> (not res!1051335) (not e!855655))))

(declare-datatypes ((array!101969 0))(
  ( (array!101970 (arr!49194 (Array (_ BitVec 32) (_ BitVec 64))) (size!49745 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101969)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1535732 (= res!1051335 (validKeyInArray!0 (select (arr!49194 a!2792) j!64)))))

(declare-fun b!1535733 () Bool)

(declare-fun res!1051338 () Bool)

(assert (=> b!1535733 (=> (not res!1051338) (not e!855655))))

(declare-datatypes ((List!35655 0))(
  ( (Nil!35652) (Cons!35651 (h!37114 (_ BitVec 64)) (t!50341 List!35655)) )
))
(declare-fun arrayNoDuplicates!0 (array!101969 (_ BitVec 32) List!35655) Bool)

(assert (=> b!1535733 (= res!1051338 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35652))))

(declare-fun b!1535734 () Bool)

(declare-fun res!1051336 () Bool)

(assert (=> b!1535734 (=> (not res!1051336) (not e!855655))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1535734 (= res!1051336 (and (= (size!49745 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49745 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49745 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1535735 () Bool)

(declare-fun res!1051332 () Bool)

(assert (=> b!1535735 (=> (not res!1051332) (not e!855655))))

(assert (=> b!1535735 (= res!1051332 (validKeyInArray!0 (select (arr!49194 a!2792) i!951)))))

(declare-fun res!1051337 () Bool)

(assert (=> start!131134 (=> (not res!1051337) (not e!855655))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131134 (= res!1051337 (validMask!0 mask!2480))))

(assert (=> start!131134 e!855655))

(assert (=> start!131134 true))

(declare-fun array_inv!38475 (array!101969) Bool)

(assert (=> start!131134 (array_inv!38475 a!2792)))

(declare-fun b!1535736 () Bool)

(assert (=> b!1535736 (= e!855655 false)))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13221 0))(
  ( (MissingZero!13221 (index!55279 (_ BitVec 32))) (Found!13221 (index!55280 (_ BitVec 32))) (Intermediate!13221 (undefined!14033 Bool) (index!55281 (_ BitVec 32)) (x!137254 (_ BitVec 32))) (Undefined!13221) (MissingVacant!13221 (index!55282 (_ BitVec 32))) )
))
(declare-fun lt!664677 () SeekEntryResult!13221)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101969 (_ BitVec 32)) SeekEntryResult!13221)

(assert (=> b!1535736 (= lt!664677 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49194 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1535737 () Bool)

(declare-fun res!1051333 () Bool)

(assert (=> b!1535737 (=> (not res!1051333) (not e!855655))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101969 (_ BitVec 32)) Bool)

(assert (=> b!1535737 (= res!1051333 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1535738 () Bool)

(declare-fun res!1051334 () Bool)

(assert (=> b!1535738 (=> (not res!1051334) (not e!855655))))

(assert (=> b!1535738 (= res!1051334 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49745 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49745 a!2792)) (= (select (arr!49194 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!131134 res!1051337) b!1535734))

(assert (= (and b!1535734 res!1051336) b!1535735))

(assert (= (and b!1535735 res!1051332) b!1535732))

(assert (= (and b!1535732 res!1051335) b!1535737))

(assert (= (and b!1535737 res!1051333) b!1535733))

(assert (= (and b!1535733 res!1051338) b!1535738))

(assert (= (and b!1535738 res!1051334) b!1535736))

(declare-fun m!1418291 () Bool)

(assert (=> b!1535732 m!1418291))

(assert (=> b!1535732 m!1418291))

(declare-fun m!1418293 () Bool)

(assert (=> b!1535732 m!1418293))

(declare-fun m!1418295 () Bool)

(assert (=> b!1535735 m!1418295))

(assert (=> b!1535735 m!1418295))

(declare-fun m!1418297 () Bool)

(assert (=> b!1535735 m!1418297))

(declare-fun m!1418299 () Bool)

(assert (=> start!131134 m!1418299))

(declare-fun m!1418301 () Bool)

(assert (=> start!131134 m!1418301))

(assert (=> b!1535736 m!1418291))

(assert (=> b!1535736 m!1418291))

(declare-fun m!1418303 () Bool)

(assert (=> b!1535736 m!1418303))

(declare-fun m!1418305 () Bool)

(assert (=> b!1535737 m!1418305))

(declare-fun m!1418307 () Bool)

(assert (=> b!1535733 m!1418307))

(declare-fun m!1418309 () Bool)

(assert (=> b!1535738 m!1418309))

(push 1)

(assert (not b!1535733))

(assert (not b!1535737))

(assert (not start!131134))

(assert (not b!1535735))

(assert (not b!1535736))

(assert (not b!1535732))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

