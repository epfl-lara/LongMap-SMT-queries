; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65792 () Bool)

(assert start!65792)

(declare-fun b!757177 () Bool)

(declare-fun e!422157 () Bool)

(declare-fun e!422162 () Bool)

(assert (=> b!757177 (= e!422157 e!422162)))

(declare-fun res!512159 () Bool)

(assert (=> b!757177 (=> res!512159 e!422162)))

(declare-datatypes ((SeekEntryResult!7702 0))(
  ( (MissingZero!7702 (index!33176 (_ BitVec 32))) (Found!7702 (index!33177 (_ BitVec 32))) (Intermediate!7702 (undefined!8514 Bool) (index!33178 (_ BitVec 32)) (x!64079 (_ BitVec 32))) (Undefined!7702) (MissingVacant!7702 (index!33179 (_ BitVec 32))) )
))
(declare-fun lt!337073 () SeekEntryResult!7702)

(declare-fun lt!337072 () SeekEntryResult!7702)

(assert (=> b!757177 (= res!512159 (not (= lt!337073 lt!337072)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41982 0))(
  ( (array!41983 (arr!20105 (Array (_ BitVec 32) (_ BitVec 64))) (size!20526 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41982)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41982 (_ BitVec 32)) SeekEntryResult!7702)

(assert (=> b!757177 (= lt!337073 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20105 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!757178 () Bool)

(declare-fun e!422160 () Bool)

(declare-fun e!422165 () Bool)

(assert (=> b!757178 (= e!422160 e!422165)))

(declare-fun res!512152 () Bool)

(assert (=> b!757178 (=> (not res!512152) (not e!422165))))

(declare-fun lt!337064 () SeekEntryResult!7702)

(declare-fun lt!337068 () SeekEntryResult!7702)

(assert (=> b!757178 (= res!512152 (= lt!337064 lt!337068))))

(declare-fun lt!337071 () (_ BitVec 64))

(declare-fun lt!337062 () array!41982)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41982 (_ BitVec 32)) SeekEntryResult!7702)

(assert (=> b!757178 (= lt!337068 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!337071 lt!337062 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!757178 (= lt!337064 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!337071 mask!3328) lt!337071 lt!337062 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!757178 (= lt!337071 (select (store (arr!20105 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!757178 (= lt!337062 (array!41983 (store (arr!20105 a!3186) i!1173 k0!2102) (size!20526 a!3186)))))

(declare-fun b!757179 () Bool)

(declare-fun res!512157 () Bool)

(assert (=> b!757179 (=> (not res!512157) (not e!422160))))

(assert (=> b!757179 (= res!512157 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20105 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!757180 () Bool)

(declare-fun res!512166 () Bool)

(declare-fun e!422166 () Bool)

(assert (=> b!757180 (=> (not res!512166) (not e!422166))))

(assert (=> b!757180 (= res!512166 (and (= (size!20526 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20526 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20526 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!757181 () Bool)

(declare-fun res!512165 () Bool)

(declare-fun e!422161 () Bool)

(assert (=> b!757181 (=> (not res!512165) (not e!422161))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41982 (_ BitVec 32)) Bool)

(assert (=> b!757181 (= res!512165 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!757182 () Bool)

(declare-fun res!512158 () Bool)

(assert (=> b!757182 (=> (not res!512158) (not e!422166))))

(declare-fun arrayContainsKey!0 (array!41982 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!757182 (= res!512158 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!757183 () Bool)

(declare-fun res!512156 () Bool)

(declare-fun e!422156 () Bool)

(assert (=> b!757183 (=> (not res!512156) (not e!422156))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41982 (_ BitVec 32)) SeekEntryResult!7702)

(assert (=> b!757183 (= res!512156 (= (seekEntryOrOpen!0 lt!337071 lt!337062 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!337071 lt!337062 mask!3328)))))

(declare-fun e!422164 () Bool)

(declare-fun b!757184 () Bool)

(declare-fun lt!337070 () SeekEntryResult!7702)

(assert (=> b!757184 (= e!422164 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20105 a!3186) j!159) a!3186 mask!3328) lt!337070))))

(declare-fun b!757185 () Bool)

(declare-fun lt!337065 () SeekEntryResult!7702)

(assert (=> b!757185 (= e!422156 (= lt!337065 lt!337073))))

(declare-fun res!512149 () Bool)

(assert (=> start!65792 (=> (not res!512149) (not e!422166))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65792 (= res!512149 (validMask!0 mask!3328))))

(assert (=> start!65792 e!422166))

(assert (=> start!65792 true))

(declare-fun array_inv!15988 (array!41982) Bool)

(assert (=> start!65792 (array_inv!15988 a!3186)))

(declare-fun b!757186 () Bool)

(declare-datatypes ((Unit!26168 0))(
  ( (Unit!26169) )
))
(declare-fun e!422163 () Unit!26168)

(declare-fun Unit!26170 () Unit!26168)

(assert (=> b!757186 (= e!422163 Unit!26170)))

(assert (=> b!757186 false))

(declare-fun b!757187 () Bool)

(declare-fun Unit!26171 () Unit!26168)

(assert (=> b!757187 (= e!422163 Unit!26171)))

(declare-fun b!757188 () Bool)

(declare-fun e!422158 () Bool)

(assert (=> b!757188 (= e!422162 e!422158)))

(declare-fun res!512163 () Bool)

(assert (=> b!757188 (=> res!512163 e!422158)))

(declare-fun lt!337066 () (_ BitVec 64))

(assert (=> b!757188 (= res!512163 (= lt!337066 lt!337071))))

(assert (=> b!757188 (= lt!337066 (select (store (arr!20105 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!757189 () Bool)

(declare-fun res!512154 () Bool)

(assert (=> b!757189 (=> (not res!512154) (not e!422161))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!757189 (= res!512154 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20526 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20526 a!3186))))))

(declare-fun b!757190 () Bool)

(declare-fun res!512164 () Bool)

(assert (=> b!757190 (=> (not res!512164) (not e!422166))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!757190 (= res!512164 (validKeyInArray!0 (select (arr!20105 a!3186) j!159)))))

(declare-fun b!757191 () Bool)

(declare-fun res!512161 () Bool)

(assert (=> b!757191 (=> (not res!512161) (not e!422160))))

(assert (=> b!757191 (= res!512161 e!422164)))

(declare-fun c!82896 () Bool)

(assert (=> b!757191 (= c!82896 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!757192 () Bool)

(assert (=> b!757192 (= e!422161 e!422160)))

(declare-fun res!512151 () Bool)

(assert (=> b!757192 (=> (not res!512151) (not e!422160))))

(assert (=> b!757192 (= res!512151 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20105 a!3186) j!159) mask!3328) (select (arr!20105 a!3186) j!159) a!3186 mask!3328) lt!337070))))

(assert (=> b!757192 (= lt!337070 (Intermediate!7702 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!757193 () Bool)

(assert (=> b!757193 (= e!422166 e!422161)))

(declare-fun res!512153 () Bool)

(assert (=> b!757193 (=> (not res!512153) (not e!422161))))

(declare-fun lt!337063 () SeekEntryResult!7702)

(assert (=> b!757193 (= res!512153 (or (= lt!337063 (MissingZero!7702 i!1173)) (= lt!337063 (MissingVacant!7702 i!1173))))))

(assert (=> b!757193 (= lt!337063 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!757194 () Bool)

(declare-fun res!512155 () Bool)

(assert (=> b!757194 (=> (not res!512155) (not e!422161))))

(declare-datatypes ((List!14146 0))(
  ( (Nil!14143) (Cons!14142 (h!15214 (_ BitVec 64)) (t!20452 List!14146)) )
))
(declare-fun arrayNoDuplicates!0 (array!41982 (_ BitVec 32) List!14146) Bool)

(assert (=> b!757194 (= res!512155 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14143))))

(declare-fun b!757195 () Bool)

(declare-fun res!512160 () Bool)

(assert (=> b!757195 (=> (not res!512160) (not e!422166))))

(assert (=> b!757195 (= res!512160 (validKeyInArray!0 k0!2102))))

(declare-fun b!757196 () Bool)

(assert (=> b!757196 (= e!422164 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20105 a!3186) j!159) a!3186 mask!3328) (Found!7702 j!159)))))

(declare-fun b!757197 () Bool)

(assert (=> b!757197 (= e!422165 (not e!422157))))

(declare-fun res!512150 () Bool)

(assert (=> b!757197 (=> res!512150 e!422157)))

(get-info :version)

(assert (=> b!757197 (= res!512150 (or (not ((_ is Intermediate!7702) lt!337068)) (bvslt x!1131 (x!64079 lt!337068)) (not (= x!1131 (x!64079 lt!337068))) (not (= index!1321 (index!33178 lt!337068)))))))

(declare-fun e!422159 () Bool)

(assert (=> b!757197 e!422159))

(declare-fun res!512162 () Bool)

(assert (=> b!757197 (=> (not res!512162) (not e!422159))))

(assert (=> b!757197 (= res!512162 (= lt!337065 lt!337072))))

(assert (=> b!757197 (= lt!337072 (Found!7702 j!159))))

(assert (=> b!757197 (= lt!337065 (seekEntryOrOpen!0 (select (arr!20105 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!757197 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!337069 () Unit!26168)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41982 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26168)

(assert (=> b!757197 (= lt!337069 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!757198 () Bool)

(assert (=> b!757198 (= e!422158 true)))

(assert (=> b!757198 e!422156))

(declare-fun res!512148 () Bool)

(assert (=> b!757198 (=> (not res!512148) (not e!422156))))

(assert (=> b!757198 (= res!512148 (= lt!337066 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!337067 () Unit!26168)

(assert (=> b!757198 (= lt!337067 e!422163)))

(declare-fun c!82895 () Bool)

(assert (=> b!757198 (= c!82895 (= lt!337066 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!757199 () Bool)

(assert (=> b!757199 (= e!422159 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20105 a!3186) j!159) a!3186 mask!3328) lt!337072))))

(assert (= (and start!65792 res!512149) b!757180))

(assert (= (and b!757180 res!512166) b!757190))

(assert (= (and b!757190 res!512164) b!757195))

(assert (= (and b!757195 res!512160) b!757182))

(assert (= (and b!757182 res!512158) b!757193))

(assert (= (and b!757193 res!512153) b!757181))

(assert (= (and b!757181 res!512165) b!757194))

(assert (= (and b!757194 res!512155) b!757189))

(assert (= (and b!757189 res!512154) b!757192))

(assert (= (and b!757192 res!512151) b!757179))

(assert (= (and b!757179 res!512157) b!757191))

(assert (= (and b!757191 c!82896) b!757184))

(assert (= (and b!757191 (not c!82896)) b!757196))

(assert (= (and b!757191 res!512161) b!757178))

(assert (= (and b!757178 res!512152) b!757197))

(assert (= (and b!757197 res!512162) b!757199))

(assert (= (and b!757197 (not res!512150)) b!757177))

(assert (= (and b!757177 (not res!512159)) b!757188))

(assert (= (and b!757188 (not res!512163)) b!757198))

(assert (= (and b!757198 c!82895) b!757186))

(assert (= (and b!757198 (not c!82895)) b!757187))

(assert (= (and b!757198 res!512148) b!757183))

(assert (= (and b!757183 res!512156) b!757185))

(declare-fun m!704381 () Bool)

(assert (=> b!757182 m!704381))

(declare-fun m!704383 () Bool)

(assert (=> b!757196 m!704383))

(assert (=> b!757196 m!704383))

(declare-fun m!704385 () Bool)

(assert (=> b!757196 m!704385))

(declare-fun m!704387 () Bool)

(assert (=> b!757195 m!704387))

(declare-fun m!704389 () Bool)

(assert (=> b!757193 m!704389))

(declare-fun m!704391 () Bool)

(assert (=> b!757179 m!704391))

(declare-fun m!704393 () Bool)

(assert (=> b!757178 m!704393))

(declare-fun m!704395 () Bool)

(assert (=> b!757178 m!704395))

(assert (=> b!757178 m!704393))

(declare-fun m!704397 () Bool)

(assert (=> b!757178 m!704397))

(declare-fun m!704399 () Bool)

(assert (=> b!757178 m!704399))

(declare-fun m!704401 () Bool)

(assert (=> b!757178 m!704401))

(assert (=> b!757184 m!704383))

(assert (=> b!757184 m!704383))

(declare-fun m!704403 () Bool)

(assert (=> b!757184 m!704403))

(declare-fun m!704405 () Bool)

(assert (=> b!757194 m!704405))

(assert (=> b!757177 m!704383))

(assert (=> b!757177 m!704383))

(assert (=> b!757177 m!704385))

(assert (=> b!757188 m!704399))

(declare-fun m!704407 () Bool)

(assert (=> b!757188 m!704407))

(declare-fun m!704409 () Bool)

(assert (=> start!65792 m!704409))

(declare-fun m!704411 () Bool)

(assert (=> start!65792 m!704411))

(assert (=> b!757192 m!704383))

(assert (=> b!757192 m!704383))

(declare-fun m!704413 () Bool)

(assert (=> b!757192 m!704413))

(assert (=> b!757192 m!704413))

(assert (=> b!757192 m!704383))

(declare-fun m!704415 () Bool)

(assert (=> b!757192 m!704415))

(assert (=> b!757197 m!704383))

(assert (=> b!757197 m!704383))

(declare-fun m!704417 () Bool)

(assert (=> b!757197 m!704417))

(declare-fun m!704419 () Bool)

(assert (=> b!757197 m!704419))

(declare-fun m!704421 () Bool)

(assert (=> b!757197 m!704421))

(declare-fun m!704423 () Bool)

(assert (=> b!757183 m!704423))

(declare-fun m!704425 () Bool)

(assert (=> b!757183 m!704425))

(declare-fun m!704427 () Bool)

(assert (=> b!757181 m!704427))

(assert (=> b!757190 m!704383))

(assert (=> b!757190 m!704383))

(declare-fun m!704429 () Bool)

(assert (=> b!757190 m!704429))

(assert (=> b!757199 m!704383))

(assert (=> b!757199 m!704383))

(declare-fun m!704431 () Bool)

(assert (=> b!757199 m!704431))

(check-sat (not b!757190) (not b!757199) (not b!757196) (not b!757193) (not b!757183) (not b!757195) (not b!757181) (not b!757182) (not b!757184) (not start!65792) (not b!757177) (not b!757197) (not b!757192) (not b!757178) (not b!757194))
(check-sat)
