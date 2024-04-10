; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26188 () Bool)

(assert start!26188)

(declare-fun b!270593 () Bool)

(declare-fun e!174360 () Bool)

(declare-fun e!174362 () Bool)

(assert (=> b!270593 (= e!174360 e!174362)))

(declare-fun res!134589 () Bool)

(assert (=> b!270593 (=> (not res!134589) (not e!174362))))

(declare-datatypes ((SeekEntryResult!1450 0))(
  ( (MissingZero!1450 (index!7970 (_ BitVec 32))) (Found!1450 (index!7971 (_ BitVec 32))) (Intermediate!1450 (undefined!2262 Bool) (index!7972 (_ BitVec 32)) (x!26303 (_ BitVec 32))) (Undefined!1450) (MissingVacant!1450 (index!7973 (_ BitVec 32))) )
))
(declare-fun lt!135672 () SeekEntryResult!1450)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!270593 (= res!134589 (or (= lt!135672 (MissingZero!1450 i!1267)) (= lt!135672 (MissingVacant!1450 i!1267))))))

(declare-datatypes ((array!13285 0))(
  ( (array!13286 (arr!6292 (Array (_ BitVec 32) (_ BitVec 64))) (size!6644 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13285)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13285 (_ BitVec 32)) SeekEntryResult!1450)

(assert (=> b!270593 (= lt!135672 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!270594 () Bool)

(declare-fun res!134586 () Bool)

(assert (=> b!270594 (=> (not res!134586) (not e!174362))))

(assert (=> b!270594 (= res!134586 (and (bvslt (size!6644 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6644 a!3325))))))

(declare-fun b!270595 () Bool)

(declare-fun res!134592 () Bool)

(assert (=> b!270595 (=> (not res!134592) (not e!174362))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!270595 (= res!134592 (validKeyInArray!0 (select (arr!6292 a!3325) startIndex!26)))))

(declare-fun b!270596 () Bool)

(assert (=> b!270596 (= e!174362 false)))

(declare-fun lt!135673 () Bool)

(declare-datatypes ((List!4100 0))(
  ( (Nil!4097) (Cons!4096 (h!4763 (_ BitVec 64)) (t!9182 List!4100)) )
))
(declare-fun contains!1930 (List!4100 (_ BitVec 64)) Bool)

(assert (=> b!270596 (= lt!135673 (contains!1930 Nil!4097 k!2581))))

(declare-fun res!134594 () Bool)

(assert (=> start!26188 (=> (not res!134594) (not e!174360))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26188 (= res!134594 (validMask!0 mask!3868))))

(assert (=> start!26188 e!174360))

(declare-fun array_inv!4255 (array!13285) Bool)

(assert (=> start!26188 (array_inv!4255 a!3325)))

(assert (=> start!26188 true))

(declare-fun b!270597 () Bool)

(declare-fun res!134590 () Bool)

(assert (=> b!270597 (=> (not res!134590) (not e!174362))))

(assert (=> b!270597 (= res!134590 (not (contains!1930 Nil!4097 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!270598 () Bool)

(declare-fun res!134595 () Bool)

(assert (=> b!270598 (=> (not res!134595) (not e!174362))))

(assert (=> b!270598 (= res!134595 (not (contains!1930 Nil!4097 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!270599 () Bool)

(declare-fun res!134583 () Bool)

(assert (=> b!270599 (=> (not res!134583) (not e!174360))))

(assert (=> b!270599 (= res!134583 (validKeyInArray!0 k!2581))))

(declare-fun b!270600 () Bool)

(declare-fun res!134585 () Bool)

(assert (=> b!270600 (=> (not res!134585) (not e!174362))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13285 (_ BitVec 32)) Bool)

(assert (=> b!270600 (= res!134585 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!270601 () Bool)

(declare-fun res!134588 () Bool)

(assert (=> b!270601 (=> (not res!134588) (not e!174362))))

(declare-fun noDuplicate!118 (List!4100) Bool)

(assert (=> b!270601 (= res!134588 (noDuplicate!118 Nil!4097))))

(declare-fun b!270602 () Bool)

(declare-fun res!134593 () Bool)

(assert (=> b!270602 (=> (not res!134593) (not e!174362))))

(assert (=> b!270602 (= res!134593 (not (= startIndex!26 i!1267)))))

(declare-fun b!270603 () Bool)

(declare-fun res!134584 () Bool)

(assert (=> b!270603 (=> (not res!134584) (not e!174360))))

(assert (=> b!270603 (= res!134584 (and (= (size!6644 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6644 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6644 a!3325))))))

(declare-fun b!270604 () Bool)

(declare-fun res!134591 () Bool)

(assert (=> b!270604 (=> (not res!134591) (not e!174360))))

(declare-fun arrayNoDuplicates!0 (array!13285 (_ BitVec 32) List!4100) Bool)

(assert (=> b!270604 (= res!134591 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4097))))

(declare-fun b!270605 () Bool)

(declare-fun res!134587 () Bool)

(assert (=> b!270605 (=> (not res!134587) (not e!174360))))

(declare-fun arrayContainsKey!0 (array!13285 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!270605 (= res!134587 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26188 res!134594) b!270603))

(assert (= (and b!270603 res!134584) b!270599))

(assert (= (and b!270599 res!134583) b!270604))

(assert (= (and b!270604 res!134591) b!270605))

(assert (= (and b!270605 res!134587) b!270593))

(assert (= (and b!270593 res!134589) b!270600))

(assert (= (and b!270600 res!134585) b!270602))

(assert (= (and b!270602 res!134593) b!270595))

(assert (= (and b!270595 res!134592) b!270594))

(assert (= (and b!270594 res!134586) b!270601))

(assert (= (and b!270601 res!134588) b!270597))

(assert (= (and b!270597 res!134590) b!270598))

(assert (= (and b!270598 res!134595) b!270596))

(declare-fun m!286159 () Bool)

(assert (=> b!270600 m!286159))

(declare-fun m!286161 () Bool)

(assert (=> b!270598 m!286161))

(declare-fun m!286163 () Bool)

(assert (=> b!270596 m!286163))

(declare-fun m!286165 () Bool)

(assert (=> b!270605 m!286165))

(declare-fun m!286167 () Bool)

(assert (=> b!270599 m!286167))

(declare-fun m!286169 () Bool)

(assert (=> b!270595 m!286169))

(assert (=> b!270595 m!286169))

(declare-fun m!286171 () Bool)

(assert (=> b!270595 m!286171))

(declare-fun m!286173 () Bool)

(assert (=> b!270604 m!286173))

(declare-fun m!286175 () Bool)

(assert (=> b!270593 m!286175))

(declare-fun m!286177 () Bool)

(assert (=> b!270597 m!286177))

(declare-fun m!286179 () Bool)

(assert (=> b!270601 m!286179))

(declare-fun m!286181 () Bool)

(assert (=> start!26188 m!286181))

(declare-fun m!286183 () Bool)

(assert (=> start!26188 m!286183))

(push 1)

(assert (not b!270598))

