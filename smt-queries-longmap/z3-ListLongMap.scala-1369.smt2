; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26912 () Bool)

(assert start!26912)

(declare-fun b!278925 () Bool)

(declare-fun res!142268 () Bool)

(declare-fun e!177869 () Bool)

(assert (=> b!278925 (=> (not res!142268) (not e!177869))))

(declare-datatypes ((array!13877 0))(
  ( (array!13878 (arr!6585 (Array (_ BitVec 32) (_ BitVec 64))) (size!6937 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13877)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!278925 (= res!142268 (validKeyInArray!0 (select (arr!6585 a!3325) startIndex!26)))))

(declare-fun b!278926 () Bool)

(declare-fun res!142264 () Bool)

(declare-fun e!177867 () Bool)

(assert (=> b!278926 (=> (not res!142264) (not e!177867))))

(declare-datatypes ((List!4393 0))(
  ( (Nil!4390) (Cons!4389 (h!5059 (_ BitVec 64)) (t!9475 List!4393)) )
))
(declare-fun arrayNoDuplicates!0 (array!13877 (_ BitVec 32) List!4393) Bool)

(assert (=> b!278926 (= res!142264 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4390))))

(declare-fun b!278927 () Bool)

(assert (=> b!278927 (= e!177869 (and (bvslt (size!6937 a!3325) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!6937 a!3325))))))

(declare-fun b!278928 () Bool)

(assert (=> b!278928 (= e!177867 e!177869)))

(declare-fun res!142266 () Bool)

(assert (=> b!278928 (=> (not res!142266) (not e!177869))))

(declare-datatypes ((SeekEntryResult!1743 0))(
  ( (MissingZero!1743 (index!9142 (_ BitVec 32))) (Found!1743 (index!9143 (_ BitVec 32))) (Intermediate!1743 (undefined!2555 Bool) (index!9144 (_ BitVec 32)) (x!27389 (_ BitVec 32))) (Undefined!1743) (MissingVacant!1743 (index!9145 (_ BitVec 32))) )
))
(declare-fun lt!138514 () SeekEntryResult!1743)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!278928 (= res!142266 (or (= lt!138514 (MissingZero!1743 i!1267)) (= lt!138514 (MissingVacant!1743 i!1267))))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13877 (_ BitVec 32)) SeekEntryResult!1743)

(assert (=> b!278928 (= lt!138514 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun res!142272 () Bool)

(assert (=> start!26912 (=> (not res!142272) (not e!177867))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26912 (= res!142272 (validMask!0 mask!3868))))

(assert (=> start!26912 e!177867))

(declare-fun array_inv!4548 (array!13877) Bool)

(assert (=> start!26912 (array_inv!4548 a!3325)))

(assert (=> start!26912 true))

(declare-fun b!278929 () Bool)

(declare-fun res!142265 () Bool)

(assert (=> b!278929 (=> (not res!142265) (not e!177867))))

(assert (=> b!278929 (= res!142265 (validKeyInArray!0 k0!2581))))

(declare-fun b!278930 () Bool)

(declare-fun res!142270 () Bool)

(assert (=> b!278930 (=> (not res!142270) (not e!177869))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13877 (_ BitVec 32)) Bool)

(assert (=> b!278930 (= res!142270 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!278931 () Bool)

(declare-fun res!142269 () Bool)

(assert (=> b!278931 (=> (not res!142269) (not e!177867))))

(assert (=> b!278931 (= res!142269 (and (= (size!6937 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6937 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6937 a!3325))))))

(declare-fun b!278932 () Bool)

(declare-fun res!142267 () Bool)

(assert (=> b!278932 (=> (not res!142267) (not e!177867))))

(declare-fun arrayContainsKey!0 (array!13877 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!278932 (= res!142267 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!278933 () Bool)

(declare-fun res!142271 () Bool)

(assert (=> b!278933 (=> (not res!142271) (not e!177869))))

(assert (=> b!278933 (= res!142271 (not (= startIndex!26 i!1267)))))

(assert (= (and start!26912 res!142272) b!278931))

(assert (= (and b!278931 res!142269) b!278929))

(assert (= (and b!278929 res!142265) b!278926))

(assert (= (and b!278926 res!142264) b!278932))

(assert (= (and b!278932 res!142267) b!278928))

(assert (= (and b!278928 res!142266) b!278930))

(assert (= (and b!278930 res!142270) b!278933))

(assert (= (and b!278933 res!142271) b!278925))

(assert (= (and b!278925 res!142268) b!278927))

(declare-fun m!293847 () Bool)

(assert (=> b!278929 m!293847))

(declare-fun m!293849 () Bool)

(assert (=> b!278926 m!293849))

(declare-fun m!293851 () Bool)

(assert (=> b!278930 m!293851))

(declare-fun m!293853 () Bool)

(assert (=> b!278932 m!293853))

(declare-fun m!293855 () Bool)

(assert (=> b!278928 m!293855))

(declare-fun m!293857 () Bool)

(assert (=> start!26912 m!293857))

(declare-fun m!293859 () Bool)

(assert (=> start!26912 m!293859))

(declare-fun m!293861 () Bool)

(assert (=> b!278925 m!293861))

(assert (=> b!278925 m!293861))

(declare-fun m!293863 () Bool)

(assert (=> b!278925 m!293863))

(check-sat (not b!278930) (not b!278925) (not b!278926) (not start!26912) (not b!278928) (not b!278932) (not b!278929))
(check-sat)
