; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36426 () Bool)

(assert start!36426)

(declare-fun res!203452 () Bool)

(declare-fun e!223026 () Bool)

(assert (=> start!36426 (=> (not res!203452) (not e!223026))))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20706 0))(
  ( (array!20707 (arr!9832 (Array (_ BitVec 32) (_ BitVec 64))) (size!10184 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20706)

(assert (=> start!36426 (= res!203452 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10184 a!4289))))))

(assert (=> start!36426 e!223026))

(assert (=> start!36426 true))

(declare-fun array_inv!7274 (array!20706) Bool)

(assert (=> start!36426 (array_inv!7274 a!4289)))

(declare-fun b!364290 () Bool)

(declare-fun res!203451 () Bool)

(assert (=> b!364290 (=> (not res!203451) (not e!223026))))

(declare-fun from!3650 () (_ BitVec 32))

(assert (=> b!364290 (= res!203451 (and (bvslt (size!10184 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10184 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!364288 () Bool)

(declare-fun res!203449 () Bool)

(assert (=> b!364288 (=> (not res!203449) (not e!223026))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364288 (= res!203449 (not (validKeyInArray!0 (select (arr!9832 a!4289) i!1472))))))

(declare-fun b!364289 () Bool)

(declare-fun res!203450 () Bool)

(assert (=> b!364289 (=> (not res!203450) (not e!223026))))

(declare-fun k!2974 () (_ BitVec 64))

(assert (=> b!364289 (= res!203450 (validKeyInArray!0 k!2974))))

(declare-fun b!364291 () Bool)

(assert (=> b!364291 (= e!223026 false)))

(declare-fun lt!168450 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20706 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364291 (= lt!168450 (arrayCountValidKeys!0 (array!20707 (store (arr!9832 a!4289) i!1472 k!2974) (size!10184 a!4289)) from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!168451 () (_ BitVec 32))

(assert (=> b!364291 (= lt!168451 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (= (and start!36426 res!203452) b!364288))

(assert (= (and b!364288 res!203449) b!364289))

(assert (= (and b!364289 res!203450) b!364290))

(assert (= (and b!364290 res!203451) b!364291))

(declare-fun m!361787 () Bool)

(assert (=> start!36426 m!361787))

(declare-fun m!361789 () Bool)

(assert (=> b!364288 m!361789))

(assert (=> b!364288 m!361789))

(declare-fun m!361791 () Bool)

(assert (=> b!364288 m!361791))

(declare-fun m!361793 () Bool)

(assert (=> b!364289 m!361793))

(declare-fun m!361795 () Bool)

(assert (=> b!364291 m!361795))

(declare-fun m!361797 () Bool)

(assert (=> b!364291 m!361797))

(declare-fun m!361799 () Bool)

(assert (=> b!364291 m!361799))

(push 1)

(assert (not b!364288))

(assert (not start!36426))

(assert (not b!364291))

(assert (not b!364289))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

