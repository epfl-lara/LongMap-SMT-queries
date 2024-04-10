; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87120 () Bool)

(assert start!87120)

(declare-fun b!1010245 () Bool)

(declare-fun e!568348 () Bool)

(declare-fun e!568349 () Bool)

(assert (=> b!1010245 (= e!568348 e!568349)))

(declare-fun res!678639 () Bool)

(assert (=> b!1010245 (=> (not res!678639) (not e!568349))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9569 0))(
  ( (MissingZero!9569 (index!40647 (_ BitVec 32))) (Found!9569 (index!40648 (_ BitVec 32))) (Intermediate!9569 (undefined!10381 Bool) (index!40649 (_ BitVec 32)) (x!88053 (_ BitVec 32))) (Undefined!9569) (MissingVacant!9569 (index!40650 (_ BitVec 32))) )
))
(declare-fun lt!446510 () SeekEntryResult!9569)

(declare-fun lt!446514 () (_ BitVec 64))

(declare-datatypes ((array!63638 0))(
  ( (array!63639 (arr!30637 (Array (_ BitVec 32) (_ BitVec 64))) (size!31139 (_ BitVec 32))) )
))
(declare-fun lt!446511 () array!63638)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63638 (_ BitVec 32)) SeekEntryResult!9569)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1010245 (= res!678639 (not (= lt!446510 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!446514 mask!3464) lt!446514 lt!446511 mask!3464))))))

(declare-fun a!3219 () array!63638)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun k!2224 () (_ BitVec 64))

