; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67270 () Bool)

(assert start!67270)

(declare-fun b!776755 () Bool)

(declare-fun res!525223 () Bool)

(declare-fun e!432319 () Bool)

(assert (=> b!776755 (=> (not res!525223) (not e!432319))))

(declare-fun e!432324 () Bool)

(assert (=> b!776755 (= res!525223 e!432324)))

(declare-fun c!86171 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!776755 (= c!86171 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!776756 () Bool)

(declare-fun e!432318 () Bool)

(declare-fun e!432321 () Bool)

(assert (=> b!776756 (= e!432318 e!432321)))

(declare-fun res!525234 () Bool)

(assert (=> b!776756 (=> (not res!525234) (not e!432321))))

(declare-datatypes ((array!42505 0))(
  ( (array!42506 (arr!20344 (Array (_ BitVec 32) (_ BitVec 64))) (size!20764 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42505)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7900 0))(
  ( (MissingZero!7900 (index!33968 (_ BitVec 32))) (Found!7900 (index!33969 (_ BitVec 32))) (Intermediate!7900 (undefined!8712 Bool) (index!33970 (_ BitVec 32)) (x!65070 (_ BitVec 32))) (Undefined!7900) (MissingVacant!7900 (index!33971 (_ BitVec 32))) )
))
(declare-fun lt!346030 () SeekEntryResult!7900)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42505 (_ BitVec 32)) SeekEntryResult!7900)

(assert (=> b!776756 (= res!525234 (= (seekEntryOrOpen!0 (select (arr!20344 a!3186) j!159) a!3186 mask!3328) lt!346030))))

(assert (=> b!776756 (= lt!346030 (Found!7900 j!159))))

(declare-fun b!776757 () Bool)

(declare-fun res!525230 () Bool)

(declare-fun e!432325 () Bool)

(assert (=> b!776757 (=> (not res!525230) (not e!432325))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!776757 (= res!525230 (validKeyInArray!0 (select (arr!20344 a!3186) j!159)))))

(declare-fun res!525221 () Bool)

(assert (=> start!67270 (=> (not res!525221) (not e!432325))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67270 (= res!525221 (validMask!0 mask!3328))))

(assert (=> start!67270 e!432325))

(assert (=> start!67270 true))

(declare-fun array_inv!16203 (array!42505) Bool)

(assert (=> start!67270 (array_inv!16203 a!3186)))

(declare-fun b!776758 () Bool)

(declare-fun res!525224 () Bool)

(declare-fun e!432317 () Bool)

(assert (=> b!776758 (=> (not res!525224) (not e!432317))))

(declare-datatypes ((List!14253 0))(
  ( (Nil!14250) (Cons!14249 (h!15363 (_ BitVec 64)) (t!20560 List!14253)) )
))
(declare-fun arrayNoDuplicates!0 (array!42505 (_ BitVec 32) List!14253) Bool)

(assert (=> b!776758 (= res!525224 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14250))))

(declare-fun b!776759 () Bool)

(assert (=> b!776759 (= e!432317 e!432319)))

(declare-fun res!525219 () Bool)

(assert (=> b!776759 (=> (not res!525219) (not e!432319))))

