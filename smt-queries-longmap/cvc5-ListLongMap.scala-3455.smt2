; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48000 () Bool)

(assert start!48000)

(declare-fun b!528371 () Bool)

(declare-fun res!324370 () Bool)

(declare-fun e!307932 () Bool)

(assert (=> b!528371 (=> (not res!324370) (not e!307932))))

(declare-datatypes ((array!33493 0))(
  ( (array!33494 (arr!16095 (Array (_ BitVec 32) (_ BitVec 64))) (size!16459 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33493)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!528371 (= res!324370 (validKeyInArray!0 (select (arr!16095 a!3235) j!176)))))

(declare-fun b!528372 () Bool)

(declare-fun res!324374 () Bool)

(declare-fun e!307925 () Bool)

(assert (=> b!528372 (=> res!324374 e!307925)))

(declare-fun e!307929 () Bool)

(assert (=> b!528372 (= res!324374 e!307929)))

(declare-fun res!324377 () Bool)

(assert (=> b!528372 (=> (not res!324377) (not e!307929))))

(declare-datatypes ((SeekEntryResult!4562 0))(
  ( (MissingZero!4562 (index!20472 (_ BitVec 32))) (Found!4562 (index!20473 (_ BitVec 32))) (Intermediate!4562 (undefined!5374 Bool) (index!20474 (_ BitVec 32)) (x!49450 (_ BitVec 32))) (Undefined!4562) (MissingVacant!4562 (index!20475 (_ BitVec 32))) )
))
(declare-fun lt!243310 () SeekEntryResult!4562)

(assert (=> b!528372 (= res!324377 (bvsgt #b00000000000000000000000000000000 (x!49450 lt!243310)))))

(declare-fun b!528373 () Bool)

(declare-fun e!307931 () Bool)

(assert (=> b!528373 (= e!307931 e!307925)))

(declare-fun res!324368 () Bool)

(assert (=> b!528373 (=> res!324368 e!307925)))

(declare-fun lt!243300 () (_ BitVec 32))

(assert (=> b!528373 (= res!324368 (or (bvsgt (x!49450 lt!243310) #b01111111111111111111111111111110) (bvslt lt!243300 #b00000000000000000000000000000000) (bvsge lt!243300 (size!16459 a!3235)) (bvslt (index!20474 lt!243310) #b00000000000000000000000000000000) (bvsge (index!20474 lt!243310) (size!16459 a!3235)) (not (= lt!243310 (Intermediate!4562 false (index!20474 lt!243310) (x!49450 lt!243310))))))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!528373 (= (index!20474 lt!243310) i!1204)))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((Unit!16700 0))(
  ( (Unit!16701) )
))
(declare-fun lt!243307 () Unit!16700)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33493 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16700)

(assert (=> b!528373 (= lt!243307 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!243300 #b00000000000000000000000000000000 (index!20474 lt!243310) (x!49450 lt!243310) mask!3524))))

(assert (=> b!528373 (and (or (= (select (arr!16095 a!3235) (index!20474 lt!243310)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16095 a!3235) (index!20474 lt!243310)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16095 a!3235) (index!20474 lt!243310)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16095 a!3235) (index!20474 lt!243310)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!243304 () Unit!16700)

(declare-fun e!307924 () Unit!16700)

(assert (=> b!528373 (= lt!243304 e!307924)))

(declare-fun c!62312 () Bool)

(assert (=> b!528373 (= c!62312 (= (select (arr!16095 a!3235) (index!20474 lt!243310)) (select (arr!16095 a!3235) j!176)))))

(assert (=> b!528373 (and (bvslt (x!49450 lt!243310) #b01111111111111111111111111111110) (or (= (select (arr!16095 a!3235) (index!20474 lt!243310)) (select (arr!16095 a!3235) j!176)) (= (select (arr!16095 a!3235) (index!20474 lt!243310)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16095 a!3235) (index!20474 lt!243310)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!528374 () Bool)

(declare-fun res!324365 () Bool)

(declare-fun e!307927 () Bool)

(assert (=> b!528374 (=> (not res!324365) (not e!307927))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33493 (_ BitVec 32)) Bool)

(assert (=> b!528374 (= res!324365 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!324367 () Bool)

(assert (=> start!48000 (=> (not res!324367) (not e!307932))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48000 (= res!324367 (validMask!0 mask!3524))))

(assert (=> start!48000 e!307932))

(assert (=> start!48000 true))

(declare-fun array_inv!11891 (array!33493) Bool)

(assert (=> start!48000 (array_inv!11891 a!3235)))

(declare-fun b!528375 () Bool)

(declare-fun res!324364 () Bool)

(assert (=> b!528375 (=> (not res!324364) (not e!307932))))

(assert (=> b!528375 (= res!324364 (validKeyInArray!0 k!2280))))

(declare-fun b!528376 () Bool)

(assert (=> b!528376 (= e!307932 e!307927)))

(declare-fun res!324371 () Bool)

(assert (=> b!528376 (=> (not res!324371) (not e!307927))))

(declare-fun lt!243305 () SeekEntryResult!4562)

(assert (=> b!528376 (= res!324371 (or (= lt!243305 (MissingZero!4562 i!1204)) (= lt!243305 (MissingVacant!4562 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33493 (_ BitVec 32)) SeekEntryResult!4562)

(assert (=> b!528376 (= lt!243305 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!528377 () Bool)

(declare-fun res!324366 () Bool)

(assert (=> b!528377 (=> (not res!324366) (not e!307927))))

(declare-datatypes ((List!10253 0))(
  ( (Nil!10250) (Cons!10249 (h!11186 (_ BitVec 64)) (t!16481 List!10253)) )
))
(declare-fun arrayNoDuplicates!0 (array!33493 (_ BitVec 32) List!10253) Bool)

(assert (=> b!528377 (= res!324366 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10250))))

(declare-fun b!528378 () Bool)

(declare-fun Unit!16702 () Unit!16700)

(assert (=> b!528378 (= e!307924 Unit!16702)))

(declare-fun b!528379 () Bool)

(declare-fun Unit!16703 () Unit!16700)

(assert (=> b!528379 (= e!307924 Unit!16703)))

(declare-fun lt!243308 () Unit!16700)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33493 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16700)

(assert (=> b!528379 (= lt!243308 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!243300 #b00000000000000000000000000000000 (index!20474 lt!243310) (x!49450 lt!243310) mask!3524))))

(declare-fun res!324373 () Bool)

(declare-fun lt!243309 () array!33493)

(declare-fun lt!243306 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33493 (_ BitVec 32)) SeekEntryResult!4562)

(assert (=> b!528379 (= res!324373 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243300 lt!243306 lt!243309 mask!3524) (Intermediate!4562 false (index!20474 lt!243310) (x!49450 lt!243310))))))

(declare-fun e!307926 () Bool)

(assert (=> b!528379 (=> (not res!324373) (not e!307926))))

(assert (=> b!528379 e!307926))

(declare-fun b!528380 () Bool)

(assert (=> b!528380 (= e!307927 (not e!307931))))

(declare-fun res!324375 () Bool)

(assert (=> b!528380 (=> res!324375 e!307931)))

(declare-fun lt!243302 () SeekEntryResult!4562)

(assert (=> b!528380 (= res!324375 (or (= lt!243310 lt!243302) (undefined!5374 lt!243310) (not (is-Intermediate!4562 lt!243310))))))

(declare-fun lt!243303 () (_ BitVec 32))

(assert (=> b!528380 (= lt!243302 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243303 lt!243306 lt!243309 mask!3524))))

(assert (=> b!528380 (= lt!243310 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243300 (select (arr!16095 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!528380 (= lt!243303 (toIndex!0 lt!243306 mask!3524))))

(assert (=> b!528380 (= lt!243306 (select (store (arr!16095 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!528380 (= lt!243300 (toIndex!0 (select (arr!16095 a!3235) j!176) mask!3524))))

(assert (=> b!528380 (= lt!243309 (array!33494 (store (arr!16095 a!3235) i!1204 k!2280) (size!16459 a!3235)))))

(declare-fun e!307930 () Bool)

(assert (=> b!528380 e!307930))

(declare-fun res!324372 () Bool)

(assert (=> b!528380 (=> (not res!324372) (not e!307930))))

(assert (=> b!528380 (= res!324372 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!243301 () Unit!16700)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33493 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16700)

(assert (=> b!528380 (= lt!243301 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!528381 () Bool)

(assert (=> b!528381 (= e!307926 false)))

(declare-fun b!528382 () Bool)

(declare-fun res!324369 () Bool)

(assert (=> b!528382 (=> (not res!324369) (not e!307932))))

(declare-fun arrayContainsKey!0 (array!33493 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!528382 (= res!324369 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!528383 () Bool)

(assert (=> b!528383 (= e!307930 (= (seekEntryOrOpen!0 (select (arr!16095 a!3235) j!176) a!3235 mask!3524) (Found!4562 j!176)))))

(declare-fun b!528384 () Bool)

(declare-fun res!324376 () Bool)

(assert (=> b!528384 (=> (not res!324376) (not e!307932))))

(assert (=> b!528384 (= res!324376 (and (= (size!16459 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16459 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16459 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!528385 () Bool)

(assert (=> b!528385 (= e!307925 (= lt!243302 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243300 lt!243306 lt!243309 mask!3524)))))

(declare-fun b!528386 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33493 (_ BitVec 32)) SeekEntryResult!4562)

(assert (=> b!528386 (= e!307929 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!243300 (index!20474 lt!243310) (select (arr!16095 a!3235) j!176) a!3235 mask!3524) (Found!4562 j!176))))))

(assert (= (and start!48000 res!324367) b!528384))

(assert (= (and b!528384 res!324376) b!528371))

(assert (= (and b!528371 res!324370) b!528375))

(assert (= (and b!528375 res!324364) b!528382))

(assert (= (and b!528382 res!324369) b!528376))

(assert (= (and b!528376 res!324371) b!528374))

(assert (= (and b!528374 res!324365) b!528377))

(assert (= (and b!528377 res!324366) b!528380))

(assert (= (and b!528380 res!324372) b!528383))

(assert (= (and b!528380 (not res!324375)) b!528373))

(assert (= (and b!528373 c!62312) b!528379))

(assert (= (and b!528373 (not c!62312)) b!528378))

(assert (= (and b!528379 res!324373) b!528381))

(assert (= (and b!528373 (not res!324368)) b!528372))

(assert (= (and b!528372 res!324377) b!528386))

(assert (= (and b!528372 (not res!324374)) b!528385))

(declare-fun m!508917 () Bool)

(assert (=> b!528376 m!508917))

(declare-fun m!508919 () Bool)

(assert (=> b!528379 m!508919))

(declare-fun m!508921 () Bool)

(assert (=> b!528379 m!508921))

(declare-fun m!508923 () Bool)

(assert (=> b!528386 m!508923))

(assert (=> b!528386 m!508923))

(declare-fun m!508925 () Bool)

(assert (=> b!528386 m!508925))

(declare-fun m!508927 () Bool)

(assert (=> b!528373 m!508927))

(declare-fun m!508929 () Bool)

(assert (=> b!528373 m!508929))

(assert (=> b!528373 m!508923))

(assert (=> b!528371 m!508923))

(assert (=> b!528371 m!508923))

(declare-fun m!508931 () Bool)

(assert (=> b!528371 m!508931))

(declare-fun m!508933 () Bool)

(assert (=> b!528377 m!508933))

(assert (=> b!528385 m!508921))

(declare-fun m!508935 () Bool)

(assert (=> b!528374 m!508935))

(declare-fun m!508937 () Bool)

(assert (=> b!528375 m!508937))

(assert (=> b!528380 m!508923))

(declare-fun m!508939 () Bool)

(assert (=> b!528380 m!508939))

(declare-fun m!508941 () Bool)

(assert (=> b!528380 m!508941))

(declare-fun m!508943 () Bool)

(assert (=> b!528380 m!508943))

(declare-fun m!508945 () Bool)

(assert (=> b!528380 m!508945))

(declare-fun m!508947 () Bool)

(assert (=> b!528380 m!508947))

(assert (=> b!528380 m!508923))

(declare-fun m!508949 () Bool)

(assert (=> b!528380 m!508949))

(assert (=> b!528380 m!508923))

(declare-fun m!508951 () Bool)

(assert (=> b!528380 m!508951))

(declare-fun m!508953 () Bool)

(assert (=> b!528380 m!508953))

(assert (=> b!528383 m!508923))

(assert (=> b!528383 m!508923))

(declare-fun m!508955 () Bool)

(assert (=> b!528383 m!508955))

(declare-fun m!508957 () Bool)

(assert (=> b!528382 m!508957))

(declare-fun m!508959 () Bool)

(assert (=> start!48000 m!508959))

(declare-fun m!508961 () Bool)

(assert (=> start!48000 m!508961))

(push 1)

