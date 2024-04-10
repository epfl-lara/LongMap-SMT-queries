; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33210 () Bool)

(assert start!33210)

(declare-fun b!330170 () Bool)

(declare-datatypes ((Unit!10246 0))(
  ( (Unit!10247) )
))
(declare-fun e!202735 () Unit!10246)

(declare-fun e!202731 () Unit!10246)

(assert (=> b!330170 (= e!202735 e!202731)))

(declare-fun c!51760 () Bool)

(declare-datatypes ((array!16869 0))(
  ( (array!16870 (arr!7977 (Array (_ BitVec 32) (_ BitVec 64))) (size!8329 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16869)

(declare-fun index!1840 () (_ BitVec 32))

(assert (=> b!330170 (= c!51760 (or (= (select (arr!7977 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7977 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!330171 () Bool)

(declare-fun e!202732 () Unit!10246)

(declare-fun Unit!10248 () Unit!10246)

(assert (=> b!330171 (= e!202732 Unit!10248)))

(declare-fun b!330172 () Bool)

(declare-fun e!202730 () Bool)

(assert (=> b!330172 (= e!202730 (not true))))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!330172 (= index!1840 resIndex!58)))

(declare-fun lt!158463 () Unit!10246)

(assert (=> b!330172 (= lt!158463 e!202735)))

(declare-fun c!51761 () Bool)

(assert (=> b!330172 (= c!51761 (not (= resIndex!58 index!1840)))))

(declare-fun b!330173 () Bool)

(declare-fun res!181935 () Bool)

(declare-fun e!202734 () Bool)

(assert (=> b!330173 (=> (not res!181935) (not e!202734))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16869 (_ BitVec 32)) Bool)

(assert (=> b!330173 (= res!181935 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!330174 () Bool)

(assert (=> b!330174 false))

(declare-fun Unit!10249 () Unit!10246)

(assert (=> b!330174 (= e!202731 Unit!10249)))

(declare-fun b!330175 () Bool)

(declare-fun res!181936 () Bool)

(assert (=> b!330175 (=> (not res!181936) (not e!202734))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!330175 (= res!181936 (validKeyInArray!0 k0!2497))))

(declare-fun b!330176 () Bool)

(declare-fun res!181941 () Bool)

(assert (=> b!330176 (=> (not res!181941) (not e!202734))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3108 0))(
  ( (MissingZero!3108 (index!14608 (_ BitVec 32))) (Found!3108 (index!14609 (_ BitVec 32))) (Intermediate!3108 (undefined!3920 Bool) (index!14610 (_ BitVec 32)) (x!32891 (_ BitVec 32))) (Undefined!3108) (MissingVacant!3108 (index!14611 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16869 (_ BitVec 32)) SeekEntryResult!3108)

(assert (=> b!330176 (= res!181941 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3108 i!1250)))))

(declare-fun b!330177 () Bool)

(assert (=> b!330177 (= e!202734 e!202730)))

(declare-fun res!181943 () Bool)

(assert (=> b!330177 (=> (not res!181943) (not e!202730))))

(declare-fun lt!158462 () SeekEntryResult!3108)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16869 (_ BitVec 32)) SeekEntryResult!3108)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!330177 (= res!181943 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!158462))))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!330177 (= lt!158462 (Intermediate!3108 false resIndex!58 resX!58))))

(declare-fun b!330178 () Bool)

(declare-fun res!181940 () Bool)

(assert (=> b!330178 (=> (not res!181940) (not e!202734))))

(assert (=> b!330178 (= res!181940 (and (= (size!8329 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8329 a!3305))))))

(declare-fun res!181944 () Bool)

(assert (=> start!33210 (=> (not res!181944) (not e!202734))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33210 (= res!181944 (validMask!0 mask!3777))))

(assert (=> start!33210 e!202734))

(declare-fun array_inv!5940 (array!16869) Bool)

(assert (=> start!33210 (array_inv!5940 a!3305)))

(assert (=> start!33210 true))

(declare-fun b!330179 () Bool)

(declare-fun res!181937 () Bool)

(assert (=> b!330179 (=> (not res!181937) (not e!202730))))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!330179 (= res!181937 (and (= (select (arr!7977 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8329 a!3305))))))

(declare-fun b!330180 () Bool)

(declare-fun res!181939 () Bool)

(assert (=> b!330180 (=> (not res!181939) (not e!202734))))

(declare-fun arrayContainsKey!0 (array!16869 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!330180 (= res!181939 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!330181 () Bool)

(declare-fun Unit!10250 () Unit!10246)

(assert (=> b!330181 (= e!202732 Unit!10250)))

(assert (=> b!330181 false))

(declare-fun b!330182 () Bool)

(declare-fun Unit!10251 () Unit!10246)

(assert (=> b!330182 (= e!202735 Unit!10251)))

(declare-fun b!330183 () Bool)

(declare-fun res!181938 () Bool)

(assert (=> b!330183 (=> (not res!181938) (not e!202730))))

(assert (=> b!330183 (= res!181938 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!158462))))

(declare-fun b!330184 () Bool)

(assert (=> b!330184 false))

(declare-fun lt!158461 () Unit!10246)

(assert (=> b!330184 (= lt!158461 e!202732)))

(declare-fun c!51762 () Bool)

(get-info :version)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!330184 (= c!51762 ((_ is Intermediate!3108) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k0!2497 a!3305 mask!3777)))))

