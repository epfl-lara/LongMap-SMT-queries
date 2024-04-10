; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26198 () Bool)

(assert start!26198)

(declare-fun b!270788 () Bool)

(declare-fun res!134785 () Bool)

(declare-fun e!174405 () Bool)

(assert (=> b!270788 (=> (not res!134785) (not e!174405))))

(declare-datatypes ((List!4105 0))(
  ( (Nil!4102) (Cons!4101 (h!4768 (_ BitVec 64)) (t!9187 List!4105)) )
))
(declare-fun noDuplicate!123 (List!4105) Bool)

(assert (=> b!270788 (= res!134785 (noDuplicate!123 Nil!4102))))

(declare-fun b!270789 () Bool)

(declare-fun res!134787 () Bool)

(declare-fun e!174406 () Bool)

(assert (=> b!270789 (=> (not res!134787) (not e!174406))))

(declare-datatypes ((array!13295 0))(
  ( (array!13296 (arr!6297 (Array (_ BitVec 32) (_ BitVec 64))) (size!6649 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13295)

(declare-fun arrayNoDuplicates!0 (array!13295 (_ BitVec 32) List!4105) Bool)

(assert (=> b!270789 (= res!134787 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4102))))

(declare-fun b!270790 () Bool)

(assert (=> b!270790 (= e!174406 e!174405)))

(declare-fun res!134779 () Bool)

(assert (=> b!270790 (=> (not res!134779) (not e!174405))))

(declare-datatypes ((SeekEntryResult!1455 0))(
  ( (MissingZero!1455 (index!7990 (_ BitVec 32))) (Found!1455 (index!7991 (_ BitVec 32))) (Intermediate!1455 (undefined!2267 Bool) (index!7992 (_ BitVec 32)) (x!26324 (_ BitVec 32))) (Undefined!1455) (MissingVacant!1455 (index!7993 (_ BitVec 32))) )
))
(declare-fun lt!135702 () SeekEntryResult!1455)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!270790 (= res!134779 (or (= lt!135702 (MissingZero!1455 i!1267)) (= lt!135702 (MissingVacant!1455 i!1267))))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13295 (_ BitVec 32)) SeekEntryResult!1455)

(assert (=> b!270790 (= lt!135702 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!270791 () Bool)

(declare-fun res!134781 () Bool)

(assert (=> b!270791 (=> (not res!134781) (not e!174405))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!270791 (= res!134781 (not (= startIndex!26 i!1267)))))

(declare-fun b!270792 () Bool)

(declare-fun res!134786 () Bool)

(assert (=> b!270792 (=> (not res!134786) (not e!174406))))

(declare-fun arrayContainsKey!0 (array!13295 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!270792 (= res!134786 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!270793 () Bool)

(declare-fun res!134790 () Bool)

(assert (=> b!270793 (=> (not res!134790) (not e!174405))))

(declare-fun contains!1935 (List!4105 (_ BitVec 64)) Bool)

(assert (=> b!270793 (= res!134790 (not (contains!1935 Nil!4102 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!270794 () Bool)

(declare-fun res!134780 () Bool)

(assert (=> b!270794 (=> (not res!134780) (not e!174405))))

(assert (=> b!270794 (= res!134780 (not (contains!1935 Nil!4102 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!270795 () Bool)

(declare-fun res!134778 () Bool)

(assert (=> b!270795 (=> (not res!134778) (not e!174405))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!270795 (= res!134778 (validKeyInArray!0 (select (arr!6297 a!3325) startIndex!26)))))

(declare-fun res!134783 () Bool)

(assert (=> start!26198 (=> (not res!134783) (not e!174406))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26198 (= res!134783 (validMask!0 mask!3868))))

(assert (=> start!26198 e!174406))

(declare-fun array_inv!4260 (array!13295) Bool)

(assert (=> start!26198 (array_inv!4260 a!3325)))

(assert (=> start!26198 true))

(declare-fun b!270796 () Bool)

(declare-fun res!134789 () Bool)

(assert (=> b!270796 (=> (not res!134789) (not e!174406))))

(assert (=> b!270796 (= res!134789 (validKeyInArray!0 k0!2581))))

(declare-fun b!270797 () Bool)

(declare-fun res!134784 () Bool)

(assert (=> b!270797 (=> (not res!134784) (not e!174405))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13295 (_ BitVec 32)) Bool)

(assert (=> b!270797 (= res!134784 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!270798 () Bool)

(declare-fun res!134782 () Bool)

(assert (=> b!270798 (=> (not res!134782) (not e!174406))))

(assert (=> b!270798 (= res!134782 (and (= (size!6649 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6649 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6649 a!3325))))))

(declare-fun b!270799 () Bool)

(assert (=> b!270799 (= e!174405 false)))

(declare-fun lt!135703 () Bool)

(assert (=> b!270799 (= lt!135703 (contains!1935 Nil!4102 k0!2581))))

(declare-fun b!270800 () Bool)

(declare-fun res!134788 () Bool)

(assert (=> b!270800 (=> (not res!134788) (not e!174405))))

(assert (=> b!270800 (= res!134788 (and (bvslt (size!6649 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6649 a!3325))))))

(assert (= (and start!26198 res!134783) b!270798))

(assert (= (and b!270798 res!134782) b!270796))

(assert (= (and b!270796 res!134789) b!270789))

(assert (= (and b!270789 res!134787) b!270792))

(assert (= (and b!270792 res!134786) b!270790))

(assert (= (and b!270790 res!134779) b!270797))

(assert (= (and b!270797 res!134784) b!270791))

(assert (= (and b!270791 res!134781) b!270795))

(assert (= (and b!270795 res!134778) b!270800))

(assert (= (and b!270800 res!134788) b!270788))

(assert (= (and b!270788 res!134785) b!270793))

(assert (= (and b!270793 res!134790) b!270794))

(assert (= (and b!270794 res!134780) b!270799))

(declare-fun m!286289 () Bool)

(assert (=> b!270789 m!286289))

(declare-fun m!286291 () Bool)

(assert (=> b!270793 m!286291))

(declare-fun m!286293 () Bool)

(assert (=> start!26198 m!286293))

(declare-fun m!286295 () Bool)

(assert (=> start!26198 m!286295))

(declare-fun m!286297 () Bool)

(assert (=> b!270792 m!286297))

(declare-fun m!286299 () Bool)

(assert (=> b!270795 m!286299))

(assert (=> b!270795 m!286299))

(declare-fun m!286301 () Bool)

(assert (=> b!270795 m!286301))

(declare-fun m!286303 () Bool)

(assert (=> b!270797 m!286303))

(declare-fun m!286305 () Bool)

(assert (=> b!270799 m!286305))

(declare-fun m!286307 () Bool)

(assert (=> b!270794 m!286307))

(declare-fun m!286309 () Bool)

(assert (=> b!270796 m!286309))

(declare-fun m!286311 () Bool)

(assert (=> b!270790 m!286311))

(declare-fun m!286313 () Bool)

(assert (=> b!270788 m!286313))

(check-sat (not b!270790) (not b!270788) (not b!270795) (not b!270799) (not b!270797) (not b!270793) (not b!270794) (not b!270792) (not start!26198) (not b!270796) (not b!270789))
(check-sat)
