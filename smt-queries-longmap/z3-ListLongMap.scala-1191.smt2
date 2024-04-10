; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25614 () Bool)

(assert start!25614)

(declare-fun b!265680 () Bool)

(declare-fun e!172041 () Bool)

(assert (=> b!265680 (= e!172041 false)))

(declare-fun lt!134187 () Bool)

(declare-datatypes ((array!12793 0))(
  ( (array!12794 (arr!6051 (Array (_ BitVec 32) (_ BitVec 64))) (size!6403 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12793)

(declare-datatypes ((List!3865 0))(
  ( (Nil!3862) (Cons!3861 (h!4528 (_ BitVec 64)) (t!8947 List!3865)) )
))
(declare-fun arrayNoDuplicates!0 (array!12793 (_ BitVec 32) List!3865) Bool)

(assert (=> b!265680 (= lt!134187 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3862))))

(declare-fun res!129981 () Bool)

(declare-fun e!172042 () Bool)

(assert (=> start!25614 (=> (not res!129981) (not e!172042))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25614 (= res!129981 (validMask!0 mask!4002))))

(assert (=> start!25614 e!172042))

(assert (=> start!25614 true))

(declare-fun array_inv!4014 (array!12793) Bool)

(assert (=> start!25614 (array_inv!4014 a!3436)))

(declare-fun b!265681 () Bool)

(declare-fun res!129980 () Bool)

(assert (=> b!265681 (=> (not res!129980) (not e!172041))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12793 (_ BitVec 32)) Bool)

(assert (=> b!265681 (= res!129980 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!265682 () Bool)

(declare-fun res!129976 () Bool)

(assert (=> b!265682 (=> (not res!129976) (not e!172042))))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!265682 (= res!129976 (and (= (size!6403 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6403 a!3436))))))

(declare-fun b!265683 () Bool)

(declare-fun res!129979 () Bool)

(assert (=> b!265683 (=> (not res!129979) (not e!172042))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12793 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!265683 (= res!129979 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!265684 () Bool)

(assert (=> b!265684 (= e!172042 e!172041)))

(declare-fun res!129977 () Bool)

(assert (=> b!265684 (=> (not res!129977) (not e!172041))))

(declare-datatypes ((SeekEntryResult!1242 0))(
  ( (MissingZero!1242 (index!7138 (_ BitVec 32))) (Found!1242 (index!7139 (_ BitVec 32))) (Intermediate!1242 (undefined!2054 Bool) (index!7140 (_ BitVec 32)) (x!25455 (_ BitVec 32))) (Undefined!1242) (MissingVacant!1242 (index!7141 (_ BitVec 32))) )
))
(declare-fun lt!134188 () SeekEntryResult!1242)

(assert (=> b!265684 (= res!129977 (or (= lt!134188 (MissingZero!1242 i!1355)) (= lt!134188 (MissingVacant!1242 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12793 (_ BitVec 32)) SeekEntryResult!1242)

(assert (=> b!265684 (= lt!134188 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!265685 () Bool)

(declare-fun res!129978 () Bool)

(assert (=> b!265685 (=> (not res!129978) (not e!172042))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!265685 (= res!129978 (validKeyInArray!0 k0!2698))))

(assert (= (and start!25614 res!129981) b!265682))

(assert (= (and b!265682 res!129976) b!265685))

(assert (= (and b!265685 res!129978) b!265683))

(assert (= (and b!265683 res!129979) b!265684))

(assert (= (and b!265684 res!129977) b!265681))

(assert (= (and b!265681 res!129980) b!265680))

(declare-fun m!282431 () Bool)

(assert (=> b!265685 m!282431))

(declare-fun m!282433 () Bool)

(assert (=> b!265681 m!282433))

(declare-fun m!282435 () Bool)

(assert (=> b!265684 m!282435))

(declare-fun m!282437 () Bool)

(assert (=> start!25614 m!282437))

(declare-fun m!282439 () Bool)

(assert (=> start!25614 m!282439))

(declare-fun m!282441 () Bool)

(assert (=> b!265680 m!282441))

(declare-fun m!282443 () Bool)

(assert (=> b!265683 m!282443))

(check-sat (not b!265684) (not b!265681) (not b!265685) (not start!25614) (not b!265683) (not b!265680))
(check-sat)
