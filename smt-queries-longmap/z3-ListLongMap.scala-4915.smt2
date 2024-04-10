; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67736 () Bool)

(assert start!67736)

(declare-fun b!786104 () Bool)

(declare-fun res!532226 () Bool)

(declare-fun e!437002 () Bool)

(assert (=> b!786104 (=> (not res!532226) (not e!437002))))

(declare-datatypes ((array!42776 0))(
  ( (array!42777 (arr!20476 (Array (_ BitVec 32) (_ BitVec 64))) (size!20897 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42776)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42776 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!786104 (= res!532226 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!786105 () Bool)

(declare-datatypes ((Unit!27192 0))(
  ( (Unit!27193) )
))
(declare-fun e!437001 () Unit!27192)

(declare-fun Unit!27194 () Unit!27192)

(assert (=> b!786105 (= e!437001 Unit!27194)))

(assert (=> b!786105 false))

(declare-fun b!786106 () Bool)

(declare-fun res!532220 () Bool)

(declare-fun e!437011 () Bool)

(assert (=> b!786106 (=> (not res!532220) (not e!437011))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!350558 () (_ BitVec 64))

(declare-fun lt!350562 () array!42776)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8076 0))(
  ( (MissingZero!8076 (index!34672 (_ BitVec 32))) (Found!8076 (index!34673 (_ BitVec 32))) (Intermediate!8076 (undefined!8888 Bool) (index!34674 (_ BitVec 32)) (x!65616 (_ BitVec 32))) (Undefined!8076) (MissingVacant!8076 (index!34675 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42776 (_ BitVec 32)) SeekEntryResult!8076)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42776 (_ BitVec 32)) SeekEntryResult!8076)

(assert (=> b!786106 (= res!532220 (= (seekEntryOrOpen!0 lt!350558 lt!350562 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!350558 lt!350562 mask!3328)))))

(declare-fun b!786107 () Bool)

(declare-fun res!532228 () Bool)

(declare-fun e!437008 () Bool)

(assert (=> b!786107 (=> (not res!532228) (not e!437008))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!786107 (= res!532228 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20476 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!786108 () Bool)

(declare-fun lt!350560 () SeekEntryResult!8076)

(declare-fun e!437006 () Bool)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42776 (_ BitVec 32)) SeekEntryResult!8076)

(assert (=> b!786108 (= e!437006 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20476 a!3186) j!159) a!3186 mask!3328) lt!350560))))

(declare-fun b!786109 () Bool)

(declare-fun res!532213 () Bool)

(assert (=> b!786109 (=> (not res!532213) (not e!437002))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!786109 (= res!532213 (validKeyInArray!0 (select (arr!20476 a!3186) j!159)))))

(declare-fun res!532227 () Bool)

(assert (=> start!67736 (=> (not res!532227) (not e!437002))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67736 (= res!532227 (validMask!0 mask!3328))))

(assert (=> start!67736 e!437002))

(assert (=> start!67736 true))

(declare-fun array_inv!16272 (array!42776) Bool)

(assert (=> start!67736 (array_inv!16272 a!3186)))

(declare-fun lt!350556 () SeekEntryResult!8076)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun e!437005 () Bool)

(declare-fun b!786110 () Bool)

(assert (=> b!786110 (= e!437005 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20476 a!3186) j!159) a!3186 mask!3328) lt!350556))))

(declare-fun b!786111 () Bool)

(declare-fun res!532221 () Bool)

(declare-fun e!437012 () Bool)

(assert (=> b!786111 (=> (not res!532221) (not e!437012))))

(declare-datatypes ((List!14478 0))(
  ( (Nil!14475) (Cons!14474 (h!15597 (_ BitVec 64)) (t!20793 List!14478)) )
))
(declare-fun arrayNoDuplicates!0 (array!42776 (_ BitVec 32) List!14478) Bool)

(assert (=> b!786111 (= res!532221 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14475))))

(declare-fun b!786112 () Bool)

(declare-fun res!532224 () Bool)

(assert (=> b!786112 (=> (not res!532224) (not e!437012))))

(assert (=> b!786112 (= res!532224 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20897 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20897 a!3186))))))

(declare-fun b!786113 () Bool)

(assert (=> b!786113 (= e!437002 e!437012)))

(declare-fun res!532216 () Bool)

(assert (=> b!786113 (=> (not res!532216) (not e!437012))))

(declare-fun lt!350561 () SeekEntryResult!8076)

(assert (=> b!786113 (= res!532216 (or (= lt!350561 (MissingZero!8076 i!1173)) (= lt!350561 (MissingVacant!8076 i!1173))))))

