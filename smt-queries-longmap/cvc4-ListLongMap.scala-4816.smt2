; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66240 () Bool)

(assert start!66240)

(declare-fun b!762971 () Bool)

(declare-fun res!516021 () Bool)

(declare-fun e!425198 () Bool)

(assert (=> b!762971 (=> (not res!516021) (not e!425198))))

(declare-datatypes ((array!42145 0))(
  ( (array!42146 (arr!20180 (Array (_ BitVec 32) (_ BitVec 64))) (size!20601 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42145)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42145 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!762971 (= res!516021 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!762972 () Bool)

(declare-fun res!516015 () Bool)

(declare-fun e!425199 () Bool)

(assert (=> b!762972 (=> (not res!516015) (not e!425199))))

(declare-datatypes ((List!14182 0))(
  ( (Nil!14179) (Cons!14178 (h!15262 (_ BitVec 64)) (t!20497 List!14182)) )
))
(declare-fun arrayNoDuplicates!0 (array!42145 (_ BitVec 32) List!14182) Bool)

(assert (=> b!762972 (= res!516015 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14179))))

(declare-fun b!762973 () Bool)

(assert (=> b!762973 (= e!425198 e!425199)))

(declare-fun res!516013 () Bool)

(assert (=> b!762973 (=> (not res!516013) (not e!425199))))

(declare-datatypes ((SeekEntryResult!7780 0))(
  ( (MissingZero!7780 (index!33488 (_ BitVec 32))) (Found!7780 (index!33489 (_ BitVec 32))) (Intermediate!7780 (undefined!8592 Bool) (index!33490 (_ BitVec 32)) (x!64392 (_ BitVec 32))) (Undefined!7780) (MissingVacant!7780 (index!33491 (_ BitVec 32))) )
))
(declare-fun lt!339693 () SeekEntryResult!7780)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!762973 (= res!516013 (or (= lt!339693 (MissingZero!7780 i!1173)) (= lt!339693 (MissingVacant!7780 i!1173))))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42145 (_ BitVec 32)) SeekEntryResult!7780)

(assert (=> b!762973 (= lt!339693 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!762974 () Bool)

(declare-fun res!516017 () Bool)

(assert (=> b!762974 (=> (not res!516017) (not e!425199))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42145 (_ BitVec 32)) Bool)

(assert (=> b!762974 (= res!516017 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!425195 () Bool)

(declare-fun b!762975 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42145 (_ BitVec 32)) SeekEntryResult!7780)

(assert (=> b!762975 (= e!425195 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20180 a!3186) j!159) a!3186 mask!3328) (Found!7780 j!159))))))

(declare-fun lt!339695 () SeekEntryResult!7780)

(declare-fun b!762976 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42145 (_ BitVec 32)) SeekEntryResult!7780)

(assert (=> b!762976 (= e!425195 (not (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20180 a!3186) j!159) a!3186 mask!3328) lt!339695)))))

(declare-fun res!516018 () Bool)

(assert (=> start!66240 (=> (not res!516018) (not e!425198))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66240 (= res!516018 (validMask!0 mask!3328))))

(assert (=> start!66240 e!425198))

(assert (=> start!66240 true))

(declare-fun array_inv!15976 (array!42145) Bool)

(assert (=> start!66240 (array_inv!15976 a!3186)))

(declare-fun b!762977 () Bool)

(declare-fun res!516014 () Bool)

(assert (=> b!762977 (=> (not res!516014) (not e!425198))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!762977 (= res!516014 (validKeyInArray!0 (select (arr!20180 a!3186) j!159)))))

(declare-fun b!762978 () Bool)

(declare-fun e!425196 () Bool)

(assert (=> b!762978 (= e!425199 e!425196)))

(declare-fun res!516020 () Bool)

(assert (=> b!762978 (=> (not res!516020) (not e!425196))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!762978 (= res!516020 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20180 a!3186) j!159) mask!3328) (select (arr!20180 a!3186) j!159) a!3186 mask!3328) lt!339695))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!762978 (= lt!339695 (Intermediate!7780 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!762979 () Bool)

(assert (=> b!762979 (= e!425196 false)))

(declare-fun lt!339694 () Bool)

(assert (=> b!762979 (= lt!339694 e!425195)))

(declare-fun c!83866 () Bool)

(assert (=> b!762979 (= c!83866 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!762980 () Bool)

(declare-fun res!516019 () Bool)

(assert (=> b!762980 (=> (not res!516019) (not e!425198))))

(assert (=> b!762980 (= res!516019 (and (= (size!20601 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20601 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20601 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!762981 () Bool)

(declare-fun res!516012 () Bool)

(assert (=> b!762981 (=> (not res!516012) (not e!425198))))

(assert (=> b!762981 (= res!516012 (validKeyInArray!0 k!2102))))

(declare-fun b!762982 () Bool)

(declare-fun res!516022 () Bool)

(assert (=> b!762982 (=> (not res!516022) (not e!425196))))

(assert (=> b!762982 (= res!516022 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20180 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!762983 () Bool)

(declare-fun res!516016 () Bool)

(assert (=> b!762983 (=> (not res!516016) (not e!425199))))

(assert (=> b!762983 (= res!516016 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20601 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20601 a!3186))))))

(assert (= (and start!66240 res!516018) b!762980))

(assert (= (and b!762980 res!516019) b!762977))

(assert (= (and b!762977 res!516014) b!762981))

(assert (= (and b!762981 res!516012) b!762971))

(assert (= (and b!762971 res!516021) b!762973))

(assert (= (and b!762973 res!516013) b!762974))

(assert (= (and b!762974 res!516017) b!762972))

(assert (= (and b!762972 res!516015) b!762983))

(assert (= (and b!762983 res!516016) b!762978))

(assert (= (and b!762978 res!516020) b!762982))

(assert (= (and b!762982 res!516022) b!762979))

(assert (= (and b!762979 c!83866) b!762976))

(assert (= (and b!762979 (not c!83866)) b!762975))

(declare-fun m!709571 () Bool)

(assert (=> b!762973 m!709571))

(declare-fun m!709573 () Bool)

(assert (=> b!762981 m!709573))

(declare-fun m!709575 () Bool)

(assert (=> b!762976 m!709575))

(assert (=> b!762976 m!709575))

(declare-fun m!709577 () Bool)

(assert (=> b!762976 m!709577))

(declare-fun m!709579 () Bool)

(assert (=> b!762971 m!709579))

(declare-fun m!709581 () Bool)

(assert (=> b!762974 m!709581))

(declare-fun m!709583 () Bool)

(assert (=> b!762972 m!709583))

(declare-fun m!709585 () Bool)

(assert (=> start!66240 m!709585))

(declare-fun m!709587 () Bool)

(assert (=> start!66240 m!709587))

(assert (=> b!762975 m!709575))

(assert (=> b!762975 m!709575))

(declare-fun m!709589 () Bool)

(assert (=> b!762975 m!709589))

(assert (=> b!762977 m!709575))

(assert (=> b!762977 m!709575))

(declare-fun m!709591 () Bool)

(assert (=> b!762977 m!709591))

(assert (=> b!762978 m!709575))

(assert (=> b!762978 m!709575))

(declare-fun m!709593 () Bool)

(assert (=> b!762978 m!709593))

(assert (=> b!762978 m!709593))

(assert (=> b!762978 m!709575))

(declare-fun m!709595 () Bool)

(assert (=> b!762978 m!709595))

(declare-fun m!709597 () Bool)

(assert (=> b!762982 m!709597))

(push 1)

(assert (not b!762972))

(assert (not b!762976))

