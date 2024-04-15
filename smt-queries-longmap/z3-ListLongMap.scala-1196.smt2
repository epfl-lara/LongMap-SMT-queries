; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25646 () Bool)

(assert start!25646)

(declare-fun b!265785 () Bool)

(declare-fun res!130138 () Bool)

(declare-fun e!172067 () Bool)

(assert (=> b!265785 (=> (not res!130138) (not e!172067))))

(declare-datatypes ((array!12813 0))(
  ( (array!12814 (arr!6060 (Array (_ BitVec 32) (_ BitVec 64))) (size!6413 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12813)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12813 (_ BitVec 32)) Bool)

(assert (=> b!265785 (= res!130138 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!265786 () Bool)

(declare-fun res!130135 () Bool)

(declare-fun e!172068 () Bool)

(assert (=> b!265786 (=> (not res!130135) (not e!172068))))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!265786 (= res!130135 (and (= (size!6413 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6413 a!3436))))))

(declare-fun b!265787 () Bool)

(declare-fun res!130134 () Bool)

(assert (=> b!265787 (=> (not res!130134) (not e!172068))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12813 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!265787 (= res!130134 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!265789 () Bool)

(declare-fun res!130133 () Bool)

(assert (=> b!265789 (=> (not res!130133) (not e!172068))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!265789 (= res!130133 (validKeyInArray!0 k0!2698))))

(declare-fun b!265790 () Bool)

(assert (=> b!265790 (= e!172068 e!172067)))

(declare-fun res!130137 () Bool)

(assert (=> b!265790 (=> (not res!130137) (not e!172067))))

(declare-datatypes ((SeekEntryResult!1250 0))(
  ( (MissingZero!1250 (index!7170 (_ BitVec 32))) (Found!1250 (index!7171 (_ BitVec 32))) (Intermediate!1250 (undefined!2062 Bool) (index!7172 (_ BitVec 32)) (x!25502 (_ BitVec 32))) (Undefined!1250) (MissingVacant!1250 (index!7173 (_ BitVec 32))) )
))
(declare-fun lt!134090 () SeekEntryResult!1250)

(assert (=> b!265790 (= res!130137 (or (= lt!134090 (MissingZero!1250 i!1355)) (= lt!134090 (MissingVacant!1250 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12813 (_ BitVec 32)) SeekEntryResult!1250)

(assert (=> b!265790 (= lt!134090 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun res!130136 () Bool)

(assert (=> start!25646 (=> (not res!130136) (not e!172068))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25646 (= res!130136 (validMask!0 mask!4002))))

(assert (=> start!25646 e!172068))

(assert (=> start!25646 true))

(declare-fun array_inv!4032 (array!12813) Bool)

(assert (=> start!25646 (array_inv!4032 a!3436)))

(declare-fun b!265788 () Bool)

(assert (=> b!265788 (= e!172067 false)))

(declare-fun lt!134091 () Bool)

(declare-datatypes ((List!3847 0))(
  ( (Nil!3844) (Cons!3843 (h!4510 (_ BitVec 64)) (t!8920 List!3847)) )
))
(declare-fun arrayNoDuplicates!0 (array!12813 (_ BitVec 32) List!3847) Bool)

(assert (=> b!265788 (= lt!134091 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3844))))

(assert (= (and start!25646 res!130136) b!265786))

(assert (= (and b!265786 res!130135) b!265789))

(assert (= (and b!265789 res!130133) b!265787))

(assert (= (and b!265787 res!130134) b!265790))

(assert (= (and b!265790 res!130137) b!265785))

(assert (= (and b!265785 res!130138) b!265788))

(declare-fun m!282035 () Bool)

(assert (=> b!265787 m!282035))

(declare-fun m!282037 () Bool)

(assert (=> start!25646 m!282037))

(declare-fun m!282039 () Bool)

(assert (=> start!25646 m!282039))

(declare-fun m!282041 () Bool)

(assert (=> b!265789 m!282041))

(declare-fun m!282043 () Bool)

(assert (=> b!265790 m!282043))

(declare-fun m!282045 () Bool)

(assert (=> b!265788 m!282045))

(declare-fun m!282047 () Bool)

(assert (=> b!265785 m!282047))

(check-sat (not b!265789) (not start!25646) (not b!265785) (not b!265787) (not b!265790) (not b!265788))
(check-sat)
