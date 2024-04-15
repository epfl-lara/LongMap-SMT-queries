; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46980 () Bool)

(assert start!46980)

(declare-fun b!517863 () Bool)

(declare-fun e!302161 () Bool)

(assert (=> b!517863 (= e!302161 true)))

(declare-datatypes ((SeekEntryResult!4393 0))(
  ( (MissingZero!4393 (index!19760 (_ BitVec 32))) (Found!4393 (index!19761 (_ BitVec 32))) (Intermediate!4393 (undefined!5205 Bool) (index!19762 (_ BitVec 32)) (x!48737 (_ BitVec 32))) (Undefined!4393) (MissingVacant!4393 (index!19763 (_ BitVec 32))) )
))
(declare-fun lt!236946 () SeekEntryResult!4393)

(declare-datatypes ((array!33131 0))(
  ( (array!33132 (arr!15929 (Array (_ BitVec 32) (_ BitVec 64))) (size!16294 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33131)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!517863 (and (bvslt (x!48737 lt!236946) #b01111111111111111111111111111110) (or (= (select (arr!15929 a!3235) (index!19762 lt!236946)) (select (arr!15929 a!3235) j!176)) (= (select (arr!15929 a!3235) (index!19762 lt!236946)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15929 a!3235) (index!19762 lt!236946)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!517864 () Bool)

(declare-fun res!317029 () Bool)

(declare-fun e!302162 () Bool)

(assert (=> b!517864 (=> (not res!317029) (not e!302162))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33131 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!517864 (= res!317029 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!517865 () Bool)

(declare-fun res!317020 () Bool)

(assert (=> b!517865 (=> (not res!317020) (not e!302162))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!517865 (= res!317020 (validKeyInArray!0 (select (arr!15929 a!3235) j!176)))))

(declare-fun b!517866 () Bool)

(declare-fun e!302159 () Bool)

(assert (=> b!517866 (= e!302162 e!302159)))

(declare-fun res!317024 () Bool)

(assert (=> b!517866 (=> (not res!317024) (not e!302159))))

(declare-fun lt!236947 () SeekEntryResult!4393)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!517866 (= res!317024 (or (= lt!236947 (MissingZero!4393 i!1204)) (= lt!236947 (MissingVacant!4393 i!1204))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33131 (_ BitVec 32)) SeekEntryResult!4393)

(assert (=> b!517866 (= lt!236947 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!517868 () Bool)

(declare-fun res!317030 () Bool)

(assert (=> b!517868 (=> (not res!317030) (not e!302162))))

(assert (=> b!517868 (= res!317030 (validKeyInArray!0 k0!2280))))

(declare-fun b!517869 () Bool)

(declare-fun res!317022 () Bool)

(assert (=> b!517869 (=> (not res!317022) (not e!302159))))

(declare-datatypes ((List!10126 0))(
  ( (Nil!10123) (Cons!10122 (h!11029 (_ BitVec 64)) (t!16345 List!10126)) )
))
(declare-fun arrayNoDuplicates!0 (array!33131 (_ BitVec 32) List!10126) Bool)

(assert (=> b!517869 (= res!317022 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10123))))

(declare-fun b!517870 () Bool)

(declare-fun res!317023 () Bool)

(assert (=> b!517870 (=> (not res!317023) (not e!302159))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33131 (_ BitVec 32)) Bool)

(assert (=> b!517870 (= res!317023 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!517871 () Bool)

(declare-fun res!317021 () Bool)

(assert (=> b!517871 (=> res!317021 e!302161)))

(get-info :version)

(assert (=> b!517871 (= res!317021 (or (undefined!5205 lt!236946) (not ((_ is Intermediate!4393) lt!236946))))))

(declare-fun b!517872 () Bool)

(declare-fun res!317027 () Bool)

(assert (=> b!517872 (=> (not res!317027) (not e!302162))))

(assert (=> b!517872 (= res!317027 (and (= (size!16294 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16294 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16294 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!517873 () Bool)

(assert (=> b!517873 (= e!302159 (not e!302161))))

(declare-fun res!317026 () Bool)

(assert (=> b!517873 (=> res!317026 e!302161)))

(declare-fun lt!236944 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33131 (_ BitVec 32)) SeekEntryResult!4393)

(assert (=> b!517873 (= res!317026 (= lt!236946 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236944 (select (store (arr!15929 a!3235) i!1204 k0!2280) j!176) (array!33132 (store (arr!15929 a!3235) i!1204 k0!2280) (size!16294 a!3235)) mask!3524)))))

(declare-fun lt!236945 () (_ BitVec 32))

(assert (=> b!517873 (= lt!236946 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236945 (select (arr!15929 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!517873 (= lt!236944 (toIndex!0 (select (store (arr!15929 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!517873 (= lt!236945 (toIndex!0 (select (arr!15929 a!3235) j!176) mask!3524))))

(declare-fun e!302160 () Bool)

(assert (=> b!517873 e!302160))

(declare-fun res!317025 () Bool)

(assert (=> b!517873 (=> (not res!317025) (not e!302160))))

(assert (=> b!517873 (= res!317025 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16030 0))(
  ( (Unit!16031) )
))
(declare-fun lt!236943 () Unit!16030)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33131 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16030)

(assert (=> b!517873 (= lt!236943 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!317028 () Bool)

(assert (=> start!46980 (=> (not res!317028) (not e!302162))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46980 (= res!317028 (validMask!0 mask!3524))))

(assert (=> start!46980 e!302162))

(assert (=> start!46980 true))

(declare-fun array_inv!11812 (array!33131) Bool)

(assert (=> start!46980 (array_inv!11812 a!3235)))

(declare-fun b!517867 () Bool)

(assert (=> b!517867 (= e!302160 (= (seekEntryOrOpen!0 (select (arr!15929 a!3235) j!176) a!3235 mask!3524) (Found!4393 j!176)))))

(assert (= (and start!46980 res!317028) b!517872))

(assert (= (and b!517872 res!317027) b!517865))

(assert (= (and b!517865 res!317020) b!517868))

(assert (= (and b!517868 res!317030) b!517864))

(assert (= (and b!517864 res!317029) b!517866))

(assert (= (and b!517866 res!317024) b!517870))

(assert (= (and b!517870 res!317023) b!517869))

(assert (= (and b!517869 res!317022) b!517873))

(assert (= (and b!517873 res!317025) b!517867))

(assert (= (and b!517873 (not res!317026)) b!517871))

(assert (= (and b!517871 (not res!317021)) b!517863))

(declare-fun m!498733 () Bool)

(assert (=> start!46980 m!498733))

(declare-fun m!498735 () Bool)

(assert (=> start!46980 m!498735))

(declare-fun m!498737 () Bool)

(assert (=> b!517870 m!498737))

(declare-fun m!498739 () Bool)

(assert (=> b!517873 m!498739))

(declare-fun m!498741 () Bool)

(assert (=> b!517873 m!498741))

(declare-fun m!498743 () Bool)

(assert (=> b!517873 m!498743))

(declare-fun m!498745 () Bool)

(assert (=> b!517873 m!498745))

(assert (=> b!517873 m!498741))

(declare-fun m!498747 () Bool)

(assert (=> b!517873 m!498747))

(declare-fun m!498749 () Bool)

(assert (=> b!517873 m!498749))

(assert (=> b!517873 m!498747))

(declare-fun m!498751 () Bool)

(assert (=> b!517873 m!498751))

(assert (=> b!517873 m!498747))

(declare-fun m!498753 () Bool)

(assert (=> b!517873 m!498753))

(assert (=> b!517873 m!498741))

(declare-fun m!498755 () Bool)

(assert (=> b!517873 m!498755))

(declare-fun m!498757 () Bool)

(assert (=> b!517863 m!498757))

(assert (=> b!517863 m!498747))

(declare-fun m!498759 () Bool)

(assert (=> b!517864 m!498759))

(declare-fun m!498761 () Bool)

(assert (=> b!517868 m!498761))

(declare-fun m!498763 () Bool)

(assert (=> b!517866 m!498763))

(assert (=> b!517865 m!498747))

(assert (=> b!517865 m!498747))

(declare-fun m!498765 () Bool)

(assert (=> b!517865 m!498765))

(assert (=> b!517867 m!498747))

(assert (=> b!517867 m!498747))

(declare-fun m!498767 () Bool)

(assert (=> b!517867 m!498767))

(declare-fun m!498769 () Bool)

(assert (=> b!517869 m!498769))

(check-sat (not b!517873) (not b!517866) (not b!517869) (not b!517864) (not b!517865) (not b!517868) (not b!517867) (not b!517870) (not start!46980))
(check-sat)
