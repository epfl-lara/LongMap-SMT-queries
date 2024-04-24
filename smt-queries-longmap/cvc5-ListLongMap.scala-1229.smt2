; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25936 () Bool)

(assert start!25936)

(declare-fun res!132077 () Bool)

(declare-fun e!173116 () Bool)

(assert (=> start!25936 (=> (not res!132077) (not e!173116))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25936 (= res!132077 (validMask!0 mask!3868))))

(assert (=> start!25936 e!173116))

(declare-datatypes ((array!13032 0))(
  ( (array!13033 (arr!6165 (Array (_ BitVec 32) (_ BitVec 64))) (size!6517 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13032)

(declare-fun array_inv!4115 (array!13032) Bool)

(assert (=> start!25936 (array_inv!4115 a!3325)))

(assert (=> start!25936 true))

(declare-fun b!267824 () Bool)

(declare-fun res!132078 () Bool)

(assert (=> b!267824 (=> (not res!132078) (not e!173116))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!267824 (= res!132078 (and (= (size!6517 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6517 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6517 a!3325))))))

(declare-fun b!267825 () Bool)

(declare-fun res!132076 () Bool)

(assert (=> b!267825 (=> (not res!132076) (not e!173116))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267825 (= res!132076 (validKeyInArray!0 k!2581))))

(declare-fun b!267826 () Bool)

(assert (=> b!267826 (= e!173116 false)))

(declare-fun lt!134787 () Bool)

(declare-datatypes ((List!3886 0))(
  ( (Nil!3883) (Cons!3882 (h!4549 (_ BitVec 64)) (t!8960 List!3886)) )
))
(declare-fun arrayNoDuplicates!0 (array!13032 (_ BitVec 32) List!3886) Bool)

(assert (=> b!267826 (= lt!134787 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3883))))

(assert (= (and start!25936 res!132077) b!267824))

(assert (= (and b!267824 res!132078) b!267825))

(assert (= (and b!267825 res!132076) b!267826))

(declare-fun m!284265 () Bool)

(assert (=> start!25936 m!284265))

(declare-fun m!284267 () Bool)

(assert (=> start!25936 m!284267))

(declare-fun m!284269 () Bool)

(assert (=> b!267825 m!284269))

(declare-fun m!284271 () Bool)

(assert (=> b!267826 m!284271))

(push 1)

(assert (not start!25936))

(assert (not b!267826))

(assert (not b!267825))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

