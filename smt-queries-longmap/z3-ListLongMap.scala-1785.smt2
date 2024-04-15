; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32396 () Bool)

(assert start!32396)

(declare-fun b!323169 () Bool)

(declare-fun res!176854 () Bool)

(declare-fun e!199762 () Bool)

(assert (=> b!323169 (=> (not res!176854) (not e!199762))))

(declare-datatypes ((array!16539 0))(
  ( (array!16540 (arr!7827 (Array (_ BitVec 32) (_ BitVec 64))) (size!8180 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16539)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!323169 (= res!176854 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7827 a!3305) index!1840) k0!2497)) (= x!1490 resX!58)))))

(declare-fun b!323170 () Bool)

(declare-fun e!199760 () Bool)

(assert (=> b!323170 (= e!199760 e!199762)))

(declare-fun res!176859 () Bool)

(assert (=> b!323170 (=> (not res!176859) (not e!199762))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2957 0))(
  ( (MissingZero!2957 (index!14004 (_ BitVec 32))) (Found!2957 (index!14005 (_ BitVec 32))) (Intermediate!2957 (undefined!3769 Bool) (index!14006 (_ BitVec 32)) (x!32276 (_ BitVec 32))) (Undefined!2957) (MissingVacant!2957 (index!14007 (_ BitVec 32))) )
))
(declare-fun lt!156404 () SeekEntryResult!2957)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16539 (_ BitVec 32)) SeekEntryResult!2957)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!323170 (= res!176859 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156404))))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!323170 (= lt!156404 (Intermediate!2957 false resIndex!58 resX!58))))

(declare-fun b!323171 () Bool)

(declare-fun res!176856 () Bool)

(assert (=> b!323171 (=> (not res!176856) (not e!199762))))

(assert (=> b!323171 (= res!176856 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156404))))

(declare-fun b!323172 () Bool)

(declare-fun res!176850 () Bool)

(assert (=> b!323172 (=> (not res!176850) (not e!199760))))

