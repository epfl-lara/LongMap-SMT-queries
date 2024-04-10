; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130556 () Bool)

(assert start!130556)

(declare-fun b!1532317 () Bool)

(declare-fun res!1049455 () Bool)

(declare-fun e!853767 () Bool)

(assert (=> b!1532317 (=> (not res!1049455) (not e!853767))))

(declare-datatypes ((array!101735 0))(
  ( (array!101736 (arr!49088 (Array (_ BitVec 32) (_ BitVec 64))) (size!49638 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101735)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1532317 (= res!1049455 (validKeyInArray!0 (select (arr!49088 a!2792) j!64)))))

(declare-fun res!1049456 () Bool)

(assert (=> start!130556 (=> (not res!1049456) (not e!853767))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130556 (= res!1049456 (validMask!0 mask!2480))))

(assert (=> start!130556 e!853767))

(assert (=> start!130556 true))

(declare-fun array_inv!38116 (array!101735) Bool)

(assert (=> start!130556 (array_inv!38116 a!2792)))

(declare-fun b!1532316 () Bool)

(declare-fun res!1049457 () Bool)

(assert (=> b!1532316 (=> (not res!1049457) (not e!853767))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1532316 (= res!1049457 (validKeyInArray!0 (select (arr!49088 a!2792) i!951)))))

(declare-fun b!1532318 () Bool)

(assert (=> b!1532318 (= e!853767 (bvsgt #b00000000000000000000000000000000 (size!49638 a!2792)))))

(declare-fun b!1532315 () Bool)

(declare-fun res!1049458 () Bool)

(assert (=> b!1532315 (=> (not res!1049458) (not e!853767))))

(assert (=> b!1532315 (= res!1049458 (and (= (size!49638 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49638 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49638 a!2792)) (not (= i!951 j!64))))))

(assert (= (and start!130556 res!1049456) b!1532315))

(assert (= (and b!1532315 res!1049458) b!1532316))

(assert (= (and b!1532316 res!1049457) b!1532317))

(assert (= (and b!1532317 res!1049455) b!1532318))

(declare-fun m!1415049 () Bool)

(assert (=> b!1532317 m!1415049))

(assert (=> b!1532317 m!1415049))

(declare-fun m!1415051 () Bool)

(assert (=> b!1532317 m!1415051))

(declare-fun m!1415053 () Bool)

(assert (=> start!130556 m!1415053))

(declare-fun m!1415055 () Bool)

(assert (=> start!130556 m!1415055))

(declare-fun m!1415057 () Bool)

(assert (=> b!1532316 m!1415057))

(assert (=> b!1532316 m!1415057))

(declare-fun m!1415059 () Bool)

(assert (=> b!1532316 m!1415059))

(push 1)

(assert (not b!1532316))

(assert (not b!1532317))

