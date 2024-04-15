; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64442 () Bool)

(assert start!64442)

(declare-fun res!485943 () Bool)

(declare-fun e!405838 () Bool)

(assert (=> start!64442 (=> (not res!485943) (not e!405838))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64442 (= res!485943 (validMask!0 mask!3328))))

(assert (=> start!64442 e!405838))

(assert (=> start!64442 true))

(declare-datatypes ((array!40977 0))(
  ( (array!40978 (arr!19610 (Array (_ BitVec 32) (_ BitVec 64))) (size!20031 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40977)

(declare-fun array_inv!15493 (array!40977) Bool)

(assert (=> start!64442 (array_inv!15493 a!3186)))

(declare-fun b!724622 () Bool)

(declare-fun e!405839 () Bool)

(assert (=> b!724622 (= e!405838 e!405839)))

(declare-fun res!485939 () Bool)

(assert (=> b!724622 (=> (not res!485939) (not e!405839))))

(declare-datatypes ((SeekEntryResult!7207 0))(
  ( (MissingZero!7207 (index!31196 (_ BitVec 32))) (Found!7207 (index!31197 (_ BitVec 32))) (Intermediate!7207 (undefined!8019 Bool) (index!31198 (_ BitVec 32)) (x!62204 (_ BitVec 32))) (Undefined!7207) (MissingVacant!7207 (index!31199 (_ BitVec 32))) )
))
(declare-fun lt!320914 () SeekEntryResult!7207)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!724622 (= res!485939 (or (= lt!320914 (MissingZero!7207 i!1173)) (= lt!320914 (MissingVacant!7207 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40977 (_ BitVec 32)) SeekEntryResult!7207)

(assert (=> b!724622 (= lt!320914 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!724623 () Bool)

(declare-fun res!485934 () Bool)

(assert (=> b!724623 (=> (not res!485934) (not e!405839))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40977 (_ BitVec 32)) Bool)

(assert (=> b!724623 (= res!485934 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!724624 () Bool)

(declare-fun res!485936 () Bool)

(assert (=> b!724624 (=> (not res!485936) (not e!405838))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!724624 (= res!485936 (validKeyInArray!0 (select (arr!19610 a!3186) j!159)))))

(declare-fun b!724625 () Bool)

(declare-fun e!405843 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!320918 () SeekEntryResult!7207)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40977 (_ BitVec 32)) SeekEntryResult!7207)

(assert (=> b!724625 (= e!405843 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19610 a!3186) j!159) a!3186 mask!3328) lt!320918))))

(declare-fun b!724626 () Bool)

(declare-fun res!485938 () Bool)

(assert (=> b!724626 (=> (not res!485938) (not e!405839))))

(declare-datatypes ((List!13651 0))(
  ( (Nil!13648) (Cons!13647 (h!14704 (_ BitVec 64)) (t!19957 List!13651)) )
))
(declare-fun arrayNoDuplicates!0 (array!40977 (_ BitVec 32) List!13651) Bool)

(assert (=> b!724626 (= res!485938 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13648))))

(declare-fun b!724627 () Bool)

(declare-fun res!485935 () Bool)

(declare-fun e!405840 () Bool)

(assert (=> b!724627 (=> (not res!485935) (not e!405840))))

(assert (=> b!724627 (= res!485935 e!405843)))

(declare-fun c!79719 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!724627 (= c!79719 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!724628 () Bool)

(declare-fun res!485937 () Bool)

(assert (=> b!724628 (=> (not res!485937) (not e!405840))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!724628 (= res!485937 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19610 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!724629 () Bool)

(declare-fun res!485933 () Bool)

(assert (=> b!724629 (=> (not res!485933) (not e!405838))))

(assert (=> b!724629 (= res!485933 (and (= (size!20031 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20031 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20031 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!724630 () Bool)

(declare-fun e!405842 () Bool)

(assert (=> b!724630 (= e!405840 e!405842)))

(declare-fun res!485940 () Bool)

(assert (=> b!724630 (=> (not res!485940) (not e!405842))))

(declare-fun lt!320916 () (_ BitVec 64))

(declare-fun lt!320915 () array!40977)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!724630 (= res!485940 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!320916 mask!3328) lt!320916 lt!320915 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!320916 lt!320915 mask!3328)))))

(assert (=> b!724630 (= lt!320916 (select (store (arr!19610 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!724630 (= lt!320915 (array!40978 (store (arr!19610 a!3186) i!1173 k0!2102) (size!20031 a!3186)))))

(declare-fun b!724631 () Bool)

(declare-fun res!485930 () Bool)

(assert (=> b!724631 (=> (not res!485930) (not e!405838))))

(declare-fun arrayContainsKey!0 (array!40977 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!724631 (= res!485930 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!724632 () Bool)

(assert (=> b!724632 (= e!405839 e!405840)))

(declare-fun res!485932 () Bool)

(assert (=> b!724632 (=> (not res!485932) (not e!405840))))

(assert (=> b!724632 (= res!485932 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19610 a!3186) j!159) mask!3328) (select (arr!19610 a!3186) j!159) a!3186 mask!3328) lt!320918))))

(assert (=> b!724632 (= lt!320918 (Intermediate!7207 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!724633 () Bool)

(declare-fun res!485931 () Bool)

(assert (=> b!724633 (=> (not res!485931) (not e!405838))))

(assert (=> b!724633 (= res!485931 (validKeyInArray!0 k0!2102))))

(declare-fun b!724634 () Bool)

(assert (=> b!724634 (= e!405842 (not true))))

(declare-fun e!405844 () Bool)

(assert (=> b!724634 e!405844))

(declare-fun res!485941 () Bool)

(assert (=> b!724634 (=> (not res!485941) (not e!405844))))

(assert (=> b!724634 (= res!485941 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24704 0))(
  ( (Unit!24705) )
))
(declare-fun lt!320917 () Unit!24704)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!40977 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24704)

(assert (=> b!724634 (= lt!320917 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!724635 () Bool)

(declare-fun res!485942 () Bool)

(assert (=> b!724635 (=> (not res!485942) (not e!405839))))

(assert (=> b!724635 (= res!485942 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20031 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20031 a!3186))))))

(declare-fun b!724636 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40977 (_ BitVec 32)) SeekEntryResult!7207)

(assert (=> b!724636 (= e!405843 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19610 a!3186) j!159) a!3186 mask!3328) (Found!7207 j!159)))))

(declare-fun b!724637 () Bool)

(assert (=> b!724637 (= e!405844 (= (seekEntryOrOpen!0 (select (arr!19610 a!3186) j!159) a!3186 mask!3328) (Found!7207 j!159)))))

(assert (= (and start!64442 res!485943) b!724629))

(assert (= (and b!724629 res!485933) b!724624))

(assert (= (and b!724624 res!485936) b!724633))

(assert (= (and b!724633 res!485931) b!724631))

(assert (= (and b!724631 res!485930) b!724622))

(assert (= (and b!724622 res!485939) b!724623))

(assert (= (and b!724623 res!485934) b!724626))

(assert (= (and b!724626 res!485938) b!724635))

(assert (= (and b!724635 res!485942) b!724632))

(assert (= (and b!724632 res!485932) b!724628))

(assert (= (and b!724628 res!485937) b!724627))

(assert (= (and b!724627 c!79719) b!724625))

(assert (= (and b!724627 (not c!79719)) b!724636))

(assert (= (and b!724627 res!485935) b!724630))

(assert (= (and b!724630 res!485940) b!724634))

(assert (= (and b!724634 res!485941) b!724637))

(declare-fun m!678329 () Bool)

(assert (=> b!724634 m!678329))

(declare-fun m!678331 () Bool)

(assert (=> b!724634 m!678331))

(declare-fun m!678333 () Bool)

(assert (=> b!724626 m!678333))

(declare-fun m!678335 () Bool)

(assert (=> b!724622 m!678335))

(declare-fun m!678337 () Bool)

(assert (=> b!724623 m!678337))

(declare-fun m!678339 () Bool)

(assert (=> b!724636 m!678339))

(assert (=> b!724636 m!678339))

(declare-fun m!678341 () Bool)

(assert (=> b!724636 m!678341))

(declare-fun m!678343 () Bool)

(assert (=> start!64442 m!678343))

(declare-fun m!678345 () Bool)

(assert (=> start!64442 m!678345))

(declare-fun m!678347 () Bool)

(assert (=> b!724630 m!678347))

(declare-fun m!678349 () Bool)

(assert (=> b!724630 m!678349))

(assert (=> b!724630 m!678349))

(declare-fun m!678351 () Bool)

(assert (=> b!724630 m!678351))

(declare-fun m!678353 () Bool)

(assert (=> b!724630 m!678353))

(declare-fun m!678355 () Bool)

(assert (=> b!724630 m!678355))

(declare-fun m!678357 () Bool)

(assert (=> b!724631 m!678357))

(assert (=> b!724624 m!678339))

(assert (=> b!724624 m!678339))

(declare-fun m!678359 () Bool)

(assert (=> b!724624 m!678359))

(declare-fun m!678361 () Bool)

(assert (=> b!724628 m!678361))

(declare-fun m!678363 () Bool)

(assert (=> b!724633 m!678363))

(assert (=> b!724625 m!678339))

(assert (=> b!724625 m!678339))

(declare-fun m!678365 () Bool)

(assert (=> b!724625 m!678365))

(assert (=> b!724632 m!678339))

(assert (=> b!724632 m!678339))

(declare-fun m!678367 () Bool)

(assert (=> b!724632 m!678367))

(assert (=> b!724632 m!678367))

(assert (=> b!724632 m!678339))

(declare-fun m!678369 () Bool)

(assert (=> b!724632 m!678369))

(assert (=> b!724637 m!678339))

(assert (=> b!724637 m!678339))

(declare-fun m!678371 () Bool)

(assert (=> b!724637 m!678371))

(check-sat (not b!724626) (not b!724624) (not b!724630) (not start!64442) (not b!724633) (not b!724637) (not b!724634) (not b!724632) (not b!724631) (not b!724625) (not b!724636) (not b!724622) (not b!724623))
(check-sat)
