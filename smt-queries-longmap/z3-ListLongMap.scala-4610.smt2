; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64296 () Bool)

(assert start!64296)

(declare-fun b!722220 () Bool)

(declare-fun res!483966 () Bool)

(declare-fun e!404855 () Bool)

(assert (=> b!722220 (=> (not res!483966) (not e!404855))))

(declare-datatypes ((array!40877 0))(
  ( (array!40878 (arr!19561 (Array (_ BitVec 32) (_ BitVec 64))) (size!19982 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40877)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40877 (_ BitVec 32)) Bool)

(assert (=> b!722220 (= res!483966 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!722221 () Bool)

(declare-fun res!483970 () Bool)

(declare-fun e!404852 () Bool)

(assert (=> b!722221 (=> (not res!483970) (not e!404852))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40877 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!722221 (= res!483970 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!722222 () Bool)

(declare-fun res!483969 () Bool)

(assert (=> b!722222 (=> (not res!483969) (not e!404855))))

(declare-datatypes ((List!13563 0))(
  ( (Nil!13560) (Cons!13559 (h!14613 (_ BitVec 64)) (t!19878 List!13563)) )
))
(declare-fun arrayNoDuplicates!0 (array!40877 (_ BitVec 32) List!13563) Bool)

(assert (=> b!722222 (= res!483969 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13560))))

(declare-fun res!483968 () Bool)

(assert (=> start!64296 (=> (not res!483968) (not e!404852))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64296 (= res!483968 (validMask!0 mask!3328))))

(assert (=> start!64296 e!404852))

(assert (=> start!64296 true))

(declare-fun array_inv!15357 (array!40877) Bool)

(assert (=> start!64296 (array_inv!15357 a!3186)))

(declare-fun b!722223 () Bool)

(declare-fun res!483971 () Bool)

(assert (=> b!722223 (=> (not res!483971) (not e!404855))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!722223 (= res!483971 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19982 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19982 a!3186))))))

(declare-fun b!722224 () Bool)

(declare-fun res!483963 () Bool)

(assert (=> b!722224 (=> (not res!483963) (not e!404852))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!722224 (= res!483963 (validKeyInArray!0 (select (arr!19561 a!3186) j!159)))))

(declare-fun b!722225 () Bool)

(declare-fun res!483961 () Bool)

(assert (=> b!722225 (=> (not res!483961) (not e!404852))))

(assert (=> b!722225 (= res!483961 (validKeyInArray!0 k0!2102))))

(declare-fun b!722226 () Bool)

(declare-fun e!404851 () Bool)

(assert (=> b!722226 (= e!404851 false)))

(declare-fun lt!320236 () Bool)

(declare-fun e!404853 () Bool)

(assert (=> b!722226 (= lt!320236 e!404853)))

(declare-fun c!79501 () Bool)

(assert (=> b!722226 (= c!79501 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!722227 () Bool)

(declare-fun res!483964 () Bool)

(assert (=> b!722227 (=> (not res!483964) (not e!404852))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!722227 (= res!483964 (and (= (size!19982 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19982 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19982 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!722228 () Bool)

(assert (=> b!722228 (= e!404855 e!404851)))

(declare-fun res!483965 () Bool)

(assert (=> b!722228 (=> (not res!483965) (not e!404851))))

(declare-datatypes ((SeekEntryResult!7161 0))(
  ( (MissingZero!7161 (index!31012 (_ BitVec 32))) (Found!7161 (index!31013 (_ BitVec 32))) (Intermediate!7161 (undefined!7973 Bool) (index!31014 (_ BitVec 32)) (x!62018 (_ BitVec 32))) (Undefined!7161) (MissingVacant!7161 (index!31015 (_ BitVec 32))) )
))
(declare-fun lt!320235 () SeekEntryResult!7161)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40877 (_ BitVec 32)) SeekEntryResult!7161)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!722228 (= res!483965 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19561 a!3186) j!159) mask!3328) (select (arr!19561 a!3186) j!159) a!3186 mask!3328) lt!320235))))

