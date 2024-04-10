; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66760 () Bool)

(assert start!66760)

(declare-fun b!769196 () Bool)

(declare-fun e!428339 () Bool)

(declare-fun e!428337 () Bool)

(assert (=> b!769196 (= e!428339 e!428337)))

(declare-fun res!520161 () Bool)

(assert (=> b!769196 (=> (not res!520161) (not e!428337))))

(declare-datatypes ((SeekEntryResult!7861 0))(
  ( (MissingZero!7861 (index!33812 (_ BitVec 32))) (Found!7861 (index!33813 (_ BitVec 32))) (Intermediate!7861 (undefined!8673 Bool) (index!33814 (_ BitVec 32)) (x!64744 (_ BitVec 32))) (Undefined!7861) (MissingVacant!7861 (index!33815 (_ BitVec 32))) )
))
(declare-fun lt!342219 () SeekEntryResult!7861)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!769196 (= res!520161 (or (= lt!342219 (MissingZero!7861 i!1173)) (= lt!342219 (MissingVacant!7861 i!1173))))))

(declare-datatypes ((array!42322 0))(
  ( (array!42323 (arr!20261 (Array (_ BitVec 32) (_ BitVec 64))) (size!20682 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42322)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42322 (_ BitVec 32)) SeekEntryResult!7861)

(assert (=> b!769196 (= lt!342219 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun lt!342220 () SeekEntryResult!7861)

(declare-fun e!428338 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!769197 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42322 (_ BitVec 32)) SeekEntryResult!7861)

(assert (=> b!769197 (= e!428338 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20261 a!3186) j!159) a!3186 mask!3328) lt!342220))))

(declare-fun b!769198 () Bool)

(declare-fun res!520170 () Bool)

(declare-fun e!428333 () Bool)

(assert (=> b!769198 (=> (not res!520170) (not e!428333))))

(assert (=> b!769198 (= res!520170 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20261 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!769200 () Bool)

(declare-fun e!428334 () Bool)

(assert (=> b!769200 (= e!428334 e!428338)))

(declare-fun res!520159 () Bool)

(assert (=> b!769200 (=> (not res!520159) (not e!428338))))

(assert (=> b!769200 (= res!520159 (= (seekEntryOrOpen!0 (select (arr!20261 a!3186) j!159) a!3186 mask!3328) lt!342220))))

(assert (=> b!769200 (= lt!342220 (Found!7861 j!159))))

(declare-fun b!769201 () Bool)

(declare-fun e!428332 () Bool)

(assert (=> b!769201 (= e!428333 e!428332)))

(declare-fun res!520165 () Bool)

(assert (=> b!769201 (=> (not res!520165) (not e!428332))))

(declare-fun lt!342216 () SeekEntryResult!7861)

(declare-fun lt!342213 () SeekEntryResult!7861)

(assert (=> b!769201 (= res!520165 (= lt!342216 lt!342213))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!342211 () (_ BitVec 64))

(declare-fun lt!342218 () array!42322)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42322 (_ BitVec 32)) SeekEntryResult!7861)

(assert (=> b!769201 (= lt!342213 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!342211 lt!342218 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!769201 (= lt!342216 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!342211 mask!3328) lt!342211 lt!342218 mask!3328))))

(assert (=> b!769201 (= lt!342211 (select (store (arr!20261 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!769201 (= lt!342218 (array!42323 (store (arr!20261 a!3186) i!1173 k!2102) (size!20682 a!3186)))))

(declare-fun b!769202 () Bool)

(declare-fun res!520169 () Bool)

(assert (=> b!769202 (=> (not res!520169) (not e!428337))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42322 (_ BitVec 32)) Bool)

(assert (=> b!769202 (= res!520169 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun e!428331 () Bool)

(declare-fun b!769203 () Bool)

(declare-fun lt!342215 () SeekEntryResult!7861)

(assert (=> b!769203 (= e!428331 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20261 a!3186) j!159) a!3186 mask!3328) lt!342215))))

(declare-fun b!769204 () Bool)

(declare-fun e!428336 () Bool)

(assert (=> b!769204 (= e!428332 (not e!428336))))

(declare-fun res!520162 () Bool)

(assert (=> b!769204 (=> res!520162 e!428336)))

(assert (=> b!769204 (= res!520162 (or (not (is-Intermediate!7861 lt!342213)) (bvsge x!1131 (x!64744 lt!342213))))))

(assert (=> b!769204 e!428334))

(declare-fun res!520168 () Bool)

(assert (=> b!769204 (=> (not res!520168) (not e!428334))))

(assert (=> b!769204 (= res!520168 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26458 0))(
  ( (Unit!26459) )
))
(declare-fun lt!342214 () Unit!26458)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42322 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26458)

(assert (=> b!769204 (= lt!342214 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!769205 () Bool)

(declare-fun e!428335 () Unit!26458)

(declare-fun Unit!26460 () Unit!26458)

(assert (=> b!769205 (= e!428335 Unit!26460)))

(declare-fun lt!342217 () (_ BitVec 32))

(assert (=> b!769205 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342217 (select (arr!20261 a!3186) j!159) a!3186 mask!3328) lt!342215)))

(declare-fun b!769206 () Bool)

(assert (=> b!769206 (= e!428337 e!428333)))

(declare-fun res!520158 () Bool)

(assert (=> b!769206 (=> (not res!520158) (not e!428333))))

(assert (=> b!769206 (= res!520158 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20261 a!3186) j!159) mask!3328) (select (arr!20261 a!3186) j!159) a!3186 mask!3328) lt!342215))))

