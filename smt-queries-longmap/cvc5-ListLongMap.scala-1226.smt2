; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25890 () Bool)

(assert start!25890)

(declare-fun b!267609 () Bool)

(declare-fun res!131905 () Bool)

(declare-fun e!172991 () Bool)

(assert (=> b!267609 (=> (not res!131905) (not e!172991))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267609 (= res!131905 (validKeyInArray!0 k!2581))))

(declare-fun b!267610 () Bool)

(declare-fun res!131906 () Bool)

(assert (=> b!267610 (=> (not res!131906) (not e!172991))))

(declare-datatypes ((array!13008 0))(
  ( (array!13009 (arr!6155 (Array (_ BitVec 32) (_ BitVec 64))) (size!6507 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13008)

(declare-datatypes ((List!3963 0))(
  ( (Nil!3960) (Cons!3959 (h!4626 (_ BitVec 64)) (t!9045 List!3963)) )
))
(declare-fun arrayNoDuplicates!0 (array!13008 (_ BitVec 32) List!3963) Bool)

(assert (=> b!267610 (= res!131906 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3960))))

(declare-fun b!267608 () Bool)

(declare-fun res!131904 () Bool)

(assert (=> b!267608 (=> (not res!131904) (not e!172991))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!267608 (= res!131904 (and (= (size!6507 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6507 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6507 a!3325))))))

(declare-fun b!267611 () Bool)

(assert (=> b!267611 (= e!172991 (and (bvslt #b00000000000000000000000000000000 (size!6507 a!3325)) (bvsge (size!6507 a!3325) #b01111111111111111111111111111111)))))

(declare-fun res!131907 () Bool)

(assert (=> start!25890 (=> (not res!131907) (not e!172991))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25890 (= res!131907 (validMask!0 mask!3868))))

(assert (=> start!25890 e!172991))

(declare-fun array_inv!4118 (array!13008) Bool)

(assert (=> start!25890 (array_inv!4118 a!3325)))

(assert (=> start!25890 true))

(assert (= (and start!25890 res!131907) b!267608))

(assert (= (and b!267608 res!131904) b!267609))

(assert (= (and b!267609 res!131905) b!267610))

(assert (= (and b!267610 res!131906) b!267611))

(declare-fun m!283941 () Bool)

(assert (=> b!267609 m!283941))

(declare-fun m!283943 () Bool)

(assert (=> b!267610 m!283943))

(declare-fun m!283945 () Bool)

(assert (=> start!25890 m!283945))

(declare-fun m!283947 () Bool)

(assert (=> start!25890 m!283947))

(push 1)

(assert (not b!267610))

(assert (not b!267609))

(assert (not start!25890))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!267661 () Bool)

(declare-fun e!173027 () Bool)

(declare-fun e!173024 () Bool)

(assert (=> b!267661 (= e!173027 e!173024)))

(declare-fun res!131948 () Bool)

(assert (=> b!267661 (=> (not res!131948) (not e!173024))))

(declare-fun e!173025 () Bool)

(assert (=> b!267661 (= res!131948 (not e!173025))))

(declare-fun res!131947 () Bool)

(assert (=> b!267661 (=> (not res!131947) (not e!173025))))

(assert (=> b!267661 (= res!131947 (validKeyInArray!0 (select (arr!6155 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!267662 () Bool)

(declare-fun e!173026 () Bool)

(declare-fun call!25345 () Bool)

(assert (=> b!267662 (= e!173026 call!25345)))

(declare-fun bm!25342 () Bool)

(declare-fun c!45408 () Bool)

(assert (=> bm!25342 (= call!25345 (arrayNoDuplicates!0 a!3325 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!45408 (Cons!3959 (select (arr!6155 a!3325) #b00000000000000000000000000000000) Nil!3960) Nil!3960)))))

(declare-fun b!267663 () Bool)

(assert (=> b!267663 (= e!173024 e!173026)))

(assert (=> b!267663 (= c!45408 (validKeyInArray!0 (select (arr!6155 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!267664 () Bool)

(declare-fun contains!1927 (List!3963 (_ BitVec 64)) Bool)

(assert (=> b!267664 (= e!173025 (