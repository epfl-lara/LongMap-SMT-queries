; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69416 () Bool)

(assert start!69416)

(declare-fun b!809444 () Bool)

(declare-fun res!553173 () Bool)

(declare-fun e!448049 () Bool)

(assert (=> b!809444 (=> (not res!553173) (not e!448049))))

(declare-datatypes ((array!44014 0))(
  ( (array!44015 (arr!21081 (Array (_ BitVec 32) (_ BitVec 64))) (size!21502 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!44014)

(declare-datatypes ((List!15044 0))(
  ( (Nil!15041) (Cons!15040 (h!16169 (_ BitVec 64)) (t!21359 List!15044)) )
))
(declare-fun arrayNoDuplicates!0 (array!44014 (_ BitVec 32) List!15044) Bool)

(assert (=> b!809444 (= res!553173 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15041))))

(declare-fun res!553178 () Bool)

(declare-fun e!448050 () Bool)

(assert (=> start!69416 (=> (not res!553178) (not e!448050))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69416 (= res!553178 (validMask!0 mask!3266))))

(assert (=> start!69416 e!448050))

(assert (=> start!69416 true))

(declare-fun array_inv!16877 (array!44014) Bool)

(assert (=> start!69416 (array_inv!16877 a!3170)))

(declare-fun b!809445 () Bool)

(declare-fun res!553175 () Bool)

(assert (=> b!809445 (=> (not res!553175) (not e!448050))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!809445 (= res!553175 (validKeyInArray!0 k!2044))))

(declare-fun b!809446 () Bool)

(declare-fun res!553181 () Bool)

(assert (=> b!809446 (=> (not res!553181) (not e!448050))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!809446 (= res!553181 (validKeyInArray!0 (select (arr!21081 a!3170) j!153)))))

(declare-fun b!809447 () Bool)

(declare-fun res!553176 () Bool)

(assert (=> b!809447 (=> (not res!553176) (not e!448050))))

(declare-fun arrayContainsKey!0 (array!44014 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!809447 (= res!553176 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!809448 () Bool)

(declare-fun e!448048 () Bool)

(assert (=> b!809448 (= e!448049 e!448048)))

(declare-fun res!553171 () Bool)

(assert (=> b!809448 (=> (not res!553171) (not e!448048))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!362753 () (_ BitVec 64))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun lt!362752 () array!44014)

(declare-datatypes ((SeekEntryResult!8672 0))(
  ( (MissingZero!8672 (index!37056 (_ BitVec 32))) (Found!8672 (index!37057 (_ BitVec 32))) (Intermediate!8672 (undefined!9484 Bool) (index!37058 (_ BitVec 32)) (x!67864 (_ BitVec 32))) (Undefined!8672) (MissingVacant!8672 (index!37059 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44014 (_ BitVec 32)) SeekEntryResult!8672)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44014 (_ BitVec 32)) SeekEntryResult!8672)

(assert (=> b!809448 (= res!553171 (= (seekEntryOrOpen!0 lt!362753 lt!362752 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!362753 lt!362752 mask!3266)))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!809448 (= lt!362753 (select (store (arr!21081 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!809448 (= lt!362752 (array!44015 (store (arr!21081 a!3170) i!1163 k!2044) (size!21502 a!3170)))))

(declare-fun b!809449 () Bool)

(declare-fun e!448052 () Bool)

(assert (=> b!809449 (= e!448052 false)))

(declare-fun lt!362751 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!809449 (= lt!362751 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!809450 () Bool)

(declare-fun res!553180 () Bool)

(assert (=> b!809450 (=> (not res!553180) (not e!448050))))

(assert (=> b!809450 (= res!553180 (and (= (size!21502 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21502 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21502 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!809451 () Bool)

(declare-fun res!553177 () Bool)

(assert (=> b!809451 (=> (not res!553177) (not e!448049))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!809451 (= res!553177 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21502 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21081 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21502 a!3170)) (= (select (arr!21081 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!809452 () Bool)

(assert (=> b!809452 (= e!448048 e!448052)))

(declare-fun res!553179 () Bool)

(assert (=> b!809452 (=> (not res!553179) (not e!448052))))

(declare-fun lt!362750 () SeekEntryResult!8672)

(declare-fun lt!362748 () SeekEntryResult!8672)

(assert (=> b!809452 (= res!553179 (and (= lt!362750 lt!362748) (= lt!362748 (Found!8672 j!153)) (not (= (select (arr!21081 a!3170) index!1236) (select (arr!21081 a!3170) j!153)))))))

(assert (=> b!809452 (= lt!362748 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21081 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!809452 (= lt!362750 (seekEntryOrOpen!0 (select (arr!21081 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!809453 () Bool)

(assert (=> b!809453 (= e!448050 e!448049)))

(declare-fun res!553172 () Bool)

(assert (=> b!809453 (=> (not res!553172) (not e!448049))))

(declare-fun lt!362749 () SeekEntryResult!8672)

(assert (=> b!809453 (= res!553172 (or (= lt!362749 (MissingZero!8672 i!1163)) (= lt!362749 (MissingVacant!8672 i!1163))))))

(assert (=> b!809453 (= lt!362749 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!809454 () Bool)

(declare-fun res!553174 () Bool)

(assert (=> b!809454 (=> (not res!553174) (not e!448049))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44014 (_ BitVec 32)) Bool)

(assert (=> b!809454 (= res!553174 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!69416 res!553178) b!809450))

(assert (= (and b!809450 res!553180) b!809446))

(assert (= (and b!809446 res!553181) b!809445))

(assert (= (and b!809445 res!553175) b!809447))

(assert (= (and b!809447 res!553176) b!809453))

(assert (= (and b!809453 res!553172) b!809454))

(assert (= (and b!809454 res!553174) b!809444))

(assert (= (and b!809444 res!553173) b!809451))

(assert (= (and b!809451 res!553177) b!809448))

(assert (= (and b!809448 res!553171) b!809452))

(assert (= (and b!809452 res!553179) b!809449))

(declare-fun m!751637 () Bool)

(assert (=> b!809449 m!751637))

(declare-fun m!751639 () Bool)

(assert (=> b!809451 m!751639))

(declare-fun m!751641 () Bool)

(assert (=> b!809451 m!751641))

(declare-fun m!751643 () Bool)

(assert (=> start!69416 m!751643))

(declare-fun m!751645 () Bool)

(assert (=> start!69416 m!751645))

(declare-fun m!751647 () Bool)

(assert (=> b!809446 m!751647))

(assert (=> b!809446 m!751647))

(declare-fun m!751649 () Bool)

(assert (=> b!809446 m!751649))

(declare-fun m!751651 () Bool)

(assert (=> b!809447 m!751651))

(declare-fun m!751653 () Bool)

(assert (=> b!809452 m!751653))

(assert (=> b!809452 m!751647))

(assert (=> b!809452 m!751647))

(declare-fun m!751655 () Bool)

(assert (=> b!809452 m!751655))

(assert (=> b!809452 m!751647))

(declare-fun m!751657 () Bool)

(assert (=> b!809452 m!751657))

(declare-fun m!751659 () Bool)

(assert (=> b!809444 m!751659))

(declare-fun m!751661 () Bool)

(assert (=> b!809448 m!751661))

(declare-fun m!751663 () Bool)

(assert (=> b!809448 m!751663))

(declare-fun m!751665 () Bool)

(assert (=> b!809448 m!751665))

(declare-fun m!751667 () Bool)

(assert (=> b!809448 m!751667))

(declare-fun m!751669 () Bool)

(assert (=> b!809445 m!751669))

(declare-fun m!751671 () Bool)

(assert (=> b!809453 m!751671))

(declare-fun m!751673 () Bool)

(assert (=> b!809454 m!751673))

(push 1)

