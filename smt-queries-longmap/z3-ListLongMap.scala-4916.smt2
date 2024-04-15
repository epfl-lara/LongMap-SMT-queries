; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67718 () Bool)

(assert start!67718)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42777 0))(
  ( (array!42778 (arr!20477 (Array (_ BitVec 32) (_ BitVec 64))) (size!20898 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42777)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!785992 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun e!436924 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8074 0))(
  ( (MissingZero!8074 (index!34664 (_ BitVec 32))) (Found!8074 (index!34665 (_ BitVec 32))) (Intermediate!8074 (undefined!8886 Bool) (index!34666 (_ BitVec 32)) (x!65617 (_ BitVec 32))) (Undefined!8074) (MissingVacant!8074 (index!34667 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42777 (_ BitVec 32)) SeekEntryResult!8074)

(assert (=> b!785992 (= e!436924 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20477 a!3186) j!159) a!3186 mask!3328) (Found!8074 j!159)))))

(declare-fun b!785993 () Bool)

(declare-datatypes ((Unit!27164 0))(
  ( (Unit!27165) )
))
(declare-fun e!436928 () Unit!27164)

(declare-fun Unit!27166 () Unit!27164)

(assert (=> b!785993 (= e!436928 Unit!27166)))

(declare-fun b!785994 () Bool)

(declare-fun res!532218 () Bool)

(declare-fun e!436920 () Bool)

(assert (=> b!785994 (=> (not res!532218) (not e!436920))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!785994 (= res!532218 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20477 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!785995 () Bool)

(declare-fun e!436923 () Bool)

(assert (=> b!785995 (= e!436920 e!436923)))

(declare-fun res!532231 () Bool)

(assert (=> b!785995 (=> (not res!532231) (not e!436923))))

(declare-fun lt!350390 () SeekEntryResult!8074)

(declare-fun lt!350392 () SeekEntryResult!8074)

(assert (=> b!785995 (= res!532231 (= lt!350390 lt!350392))))

(declare-fun lt!350386 () (_ BitVec 64))

(declare-fun lt!350389 () array!42777)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42777 (_ BitVec 32)) SeekEntryResult!8074)

(assert (=> b!785995 (= lt!350392 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!350386 lt!350389 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!785995 (= lt!350390 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!350386 mask!3328) lt!350386 lt!350389 mask!3328))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!785995 (= lt!350386 (select (store (arr!20477 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!785995 (= lt!350389 (array!42778 (store (arr!20477 a!3186) i!1173 k0!2102) (size!20898 a!3186)))))

(declare-fun b!785996 () Bool)

(declare-fun res!532215 () Bool)

(declare-fun e!436927 () Bool)

(assert (=> b!785996 (=> (not res!532215) (not e!436927))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42777 (_ BitVec 32)) SeekEntryResult!8074)

(assert (=> b!785996 (= res!532215 (= (seekEntryOrOpen!0 lt!350386 lt!350389 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!350386 lt!350389 mask!3328)))))

(declare-fun b!785997 () Bool)

(declare-fun e!436922 () Bool)

(declare-fun e!436921 () Bool)

(assert (=> b!785997 (= e!436922 e!436921)))

(declare-fun res!532216 () Bool)

(assert (=> b!785997 (=> res!532216 e!436921)))

(declare-fun lt!350388 () SeekEntryResult!8074)

(declare-fun lt!350391 () SeekEntryResult!8074)

(assert (=> b!785997 (= res!532216 (not (= lt!350388 lt!350391)))))

(assert (=> b!785997 (= lt!350388 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20477 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!785998 () Bool)

(declare-fun e!436929 () Bool)

(assert (=> b!785998 (= e!436929 e!436920)))

(declare-fun res!532219 () Bool)

(assert (=> b!785998 (=> (not res!532219) (not e!436920))))

(declare-fun lt!350387 () SeekEntryResult!8074)

(assert (=> b!785998 (= res!532219 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20477 a!3186) j!159) mask!3328) (select (arr!20477 a!3186) j!159) a!3186 mask!3328) lt!350387))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!785998 (= lt!350387 (Intermediate!8074 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!785999 () Bool)

(declare-fun e!436930 () Bool)

(assert (=> b!785999 (= e!436921 e!436930)))

(declare-fun res!532225 () Bool)

(assert (=> b!785999 (=> res!532225 e!436930)))

(declare-fun lt!350395 () (_ BitVec 64))

(assert (=> b!785999 (= res!532225 (= lt!350395 lt!350386))))

(assert (=> b!785999 (= lt!350395 (select (store (arr!20477 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun res!532223 () Bool)

(declare-fun e!436925 () Bool)

(assert (=> start!67718 (=> (not res!532223) (not e!436925))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67718 (= res!532223 (validMask!0 mask!3328))))

(assert (=> start!67718 e!436925))

(assert (=> start!67718 true))

(declare-fun array_inv!16360 (array!42777) Bool)

(assert (=> start!67718 (array_inv!16360 a!3186)))

(declare-fun b!786000 () Bool)

(declare-fun res!532224 () Bool)

(assert (=> b!786000 (=> (not res!532224) (not e!436925))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!786000 (= res!532224 (validKeyInArray!0 (select (arr!20477 a!3186) j!159)))))

(declare-fun b!786001 () Bool)

(declare-fun e!436926 () Bool)

(assert (=> b!786001 (= e!436926 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20477 a!3186) j!159) a!3186 mask!3328) lt!350391))))

(declare-fun b!786002 () Bool)

(declare-fun Unit!27167 () Unit!27164)

(assert (=> b!786002 (= e!436928 Unit!27167)))

(assert (=> b!786002 false))

(declare-fun b!786003 () Bool)

(declare-fun lt!350385 () SeekEntryResult!8074)

(assert (=> b!786003 (= e!436927 (= lt!350385 lt!350388))))

(declare-fun b!786004 () Bool)

(assert (=> b!786004 (= e!436924 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20477 a!3186) j!159) a!3186 mask!3328) lt!350387))))

