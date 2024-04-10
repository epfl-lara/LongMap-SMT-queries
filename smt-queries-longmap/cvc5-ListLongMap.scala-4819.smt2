; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66254 () Bool)

(assert start!66254)

(declare-fun b!763262 () Bool)

(declare-fun res!516261 () Bool)

(declare-fun e!425300 () Bool)

(assert (=> b!763262 (=> (not res!516261) (not e!425300))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42159 0))(
  ( (array!42160 (arr!20187 (Array (_ BitVec 32) (_ BitVec 64))) (size!20608 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42159)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!763262 (= res!516261 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20608 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20608 a!3186))))))

(declare-fun b!763263 () Bool)

(declare-fun res!516263 () Bool)

(assert (=> b!763263 (=> (not res!516263) (not e!425300))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42159 (_ BitVec 32)) Bool)

(assert (=> b!763263 (= res!516263 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!763264 () Bool)

(declare-fun e!425304 () Bool)

(assert (=> b!763264 (= e!425300 e!425304)))

(declare-fun res!516269 () Bool)

(assert (=> b!763264 (=> (not res!516269) (not e!425304))))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7787 0))(
  ( (MissingZero!7787 (index!33516 (_ BitVec 32))) (Found!7787 (index!33517 (_ BitVec 32))) (Intermediate!7787 (undefined!8599 Bool) (index!33518 (_ BitVec 32)) (x!64423 (_ BitVec 32))) (Undefined!7787) (MissingVacant!7787 (index!33519 (_ BitVec 32))) )
))
(declare-fun lt!339758 () SeekEntryResult!7787)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42159 (_ BitVec 32)) SeekEntryResult!7787)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!763264 (= res!516269 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20187 a!3186) j!159) mask!3328) (select (arr!20187 a!3186) j!159) a!3186 mask!3328) lt!339758))))

(assert (=> b!763264 (= lt!339758 (Intermediate!7787 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!763265 () Bool)

(declare-fun e!425302 () Bool)

(assert (=> b!763265 (= e!425302 e!425300)))

(declare-fun res!516271 () Bool)

(assert (=> b!763265 (=> (not res!516271) (not e!425300))))

(declare-fun lt!339756 () SeekEntryResult!7787)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!763265 (= res!516271 (or (= lt!339756 (MissingZero!7787 i!1173)) (= lt!339756 (MissingVacant!7787 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42159 (_ BitVec 32)) SeekEntryResult!7787)

(assert (=> b!763265 (= lt!339756 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!763266 () Bool)

(declare-fun res!516267 () Bool)

(assert (=> b!763266 (=> (not res!516267) (not e!425302))))

(assert (=> b!763266 (= res!516267 (and (= (size!20608 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20608 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20608 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!763267 () Bool)

(assert (=> b!763267 (= e!425304 false)))

(declare-fun lt!339757 () Bool)

(declare-fun e!425303 () Bool)

(assert (=> b!763267 (= lt!339757 e!425303)))

(declare-fun c!83887 () Bool)

(assert (=> b!763267 (= c!83887 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!763268 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42159 (_ BitVec 32)) SeekEntryResult!7787)

(assert (=> b!763268 (= e!425303 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20187 a!3186) j!159) a!3186 mask!3328) (Found!7787 j!159))))))

(declare-fun b!763269 () Bool)

(declare-fun res!516262 () Bool)

(assert (=> b!763269 (=> (not res!516262) (not e!425304))))

(assert (=> b!763269 (= res!516262 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20187 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!516266 () Bool)

(assert (=> start!66254 (=> (not res!516266) (not e!425302))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66254 (= res!516266 (validMask!0 mask!3328))))

(assert (=> start!66254 e!425302))

(assert (=> start!66254 true))

(declare-fun array_inv!15983 (array!42159) Bool)

(assert (=> start!66254 (array_inv!15983 a!3186)))

(declare-fun b!763270 () Bool)

(declare-fun res!516268 () Bool)

(assert (=> b!763270 (=> (not res!516268) (not e!425300))))

(declare-datatypes ((List!14189 0))(
  ( (Nil!14186) (Cons!14185 (h!15269 (_ BitVec 64)) (t!20504 List!14189)) )
))
(declare-fun arrayNoDuplicates!0 (array!42159 (_ BitVec 32) List!14189) Bool)

(assert (=> b!763270 (= res!516268 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14186))))

(declare-fun b!763271 () Bool)

(declare-fun res!516270 () Bool)

(assert (=> b!763271 (=> (not res!516270) (not e!425302))))

(declare-fun arrayContainsKey!0 (array!42159 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!763271 (= res!516270 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!763272 () Bool)

(assert (=> b!763272 (= e!425303 (not (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20187 a!3186) j!159) a!3186 mask!3328) lt!339758)))))

(declare-fun b!763273 () Bool)

(declare-fun res!516264 () Bool)

(assert (=> b!763273 (=> (not res!516264) (not e!425302))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!763273 (= res!516264 (validKeyInArray!0 (select (arr!20187 a!3186) j!159)))))

(declare-fun b!763274 () Bool)

(declare-fun res!516265 () Bool)

(assert (=> b!763274 (=> (not res!516265) (not e!425302))))

(assert (=> b!763274 (= res!516265 (validKeyInArray!0 k!2102))))

(assert (= (and start!66254 res!516266) b!763266))

(assert (= (and b!763266 res!516267) b!763273))

(assert (= (and b!763273 res!516264) b!763274))

(assert (= (and b!763274 res!516265) b!763271))

(assert (= (and b!763271 res!516270) b!763265))

(assert (= (and b!763265 res!516271) b!763263))

(assert (= (and b!763263 res!516263) b!763270))

(assert (= (and b!763270 res!516268) b!763262))

(assert (= (and b!763262 res!516261) b!763264))

(assert (= (and b!763264 res!516269) b!763269))

(assert (= (and b!763269 res!516262) b!763267))

(assert (= (and b!763267 c!83887) b!763272))

(assert (= (and b!763267 (not c!83887)) b!763268))

(declare-fun m!709803 () Bool)

(assert (=> b!763274 m!709803))

(declare-fun m!709805 () Bool)

(assert (=> b!763263 m!709805))

(declare-fun m!709807 () Bool)

(assert (=> b!763269 m!709807))

(declare-fun m!709809 () Bool)

(assert (=> b!763268 m!709809))

(assert (=> b!763268 m!709809))

(declare-fun m!709811 () Bool)

(assert (=> b!763268 m!709811))

(declare-fun m!709813 () Bool)

(assert (=> start!66254 m!709813))

(declare-fun m!709815 () Bool)

(assert (=> start!66254 m!709815))

(assert (=> b!763264 m!709809))

(assert (=> b!763264 m!709809))

(declare-fun m!709817 () Bool)

(assert (=> b!763264 m!709817))

(assert (=> b!763264 m!709817))

(assert (=> b!763264 m!709809))

(declare-fun m!709819 () Bool)

(assert (=> b!763264 m!709819))

(assert (=> b!763273 m!709809))

(assert (=> b!763273 m!709809))

(declare-fun m!709821 () Bool)

(assert (=> b!763273 m!709821))

(assert (=> b!763272 m!709809))

(assert (=> b!763272 m!709809))

(declare-fun m!709823 () Bool)

(assert (=> b!763272 m!709823))

(declare-fun m!709825 () Bool)

(assert (=> b!763265 m!709825))

(declare-fun m!709827 () Bool)

(assert (=> b!763271 m!709827))

(declare-fun m!709829 () Bool)

(assert (=> b!763270 m!709829))

(push 1)

