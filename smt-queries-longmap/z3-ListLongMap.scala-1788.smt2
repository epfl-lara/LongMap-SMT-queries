; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32430 () Bool)

(assert start!32430)

(declare-fun b!323924 () Bool)

(declare-fun res!177287 () Bool)

(declare-fun e!200119 () Bool)

(assert (=> b!323924 (=> (not res!177287) (not e!200119))))

(declare-datatypes ((array!16569 0))(
  ( (array!16570 (arr!7842 (Array (_ BitVec 32) (_ BitVec 64))) (size!8194 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16569)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2973 0))(
  ( (MissingZero!2973 (index!14068 (_ BitVec 32))) (Found!2973 (index!14069 (_ BitVec 32))) (Intermediate!2973 (undefined!3785 Bool) (index!14070 (_ BitVec 32)) (x!32321 (_ BitVec 32))) (Undefined!2973) (MissingVacant!2973 (index!14071 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16569 (_ BitVec 32)) SeekEntryResult!2973)

(assert (=> b!323924 (= res!177287 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2973 i!1250)))))

(declare-fun b!323925 () Bool)

(declare-fun res!177282 () Bool)

(assert (=> b!323925 (=> (not res!177282) (not e!200119))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!323925 (= res!177282 (validKeyInArray!0 k0!2497))))

(declare-fun b!323926 () Bool)

(declare-fun res!177285 () Bool)

(assert (=> b!323926 (=> (not res!177285) (not e!200119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16569 (_ BitVec 32)) Bool)

(assert (=> b!323926 (= res!177285 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!323927 () Bool)

(declare-fun res!177284 () Bool)

(declare-fun e!200114 () Bool)

(assert (=> b!323927 (=> (not res!177284) (not e!200114))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!323927 (= res!177284 (and (= (select (arr!7842 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8194 a!3305))))))

(declare-fun b!323928 () Bool)

(declare-datatypes ((Unit!10074 0))(
  ( (Unit!10075) )
))
(declare-fun e!200117 () Unit!10074)

(declare-fun e!200118 () Unit!10074)

(assert (=> b!323928 (= e!200117 e!200118)))

(declare-fun c!50950 () Bool)

(assert (=> b!323928 (= c!50950 (or (= (select (arr!7842 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7842 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!323930 () Bool)

(declare-fun Unit!10076 () Unit!10074)

(assert (=> b!323930 (= e!200117 Unit!10076)))

(declare-fun b!323931 () Bool)

(declare-fun e!200115 () Unit!10074)

(declare-fun Unit!10077 () Unit!10074)

(assert (=> b!323931 (= e!200115 Unit!10077)))

(assert (=> b!323931 false))

(declare-fun b!323932 () Bool)

(assert (=> b!323932 false))

(declare-fun Unit!10078 () Unit!10074)

(assert (=> b!323932 (= e!200118 Unit!10078)))

(declare-fun b!323933 () Bool)

(assert (=> b!323933 false))

(declare-fun lt!156729 () Unit!10074)

(assert (=> b!323933 (= lt!156729 e!200115)))

(declare-fun c!50951 () Bool)

(get-info :version)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16569 (_ BitVec 32)) SeekEntryResult!2973)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!323933 (= c!50951 ((_ is Intermediate!2973) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k0!2497 a!3305 mask!3777)))))

(declare-fun Unit!10079 () Unit!10074)

(assert (=> b!323933 (= e!200118 Unit!10079)))

(declare-fun res!177280 () Bool)

(assert (=> start!32430 (=> (not res!177280) (not e!200119))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32430 (= res!177280 (validMask!0 mask!3777))))

(assert (=> start!32430 e!200119))

(declare-fun array_inv!5805 (array!16569) Bool)

(assert (=> start!32430 (array_inv!5805 a!3305)))

(assert (=> start!32430 true))

(declare-fun b!323929 () Bool)

(declare-fun res!177288 () Bool)

(assert (=> b!323929 (=> (not res!177288) (not e!200114))))

(assert (=> b!323929 (= res!177288 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7842 a!3305) index!1840) k0!2497)) (= x!1490 resX!58)))))

(declare-fun b!323934 () Bool)

(declare-fun Unit!10080 () Unit!10074)

(assert (=> b!323934 (= e!200115 Unit!10080)))

(declare-fun b!323935 () Bool)

(declare-fun res!177286 () Bool)

(assert (=> b!323935 (=> (not res!177286) (not e!200114))))

(declare-fun lt!156727 () SeekEntryResult!2973)

(assert (=> b!323935 (= res!177286 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156727))))

(declare-fun b!323936 () Bool)

(declare-fun res!177279 () Bool)

(assert (=> b!323936 (=> (not res!177279) (not e!200119))))

(assert (=> b!323936 (= res!177279 (and (= (size!8194 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8194 a!3305))))))

(declare-fun b!323937 () Bool)

(assert (=> b!323937 (= e!200114 (not true))))

(assert (=> b!323937 (= index!1840 resIndex!58)))

(declare-fun lt!156728 () Unit!10074)

(assert (=> b!323937 (= lt!156728 e!200117)))

(declare-fun c!50952 () Bool)

(assert (=> b!323937 (= c!50952 (not (= resIndex!58 index!1840)))))

(declare-fun b!323938 () Bool)

(assert (=> b!323938 (= e!200119 e!200114)))

(declare-fun res!177281 () Bool)

(assert (=> b!323938 (=> (not res!177281) (not e!200114))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!323938 (= res!177281 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156727))))

(assert (=> b!323938 (= lt!156727 (Intermediate!2973 false resIndex!58 resX!58))))

(declare-fun b!323939 () Bool)

(declare-fun res!177283 () Bool)

(assert (=> b!323939 (=> (not res!177283) (not e!200119))))

(declare-fun arrayContainsKey!0 (array!16569 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!323939 (= res!177283 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(assert (= (and start!32430 res!177280) b!323936))

(assert (= (and b!323936 res!177279) b!323925))

(assert (= (and b!323925 res!177282) b!323939))

(assert (= (and b!323939 res!177283) b!323924))

(assert (= (and b!323924 res!177287) b!323926))

(assert (= (and b!323926 res!177285) b!323938))

(assert (= (and b!323938 res!177281) b!323927))

(assert (= (and b!323927 res!177284) b!323935))

(assert (= (and b!323935 res!177286) b!323929))

(assert (= (and b!323929 res!177288) b!323937))

(assert (= (and b!323937 c!50952) b!323928))

(assert (= (and b!323937 (not c!50952)) b!323930))

(assert (= (and b!323928 c!50950) b!323932))

(assert (= (and b!323928 (not c!50950)) b!323933))

(assert (= (and b!323933 c!50951) b!323934))

(assert (= (and b!323933 (not c!50951)) b!323931))

(declare-fun m!331081 () Bool)

(assert (=> b!323926 m!331081))

(declare-fun m!331083 () Bool)

(assert (=> b!323939 m!331083))

(declare-fun m!331085 () Bool)

(assert (=> b!323927 m!331085))

(declare-fun m!331087 () Bool)

(assert (=> b!323925 m!331087))

(declare-fun m!331089 () Bool)

(assert (=> b!323935 m!331089))

(declare-fun m!331091 () Bool)

(assert (=> start!32430 m!331091))

(declare-fun m!331093 () Bool)

(assert (=> start!32430 m!331093))

(declare-fun m!331095 () Bool)

(assert (=> b!323924 m!331095))

(declare-fun m!331097 () Bool)

(assert (=> b!323929 m!331097))

(declare-fun m!331099 () Bool)

(assert (=> b!323938 m!331099))

(assert (=> b!323938 m!331099))

(declare-fun m!331101 () Bool)

(assert (=> b!323938 m!331101))

(assert (=> b!323928 m!331097))

(declare-fun m!331103 () Bool)

(assert (=> b!323933 m!331103))

(assert (=> b!323933 m!331103))

(declare-fun m!331105 () Bool)

(assert (=> b!323933 m!331105))

(check-sat (not b!323935) (not b!323939) (not b!323926) (not b!323938) (not b!323924) (not b!323933) (not b!323925) (not start!32430))
(check-sat)
