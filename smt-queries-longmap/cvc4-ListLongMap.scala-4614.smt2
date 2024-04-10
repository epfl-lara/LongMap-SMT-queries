; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64322 () Bool)

(assert start!64322)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!40903 0))(
  ( (array!40904 (arr!19574 (Array (_ BitVec 32) (_ BitVec 64))) (size!19995 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40903)

(declare-fun e!405049 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!722771 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7174 0))(
  ( (MissingZero!7174 (index!31064 (_ BitVec 32))) (Found!7174 (index!31065 (_ BitVec 32))) (Intermediate!7174 (undefined!7986 Bool) (index!31066 (_ BitVec 32)) (x!62063 (_ BitVec 32))) (Undefined!7174) (MissingVacant!7174 (index!31067 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40903 (_ BitVec 32)) SeekEntryResult!7174)

(assert (=> b!722771 (= e!405049 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19574 a!3186) j!159) a!3186 mask!3328) (Found!7174 j!159)))))

(declare-fun b!722772 () Bool)

(declare-fun res!484444 () Bool)

(declare-fun e!405047 () Bool)

(assert (=> b!722772 (=> (not res!484444) (not e!405047))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!722772 (= res!484444 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19574 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!722773 () Bool)

(declare-fun e!405050 () Bool)

(assert (=> b!722773 (= e!405050 e!405047)))

(declare-fun res!484441 () Bool)

(assert (=> b!722773 (=> (not res!484441) (not e!405047))))

(declare-fun lt!320421 () SeekEntryResult!7174)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40903 (_ BitVec 32)) SeekEntryResult!7174)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!722773 (= res!484441 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19574 a!3186) j!159) mask!3328) (select (arr!19574 a!3186) j!159) a!3186 mask!3328) lt!320421))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!722773 (= lt!320421 (Intermediate!7174 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!722774 () Bool)

(declare-fun res!484435 () Bool)

(assert (=> b!722774 (=> (not res!484435) (not e!405047))))

(assert (=> b!722774 (= res!484435 e!405049)))

(declare-fun c!79540 () Bool)

(assert (=> b!722774 (= c!79540 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!722775 () Bool)

(assert (=> b!722775 (= e!405047 false)))

(declare-fun lt!320425 () SeekEntryResult!7174)

(declare-fun lt!320423 () (_ BitVec 64))

(declare-fun lt!320424 () array!40903)

(assert (=> b!722775 (= lt!320425 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!320423 lt!320424 mask!3328))))

(declare-fun lt!320422 () SeekEntryResult!7174)

(assert (=> b!722775 (= lt!320422 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!320423 mask!3328) lt!320423 lt!320424 mask!3328))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!722775 (= lt!320423 (select (store (arr!19574 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!722775 (= lt!320424 (array!40904 (store (arr!19574 a!3186) i!1173 k!2102) (size!19995 a!3186)))))

(declare-fun b!722777 () Bool)

(declare-fun res!484438 () Bool)

(assert (=> b!722777 (=> (not res!484438) (not e!405050))))

(declare-datatypes ((List!13576 0))(
  ( (Nil!13573) (Cons!13572 (h!14626 (_ BitVec 64)) (t!19891 List!13576)) )
))
(declare-fun arrayNoDuplicates!0 (array!40903 (_ BitVec 32) List!13576) Bool)

(assert (=> b!722777 (= res!484438 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13573))))

(declare-fun b!722778 () Bool)

(declare-fun res!484439 () Bool)

(declare-fun e!405046 () Bool)

(assert (=> b!722778 (=> (not res!484439) (not e!405046))))

(assert (=> b!722778 (= res!484439 (and (= (size!19995 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19995 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19995 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!722779 () Bool)

(assert (=> b!722779 (= e!405049 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19574 a!3186) j!159) a!3186 mask!3328) lt!320421))))

(declare-fun b!722780 () Bool)

(declare-fun res!484437 () Bool)

(assert (=> b!722780 (=> (not res!484437) (not e!405050))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40903 (_ BitVec 32)) Bool)

(assert (=> b!722780 (= res!484437 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!722781 () Bool)

(declare-fun res!484445 () Bool)

(assert (=> b!722781 (=> (not res!484445) (not e!405046))))

(declare-fun arrayContainsKey!0 (array!40903 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!722781 (= res!484445 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!722782 () Bool)

(assert (=> b!722782 (= e!405046 e!405050)))

(declare-fun res!484442 () Bool)

(assert (=> b!722782 (=> (not res!484442) (not e!405050))))

(declare-fun lt!320426 () SeekEntryResult!7174)

(assert (=> b!722782 (= res!484442 (or (= lt!320426 (MissingZero!7174 i!1173)) (= lt!320426 (MissingVacant!7174 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40903 (_ BitVec 32)) SeekEntryResult!7174)

(assert (=> b!722782 (= lt!320426 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!722783 () Bool)

(declare-fun res!484436 () Bool)

(assert (=> b!722783 (=> (not res!484436) (not e!405050))))

(assert (=> b!722783 (= res!484436 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19995 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19995 a!3186))))))

(declare-fun b!722784 () Bool)

(declare-fun res!484440 () Bool)

(assert (=> b!722784 (=> (not res!484440) (not e!405046))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!722784 (= res!484440 (validKeyInArray!0 k!2102))))

(declare-fun res!484434 () Bool)

(assert (=> start!64322 (=> (not res!484434) (not e!405046))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64322 (= res!484434 (validMask!0 mask!3328))))

(assert (=> start!64322 e!405046))

(assert (=> start!64322 true))

(declare-fun array_inv!15370 (array!40903) Bool)

(assert (=> start!64322 (array_inv!15370 a!3186)))

(declare-fun b!722776 () Bool)

(declare-fun res!484443 () Bool)

(assert (=> b!722776 (=> (not res!484443) (not e!405046))))

(assert (=> b!722776 (= res!484443 (validKeyInArray!0 (select (arr!19574 a!3186) j!159)))))

(assert (= (and start!64322 res!484434) b!722778))

(assert (= (and b!722778 res!484439) b!722776))

(assert (= (and b!722776 res!484443) b!722784))

(assert (= (and b!722784 res!484440) b!722781))

(assert (= (and b!722781 res!484445) b!722782))

(assert (= (and b!722782 res!484442) b!722780))

(assert (= (and b!722780 res!484437) b!722777))

(assert (= (and b!722777 res!484438) b!722783))

(assert (= (and b!722783 res!484436) b!722773))

(assert (= (and b!722773 res!484441) b!722772))

(assert (= (and b!722772 res!484444) b!722774))

(assert (= (and b!722774 c!79540) b!722779))

(assert (= (and b!722774 (not c!79540)) b!722771))

(assert (= (and b!722774 res!484435) b!722775))

(declare-fun m!677267 () Bool)

(assert (=> b!722781 m!677267))

(declare-fun m!677269 () Bool)

(assert (=> b!722784 m!677269))

(declare-fun m!677271 () Bool)

(assert (=> start!64322 m!677271))

(declare-fun m!677273 () Bool)

(assert (=> start!64322 m!677273))

(declare-fun m!677275 () Bool)

(assert (=> b!722771 m!677275))

(assert (=> b!722771 m!677275))

(declare-fun m!677277 () Bool)

(assert (=> b!722771 m!677277))

(declare-fun m!677279 () Bool)

(assert (=> b!722782 m!677279))

(assert (=> b!722779 m!677275))

(assert (=> b!722779 m!677275))

(declare-fun m!677281 () Bool)

(assert (=> b!722779 m!677281))

(declare-fun m!677283 () Bool)

(assert (=> b!722777 m!677283))

(declare-fun m!677285 () Bool)

(assert (=> b!722772 m!677285))

(declare-fun m!677287 () Bool)

(assert (=> b!722780 m!677287))

(assert (=> b!722776 m!677275))

(assert (=> b!722776 m!677275))

(declare-fun m!677289 () Bool)

(assert (=> b!722776 m!677289))

(assert (=> b!722773 m!677275))

(assert (=> b!722773 m!677275))

(declare-fun m!677291 () Bool)

(assert (=> b!722773 m!677291))

(assert (=> b!722773 m!677291))

(assert (=> b!722773 m!677275))

(declare-fun m!677293 () Bool)

(assert (=> b!722773 m!677293))

(declare-fun m!677295 () Bool)

(assert (=> b!722775 m!677295))

(assert (=> b!722775 m!677295))

(declare-fun m!677297 () Bool)

(assert (=> b!722775 m!677297))

(declare-fun m!677299 () Bool)

(assert (=> b!722775 m!677299))

(declare-fun m!677301 () Bool)

(assert (=> b!722775 m!677301))

(declare-fun m!677303 () Bool)

(assert (=> b!722775 m!677303))

(push 1)

(assert (not b!722777))

(assert (not b!722775))

(assert (not b!722779))

(assert (not start!64322))

(assert (not b!722781))

