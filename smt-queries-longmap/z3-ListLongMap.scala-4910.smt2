; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67822 () Bool)

(assert start!67822)

(declare-fun b!785645 () Bool)

(declare-fun e!436846 () Bool)

(declare-fun e!436849 () Bool)

(assert (=> b!785645 (= e!436846 e!436849)))

(declare-fun res!531579 () Bool)

(assert (=> b!785645 (=> (not res!531579) (not e!436849))))

(declare-datatypes ((SeekEntryResult!8011 0))(
  ( (MissingZero!8011 (index!34412 (_ BitVec 32))) (Found!8011 (index!34413 (_ BitVec 32))) (Intermediate!8011 (undefined!8823 Bool) (index!34414 (_ BitVec 32)) (x!65522 (_ BitVec 32))) (Undefined!8011) (MissingVacant!8011 (index!34415 (_ BitVec 32))) )
))
(declare-fun lt!350257 () SeekEntryResult!8011)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!785645 (= res!531579 (or (= lt!350257 (MissingZero!8011 i!1173)) (= lt!350257 (MissingVacant!8011 i!1173))))))

(declare-datatypes ((array!42742 0))(
  ( (array!42743 (arr!20455 (Array (_ BitVec 32) (_ BitVec 64))) (size!20875 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42742)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42742 (_ BitVec 32)) SeekEntryResult!8011)

(assert (=> b!785645 (= lt!350257 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!785646 () Bool)

(declare-fun e!436852 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42742 (_ BitVec 32)) SeekEntryResult!8011)

(assert (=> b!785646 (= e!436852 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20455 a!3186) j!159) a!3186 mask!3328) (Found!8011 j!159)))))

(declare-fun b!785647 () Bool)

(declare-fun res!531583 () Bool)

(declare-fun e!436845 () Bool)

(assert (=> b!785647 (=> (not res!531583) (not e!436845))))

(declare-fun lt!350258 () array!42742)

(declare-fun lt!350255 () (_ BitVec 64))

(assert (=> b!785647 (= res!531583 (= (seekEntryOrOpen!0 lt!350255 lt!350258 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!350255 lt!350258 mask!3328)))))

(declare-fun b!785648 () Bool)

(declare-fun res!531571 () Bool)

(assert (=> b!785648 (=> (not res!531571) (not e!436846))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!785648 (= res!531571 (validKeyInArray!0 k0!2102))))

(declare-fun b!785649 () Bool)

(declare-fun e!436843 () Bool)

(assert (=> b!785649 (= e!436849 e!436843)))

(declare-fun res!531576 () Bool)

(assert (=> b!785649 (=> (not res!531576) (not e!436843))))

