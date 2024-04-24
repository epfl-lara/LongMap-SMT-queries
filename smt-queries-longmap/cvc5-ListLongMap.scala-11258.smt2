; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131718 () Bool)

(assert start!131718)

(declare-fun b!1542174 () Bool)

(declare-fun res!1057399 () Bool)

(declare-fun e!857914 () Bool)

(assert (=> b!1542174 (=> (not res!1057399) (not e!857914))))

(declare-datatypes ((array!102412 0))(
  ( (array!102413 (arr!49410 (Array (_ BitVec 32) (_ BitVec 64))) (size!49961 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102412)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1542174 (= res!1057399 (validKeyInArray!0 (select (arr!49410 a!2792) j!64)))))

(declare-fun b!1542175 () Bool)

(declare-fun res!1057400 () Bool)

(assert (=> b!1542175 (=> (not res!1057400) (not e!857914))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102412 (_ BitVec 32)) Bool)

(assert (=> b!1542175 (= res!1057400 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1542176 () Bool)

(declare-fun res!1057404 () Bool)

(assert (=> b!1542176 (=> (not res!1057404) (not e!857914))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1542176 (= res!1057404 (validKeyInArray!0 (select (arr!49410 a!2792) i!951)))))

(declare-fun res!1057403 () Bool)

(assert (=> start!131718 (=> (not res!1057403) (not e!857914))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131718 (= res!1057403 (validMask!0 mask!2480))))

(assert (=> start!131718 e!857914))

(assert (=> start!131718 true))

(declare-fun array_inv!38691 (array!102412) Bool)

(assert (=> start!131718 (array_inv!38691 a!2792)))

(declare-fun b!1542177 () Bool)

(declare-fun res!1057402 () Bool)

(assert (=> b!1542177 (=> (not res!1057402) (not e!857914))))

(assert (=> b!1542177 (= res!1057402 (and (= (size!49961 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49961 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49961 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1542178 () Bool)

(assert (=> b!1542178 (= e!857914 false)))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun lt!666030 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1542178 (= lt!666030 (nextIndex!0 index!463 (bvadd #b00000000000000000000000000000001 x!510) mask!2480))))

(declare-fun b!1542179 () Bool)

(declare-fun res!1057398 () Bool)

(assert (=> b!1542179 (=> (not res!1057398) (not e!857914))))

(declare-datatypes ((List!35871 0))(
  ( (Nil!35868) (Cons!35867 (h!37330 (_ BitVec 64)) (t!50557 List!35871)) )
))
(declare-fun arrayNoDuplicates!0 (array!102412 (_ BitVec 32) List!35871) Bool)

(assert (=> b!1542179 (= res!1057398 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35868))))

(declare-fun b!1542180 () Bool)

(declare-fun res!1057401 () Bool)

(assert (=> b!1542180 (=> (not res!1057401) (not e!857914))))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13431 0))(
  ( (MissingZero!13431 (index!56119 (_ BitVec 32))) (Found!13431 (index!56120 (_ BitVec 32))) (Intermediate!13431 (undefined!14243 Bool) (index!56121 (_ BitVec 32)) (x!138057 (_ BitVec 32))) (Undefined!13431) (MissingVacant!13431 (index!56122 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102412 (_ BitVec 32)) SeekEntryResult!13431)

(assert (=> b!1542180 (= res!1057401 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49410 a!2792) j!64) a!2792 mask!2480) (Found!13431 j!64)))))

(declare-fun b!1542181 () Bool)

(declare-fun res!1057396 () Bool)

(assert (=> b!1542181 (=> (not res!1057396) (not e!857914))))

(assert (=> b!1542181 (= res!1057396 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49961 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49961 a!2792)) (= (select (arr!49410 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1542182 () Bool)

(declare-fun res!1057397 () Bool)

(assert (=> b!1542182 (=> (not res!1057397) (not e!857914))))

(assert (=> b!1542182 (= res!1057397 (not (= (select (arr!49410 a!2792) index!463) (select (arr!49410 a!2792) j!64))))))

(assert (= (and start!131718 res!1057403) b!1542177))

(assert (= (and b!1542177 res!1057402) b!1542176))

(assert (= (and b!1542176 res!1057404) b!1542174))

(assert (= (and b!1542174 res!1057399) b!1542175))

(assert (= (and b!1542175 res!1057400) b!1542179))

(assert (= (and b!1542179 res!1057398) b!1542181))

(assert (= (and b!1542181 res!1057396) b!1542180))

(assert (= (and b!1542180 res!1057401) b!1542182))

(assert (= (and b!1542182 res!1057397) b!1542178))

(declare-fun m!1424177 () Bool)

(assert (=> b!1542175 m!1424177))

(declare-fun m!1424179 () Bool)

(assert (=> b!1542179 m!1424179))

(declare-fun m!1424181 () Bool)

(assert (=> b!1542180 m!1424181))

(assert (=> b!1542180 m!1424181))

(declare-fun m!1424183 () Bool)

(assert (=> b!1542180 m!1424183))

(declare-fun m!1424185 () Bool)

(assert (=> b!1542176 m!1424185))

(assert (=> b!1542176 m!1424185))

(declare-fun m!1424187 () Bool)

(assert (=> b!1542176 m!1424187))

(declare-fun m!1424189 () Bool)

(assert (=> b!1542181 m!1424189))

(declare-fun m!1424191 () Bool)

(assert (=> start!131718 m!1424191))

(declare-fun m!1424193 () Bool)

(assert (=> start!131718 m!1424193))

(declare-fun m!1424195 () Bool)

(assert (=> b!1542178 m!1424195))

(assert (=> b!1542174 m!1424181))

(assert (=> b!1542174 m!1424181))

(declare-fun m!1424197 () Bool)

(assert (=> b!1542174 m!1424197))

(declare-fun m!1424199 () Bool)

(assert (=> b!1542182 m!1424199))

(assert (=> b!1542182 m!1424181))

(push 1)

(assert (not b!1542180))

(assert (not b!1542179))

(assert (not b!1542178))

(assert (not start!131718))

(assert (not b!1542174))

(assert (not b!1542176))

(assert (not b!1542175))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