(assert (=> b!1010245 (= lt!446514 (select (store (arr!30637 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1010245 (= lt!446511 (array!63639 (store (arr!30637 a!3219) i!1194 k!2224) (size!31139 a!3219)))))

(declare-fun b!1010246 () Bool)

(assert (=> b!1010246 (= e!568349 false)))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun lt!446512 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1010246 (= lt!446512 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1010247 () Bool)

(declare-fun res!678642 () Bool)

(declare-fun e!568351 () Bool)

(assert (=> b!1010247 (=> (not res!678642) (not e!568351))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1010247 (= res!678642 (validKeyInArray!0 k!2224))))

(declare-fun b!1010248 () Bool)

(declare-fun res!678641 () Bool)

(assert (=> b!1010248 (=> (not res!678641) (not e!568349))))

(declare-fun lt!446508 () SeekEntryResult!9569)

(assert (=> b!1010248 (= res!678641 (not (= lt!446508 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!446514 lt!446511 mask!3464))))))

(declare-fun b!1010249 () Bool)

(declare-fun res!678646 () Bool)

(declare-fun e!568350 () Bool)

(assert (=> b!1010249 (=> (not res!678646) (not e!568350))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63638 (_ BitVec 32)) Bool)

(assert (=> b!1010249 (= res!678646 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1010250 () Bool)

(declare-fun e!568346 () Bool)

(assert (=> b!1010250 (= e!568346 e!568348)))

(declare-fun res!678651 () Bool)

(assert (=> b!1010250 (=> (not res!678651) (not e!568348))))

(declare-fun lt!446509 () SeekEntryResult!9569)

(assert (=> b!1010250 (= res!678651 (= lt!446508 lt!446509))))

(assert (=> b!1010250 (= lt!446508 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30637 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1010251 () Bool)

(declare-fun res!678649 () Bool)

(assert (=> b!1010251 (=> (not res!678649) (not e!568350))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1010251 (= res!678649 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31139 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31139 a!3219))))))

(declare-fun b!1010252 () Bool)

(declare-fun res!678650 () Bool)

(assert (=> b!1010252 (=> (not res!678650) (not e!568350))))

(declare-datatypes ((List!21313 0))(
  ( (Nil!21310) (Cons!21309 (h!22501 (_ BitVec 64)) (t!30314 List!21313)) )
))
(declare-fun arrayNoDuplicates!0 (array!63638 (_ BitVec 32) List!21313) Bool)

(assert (=> b!1010252 (= res!678650 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21310))))

(declare-fun b!1010253 () Bool)

(declare-fun res!678647 () Bool)

(assert (=> b!1010253 (=> (not res!678647) (not e!568349))))

(assert (=> b!1010253 (= res!678647 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1010254 () Bool)

(assert (=> b!1010254 (= e!568351 e!568350)))

(declare-fun res!678643 () Bool)

(assert (=> b!1010254 (=> (not res!678643) (not e!568350))))

(declare-fun lt!446513 () SeekEntryResult!9569)

(assert (=> b!1010254 (= res!678643 (or (= lt!446513 (MissingVacant!9569 i!1194)) (= lt!446513 (MissingZero!9569 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63638 (_ BitVec 32)) SeekEntryResult!9569)

(assert (=> b!1010254 (= lt!446513 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1010255 () Bool)

(assert (=> b!1010255 (= e!568350 e!568346)))

(declare-fun res!678644 () Bool)

(assert (=> b!1010255 (=> (not res!678644) (not e!568346))))

(assert (=> b!1010255 (= res!678644 (= lt!446510 lt!446509))))

(assert (=> b!1010255 (= lt!446509 (Intermediate!9569 false resIndex!38 resX!38))))

(assert (=> b!1010255 (= lt!446510 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30637 a!3219) j!170) mask!3464) (select (arr!30637 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1010256 () Bool)

(declare-fun res!678640 () Bool)

(assert (=> b!1010256 (=> (not res!678640) (not e!568351))))

(assert (=> b!1010256 (= res!678640 (validKeyInArray!0 (select (arr!30637 a!3219) j!170)))))

(declare-fun b!1010257 () Bool)

(declare-fun res!678638 () Bool)

(assert (=> b!1010257 (=> (not res!678638) (not e!568351))))

(assert (=> b!1010257 (= res!678638 (and (= (size!31139 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31139 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31139 a!3219)) (not (= i!1194 j!170))))))

(declare-fun res!678648 () Bool)

(assert (=> start!87120 (=> (not res!678648) (not e!568351))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!87120 (= res!678648 (validMask!0 mask!3464))))

(assert (=> start!87120 e!568351))

(declare-fun array_inv!23761 (array!63638) Bool)

(assert (=> start!87120 (array_inv!23761 a!3219)))

(assert (=> start!87120 true))

(declare-fun b!1010258 () Bool)

(declare-fun res!678645 () Bool)

(assert (=> b!1010258 (=> (not res!678645) (not e!568351))))

(declare-fun arrayContainsKey!0 (array!63638 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1010258 (= res!678645 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(assert (= (and start!87120 res!678648) b!1010257))

(assert (= (and b!1010257 res!678638) b!1010256))

(assert (= (and b!1010256 res!678640) b!1010247))

(assert (= (and b!1010247 res!678642) b!1010258))

(assert (= (and b!1010258 res!678645) b!1010254))

(assert (= (and b!1010254 res!678643) b!1010249))

(assert (= (and b!1010249 res!678646) b!1010252))

(assert (= (and b!1010252 res!678650) b!1010251))

(assert (= (and b!1010251 res!678649) b!1010255))

(assert (= (and b!1010255 res!678644) b!1010250))

(assert (= (and b!1010250 res!678651) b!1010245))

(assert (= (and b!1010245 res!678639) b!1010248))

(assert (= (and b!1010248 res!678641) b!1010253))

(assert (= (and b!1010253 res!678647) b!1010246))

(declare-fun m!934599 () Bool)

(assert (=> b!1010248 m!934599))

(declare-fun m!934601 () Bool)

(assert (=> b!1010246 m!934601))

(declare-fun m!934603 () Bool)

(assert (=> b!1010249 m!934603))

(declare-fun m!934605 () Bool)

(assert (=> b!1010254 m!934605))

(declare-fun m!934607 () Bool)

(assert (=> b!1010245 m!934607))

(assert (=> b!1010245 m!934607))

(declare-fun m!934609 () Bool)

(assert (=> b!1010245 m!934609))

(declare-fun m!934611 () Bool)

(assert (=> b!1010245 m!934611))

(declare-fun m!934613 () Bool)

(assert (=> b!1010245 m!934613))

(declare-fun m!934615 () Bool)

(assert (=> b!1010258 m!934615))

(declare-fun m!934617 () Bool)

(assert (=> start!87120 m!934617))

(declare-fun m!934619 () Bool)

(assert (=> start!87120 m!934619))

(declare-fun m!934621 () Bool)

(assert (=> b!1010247 m!934621))

(declare-fun m!934623 () Bool)

(assert (=> b!1010255 m!934623))

(assert (=> b!1010255 m!934623))

(declare-fun m!934625 () Bool)

(assert (=> b!1010255 m!934625))

(assert (=> b!1010255 m!934625))

(assert (=> b!1010255 m!934623))

(declare-fun m!934627 () Bool)

(assert (=> b!1010255 m!934627))

(declare-fun m!934629 () Bool)

(assert (=> b!1010252 m!934629))

(assert (=> b!1010256 m!934623))

(assert (=> b!1010256 m!934623))

(declare-fun m!934631 () Bool)

(assert (=> b!1010256 m!934631))

(assert (=> b!1010250 m!934623))

(assert (=> b!1010250 m!934623))

(declare-fun m!934633 () Bool)

(assert (=> b!1010250 m!934633))

(push 1)

