; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65412 () Bool)

(assert start!65412)

(declare-fun b!744561 () Bool)

(declare-fun res!501543 () Bool)

(declare-fun e!415915 () Bool)

(assert (=> b!744561 (=> (not res!501543) (not e!415915))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41585 0))(
  ( (array!41586 (arr!19906 (Array (_ BitVec 32) (_ BitVec 64))) (size!20327 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41585)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!744561 (= res!501543 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19906 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!744562 () Bool)

(declare-fun e!415917 () Bool)

(declare-fun e!415920 () Bool)

(assert (=> b!744562 (= e!415917 e!415920)))

(declare-fun res!501545 () Bool)

(assert (=> b!744562 (=> (not res!501545) (not e!415920))))

(declare-datatypes ((SeekEntryResult!7506 0))(
  ( (MissingZero!7506 (index!32392 (_ BitVec 32))) (Found!7506 (index!32393 (_ BitVec 32))) (Intermediate!7506 (undefined!8318 Bool) (index!32394 (_ BitVec 32)) (x!63352 (_ BitVec 32))) (Undefined!7506) (MissingVacant!7506 (index!32395 (_ BitVec 32))) )
))
(declare-fun lt!330772 () SeekEntryResult!7506)

(assert (=> b!744562 (= res!501545 (or (= lt!330772 (MissingZero!7506 i!1173)) (= lt!330772 (MissingVacant!7506 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41585 (_ BitVec 32)) SeekEntryResult!7506)

(assert (=> b!744562 (= lt!330772 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!744563 () Bool)

(declare-fun res!501535 () Bool)

(assert (=> b!744563 (=> (not res!501535) (not e!415920))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41585 (_ BitVec 32)) Bool)

(assert (=> b!744563 (= res!501535 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun b!744564 () Bool)

(declare-fun lt!330770 () SeekEntryResult!7506)

(declare-fun e!415922 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41585 (_ BitVec 32)) SeekEntryResult!7506)

(assert (=> b!744564 (= e!415922 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19906 a!3186) j!159) a!3186 mask!3328) lt!330770))))

(declare-fun b!744565 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41585 (_ BitVec 32)) SeekEntryResult!7506)

(assert (=> b!744565 (= e!415922 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19906 a!3186) j!159) a!3186 mask!3328) (Found!7506 j!159)))))

(declare-fun b!744566 () Bool)

(declare-fun e!415919 () Bool)

(assert (=> b!744566 (= e!415915 e!415919)))

(declare-fun res!501534 () Bool)

(assert (=> b!744566 (=> (not res!501534) (not e!415919))))

(declare-fun lt!330773 () SeekEntryResult!7506)

(declare-fun lt!330768 () SeekEntryResult!7506)

(assert (=> b!744566 (= res!501534 (= lt!330773 lt!330768))))

(declare-fun lt!330767 () (_ BitVec 64))

(declare-fun lt!330766 () array!41585)

(assert (=> b!744566 (= lt!330768 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!330767 lt!330766 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!744566 (= lt!330773 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!330767 mask!3328) lt!330767 lt!330766 mask!3328))))

