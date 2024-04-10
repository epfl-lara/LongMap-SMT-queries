; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66210 () Bool)

(assert start!66210)

(declare-fun b!762426 () Bool)

(declare-fun res!515538 () Bool)

(declare-fun e!424990 () Bool)

(assert (=> b!762426 (=> (not res!515538) (not e!424990))))

(declare-datatypes ((array!42115 0))(
  ( (array!42116 (arr!20165 (Array (_ BitVec 32) (_ BitVec 64))) (size!20586 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42115)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!762426 (= res!515538 (and (= (size!20586 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20586 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20586 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!762427 () Bool)

(declare-fun res!515545 () Bool)

(declare-fun e!424991 () Bool)

(assert (=> b!762427 (=> (not res!515545) (not e!424991))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42115 (_ BitVec 32)) Bool)

(assert (=> b!762427 (= res!515545 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!762428 () Bool)

(declare-fun res!515542 () Bool)

(assert (=> b!762428 (=> (not res!515542) (not e!424991))))

(declare-datatypes ((List!14167 0))(
  ( (Nil!14164) (Cons!14163 (h!15247 (_ BitVec 64)) (t!20482 List!14167)) )
))
(declare-fun arrayNoDuplicates!0 (array!42115 (_ BitVec 32) List!14167) Bool)

(assert (=> b!762428 (= res!515542 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14164))))

(declare-fun b!762429 () Bool)

(declare-fun res!515539 () Bool)

(assert (=> b!762429 (=> (not res!515539) (not e!424990))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!762429 (= res!515539 (validKeyInArray!0 (select (arr!20165 a!3186) j!159)))))

(declare-fun b!762430 () Bool)

(assert (=> b!762430 (= e!424990 e!424991)))

(declare-fun res!515544 () Bool)

(assert (=> b!762430 (=> (not res!515544) (not e!424991))))

(declare-datatypes ((SeekEntryResult!7765 0))(
  ( (MissingZero!7765 (index!33428 (_ BitVec 32))) (Found!7765 (index!33429 (_ BitVec 32))) (Intermediate!7765 (undefined!8577 Bool) (index!33430 (_ BitVec 32)) (x!64337 (_ BitVec 32))) (Undefined!7765) (MissingVacant!7765 (index!33431 (_ BitVec 32))) )
))
(declare-fun lt!339569 () SeekEntryResult!7765)

(assert (=> b!762430 (= res!515544 (or (= lt!339569 (MissingZero!7765 i!1173)) (= lt!339569 (MissingVacant!7765 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42115 (_ BitVec 32)) SeekEntryResult!7765)

(assert (=> b!762430 (= lt!339569 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!762431 () Bool)

(declare-fun res!515537 () Bool)

(assert (=> b!762431 (=> (not res!515537) (not e!424990))))

(assert (=> b!762431 (= res!515537 (validKeyInArray!0 k!2102))))

(declare-fun b!762432 () Bool)

(assert (=> b!762432 (= e!424991 false)))

(declare-fun lt!339568 () SeekEntryResult!7765)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42115 (_ BitVec 32)) SeekEntryResult!7765)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!762432 (= lt!339568 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20165 a!3186) j!159) mask!3328) (select (arr!20165 a!3186) j!159) a!3186 mask!3328))))

(declare-fun res!515543 () Bool)

(assert (=> start!66210 (=> (not res!515543) (not e!424990))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66210 (= res!515543 (validMask!0 mask!3328))))

(assert (=> start!66210 e!424990))

(assert (=> start!66210 true))

(declare-fun array_inv!15961 (array!42115) Bool)

(assert (=> start!66210 (array_inv!15961 a!3186)))

(declare-fun b!762433 () Bool)

(declare-fun res!515540 () Bool)

(assert (=> b!762433 (=> (not res!515540) (not e!424990))))

(declare-fun arrayContainsKey!0 (array!42115 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!762433 (= res!515540 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!762434 () Bool)

(declare-fun res!515541 () Bool)

(assert (=> b!762434 (=> (not res!515541) (not e!424991))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!762434 (= res!515541 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20586 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20586 a!3186))))))

(assert (= (and start!66210 res!515543) b!762426))

(assert (= (and b!762426 res!515538) b!762429))

(assert (= (and b!762429 res!515539) b!762431))

(assert (= (and b!762431 res!515537) b!762433))

(assert (= (and b!762433 res!515540) b!762430))

(assert (= (and b!762430 res!515544) b!762427))

(assert (= (and b!762427 res!515545) b!762428))

(assert (= (and b!762428 res!515542) b!762434))

(assert (= (and b!762434 res!515541) b!762432))

(declare-fun m!709175 () Bool)

(assert (=> b!762429 m!709175))

(assert (=> b!762429 m!709175))

(declare-fun m!709177 () Bool)

(assert (=> b!762429 m!709177))

(declare-fun m!709179 () Bool)

(assert (=> b!762427 m!709179))

(declare-fun m!709181 () Bool)

(assert (=> b!762430 m!709181))

(assert (=> b!762432 m!709175))

(assert (=> b!762432 m!709175))

(declare-fun m!709183 () Bool)

(assert (=> b!762432 m!709183))

(assert (=> b!762432 m!709183))

(assert (=> b!762432 m!709175))

(declare-fun m!709185 () Bool)

(assert (=> b!762432 m!709185))

(declare-fun m!709187 () Bool)

(assert (=> b!762431 m!709187))

(declare-fun m!709189 () Bool)

(assert (=> start!66210 m!709189))

(declare-fun m!709191 () Bool)

(assert (=> start!66210 m!709191))

(declare-fun m!709193 () Bool)

(assert (=> b!762433 m!709193))

(declare-fun m!709195 () Bool)

(assert (=> b!762428 m!709195))

(push 1)

