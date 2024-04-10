; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26328 () Bool)

(assert start!26328)

(declare-fun b!272847 () Bool)

(declare-fun res!136845 () Bool)

(declare-fun e!174995 () Bool)

(assert (=> b!272847 (=> (not res!136845) (not e!174995))))

(declare-datatypes ((array!13425 0))(
  ( (array!13426 (arr!6362 (Array (_ BitVec 32) (_ BitVec 64))) (size!6714 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13425)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13425 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!272847 (= res!136845 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!272848 () Bool)

(declare-fun res!136844 () Bool)

(assert (=> b!272848 (=> (not res!136844) (not e!174995))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!272848 (= res!136844 (and (= (size!6714 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6714 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6714 a!3325))))))

(declare-fun b!272849 () Bool)

(declare-fun res!136843 () Bool)

(assert (=> b!272849 (=> (not res!136843) (not e!174995))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!272849 (= res!136843 (validKeyInArray!0 k!2581))))

(declare-fun b!272850 () Bool)

(declare-fun res!136840 () Bool)

(declare-fun e!174992 () Bool)

(assert (=> b!272850 (=> (not res!136840) (not e!174992))))

(assert (=> b!272850 (= res!136840 (validKeyInArray!0 (select (arr!6362 a!3325) startIndex!26)))))

(declare-fun b!272852 () Bool)

(declare-fun e!174994 () Bool)

(assert (=> b!272852 (= e!174994 e!174992)))

(declare-fun res!136839 () Bool)

(assert (=> b!272852 (=> (not res!136839) (not e!174992))))

(assert (=> b!272852 (= res!136839 (not (= startIndex!26 i!1267)))))

(declare-fun lt!136099 () array!13425)

(assert (=> b!272852 (= lt!136099 (array!13426 (store (arr!6362 a!3325) i!1267 k!2581) (size!6714 a!3325)))))

(declare-fun b!272853 () Bool)

(declare-fun res!136842 () Bool)

(assert (=> b!272853 (=> (not res!136842) (not e!174995))))

(declare-datatypes ((List!4170 0))(
  ( (Nil!4167) (Cons!4166 (h!4833 (_ BitVec 64)) (t!9252 List!4170)) )
))
(declare-fun arrayNoDuplicates!0 (array!13425 (_ BitVec 32) List!4170) Bool)

(assert (=> b!272853 (= res!136842 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4167))))

(declare-fun b!272854 () Bool)

(assert (=> b!272854 (= e!174992 (not true))))

(declare-datatypes ((SeekEntryResult!1520 0))(
  ( (MissingZero!1520 (index!8250 (_ BitVec 32))) (Found!1520 (index!8251 (_ BitVec 32))) (Intermediate!1520 (undefined!2332 Bool) (index!8252 (_ BitVec 32)) (x!26565 (_ BitVec 32))) (Undefined!1520) (MissingVacant!1520 (index!8253 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13425 (_ BitVec 32)) SeekEntryResult!1520)

(assert (=> b!272854 (= (seekEntryOrOpen!0 (select (arr!6362 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6362 a!3325) i!1267 k!2581) startIndex!26) lt!136099 mask!3868))))

(declare-datatypes ((Unit!8527 0))(
  ( (Unit!8528) )
))
(declare-fun lt!136096 () Unit!8527)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13425 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8527)

(assert (=> b!272854 (= lt!136096 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(assert (=> b!272854 (arrayNoDuplicates!0 lt!136099 #b00000000000000000000000000000000 Nil!4167)))

(declare-fun lt!136097 () Unit!8527)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13425 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4170) Unit!8527)

(assert (=> b!272854 (= lt!136097 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4167))))

(declare-fun b!272855 () Bool)

(assert (=> b!272855 (= e!174995 e!174994)))

(declare-fun res!136841 () Bool)

(assert (=> b!272855 (=> (not res!136841) (not e!174994))))

(declare-fun lt!136098 () SeekEntryResult!1520)

(assert (=> b!272855 (= res!136841 (or (= lt!136098 (MissingZero!1520 i!1267)) (= lt!136098 (MissingVacant!1520 i!1267))))))

(assert (=> b!272855 (= lt!136098 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun res!136838 () Bool)

(assert (=> start!26328 (=> (not res!136838) (not e!174995))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26328 (= res!136838 (validMask!0 mask!3868))))

(assert (=> start!26328 e!174995))

(declare-fun array_inv!4325 (array!13425) Bool)

(assert (=> start!26328 (array_inv!4325 a!3325)))

(assert (=> start!26328 true))

(declare-fun b!272851 () Bool)

(declare-fun res!136837 () Bool)

(assert (=> b!272851 (=> (not res!136837) (not e!174994))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13425 (_ BitVec 32)) Bool)

(assert (=> b!272851 (= res!136837 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!26328 res!136838) b!272848))

(assert (= (and b!272848 res!136844) b!272849))

(assert (= (and b!272849 res!136843) b!272853))

(assert (= (and b!272853 res!136842) b!272847))

(assert (= (and b!272847 res!136845) b!272855))

(assert (= (and b!272855 res!136841) b!272851))

(assert (= (and b!272851 res!136837) b!272852))

(assert (= (and b!272852 res!136839) b!272850))

(assert (= (and b!272850 res!136840) b!272854))

(declare-fun m!287901 () Bool)

(assert (=> b!272852 m!287901))

(declare-fun m!287903 () Bool)

(assert (=> b!272855 m!287903))

(declare-fun m!287905 () Bool)

(assert (=> b!272854 m!287905))

(declare-fun m!287907 () Bool)

(assert (=> b!272854 m!287907))

(assert (=> b!272854 m!287905))

(assert (=> b!272854 m!287901))

(declare-fun m!287909 () Bool)

(assert (=> b!272854 m!287909))

(declare-fun m!287911 () Bool)

(assert (=> b!272854 m!287911))

(declare-fun m!287913 () Bool)

(assert (=> b!272854 m!287913))

(declare-fun m!287915 () Bool)

(assert (=> b!272854 m!287915))

(assert (=> b!272854 m!287909))

(declare-fun m!287917 () Bool)

(assert (=> b!272854 m!287917))

(assert (=> b!272850 m!287909))

(assert (=> b!272850 m!287909))

(declare-fun m!287919 () Bool)

(assert (=> b!272850 m!287919))

(declare-fun m!287921 () Bool)

(assert (=> b!272849 m!287921))

(declare-fun m!287923 () Bool)

(assert (=> b!272851 m!287923))

(declare-fun m!287925 () Bool)

(assert (=> start!26328 m!287925))

(declare-fun m!287927 () Bool)

(assert (=> start!26328 m!287927))

(declare-fun m!287929 () Bool)

(assert (=> b!272847 m!287929))

(declare-fun m!287931 () Bool)

(assert (=> b!272853 m!287931))

(push 1)

