; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27090 () Bool)

(assert start!27090)

(declare-fun b!279916 () Bool)

(declare-fun res!142961 () Bool)

(declare-fun e!178432 () Bool)

(assert (=> b!279916 (=> (not res!142961) (not e!178432))))

(declare-datatypes ((array!13907 0))(
  ( (array!13908 (arr!6595 (Array (_ BitVec 32) (_ BitVec 64))) (size!6947 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13907)

(declare-datatypes ((List!4316 0))(
  ( (Nil!4313) (Cons!4312 (h!4982 (_ BitVec 64)) (t!9390 List!4316)) )
))
(declare-fun arrayNoDuplicates!0 (array!13907 (_ BitVec 32) List!4316) Bool)

(assert (=> b!279916 (= res!142961 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4313))))

(declare-fun b!279917 () Bool)

(declare-fun res!142967 () Bool)

(declare-fun e!178433 () Bool)

(assert (=> b!279917 (=> (not res!142967) (not e!178433))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13907 (_ BitVec 32)) Bool)

(assert (=> b!279917 (= res!142967 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!279918 () Bool)

(declare-fun res!142965 () Bool)

(assert (=> b!279918 (=> (not res!142965) (not e!178432))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!279918 (= res!142965 (and (= (size!6947 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6947 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6947 a!3325))))))

(declare-fun b!279919 () Bool)

(declare-fun res!142959 () Bool)

(assert (=> b!279919 (=> (not res!142959) (not e!178432))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!279919 (= res!142959 (validKeyInArray!0 k0!2581))))

(declare-fun b!279920 () Bool)

(declare-fun res!142969 () Bool)

(assert (=> b!279920 (=> (not res!142969) (not e!178432))))

(declare-fun arrayContainsKey!0 (array!13907 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!279920 (= res!142969 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!279922 () Bool)

(assert (=> b!279922 (= e!178432 e!178433)))

(declare-fun res!142971 () Bool)

(assert (=> b!279922 (=> (not res!142971) (not e!178433))))

(declare-datatypes ((SeekEntryResult!1718 0))(
  ( (MissingZero!1718 (index!9042 (_ BitVec 32))) (Found!1718 (index!9043 (_ BitVec 32))) (Intermediate!1718 (undefined!2530 Bool) (index!9044 (_ BitVec 32)) (x!27396 (_ BitVec 32))) (Undefined!1718) (MissingVacant!1718 (index!9045 (_ BitVec 32))) )
))
(declare-fun lt!138797 () SeekEntryResult!1718)

(assert (=> b!279922 (= res!142971 (or (= lt!138797 (MissingZero!1718 i!1267)) (= lt!138797 (MissingVacant!1718 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13907 (_ BitVec 32)) SeekEntryResult!1718)

(assert (=> b!279922 (= lt!138797 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!279923 () Bool)

(declare-fun res!142963 () Bool)

(assert (=> b!279923 (=> (not res!142963) (not e!178433))))

(declare-fun contains!1950 (List!4316 (_ BitVec 64)) Bool)

(assert (=> b!279923 (= res!142963 (not (contains!1950 Nil!4313 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!279924 () Bool)

(assert (=> b!279924 (= e!178433 false)))

(declare-fun lt!138798 () Bool)

(assert (=> b!279924 (= lt!138798 (contains!1950 Nil!4313 k0!2581))))

(declare-fun b!279925 () Bool)

(declare-fun res!142970 () Bool)

(assert (=> b!279925 (=> (not res!142970) (not e!178433))))

(declare-fun noDuplicate!161 (List!4316) Bool)

(assert (=> b!279925 (= res!142970 (noDuplicate!161 Nil!4313))))

(declare-fun b!279926 () Bool)

(declare-fun res!142964 () Bool)

(assert (=> b!279926 (=> (not res!142964) (not e!178433))))

(assert (=> b!279926 (= res!142964 (not (contains!1950 Nil!4313 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!279921 () Bool)

(declare-fun res!142966 () Bool)

(assert (=> b!279921 (=> (not res!142966) (not e!178433))))

(assert (=> b!279921 (= res!142966 (not (= startIndex!26 i!1267)))))

(declare-fun res!142968 () Bool)

(assert (=> start!27090 (=> (not res!142968) (not e!178432))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27090 (= res!142968 (validMask!0 mask!3868))))

(assert (=> start!27090 e!178432))

(declare-fun array_inv!4545 (array!13907) Bool)

(assert (=> start!27090 (array_inv!4545 a!3325)))

(assert (=> start!27090 true))

(declare-fun b!279927 () Bool)

(declare-fun res!142960 () Bool)

(assert (=> b!279927 (=> (not res!142960) (not e!178433))))

(assert (=> b!279927 (= res!142960 (and (bvslt (size!6947 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6947 a!3325))))))

(declare-fun b!279928 () Bool)

(declare-fun res!142962 () Bool)

(assert (=> b!279928 (=> (not res!142962) (not e!178433))))

(assert (=> b!279928 (= res!142962 (validKeyInArray!0 (select (arr!6595 a!3325) startIndex!26)))))

(assert (= (and start!27090 res!142968) b!279918))

(assert (= (and b!279918 res!142965) b!279919))

(assert (= (and b!279919 res!142959) b!279916))

(assert (= (and b!279916 res!142961) b!279920))

(assert (= (and b!279920 res!142969) b!279922))

(assert (= (and b!279922 res!142971) b!279917))

(assert (= (and b!279917 res!142967) b!279921))

(assert (= (and b!279921 res!142966) b!279928))

(assert (= (and b!279928 res!142962) b!279927))

(assert (= (and b!279927 res!142960) b!279925))

(assert (= (and b!279925 res!142970) b!279923))

(assert (= (and b!279923 res!142963) b!279926))

(assert (= (and b!279926 res!142964) b!279924))

(declare-fun m!294695 () Bool)

(assert (=> b!279926 m!294695))

(declare-fun m!294697 () Bool)

(assert (=> b!279917 m!294697))

(declare-fun m!294699 () Bool)

(assert (=> b!279923 m!294699))

(declare-fun m!294701 () Bool)

(assert (=> b!279920 m!294701))

(declare-fun m!294703 () Bool)

(assert (=> b!279924 m!294703))

(declare-fun m!294705 () Bool)

(assert (=> b!279916 m!294705))

(declare-fun m!294707 () Bool)

(assert (=> b!279925 m!294707))

(declare-fun m!294709 () Bool)

(assert (=> b!279919 m!294709))

(declare-fun m!294711 () Bool)

(assert (=> start!27090 m!294711))

(declare-fun m!294713 () Bool)

(assert (=> start!27090 m!294713))

(declare-fun m!294715 () Bool)

(assert (=> b!279922 m!294715))

(declare-fun m!294717 () Bool)

(assert (=> b!279928 m!294717))

(assert (=> b!279928 m!294717))

(declare-fun m!294719 () Bool)

(assert (=> b!279928 m!294719))

(check-sat (not b!279928) (not b!279916) (not b!279926) (not b!279922) (not b!279924) (not b!279920) (not b!279919) (not b!279925) (not start!27090) (not b!279923) (not b!279917))
(check-sat)