(declare-fun lt!346032 () SeekEntryResult!7900)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42505 (_ BitVec 32)) SeekEntryResult!7900)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!776759 (= res!525219 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20344 a!3186) j!159) mask!3328) (select (arr!20344 a!3186) j!159) a!3186 mask!3328) lt!346032))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!776759 (= lt!346032 (Intermediate!7900 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!776760 () Bool)

(declare-fun res!525228 () Bool)

(assert (=> b!776760 (=> (not res!525228) (not e!432325))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!776760 (= res!525228 (and (= (size!20764 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20764 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20764 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!776761 () Bool)

(declare-fun res!525232 () Bool)

(assert (=> b!776761 (=> (not res!525232) (not e!432319))))

(assert (=> b!776761 (= res!525232 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20344 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!776762 () Bool)

(declare-fun res!525227 () Bool)

(assert (=> b!776762 (=> (not res!525227) (not e!432317))))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!776762 (= res!525227 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20764 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20764 a!3186))))))

(declare-fun b!776763 () Bool)

(declare-fun res!525225 () Bool)

(assert (=> b!776763 (=> (not res!525225) (not e!432325))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42505 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!776763 (= res!525225 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!776764 () Bool)

(declare-fun res!525222 () Bool)

(assert (=> b!776764 (=> (not res!525222) (not e!432325))))

(assert (=> b!776764 (= res!525222 (validKeyInArray!0 k0!2102))))

(declare-fun b!776765 () Bool)

(declare-fun e!432322 () Bool)

(assert (=> b!776765 (= e!432322 true)))

(declare-fun lt!346035 () SeekEntryResult!7900)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42505 (_ BitVec 32)) SeekEntryResult!7900)

(assert (=> b!776765 (= lt!346035 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20344 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!776766 () Bool)

(declare-fun e!432323 () Bool)

(assert (=> b!776766 (= e!432319 e!432323)))

(declare-fun res!525226 () Bool)

(assert (=> b!776766 (=> (not res!525226) (not e!432323))))

(declare-fun lt!346031 () SeekEntryResult!7900)

(declare-fun lt!346034 () SeekEntryResult!7900)

(assert (=> b!776766 (= res!525226 (= lt!346031 lt!346034))))

(declare-fun lt!346033 () array!42505)

(declare-fun lt!346028 () (_ BitVec 64))

(assert (=> b!776766 (= lt!346034 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!346028 lt!346033 mask!3328))))

(assert (=> b!776766 (= lt!346031 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!346028 mask!3328) lt!346028 lt!346033 mask!3328))))

(assert (=> b!776766 (= lt!346028 (select (store (arr!20344 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!776766 (= lt!346033 (array!42506 (store (arr!20344 a!3186) i!1173 k0!2102) (size!20764 a!3186)))))

(declare-fun b!776767 () Bool)

(assert (=> b!776767 (= e!432321 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20344 a!3186) j!159) a!3186 mask!3328) lt!346030))))

(declare-fun b!776768 () Bool)

(declare-fun res!525220 () Bool)

(assert (=> b!776768 (=> (not res!525220) (not e!432317))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42505 (_ BitVec 32)) Bool)

(assert (=> b!776768 (= res!525220 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!776769 () Bool)

(assert (=> b!776769 (= e!432324 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20344 a!3186) j!159) a!3186 mask!3328) lt!346032))))

(declare-fun b!776770 () Bool)

(assert (=> b!776770 (= e!432323 (not e!432322))))

(declare-fun res!525233 () Bool)

(assert (=> b!776770 (=> res!525233 e!432322)))

(get-info :version)

(assert (=> b!776770 (= res!525233 (or (not ((_ is Intermediate!7900) lt!346034)) (bvslt x!1131 (x!65070 lt!346034)) (not (= x!1131 (x!65070 lt!346034))) (not (= index!1321 (index!33970 lt!346034)))))))

(assert (=> b!776770 e!432318))

(declare-fun res!525231 () Bool)

(assert (=> b!776770 (=> (not res!525231) (not e!432318))))

(assert (=> b!776770 (= res!525231 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26773 0))(
  ( (Unit!26774) )
))
(declare-fun lt!346036 () Unit!26773)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42505 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26773)

(assert (=> b!776770 (= lt!346036 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!776771 () Bool)

(assert (=> b!776771 (= e!432325 e!432317)))

(declare-fun res!525229 () Bool)

(assert (=> b!776771 (=> (not res!525229) (not e!432317))))

(declare-fun lt!346029 () SeekEntryResult!7900)

(assert (=> b!776771 (= res!525229 (or (= lt!346029 (MissingZero!7900 i!1173)) (= lt!346029 (MissingVacant!7900 i!1173))))))

(assert (=> b!776771 (= lt!346029 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!776772 () Bool)

(assert (=> b!776772 (= e!432324 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20344 a!3186) j!159) a!3186 mask!3328) (Found!7900 j!159)))))

