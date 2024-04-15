; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67778 () Bool)

(assert start!67778)

(declare-fun b!788062 () Bool)

(declare-fun res!533929 () Bool)

(declare-fun e!438009 () Bool)

(assert (=> b!788062 (=> (not res!533929) (not e!438009))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((array!42837 0))(
  ( (array!42838 (arr!20507 (Array (_ BitVec 32) (_ BitVec 64))) (size!20928 (_ BitVec 32))) )
))
(declare-fun lt!351473 () array!42837)

(declare-fun lt!351474 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8104 0))(
  ( (MissingZero!8104 (index!34784 (_ BitVec 32))) (Found!8104 (index!34785 (_ BitVec 32))) (Intermediate!8104 (undefined!8916 Bool) (index!34786 (_ BitVec 32)) (x!65727 (_ BitVec 32))) (Undefined!8104) (MissingVacant!8104 (index!34787 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42837 (_ BitVec 32)) SeekEntryResult!8104)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42837 (_ BitVec 32)) SeekEntryResult!8104)

(assert (=> b!788062 (= res!533929 (= (seekEntryOrOpen!0 lt!351474 lt!351473 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!351474 lt!351473 mask!3328)))))

(declare-fun b!788063 () Bool)

(declare-fun e!438006 () Bool)

(declare-fun e!437999 () Bool)

(assert (=> b!788063 (= e!438006 e!437999)))

(declare-fun res!533934 () Bool)

(assert (=> b!788063 (=> res!533934 e!437999)))

(declare-fun lt!351470 () SeekEntryResult!8104)

(declare-fun lt!351465 () SeekEntryResult!8104)

