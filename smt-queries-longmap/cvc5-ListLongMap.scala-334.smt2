; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6124 () Bool)

(assert start!6124)

(declare-fun res!25110 () Bool)

(declare-fun e!26683 () Bool)

(assert (=> start!6124 (=> (not res!25110) (not e!26683))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6124 (= res!25110 (validMask!0 mask!853))))

(assert (=> start!6124 e!26683))

(assert (=> start!6124 true))

(declare-fun b!42184 () Bool)

(assert (=> b!42184 (= e!26683 (bvsge (bvadd #b00000000000000000000000000000001 mask!853) #b01111111111111111111111111111111))))

(assert (= (and start!6124 res!25110) b!42184))

(declare-fun m!35767 () Bool)

(assert (=> start!6124 m!35767))

(push 1)

(assert (not start!6124))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!7603 () Bool)