(assert (= (and start!67270 res!525221) b!776760))

(assert (= (and b!776760 res!525228) b!776757))

(assert (= (and b!776757 res!525230) b!776764))

(assert (= (and b!776764 res!525222) b!776763))

(assert (= (and b!776763 res!525225) b!776771))

(assert (= (and b!776771 res!525229) b!776768))

(assert (= (and b!776768 res!525220) b!776758))

(assert (= (and b!776758 res!525224) b!776762))

(assert (= (and b!776762 res!525227) b!776759))

(assert (= (and b!776759 res!525219) b!776761))

(assert (= (and b!776761 res!525232) b!776755))

(assert (= (and b!776755 c!86171) b!776769))

(assert (= (and b!776755 (not c!86171)) b!776772))

(assert (= (and b!776755 res!525223) b!776766))

(assert (= (and b!776766 res!525226) b!776770))

(assert (= (and b!776770 res!525231) b!776756))

(assert (= (and b!776756 res!525234) b!776767))

(assert (= (and b!776770 (not res!525233)) b!776765))

(declare-fun m!721301 () Bool)

(assert (=> start!67270 m!721301))

(declare-fun m!721303 () Bool)

(assert (=> start!67270 m!721303))

(declare-fun m!721305 () Bool)

(assert (=> b!776767 m!721305))

(assert (=> b!776767 m!721305))

(declare-fun m!721307 () Bool)

(assert (=> b!776767 m!721307))

(assert (=> b!776772 m!721305))

(assert (=> b!776772 m!721305))

(declare-fun m!721309 () Bool)

(assert (=> b!776772 m!721309))

(declare-fun m!721311 () Bool)

(assert (=> b!776766 m!721311))

(declare-fun m!721313 () Bool)

(assert (=> b!776766 m!721313))

(declare-fun m!721315 () Bool)

(assert (=> b!776766 m!721315))

(assert (=> b!776766 m!721311))

(declare-fun m!721317 () Bool)

(assert (=> b!776766 m!721317))

(declare-fun m!721319 () Bool)

(assert (=> b!776766 m!721319))

(assert (=> b!776759 m!721305))

(assert (=> b!776759 m!721305))

(declare-fun m!721321 () Bool)

(assert (=> b!776759 m!721321))

(assert (=> b!776759 m!721321))

(assert (=> b!776759 m!721305))

(declare-fun m!721323 () Bool)

(assert (=> b!776759 m!721323))

(assert (=> b!776757 m!721305))

(assert (=> b!776757 m!721305))

(declare-fun m!721325 () Bool)

(assert (=> b!776757 m!721325))

(assert (=> b!776769 m!721305))

(assert (=> b!776769 m!721305))

(declare-fun m!721327 () Bool)

(assert (=> b!776769 m!721327))

(assert (=> b!776765 m!721305))

(assert (=> b!776765 m!721305))

(assert (=> b!776765 m!721309))

(declare-fun m!721329 () Bool)

(assert (=> b!776758 m!721329))

(declare-fun m!721331 () Bool)

(assert (=> b!776771 m!721331))

(declare-fun m!721333 () Bool)

(assert (=> b!776763 m!721333))

(declare-fun m!721335 () Bool)

(assert (=> b!776764 m!721335))

(assert (=> b!776756 m!721305))

(assert (=> b!776756 m!721305))

(declare-fun m!721337 () Bool)

(assert (=> b!776756 m!721337))

(declare-fun m!721339 () Bool)

(assert (=> b!776761 m!721339))

(declare-fun m!721341 () Bool)

(assert (=> b!776768 m!721341))

(declare-fun m!721343 () Bool)

(assert (=> b!776770 m!721343))

(declare-fun m!721345 () Bool)

(assert (=> b!776770 m!721345))

(check-sat (not b!776757) (not start!67270) (not b!776759) (not b!776767) (not b!776763) (not b!776764) (not b!776772) (not b!776766) (not b!776765) (not b!776771) (not b!776769) (not b!776756) (not b!776768) (not b!776770) (not b!776758))
(check-sat)