(assert (=> b!786113 (= lt!350561 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!786114 () Bool)

(declare-fun e!437004 () Bool)

(assert (=> b!786114 (= e!437004 true)))

(assert (=> b!786114 e!437011))

(declare-fun res!532218 () Bool)

(assert (=> b!786114 (=> (not res!532218) (not e!437011))))

(declare-fun lt!350559 () (_ BitVec 64))

(assert (=> b!786114 (= res!532218 (= lt!350559 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!350563 () Unit!27192)

(assert (=> b!786114 (= lt!350563 e!437001)))

(declare-fun c!87354 () Bool)

(assert (=> b!786114 (= c!87354 (= lt!350559 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!786115 () Bool)

(declare-fun res!532219 () Bool)

(assert (=> b!786115 (=> (not res!532219) (not e!437012))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42776 (_ BitVec 32)) Bool)

(assert (=> b!786115 (= res!532219 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!786116 () Bool)

(declare-fun e!437009 () Bool)

(assert (=> b!786116 (= e!437008 e!437009)))

(declare-fun res!532225 () Bool)

(assert (=> b!786116 (=> (not res!532225) (not e!437009))))

(declare-fun lt!350554 () SeekEntryResult!8076)

(declare-fun lt!350557 () SeekEntryResult!8076)

(assert (=> b!786116 (= res!532225 (= lt!350554 lt!350557))))

(assert (=> b!786116 (= lt!350557 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!350558 lt!350562 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!786116 (= lt!350554 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!350558 mask!3328) lt!350558 lt!350562 mask!3328))))

(assert (=> b!786116 (= lt!350558 (select (store (arr!20476 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!786116 (= lt!350562 (array!42777 (store (arr!20476 a!3186) i!1173 k0!2102) (size!20897 a!3186)))))

(declare-fun b!786117 () Bool)

(declare-fun lt!350553 () SeekEntryResult!8076)

(declare-fun lt!350564 () SeekEntryResult!8076)

(assert (=> b!786117 (= e!437011 (= lt!350553 lt!350564))))

(declare-fun b!786118 () Bool)

(declare-fun Unit!27195 () Unit!27192)

(assert (=> b!786118 (= e!437001 Unit!27195)))

(declare-fun b!786119 () Bool)

(declare-fun e!437003 () Bool)

(assert (=> b!786119 (= e!437003 e!437004)))

(declare-fun res!532212 () Bool)

(assert (=> b!786119 (=> res!532212 e!437004)))

(assert (=> b!786119 (= res!532212 (= lt!350559 lt!350558))))

(assert (=> b!786119 (= lt!350559 (select (store (arr!20476 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!786120 () Bool)

(declare-fun res!532214 () Bool)

(assert (=> b!786120 (=> (not res!532214) (not e!437008))))

(assert (=> b!786120 (= res!532214 e!437006)))

(declare-fun c!87355 () Bool)

(assert (=> b!786120 (= c!87355 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!786121 () Bool)

(assert (=> b!786121 (= e!437012 e!437008)))

(declare-fun res!532215 () Bool)

(assert (=> b!786121 (=> (not res!532215) (not e!437008))))

(assert (=> b!786121 (= res!532215 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20476 a!3186) j!159) mask!3328) (select (arr!20476 a!3186) j!159) a!3186 mask!3328) lt!350560))))

(assert (=> b!786121 (= lt!350560 (Intermediate!8076 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!786122 () Bool)

(assert (=> b!786122 (= e!437006 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20476 a!3186) j!159) a!3186 mask!3328) (Found!8076 j!159)))))

(declare-fun b!786123 () Bool)

(declare-fun e!437007 () Bool)

(assert (=> b!786123 (= e!437009 (not e!437007))))

(declare-fun res!532222 () Bool)

(assert (=> b!786123 (=> res!532222 e!437007)))

(get-info :version)

(assert (=> b!786123 (= res!532222 (or (not ((_ is Intermediate!8076) lt!350557)) (bvslt x!1131 (x!65616 lt!350557)) (not (= x!1131 (x!65616 lt!350557))) (not (= index!1321 (index!34674 lt!350557)))))))

(assert (=> b!786123 e!437005))

(declare-fun res!532217 () Bool)

(assert (=> b!786123 (=> (not res!532217) (not e!437005))))

(assert (=> b!786123 (= res!532217 (= lt!350553 lt!350556))))

(assert (=> b!786123 (= lt!350556 (Found!8076 j!159))))

(assert (=> b!786123 (= lt!350553 (seekEntryOrOpen!0 (select (arr!20476 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!786123 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!350555 () Unit!27192)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42776 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27192)

(assert (=> b!786123 (= lt!350555 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!786124 () Bool)

(declare-fun res!532229 () Bool)

(assert (=> b!786124 (=> (not res!532229) (not e!437002))))

(assert (=> b!786124 (= res!532229 (validKeyInArray!0 k0!2102))))

(declare-fun b!786125 () Bool)

(assert (=> b!786125 (= e!437007 e!437003)))

(declare-fun res!532211 () Bool)

(assert (=> b!786125 (=> res!532211 e!437003)))

(assert (=> b!786125 (= res!532211 (not (= lt!350564 lt!350556)))))

(assert (=> b!786125 (= lt!350564 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20476 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!786126 () Bool)

(declare-fun res!532223 () Bool)

(assert (=> b!786126 (=> (not res!532223) (not e!437002))))

(assert (=> b!786126 (= res!532223 (and (= (size!20897 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20897 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20897 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!67736 res!532227) b!786126))

(assert (= (and b!786126 res!532223) b!786109))

(assert (= (and b!786109 res!532213) b!786124))

(assert (= (and b!786124 res!532229) b!786104))

(assert (= (and b!786104 res!532226) b!786113))

(assert (= (and b!786113 res!532216) b!786115))

(assert (= (and b!786115 res!532219) b!786111))

(assert (= (and b!786111 res!532221) b!786112))

(assert (= (and b!786112 res!532224) b!786121))

(assert (= (and b!786121 res!532215) b!786107))

(assert (= (and b!786107 res!532228) b!786120))

(assert (= (and b!786120 c!87355) b!786108))

(assert (= (and b!786120 (not c!87355)) b!786122))

(assert (= (and b!786120 res!532214) b!786116))

(assert (= (and b!786116 res!532225) b!786123))

(assert (= (and b!786123 res!532217) b!786110))

(assert (= (and b!786123 (not res!532222)) b!786125))

(assert (= (and b!786125 (not res!532211)) b!786119))

(assert (= (and b!786119 (not res!532212)) b!786114))

(assert (= (and b!786114 c!87354) b!786105))

(assert (= (and b!786114 (not c!87354)) b!786118))

(assert (= (and b!786114 res!532218) b!786106))

(assert (= (and b!786106 res!532220) b!786117))

(declare-fun m!728013 () Bool)

(assert (=> b!786115 m!728013))

(declare-fun m!728015 () Bool)

(assert (=> b!786121 m!728015))

(assert (=> b!786121 m!728015))

(declare-fun m!728017 () Bool)

(assert (=> b!786121 m!728017))

(assert (=> b!786121 m!728017))

(assert (=> b!786121 m!728015))

(declare-fun m!728019 () Bool)

(assert (=> b!786121 m!728019))

(assert (=> b!786123 m!728015))

(assert (=> b!786123 m!728015))

(declare-fun m!728021 () Bool)

(assert (=> b!786123 m!728021))

(declare-fun m!728023 () Bool)

(assert (=> b!786123 m!728023))

(declare-fun m!728025 () Bool)

(assert (=> b!786123 m!728025))

(assert (=> b!786110 m!728015))

(assert (=> b!786110 m!728015))

(declare-fun m!728027 () Bool)

(assert (=> b!786110 m!728027))

(declare-fun m!728029 () Bool)

(assert (=> b!786116 m!728029))

(declare-fun m!728031 () Bool)

(assert (=> b!786116 m!728031))

(declare-fun m!728033 () Bool)

(assert (=> b!786116 m!728033))

(declare-fun m!728035 () Bool)

(assert (=> b!786116 m!728035))

(declare-fun m!728037 () Bool)

(assert (=> b!786116 m!728037))

(assert (=> b!786116 m!728033))

(declare-fun m!728039 () Bool)

(assert (=> b!786111 m!728039))

(declare-fun m!728041 () Bool)

(assert (=> b!786124 m!728041))

(assert (=> b!786122 m!728015))

(assert (=> b!786122 m!728015))

(declare-fun m!728043 () Bool)

(assert (=> b!786122 m!728043))

(assert (=> b!786108 m!728015))

(assert (=> b!786108 m!728015))

(declare-fun m!728045 () Bool)

(assert (=> b!786108 m!728045))

(declare-fun m!728047 () Bool)

(assert (=> b!786104 m!728047))

(declare-fun m!728049 () Bool)

(assert (=> b!786106 m!728049))

(declare-fun m!728051 () Bool)

(assert (=> b!786106 m!728051))

(assert (=> b!786125 m!728015))

(assert (=> b!786125 m!728015))

(assert (=> b!786125 m!728043))

(assert (=> b!786119 m!728031))

(declare-fun m!728053 () Bool)

(assert (=> b!786119 m!728053))

(assert (=> b!786109 m!728015))

(assert (=> b!786109 m!728015))

(declare-fun m!728055 () Bool)

(assert (=> b!786109 m!728055))

(declare-fun m!728057 () Bool)

(assert (=> start!67736 m!728057))

(declare-fun m!728059 () Bool)

(assert (=> start!67736 m!728059))

(declare-fun m!728061 () Bool)

(assert (=> b!786113 m!728061))

(declare-fun m!728063 () Bool)

(assert (=> b!786107 m!728063))

(check-sat (not b!786111) (not start!67736) (not b!786122) (not b!786113) (not b!786121) (not b!786104) (not b!786124) (not b!786110) (not b!786125) (not b!786116) (not b!786109) (not b!786108) (not b!786115) (not b!786106) (not b!786123))
(check-sat)
