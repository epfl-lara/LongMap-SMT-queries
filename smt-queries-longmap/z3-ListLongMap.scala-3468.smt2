; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48128 () Bool)

(assert start!48128)

(declare-fun b!530175 () Bool)

(declare-fun e!308916 () Bool)

(declare-fun e!308911 () Bool)

(assert (=> b!530175 (= e!308916 e!308911)))

(declare-fun res!325945 () Bool)

(assert (=> b!530175 (=> res!325945 e!308911)))

(declare-fun lt!244632 () Bool)

(declare-datatypes ((SeekEntryResult!4552 0))(
  ( (MissingZero!4552 (index!20432 (_ BitVec 32))) (Found!4552 (index!20433 (_ BitVec 32))) (Intermediate!4552 (undefined!5364 Bool) (index!20434 (_ BitVec 32)) (x!49547 (_ BitVec 32))) (Undefined!4552) (MissingVacant!4552 (index!20435 (_ BitVec 32))) )
))
(declare-fun lt!244626 () SeekEntryResult!4552)

(assert (=> b!530175 (= res!325945 (or (and (not lt!244632) (undefined!5364 lt!244626)) (and (not lt!244632) (not (undefined!5364 lt!244626)))))))

(get-info :version)

(assert (=> b!530175 (= lt!244632 (not ((_ is Intermediate!4552) lt!244626)))))

(declare-fun b!530176 () Bool)

(declare-fun res!325940 () Bool)

(declare-fun e!308913 () Bool)

(assert (=> b!530176 (=> (not res!325940) (not e!308913))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!530176 (= res!325940 (validKeyInArray!0 k0!2280))))

(declare-fun b!530177 () Bool)

(declare-fun e!308912 () Bool)

(assert (=> b!530177 (= e!308912 (not e!308916))))

(declare-fun res!325936 () Bool)

(assert (=> b!530177 (=> res!325936 e!308916)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!244627 () (_ BitVec 64))

(declare-datatypes ((array!33565 0))(
  ( (array!33566 (arr!16129 (Array (_ BitVec 32) (_ BitVec 64))) (size!16493 (_ BitVec 32))) )
))
(declare-fun lt!244625 () array!33565)

(declare-fun lt!244633 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33565 (_ BitVec 32)) SeekEntryResult!4552)

(assert (=> b!530177 (= res!325936 (= lt!244626 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244633 lt!244627 lt!244625 mask!3524)))))

(declare-fun a!3235 () array!33565)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!244629 () (_ BitVec 32))

