; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69194 () Bool)

(assert start!69194)

(declare-fun b!807041 () Bool)

(declare-fun e!446870 () Bool)

(declare-fun e!446871 () Bool)

(assert (=> b!807041 (= e!446870 e!446871)))

(declare-fun res!551172 () Bool)

(assert (=> b!807041 (=> (not res!551172) (not e!446871))))

(declare-datatypes ((SeekEntryResult!8615 0))(
  ( (MissingZero!8615 (index!36828 (_ BitVec 32))) (Found!8615 (index!36829 (_ BitVec 32))) (Intermediate!8615 (undefined!9427 Bool) (index!36830 (_ BitVec 32)) (x!67643 (_ BitVec 32))) (Undefined!8615) (MissingVacant!8615 (index!36831 (_ BitVec 32))) )
))
(declare-fun lt!361512 () SeekEntryResult!8615)

(declare-datatypes ((array!43894 0))(
  ( (array!43895 (arr!21024 (Array (_ BitVec 32) (_ BitVec 64))) (size!21445 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43894)

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun lt!361516 () SeekEntryResult!8615)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!807041 (= res!551172 (and (= lt!361516 lt!361512) (= lt!361512 (Found!8615 j!153)) (not (= (select (arr!21024 a!3170) index!1236) (select (arr!21024 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43894 (_ BitVec 32)) SeekEntryResult!8615)

(assert (=> b!807041 (= lt!361512 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21024 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43894 (_ BitVec 32)) SeekEntryResult!8615)

(assert (=> b!807041 (= lt!361516 (seekEntryOrOpen!0 (select (arr!21024 a!3170) j!153) a!3170 mask!3266))))

(declare-fun res!551167 () Bool)

(declare-fun e!446869 () Bool)

(assert (=> start!69194 (=> (not res!551167) (not e!446869))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69194 (= res!551167 (validMask!0 mask!3266))))

(assert (=> start!69194 e!446869))

(assert (=> start!69194 true))

(declare-fun array_inv!16820 (array!43894) Bool)

(assert (=> start!69194 (array_inv!16820 a!3170)))

(declare-fun b!807042 () Bool)

(declare-fun res!551169 () Bool)

(declare-fun e!446873 () Bool)

(assert (=> b!807042 (=> (not res!551169) (not e!446873))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43894 (_ BitVec 32)) Bool)

(assert (=> b!807042 (= res!551169 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!807043 () Bool)

(declare-fun res!551168 () Bool)

(assert (=> b!807043 (=> (not res!551168) (not e!446873))))

(declare-datatypes ((List!14987 0))(
  ( (Nil!14984) (Cons!14983 (h!16112 (_ BitVec 64)) (t!21302 List!14987)) )
))
(declare-fun arrayNoDuplicates!0 (array!43894 (_ BitVec 32) List!14987) Bool)

(assert (=> b!807043 (= res!551168 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14984))))

(declare-fun b!807044 () Bool)

(assert (=> b!807044 (= e!446869 e!446873)))

(declare-fun res!551171 () Bool)

(assert (=> b!807044 (=> (not res!551171) (not e!446873))))

(declare-fun lt!361514 () SeekEntryResult!8615)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!807044 (= res!551171 (or (= lt!361514 (MissingZero!8615 i!1163)) (= lt!361514 (MissingVacant!8615 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(assert (=> b!807044 (= lt!361514 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!807045 () Bool)

(assert (=> b!807045 (= e!446871 false)))

(declare-fun lt!361513 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!807045 (= lt!361513 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!807046 () Bool)

(declare-fun res!551165 () Bool)

(assert (=> b!807046 (=> (not res!551165) (not e!446873))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(assert (=> b!807046 (= res!551165 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21445 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21024 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21445 a!3170)) (= (select (arr!21024 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!807047 () Bool)

(declare-fun res!551173 () Bool)

(assert (=> b!807047 (=> (not res!551173) (not e!446869))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!807047 (= res!551173 (validKeyInArray!0 (select (arr!21024 a!3170) j!153)))))

(declare-fun b!807048 () Bool)

(declare-fun res!551170 () Bool)

(assert (=> b!807048 (=> (not res!551170) (not e!446869))))

(assert (=> b!807048 (= res!551170 (validKeyInArray!0 k!2044))))

(declare-fun b!807049 () Bool)

(declare-fun res!551164 () Bool)

(assert (=> b!807049 (=> (not res!551164) (not e!446869))))

(declare-fun arrayContainsKey!0 (array!43894 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!807049 (= res!551164 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!807050 () Bool)

(declare-fun res!551174 () Bool)

(assert (=> b!807050 (=> (not res!551174) (not e!446869))))

(assert (=> b!807050 (= res!551174 (and (= (size!21445 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21445 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21445 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!807051 () Bool)

(assert (=> b!807051 (= e!446873 e!446870)))

(declare-fun res!551166 () Bool)

(assert (=> b!807051 (=> (not res!551166) (not e!446870))))

(declare-fun lt!361515 () array!43894)

(declare-fun lt!361517 () (_ BitVec 64))

(assert (=> b!807051 (= res!551166 (= (seekEntryOrOpen!0 lt!361517 lt!361515 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!361517 lt!361515 mask!3266)))))

(assert (=> b!807051 (= lt!361517 (select (store (arr!21024 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!807051 (= lt!361515 (array!43895 (store (arr!21024 a!3170) i!1163 k!2044) (size!21445 a!3170)))))

(assert (= (and start!69194 res!551167) b!807050))

(assert (= (and b!807050 res!551174) b!807047))

(assert (= (and b!807047 res!551173) b!807048))

(assert (= (and b!807048 res!551170) b!807049))

(assert (= (and b!807049 res!551164) b!807044))

(assert (= (and b!807044 res!551171) b!807042))

(assert (= (and b!807042 res!551169) b!807043))

(assert (= (and b!807043 res!551168) b!807046))

(assert (= (and b!807046 res!551165) b!807051))

(assert (= (and b!807051 res!551166) b!807041))

(assert (= (and b!807041 res!551172) b!807045))

(declare-fun m!749015 () Bool)

(assert (=> b!807048 m!749015))

(declare-fun m!749017 () Bool)

(assert (=> start!69194 m!749017))

(declare-fun m!749019 () Bool)

(assert (=> start!69194 m!749019))

(declare-fun m!749021 () Bool)

(assert (=> b!807042 m!749021))

(declare-fun m!749023 () Bool)

(assert (=> b!807043 m!749023))

(declare-fun m!749025 () Bool)

(assert (=> b!807051 m!749025))

(declare-fun m!749027 () Bool)

(assert (=> b!807051 m!749027))

(declare-fun m!749029 () Bool)

(assert (=> b!807051 m!749029))

(declare-fun m!749031 () Bool)

(assert (=> b!807051 m!749031))

(declare-fun m!749033 () Bool)

(assert (=> b!807045 m!749033))

(declare-fun m!749035 () Bool)

(assert (=> b!807041 m!749035))

(declare-fun m!749037 () Bool)

(assert (=> b!807041 m!749037))

(assert (=> b!807041 m!749037))

(declare-fun m!749039 () Bool)

(assert (=> b!807041 m!749039))

(assert (=> b!807041 m!749037))

(declare-fun m!749041 () Bool)

(assert (=> b!807041 m!749041))

(assert (=> b!807047 m!749037))

(assert (=> b!807047 m!749037))

(declare-fun m!749043 () Bool)

(assert (=> b!807047 m!749043))

(declare-fun m!749045 () Bool)

(assert (=> b!807046 m!749045))

(declare-fun m!749047 () Bool)

(assert (=> b!807046 m!749047))

(declare-fun m!749049 () Bool)

(assert (=> b!807044 m!749049))

(declare-fun m!749051 () Bool)

(assert (=> b!807049 m!749051))

(push 1)

