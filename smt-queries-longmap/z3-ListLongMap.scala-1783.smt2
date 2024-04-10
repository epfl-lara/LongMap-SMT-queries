; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32400 () Bool)

(assert start!32400)

(declare-fun b!323204 () Bool)

(assert (=> b!323204 false))

(declare-datatypes ((Unit!9969 0))(
  ( (Unit!9970) )
))
(declare-fun lt!156594 () Unit!9969)

(declare-fun e!199844 () Unit!9969)

(assert (=> b!323204 (= lt!156594 e!199844)))

(declare-datatypes ((array!16539 0))(
  ( (array!16540 (arr!7827 (Array (_ BitVec 32) (_ BitVec 64))) (size!8179 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16539)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun c!50817 () Bool)

(get-info :version)

(declare-datatypes ((SeekEntryResult!2958 0))(
  ( (MissingZero!2958 (index!14008 (_ BitVec 32))) (Found!2958 (index!14009 (_ BitVec 32))) (Intermediate!2958 (undefined!3770 Bool) (index!14010 (_ BitVec 32)) (x!32266 (_ BitVec 32))) (Undefined!2958) (MissingVacant!2958 (index!14011 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16539 (_ BitVec 32)) SeekEntryResult!2958)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!323204 (= c!50817 ((_ is Intermediate!2958) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k0!2497 a!3305 mask!3777)))))

(declare-fun e!199849 () Unit!9969)

(declare-fun Unit!9971 () Unit!9969)

(assert (=> b!323204 (= e!199849 Unit!9971)))

(declare-fun b!323205 () Bool)

(declare-fun Unit!9972 () Unit!9969)

(assert (=> b!323205 (= e!199844 Unit!9972)))

(declare-fun b!323206 () Bool)

(declare-fun res!176830 () Bool)

(declare-fun e!199845 () Bool)

(assert (=> b!323206 (=> (not res!176830) (not e!199845))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!323206 (= res!176830 (and (= (size!8179 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8179 a!3305))))))

(declare-fun res!176838 () Bool)

(assert (=> start!32400 (=> (not res!176838) (not e!199845))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32400 (= res!176838 (validMask!0 mask!3777))))

(assert (=> start!32400 e!199845))

(declare-fun array_inv!5790 (array!16539) Bool)

(assert (=> start!32400 (array_inv!5790 a!3305)))

(assert (=> start!32400 true))

(declare-fun b!323207 () Bool)

(declare-fun res!176837 () Bool)

(assert (=> b!323207 (=> (not res!176837) (not e!199845))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16539 (_ BitVec 32)) Bool)

(assert (=> b!323207 (= res!176837 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!323208 () Bool)

(declare-fun e!199848 () Bool)

(assert (=> b!323208 (= e!199845 e!199848)))

(declare-fun res!176831 () Bool)

(assert (=> b!323208 (=> (not res!176831) (not e!199848))))

(declare-fun lt!156593 () SeekEntryResult!2958)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!323208 (= res!176831 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156593))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!323208 (= lt!156593 (Intermediate!2958 false resIndex!58 resX!58))))

(declare-fun b!323209 () Bool)

(assert (=> b!323209 (= e!199848 (not true))))

(assert (=> b!323209 (= index!1840 resIndex!58)))

(declare-fun lt!156592 () Unit!9969)

(declare-fun e!199846 () Unit!9969)

(assert (=> b!323209 (= lt!156592 e!199846)))

(declare-fun c!50815 () Bool)

(assert (=> b!323209 (= c!50815 (not (= resIndex!58 index!1840)))))

(declare-fun b!323210 () Bool)

(declare-fun res!176836 () Bool)

(assert (=> b!323210 (=> (not res!176836) (not e!199848))))

(assert (=> b!323210 (= res!176836 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156593))))

(declare-fun b!323211 () Bool)

(declare-fun Unit!9973 () Unit!9969)

(assert (=> b!323211 (= e!199844 Unit!9973)))

(assert (=> b!323211 false))

(declare-fun b!323212 () Bool)

(declare-fun res!176832 () Bool)

(assert (=> b!323212 (=> (not res!176832) (not e!199845))))

(declare-fun arrayContainsKey!0 (array!16539 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!323212 (= res!176832 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!323213 () Bool)

(declare-fun res!176829 () Bool)

(assert (=> b!323213 (=> (not res!176829) (not e!199848))))

(assert (=> b!323213 (= res!176829 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7827 a!3305) index!1840) k0!2497)) (= x!1490 resX!58)))))

