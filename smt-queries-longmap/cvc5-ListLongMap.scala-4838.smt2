; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66572 () Bool)

(assert start!66572)

(declare-fun b!767216 () Bool)

(declare-datatypes ((array!42282 0))(
  ( (array!42283 (arr!20244 (Array (_ BitVec 32) (_ BitVec 64))) (size!20665 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42282)

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7844 0))(
  ( (MissingZero!7844 (index!33744 (_ BitVec 32))) (Found!7844 (index!33745 (_ BitVec 32))) (Intermediate!7844 (undefined!8656 Bool) (index!33746 (_ BitVec 32)) (x!64662 (_ BitVec 32))) (Undefined!7844) (MissingVacant!7844 (index!33747 (_ BitVec 32))) )
))
(declare-fun lt!341287 () SeekEntryResult!7844)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun e!427238 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42282 (_ BitVec 32)) SeekEntryResult!7844)

(assert (=> b!767216 (= e!427238 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20244 a!3186) j!159) a!3186 mask!3328) lt!341287))))

(declare-fun b!767217 () Bool)

(declare-fun e!427240 () Bool)

(declare-fun e!427237 () Bool)

(assert (=> b!767217 (= e!427240 e!427237)))

(declare-fun res!519002 () Bool)

(assert (=> b!767217 (=> (not res!519002) (not e!427237))))

(declare-fun lt!341288 () SeekEntryResult!7844)

(declare-fun lt!341286 () SeekEntryResult!7844)

(assert (=> b!767217 (= res!519002 (= lt!341288 lt!341286))))

(declare-fun lt!341289 () array!42282)

(declare-fun lt!341283 () (_ BitVec 64))

(assert (=> b!767217 (= lt!341286 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!341283 lt!341289 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!767217 (= lt!341288 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!341283 mask!3328) lt!341283 lt!341289 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!767217 (= lt!341283 (select (store (arr!20244 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!767217 (= lt!341289 (array!42283 (store (arr!20244 a!3186) i!1173 k!2102) (size!20665 a!3186)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!767218 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42282 (_ BitVec 32)) SeekEntryResult!7844)

(assert (=> b!767218 (= e!427238 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20244 a!3186) j!159) a!3186 mask!3328) (Found!7844 j!159)))))

(declare-fun b!767219 () Bool)

(declare-fun e!427239 () Bool)

(assert (=> b!767219 (= e!427239 e!427240)))

(declare-fun res!519011 () Bool)

(assert (=> b!767219 (=> (not res!519011) (not e!427240))))

(assert (=> b!767219 (= res!519011 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20244 a!3186) j!159) mask!3328) (select (arr!20244 a!3186) j!159) a!3186 mask!3328) lt!341287))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!767219 (= lt!341287 (Intermediate!7844 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!767220 () Bool)

(declare-fun res!519016 () Bool)

(assert (=> b!767220 (=> (not res!519016) (not e!427239))))

(declare-datatypes ((List!14246 0))(
  ( (Nil!14243) (Cons!14242 (h!15335 (_ BitVec 64)) (t!20561 List!14246)) )
))
(declare-fun arrayNoDuplicates!0 (array!42282 (_ BitVec 32) List!14246) Bool)

(assert (=> b!767220 (= res!519016 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14243))))

(declare-fun b!767221 () Bool)

(declare-fun res!519004 () Bool)

(assert (=> b!767221 (=> (not res!519004) (not e!427239))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42282 (_ BitVec 32)) Bool)

(assert (=> b!767221 (= res!519004 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!767223 () Bool)

(declare-fun res!519007 () Bool)

(assert (=> b!767223 (=> (not res!519007) (not e!427240))))

(assert (=> b!767223 (= res!519007 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20244 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!767224 () Bool)

(declare-fun e!427241 () Bool)

(assert (=> b!767224 (= e!427241 true)))

(declare-fun lt!341285 () SeekEntryResult!7844)

(assert (=> b!767224 (= lt!341285 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20244 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!767225 () Bool)

(declare-fun res!519015 () Bool)

(assert (=> b!767225 (=> (not res!519015) (not e!427239))))

(assert (=> b!767225 (= res!519015 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20665 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20665 a!3186))))))

(declare-fun lt!341284 () SeekEntryResult!7844)

(declare-fun b!767226 () Bool)

(declare-fun e!427234 () Bool)

(assert (=> b!767226 (= e!427234 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20244 a!3186) j!159) a!3186 mask!3328) lt!341284))))

