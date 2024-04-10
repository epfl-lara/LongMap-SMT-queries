; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68750 () Bool)

(assert start!68750)

(declare-fun b!800952 () Bool)

(declare-fun res!545480 () Bool)

(declare-fun e!444027 () Bool)

(assert (=> b!800952 (=> (not res!545480) (not e!444027))))

(declare-datatypes ((array!43540 0))(
  ( (array!43541 (arr!20850 (Array (_ BitVec 32) (_ BitVec 64))) (size!21271 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43540)

(declare-datatypes ((List!14813 0))(
  ( (Nil!14810) (Cons!14809 (h!15938 (_ BitVec 64)) (t!21128 List!14813)) )
))
(declare-fun arrayNoDuplicates!0 (array!43540 (_ BitVec 32) List!14813) Bool)

(assert (=> b!800952 (= res!545480 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14810))))

(declare-fun b!800953 () Bool)

(declare-fun res!545472 () Bool)

(declare-fun e!444030 () Bool)

(assert (=> b!800953 (=> (not res!545472) (not e!444030))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!800953 (= res!545472 (validKeyInArray!0 k!2044))))

(declare-fun b!800954 () Bool)

(declare-fun res!545478 () Bool)

(assert (=> b!800954 (=> (not res!545478) (not e!444030))))

(declare-fun arrayContainsKey!0 (array!43540 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!800954 (= res!545478 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!800955 () Bool)

(declare-fun res!545475 () Bool)

(assert (=> b!800955 (=> (not res!545475) (not e!444030))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!800955 (= res!545475 (and (= (size!21271 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21271 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21271 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!800956 () Bool)

(declare-fun res!545477 () Bool)

(assert (=> b!800956 (=> (not res!545477) (not e!444030))))

(assert (=> b!800956 (= res!545477 (validKeyInArray!0 (select (arr!20850 a!3170) j!153)))))

(declare-fun b!800957 () Bool)

(declare-fun e!444028 () Bool)

(declare-fun e!444029 () Bool)

(assert (=> b!800957 (= e!444028 e!444029)))

(declare-fun res!545471 () Bool)

(assert (=> b!800957 (=> (not res!545471) (not e!444029))))

(declare-datatypes ((SeekEntryResult!8441 0))(
  ( (MissingZero!8441 (index!36132 (_ BitVec 32))) (Found!8441 (index!36133 (_ BitVec 32))) (Intermediate!8441 (undefined!9253 Bool) (index!36134 (_ BitVec 32)) (x!66999 (_ BitVec 32))) (Undefined!8441) (MissingVacant!8441 (index!36135 (_ BitVec 32))) )
))
(declare-fun lt!357925 () SeekEntryResult!8441)

(declare-fun lt!357929 () SeekEntryResult!8441)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!800957 (= res!545471 (and (= lt!357925 lt!357929) (= lt!357929 (Found!8441 j!153)) (not (= (select (arr!20850 a!3170) index!1236) (select (arr!20850 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43540 (_ BitVec 32)) SeekEntryResult!8441)

(assert (=> b!800957 (= lt!357929 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20850 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43540 (_ BitVec 32)) SeekEntryResult!8441)

(assert (=> b!800957 (= lt!357925 (seekEntryOrOpen!0 (select (arr!20850 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!800958 () Bool)

(declare-fun e!444032 () Bool)

(assert (=> b!800958 (= e!444029 e!444032)))

(declare-fun res!545481 () Bool)

(assert (=> b!800958 (=> (not res!545481) (not e!444032))))

(declare-fun lt!357922 () (_ BitVec 32))

(assert (=> b!800958 (= res!545481 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!357922 #b00000000000000000000000000000000) (bvslt lt!357922 (size!21271 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!800958 (= lt!357922 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun res!545479 () Bool)

(assert (=> start!68750 (=> (not res!545479) (not e!444030))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68750 (= res!545479 (validMask!0 mask!3266))))

(assert (=> start!68750 e!444030))

(assert (=> start!68750 true))

(declare-fun array_inv!16646 (array!43540) Bool)

(assert (=> start!68750 (array_inv!16646 a!3170)))

(declare-fun b!800959 () Bool)

(declare-fun res!545482 () Bool)

(assert (=> b!800959 (=> (not res!545482) (not e!444027))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43540 (_ BitVec 32)) Bool)

(assert (=> b!800959 (= res!545482 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!800960 () Bool)

(declare-fun res!545473 () Bool)

(assert (=> b!800960 (=> (not res!545473) (not e!444032))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!357928 () (_ BitVec 64))

(declare-fun lt!357926 () SeekEntryResult!8441)

(declare-fun lt!357923 () array!43540)

(assert (=> b!800960 (= res!545473 (= lt!357926 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357922 vacantAfter!23 lt!357928 lt!357923 mask!3266)))))

(declare-fun b!800961 () Bool)

(assert (=> b!800961 (= e!444027 e!444028)))

(declare-fun res!545476 () Bool)

(assert (=> b!800961 (=> (not res!545476) (not e!444028))))

(assert (=> b!800961 (= res!545476 (= lt!357926 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!357928 lt!357923 mask!3266)))))

(assert (=> b!800961 (= lt!357926 (seekEntryOrOpen!0 lt!357928 lt!357923 mask!3266))))

(assert (=> b!800961 (= lt!357928 (select (store (arr!20850 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!800961 (= lt!357923 (array!43541 (store (arr!20850 a!3170) i!1163 k!2044) (size!21271 a!3170)))))

(declare-fun b!800962 () Bool)

(assert (=> b!800962 (= e!444030 e!444027)))

(declare-fun res!545474 () Bool)

(assert (=> b!800962 (=> (not res!545474) (not e!444027))))

(declare-fun lt!357927 () SeekEntryResult!8441)

(assert (=> b!800962 (= res!545474 (or (= lt!357927 (MissingZero!8441 i!1163)) (= lt!357927 (MissingVacant!8441 i!1163))))))

(assert (=> b!800962 (= lt!357927 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!800963 () Bool)

(assert (=> b!800963 (= e!444032 false)))

(declare-fun lt!357924 () SeekEntryResult!8441)

(assert (=> b!800963 (= lt!357924 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357922 vacantBefore!23 (select (arr!20850 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!800964 () Bool)

(declare-fun res!545483 () Bool)

(assert (=> b!800964 (=> (not res!545483) (not e!444027))))

(assert (=> b!800964 (= res!545483 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21271 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20850 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21271 a!3170)) (= (select (arr!20850 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(assert (= (and start!68750 res!545479) b!800955))

(assert (= (and b!800955 res!545475) b!800956))

(assert (= (and b!800956 res!545477) b!800953))

(assert (= (and b!800953 res!545472) b!800954))

(assert (= (and b!800954 res!545478) b!800962))

(assert (= (and b!800962 res!545474) b!800959))

(assert (= (and b!800959 res!545482) b!800952))

(assert (= (and b!800952 res!545480) b!800964))

(assert (= (and b!800964 res!545483) b!800961))

(assert (= (and b!800961 res!545476) b!800957))

(assert (= (and b!800957 res!545471) b!800958))

(assert (= (and b!800958 res!545481) b!800960))

(assert (= (and b!800960 res!545473) b!800963))

(declare-fun m!742079 () Bool)

(assert (=> b!800961 m!742079))

(declare-fun m!742081 () Bool)

(assert (=> b!800961 m!742081))

(declare-fun m!742083 () Bool)

(assert (=> b!800961 m!742083))

(declare-fun m!742085 () Bool)

(assert (=> b!800961 m!742085))

(declare-fun m!742087 () Bool)

(assert (=> b!800957 m!742087))

(declare-fun m!742089 () Bool)

(assert (=> b!800957 m!742089))

(assert (=> b!800957 m!742089))

(declare-fun m!742091 () Bool)

(assert (=> b!800957 m!742091))

(assert (=> b!800957 m!742089))

(declare-fun m!742093 () Bool)

(assert (=> b!800957 m!742093))

(declare-fun m!742095 () Bool)

(assert (=> b!800964 m!742095))

(declare-fun m!742097 () Bool)

(assert (=> b!800964 m!742097))

(declare-fun m!742099 () Bool)

(assert (=> b!800952 m!742099))

(declare-fun m!742101 () Bool)

(assert (=> b!800960 m!742101))

(declare-fun m!742103 () Bool)

(assert (=> b!800954 m!742103))

(declare-fun m!742105 () Bool)

(assert (=> b!800962 m!742105))

(declare-fun m!742107 () Bool)

(assert (=> b!800959 m!742107))

(assert (=> b!800963 m!742089))

(assert (=> b!800963 m!742089))

(declare-fun m!742109 () Bool)

(assert (=> b!800963 m!742109))

(assert (=> b!800956 m!742089))

(assert (=> b!800956 m!742089))

(declare-fun m!742111 () Bool)

(assert (=> b!800956 m!742111))

(declare-fun m!742113 () Bool)

(assert (=> b!800958 m!742113))

(declare-fun m!742115 () Bool)

(assert (=> b!800953 m!742115))

(declare-fun m!742117 () Bool)

(assert (=> start!68750 m!742117))

(declare-fun m!742119 () Bool)

(assert (=> start!68750 m!742119))

(push 1)

