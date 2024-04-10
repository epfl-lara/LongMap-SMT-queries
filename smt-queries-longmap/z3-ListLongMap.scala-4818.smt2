; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66250 () Bool)

(assert start!66250)

(declare-fun b!763180 () Bool)

(declare-fun e!425274 () Bool)

(declare-fun e!425273 () Bool)

(assert (=> b!763180 (= e!425274 e!425273)))

(declare-fun res!516199 () Bool)

(assert (=> b!763180 (=> (not res!516199) (not e!425273))))

(declare-datatypes ((SeekEntryResult!7785 0))(
  ( (MissingZero!7785 (index!33508 (_ BitVec 32))) (Found!7785 (index!33509 (_ BitVec 32))) (Intermediate!7785 (undefined!8597 Bool) (index!33510 (_ BitVec 32)) (x!64413 (_ BitVec 32))) (Undefined!7785) (MissingVacant!7785 (index!33511 (_ BitVec 32))) )
))
(declare-fun lt!339740 () SeekEntryResult!7785)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!42155 0))(
  ( (array!42156 (arr!20185 (Array (_ BitVec 32) (_ BitVec 64))) (size!20606 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42155)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42155 (_ BitVec 32)) SeekEntryResult!7785)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!763180 (= res!516199 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20185 a!3186) j!159) mask!3328) (select (arr!20185 a!3186) j!159) a!3186 mask!3328) lt!339740))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!763180 (= lt!339740 (Intermediate!7785 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!763181 () Bool)

(declare-fun res!516196 () Bool)

(declare-fun e!425272 () Bool)

(assert (=> b!763181 (=> (not res!516196) (not e!425272))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!763181 (= res!516196 (validKeyInArray!0 (select (arr!20185 a!3186) j!159)))))

(declare-fun b!763182 () Bool)

(declare-fun res!516191 () Bool)

(assert (=> b!763182 (=> (not res!516191) (not e!425274))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!763182 (= res!516191 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20606 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20606 a!3186))))))

(declare-fun b!763183 () Bool)

(declare-fun res!516194 () Bool)

(assert (=> b!763183 (=> (not res!516194) (not e!425274))))

(declare-datatypes ((List!14187 0))(
  ( (Nil!14184) (Cons!14183 (h!15267 (_ BitVec 64)) (t!20502 List!14187)) )
))
(declare-fun arrayNoDuplicates!0 (array!42155 (_ BitVec 32) List!14187) Bool)

(assert (=> b!763183 (= res!516194 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14184))))

(declare-fun b!763184 () Bool)

(declare-fun res!516198 () Bool)

(assert (=> b!763184 (=> (not res!516198) (not e!425272))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!763184 (= res!516198 (validKeyInArray!0 k0!2102))))

(declare-fun b!763185 () Bool)

(declare-fun res!516197 () Bool)

(assert (=> b!763185 (=> (not res!516197) (not e!425272))))

