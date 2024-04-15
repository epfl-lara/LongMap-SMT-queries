; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25892 () Bool)

(assert start!25892)

(declare-fun b!267462 () Bool)

(declare-fun res!131810 () Bool)

(declare-fun e!172889 () Bool)

(assert (=> b!267462 (=> (not res!131810) (not e!172889))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267462 (= res!131810 (validKeyInArray!0 k0!2581))))

(declare-fun b!267461 () Bool)

(declare-fun res!131809 () Bool)

(assert (=> b!267461 (=> (not res!131809) (not e!172889))))

(declare-datatypes ((array!12999 0))(
  ( (array!13000 (arr!6150 (Array (_ BitVec 32) (_ BitVec 64))) (size!6503 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!12999)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!267461 (= res!131809 (and (= (size!6503 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6503 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6503 a!3325))))))

(declare-fun b!267463 () Bool)

(declare-fun res!131811 () Bool)

(assert (=> b!267463 (=> (not res!131811) (not e!172889))))

(declare-datatypes ((List!3931 0))(
  ( (Nil!3928) (Cons!3927 (h!4594 (_ BitVec 64)) (t!9004 List!3931)) )
))
(declare-fun arrayNoDuplicates!0 (array!12999 (_ BitVec 32) List!3931) Bool)

(assert (=> b!267463 (= res!131811 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3928))))

(declare-fun b!267464 () Bool)

(assert (=> b!267464 (= e!172889 (and (bvslt #b00000000000000000000000000000000 (size!6503 a!3325)) (bvsge (size!6503 a!3325) #b01111111111111111111111111111111)))))

(declare-fun res!131812 () Bool)

(assert (=> start!25892 (=> (not res!131812) (not e!172889))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25892 (= res!131812 (validMask!0 mask!3868))))

(assert (=> start!25892 e!172889))

(declare-fun array_inv!4122 (array!12999) Bool)

(assert (=> start!25892 (array_inv!4122 a!3325)))

(assert (=> start!25892 true))

(assert (= (and start!25892 res!131812) b!267461))

(assert (= (and b!267461 res!131809) b!267462))

(assert (= (and b!267462 res!131810) b!267463))

(assert (= (and b!267463 res!131811) b!267464))

(declare-fun m!283349 () Bool)

(assert (=> b!267462 m!283349))

(declare-fun m!283351 () Bool)

(assert (=> b!267463 m!283351))

(declare-fun m!283353 () Bool)

(assert (=> start!25892 m!283353))

(declare-fun m!283355 () Bool)

(assert (=> start!25892 m!283355))

(check-sat (not b!267463) (not b!267462) (not start!25892))
(check-sat)
(get-model)

(declare-fun b!267499 () Bool)

(declare-fun e!172911 () Bool)

(declare-fun e!172914 () Bool)

(assert (=> b!267499 (= e!172911 e!172914)))

(declare-fun c!45379 () Bool)

(assert (=> b!267499 (= c!45379 (validKeyInArray!0 (select (arr!6150 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!267500 () Bool)

(declare-fun call!25318 () Bool)

(assert (=> b!267500 (= e!172914 call!25318)))

(declare-fun b!267501 () Bool)

(declare-fun e!172912 () Bool)

(assert (=> b!267501 (= e!172912 e!172911)))

(declare-fun res!131845 () Bool)

(assert (=> b!267501 (=> (not res!131845) (not e!172911))))

(declare-fun e!172913 () Bool)

(assert (=> b!267501 (= res!131845 (not e!172913))))

(declare-fun res!131843 () Bool)

(assert (=> b!267501 (=> (not res!131843) (not e!172913))))

(assert (=> b!267501 (= res!131843 (validKeyInArray!0 (select (arr!6150 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!267502 () Bool)

(assert (=> b!267502 (= e!172914 call!25318)))

(declare-fun bm!25315 () Bool)

(assert (=> bm!25315 (= call!25318 (arrayNoDuplicates!0 a!3325 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!45379 (Cons!3927 (select (arr!6150 a!3325) #b00000000000000000000000000000000) Nil!3928) Nil!3928)))))

(declare-fun b!267503 () Bool)

(declare-fun contains!1903 (List!3931 (_ BitVec 64)) Bool)

(assert (=> b!267503 (= e!172913 (contains!1903 Nil!3928 (select (arr!6150 a!3325) #b00000000000000000000000000000000)))))

(declare-fun d!64239 () Bool)

(declare-fun res!131844 () Bool)

(assert (=> d!64239 (=> res!131844 e!172912)))

(assert (=> d!64239 (= res!131844 (bvsge #b00000000000000000000000000000000 (size!6503 a!3325)))))

(assert (=> d!64239 (= (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3928) e!172912)))

(assert (= (and d!64239 (not res!131844)) b!267501))

(assert (= (and b!267501 res!131843) b!267503))

(assert (= (and b!267501 res!131845) b!267499))

(assert (= (and b!267499 c!45379) b!267500))

(assert (= (and b!267499 (not c!45379)) b!267502))

(assert (= (or b!267500 b!267502) bm!25315))

(declare-fun m!283373 () Bool)

(assert (=> b!267499 m!283373))

(assert (=> b!267499 m!283373))

(declare-fun m!283375 () Bool)

(assert (=> b!267499 m!283375))

(assert (=> b!267501 m!283373))

(assert (=> b!267501 m!283373))

(assert (=> b!267501 m!283375))

(assert (=> bm!25315 m!283373))

(declare-fun m!283377 () Bool)

(assert (=> bm!25315 m!283377))

(assert (=> b!267503 m!283373))

(assert (=> b!267503 m!283373))

(declare-fun m!283379 () Bool)

(assert (=> b!267503 m!283379))

(assert (=> b!267463 d!64239))

(declare-fun d!64243 () Bool)

(assert (=> d!64243 (= (validKeyInArray!0 k0!2581) (and (not (= k0!2581 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2581 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!267462 d!64243))

(declare-fun d!64245 () Bool)

(assert (=> d!64245 (= (validMask!0 mask!3868) (and (or (= mask!3868 #b00000000000000000000000000000111) (= mask!3868 #b00000000000000000000000000001111) (= mask!3868 #b00000000000000000000000000011111) (= mask!3868 #b00000000000000000000000000111111) (= mask!3868 #b00000000000000000000000001111111) (= mask!3868 #b00000000000000000000000011111111) (= mask!3868 #b00000000000000000000000111111111) (= mask!3868 #b00000000000000000000001111111111) (= mask!3868 #b00000000000000000000011111111111) (= mask!3868 #b00000000000000000000111111111111) (= mask!3868 #b00000000000000000001111111111111) (= mask!3868 #b00000000000000000011111111111111) (= mask!3868 #b00000000000000000111111111111111) (= mask!3868 #b00000000000000001111111111111111) (= mask!3868 #b00000000000000011111111111111111) (= mask!3868 #b00000000000000111111111111111111) (= mask!3868 #b00000000000001111111111111111111) (= mask!3868 #b00000000000011111111111111111111) (= mask!3868 #b00000000000111111111111111111111) (= mask!3868 #b00000000001111111111111111111111) (= mask!3868 #b00000000011111111111111111111111) (= mask!3868 #b00000000111111111111111111111111) (= mask!3868 #b00000001111111111111111111111111) (= mask!3868 #b00000011111111111111111111111111) (= mask!3868 #b00000111111111111111111111111111) (= mask!3868 #b00001111111111111111111111111111) (= mask!3868 #b00011111111111111111111111111111) (= mask!3868 #b00111111111111111111111111111111)) (bvsle mask!3868 #b00111111111111111111111111111111)))))

(assert (=> start!25892 d!64245))

(declare-fun d!64255 () Bool)

(assert (=> d!64255 (= (array_inv!4122 a!3325) (bvsge (size!6503 a!3325) #b00000000000000000000000000000000))))

(assert (=> start!25892 d!64255))

(check-sat (not b!267501) (not b!267503) (not b!267499) (not bm!25315))
(check-sat)
