; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25658 () Bool)

(assert start!25658)

(declare-fun b!265893 () Bool)

(declare-fun res!130244 () Bool)

(declare-fun e!172121 () Bool)

(assert (=> b!265893 (=> (not res!130244) (not e!172121))))

(declare-datatypes ((array!12825 0))(
  ( (array!12826 (arr!6066 (Array (_ BitVec 32) (_ BitVec 64))) (size!6419 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12825)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12825 (_ BitVec 32)) Bool)

(assert (=> b!265893 (= res!130244 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!265894 () Bool)

(declare-fun res!130242 () Bool)

(declare-fun e!172120 () Bool)

(assert (=> b!265894 (=> (not res!130242) (not e!172120))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!265894 (= res!130242 (validKeyInArray!0 k0!2698))))

(declare-fun b!265895 () Bool)

(declare-fun res!130245 () Bool)

(assert (=> b!265895 (=> (not res!130245) (not e!172120))))

(declare-fun arrayContainsKey!0 (array!12825 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!265895 (= res!130245 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!265896 () Bool)

(assert (=> b!265896 (= e!172120 e!172121)))

(declare-fun res!130243 () Bool)

(assert (=> b!265896 (=> (not res!130243) (not e!172121))))

(declare-datatypes ((SeekEntryResult!1256 0))(
  ( (MissingZero!1256 (index!7194 (_ BitVec 32))) (Found!1256 (index!7195 (_ BitVec 32))) (Intermediate!1256 (undefined!2068 Bool) (index!7196 (_ BitVec 32)) (x!25524 (_ BitVec 32))) (Undefined!1256) (MissingVacant!1256 (index!7197 (_ BitVec 32))) )
))
(declare-fun lt!134127 () SeekEntryResult!1256)

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!265896 (= res!130243 (or (= lt!134127 (MissingZero!1256 i!1355)) (= lt!134127 (MissingVacant!1256 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12825 (_ BitVec 32)) SeekEntryResult!1256)

(assert (=> b!265896 (= lt!134127 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!265897 () Bool)

(assert (=> b!265897 (= e!172121 false)))

(declare-fun lt!134126 () Bool)

(declare-datatypes ((List!3853 0))(
  ( (Nil!3850) (Cons!3849 (h!4516 (_ BitVec 64)) (t!8926 List!3853)) )
))
(declare-fun arrayNoDuplicates!0 (array!12825 (_ BitVec 32) List!3853) Bool)

(assert (=> b!265897 (= lt!134126 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3850))))

(declare-fun b!265898 () Bool)

(declare-fun res!130241 () Bool)

(assert (=> b!265898 (=> (not res!130241) (not e!172120))))

(assert (=> b!265898 (= res!130241 (and (= (size!6419 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6419 a!3436))))))

(declare-fun res!130246 () Bool)

(assert (=> start!25658 (=> (not res!130246) (not e!172120))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25658 (= res!130246 (validMask!0 mask!4002))))

(assert (=> start!25658 e!172120))

(assert (=> start!25658 true))

(declare-fun array_inv!4038 (array!12825) Bool)

(assert (=> start!25658 (array_inv!4038 a!3436)))

(assert (= (and start!25658 res!130246) b!265898))

(assert (= (and b!265898 res!130241) b!265894))

(assert (= (and b!265894 res!130242) b!265895))

(assert (= (and b!265895 res!130245) b!265896))

(assert (= (and b!265896 res!130243) b!265893))

(assert (= (and b!265893 res!130244) b!265897))

(declare-fun m!282119 () Bool)

(assert (=> start!25658 m!282119))

(declare-fun m!282121 () Bool)

(assert (=> start!25658 m!282121))

(declare-fun m!282123 () Bool)

(assert (=> b!265895 m!282123))

(declare-fun m!282125 () Bool)

(assert (=> b!265893 m!282125))

(declare-fun m!282127 () Bool)

(assert (=> b!265894 m!282127))

(declare-fun m!282129 () Bool)

(assert (=> b!265896 m!282129))

(declare-fun m!282131 () Bool)

(assert (=> b!265897 m!282131))

(check-sat (not b!265896) (not b!265894) (not b!265893) (not b!265895) (not start!25658) (not b!265897))
(check-sat)