(assert (=> b!530177 (= lt!244626 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244629 (select (arr!16129 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!530177 (= lt!244633 (toIndex!0 lt!244627 mask!3524))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!530177 (= lt!244627 (select (store (arr!16129 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!530177 (= lt!244629 (toIndex!0 (select (arr!16129 a!3235) j!176) mask!3524))))

(assert (=> b!530177 (= lt!244625 (array!33566 (store (arr!16129 a!3235) i!1204 k0!2280) (size!16493 a!3235)))))

(declare-fun e!308915 () Bool)

(assert (=> b!530177 e!308915))

(declare-fun res!325935 () Bool)

(assert (=> b!530177 (=> (not res!325935) (not e!308915))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33565 (_ BitVec 32)) Bool)

(assert (=> b!530177 (= res!325935 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16777 0))(
  ( (Unit!16778) )
))
(declare-fun lt!244628 () Unit!16777)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33565 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16777)

(assert (=> b!530177 (= lt!244628 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!530178 () Bool)

(assert (=> b!530178 (= e!308911 true)))

(declare-fun lt!244630 () SeekEntryResult!4552)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33565 (_ BitVec 32)) SeekEntryResult!4552)

(assert (=> b!530178 (= lt!244630 (seekEntryOrOpen!0 lt!244627 lt!244625 mask!3524))))

(assert (=> b!530178 false))

(declare-fun res!325942 () Bool)

(assert (=> start!48128 (=> (not res!325942) (not e!308913))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48128 (= res!325942 (validMask!0 mask!3524))))

(assert (=> start!48128 e!308913))

(assert (=> start!48128 true))

(declare-fun array_inv!11988 (array!33565) Bool)

(assert (=> start!48128 (array_inv!11988 a!3235)))

(declare-fun b!530179 () Bool)

(declare-fun res!325939 () Bool)

(assert (=> b!530179 (=> (not res!325939) (not e!308913))))

(declare-fun arrayContainsKey!0 (array!33565 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!530179 (= res!325939 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!530180 () Bool)

(declare-fun res!325944 () Bool)

(assert (=> b!530180 (=> (not res!325944) (not e!308913))))

(assert (=> b!530180 (= res!325944 (validKeyInArray!0 (select (arr!16129 a!3235) j!176)))))

(declare-fun b!530181 () Bool)

(declare-fun res!325938 () Bool)

(assert (=> b!530181 (=> (not res!325938) (not e!308912))))

(declare-datatypes ((List!10194 0))(
  ( (Nil!10191) (Cons!10190 (h!11130 (_ BitVec 64)) (t!16414 List!10194)) )
))
(declare-fun arrayNoDuplicates!0 (array!33565 (_ BitVec 32) List!10194) Bool)

(assert (=> b!530181 (= res!325938 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10191))))

(declare-fun b!530182 () Bool)

(assert (=> b!530182 (= e!308915 (= (seekEntryOrOpen!0 (select (arr!16129 a!3235) j!176) a!3235 mask!3524) (Found!4552 j!176)))))

(declare-fun b!530183 () Bool)

(assert (=> b!530183 (= e!308913 e!308912)))

(declare-fun res!325937 () Bool)

(assert (=> b!530183 (=> (not res!325937) (not e!308912))))

(declare-fun lt!244631 () SeekEntryResult!4552)

(assert (=> b!530183 (= res!325937 (or (= lt!244631 (MissingZero!4552 i!1204)) (= lt!244631 (MissingVacant!4552 i!1204))))))

(assert (=> b!530183 (= lt!244631 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!530184 () Bool)

(declare-fun res!325943 () Bool)

(assert (=> b!530184 (=> (not res!325943) (not e!308912))))

(assert (=> b!530184 (= res!325943 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!530185 () Bool)

(declare-fun res!325941 () Bool)

(assert (=> b!530185 (=> (not res!325941) (not e!308913))))

(assert (=> b!530185 (= res!325941 (and (= (size!16493 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16493 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16493 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!48128 res!325942) b!530185))

(assert (= (and b!530185 res!325941) b!530180))

(assert (= (and b!530180 res!325944) b!530176))

(assert (= (and b!530176 res!325940) b!530179))

(assert (= (and b!530179 res!325939) b!530183))

(assert (= (and b!530183 res!325937) b!530184))

(assert (= (and b!530184 res!325943) b!530181))

(assert (= (and b!530181 res!325938) b!530177))

(assert (= (and b!530177 res!325935) b!530182))

(assert (= (and b!530177 (not res!325936)) b!530175))

(assert (= (and b!530175 (not res!325945)) b!530178))

(declare-fun m!510973 () Bool)

(assert (=> start!48128 m!510973))

(declare-fun m!510975 () Bool)

(assert (=> start!48128 m!510975))

(declare-fun m!510977 () Bool)

(assert (=> b!530180 m!510977))

(assert (=> b!530180 m!510977))

(declare-fun m!510979 () Bool)

(assert (=> b!530180 m!510979))

(declare-fun m!510981 () Bool)

(assert (=> b!530177 m!510981))

(declare-fun m!510983 () Bool)

(assert (=> b!530177 m!510983))

(declare-fun m!510985 () Bool)

(assert (=> b!530177 m!510985))

(declare-fun m!510987 () Bool)

(assert (=> b!530177 m!510987))

(declare-fun m!510989 () Bool)

(assert (=> b!530177 m!510989))

(assert (=> b!530177 m!510977))

(declare-fun m!510991 () Bool)

(assert (=> b!530177 m!510991))

(assert (=> b!530177 m!510977))

(declare-fun m!510993 () Bool)

(assert (=> b!530177 m!510993))

(assert (=> b!530177 m!510977))

(declare-fun m!510995 () Bool)

(assert (=> b!530177 m!510995))

(declare-fun m!510997 () Bool)

(assert (=> b!530184 m!510997))

(assert (=> b!530182 m!510977))

(assert (=> b!530182 m!510977))

(declare-fun m!510999 () Bool)

(assert (=> b!530182 m!510999))

(declare-fun m!511001 () Bool)

(assert (=> b!530176 m!511001))

(declare-fun m!511003 () Bool)

(assert (=> b!530178 m!511003))

(declare-fun m!511005 () Bool)

(assert (=> b!530183 m!511005))

(declare-fun m!511007 () Bool)

(assert (=> b!530181 m!511007))

(declare-fun m!511009 () Bool)

(assert (=> b!530179 m!511009))

(check-sat (not b!530177) (not b!530182) (not b!530184) (not start!48128) (not b!530178) (not b!530181) (not b!530180) (not b!530179) (not b!530176) (not b!530183))
(check-sat)
