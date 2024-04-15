; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65618 () Bool)

(assert start!65618)

(declare-fun b!751181 () Bool)

(declare-fun res!507208 () Bool)

(declare-fun e!419036 () Bool)

(assert (=> b!751181 (=> (not res!507208) (not e!419036))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!751181 (= res!507208 (validKeyInArray!0 k0!2102))))

(declare-fun res!507203 () Bool)

(assert (=> start!65618 (=> (not res!507203) (not e!419036))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65618 (= res!507203 (validMask!0 mask!3328))))

(assert (=> start!65618 e!419036))

(assert (=> start!65618 true))

(declare-datatypes ((array!41808 0))(
  ( (array!41809 (arr!20018 (Array (_ BitVec 32) (_ BitVec 64))) (size!20439 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41808)

(declare-fun array_inv!15901 (array!41808) Bool)

(assert (=> start!65618 (array_inv!15901 a!3186)))

(declare-fun b!751182 () Bool)

(declare-datatypes ((Unit!25820 0))(
  ( (Unit!25821) )
))
(declare-fun e!419037 () Unit!25820)

(declare-fun Unit!25822 () Unit!25820)

(assert (=> b!751182 (= e!419037 Unit!25822)))

(declare-fun b!751183 () Bool)

(declare-fun res!507206 () Bool)

(declare-fun e!419038 () Bool)

(assert (=> b!751183 (=> (not res!507206) (not e!419038))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41808 (_ BitVec 32)) Bool)

(assert (=> b!751183 (= res!507206 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!751184 () Bool)

(declare-fun res!507196 () Bool)

(assert (=> b!751184 (=> (not res!507196) (not e!419038))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!751184 (= res!507196 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20439 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20439 a!3186))))))

(declare-fun b!751185 () Bool)

(declare-fun res!507197 () Bool)

(assert (=> b!751185 (=> (not res!507197) (not e!419038))))

(declare-datatypes ((List!14059 0))(
  ( (Nil!14056) (Cons!14055 (h!15127 (_ BitVec 64)) (t!20365 List!14059)) )
))
(declare-fun arrayNoDuplicates!0 (array!41808 (_ BitVec 32) List!14059) Bool)

(assert (=> b!751185 (= res!507197 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14056))))

(declare-fun b!751186 () Bool)

(declare-fun res!507205 () Bool)

(declare-fun e!419035 () Bool)

(assert (=> b!751186 (=> res!507205 e!419035)))

(declare-datatypes ((SeekEntryResult!7615 0))(
  ( (MissingZero!7615 (index!32828 (_ BitVec 32))) (Found!7615 (index!32829 (_ BitVec 32))) (Intermediate!7615 (undefined!8427 Bool) (index!32830 (_ BitVec 32)) (x!63760 (_ BitVec 32))) (Undefined!7615) (MissingVacant!7615 (index!32831 (_ BitVec 32))) )
))
(declare-fun lt!333937 () SeekEntryResult!7615)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41808 (_ BitVec 32)) SeekEntryResult!7615)

(assert (=> b!751186 (= res!507205 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20018 a!3186) j!159) a!3186 mask!3328) lt!333937)))))

(declare-fun b!751187 () Bool)

(declare-fun e!419034 () Bool)

(assert (=> b!751187 (= e!419034 (not e!419035))))

(declare-fun res!507200 () Bool)

(assert (=> b!751187 (=> res!507200 e!419035)))

(declare-fun lt!333944 () SeekEntryResult!7615)

(get-info :version)

(assert (=> b!751187 (= res!507200 (or (not ((_ is Intermediate!7615) lt!333944)) (bvslt x!1131 (x!63760 lt!333944)) (not (= x!1131 (x!63760 lt!333944))) (not (= index!1321 (index!32830 lt!333944)))))))

(declare-fun e!419039 () Bool)

(assert (=> b!751187 e!419039))

(declare-fun res!507212 () Bool)

(assert (=> b!751187 (=> (not res!507212) (not e!419039))))

(declare-fun lt!333947 () SeekEntryResult!7615)

(assert (=> b!751187 (= res!507212 (= lt!333947 lt!333937))))