(assert (=> b!769206 (= lt!342215 (Intermediate!7861 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!769207 () Bool)

(assert (=> b!769207 (= e!428331 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20261 a!3186) j!159) a!3186 mask!3328) (Found!7861 j!159)))))

(declare-fun b!769208 () Bool)

(declare-fun res!520160 () Bool)

(assert (=> b!769208 (=> (not res!520160) (not e!428339))))

(assert (=> b!769208 (= res!520160 (and (= (size!20682 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20682 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20682 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!769209 () Bool)

(declare-fun res!520172 () Bool)

(assert (=> b!769209 (=> (not res!520172) (not e!428339))))

(declare-fun arrayContainsKey!0 (array!42322 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!769209 (= res!520172 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!769210 () Bool)

(declare-fun res!520157 () Bool)

(assert (=> b!769210 (=> (not res!520157) (not e!428333))))

(assert (=> b!769210 (= res!520157 e!428331)))

(declare-fun c!84916 () Bool)

(assert (=> b!769210 (= c!84916 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!769211 () Bool)

(declare-fun res!520166 () Bool)

(assert (=> b!769211 (=> (not res!520166) (not e!428339))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!769211 (= res!520166 (validKeyInArray!0 k!2102))))

(declare-fun b!769199 () Bool)

(declare-fun res!520167 () Bool)

(assert (=> b!769199 (=> (not res!520167) (not e!428337))))

(assert (=> b!769199 (= res!520167 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20682 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20682 a!3186))))))

(declare-fun res!520164 () Bool)

(assert (=> start!66760 (=> (not res!520164) (not e!428339))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66760 (= res!520164 (validMask!0 mask!3328))))

(assert (=> start!66760 e!428339))

(assert (=> start!66760 true))

(declare-fun array_inv!16057 (array!42322) Bool)

(assert (=> start!66760 (array_inv!16057 a!3186)))

(declare-fun b!769212 () Bool)

(declare-fun res!520171 () Bool)

(assert (=> b!769212 (=> (not res!520171) (not e!428337))))

(declare-datatypes ((List!14263 0))(
  ( (Nil!14260) (Cons!14259 (h!15358 (_ BitVec 64)) (t!20578 List!14263)) )
))
(declare-fun arrayNoDuplicates!0 (array!42322 (_ BitVec 32) List!14263) Bool)

(assert (=> b!769212 (= res!520171 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14260))))

(declare-fun b!769213 () Bool)

(assert (=> b!769213 (= e!428336 true)))

(declare-fun lt!342212 () Unit!26458)

(assert (=> b!769213 (= lt!342212 e!428335)))

(declare-fun c!84915 () Bool)

(assert (=> b!769213 (= c!84915 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!769213 (= lt!342217 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!769214 () Bool)

(declare-fun res!520163 () Bool)

(assert (=> b!769214 (=> (not res!520163) (not e!428339))))

(assert (=> b!769214 (= res!520163 (validKeyInArray!0 (select (arr!20261 a!3186) j!159)))))

(declare-fun b!769215 () Bool)

(declare-fun Unit!26461 () Unit!26458)

(assert (=> b!769215 (= e!428335 Unit!26461)))

(declare-fun lt!342221 () SeekEntryResult!7861)

(assert (=> b!769215 (= lt!342221 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20261 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!769215 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342217 resIntermediateIndex!5 (select (arr!20261 a!3186) j!159) a!3186 mask!3328) (Found!7861 j!159))))

(assert (= (and start!66760 res!520164) b!769208))

(assert (= (and b!769208 res!520160) b!769214))

(assert (= (and b!769214 res!520163) b!769211))

(assert (= (and b!769211 res!520166) b!769209))

(assert (= (and b!769209 res!520172) b!769196))

(assert (= (and b!769196 res!520161) b!769202))

(assert (= (and b!769202 res!520169) b!769212))

(assert (= (and b!769212 res!520171) b!769199))

(assert (= (and b!769199 res!520167) b!769206))

(assert (= (and b!769206 res!520158) b!769198))

(assert (= (and b!769198 res!520170) b!769210))

(assert (= (and b!769210 c!84916) b!769203))

(assert (= (and b!769210 (not c!84916)) b!769207))

(assert (= (and b!769210 res!520157) b!769201))

(assert (= (and b!769201 res!520165) b!769204))

(assert (= (and b!769204 res!520168) b!769200))

(assert (= (and b!769200 res!520159) b!769197))

(assert (= (and b!769204 (not res!520162)) b!769213))

(assert (= (and b!769213 c!84915) b!769205))

(assert (= (and b!769213 (not c!84915)) b!769215))

(declare-fun m!714643 () Bool)

(assert (=> b!769200 m!714643))

(assert (=> b!769200 m!714643))

(declare-fun m!714645 () Bool)

(assert (=> b!769200 m!714645))

(assert (=> b!769203 m!714643))

(assert (=> b!769203 m!714643))

(declare-fun m!714647 () Bool)

(assert (=> b!769203 m!714647))

(declare-fun m!714649 () Bool)

(assert (=> b!769196 m!714649))

(assert (=> b!769215 m!714643))

(assert (=> b!769215 m!714643))

(declare-fun m!714651 () Bool)

(assert (=> b!769215 m!714651))

(assert (=> b!769215 m!714643))

(declare-fun m!714653 () Bool)

(assert (=> b!769215 m!714653))

(declare-fun m!714655 () Bool)

(assert (=> b!769211 m!714655))

(assert (=> b!769205 m!714643))

(assert (=> b!769205 m!714643))

(declare-fun m!714657 () Bool)

(assert (=> b!769205 m!714657))

(declare-fun m!714659 () Bool)

(assert (=> start!66760 m!714659))

(declare-fun m!714661 () Bool)

(assert (=> start!66760 m!714661))

(declare-fun m!714663 () Bool)

(assert (=> b!769198 m!714663))

(declare-fun m!714665 () Bool)

(assert (=> b!769202 m!714665))

(assert (=> b!769214 m!714643))

(assert (=> b!769214 m!714643))

(declare-fun m!714667 () Bool)

(assert (=> b!769214 m!714667))

(declare-fun m!714669 () Bool)

(assert (=> b!769212 m!714669))

(assert (=> b!769207 m!714643))

(assert (=> b!769207 m!714643))

(assert (=> b!769207 m!714651))

(assert (=> b!769206 m!714643))

(assert (=> b!769206 m!714643))

(declare-fun m!714671 () Bool)

(assert (=> b!769206 m!714671))

(assert (=> b!769206 m!714671))

(assert (=> b!769206 m!714643))

(declare-fun m!714673 () Bool)

(assert (=> b!769206 m!714673))

(declare-fun m!714675 () Bool)

(assert (=> b!769201 m!714675))

(declare-fun m!714677 () Bool)

(assert (=> b!769201 m!714677))

(declare-fun m!714679 () Bool)

(assert (=> b!769201 m!714679))

(declare-fun m!714681 () Bool)

(assert (=> b!769201 m!714681))

(assert (=> b!769201 m!714677))

(declare-fun m!714683 () Bool)

(assert (=> b!769201 m!714683))

(assert (=> b!769197 m!714643))

(assert (=> b!769197 m!714643))

(declare-fun m!714685 () Bool)

(assert (=> b!769197 m!714685))

(declare-fun m!714687 () Bool)

(assert (=> b!769213 m!714687))

(declare-fun m!714689 () Bool)

(assert (=> b!769209 m!714689))

(declare-fun m!714691 () Bool)

(assert (=> b!769204 m!714691))

(declare-fun m!714693 () Bool)

(assert (=> b!769204 m!714693))

(push 1)