(declare-fun b!323214 () Bool)

(declare-fun res!176835 () Bool)

(assert (=> b!323214 (=> (not res!176835) (not e!199848))))

(assert (=> b!323214 (= res!176835 (and (= (select (arr!7827 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8179 a!3305))))))

(declare-fun b!323215 () Bool)

(declare-fun res!176834 () Bool)

(assert (=> b!323215 (=> (not res!176834) (not e!199845))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16539 (_ BitVec 32)) SeekEntryResult!2958)

(assert (=> b!323215 (= res!176834 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2958 i!1250)))))

(declare-fun b!323216 () Bool)

(assert (=> b!323216 (= e!199846 e!199849)))

(declare-fun c!50816 () Bool)

(assert (=> b!323216 (= c!50816 (or (= (select (arr!7827 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7827 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!323217 () Bool)

(declare-fun Unit!9974 () Unit!9969)

(assert (=> b!323217 (= e!199846 Unit!9974)))

(declare-fun b!323218 () Bool)

(declare-fun res!176833 () Bool)

(assert (=> b!323218 (=> (not res!176833) (not e!199845))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!323218 (= res!176833 (validKeyInArray!0 k0!2497))))

(declare-fun b!323219 () Bool)

(assert (=> b!323219 false))

(declare-fun Unit!9975 () Unit!9969)

(assert (=> b!323219 (= e!199849 Unit!9975)))

(assert (= (and start!32400 res!176838) b!323206))

(assert (= (and b!323206 res!176830) b!323218))

(assert (= (and b!323218 res!176833) b!323212))

(assert (= (and b!323212 res!176832) b!323215))

(assert (= (and b!323215 res!176834) b!323207))

(assert (= (and b!323207 res!176837) b!323208))

(assert (= (and b!323208 res!176831) b!323214))

(assert (= (and b!323214 res!176835) b!323210))

(assert (= (and b!323210 res!176836) b!323213))

(assert (= (and b!323213 res!176829) b!323209))

(assert (= (and b!323209 c!50815) b!323216))

(assert (= (and b!323209 (not c!50815)) b!323217))

(assert (= (and b!323216 c!50816) b!323219))

(assert (= (and b!323216 (not c!50816)) b!323204))

(assert (= (and b!323204 c!50817) b!323205))

(assert (= (and b!323204 (not c!50817)) b!323211))

(declare-fun m!330691 () Bool)

(assert (=> start!32400 m!330691))

(declare-fun m!330693 () Bool)

(assert (=> start!32400 m!330693))

(declare-fun m!330695 () Bool)

(assert (=> b!323213 m!330695))

(declare-fun m!330697 () Bool)

(assert (=> b!323214 m!330697))

(assert (=> b!323216 m!330695))

(declare-fun m!330699 () Bool)

(assert (=> b!323208 m!330699))

(assert (=> b!323208 m!330699))

(declare-fun m!330701 () Bool)

(assert (=> b!323208 m!330701))

(declare-fun m!330703 () Bool)

(assert (=> b!323210 m!330703))

(declare-fun m!330705 () Bool)

(assert (=> b!323207 m!330705))

(declare-fun m!330707 () Bool)

(assert (=> b!323215 m!330707))

(declare-fun m!330709 () Bool)

(assert (=> b!323204 m!330709))

(assert (=> b!323204 m!330709))

(declare-fun m!330711 () Bool)

(assert (=> b!323204 m!330711))

(declare-fun m!330713 () Bool)

(assert (=> b!323212 m!330713))

(declare-fun m!330715 () Bool)

(assert (=> b!323218 m!330715))

(check-sat (not b!323208) (not b!323215) (not b!323204) (not start!32400) (not b!323210) (not b!323207) (not b!323218) (not b!323212))
