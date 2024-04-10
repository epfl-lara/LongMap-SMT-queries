; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25894 () Bool)

(assert start!25894)

(declare-fun b!267633 () Bool)

(declare-fun res!131929 () Bool)

(declare-fun e!173002 () Bool)

(assert (=> b!267633 (=> (not res!131929) (not e!173002))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267633 (= res!131929 (validKeyInArray!0 k!2581))))

(declare-fun res!131928 () Bool)

(assert (=> start!25894 (=> (not res!131928) (not e!173002))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25894 (= res!131928 (validMask!0 mask!3868))))

(assert (=> start!25894 e!173002))

(declare-datatypes ((array!13012 0))(
  ( (array!13013 (arr!6157 (Array (_ BitVec 32) (_ BitVec 64))) (size!6509 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13012)

(declare-fun array_inv!4120 (array!13012) Bool)

(assert (=> start!25894 (array_inv!4120 a!3325)))

(assert (=> start!25894 true))

(declare-fun b!267635 () Bool)

(assert (=> b!267635 (= e!173002 (and (bvslt #b00000000000000000000000000000000 (size!6509 a!3325)) (bvsge (size!6509 a!3325) #b01111111111111111111111111111111)))))

(declare-fun b!267634 () Bool)

(declare-fun res!131930 () Bool)

(assert (=> b!267634 (=> (not res!131930) (not e!173002))))

(declare-datatypes ((List!3965 0))(
  ( (Nil!3962) (Cons!3961 (h!4628 (_ BitVec 64)) (t!9047 List!3965)) )
))
(declare-fun arrayNoDuplicates!0 (array!13012 (_ BitVec 32) List!3965) Bool)

(assert (=> b!267634 (= res!131930 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3962))))

(declare-fun b!267632 () Bool)

(declare-fun res!131931 () Bool)

(assert (=> b!267632 (=> (not res!131931) (not e!173002))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!267632 (= res!131931 (and (= (size!6509 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6509 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6509 a!3325))))))

(assert (= (and start!25894 res!131928) b!267632))

(assert (= (and b!267632 res!131931) b!267633))

(assert (= (and b!267633 res!131929) b!267634))

(assert (= (and b!267634 res!131930) b!267635))

(declare-fun m!283957 () Bool)

(assert (=> b!267633 m!283957))

(declare-fun m!283959 () Bool)

(assert (=> start!25894 m!283959))

(declare-fun m!283961 () Bool)

(assert (=> start!25894 m!283961))

(declare-fun m!283963 () Bool)

(assert (=> b!267634 m!283963))

(push 1)

(assert (not start!25894))

(assert (not b!267634))

(assert (not b!267633))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!64395 () Bool)

(assert (=> d!64395 (= (validMask!0 mask!3868) (and (or (= mask!3868 #b00000000000000000000000000000111) (= mask!3868 #b00000000000000000000000000001111) (= mask!3868 #b00000000000000000000000000011111) (= mask!3868 #b00000000000000000000000000111111) (= mask!3868 #b00000000000000000000000001111111) (= mask!3868 #b00000000000000000000000011111111) (= mask!3868 #b00000000000000000000000111111111) (= mask!3868 #b00000000000000000000001111111111) (= mask!3868 #b00000000000000000000011111111111) (= mask!3868 #b00000000000000000000111111111111) (= mask!3868 #b00000000000000000001111111111111) (= mask!3868 #b00000000000000000011111111111111) (= mask!3868 #b00000000000000000111111111111111) (= mask!3868 #b00000000000000001111111111111111) (= mask!3868 #b00000000000000011111111111111111) (= mask!3868 #b00000000000000111111111111111111) (= mask!3868 #b00000000000001111111111111111111) (= mask!3868 #b00000000000011111111111111111111) (= mask!3868 #b00000000000111111111111111111111) (= mask!3868 #b00000000001111111111111111111111) (= mask!3868 #b00000000011111111111111111111111) (= mask!3868 #b00000000111111111111111111111111) (= mask!3868 #b00000001111111111111111111111111) (= mask!3868 #b00000011111111111111111111111111) (= mask!3868 #b00000111111111111111111111111111) (= mask!3868 #b00001111111111111111111111111111) (= mask!3868 #b00011111111111111111111111111111) (= mask!3868 #b00111111111111111111111111111111)) (bvsle mask!3868 #b00111111111111111111111111111111)))))

(assert (=> start!25894 d!64395))

(declare-fun d!64405 () Bool)

(assert (=> d!64405 (= (array_inv!4120 a!3325) (bvsge (size!6509 a!3325) #b00000000000000000000000000000000))))

