; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65694 () Bool)

(assert start!65694)

(declare-fun b!753356 () Bool)

(declare-fun e!420188 () Bool)

(assert (=> b!753356 (= e!420188 true)))

(declare-fun e!420190 () Bool)

(assert (=> b!753356 e!420190))

(declare-fun res!508896 () Bool)

(assert (=> b!753356 (=> (not res!508896) (not e!420190))))

(declare-fun lt!335181 () (_ BitVec 64))

(assert (=> b!753356 (= res!508896 (= lt!335181 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!25968 0))(
  ( (Unit!25969) )
))
(declare-fun lt!335179 () Unit!25968)

(declare-fun e!420189 () Unit!25968)

(assert (=> b!753356 (= lt!335179 e!420189)))

(declare-fun c!82612 () Bool)

(assert (=> b!753356 (= c!82612 (= lt!335181 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!508909 () Bool)

(declare-fun e!420193 () Bool)

(assert (=> start!65694 (=> (not res!508909) (not e!420193))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65694 (= res!508909 (validMask!0 mask!3328))))

(assert (=> start!65694 e!420193))

(assert (=> start!65694 true))

(declare-datatypes ((array!41867 0))(
  ( (array!41868 (arr!20047 (Array (_ BitVec 32) (_ BitVec 64))) (size!20468 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41867)

(declare-fun array_inv!15843 (array!41867) Bool)

(assert (=> start!65694 (array_inv!15843 a!3186)))

(declare-fun b!753357 () Bool)

(declare-fun res!508902 () Bool)

(assert (=> b!753357 (=> (not res!508902) (not e!420190))))

(declare-fun lt!335189 () array!41867)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!335183 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!7647 0))(
  ( (MissingZero!7647 (index!32956 (_ BitVec 32))) (Found!7647 (index!32957 (_ BitVec 32))) (Intermediate!7647 (undefined!8459 Bool) (index!32958 (_ BitVec 32)) (x!63869 (_ BitVec 32))) (Undefined!7647) (MissingVacant!7647 (index!32959 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41867 (_ BitVec 32)) SeekEntryResult!7647)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41867 (_ BitVec 32)) SeekEntryResult!7647)

(assert (=> b!753357 (= res!508902 (= (seekEntryOrOpen!0 lt!335183 lt!335189 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!335183 lt!335189 mask!3328)))))

(declare-fun b!753358 () Bool)

(declare-fun res!508901 () Bool)

(assert (=> b!753358 (=> (not res!508901) (not e!420193))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!753358 (= res!508901 (validKeyInArray!0 k0!2102))))

(declare-fun b!753359 () Bool)

(declare-fun res!508907 () Bool)

(assert (=> b!753359 (=> (not res!508907) (not e!420193))))

(declare-fun arrayContainsKey!0 (array!41867 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!753359 (= res!508907 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!753360 () Bool)

(declare-fun e!420186 () Bool)

(assert (=> b!753360 (= e!420193 e!420186)))

(declare-fun res!508895 () Bool)

(assert (=> b!753360 (=> (not res!508895) (not e!420186))))

(declare-fun lt!335185 () SeekEntryResult!7647)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!753360 (= res!508895 (or (= lt!335185 (MissingZero!7647 i!1173)) (= lt!335185 (MissingVacant!7647 i!1173))))))

(assert (=> b!753360 (= lt!335185 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!753361 () Bool)

(declare-fun Unit!25970 () Unit!25968)

(assert (=> b!753361 (= e!420189 Unit!25970)))

(assert (=> b!753361 false))

(declare-fun b!753362 () Bool)

(declare-fun e!420196 () Bool)

(assert (=> b!753362 (= e!420196 e!420188)))

(declare-fun res!508898 () Bool)

(assert (=> b!753362 (=> res!508898 e!420188)))

(assert (=> b!753362 (= res!508898 (= lt!335181 lt!335183))))

(assert (=> b!753362 (= lt!335181 (select (store (arr!20047 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!753363 () Bool)

(declare-fun res!508908 () Bool)

(assert (=> b!753363 (=> (not res!508908) (not e!420186))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41867 (_ BitVec 32)) Bool)

(assert (=> b!753363 (= res!508908 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!753364 () Bool)

(declare-fun res!508910 () Bool)

(declare-fun e!420195 () Bool)

(assert (=> b!753364 (=> (not res!508910) (not e!420195))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!753364 (= res!508910 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20047 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!753365 () Bool)

(declare-fun e!420192 () Bool)

(assert (=> b!753365 (= e!420192 e!420196)))

(declare-fun res!508905 () Bool)

(assert (=> b!753365 (=> res!508905 e!420196)))

(declare-fun lt!335178 () SeekEntryResult!7647)

(declare-fun lt!335186 () SeekEntryResult!7647)

(assert (=> b!753365 (= res!508905 (not (= lt!335178 lt!335186)))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!753365 (= lt!335178 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20047 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!753366 () Bool)

(declare-fun res!508913 () Bool)

(assert (=> b!753366 (=> (not res!508913) (not e!420195))))

(declare-fun e!420194 () Bool)

(assert (=> b!753366 (= res!508913 e!420194)))

(declare-fun c!82611 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!753366 (= c!82611 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!753367 () Bool)

(declare-fun lt!335184 () SeekEntryResult!7647)

(assert (=> b!753367 (= e!420190 (= lt!335184 lt!335178))))

(declare-fun b!753368 () Bool)

(declare-fun res!508900 () Bool)

(assert (=> b!753368 (=> (not res!508900) (not e!420193))))

(assert (=> b!753368 (= res!508900 (and (= (size!20468 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20468 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20468 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!753369 () Bool)

(declare-fun e!420197 () Bool)

(assert (=> b!753369 (= e!420197 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20047 a!3186) j!159) a!3186 mask!3328) lt!335186))))

(declare-fun b!753370 () Bool)

(declare-fun res!508899 () Bool)

(assert (=> b!753370 (=> (not res!508899) (not e!420193))))

(assert (=> b!753370 (= res!508899 (validKeyInArray!0 (select (arr!20047 a!3186) j!159)))))

(declare-fun b!753371 () Bool)

(assert (=> b!753371 (= e!420186 e!420195)))

(declare-fun res!508904 () Bool)

(assert (=> b!753371 (=> (not res!508904) (not e!420195))))

(declare-fun lt!335180 () SeekEntryResult!7647)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41867 (_ BitVec 32)) SeekEntryResult!7647)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!753371 (= res!508904 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20047 a!3186) j!159) mask!3328) (select (arr!20047 a!3186) j!159) a!3186 mask!3328) lt!335180))))

(assert (=> b!753371 (= lt!335180 (Intermediate!7647 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!753372 () Bool)

(assert (=> b!753372 (= e!420194 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20047 a!3186) j!159) a!3186 mask!3328) lt!335180))))

(declare-fun b!753373 () Bool)

(declare-fun Unit!25971 () Unit!25968)

(assert (=> b!753373 (= e!420189 Unit!25971)))

(declare-fun b!753374 () Bool)

(declare-fun res!508903 () Bool)

(assert (=> b!753374 (=> (not res!508903) (not e!420186))))

(assert (=> b!753374 (= res!508903 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20468 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20468 a!3186))))))

(declare-fun b!753375 () Bool)

(declare-fun e!420191 () Bool)

(assert (=> b!753375 (= e!420191 (not e!420192))))

(declare-fun res!508906 () Bool)

(assert (=> b!753375 (=> res!508906 e!420192)))

(declare-fun lt!335187 () SeekEntryResult!7647)

(get-info :version)

(assert (=> b!753375 (= res!508906 (or (not ((_ is Intermediate!7647) lt!335187)) (bvslt x!1131 (x!63869 lt!335187)) (not (= x!1131 (x!63869 lt!335187))) (not (= index!1321 (index!32958 lt!335187)))))))

(assert (=> b!753375 e!420197))

(declare-fun res!508897 () Bool)

(assert (=> b!753375 (=> (not res!508897) (not e!420197))))

(assert (=> b!753375 (= res!508897 (= lt!335184 lt!335186))))

(assert (=> b!753375 (= lt!335186 (Found!7647 j!159))))

(assert (=> b!753375 (= lt!335184 (seekEntryOrOpen!0 (select (arr!20047 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!753375 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!335182 () Unit!25968)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41867 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25968)

(assert (=> b!753375 (= lt!335182 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!753376 () Bool)

(declare-fun res!508912 () Bool)

(assert (=> b!753376 (=> (not res!508912) (not e!420186))))

(declare-datatypes ((List!14049 0))(
  ( (Nil!14046) (Cons!14045 (h!15117 (_ BitVec 64)) (t!20364 List!14049)) )
))
(declare-fun arrayNoDuplicates!0 (array!41867 (_ BitVec 32) List!14049) Bool)

(assert (=> b!753376 (= res!508912 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14046))))

(declare-fun b!753377 () Bool)

(assert (=> b!753377 (= e!420195 e!420191)))

(declare-fun res!508911 () Bool)

(assert (=> b!753377 (=> (not res!508911) (not e!420191))))

(declare-fun lt!335188 () SeekEntryResult!7647)

(assert (=> b!753377 (= res!508911 (= lt!335188 lt!335187))))

(assert (=> b!753377 (= lt!335187 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!335183 lt!335189 mask!3328))))

(assert (=> b!753377 (= lt!335188 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!335183 mask!3328) lt!335183 lt!335189 mask!3328))))

(assert (=> b!753377 (= lt!335183 (select (store (arr!20047 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!753377 (= lt!335189 (array!41868 (store (arr!20047 a!3186) i!1173 k0!2102) (size!20468 a!3186)))))

(declare-fun b!753378 () Bool)

(assert (=> b!753378 (= e!420194 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20047 a!3186) j!159) a!3186 mask!3328) (Found!7647 j!159)))))

(assert (= (and start!65694 res!508909) b!753368))

(assert (= (and b!753368 res!508900) b!753370))

(assert (= (and b!753370 res!508899) b!753358))

(assert (= (and b!753358 res!508901) b!753359))

(assert (= (and b!753359 res!508907) b!753360))

(assert (= (and b!753360 res!508895) b!753363))

(assert (= (and b!753363 res!508908) b!753376))

(assert (= (and b!753376 res!508912) b!753374))

(assert (= (and b!753374 res!508903) b!753371))

(assert (= (and b!753371 res!508904) b!753364))

(assert (= (and b!753364 res!508910) b!753366))

(assert (= (and b!753366 c!82611) b!753372))

(assert (= (and b!753366 (not c!82611)) b!753378))

(assert (= (and b!753366 res!508913) b!753377))

(assert (= (and b!753377 res!508911) b!753375))

(assert (= (and b!753375 res!508897) b!753369))

(assert (= (and b!753375 (not res!508906)) b!753365))

(assert (= (and b!753365 (not res!508905)) b!753362))

(assert (= (and b!753362 (not res!508898)) b!753356))

(assert (= (and b!753356 c!82612) b!753361))

(assert (= (and b!753356 (not c!82612)) b!753373))

(assert (= (and b!753356 res!508896) b!753357))

(assert (= (and b!753357 res!508902) b!753367))

(declare-fun m!702071 () Bool)

(assert (=> b!753372 m!702071))

(assert (=> b!753372 m!702071))

(declare-fun m!702073 () Bool)

(assert (=> b!753372 m!702073))

(assert (=> b!753371 m!702071))

(assert (=> b!753371 m!702071))

(declare-fun m!702075 () Bool)

(assert (=> b!753371 m!702075))

(assert (=> b!753371 m!702075))

(assert (=> b!753371 m!702071))

(declare-fun m!702077 () Bool)

(assert (=> b!753371 m!702077))

(assert (=> b!753365 m!702071))

(assert (=> b!753365 m!702071))

(declare-fun m!702079 () Bool)

(assert (=> b!753365 m!702079))

(declare-fun m!702081 () Bool)

(assert (=> start!65694 m!702081))

(declare-fun m!702083 () Bool)

(assert (=> start!65694 m!702083))

(declare-fun m!702085 () Bool)

(assert (=> b!753363 m!702085))

(assert (=> b!753375 m!702071))

(assert (=> b!753375 m!702071))

(declare-fun m!702087 () Bool)

(assert (=> b!753375 m!702087))

(declare-fun m!702089 () Bool)

(assert (=> b!753375 m!702089))

(declare-fun m!702091 () Bool)

(assert (=> b!753375 m!702091))

(declare-fun m!702093 () Bool)

(assert (=> b!753358 m!702093))

(declare-fun m!702095 () Bool)

(assert (=> b!753359 m!702095))

(declare-fun m!702097 () Bool)

(assert (=> b!753360 m!702097))

(declare-fun m!702099 () Bool)

(assert (=> b!753376 m!702099))

(assert (=> b!753378 m!702071))

(assert (=> b!753378 m!702071))

(assert (=> b!753378 m!702079))

(assert (=> b!753370 m!702071))

(assert (=> b!753370 m!702071))

(declare-fun m!702101 () Bool)

(assert (=> b!753370 m!702101))

(declare-fun m!702103 () Bool)

(assert (=> b!753377 m!702103))

(declare-fun m!702105 () Bool)

(assert (=> b!753377 m!702105))

(declare-fun m!702107 () Bool)

(assert (=> b!753377 m!702107))

(assert (=> b!753377 m!702105))

(declare-fun m!702109 () Bool)

(assert (=> b!753377 m!702109))

(declare-fun m!702111 () Bool)

(assert (=> b!753377 m!702111))

(assert (=> b!753369 m!702071))

(assert (=> b!753369 m!702071))

(declare-fun m!702113 () Bool)

(assert (=> b!753369 m!702113))

(assert (=> b!753362 m!702109))

(declare-fun m!702115 () Bool)

(assert (=> b!753362 m!702115))

(declare-fun m!702117 () Bool)

(assert (=> b!753364 m!702117))

(declare-fun m!702119 () Bool)

(assert (=> b!753357 m!702119))

(declare-fun m!702121 () Bool)

(assert (=> b!753357 m!702121))

(check-sat (not b!753363) (not b!753372) (not b!753360) (not b!753377) (not b!753371) (not b!753359) (not b!753369) (not b!753376) (not b!753357) (not b!753358) (not b!753378) (not b!753365) (not b!753375) (not start!65694) (not b!753370))
(check-sat)
