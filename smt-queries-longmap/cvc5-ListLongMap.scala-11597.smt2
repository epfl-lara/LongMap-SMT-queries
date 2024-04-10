; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135236 () Bool)

(assert start!135236)

(declare-fun b!1573303 () Bool)

(declare-fun res!1074904 () Bool)

(declare-fun e!877343 () Bool)

(assert (=> b!1573303 (=> (not res!1074904) (not e!877343))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1573303 (= res!1074904 (validKeyInArray!0 k!754))))

(declare-fun res!1074903 () Bool)

(assert (=> start!135236 (=> (not res!1074903) (not e!877343))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135236 (= res!1074903 (validMask!0 mask!889))))

(assert (=> start!135236 e!877343))

(assert (=> start!135236 true))

(declare-datatypes ((array!105105 0))(
  ( (array!105106 (arr!50710 (Array (_ BitVec 32) (_ BitVec 64))) (size!51260 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105105)

(declare-fun array_inv!39437 (array!105105) Bool)

(assert (=> start!135236 (array_inv!39437 _keys!600)))

(declare-fun b!1573302 () Bool)

(declare-fun res!1074905 () Bool)

(assert (=> b!1573302 (=> (not res!1074905) (not e!877343))))

(assert (=> b!1573302 (= res!1074905 (= (size!51260 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun e!877342 () Bool)

(declare-datatypes ((SeekEntryResult!13623 0))(
  ( (MissingZero!13623 (index!56890 (_ BitVec 32))) (Found!13623 (index!56891 (_ BitVec 32))) (Intermediate!13623 (undefined!14435 Bool) (index!56892 (_ BitVec 32)) (x!141689 (_ BitVec 32))) (Undefined!13623) (MissingVacant!13623 (index!56893 (_ BitVec 32))) )
))
(declare-fun lt!674350 () SeekEntryResult!13623)

(declare-fun b!1573305 () Bool)

(assert (=> b!1573305 (= e!877342 (and (not (is-MissingVacant!13623 lt!674350)) (is-Found!13623 lt!674350) (not (= (select (arr!50710 _keys!600) (index!56891 lt!674350)) k!754))))))

(declare-fun lt!674349 () SeekEntryResult!13623)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105105 (_ BitVec 32)) SeekEntryResult!13623)

(assert (=> b!1573305 (= lt!674350 (seekKeyOrZeroReturnVacant!0 (x!141689 lt!674349) (index!56892 lt!674349) (index!56892 lt!674349) k!754 _keys!600 mask!889))))

(declare-fun b!1573304 () Bool)

(assert (=> b!1573304 (= e!877343 e!877342)))

(declare-fun res!1074906 () Bool)

(assert (=> b!1573304 (=> (not res!1074906) (not e!877342))))

(assert (=> b!1573304 (= res!1074906 (and (not (undefined!14435 lt!674349)) (is-Intermediate!13623 lt!674349) (not (= (select (arr!50710 _keys!600) (index!56892 lt!674349)) k!754)) (not (= (select (arr!50710 _keys!600) (index!56892 lt!674349)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!50710 _keys!600) (index!56892 lt!674349)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge (index!56892 lt!674349) #b00000000000000000000000000000000) (bvslt (index!56892 lt!674349) (bvadd #b00000000000000000000000000000001 mask!889))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105105 (_ BitVec 32)) SeekEntryResult!13623)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1573304 (= lt!674349 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(assert (= (and start!135236 res!1074903) b!1573302))

(assert (= (and b!1573302 res!1074905) b!1573303))

(assert (= (and b!1573303 res!1074904) b!1573304))

(assert (= (and b!1573304 res!1074906) b!1573305))

(declare-fun m!1446787 () Bool)

(assert (=> b!1573303 m!1446787))

(declare-fun m!1446789 () Bool)

(assert (=> start!135236 m!1446789))

(declare-fun m!1446791 () Bool)

(assert (=> start!135236 m!1446791))

(declare-fun m!1446793 () Bool)

(assert (=> b!1573305 m!1446793))

(declare-fun m!1446795 () Bool)

(assert (=> b!1573305 m!1446795))

(declare-fun m!1446797 () Bool)

(assert (=> b!1573304 m!1446797))

(declare-fun m!1446799 () Bool)

(assert (=> b!1573304 m!1446799))

(assert (=> b!1573304 m!1446799))

(declare-fun m!1446801 () Bool)

(assert (=> b!1573304 m!1446801))

(push 1)

(assert (not b!1573305))

(assert (not b!1573304))

(assert (not start!135236))

(assert (not b!1573303))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1573360 () Bool)

(declare-fun e!877377 () SeekEntryResult!13623)

(declare-fun e!877378 () SeekEntryResult!13623)

(assert (=> b!1573360 (= e!877377 e!877378)))

(declare-fun c!145465 () Bool)

(declare-fun lt!674373 () (_ BitVec 64))

(assert (=> b!1573360 (= c!145465 (= lt!674373 k!754))))

(declare-fun b!1573361 () Bool)

(declare-fun e!877379 () SeekEntryResult!13623)

(assert (=> b!1573361 (= e!877379 (MissingVacant!13623 (index!56892 lt!674349)))))

(declare-fun b!1573362 () Bool)

(assert (=> b!1573362 (= e!877378 (Found!13623 (index!56892 lt!674349)))))

(declare-fun b!1573363 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1573363 (= e!877379 (seekKeyOrZeroReturnVacant!0 (bvadd (x!141689 lt!674349) #b00000000000000000000000000000001) (nextIndex!0 (index!56892 lt!674349) (x!141689 lt!674349) mask!889) (index!56892 lt!674349) k!754 _keys!600 mask!889))))

(declare-fun b!1573364 () Bool)

(assert (=> b!1573364 (= e!877377 Undefined!13623)))

(declare-fun b!1573365 () Bool)

(declare-fun c!145466 () Bool)

(assert (=> b!1573365 (= c!145466 (= lt!674373 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1573365 (= e!877378 e!877379)))

(declare-fun d!164971 () Bool)

(declare-fun lt!674374 () SeekEntryResult!13623)

(assert (=> d!164971 (and (or (is-Undefined!13623 lt!674374) (not (is-Found!13623 lt!674374)) (and (bvsge (index!56891 lt!674374) #b00000000000000000000000000000000) (bvslt (index!56891 lt!674374) (size!51260 _keys!600)))) (or (is-Undefined!13623 lt!674374) (is-Found!13623 lt!674374) (not (is-MissingVacant!13623 lt!674374)) (not (= (index!56893 lt!674374) (index!56892 lt!674349))) (and (bvsge (index!56893 lt!674374) #b00000000000000000000000000000000) (bvslt (index!56893 lt!674374) (size!51260 _keys!600)))) (or (is-Undefined!13623 lt!674374) (ite (is-Found!13623 lt!674374) (= (select (arr!50710 _keys!600) (index!56891 lt!674374)) k!754) (and (is-MissingVacant!13623 lt!674374) (= (index!56893 lt!674374) (index!56892 lt!674349)) (= (select (arr!50710 _keys!600) (index!56893 lt!674374)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!164971 (= lt!674374 e!877377)))

(declare-fun c!145467 () Bool)

(assert (=> d!164971 (= c!145467 (bvsge (x!141689 lt!674349) #b01111111111111111111111111111110))))

(assert (=> d!164971 (= lt!674373 (select (arr!50710 _keys!600) (index!56892 lt!674349)))))

(assert (=> d!164971 (validMask!0 mask!889)))

(assert (=> d!164971 (= (seekKeyOrZeroReturnVacant!0 (x!141689 lt!674349) (index!56892 lt!674349) (index!56892 lt!674349) k!754 _keys!600 mask!889) lt!674374)))

(assert (= (and d!164971 c!145467) b!1573364))

(assert (= (and d!164971 (not c!145467)) b!1573360))

(assert (= (and b!1573360 c!145465) b!1573362))

(assert (= (and b!1573360 (not c!145465)) b!1573365))

(assert (= (and b!1573365 c!145466) b!1573361))

(assert (= (and b!1573365 (not c!145466)) b!1573363))

(declare-fun m!1446843 () Bool)

(assert (=> b!1573363 m!1446843))

(assert (=> b!1573363 m!1446843))

(declare-fun m!1446845 () Bool)

(assert (=> b!1573363 m!1446845))

(declare-fun m!1446847 () Bool)

(assert (=> d!164971 m!1446847))

(declare-fun m!1446849 () Bool)

(assert (=> d!164971 m!1446849))

(assert (=> d!164971 m!1446797))

(assert (=> d!164971 m!1446789))

(assert (=> b!1573305 d!164971))

(declare-fun b!1573402 () Bool)

(declare-fun e!877400 () SeekEntryResult!13623)

(assert (=> b!1573402 (= e!877400 (Intermediate!13623 true (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun d!164977 () Bool)

(declare-fun e!877401 () Bool)

(assert (=> d!164977 e!877401))

(declare-fun c!145485 () Bool)

(declare-fun lt!674385 () SeekEntryResult!13623)

(assert (=> d!164977 (= c!145485 (and (is-Intermediate!13623 lt!674385) (undefined!14435 lt!674385)))))

(assert (=> d!164977 (= lt!674385 e!877400)))

(declare-fun c!145483 () Bool)

(assert (=> d!164977 (= c!145483 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!674386 () (_ BitVec 64))

(assert (=> d!164977 (= lt!674386 (select (arr!50710 _keys!600) (toIndex!0 k!754 mask!889)))))

(assert (=> d!164977 (validMask!0 mask!889)))

(assert (=> d!164977 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889) lt!674385)))

(declare-fun b!1573403 () Bool)

(assert (=> b!1573403 (and (bvsge (index!56892 lt!674385) #b00000000000000000000000000000000) (bvslt (index!56892 lt!674385) (size!51260 _keys!600)))))

(declare-fun e!877399 () Bool)

(assert (=> b!1573403 (= e!877399 (= (select (arr!50710 _keys!600) (index!56892 lt!674385)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1573404 () Bool)

(assert (=> b!1573404 (and (bvsge (index!56892 lt!674385) #b00000000000000000000000000000000) (bvslt (index!56892 lt!674385) (size!51260 _keys!600)))))

(declare-fun res!1074939 () Bool)

(assert (=> b!1573404 (= res!1074939 (= (select (arr!50710 _keys!600) (index!56892 lt!674385)) k!754))))

(assert (=> b!1573404 (=> res!1074939 e!877399)))

(declare-fun e!877403 () Bool)

(assert (=> b!1573404 (= e!877403 e!877399)))

(declare-fun b!1573405 () Bool)

(assert (=> b!1573405 (= e!877401 (bvsge (x!141689 lt!674385) #b01111111111111111111111111111110))))

(declare-fun e!877402 () SeekEntryResult!13623)

(declare-fun b!1573406 () Bool)

(assert (=> b!1573406 (= e!877402 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000 mask!889) k!754 _keys!600 mask!889))))

(declare-fun b!1573407 () Bool)

(assert (=> b!1573407 (= e!877401 e!877403)))

(declare-fun res!1074938 () Bool)

(assert (=> b!1573407 (= res!1074938 (and (is-Intermediate!13623 lt!674385) (not (undefined!14435 lt!674385)) (bvslt (x!141689 lt!674385) #b01111111111111111111111111111110) (bvsge (x!141689 lt!674385) #b00000000000000000000000000000000) (bvsge (x!141689 lt!674385) #b00000000000000000000000000000000)))))

(assert (=> b!1573407 (=> (not res!1074938) (not e!877403))))

(declare-fun b!1573408 () Bool)

(assert (=> b!1573408 (= e!877402 (Intermediate!13623 false (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1573409 () Bool)

(assert (=> b!1573409 (and (bvsge (index!56892 lt!674385) #b00000000000000000000000000000000) (bvslt (index!56892 lt!674385) (size!51260 _keys!600)))))

(declare-fun res!1074937 () Bool)

(assert (=> b!1573409 (= res!1074937 (= (select (arr!50710 _keys!600) (index!56892 lt!674385)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1573409 (=> res!1074937 e!877399)))

(declare-fun b!1573410 () Bool)

(assert (=> b!1573410 (= e!877400 e!877402)))

(declare-fun c!145484 () Bool)

(assert (=> b!1573410 (= c!145484 (or (= lt!674386 k!754) (= (bvadd lt!674386 lt!674386) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!164977 c!145483) b!1573402))

(assert (= (and d!164977 (not c!145483)) b!1573410))

(assert (= (and b!1573410 c!145484) b!1573408))

(assert (= (and b!1573410 (not c!145484)) b!1573406))

(assert (= (and d!164977 c!145485) b!1573405))

(assert (= (and d!164977 (not c!145485)) b!1573407))

(assert (= (and b!1573407 res!1074938) b!1573404))

(assert (= (and b!1573404 (not res!1074939)) b!1573409))

(assert (= (and b!1573409 (not res!1074937)) b!1573403))

(declare-fun m!1446859 () Bool)

(assert (=> b!1573404 m!1446859))

(assert (=> b!1573406 m!1446799))

(declare-fun m!1446861 () Bool)

(assert (=> b!1573406 m!1446861))

(assert (=> b!1573406 m!1446861))

(declare-fun m!1446863 () Bool)

(assert (=> b!1573406 m!1446863))

(assert (=> d!164977 m!1446799))

(declare-fun m!1446865 () Bool)

(assert (=> d!164977 m!1446865))

(assert (=> d!164977 m!1446789))

(assert (=> b!1573403 m!1446859))

(assert (=> b!1573409 m!1446859))

(assert (=> b!1573304 d!164977))

(declare-fun d!164981 () Bool)

(declare-fun lt!674396 () (_ BitVec 32))

(declare-fun lt!674395 () (_ BitVec 32))

(assert (=> d!164981 (= lt!674396 (bvmul (bvxor lt!674395 (bvlshr lt!674395 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!164981 (= lt!674395 ((_ extract 31 0) (bvand (bvxor k!754 (bvlshr k!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!164981 (and (bvsge mask!889 #b00000000000000000000000000000000) (let ((res!1074940 (let ((h!38234 ((_ extract 31 0) (bvand (bvxor k!754 (bvlshr k!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!141697 (bvmul (bvxor h!38234 (bvlshr h!38234 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!141697 (bvlshr x!141697 #b00000000000000000000000000001101)) mask!889))))) (and (bvslt res!1074940 (bvadd mask!889 #b00000000000000000000000000000001)) (bvsge res!1074940 #b00000000000000000000000000000000))))))

(assert (=> d!164981 (= (toIndex!0 k!754 mask!889) (bvand (bvxor lt!674396 (bvlshr lt!674396 #b00000000000000000000000000001101)) mask!889))))

(assert (=> b!1573304 d!164981))

(declare-fun d!164983 () Bool)

(assert (=> d!164983 (= (validMask!0 mask!889) (and (or (= mask!889 #b00000000000000000000000000000111) (= mask!889 #b00000000000000000000000000001111) (= mask!889 #b00000000000000000000000000011111) (= mask!889 #b00000000000000000000000000111111) (= mask!889 #b00000000000000000000000001111111) (= mask!889 #b00000000000000000000000011111111) (= mask!889 #b00000000000000000000000111111111) (= mask!889 #b00000000000000000000001111111111) (= mask!889 #b00000000000000000000011111111111) (= mask!889 #b00000000000000000000111111111111) (= mask!889 #b00000000000000000001111111111111) (= mask!889 #b00000000000000000011111111111111) (= mask!889 #b00000000000000000111111111111111) (= mask!889 #b00000000000000001111111111111111) (= mask!889 #b00000000000000011111111111111111) (= mask!889 #b00000000000000111111111111111111) (= mask!889 #b00000000000001111111111111111111) (= mask!889 #b00000000000011111111111111111111) (= mask!889 #b00000000000111111111111111111111) (= mask!889 #b00000000001111111111111111111111) (= mask!889 #b00000000011111111111111111111111) (= mask!889 #b00000000111111111111111111111111) (= mask!889 #b00000001111111111111111111111111) (= mask!889 #b00000011111111111111111111111111) (= mask!889 #b00000111111111111111111111111111) (= mask!889 #b00001111111111111111111111111111) (= mask!889 #b00011111111111111111111111111111) (= mask!889 #b00111111111111111111111111111111)) (bvsle mask!889 #b00111111111111111111111111111111)))))

(assert (=> start!135236 d!164983))

(declare-fun d!164987 () Bool)

(assert (=> d!164987 (= (array_inv!39437 _keys!600) (bvsge (size!51260 _keys!600) #b00000000000000000000000000000000))))

(assert (=> start!135236 d!164987))

(declare-fun d!164989 () Bool)

(assert (=> d!164989 (= (validKeyInArray!0 k!754) (and (not (= k!754 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!754 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1573303 d!164989))

(push 1)

(assert (not b!1573406))

(assert (not d!164977))

(assert (not b!1573363))

(assert (not d!164971))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