(declare-fun arrayContainsKey!0 (array!16539 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!323172 (= res!176850 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!323173 () Bool)

(declare-fun res!176855 () Bool)

(assert (=> b!323173 (=> (not res!176855) (not e!199760))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16539 (_ BitVec 32)) Bool)

(assert (=> b!323173 (= res!176855 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!323174 () Bool)

(declare-datatypes ((Unit!9968 0))(
  ( (Unit!9969) )
))
(declare-fun e!199758 () Unit!9968)

(declare-fun Unit!9970 () Unit!9968)

(assert (=> b!323174 (= e!199758 Unit!9970)))

(declare-fun b!323176 () Bool)

(declare-fun Unit!9971 () Unit!9968)

(assert (=> b!323176 (= e!199758 Unit!9971)))

(assert (=> b!323176 false))

(declare-fun b!323177 () Bool)

(declare-fun e!199759 () Unit!9968)

(declare-fun Unit!9972 () Unit!9968)

(assert (=> b!323177 (= e!199759 Unit!9972)))

(declare-fun b!323178 () Bool)

(declare-fun e!199761 () Unit!9968)

(assert (=> b!323178 (= e!199759 e!199761)))

(declare-fun c!50789 () Bool)

(assert (=> b!323178 (= c!50789 (or (= (select (arr!7827 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7827 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!323179 () Bool)

(declare-fun res!176851 () Bool)

(assert (=> b!323179 (=> (not res!176851) (not e!199760))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16539 (_ BitVec 32)) SeekEntryResult!2957)

(assert (=> b!323179 (= res!176851 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2957 i!1250)))))

(declare-fun b!323180 () Bool)

(declare-fun res!176857 () Bool)

(assert (=> b!323180 (=> (not res!176857) (not e!199760))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!323180 (= res!176857 (validKeyInArray!0 k0!2497))))

(declare-fun b!323181 () Bool)

(assert (=> b!323181 (= e!199762 (not true))))

(assert (=> b!323181 (= index!1840 resIndex!58)))

(declare-fun lt!156402 () Unit!9968)

(assert (=> b!323181 (= lt!156402 e!199759)))

(declare-fun c!50788 () Bool)

(assert (=> b!323181 (= c!50788 (not (= resIndex!58 index!1840)))))

(declare-fun b!323182 () Bool)

(declare-fun res!176853 () Bool)

(assert (=> b!323182 (=> (not res!176853) (not e!199762))))

(assert (=> b!323182 (= res!176853 (and (= (select (arr!7827 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8180 a!3305))))))

(declare-fun b!323183 () Bool)

(assert (=> b!323183 false))

(declare-fun Unit!9973 () Unit!9968)

(assert (=> b!323183 (= e!199761 Unit!9973)))

(declare-fun b!323184 () Bool)

(assert (=> b!323184 false))

(declare-fun lt!156403 () Unit!9968)

(assert (=> b!323184 (= lt!156403 e!199758)))

(declare-fun c!50787 () Bool)

(get-info :version)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!323184 (= c!50787 ((_ is Intermediate!2957) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k0!2497 a!3305 mask!3777)))))

(declare-fun Unit!9974 () Unit!9968)

(assert (=> b!323184 (= e!199761 Unit!9974)))

(declare-fun b!323175 () Bool)

(declare-fun res!176852 () Bool)

(assert (=> b!323175 (=> (not res!176852) (not e!199760))))

(assert (=> b!323175 (= res!176852 (and (= (size!8180 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8180 a!3305))))))

(declare-fun res!176858 () Bool)

(assert (=> start!32396 (=> (not res!176858) (not e!199760))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32396 (= res!176858 (validMask!0 mask!3777))))

(assert (=> start!32396 e!199760))

(declare-fun array_inv!5799 (array!16539) Bool)

(assert (=> start!32396 (array_inv!5799 a!3305)))

(assert (=> start!32396 true))

(assert (= (and start!32396 res!176858) b!323175))

(assert (= (and b!323175 res!176852) b!323180))

(assert (= (and b!323180 res!176857) b!323172))

(assert (= (and b!323172 res!176850) b!323179))

(assert (= (and b!323179 res!176851) b!323173))

(assert (= (and b!323173 res!176855) b!323170))

(assert (= (and b!323170 res!176859) b!323182))

(assert (= (and b!323182 res!176853) b!323171))

(assert (= (and b!323171 res!176856) b!323169))

(assert (= (and b!323169 res!176854) b!323181))

(assert (= (and b!323181 c!50788) b!323178))

(assert (= (and b!323181 (not c!50788)) b!323177))

(assert (= (and b!323178 c!50789) b!323183))

(assert (= (and b!323178 (not c!50789)) b!323184))

(assert (= (and b!323184 c!50787) b!323174))

(assert (= (and b!323184 (not c!50787)) b!323176))

(declare-fun m!330091 () Bool)

(assert (=> b!323171 m!330091))

(declare-fun m!330093 () Bool)

(assert (=> b!323170 m!330093))

(assert (=> b!323170 m!330093))

(declare-fun m!330095 () Bool)

(assert (=> b!323170 m!330095))

(declare-fun m!330097 () Bool)

(assert (=> b!323172 m!330097))

(declare-fun m!330099 () Bool)

(assert (=> b!323179 m!330099))

(declare-fun m!330101 () Bool)

(assert (=> start!32396 m!330101))

(declare-fun m!330103 () Bool)

(assert (=> start!32396 m!330103))

(declare-fun m!330105 () Bool)

(assert (=> b!323184 m!330105))

(assert (=> b!323184 m!330105))

(declare-fun m!330107 () Bool)

(assert (=> b!323184 m!330107))

(declare-fun m!330109 () Bool)

(assert (=> b!323180 m!330109))

(declare-fun m!330111 () Bool)

(assert (=> b!323178 m!330111))

(assert (=> b!323169 m!330111))

(declare-fun m!330113 () Bool)

(assert (=> b!323173 m!330113))

(declare-fun m!330115 () Bool)

(assert (=> b!323182 m!330115))

(check-sat (not start!32396) (not b!323180) (not b!323172) (not b!323171) (not b!323173) (not b!323170) (not b!323184) (not b!323179))
(check-sat)
