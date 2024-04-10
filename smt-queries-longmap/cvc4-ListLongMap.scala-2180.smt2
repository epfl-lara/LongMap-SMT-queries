; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36418 () Bool)

(assert start!36418)

(declare-fun b!364233 () Bool)

(declare-fun res!203395 () Bool)

(declare-fun e!223003 () Bool)

(assert (=> b!364233 (=> (not res!203395) (not e!223003))))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20698 0))(
  ( (array!20699 (arr!9828 (Array (_ BitVec 32) (_ BitVec 64))) (size!10180 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20698)

(assert (=> b!364233 (= res!203395 (and (bvslt (size!10180 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10180 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!364232 () Bool)

(declare-fun res!203393 () Bool)

(assert (=> b!364232 (=> (not res!203393) (not e!223003))))

(declare-fun k!2974 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364232 (= res!203393 (validKeyInArray!0 k!2974))))

(declare-fun b!364231 () Bool)

(declare-fun res!203392 () Bool)

(assert (=> b!364231 (=> (not res!203392) (not e!223003))))

(assert (=> b!364231 (= res!203392 (not (validKeyInArray!0 (select (arr!9828 a!4289) i!1472))))))

(declare-fun res!203394 () Bool)

(assert (=> start!36418 (=> (not res!203394) (not e!223003))))

(assert (=> start!36418 (= res!203394 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10180 a!4289))))))

(assert (=> start!36418 e!223003))

(assert (=> start!36418 true))

(declare-fun array_inv!7270 (array!20698) Bool)

(assert (=> start!36418 (array_inv!7270 a!4289)))

(declare-fun b!364234 () Bool)

(assert (=> b!364234 (= e!223003 false)))

(declare-fun lt!168444 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20698 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364234 (= lt!168444 (arrayCountValidKeys!0 (array!20699 (store (arr!9828 a!4289) i!1472 k!2974) (size!10180 a!4289)) from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!168445 () (_ BitVec 32))

(assert (=> b!364234 (= lt!168445 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (= (and start!36418 res!203394) b!364231))

(assert (= (and b!364231 res!203392) b!364232))

(assert (= (and b!364232 res!203393) b!364233))

(assert (= (and b!364233 res!203395) b!364234))

(declare-fun m!361731 () Bool)

(assert (=> b!364232 m!361731))

(declare-fun m!361733 () Bool)

(assert (=> b!364231 m!361733))

(assert (=> b!364231 m!361733))

(declare-fun m!361735 () Bool)

(assert (=> b!364231 m!361735))

(declare-fun m!361737 () Bool)

(assert (=> start!36418 m!361737))

(declare-fun m!361739 () Bool)

(assert (=> b!364234 m!361739))

(declare-fun m!361741 () Bool)

(assert (=> b!364234 m!361741))

(declare-fun m!361743 () Bool)

(assert (=> b!364234 m!361743))

(push 1)

(assert (not b!364231))

(assert (not start!36418))

(assert (not b!364234))

(assert (not b!364232))

(check-sat)

