; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64368 () Bool)

(assert start!64368)

(declare-fun b!722763 () Bool)

(declare-fun res!484329 () Bool)

(declare-fun e!405153 () Bool)

(assert (=> b!722763 (=> (not res!484329) (not e!405153))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!40882 0))(
  ( (array!40883 (arr!19561 (Array (_ BitVec 32) (_ BitVec 64))) (size!19981 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40882)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!722763 (= res!484329 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19981 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19981 a!3186))))))

(declare-fun b!722764 () Bool)

(declare-fun e!405155 () Bool)

(assert (=> b!722764 (= e!405153 e!405155)))

(declare-fun res!484332 () Bool)

(assert (=> b!722764 (=> (not res!484332) (not e!405155))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7117 0))(
  ( (MissingZero!7117 (index!30836 (_ BitVec 32))) (Found!7117 (index!30837 (_ BitVec 32))) (Intermediate!7117 (undefined!7929 Bool) (index!30838 (_ BitVec 32)) (x!61993 (_ BitVec 32))) (Undefined!7117) (MissingVacant!7117 (index!30839 (_ BitVec 32))) )
))
(declare-fun lt!320407 () SeekEntryResult!7117)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40882 (_ BitVec 32)) SeekEntryResult!7117)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!722764 (= res!484332 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19561 a!3186) j!159) mask!3328) (select (arr!19561 a!3186) j!159) a!3186 mask!3328) lt!320407))))

(assert (=> b!722764 (= lt!320407 (Intermediate!7117 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun res!484328 () Bool)

(declare-fun e!405152 () Bool)

(assert (=> start!64368 (=> (not res!484328) (not e!405152))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64368 (= res!484328 (validMask!0 mask!3328))))

(assert (=> start!64368 e!405152))

(assert (=> start!64368 true))

(declare-fun array_inv!15420 (array!40882) Bool)

(assert (=> start!64368 (array_inv!15420 a!3186)))

(declare-fun b!722765 () Bool)

(declare-fun e!405156 () Bool)

(assert (=> b!722765 (= e!405156 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19561 a!3186) j!159) a!3186 mask!3328) lt!320407))))

(declare-fun b!722766 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40882 (_ BitVec 32)) SeekEntryResult!7117)

(assert (=> b!722766 (= e!405156 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19561 a!3186) j!159) a!3186 mask!3328) (Found!7117 j!159)))))

(declare-fun b!722767 () Bool)

(declare-fun res!484331 () Bool)

(assert (=> b!722767 (=> (not res!484331) (not e!405152))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!722767 (= res!484331 (validKeyInArray!0 (select (arr!19561 a!3186) j!159)))))

(declare-fun b!722768 () Bool)

(assert (=> b!722768 (= e!405152 e!405153)))

(declare-fun res!484325 () Bool)

(assert (=> b!722768 (=> (not res!484325) (not e!405153))))