(declare-fun Unit!10252 () Unit!10246)

(assert (=> b!330184 (= e!202731 Unit!10252)))

(declare-fun b!330185 () Bool)

(declare-fun res!181942 () Bool)

(assert (=> b!330185 (=> (not res!181942) (not e!202730))))

(assert (=> b!330185 (= res!181942 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7977 a!3305) index!1840) k0!2497)) (= x!1490 resX!58)))))

(assert (= (and start!33210 res!181944) b!330178))

(assert (= (and b!330178 res!181940) b!330175))

(assert (= (and b!330175 res!181936) b!330180))

(assert (= (and b!330180 res!181939) b!330176))

(assert (= (and b!330176 res!181941) b!330173))

(assert (= (and b!330173 res!181935) b!330177))

(assert (= (and b!330177 res!181943) b!330179))

(assert (= (and b!330179 res!181937) b!330183))

(assert (= (and b!330183 res!181938) b!330185))

(assert (= (and b!330185 res!181942) b!330172))

(assert (= (and b!330172 c!51761) b!330170))

(assert (= (and b!330172 (not c!51761)) b!330182))

(assert (= (and b!330170 c!51760) b!330174))

(assert (= (and b!330170 (not c!51760)) b!330184))

(assert (= (and b!330184 c!51762) b!330171))

(assert (= (and b!330184 (not c!51762)) b!330181))

(declare-fun m!335527 () Bool)

(assert (=> b!330183 m!335527))

(declare-fun m!335529 () Bool)

(assert (=> b!330177 m!335529))

(assert (=> b!330177 m!335529))

(declare-fun m!335531 () Bool)

(assert (=> b!330177 m!335531))

(declare-fun m!335533 () Bool)

(assert (=> b!330170 m!335533))

(declare-fun m!335535 () Bool)

(assert (=> b!330175 m!335535))

(declare-fun m!335537 () Bool)

(assert (=> b!330184 m!335537))

(assert (=> b!330184 m!335537))

(declare-fun m!335539 () Bool)

(assert (=> b!330184 m!335539))

(declare-fun m!335541 () Bool)

(assert (=> b!330179 m!335541))

(assert (=> b!330185 m!335533))

(declare-fun m!335543 () Bool)

(assert (=> start!33210 m!335543))

(declare-fun m!335545 () Bool)

(assert (=> start!33210 m!335545))

(declare-fun m!335547 () Bool)

(assert (=> b!330173 m!335547))

(declare-fun m!335549 () Bool)

(assert (=> b!330176 m!335549))

(declare-fun m!335551 () Bool)

(assert (=> b!330180 m!335551))

(check-sat (not b!330175) (not b!330177) (not b!330173) (not b!330176) (not b!330183) (not b!330184) (not start!33210) (not b!330180))
(check-sat)
