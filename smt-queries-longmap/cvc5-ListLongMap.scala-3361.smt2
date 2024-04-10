; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46218 () Bool)

(assert start!46218)

(declare-fun res!312425 () Bool)

(declare-fun e!298995 () Bool)

(assert (=> start!46218 (=> (not res!312425) (not e!298995))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46218 (= res!312425 (validMask!0 mask!3524))))

(assert (=> start!46218 e!298995))

(assert (=> start!46218 true))

(declare-datatypes ((array!32872 0))(
  ( (array!32873 (arr!15813 (Array (_ BitVec 32) (_ BitVec 64))) (size!16177 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32872)

(declare-fun array_inv!11609 (array!32872) Bool)

(assert (=> start!46218 (array_inv!11609 a!3235)))

(declare-fun b!511760 () Bool)

(declare-fun res!312426 () Bool)

(assert (=> b!511760 (=> (not res!312426) (not e!298995))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!511760 (= res!312426 (validKeyInArray!0 k!2280))))

(declare-fun b!511761 () Bool)

(declare-fun res!312424 () Bool)

(declare-fun e!298994 () Bool)

(assert (=> b!511761 (=> (not res!312424) (not e!298994))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32872 (_ BitVec 32)) Bool)

(assert (=> b!511761 (= res!312424 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!511762 () Bool)

(declare-fun res!312429 () Bool)

(declare-fun e!298992 () Bool)

(assert (=> b!511762 (=> res!312429 e!298992)))

(declare-datatypes ((SeekEntryResult!4280 0))(
  ( (MissingZero!4280 (index!19308 (_ BitVec 32))) (Found!4280 (index!19309 (_ BitVec 32))) (Intermediate!4280 (undefined!5092 Bool) (index!19310 (_ BitVec 32)) (x!48263 (_ BitVec 32))) (Undefined!4280) (MissingVacant!4280 (index!19311 (_ BitVec 32))) )
))
(declare-fun lt!234173 () SeekEntryResult!4280)

(assert (=> b!511762 (= res!312429 (or (not (is-Intermediate!4280 lt!234173)) (not (undefined!5092 lt!234173))))))

(declare-fun b!511763 () Bool)

(assert (=> b!511763 (= e!298995 e!298994)))

(declare-fun res!312430 () Bool)

(assert (=> b!511763 (=> (not res!312430) (not e!298994))))

(declare-fun lt!234175 () SeekEntryResult!4280)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!511763 (= res!312430 (or (= lt!234175 (MissingZero!4280 i!1204)) (= lt!234175 (MissingVacant!4280 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32872 (_ BitVec 32)) SeekEntryResult!4280)

(assert (=> b!511763 (= lt!234175 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!511764 () Bool)

(declare-fun res!312428 () Bool)

(assert (=> b!511764 (=> (not res!312428) (not e!298994))))

(declare-datatypes ((List!9971 0))(
  ( (Nil!9968) (Cons!9967 (h!10847 (_ BitVec 64)) (t!16199 List!9971)) )
))
(declare-fun arrayNoDuplicates!0 (array!32872 (_ BitVec 32) List!9971) Bool)

(assert (=> b!511764 (= res!312428 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9968))))

(declare-fun b!511765 () Bool)

(declare-fun res!312423 () Bool)

(assert (=> b!511765 (=> (not res!312423) (not e!298995))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!511765 (= res!312423 (validKeyInArray!0 (select (arr!15813 a!3235) j!176)))))

(declare-fun b!511766 () Bool)

(assert (=> b!511766 (= e!298994 (not e!298992))))

(declare-fun res!312431 () Bool)

(assert (=> b!511766 (=> res!312431 e!298992)))

(declare-fun lt!234174 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32872 (_ BitVec 32)) SeekEntryResult!4280)

(assert (=> b!511766 (= res!312431 (= lt!234173 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234174 (select (store (arr!15813 a!3235) i!1204 k!2280) j!176) (array!32873 (store (arr!15813 a!3235) i!1204 k!2280) (size!16177 a!3235)) mask!3524)))))

(declare-fun lt!234177 () (_ BitVec 32))

(assert (=> b!511766 (= lt!234173 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234177 (select (arr!15813 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!511766 (= lt!234174 (toIndex!0 (select (store (arr!15813 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!511766 (= lt!234177 (toIndex!0 (select (arr!15813 a!3235) j!176) mask!3524))))

(declare-fun lt!234178 () SeekEntryResult!4280)

(assert (=> b!511766 (= lt!234178 (Found!4280 j!176))))

(assert (=> b!511766 (= lt!234178 (seekEntryOrOpen!0 (select (arr!15813 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!511766 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15818 0))(
  ( (Unit!15819) )
))
(declare-fun lt!234176 () Unit!15818)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32872 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15818)

(assert (=> b!511766 (= lt!234176 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!511767 () Bool)

(assert (=> b!511767 (= e!298992 true)))

(assert (=> b!511767 (= lt!234178 Undefined!4280)))

(declare-fun b!511768 () Bool)

(declare-fun res!312422 () Bool)

(assert (=> b!511768 (=> (not res!312422) (not e!298995))))

(declare-fun arrayContainsKey!0 (array!32872 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!511768 (= res!312422 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!511769 () Bool)

(declare-fun res!312427 () Bool)

(assert (=> b!511769 (=> (not res!312427) (not e!298995))))

(assert (=> b!511769 (= res!312427 (and (= (size!16177 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16177 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16177 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!46218 res!312425) b!511769))

(assert (= (and b!511769 res!312427) b!511765))

(assert (= (and b!511765 res!312423) b!511760))

(assert (= (and b!511760 res!312426) b!511768))

(assert (= (and b!511768 res!312422) b!511763))

(assert (= (and b!511763 res!312430) b!511761))

(assert (= (and b!511761 res!312424) b!511764))

(assert (= (and b!511764 res!312428) b!511766))

(assert (= (and b!511766 (not res!312431)) b!511762))

(assert (= (and b!511762 (not res!312429)) b!511767))

(declare-fun m!493281 () Bool)

(assert (=> b!511765 m!493281))

(assert (=> b!511765 m!493281))

(declare-fun m!493283 () Bool)

(assert (=> b!511765 m!493283))

(declare-fun m!493285 () Bool)

(assert (=> b!511768 m!493285))

(declare-fun m!493287 () Bool)

(assert (=> b!511766 m!493287))

(declare-fun m!493289 () Bool)

(assert (=> b!511766 m!493289))

(declare-fun m!493291 () Bool)

(assert (=> b!511766 m!493291))

(assert (=> b!511766 m!493291))

(declare-fun m!493293 () Bool)

(assert (=> b!511766 m!493293))

(assert (=> b!511766 m!493281))

(declare-fun m!493295 () Bool)

(assert (=> b!511766 m!493295))

(assert (=> b!511766 m!493281))

(declare-fun m!493297 () Bool)

(assert (=> b!511766 m!493297))

(assert (=> b!511766 m!493281))

(declare-fun m!493299 () Bool)

(assert (=> b!511766 m!493299))

(assert (=> b!511766 m!493291))

(declare-fun m!493301 () Bool)

(assert (=> b!511766 m!493301))

(assert (=> b!511766 m!493281))

(declare-fun m!493303 () Bool)

(assert (=> b!511766 m!493303))

(declare-fun m!493305 () Bool)

(assert (=> b!511760 m!493305))

(declare-fun m!493307 () Bool)

(assert (=> b!511763 m!493307))

(declare-fun m!493309 () Bool)

(assert (=> start!46218 m!493309))

(declare-fun m!493311 () Bool)

(assert (=> start!46218 m!493311))

(declare-fun m!493313 () Bool)

(assert (=> b!511764 m!493313))

(declare-fun m!493315 () Bool)

(assert (=> b!511761 m!493315))

(push 1)

