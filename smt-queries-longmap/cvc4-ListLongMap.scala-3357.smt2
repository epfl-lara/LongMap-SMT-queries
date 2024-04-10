; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46198 () Bool)

(assert start!46198)

(declare-fun b!511460 () Bool)

(declare-fun res!312122 () Bool)

(declare-fun e!298873 () Bool)

(assert (=> b!511460 (=> res!312122 e!298873)))

(declare-datatypes ((SeekEntryResult!4270 0))(
  ( (MissingZero!4270 (index!19268 (_ BitVec 32))) (Found!4270 (index!19269 (_ BitVec 32))) (Intermediate!4270 (undefined!5082 Bool) (index!19270 (_ BitVec 32)) (x!48221 (_ BitVec 32))) (Undefined!4270) (MissingVacant!4270 (index!19271 (_ BitVec 32))) )
))
(declare-fun lt!233998 () SeekEntryResult!4270)

(assert (=> b!511460 (= res!312122 (or (not (is-Intermediate!4270 lt!233998)) (not (undefined!5082 lt!233998))))))

(declare-fun b!511461 () Bool)

(declare-fun e!298874 () Bool)

(declare-fun e!298872 () Bool)

(assert (=> b!511461 (= e!298874 e!298872)))

(declare-fun res!312129 () Bool)

(assert (=> b!511461 (=> (not res!312129) (not e!298872))))

