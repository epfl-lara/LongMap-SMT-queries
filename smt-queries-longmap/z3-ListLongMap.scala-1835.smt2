; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33206 () Bool)

(assert start!33206)

(declare-fun b!330135 () Bool)

(declare-fun res!181963 () Bool)

(declare-fun e!202647 () Bool)

(assert (=> b!330135 (=> (not res!181963) (not e!202647))))

(declare-datatypes ((array!16869 0))(
  ( (array!16870 (arr!7977 (Array (_ BitVec 32) (_ BitVec 64))) (size!8330 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16869)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3107 0))(
  ( (MissingZero!3107 (index!14604 (_ BitVec 32))) (Found!3107 (index!14605 (_ BitVec 32))) (Intermediate!3107 (undefined!3919 Bool) (index!14606 (_ BitVec 32)) (x!32901 (_ BitVec 32))) (Undefined!3107) (MissingVacant!3107 (index!14607 (_ BitVec 32))) )
))
(declare-fun lt!158272 () SeekEntryResult!3107)

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16869 (_ BitVec 32)) SeekEntryResult!3107)

(assert (=> b!330135 (= res!181963 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!158272))))

(declare-fun b!330136 () Bool)

(declare-datatypes ((Unit!10251 0))(
  ( (Unit!10252) )
))
(declare-fun e!202646 () Unit!10251)

(declare-fun Unit!10253 () Unit!10251)

(assert (=> b!330136 (= e!202646 Unit!10253)))

(declare-fun b!330137 () Bool)

(declare-fun res!181956 () Bool)

(declare-fun e!202645 () Bool)

(assert (=> b!330137 (=> (not res!181956) (not e!202645))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!330137 (= res!181956 (and (= (size!8330 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8330 a!3305))))))

(declare-fun res!181960 () Bool)

(assert (=> start!33206 (=> (not res!181960) (not e!202645))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33206 (= res!181960 (validMask!0 mask!3777))))

(assert (=> start!33206 e!202645))

(declare-fun array_inv!5949 (array!16869) Bool)

(assert (=> start!33206 (array_inv!5949 a!3305)))

(assert (=> start!33206 true))

(declare-fun b!330138 () Bool)

(declare-fun res!181964 () Bool)

(assert (=> b!330138 (=> (not res!181964) (not e!202645))))

(declare-fun arrayContainsKey!0 (array!16869 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!330138 (= res!181964 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!330139 () Bool)

(declare-fun e!202648 () Unit!10251)

(declare-fun Unit!10254 () Unit!10251)

(assert (=> b!330139 (= e!202648 Unit!10254)))

(declare-fun b!330140 () Bool)

(declare-fun res!181959 () Bool)

(assert (=> b!330140 (=> (not res!181959) (not e!202645))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!330140 (= res!181959 (validKeyInArray!0 k0!2497))))

(declare-fun b!330141 () Bool)

(declare-fun res!181957 () Bool)

(assert (=> b!330141 (=> (not res!181957) (not e!202647))))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!330141 (= res!181957 (and (= (select (arr!7977 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8330 a!3305))))))

(declare-fun b!330142 () Bool)

(declare-fun Unit!10255 () Unit!10251)

(assert (=> b!330142 (= e!202646 Unit!10255)))

(assert (=> b!330142 false))

(declare-fun b!330143 () Bool)

(declare-fun res!181965 () Bool)

(assert (=> b!330143 (=> (not res!181965) (not e!202647))))

(assert (=> b!330143 (= res!181965 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7977 a!3305) index!1840) k0!2497)) (= x!1490 resX!58)))))

(declare-fun b!330144 () Bool)

(assert (=> b!330144 false))

(declare-fun e!202649 () Unit!10251)

(declare-fun Unit!10256 () Unit!10251)

(assert (=> b!330144 (= e!202649 Unit!10256)))

(declare-fun b!330145 () Bool)

(declare-fun res!181961 () Bool)

(assert (=> b!330145 (=> (not res!181961) (not e!202645))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16869 (_ BitVec 32)) Bool)

