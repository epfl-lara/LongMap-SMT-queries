; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46718 () Bool)

(assert start!46718)

(declare-fun b!515710 () Bool)

(declare-fun res!315281 () Bool)

(declare-fun e!301072 () Bool)

(assert (=> b!515710 (=> res!315281 e!301072)))

(declare-datatypes ((SeekEntryResult!4350 0))(
  ( (MissingZero!4350 (index!19588 (_ BitVec 32))) (Found!4350 (index!19589 (_ BitVec 32))) (Intermediate!4350 (undefined!5162 Bool) (index!19590 (_ BitVec 32)) (x!48553 (_ BitVec 32))) (Undefined!4350) (MissingVacant!4350 (index!19591 (_ BitVec 32))) )
))
(declare-fun lt!236085 () SeekEntryResult!4350)

(get-info :version)

(assert (=> b!515710 (= res!315281 (or (undefined!5162 lt!236085) (not ((_ is Intermediate!4350) lt!236085))))))

(declare-fun b!515711 () Bool)

(declare-fun res!315279 () Bool)

(declare-fun e!301074 () Bool)

(assert (=> b!515711 (=> (not res!315279) (not e!301074))))

(declare-datatypes ((array!33030 0))(
  ( (array!33031 (arr!15883 (Array (_ BitVec 32) (_ BitVec 64))) (size!16247 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33030)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33030 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!515711 (= res!315279 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun e!301071 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun b!515712 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33030 (_ BitVec 32)) SeekEntryResult!4350)

(assert (=> b!515712 (= e!301071 (= (seekEntryOrOpen!0 (select (arr!15883 a!3235) j!176) a!3235 mask!3524) (Found!4350 j!176)))))

(declare-fun b!515713 () Bool)

(declare-fun res!315284 () Bool)

(declare-fun e!301070 () Bool)

(assert (=> b!515713 (=> (not res!315284) (not e!301070))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33030 (_ BitVec 32)) Bool)

(assert (=> b!515713 (= res!315284 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!515715 () Bool)

(declare-fun res!315275 () Bool)

(assert (=> b!515715 (=> (not res!315275) (not e!301074))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!515715 (= res!315275 (validKeyInArray!0 (select (arr!15883 a!3235) j!176)))))

(declare-fun b!515716 () Bool)

(declare-fun res!315282 () Bool)

(assert (=> b!515716 (=> (not res!315282) (not e!301074))))

(assert (=> b!515716 (= res!315282 (validKeyInArray!0 k0!2280))))

(declare-fun b!515717 () Bool)

(assert (=> b!515717 (= e!301070 (not e!301072))))

(declare-fun res!315283 () Bool)

(assert (=> b!515717 (=> res!315283 e!301072)))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!236089 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33030 (_ BitVec 32)) SeekEntryResult!4350)

(assert (=> b!515717 (= res!315283 (= lt!236085 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236089 (select (store (arr!15883 a!3235) i!1204 k0!2280) j!176) (array!33031 (store (arr!15883 a!3235) i!1204 k0!2280) (size!16247 a!3235)) mask!3524)))))

(declare-fun lt!236088 () (_ BitVec 32))

(assert (=> b!515717 (= lt!236085 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236088 (select (arr!15883 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!515717 (= lt!236089 (toIndex!0 (select (store (arr!15883 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!515717 (= lt!236088 (toIndex!0 (select (arr!15883 a!3235) j!176) mask!3524))))

(assert (=> b!515717 e!301071))

(declare-fun res!315274 () Bool)

(assert (=> b!515717 (=> (not res!315274) (not e!301071))))

(assert (=> b!515717 (= res!315274 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15958 0))(
  ( (Unit!15959) )
))
(declare-fun lt!236087 () Unit!15958)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33030 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15958)

(assert (=> b!515717 (= lt!236087 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!515718 () Bool)

(declare-fun res!315277 () Bool)

(assert (=> b!515718 (=> (not res!315277) (not e!301074))))

(assert (=> b!515718 (= res!315277 (and (= (size!16247 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16247 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16247 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!515714 () Bool)

(declare-fun res!315278 () Bool)

(assert (=> b!515714 (=> (not res!315278) (not e!301070))))

(declare-datatypes ((List!10041 0))(
  ( (Nil!10038) (Cons!10037 (h!10935 (_ BitVec 64)) (t!16269 List!10041)) )
))
(declare-fun arrayNoDuplicates!0 (array!33030 (_ BitVec 32) List!10041) Bool)

(assert (=> b!515714 (= res!315278 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10038))))

(declare-fun res!315280 () Bool)

(assert (=> start!46718 (=> (not res!315280) (not e!301074))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46718 (= res!315280 (validMask!0 mask!3524))))

(assert (=> start!46718 e!301074))

(assert (=> start!46718 true))

(declare-fun array_inv!11679 (array!33030) Bool)

(assert (=> start!46718 (array_inv!11679 a!3235)))

(declare-fun b!515719 () Bool)

(assert (=> b!515719 (= e!301074 e!301070)))

(declare-fun res!315276 () Bool)

(assert (=> b!515719 (=> (not res!315276) (not e!301070))))

(declare-fun lt!236086 () SeekEntryResult!4350)

(assert (=> b!515719 (= res!315276 (or (= lt!236086 (MissingZero!4350 i!1204)) (= lt!236086 (MissingVacant!4350 i!1204))))))

(assert (=> b!515719 (= lt!236086 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!515720 () Bool)

(assert (=> b!515720 (= e!301072 true)))

(assert (=> b!515720 (and (bvslt (x!48553 lt!236085) #b01111111111111111111111111111110) (or (= (select (arr!15883 a!3235) (index!19590 lt!236085)) (select (arr!15883 a!3235) j!176)) (= (select (arr!15883 a!3235) (index!19590 lt!236085)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15883 a!3235) (index!19590 lt!236085)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!46718 res!315280) b!515718))

(assert (= (and b!515718 res!315277) b!515715))

(assert (= (and b!515715 res!315275) b!515716))

(assert (= (and b!515716 res!315282) b!515711))

(assert (= (and b!515711 res!315279) b!515719))

(assert (= (and b!515719 res!315276) b!515713))

(assert (= (and b!515713 res!315284) b!515714))

(assert (= (and b!515714 res!315278) b!515717))

(assert (= (and b!515717 res!315274) b!515712))

(assert (= (and b!515717 (not res!315283)) b!515710))

(assert (= (and b!515710 (not res!315281)) b!515720))

(declare-fun m!497087 () Bool)

(assert (=> b!515711 m!497087))

(declare-fun m!497089 () Bool)

(assert (=> b!515712 m!497089))

(assert (=> b!515712 m!497089))

(declare-fun m!497091 () Bool)

(assert (=> b!515712 m!497091))

(declare-fun m!497093 () Bool)

(assert (=> b!515717 m!497093))

(declare-fun m!497095 () Bool)

(assert (=> b!515717 m!497095))

(declare-fun m!497097 () Bool)

(assert (=> b!515717 m!497097))

(assert (=> b!515717 m!497097))

(declare-fun m!497099 () Bool)

(assert (=> b!515717 m!497099))

(assert (=> b!515717 m!497089))

(declare-fun m!497101 () Bool)

(assert (=> b!515717 m!497101))

(assert (=> b!515717 m!497089))

(declare-fun m!497103 () Bool)

(assert (=> b!515717 m!497103))

(assert (=> b!515717 m!497089))

(declare-fun m!497105 () Bool)

(assert (=> b!515717 m!497105))

(assert (=> b!515717 m!497097))

(declare-fun m!497107 () Bool)

(assert (=> b!515717 m!497107))

(declare-fun m!497109 () Bool)

(assert (=> b!515719 m!497109))

(declare-fun m!497111 () Bool)

(assert (=> start!46718 m!497111))

(declare-fun m!497113 () Bool)

(assert (=> start!46718 m!497113))

(declare-fun m!497115 () Bool)

(assert (=> b!515714 m!497115))

(assert (=> b!515715 m!497089))

(assert (=> b!515715 m!497089))

(declare-fun m!497117 () Bool)

(assert (=> b!515715 m!497117))

(declare-fun m!497119 () Bool)

(assert (=> b!515720 m!497119))

(assert (=> b!515720 m!497089))

(declare-fun m!497121 () Bool)

(assert (=> b!515713 m!497121))

(declare-fun m!497123 () Bool)

(assert (=> b!515716 m!497123))

(check-sat (not b!515719) (not b!515713) (not b!515714) (not b!515711) (not start!46718) (not b!515717) (not b!515712) (not b!515716) (not b!515715))
(check-sat)