(assert (=> b!788063 (= res!533934 (not (= lt!351470 lt!351465)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun a!3186 () array!42837)

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!788063 (= lt!351470 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20507 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!788064 () Bool)

(declare-fun e!438003 () Bool)

(assert (=> b!788064 (= e!437999 e!438003)))

(declare-fun res!533939 () Bool)

(assert (=> b!788064 (=> res!533939 e!438003)))

(declare-fun lt!351466 () (_ BitVec 64))

(assert (=> b!788064 (= res!533939 (= lt!351466 lt!351474))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!788064 (= lt!351466 (select (store (arr!20507 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!788065 () Bool)

(declare-fun e!438004 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!788065 (= e!438004 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20507 a!3186) j!159) a!3186 mask!3328) lt!351465))))

(declare-fun b!788066 () Bool)

(declare-fun res!533937 () Bool)

(declare-fun e!438001 () Bool)

(assert (=> b!788066 (=> (not res!533937) (not e!438001))))

(assert (=> b!788066 (= res!533937 (and (= (size!20928 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20928 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20928 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!788067 () Bool)

(declare-datatypes ((Unit!27284 0))(
  ( (Unit!27285) )
))
(declare-fun e!438005 () Unit!27284)

(declare-fun Unit!27286 () Unit!27284)

(assert (=> b!788067 (= e!438005 Unit!27286)))

(assert (=> b!788067 false))

(declare-fun b!788068 () Bool)

(declare-fun res!533927 () Bool)

(declare-fun e!438002 () Bool)

(assert (=> b!788068 (=> (not res!533927) (not e!438002))))

(assert (=> b!788068 (= res!533927 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20928 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20928 a!3186))))))

(declare-fun b!788069 () Bool)

(declare-fun res!533940 () Bool)

(assert (=> b!788069 (=> (not res!533940) (not e!438002))))

(declare-datatypes ((List!14548 0))(
  ( (Nil!14545) (Cons!14544 (h!15667 (_ BitVec 64)) (t!20854 List!14548)) )
))
(declare-fun arrayNoDuplicates!0 (array!42837 (_ BitVec 32) List!14548) Bool)

(assert (=> b!788069 (= res!533940 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14545))))

(declare-fun b!788070 () Bool)

(declare-fun res!533925 () Bool)

(assert (=> b!788070 (=> (not res!533925) (not e!438002))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42837 (_ BitVec 32)) Bool)

(assert (=> b!788070 (= res!533925 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!533938 () Bool)

(assert (=> start!67778 (=> (not res!533938) (not e!438001))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67778 (= res!533938 (validMask!0 mask!3328))))

(assert (=> start!67778 e!438001))

(assert (=> start!67778 true))

(declare-fun array_inv!16390 (array!42837) Bool)

(assert (=> start!67778 (array_inv!16390 a!3186)))

(declare-fun lt!351471 () SeekEntryResult!8104)

(declare-fun b!788071 () Bool)

(declare-fun e!438000 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42837 (_ BitVec 32)) SeekEntryResult!8104)

(assert (=> b!788071 (= e!438000 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20507 a!3186) j!159) a!3186 mask!3328) lt!351471))))

(declare-fun b!788072 () Bool)

(assert (=> b!788072 (= e!438001 e!438002)))

(declare-fun res!533930 () Bool)

(assert (=> b!788072 (=> (not res!533930) (not e!438002))))

(declare-fun lt!351468 () SeekEntryResult!8104)

(assert (=> b!788072 (= res!533930 (or (= lt!351468 (MissingZero!8104 i!1173)) (= lt!351468 (MissingVacant!8104 i!1173))))))

(assert (=> b!788072 (= lt!351468 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!788073 () Bool)

(declare-fun Unit!27287 () Unit!27284)

(assert (=> b!788073 (= e!438005 Unit!27287)))

(declare-fun b!788074 () Bool)

(declare-fun e!438010 () Bool)

(declare-fun e!438008 () Bool)

(assert (=> b!788074 (= e!438010 e!438008)))

(declare-fun res!533936 () Bool)

(assert (=> b!788074 (=> (not res!533936) (not e!438008))))

(declare-fun lt!351472 () SeekEntryResult!8104)

(declare-fun lt!351467 () SeekEntryResult!8104)

(assert (=> b!788074 (= res!533936 (= lt!351472 lt!351467))))

(assert (=> b!788074 (= lt!351467 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!351474 lt!351473 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!788074 (= lt!351472 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!351474 mask!3328) lt!351474 lt!351473 mask!3328))))

(assert (=> b!788074 (= lt!351474 (select (store (arr!20507 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!788074 (= lt!351473 (array!42838 (store (arr!20507 a!3186) i!1173 k0!2102) (size!20928 a!3186)))))

(declare-fun b!788075 () Bool)

(declare-fun res!533935 () Bool)

(assert (=> b!788075 (=> (not res!533935) (not e!438001))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!788075 (= res!533935 (validKeyInArray!0 k0!2102))))

(declare-fun b!788076 () Bool)

(declare-fun lt!351469 () SeekEntryResult!8104)

(assert (=> b!788076 (= e!438009 (= lt!351469 lt!351470))))

(declare-fun b!788077 () Bool)

(assert (=> b!788077 (= e!438002 e!438010)))

(declare-fun res!533943 () Bool)

(assert (=> b!788077 (=> (not res!533943) (not e!438010))))

(assert (=> b!788077 (= res!533943 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20507 a!3186) j!159) mask!3328) (select (arr!20507 a!3186) j!159) a!3186 mask!3328) lt!351471))))

(assert (=> b!788077 (= lt!351471 (Intermediate!8104 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!788078 () Bool)

(assert (=> b!788078 (= e!438003 (or (not (= (select (arr!20507 a!3186) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= index!1321 resIntermediateIndex!5))))))

(assert (=> b!788078 e!438009))

(declare-fun res!533926 () Bool)

(assert (=> b!788078 (=> (not res!533926) (not e!438009))))

(assert (=> b!788078 (= res!533926 (= lt!351466 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!351475 () Unit!27284)

(assert (=> b!788078 (= lt!351475 e!438005)))

(declare-fun c!87477 () Bool)

(assert (=> b!788078 (= c!87477 (= lt!351466 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!788079 () Bool)

(declare-fun res!533942 () Bool)

(assert (=> b!788079 (=> (not res!533942) (not e!438001))))

(declare-fun arrayContainsKey!0 (array!42837 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!788079 (= res!533942 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!788080 () Bool)

(declare-fun res!533928 () Bool)

(assert (=> b!788080 (=> (not res!533928) (not e!438010))))

(assert (=> b!788080 (= res!533928 e!438000)))

(declare-fun c!87476 () Bool)

(assert (=> b!788080 (= c!87476 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!788081 () Bool)

(declare-fun res!533931 () Bool)

(assert (=> b!788081 (=> (not res!533931) (not e!438001))))

(assert (=> b!788081 (= res!533931 (validKeyInArray!0 (select (arr!20507 a!3186) j!159)))))

(declare-fun b!788082 () Bool)

(assert (=> b!788082 (= e!438008 (not e!438006))))

(declare-fun res!533941 () Bool)

(assert (=> b!788082 (=> res!533941 e!438006)))

(get-info :version)

(assert (=> b!788082 (= res!533941 (or (not ((_ is Intermediate!8104) lt!351467)) (bvslt x!1131 (x!65727 lt!351467)) (not (= x!1131 (x!65727 lt!351467))) (not (= index!1321 (index!34786 lt!351467)))))))

(assert (=> b!788082 e!438004))

(declare-fun res!533932 () Bool)

(assert (=> b!788082 (=> (not res!533932) (not e!438004))))

(assert (=> b!788082 (= res!533932 (= lt!351469 lt!351465))))

(assert (=> b!788082 (= lt!351465 (Found!8104 j!159))))

(assert (=> b!788082 (= lt!351469 (seekEntryOrOpen!0 (select (arr!20507 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!788082 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!351476 () Unit!27284)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42837 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27284)

(assert (=> b!788082 (= lt!351476 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!788083 () Bool)

(assert (=> b!788083 (= e!438000 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20507 a!3186) j!159) a!3186 mask!3328) (Found!8104 j!159)))))

(declare-fun b!788084 () Bool)

(declare-fun res!533933 () Bool)

(assert (=> b!788084 (=> (not res!533933) (not e!438010))))

(assert (=> b!788084 (= res!533933 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20507 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!67778 res!533938) b!788066))

(assert (= (and b!788066 res!533937) b!788081))

(assert (= (and b!788081 res!533931) b!788075))

(assert (= (and b!788075 res!533935) b!788079))

(assert (= (and b!788079 res!533942) b!788072))

(assert (= (and b!788072 res!533930) b!788070))

(assert (= (and b!788070 res!533925) b!788069))

(assert (= (and b!788069 res!533940) b!788068))

(assert (= (and b!788068 res!533927) b!788077))

(assert (= (and b!788077 res!533943) b!788084))

(assert (= (and b!788084 res!533933) b!788080))

(assert (= (and b!788080 c!87476) b!788071))

(assert (= (and b!788080 (not c!87476)) b!788083))

(assert (= (and b!788080 res!533928) b!788074))

(assert (= (and b!788074 res!533936) b!788082))

(assert (= (and b!788082 res!533932) b!788065))

(assert (= (and b!788082 (not res!533941)) b!788063))

(assert (= (and b!788063 (not res!533934)) b!788064))

(assert (= (and b!788064 (not res!533939)) b!788078))

(assert (= (and b!788078 c!87477) b!788067))

(assert (= (and b!788078 (not c!87477)) b!788073))

(assert (= (and b!788078 res!533926) b!788062))

(assert (= (and b!788062 res!533929) b!788076))

(declare-fun m!728925 () Bool)

(assert (=> b!788070 m!728925))

(declare-fun m!728927 () Bool)

(assert (=> b!788075 m!728927))

(declare-fun m!728929 () Bool)

(assert (=> b!788079 m!728929))

(declare-fun m!728931 () Bool)

(assert (=> b!788084 m!728931))

(declare-fun m!728933 () Bool)

(assert (=> b!788077 m!728933))

(assert (=> b!788077 m!728933))

(declare-fun m!728935 () Bool)

(assert (=> b!788077 m!728935))

(assert (=> b!788077 m!728935))

(assert (=> b!788077 m!728933))

(declare-fun m!728937 () Bool)

(assert (=> b!788077 m!728937))

(declare-fun m!728939 () Bool)

(assert (=> b!788069 m!728939))

(assert (=> b!788063 m!728933))

(assert (=> b!788063 m!728933))

(declare-fun m!728941 () Bool)

(assert (=> b!788063 m!728941))

(declare-fun m!728943 () Bool)

(assert (=> start!67778 m!728943))

(declare-fun m!728945 () Bool)

(assert (=> start!67778 m!728945))

(assert (=> b!788081 m!728933))

(assert (=> b!788081 m!728933))

(declare-fun m!728947 () Bool)

(assert (=> b!788081 m!728947))

(declare-fun m!728949 () Bool)

(assert (=> b!788072 m!728949))

(assert (=> b!788065 m!728933))

(assert (=> b!788065 m!728933))

(declare-fun m!728951 () Bool)

(assert (=> b!788065 m!728951))

(assert (=> b!788071 m!728933))

(assert (=> b!788071 m!728933))

(declare-fun m!728953 () Bool)

(assert (=> b!788071 m!728953))

(assert (=> b!788082 m!728933))

(assert (=> b!788082 m!728933))

(declare-fun m!728955 () Bool)

(assert (=> b!788082 m!728955))

(declare-fun m!728957 () Bool)

(assert (=> b!788082 m!728957))

(declare-fun m!728959 () Bool)

(assert (=> b!788082 m!728959))

(declare-fun m!728961 () Bool)

(assert (=> b!788064 m!728961))

(declare-fun m!728963 () Bool)

(assert (=> b!788064 m!728963))

(declare-fun m!728965 () Bool)

(assert (=> b!788078 m!728965))

(declare-fun m!728967 () Bool)

(assert (=> b!788062 m!728967))

(declare-fun m!728969 () Bool)

(assert (=> b!788062 m!728969))

(declare-fun m!728971 () Bool)

(assert (=> b!788074 m!728971))

(declare-fun m!728973 () Bool)

(assert (=> b!788074 m!728973))

(declare-fun m!728975 () Bool)

(assert (=> b!788074 m!728975))

(assert (=> b!788074 m!728961))

(declare-fun m!728977 () Bool)

(assert (=> b!788074 m!728977))

(assert (=> b!788074 m!728971))

(assert (=> b!788083 m!728933))

(assert (=> b!788083 m!728933))

(assert (=> b!788083 m!728941))

(check-sat (not b!788077) (not b!788069) (not b!788081) (not b!788070) (not b!788079) (not b!788082) (not b!788072) (not b!788071) (not b!788083) (not b!788074) (not b!788062) (not start!67778) (not b!788065) (not b!788075) (not b!788063))
(check-sat)
(get-model)

(declare-fun d!102633 () Bool)

(declare-fun res!534062 () Bool)

(declare-fun e!438087 () Bool)

(assert (=> d!102633 (=> res!534062 e!438087)))

(assert (=> d!102633 (= res!534062 (= (select (arr!20507 a!3186) #b00000000000000000000000000000000) k0!2102))))

(assert (=> d!102633 (= (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000) e!438087)))

(declare-fun b!788227 () Bool)

(declare-fun e!438088 () Bool)

(assert (=> b!788227 (= e!438087 e!438088)))

(declare-fun res!534063 () Bool)

(assert (=> b!788227 (=> (not res!534063) (not e!438088))))

(assert (=> b!788227 (= res!534063 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20928 a!3186)))))

(declare-fun b!788228 () Bool)

(assert (=> b!788228 (= e!438088 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!102633 (not res!534062)) b!788227))

(assert (= (and b!788227 res!534063) b!788228))

(declare-fun m!729087 () Bool)

(assert (=> d!102633 m!729087))

(declare-fun m!729089 () Bool)

(assert (=> b!788228 m!729089))

(assert (=> b!788079 d!102633))

(declare-fun b!788239 () Bool)

(declare-fun e!438099 () Bool)

(declare-fun call!35254 () Bool)

(assert (=> b!788239 (= e!438099 call!35254)))

(declare-fun bm!35251 () Bool)

(declare-fun c!87492 () Bool)

(assert (=> bm!35251 (= call!35254 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!87492 (Cons!14544 (select (arr!20507 a!3186) #b00000000000000000000000000000000) Nil!14545) Nil!14545)))))

(declare-fun b!788240 () Bool)

(declare-fun e!438098 () Bool)

(assert (=> b!788240 (= e!438098 e!438099)))

(assert (=> b!788240 (= c!87492 (validKeyInArray!0 (select (arr!20507 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!788241 () Bool)

(assert (=> b!788241 (= e!438099 call!35254)))

(declare-fun b!788243 () Bool)

(declare-fun e!438097 () Bool)

(declare-fun contains!4089 (List!14548 (_ BitVec 64)) Bool)

(assert (=> b!788243 (= e!438097 (contains!4089 Nil!14545 (select (arr!20507 a!3186) #b00000000000000000000000000000000)))))

(declare-fun d!102635 () Bool)

(declare-fun res!534070 () Bool)

(declare-fun e!438100 () Bool)

(assert (=> d!102635 (=> res!534070 e!438100)))

(assert (=> d!102635 (= res!534070 (bvsge #b00000000000000000000000000000000 (size!20928 a!3186)))))

(assert (=> d!102635 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14545) e!438100)))

(declare-fun b!788242 () Bool)

(assert (=> b!788242 (= e!438100 e!438098)))

(declare-fun res!534071 () Bool)

(assert (=> b!788242 (=> (not res!534071) (not e!438098))))

(assert (=> b!788242 (= res!534071 (not e!438097))))

(declare-fun res!534072 () Bool)

(assert (=> b!788242 (=> (not res!534072) (not e!438097))))

(assert (=> b!788242 (= res!534072 (validKeyInArray!0 (select (arr!20507 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!102635 (not res!534070)) b!788242))

(assert (= (and b!788242 res!534072) b!788243))

(assert (= (and b!788242 res!534071) b!788240))

(assert (= (and b!788240 c!87492) b!788241))

(assert (= (and b!788240 (not c!87492)) b!788239))

(assert (= (or b!788241 b!788239) bm!35251))

(assert (=> bm!35251 m!729087))

(declare-fun m!729091 () Bool)

(assert (=> bm!35251 m!729091))

(assert (=> b!788240 m!729087))

(assert (=> b!788240 m!729087))

(declare-fun m!729093 () Bool)

(assert (=> b!788240 m!729093))

(assert (=> b!788243 m!729087))

(assert (=> b!788243 m!729087))

(declare-fun m!729095 () Bool)

(assert (=> b!788243 m!729095))

(assert (=> b!788242 m!729087))

(assert (=> b!788242 m!729087))

(assert (=> b!788242 m!729093))

(assert (=> b!788069 d!102635))

(declare-fun b!788256 () Bool)

(declare-fun e!438108 () SeekEntryResult!8104)

(assert (=> b!788256 (= e!438108 (MissingVacant!8104 resIntermediateIndex!5))))

(declare-fun d!102637 () Bool)

(declare-fun lt!351553 () SeekEntryResult!8104)

(assert (=> d!102637 (and (or ((_ is Undefined!8104) lt!351553) (not ((_ is Found!8104) lt!351553)) (and (bvsge (index!34785 lt!351553) #b00000000000000000000000000000000) (bvslt (index!34785 lt!351553) (size!20928 a!3186)))) (or ((_ is Undefined!8104) lt!351553) ((_ is Found!8104) lt!351553) (not ((_ is MissingVacant!8104) lt!351553)) (not (= (index!34787 lt!351553) resIntermediateIndex!5)) (and (bvsge (index!34787 lt!351553) #b00000000000000000000000000000000) (bvslt (index!34787 lt!351553) (size!20928 a!3186)))) (or ((_ is Undefined!8104) lt!351553) (ite ((_ is Found!8104) lt!351553) (= (select (arr!20507 a!3186) (index!34785 lt!351553)) (select (arr!20507 a!3186) j!159)) (and ((_ is MissingVacant!8104) lt!351553) (= (index!34787 lt!351553) resIntermediateIndex!5) (= (select (arr!20507 a!3186) (index!34787 lt!351553)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!438109 () SeekEntryResult!8104)

(assert (=> d!102637 (= lt!351553 e!438109)))

(declare-fun c!87501 () Bool)

(assert (=> d!102637 (= c!87501 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(declare-fun lt!351554 () (_ BitVec 64))

(assert (=> d!102637 (= lt!351554 (select (arr!20507 a!3186) resIntermediateIndex!5))))

(assert (=> d!102637 (validMask!0 mask!3328)))

(assert (=> d!102637 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20507 a!3186) j!159) a!3186 mask!3328) lt!351553)))

(declare-fun b!788257 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!788257 (= e!438108 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) resIntermediateIndex!5 (select (arr!20507 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!788258 () Bool)

(declare-fun e!438107 () SeekEntryResult!8104)

(assert (=> b!788258 (= e!438109 e!438107)))

(declare-fun c!87500 () Bool)

(assert (=> b!788258 (= c!87500 (= lt!351554 (select (arr!20507 a!3186) j!159)))))

(declare-fun b!788259 () Bool)

(assert (=> b!788259 (= e!438109 Undefined!8104)))

(declare-fun b!788260 () Bool)

(assert (=> b!788260 (= e!438107 (Found!8104 resIntermediateIndex!5))))

(declare-fun b!788261 () Bool)

(declare-fun c!87499 () Bool)

(assert (=> b!788261 (= c!87499 (= lt!351554 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!788261 (= e!438107 e!438108)))

(assert (= (and d!102637 c!87501) b!788259))

(assert (= (and d!102637 (not c!87501)) b!788258))

(assert (= (and b!788258 c!87500) b!788260))

(assert (= (and b!788258 (not c!87500)) b!788261))

(assert (= (and b!788261 c!87499) b!788256))

(assert (= (and b!788261 (not c!87499)) b!788257))

(declare-fun m!729097 () Bool)

(assert (=> d!102637 m!729097))

(declare-fun m!729099 () Bool)

(assert (=> d!102637 m!729099))

(assert (=> d!102637 m!728931))

(assert (=> d!102637 m!728943))

(declare-fun m!729101 () Bool)

(assert (=> b!788257 m!729101))

(assert (=> b!788257 m!729101))

(assert (=> b!788257 m!728933))

(declare-fun m!729103 () Bool)

(assert (=> b!788257 m!729103))

(assert (=> b!788065 d!102637))

(declare-fun b!788280 () Bool)

(declare-fun e!438123 () Bool)

(declare-fun lt!351559 () SeekEntryResult!8104)

(assert (=> b!788280 (= e!438123 (bvsge (x!65727 lt!351559) #b01111111111111111111111111111110))))

(declare-fun e!438120 () SeekEntryResult!8104)

(declare-fun b!788281 () Bool)

(assert (=> b!788281 (= e!438120 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20507 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!20507 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!788282 () Bool)

(assert (=> b!788282 (and (bvsge (index!34786 lt!351559) #b00000000000000000000000000000000) (bvslt (index!34786 lt!351559) (size!20928 a!3186)))))

(declare-fun e!438121 () Bool)

(assert (=> b!788282 (= e!438121 (= (select (arr!20507 a!3186) (index!34786 lt!351559)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!788283 () Bool)

(assert (=> b!788283 (and (bvsge (index!34786 lt!351559) #b00000000000000000000000000000000) (bvslt (index!34786 lt!351559) (size!20928 a!3186)))))

(declare-fun res!534080 () Bool)

(assert (=> b!788283 (= res!534080 (= (select (arr!20507 a!3186) (index!34786 lt!351559)) (select (arr!20507 a!3186) j!159)))))

(assert (=> b!788283 (=> res!534080 e!438121)))

(declare-fun e!438124 () Bool)

(assert (=> b!788283 (= e!438124 e!438121)))

(declare-fun d!102639 () Bool)

(assert (=> d!102639 e!438123))

(declare-fun c!87510 () Bool)

(assert (=> d!102639 (= c!87510 (and ((_ is Intermediate!8104) lt!351559) (undefined!8916 lt!351559)))))

(declare-fun e!438122 () SeekEntryResult!8104)

(assert (=> d!102639 (= lt!351559 e!438122)))

(declare-fun c!87508 () Bool)

(assert (=> d!102639 (= c!87508 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!351560 () (_ BitVec 64))

(assert (=> d!102639 (= lt!351560 (select (arr!20507 a!3186) (toIndex!0 (select (arr!20507 a!3186) j!159) mask!3328)))))

(assert (=> d!102639 (validMask!0 mask!3328)))

(assert (=> d!102639 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20507 a!3186) j!159) mask!3328) (select (arr!20507 a!3186) j!159) a!3186 mask!3328) lt!351559)))

(declare-fun b!788284 () Bool)

(assert (=> b!788284 (= e!438122 e!438120)))

(declare-fun c!87509 () Bool)

(assert (=> b!788284 (= c!87509 (or (= lt!351560 (select (arr!20507 a!3186) j!159)) (= (bvadd lt!351560 lt!351560) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!788285 () Bool)

(assert (=> b!788285 (= e!438123 e!438124)))

(declare-fun res!534079 () Bool)

(assert (=> b!788285 (= res!534079 (and ((_ is Intermediate!8104) lt!351559) (not (undefined!8916 lt!351559)) (bvslt (x!65727 lt!351559) #b01111111111111111111111111111110) (bvsge (x!65727 lt!351559) #b00000000000000000000000000000000) (bvsge (x!65727 lt!351559) #b00000000000000000000000000000000)))))

(assert (=> b!788285 (=> (not res!534079) (not e!438124))))

(declare-fun b!788286 () Bool)

(assert (=> b!788286 (= e!438120 (Intermediate!8104 false (toIndex!0 (select (arr!20507 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!788287 () Bool)

(assert (=> b!788287 (and (bvsge (index!34786 lt!351559) #b00000000000000000000000000000000) (bvslt (index!34786 lt!351559) (size!20928 a!3186)))))

(declare-fun res!534081 () Bool)

(assert (=> b!788287 (= res!534081 (= (select (arr!20507 a!3186) (index!34786 lt!351559)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!788287 (=> res!534081 e!438121)))

(declare-fun b!788288 () Bool)

(assert (=> b!788288 (= e!438122 (Intermediate!8104 true (toIndex!0 (select (arr!20507 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(assert (= (and d!102639 c!87508) b!788288))

(assert (= (and d!102639 (not c!87508)) b!788284))

(assert (= (and b!788284 c!87509) b!788286))

(assert (= (and b!788284 (not c!87509)) b!788281))

(assert (= (and d!102639 c!87510) b!788280))

(assert (= (and d!102639 (not c!87510)) b!788285))

(assert (= (and b!788285 res!534079) b!788283))

(assert (= (and b!788283 (not res!534080)) b!788287))

(assert (= (and b!788287 (not res!534081)) b!788282))

(assert (=> b!788281 m!728935))

(declare-fun m!729105 () Bool)

(assert (=> b!788281 m!729105))

(assert (=> b!788281 m!729105))

(assert (=> b!788281 m!728933))

(declare-fun m!729107 () Bool)

(assert (=> b!788281 m!729107))

(declare-fun m!729109 () Bool)

(assert (=> b!788282 m!729109))

(assert (=> d!102639 m!728935))

(declare-fun m!729111 () Bool)

(assert (=> d!102639 m!729111))

(assert (=> d!102639 m!728943))

(assert (=> b!788283 m!729109))

(assert (=> b!788287 m!729109))

(assert (=> b!788077 d!102639))

(declare-fun d!102643 () Bool)

(declare-fun lt!351570 () (_ BitVec 32))

(declare-fun lt!351569 () (_ BitVec 32))

(assert (=> d!102643 (= lt!351570 (bvmul (bvxor lt!351569 (bvlshr lt!351569 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!102643 (= lt!351569 ((_ extract 31 0) (bvand (bvxor (select (arr!20507 a!3186) j!159) (bvlshr (select (arr!20507 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!102643 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!534082 (let ((h!15670 ((_ extract 31 0) (bvand (bvxor (select (arr!20507 a!3186) j!159) (bvlshr (select (arr!20507 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!65732 (bvmul (bvxor h!15670 (bvlshr h!15670 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!65732 (bvlshr x!65732 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!534082 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!534082 #b00000000000000000000000000000000))))))

(assert (=> d!102643 (= (toIndex!0 (select (arr!20507 a!3186) j!159) mask!3328) (bvand (bvxor lt!351570 (bvlshr lt!351570 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!788077 d!102643))

(declare-fun b!788307 () Bool)

(declare-fun e!438136 () SeekEntryResult!8104)

(assert (=> b!788307 (= e!438136 (MissingVacant!8104 resIntermediateIndex!5))))

(declare-fun lt!351571 () SeekEntryResult!8104)

(declare-fun d!102645 () Bool)

(assert (=> d!102645 (and (or ((_ is Undefined!8104) lt!351571) (not ((_ is Found!8104) lt!351571)) (and (bvsge (index!34785 lt!351571) #b00000000000000000000000000000000) (bvslt (index!34785 lt!351571) (size!20928 a!3186)))) (or ((_ is Undefined!8104) lt!351571) ((_ is Found!8104) lt!351571) (not ((_ is MissingVacant!8104) lt!351571)) (not (= (index!34787 lt!351571) resIntermediateIndex!5)) (and (bvsge (index!34787 lt!351571) #b00000000000000000000000000000000) (bvslt (index!34787 lt!351571) (size!20928 a!3186)))) (or ((_ is Undefined!8104) lt!351571) (ite ((_ is Found!8104) lt!351571) (= (select (arr!20507 a!3186) (index!34785 lt!351571)) (select (arr!20507 a!3186) j!159)) (and ((_ is MissingVacant!8104) lt!351571) (= (index!34787 lt!351571) resIntermediateIndex!5) (= (select (arr!20507 a!3186) (index!34787 lt!351571)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!438137 () SeekEntryResult!8104)

(assert (=> d!102645 (= lt!351571 e!438137)))

(declare-fun c!87519 () Bool)

(assert (=> d!102645 (= c!87519 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!351572 () (_ BitVec 64))

(assert (=> d!102645 (= lt!351572 (select (arr!20507 a!3186) index!1321))))

(assert (=> d!102645 (validMask!0 mask!3328)))

(assert (=> d!102645 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20507 a!3186) j!159) a!3186 mask!3328) lt!351571)))

(declare-fun b!788308 () Bool)

(assert (=> b!788308 (= e!438136 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!20507 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!788309 () Bool)

(declare-fun e!438135 () SeekEntryResult!8104)

(assert (=> b!788309 (= e!438137 e!438135)))

(declare-fun c!87518 () Bool)

(assert (=> b!788309 (= c!87518 (= lt!351572 (select (arr!20507 a!3186) j!159)))))

(declare-fun b!788310 () Bool)

(assert (=> b!788310 (= e!438137 Undefined!8104)))

(declare-fun b!788311 () Bool)

(assert (=> b!788311 (= e!438135 (Found!8104 index!1321))))

(declare-fun b!788312 () Bool)

(declare-fun c!87517 () Bool)

(assert (=> b!788312 (= c!87517 (= lt!351572 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!788312 (= e!438135 e!438136)))

(assert (= (and d!102645 c!87519) b!788310))

(assert (= (and d!102645 (not c!87519)) b!788309))

(assert (= (and b!788309 c!87518) b!788311))

(assert (= (and b!788309 (not c!87518)) b!788312))

(assert (= (and b!788312 c!87517) b!788307))

(assert (= (and b!788312 (not c!87517)) b!788308))

(declare-fun m!729113 () Bool)

(assert (=> d!102645 m!729113))

(declare-fun m!729115 () Bool)

(assert (=> d!102645 m!729115))

(assert (=> d!102645 m!728965))

(assert (=> d!102645 m!728943))

(declare-fun m!729117 () Bool)

(assert (=> b!788308 m!729117))

(assert (=> b!788308 m!729117))

(assert (=> b!788308 m!728933))

(declare-fun m!729119 () Bool)

(assert (=> b!788308 m!729119))

(assert (=> b!788063 d!102645))

(declare-fun b!788343 () Bool)

(declare-fun e!438154 () SeekEntryResult!8104)

(declare-fun lt!351589 () SeekEntryResult!8104)

(assert (=> b!788343 (= e!438154 (Found!8104 (index!34786 lt!351589)))))

(declare-fun b!788344 () Bool)

(declare-fun c!87533 () Bool)

(declare-fun lt!351591 () (_ BitVec 64))

(assert (=> b!788344 (= c!87533 (= lt!351591 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!438156 () SeekEntryResult!8104)

(assert (=> b!788344 (= e!438154 e!438156)))

(declare-fun d!102647 () Bool)

(declare-fun lt!351590 () SeekEntryResult!8104)

(assert (=> d!102647 (and (or ((_ is Undefined!8104) lt!351590) (not ((_ is Found!8104) lt!351590)) (and (bvsge (index!34785 lt!351590) #b00000000000000000000000000000000) (bvslt (index!34785 lt!351590) (size!20928 lt!351473)))) (or ((_ is Undefined!8104) lt!351590) ((_ is Found!8104) lt!351590) (not ((_ is MissingZero!8104) lt!351590)) (and (bvsge (index!34784 lt!351590) #b00000000000000000000000000000000) (bvslt (index!34784 lt!351590) (size!20928 lt!351473)))) (or ((_ is Undefined!8104) lt!351590) ((_ is Found!8104) lt!351590) ((_ is MissingZero!8104) lt!351590) (not ((_ is MissingVacant!8104) lt!351590)) (and (bvsge (index!34787 lt!351590) #b00000000000000000000000000000000) (bvslt (index!34787 lt!351590) (size!20928 lt!351473)))) (or ((_ is Undefined!8104) lt!351590) (ite ((_ is Found!8104) lt!351590) (= (select (arr!20507 lt!351473) (index!34785 lt!351590)) lt!351474) (ite ((_ is MissingZero!8104) lt!351590) (= (select (arr!20507 lt!351473) (index!34784 lt!351590)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8104) lt!351590) (= (select (arr!20507 lt!351473) (index!34787 lt!351590)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!438155 () SeekEntryResult!8104)

(assert (=> d!102647 (= lt!351590 e!438155)))

(declare-fun c!87532 () Bool)

(assert (=> d!102647 (= c!87532 (and ((_ is Intermediate!8104) lt!351589) (undefined!8916 lt!351589)))))

(assert (=> d!102647 (= lt!351589 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!351474 mask!3328) lt!351474 lt!351473 mask!3328))))

(assert (=> d!102647 (validMask!0 mask!3328)))

(assert (=> d!102647 (= (seekEntryOrOpen!0 lt!351474 lt!351473 mask!3328) lt!351590)))

(declare-fun b!788345 () Bool)

(assert (=> b!788345 (= e!438156 (seekKeyOrZeroReturnVacant!0 (x!65727 lt!351589) (index!34786 lt!351589) (index!34786 lt!351589) lt!351474 lt!351473 mask!3328))))

(declare-fun b!788346 () Bool)

(assert (=> b!788346 (= e!438155 Undefined!8104)))

(declare-fun b!788347 () Bool)

(assert (=> b!788347 (= e!438156 (MissingZero!8104 (index!34786 lt!351589)))))

(declare-fun b!788348 () Bool)

(assert (=> b!788348 (= e!438155 e!438154)))

(assert (=> b!788348 (= lt!351591 (select (arr!20507 lt!351473) (index!34786 lt!351589)))))

(declare-fun c!87534 () Bool)

(assert (=> b!788348 (= c!87534 (= lt!351591 lt!351474))))

(assert (= (and d!102647 c!87532) b!788346))

(assert (= (and d!102647 (not c!87532)) b!788348))

(assert (= (and b!788348 c!87534) b!788343))

(assert (= (and b!788348 (not c!87534)) b!788344))

(assert (= (and b!788344 c!87533) b!788347))

(assert (= (and b!788344 (not c!87533)) b!788345))

(declare-fun m!729137 () Bool)

(assert (=> d!102647 m!729137))

(declare-fun m!729139 () Bool)

(assert (=> d!102647 m!729139))

(assert (=> d!102647 m!728971))

(declare-fun m!729141 () Bool)

(assert (=> d!102647 m!729141))

(assert (=> d!102647 m!728971))

(assert (=> d!102647 m!728973))

(assert (=> d!102647 m!728943))

(declare-fun m!729143 () Bool)

(assert (=> b!788345 m!729143))

(declare-fun m!729145 () Bool)

(assert (=> b!788348 m!729145))

(assert (=> b!788062 d!102647))

(declare-fun b!788358 () Bool)

(declare-fun e!438163 () SeekEntryResult!8104)

(assert (=> b!788358 (= e!438163 (MissingVacant!8104 index!1321))))

(declare-fun d!102659 () Bool)

(declare-fun lt!351594 () SeekEntryResult!8104)

(assert (=> d!102659 (and (or ((_ is Undefined!8104) lt!351594) (not ((_ is Found!8104) lt!351594)) (and (bvsge (index!34785 lt!351594) #b00000000000000000000000000000000) (bvslt (index!34785 lt!351594) (size!20928 lt!351473)))) (or ((_ is Undefined!8104) lt!351594) ((_ is Found!8104) lt!351594) (not ((_ is MissingVacant!8104) lt!351594)) (not (= (index!34787 lt!351594) index!1321)) (and (bvsge (index!34787 lt!351594) #b00000000000000000000000000000000) (bvslt (index!34787 lt!351594) (size!20928 lt!351473)))) (or ((_ is Undefined!8104) lt!351594) (ite ((_ is Found!8104) lt!351594) (= (select (arr!20507 lt!351473) (index!34785 lt!351594)) lt!351474) (and ((_ is MissingVacant!8104) lt!351594) (= (index!34787 lt!351594) index!1321) (= (select (arr!20507 lt!351473) (index!34787 lt!351594)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!438164 () SeekEntryResult!8104)

(assert (=> d!102659 (= lt!351594 e!438164)))

(declare-fun c!87540 () Bool)

(assert (=> d!102659 (= c!87540 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!351595 () (_ BitVec 64))

(assert (=> d!102659 (= lt!351595 (select (arr!20507 lt!351473) index!1321))))

(assert (=> d!102659 (validMask!0 mask!3328)))

(assert (=> d!102659 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!351474 lt!351473 mask!3328) lt!351594)))

(declare-fun b!788359 () Bool)

(assert (=> b!788359 (= e!438163 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) index!1321 lt!351474 lt!351473 mask!3328))))

(declare-fun b!788360 () Bool)

(declare-fun e!438162 () SeekEntryResult!8104)

(assert (=> b!788360 (= e!438164 e!438162)))

(declare-fun c!87539 () Bool)

(assert (=> b!788360 (= c!87539 (= lt!351595 lt!351474))))

(declare-fun b!788361 () Bool)

(assert (=> b!788361 (= e!438164 Undefined!8104)))

(declare-fun b!788362 () Bool)

(assert (=> b!788362 (= e!438162 (Found!8104 index!1321))))

(declare-fun b!788363 () Bool)

(declare-fun c!87538 () Bool)

(assert (=> b!788363 (= c!87538 (= lt!351595 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!788363 (= e!438162 e!438163)))

(assert (= (and d!102659 c!87540) b!788361))

(assert (= (and d!102659 (not c!87540)) b!788360))

(assert (= (and b!788360 c!87539) b!788362))

(assert (= (and b!788360 (not c!87539)) b!788363))

(assert (= (and b!788363 c!87538) b!788358))

(assert (= (and b!788363 (not c!87538)) b!788359))

(declare-fun m!729155 () Bool)

(assert (=> d!102659 m!729155))

(declare-fun m!729157 () Bool)

(assert (=> d!102659 m!729157))

(declare-fun m!729159 () Bool)

(assert (=> d!102659 m!729159))

(assert (=> d!102659 m!728943))

(assert (=> b!788359 m!729117))

(assert (=> b!788359 m!729117))

(declare-fun m!729161 () Bool)

(assert (=> b!788359 m!729161))

(assert (=> b!788062 d!102659))

(declare-fun d!102665 () Bool)

(assert (=> d!102665 (= (validKeyInArray!0 k0!2102) (and (not (= k0!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!788075 d!102665))

(declare-fun b!788364 () Bool)

(declare-fun e!438168 () Bool)

(declare-fun lt!351598 () SeekEntryResult!8104)

(assert (=> b!788364 (= e!438168 (bvsge (x!65727 lt!351598) #b01111111111111111111111111111110))))

(declare-fun b!788365 () Bool)

(declare-fun e!438165 () SeekEntryResult!8104)

(assert (=> b!788365 (= e!438165 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!351474 lt!351473 mask!3328))))

(declare-fun b!788366 () Bool)

(assert (=> b!788366 (and (bvsge (index!34786 lt!351598) #b00000000000000000000000000000000) (bvslt (index!34786 lt!351598) (size!20928 lt!351473)))))

(declare-fun e!438166 () Bool)

(assert (=> b!788366 (= e!438166 (= (select (arr!20507 lt!351473) (index!34786 lt!351598)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!788367 () Bool)

(assert (=> b!788367 (and (bvsge (index!34786 lt!351598) #b00000000000000000000000000000000) (bvslt (index!34786 lt!351598) (size!20928 lt!351473)))))

(declare-fun res!534100 () Bool)

(assert (=> b!788367 (= res!534100 (= (select (arr!20507 lt!351473) (index!34786 lt!351598)) lt!351474))))

(assert (=> b!788367 (=> res!534100 e!438166)))

(declare-fun e!438169 () Bool)

(assert (=> b!788367 (= e!438169 e!438166)))

(declare-fun d!102667 () Bool)

(assert (=> d!102667 e!438168))

(declare-fun c!87543 () Bool)

(assert (=> d!102667 (= c!87543 (and ((_ is Intermediate!8104) lt!351598) (undefined!8916 lt!351598)))))

(declare-fun e!438167 () SeekEntryResult!8104)

(assert (=> d!102667 (= lt!351598 e!438167)))

(declare-fun c!87541 () Bool)

(assert (=> d!102667 (= c!87541 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!351599 () (_ BitVec 64))

(assert (=> d!102667 (= lt!351599 (select (arr!20507 lt!351473) index!1321))))

(assert (=> d!102667 (validMask!0 mask!3328)))

(assert (=> d!102667 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!351474 lt!351473 mask!3328) lt!351598)))

(declare-fun b!788368 () Bool)

(assert (=> b!788368 (= e!438167 e!438165)))

(declare-fun c!87542 () Bool)

(assert (=> b!788368 (= c!87542 (or (= lt!351599 lt!351474) (= (bvadd lt!351599 lt!351599) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!788369 () Bool)

(assert (=> b!788369 (= e!438168 e!438169)))

(declare-fun res!534099 () Bool)

(assert (=> b!788369 (= res!534099 (and ((_ is Intermediate!8104) lt!351598) (not (undefined!8916 lt!351598)) (bvslt (x!65727 lt!351598) #b01111111111111111111111111111110) (bvsge (x!65727 lt!351598) #b00000000000000000000000000000000) (bvsge (x!65727 lt!351598) x!1131)))))

(assert (=> b!788369 (=> (not res!534099) (not e!438169))))

(declare-fun b!788370 () Bool)

(assert (=> b!788370 (= e!438165 (Intermediate!8104 false index!1321 x!1131))))

(declare-fun b!788371 () Bool)

(assert (=> b!788371 (and (bvsge (index!34786 lt!351598) #b00000000000000000000000000000000) (bvslt (index!34786 lt!351598) (size!20928 lt!351473)))))

(declare-fun res!534101 () Bool)

(assert (=> b!788371 (= res!534101 (= (select (arr!20507 lt!351473) (index!34786 lt!351598)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!788371 (=> res!534101 e!438166)))

(declare-fun b!788372 () Bool)

(assert (=> b!788372 (= e!438167 (Intermediate!8104 true index!1321 x!1131))))

(assert (= (and d!102667 c!87541) b!788372))

(assert (= (and d!102667 (not c!87541)) b!788368))

(assert (= (and b!788368 c!87542) b!788370))

(assert (= (and b!788368 (not c!87542)) b!788365))

(assert (= (and d!102667 c!87543) b!788364))

(assert (= (and d!102667 (not c!87543)) b!788369))

(assert (= (and b!788369 res!534099) b!788367))

(assert (= (and b!788367 (not res!534100)) b!788371))

(assert (= (and b!788371 (not res!534101)) b!788366))

(assert (=> b!788365 m!729117))

(assert (=> b!788365 m!729117))

(declare-fun m!729163 () Bool)

(assert (=> b!788365 m!729163))

(declare-fun m!729165 () Bool)

(assert (=> b!788366 m!729165))

(assert (=> d!102667 m!729159))

(assert (=> d!102667 m!728943))

(assert (=> b!788367 m!729165))

(assert (=> b!788371 m!729165))

(assert (=> b!788074 d!102667))

(declare-fun b!788373 () Bool)

(declare-fun e!438173 () Bool)

(declare-fun lt!351600 () SeekEntryResult!8104)

(assert (=> b!788373 (= e!438173 (bvsge (x!65727 lt!351600) #b01111111111111111111111111111110))))

(declare-fun b!788374 () Bool)

(declare-fun e!438170 () SeekEntryResult!8104)

(assert (=> b!788374 (= e!438170 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!351474 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!351474 lt!351473 mask!3328))))

(declare-fun b!788375 () Bool)

(assert (=> b!788375 (and (bvsge (index!34786 lt!351600) #b00000000000000000000000000000000) (bvslt (index!34786 lt!351600) (size!20928 lt!351473)))))

(declare-fun e!438171 () Bool)

(assert (=> b!788375 (= e!438171 (= (select (arr!20507 lt!351473) (index!34786 lt!351600)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!788376 () Bool)

(assert (=> b!788376 (and (bvsge (index!34786 lt!351600) #b00000000000000000000000000000000) (bvslt (index!34786 lt!351600) (size!20928 lt!351473)))))

(declare-fun res!534103 () Bool)

(assert (=> b!788376 (= res!534103 (= (select (arr!20507 lt!351473) (index!34786 lt!351600)) lt!351474))))

(assert (=> b!788376 (=> res!534103 e!438171)))

(declare-fun e!438174 () Bool)

(assert (=> b!788376 (= e!438174 e!438171)))

(declare-fun d!102669 () Bool)

(assert (=> d!102669 e!438173))

(declare-fun c!87546 () Bool)

(assert (=> d!102669 (= c!87546 (and ((_ is Intermediate!8104) lt!351600) (undefined!8916 lt!351600)))))

(declare-fun e!438172 () SeekEntryResult!8104)

(assert (=> d!102669 (= lt!351600 e!438172)))

(declare-fun c!87544 () Bool)

(assert (=> d!102669 (= c!87544 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!351601 () (_ BitVec 64))

(assert (=> d!102669 (= lt!351601 (select (arr!20507 lt!351473) (toIndex!0 lt!351474 mask!3328)))))

(assert (=> d!102669 (validMask!0 mask!3328)))

(assert (=> d!102669 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!351474 mask!3328) lt!351474 lt!351473 mask!3328) lt!351600)))

(declare-fun b!788377 () Bool)

(assert (=> b!788377 (= e!438172 e!438170)))

(declare-fun c!87545 () Bool)

(assert (=> b!788377 (= c!87545 (or (= lt!351601 lt!351474) (= (bvadd lt!351601 lt!351601) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!788378 () Bool)

(assert (=> b!788378 (= e!438173 e!438174)))

(declare-fun res!534102 () Bool)

(assert (=> b!788378 (= res!534102 (and ((_ is Intermediate!8104) lt!351600) (not (undefined!8916 lt!351600)) (bvslt (x!65727 lt!351600) #b01111111111111111111111111111110) (bvsge (x!65727 lt!351600) #b00000000000000000000000000000000) (bvsge (x!65727 lt!351600) #b00000000000000000000000000000000)))))

(assert (=> b!788378 (=> (not res!534102) (not e!438174))))

(declare-fun b!788379 () Bool)

(assert (=> b!788379 (= e!438170 (Intermediate!8104 false (toIndex!0 lt!351474 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!788380 () Bool)

(assert (=> b!788380 (and (bvsge (index!34786 lt!351600) #b00000000000000000000000000000000) (bvslt (index!34786 lt!351600) (size!20928 lt!351473)))))

(declare-fun res!534104 () Bool)

(assert (=> b!788380 (= res!534104 (= (select (arr!20507 lt!351473) (index!34786 lt!351600)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!788380 (=> res!534104 e!438171)))

(declare-fun b!788381 () Bool)

(assert (=> b!788381 (= e!438172 (Intermediate!8104 true (toIndex!0 lt!351474 mask!3328) #b00000000000000000000000000000000))))

(assert (= (and d!102669 c!87544) b!788381))

(assert (= (and d!102669 (not c!87544)) b!788377))

(assert (= (and b!788377 c!87545) b!788379))

(assert (= (and b!788377 (not c!87545)) b!788374))

(assert (= (and d!102669 c!87546) b!788373))

(assert (= (and d!102669 (not c!87546)) b!788378))

(assert (= (and b!788378 res!534102) b!788376))

(assert (= (and b!788376 (not res!534103)) b!788380))

(assert (= (and b!788380 (not res!534104)) b!788375))

(assert (=> b!788374 m!728971))

(declare-fun m!729167 () Bool)

(assert (=> b!788374 m!729167))

(assert (=> b!788374 m!729167))

(declare-fun m!729169 () Bool)

(assert (=> b!788374 m!729169))

(declare-fun m!729171 () Bool)

(assert (=> b!788375 m!729171))

(assert (=> d!102669 m!728971))

(declare-fun m!729173 () Bool)

(assert (=> d!102669 m!729173))

(assert (=> d!102669 m!728943))

(assert (=> b!788376 m!729171))

(assert (=> b!788380 m!729171))

(assert (=> b!788074 d!102669))

(declare-fun d!102673 () Bool)

(declare-fun lt!351603 () (_ BitVec 32))

(declare-fun lt!351602 () (_ BitVec 32))

(assert (=> d!102673 (= lt!351603 (bvmul (bvxor lt!351602 (bvlshr lt!351602 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!102673 (= lt!351602 ((_ extract 31 0) (bvand (bvxor lt!351474 (bvlshr lt!351474 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!102673 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!534082 (let ((h!15670 ((_ extract 31 0) (bvand (bvxor lt!351474 (bvlshr lt!351474 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!65732 (bvmul (bvxor h!15670 (bvlshr h!15670 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!65732 (bvlshr x!65732 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!534082 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!534082 #b00000000000000000000000000000000))))))

(assert (=> d!102673 (= (toIndex!0 lt!351474 mask!3328) (bvand (bvxor lt!351603 (bvlshr lt!351603 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!788074 d!102673))

(declare-fun b!788392 () Bool)

(declare-fun e!438186 () Bool)

(declare-fun lt!351604 () SeekEntryResult!8104)

(assert (=> b!788392 (= e!438186 (bvsge (x!65727 lt!351604) #b01111111111111111111111111111110))))

(declare-fun b!788393 () Bool)

(declare-fun e!438183 () SeekEntryResult!8104)

(assert (=> b!788393 (= e!438183 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!20507 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!788394 () Bool)

(assert (=> b!788394 (and (bvsge (index!34786 lt!351604) #b00000000000000000000000000000000) (bvslt (index!34786 lt!351604) (size!20928 a!3186)))))

(declare-fun e!438184 () Bool)

(assert (=> b!788394 (= e!438184 (= (select (arr!20507 a!3186) (index!34786 lt!351604)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!788395 () Bool)

(assert (=> b!788395 (and (bvsge (index!34786 lt!351604) #b00000000000000000000000000000000) (bvslt (index!34786 lt!351604) (size!20928 a!3186)))))

(declare-fun res!534112 () Bool)

(assert (=> b!788395 (= res!534112 (= (select (arr!20507 a!3186) (index!34786 lt!351604)) (select (arr!20507 a!3186) j!159)))))

(assert (=> b!788395 (=> res!534112 e!438184)))

(declare-fun e!438187 () Bool)

(assert (=> b!788395 (= e!438187 e!438184)))

(declare-fun d!102675 () Bool)

(assert (=> d!102675 e!438186))

(declare-fun c!87551 () Bool)

(assert (=> d!102675 (= c!87551 (and ((_ is Intermediate!8104) lt!351604) (undefined!8916 lt!351604)))))

(declare-fun e!438185 () SeekEntryResult!8104)

(assert (=> d!102675 (= lt!351604 e!438185)))

(declare-fun c!87549 () Bool)

(assert (=> d!102675 (= c!87549 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!351605 () (_ BitVec 64))

(assert (=> d!102675 (= lt!351605 (select (arr!20507 a!3186) index!1321))))

(assert (=> d!102675 (validMask!0 mask!3328)))

(assert (=> d!102675 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20507 a!3186) j!159) a!3186 mask!3328) lt!351604)))

(declare-fun b!788396 () Bool)

(assert (=> b!788396 (= e!438185 e!438183)))

(declare-fun c!87550 () Bool)

(assert (=> b!788396 (= c!87550 (or (= lt!351605 (select (arr!20507 a!3186) j!159)) (= (bvadd lt!351605 lt!351605) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!788397 () Bool)

(assert (=> b!788397 (= e!438186 e!438187)))

(declare-fun res!534111 () Bool)

(assert (=> b!788397 (= res!534111 (and ((_ is Intermediate!8104) lt!351604) (not (undefined!8916 lt!351604)) (bvslt (x!65727 lt!351604) #b01111111111111111111111111111110) (bvsge (x!65727 lt!351604) #b00000000000000000000000000000000) (bvsge (x!65727 lt!351604) x!1131)))))

(assert (=> b!788397 (=> (not res!534111) (not e!438187))))

(declare-fun b!788398 () Bool)

(assert (=> b!788398 (= e!438183 (Intermediate!8104 false index!1321 x!1131))))

(declare-fun b!788399 () Bool)

(assert (=> b!788399 (and (bvsge (index!34786 lt!351604) #b00000000000000000000000000000000) (bvslt (index!34786 lt!351604) (size!20928 a!3186)))))

(declare-fun res!534113 () Bool)

(assert (=> b!788399 (= res!534113 (= (select (arr!20507 a!3186) (index!34786 lt!351604)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!788399 (=> res!534113 e!438184)))

(declare-fun b!788400 () Bool)

(assert (=> b!788400 (= e!438185 (Intermediate!8104 true index!1321 x!1131))))

(assert (= (and d!102675 c!87549) b!788400))

(assert (= (and d!102675 (not c!87549)) b!788396))

(assert (= (and b!788396 c!87550) b!788398))

(assert (= (and b!788396 (not c!87550)) b!788393))

(assert (= (and d!102675 c!87551) b!788392))

(assert (= (and d!102675 (not c!87551)) b!788397))

(assert (= (and b!788397 res!534111) b!788395))

(assert (= (and b!788395 (not res!534112)) b!788399))

(assert (= (and b!788399 (not res!534113)) b!788394))

(assert (=> b!788393 m!729117))

(assert (=> b!788393 m!729117))

(assert (=> b!788393 m!728933))

(declare-fun m!729175 () Bool)

(assert (=> b!788393 m!729175))

(declare-fun m!729177 () Bool)

(assert (=> b!788394 m!729177))

(assert (=> d!102675 m!728965))

(assert (=> d!102675 m!728943))

(assert (=> b!788395 m!729177))

(assert (=> b!788399 m!729177))

(assert (=> b!788071 d!102675))

(declare-fun b!788429 () Bool)

(declare-fun e!438212 () Bool)

(declare-fun e!438211 () Bool)

(assert (=> b!788429 (= e!438212 e!438211)))

(declare-fun lt!351612 () (_ BitVec 64))

(assert (=> b!788429 (= lt!351612 (select (arr!20507 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!351614 () Unit!27284)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42837 (_ BitVec 64) (_ BitVec 32)) Unit!27284)

(assert (=> b!788429 (= lt!351614 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!351612 #b00000000000000000000000000000000))))

(assert (=> b!788429 (arrayContainsKey!0 a!3186 lt!351612 #b00000000000000000000000000000000)))

(declare-fun lt!351613 () Unit!27284)

(assert (=> b!788429 (= lt!351613 lt!351614)))

(declare-fun res!534130 () Bool)

(assert (=> b!788429 (= res!534130 (= (seekEntryOrOpen!0 (select (arr!20507 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!8104 #b00000000000000000000000000000000)))))

(assert (=> b!788429 (=> (not res!534130) (not e!438211))))

(declare-fun d!102677 () Bool)

(declare-fun res!534131 () Bool)

(declare-fun e!438210 () Bool)

(assert (=> d!102677 (=> res!534131 e!438210)))

(assert (=> d!102677 (= res!534131 (bvsge #b00000000000000000000000000000000 (size!20928 a!3186)))))

(assert (=> d!102677 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!438210)))

(declare-fun bm!35260 () Bool)

(declare-fun call!35263 () Bool)

(assert (=> bm!35260 (= call!35263 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!788430 () Bool)

(assert (=> b!788430 (= e!438210 e!438212)))

(declare-fun c!87558 () Bool)

(assert (=> b!788430 (= c!87558 (validKeyInArray!0 (select (arr!20507 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!788431 () Bool)

(assert (=> b!788431 (= e!438211 call!35263)))

(declare-fun b!788432 () Bool)

(assert (=> b!788432 (= e!438212 call!35263)))

(assert (= (and d!102677 (not res!534131)) b!788430))

(assert (= (and b!788430 c!87558) b!788429))

(assert (= (and b!788430 (not c!87558)) b!788432))

(assert (= (and b!788429 res!534130) b!788431))

(assert (= (or b!788431 b!788432) bm!35260))

(assert (=> b!788429 m!729087))

(declare-fun m!729187 () Bool)

(assert (=> b!788429 m!729187))

(declare-fun m!729189 () Bool)

(assert (=> b!788429 m!729189))

(assert (=> b!788429 m!729087))

(declare-fun m!729193 () Bool)

(assert (=> b!788429 m!729193))

(declare-fun m!729195 () Bool)

(assert (=> bm!35260 m!729195))

(assert (=> b!788430 m!729087))

(assert (=> b!788430 m!729087))

(assert (=> b!788430 m!729093))

(assert (=> b!788070 d!102677))

(declare-fun d!102681 () Bool)

(assert (=> d!102681 (= (validKeyInArray!0 (select (arr!20507 a!3186) j!159)) (and (not (= (select (arr!20507 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20507 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!788081 d!102681))

(declare-fun b!788433 () Bool)

(declare-fun e!438213 () SeekEntryResult!8104)

(declare-fun lt!351615 () SeekEntryResult!8104)

(assert (=> b!788433 (= e!438213 (Found!8104 (index!34786 lt!351615)))))

(declare-fun b!788434 () Bool)

(declare-fun c!87560 () Bool)

(declare-fun lt!351617 () (_ BitVec 64))

(assert (=> b!788434 (= c!87560 (= lt!351617 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!438215 () SeekEntryResult!8104)

(assert (=> b!788434 (= e!438213 e!438215)))

(declare-fun d!102683 () Bool)

(declare-fun lt!351616 () SeekEntryResult!8104)

(assert (=> d!102683 (and (or ((_ is Undefined!8104) lt!351616) (not ((_ is Found!8104) lt!351616)) (and (bvsge (index!34785 lt!351616) #b00000000000000000000000000000000) (bvslt (index!34785 lt!351616) (size!20928 a!3186)))) (or ((_ is Undefined!8104) lt!351616) ((_ is Found!8104) lt!351616) (not ((_ is MissingZero!8104) lt!351616)) (and (bvsge (index!34784 lt!351616) #b00000000000000000000000000000000) (bvslt (index!34784 lt!351616) (size!20928 a!3186)))) (or ((_ is Undefined!8104) lt!351616) ((_ is Found!8104) lt!351616) ((_ is MissingZero!8104) lt!351616) (not ((_ is MissingVacant!8104) lt!351616)) (and (bvsge (index!34787 lt!351616) #b00000000000000000000000000000000) (bvslt (index!34787 lt!351616) (size!20928 a!3186)))) (or ((_ is Undefined!8104) lt!351616) (ite ((_ is Found!8104) lt!351616) (= (select (arr!20507 a!3186) (index!34785 lt!351616)) k0!2102) (ite ((_ is MissingZero!8104) lt!351616) (= (select (arr!20507 a!3186) (index!34784 lt!351616)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8104) lt!351616) (= (select (arr!20507 a!3186) (index!34787 lt!351616)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!438214 () SeekEntryResult!8104)

(assert (=> d!102683 (= lt!351616 e!438214)))

(declare-fun c!87559 () Bool)

(assert (=> d!102683 (= c!87559 (and ((_ is Intermediate!8104) lt!351615) (undefined!8916 lt!351615)))))

(assert (=> d!102683 (= lt!351615 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328))))

(assert (=> d!102683 (validMask!0 mask!3328)))

(assert (=> d!102683 (= (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328) lt!351616)))

(declare-fun b!788435 () Bool)

(assert (=> b!788435 (= e!438215 (seekKeyOrZeroReturnVacant!0 (x!65727 lt!351615) (index!34786 lt!351615) (index!34786 lt!351615) k0!2102 a!3186 mask!3328))))

(declare-fun b!788436 () Bool)

(assert (=> b!788436 (= e!438214 Undefined!8104)))

(declare-fun b!788437 () Bool)

(assert (=> b!788437 (= e!438215 (MissingZero!8104 (index!34786 lt!351615)))))

(declare-fun b!788438 () Bool)

(assert (=> b!788438 (= e!438214 e!438213)))

(assert (=> b!788438 (= lt!351617 (select (arr!20507 a!3186) (index!34786 lt!351615)))))

(declare-fun c!87561 () Bool)

(assert (=> b!788438 (= c!87561 (= lt!351617 k0!2102))))

(assert (= (and d!102683 c!87559) b!788436))

(assert (= (and d!102683 (not c!87559)) b!788438))

(assert (= (and b!788438 c!87561) b!788433))

(assert (= (and b!788438 (not c!87561)) b!788434))

(assert (= (and b!788434 c!87560) b!788437))

(assert (= (and b!788434 (not c!87560)) b!788435))

(declare-fun m!729203 () Bool)

(assert (=> d!102683 m!729203))

(declare-fun m!729205 () Bool)

(assert (=> d!102683 m!729205))

(declare-fun m!729207 () Bool)

(assert (=> d!102683 m!729207))

(declare-fun m!729209 () Bool)

(assert (=> d!102683 m!729209))

(assert (=> d!102683 m!729207))

(declare-fun m!729211 () Bool)

(assert (=> d!102683 m!729211))

(assert (=> d!102683 m!728943))

(declare-fun m!729213 () Bool)

(assert (=> b!788435 m!729213))

(declare-fun m!729215 () Bool)

(assert (=> b!788438 m!729215))

(assert (=> b!788072 d!102683))

(declare-fun d!102687 () Bool)

(assert (=> d!102687 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!67778 d!102687))

(declare-fun d!102691 () Bool)

(assert (=> d!102691 (= (array_inv!16390 a!3186) (bvsge (size!20928 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!67778 d!102691))

(assert (=> b!788083 d!102645))

(declare-fun b!788457 () Bool)

(declare-fun e!438225 () SeekEntryResult!8104)

(declare-fun lt!351624 () SeekEntryResult!8104)

(assert (=> b!788457 (= e!438225 (Found!8104 (index!34786 lt!351624)))))

(declare-fun b!788458 () Bool)

(declare-fun c!87572 () Bool)

(declare-fun lt!351626 () (_ BitVec 64))

(assert (=> b!788458 (= c!87572 (= lt!351626 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!438227 () SeekEntryResult!8104)

(assert (=> b!788458 (= e!438225 e!438227)))

(declare-fun d!102693 () Bool)

(declare-fun lt!351625 () SeekEntryResult!8104)

(assert (=> d!102693 (and (or ((_ is Undefined!8104) lt!351625) (not ((_ is Found!8104) lt!351625)) (and (bvsge (index!34785 lt!351625) #b00000000000000000000000000000000) (bvslt (index!34785 lt!351625) (size!20928 a!3186)))) (or ((_ is Undefined!8104) lt!351625) ((_ is Found!8104) lt!351625) (not ((_ is MissingZero!8104) lt!351625)) (and (bvsge (index!34784 lt!351625) #b00000000000000000000000000000000) (bvslt (index!34784 lt!351625) (size!20928 a!3186)))) (or ((_ is Undefined!8104) lt!351625) ((_ is Found!8104) lt!351625) ((_ is MissingZero!8104) lt!351625) (not ((_ is MissingVacant!8104) lt!351625)) (and (bvsge (index!34787 lt!351625) #b00000000000000000000000000000000) (bvslt (index!34787 lt!351625) (size!20928 a!3186)))) (or ((_ is Undefined!8104) lt!351625) (ite ((_ is Found!8104) lt!351625) (= (select (arr!20507 a!3186) (index!34785 lt!351625)) (select (arr!20507 a!3186) j!159)) (ite ((_ is MissingZero!8104) lt!351625) (= (select (arr!20507 a!3186) (index!34784 lt!351625)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8104) lt!351625) (= (select (arr!20507 a!3186) (index!34787 lt!351625)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!438226 () SeekEntryResult!8104)

(assert (=> d!102693 (= lt!351625 e!438226)))

(declare-fun c!87571 () Bool)

(assert (=> d!102693 (= c!87571 (and ((_ is Intermediate!8104) lt!351624) (undefined!8916 lt!351624)))))

(assert (=> d!102693 (= lt!351624 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20507 a!3186) j!159) mask!3328) (select (arr!20507 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!102693 (validMask!0 mask!3328)))

(assert (=> d!102693 (= (seekEntryOrOpen!0 (select (arr!20507 a!3186) j!159) a!3186 mask!3328) lt!351625)))

(declare-fun b!788459 () Bool)

(assert (=> b!788459 (= e!438227 (seekKeyOrZeroReturnVacant!0 (x!65727 lt!351624) (index!34786 lt!351624) (index!34786 lt!351624) (select (arr!20507 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!788460 () Bool)

(assert (=> b!788460 (= e!438226 Undefined!8104)))

(declare-fun b!788461 () Bool)

(assert (=> b!788461 (= e!438227 (MissingZero!8104 (index!34786 lt!351624)))))

(declare-fun b!788462 () Bool)

(assert (=> b!788462 (= e!438226 e!438225)))

(assert (=> b!788462 (= lt!351626 (select (arr!20507 a!3186) (index!34786 lt!351624)))))

(declare-fun c!87573 () Bool)

(assert (=> b!788462 (= c!87573 (= lt!351626 (select (arr!20507 a!3186) j!159)))))

(assert (= (and d!102693 c!87571) b!788460))

(assert (= (and d!102693 (not c!87571)) b!788462))

(assert (= (and b!788462 c!87573) b!788457))

(assert (= (and b!788462 (not c!87573)) b!788458))

(assert (= (and b!788458 c!87572) b!788461))

(assert (= (and b!788458 (not c!87572)) b!788459))

(declare-fun m!729225 () Bool)

(assert (=> d!102693 m!729225))

(declare-fun m!729227 () Bool)

(assert (=> d!102693 m!729227))

(assert (=> d!102693 m!728933))

(assert (=> d!102693 m!728935))

(declare-fun m!729229 () Bool)

(assert (=> d!102693 m!729229))

(assert (=> d!102693 m!728935))

(assert (=> d!102693 m!728933))

(assert (=> d!102693 m!728937))

(assert (=> d!102693 m!728943))

(assert (=> b!788459 m!728933))

(declare-fun m!729231 () Bool)

(assert (=> b!788459 m!729231))

(declare-fun m!729233 () Bool)

(assert (=> b!788462 m!729233))

(assert (=> b!788082 d!102693))

(declare-fun b!788463 () Bool)

(declare-fun e!438230 () Bool)

(declare-fun e!438229 () Bool)

(assert (=> b!788463 (= e!438230 e!438229)))

(declare-fun lt!351627 () (_ BitVec 64))

(assert (=> b!788463 (= lt!351627 (select (arr!20507 a!3186) j!159))))

(declare-fun lt!351629 () Unit!27284)

(assert (=> b!788463 (= lt!351629 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!351627 j!159))))

(assert (=> b!788463 (arrayContainsKey!0 a!3186 lt!351627 #b00000000000000000000000000000000)))

(declare-fun lt!351628 () Unit!27284)

(assert (=> b!788463 (= lt!351628 lt!351629)))

(declare-fun res!534132 () Bool)

(assert (=> b!788463 (= res!534132 (= (seekEntryOrOpen!0 (select (arr!20507 a!3186) j!159) a!3186 mask!3328) (Found!8104 j!159)))))

(assert (=> b!788463 (=> (not res!534132) (not e!438229))))

(declare-fun d!102695 () Bool)

(declare-fun res!534133 () Bool)

(declare-fun e!438228 () Bool)

(assert (=> d!102695 (=> res!534133 e!438228)))

(assert (=> d!102695 (= res!534133 (bvsge j!159 (size!20928 a!3186)))))

(assert (=> d!102695 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!438228)))

(declare-fun bm!35261 () Bool)

(declare-fun call!35264 () Bool)

(assert (=> bm!35261 (= call!35264 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!788464 () Bool)

(assert (=> b!788464 (= e!438228 e!438230)))

(declare-fun c!87574 () Bool)

(assert (=> b!788464 (= c!87574 (validKeyInArray!0 (select (arr!20507 a!3186) j!159)))))

(declare-fun b!788465 () Bool)

(assert (=> b!788465 (= e!438229 call!35264)))

(declare-fun b!788466 () Bool)

(assert (=> b!788466 (= e!438230 call!35264)))

(assert (= (and d!102695 (not res!534133)) b!788464))

(assert (= (and b!788464 c!87574) b!788463))

(assert (= (and b!788464 (not c!87574)) b!788466))

(assert (= (and b!788463 res!534132) b!788465))

(assert (= (or b!788465 b!788466) bm!35261))

(assert (=> b!788463 m!728933))

(declare-fun m!729235 () Bool)

(assert (=> b!788463 m!729235))

(declare-fun m!729237 () Bool)

(assert (=> b!788463 m!729237))

(assert (=> b!788463 m!728933))

(assert (=> b!788463 m!728955))

(declare-fun m!729239 () Bool)

(assert (=> bm!35261 m!729239))

(assert (=> b!788464 m!728933))

(assert (=> b!788464 m!728933))

(assert (=> b!788464 m!728947))

(assert (=> b!788082 d!102695))

(declare-fun d!102697 () Bool)

(assert (=> d!102697 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!351632 () Unit!27284)

(declare-fun choose!38 (array!42837 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27284)

(assert (=> d!102697 (= lt!351632 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!102697 (validMask!0 mask!3328)))

(assert (=> d!102697 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!351632)))

(declare-fun bs!21804 () Bool)

(assert (= bs!21804 d!102697))

(assert (=> bs!21804 m!728957))

(declare-fun m!729241 () Bool)

(assert (=> bs!21804 m!729241))

(assert (=> bs!21804 m!728943))

(assert (=> b!788082 d!102697))

(check-sat (not d!102693) (not b!788464) (not b!788257) (not bm!35251) (not b!788240) (not b!788359) (not d!102667) (not d!102639) (not b!788308) (not d!102669) (not d!102647) (not b!788459) (not b!788429) (not d!102683) (not b!788435) (not d!102659) (not b!788463) (not d!102675) (not b!788228) (not b!788345) (not b!788393) (not bm!35260) (not d!102697) (not b!788430) (not d!102645) (not d!102637) (not b!788374) (not b!788243) (not b!788365) (not b!788242) (not bm!35261) (not b!788281))
(check-sat)
