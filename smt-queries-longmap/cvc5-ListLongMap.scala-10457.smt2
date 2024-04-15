; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122904 () Bool)

(assert start!122904)

(declare-fun b!1425529 () Bool)

(declare-fun res!961020 () Bool)

(declare-fun e!805358 () Bool)

(assert (=> b!1425529 (=> (not res!961020) (not e!805358))))

(declare-datatypes ((array!97222 0))(
  ( (array!97223 (arr!46929 (Array (_ BitVec 32) (_ BitVec 64))) (size!47481 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97222)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97222 (_ BitVec 32)) Bool)

(assert (=> b!1425529 (= res!961020 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1425530 () Bool)

(declare-fun res!961013 () Bool)

(assert (=> b!1425530 (=> (not res!961013) (not e!805358))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(assert (=> b!1425530 (= res!961013 (and (= (size!47481 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47481 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47481 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1425531 () Bool)

(declare-fun res!961019 () Bool)

(assert (=> b!1425531 (=> (not res!961019) (not e!805358))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11235 0))(
  ( (MissingZero!11235 (index!47332 (_ BitVec 32))) (Found!11235 (index!47333 (_ BitVec 32))) (Intermediate!11235 (undefined!12047 Bool) (index!47334 (_ BitVec 32)) (x!128954 (_ BitVec 32))) (Undefined!11235) (MissingVacant!11235 (index!47335 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97222 (_ BitVec 32)) SeekEntryResult!11235)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1425531 (= res!961019 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46929 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (select (store (arr!46929 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (array!97223 (store (arr!46929 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47481 a!2831)) mask!2608) (Intermediate!11235 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(declare-fun res!961018 () Bool)

(assert (=> start!122904 (=> (not res!961018) (not e!805358))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122904 (= res!961018 (validMask!0 mask!2608))))

(assert (=> start!122904 e!805358))

(assert (=> start!122904 true))

(declare-fun array_inv!36162 (array!97222) Bool)

(assert (=> start!122904 (array_inv!36162 a!2831)))

(declare-fun b!1425532 () Bool)

(declare-fun res!961021 () Bool)

(assert (=> b!1425532 (=> (not res!961021) (not e!805358))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1425532 (= res!961021 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47481 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47481 a!2831))))))

(declare-fun b!1425533 () Bool)

(assert (=> b!1425533 (= e!805358 false)))

(declare-fun lt!627644 () SeekEntryResult!11235)

(assert (=> b!1425533 (= lt!627644 (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46929 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1425534 () Bool)

(declare-fun res!961017 () Bool)

(assert (=> b!1425534 (=> (not res!961017) (not e!805358))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1425534 (= res!961017 (validKeyInArray!0 (select (arr!46929 a!2831) i!982)))))

(declare-fun b!1425535 () Bool)

(declare-fun res!961015 () Bool)

(assert (=> b!1425535 (=> (not res!961015) (not e!805358))))

(declare-datatypes ((List!33517 0))(
  ( (Nil!33514) (Cons!33513 (h!34815 (_ BitVec 64)) (t!48203 List!33517)) )
))
(declare-fun arrayNoDuplicates!0 (array!97222 (_ BitVec 32) List!33517) Bool)

(assert (=> b!1425535 (= res!961015 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33514))))

(declare-fun b!1425536 () Bool)

(declare-fun res!961014 () Bool)

(assert (=> b!1425536 (=> (not res!961014) (not e!805358))))

(assert (=> b!1425536 (= res!961014 (validKeyInArray!0 (select (arr!46929 a!2831) j!81)))))

(declare-fun b!1425537 () Bool)

(declare-fun res!961016 () Bool)

(assert (=> b!1425537 (=> (not res!961016) (not e!805358))))

(assert (=> b!1425537 (= res!961016 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46929 a!2831) j!81) mask!2608) (select (arr!46929 a!2831) j!81) a!2831 mask!2608) (Intermediate!11235 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(assert (= (and start!122904 res!961018) b!1425530))

(assert (= (and b!1425530 res!961013) b!1425534))

(assert (= (and b!1425534 res!961017) b!1425536))

(assert (= (and b!1425536 res!961014) b!1425529))

(assert (= (and b!1425529 res!961020) b!1425535))

(assert (= (and b!1425535 res!961015) b!1425532))

(assert (= (and b!1425532 res!961021) b!1425537))

(assert (= (and b!1425537 res!961016) b!1425531))

(assert (= (and b!1425531 res!961019) b!1425533))

(declare-fun m!1315653 () Bool)

(assert (=> b!1425529 m!1315653))

(declare-fun m!1315655 () Bool)

(assert (=> b!1425536 m!1315655))

(assert (=> b!1425536 m!1315655))

(declare-fun m!1315657 () Bool)

(assert (=> b!1425536 m!1315657))

(declare-fun m!1315659 () Bool)

(assert (=> start!122904 m!1315659))

(declare-fun m!1315661 () Bool)

(assert (=> start!122904 m!1315661))

(assert (=> b!1425533 m!1315655))

(assert (=> b!1425533 m!1315655))

(declare-fun m!1315663 () Bool)

(assert (=> b!1425533 m!1315663))

(assert (=> b!1425537 m!1315655))

(assert (=> b!1425537 m!1315655))

(declare-fun m!1315665 () Bool)

(assert (=> b!1425537 m!1315665))

(assert (=> b!1425537 m!1315665))

(assert (=> b!1425537 m!1315655))

(declare-fun m!1315667 () Bool)

(assert (=> b!1425537 m!1315667))

(declare-fun m!1315669 () Bool)

(assert (=> b!1425534 m!1315669))

(assert (=> b!1425534 m!1315669))

(declare-fun m!1315671 () Bool)

(assert (=> b!1425534 m!1315671))

(declare-fun m!1315673 () Bool)

(assert (=> b!1425535 m!1315673))

(declare-fun m!1315675 () Bool)

(assert (=> b!1425531 m!1315675))

(declare-fun m!1315677 () Bool)

(assert (=> b!1425531 m!1315677))

(assert (=> b!1425531 m!1315677))

(declare-fun m!1315679 () Bool)

(assert (=> b!1425531 m!1315679))

(assert (=> b!1425531 m!1315679))

(assert (=> b!1425531 m!1315677))

(declare-fun m!1315681 () Bool)

(assert (=> b!1425531 m!1315681))

(push 1)

(assert (not b!1425536))

(assert (not b!1425533))

(assert (not b!1425537))

(assert (not b!1425535))

(assert (not b!1425531))

(assert (not b!1425534))

(assert (not b!1425529))

(assert (not start!122904))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

