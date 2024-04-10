; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26194 () Bool)

(assert start!26194)

(declare-fun b!270710 () Bool)

(declare-fun e!174387 () Bool)

(declare-fun e!174388 () Bool)

(assert (=> b!270710 (= e!174387 e!174388)))

(declare-fun res!134707 () Bool)

(assert (=> b!270710 (=> (not res!134707) (not e!174388))))

(declare-datatypes ((SeekEntryResult!1453 0))(
  ( (MissingZero!1453 (index!7982 (_ BitVec 32))) (Found!1453 (index!7983 (_ BitVec 32))) (Intermediate!1453 (undefined!2265 Bool) (index!7984 (_ BitVec 32)) (x!26314 (_ BitVec 32))) (Undefined!1453) (MissingVacant!1453 (index!7985 (_ BitVec 32))) )
))
(declare-fun lt!135691 () SeekEntryResult!1453)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!270710 (= res!134707 (or (= lt!135691 (MissingZero!1453 i!1267)) (= lt!135691 (MissingVacant!1453 i!1267))))))

(declare-datatypes ((array!13291 0))(
  ( (array!13292 (arr!6295 (Array (_ BitVec 32) (_ BitVec 64))) (size!6647 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13291)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13291 (_ BitVec 32)) SeekEntryResult!1453)

(assert (=> b!270710 (= lt!135691 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!270711 () Bool)

(declare-fun res!134702 () Bool)

(assert (=> b!270711 (=> (not res!134702) (not e!174387))))

(declare-datatypes ((List!4103 0))(
  ( (Nil!4100) (Cons!4099 (h!4766 (_ BitVec 64)) (t!9185 List!4103)) )
))
(declare-fun arrayNoDuplicates!0 (array!13291 (_ BitVec 32) List!4103) Bool)

(assert (=> b!270711 (= res!134702 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4100))))

(declare-fun b!270712 () Bool)

(declare-fun res!134700 () Bool)

(assert (=> b!270712 (=> (not res!134700) (not e!174387))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!270712 (= res!134700 (and (= (size!6647 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6647 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6647 a!3325))))))

(declare-fun b!270713 () Bool)

(declare-fun res!134709 () Bool)

(assert (=> b!270713 (=> (not res!134709) (not e!174388))))

(assert (=> b!270713 (= res!134709 (not (= startIndex!26 i!1267)))))

(declare-fun res!134712 () Bool)

(assert (=> start!26194 (=> (not res!134712) (not e!174387))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26194 (= res!134712 (validMask!0 mask!3868))))

(assert (=> start!26194 e!174387))

(declare-fun array_inv!4258 (array!13291) Bool)

(assert (=> start!26194 (array_inv!4258 a!3325)))

(assert (=> start!26194 true))

(declare-fun b!270714 () Bool)

(declare-fun res!134708 () Bool)

(assert (=> b!270714 (=> (not res!134708) (not e!174387))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!270714 (= res!134708 (validKeyInArray!0 k!2581))))

(declare-fun b!270715 () Bool)

(declare-fun res!134701 () Bool)

(assert (=> b!270715 (=> (not res!134701) (not e!174388))))

(assert (=> b!270715 (= res!134701 (and (bvslt (size!6647 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6647 a!3325))))))

(declare-fun b!270716 () Bool)

(assert (=> b!270716 (= e!174388 false)))

(declare-fun lt!135690 () Bool)

(declare-fun contains!1933 (List!4103 (_ BitVec 64)) Bool)

(assert (=> b!270716 (= lt!135690 (contains!1933 Nil!4100 k!2581))))

(declare-fun b!270717 () Bool)

(declare-fun res!134706 () Bool)

(assert (=> b!270717 (=> (not res!134706) (not e!174388))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13291 (_ BitVec 32)) Bool)

(assert (=> b!270717 (= res!134706 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!270718 () Bool)

(declare-fun res!134703 () Bool)

(assert (=> b!270718 (=> (not res!134703) (not e!174388))))

(assert (=> b!270718 (= res!134703 (not (contains!1933 Nil!4100 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!270719 () Bool)

(declare-fun res!134710 () Bool)

(assert (=> b!270719 (=> (not res!134710) (not e!174388))))

(assert (=> b!270719 (= res!134710 (not (contains!1933 Nil!4100 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!270720 () Bool)

(declare-fun res!134705 () Bool)

(assert (=> b!270720 (=> (not res!134705) (not e!174387))))

(declare-fun arrayContainsKey!0 (array!13291 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!270720 (= res!134705 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!270721 () Bool)

(declare-fun res!134711 () Bool)

(assert (=> b!270721 (=> (not res!134711) (not e!174388))))

(assert (=> b!270721 (= res!134711 (validKeyInArray!0 (select (arr!6295 a!3325) startIndex!26)))))

(declare-fun b!270722 () Bool)

(declare-fun res!134704 () Bool)

(assert (=> b!270722 (=> (not res!134704) (not e!174388))))

(declare-fun noDuplicate!121 (List!4103) Bool)

(assert (=> b!270722 (= res!134704 (noDuplicate!121 Nil!4100))))

(assert (= (and start!26194 res!134712) b!270712))

(assert (= (and b!270712 res!134700) b!270714))

(assert (= (and b!270714 res!134708) b!270711))

(assert (= (and b!270711 res!134702) b!270720))

(assert (= (and b!270720 res!134705) b!270710))

(assert (= (and b!270710 res!134707) b!270717))

(assert (= (and b!270717 res!134706) b!270713))

(assert (= (and b!270713 res!134709) b!270721))

(assert (= (and b!270721 res!134711) b!270715))

(assert (= (and b!270715 res!134701) b!270722))

(assert (= (and b!270722 res!134704) b!270718))

(assert (= (and b!270718 res!134703) b!270719))

(assert (= (and b!270719 res!134710) b!270716))

(declare-fun m!286237 () Bool)

(assert (=> b!270721 m!286237))

(assert (=> b!270721 m!286237))

(declare-fun m!286239 () Bool)

(assert (=> b!270721 m!286239))

(declare-fun m!286241 () Bool)

(assert (=> start!26194 m!286241))

(declare-fun m!286243 () Bool)

(assert (=> start!26194 m!286243))

(declare-fun m!286245 () Bool)

(assert (=> b!270722 m!286245))

(declare-fun m!286247 () Bool)

(assert (=> b!270717 m!286247))

(declare-fun m!286249 () Bool)

(assert (=> b!270710 m!286249))

(declare-fun m!286251 () Bool)

(assert (=> b!270716 m!286251))

(declare-fun m!286253 () Bool)

(assert (=> b!270720 m!286253))

(declare-fun m!286255 () Bool)

(assert (=> b!270711 m!286255))

(declare-fun m!286257 () Bool)

(assert (=> b!270719 m!286257))

(declare-fun m!286259 () Bool)

(assert (=> b!270714 m!286259))

(declare-fun m!286261 () Bool)

(assert (=> b!270718 m!286261))

(push 1)

(assert (not b!270720))