(declare-fun lt!233993 () SeekEntryResult!4270)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!511461 (= res!312129 (or (= lt!233993 (MissingZero!4270 i!1204)) (= lt!233993 (MissingVacant!4270 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32852 0))(
  ( (array!32853 (arr!15803 (Array (_ BitVec 32) (_ BitVec 64))) (size!16167 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32852)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32852 (_ BitVec 32)) SeekEntryResult!4270)

(assert (=> b!511461 (= lt!233993 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!511462 () Bool)

(assert (=> b!511462 (= e!298873 true)))

(declare-fun lt!233996 () SeekEntryResult!4270)

(assert (=> b!511462 (= lt!233996 Undefined!4270)))

(declare-fun res!312124 () Bool)

(assert (=> start!46198 (=> (not res!312124) (not e!298874))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46198 (= res!312124 (validMask!0 mask!3524))))

(assert (=> start!46198 e!298874))

(assert (=> start!46198 true))

(declare-fun array_inv!11599 (array!32852) Bool)

(assert (=> start!46198 (array_inv!11599 a!3235)))

(declare-fun b!511463 () Bool)

(declare-fun res!312128 () Bool)

(assert (=> b!511463 (=> (not res!312128) (not e!298874))))

(declare-fun arrayContainsKey!0 (array!32852 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!511463 (= res!312128 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!511464 () Bool)

(declare-fun res!312130 () Bool)

(assert (=> b!511464 (=> (not res!312130) (not e!298874))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!511464 (= res!312130 (validKeyInArray!0 k!2280))))

(declare-fun b!511465 () Bool)

(declare-fun res!312127 () Bool)

(assert (=> b!511465 (=> (not res!312127) (not e!298874))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!511465 (= res!312127 (validKeyInArray!0 (select (arr!15803 a!3235) j!176)))))

(declare-fun b!511466 () Bool)

(declare-fun res!312126 () Bool)

(assert (=> b!511466 (=> (not res!312126) (not e!298872))))

(declare-datatypes ((List!9961 0))(
  ( (Nil!9958) (Cons!9957 (h!10837 (_ BitVec 64)) (t!16189 List!9961)) )
))
(declare-fun arrayNoDuplicates!0 (array!32852 (_ BitVec 32) List!9961) Bool)

(assert (=> b!511466 (= res!312126 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9958))))

(declare-fun b!511467 () Bool)

(declare-fun res!312123 () Bool)

(assert (=> b!511467 (=> (not res!312123) (not e!298872))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32852 (_ BitVec 32)) Bool)

(assert (=> b!511467 (= res!312123 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!511468 () Bool)

(assert (=> b!511468 (= e!298872 (not e!298873))))

(declare-fun res!312131 () Bool)

(assert (=> b!511468 (=> res!312131 e!298873)))

(declare-fun lt!233994 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32852 (_ BitVec 32)) SeekEntryResult!4270)

(assert (=> b!511468 (= res!312131 (= lt!233998 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233994 (select (store (arr!15803 a!3235) i!1204 k!2280) j!176) (array!32853 (store (arr!15803 a!3235) i!1204 k!2280) (size!16167 a!3235)) mask!3524)))))

(declare-fun lt!233997 () (_ BitVec 32))

(assert (=> b!511468 (= lt!233998 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233997 (select (arr!15803 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!511468 (= lt!233994 (toIndex!0 (select (store (arr!15803 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!511468 (= lt!233997 (toIndex!0 (select (arr!15803 a!3235) j!176) mask!3524))))

(assert (=> b!511468 (= lt!233996 (Found!4270 j!176))))

(assert (=> b!511468 (= lt!233996 (seekEntryOrOpen!0 (select (arr!15803 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!511468 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15798 0))(
  ( (Unit!15799) )
))
(declare-fun lt!233995 () Unit!15798)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32852 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15798)

(assert (=> b!511468 (= lt!233995 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!511469 () Bool)

(declare-fun res!312125 () Bool)

(assert (=> b!511469 (=> (not res!312125) (not e!298874))))

(assert (=> b!511469 (= res!312125 (and (= (size!16167 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16167 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16167 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!46198 res!312124) b!511469))

(assert (= (and b!511469 res!312125) b!511465))

(assert (= (and b!511465 res!312127) b!511464))

(assert (= (and b!511464 res!312130) b!511463))

(assert (= (and b!511463 res!312128) b!511461))

(assert (= (and b!511461 res!312129) b!511467))

(assert (= (and b!511467 res!312123) b!511466))

(assert (= (and b!511466 res!312126) b!511468))

(assert (= (and b!511468 (not res!312131)) b!511460))

(assert (= (and b!511460 (not res!312122)) b!511462))

(declare-fun m!492921 () Bool)

(assert (=> b!511466 m!492921))

(declare-fun m!492923 () Bool)

(assert (=> b!511463 m!492923))

(declare-fun m!492925 () Bool)

(assert (=> b!511467 m!492925))

(declare-fun m!492927 () Bool)

(assert (=> b!511465 m!492927))

(assert (=> b!511465 m!492927))

(declare-fun m!492929 () Bool)

(assert (=> b!511465 m!492929))

(declare-fun m!492931 () Bool)

(assert (=> start!46198 m!492931))

(declare-fun m!492933 () Bool)

(assert (=> start!46198 m!492933))

(declare-fun m!492935 () Bool)

(assert (=> b!511461 m!492935))

(declare-fun m!492937 () Bool)

(assert (=> b!511468 m!492937))

(declare-fun m!492939 () Bool)

(assert (=> b!511468 m!492939))

(declare-fun m!492941 () Bool)

(assert (=> b!511468 m!492941))

(assert (=> b!511468 m!492941))

(declare-fun m!492943 () Bool)

(assert (=> b!511468 m!492943))

(assert (=> b!511468 m!492927))

(declare-fun m!492945 () Bool)

(assert (=> b!511468 m!492945))

(assert (=> b!511468 m!492927))

(declare-fun m!492947 () Bool)

(assert (=> b!511468 m!492947))

(assert (=> b!511468 m!492927))

(declare-fun m!492949 () Bool)

(assert (=> b!511468 m!492949))

(assert (=> b!511468 m!492927))

(declare-fun m!492951 () Bool)

(assert (=> b!511468 m!492951))

(assert (=> b!511468 m!492941))

(declare-fun m!492953 () Bool)

(assert (=> b!511468 m!492953))

(declare-fun m!492955 () Bool)

(assert (=> b!511464 m!492955))

(push 1)