(assert (=> b!722228 (= lt!320235 (Intermediate!7161 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!722229 () Bool)

(assert (=> b!722229 (= e!404852 e!404855)))

(declare-fun res!483967 () Bool)

(assert (=> b!722229 (=> (not res!483967) (not e!404855))))

(declare-fun lt!320237 () SeekEntryResult!7161)

(assert (=> b!722229 (= res!483967 (or (= lt!320237 (MissingZero!7161 i!1173)) (= lt!320237 (MissingVacant!7161 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40877 (_ BitVec 32)) SeekEntryResult!7161)

(assert (=> b!722229 (= lt!320237 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!722230 () Bool)

(assert (=> b!722230 (= e!404853 (not (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19561 a!3186) j!159) a!3186 mask!3328) lt!320235)))))

(declare-fun b!722231 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40877 (_ BitVec 32)) SeekEntryResult!7161)

(assert (=> b!722231 (= e!404853 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19561 a!3186) j!159) a!3186 mask!3328) (Found!7161 j!159))))))

(declare-fun b!722232 () Bool)

(declare-fun res!483962 () Bool)

(assert (=> b!722232 (=> (not res!483962) (not e!404851))))

(assert (=> b!722232 (= res!483962 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19561 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!64296 res!483968) b!722227))

(assert (= (and b!722227 res!483964) b!722224))

(assert (= (and b!722224 res!483963) b!722225))

(assert (= (and b!722225 res!483961) b!722221))

(assert (= (and b!722221 res!483970) b!722229))

(assert (= (and b!722229 res!483967) b!722220))

(assert (= (and b!722220 res!483966) b!722222))

(assert (= (and b!722222 res!483969) b!722223))

(assert (= (and b!722223 res!483971) b!722228))

(assert (= (and b!722228 res!483965) b!722232))

(assert (= (and b!722232 res!483962) b!722226))

(assert (= (and b!722226 c!79501) b!722230))

(assert (= (and b!722226 (not c!79501)) b!722231))

(declare-fun m!676805 () Bool)

(assert (=> start!64296 m!676805))

(declare-fun m!676807 () Bool)

(assert (=> start!64296 m!676807))

(declare-fun m!676809 () Bool)

(assert (=> b!722221 m!676809))

(declare-fun m!676811 () Bool)

(assert (=> b!722228 m!676811))

(assert (=> b!722228 m!676811))

(declare-fun m!676813 () Bool)

(assert (=> b!722228 m!676813))

(assert (=> b!722228 m!676813))

(assert (=> b!722228 m!676811))

(declare-fun m!676815 () Bool)

(assert (=> b!722228 m!676815))

(assert (=> b!722230 m!676811))

(assert (=> b!722230 m!676811))

(declare-fun m!676817 () Bool)

(assert (=> b!722230 m!676817))

(declare-fun m!676819 () Bool)

(assert (=> b!722222 m!676819))

(declare-fun m!676821 () Bool)

(assert (=> b!722225 m!676821))

(declare-fun m!676823 () Bool)

(assert (=> b!722220 m!676823))

(assert (=> b!722224 m!676811))

(assert (=> b!722224 m!676811))

(declare-fun m!676825 () Bool)

(assert (=> b!722224 m!676825))

(declare-fun m!676827 () Bool)

(assert (=> b!722232 m!676827))

(assert (=> b!722231 m!676811))

(assert (=> b!722231 m!676811))

(declare-fun m!676829 () Bool)

(assert (=> b!722231 m!676829))

(declare-fun m!676831 () Bool)

(assert (=> b!722229 m!676831))

(check-sat (not b!722228) (not b!722220) (not b!722222) (not b!722225) (not b!722221) (not b!722224) (not b!722229) (not b!722230) (not start!64296) (not b!722231))
(check-sat)