(assert (=> b!330145 (= res!181961 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!330146 () Bool)

(assert (=> b!330146 (= e!202647 (not true))))

(assert (=> b!330146 (= index!1840 resIndex!58)))

(declare-fun lt!158271 () Unit!10251)

(assert (=> b!330146 (= lt!158271 e!202648)))

(declare-fun c!51732 () Bool)

(assert (=> b!330146 (= c!51732 (not (= resIndex!58 index!1840)))))

(declare-fun b!330147 () Bool)

(declare-fun res!181962 () Bool)

(assert (=> b!330147 (=> (not res!181962) (not e!202645))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16869 (_ BitVec 32)) SeekEntryResult!3107)

(assert (=> b!330147 (= res!181962 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3107 i!1250)))))

(declare-fun b!330148 () Bool)

(assert (=> b!330148 (= e!202648 e!202649)))

(declare-fun c!51733 () Bool)

(assert (=> b!330148 (= c!51733 (or (= (select (arr!7977 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7977 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!330149 () Bool)

(assert (=> b!330149 (= e!202645 e!202647)))

(declare-fun res!181958 () Bool)

(assert (=> b!330149 (=> (not res!181958) (not e!202647))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!330149 (= res!181958 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!158272))))

(assert (=> b!330149 (= lt!158272 (Intermediate!3107 false resIndex!58 resX!58))))

(declare-fun b!330150 () Bool)

(assert (=> b!330150 false))

(declare-fun lt!158273 () Unit!10251)

(assert (=> b!330150 (= lt!158273 e!202646)))

(declare-fun c!51734 () Bool)

(get-info :version)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!330150 (= c!51734 ((_ is Intermediate!3107) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k0!2497 a!3305 mask!3777)))))

(declare-fun Unit!10257 () Unit!10251)

(assert (=> b!330150 (= e!202649 Unit!10257)))

(assert (= (and start!33206 res!181960) b!330137))

(assert (= (and b!330137 res!181956) b!330140))

(assert (= (and b!330140 res!181959) b!330138))

(assert (= (and b!330138 res!181964) b!330147))

(assert (= (and b!330147 res!181962) b!330145))

(assert (= (and b!330145 res!181961) b!330149))

(assert (= (and b!330149 res!181958) b!330141))

(assert (= (and b!330141 res!181957) b!330135))

(assert (= (and b!330135 res!181963) b!330143))

(assert (= (and b!330143 res!181965) b!330146))

(assert (= (and b!330146 c!51732) b!330148))

(assert (= (and b!330146 (not c!51732)) b!330139))

(assert (= (and b!330148 c!51733) b!330144))

(assert (= (and b!330148 (not c!51733)) b!330150))

(assert (= (and b!330150 c!51734) b!330136))

(assert (= (and b!330150 (not c!51734)) b!330142))

(declare-fun m!334927 () Bool)

(assert (=> start!33206 m!334927))

(declare-fun m!334929 () Bool)

(assert (=> start!33206 m!334929))

(declare-fun m!334931 () Bool)

(assert (=> b!330141 m!334931))

(declare-fun m!334933 () Bool)

(assert (=> b!330140 m!334933))

(declare-fun m!334935 () Bool)

(assert (=> b!330143 m!334935))

(declare-fun m!334937 () Bool)

(assert (=> b!330147 m!334937))

(declare-fun m!334939 () Bool)

(assert (=> b!330135 m!334939))

(declare-fun m!334941 () Bool)

(assert (=> b!330138 m!334941))

(declare-fun m!334943 () Bool)

(assert (=> b!330150 m!334943))

(assert (=> b!330150 m!334943))

(declare-fun m!334945 () Bool)

(assert (=> b!330150 m!334945))

(assert (=> b!330148 m!334935))

(declare-fun m!334947 () Bool)

(assert (=> b!330145 m!334947))

(declare-fun m!334949 () Bool)

(assert (=> b!330149 m!334949))

(assert (=> b!330149 m!334949))

(declare-fun m!334951 () Bool)

(assert (=> b!330149 m!334951))

(check-sat (not b!330149) (not b!330140) (not b!330138) (not start!33206) (not b!330150) (not b!330145) (not b!330147) (not b!330135))
(check-sat)
