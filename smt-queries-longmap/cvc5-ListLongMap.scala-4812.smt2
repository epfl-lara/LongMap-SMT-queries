; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66212 () Bool)

(assert start!66212)

(declare-fun b!762453 () Bool)

(declare-fun res!515565 () Bool)

(declare-fun e!425001 () Bool)

(assert (=> b!762453 (=> (not res!515565) (not e!425001))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!762453 (= res!515565 (validKeyInArray!0 k!2102))))

(declare-fun b!762454 () Bool)

(declare-fun res!515571 () Bool)

(assert (=> b!762454 (=> (not res!515571) (not e!425001))))

(declare-datatypes ((array!42117 0))(
  ( (array!42118 (arr!20166 (Array (_ BitVec 32) (_ BitVec 64))) (size!20587 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42117)

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!762454 (= res!515571 (validKeyInArray!0 (select (arr!20166 a!3186) j!159)))))

(declare-fun b!762455 () Bool)

(declare-fun e!424999 () Bool)

(assert (=> b!762455 (= e!424999 false)))

(declare-datatypes ((SeekEntryResult!7766 0))(
  ( (MissingZero!7766 (index!33432 (_ BitVec 32))) (Found!7766 (index!33433 (_ BitVec 32))) (Intermediate!7766 (undefined!8578 Bool) (index!33434 (_ BitVec 32)) (x!64346 (_ BitVec 32))) (Undefined!7766) (MissingVacant!7766 (index!33435 (_ BitVec 32))) )
))
(declare-fun lt!339575 () SeekEntryResult!7766)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42117 (_ BitVec 32)) SeekEntryResult!7766)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!762455 (= lt!339575 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20166 a!3186) j!159) mask!3328) (select (arr!20166 a!3186) j!159) a!3186 mask!3328))))

(declare-fun res!515568 () Bool)

(assert (=> start!66212 (=> (not res!515568) (not e!425001))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66212 (= res!515568 (validMask!0 mask!3328))))

(assert (=> start!66212 e!425001))

(assert (=> start!66212 true))

(declare-fun array_inv!15962 (array!42117) Bool)

(assert (=> start!66212 (array_inv!15962 a!3186)))

(declare-fun b!762456 () Bool)

(declare-fun res!515569 () Bool)

(assert (=> b!762456 (=> (not res!515569) (not e!425001))))

(declare-fun arrayContainsKey!0 (array!42117 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!762456 (= res!515569 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!762457 () Bool)

(declare-fun res!515566 () Bool)

(assert (=> b!762457 (=> (not res!515566) (not e!424999))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42117 (_ BitVec 32)) Bool)

(assert (=> b!762457 (= res!515566 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!762458 () Bool)

(assert (=> b!762458 (= e!425001 e!424999)))

(declare-fun res!515564 () Bool)

(assert (=> b!762458 (=> (not res!515564) (not e!424999))))

(declare-fun lt!339574 () SeekEntryResult!7766)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!762458 (= res!515564 (or (= lt!339574 (MissingZero!7766 i!1173)) (= lt!339574 (MissingVacant!7766 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42117 (_ BitVec 32)) SeekEntryResult!7766)

(assert (=> b!762458 (= lt!339574 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!762459 () Bool)

(declare-fun res!515567 () Bool)

(assert (=> b!762459 (=> (not res!515567) (not e!424999))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!762459 (= res!515567 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20587 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20587 a!3186))))))

(declare-fun b!762460 () Bool)

(declare-fun res!515572 () Bool)

(assert (=> b!762460 (=> (not res!515572) (not e!424999))))

(declare-datatypes ((List!14168 0))(
  ( (Nil!14165) (Cons!14164 (h!15248 (_ BitVec 64)) (t!20483 List!14168)) )
))
(declare-fun arrayNoDuplicates!0 (array!42117 (_ BitVec 32) List!14168) Bool)

(assert (=> b!762460 (= res!515572 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14165))))

(declare-fun b!762461 () Bool)

(declare-fun res!515570 () Bool)

(assert (=> b!762461 (=> (not res!515570) (not e!425001))))

(assert (=> b!762461 (= res!515570 (and (= (size!20587 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20587 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20587 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!66212 res!515568) b!762461))

(assert (= (and b!762461 res!515570) b!762454))

(assert (= (and b!762454 res!515571) b!762453))

(assert (= (and b!762453 res!515565) b!762456))

(assert (= (and b!762456 res!515569) b!762458))

(assert (= (and b!762458 res!515564) b!762457))

(assert (= (and b!762457 res!515566) b!762460))

(assert (= (and b!762460 res!515572) b!762459))

(assert (= (and b!762459 res!515567) b!762455))

(declare-fun m!709197 () Bool)

(assert (=> b!762457 m!709197))

(declare-fun m!709199 () Bool)

(assert (=> b!762458 m!709199))

(declare-fun m!709201 () Bool)

(assert (=> b!762454 m!709201))

(assert (=> b!762454 m!709201))

(declare-fun m!709203 () Bool)

(assert (=> b!762454 m!709203))

(declare-fun m!709205 () Bool)

(assert (=> b!762453 m!709205))

(declare-fun m!709207 () Bool)

(assert (=> start!66212 m!709207))

(declare-fun m!709209 () Bool)

(assert (=> start!66212 m!709209))

(declare-fun m!709211 () Bool)

(assert (=> b!762460 m!709211))

(assert (=> b!762455 m!709201))

(assert (=> b!762455 m!709201))

(declare-fun m!709213 () Bool)

(assert (=> b!762455 m!709213))

(assert (=> b!762455 m!709213))

(assert (=> b!762455 m!709201))

(declare-fun m!709215 () Bool)

(assert (=> b!762455 m!709215))

(declare-fun m!709217 () Bool)

(assert (=> b!762456 m!709217))

(push 1)