(assert (=> b!751187 (= lt!333937 (Found!7615 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41808 (_ BitVec 32)) SeekEntryResult!7615)

(assert (=> b!751187 (= lt!333947 (seekEntryOrOpen!0 (select (arr!20018 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!751187 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!333946 () Unit!25820)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41808 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25820)

(assert (=> b!751187 (= lt!333946 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!751188 () Bool)

(declare-fun res!507202 () Bool)

(assert (=> b!751188 (=> (not res!507202) (not e!419036))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!751188 (= res!507202 (and (= (size!20439 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20439 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20439 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!751189 () Bool)

(declare-fun res!507201 () Bool)

(assert (=> b!751189 (=> (not res!507201) (not e!419036))))

(assert (=> b!751189 (= res!507201 (validKeyInArray!0 (select (arr!20018 a!3186) j!159)))))

(declare-fun b!751190 () Bool)

(declare-fun e!419032 () Bool)

(assert (=> b!751190 (= e!419035 e!419032)))

(declare-fun res!507209 () Bool)

(assert (=> b!751190 (=> res!507209 e!419032)))

(declare-fun lt!333941 () (_ BitVec 64))

(declare-fun lt!333943 () (_ BitVec 64))

(assert (=> b!751190 (= res!507209 (= lt!333941 lt!333943))))

(assert (=> b!751190 (= lt!333941 (select (store (arr!20018 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!751191 () Bool)

(assert (=> b!751191 (= e!419036 e!419038)))

(declare-fun res!507210 () Bool)

(assert (=> b!751191 (=> (not res!507210) (not e!419038))))

(declare-fun lt!333945 () SeekEntryResult!7615)

(assert (=> b!751191 (= res!507210 (or (= lt!333945 (MissingZero!7615 i!1173)) (= lt!333945 (MissingVacant!7615 i!1173))))))

(assert (=> b!751191 (= lt!333945 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!751192 () Bool)

(declare-fun res!507207 () Bool)

(declare-fun e!419033 () Bool)

(assert (=> b!751192 (=> (not res!507207) (not e!419033))))

(assert (=> b!751192 (= res!507207 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20018 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!751193 () Bool)

(assert (=> b!751193 (= e!419032 true)))

(declare-fun e!419041 () Bool)

(assert (=> b!751193 e!419041))

(declare-fun res!507213 () Bool)

(assert (=> b!751193 (=> (not res!507213) (not e!419041))))

(assert (=> b!751193 (= res!507213 (= lt!333941 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!333940 () Unit!25820)

(assert (=> b!751193 (= lt!333940 e!419037)))

(declare-fun c!82373 () Bool)

(assert (=> b!751193 (= c!82373 (= lt!333941 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!751194 () Bool)

(declare-fun res!507211 () Bool)

(assert (=> b!751194 (=> (not res!507211) (not e!419033))))

(declare-fun e!419040 () Bool)

(assert (=> b!751194 (= res!507211 e!419040)))

(declare-fun c!82374 () Bool)

(assert (=> b!751194 (= c!82374 (bvsle x!1131 resIntermediateX!5))))

(declare-fun lt!333942 () array!41808)

(declare-fun b!751195 () Bool)

(assert (=> b!751195 (= e!419041 (= (seekEntryOrOpen!0 lt!333943 lt!333942 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!333943 lt!333942 mask!3328)))))

(declare-fun b!751196 () Bool)

(declare-fun res!507198 () Bool)

(assert (=> b!751196 (=> (not res!507198) (not e!419036))))

(declare-fun arrayContainsKey!0 (array!41808 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!751196 (= res!507198 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!751197 () Bool)

(assert (=> b!751197 (= e!419039 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20018 a!3186) j!159) a!3186 mask!3328) lt!333937))))

(declare-fun b!751198 () Bool)

(assert (=> b!751198 (= e!419033 e!419034)))

(declare-fun res!507204 () Bool)

(assert (=> b!751198 (=> (not res!507204) (not e!419034))))

(declare-fun lt!333938 () SeekEntryResult!7615)

(assert (=> b!751198 (= res!507204 (= lt!333938 lt!333944))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41808 (_ BitVec 32)) SeekEntryResult!7615)

(assert (=> b!751198 (= lt!333944 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!333943 lt!333942 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!751198 (= lt!333938 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!333943 mask!3328) lt!333943 lt!333942 mask!3328))))

(assert (=> b!751198 (= lt!333943 (select (store (arr!20018 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!751198 (= lt!333942 (array!41809 (store (arr!20018 a!3186) i!1173 k0!2102) (size!20439 a!3186)))))

(declare-fun b!751199 () Bool)

(assert (=> b!751199 (= e!419040 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20018 a!3186) j!159) a!3186 mask!3328) (Found!7615 j!159)))))

(declare-fun b!751200 () Bool)

(declare-fun lt!333939 () SeekEntryResult!7615)

(assert (=> b!751200 (= e!419040 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20018 a!3186) j!159) a!3186 mask!3328) lt!333939))))

(declare-fun b!751201 () Bool)

(assert (=> b!751201 (= e!419038 e!419033)))

(declare-fun res!507199 () Bool)

(assert (=> b!751201 (=> (not res!507199) (not e!419033))))

(assert (=> b!751201 (= res!507199 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20018 a!3186) j!159) mask!3328) (select (arr!20018 a!3186) j!159) a!3186 mask!3328) lt!333939))))

(assert (=> b!751201 (= lt!333939 (Intermediate!7615 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!751202 () Bool)

(declare-fun Unit!25823 () Unit!25820)

(assert (=> b!751202 (= e!419037 Unit!25823)))

(assert (=> b!751202 false))

(assert (= (and start!65618 res!507203) b!751188))

(assert (= (and b!751188 res!507202) b!751189))

(assert (= (and b!751189 res!507201) b!751181))

(assert (= (and b!751181 res!507208) b!751196))

(assert (= (and b!751196 res!507198) b!751191))

(assert (= (and b!751191 res!507210) b!751183))

(assert (= (and b!751183 res!507206) b!751185))

(assert (= (and b!751185 res!507197) b!751184))

(assert (= (and b!751184 res!507196) b!751201))

(assert (= (and b!751201 res!507199) b!751192))

(assert (= (and b!751192 res!507207) b!751194))

(assert (= (and b!751194 c!82374) b!751200))

(assert (= (and b!751194 (not c!82374)) b!751199))

(assert (= (and b!751194 res!507211) b!751198))

(assert (= (and b!751198 res!507204) b!751187))

(assert (= (and b!751187 res!507212) b!751197))

(assert (= (and b!751187 (not res!507200)) b!751186))

(assert (= (and b!751186 (not res!507205)) b!751190))

(assert (= (and b!751190 (not res!507209)) b!751193))

(assert (= (and b!751193 c!82373) b!751202))

(assert (= (and b!751193 (not c!82373)) b!751182))

(assert (= (and b!751193 res!507213) b!751195))

(declare-fun m!699857 () Bool)

(assert (=> b!751196 m!699857))

(declare-fun m!699859 () Bool)

(assert (=> b!751199 m!699859))

(assert (=> b!751199 m!699859))

(declare-fun m!699861 () Bool)

(assert (=> b!751199 m!699861))

(assert (=> b!751200 m!699859))

(assert (=> b!751200 m!699859))

(declare-fun m!699863 () Bool)

(assert (=> b!751200 m!699863))

(assert (=> b!751197 m!699859))

(assert (=> b!751197 m!699859))

(declare-fun m!699865 () Bool)

(assert (=> b!751197 m!699865))

(declare-fun m!699867 () Bool)

(assert (=> b!751183 m!699867))

(assert (=> b!751187 m!699859))

(assert (=> b!751187 m!699859))

(declare-fun m!699869 () Bool)

(assert (=> b!751187 m!699869))

(declare-fun m!699871 () Bool)

(assert (=> b!751187 m!699871))

(declare-fun m!699873 () Bool)

(assert (=> b!751187 m!699873))

(declare-fun m!699875 () Bool)

(assert (=> b!751190 m!699875))

(declare-fun m!699877 () Bool)

(assert (=> b!751190 m!699877))

(assert (=> b!751189 m!699859))

(assert (=> b!751189 m!699859))

(declare-fun m!699879 () Bool)

(assert (=> b!751189 m!699879))

(declare-fun m!699881 () Bool)

(assert (=> b!751181 m!699881))

(declare-fun m!699883 () Bool)

(assert (=> b!751191 m!699883))

(declare-fun m!699885 () Bool)

(assert (=> b!751192 m!699885))

(declare-fun m!699887 () Bool)

(assert (=> b!751195 m!699887))

(declare-fun m!699889 () Bool)

(assert (=> b!751195 m!699889))

(declare-fun m!699891 () Bool)

(assert (=> start!65618 m!699891))

(declare-fun m!699893 () Bool)

(assert (=> start!65618 m!699893))

(declare-fun m!699895 () Bool)

(assert (=> b!751198 m!699895))

(declare-fun m!699897 () Bool)

(assert (=> b!751198 m!699897))

(assert (=> b!751198 m!699875))

(declare-fun m!699899 () Bool)

(assert (=> b!751198 m!699899))

(assert (=> b!751198 m!699897))

(declare-fun m!699901 () Bool)

(assert (=> b!751198 m!699901))

(declare-fun m!699903 () Bool)

(assert (=> b!751185 m!699903))

(assert (=> b!751186 m!699859))

(assert (=> b!751186 m!699859))

(assert (=> b!751186 m!699861))

(assert (=> b!751201 m!699859))

(assert (=> b!751201 m!699859))

(declare-fun m!699905 () Bool)

(assert (=> b!751201 m!699905))

(assert (=> b!751201 m!699905))

(assert (=> b!751201 m!699859))

(declare-fun m!699907 () Bool)

(assert (=> b!751201 m!699907))

(check-sat (not b!751186) (not b!751195) (not b!751181) (not b!751189) (not b!751183) (not b!751187) (not b!751197) (not b!751198) (not b!751201) (not start!65618) (not b!751199) (not b!751185) (not b!751196) (not b!751200) (not b!751191))
(check-sat)
