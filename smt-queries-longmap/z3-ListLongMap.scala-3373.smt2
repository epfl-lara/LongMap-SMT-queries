; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46400 () Bool)

(assert start!46400)

(declare-fun b!513363 () Bool)

(declare-fun res!313721 () Bool)

(declare-fun e!299777 () Bool)

(assert (=> b!513363 (=> (not res!313721) (not e!299777))))

(declare-datatypes ((array!32941 0))(
  ( (array!32942 (arr!15844 (Array (_ BitVec 32) (_ BitVec 64))) (size!16208 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32941)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32941 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!513363 (= res!313721 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!513364 () Bool)

(declare-fun e!299781 () Bool)

(assert (=> b!513364 (= e!299777 e!299781)))

(declare-fun res!313713 () Bool)

(assert (=> b!513364 (=> (not res!313713) (not e!299781))))

(declare-datatypes ((SeekEntryResult!4267 0))(
  ( (MissingZero!4267 (index!19256 (_ BitVec 32))) (Found!4267 (index!19257 (_ BitVec 32))) (Intermediate!4267 (undefined!5079 Bool) (index!19258 (_ BitVec 32)) (x!48355 (_ BitVec 32))) (Undefined!4267) (MissingVacant!4267 (index!19259 (_ BitVec 32))) )
))
(declare-fun lt!235075 () SeekEntryResult!4267)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!513364 (= res!313713 (or (= lt!235075 (MissingZero!4267 i!1204)) (= lt!235075 (MissingVacant!4267 i!1204))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32941 (_ BitVec 32)) SeekEntryResult!4267)

(assert (=> b!513364 (= lt!235075 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!513365 () Bool)

(declare-fun res!313720 () Bool)

(assert (=> b!513365 (=> (not res!313720) (not e!299781))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32941 (_ BitVec 32)) Bool)

(assert (=> b!513365 (= res!313720 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!513366 () Bool)

(declare-fun res!313717 () Bool)

(assert (=> b!513366 (=> (not res!313717) (not e!299777))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!513366 (= res!313717 (and (= (size!16208 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16208 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16208 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!513368 () Bool)

(declare-fun e!299780 () Bool)

(assert (=> b!513368 (= e!299780 true)))

(declare-fun lt!235073 () SeekEntryResult!4267)

(assert (=> b!513368 (bvslt (x!48355 lt!235073) #b01111111111111111111111111111110)))

(declare-fun b!513369 () Bool)

(declare-fun res!313714 () Bool)

(assert (=> b!513369 (=> res!313714 e!299780)))

(get-info :version)

(assert (=> b!513369 (= res!313714 (or (undefined!5079 lt!235073) (not ((_ is Intermediate!4267) lt!235073))))))

(declare-fun b!513370 () Bool)

(declare-fun res!313715 () Bool)

(assert (=> b!513370 (=> (not res!313715) (not e!299781))))

(declare-datatypes ((List!9909 0))(
  ( (Nil!9906) (Cons!9905 (h!10791 (_ BitVec 64)) (t!16129 List!9909)) )
))
(declare-fun arrayNoDuplicates!0 (array!32941 (_ BitVec 32) List!9909) Bool)

(assert (=> b!513370 (= res!313715 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9906))))

(declare-fun b!513371 () Bool)

(declare-fun res!313723 () Bool)

(assert (=> b!513371 (=> (not res!313723) (not e!299777))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!513371 (= res!313723 (validKeyInArray!0 (select (arr!15844 a!3235) j!176)))))

(declare-fun b!513372 () Bool)

(declare-fun res!313722 () Bool)

(assert (=> b!513372 (=> (not res!313722) (not e!299777))))

(assert (=> b!513372 (= res!313722 (validKeyInArray!0 k0!2280))))

(declare-fun e!299778 () Bool)

(declare-fun b!513373 () Bool)

(assert (=> b!513373 (= e!299778 (= (seekEntryOrOpen!0 (select (arr!15844 a!3235) j!176) a!3235 mask!3524) (Found!4267 j!176)))))

(declare-fun res!313719 () Bool)

(assert (=> start!46400 (=> (not res!313719) (not e!299777))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46400 (= res!313719 (validMask!0 mask!3524))))

(assert (=> start!46400 e!299777))

(assert (=> start!46400 true))

(declare-fun array_inv!11703 (array!32941) Bool)

(assert (=> start!46400 (array_inv!11703 a!3235)))

(declare-fun b!513367 () Bool)

(assert (=> b!513367 (= e!299781 (not e!299780))))

(declare-fun res!313716 () Bool)

(assert (=> b!513367 (=> res!313716 e!299780)))

(declare-fun lt!235071 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32941 (_ BitVec 32)) SeekEntryResult!4267)

(assert (=> b!513367 (= res!313716 (= lt!235073 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235071 (select (store (arr!15844 a!3235) i!1204 k0!2280) j!176) (array!32942 (store (arr!15844 a!3235) i!1204 k0!2280) (size!16208 a!3235)) mask!3524)))))

(declare-fun lt!235072 () (_ BitVec 32))

(assert (=> b!513367 (= lt!235073 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235072 (select (arr!15844 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!513367 (= lt!235071 (toIndex!0 (select (store (arr!15844 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!513367 (= lt!235072 (toIndex!0 (select (arr!15844 a!3235) j!176) mask!3524))))

(assert (=> b!513367 e!299778))

(declare-fun res!313718 () Bool)

(assert (=> b!513367 (=> (not res!313718) (not e!299778))))

(assert (=> b!513367 (= res!313718 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15853 0))(
  ( (Unit!15854) )
))
(declare-fun lt!235074 () Unit!15853)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32941 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15853)

(assert (=> b!513367 (= lt!235074 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!46400 res!313719) b!513366))

(assert (= (and b!513366 res!313717) b!513371))

(assert (= (and b!513371 res!313723) b!513372))

(assert (= (and b!513372 res!313722) b!513363))

(assert (= (and b!513363 res!313721) b!513364))

(assert (= (and b!513364 res!313713) b!513365))

(assert (= (and b!513365 res!313720) b!513370))

(assert (= (and b!513370 res!313715) b!513367))

(assert (= (and b!513367 res!313718) b!513373))

(assert (= (and b!513367 (not res!313716)) b!513369))

(assert (= (and b!513369 (not res!313714)) b!513368))

(declare-fun m!495169 () Bool)

(assert (=> b!513364 m!495169))

(declare-fun m!495171 () Bool)

(assert (=> b!513372 m!495171))

(declare-fun m!495173 () Bool)

(assert (=> b!513367 m!495173))

(declare-fun m!495175 () Bool)

(assert (=> b!513367 m!495175))

(declare-fun m!495177 () Bool)

(assert (=> b!513367 m!495177))

(declare-fun m!495179 () Bool)

(assert (=> b!513367 m!495179))

(declare-fun m!495181 () Bool)

(assert (=> b!513367 m!495181))

(assert (=> b!513367 m!495173))

(declare-fun m!495183 () Bool)

(assert (=> b!513367 m!495183))

(assert (=> b!513367 m!495181))

(declare-fun m!495185 () Bool)

(assert (=> b!513367 m!495185))

(assert (=> b!513367 m!495173))

(declare-fun m!495187 () Bool)

(assert (=> b!513367 m!495187))

(assert (=> b!513367 m!495181))

(declare-fun m!495189 () Bool)

(assert (=> b!513367 m!495189))

(declare-fun m!495191 () Bool)

(assert (=> b!513365 m!495191))

(assert (=> b!513371 m!495173))

(assert (=> b!513371 m!495173))

(declare-fun m!495193 () Bool)

(assert (=> b!513371 m!495193))

(declare-fun m!495195 () Bool)

(assert (=> start!46400 m!495195))

(declare-fun m!495197 () Bool)

(assert (=> start!46400 m!495197))

(declare-fun m!495199 () Bool)

(assert (=> b!513370 m!495199))

(assert (=> b!513373 m!495173))

(assert (=> b!513373 m!495173))

(declare-fun m!495201 () Bool)

(assert (=> b!513373 m!495201))

(declare-fun m!495203 () Bool)

(assert (=> b!513363 m!495203))

(check-sat (not b!513363) (not b!513364) (not b!513367) (not start!46400) (not b!513365) (not b!513372) (not b!513373) (not b!513371) (not b!513370))
(check-sat)