(declare-fun arrayContainsKey!0 (array!42155 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!763185 (= res!516197 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!763186 () Bool)

(declare-fun res!516201 () Bool)

(assert (=> b!763186 (=> (not res!516201) (not e!425273))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!763186 (= res!516201 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20185 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!763187 () Bool)

(assert (=> b!763187 (= e!425273 false)))

(declare-fun lt!339739 () (_ BitVec 32))

(assert (=> b!763187 (= lt!339739 (toIndex!0 (select (store (arr!20185 a!3186) i!1173 k0!2102) j!159) mask!3328))))

(declare-fun res!516195 () Bool)

(assert (=> start!66250 (=> (not res!516195) (not e!425272))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66250 (= res!516195 (validMask!0 mask!3328))))

(assert (=> start!66250 e!425272))

(assert (=> start!66250 true))

(declare-fun array_inv!15981 (array!42155) Bool)

(assert (=> start!66250 (array_inv!15981 a!3186)))

(declare-fun b!763188 () Bool)

(assert (=> b!763188 (= e!425272 e!425274)))

(declare-fun res!516200 () Bool)

(assert (=> b!763188 (=> (not res!516200) (not e!425274))))

(declare-fun lt!339738 () SeekEntryResult!7785)

(assert (=> b!763188 (= res!516200 (or (= lt!339738 (MissingZero!7785 i!1173)) (= lt!339738 (MissingVacant!7785 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42155 (_ BitVec 32)) SeekEntryResult!7785)

(assert (=> b!763188 (= lt!339738 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun e!425270 () Bool)

(declare-fun b!763189 () Bool)

(assert (=> b!763189 (= e!425270 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20185 a!3186) j!159) a!3186 mask!3328) lt!339740))))

(declare-fun b!763190 () Bool)

(declare-fun res!516202 () Bool)

(assert (=> b!763190 (=> (not res!516202) (not e!425273))))

(assert (=> b!763190 (= res!516202 e!425270)))

(declare-fun c!83881 () Bool)

(assert (=> b!763190 (= c!83881 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!763191 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42155 (_ BitVec 32)) SeekEntryResult!7785)

(assert (=> b!763191 (= e!425270 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20185 a!3186) j!159) a!3186 mask!3328) (Found!7785 j!159)))))

(declare-fun b!763192 () Bool)

(declare-fun res!516192 () Bool)

(assert (=> b!763192 (=> (not res!516192) (not e!425274))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42155 (_ BitVec 32)) Bool)

(assert (=> b!763192 (= res!516192 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!763193 () Bool)

(declare-fun res!516193 () Bool)

(assert (=> b!763193 (=> (not res!516193) (not e!425272))))

(assert (=> b!763193 (= res!516193 (and (= (size!20606 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20606 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20606 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!66250 res!516195) b!763193))

(assert (= (and b!763193 res!516193) b!763181))

(assert (= (and b!763181 res!516196) b!763184))

(assert (= (and b!763184 res!516198) b!763185))

(assert (= (and b!763185 res!516197) b!763188))

(assert (= (and b!763188 res!516200) b!763192))

(assert (= (and b!763192 res!516192) b!763183))

(assert (= (and b!763183 res!516194) b!763182))

(assert (= (and b!763182 res!516191) b!763180))

(assert (= (and b!763180 res!516199) b!763186))

(assert (= (and b!763186 res!516201) b!763190))

(assert (= (and b!763190 c!83881) b!763189))

(assert (= (and b!763190 (not c!83881)) b!763191))

(assert (= (and b!763190 res!516202) b!763187))

(declare-fun m!709735 () Bool)

(assert (=> b!763180 m!709735))

(assert (=> b!763180 m!709735))

(declare-fun m!709737 () Bool)

(assert (=> b!763180 m!709737))

(assert (=> b!763180 m!709737))

(assert (=> b!763180 m!709735))

(declare-fun m!709739 () Bool)

(assert (=> b!763180 m!709739))

(assert (=> b!763191 m!709735))

(assert (=> b!763191 m!709735))

(declare-fun m!709741 () Bool)

(assert (=> b!763191 m!709741))

(declare-fun m!709743 () Bool)

(assert (=> start!66250 m!709743))

(declare-fun m!709745 () Bool)

(assert (=> start!66250 m!709745))

(declare-fun m!709747 () Bool)

(assert (=> b!763187 m!709747))

(declare-fun m!709749 () Bool)

(assert (=> b!763187 m!709749))

(assert (=> b!763187 m!709749))

(declare-fun m!709751 () Bool)

(assert (=> b!763187 m!709751))

(assert (=> b!763181 m!709735))

(assert (=> b!763181 m!709735))

(declare-fun m!709753 () Bool)

(assert (=> b!763181 m!709753))

(declare-fun m!709755 () Bool)

(assert (=> b!763185 m!709755))

(declare-fun m!709757 () Bool)

(assert (=> b!763188 m!709757))

(assert (=> b!763189 m!709735))

(assert (=> b!763189 m!709735))

(declare-fun m!709759 () Bool)

(assert (=> b!763189 m!709759))

(declare-fun m!709761 () Bool)

(assert (=> b!763192 m!709761))

(declare-fun m!709763 () Bool)

(assert (=> b!763183 m!709763))

(declare-fun m!709765 () Bool)

(assert (=> b!763184 m!709765))

(declare-fun m!709767 () Bool)

(assert (=> b!763186 m!709767))

(check-sat (not b!763191) (not start!66250) (not b!763185) (not b!763181) (not b!763183) (not b!763189) (not b!763188) (not b!763187) (not b!763184) (not b!763180) (not b!763192))
(check-sat)