(declare-fun lt!320412 () SeekEntryResult!7117)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!722768 (= res!484325 (or (= lt!320412 (MissingZero!7117 i!1173)) (= lt!320412 (MissingVacant!7117 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40882 (_ BitVec 32)) SeekEntryResult!7117)

(assert (=> b!722768 (= lt!320412 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!722769 () Bool)

(declare-fun res!484333 () Bool)

(assert (=> b!722769 (=> (not res!484333) (not e!405155))))

(assert (=> b!722769 (= res!484333 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19561 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!722770 () Bool)

(declare-fun res!484334 () Bool)

(assert (=> b!722770 (=> (not res!484334) (not e!405152))))

(assert (=> b!722770 (= res!484334 (and (= (size!19981 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19981 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19981 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!722771 () Bool)

(declare-fun res!484335 () Bool)

(assert (=> b!722771 (=> (not res!484335) (not e!405152))))

(declare-fun arrayContainsKey!0 (array!40882 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!722771 (= res!484335 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!722772 () Bool)

(declare-fun res!484327 () Bool)

(assert (=> b!722772 (=> (not res!484327) (not e!405153))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40882 (_ BitVec 32)) Bool)

(assert (=> b!722772 (= res!484327 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!722773 () Bool)

(assert (=> b!722773 (= e!405155 false)))

(declare-fun lt!320411 () array!40882)

(declare-fun lt!320408 () SeekEntryResult!7117)

(declare-fun lt!320410 () (_ BitVec 64))

(assert (=> b!722773 (= lt!320408 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!320410 lt!320411 mask!3328))))

(declare-fun lt!320409 () SeekEntryResult!7117)

(assert (=> b!722773 (= lt!320409 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!320410 mask!3328) lt!320410 lt!320411 mask!3328))))

(assert (=> b!722773 (= lt!320410 (select (store (arr!19561 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!722773 (= lt!320411 (array!40883 (store (arr!19561 a!3186) i!1173 k0!2102) (size!19981 a!3186)))))

(declare-fun b!722774 () Bool)

(declare-fun res!484326 () Bool)

(assert (=> b!722774 (=> (not res!484326) (not e!405153))))

(declare-datatypes ((List!13470 0))(
  ( (Nil!13467) (Cons!13466 (h!14523 (_ BitVec 64)) (t!19777 List!13470)) )
))
(declare-fun arrayNoDuplicates!0 (array!40882 (_ BitVec 32) List!13470) Bool)

(assert (=> b!722774 (= res!484326 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13467))))

(declare-fun b!722775 () Bool)

(declare-fun res!484330 () Bool)

(assert (=> b!722775 (=> (not res!484330) (not e!405152))))

(assert (=> b!722775 (= res!484330 (validKeyInArray!0 k0!2102))))

(declare-fun b!722776 () Bool)

(declare-fun res!484336 () Bool)

(assert (=> b!722776 (=> (not res!484336) (not e!405155))))

(assert (=> b!722776 (= res!484336 e!405156)))

(declare-fun c!79592 () Bool)

(assert (=> b!722776 (= c!79592 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!64368 res!484328) b!722770))

(assert (= (and b!722770 res!484334) b!722767))

(assert (= (and b!722767 res!484331) b!722775))

(assert (= (and b!722775 res!484330) b!722771))

(assert (= (and b!722771 res!484335) b!722768))

(assert (= (and b!722768 res!484325) b!722772))

(assert (= (and b!722772 res!484327) b!722774))

(assert (= (and b!722774 res!484326) b!722763))

(assert (= (and b!722763 res!484329) b!722764))

(assert (= (and b!722764 res!484332) b!722769))

(assert (= (and b!722769 res!484333) b!722776))

(assert (= (and b!722776 c!79592) b!722765))

(assert (= (and b!722776 (not c!79592)) b!722766))

(assert (= (and b!722776 res!484336) b!722773))

(declare-fun m!677811 () Bool)

(assert (=> b!722765 m!677811))

(assert (=> b!722765 m!677811))

(declare-fun m!677813 () Bool)

(assert (=> b!722765 m!677813))

(declare-fun m!677815 () Bool)

(assert (=> b!722775 m!677815))

(assert (=> b!722767 m!677811))

(assert (=> b!722767 m!677811))

(declare-fun m!677817 () Bool)

(assert (=> b!722767 m!677817))

(declare-fun m!677819 () Bool)

(assert (=> start!64368 m!677819))

(declare-fun m!677821 () Bool)

(assert (=> start!64368 m!677821))

(declare-fun m!677823 () Bool)

(assert (=> b!722773 m!677823))

(declare-fun m!677825 () Bool)

(assert (=> b!722773 m!677825))

(declare-fun m!677827 () Bool)

(assert (=> b!722773 m!677827))

(assert (=> b!722773 m!677825))

(declare-fun m!677829 () Bool)

(assert (=> b!722773 m!677829))

(declare-fun m!677831 () Bool)

(assert (=> b!722773 m!677831))

(declare-fun m!677833 () Bool)

(assert (=> b!722772 m!677833))

(declare-fun m!677835 () Bool)

(assert (=> b!722774 m!677835))

(declare-fun m!677837 () Bool)

(assert (=> b!722768 m!677837))

(assert (=> b!722766 m!677811))

(assert (=> b!722766 m!677811))

(declare-fun m!677839 () Bool)

(assert (=> b!722766 m!677839))

(declare-fun m!677841 () Bool)

(assert (=> b!722769 m!677841))

(declare-fun m!677843 () Bool)

(assert (=> b!722771 m!677843))

(assert (=> b!722764 m!677811))

(assert (=> b!722764 m!677811))

(declare-fun m!677845 () Bool)

(assert (=> b!722764 m!677845))

(assert (=> b!722764 m!677845))

(assert (=> b!722764 m!677811))

(declare-fun m!677847 () Bool)

(assert (=> b!722764 m!677847))

(check-sat (not b!722765) (not b!722768) (not b!722773) (not b!722772) (not b!722775) (not b!722774) (not start!64368) (not b!722767) (not b!722766) (not b!722771) (not b!722764))
(check-sat)
