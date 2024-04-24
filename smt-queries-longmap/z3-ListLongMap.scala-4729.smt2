; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65562 () Bool)

(assert start!65562)

(declare-fun b!745915 () Bool)

(declare-fun res!502389 () Bool)

(declare-fun e!416693 () Bool)

(assert (=> b!745915 (=> (not res!502389) (not e!416693))))

(declare-datatypes ((array!41605 0))(
  ( (array!41606 (arr!19912 (Array (_ BitVec 32) (_ BitVec 64))) (size!20332 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41605)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!745915 (= res!502389 (validKeyInArray!0 (select (arr!19912 a!3186) j!159)))))

(declare-fun b!745916 () Bool)

(declare-fun res!502381 () Bool)

(declare-fun e!416694 () Bool)

(assert (=> b!745916 (=> (not res!502381) (not e!416694))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!745916 (= res!502381 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19912 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!745917 () Bool)

(declare-fun e!416691 () Bool)

(assert (=> b!745917 (= e!416691 e!416694)))

(declare-fun res!502392 () Bool)

(assert (=> b!745917 (=> (not res!502392) (not e!416694))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7468 0))(
  ( (MissingZero!7468 (index!32240 (_ BitVec 32))) (Found!7468 (index!32241 (_ BitVec 32))) (Intermediate!7468 (undefined!8280 Bool) (index!32242 (_ BitVec 32)) (x!63358 (_ BitVec 32))) (Undefined!7468) (MissingVacant!7468 (index!32243 (_ BitVec 32))) )
))
(declare-fun lt!331364 () SeekEntryResult!7468)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41605 (_ BitVec 32)) SeekEntryResult!7468)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!745917 (= res!502392 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19912 a!3186) j!159) mask!3328) (select (arr!19912 a!3186) j!159) a!3186 mask!3328) lt!331364))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!745917 (= lt!331364 (Intermediate!7468 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!745918 () Bool)

(declare-fun e!416692 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41605 (_ BitVec 32)) SeekEntryResult!7468)

(assert (=> b!745918 (= e!416692 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19912 a!3186) j!159) a!3186 mask!3328) (Found!7468 j!159)))))

(declare-fun b!745919 () Bool)

(declare-fun e!416697 () Bool)

(declare-fun e!416690 () Bool)

(assert (=> b!745919 (= e!416697 (not e!416690))))

(declare-fun res!502380 () Bool)

(assert (=> b!745919 (=> res!502380 e!416690)))

(declare-fun lt!331367 () SeekEntryResult!7468)

(get-info :version)

(assert (=> b!745919 (= res!502380 (or (not ((_ is Intermediate!7468) lt!331367)) (bvslt x!1131 (x!63358 lt!331367)) (not (= x!1131 (x!63358 lt!331367))) (not (= index!1321 (index!32242 lt!331367)))))))

(declare-fun e!416695 () Bool)

(assert (=> b!745919 e!416695))

(declare-fun res!502385 () Bool)

(assert (=> b!745919 (=> (not res!502385) (not e!416695))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41605 (_ BitVec 32)) Bool)

(assert (=> b!745919 (= res!502385 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25495 0))(
  ( (Unit!25496) )
))
(declare-fun lt!331361 () Unit!25495)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41605 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25495)