(assert (=> b!744566 (= lt!330767 (select (store (arr!19906 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!744566 (= lt!330766 (array!41586 (store (arr!19906 a!3186) i!1173 k0!2102) (size!20327 a!3186)))))

(declare-fun e!415916 () Bool)

(declare-fun b!744567 () Bool)

(assert (=> b!744567 (= e!415916 (or (= (select (store (arr!19906 a!3186) i!1173 k0!2102) index!1321) lt!330767) (not (= (select (store (arr!19906 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3328 #b00000000000000000000000000000000)))))

(declare-fun b!744568 () Bool)

(declare-fun e!415914 () Bool)

(declare-fun e!415921 () Bool)

(assert (=> b!744568 (= e!415914 e!415921)))

(declare-fun res!501548 () Bool)

(assert (=> b!744568 (=> (not res!501548) (not e!415921))))

(declare-fun lt!330771 () SeekEntryResult!7506)

(assert (=> b!744568 (= res!501548 (= (seekEntryOrOpen!0 (select (arr!19906 a!3186) j!159) a!3186 mask!3328) lt!330771))))

(assert (=> b!744568 (= lt!330771 (Found!7506 j!159))))

(declare-fun res!501533 () Bool)

(assert (=> start!65412 (=> (not res!501533) (not e!415917))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65412 (= res!501533 (validMask!0 mask!3328))))

(assert (=> start!65412 e!415917))

(assert (=> start!65412 true))

(declare-fun array_inv!15702 (array!41585) Bool)

(assert (=> start!65412 (array_inv!15702 a!3186)))

(declare-fun b!744569 () Bool)

(declare-fun res!501540 () Bool)

(assert (=> b!744569 (=> (not res!501540) (not e!415917))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!744569 (= res!501540 (validKeyInArray!0 (select (arr!19906 a!3186) j!159)))))

(declare-fun b!744570 () Bool)

(declare-fun res!501539 () Bool)

(assert (=> b!744570 (=> res!501539 e!415916)))

(assert (=> b!744570 (= res!501539 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19906 a!3186) j!159) a!3186 mask!3328) (Found!7506 j!159))))))

(declare-fun b!744571 () Bool)

(declare-fun res!501541 () Bool)

(assert (=> b!744571 (=> (not res!501541) (not e!415915))))

(assert (=> b!744571 (= res!501541 e!415922)))

(declare-fun c!81895 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!744571 (= c!81895 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!744572 () Bool)

(declare-fun res!501546 () Bool)

(assert (=> b!744572 (=> (not res!501546) (not e!415917))))

(assert (=> b!744572 (= res!501546 (and (= (size!20327 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20327 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20327 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!744573 () Bool)

(assert (=> b!744573 (= e!415920 e!415915)))

(declare-fun res!501536 () Bool)

(assert (=> b!744573 (=> (not res!501536) (not e!415915))))

(assert (=> b!744573 (= res!501536 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19906 a!3186) j!159) mask!3328) (select (arr!19906 a!3186) j!159) a!3186 mask!3328) lt!330770))))

(assert (=> b!744573 (= lt!330770 (Intermediate!7506 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!744574 () Bool)

(declare-fun res!501547 () Bool)

(assert (=> b!744574 (=> (not res!501547) (not e!415920))))

(assert (=> b!744574 (= res!501547 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20327 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20327 a!3186))))))

(declare-fun b!744575 () Bool)

(declare-fun res!501537 () Bool)

(assert (=> b!744575 (=> (not res!501537) (not e!415917))))

(assert (=> b!744575 (= res!501537 (validKeyInArray!0 k0!2102))))

(declare-fun b!744576 () Bool)

(assert (=> b!744576 (= e!415921 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19906 a!3186) j!159) a!3186 mask!3328) lt!330771))))

(declare-fun b!744577 () Bool)

(declare-fun res!501532 () Bool)

(assert (=> b!744577 (=> (not res!501532) (not e!415917))))

(declare-fun arrayContainsKey!0 (array!41585 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!744577 (= res!501532 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!744578 () Bool)

(declare-fun res!501538 () Bool)

(assert (=> b!744578 (=> (not res!501538) (not e!415920))))

(declare-datatypes ((List!13908 0))(
  ( (Nil!13905) (Cons!13904 (h!14976 (_ BitVec 64)) (t!20223 List!13908)) )
))
(declare-fun arrayNoDuplicates!0 (array!41585 (_ BitVec 32) List!13908) Bool)

(assert (=> b!744578 (= res!501538 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13905))))

(declare-fun b!744579 () Bool)

(assert (=> b!744579 (= e!415919 (not e!415916))))

(declare-fun res!501542 () Bool)

(assert (=> b!744579 (=> res!501542 e!415916)))

(get-info :version)

(assert (=> b!744579 (= res!501542 (or (not ((_ is Intermediate!7506) lt!330768)) (bvslt x!1131 (x!63352 lt!330768)) (not (= x!1131 (x!63352 lt!330768))) (not (= index!1321 (index!32394 lt!330768)))))))

(assert (=> b!744579 e!415914))

(declare-fun res!501544 () Bool)

(assert (=> b!744579 (=> (not res!501544) (not e!415914))))

(assert (=> b!744579 (= res!501544 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25492 0))(
  ( (Unit!25493) )
))
(declare-fun lt!330769 () Unit!25492)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41585 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25492)

(assert (=> b!744579 (= lt!330769 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (= (and start!65412 res!501533) b!744572))

(assert (= (and b!744572 res!501546) b!744569))

(assert (= (and b!744569 res!501540) b!744575))

(assert (= (and b!744575 res!501537) b!744577))

(assert (= (and b!744577 res!501532) b!744562))

(assert (= (and b!744562 res!501545) b!744563))

(assert (= (and b!744563 res!501535) b!744578))

(assert (= (and b!744578 res!501538) b!744574))

(assert (= (and b!744574 res!501547) b!744573))

(assert (= (and b!744573 res!501536) b!744561))

(assert (= (and b!744561 res!501543) b!744571))

(assert (= (and b!744571 c!81895) b!744564))

(assert (= (and b!744571 (not c!81895)) b!744565))

(assert (= (and b!744571 res!501541) b!744566))

(assert (= (and b!744566 res!501534) b!744579))

(assert (= (and b!744579 res!501544) b!744568))

(assert (= (and b!744568 res!501548) b!744576))

(assert (= (and b!744579 (not res!501542)) b!744570))

(assert (= (and b!744570 (not res!501539)) b!744567))

(declare-fun m!695071 () Bool)

(assert (=> b!744566 m!695071))

(declare-fun m!695073 () Bool)

(assert (=> b!744566 m!695073))

(assert (=> b!744566 m!695071))

(declare-fun m!695075 () Bool)

(assert (=> b!744566 m!695075))

(declare-fun m!695077 () Bool)

(assert (=> b!744566 m!695077))

(declare-fun m!695079 () Bool)

(assert (=> b!744566 m!695079))

(assert (=> b!744567 m!695077))

(declare-fun m!695081 () Bool)

(assert (=> b!744567 m!695081))

(declare-fun m!695083 () Bool)

(assert (=> b!744562 m!695083))

(declare-fun m!695085 () Bool)

(assert (=> b!744569 m!695085))

(assert (=> b!744569 m!695085))

(declare-fun m!695087 () Bool)

(assert (=> b!744569 m!695087))

(assert (=> b!744565 m!695085))

(assert (=> b!744565 m!695085))

(declare-fun m!695089 () Bool)

(assert (=> b!744565 m!695089))

(assert (=> b!744573 m!695085))

(assert (=> b!744573 m!695085))

(declare-fun m!695091 () Bool)

(assert (=> b!744573 m!695091))

(assert (=> b!744573 m!695091))

(assert (=> b!744573 m!695085))

(declare-fun m!695093 () Bool)

(assert (=> b!744573 m!695093))

(assert (=> b!744576 m!695085))

(assert (=> b!744576 m!695085))

(declare-fun m!695095 () Bool)

(assert (=> b!744576 m!695095))

(declare-fun m!695097 () Bool)

(assert (=> b!744577 m!695097))

(assert (=> b!744568 m!695085))

(assert (=> b!744568 m!695085))

(declare-fun m!695099 () Bool)

(assert (=> b!744568 m!695099))

(declare-fun m!695101 () Bool)

(assert (=> b!744563 m!695101))

(declare-fun m!695103 () Bool)

(assert (=> start!65412 m!695103))

(declare-fun m!695105 () Bool)

(assert (=> start!65412 m!695105))

(declare-fun m!695107 () Bool)

(assert (=> b!744575 m!695107))

(declare-fun m!695109 () Bool)

(assert (=> b!744579 m!695109))

(declare-fun m!695111 () Bool)

(assert (=> b!744579 m!695111))

(assert (=> b!744570 m!695085))

(assert (=> b!744570 m!695085))

(assert (=> b!744570 m!695089))

(declare-fun m!695113 () Bool)

(assert (=> b!744561 m!695113))

(assert (=> b!744564 m!695085))

(assert (=> b!744564 m!695085))

(declare-fun m!695115 () Bool)

(assert (=> b!744564 m!695115))

(declare-fun m!695117 () Bool)

(assert (=> b!744578 m!695117))

(check-sat (not b!744573) (not b!744577) (not b!744564) (not b!744562) (not b!744576) (not b!744579) (not b!744570) (not b!744578) (not start!65412) (not b!744575) (not b!744565) (not b!744566) (not b!744563) (not b!744569) (not b!744568))
(check-sat)
