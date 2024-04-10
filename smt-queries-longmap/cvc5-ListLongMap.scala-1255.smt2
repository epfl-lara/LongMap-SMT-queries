; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26088 () Bool)

(assert start!26088)

(declare-fun b!269069 () Bool)

(declare-fun e!173696 () Bool)

(assert (=> b!269069 (= e!173696 false)))

(declare-datatypes ((Unit!8305 0))(
  ( (Unit!8306) )
))
(declare-fun lt!135087 () Unit!8305)

(declare-fun e!173699 () Unit!8305)

(assert (=> b!269069 (= lt!135087 e!173699)))

(declare-fun c!45414 () Bool)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-datatypes ((array!13185 0))(
  ( (array!13186 (arr!6242 (Array (_ BitVec 32) (_ BitVec 64))) (size!6594 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13185)

(assert (=> b!269069 (= c!45414 (bvslt startIndex!26 (bvsub (size!6594 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!269070 () Bool)

(declare-fun res!133348 () Bool)

(declare-fun e!173697 () Bool)

(assert (=> b!269070 (=> (not res!133348) (not e!173697))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13185 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!269070 (= res!133348 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!269071 () Bool)

(assert (=> b!269071 (= e!173697 e!173696)))

(declare-fun res!133343 () Bool)

(assert (=> b!269071 (=> (not res!133343) (not e!173696))))

(declare-datatypes ((SeekEntryResult!1400 0))(
  ( (MissingZero!1400 (index!7770 (_ BitVec 32))) (Found!1400 (index!7771 (_ BitVec 32))) (Intermediate!1400 (undefined!2212 Bool) (index!7772 (_ BitVec 32)) (x!26125 (_ BitVec 32))) (Undefined!1400) (MissingVacant!1400 (index!7773 (_ BitVec 32))) )
))
(declare-fun lt!135086 () SeekEntryResult!1400)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!269071 (= res!133343 (or (= lt!135086 (MissingZero!1400 i!1267)) (= lt!135086 (MissingVacant!1400 i!1267))))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13185 (_ BitVec 32)) SeekEntryResult!1400)

(assert (=> b!269071 (= lt!135086 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!269072 () Bool)

(declare-fun res!133347 () Bool)

(assert (=> b!269072 (=> (not res!133347) (not e!173697))))

(assert (=> b!269072 (= res!133347 (and (= (size!6594 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6594 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6594 a!3325))))))

(declare-fun b!269073 () Bool)

(declare-fun Unit!8307 () Unit!8305)

(assert (=> b!269073 (= e!173699 Unit!8307)))

(declare-fun b!269074 () Bool)

(declare-fun res!133350 () Bool)

(assert (=> b!269074 (=> (not res!133350) (not e!173697))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!269074 (= res!133350 (validKeyInArray!0 k!2581))))

(declare-fun b!269075 () Bool)

(declare-fun res!133344 () Bool)

(assert (=> b!269075 (=> (not res!133344) (not e!173697))))

(declare-datatypes ((List!4050 0))(
  ( (Nil!4047) (Cons!4046 (h!4713 (_ BitVec 64)) (t!9132 List!4050)) )
))
(declare-fun arrayNoDuplicates!0 (array!13185 (_ BitVec 32) List!4050) Bool)

(assert (=> b!269075 (= res!133344 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4047))))

(declare-fun res!133349 () Bool)

(assert (=> start!26088 (=> (not res!133349) (not e!173697))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26088 (= res!133349 (validMask!0 mask!3868))))

(assert (=> start!26088 e!173697))

(declare-fun array_inv!4205 (array!13185) Bool)

(assert (=> start!26088 (array_inv!4205 a!3325)))

(assert (=> start!26088 true))

(declare-fun b!269076 () Bool)

(declare-fun res!133346 () Bool)

(assert (=> b!269076 (=> (not res!133346) (not e!173696))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13185 (_ BitVec 32)) Bool)

(assert (=> b!269076 (= res!133346 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!269077 () Bool)

(declare-fun res!133345 () Bool)

(assert (=> b!269077 (=> (not res!133345) (not e!173696))))

(assert (=> b!269077 (= res!133345 (= startIndex!26 i!1267))))

(declare-fun b!269078 () Bool)

(declare-fun lt!135088 () Unit!8305)

(assert (=> b!269078 (= e!173699 lt!135088)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13185 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8305)

(assert (=> b!269078 (= lt!135088 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (=> b!269078 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13186 (store (arr!6242 a!3325) i!1267 k!2581) (size!6594 a!3325)) mask!3868)))

(assert (= (and start!26088 res!133349) b!269072))

(assert (= (and b!269072 res!133347) b!269074))

(assert (= (and b!269074 res!133350) b!269075))

(assert (= (and b!269075 res!133344) b!269070))

(assert (= (and b!269070 res!133348) b!269071))

(assert (= (and b!269071 res!133343) b!269076))

(assert (= (and b!269076 res!133346) b!269077))

(assert (= (and b!269077 res!133345) b!269069))

(assert (= (and b!269069 c!45414) b!269078))

(assert (= (and b!269069 (not c!45414)) b!269073))

(declare-fun m!285051 () Bool)

(assert (=> b!269078 m!285051))

(declare-fun m!285053 () Bool)

(assert (=> b!269078 m!285053))

(declare-fun m!285055 () Bool)

(assert (=> b!269078 m!285055))

(declare-fun m!285057 () Bool)

(assert (=> b!269075 m!285057))

(declare-fun m!285059 () Bool)

(assert (=> b!269076 m!285059))

(declare-fun m!285061 () Bool)

(assert (=> b!269070 m!285061))

(declare-fun m!285063 () Bool)

(assert (=> start!26088 m!285063))

(declare-fun m!285065 () Bool)

(assert (=> start!26088 m!285065))

(declare-fun m!285067 () Bool)

(assert (=> b!269074 m!285067))

(declare-fun m!285069 () Bool)

(assert (=> b!269071 m!285069))

(push 1)

