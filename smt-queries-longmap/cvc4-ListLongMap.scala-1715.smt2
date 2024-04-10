; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31584 () Bool)

(assert start!31584)

(declare-fun b!315982 () Bool)

(assert (=> b!315982 false))

(declare-datatypes ((SeekEntryResult!2764 0))(
  ( (MissingZero!2764 (index!13232 (_ BitVec 32))) (Found!2764 (index!13233 (_ BitVec 32))) (Intermediate!2764 (undefined!3576 Bool) (index!13234 (_ BitVec 32)) (x!31474 (_ BitVec 32))) (Undefined!2764) (MissingVacant!2764 (index!13235 (_ BitVec 32))) )
))
(declare-fun lt!154422 () SeekEntryResult!2764)

(declare-datatypes ((array!16108 0))(
  ( (array!16109 (arr!7624 (Array (_ BitVec 32) (_ BitVec 64))) (size!7976 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16108)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16108 (_ BitVec 32)) SeekEntryResult!2764)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!315982 (= lt!154422 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-datatypes ((Unit!9747 0))(
  ( (Unit!9748) )
))
(declare-fun e!196595 () Unit!9747)

(declare-fun Unit!9749 () Unit!9747)

(assert (=> b!315982 (= e!196595 Unit!9749)))

(declare-fun b!315983 () Bool)

(declare-fun res!171169 () Bool)

(declare-fun e!196594 () Bool)

(assert (=> b!315983 (=> (not res!171169) (not e!196594))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!315983 (= res!171169 (and (= (select (arr!7624 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7976 a!3293))))))

(declare-fun b!315984 () Bool)

(declare-fun res!171174 () Bool)

(declare-fun e!196597 () Bool)

(assert (=> b!315984 (=> (not res!171174) (not e!196597))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16108 (_ BitVec 32)) Bool)

(assert (=> b!315984 (= res!171174 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!315985 () Bool)

(declare-fun e!196593 () Unit!9747)

(declare-fun Unit!9750 () Unit!9747)

(assert (=> b!315985 (= e!196593 Unit!9750)))

(declare-fun b!315987 () Bool)

(declare-fun res!171168 () Bool)

(assert (=> b!315987 (=> (not res!171168) (not e!196594))))

(declare-fun lt!154421 () SeekEntryResult!2764)

(assert (=> b!315987 (= res!171168 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!154421))))

(declare-fun b!315988 () Bool)

(assert (=> b!315988 (= e!196597 e!196594)))

(declare-fun res!171172 () Bool)

(assert (=> b!315988 (=> (not res!171172) (not e!196594))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!315988 (= res!171172 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!154421))))

(assert (=> b!315988 (= lt!154421 (Intermediate!2764 false resIndex!52 resX!52))))

(declare-fun b!315989 () Bool)

(declare-fun res!171170 () Bool)

(assert (=> b!315989 (=> (not res!171170) (not e!196597))))

(declare-fun arrayContainsKey!0 (array!16108 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!315989 (= res!171170 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!315990 () Bool)

(declare-fun res!171177 () Bool)

(assert (=> b!315990 (=> (not res!171177) (not e!196597))))

(assert (=> b!315990 (= res!171177 (and (= (size!7976 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7976 a!3293))))))

(declare-fun b!315991 () Bool)

(assert (=> b!315991 (= e!196594 (not (= (select (arr!7624 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!315991 (= index!1781 resIndex!52)))

(declare-fun lt!154420 () Unit!9747)

(assert (=> b!315991 (= lt!154420 e!196593)))

(declare-fun c!50025 () Bool)

(assert (=> b!315991 (= c!50025 (not (= resIndex!52 index!1781)))))

(declare-fun b!315992 () Bool)

(assert (=> b!315992 (= e!196593 e!196595)))

(declare-fun c!50024 () Bool)

(assert (=> b!315992 (= c!50024 (or (= (select (arr!7624 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7624 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!315993 () Bool)

(declare-fun res!171175 () Bool)

(assert (=> b!315993 (=> (not res!171175) (not e!196597))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!315993 (= res!171175 (validKeyInArray!0 k!2441))))

(declare-fun b!315994 () Bool)

(declare-fun res!171171 () Bool)

(assert (=> b!315994 (=> (not res!171171) (not e!196594))))

(assert (=> b!315994 (= res!171171 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7624 a!3293) index!1781) k!2441)) (= x!1427 resX!52)))))

(declare-fun b!315995 () Bool)

(assert (=> b!315995 false))

(declare-fun Unit!9751 () Unit!9747)

(assert (=> b!315995 (= e!196595 Unit!9751)))

(declare-fun b!315986 () Bool)

(declare-fun res!171176 () Bool)

(assert (=> b!315986 (=> (not res!171176) (not e!196597))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16108 (_ BitVec 32)) SeekEntryResult!2764)

(assert (=> b!315986 (= res!171176 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2764 i!1240)))))

(declare-fun res!171173 () Bool)

(assert (=> start!31584 (=> (not res!171173) (not e!196597))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31584 (= res!171173 (validMask!0 mask!3709))))

(assert (=> start!31584 e!196597))

(declare-fun array_inv!5587 (array!16108) Bool)

(assert (=> start!31584 (array_inv!5587 a!3293)))

(assert (=> start!31584 true))

(assert (= (and start!31584 res!171173) b!315990))

(assert (= (and b!315990 res!171177) b!315993))

(assert (= (and b!315993 res!171175) b!315989))

(assert (= (and b!315989 res!171170) b!315986))

(assert (= (and b!315986 res!171176) b!315984))

(assert (= (and b!315984 res!171174) b!315988))

(assert (= (and b!315988 res!171172) b!315983))

(assert (= (and b!315983 res!171169) b!315987))

(assert (= (and b!315987 res!171168) b!315994))

(assert (= (and b!315994 res!171171) b!315991))

(assert (= (and b!315991 c!50025) b!315992))

(assert (= (and b!315991 (not c!50025)) b!315985))

(assert (= (and b!315992 c!50024) b!315995))

(assert (= (and b!315992 (not c!50024)) b!315982))

(declare-fun m!325041 () Bool)

(assert (=> start!31584 m!325041))

(declare-fun m!325043 () Bool)

(assert (=> start!31584 m!325043))

(declare-fun m!325045 () Bool)

(assert (=> b!315987 m!325045))

(declare-fun m!325047 () Bool)

(assert (=> b!315992 m!325047))

(declare-fun m!325049 () Bool)

(assert (=> b!315989 m!325049))

(declare-fun m!325051 () Bool)

(assert (=> b!315986 m!325051))

(declare-fun m!325053 () Bool)

(assert (=> b!315993 m!325053))

(declare-fun m!325055 () Bool)

(assert (=> b!315984 m!325055))

(assert (=> b!315994 m!325047))

(assert (=> b!315991 m!325047))

(declare-fun m!325057 () Bool)

(assert (=> b!315983 m!325057))

(declare-fun m!325059 () Bool)

(assert (=> b!315982 m!325059))

(assert (=> b!315982 m!325059))

(declare-fun m!325061 () Bool)

(assert (=> b!315982 m!325061))

(declare-fun m!325063 () Bool)

(assert (=> b!315988 m!325063))

(assert (=> b!315988 m!325063))

(declare-fun m!325065 () Bool)

(assert (=> b!315988 m!325065))

(push 1)

(assert (not b!315984))

(assert (not b!315989))