(declare-fun b!767227 () Bool)

(declare-fun res!519014 () Bool)

(declare-fun e!427242 () Bool)

(assert (=> b!767227 (=> (not res!519014) (not e!427242))))

(assert (=> b!767227 (= res!519014 (and (= (size!20665 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20665 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20665 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!767228 () Bool)

(declare-fun res!519000 () Bool)

(assert (=> b!767228 (=> (not res!519000) (not e!427242))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!767228 (= res!519000 (validKeyInArray!0 (select (arr!20244 a!3186) j!159)))))

(declare-fun b!767229 () Bool)

(declare-fun e!427233 () Bool)

(assert (=> b!767229 (= e!427237 (not e!427233))))

(declare-fun res!519001 () Bool)

(assert (=> b!767229 (=> res!519001 e!427233)))

(assert (=> b!767229 (= res!519001 (or (not (is-Intermediate!7844 lt!341286)) (bvsge x!1131 (x!64662 lt!341286))))))

(declare-fun e!427236 () Bool)

(assert (=> b!767229 e!427236))

(declare-fun res!519008 () Bool)

(assert (=> b!767229 (=> (not res!519008) (not e!427236))))

(assert (=> b!767229 (= res!519008 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26414 0))(
  ( (Unit!26415) )
))
(declare-fun lt!341291 () Unit!26414)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42282 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26414)

(assert (=> b!767229 (= lt!341291 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun res!519009 () Bool)

(assert (=> start!66572 (=> (not res!519009) (not e!427242))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66572 (= res!519009 (validMask!0 mask!3328))))

(assert (=> start!66572 e!427242))

(assert (=> start!66572 true))

(declare-fun array_inv!16040 (array!42282) Bool)

(assert (=> start!66572 (array_inv!16040 a!3186)))

(declare-fun b!767222 () Bool)

(declare-fun res!519012 () Bool)

(assert (=> b!767222 (=> (not res!519012) (not e!427242))))

(assert (=> b!767222 (= res!519012 (validKeyInArray!0 k!2102))))

(declare-fun b!767230 () Bool)

(assert (=> b!767230 (= e!427233 e!427241)))

(declare-fun res!519013 () Bool)

(assert (=> b!767230 (=> res!519013 e!427241)))

(assert (=> b!767230 (= res!519013 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!341290 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!767230 (= lt!341290 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!767231 () Bool)

(assert (=> b!767231 (= e!427236 e!427234)))

(declare-fun res!519003 () Bool)

(assert (=> b!767231 (=> (not res!519003) (not e!427234))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42282 (_ BitVec 32)) SeekEntryResult!7844)

(assert (=> b!767231 (= res!519003 (= (seekEntryOrOpen!0 (select (arr!20244 a!3186) j!159) a!3186 mask!3328) lt!341284))))

(assert (=> b!767231 (= lt!341284 (Found!7844 j!159))))

(declare-fun b!767232 () Bool)

(declare-fun res!519010 () Bool)

(assert (=> b!767232 (=> (not res!519010) (not e!427242))))

(declare-fun arrayContainsKey!0 (array!42282 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!767232 (= res!519010 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!767233 () Bool)

(declare-fun res!519005 () Bool)

(assert (=> b!767233 (=> (not res!519005) (not e!427240))))

(assert (=> b!767233 (= res!519005 e!427238)))

(declare-fun c!84499 () Bool)

(assert (=> b!767233 (= c!84499 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!767234 () Bool)

(assert (=> b!767234 (= e!427242 e!427239)))

(declare-fun res!519006 () Bool)

(assert (=> b!767234 (=> (not res!519006) (not e!427239))))

(declare-fun lt!341282 () SeekEntryResult!7844)

(assert (=> b!767234 (= res!519006 (or (= lt!341282 (MissingZero!7844 i!1173)) (= lt!341282 (MissingVacant!7844 i!1173))))))

(assert (=> b!767234 (= lt!341282 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(assert (= (and start!66572 res!519009) b!767227))

(assert (= (and b!767227 res!519014) b!767228))

(assert (= (and b!767228 res!519000) b!767222))

(assert (= (and b!767222 res!519012) b!767232))

(assert (= (and b!767232 res!519010) b!767234))

(assert (= (and b!767234 res!519006) b!767221))

(assert (= (and b!767221 res!519004) b!767220))

(assert (= (and b!767220 res!519016) b!767225))

(assert (= (and b!767225 res!519015) b!767219))

(assert (= (and b!767219 res!519011) b!767223))

(assert (= (and b!767223 res!519007) b!767233))

(assert (= (and b!767233 c!84499) b!767216))

(assert (= (and b!767233 (not c!84499)) b!767218))

(assert (= (and b!767233 res!519005) b!767217))

(assert (= (and b!767217 res!519002) b!767229))

(assert (= (and b!767229 res!519008) b!767231))

(assert (= (and b!767231 res!519003) b!767226))

(assert (= (and b!767229 (not res!519001)) b!767230))

(assert (= (and b!767230 (not res!519013)) b!767224))

(declare-fun m!713025 () Bool)

(assert (=> start!66572 m!713025))

(declare-fun m!713027 () Bool)

(assert (=> start!66572 m!713027))

(declare-fun m!713029 () Bool)

(assert (=> b!767226 m!713029))

(assert (=> b!767226 m!713029))

(declare-fun m!713031 () Bool)

(assert (=> b!767226 m!713031))

(declare-fun m!713033 () Bool)

(assert (=> b!767220 m!713033))

(assert (=> b!767224 m!713029))

(assert (=> b!767224 m!713029))

(declare-fun m!713035 () Bool)

(assert (=> b!767224 m!713035))

(declare-fun m!713037 () Bool)

(assert (=> b!767217 m!713037))

(declare-fun m!713039 () Bool)

(assert (=> b!767217 m!713039))

(declare-fun m!713041 () Bool)

(assert (=> b!767217 m!713041))

(declare-fun m!713043 () Bool)

(assert (=> b!767217 m!713043))

(declare-fun m!713045 () Bool)

(assert (=> b!767217 m!713045))

(assert (=> b!767217 m!713037))

(declare-fun m!713047 () Bool)

(assert (=> b!767234 m!713047))

(declare-fun m!713049 () Bool)

(assert (=> b!767223 m!713049))

(assert (=> b!767218 m!713029))

(assert (=> b!767218 m!713029))

(assert (=> b!767218 m!713035))

(assert (=> b!767228 m!713029))

(assert (=> b!767228 m!713029))

(declare-fun m!713051 () Bool)

(assert (=> b!767228 m!713051))

(assert (=> b!767231 m!713029))

(assert (=> b!767231 m!713029))

(declare-fun m!713053 () Bool)

(assert (=> b!767231 m!713053))

(declare-fun m!713055 () Bool)

(assert (=> b!767229 m!713055))

(declare-fun m!713057 () Bool)

(assert (=> b!767229 m!713057))

(assert (=> b!767216 m!713029))

(assert (=> b!767216 m!713029))

(declare-fun m!713059 () Bool)

(assert (=> b!767216 m!713059))

(declare-fun m!713061 () Bool)

(assert (=> b!767230 m!713061))

(assert (=> b!767219 m!713029))

(assert (=> b!767219 m!713029))

(declare-fun m!713063 () Bool)

(assert (=> b!767219 m!713063))

(assert (=> b!767219 m!713063))

(assert (=> b!767219 m!713029))

(declare-fun m!713065 () Bool)

(assert (=> b!767219 m!713065))

(declare-fun m!713067 () Bool)

(assert (=> b!767232 m!713067))

(declare-fun m!713069 () Bool)

(assert (=> b!767221 m!713069))

(declare-fun m!713071 () Bool)

(assert (=> b!767222 m!713071))

(push 1)