(declare-fun lt!350252 () SeekEntryResult!8011)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42742 (_ BitVec 32)) SeekEntryResult!8011)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!785649 (= res!531576 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20455 a!3186) j!159) mask!3328) (select (arr!20455 a!3186) j!159) a!3186 mask!3328) lt!350252))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!785649 (= lt!350252 (Intermediate!8011 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!785650 () Bool)

(declare-fun res!531588 () Bool)

(assert (=> b!785650 (=> (not res!531588) (not e!436849))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42742 (_ BitVec 32)) Bool)

(assert (=> b!785650 (= res!531588 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!785651 () Bool)

(declare-fun res!531575 () Bool)

(assert (=> b!785651 (=> (not res!531575) (not e!436843))))

(assert (=> b!785651 (= res!531575 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20455 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!785652 () Bool)

(declare-fun res!531582 () Bool)

(assert (=> b!785652 (=> (not res!531582) (not e!436846))))

(declare-fun arrayContainsKey!0 (array!42742 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!785652 (= res!531582 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!785653 () Bool)

(declare-fun e!436847 () Bool)

(declare-fun e!436848 () Bool)

(assert (=> b!785653 (= e!436847 (not e!436848))))

(declare-fun res!531587 () Bool)

(assert (=> b!785653 (=> res!531587 e!436848)))

(declare-fun lt!350250 () SeekEntryResult!8011)

(get-info :version)

(assert (=> b!785653 (= res!531587 (or (not ((_ is Intermediate!8011) lt!350250)) (bvslt x!1131 (x!65522 lt!350250)) (not (= x!1131 (x!65522 lt!350250))) (not (= index!1321 (index!34414 lt!350250)))))))

(declare-fun e!436841 () Bool)

(assert (=> b!785653 e!436841))

(declare-fun res!531574 () Bool)

(assert (=> b!785653 (=> (not res!531574) (not e!436841))))

(declare-fun lt!350259 () SeekEntryResult!8011)

(declare-fun lt!350260 () SeekEntryResult!8011)

(assert (=> b!785653 (= res!531574 (= lt!350259 lt!350260))))

(assert (=> b!785653 (= lt!350260 (Found!8011 j!159))))

(assert (=> b!785653 (= lt!350259 (seekEntryOrOpen!0 (select (arr!20455 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!785653 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!27109 0))(
  ( (Unit!27110) )
))
(declare-fun lt!350256 () Unit!27109)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42742 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27109)

(assert (=> b!785653 (= lt!350256 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!785654 () Bool)

(assert (=> b!785654 (= e!436841 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20455 a!3186) j!159) a!3186 mask!3328) lt!350260))))

(declare-fun b!785655 () Bool)

(declare-fun e!436842 () Unit!27109)

(declare-fun Unit!27111 () Unit!27109)

(assert (=> b!785655 (= e!436842 Unit!27111)))

(assert (=> b!785655 false))

(declare-fun b!785656 () Bool)

(declare-fun Unit!27112 () Unit!27109)

(assert (=> b!785656 (= e!436842 Unit!27112)))

(declare-fun b!785658 () Bool)

(declare-fun res!531570 () Bool)

(assert (=> b!785658 (=> (not res!531570) (not e!436843))))

(assert (=> b!785658 (= res!531570 e!436852)))

(declare-fun c!87449 () Bool)

(assert (=> b!785658 (= c!87449 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!785659 () Bool)

(declare-fun res!531580 () Bool)

(assert (=> b!785659 (=> (not res!531580) (not e!436846))))

(assert (=> b!785659 (= res!531580 (validKeyInArray!0 (select (arr!20455 a!3186) j!159)))))

(declare-fun b!785660 () Bool)

(declare-fun res!531586 () Bool)

(assert (=> b!785660 (=> (not res!531586) (not e!436849))))

(declare-datatypes ((List!14364 0))(
  ( (Nil!14361) (Cons!14360 (h!15489 (_ BitVec 64)) (t!20671 List!14364)) )
))
(declare-fun arrayNoDuplicates!0 (array!42742 (_ BitVec 32) List!14364) Bool)

(assert (=> b!785660 (= res!531586 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14361))))

(declare-fun b!785661 () Bool)

(declare-fun e!436850 () Bool)

(assert (=> b!785661 (= e!436850 true)))

(assert (=> b!785661 e!436845))

(declare-fun res!531573 () Bool)

(assert (=> b!785661 (=> (not res!531573) (not e!436845))))

(declare-fun lt!350251 () (_ BitVec 64))

(assert (=> b!785661 (= res!531573 (= lt!350251 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!350254 () Unit!27109)

(assert (=> b!785661 (= lt!350254 e!436842)))

(declare-fun c!87448 () Bool)

(assert (=> b!785661 (= c!87448 (= lt!350251 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!785662 () Bool)

(declare-fun e!436851 () Bool)

(assert (=> b!785662 (= e!436848 e!436851)))

(declare-fun res!531578 () Bool)

(assert (=> b!785662 (=> res!531578 e!436851)))

(declare-fun lt!350249 () SeekEntryResult!8011)

(assert (=> b!785662 (= res!531578 (not (= lt!350249 lt!350260)))))

(assert (=> b!785662 (= lt!350249 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20455 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!785663 () Bool)

(assert (=> b!785663 (= e!436843 e!436847)))

(declare-fun res!531572 () Bool)

(assert (=> b!785663 (=> (not res!531572) (not e!436847))))

(declare-fun lt!350253 () SeekEntryResult!8011)

(assert (=> b!785663 (= res!531572 (= lt!350253 lt!350250))))

(assert (=> b!785663 (= lt!350250 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!350255 lt!350258 mask!3328))))

(assert (=> b!785663 (= lt!350253 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!350255 mask!3328) lt!350255 lt!350258 mask!3328))))

(assert (=> b!785663 (= lt!350255 (select (store (arr!20455 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!785663 (= lt!350258 (array!42743 (store (arr!20455 a!3186) i!1173 k0!2102) (size!20875 a!3186)))))

(declare-fun b!785664 () Bool)

(assert (=> b!785664 (= e!436851 e!436850)))

(declare-fun res!531581 () Bool)

(assert (=> b!785664 (=> res!531581 e!436850)))

(assert (=> b!785664 (= res!531581 (= lt!350251 lt!350255))))

(assert (=> b!785664 (= lt!350251 (select (store (arr!20455 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!785665 () Bool)

(declare-fun res!531585 () Bool)

(assert (=> b!785665 (=> (not res!531585) (not e!436846))))

(assert (=> b!785665 (= res!531585 (and (= (size!20875 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20875 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20875 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!785666 () Bool)

(assert (=> b!785666 (= e!436845 (= lt!350259 lt!350249))))

(declare-fun b!785667 () Bool)

(declare-fun res!531584 () Bool)

(assert (=> b!785667 (=> (not res!531584) (not e!436849))))

(assert (=> b!785667 (= res!531584 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20875 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20875 a!3186))))))

(declare-fun res!531577 () Bool)

(assert (=> start!67822 (=> (not res!531577) (not e!436846))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67822 (= res!531577 (validMask!0 mask!3328))))

(assert (=> start!67822 e!436846))

(assert (=> start!67822 true))

(declare-fun array_inv!16314 (array!42742) Bool)

(assert (=> start!67822 (array_inv!16314 a!3186)))

(declare-fun b!785657 () Bool)

(assert (=> b!785657 (= e!436852 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20455 a!3186) j!159) a!3186 mask!3328) lt!350252))))

(assert (= (and start!67822 res!531577) b!785665))

(assert (= (and b!785665 res!531585) b!785659))

(assert (= (and b!785659 res!531580) b!785648))

(assert (= (and b!785648 res!531571) b!785652))

(assert (= (and b!785652 res!531582) b!785645))

(assert (= (and b!785645 res!531579) b!785650))

(assert (= (and b!785650 res!531588) b!785660))

(assert (= (and b!785660 res!531586) b!785667))

(assert (= (and b!785667 res!531584) b!785649))

(assert (= (and b!785649 res!531576) b!785651))

(assert (= (and b!785651 res!531575) b!785658))

(assert (= (and b!785658 c!87449) b!785657))

(assert (= (and b!785658 (not c!87449)) b!785646))

(assert (= (and b!785658 res!531570) b!785663))

(assert (= (and b!785663 res!531572) b!785653))

(assert (= (and b!785653 res!531574) b!785654))

(assert (= (and b!785653 (not res!531587)) b!785662))

(assert (= (and b!785662 (not res!531578)) b!785664))

(assert (= (and b!785664 (not res!531581)) b!785661))

(assert (= (and b!785661 c!87448) b!785655))

(assert (= (and b!785661 (not c!87448)) b!785656))

(assert (= (and b!785661 res!531573) b!785647))

(assert (= (and b!785647 res!531583) b!785666))

(declare-fun m!728243 () Bool)

(assert (=> b!785648 m!728243))

(declare-fun m!728245 () Bool)

(assert (=> b!785663 m!728245))

(declare-fun m!728247 () Bool)

(assert (=> b!785663 m!728247))

(declare-fun m!728249 () Bool)

(assert (=> b!785663 m!728249))

(declare-fun m!728251 () Bool)

(assert (=> b!785663 m!728251))

(declare-fun m!728253 () Bool)

(assert (=> b!785663 m!728253))

(assert (=> b!785663 m!728247))

(declare-fun m!728255 () Bool)

(assert (=> b!785660 m!728255))

(declare-fun m!728257 () Bool)

(assert (=> b!785645 m!728257))

(declare-fun m!728259 () Bool)

(assert (=> b!785649 m!728259))

(assert (=> b!785649 m!728259))

(declare-fun m!728261 () Bool)

(assert (=> b!785649 m!728261))

(assert (=> b!785649 m!728261))

(assert (=> b!785649 m!728259))

(declare-fun m!728263 () Bool)

(assert (=> b!785649 m!728263))

(declare-fun m!728265 () Bool)

(assert (=> start!67822 m!728265))

(declare-fun m!728267 () Bool)

(assert (=> start!67822 m!728267))

(declare-fun m!728269 () Bool)

(assert (=> b!785652 m!728269))

(assert (=> b!785653 m!728259))

(assert (=> b!785653 m!728259))

(declare-fun m!728271 () Bool)

(assert (=> b!785653 m!728271))

(declare-fun m!728273 () Bool)

(assert (=> b!785653 m!728273))

(declare-fun m!728275 () Bool)

(assert (=> b!785653 m!728275))

(assert (=> b!785662 m!728259))

(assert (=> b!785662 m!728259))

(declare-fun m!728277 () Bool)

(assert (=> b!785662 m!728277))

(assert (=> b!785664 m!728251))

(declare-fun m!728279 () Bool)

(assert (=> b!785664 m!728279))

(assert (=> b!785646 m!728259))

(assert (=> b!785646 m!728259))

(assert (=> b!785646 m!728277))

(assert (=> b!785657 m!728259))

(assert (=> b!785657 m!728259))

(declare-fun m!728281 () Bool)

(assert (=> b!785657 m!728281))

(declare-fun m!728283 () Bool)

(assert (=> b!785647 m!728283))

(declare-fun m!728285 () Bool)

(assert (=> b!785647 m!728285))

(declare-fun m!728287 () Bool)

(assert (=> b!785650 m!728287))

(assert (=> b!785654 m!728259))

(assert (=> b!785654 m!728259))

(declare-fun m!728289 () Bool)

(assert (=> b!785654 m!728289))

(declare-fun m!728291 () Bool)

(assert (=> b!785651 m!728291))

(assert (=> b!785659 m!728259))

(assert (=> b!785659 m!728259))

(declare-fun m!728293 () Bool)

(assert (=> b!785659 m!728293))

(check-sat (not b!785660) (not b!785645) (not b!785646) (not b!785649) (not start!67822) (not b!785657) (not b!785654) (not b!785659) (not b!785647) (not b!785652) (not b!785653) (not b!785662) (not b!785648) (not b!785663) (not b!785650))
(check-sat)