(assert (=> b!745919 (= lt!331361 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!745920 () Bool)

(assert (=> b!745920 (= e!416694 e!416697)))

(declare-fun res!502393 () Bool)

(assert (=> b!745920 (=> (not res!502393) (not e!416697))))

(declare-fun lt!331365 () SeekEntryResult!7468)

(assert (=> b!745920 (= res!502393 (= lt!331365 lt!331367))))

(declare-fun lt!331366 () array!41605)

(declare-fun lt!331362 () (_ BitVec 64))

(assert (=> b!745920 (= lt!331367 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!331362 lt!331366 mask!3328))))

(assert (=> b!745920 (= lt!331365 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!331362 mask!3328) lt!331362 lt!331366 mask!3328))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!745920 (= lt!331362 (select (store (arr!19912 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!745920 (= lt!331366 (array!41606 (store (arr!19912 a!3186) i!1173 k0!2102) (size!20332 a!3186)))))

(declare-fun b!745921 () Bool)

(assert (=> b!745921 (= e!416690 (or (= (select (store (arr!19912 a!3186) i!1173 k0!2102) index!1321) lt!331362) (not (= (select (store (arr!19912 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!3328 #b00000000000000000000000000000000) (bvsge index!1321 (bvadd #b00000000000000000000000000000001 mask!3328)) (bvslt resIntermediateIndex!5 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(declare-fun b!745922 () Bool)

(assert (=> b!745922 (= e!416692 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19912 a!3186) j!159) a!3186 mask!3328) lt!331364))))

(declare-fun e!416689 () Bool)

(declare-fun b!745923 () Bool)

(declare-fun lt!331368 () SeekEntryResult!7468)

(assert (=> b!745923 (= e!416689 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19912 a!3186) j!159) a!3186 mask!3328) lt!331368))))

(declare-fun b!745924 () Bool)

(declare-fun res!502386 () Bool)

(assert (=> b!745924 (=> (not res!502386) (not e!416693))))

(declare-fun arrayContainsKey!0 (array!41605 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!745924 (= res!502386 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!745925 () Bool)

(declare-fun res!502387 () Bool)

(assert (=> b!745925 (=> (not res!502387) (not e!416693))))

(assert (=> b!745925 (= res!502387 (and (= (size!20332 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20332 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20332 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!745927 () Bool)

(assert (=> b!745927 (= e!416693 e!416691)))

(declare-fun res!502384 () Bool)

(assert (=> b!745927 (=> (not res!502384) (not e!416691))))

(declare-fun lt!331363 () SeekEntryResult!7468)

(assert (=> b!745927 (= res!502384 (or (= lt!331363 (MissingZero!7468 i!1173)) (= lt!331363 (MissingVacant!7468 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41605 (_ BitVec 32)) SeekEntryResult!7468)

(assert (=> b!745927 (= lt!331363 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!745928 () Bool)

(declare-fun res!502382 () Bool)

(assert (=> b!745928 (=> (not res!502382) (not e!416691))))

(assert (=> b!745928 (= res!502382 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!745929 () Bool)

(assert (=> b!745929 (= e!416695 e!416689)))

(declare-fun res!502383 () Bool)

(assert (=> b!745929 (=> (not res!502383) (not e!416689))))

(assert (=> b!745929 (= res!502383 (= (seekEntryOrOpen!0 (select (arr!19912 a!3186) j!159) a!3186 mask!3328) lt!331368))))

(assert (=> b!745929 (= lt!331368 (Found!7468 j!159))))

(declare-fun b!745930 () Bool)

(declare-fun res!502391 () Bool)

(assert (=> b!745930 (=> (not res!502391) (not e!416691))))

(assert (=> b!745930 (= res!502391 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20332 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20332 a!3186))))))

(declare-fun b!745931 () Bool)

(declare-fun res!502396 () Bool)

(assert (=> b!745931 (=> (not res!502396) (not e!416693))))

(assert (=> b!745931 (= res!502396 (validKeyInArray!0 k0!2102))))

(declare-fun b!745932 () Bool)

(declare-fun res!502388 () Bool)

(assert (=> b!745932 (=> (not res!502388) (not e!416694))))

(assert (=> b!745932 (= res!502388 e!416692)))

(declare-fun c!82151 () Bool)

(assert (=> b!745932 (= c!82151 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!745933 () Bool)

(declare-fun res!502394 () Bool)

(assert (=> b!745933 (=> (not res!502394) (not e!416691))))

(declare-datatypes ((List!13821 0))(
  ( (Nil!13818) (Cons!13817 (h!14895 (_ BitVec 64)) (t!20128 List!13821)) )
))
(declare-fun arrayNoDuplicates!0 (array!41605 (_ BitVec 32) List!13821) Bool)

(assert (=> b!745933 (= res!502394 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13818))))

(declare-fun b!745926 () Bool)

(declare-fun res!502390 () Bool)

(assert (=> b!745926 (=> res!502390 e!416690)))

(assert (=> b!745926 (= res!502390 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19912 a!3186) j!159) a!3186 mask!3328) (Found!7468 j!159))))))

(declare-fun res!502395 () Bool)

(assert (=> start!65562 (=> (not res!502395) (not e!416693))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65562 (= res!502395 (validMask!0 mask!3328))))

(assert (=> start!65562 e!416693))

(assert (=> start!65562 true))

(declare-fun array_inv!15771 (array!41605) Bool)

(assert (=> start!65562 (array_inv!15771 a!3186)))

(assert (= (and start!65562 res!502395) b!745925))

(assert (= (and b!745925 res!502387) b!745915))

(assert (= (and b!745915 res!502389) b!745931))

(assert (= (and b!745931 res!502396) b!745924))

(assert (= (and b!745924 res!502386) b!745927))

(assert (= (and b!745927 res!502384) b!745928))

(assert (= (and b!745928 res!502382) b!745933))

(assert (= (and b!745933 res!502394) b!745930))

(assert (= (and b!745930 res!502391) b!745917))

(assert (= (and b!745917 res!502392) b!745916))

(assert (= (and b!745916 res!502381) b!745932))

(assert (= (and b!745932 c!82151) b!745922))

(assert (= (and b!745932 (not c!82151)) b!745918))

(assert (= (and b!745932 res!502388) b!745920))

(assert (= (and b!745920 res!502393) b!745919))

(assert (= (and b!745919 res!502385) b!745929))

(assert (= (and b!745929 res!502383) b!745923))

(assert (= (and b!745919 (not res!502380)) b!745926))

(assert (= (and b!745926 (not res!502390)) b!745921))

(declare-fun m!696747 () Bool)

(assert (=> b!745917 m!696747))

(assert (=> b!745917 m!696747))

(declare-fun m!696749 () Bool)

(assert (=> b!745917 m!696749))

(assert (=> b!745917 m!696749))

(assert (=> b!745917 m!696747))

(declare-fun m!696751 () Bool)

(assert (=> b!745917 m!696751))

(declare-fun m!696753 () Bool)

(assert (=> b!745931 m!696753))

(declare-fun m!696755 () Bool)

(assert (=> b!745933 m!696755))

(declare-fun m!696757 () Bool)

(assert (=> b!745916 m!696757))

(declare-fun m!696759 () Bool)

(assert (=> start!65562 m!696759))

(declare-fun m!696761 () Bool)

(assert (=> start!65562 m!696761))

(declare-fun m!696763 () Bool)

(assert (=> b!745928 m!696763))

(declare-fun m!696765 () Bool)

(assert (=> b!745920 m!696765))

(declare-fun m!696767 () Bool)

(assert (=> b!745920 m!696767))

(declare-fun m!696769 () Bool)

(assert (=> b!745920 m!696769))

(assert (=> b!745920 m!696765))

(declare-fun m!696771 () Bool)

(assert (=> b!745920 m!696771))

(declare-fun m!696773 () Bool)

(assert (=> b!745920 m!696773))

(declare-fun m!696775 () Bool)

(assert (=> b!745919 m!696775))

(declare-fun m!696777 () Bool)

(assert (=> b!745919 m!696777))

(declare-fun m!696779 () Bool)

(assert (=> b!745924 m!696779))

(assert (=> b!745915 m!696747))

(assert (=> b!745915 m!696747))

(declare-fun m!696781 () Bool)

(assert (=> b!745915 m!696781))

(assert (=> b!745921 m!696771))

(declare-fun m!696783 () Bool)

(assert (=> b!745921 m!696783))

(assert (=> b!745926 m!696747))

(assert (=> b!745926 m!696747))

(declare-fun m!696785 () Bool)

(assert (=> b!745926 m!696785))

(declare-fun m!696787 () Bool)

(assert (=> b!745927 m!696787))

(assert (=> b!745922 m!696747))

(assert (=> b!745922 m!696747))

(declare-fun m!696789 () Bool)

(assert (=> b!745922 m!696789))

(assert (=> b!745923 m!696747))

(assert (=> b!745923 m!696747))

(declare-fun m!696791 () Bool)

(assert (=> b!745923 m!696791))

(assert (=> b!745929 m!696747))

(assert (=> b!745929 m!696747))

(declare-fun m!696793 () Bool)

(assert (=> b!745929 m!696793))

(assert (=> b!745918 m!696747))

(assert (=> b!745918 m!696747))

(assert (=> b!745918 m!696785))

(check-sat (not start!65562) (not b!745933) (not b!745917) (not b!745920) (not b!745915) (not b!745929) (not b!745919) (not b!745928) (not b!745924) (not b!745923) (not b!745918) (not b!745922) (not b!745926) (not b!745931) (not b!745927))
(check-sat)