(declare-fun b!786005 () Bool)

(declare-fun res!532227 () Bool)

(assert (=> b!786005 (=> (not res!532227) (not e!436925))))

(assert (=> b!786005 (= res!532227 (validKeyInArray!0 k0!2102))))

(declare-fun b!786006 () Bool)

(assert (=> b!786006 (= e!436930 true)))

(assert (=> b!786006 e!436927))

(declare-fun res!532228 () Bool)

(assert (=> b!786006 (=> (not res!532228) (not e!436927))))

(assert (=> b!786006 (= res!532228 (= lt!350395 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!350394 () Unit!27164)

(assert (=> b!786006 (= lt!350394 e!436928)))

(declare-fun c!87297 () Bool)

(assert (=> b!786006 (= c!87297 (= lt!350395 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!786007 () Bool)

(declare-fun res!532222 () Bool)

(assert (=> b!786007 (=> (not res!532222) (not e!436920))))

(assert (=> b!786007 (= res!532222 e!436924)))

(declare-fun c!87296 () Bool)

(assert (=> b!786007 (= c!87296 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!786008 () Bool)

(declare-fun res!532221 () Bool)

(assert (=> b!786008 (=> (not res!532221) (not e!436925))))

(assert (=> b!786008 (= res!532221 (and (= (size!20898 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20898 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20898 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!786009 () Bool)

(declare-fun res!532233 () Bool)

(assert (=> b!786009 (=> (not res!532233) (not e!436929))))

(assert (=> b!786009 (= res!532233 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20898 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20898 a!3186))))))

(declare-fun b!786010 () Bool)

(declare-fun res!532220 () Bool)

(assert (=> b!786010 (=> (not res!532220) (not e!436929))))

(declare-datatypes ((List!14518 0))(
  ( (Nil!14515) (Cons!14514 (h!15637 (_ BitVec 64)) (t!20824 List!14518)) )
))
(declare-fun arrayNoDuplicates!0 (array!42777 (_ BitVec 32) List!14518) Bool)

(assert (=> b!786010 (= res!532220 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14515))))

(declare-fun b!786011 () Bool)

(assert (=> b!786011 (= e!436923 (not e!436922))))

(declare-fun res!532230 () Bool)

(assert (=> b!786011 (=> res!532230 e!436922)))

(get-info :version)

(assert (=> b!786011 (= res!532230 (or (not ((_ is Intermediate!8074) lt!350392)) (bvslt x!1131 (x!65617 lt!350392)) (not (= x!1131 (x!65617 lt!350392))) (not (= index!1321 (index!34666 lt!350392)))))))

(assert (=> b!786011 e!436926))

(declare-fun res!532217 () Bool)

(assert (=> b!786011 (=> (not res!532217) (not e!436926))))

(assert (=> b!786011 (= res!532217 (= lt!350385 lt!350391))))

(assert (=> b!786011 (= lt!350391 (Found!8074 j!159))))

(assert (=> b!786011 (= lt!350385 (seekEntryOrOpen!0 (select (arr!20477 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42777 (_ BitVec 32)) Bool)

(assert (=> b!786011 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!350396 () Unit!27164)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42777 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27164)

(assert (=> b!786011 (= lt!350396 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!786012 () Bool)

(assert (=> b!786012 (= e!436925 e!436929)))

(declare-fun res!532226 () Bool)

(assert (=> b!786012 (=> (not res!532226) (not e!436929))))

(declare-fun lt!350393 () SeekEntryResult!8074)

(assert (=> b!786012 (= res!532226 (or (= lt!350393 (MissingZero!8074 i!1173)) (= lt!350393 (MissingVacant!8074 i!1173))))))

(assert (=> b!786012 (= lt!350393 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!786013 () Bool)

(declare-fun res!532232 () Bool)

(assert (=> b!786013 (=> (not res!532232) (not e!436925))))

(declare-fun arrayContainsKey!0 (array!42777 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!786013 (= res!532232 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!786014 () Bool)

(declare-fun res!532229 () Bool)

(assert (=> b!786014 (=> (not res!532229) (not e!436929))))

(assert (=> b!786014 (= res!532229 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!67718 res!532223) b!786008))

(assert (= (and b!786008 res!532221) b!786000))

(assert (= (and b!786000 res!532224) b!786005))

(assert (= (and b!786005 res!532227) b!786013))

(assert (= (and b!786013 res!532232) b!786012))

(assert (= (and b!786012 res!532226) b!786014))

(assert (= (and b!786014 res!532229) b!786010))

(assert (= (and b!786010 res!532220) b!786009))

(assert (= (and b!786009 res!532233) b!785998))

(assert (= (and b!785998 res!532219) b!785994))

(assert (= (and b!785994 res!532218) b!786007))

(assert (= (and b!786007 c!87296) b!786004))

(assert (= (and b!786007 (not c!87296)) b!785992))

(assert (= (and b!786007 res!532222) b!785995))

(assert (= (and b!785995 res!532231) b!786011))

(assert (= (and b!786011 res!532217) b!786001))

(assert (= (and b!786011 (not res!532230)) b!785997))

(assert (= (and b!785997 (not res!532216)) b!785999))

(assert (= (and b!785999 (not res!532225)) b!786006))

(assert (= (and b!786006 c!87297) b!786002))

(assert (= (and b!786006 (not c!87297)) b!785993))

(assert (= (and b!786006 res!532228) b!785996))

(assert (= (and b!785996 res!532215) b!786003))

(declare-fun m!727359 () Bool)

(assert (=> b!785998 m!727359))

(assert (=> b!785998 m!727359))

(declare-fun m!727361 () Bool)

(assert (=> b!785998 m!727361))

(assert (=> b!785998 m!727361))

(assert (=> b!785998 m!727359))

(declare-fun m!727363 () Bool)

(assert (=> b!785998 m!727363))

(assert (=> b!786001 m!727359))

(assert (=> b!786001 m!727359))

(declare-fun m!727365 () Bool)

(assert (=> b!786001 m!727365))

(declare-fun m!727367 () Bool)

(assert (=> b!785999 m!727367))

(declare-fun m!727369 () Bool)

(assert (=> b!785999 m!727369))

(declare-fun m!727371 () Bool)

(assert (=> b!786012 m!727371))

(declare-fun m!727373 () Bool)

(assert (=> b!786010 m!727373))

(declare-fun m!727375 () Bool)

(assert (=> b!785995 m!727375))

(assert (=> b!785995 m!727367))

(declare-fun m!727377 () Bool)

(assert (=> b!785995 m!727377))

(declare-fun m!727379 () Bool)

(assert (=> b!785995 m!727379))

(declare-fun m!727381 () Bool)

(assert (=> b!785995 m!727381))

(assert (=> b!785995 m!727377))

(declare-fun m!727383 () Bool)

(assert (=> b!785996 m!727383))

(declare-fun m!727385 () Bool)

(assert (=> b!785996 m!727385))

(declare-fun m!727387 () Bool)

(assert (=> b!786014 m!727387))

(assert (=> b!785992 m!727359))

(assert (=> b!785992 m!727359))

(declare-fun m!727389 () Bool)

(assert (=> b!785992 m!727389))

(assert (=> b!786011 m!727359))

(assert (=> b!786011 m!727359))

(declare-fun m!727391 () Bool)

(assert (=> b!786011 m!727391))

(declare-fun m!727393 () Bool)

(assert (=> b!786011 m!727393))

(declare-fun m!727395 () Bool)

(assert (=> b!786011 m!727395))

(declare-fun m!727397 () Bool)

(assert (=> b!786013 m!727397))

(assert (=> b!786000 m!727359))

(assert (=> b!786000 m!727359))

(declare-fun m!727399 () Bool)

(assert (=> b!786000 m!727399))

(declare-fun m!727401 () Bool)

(assert (=> start!67718 m!727401))

(declare-fun m!727403 () Bool)

(assert (=> start!67718 m!727403))

(declare-fun m!727405 () Bool)

(assert (=> b!786005 m!727405))

(assert (=> b!786004 m!727359))

(assert (=> b!786004 m!727359))

(declare-fun m!727407 () Bool)

(assert (=> b!786004 m!727407))

(declare-fun m!727409 () Bool)

(assert (=> b!785994 m!727409))

(assert (=> b!785997 m!727359))

(assert (=> b!785997 m!727359))

(assert (=> b!785997 m!727389))

(check-sat (not b!786001) (not b!785995) (not b!786004) (not b!785998) (not b!786011) (not b!785997) (not b!786000) (not b!785996) (not b!786010) (not b!786005) (not b!786012) (not b!785992) (not start!67718) (not b!786013) (not b!786014))
(check-sat)
